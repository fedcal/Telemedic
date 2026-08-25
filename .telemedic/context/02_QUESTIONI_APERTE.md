# Questioni aperte consolidate — fase di ricerca

> Estrazione delle sezioni «questioni aperte» dai documenti di ricerca. Alimenta la tornata decisionale con il committente.


---

# FONTE: R1-standard-sanitari.md

## 11. Questioni aperte per gli altri agenti

### 11.1 Per l'agente di architettura

| # | Questione |
|---|---|
| A1 | **`Composition` o `DiagnosticReport` come artefatto primario del referto?** La ricerca raccomanda `Composition` (allineamento a HL7 Italia + vincolo V2), ma il sito pubblico dichiara `DiagnosticReport`. Serve un ADR che risolva il conflitto e definisca se `DiagnosticReport` resta come vista di compatibilità o viene rimosso dalla comunicazione. |
| A2 | **Dove vive il modello canonico?** Se il modello di dominio è indipendente da FHIR (P0-1), va deciso se la persistenza è relazionale con mapping o document-oriented con FHIR come formato nativo. Ha impatto su Envers e su TimescaleDB. |
| A3 | **Multi-tenancy e `Bundle` transaction.** Una transaction FHIR può contenere entry di tenant diversi? La risposta deve essere no per costruzione, ma va imposto a livello di parser, non solo di autorizzazione. |
| A4 | **Convivenza R4/R5.** Base URL parallelo (`/fhir/R4`, `/fhir/R5`) o content negotiation con `fhirVersion=`? Entrambe sono conformi (§3.1.0.1.10); la scelta ha impatto sul routing e sulla cache. |
| A5 | **Come si pubblica l'endpoint di signaling WebRTC in FHIR?** Non esiste un `connectionType` adatto (§2.9). Serve decidere fra code system di progetto, cross-version extension R5, o esposizione fuori da FHIR. |

### 11.2 Per l'agente di sicurezza

| # | Questione |
|---|---|
| S1 | **`sessionKey` e URL di stanza come segreti.** Vanno trattati come token one-time a scadenza breve o come metadati persistibili? La ricerca raccomanda la prima, ma serve un threat model. |
| S2 | **Ciclo di vita delle `Subscription`.** La specifica R4 avverte che le subscription restano attive dopo la scadenza del token del client creatore (§3.8). Serve una policy di revoca automatica legata all'identità. |
| S3 | **`$export` in multi-tenant.** Confermare la disabilitazione dell'export di sistema e definire l'autorizzazione su `Group/[id]/$export`. |
| S4 | **SMART vs IUA: quale profilo per quale integratore?** Entrambi vanno supportati (D4), ma serve una matrice di decisione e una configurazione Keycloak per ciascuno. |
| S5 | **`Prefer: handling=strict` come default.** Deviazione dal comportamento raccomandato dalla specifica (che dice SHOULD ignore). Va motivata e documentata come scelta di sicurezza consapevole. |
| S6 | **MLLP over TLS**: quale profilo di cipher, quale gestione dei certificati, e come si concilia con il requisito FIPS 140-2 dichiarato per DTLS-SRTP. |
| S7 | **Anonimizzazione degli `AuditEvent` esportati.** `AuditEvent` contiene identificativi paziente: l'invio a un Audit Record Repository di terze parti è esso stesso una disclosure e richiede `PurposeOfUse` (§6.5). |

### 11.3 Per l'agente di conformità (MDR / qualità)

| # | Questione |
|---|---|
| Q1 | **Il confine MDR e la `Composition`.** La ricerca conferma che il referto deve essere persistenza di contenuto redatto dal medico. Va verificato che nessun campo del profilo (`conclusionCode`, `section.text` generati, riepiloghi automatici) costituisca "informazione fornita dal software per decisioni diagnostiche" ai sensi della Regola 11. |
| Q2 | **Terminologia e MDR.** L'uso di un terminology server esterno introduce una dipendenza runtime su un componente non controllato. Va classificato come SOUP ai sensi di IEC 62304 e va verificata la compatibilità con il vincolo V1 (nessun componente obbligatorio fuori UE). |
| Q3 | **SNOMED CT e distribuzione open source.** Serve una valutazione legale della compatibilità fra Apache-2.0 e l'obbligo di licenza Affiliate, e la formulazione del disclaimer nel `NOTICE`. |
| Q4 | **ATC**: i termini di licenza WHOCC non sono stati verificati (§8.6). Da accertare prima di qualunque distribuzione di contenuto ATC. |
| Q5 | **Conformità dichiarata all'IG HL7 Italia Televisita.** L'IG è in stato *draft / trial-use v0.2.0*. Dichiarare conformità a uno standard non ancora stabile è una scelta con implicazioni di manutenzione: va valutata. |

