#!/usr/bin/env python3
"""Genera i capitoli pubblicati che danno una casa alle sigle dei vincoli e delle questioni.

I due registri leggibili da macchina - registro/vincoli.tsv e registro/questioni.tsv - sono la
proiezione della bacheca inter-agenti, che vive in .telemedic/ e non finisce sul sito. Finche'
restava cosi', la documentazione pubblicata citava come vigenti duecentoventuno sigle che un
lettore esterno non poteva risolvere in alcun modo: il rinvio c'era, il bersaglio no.

Questo script produce da quei registri i capitoli di docs/11_registri/, in italiano e in inglese.
I capitoli sono GENERATI: non si modificano a mano. Si modifica la bacheca, si riproietta con
scripts/genera-registri-di-vincoli-e-questioni.py, e si rigenera qui.

Ogni voce diventa un titolo di terzo livello che porta la SOLA sigla. E' una scelta obbligata:
l'ancora che ne discende - «#v-160» - e' stabile, prevedibile senza leggere il file, e IDENTICA
nelle due lingue, il che rende risolvibile un rinvio da qualunque documento di qualunque area
senza dover conoscere il titolo del bersaglio nella lingua del bersaglio. Un titolo che portasse
anche il testo del vincolo produrrebbe due ancore diverse per la stessa voce.
"""

import re
import csv
import os
import sys
from pathlib import Path

SENZA_BERSAGLIO = []
RADICE = Path(os.environ.get("REGISTRI_RADICE") or Path(__file__).resolve().parent.parent)
USCITA_IT = RADICE / "docs/11_registri"
USCITA_EN = RADICE / "website/i18n/en/docusaurus-plugin-content-docs/current/11_registri"


def leggi(percorso):
    """Le voci del registro, ciascuna con l'eventuale marcatore che la precede.

    Una riga di commento «dato-reale-consentito: <motivo>» che precede una voce non e' decorazione:
    e' cio' che rende ammissibile un recapito reale dentro quella voce (CONTRIBUTING.md § dati
    sintetici). Va portata anche nel capitolo pubblicato, altrimenti il controllo sui dati non
    sintetici trova il recapito e non trova la ragione per cui e' li'.
    """
    voci = []
    marcatore = ""
    with open(percorso, encoding="utf-8") as f:
        for riga in f:
            riga = riga.rstrip("\n")
            if riga.startswith("# dato-reale-consentito:"):
                marcatore = riga[2:]
                continue
            if riga.startswith("#") or not riga.strip():
                continue
            campi = riga.split("\t")
            if campi[0] == "sigla":
                continue
            voci.append((campi, marcatore))
            marcatore = ""
    return voci


def leggi_traduzione():
    """Le voci in inglese, se esistono: sigla → (destinatarie, testo, stato).

    Vive in un file separato invece che in una colonna della bacheca perche' la bacheca e' uno
    strumento di lavoro fra le aree, scritto in italiano, e appesantirla di una colonna che nove
    volte su dieci resterebbe vuota al momento della scrittura la renderebbe meno usabile
    proprio nell'atto per cui esiste. Il legame fra i due file e' la sigla, e un controllo di
    costruzione verifica che nessuna voce resti senza la propria traduzione: una voce italiana
    su una pagina inglese non e' soltanto illeggibile, mette una parola italiana nell'indice di
    ricerca inglese e fa restituire risultati italiani a chi cerca in inglese.
    """
    percorso = RADICE / "registro/traduzioni-en.tsv"
    if not percorso.exists():
        return {}
    voci = {}
    for riga in percorso.read_text(encoding="utf-8").splitlines():
        if riga.startswith("#") or not riga.strip():
            continue
        campi = riga.split("\t")
        if campi[0] == "sigla" or len(campi) != 4:
            continue
        voci[campi[0]] = (campi[1], campi[2], campi[3])
    return voci


TRADUZIONE = None


def frontmatter(titolo, posizione, descrizione):
    # La descrizione si quota sempre: un valore che contiene due punti seguiti da spazio fa
    # fallire la costruzione con un errore di indentazione che non riguarda l'indentazione.
    return f'---\ntitle: {titolo}\nsidebar_position: {posizione}\ndescription: "{descrizione}"\n---\n\n'


