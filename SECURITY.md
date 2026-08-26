# Politica di sicurezza

*[English version below](#security-policy)*

Telemedic tratta dati relativi alla salute e viene installato in contesti sanitari. Una
vulnerabilità qui non è un disservizio: può esporre dati di categoria particolare ai sensi
dell'art. 9 del GDPR, o interferire con un atto clinico.

## Come segnalare una vulnerabilità

**Non aprire una issue pubblica.**

Usa la segnalazione privata di GitHub: scheda **Security → Report a vulnerability** del
repository. Il canale è cifrato, visibile solo ai manutentori, e permette di lavorare alla
correzione prima della divulgazione.

Se la segnalazione privata non è disponibile, apri una issue **vuota** che chieda solo un
canale riservato, senza alcun dettaglio tecnico.

### Cosa includere

- Il componente interessato e la versione.
- Cosa consente di fare la vulnerabilità, in termini di impatto - accesso a dati altrui,
  elevazione di privilegio, alterazione di un documento clinico, interruzione del servizio.
- Come riprodurla, con il minimo indispensabile.
- Se hai una proposta di correzione, indicala: non è richiesta.
- **Nessun dato reale**, in nessuna forma. Se la riproduzione ha coinvolto un'installazione
  con dati reali, descrivila senza allegarli. Se ritieni che dati reali siano stati esposti,
  dillo esplicitamente: cambia la gestione dell'incidente.

### Cosa aspettarti

| Fase | Tempo indicativo |
|---|---|
| Presa in carico | 3 giorni lavorativi |
| Prima valutazione con classificazione di gravità | 10 giorni lavorativi |
| Aggiornamenti successivi | ogni 15 giorni fino alla chiusura |

Questi tempi sono un impegno del progetto verso chi segnala. Non sono i tempi di notifica
previsti dalla normativa, che gravano su chi eroga il servizio e sono più stringenti (vedi
oltre).

## Divulgazione coordinata

Il progetto adotta la divulgazione coordinata. In pratica:

1. Concordiamo con chi segnala una finestra prima della pubblicazione, di norma **90
   giorni** dalla presa in carico, riducibile se la correzione è pronta prima ed estendibile
   se la complessità lo richiede.
2. Pubblichiamo un *advisory* con identificativo, versioni interessate, impatto, correzione
   e mitigazioni temporanee.
3. Diamo credito a chi ha segnalato, salvo diversa richiesta.

Non abbiamo un programma di ricompense. Non intraprendiamo azioni legali verso chi segnala
in buona fede, si limita a quanto necessario per dimostrare il problema, non accede a dati
di terzi e non li divulga.

### Avviso agli integratori di una vulnerabilità attivamente sfruttata

Questo è un termine **diverso** dai due precedenti, e non va confuso con essi. La presa in carico
di tre giorni lavorativi è un impegno verso **chi segnala**. Il termine che segue è un impegno
verso **chi integra Telemedic in un proprio prodotto**, e riguarda l'avviso in uscita.

> **Avvisiamo i nostri integratori entro 24 ore dal momento in cui acquisiamo l'evidenza** che una
> vulnerabilità del progetto è attivamente sfruttata, e **immediatamente** quando l'evidenza indica
> che lo sfruttamento è in corso su installazioni in esercizio. L'avviso è dovuto
> **indipendentemente dalla disponibilità di una correzione**.

L'avviso porta l'**istante in cui abbiamo acquisito l'evidenza**, il componente e le versioni
interessate, se lo sfruttamento è confermato, le mitigazioni temporanee disponibili e lo stato
della correzione. Non porta ciò che serve a riprodurre l'attacco.

Il termine esiste per una ragione precisa: dall'**11 settembre 2026** si applicano gli obblighi di
segnalazione dell'art. 14 del Regolamento (UE) 2024/2847 - segnalazione iniziale entro **24 ore**,
notifica entro 72 ore - per le vulnerabilità attivamente sfruttate e gli incidenti gravi; la
decorrenza è fissata dall'art. 71. Quell'obbligo **non sorge in capo al progetto**, che non è un
prodotto immesso sul mercato nel corso di un'attività commerciale, ma sorge in capo a chi lo
integra, e senza un avviso tempestivo da parte nostra è inadempibile. Il termine dichiarato sopra
è quindi un impegno di politica del progetto, non un obbligo di legge. Il quadro completo, con i
cinque orologi e le loro fonti, è in `docs/06_security/10-risposta-agli-incidenti.md`.

## Versioni supportate

Le versioni con supporto di sicurezza sono elencate nella pagina delle release. Il periodo
di supporto è dichiarato esplicitamente, come richiesto dal Regolamento (UE) 2024/2847
(Cyber Resilience Act).

## Obblighi di chi installa

Questo è il punto che distingue Telemedic da un progetto open source ordinario: **il
repository è codice sorgente, non un servizio in esercizio.** Chi installa, integra o mette
in servizio assume obblighi propri che il progetto non può assolvere al posto suo.

- **Violazione di dati personali**: notifica al Garante entro **72 ore** dalla conoscenza
  (art. 33 GDPR), comunicazione agli interessati quando il rischio è elevato (art. 34).
- **Incidenti su soggetti NIS2**: notifica preliminare entro **24 ore**, notifica entro
  **72 ore**, relazione finale entro **un mese** (D.lgs. 138/2024). Il termine per
  l'adeguamento alle misure di sicurezza è **soggettivo** - diciotto mesi dalla ricezione
  della comunicazione di inserimento - non una data uguale per tutti.
- **Vigilanza sui dispositivi medici**: gli obblighi di segnalazione degli incidenti gravi
  gravano sul fabbricante ai sensi del Regolamento (UE) 2017/745.
- **Fornitori rilevanti**: i soggetti NIS devono dichiarare nominativamente all'Agenzia per
  la Cybersicurezza Nazionale i fornitori rilevanti, con Paese della sede legale e codici di
  classificazione. Il progetto fornisce la scheda con i dati necessari.

La documentazione di conformità in `docs/08_compliance/` distingue, misura per misura, cosa
fa il progetto e cosa resta in capo a chi installa.

## Sicurezza nel ciclo di sviluppo

Il progetto è in fase di progettazione e **non esiste ancora codice applicativo**. Le voci
seguenti descrivono il ciclo di sviluppo, e per ciascuna è dichiarato se è già in esercizio: un
elenco scritto al presente indicativo, in un file che chi valuta legge come dichiarazione di
fatto, sarebbe una conformità affermata senza prova. I controlli realmente eseguiti, ciascuno con
la propria fascia e la propria prova che lo vede fallire, sono elencati in
[`pipeline/collocazione-dei-controlli.tsv`](pipeline/collocazione-dei-controlli.tsv).

- **In esercizio.** Verifica dei segreti su ogni proposta di modifica.
- **In esercizio, sul solo sito di documentazione.** Distinta dei materiali software (SBOM)
  generata dalla costruzione. Sarà pubblicata a ogni rilascio - è un obbligo normativo, non una
  buona pratica - ma non esistono ancora rilasci di prodotto.
- **In esercizio.** Componenti di terze parti classificati con licenza verificata sul testo
  primario, in un registro generato dalla distinta.
- **Non in esercizio, e senza data dichiarata.** Analisi delle dipendenze contro banche dati di
  vulnerabilità note, e analisi statica del codice. Nessuna delle due gira oggi in integrazione
  continua.
- **Impegno di progetto, non ancora realizzato.** Classificazione dei componenti di terze parti
  come SOUP ai sensi della IEC 62304, con versione minima motivata. Per il server di relay la
  versione minima non è negoziabile ed è documentata insieme alla ragione.
- **Impegno di progetto, non ancora realizzato.** Registro degli accessi con catena di hash e
  conservazione separata dal sistema che genera gli eventi: il versionamento delle entità non è
  un registro immutabile.

---

# Security policy

Telemedic processes health data and is deployed in healthcare settings. A vulnerability here
is not an outage: it may expose special category data under Article 9 GDPR, or interfere
with a clinical act.

## Reporting a vulnerability

**Do not open a public issue.**

Use GitHub private reporting: the repository's **Security → Report a vulnerability** tab.
The channel is encrypted, visible only to maintainers, and allows work on a fix before
disclosure.

If private reporting is unavailable, open an **empty** issue asking only for a private
channel, with no technical detail.

### What to include

- Affected component and version.
- What the vulnerability allows, in impact terms - access to other people's data, privilege
  escalation, alteration of a clinical document, denial of service.
- How to reproduce it, with the minimum necessary.
- A proposed fix if you have one; not required.
- **No real data**, in any form. If reproduction involved a deployment holding real data,
  describe it without attaching any. If you believe real data was exposed, say so
  explicitly: it changes how the incident is handled.

### What to expect

| Stage | Indicative time |
|---|---|
| Acknowledgement | 3 working days |
| Initial assessment with severity rating | 10 working days |
| Further updates | every 15 days until closure |

These are the project's commitments to reporters. They are not the statutory notification
deadlines, which fall on the service operator and are stricter (see below).

## Coordinated disclosure

1. We agree a window before publication with the reporter, normally **90 days** from
   acknowledgement, shortened if the fix lands earlier and extended where complexity
   requires it.
2. We publish an advisory with identifier, affected versions, impact, fix and temporary
   mitigations.
3. We credit the reporter unless asked otherwise.

There is no bounty programme. We take no legal action against anyone reporting in good
faith who stays within what is needed to demonstrate the issue, does not access third party
data and does not disclose it.

### Notice to integrators of an actively exploited vulnerability

This is a **different** period from the two above, and must not be confused with them. The
three-working-day acknowledgement is a commitment towards **whoever reports**. The period below is
a commitment towards **whoever integrates Telemedic into a product of their own**, and concerns the
outbound notice.

> **We notify our integrators within 24 hours of the moment we acquire the evidence** that a
> vulnerability of the project is being actively exploited, and **immediately** when the evidence
> indicates that the exploitation is under way on installations in service. The notice is due
> **irrespective of the availability of a fix**.

The notice carries the **instant at which we acquired the evidence**, the affected component and
versions, whether the exploitation is confirmed, the temporary mitigations available and the status
of the fix. It does not carry what is needed to reproduce the attack.

The period exists for a precise reason: from **11 September 2026** the reporting obligations of
Article 14 of Regulation (EU) 2024/2847 apply - initial report within **24 hours**, notification
within 72 hours - for actively exploited vulnerabilities and serious incidents; the date of
application is set by Article 71. That obligation **does not arise for the project**, which is not
a product placed on the market in the course of a commercial activity, but it does arise for
whoever integrates it, and without a timely notice from us it cannot be met. The period declared
above is therefore a project policy commitment, not a legal obligation. The full picture, with the
five clocks and their sources, is in `docs/06_security/10-risposta-agli-incidenti.md`.

## Supported versions

Security-supported versions are listed on the releases page. The support period is stated
explicitly, as required by Regulation (EU) 2024/2847 (Cyber Resilience Act).

## Deployer obligations

This is what distinguishes Telemedic from an ordinary open source project: **the repository
is source code, not a running service.** Whoever deploys, integrates or puts it into service
assumes obligations the project cannot discharge on their behalf.

- **Personal data breach**: notification to the supervisory authority within **72 hours** of
  becoming aware (Article 33 GDPR), communication to data subjects where the risk is high
  (Article 34).
- **Incidents affecting NIS2 entities**: early warning within **24 hours**, notification
  within **72 hours**, final report within **one month** (Italian Legislative Decree
  138/2024). The deadline for implementing security measures is **entity-specific** -
  eighteen months from receipt of the inclusion notice - not a single date for everyone.
- **Medical device vigilance**: serious incident reporting obligations fall on the
  manufacturer under Regulation (EU) 2017/745.
- **Relevant suppliers**: NIS entities must declare their relevant suppliers by name to the
  national cybersecurity authority, including country of registered office and
  classification codes. The project supplies the required data sheet.

The compliance documentation in `docs/08_compliance/` states, measure by measure, what the
project does and what remains with the deployer.

## Security in the development lifecycle

The project is in the design phase and **no application code exists yet**. The entries below
describe the development lifecycle, and for each one it is stated whether it is already
operating: a list written in the present indicative, in a file that an assessor reads as a
statement of fact, would be conformity asserted without proof. The controls that actually run,
each with its lane and its proof that sees it fail, are listed in
[`pipeline/collocazione-dei-controlli.tsv`](pipeline/collocazione-dei-controlli.tsv).

- **Operating.** Secret scanning on every pull request.
- **Operating, on the documentation site only.** Software bill of materials generated by the
  build. It will be published with every release - a legal obligation, not a good practice - but
  no product releases exist yet.
- **Operating.** Third party components classified with their licence verified against the
  primary text, in a register generated from the bill of materials.
- **Not operating, and with no declared date.** Dependency analysis against known-vulnerability
  databases, and static code analysis. Neither runs in continuous integration today.
- **Project commitment, not yet built.** Classification of third party components as SOUP under
  IEC 62304, with a justified minimum version. For the relay server the minimum version is
  non-negotiable and documented together with its rationale.
- **Project commitment, not yet built.** Audit log with hash chaining and retention separate from
  the system generating the events: entity versioning is not an immutable audit trail.