### 11.4 Per l'agente di documentazione dei protocolli

| # | Questione |
|---|---|
| D1 | Tutti i punti marcati **[NV]** in questo documento vanno risolti prima di essere scritti nella documentazione pubblica. In particolare: URL esatto dell'estensione cross-version `VirtualServiceDetail`; codici `PPRF` di `v3-ParticipationType`; tabelle HL7 v2 0004/0357 e struttura del segmento ERR in v2.5; identifier type code per il codice fiscale in PID-3; elenco dei message map del v2-to-FHIR IG; estensioni e operazioni del Subscriptions Backport IG; search parameter di PDQm ITI-78; edizione ICD-9-CM del code system dell'IG italiano; contenuto di `vs-tipo-ricetta`. |
| D2 | Il PDF della specifica **MLLP** non è stato letto direttamente (§5.4): i valori esadecimali sono corroborati da due fonti secondarie. Va letta la fonte primaria prima di scrivere l'implementazione. |
| D3 | **Il profilo `EncounterTelevisita` non fissa `Encounter.class`** (§2.10.2). Va chiarito con HL7 Italia se `VR` è il valore atteso o se il realm italiano prevede altro. |
| D4 | Il code system R5 `virtual-service-type` contiene solo tre codici riferiti a piattaforme commerciali di terze parti, con un evidente errore redazionale in una definizione (§2.10.1). Se se ne fa menzione nella documentazione pubblica, va fatto rispettando la regola R0. |

### 11.5 Per l'agente di roadmap

| # | Questione |
|---|---|
| R1 | La fase 6 (imaging, bulk data, cross-version extension) cade nelle ultime tre settimane prima della deadline del 30 novembre 2026. Va verificato se D5 ("v1.0 completo, senza tagli") è compatibile con il fatto che alcuni di questi elementi dipendono da specifiche in stato *ballot* o *snapshot pre-release*. |
| R2 | Le revisioni degli standard rilevate (MHD 4.2.5-comment, PIXm 3.1.0 TI, PDQm 3.2.0 TI, IUA 2.5 TI, IG italiani 0.2.0 draft) sono in larga parte **trial implementation o draft**. Serve una policy di pinning delle versioni e un processo di ricontrollo prima del rilascio. |
| R3 | Va pianificato un **ricontrollo di questa ricerca** in prossimità del rilascio: le revisioni IHE e gli IG HL7 Italia cambiano con cadenza infra-annuale. |

---


---

## [R2-normativa-mdr-gdpr-licenze.md] — nessuna sezione (agente ancora in corso?)


---

# FONTE: R3-normativa-italiana.md

## 12. Questioni aperte per gli altri agenti

### Per l'agente MDR / compliance

**Q1 — Il confine di classe I è più stretto di quanto il *context pack* assuma.** Il DM 21 settembre 2022 impone espressamente la certificazione come dispositivo medico per: (a) il micro‑servizio `viewer dati clinici` unitamente a quello di refertazione, nei teleconsulti radiologico e istopatologico; (b) il software e l'hardware della **televisita**, «ove nel servizio vengano usati dispositivi medici»; (c) l'infrastruttura per il **telemonitoraggio**, con classe potenzialmente superiore alla IIa per il livello 2. La domanda: **la v1.0 di Telemedic include un `viewer` di dati clinici o un percorso di telemonitoraggio?** Se sì, la strategia Classe I non regge nel mercato italiano. Serve un ADR che delimiti la destinazione d'uso e un'analisi della regola 11 MDR alla luce di questo testo.

