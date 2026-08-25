# TELEMEDIC — CONTEXT PACK CONDIVISO (v1)

> **Documento di riferimento per tutti gli agenti.** Ogni agente DEVE leggerlo prima di
> iniziare e DEVE scrivere il proprio output nel percorso assegnato. Non contraddire
> le decisioni qui elencate: sono state approvate dal committente.

## 1. Identità del progetto

- **Nome**: Telemedic
- **Owner**: Federico Calò (fedcal) — https://federicocalo.dev
- **Repository**: https://github.com/fedcal/Telemedic (remote `git@github.com:fedcal/Telemedic.git`)
- **Pagina pubblica**: https://federicocalo.dev/it/open-source/telemedic
- **Stato attuale**: repository VUOTO, branch `master`, zero commit. Green-field totale.
- **Categoria**: Healthcare / Telemedicina
- **Descrizione ufficiale**: piattaforma di telemedicina open source per consulti video
  medico–paziente con qualità clinica, tracciabilità conforme ai requisiti UE e filosofia
  di *sovereign telemedicine* (i dati clinici non transitano per server US-based).

## 2. Stack dichiarato pubblicamente (vincolante)

| Layer | Tecnologia |
|---|---|
| Backend | Spring Boot 3.4, Java 21 |
| Frontend | Angular 21 (standalone components) |
| Media | WebRTC peer-to-peer, DTLS-SRTP |
| NAT traversal | coturn (STUN/TURN) |
| Interoperabilità | FHIR R4 |
| IAM | Keycloak (SSO, OIDC) |
| Metriche | TimescaleDB |
| Audit | Hibernate Envers (tabelle `_aud`) |
| Packaging | Docker Compose |
| Documentazione | Docusaurus |

Target di latenza media: **< 200 ms**.

## 3. Feature dichiarate sul sito (da preservare e approfondire)

1. **WebRTC peer-to-peer HD** — signaling Spring Boot, ICE candidate exchange, STUN/TURN
   configurabili, fallback relay se il P2P fallisce, bitrate adattivo.
2. **Cifratura DTLS-SRTP end-to-end** — media cifrato peer-to-peer, nessuna decifratura
   intermedia, key rotation per sessione, cipher FIPS 140-2 compliant.
3. **Integrazione FHIR R4 Encounter** — mapping automatico risorse cliniche, integrazione EHR.
   Risorse citate: Encounter (a inizio sessione), DiagnosticReport (a fine sessione),
   Practitioner, Patient, Observation.
4. **Keycloak SSO** — due realm (clinic + patient), OIDC standard, SPID/CIE.
5. **Audit log immutabile** — Envers su Encounter: durata sessione, esito, motivo cancellazione.
6. **Recording opzionale cifrato** — consenso esplicito del paziente via UI dedicata,
   MP4 cifrato a riposo, retention configurabile.
7. **Metriche qualità su TimescaleDB** — RTT, packet loss, jitter, bitrate medio per sessione,
   dashboard Grafana-ready, alert su soglia.
8. **Frontend WCAG 2.1 AA** — screen reader, navigazione da tastiera, contrasto verificato,
   supporto reduced motion.

## 4. Casi d'uso target

- Cliniche specialistiche (cardiologia, psichiatria, dermatologia)
- Mutue e assicurazioni sanitarie
- Telemedicina pubblica regionale (ASL/USL)
- Studi medici associati

## 5. DECISIONI APPROVATE DAL COMMITTENTE (non negoziabili)

