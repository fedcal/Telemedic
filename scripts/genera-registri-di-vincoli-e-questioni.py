#!/usr/bin/env python3
"""Proietta la bacheca inter-agenti nei due registri leggibili da macchina.

La bacheca `.telemedic/context/05_BACHECA_INTERAGENTI.md` resta la sola fonte di verita'
dei vincoli e delle questioni: e' li' che si scrivono, e questo script non la modifica mai.
Il suo compito e' derivarne due file separati da TAB, `registro/vincoli.tsv` e
`registro/questioni.tsv`, su cui un controllo possa verificare che ogni sigla citata nella
documentazione trovi la propria definizione.

La proiezione e' severa per scelta. Una riga con un numero di celle diverso da quello
dichiarato dall'intestazione, una sigla malformata, una sigla ripetuta o un carattere TAB
dentro una cella fanno fallire la generazione con il numero di riga, e non viene scritto
alcun file. Il motivo e' che il difetto sta nella fonte, non nella proiezione: assorbirlo
qui lo renderebbe invisibile proprio nel momento in cui e' stato scoperto.
"""

import os
import re
import sys
from pathlib import Path

# La radice non si forza: uno script che impone la propria non e' verificabile da alcuna
# tenuta, perche' nessuna tenuta puo' mettersi al suo posto. Le due variabili esistono per
# la prova, mai come ripiego a tempo di esercizio.
RADICE = Path(os.environ.get("REGISTRO_RADICE") or Path(__file__).resolve().parent.parent)
BACHECA = Path(os.environ.get("REGISTRO_BACHECA") or RADICE / ".telemedic/context/05_BACHECA_INTERAGENTI.md")
USCITA = Path(os.environ.get("REGISTRO_USCITA") or RADICE)

# Ogni sezione da proiettare: titolo esatto, file di destinazione, prefisso atteso della sigla.
SEZIONI = [
    ("## Vincoli in vigore", "registro/vincoli.tsv", "V"),
    ("## Questioni aperte", "registro/questioni.tsv", "Q"),
]

# La sigla ammette una coda alfabetica minuscola, perche' il corpus usa gia' `V-07-bis`.
SIGLA = re.compile(r"^(V|Q)-\d{2,3}(-[a-z]+)?$")

COLONNE = ["sigla", "emittente", "destinatarie", "testo", "stato"]


def ripulisci_sigla(cella):
    """Toglie dalla cella della sigla le decorazioni tipografiche del markdown.

    Il corpus scrive `**V-156** *(nuovo)*` per segnalare una voce appena aggiunta: la
    decorazione e' informazione per chi legge la bacheca, non parte dell'identificativo.
    """
    testo = re.sub(r"\*\([^)]*\)\*", "", cella)
    testo = testo.replace("**", "").replace("*", "")
    return testo.strip()


def celle(riga):
    """Divide una riga di tabella markdown nelle sue celle di contenuto."""
    parti = riga.split("|")
    # Una riga ben formata apre e chiude con la barra: il primo e l'ultimo pezzo sono vuoti.
    coda = parti[-1].strip()
    # Una coda ammessa: il marcatore «dato-reale-consentito» del progetto, che si scrive come
    # commento HTML sulla riga stessa (CONTRIBUTING.md § dati sintetici). Non si scarta: e' cio'
    # che rende ammissibile il recapito nella riga, e una proiezione che lo perdesse renderebbe
    # il dato indistinguibile da un dato reale pubblicato per errore.
    marcatore = ""
    if coda.startswith("<!--") and coda.endswith("-->"):
        marcatore = coda[4:-3].strip()
        parti = parti[:-1] + [""]
        coda = ""
    if parti[0].strip() or coda:
        return None, ""
    return [p.strip() for p in parti[1:-1]], marcatore


def leggi_sezione(righe, titolo):
    """Restituisce le righe di tabella della sezione, ciascuna con il proprio numero di riga."""
    dentro = False
    raccolte = []
    for numero, riga in enumerate(righe, start=1):
        if riga.startswith("## "):
            dentro = riga.strip() == titolo
            continue
        if dentro and riga.startswith("|"):
            raccolte.append((numero, riga.rstrip("\n")))
    return raccolte