def collega_rinvii(testo, radice_lingua):
    """Trasforma «`docs/area/file.md`» in un collegamento risolvibile dalla pagina generata.

    PERCHE' STA QUI E NON NEL TESTO. Il 27 agosto 2026 centottantadue rinvii testuali erano stati
    convertiti in collegamenti direttamente nei capitoli di 11_registri. La rigenerazione
    successiva li ha annullati tutti in un colpo solo, e il controllo dei rinvii testuali e'
    tornato rosso: la bonifica era stata applicata al PRODOTTO invece che al GENERATORE, e un
    prodotto rigenerato non conserva ciò che non sta nella sua sorgente.

    La conversione non puo' stare nella bacheca, che non e' pubblicata e dove un percorso relativo
    verso «docs/» non avrebbe bersaglio. Sta qui, che e' l'unico punto in cui esiste insieme il
    testo della voce e la collocazione della pagina che lo ospita.

    La regola e' la stessa del controllo che la presidia: si converte un tratto di codice che
    contiene ESCLUSIVAMENTE un percorso a un file «.md» sotto «docs/». Un percorso che occupa solo
    parte del tratto - «git log ... docs/…» - e' un argomento di comando e resta com'e'.

    IL BERSAGLIO SI VERIFICA, E L'ASSENZA FERMA LA GENERAZIONE. La prima stesura collegava senza
    guardare, e la costruzione del sito e' fallita: la tabella delle traduzioni inglesi conteneva
    trentuno percorsi con il NOME DI FILE TRADOTTO - «08_compliance/07-clinical-evaluation.md» -
    che non esiste in nessuna delle due lingue, perche' il corpus inglese conserva i nomi italiani.
    Erano rinvii pendenti da prima, invisibili finche' restavano testo nudo. Convertirli in
    collegamenti li ha resi un errore di costruzione, il che e' esattamente cio' che deve
    accadere: il capitolo che questa funzione genera dichiara in testa che «un rinvio senza
    bersaglio non e' un rinvio».
    """
    def sostituisci(riscontro):
        percorso = riscontro.group(1)
        relativo = percorso[len("docs/"):]
        if not (radice_lingua.parent / relativo).exists():
            SENZA_BERSAGLIO.append((percorso, str(radice_lingua.parent)))
            return riscontro.group(0)
        return "[`" + percorso + "`](../" + relativo + ")"
    return re.sub(r"`(docs/[0-9A-Za-z_./-]+\.md)`", sostituisci, testo)