| # | Ambito | Decisione |
|---|---|---|
| D1 | **Licenza** | **Apache-2.0** (NON EUPL-1.2, che il sito riportava). Motivazione: EUPL-1.2 è copyleft forte con clausola di comunicazione al pubblico e impedirebbe l'integrazione nel SaaS proprietario del partner. Apache-2.0 include il grant esplicito di brevetti. Serve NOTICE, DCO/CLA e policy sui contributi. |
| D2 | **Documentazione** | Esaustiva e approfondita per ciascuna delle 7 aree, organizzata in capitoli specifici. Priorità alla profondità reale e all'analisi puntuale, MAI al riempitivo. Ogni area è una directory con più capitoli. |
| D3 | **Lingue** | **Italiano lingua primaria**, inglese traduzione completa. README.md bilingue. Docusaurus i18n `it` (default) + `en`. |
| D4 | **Integrazione** | TUTTE e quattro: (a) REST + FHIR R4 API + webhook; (b) embed white-label iframe/Web Component; (c) SDK client Java + TypeScript; (d) HL7 v2 + SMART on FHIR + profili IHE. |
| D5 | **Scope novembre 2026** | **v1.0 completo, senza tagli, interamente testato.** Deadline: 30 novembre 2026. Oggi è 25 agosto 2026 → ~14 settimane. |
| D6 | **MDR** | **Percorso MDR 2017/745 Classe I completo**: fascicolo tecnico, ISO 13485, IEC 62304, ISO 14971, IEC 62366-1, IEC 82304-1, dichiarazione CE, registrazione EUDAMED, PMS/PSUR, PRRC. |
| D7 | **Documentazione online** | **Docusaurus**, deploy su GitHub Pages (primario) + mirror Read the Docs via `build.commands` in `.readthedocs.yaml`. |
| D8 | **Deployment/tenancy** | **Doppio modello**: SaaS multi-tenant (isolamento con Row Level Security / schema-per-tenant) E on-premise single-tenant (Docker Compose + Helm chart). Architettura tenant-aware fin dall'origine. |
| D9 | **Identità digitale** | **SPID e CIE dentro la v1.0** (anticipati rispetto al Q1 2027 dichiarato sul sito). Integrazione via Keycloak: SAML2 per SPID, OIDC per CIE ID. Considerare TS-CNS. |
| D10 | **Testing** | Tutti i livelli: unit + integration (coverage ≥ 80% enforced in CI), E2E Playwright + WebRTC quality testing (fake media devices, simulazione packet loss/jitter, verifica fallback TURN), security testing (SAST/DAST, CodeQL, OWASP ZAP, SBOM CycloneDX, threat model STRIDE, pentest esterno), load/soak (k6 o Gatling) e tracciabilità requisiti↔test per IEC 62304. |
| D11 | **GitHub** | Autorizzate TUTTE le azioni: commit, branch, push, issue, milestone, label, GitHub Project, PR, GitHub Pages. **Da eseguire SOLO dopo approvazione esplicita del committente.** |


## 5-bis. DECISIONI INTEGRATIVE (seconda tornata, dopo la fase di ricerca)

