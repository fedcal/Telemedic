# Contribuire a Telemedic

Grazie per l'interesse. Prima di aprire una issue o una pull request, leggi questa pagina
per intero: Telemedic tratta dati sanitari e ricade nella disciplina dei dispositivi medici,
quindi alcune regole che altrove sono buone pratiche qui sono vincoli.

*[English version below](#contributing-to-telemedic)*

---

## Prima di scrivere codice

**La [guida dei fondamenti](docs/10_fondamenti/00-come-usare-questa-guida.md) è un
prerequisito, non una lettura consigliata.** Parte da zero e copre il contesto sanitario, i
protocolli, gli standard e il quadro regolatorio. Il modulo
[«Contribuire, area per area»](docs/10_fondamenti/18-contribuire-per-area.md) dice,
area per area, quali conoscenze servono prima di toccarla.

Non è un adempimento burocratico. Un sistema clinico accumula danni silenziosi quando viene
modificato da chi non conosce il contesto: un campo rinominato può rompere l'alimentazione
del Fascicolo Sanitario Elettronico, una validazione allentata può far passare un documento
non conforme, un valore predefinito «ragionevole» può essere clinicamente sbagliato.

## Le cinque regole non negoziabili

### 1. Nessun dato reale. Mai.

Non devono comparire dati di persone reali - nemmeno parziali, nemmeno pseudonimizzati -
in issue, pull request, log, screenshot, dataset di test, messaggi di commit o esempi di
documentazione. Vale anche per i tuoi dati.

Un dato sintetico non basta che sia inventato: deve essere **non valido per costruzione**, cioè
riconoscibile come finto da una verifica, non solo dall'occhio di chi lo legge. Le tre regole,
verificate da `scripts/verifica-dati-sintetici.sh` a ogni invio:

- **Codice fiscale, tessera sanitaria, partita IVA, IBAN**: il carattere o la cifra di controllo
  dev'essere **deliberatamente errato**. `RSSMRA80A01H501Z` va bene perché la verifica lo scarta;
  lo stesso codice con il carattere corretto no, perché è attribuibile a una persona reale anche
  se nessuno l'ha copiato da un archivio.
- **Indirizzi di posta elettronica**: solo domini riservati - `.invalid`, `.test`, `.example`,
  `example.com`. Mai un dominio registrabile, e mai una casella su un servizio di posta al
  consumo, che appartiene sempre a una persona fisica.
- **Numeri di telefono**: l'Italia non ha un intervallo riservato alla documentazione, quindi la
  convenzione è debole e va rispettata con più attenzione, non meno: cifre di utente tutte uguali
  o in progressione.

Il progetto **non ha ancora generatori automatici**: finché non esistono, le tre regole qui sopra
sono la convenzione, e il controllo è ciò che la fa rispettare. Se hai bisogno di un caso
realistico che non sai costruire, apri una issue e lo costruiamo insieme: non incollarne uno vero.

Un recapito reale che il progetto pubblica per obbligo - l'intestazione della chiave di firma, per
esempio - si dichiara sulla riga stessa con `dato-reale-consentito: <motivo>`. Vale solo per posta
e telefono, **mai** per codice fiscale, tessera, partita IVA e IBAN.

Se ti accorgi di aver pubblicato un dato reale, **non limitarti a modificare il messaggio**:
la cronologia resta. Segui subito la procedura di [SECURITY.md](SECURITY.md): va gestito come un incidente.

### 2. Nessun contenuto SNOMED CT nel repository. E nessun download.

La licenza SNOMED CT impone che il contenuto non sia consultabile né scaricabile se non da
utenti autorizzati: è incompatibile con un repository pubblico. L'accordo si perfeziona
**scaricando o accedendo** al contenuto, quindi la posizione del progetto regge solo finché
nessuno lo scarica.

In concreto:

- non aggiungere file di release SNOMED CT (RF2 o altro formato) al repository, nemmeno in
  directory ignorate, nemmeno «solo per provare in locale»;
- non incorporare descrizioni di concetti SNOMED negli esempi, nei test o nei value set;
- puoi usare **codice e URI di sistema** (`http://snomed.info/sct`) in un `Coding`: è l'uso
  per riferimento, ed è quello che il progetto adotta;
- l'espansione dei value set è delegata a un terminology server configurato da chi installa.

Un controllo automatico in integrazione continua (*terminology guard*) blocca le pull
request che introducono contenuto terminologico a licenza incompatibile. Se lo vedi fallire
e credi sia un falso positivo, non aggirarlo: aprine discussione nella pull request.

Lo stesso vale per **ATC/DDD**, **ICD-10** e **ICD-11**, esclusi in ogni forma. Le
**traduzioni LOINC** sono opere derivate di Regenstrief: le stringhe italiane
dell'interfaccia non vanno mai confuse con `Coding.display`. Il quadro completo è in
[`THIRD-PARTY-TERMINOLOGY.md`](THIRD-PARTY-TERMINOLOGY.md).

### 3. Nessun segreto nel codice

Chiavi, certificati, password, token, credenziali del server di relay: solo variabili
d'ambiente o gestore di segreti, sempre. Il `.gitignore` esclude le estensioni più comuni,
ma non è una rete di sicurezza: è un promemoria.

Negli esempi di configurazione usa segnaposto espliciti (`${TURN_STATIC_AUTH_SECRET}`), mai
valori che sembrino reali.

### 4. Le modifiche a rischio clinico richiedono tracciabilità

Il progetto produce il materiale regolatorio di Classe IIa. Alcune aree hanno vincoli di
gestione della configurazione ai sensi della IEC 62304:

- logica di soglia e generazione di allarmi nel telemonitoraggio;
- contenuto e struttura dei documenti clinici destinati al Fascicolo;
- consenso, identificazione e livello di garanzia dell'autenticazione;
- registrazione degli accessi e tracciamento;
- cifratura del media e verifica della sessione.

Se tocchi una di queste aree, il modello di pull request te lo chiederà esplicitamente. Non
significa che il contributo sia sgradito: significa che serve una descrizione dell'impatto,
e che la revisione coinvolgerà anche il fronte regolatorio.

### 5. Accessibilità e mobile first come requisiti, non come rifinitura

Nessuna funzionalità è completa se non è utilizzabile da un paziente anziano su smartphone
in rete mobile e da un professionista con la sola tastiera e uno screen reader. La verifica
automatizzata intercetta una minoranza dei difetti di accessibilità: serve anche la prova
manuale con tecnologie assistive.

## Come contribuire

### Segnalare un problema

Usa i modelli di issue. Scegli quello giusto: bug, richiesta di funzionalità, integrazione,
documentazione. Le vulnerabilità di sicurezza **non** si segnalano con una issue pubblica -
vedi [SECURITY.md](SECURITY.md).

Una buona segnalazione contiene: cosa ti aspettavi, cosa è successo, come riprodurlo,
versione e ambiente. Per i problemi di comunicazione audio-video aggiungi il tipo di rete,
il browser e - se disponibili - le statistiche della sessione, private dei dati identificativi.

### Proporre una modifica

1. Apri prima una issue per le modifiche non banali. Concordare l'approccio prima di
   scrivere codice fa risparmiare tempo a tutti.
2. Lavora su un ramo dedicato, partendo da `main`.
3. Scrivi i test **prima** dell'implementazione. La copertura minima è dell'80%, ma la
   soglia non è l'obiettivo: l'obiettivo è che il comportamento sia specificato.
4. Verifica in locale prima di aprire la pull request: build, test, controlli statici,
   validazione delle risorse FHIR, controllo delle terminologie, verifica di accessibilità.
5. Compila il modello di pull request. Le caselle non sono decorative.

### Messaggi di commit

Formato convenzionale: `<tipo>: <descrizione>`, con tipo fra `feat`, `fix`, `refactor`,
`docs`, `test`, `chore`, `perf`, `ci`.

Descrizione in italiano, all'infinito o all'indicativo presente, senza punto finale.
Il corpo del messaggio spiega **perché**, non cosa: il cosa si legge nel diff.

### Origine del contributo

Ogni commit deve essere firmato con il *Developer Certificate of Origin*, aggiungendo
`Signed-off-by:` con `git commit -s`. Dichiari così di avere il diritto di conferire il
contributo con la licenza del progetto. Non è richiesta la cessione dei diritti d'autore.

## Stile del codice

- **Immutabilità**: si creano oggetti nuovi, non si modificano quelli esistenti.
- **File piccoli e coesi**: 200–400 righe tipiche, 800 come limite.
- **Errori gestiti esplicitamente** a ogni livello, con messaggi comprensibili
  nell'interfaccia e contesto completo nei log del server. Mai ingoiare un errore in
  silenzio.
- **Validazione ai confini del sistema**: nessun dato esterno è affidabile, incluse le
  risposte delle API di terzi.
- **Nessun valore cablato**: costanti o configurazione.

## Lingua

La documentazione è bilingue: **italiano** come lingua primaria, **inglese** completo. Il
codice, gli identificatori e i messaggi tecnici sono in inglese. I messaggi rivolti
all'utente sono internazionalizzati, mai cablati.

Puoi contribuire in inglese: se non scrivi in italiano, apri comunque la pull request e ci
occuperemo noi della versione italiana.

## Codice di condotta

Vale il [Codice di Condotta](CODE_OF_CONDUCT.md) in ogni spazio del progetto.

---

# Contributing to Telemedic

Thank you for your interest. Please read this page in full before opening an issue or a
pull request: Telemedic processes health data and falls within medical device regulation,
so some rules that are good practice elsewhere are hard constraints here.

## Before writing code

**The [foundations guide](docs/10_fondamenti/00-come-usare-questa-guida.md) is a
prerequisite, not recommended reading.** It starts from zero and covers the healthcare
context, the protocols, the standards and the regulatory framework. The module
[«Contributing, area by area»](docs/10_fondamenti/18-contribuire-per-area.md)
states, area by area, what knowledge is required before touching it.

This is not bureaucracy. Clinical systems accumulate silent damage when modified by people
who do not know the context: a renamed field can break the national health record feed, a
relaxed validation can let a non-conformant document through, a «reasonable» default can be
clinically wrong.

## The five non-negotiable rules

### 1. No real data. Ever.

No data about real people - not partial, not pseudonymised - may appear in issues, pull
requests, logs, screenshots, test datasets, commit messages or documentation examples. This
includes your own data.

Synthetic data must not merely be made up: it must be **invalid by construction**, that is,
recognisable as fake by a check, not only by the eye of whoever reads it. The three rules, enforced
by `scripts/verifica-dati-sintetici.sh` on every push:

- **Italian tax code, health card number, VAT number, IBAN**: the check character or digit must be
  **deliberately wrong**. `RSSMRA80A01H501Z` is acceptable because verification rejects it; the same
  code with the correct character is not, because it is attributable to a real person even if
  nobody copied it from a record.
- **Email addresses**: reserved domains only - `.invalid`, `.test`, `.example`, `example.com`.
  Never a registrable domain, and never a mailbox on a consumer mail service, which always belongs
  to a natural person.
- **Telephone numbers**: Italy has no range reserved for documentation, so the convention is weak
  and must be respected with more care, not less: subscriber digits all identical or in sequence.

The project **does not yet have automated generators**: until it does, the three rules above are the
convention, and the check is what enforces them. If you need a realistic case you cannot build, open
an issue and we will build it together - do not paste a real one.

A real contact detail the project publishes out of obligation - the signing key identity, for
instance - is declared on the line itself with `dato-reale-consentito: <reason>`. This applies to
email and telephone only, **never** to tax code, health card, VAT number or IBAN.

If you realise you have published real data, **do not simply edit the message**: history
persists. Follow the [SECURITY.md](SECURITY.md) procedure immediately: it is handled as an incident.

### 2. No SNOMED CT content in the repository. And no downloads.

The SNOMED CT licence requires that content cannot be accessed or downloaded except by
authorised users: this is incompatible with a public repository. The agreement is entered
into by **downloading or accessing** the content, so the project's position holds only as
long as nobody downloads it.

Concretely:

- do not add SNOMED CT release files (RF2 or any format) to the repository, not even in
  ignored directories, not even «just to try locally»;
- do not embed SNOMED concept descriptions in examples, tests or value sets;
- you may use **codes and the system URI** (`http://snomed.info/sct`) in a `Coding`: this is
  use by reference, and it is what the project adopts;
- value set expansion is delegated to a terminology server configured by the deployer.

An automated *terminology guard* in continuous integration blocks pull requests introducing
terminology content under an incompatible licence. If it fails and you believe it is a false
positive, do not bypass it: raise it in the pull request.

The same applies to **ATC/DDD**, **ICD-10** and **ICD-11**, excluded in all forms. **LOINC
translations** are derivative works assigned to Regenstrief: the project's Italian interface
strings must never be conflated with `Coding.display`. The full picture is in
[`THIRD-PARTY-TERMINOLOGY.md`](THIRD-PARTY-TERMINOLOGY.md).

### 3. No secrets in code

Keys, certificates, passwords, tokens, relay server credentials: environment variables or a
secret manager, always. The `.gitignore` excludes the most common extensions, but it is a
reminder, not a safety net.

In configuration examples use explicit placeholders (`${TURN_STATIC_AUTH_SECRET}`), never
values that look real.

### 4. Clinically sensitive changes require traceability

The project produces Class IIa regulatory material. Some areas carry configuration
management constraints under IEC 62304:

- threshold logic and alarm generation in remote monitoring;
- content and structure of clinical documents destined for the national health record;
- consent, identification and authentication assurance level;
- access logging and audit trail;
- media encryption and session verification.

If you touch one of these areas, the pull request template will ask explicitly. This does
not mean the contribution is unwelcome: it means an impact description is required, and the
review will also involve the regulatory side.

### 5. Accessibility and mobile first are requirements, not polish

No feature is complete unless it can be used by an elderly patient on a smartphone over a
mobile network, and by a professional using only a keyboard and a screen reader. Automated
checks catch a minority of accessibility defects: manual testing with assistive technology
is also required.

## How to contribute

### Reporting a problem

Use the issue templates and pick the right one: bug, feature request, integration,
documentation. Security vulnerabilities are **not** reported through public issues - see
[SECURITY.md](SECURITY.md).

A good report states what you expected, what happened, how to reproduce it, the version and
the environment. For audio-video problems, add the network type, the browser and - if
available - the session statistics, stripped of identifying data.

### Proposing a change

1. Open an issue first for non-trivial changes. Agreeing on the approach before writing code
   saves everyone time.
2. Work on a dedicated branch off `main`.
3. Write tests **before** the implementation. Minimum coverage is 80%, but the threshold is
   not the goal: the goal is that behaviour is specified.
4. Verify locally before opening the pull request: build, tests, static analysis, FHIR
   resource validation, terminology guard, accessibility checks.
5. Fill in the pull request template. The checkboxes are not decorative.

### Commit messages

Conventional format: `<type>: <description>`, with type among `feat`, `fix`, `refactor`,
`docs`, `test`, `chore`, `perf`, `ci`.

The body explains **why**, not what: the what is in the diff.

### Origin of the contribution

Every commit must be signed off under the *Developer Certificate of Origin*, adding
`Signed-off-by:` via `git commit -s`. You thereby state that you have the right to submit
the contribution under the project's licence. No copyright assignment is required.

## Code style

- **Immutability**: create new objects, do not mutate existing ones.
- **Small, cohesive files**: 200–400 lines typical, 800 maximum.
- **Errors handled explicitly** at every level, with understandable messages in the user
  interface and full context in server logs. Never swallow an error silently.
- **Validation at system boundaries**: no external data is trustworthy, including third
  party API responses.
- **No hardcoded values**: constants or configuration.

## Language

Documentation is bilingual: **Italian** primary, **English** complete. Code, identifiers and
technical messages are in English. User-facing messages are internationalised, never
hardcoded.

You may contribute in English: if you do not write Italian, open the pull request anyway and
we will handle the Italian version.

## Code of conduct

The [Code of Conduct](CODE_OF_CONDUCT.md) applies in every project space.
