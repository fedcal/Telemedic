# Base architetturale vincolante

> **Questo documento è vincolante per ogni agente che scrive documentazione di area.**
> Serve a un solo scopo: impedire che aree scritte in parallelo descrivano architetture
> diverse. Se un'area ha bisogno di discostarsene, **non lo fa**: apre una questione nel
> proprio log, motivandola, e la decisione viene presa a valle come ADR.
>
> Ciò che è scritto qui è **decisione presa**, derivata dalla ricerca in `.telemedic/research/`
> e dalle decisioni D1-D52 di `00_PROJECT_BRIEF.md`. Ciò che non è scritto qui è **aperto**, e
> va segnalato come tale invece di essere inventato.

## 1. Contesti delimitati

Il sistema è diviso in contesti con confini espliciti. Nessun contesto accede alla base dati
di un altro: si comunica per interfaccia sincrona o per evento.

| Contesto | Responsabilità | Non è responsabile di |
|---|---|---|
| **Identità e accessi** | Autenticazione, federazione, livelli di garanzia, ruoli, deleghe | Anagrafica clinica dell'assistito |
| **Anagrafiche** | Assistiti, professionisti, organizzazioni, sedi, relazioni di ruolo | Chi può fare cosa |
| **Agenda** | Disponibilità, prenotazione, riprogrammazione, disdetta, promemoria | Cosa accade durante la prestazione |
| **Prestazione clinica** | Presa in carico, svolgimento, esiti, stato dell'atto sanitario | Trasporto audio-video |
| **Sessione media** | Segnalazione, negoziazione, qualità, registrazione, verifica della sessione | Significato clinico di ciò che accade |
| **Documentazione clinica** | Redazione, validazione, firma, versionamento, rettifica dei documenti | Invio alle infrastrutture esterne |
| **Telemonitoraggio** | Piani di rilevazione, acquisizione parametri, aderenza, valutazione soglie | Decisione clinica |
| **Notifiche e allarmi** | Recapito, escalation, presa in carico, mancato riscontro | Definizione delle soglie |
| **Consenso** | Consensi, revoche, oscuramenti, deleghe di accesso | Basi giuridiche del titolare |
| **Terminologie** | Risoluzione, validazione, espansione dei codici | Contenuto delle terminologie |
| **Interoperabilità in uscita** | FSE, sistemi terzi, trasformazioni, tentativi e ripiego | Modello canonico |
| **Tracciamento** | Registro immutabile degli accessi e delle operazioni | Logica applicativa |
| **Amministrazione tenant** | Configurazione, personalizzazioni, quote, cicli di vita | Dati clinici |

## 2. Aggregati e invarianti

- **`Encounter` (prestazione) e `MediaSession` (sessione media) sono aggregati distinti.**
  Una prestazione può avvenire senza media, con più sessioni, o con sessioni fallite; una
  sessione media può esistere per prove tecniche senza prestazione. Unirli è l'errore di
  modellazione più costoso di questo dominio.
- **Il documento clinico firmato è immutabile.** Non si modifica: si emette una versione
  successiva che sostituisce o rettifica la precedente, mantenendo la catena.
- **La misura di un parametro è immutabile** e porta con sé il proprio contesto: strumento,
  metodo, istante di rilevazione, istante di ricezione, soggetto che l'ha inserita.
- **Il consenso è un fatto con validità temporale**, non un flag booleano.
- **Il ruolo è una relazione fra persona e organizzazione con validità temporale**, non un
  attributo della persona.

## 3. Modello dati canonico

- Il modello canonico è **FHIR R4 (4.0.1)** profilato secondo le guide di implementazione
  italiane, che **prevalgono** in caso di divergenza con il modello generico.
- Il contenuto informativo dei documenti destinati al fascicolo si modella come **dataset
  canonico**; le serializzazioni (CDA2, FHIR, altro) sono **sostituibili** e non vanno
  cablate.
- `DiagnosticReport` è ammesso come **vista**, non come rappresentazione primaria dove le
  guide nazionali prescrivono `Composition`.
- Le serie temporali dei parametri sono conservate in strutture dedicate a serie temporali;
  la rappresentazione FHIR è una proiezione, non lo strumento di archiviazione.
- **Nessun identificatore esterno è chiave primaria.** Il codice fiscale è un identificatore
  con dominio di attribuzione esplicito, non una chiave.

## 4. Multi-tenancy

- Modello di riferimento: **uno schema per tenant** su una base dati condivisa, con
  **sicurezza a livello di riga come difesa in profondità**, non come unico meccanismo.
- L'installazione presso il cliente è il caso degenere a tenant unico: **stesso codice,
  stessa struttura**, nessun ramo separato.
- Il contesto di tenant è propagato esplicitamente e verificato al confine di ogni contesto.
  Nessuna interrogazione senza tenant risolto.
- Configurazione, personalizzazione di tema, terminologie abilitate, soglie e copertura
  oraria sono **per tenant**; le soglie cliniche sono **per assistito**.

## 5. Eventi e consegna

- **Outbox transazionale su PostgreSQL** come unica sorgente degli eventi in uscita; il
  broker è alimentato dall'outbox, mai da una seconda scrittura applicativa.