| # | Ambito | Decisione |
|---|---|---|
| **D12** | **Classificazione MDR — SOSTITUISCE D6** | **Il telemonitoraggio è INCLUSO nel perimetro e si accetta la classificazione in Classe IIa.** Conseguenze vincolanti: serve un **Organismo Notificato**; il sistema di gestione qualità **ISO 13485 deve essere certificato**, non solo implementato; serve valutazione clinica ai sensi dell'art. 61 e dell'Allegato XIV; la procedura di valutazione della conformità è quella dell'Allegato IX (o X+XI). **La marcatura CE non è ottenibile entro il 30 novembre 2026**: a quella data il traguardo realistico è software completo, testato e con fascicolo tecnico avviato. La documentazione non deve mai lasciare intendere che il prodotto sia marcato CE prima che lo sia. Copre tutti e quattro i servizi minimi del DM 21 settembre 2022. |
| **D13** | **Modello dati FHIR** | **Implementation Guide di HL7 Italia come profilo predefinito** (`Televisita`, `Teleconsulto`, `Teleassistenza`, `Telemonitoraggio`, `IT-Core`, tutte su FHIR R4 4.0.1). Il referto è una **`Composition`** dentro un `Bundle`, conforme a `CompositionRefertoTelevisita`. **`DiagnosticReport` è mantenuto come proiezione in sola lettura** per gli integratori che lo attendono, mai come artefatto primario. Le IG sono in stato draft 0.2.0: serve una policy di pinning delle versioni e un processo di ricontrollo. |
| **D14** | **Perimetro funzionale** | **Componente integrabile con moduli propri.** Telemedic implementa i micro-servizi specifici (videoconferencing, patient onboarding, motore di workflow, eventi e notifiche, chat, condivisione documenti, second opinion) **e** dispone di moduli propri per refertazione/firma, agenda e fatturazione. Tali moduli sono però **disattivabili e sostituibili per configurazione**: quando esiste un modulo regionale o dell'integratore, il sistema si integra invece di duplicare, come impone il DM 21 settembre 2022 nel contesto delle infrastrutture regionali. Nessuna funzionalità è raggiungibile solo dalla UI (vincolo V3). |
| **D15** | **Event broker** | **Apache Kafka**, preceduto da un **outbox transazionale su PostgreSQL**: l'evento di dominio è scritto nella stessa transazione del dato e pubblicato da un relay, così non esistono eventi persi né eventi fantasma. Per l'on-premise si adotta Kafka in **modalità KRaft a nodo singolo** per contenere il peso operativo. L'astrazione di pubblicazione resta dietro un'interfaccia di progetto, così da non incastrare il codice di dominio nel broker. |
| **D16** | **Rilascio e marcatura CE** | Il **30 novembre 2026** consegna software completo, testato e documentato, con **fascicolo tecnico avviato** e sistema di gestione qualità in esercizio. La **marcatura CE è una milestone autonoma nel 2027**. Fino a quel momento ogni artefatto distribuito dichiara esplicitamente: *«non ancora marcato CE, non utilizzabile per l'erogazione di prestazioni sanitarie su pazienti reali»*. Nessun documento, pagina o messaggio può lasciare intendere il contrario. |
| **D17** | **Fabbricante — modello duale** | Il **repository pubblico è codice sorgente sotto Apache-2.0, non un dispositivo medico**, e lo dichiara. Il dispositivo è una **distribuzione identificata**, prodotta da build riproducibile e sottoposta a controllo qualità, con un fabbricante preciso, un PRRC e una registrazione EUDAMED. I due artefatti hanno nomi, numeri di versione e cicli di vita distinti. La documentazione deve rendere questa distinzione evidente e non equivocabile: è ciò che protegge insieme la comunità e l'utilizzatore. |
| **D18** | **Identity chaining — difesa a strati** | Non si dipende dalla funzione in *preview* di Keycloak. Il **token exchange è implementato nel gateway di Telemedic**: validazione del token dell'integratore, emissione del token interno, **delega sempre rappresentata con il claim `act` (RFC 8693 §4.1), mai impersonificazione**. Ripiego indipendente: **token d'ingresso a uso singolo, scadenza brevissima, emesso back-channel** e mai transitante per l'URL. **Spike di verifica nella prima settimana di sviluppo**, prima di ogni altra attività. Trattandosi di codice di sicurezza critico, è sottoposto a **revisione esterna indipendente** e a test di abuso dedicati. |
| **D19** | **Claim pubblici — riformulazioni approvate** | `FIPS 140-2` → rimosso, sostituito da ETSI TS 119 312 / SOG-IS / linee guida AgID-ACN. `end-to-end` → mantenuto ma **condizionato alla verifica indipendente delle chiavi**, con la condizione dichiarata. `peer-to-peer` → «cifrato end-to-end, **instradato direttamente quando la rete lo consente**». `latenza < 200 ms` → da promessa a **metrica misurata, registrata e notificata**, con le soglie dichiarate. `key rotation per session` → «**materiale crittografico generato ex novo per ogni sessione, senza riuso**». Va inoltre predisposto il testo aggiornato della pagina pubblica. |
| **D20** | **Deliverable: percorso di certificazione** | La documentazione deve contenere una **guida operativa alla certificazione**: quali certificazioni servono, in quale ordine, con quali prerequisiti, presso chi, con quali tempi e costi stimati, quali documenti produrre e in quale momento del ciclo di sviluppo. Deve essere un percorso eseguibile con date, non una rassegna normativa. Collocazione: `docs/08_compliance/`. |
| **D21** | **Telemonitoraggio** | Perimetro: **ingestione di misure da un gateway di terze parti** (FHIR `Observation`, `Device`, `DeviceMetric`) **più inserimento manuale da parte del paziente o del caregiver più questionari strutturati (PROM)**. Telemedic **non dialoga direttamente con i dispositivi medici** e non si assume responsabilità sull'accuratezza della catena di misura hardware: acquisisce, applica il piano di monitoraggio, valuta le soglie, genera allerte e le sottopone a revisione clinica. La soglia e l'allerta sono **configurate dal professionista**, mai dedotte dal sistema (vincolo V2). |
| **D22** | **Verifica delle chiavi (SAS)** | **Short Authentication String obbligatoria per impostazione predefinita.** Codice breve derivato dalle fingerprint DTLS, confrontato a voce dai due interlocutori all'avvio della sessione. È al tempo stesso ciò che rende dimostrabile l'end-to-end e un controllo di rischio tracciabile ai sensi di ISO 14971. **Requisiti di accessibilità vincolanti**: leggibile da screen reader, mai veicolata dal solo colore, comprensibile a un paziente anziano o poco alfabetizzato digitalmente, con procedura definita in caso di mancata corrispondenza. |
| **D23** | **Registrazione della sessione — server-side, con conseguenze dichiarate** | La registrazione avviene **lato server**, per garantirne l'affidabilità indipendentemente dal dispositivo e dal carico di CPU del paziente. **Conseguenza inderogabile: quando la registrazione è attiva la cifratura viene terminata sul server e la sessione NON è end-to-end.** Ne discende un'architettura a due modalità: (a) **modalità predefinita, senza registrazione** — media cifrato end-to-end, instradato direttamente quando la rete lo consente, SAS che verifica l'interlocutore; (b) **modalità con registrazione, attivabile solo con consenso esplicito del paziente** — il media transita per il componente di registrazione. Obblighi che ne derivano: l'**informativa di consenso deve dichiarare esplicitamente** che la sessione non è più end-to-end; l'interfaccia deve segnalare lo stato di registrazione in modo **persistente e non occultabile** per tutta la durata; il passaggio fra le due modalità è tracciato nell'audit; il **file è cifrato a riposo** con chiavi per tenant e retention configurabile. Formato contenitore da confermare in base al supporto reale, non al claim pubblico. |
| **D24** | **Deployment e accessibilità** | **Tre profili documentati e supportati**: (a) Unione Europea, (b) territorio italiano, (c) cloud qualificato ACN o Polo Strategico Nazionale. **Nessuna dipendenza di runtime può impedire il profilo più restrittivo.** Accessibilità: **WCAG 2.1 AA integrale con una sola non-conformità dichiarata sul criterio 1.2.4 (sottotitoli in tempo reale)**, con l'interprete come misura alternativa e il canale dati dei sottotitoli comunque definito e versionato nel protocollo, per innestare in futuro un motore di trascrizione senza riprogettare. La dichiarazione di accessibilità segue il modello AgID ed è formulata secondo EN 301 549. |
| **D25** | **Usabilità, accessibilità e mobile first — VINCOLO TRASVERSALE** | Requisito di **tutto il sistema**, non di una parte: interfaccia paziente, interfaccia clinica, pannelli di amministrazione, componenti incorporabili, documentazione, messaggi di errore, notifiche. Non è una rifinitura finale ma un criterio di accettazione di ogni singola schermata. |

