# Telemedic — istruzioni per chi lavora su questo repository

Questo file è letto automaticamente da Claude Code all'inizio di ogni sessione. Vale anche
come guida rapida per una persona: dice dove sono le cose e quali regole non si negoziano.

## Che cos'è questo progetto

Piattaforma di telemedicina open source (Apache-2.0) per il contesto sanitario italiano:
televisita, teleconsulto, teleassistenza, telemonitoraggio. Costruita sugli standard italiani
— FHIR R4 con le guide HL7 Italia, Fascicolo Sanitario Elettronico, identità digitale
nazionale — invece che adattata ad essi a posteriori.

**Stato attuale: progettazione.** Esiste la documentazione, non ancora il codice. Chi scrive
codice qui lo fa per primo, non dentro un impianto già esistente.

## Prima di scrivere qualsiasi cosa

1. **Leggi la guida dei fondamenti** — `docs/10_fondamenti/`. Non è cortesia: la maggior parte
   degli errori in questo dominio nasce da presupposti impliciti sbagliati sul sistema
   sanitario, sul dato clinico o su cosa la normativa impone davvero. La guida parte da zero.
2. **Leggi `CONTRIBUTING.md`** — le cinque regole non negoziabili.
3. **Leggi l'area pertinente** in `docs/`, e in particolare il suo `00-indice.md`, che dice
   che cosa quell'area **non** copre.

## Dove sono le cose

| Percorso | Contenuto |
|---|---|
| `docs/10_fondamenti/` | Guida da zero: sanità, dato clinico, standard, clinica, informatica, regolatorio |
| `docs/00_overview/` | Panoramica del progetto |
| `docs/01_technical/` | Stack, backend, persistenza, frontend, media, osservabilità, rilascio |
| `docs/02_architecture/` | Contesti delimitati, modello di dominio e dati, eventi, multi-tenancy |
| `docs/03_functional/` | Attori, requisiti, casi d'uso, regole di business, allarmi |
| `docs/04_protocols/` | FHIR, documenti clinici, HL7 v2, IHE, interfacce di progetto, conformità |
| `docs/05_domain/` | Linguaggio ubiquo e modello del dominio sanitario |
| `docs/06_security/` | Modello di minaccia, identità, protezione dei dati, incidenti |
| `docs/07_integration/` | Come un sistema di terze parti si integra |
| `docs/08_compliance/` | MDR, GDPR, NIS2, CRA, percorso di certificazione |
| `docs/09_roadmap/` | Traguardi e rischi di programma |
| `docs/adr/` | Decisioni architetturali, ciascuna con le conseguenze accettate |
| `website/` | Sito Docusaurus (italiano e inglese) pubblicato su GitHub Pages |
| `.telemedic/` | Contesto di lavoro interno: brief, baseline, bacheca inter-agenti, ricerche |

## Regole che non si negoziano

**Nessun dato reale di paziente. Mai.** Non nel codice, non nei test, non nelle issue, non nelle
proposte di modifica, non nei registri, non negli screenshot. Solo dati sintetici, e
riconoscibili come tali.

**Nessuna terminologia sotto licenza nel repository.** Non si versionano contenuti di
terminologie soggette a licenza e non se ne scaricano. Il sistema deve restare pienamente
funzionale senza di esse: se un percorso principale smette di funzionare quando la
terminologia manca, quel percorso è progettato male. Vedi `THIRD-PARTY-TERMINOLOGY.md`.

**Nessuna soglia clinica cablata nel codice.** Le soglie sono configurazione per assistito, mai
costanti. Una soglia nel codice è una decisione clinica presa da chi non ha visto il paziente.

**Nessun segreto nel codice.** Solo segnaposto `${VARIABILE_AMBIENTE}`.

**Nessuna formula di conformità non dimostrata.** Non si scrive che il progetto «è conforme a»
qualcosa se non esiste una prova che possa fallire. Le formule vietate sono elencate in
`docs/04_protocols/`. Vale anche per `publiccode.yml`: le voci di conformità restano `false`
finché la prova corrispondente non è pubblicata ed eseguita.

**Il progetto non appone marcatura CE.** Pubblica il materiale regolatorio per chi certifica,
e distingue sempre l'obbligo del progetto da quello di chi installa. Vedi
`NOT-A-MEDICAL-DEVICE.md` e `DISTRIBUTION-POLICY.md`.

**L'assenza di dato è informazione clinica.** Il silenzio non si tratta mai come normalità.

## Come si scrive la documentazione qui

Prosa italiana piena, non elenchi puntati incollati. Ogni affermazione normativa porta una
fonte puntuale: norma, articolo, comma, data. Ciò che non è verificabile con certezza si marca
`[NV]` e si dichiara — **non si inventa mai** un numero di articolo, una data o un termine.

Ciò che è oneroso, incerto o irrisolto si dice. Le tensioni non si smussano: si dichiarano.

Ogni area ha un `00-indice.md` che spiega anche che cosa l'area **non** copre, e rimanda
all'area che lo copre.

## Sito di documentazione

```bash
cd website
npm ci
npm start          # anteprima in italiano
npm run start:en   # anteprima in inglese
npm run build      # costruzione completa di entrambe le lingue
```

Due trappole già incontrate, per non ripeterle:

- **Non aggiungere `"type": "module"`** a `website/package.json`. I file generati da Docusaurus
  verrebbero trattati come ESM e il caricamento differito si rompe con un errore
  (`require.resolveWeak is not a function`) che non indica affatto la causa reale. La
  configurazione è già in `.mjs` per questo motivo.
- **Nel frontmatter YAML, i valori che contengono due punti seguiti da spazio vanno quotati.**
  Una descrizione come `description: Metriche: come si leggono` fa fallire la costruzione con
  un errore di indentazione che non ha nulla a che vedere con l'indentazione.

I rinvii ai documenti alla radice del repository (`CONTRIBUTING.md`, `NOT-A-MEDICAL-DEVICE.md`
e simili) devono essere **URL assoluti** verso GitHub: un percorso relativo che esce da `docs/`
funziona su GitHub ma non sul sito.

## Git

Messaggi di commit in italiano, forma `<tipo>: <descrizione>`. Tipi: `feat`, `fix`, `refactor`,
`docs`, `test`, `chore`, `perf`, `ci`. Ogni contributo richiede il `Signed-off-by` (DCO).

Il push via SSH non funziona su questa macchina. Usare:

```bash
git -c credential.helper='!gh auth git-credential' push https://github.com/fedcal/Telemedic.git main
```
