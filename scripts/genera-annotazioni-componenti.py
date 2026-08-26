#!/usr/bin/env python3
"""Genera le righe di annotazione per i componenti TRANSITIVI della distinta.

Perché esiste. Il criterio 6 di T-03 non distingue: «un componente presente nella distinta e
assente dalle annotazioni fa fallire la costruzione». La distinta del sito porta 1236 componenti,
di cui 9 sono le dipendenze che il progetto ha scelto e 1227 sono transitive, tirate da quelle.
Scrivere a mano un «motivo di inclusione» per 1227 componenti che il progetto non ha scelto
produrrebbe 1227 frasi inventate: la ragione vera di ciascuno è che qualcun altro lo tira, e
questo script la scrive dicendo CHI.

Che cosa NON fa, e va detto. Non legge il testo delle licenze: deriva la compatibilità
dall'identificativo SPDX dichiarato dal componente, confrontandolo con l'elenco qui sotto. È il
metodo che pipeline/README-COMPONENTI.md prescrive («la compatibilità dichiarata fra le due
licenze in una fonte ufficiale, la matrice di compatibilità di SPDX»), e resta una derivazione,
non un parere legale. Ciò che non è nell'elenco esce «indeterminabile» e va deciso da chi ne ha
l'autorità: lo script non indovina mai.

Uso:  python3 scripts/genera-annotazioni-componenti.py <distinta.json> [registro.tsv]
"""
import json, sys, collections

# Licenze permissive la cui compatibilità con Apache-2.0 è dichiarata da SPDX o dalla FSF.
# Ogni aggiunta a questo insieme è una decisione, non una manutenzione.
PERMISSIVE = {
    "MIT", "MIT-0", "ISC", "Apache-2.0", "BSD-2-Clause", "BSD-3-Clause", "0BSD",
    "Unlicense", "CC0-1.0", "BlueOak-1.0.0", "Python-2.0", "WTFPL", "Zlib",
}

def compatibilita(lic: str) -> str:
    """Deriva il giudizio dalla forma dichiarata. Un'espressione «A OR B» è compatibile se
    almeno un ramo lo è: chi ridistribuisce sceglie il ramo permissivo. Un'espressione «A AND B»
    lo è solo se lo sono tutti i rami."""
    if not lic or lic == "NOLICENSE":
        return "indeterminabile"
    t = lic.strip().strip("()")
    if " OR " in t:
        return "compatibile" if any(compatibilita(r) == "compatibile" for r in t.split(" OR ")) else "indeterminabile"
    if " AND " in t:
        return "compatibile" if all(compatibilita(r) == "compatibile" for r in t.split(" AND ")) else "indeterminabile"
    return "compatibile" if t in PERMISSIVE else "indeterminabile"

def nome_completo(c: dict) -> str:
    return (c["group"] + "/" + c["name"]) if c.get("group") else c["name"]

def licenza(c: dict) -> str:
    for l in c.get("licenses", []):
        v = l.get("license", {}).get("id") or l.get("expression") or l.get("license", {}).get("name")
        if v:
            return v
    return "NOLICENSE"

def main() -> int:
    distinta = json.load(open(sys.argv[1], encoding="utf-8"))
    registro = sys.argv[2] if len(sys.argv) > 2 else "pipeline/annotazioni-componenti.tsv"

    componenti = [c for c in distinta["components"] if c.get("type") in ("library", "application")]
    per_ref = {c["bom-ref"]: c for c in componenti if "bom-ref" in c}

    # Chi tira chi: si inverte il grafo delle dipendenze della distinta.
    genitori = collections.defaultdict(set)
    for d in distinta.get("dependencies", []):
        for figlio in d.get("dependsOn", []):
            genitori[figlio].add(d["ref"])

    # Le righe già scritte a mano non si toccano: sono le dipendenze scelte dal progetto.
    gia_scritte = set()
    intestazione = None
    testa = []
    for riga in open(registro, encoding="utf-8"):
        if riga.startswith("#"):
            testa.append(riga.rstrip("\n")); continue
        campi = riga.rstrip("\n").split("\t")
        if intestazione is None:
            intestazione = riga.rstrip("\n"); continue
        if campi and campi[0]:
            gia_scritte.add(f"{campi[0]}@{campi[1]}")

    nuove, indeterminabili = [], []
    for c in sorted(componenti, key=lambda x: nome_completo(x)):
        chiave = f"{nome_completo(c)}@{c['version']}"
        if chiave in gia_scritte:
            continue
        lic = licenza(c)
        comp = compatibilita(lic)
        # Chi lo tira, detto con i nomi veri e non con una formula.
        tiranti = sorted({nome_completo(per_ref[g]) for g in genitori.get(c.get("bom-ref", ""), set()) if g in per_ref})
        if tiranti:
            quanti = len(tiranti)
            elenco = ", ".join(tiranti[:3]) + (f" e altri {quanti - 3}" if quanti > 3 else "")
            motivo = (f"Dipendenza transitiva: il progetto non l'ha scelta, la tira {elenco}. "
                      f"La ragione della sua presenza e' quella del componente che la richiede.")
        else:
            motivo = ("Dipendenza transitiva senza genitore dichiarato nella distinta: "
                      "presente nell'albero risolto, tirata da un componente che non la dichiara "
                      "come dipendenza diretta.")
        # Per una transitiva il canale d'avviso non e' la pagina dei rilasci del pacchetto, che
        # nessuno segue per 1227 componenti: e' la sorveglianza automatica sul file di blocco.
        canale = "https://github.com/fedcal/Telemedic/security/dependabot"
        nuove.append("\t".join([nome_completo(c), c["version"], lic, comp, motivo, canale]))
        if comp != "compatibile":
            indeterminabili.append((nome_completo(c), c["version"], lic))

    with open(registro, "a", encoding="utf-8") as f:
        f.write("\n# --- Righe generate da scripts/genera-annotazioni-componenti.py ---\n")
        f.write("# Componenti TRANSITIVI: il progetto non li ha scelti. La compatibilita' e'\n")
        f.write("# DERIVATA dall'identificativo SPDX dichiarato, non da una lettura del testo\n")
        f.write("# della licenza. Le righe sopra questo blocco sono scritte a mano e non si\n")
        f.write("# rigenerano: sono le dipendenze che il progetto ha scelto.\n")
        for r in nuove:
            f.write(r + "\n")

    print(f"componenti nella distinta: {len(componenti)}")
    print(f"gia' annotati a mano:      {len(gia_scritte)}")
    print(f"righe generate:            {len(nuove)}")
    print(f"non compatibili o indeterminabili: {len(indeterminabili)}")
    for n, v, l in indeterminabili:
        print(f"    {n}@{v}  ->  {l}")
    return 0

if __name__ == "__main__":
    sys.exit(main())