def capitolo(voci, lingua, famiglia, radice_lingua):
    it = lingua == "it"
    if famiglia == "vincoli":
        titolo = "Vincoli in vigore" if it else "Constraints in force"
        descrizione = (
            "Il registro dei vincoli di progetto: ogni sigla citata nella documentazione, "
            "chi l'ha emessa, a quali aree si applica e che cosa impone."
            if it else
            "The register of project constraints: every sigla cited in the documentation, "
            "who issued it, which areas it binds and what it imposes."
        )
        colonna = "Vincolo" if it else "Constraint"
    else:
        titolo = "Questioni aperte" if it else "Open questions"
        descrizione = (
            "Il registro delle questioni aperte fra le aree del progetto: che cosa e' ancora "
            "irrisolto, chi l'ha sollevato, a chi tocca deciderlo e a che punto e'."
            if it else
            "The register of open questions between the project areas: what is still "
            "unresolved, who raised it, who must decide it and where it stands."
        )
        colonna = "Questione" if it else "Question"

    parti = [frontmatter(titolo, 2 if famiglia == "vincoli" else 3, descrizione)]
    parti.append(f"# {titolo}\n\n")

    if it:
        parti.append(
            "> **Questo capitolo e' generato.** La fonte e' la bacheca inter-agenti del progetto,\n"
            "> proiettata in `registro/" + famiglia + ".tsv` e da li' in questa pagina. Modificarlo a\n"
            "> mano non ha effetto: la modifica sparisce alla rigenerazione successiva.\n\n"
            "Ogni voce porta come titolo la **sola sigla**, cosi' che il rinvio `#" + ("v" if famiglia == "vincoli" else "q") + "-160` sia\n"
            "stabile e uguale nelle due lingue. Le colonne **Da** e **A** dicono quale area ha emesso la\n"
            "voce e quali aree ne sono destinatarie; le sigle delle aree sono quelle usate nel contesto\n"
            "di lavoro del progetto.\n\n"
            "**Il testo delle voci resta nella lingua in cui e' stato emesso**, l'italiano, anche nella\n"
            "versione inglese di questa pagina. E' una limitazione dichiarata e non una svista: tradurre\n"
            "una voce di registro significherebbe mantenerne due versioni allineate a ogni modifica della\n"
            "bacheca, e una traduzione che si stacca da un registro di governo dice cose diverse a lettori\n"
            "di lingua diversa su che cosa il progetto e' vincolato a fare.\n\n"
        )
    else:
        parti.append(
            "> **This chapter is generated.** Its source is the project's inter-agent noticeboard,\n"
            "> projected into `registro/" + famiglia + ".tsv` and from there into this page. Editing it by\n"
            "> hand has no effect: the edit disappears on the next regeneration.\n\n"
            "Each entry is titled with the **sigla alone**, so that a reference such as `#" + ("v" if famiglia == "vincoli" else "q") + "-160` is\n"
            "stable and identical in both languages. The **From** and **To** fields name the area that\n"
            "issued the entry and the areas it binds; the area siglas are those used in the project's\n"
            "internal working context.\n\n"
            "**Entry text remains in the language in which it was issued**, Italian, including on this\n"
            "English page. This is a declared limitation, not an oversight: translating a register entry\n"
            "would mean keeping two versions aligned at every change to the noticeboard, and a translation\n"
            "that drifts from a governance register tells readers of different languages different things\n"
            "about what the project is bound to do.\n\n"
        )

    da = "Da" if it else "From"
    a = "A" if it else "To"
    stato = "Stato" if it else "State"

    for (sigla, emittente, destinatarie, testo, stato_voce), marcatore in voci:
        if not it:
            resa = TRADUZIONE.get(sigla)
            if resa:
                destinatarie, testo, stato_voce = resa
            else:
                # Si dichiara, non si nasconde: una voce non tradotta e' una lacuna visibile.
                testo = ("**[NV] This entry has not been translated yet.** Its Italian text is in "
                         "the register at `registro/" + famiglia + ".tsv`.")
                stato_voce = "[NV]"
        parti.append(f"### {sigla}\n\n")
        parti.append(f"**{da}**: {emittente} · **{a}**: {destinatarie} · **{stato}**: {collega_rinvii(stato_voce, radice_lingua)}\n\n")
        coda = f" <!-- {marcatore} -->" if marcatore else ""
        parti.append(f"{collega_rinvii(testo, radice_lingua)}{coda}\n\n")
    return "".join(parti)


