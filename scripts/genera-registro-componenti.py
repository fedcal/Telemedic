#!/usr/bin/env python3
"""Genera il registro dei componenti di terze parti dalla distinta dei materiali.

PERCHE' ESISTE. Il criterio 6 di T-03 chiede due cose, e fino al 27 agosto 2026 ne esisteva una
sola. La seconda - «un componente presente nella distinta e assente dalle annotazioni fa fallire la
costruzione» - e' scripts/verifica-registro-componenti.sh, scritto, provato e bloccante. La prima -
«il registro dei componenti di terze parti e' GENERATO dalla distinta e arricchito da un file di
annotazioni versionato» - non esisteva: c'erano le annotazioni e c'era il confronto, non c'era il
registro come artefatto.

La differenza non e' terminologica. Le annotazioni dicono che cosa il progetto pensa di ciascun
componente; la distinta dice che cosa e' effettivamente entrato nell'artefatto. Il registro e' la
loro giunzione, ed e' l'unico dei tre che risponda alla domanda che chi installa pone davvero:
«che cosa sto installando, con quale licenza, e chi ce l'ha messo».

CHE COSA PRODUCE, e perche' due file invece di uno.

  componenti-di-terze-parti.tsv   il registro completo, leggibile da macchina, una riga per
                                  componente. E' l'artefatto che accompagna la distribuzione e su
                                  cui si fanno le domande automatiche.
  componenti-di-terze-parti.md    la resa leggibile da una persona. NON e' l'elenco completo:
                                  milleduecento righe di tabella non si leggono. Porta gli
                                  aggregati, le dipendenze dirette per intero, e per intero ogni
                                  componente la cui compatibilita' non e' accertata - che e' la
                                  parte per cui il registro esiste.

CHE COSA NON FA, e va detto. Non legge il testo delle licenze e non esprime pareri: la colonna di
compatibilita' viene dalle annotazioni, che a loro volta la derivano dall'identificativo SPDX
dichiarato. Il registro riporta, non giudica. Un componente annotato «indeterminabile» resta
indeterminabile nel registro, in evidenza, invece di sparire in una riga fra mille.

Uso:  python3 scripts/genera-registro-componenti.py <distinta.json> <cartella-di-uscita>

Codici di uscita:  0 registro generato · 2 errore d'uso (ingressi mancanti o illeggibili)
"""
import json
import os
import sys
from pathlib import Path

# Sovrascrivibile per il collaudo (voce D-17 del runbook: un controllo che forza la propria radice
# non e' collaudabile senza toccare i file veri del repository).
ANNOTAZIONI = os.environ.get("ANNOTAZIONI_COMPONENTI") or "pipeline/annotazioni-componenti.tsv"
COLONNE = ["componente", "versione", "licenza_dichiarata", "compatibilita_apache_2_0",
           "relazione", "tirato_da", "motivo_inclusione", "canale_di_avviso", "impronta"]


def esci(messaggio: str, codice: int = 2) -> None:
    print(f"\033[31m✗ {messaggio}\033[0m", file=sys.stderr)
    sys.exit(codice)


def leggi_annotazioni(percorso: Path) -> dict:
    """Le annotazioni, indicizzate per «nome@versione». Le righe di commento si ignorano."""
    if not percorso.is_file():
        esci(f"annotazioni assenti: {percorso}")
    annotazioni, intestazione = {}, None
    for numero, riga in enumerate(percorso.read_text(encoding="utf-8").splitlines(), 1):
        if not riga.strip() or riga.startswith("#"):
            continue
        campi = riga.split("\t")
        if intestazione is None:
            intestazione = campi
            continue
        if len(campi) != len(intestazione):
            esci(f"{percorso}: riga {numero} ha {len(campi)} campi invece di {len(intestazione)}")
        voce = dict(zip(intestazione, campi))
        annotazioni[f"{voce['componente']}@{voce['versione']}"] = voce
    if intestazione is None:
        esci(f"{percorso}: nessuna riga di intestazione")
    return annotazioni


def nome_da_purl(purl: str) -> str:
    """«pkg:npm/%40docusaurus/core@3.10.2» -> «@docusaurus/core». Il nome semplice della distinta
    non basta: due pacchetti con ambiti diversi condividono lo stesso «name»."""
    if not purl.startswith("pkg:npm/"):
        return ""
    resto = purl[len("pkg:npm/"):]
    resto = resto.split("?")[0].split("#")[0]
    if "@" in resto[1:]:
        resto = resto[:resto.rindex("@")]
    return resto.replace("%40", "@")