### Conseguenze di D12 da recepire in tutta la documentazione

1. Il progetto è **software dispositivo medico di Classe IIa**. Cade l'autocertificazione.
2. Serve identificare con chiarezza **chi è il fabbricante** (questione A2, ancora aperta): un progetto open source con contributori esterni non può avere un fabbricante indeterminato.
3. **IEC 62304**: la classe di sicurezza del software va determinata formalmente (A/B/C) e i processi richiesti seguono di conseguenza. Il telemonitoraggio spinge verso B o C.
4. La **gestione dei SOUP** diventa un obbligo formale e non una buona pratica: ogni dipendenza open source va censita, giustificata e sorvegliata.
5. Il **piano di sorveglianza post-commercializzazione** e la **vigilanza sugli incidenti** vanno progettati ora, non dopo.
6. La **tracciabilità requisiti → architettura → unità → test** diventa condizione di certificabilità: gli identificativi `RF-*`, `RNF-*`, `BR-*` prodotti nella fase di ricerca **non vanno mai rinumerati**.
7. La **valutazione clinica** richiede un piano, dati clinici e un rapporto: è un flusso di lavoro autonomo, con tempi propri, da avviare in parallelo allo sviluppo.
8. Il **regime linguistico**: la documentazione destinata all'utilizzatore e le istruzioni per l'uso seguono obblighi propri di lingua e contenuto ai sensi dell'Allegato I.