def indice(lingua):
    it = lingua == "it"
    if it:
        return (
            frontmatter("Registri - indice e orientamento", 1,
                        "Che cosa contengono i registri dei vincoli e delle questioni, che cosa "
                        "non contengono, e come si legge una sigla citata altrove nella documentazione.")
            + """# Registri - indice e orientamento

> **Un rinvio senza bersaglio non e' un rinvio.**
> Quest'area esiste perche' la documentazione di questo progetto cita, in prosa e come vigenti,
> oltre duecento sigle di vincolo e di questione. Fino al 27 agosto 2026 quelle sigle vivevano in
> un file del contesto di lavoro interno che non veniva pubblicato: chi leggeva la documentazione
> trovava il rinvio e non aveva alcun modo di raggiungere cio' a cui rinviava.

## 1. Che cosa e' quest'area e che cosa non e'

Quest'area risponde a una domanda sola: **che cosa dice la sigla che ho appena letto**. Non
contiene requisiti - quelli sono in [`docs/03_functional/`](../03_functional/00-indice.md) - non
contiene decisioni architetturali - quelle sono negli [ADR](../adr/README.md) - e non contiene
traguardi ne' rischi di programma, che appartengono alla
[roadmap](../09_roadmap/00-indice.md).

| # | Pagina | A quale domanda risponde |
|---|---|---|
| 01 | [Vincoli in vigore](./01-vincoli-in-vigore.md) | Che cosa impone la sigla `V-` che ho letto, chi l'ha emessa, a quali aree si applica |
| 02 | [Questioni aperte](./02-questioni-aperte.md) | Che cosa e' ancora irrisolto sotto la sigla `Q-` che ho letto, chi l'ha sollevato, a che punto e' |
| 03 | [Vincoli fondanti](./03-vincoli-fondanti.md) | Che cosa dicono i sei vincoli senza trattino - `V1`…`V6` - che tutta la documentazione cita |

## 2. Come si legge una sigla

Le sigle appartengono a **due famiglie distinte**, e la distinzione non e' tipografica.

I **vincoli fondanti** si scrivono senza trattino - `V1`, `V2`, `V3`, `V4`, `V5`, `V6` - e sono i
sei impegni che definiscono il progetto: sovranita' del dato, separazione dal perimetro del
dispositivo medico, integrabilita' totale, consapevolezza del tenant, auditabilita' immutabile,
usabilita' e accessibilita'. Sono dichiarati in
[Vincoli fondanti](./03-vincoli-fondanti.md), sono in numero chiuso e non cambiano.

I **vincoli e le questioni fra aree** si scrivono con il trattino e un numero - `V-160`, `Q-135` -
e sono il prodotto del lavoro fra le aree del progetto: un'area emette un vincolo che le altre
devono rispettare, oppure solleva una questione che un'altra area deve decidere. Sono quelli
registrati in quest'area.

## 3. La numerazione, e perche' ha dei buchi

I numeri **non sono consecutivi**, e il vuoto non e' una lacuna: e' la struttura. I numeri da 1 a
12 appartengono ai vincoli emessi all'origine dall'orchestrazione e dalla guida; dal 110 in su lo
spazio e' diviso in **blocchi da dieci, uno per area** - la sicurezza in `V-150`…`V-157`,
l'integrazione in `V-160`…`V-166`, e cosi' via - cosi' che due aree che lavorano nello stesso
momento non possano coniare lo stesso numero.

L'intervallo da 13 a 109 e' **vuoto per una ragione storica che vale la pena conoscere**, perche'
spiega un difetto che questa documentazione ha portato per mesi. All'inizio ogni area numerava per
conto proprio a partire da 13, e la stessa sigla designava cose diverse a seconda di chi la
scriveva. Quando la numerazione e' stata globalizzata in blocchi, la tabella e' stata riscritta e
**il corpus no**: settantasei citazioni hanno continuato a nominare i numeri vecchi. Sono state
corrette il 27 agosto 2026, e da allora un controllo di costruzione verifica che ogni sigla citata
nella documentazione risolva in questi registri, in entrambe le lingue.

## 4. Che cosa quest'area non garantisce

Il registro dice **che cosa una voce impone e a che punto e'**, non se sia stata realizzata. Un
vincolo in vigore e' un impegno vincolante per le aree, non l'attestazione che il sistema lo
soddisfi gia': il progetto e' in fase di progettazione e non esiste ancora codice applicativo.
Per che cosa esiste e che cosa no si veda [Stato e limiti](../00_overview/04-stato-e-limiti.md).
"""
        )
    return (
        frontmatter("Registers - index and orientation", 1,
                    "What the registers of constraints and open questions contain, what they do "
                    "not contain, and how to read a sigla cited elsewhere in the documentation.")
        + """# Registers - index and orientation

> **A reference without a target is not a reference.**
> This area exists because this project's documentation cites, in prose and as being in force,
> more than two hundred constraint and question siglas. Until 27 August 2026 those siglas lived in
> an internal working file that was never published: a reader found the reference and had no way
> whatsoever to reach what it referred to.

## 1. What this area is and what it is not

This area answers one question only: **what does the sigla I have just read say**. It holds no
requirements - those are in [`docs/03_functional/`](../03_functional/00-indice.md) - no
architectural decisions - those are in the [ADRs](../adr/README.md) - and no milestones or
programme risks, which belong to the [roadmap](../09_roadmap/00-indice.md).

| # | Page | Which question it answers |
|---|---|---|
| 01 | [Constraints in force](./01-vincoli-in-vigore.md) | What the `V-` sigla I read imposes, who issued it, which areas it binds |
| 02 | [Open questions](./02-questioni-aperte.md) | What is still unresolved under the `Q-` sigla I read, who raised it, where it stands |
| 03 | [Founding constraints](./03-vincoli-fondanti.md) | What the six hyphenless constraints - `V1`…`V6` - cited throughout the documentation actually say |

## 2. How to read a sigla

The siglas belong to **two distinct families**, and the distinction is not typographic.

The **founding constraints** are written without a hyphen - `V1`, `V2`, `V3`, `V4`, `V5`, `V6` -
and are the six commitments that define the project: data sovereignty, separation from the medical
device perimeter, full integrability, tenant awareness, immutable auditability, usability and
accessibility. They are stated in
[Founding constraints](./03-vincoli-fondanti.md), are closed in number and do not change.

The **inter-area constraints and questions** are written with a hyphen and a number - `V-160`,
`Q-135` - and are the product of the work between the project's areas: one area issues a
constraint the others must respect, or raises a question another area must decide. These are the
ones registered in this area.

## 3. The numbering, and why it has gaps

The numbers are **not consecutive**, and the gaps are not omissions: they are the structure.
Numbers 1 to 12 belong to the constraints issued at the outset by orchestration and by the guide;
from 110 upwards the space is divided into **blocks of ten, one per area** - security in
`V-150`…`V-157`, integration in `V-160`…`V-166`, and so on - so that two areas working at the same
time cannot mint the same number.

The range from 13 to 109 is **empty for a historical reason worth knowing**, because it explains a
defect this documentation carried for months. At the start each area numbered independently from
13, and the same sigla designated different things depending on who wrote it. When the numbering
was globalised into blocks, the table was rewritten and **the corpus was not**: seventy-six
citations went on naming the old numbers. They were corrected on 27 August 2026, and since then a
build control verifies that every sigla cited in the documentation resolves in these registers, in
both languages.

## 4. What this area does not guarantee

The register says **what an entry imposes and where it stands**, not whether it has been
implemented. A constraint in force is a binding commitment on the areas, not an attestation that
the system already satisfies it: the project is in design and no application code exists yet.
For what exists and what does not, see [State and limits](../00_overview/04-stato-e-limiti.md).
"""
    )