def main() -> None:
    if len(sys.argv) != 3:
        esci("uso: genera-registro-componenti.py <distinta.json> <cartella-di-uscita>")
    distinta_percorso, uscita = Path(sys.argv[1]), Path(sys.argv[2])
    if not distinta_percorso.is_file():
        esci(f"distinta assente: {distinta_percorso}. Va generata dalla catena di costruzione")

    percorso_annotazioni = Path(ANNOTAZIONI)
    if not percorso_annotazioni.is_absolute():
        percorso_annotazioni = Path(__file__).resolve().parent.parent / percorso_annotazioni
    annotazioni = leggi_annotazioni(percorso_annotazioni)

    try:
        distinta = json.loads(distinta_percorso.read_text(encoding="utf-8"))
    except json.JSONDecodeError as errore:
        esci(f"distinta illeggibile: {errore}")

    componenti = distinta.get("components", [])
    if not componenti:
        esci(f"{distinta_percorso}: nessun componente. Una distinta vuota non e' un registro vuoto")

    # IL GRAFO SI PERCORRE SU «bom-ref», NON SU «purl», e la distinzione e' costata la prima
    # esecuzione di questo script: usando purl il registro dichiarava «0 dipendenze dirette, 1236
    # transitive», che e' falso e sarebbe passato inosservato in un aggregato. In CycloneDX il purl
    # identifica il PACCHETTO - «pkg:npm/@docusaurus/core@3.10.2» - mentre bom-ref identifica il
    # NODO DELL'ALBERO, e porta il percorso: «telemedic-docs@0.0.0|@docusaurus/core@3.10.2». Lo
    # stesso pacchetto tirato da due percorsi ha un purl e due bom-ref, ed e' esattamente la
    # ragione per cui il grafo usa il secondo.
    radice = distinta.get("metadata", {}).get("component", {}).get("bom-ref", "")
    if not radice:
        esci(f"{distinta_percorso}: metadata.component senza «bom-ref». Il grafo non e' percorribile")
    nome_di_ref = {}
    for componente in componenti:
        ref = componente.get("bom-ref", "")
        if ref:
            nome_di_ref[ref] = nome_da_purl(componente.get("purl", "")) or componente.get("name", "")
    dirette = set()
    tira = {}
    for relazione in distinta.get("dependencies", []):
        origine = relazione.get("ref", "")
        for bersaglio in relazione.get("dependsOn", []):
            if origine == radice:
                dirette.add(bersaglio)
            tira.setdefault(bersaglio, set()).add(origine)

    righe, senza_annotazione = [], []
    for componente in componenti:
        purl = componente.get("purl", "")
        ref = componente.get("bom-ref", "")
        nome = nome_da_purl(purl) or componente.get("name", "")
        versione = componente.get("version", "")
        chiave = f"{nome}@{versione}"
        voce = annotazioni.get(chiave)
        if voce is None:
            senza_annotazione.append(chiave)
            voce = {}

        impronta = ""
        for riferimento in componente.get("externalReferences", []):
            for h in riferimento.get("hashes", []):
                if h.get("alg") == "SHA-512":
                    impronta = f"sha512:{h.get('content','')}"
                    break
            if impronta:
                break

        genitori = sorted({nome_di_ref.get(g, g) for g in tira.get(ref, set()) if g != radice})
        righe.append({
            "componente": nome,
            "versione": versione,
            "licenza_dichiarata": voce.get("licenza_dichiarata", "[NV] non annotato"),
            "compatibilita_apache_2_0": voce.get("compatibilita_apache_2_0", "[NV] non annotato"),
            "relazione": "diretta" if ref in dirette else "transitiva",
            "tirato_da": ", ".join(genitori[:4]) + (" e altri" if len(genitori) > 4 else ""),
            "motivo_inclusione": voce.get("motivo_inclusione", ""),
            "canale_di_avviso": voce.get("canale_di_avviso", ""),
            "impronta": impronta,
        })

    righe.sort(key=lambda r: (r["relazione"] != "diretta", r["componente"], r["versione"]))
    uscita.mkdir(parents=True, exist_ok=True)

    tsv = uscita / "componenti-di-terze-parti.tsv"
    with tsv.open("w", encoding="utf-8") as f:
        f.write("# Registro dei componenti di terze parti - criterio 6 di T-03.\n")
        f.write("#\n")
        f.write("# GENERATO da scripts/genera-registro-componenti.py: non si modifica a mano, e una\n")
        f.write("# modifica a mano si perde alla costruzione successiva. La giunzione e' fra la distinta\n")
        f.write("# dei materiali, che dice che cosa e' entrato nell'artefatto, e\n")
        f.write(f"# {ANNOTAZIONI}, che dice che cosa il progetto ne ha valutato.\n")
        f.write("#\n")
        f.write(f"# Distinta di origine: {distinta_percorso.name}\n")
        f.write("#\n")
        f.write("\t".join(COLONNE) + "\n")
        for r in righe:
            f.write("\t".join(r[c].replace("\t", " ") for c in COLONNE) + "\n")

    per_licenza = {}
    for r in righe:
        per_licenza[r["licenza_dichiarata"]] = per_licenza.get(r["licenza_dichiarata"], 0) + 1
    non_accertati = [r for r in righe
                     if r["compatibilita_apache_2_0"] not in ("compatibile", "compatibile-permissiva")]
    dirette_righe = [r for r in righe if r["relazione"] == "diretta"]

    md = uscita / "componenti-di-terze-parti.md"
    with md.open("w", encoding="utf-8") as f:
        f.write("# Registro dei componenti di terze parti\n\n")
        f.write("> **Documento generato.** Lo produce `scripts/genera-registro-componenti.py` a ogni\n")
        f.write("> costruzione, dalla distinta dei materiali e dalle annotazioni versionate. Non si\n")
        f.write("> modifica a mano. L'elenco **completo**, una riga per componente, e' nel file\n")
        f.write("> `componenti-di-terze-parti.tsv` che accompagna questo documento: qui stanno gli\n")
        f.write("> aggregati, le dipendenze dirette e i componenti la cui compatibilita' non e'\n")
        f.write("> accertata, che sono la parte per cui il registro esiste.\n\n")
        f.write(f"**{len(righe)} componenti**, di cui **{len(dirette_righe)} dipendenze dirette** e ")
        f.write(f"**{len(righe) - len(dirette_righe)} transitive**. Le transitive non sono state scelte\n")
        f.write("dal progetto: le tira qualcun altro, e la colonna «tirato da» del registro completo dice chi.\n\n")
        f.write("## Licenze dichiarate\n\n| Licenza | Componenti |\n|---|--:|\n")
        for licenza, quanti in sorted(per_licenza.items(), key=lambda v: (-v[1], v[0])):
            f.write(f"| `{licenza}` | {quanti} |\n")
        f.write("\n## Compatibilita' non accertata\n\n")
        if non_accertati:
            f.write("Questi componenti **non** hanno una compatibilita' accertata con Apache-2.0. La\n")
            f.write("derivazione avviene dall'identificativo SPDX dichiarato, non dal testo della licenza:\n")
            f.write("cio' che non e' nell'elenco di riferimento esce «indeterminabile» e va deciso da chi ne\n")
            f.write("ha l'autorita'. Lo script non indovina mai.\n\n")
            f.write("| Componente | Versione | Licenza | Esito | Relazione |\n|---|---|---|---|---|\n")
            for r in non_accertati:
                f.write(f"| `{r['componente']}` | {r['versione']} | `{r['licenza_dichiarata']}` "
                        f"| {r['compatibilita_apache_2_0']} | {r['relazione']} |\n")
        else:
            f.write("Nessuno: ogni componente della distinta ha una compatibilita' accertata.\n")
        f.write("\n## Dipendenze dirette\n\n")
        f.write("Sono quelle che il progetto ha scelto, e le uniche per cui esiste un motivo di\n")
        f.write("inclusione scritto da una persona.\n\n")
        f.write("| Componente | Versione | Licenza | Motivo di inclusione |\n|---|---|---|---|\n")
        for r in dirette_righe:
            f.write(f"| `{r['componente']}` | {r['versione']} | `{r['licenza_dichiarata']}` "
                    f"| {r['motivo_inclusione']} |\n")

    print(f"\033[32m✓ registro generato: {len(righe)} componenti "
          f"({len(dirette_righe)} dirette, {len(righe) - len(dirette_righe)} transitive)\033[0m")
    print(f"  {tsv}")
    print(f"  {md}")
    if non_accertati:
        print(f"\033[33m· {len(non_accertati)} con compatibilita' non accertata, "
              f"elencati nel documento\033[0m")
    if senza_annotazione:
        print(f"\033[33m· {len(senza_annotazione)} senza annotazione, segnati «[NV] non annotato». "
              f"E' G5 a farne fallire la costruzione, non questo generatore\033[0m")


if __name__ == "__main__":
    main()