### Conseguenze di D25 — requisiti trasversali vincolanti

Questo vincolo prevale su ogni scelta di comodità implementativa. Nessuna funzionalità è «completa» se non lo soddisfa.

1. **Mobile first, non mobile compatible.** Si progetta partendo dallo schermo piccolo e dalla connessione peggiore, non adattando in seguito il desktop. Il paziente tipico di una televisita usa uno smartphone, spesso su rete mobile, spesso senza assistenza. Il DM 21 settembre 2022 lo impone espressamente alle infrastrutture regionali.
2. **Accessibilità come requisito funzionale.** WCAG 2.1 AA ed EN 301 549 integrali, con l'unica non-conformità dichiarata prevista da D24. Verifica automatizzata in integrazione continua **e** verifica manuale con tecnologie assistive reali: l'automazione intercetta una parte minoritaria dei difetti di accessibilità.
3. **Ingegneria dell'usabilità ai sensi di IEC 62366-1** — ora obbligatoria per effetto di D12. Comporta: specifica dell'uso previsto e del profilo degli utilizzatori, individuazione delle **caratteristiche legate alla sicurezza** e degli **errori d'uso a rischio**, valutazione **formativa** durante lo sviluppo e valutazione **sommativa** con utenti rappresentativi prima del rilascio, e il relativo file di ingegneria dell'usabilità. Gli utenti rappresentativi comprendono pazienti anziani e persone con disabilità: non sono un caso limite, sono la popolazione di riferimento.
4. **Progettazione per l'utente reale.** Anziani, persone con bassa alfabetizzazione digitale, disabilità sensoriali, motorie e cognitive, caregiver che assistono un terzo, professionisti sotto pressione di tempo. Ne discendono: percorsi brevi e reversibili, linguaggio piano, verifica tecnica preventiva prima della sessione, istruzioni comprensibili, ripiego telefonico, nessun passaggio obbligato che presupponga competenze informatiche.
5. **Conformità alle linee guida di design per i servizi digitali della PA** per le interfacce rivolte al cittadino in contesto pubblico, come impone il DM 21 settembre 2022. Design system del progetto costruito su componenti accessibili e verificati, non su componenti resi accessibili a posteriori.
6. **Il componente incorporabile eredita i medesimi obblighi.** Un integratore che incorpora Telemedic non deve poter degradarne l'accessibilità: le personalizzazioni di tema sono vincolate a soglie di contrasto verificate, e il rispetto delle preferenze di sistema (movimento ridotto, contrasto elevato, dimensione del carattere) non è disattivabile.
7. **Resilienza come requisito di accessibilità.** Banda scarsa, rete intermittente, dispositivo modesto: degradare in modo comprensibile — audio prima del video, avvisi chiari, ripresa della sessione — è parte dell'accessibilità reale, non dell'ottimizzazione.
8. **Multilingua**, come richiesto dal decreto per le infrastrutture regionali, con architettura di internazionalizzazione predisposta fin dall'inizio.
9. **Criterio di accettazione operativo**: ogni requisito funzionale del catalogo deve poter essere completato da un paziente anziano su smartphone in rete mobile, e da un professionista con la sola tastiera e uno screen reader. Se non è possibile, il requisito non è soddisfatto.