**Q2 — La produzione di `DiagnosticReport` va riconsiderata.** La IG nazionale HL7 Italia «Televisita» usa `Composition` + `Bundle` (`CompositionRefertoTelevisita`, `RefertoDiTelevisita`), non `DiagnosticReport`. Va verificato se `DiagnosticReport` sia comunque utilizzato nelle IG nazionali e, in caso contrario, se la scelta dichiarata sul sito pubblico vada rivista o affiancata.

### Per l'agente architetturale

**Q3 — Conformità alle IG di HL7 Italia.** Il progetto dichiara «FHIR R4». La conformità richiesta in Italia è alle **Implementation Guide nazionali** (`Televisita` v0.2.0, `Teleconsulto` v0.2.0, `Teleassistenza` v0.2.0, `Telemonitoraggio` v0.2.0, `IT-Core` v0.2.0). Serve una decisione: (a) conformità piena alle IG italiane come profilo di default per il mercato IT; (b) FHIR R4 base con *profile pack* italiano opzionale. Impatta il modello dati, la validazione, i test di conformità e il *packaging*.

**Q4 — Gateway FHIR e ruolo di Telemedic nell'architettura nazionale.** Nell'architettura del DM 21 settembre 2022 la piattaforma di telemedicina è **una IRT o una componente di IRT**, e comunica con l'esterno **attraverso il Gateway FHIR del FSE 2.0**, non direttamente. Va deciso se Telemedic implementa un client verso il Gateway, se espone un adattatore, o se lascia l'integrazione all'integratore. Ha impatti su D4 (integrazioni) e sul confine di responsabilità.

**Q5 — Micro‑servizi trasversali: integrare, non reimplementare.** Il DM è esplicito nel vietare la reimplementazione *ad hoc* di refertazione/firma digitale e nel prescrivere l'integrazione con il modulo regionale. Va rivisto il perimetro funzionale: `refertazione e firma digitale`, `viewer dati clinici`, `booking`, `billing` sono **punti di integrazione**, non funzionalità da costruire.

**Q6 — Multi‑tenancy e territorialità.** Il DM prescrive «*multi‑tenant application in Cloud*» con segregazione e isolamento a livello applicativo, e i tre modelli di deployment tutti «su territorio nazionale». La decisione D8 va documentata come **conforme per costruzione**, con evidenze: RLS/schema‑per‑tenant, mappatura dei *grant*, assenza di dipendenze extra‑nazionali.

**Q7 — Event broker.** Il DM prescrive un'architettura *event‑driven* con *event broker* e condivisione *near real‑time*. Lo stack dichiarato (Spring Boot + TimescaleDB) non include un broker. Va deciso quale (Kafka? RabbitMQ? NATS?) e come si concilia con il vincolo «Docker Compose» per l'on‑premise.

### Per l'agente sicurezza

**Q8 — Log retention.** 24 mesi per i log, 12 mesi per i dati di accesso/autenticazione (DM 19 novembre 2025), 30 anni dal decesso per i documenti FSE (DM 7 settembre 2023, art. 10). Serve una policy di retention differenziata per classe di dato, configurabile per tenant, con evidenza di cancellazione.

