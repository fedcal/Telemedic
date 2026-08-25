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
- Cosa consente di fare la vulnerabilità, in termini di impatto — accesso a dati altrui,
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
  l'adeguamento alle misure di sicurezza è **soggettivo** — diciotto mesi dalla ricezione
  della comunicazione di inserimento — non una data uguale per tutti.
- **Vigilanza sui dispositivi medici**: gli obblighi di segnalazione degli incidenti gravi
  gravano sul fabbricante ai sensi del Regolamento (UE) 2017/745.
- **Fornitori rilevanti**: i soggetti NIS devono dichiarare nominativamente all'Agenzia per
  la Cybersicurezza Nazionale i fornitori rilevanti, con Paese della sede legale e codici di
  classificazione. Il progetto fornisce la scheda con i dati necessari.

La documentazione di conformità in `docs/08_compliance/` distingue, misura per misura, cosa
fa il progetto e cosa resta in capo a chi installa.

## Sicurezza nel ciclo di sviluppo

- Distinta dei materiali software (SBOM) pubblicata a ogni release: è un obbligo normativo,
  non una buona pratica.
- Analisi delle dipendenze e delle vulnerabilità note in integrazione continua.
- Analisi statica e verifica dei segreti su ogni pull request.
- Componenti di terze parti classificati come SOUP ai sensi della IEC 62304, con versione
  minima motivata. Per il server di relay la versione minima non è negoziabile ed è
  documentata insieme alla ragione.
- Registro degli accessi con catena di hash e conservazione separata dal sistema che genera
  gli eventi: il versionamento delle entità non è un registro immutabile.

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
- What the vulnerability allows, in impact terms — access to other people's data, privilege
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
  138/2024). The deadline for implementing security measures is **entity-specific** —
  eighteen months from receipt of the inclusion notice — not a single date for everyone.
- **Medical device vigilance**: serious incident reporting obligations fall on the
  manufacturer under Regulation (EU) 2017/745.
- **Relevant suppliers**: NIS entities must declare their relevant suppliers by name to the
  national cybersecurity authority, including country of registered office and
  classification codes. The project supplies the required data sheet.

The compliance documentation in `docs/08_compliance/` states, measure by measure, what the
project does and what remains with the deployer.

## Security in the development lifecycle

- Software bill of materials published with every release: a legal obligation, not a good
  practice.
- Dependency and known-vulnerability analysis in continuous integration.
- Static analysis and secret scanning on every pull request.
- Third party components classified as SOUP under IEC 62304, with a justified minimum
  version. For the relay server the minimum version is non-negotiable and documented
  together with its rationale.
- Audit log with hash chaining and retention separate from the system generating the events:
  entity versioning is not an immutable audit trail.