## 6. Archetipo dell'integratore target (RISERVATO — profilo anonimizzato)

> **REGOLA DI RISERVATEZZA (R0) — VINCOLANTE PER OGNI AGENTE.**
> Esistono trattative in corso con un potenziale partner. **Nessun documento, commit, issue,
> PR, commento o file prodotto può nominare aziende, prodotti commerciali, marchi o domini
> di potenziali partner.** Ci si riferisce sempre e solo a categorie generiche:
> "gestionale sanitario cloud", "sistema EHR di terze parti", "integratore", "vendor partner".
> Il progetto è progettato per una molteplicità di integratori, non per uno solo.

Il design dell'integrazione si basa sul profilo archetipico del **gestionale sanitario cloud
italiano di fascia PMI**, ricavato dall'analisi del mercato. Questo profilo NON descrive una
singola azienda: rappresenta la classe di sistemi con cui Telemedic deve interoperare.

### 6.1 Profilo funzionale dell'integratore archetipo

- **Modello di erogazione**: SaaS cloud multi-tenant, nessuna installazione locale, accesso
  da browser desktop e app mobile.
- **Base clienti**: studi medici singoli, poliambulatori, équipe multi-specialistiche, con
  cartelle cliniche personalizzate per specialità (cardiologia, ginecologia, reumatologia,
  psicologia, fisioterapia, medicina dello sport, dermatologia, ortopedia).
- **Moduli tipici già presenti**: cartella clinica elettronica, agenda e prenotazioni,
  fatturazione elettronica, comunicazione col paziente (SMS/email), reportistica.
- **Capacità specialistiche ricorrenti**: viewer DICOM, firma grafometrica, lettura della
  tessera sanitaria da lettore smart-card, refertazione vocale, sincronizzazione con
  calendari esterni.
- **Integrazioni di sistema già in essere**: Sistema TS per l'invio delle spese sanitarie
  (modello 730 precompilato), ricetta elettronica dematerializzata, lettori di tessera
  sanitaria, convenzioni con enti previdenziali di categoria.
- **Postura di conformità**: cifratura dei dati, backup automatici, conformità GDPR,
  iscrizione al Registro Pubblico del Software.
- **Ordine di grandezza**: alcune migliaia di professionisti sanitari attivi.

### 6.2 Implicazioni progettuali vincolanti

Da questo profilo discendono requisiti che valgono per **qualunque** integratore:

1. **Nessuna imposizione di UI**: l'integratore ha già la propria interfaccia e la propria
   identità visiva. Telemedic deve essere incorporabile in white-label.
2. **Nessuna imposizione di IAM**: l'integratore ha già la propria autenticazione. Telemedic
   deve accettare identità federate (OIDC token exchange, SAML2) senza obbligare gli utenti
   a un secondo login.
3. **Nessuna duplicazione di anagrafica**: pazienti, professionisti e agende sono già gestiti
   altrove. Telemedic deve lavorare per riferimento (identificatori esterni, FHIR
   `Patient.identifier` con system proprietario del partner) e non diventare il master data.
4. **Convivenza con l'agenda esistente**: la prenotazione del consulto nasce nel sistema del
   partner. Telemedic deve poter essere invocato con un appuntamento già esistente
   (FHIR `Appointment` in ingresso) e restituire l'esito.
5. **Restituzione del contenuto clinico al sistema di origine**: al termine della sessione,
   il referto e i metadati devono confluire nella cartella clinica del partner, non restare
   confinati in Telemedic.
6. **Multi-integratore per costruzione**: più partner possono coesistere sulla stessa
   installazione, ciascuno con le proprie chiavi, i propri webhook, la propria configurazione
   di branding e i propri limiti di rate. Nessuna logica hard-coded su un singolo partner.