**Q9 — Verifica del testo integrale del DM 19 novembre 2025.** L'Allegato 4 (misure di sicurezza) e l'Allegato 2 (integrazione con l'EDS) non sono stati letti su fonte primaria. Vanno reperiti in GU e tradotti in requisiti verificabili.

**Q10 — Determinazione ACN 379907/2025.** Le specifiche di base delle misure di sicurezza NIS2, efficaci dal 15 gennaio 2026 con obbligo di attuazione dimostrabile entro il 31 ottobre 2026, vanno lette sul testo ACN e mappate sul threat model STRIDE previsto da D10.

### Per l'agente prodotto/documentazione

**Q11 — Il vincolo sulla prima visita va spiegato con precisione, non semplificato.** Il testo nazionale contiene due affermazioni di diversa intensità (§ 3.1) e le aperture in prima visita sono **regionali**. Una documentazione che affermi «la televisita non può mai sostituire la prima visita» è imprecisa; una che affermi «la televisita è ammessa in prima visita dopo teleconsulto» è imprecisa in senso opposto. Va usata la formulazione stratificata proposta nel § 3.1.

**Q12 — Onestà sul modello economico.** Non esiste tariffa nazionale per la telemedicina; il teleconsulto non è remunerato; il nuovo nomenclatore non contiene voci di telemedicina. La documentazione commerciale non deve suggerire il contrario.

**Q13 — Terminologia: «servizi minimi» ≠ «prestazioni».** Le due tassonomie (Accordo 2020 e DM 21 settembre 2022) non coincidono. Il glossario di `docs/00_overview/` deve rappresentarle entrambe con la mappatura esplicita.

### Verifiche documentali ancora da compiere

| # | Da verificare | Fonte da consultare |
|---|---|---|
| V1 | Testo integrale del **DM 19 novembre 2025** (19 articoli, 5 allegati) | GU n. 301 del 30 dicembre 2025, atto 25A06938 |
| V2 | Estremi e testo della norma della **legge di bilancio 2026** sulla telemedicina (art. 85?) e importi | Normattiva |
| V3 | Contraddizione sulle **tariffe 2026** (Milleproroghe vs. nuovo decreto dal 21 settembre 2026) | GU / Normattiva / Conferenza Stato‑Regioni |
| V4 | Esistenza di una **tipologia documentale FSE dedicata al referto di televisita** e relative specifiche CDA2 | Specifiche di interoperabilità FSE v2.6.4, fascicolosanitario.gov.it |
| V5 | Recepimento effettivo dell'estensione del campo «luogo di erogazione» con valore `T = telemedicina` nel **flusso ex art. 50** e nel **flusso DEMA** | Disciplinari tecnici Sistema TS |
| V6 | **Riprogrammazione PNRR** del sub‑investimento M6C1‑1.2.3 dopo la revisione ECOFIN di dicembre 2023 | Italia Domani, documenti ufficiali |
| V7 | **Stato reale di attivazione delle IRT** e numero di Regioni agganciate alla INT ad agosto 2026 | AGENAS, relazione annuale ASD |
| V8 | Inclusione o meno di soggetti sanitari nel **perimetro di sicurezza nazionale cibernetica** | Non pubblico; verifica caso per caso col cliente |
| V9 | **Allegato B al DM 30 settembre 2022** («Linee di indirizzo per i servizi di telemedicina»): quali **aree cliniche** individua | GU n. 298 del 22 dicembre 2022 |
| V10 | Contenuto integrale delle **«Indicazioni metodologiche per la perimetrazione delle proposte di PPP per la Piattaforma nazionale di telemedicina»** (AGENAS, 18 marzo 2022, agg. 4 maggio 2022), richiamate *per relationem* dal DM 21 settembre 2022 | AGENAS |

---


---

# FONTE: R4-webrtc-media.md

## 15. Questioni aperte per gli altri agenti

### Per l'agente Architettura (`docs/02_architecture/`, `docs/adr/`)

1. **Scalabilità del signaling**: routing deterministico per `sessionId` (raccomandato) o sticky session? Serve un **ADR** con la strategia di uscita se si sceglie la seconda. Vincolo tecnico da rispettare: RFC 8838 §9 richiede consegna dei candidati **esattamente una volta e in ordine** — Redis Pub/Sub semplice non lo garantisce.
2. **Topologia mesh a 3**: dove vive la logica di orchestrazione delle N-1 PeerConnection? Come si assegnano deterministicamente i ruoli polite/impolite? Come si divide il budget di upload fra i peer?
3. **Boundary architetturale del recording**: se client-side (R7), come si gestisce il fallimento dell'upload a chiamata conclusa? Serve una coda di upload resiliente lato browser?
4. **Numero e collocazione dei nodi TURN**: quanti, in quali regioni UE, con quale strategia di annuncio al client? Il dimensionamento di §3.6 va convertito in una capacity plan.

### Per l'agente Protocolli (`docs/04_protocols/`)

5. **Definizione formale del protocollo di signaling di Telemedic**: schema JSON versionato dei messaggi, macchina a stati della sessione, mappatura fra `onicecandidate(null)` e l'indicazione `end-of-candidates` di RFC 8838 §13, semantica del riavvio ICE. È il deliverable protocollare centrale e questa ricerca ne fornisce i vincoli, non il contenuto.
6. **Formato del canale sottotitoli** su `RTCDataChannel` (R15): messaggio versionato, con timestamp, marcatore di finalità (interim/final) e identificativo del parlante.
7. **Verifica delle direttive coturn non confermate** (§4.3, T16) e produzione della configurazione di riferimento definitiva.

### Per l'agente Sicurezza (`docs/06_security/`)

8. **Threat model STRIDE del piano media e del signaling**, con T1 e T2 come voci di primo livello. T2 in particolare va modellato come minaccia *dall'operatore stesso*, non solo verso l'operatore.
9. **Progettazione della Short Authentication String** (R3): derivazione dalle fingerprint, rappresentazione (parole? emoji? pattern?), flusso di verifica, comportamento in caso di mancata corrispondenza. Coordinare con l'agente accessibilità.
10. **Riscrittura completa della sezione crittografica** eliminando ogni riferimento a FIPS 140-2 (T3) e sostituendolo con ETSI TS 119 312 / SOG-IS / linee guida AgID-ACN, più la capacità di registrare `srtpCipher`/`dtlsCipher`/`tlsVersion` per sessione.
11. **Verifica su fonte primaria** dei CVE coturn e delle versioni corrette (T16), prima di qualunque citazione pubblica.
12. **Stato dell'API Identity Provider di RFC 8827 §7** nei browser target: è utilizzabile oggi o è di fatto abbandonata? Determina se R3 è l'unica strada o una fra due.

### Per l'agente Compliance / MDR (`docs/08_compliance/`)

13. **Le soglie di qualità e la notifica al professionista (R10) come controllo di rischio ISO 14971**: è la misura con maggiore rilevanza per il fascicolo tecnico emersa da questa ricerca. Va formalizzata come requisito tracciabile.
14. **`degradationPreference` per specialità (R11)**: esporla come preferenza dell'utente resta fuori dalla regola 11 MDR, o l'associazione esplicita a una specialità clinica costituisce già "informazione usata per decisioni diagnostiche"? Serve una posizione argomentata.
15. **Disattivazione di AEC/NS/AGC per specialità** (§7.2): se il suono viene usato per una valutazione semeiologica (respiro, tosse, sibili), si entra nel perimetro diagnostico? Stessa domanda di forma diversa.
16. **Esistono requisiti tecnici minimi nelle indicazioni nazionali italiane per l'erogazione di prestazioni in telemedicina** (risoluzione, frame rate, latenza)? Questa ricerca non li ha verificati e le soglie di §8.5 sono una proposta ingegneristica, non normativa. Se esistono, prevalgono.
17. **coturn come SOUP ai sensi di IEC 62304 §8.1.2**: censimento, giustificazione dell'uso, piano di sorveglianza delle vulnerabilità (T15).
18. **DPIA del trattamento di metadati sul TURN** (T6): finalità, base giuridica, retention, minimizzazione.

### Per l'agente Frontend / Angular (`docs/01_technical/`)

19. **Verifica del supporto `MediaRecorder` per `video/mp4`** sui browser target (T8) e decisione sul contenitore.
20. **Misura del carico CPU della registrazione client-side** su hardware di riferimento basso (T9), con la soglia di disattivazione automatica.
21. **Implementazione di `getStats()` con differenziazione corretta dei contatori cumulativi** (§8.3) — errore comune che produce grafici privi di senso.
22. **Esposizione controllata della `RTCPeerConnection` alle build di test** (§11.3) senza esporla in produzione.

### Per l'agente Accessibilità

23. **Progettazione della SAS accessibile** (R3, punto 9): leggibile da screen reader, non veicolata dal colore, comprensibile a un paziente anziano.
24. **Indicatore di registrazione** (R7): persistente, non occultabile, annunciato via `aria-live`, non basato sul solo colore (WCAG 1.4.1).
25. **Dichiarazione di accessibilità** con la non-conformità su 1.2.4 e la misura alternativa (R15, T14). Formulazione conforme a EN 301 549.
26. **Layout e ordine di focus per il terzo partecipante interprete** nella mesh a 3.

### Per l'agente Testing (`docs/01_technical/`, CI)

27. **Produzione delle fixture Y4M con timecode** e dell'infrastruttura OCR per la misura automatica della latenza glass-to-glass (R14) — è ciò che rende verificabile il target di §9.
28. **Profili `netem` come costanti condivise** (§11.2) e loro applicazione in Docker Compose di test.
29. **Implementazione dei tre test TURN**: fallback forzato, fallback realistico, e il test di sicurezza sul relay verso indirizzi interni (§11.4) — quest'ultimo va collegato al file di gestione rischi.
30. **Verifica dei flag Chrome non confermati** (`--use-file-for-fake-audio-capture` e altri, §11.1) sulla versione in uso in CI.

---


---

# FONTE: R5-pattern-integrazione.md

## 13. Questioni aperte

Elenco delle incertezze da risolvere prima o durante l'implementazione. Sono rivolte agli altri
agenti dell'orchestrazione.

| # | Questione | Destinatario |
|---|---|---|
| Q1 | Versione di Keycloak adottata e disponibilità effettiva dello scambio *external-to-internal* di RFC 8693 e dello stato GA del JWT Authorization Grant (§3.3.7). Blocca la modalità primaria dello scenario A | Architettura, roadmap |
| Q2 | Token opachi + phantom token al gateway, oppure JWT autoportanti? Impatto su latenza e topologia (§3.9) | Architettura |
| Q3 | `system` canonico per il codice fiscale nei profili FHIR italiani (§5.3) — **non verificato** | Dominio sanitario |
| Q4 | Mappatura dei valori `acr` per i livelli SPID L1/L2/L3 (§3.10) — **non verificata** | Identità digitale |
| Q5 | Dettagli esatti di FHIR Bulk Data `$export` (parametri e campi del manifest): recupero fallito in questa ricerca (§5.11) | Chi implementa l'export |
| Q6 | Conformità del messaggio `SIU^S12` di esempio alla struttura v2.5.1 (§8.3) — **non verificata** | Chi implementa l'adapter v2 |
| Q7 | Header `Deprecation`: è diventato RFC o è ancora Internet-Draft? (§5.4) — **non verificato** | Chi scrive la policy di deprecazione |
| Q8 | Nomi esatti degli header `ce-*` del binding HTTP CloudEvents in modalità binary (§4.6.1) — **non verificati** | Chi implementa il dispatcher |
| Q9 | `scratchpad.read` è un `messageType` valido nella versione corrente di SMART Web Messaging? (§2.7.2) — **non verificato** | Chi implementa Web Messaging |
| Q10 | Stato di manutenzione di `fhir.js` (§7.4.1) — **non verificato** | Chi progetta l'SDK TypeScript |
| Q11 | Pattern BALP (Basic Audit Log Patterns) per gli audit RESTful (§9.4) — **non verificati** | Sicurezza / audit |
| Q12 | Il modello «senza cookie» per l'embed (§6.5.3, strategia A) è compatibile con tutti i requisiti di sessione previsti dalla UI? Va confermato con chi progetta il frontend | Frontend, architettura |
| Q13 | Versione esatta dell'IG Subscriptions Backport da citare nei profili (§4.7.2) | Chi implementa le Subscription |


---

# FONTE: R6-dominio-funzionale.md

## 11. Questioni aperte e dipendenze verso gli altri agenti

### 11.1 Da confermare con R3 (normativa italiana)

| # | Questione | Impatto se la risposta è diversa da quanto assunto |
|---|---|---|
| Q1 | Definizioni ufficiali e vincolanti delle prestazioni di telemedicina e loro elenco esaustivo | il catalogo delle prestazioni (RF-030) e le regole BR-001…BR-008 vanno riallineati |
| Q2 | Condizioni esatte di ammissibilità della televisita rispetto alla prima visita e alla presa in carico | BR-002, BR-003, RF-041: cambia il punto in cui il sistema blocca o richiede deroga |
| Q3 | Requisiti di identificazione del paziente ammessi e loro gerarchia | RF-077, RF-080: cambiano i metodi configurabili |
| Q4 | Livello di firma richiesto per il referto e regole di conservazione dei documenti sanitari | BR-043, BR-044, BR-081, RF-127 |
| Q5 | Regole di alimentazione, consultazione e oscuramento del fascicolo sanitario, e ruolo del consenso | BR-064, RF-119, RF-120 |
| Q6 | Periodi minimi e massimi di conservazione per categoria di documento sanitario | BR-080, BR-081, RNF-039 |
| Q7 | Requisiti funzionali e livelli di servizio imposti alle piattaforme di telemedicina, e obblighi di collegamento a infrastrutture nazionali | RNF-017, RNF-018, e possibile nuovo contesto di integrazione |
| Q8 | Regime della rendicontazione e della tariffazione delle prestazioni in telemedicina | BR-005, BC-13 |
| Q9 | Disciplina della rappresentanza legale e del consenso per minori e soggetti incapaci | BR-062, BR-063, RF-117, RF-118 |
| Q10 | Categorie di dati sanitari a tutela rafforzata e conseguenze operative | BR-065, RF-135 |
| Q11 | Quadro dei fondi pubblici e degli obblighi per il riuso del software nella pubblica amministrazione | §10.2 |

### 11.2 Da confermare con R2 (MDR e GDPR)

| # | Questione | Impatto |
|---|---|---|
| Q12 | Conferma che il perimetro descritto in §0 e le regole BR-004, BR-032, BR-040, RF-083, RF-126 siano sufficienti a mantenere la classificazione attesa | se non lo fossero, cambia l'intero percorso di conformità (D6) |
| Q13 | Base giuridica del trattamento per l'erogazione della prestazione, e conseguente ruolo del consenso | BR-060, BC-06: se il consenso non è base giuridica per la cura, cambia la semantica della revoca |
| Q14 | Ripartizione dei ruoli titolare/responsabile nel modello SaaS multi-tenant e on-premise | §1.4, RF-187, catena dei sub-responsabili |
| Q15 | Ammissibilità e limiti della registrazione della sessione, e trattamento del frammento acquisito prima della revoca | BR-070…BR-076, RF-142 |
| Q16 | Regime del riconoscimento a vista e dei metodi alternativi di identificazione dal punto di vista del trattamento di dati biometrici | RF-080 |
| Q17 | Requisiti di IEC 62366-1 applicabili alla valutazione sommativa e definizione degli errori d'uso a rischio | RNF-053, RNF-079 |
| Q18 | Trattamento del terzo in sessione (interprete, caregiver, discente) e strumenti giuridici necessari | BR-066, BR-067 |

### 11.3 Da coordinare con gli altri agenti

- **Architettura**: la separazione fra `Encounter` e `MediaSession` (BC-05) e la scelta di BC-11 come unico punto di frontiera hanno conseguenze dirette sulla struttura dei moduli e sulle regole di dipendenza verificate automaticamente (RNF-065).
- **Sicurezza**: il modello RBAC/ABAC della §2.2 e il catalogo dei permessi della §2.3 sono la base del modello delle minacce; la relazione `BREAK_GLASS` e la sua revisione (RF-199) sono un elemento di progettazione, non un'aggiunta.
- **Interoperabilità**: la §8.3 impone che nessuna struttura di formato esterno entri nel nucleo; i profili FHIR (RF-210…RF-212) vanno definiti come published language versionato.
- **Qualità e test**: il catalogo dei requisiti di questo documento è la sorgente della matrice di tracciabilità (RF-205, RNF-069); gli identificatori non vanno rinumerati.
- **Prodotto e roadmap**: la ripartizione MoSCoW proposta è un'ipotesi di R6 basata sulla criticità di dominio, non sulla fattibilità nelle 14 settimane disponibili (D5). La riconciliazione fra criticità e capacità è compito dell'agente di pianificazione.

### 11.4 Riepilogo quantitativo del catalogo

| Categoria | Identificativi | Numero |
|---|---|---|
| Termini di glossario | §1.1 … §1.6 | 105 |
| Attori | ATT-01 … ATT-19 | 19 |
| Permessi atomici | PRM-IAM … PRM-INT | 132 |
| Regole di dominio | BR-001 … BR-096 | 88 |
| Requisiti funzionali | RF-001 … RF-223 | 195 |
| Requisiti non funzionali | RNF-001 … RNF-083 | 83 |
| Contesti delimitati | BC-01 … BC-13 | 13 |
| Indicatori | KPI-01 … KPI-18 | 18 |

Ripartizione MoSCoW dei requisiti funzionali (proposta): **Must 133, Should 46, Could 15, Won't-now 1**. La numerazione presenta lacune volute: gli identificativi arrivano a RF-223 e BR-096 pur essendo rispettivamente 195 e 88, per consentire inserimenti futuri senza rinumerare.

---