- Buste **CloudEvents**; consegna **almeno una volta**; ogni consumatore è **idempotente**
  per costruzione, con chiave di deduplicazione esplicita.
- L'ordine è garantito **solo** all'interno della partizione scelta per chiave; nessun
  requisito funzionale può dipendere da un ordine globale.
- Ritentativi con attesa esponenziale e jitter, coda di messaggi non elaborabili con
  procedura di riesame documentata.

## 6. Registro immutabile

- Il tracciamento degli accessi e delle operazioni è **append-only con catena di impronte**,
  conservato **separatamente** dal sistema che genera gli eventi.
- Il versionamento delle entità **non è** un registro immutabile e non può sostituirlo.
- Il registro non contiene contenuto clinico: contiene chi, cosa, quando, su quale soggetto,
  con quale esito e con quale livello di garanzia dell'autenticazione.

## 7. Terminologie

- **Gateway unico** verso le terminologie, con disattivazione per sistema di codifica.
- **Nessuna cache persistita su disco** per i sistemi la cui licenza non consente derivati.
- Il sistema è **pienamente funzionale senza SNOMED CT**: nessun percorso principale può
  richiederlo.
- Ogni `CodeableConcept` porta `system` esplicito. Le stringhe di interfaccia del progetto
  sono separate architetturalmente da `Coding.display`.

## 8. Identità e autorizzazione

- Prodotto di federazione con **realm distinti** e un **realm broker** come unico punto di
  contatto verso la federazione nazionale.
- **SPID in SAML 2.0**, **CIE anche in OpenID Connect**, **TS-CNS con autenticazione a
  certificato**. Il progetto è conforme e verificabile, **non accreditato**.
- Il livello di garanzia viaggia in `acr` e va **marcato** per distinguere l'autenticazione
  eseguita dal sistema da quella riferita da un integratore.
- Autorizzazione **basata su ruoli con estensioni per attributi**; procedura di accesso
  d'emergenza tracciata come requisito, non come eccezione.

## 9. Media in tempo reale

- Punto a punto con cifratura fino agli estremi come **modalità predefinita**; la modalità
  con registrazione lato server è **distinta, dichiarata nel consenso e segnalata in modo
  persistente nell'interfaccia**.
- **Stringa di autenticazione breve obbligatoria per impostazione predefinita.**
- Server di relay con **versione minima 4.17.2** e **isolamento di rete in uscita come difesa
  primaria**; le liste di indirizzi vietati sono difesa in profondità.
- Contenitore di registrazione **negoziato a runtime**, mai assunto.
- Degradazione: **audio prima del video**, sempre.

## 10. Interfacce

- Facciata **FHIR R4 REST** per l'interoperabilità; **API REST di progetto** descritta in
  **OpenAPI 3.1** per le funzioni non coperte da FHIR.
- Quattro modalità di integrazione supportate: servizio autonomo, interfacce applicative,
  componente incorporabile, moduli sostituibili.
- Webhook firmati; deprecazione annunciata con intestazioni standard; concorrenza ottimistica
  con validatori.
- Ogni interfaccia pubblica ha un contratto versionato e prove a contratto.

## 11. Vincoli trasversali non negoziabili

1. **Nessuna soglia clinica cablata nel codice.**
2. **Nessun dato reale** in codice, prove, esempi, registri o documentazione.
3. **Nessun componente obbligatorio del percorso principale** dipendente da servizi non
   sostituibili o stabiliti fuori dall'Unione europea.
4. **Mobile first e accessibilità** come requisiti funzionali, verificati in automatico e a
   mano.
5. **Tracciabilità requisito → progettazione → codice → prova**, con identificativi congelati.
6. **Inventario dei componenti di terze parti e distinta dei materiali** generati dalla prima
   pipeline.
7. **L'assenza di dato è informazione**: il silenzio non è mai trattato come normalità.

## 12. Comunicazione fra agenti - obbligatoria

Nessun agente lavora slegato. `05_BACHECA_INTERAGENTI.md` è il canale: si legge all'inizio,
si risponde alle questioni indirizzate alla propria area, si aprono le proprie, si dichiarano
i vincoli che si impongono ad altri. Il protocollo completo è in testa a quel file. Una scelta
che vincola un'altra area e non è scritta in bacheca **non esiste** e verrà contraddetta.

## 13. Convenzioni per la documentazione di area

- Un file `README.md` o `00-indice.md` per area, poi documenti numerati.
- Frontmatter YAML: `title`, `sidebar_position`, `description`.
- Ogni affermazione normativa o tecnica **cita la fonte** con precisione.
- Ciò che non è verificato si marca **`[NV]`** e si dichiara a chi va chiesto. **Non si
  inventa.**
- Distinguere sempre «la norma stabilisce» / «è prassi» / «è una proposta del progetto».
- Diagrammi in **Mermaid**. Blocchi di codice con linguaggio dichiarato. Solo dati sintetici.
- Rinvii ai moduli della guida in `docs/10_fondamenti/` per i fondamenti, **senza ripeterli**.
- **Regola R0**: mai nominare aziende, marchi, prodotti commerciali o domini di potenziali
  partner.