7. **Capacità sanitarie italiane come cittadini di prima classe**: Sistema TS, ricetta
   dematerializzata, tessera sanitaria, FSE 2.0 e firma elettronica non sono opzionali
   nel mercato di riferimento.

## 7. Vincoli architetturali derivati (da rispettare in tutta la documentazione)

- **V1 — Sovranità del dato**: nessun componente obbligatorio ospitato fuori dall'UE. Nessuna
  dipendenza runtime da servizi cloud US-based. Media P2P; TURN self-hosted.
- **V2 — Separazione MDR**: il confine tra "veicolo di comunicazione" (fuori dal perimetro
  diagnostico) e "supporto alla decisione clinica" va reso esplicito nell'architettura.
  La regola 11 MDR classificherebbe in **Classe IIa** (con Organismo Notificato) il software
  che fornisce informazioni usate per decisioni diagnostiche o terapeutiche. La produzione di
  `DiagnosticReport` va quindi progettata come **persistenza di contenuto redatto dal medico**,
  non come generazione autonoma di informazione clinica.
- **V3 — Integrabilità totale**: ogni capacità del sistema deve essere raggiungibile da un
  sistema terzo tramite API documentata. Nessuna funzionalità accessibile solo dalla UI.
- **V4 — Tenant-awareness**: ogni entità di dominio, ogni evento e ogni riga di audit portano
  l'identificativo di tenant.
- **V5 — Auditabilità immutabile**: ogni accesso a dato sanitario è tracciato in modo
  non ripudiabile e non alterabile.
- **V6 — Usabilità, accessibilità, mobile first**: requisito trasversale di tutto il sistema.
  WCAG 2.1 AA ed EN 301 549 come requisiti funzionali; `mobile first` come metodo di progettazione;
  ingegneria dell'usabilità ai sensi di IEC 62366-1 come obbligo regolatorio. Vedi D25.

## 8. Convenzioni di scrittura per tutti gli agenti

- **Lingua**: italiano. Termini tecnici e identificatori di codice restano in forma originale.
- **Ortografia**: accenti e diacritici sempre corretti (è, à, ù, però, perché...).
- **Stile**: prosa tecnica densa e verificabile. Ogni affermazione normativa cita la fonte
  (articolo, regola, RFC, sezione dello standard). Vietato il riempitivo, le ripetizioni e
  le frasi di raccordo vuote.
- **Formato**: Markdown compatibile con Docusaurus. Frontmatter YAML con `title`, `sidebar_position`,
  `description`. Diagrammi in Mermaid. Blocchi di codice con linguaggio dichiarato.
- **Onestà**: se un'informazione non è verificabile, dichiararlo esplicitamente invece di
  inventarla. Distinguere sempre "il sito dichiara" da "è stato verificato" da "è una proposta".
- **Riferimenti incrociati**: usare link relativi verso gli altri documenti del progetto.
- **Riservatezza (R0)**: mai nominare aziende, marchi, prodotti commerciali o domini di
  potenziali partner. Usare sempre formule generiche: "un gestionale sanitario cloud",
  "un sistema EHR di terze parti", "l'integratore". Questa regola prevale su ogni altra.

## 9. Mappa dei deliverable

```
docs/00_overview/     Visione, glossario, executive summary
docs/01_technical/    Aspetti tecnici
docs/02_architecture/ Aspetti architetturali
docs/03_functional/   Aspetti funzionali
docs/04_protocols/    Protocolli
docs/05_domain/       Dominio sanitario
docs/06_security/     Sicurezza informatica
docs/07_integration/  Integrazione verso sistemi terzi
docs/08_compliance/   MDR, qualità, normativa
docs/09_roadmap/      Roadmap tecnica
docs/adr/             Architecture Decision Records
```

## 10. Stato dell'orchestrazione

Vedi `.telemedic/context/01_AGENT_LOG.md` per il registro dei contributi degli agenti e
`.telemedic/research/` per gli output della fase di ricerca.