def proietta(righe, titolo, prefisso, errori):
    tabella = leggi_sezione(righe, titolo)
    if not tabella:
        errori.append(f"sezione «{titolo}» assente o priva di tabella")
        return []

    intestazione, _ = celle(tabella[0][1])
    if intestazione is None or len(intestazione) != len(COLONNE):
        errori.append(
            f"riga {tabella[0][0]}: l'intestazione di «{titolo}» non ha "
            f"{len(COLONNE)} colonne"
        )
        return []

    voci = []
    viste = {}
    for numero, riga in tabella[1:]:
        contenuto, marcatore = celle(riga)
        if contenuto is None:
            errori.append(f"riga {numero}: la riga non apre e chiude con la barra verticale")
            continue
        # La riga di separazione dell'intestazione markdown non e' una voce.
        if all(set(c) <= {"-", ":"} and c for c in contenuto):
            continue
        if len(contenuto) != len(COLONNE):
            errori.append(
                f"riga {numero}: {len(contenuto)} celle invece di {len(COLONNE)} "
                f"- inizia con «{contenuto[0][:40]}»"
            )
            continue
        sigla = ripulisci_sigla(contenuto[0])
        if not SIGLA.match(sigla):
            errori.append(f"riga {numero}: sigla non riconosciuta «{sigla}»")
            continue
        if not sigla.startswith(prefisso + "-"):
            errori.append(
                f"riga {numero}: la sigla «{sigla}» non appartiene alla sezione «{titolo}»"
            )
            continue
        if sigla in viste:
            errori.append(f"riga {numero}: la sigla «{sigla}» era gia' alla riga {viste[sigla]}")
            continue
        viste[sigla] = numero
        if any("\t" in c for c in contenuto):
            errori.append(f"riga {numero}: la voce «{sigla}» contiene un carattere TAB")
            continue
        voci.append(([sigla] + contenuto[1:], marcatore))
    return voci


def intestazione_del_file(titolo, quante):
    return "\n".join(
        [
            f"# {titolo}",
            "#",
            "# GENERATO. Non si modifica a mano: si modifica la bacheca inter-agenti",
            "# .telemedic/context/05_BACHECA_INTERAGENTI.md e si riesegue",
            "# scripts/genera-registri-di-vincoli-e-questioni.py.",
            "#",
            "# Formato: file di testo separato da carattere TAB, codifica UTF-8. Le righe che",
            "# iniziano con # sono commenti. Segue l'intestazione delle colonne e poi una riga",
            "# per voce. Nessuna cella contiene un carattere TAB.",
            "#",
            "# Colonne: " + ", ".join(COLONNE),
            f"# Voci: {quante}",
            "",
        ]
    )


def main():
    if not BACHECA.exists():
        print(f"✗ Bacheca assente: {BACHECA}", file=sys.stderr)
        return 2
    righe = BACHECA.read_text(encoding="utf-8").splitlines()

    errori = []
    prodotti = []
    for titolo, destinazione, prefisso in SEZIONI:
        voci = proietta(righe, titolo, prefisso, errori)
        prodotti.append((titolo, destinazione, voci))

    if errori:
        print("✗ La bacheca non e' proiettabile: correggerla prima di rigenerare.", file=sys.stderr)
        for e in errori:
            print(f"  · {e}", file=sys.stderr)
        return 1

    for titolo, destinazione, voci in prodotti:
        percorso = USCITA / destinazione
        percorso.parent.mkdir(parents=True, exist_ok=True)
        corpo = [intestazione_del_file(titolo.lstrip("# "), len(voci))]
        corpo.append("\t".join(COLONNE))
        for voce, marcatore in voci:
            if marcatore:
                corpo.append("# " + marcatore)
            corpo.append("\t".join(voce))
        percorso.write_text("\n".join(corpo) + "\n", encoding="utf-8")
        print(f"✓ {destinazione}: {len(voci)} voci")
    return 0


if __name__ == "__main__":
    sys.exit(main())