def main():
    global TRADUZIONE
    TRADUZIONE = leggi_traduzione()
    print(f"· traduzioni disponibili: {len(TRADUZIONE)}")
    for uscita, lingua in ((USCITA_IT, "it"), (USCITA_EN, "en")):
        uscita.mkdir(parents=True, exist_ok=True)
        (uscita / "00-indice.md").write_text(indice(lingua), encoding="utf-8")
        for famiglia, sorgente, nome in (
            ("vincoli", "registro/vincoli.tsv", "01-vincoli-in-vigore.md"),
            ("questioni", "registro/questioni.tsv", "02-questioni-aperte.md"),
        ):
            voci = leggi(RADICE / sorgente)
            (uscita / nome).write_text(capitolo(voci, lingua, famiglia, uscita), encoding="utf-8")
            print(f"✓ {uscita.relative_to(RADICE)}/{nome}: {len(voci)} voci")
    if SENZA_BERSAGLIO:
        visti = sorted(set(SENZA_BERSAGLIO))
        print(file=sys.stderr)
        print(f"✗ {len(visti)} rinvio/i senza bersaglio: il percorso citato non esiste nella lingua", file=sys.stderr)
        print("  in cui la pagina viene generata, quindi non e' stato collegato e resta testo nudo.", file=sys.stderr)
        for percorso, dove in visti:
            print(f"  · {percorso}  (atteso sotto {dove})", file=sys.stderr)
        print("  Un rinvio senza bersaglio non e' un rinvio: si corregge il percorso alla FONTE -", file=sys.stderr)
        print("  la bacheca per il testo italiano, registro/traduzioni-en.tsv per quello inglese.", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
