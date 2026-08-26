# TELEMEDIC - CONTEXT PACK CONDIVISO (v1)

> **Documento di riferimento per tutti gli agenti.** Ogni agente DEVE leggerlo prima di
> iniziare e DEVE scrivere il proprio output nel percorso assegnato. Non contraddire
> le decisioni qui elencate: sono state approvate dal committente.

## 1. Identità del progetto

- **Nome**: Telemedic
- **Owner**: Federico Calò (fedcal) - https://federicocalo.dev
- **Repository**: https://github.com/fedcal/Telemedic (remote `git@github.com:fedcal/Telemedic.git`)
- **Pagina pubblica**: https://federicocalo.dev/it/open-source/telemedic
- **Stato attuale**: repository VUOTO, branch `master`, zero commit. Green-field totale.
- **Categoria**: Healthcare / Telemedicina
- **Descrizione ufficiale**: piattaforma di telemedicina open source per consulti video
  medico-paziente con qualità clinica, tracciabilità conforme ai requisiti UE e filosofia
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

1. **WebRTC peer-to-peer HD** - signaling Spring Boot, ICE candidate exchange, STUN/TURN
   configurabili, fallback relay se il P2P fallisce, bitrate adattivo.
2. **Cifratura DTLS-SRTP end-to-end** - media cifrato peer-to-peer, nessuna decifratura
   intermedia, key rotation per sessione, cipher FIPS 140-2 compliant.
3. **Integrazione FHIR R4 Encounter** - mapping automatico risorse cliniche, integrazione EHR.
   Risorse citate: Encounter (a inizio sessione), DiagnosticReport (a fine sessione),
   Practitioner, Patient, Observation.
4. **Keycloak SSO** - due realm (clinic + patient), OIDC standard, SPID/CIE.
5. **Audit log immutabile** - Envers su Encounter: durata sessione, esito, motivo cancellazione.
6. **Recording opzionale cifrato** - consenso esplicito del paziente via UI dedicata,
   MP4 cifrato a riposo, retention configurabile.
7. **Metriche qualità su TimescaleDB** - RTT, packet loss, jitter, bitrate medio per sessione,
   dashboard Grafana-ready, alert su soglia.
8. **Frontend WCAG 2.1 AA** - screen reader, navigazione da tastiera, contrasto verificato,
   supporto reduced motion.

## 4. Casi d'uso target

- Cliniche specialistiche (cardiologia, psichiatria, dermatologia)
- Mutue e assicurazioni sanitarie - **con il limite di D48**
- Telemedicina pubblica regionale (ASL/USL)
- Studi medici associati

> **D48 - Limite normativo sul caso d'uso assicurativo.** L'art. 15, c. 4, del DM 7 settembre
> 2023 esclude **sempre** le compagnie di assicurazione dall'accesso al Fascicolo Sanitario
> Elettronico, insieme a periti e datori di lavoro. Il caso d'uso resta valido per la
> **erogazione di prestazioni di telemedicina** a carico di fondi, mutue e polizze, ma
> **nessuna funzionalità del progetto può mediare l'accesso di un assicuratore al FSE**, né
> direttamente né per il tramite di un professionista. La comunicazione pubblica va corretta
> di conseguenza: il pagatore non è un consultatore.

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
| **D12** | **Classificazione MDR - SOSTITUISCE D6** | **Il telemonitoraggio è INCLUSO nel perimetro e si accetta la classificazione in Classe IIa.** Conseguenze vincolanti: serve un **Organismo Notificato**; il sistema di gestione qualità **ISO 13485 deve essere certificato**, non solo implementato; serve valutazione clinica ai sensi dell'art. 61 e dell'Allegato XIV; la procedura di valutazione della conformità è quella dell'Allegato IX (o X+XI). **La marcatura CE non è ottenibile entro il 30 novembre 2026**: a quella data il traguardo realistico è software completo, testato e con fascicolo tecnico avviato. La documentazione non deve mai lasciare intendere che il prodotto sia marcato CE prima che lo sia. Copre tutti e quattro i servizi minimi del DM 21 settembre 2022. |
| **D13** | **Modello dati FHIR** | **Implementation Guide di HL7 Italia come profilo predefinito** (`Televisita`, `Teleconsulto`, `Teleassistenza`, `Telemonitoraggio`, `IT-Core`, tutte su FHIR R4 4.0.1). Il referto è una **`Composition`** dentro un `Bundle`, conforme a `CompositionRefertoTelevisita`. **`DiagnosticReport` è mantenuto come proiezione in sola lettura** per gli integratori che lo attendono, mai come artefatto primario. Le IG sono in stato draft 0.2.0: serve una policy di pinning delle versioni e un processo di ricontrollo. |
| **D14** | **Perimetro funzionale** | **Componente integrabile con moduli propri.** Telemedic implementa i micro-servizi specifici (videoconferencing, patient onboarding, motore di workflow, eventi e notifiche, chat, condivisione documenti, second opinion) **e** dispone di moduli propri per refertazione/firma, agenda e fatturazione. Tali moduli sono però **disattivabili e sostituibili per configurazione**: quando esiste un modulo regionale o dell'integratore, il sistema si integra invece di duplicare, come impone il DM 21 settembre 2022 nel contesto delle infrastrutture regionali. Nessuna funzionalità è raggiungibile solo dalla UI (vincolo V3). |
| **D15** | **Event broker** | **Apache Kafka**, preceduto da un **outbox transazionale su PostgreSQL**: l'evento di dominio è scritto nella stessa transazione del dato e pubblicato da un relay, così non esistono eventi persi né eventi fantasma. Per l'on-premise si adotta Kafka in **modalità KRaft a nodo singolo** per contenere il peso operativo. L'astrazione di pubblicazione resta dietro un'interfaccia di progetto, così da non incastrare il codice di dominio nel broker. |
| **D16** | **Rilascio e marcatura CE** | Il **30 novembre 2026** consegna software completo, testato e documentato, con **fascicolo tecnico avviato** e sistema di gestione qualità in esercizio. La **marcatura CE è una milestone autonoma nel 2027**. Fino a quel momento ogni artefatto distribuito dichiara esplicitamente: *«non ancora marcato CE, non utilizzabile per l'erogazione di prestazioni sanitarie su pazienti reali»*. Nessun documento, pagina o messaggio può lasciare intendere il contrario. |
| **D17** | **Fabbricante - modello duale** | Il **repository pubblico è codice sorgente sotto Apache-2.0, non un dispositivo medico**, e lo dichiara. Il dispositivo è una **distribuzione identificata**, prodotta da build riproducibile e sottoposta a controllo qualità, con un fabbricante preciso, un PRRC e una registrazione EUDAMED. I due artefatti hanno nomi, numeri di versione e cicli di vita distinti. La documentazione deve rendere questa distinzione evidente e non equivocabile: è ciò che protegge insieme la comunità e l'utilizzatore. |
| **D18** | **Identity chaining - difesa a strati** | Non si dipende dalla funzione in *preview* di Keycloak. Il **token exchange è implementato nel gateway di Telemedic**: validazione del token dell'integratore, emissione del token interno, **delega sempre rappresentata con il claim `act` (RFC 8693 §4.1), mai impersonificazione**. Ripiego indipendente: **token d'ingresso a uso singolo, scadenza brevissima, emesso back-channel** e mai transitante per l'URL. **Spike di verifica nella prima settimana di sviluppo**, prima di ogni altra attività. Trattandosi di codice di sicurezza critico, è sottoposto a **revisione esterna indipendente** e a test di abuso dedicati. |
| **D19** | **Claim pubblici - riformulazioni approvate** | `FIPS 140-2` → rimosso, sostituito da ETSI TS 119 312 / SOG-IS / linee guida AgID-ACN. `end-to-end` → mantenuto ma **condizionato alla verifica indipendente delle chiavi**, con la condizione dichiarata. `peer-to-peer` → «cifrato end-to-end, **instradato direttamente quando la rete lo consente**». `latenza < 200 ms` → da promessa a **metrica misurata, registrata e notificata**, con le soglie dichiarate. `key rotation per session` → «**materiale crittografico generato ex novo per ogni sessione, senza riuso**». Va inoltre predisposto il testo aggiornato della pagina pubblica. |
| **D20** | **Deliverable: percorso di certificazione** | La documentazione deve contenere una **guida operativa alla certificazione**: quali certificazioni servono, in quale ordine, con quali prerequisiti, presso chi, con quali tempi e costi stimati, quali documenti produrre e in quale momento del ciclo di sviluppo. Deve essere un percorso eseguibile con date, non una rassegna normativa. Collocazione: `docs/08_compliance/`. |
| **D21** | **Telemonitoraggio** | Perimetro: **ingestione di misure da un gateway di terze parti** (FHIR `Observation`, `Device`, `DeviceMetric`) **più inserimento manuale da parte del paziente o del caregiver più questionari strutturati (PROM)**. Telemedic **non dialoga direttamente con i dispositivi medici** e non si assume responsabilità sull'accuratezza della catena di misura hardware: acquisisce, applica il piano di monitoraggio, valuta le soglie, genera allerte e le sottopone a revisione clinica. La soglia e l'allerta sono **configurate dal professionista**, mai dedotte dal sistema (vincolo V2). |
| **D22** | **Verifica delle chiavi (SAS)** | **Short Authentication String obbligatoria per impostazione predefinita.** Codice breve derivato dalle fingerprint DTLS, confrontato a voce dai due interlocutori all'avvio della sessione. È al tempo stesso ciò che rende dimostrabile l'end-to-end e un controllo di rischio tracciabile ai sensi di ISO 14971. **Requisiti di accessibilità vincolanti**: leggibile da screen reader, mai veicolata dal solo colore, comprensibile a un paziente anziano o poco alfabetizzato digitalmente, con procedura definita in caso di mancata corrispondenza. |
| **D23** | **Registrazione della sessione - server-side, con conseguenze dichiarate** | La registrazione avviene **lato server**, per garantirne l'affidabilità indipendentemente dal dispositivo e dal carico di CPU del paziente. **Conseguenza inderogabile: quando la registrazione è attiva la cifratura viene terminata sul server e la sessione NON è end-to-end.** Ne discende un'architettura a due modalità: (a) **modalità predefinita, senza registrazione** - media cifrato end-to-end, instradato direttamente quando la rete lo consente, SAS che verifica l'interlocutore; (b) **modalità con registrazione, attivabile solo con consenso esplicito del paziente** - il media transita per il componente di registrazione. Obblighi che ne derivano: l'**informativa di consenso deve dichiarare esplicitamente** che la sessione non è più end-to-end; l'interfaccia deve segnalare lo stato di registrazione in modo **persistente e non occultabile** per tutta la durata; il passaggio fra le due modalità è tracciato nell'audit; il **file è cifrato a riposo** con chiavi per tenant e retention configurabile. Formato contenitore da confermare in base al supporto reale, non al claim pubblico. |
| **D24** | **Deployment e accessibilità** | **Tre profili documentati e supportati**: (a) Unione Europea, (b) territorio italiano, (c) cloud qualificato ACN o Polo Strategico Nazionale. **Nessuna dipendenza di runtime può impedire il profilo più restrittivo.** Accessibilità: **WCAG 2.1 AA integrale con una sola non-conformità dichiarata sul criterio 1.2.4 (sottotitoli in tempo reale)**, con l'interprete come misura alternativa e il canale dati dei sottotitoli comunque definito e versionato nel protocollo, per innestare in futuro un motore di trascrizione senza riprogettare. La dichiarazione di accessibilità segue il modello AgID ed è formulata secondo EN 301 549. |
| **D25** | **Usabilità, accessibilità e mobile first - VINCOLO TRASVERSALE** | Requisito di **tutto il sistema**, non di una parte: interfaccia paziente, interfaccia clinica, pannelli di amministrazione, componenti incorporabili, documentazione, messaggi di errore, notifiche. Non è una rifinitura finale ma un criterio di accettazione di ogni singola schermata. |
| **D26** | **Qualificazione MDR - CONFERMATA Classe IIa** | Confermata anche dopo l'analisi che ha dimostrato l'inesistenza di una Classe I per il software di telemedicina (MDCG 2019-11 Rev.1 §3.1; Regola 11a; tabella IMDRF: *"This table does not take into account MDSW which is Class I"*). Si dichiara quindi una **finalità medica propria** e si accetta il percorso **IIa con Organismo Notificato**. La valutazione automatica delle soglie nel telemonitoraggio è l'elemento che costituisce *interpretazione* e fonda la qualificazione. **Tre funzionalità sono a una user story dalla IIa** e vanno governate con change control: alert su soglia, replay con enhancement, refertazione assistita. |
| **D27** | **Cyber Resilience Act - conformità piena** | Si adotta l'intero impianto del Regolamento (UE) 2024/2847 senza invocare esenzioni: analisi dei rischi di cybersicurezza, documentazione tecnica dedicata, obblighi di aggiornamento per il periodo di supporto dichiarato, procedure di segnalazione. **Gli obblighi di segnalazione decorrono dall'11 settembre 2026.** Il CRA si applica proprio perché l'art. 2 par. 2 esclude i soli dispositivi MDR/IVDR: la sovrapposizione con D26 va risolta nella matrice di conformità. |
| **D28** | **Responsabilità e verifica del codice** | **Il progetto non assume responsabilità verso terzi.** Il repository è **codice sorgente open source**, non un dispositivo medico immesso sul mercato, e lo dichiara in modo inequivocabile. Chi integra, distribuisce o mette in servizio **deve verificare il codice** e assume gli obblighi che ne derivano. Conseguenza operativa: il materiale regolatorio di Classe IIa (fascicolo tecnico, IEC 62304, ISO 14971, IEC 62366-1) viene prodotto e reso disponibile **come pacchetto per chi certifica**, ma il progetto non appone marcatura CE né sottoscrive dichiarazioni di conformità. Avvertenza che va documentata: la Direttiva (UE) 2024/2853 (art. 15) vieta l'esclusione contrattuale della responsabilità verso il danneggiato, e l'art. 10 presume la difettosità in caso di non conformità a requisiti obbligatori di sicurezza UE - le clausole §§7-8 di Apache-2.0 valgono fra le parti, non verso il paziente. |
| **D29** | **Claim pubblici e destinazione d'uso** | Approvate tutte le riformulazioni di D19, **più una dichiarazione formale e visibile di destinazione d'uso e di limiti d'uso**, che è il documento da cui dipende l'intera qualificazione e la migliore difesa in caso di contestazione. Vanno riscritti anche i claim clinici: «qualità clinica» diventa enunciato tecnico verificabile su risoluzione, frame rate e continuità, senza rivendicare adeguatezza diagnostica; le specialità restano contesti d'uso organizzativi, non destinazioni d'uso cliniche. Da preparare il testo aggiornato della pagina pubblica. |
| **D30** | **Referto di televisita - tipologia documentale FSE propria** | **SOSTITUISCE l'ipotesi «Referto di Specialistica Ambulatoriale».** Il DM 19 novembre 2025, art. 7, crea **dieci nuove tipologie documentali FSE** dedicate alla telemedicina (lettere n-w dell'art. 3, c. 1, del DM 7 settembre 2023), con set informativo definito in Gazzetta Ufficiale. Il modello dati si costruisce su quel set. Restano da acquisire template CDA2 e metadati IHE: fino ad allora il contenuto informativo si modella come **dataset canonico** e CDA2 resta **serializzazione sostituibile**, senza cablare un template. |
| **D31** | **Policy terminologica - quattro regimi** | Ogni terminologia clinica è collocata in uno di quattro regimi, verificati su licenza primaria: **A - coesistenza piena** nei sorgenti Apache-2.0 (LOINC con attribuzione, HL7 Terminology, code system FHIR core); **B - `third-party/` con licenza propria** (ICD-9-CM italiano e nomenclatore nazionale, riusabili ex art. 5 L. 633/1941 + art. 52 c. 2 CAD; UCUM); **C - acquisizione o interrogazione a runtime a cura del deployer** (SNOMED CT, pacchetti IG HL7 Italia, ICD-API OMS); **D - esclusione totale, solo URI e codice** (ATC/DDD, ICD-10, ICD-11, CVX in v1.0, terminologia DICOM, documenti HL7 v2, Technical Framework IHE). |
| **D32** | **SNOMED CT - mai scaricato dal progetto** | L'Affiliate License si perfeziona **scaricando o accedendo** al contenuto: se il progetto non lo scarica mai, non ne è mai vincolato. Regola vincolante in `CONTRIBUTING.md` e **terminology guard in CI** con allowlist versionata. La cl. 2.7 impone che il contenuto non sia accessibile se non ad utenti autorizzati: **incompatibile con un repository pubblico**. La catena di sub-licenza (cl. 2.5.3, 2.5.4, 8.8) è **incompatibile con Apache-2.0 §2** per costruzione. Due avvertenze da documentare senza attenuanti: **il terminology server esterno non esonera il deployer** (chi crea o analizza record SNOMED è un *Data Processing System*, Appendix A → fee: USD 1.954/anno per Hospital, 652 per Practice, **per sito**, anche in ambienti non di produzione), e **chi distribuisce Telemedic distribuisce un «Licensee Product»** anche senza contenere un solo concetto SNOMED. Nessuna esenzione è applicabile al progetto. |
| **D33** | **Il sistema è pienamente funzionale senza SNOMED** | Corollario obbligato di D32, non ripiego: con `terminology.snomed.enabled=false` il sistema resta pienamente operativo appoggiandosi a LOINC, ICD-9-CM e catalogo nazionale, che non costano nulla. Il costo è dichiarato: i circa 4.000 codici del binding `Encounter.reasonCode` non si validano. Il **terminology gateway** è punto unico di accesso, con **cache non persistita su disco** (una cache persistente di risposte SNOMED è un *Sub-Set* → *Derivative*) e disattivazione per `system`. |
| **D34** | **ATC escluso; la licenza del contenitore non dispone dei diritti di terzi** | **Chiude Q4 di R1**: i termini WHOCC vietano verbatim copia e distribuzione a fini commerciali e ogni modifica - **frontalmente incompatibili con Apache-2.0 e con D1**. Mitigazione a costo zero: in Italia la codifica operativa del farmaco è l'**AIC**. L'URI canonico FHIR resta `http://www.whocc.no/atc` (è un identificatore, non un indirizzo) benché il dominio sia migrato. Principio generale che ne discende: **una dichiarazione CC0 apposta su un Implementation Guide non dispone dei diritti di terzi sul contenuto ricompreso** - verifica **artefatto per artefatto**. Corretto inoltre l'URI di ICD-11: `http://id.who.int/icd/release/11/mms`, non `http://hl7.org/fhir/sid/icd-11`. **Le traduzioni LOINC sono derivati assegnati a Regenstrief**: le stringhe i18n del progetto vanno separate architetturalmente da `Coding.display`. |
| **D35** | **Guida dei fondamenti - «non dare nulla per scontato»** | Il progetto pubblica una **guida formativa che parte da zero**, sia nel repository sia nel sito di documentazione, destinata a chiunque voglia contribuire. Copre **l'intero contesto medico-sanitario** del progetto, **tutti i protocolli applicati** e **tutta la conoscenza tecnico-informatica e clinico-organizzativa** necessaria prima di scrivere una riga di codice. Vincoli redazionali: nessun prerequisito implicito; ogni sigla sciolta alla prima occorrenza; ogni concetto sanitario spiegato a un informatico e ogni concetto informatico spiegato a un clinico; percorsi di lettura distinti per profilo; **glossario esaustivo bilingue** con rinvii incrociati; **matrice area del codice → conoscenze richieste**; bibliografia ragionata di sole fonti primarie. Collocazione: `docs/10_fondamenti/`, ventuno moduli in cinque blocchi (contesto sanitario, standard e trasporto, **fondamenti clinici**, fondamenti informatici e flussi, quadro di lavoro), in posizione di sidebar immediatamente successiva alla panoramica. Questa guida è **prerequisito dichiarato di `CONTRIBUTING.md`**. |
| **D36** | **D9 riformulata - «SPID/CIE/TS-CNS ready», non «accreditato»** | **CORREGGE D9.** Un progetto open source **non può essere accreditato**: il fornitore di servizi ex DPCM 24 ottobre 2014, art. 1 c. 1 lett. i), è chi *eroga servizi in rete*, e la Convenzione impegna a dichiarare ad AgID l'elenco dei servizi attivi - **il Service Provider è il deployer, mai il progetto**. Inoltre i **tempi dell'accreditamento SPID non sono dichiarati in alcuna fonte primaria**: esistono solo termini a valle della firma (iscrizione nel Registro entro 10 giorni; 5 giorni per gli aggregatori; ~1 giorno lavorativo per il caricamento presso gli IdP), mentre verifica del metadata, iterazioni, rilascio del certificato della PKI AgID e controfirma del Direttore di AgID **sono senza termine**. Conseguenza: l'obiettivo v1.0 è un prodotto **conforme e verificabile in integrazione continua** (`spid_sp_test` superato per intero, XSW1-XSW8 compresi), non un'installazione accreditata. **TS-CNS è obbligatorio, non «da considerare»**, ed è l'unico canale ex art. 64 CAD privo di dipendenze esterne: completabile al 100% nella v1.0. |
| **D37** | **SPID in SAML2, CIE in OIDC; modello a tre realm** | **SPID non è utilizzabile in OpenID Connect**: nessun Identity Provider lo supporta in produzione. Per SPID si adotta **SAML2**; per CIE è disponibile **OIDC**. CIE è il percorso a minor attrito (un solo IdP, pre-produzione con carte di test), con una trappola verificata: le regole tecniche dichiarano che l'`AuthnContextClassRef` di ritorno è **sempre `SpidL3`**, quindi il livello effettivo **non è desumibile dall'asserzione** - verifica empirica sul percorso critico. Architettura: **realm broker `citizen-idp`** come unico Service Provider verso la federazione, per non moltiplicare metadata e accreditamenti fra i realm `clinic` e `patient`. I due provider SPID per Keycloak disponibili in Apache-2.0 sono adottabili, ma **tre difetti di Keycloak** - l'utente federato può alterarsi gli attributi, cambiare email senza verifica e darsi una password locale - vanno trattati come **rischi ISO 14971**, non come note di configurazione. |
| **D38** | **Propagazione del livello di garanzia** | **Chiude Q4 di R5**: `https://www.spid.gov.it/SpidL1\|L2\|L3` corrispondono a ISO/IEC 29115 **LoA2/LoA3/LoA4**; gli stessi URI valgono per CIE. Il livello **non viaggia nel claim `act`** (RFC 8693 §4.1 esprime la delega, non il livello): sta in `acr`, e va qualificato con un marcatore proprio del progetto per distinguere **l'autenticazione eseguita** da quella **riferita dall'integratore**. Se il `RequestedAuthnContext` del provider SPID è statico per IdP, servono **due istanze di identity provider per ciascun IdP SPID** - il lotto di lavoro sistematicamente sottovalutato. Vincolo economico da documentare per il deployer: chiedere **un solo attributo oltre l'anagrafica** porta il costo per accesso da 0,4 € a 3,5 € (DT 166, All. 4). |
| **D39** | **NIS2 - il termine è soggettivo, non una data unica** | **CORREGGE R3.** Il «31 ottobre 2026» **non compare in alcun atto**: la regola è **diciotto mesi dalla ricezione della comunicazione di inserimento** (Det. ACN n. 379907 del **19 dicembre 2025**, art. 3 c. 1), quindi un termine **diverso per ciascun cliente**; il 31 ottobre 2026 è solo il limite esterno della prima ondata. La determinazione si applica dal **15 gennaio 2026** e sostituisce la n. 164179 del 14 aprile 2025. Catalogo confermato su fonte ACN: **37 misure / 87 requisiti** per i soggetti importanti, **43 misure / 116 requisiti** per gli essenziali. Aggiornamenti del 13 aprile 2026: la **n. 127434/2026** porta i soggetti inseriti nel 2026 a misure entro il **31 luglio 2027** e notifiche dal **1° gennaio 2027**. Conseguenza di prodotto: la conformità va **parametrizzata sul termine del singolo utilizzatore**, non su una data cablata nella roadmap. |
| **D40** | **La sovranità del dato diventa un campo obbligatorio verso l'autorità** | La Det. ACN **n. 127437/2026, art. 18** obbliga il soggetto NIS a **dichiarare nominativamente ad ACN i «fornitori rilevanti»**, con ragione sociale, codice fiscale, **Paese della sede legale**, **codici CPV** e criterio di rilevanza (prima scadenza 31 maggio 2026). Il vincolo **V1** (nessun componente obbligatorio fuori UE) cessa quindi di essere un argomento commerciale e diventa un dato che il cliente deve comunicare a un'autorità. In modalità servizio gestito Telemedic ricade sotto entrambi i criteri di rilevanza; **in installazione presso il cliente ricade comunque sotto quello di non fungibilità**. Il progetto deve fornire, come deliverable, la scheda con i dati che il cliente è tenuto a dichiarare. |
| **D41** | **CRA - l'esclusione è per prodotto, non per progetto** | L'art. 2 par. 2 del Regolamento (UE) 2024/2847 esclude i prodotti coperti dall'MDR: il prodotto marcato CE ai sensi di D26 è quindi fuori dal CRA, **ma gli altri artefatti no**. SDK, componente incorporabile, immagini e chart di distribuzione non coperti dalla marcatura ricadono nel CRA. Serve un **ADR con la tabella artefatto → regime applicabile**. La scelta di D27 (conformità CRA piena) resta e assorbe l'incertezza, ma la tabella è comunque necessaria per la matrice di conformità e per la documentazione all'integratore. |
| **D42** | **Il registro degli accessi immutabile non è il versionamento delle entità** | Hibernate Envers **versiona, non rende immutabile**: chi ha accesso in scrittura alla base dati può alterare anche le tabelle di audit. Il vincolo **V5**, il requisito R30 AgID, la misura ABSC 3.5.1 e il requisito ACN `PR.PS-04` richiedono **catena di impronte e conservazione separata dal sistema che genera gli eventi**. È lo sforzo maggiore dell'intero catalogo di sicurezza e va pianificato come tale, non come configurazione. |
| **D43** | **Conflitto MDR/NIS2 sugli endpoint - riconosciuto dall'autorità** | ACN riconosce espressamente (*Guida alla lettura*, § 2.3.3, requisito `DE.CM-09`) che installare protezioni endpoint su un dispositivo medico «ne potrebbe invalidare la certificazione». La deroga esiste **ma richiede misure compensative documentate, che deve fornire il fornitore**: il progetto deve produrle come parte del pacchetto per l'utilizzatore, non lasciarle al cliente. |
| **D44** | **Il fattore limitante non è lo sviluppo: è l'Organismo Notificato** | Il 51% degli ON impiega **13–18 mesi** dalla firma dell'accordo al certificato, il 31% **19–24 mesi**; a fine 2025 il divario è di **25.978 domande contro 13.953 certificati**, con organico degli ON in **contrazione** (−8% interni, −21% subappaltatori) - prima volta in oltre un decennio. Conseguenza aritmetica: anche firmando entro dicembre 2026, il certificato non arriva prima di **gennaio 2028** nell'ipotesi più favorevole, e realisticamente fra **giugno 2028 e giugno 2029**. **Piano di riferimento (scenario B): certificati Allegato IX a giugno 2028, marcatura CE luglio-agosto 2028.** Lo scenario 2027 resta obiettivo di tensione, non piano. Un fabbricante nuovo, micro, alla prima certificazione **non è un cliente prioritario**: va messo in conto nella negoziazione. La v1.0 del 30 novembre 2026 resta invariata: sono due traguardi indipendenti. |
| **D45** | **Ciò che è retroattivamente irrecuperabile va fatto subito, a prescindere da chi certificherà** | Coerentemente con D28 il progetto non appone marcatura CE, ma alcune attività **non sono recuperabili a posteriori** e vanno avviate ora, perché la loro assenza renderebbe impossibile a *chiunque* certificare in seguito: **congelamento degli identificativi di requisito** (`RF-*`, `RNF-*`, `BR-*`) con registro - la tracciabilità IEC 62304 non si ricostruisce; **inventario SOUP e SBOM generata dalla prima pipeline** - censire i SOUP a posteriori costa 3–5 volte tanto; **controllo dei documenti** prima di produrre altri documenti - ciò che nasce fuori controllo va riemesso; **separazione fra repository e distribuzione** con disclaimer pubblicato (`NOT-A-MEDICAL-DEVICE.md`, `DISTRIBUTION-POLICY.md`). Le altre attività dei primi 30 giorni (costituzione del fabbricante, nomina del PRRC, RFI agli ON, avvio del piano di valutazione clinica) **gravano su chi intende certificare**, e il progetto le documenta come manuale operativo senza assumerle. |
| **D46** | **La destinazione d'uso è il documento più costoso da sbagliare** | Una singola frase sposta la classificazione: «**monitoraggio in tempo reale dei parametri vitali**» porta in **Classe IIb** e classe di sicurezza software **C**; «**raccolta differita di parametri per la revisione periodica del professionista**» resta in **Classe IIa** e classe **B**. La differenza vale **12–18 mesi e un ordine di grandezza di costo**. La destinazione d'uso va quindi **congelata e sottoposta a revisione esterna prima** di ingaggiare qualunque Organismo Notificato: cambiarla dopo comporta una rivalutazione. La bozza `MDR-IU-001` e la determinazione di qualificazione e classificazione `MDR-CLS-001` sono deliverable del progetto ai sensi di D28. |
| **D47** | **Valutazione clinica - secondo collo di bottiglia, da avviare subito** | La Classe IIa **non richiede un'indagine clinica**, ma richiede un percorso documentale autonomo di **6–9 mesi**: la ricerca sistematica della letteratura richiede 8–12 settimane e il rapporto altre 8. Non è un'attività a valle della consegna del software: se parte a marzo, il rapporto non esiste prima dell'autunno 2027. Sul fronte costi: l'**Allegato VII sez. 1.2.8 MDR obbliga gli ON a pubblicare le proprie tariffe standard**, con elenco dei collegamenti mantenuto dalla Commissione - il progetto **non stima** le tariffe, rinvia alla fonte primaria. Avvertenza da documentare: confrontare le tariffe orarie è fuorviante, perché l'ON più economico per giornata può risultare il più costoso in totale se genera più cicli di non conformità. |
| **D49** | **Marcatura CE - solo il pacchetto regolatorio** | **Conferma e chiude D28 alla luce di D44.** Il progetto produce e pubblica fascicolo tecnico, documentazione di ciclo di vita IEC 62304, gestione del rischio ISO 14971 e file di ingegneria dell'usabilità IEC 62366-1, **ma non costituisce un soggetto fabbricante, non ingaggia Organismi Notificati, non conduce la valutazione clinica e non appone la marcatura CE**. Chi integra e immette sul mercato assume il ruolo di fabbricante. Restano a carico del progetto le sole attività **retroattivamente irrecuperabili** elencate in D45. Il percorso operativo documentato in `B9` diventa quindi **manuale per chi certifica**, non piano di lavoro del progetto: va scritto in `docs/08_compliance/` con quel taglio esplicito. |
| **D50** | **Inglese completo su tutta la documentazione** | Ogni modulo della guida dei fondamenti e ogni area di documentazione esiste in **italiano e in inglese integrali**, non in sintesi. Conseguenza operativa da governare fin da subito, perché è il rischio reale: **la divergenza fra le due versioni**. Misure: struttura dei file speculare sotto `i18n/en/`, un controllo in integrazione continua che segnali i documenti italiani modificati senza il corrispondente inglese, e la regola che una pull request che tocca il contenuto italiano non è completa finché non aggiorna l'inglese. La traduzione non è un adattamento libero: i riferimenti normativi italiani restano citati nella forma originale, con la spiegazione in inglese. |
| **D51** | **Repository pubblico dal primo giorno** | Il repository `fedcal/Telemedic` è **pubblico** e riceve la cronologia completa del lavoro. Condizione vincolante già in vigore: la dichiarazione «questo repository non è un dispositivo medico», la destinazione d'uso e i limiti d'uso devono essere presenti e visibili in ogni momento in cui il repository è accessibile - non pubblicabili «più avanti». Ne discende la priorità di `NOT-A-MEDICAL-DEVICE.md`, `DISTRIBUTION-POLICY.md` e della sezione di destinazione d'uso nel README. |
| **D52** | **Sequenza di lavoro approvata** | Si completa **tutta** la documentazione - le ventuno voci della guida dei fondamenti e le sette aree, più panoramica, conformità, roadmap e ADR - poi si costruisce il **sito di documentazione** con internazionalizzazione, lo si **pubblica su GitHub Pages** e se ne **verifica il funzionamento reale** (navigazione, ricerca, cambio lingua, link interni, build riproducibile). Nessuna area si considera chiusa finché non è navigabile online nelle due lingue. I collegamenti interni verso moduli non ancora scritti sono ammessi durante la stesura ma sono **bloccanti prima del primo deploy**. |

### Conseguenze di D12 da recepire in tutta la documentazione

1. Il progetto è **software dispositivo medico di Classe IIa**. Cade l'autocertificazione.
2. Serve identificare con chiarezza **chi è il fabbricante** (questione A2, ancora aperta): un progetto open source con contributori esterni non può avere un fabbricante indeterminato.
3. **IEC 62304**: la classe di sicurezza del software va determinata formalmente (A/B/C) e i processi richiesti seguono di conseguenza. Il telemonitoraggio spinge verso B o C.
4. La **gestione dei SOUP** diventa un obbligo formale e non una buona pratica: ogni dipendenza open source va censita, giustificata e sorvegliata.
5. Il **piano di sorveglianza post-commercializzazione** e la **vigilanza sugli incidenti** vanno progettati ora, non dopo.
6. La **tracciabilità requisiti → architettura → unità → test** diventa condizione di certificabilità: gli identificativi `RF-*`, `RNF-*`, `BR-*` prodotti nella fase di ricerca **non vanno mai rinumerati**.
7. La **valutazione clinica** richiede un piano, dati clinici e un rapporto: è un flusso di lavoro autonomo, con tempi propri, da avviare in parallelo allo sviluppo.
8. Il **regime linguistico**: la documentazione destinata all'utilizzatore e le istruzioni per l'uso seguono obblighi propri di lingua e contenuto ai sensi dell'Allegato I.

### Conseguenze di D25 - requisiti trasversali vincolanti

Questo vincolo prevale su ogni scelta di comodità implementativa. Nessuna funzionalità è «completa» se non lo soddisfa.

1. **Mobile first, non mobile compatible.** Si progetta partendo dallo schermo piccolo e dalla connessione peggiore, non adattando in seguito il desktop. Il paziente tipico di una televisita usa uno smartphone, spesso su rete mobile, spesso senza assistenza. Il DM 21 settembre 2022 lo impone espressamente alle infrastrutture regionali.
2. **Accessibilità come requisito funzionale.** WCAG 2.1 AA ed EN 301 549 integrali, con l'unica non-conformità dichiarata prevista da D24. Verifica automatizzata in integrazione continua **e** verifica manuale con tecnologie assistive reali: l'automazione intercetta una parte minoritaria dei difetti di accessibilità.
3. **Ingegneria dell'usabilità ai sensi di IEC 62366-1** - ora obbligatoria per effetto di D12. Comporta: specifica dell'uso previsto e del profilo degli utilizzatori, individuazione delle **caratteristiche legate alla sicurezza** e degli **errori d'uso a rischio**, valutazione **formativa** durante lo sviluppo e valutazione **sommativa** con utenti rappresentativi prima del rilascio, e il relativo file di ingegneria dell'usabilità. Gli utenti rappresentativi comprendono pazienti anziani e persone con disabilità: non sono un caso limite, sono la popolazione di riferimento.
4. **Progettazione per l'utente reale.** Anziani, persone con bassa alfabetizzazione digitale, disabilità sensoriali, motorie e cognitive, caregiver che assistono un terzo, professionisti sotto pressione di tempo. Ne discendono: percorsi brevi e reversibili, linguaggio piano, verifica tecnica preventiva prima della sessione, istruzioni comprensibili, ripiego telefonico, nessun passaggio obbligato che presupponga competenze informatiche.
5. **Conformità alle linee guida di design per i servizi digitali della PA** per le interfacce rivolte al cittadino in contesto pubblico, come impone il DM 21 settembre 2022. Design system del progetto costruito su componenti accessibili e verificati, non su componenti resi accessibili a posteriori.
6. **Il componente incorporabile eredita i medesimi obblighi.** Un integratore che incorpora Telemedic non deve poter degradarne l'accessibilità: le personalizzazioni di tema sono vincolate a soglie di contrasto verificate, e il rispetto delle preferenze di sistema (movimento ridotto, contrasto elevato, dimensione del carattere) non è disattivabile.
7. **Resilienza come requisito di accessibilità.** Banda scarsa, rete intermittente, dispositivo modesto: degradare in modo comprensibile - audio prima del video, avvisi chiari, ripresa della sessione - è parte dell'accessibilità reale, non dell'ottimizzazione.
8. **Multilingua**, come richiesto dal decreto per le infrastrutture regionali, con architettura di internazionalizzazione predisposta fin dall'inizio.
9. **Criterio di accettazione operativo**: ogni requisito funzionale del catalogo deve poter essere completato da un paziente anziano su smartphone in rete mobile, e da un professionista con la sola tastiera e uno screen reader. Se non è possibile, il requisito non è soddisfatto.


---

## 5-ter. DECISIONI DEL COMMITTENTE - terza tornata (25 agosto 2026)

Quattro questioni marcate `→ ORCH` sono state portate al committente e decise. Le risposte
sono vincolanti per ogni area e vanno recepite senza reinterpretazione.

> **D53 - Il traguardo del 30 novembre 2026 resta il primo rilascio installabile.**
> Il committente ha scelto questa opzione **dopo** che l'orchestrazione aveva esposto la
> tensione e raccomandato l'alternativa. La decisione è presa e non si rilitiga.
>
> **Ne discende un obbligo, non un'opzione: l'ambito del rilascio si riduce a ciò che una
> persona a tempo parziale può costruire e verificare in tre mesi.** Non esiste una terza via.
> L'area roadmap deve dichiarare esplicitamente che cosa entra, che cosa viene tagliato e
> quali tagli sono reversibili. Un ambito non ridotto sotto questa decisione produce
> semplicemente una data mancata in pubblico.
>
> **D52 va emendata di conseguenza** (vedi D56): la sequenza che collocava l'intera
> documentazione e la traduzione integrale *prima* di ogni riga di codice non è compatibile
> con questa data e con questa capacità.

> **D54 - Capacità dichiarata: contributore unico, a tempo parziale.**
> Non è più un'ipotesi: è il dato su cui ogni stima si costruisce. Ogni documento che
> assumeva una capacità diversa va allineato.
>
> **Conseguenza da accettare formalmente e non da aggirare.** Alcune registrazioni richieste
> dal sistema di gestione della qualità - audit interno, riesame del rilascio, verifica di
> configurazione eseguita da chi non ha scritto il codice - **richiedono soggetti distinti e
> non sono producibili internamente**. Non è un problema di ore disponibili: è un problema di
> persone diverse, e nessuna quantità di lavoro individuale lo risolve. Va stabilito quale
> sottoinsieme si accetta come rischio dichiarato e quale si copre acquisendo la funzione
> all'esterno. Chiude `Q-181`, lascia aperta la ripartizione di `Q-189`.

> **D55 - Destinazione d'uso del telemonitoraggio: congelata sulla raccolta differita.**
> Formulazione vincolante: «**raccolta differita di parametri per la revisione periodica del
> professionista**». Mantiene Classe IIa e classe di sicurezza software B.
>
> La formulazione alternativa - «monitoraggio in tempo reale dei parametri vitali» - è
> **esclusa**: porterebbe in Classe IIb e classe C, con 12–18 mesi e un ordine di grandezza di
> costo di differenza. Il congelamento va propagato a documentazione, interfaccia e
> comunicazione pubblica, e sottoposto a revisione esterna **prima** di ingaggiare qualunque
> Organismo Notificato. Chiude `Q-144`.
>
> Il modello di dominio era già scritto su questa formulazione: la decisione lo conferma e non
> comporta riscritture. Comporta però un divieto permanente - **nessuna funzione può essere
> aggiunta se sposta il sistema verso il tempo reale clinico**, e la valutazione va fatta prima
> di scrivere la funzione, non dopo.

> **D56 - Versione inglese: traduzione assistita, area per area, con controllo di divergenza.**
> La traduzione integrale (`D50`) si produce con agenti dedicati, un'area alla volta, e un
> controllo automatico che segnala la divergenza fra italiano e inglese quando uno dei due
> cambia. È l'unica modalità compatibile con i volumi attuali - oltre 400.000 parole - e con
> le date dichiarate. Chiude `Q-182`.
>
> **Emendamento a D52 imposto da D53.** La traduzione integrale **non è più un prerequisito di
> ogni riga di codice**: procede in parallelo allo sviluppo. Restano prerequisiti non
> negoziabili, perché il loro costo di omissione è irrecuperabile: le avvertenze pubbliche
> obbligatorie, la guida dei fondamenti e le aree di conformità e sicurezza. Il resto della
> traduzione è pianificato, non bloccante.


> **D57 - La roadmap e le date sono una pianificazione interna del progetto.**
> Nessun documento deve presentare i traguardi o il calendario come «il percorso di un
> soggetto terzo», «il calendario di chi certifica» o «traguardi di terzi». **Il titolare
> della pianificazione è il progetto.** Dove un passo richiede formalmente il ruolo di
> fabbricante, si scrive che quel ruolo **va costituito e formalizzato** - è un prerequisito
> interno con un suo tempo - invece di attribuire il passo a un terzo indefinito.
>
> **Che cosa non cambia.** Resta vero, e va continuato a dire senza attenuazioni, che **oggi
> il prodotto non reca marcatura CE** e che chi lo installa o lo immette sul mercato assume
> gli obblighi che ne derivano. D57 cambia **l'attribuzione della pianificazione**, non lo
> stato di fatto del prodotto.
>
> **Il limite che resta invalicabile.** Le date sono pianificazione interna e vanno dichiarate
> come tali. **Non si scrive in nessun luogo che il prodotto sarà marcato entro una data**: è
> precisamente l'affermazione che `V-171` vieta, e una pianificazione interna non diventa una
> promessa solo perché è nostra. Chiude `Q-179` quanto all'attribuzione; resta aperta la forma
> dell'avvertenza con cui il calendario viene pubblicato.


> **D58 - Il ruolo di fabbricante sarà assunto dal progetto. Il soggetto va costituito.**
> **Emenda D28, D45, D49 e il vincolo `V-06`** nella parte in cui attribuivano il percorso di
> certificazione a un soggetto esterno indefinito. Non li sostituisce del tutto: ne cambia il
> destinatario, non la sostanza tecnica.
>
> **Che cosa cambia.** Ovunque la documentazione dica «chi certifica» come terzo distinto dal
> progetto, il soggetto diventa **il progetto nel ruolo di fabbricante, ruolo ancora da
> costituire e formalizzare**. La costituzione di quel soggetto giuridico è un **prerequisito
> interno con un proprio tempo**, ed entra a calendario come tale. Le attività che D45
> attribuiva a «chi intende certificare» - costituzione del fabbricante, nomina della persona
> responsabile del rispetto della normativa, richieste di informazioni agli organismi
> notificati, avvio del piano di valutazione clinica - **sono nostre**.
>
> **Che cosa NON cambia, e va detto ogni volta che serve.**
> 1. **Oggi il prodotto non reca marcatura CE** e non è coperto da alcuna dichiarazione di
>    conformità. Questo è uno stato di fatto, non una posizione: resta vero finché non cambia,
>    e va dichiarato con la stessa evidenza di prima.
> 2. **Chi installa, integra o mette in servizio il software assume comunque gli obblighi che
>    ne derivano.** Che il progetto intenda certificare in futuro non trasferisce nulla a chi
>    installa una versione non certificata, e lasciarlo intendere sarebbe più dannoso del
>    silenzio.
> 3. **Il divieto di `V-171` resta intero.** Non si scrive in nessun luogo - documentazione,
>    comunicazione pubblica, materiale di presentazione - che il prodotto **sarà marcato entro
>    una data**. L'intenzione di certificare e la promessa di un esito datato sono due cose
>    diverse, e la seconda produce un effetto regolatorio che la prima non produce.
> 4. **La responsabilità verso il danneggiato non è escludibile per contratto** (Direttiva (UE)
>    2024/2853, art. 15). Vale ora come prima, e con più forza da quando l'intenzione è nostra.
>
> **Che cosa va riscritto.** Le avvertenze pubbliche `NOT-A-MEDICAL-DEVICE.md` e
> `DISTRIBUTION-POLICY.md`, il richiamo in evidenza del `README.md`, e i capitoli dell'area di
> conformità costruiti sulla figura del terzo (00, 02, 03, 04). La riscrittura **non attenua
> alcuna avvertenza**: cambia chi è il destinatario del percorso, non quanto il prodotto è
> pronto oggi.


## 5-quater. DECISIONI DEL COMMITTENTE - quarta tornata (26 agosto 2026)

Quattro questioni emerse dalla traduzione integrale della guida dei fondamenti e dell'area di
conformità. Tre nascono da **contraddizioni fra documenti già pubblicati**, trovate perché
tradurre è la revisione più severa che un testo riceva. La quarta chiude un `[NV]` che rendeva
non governabile l'intero piano.

> **D59 - Fra la guida didattica e l'area di specifica prevale la specifica.**
> Quando `docs/10_fondamenti/` e `docs/04_protocols/` dicono cose diverse sullo stesso oggetto,
> l'area di specifica è normativa e la guida è didattica: si allinea la guida. La ragione non è
> gerarchica ma sostanziale - **un vincolo `V-` non può essere contraddetto da un modulo che
> insegna**, perché chi impara dal modulo scrive codice non conforme e non se ne accorge.
>
> La regola ha chiuso cinque divergenze: il prefisso dei tipi di evento (`it.telemedic.` →
> `telemedic.`, che era incompatibile con il catalogo pubblico), la forma dell'attributo `source`
> di CloudEvents, la politica di ritentativo dei webhook (**da «fino a 24 ore complessive» a
> «dodici tentativi, copertura di circa settantadue ore»**, `P-08`), il `contentType` del
> contenitore video - che ora dichiara «negoziato a runtime e mai presunto», come impone `V-11` -
> e il codice di stato per `If-Match` mancante, ora `428` secondo `P-02`.
>
> **La regola vale per difetto, non senza eccezioni.** Dove la guida è più corretta della
> specifica, si corregge la specifica: è il caso di `D60`. L'eccezione va argomentata sul merito
> e registrata, mai applicata in silenzio.

> **D60 - La firma degli eventi in uscita è asimmetrica per impostazione predefinita.**
> `04_protocols/07 §4.1` dichiarava predefinito lo schema simmetrico HMAC «perché è ciò che
> l'integratore tipico sa consumare», mentre `10_fondamenti/13 §6.3` elencava il segreto condiviso
> **fra gli errori tipici**. La contraddizione era pubblicata su entrambe le lingue.
>
> Prevale la guida, contro `D59`, per tre ragioni convergenti: `V-162` prescrive già che il
> segreto condiviso **non sia offerto come modalità predefinita** nel perimetro di `RU-1`;
> l'ordine di sacrificio dell'ambito (`03 §6.2`, riga `S-6`) dichiara che se la firma asimmetrica
> cade **il segreto condiviso non ne è il sostituto ammesso**; e tre aree già pubblicate -
> `07_integration/03`, `10_fondamenti/18`, `00_overview/03` - dichiaravano già l'asimmetrico come
> predefinito. `04_protocols/07` era **l'unico documento fuori linea**.
>
> **Il costo si dichiara, non si nasconde.** Lo schema simmetrico resta disponibile come opzione
> per destinazione, perché l'integratore di fascia PMI sa consumare HMAC e non sempre sa consumare
> RFC 9421. Attivarlo significa **rinunciare al non ripudio per quella destinazione**, e la
> rinuncia va registrata insieme alla configurazione, non lasciata implicita.

> **D61 - I contesti delimitati sono tredici: il gateway terminologico è un contesto.**
> `16-architettura-del-progetto §4.2-4.3` ne dichiarava tredici; gli alberi dei sorgenti in
> `17-ambiente-di-sviluppo §3.4`, `18-contribuire-per-area` e `01_technical/02-backend` ne
> elencavano dodici, collocando il gateway sotto `platform/`.
>
> Prevale il tredici. Il gateway ha un contratto proprio, un linguaggio proprio e una politica di
> disattivazione per sistema di codifica (`ADR 0016`): è un contesto delimitato, non un componente
> trasversale. Collocarlo in `platform/` avrebbe inoltre autorizzato ogni contesto a dipenderne
> direttamente, che è esattamente ciò che `ADR 0016` vieta.
>
> Conseguenza operativa: `platform/terminology-gateway/` diventa `contexts/terminology/` in tutti
> e tre gli alberi, in entrambe le lingue. `CTX-10` resta il suo identificativo.

> **D62 - Capacità quantificata: dieci-venti ore a settimana. Emenda `D54`.**
> `D54` dichiarava «contributore unico, a tempo parziale» **senza quantificare**, e
> `01-principi-e-metodo §4.1` indicava proprio questo `[NV]` come la ragione per cui il progetto
> non produce stime di sforzo. Il `[NV]` è chiuso.
>
> **Che cosa non cambia.** Le date di `02-traguardi` restano **allocazioni del calendario
> residuo**, non stime: mancano ancora la cronologia di consegna su cui calibrare e un'unità che
> attraversi lavori eterogenei. Ciò che protegge il 30 novembre 2026 resta l'ordine di sacrificio
> dell'ambito, non una previsione di sforzo.
>
> **Che cosa cambia.** L'aritmetica diventa verificabile, e il risultato va detto: la finestra per
> il codice applicativo è di **quarantanove giorni** - fra `T-03` del 26 settembre e `T-08` del 14
> novembre, perché `V-182` vieta ogni riga applicativa prima della catena di costruzione - cioè
> circa **settanta-centoquaranta ore**. Nella stessa finestra `T-08` porta **due criteri di classe
> «mesi»**: il registro immutabile, che `R-20` dichiara «il singolo elemento di maggiore sforzo
> del catalogo», e il percorso verticale completo. **L'aritmetica non chiude**, e questa
> dichiarazione è l'innesco della revisione fuori cadenza di `00 §8.2`.
>
> Ne discende un obbligo già deciso: **si aggiunge ora all'ordine di sacrificio un taglio
> reversibile che incida su `T-08`**, con la procedura ordinaria e prima che la pressione di
> calendario arrivi - perché la regola 2 di `03 §6.1` vieta di decidere un taglio sotto pressione.

## 6. Archetipo dell'integratore target (RISERVATO - profilo anonimizzato)

> **REGOLA DI RISERVATEZZA (R0) - VINCOLANTE PER OGNI AGENTE.**
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

- **V1 - Sovranità del dato**: nessun componente obbligatorio ospitato fuori dall'UE. Nessuna
  dipendenza runtime da servizi cloud US-based. Media P2P; TURN self-hosted.
- **V2 - Separazione MDR**: il confine tra "veicolo di comunicazione" (fuori dal perimetro
  diagnostico) e "supporto alla decisione clinica" va reso esplicito nell'architettura.
  La regola 11 MDR classificherebbe in **Classe IIa** (con Organismo Notificato) il software
  che fornisce informazioni usate per decisioni diagnostiche o terapeutiche. La produzione di
  `DiagnosticReport` va quindi progettata come **persistenza di contenuto redatto dal medico**,
  non come generazione autonoma di informazione clinica.
- **V3 - Integrabilità totale**: ogni capacità del sistema deve essere raggiungibile da un
  sistema terzo tramite API documentata. Nessuna funzionalità accessibile solo dalla UI.
- **V4 - Tenant-awareness**: ogni entità di dominio, ogni evento e ogni riga di audit portano
  l'identificativo di tenant.
- **V5 - Auditabilità immutabile**: ogni accesso a dato sanitario è tracciato in modo
  non ripudiabile e non alterabile.
- **V6 - Usabilità, accessibilità, mobile first**: requisito trasversale di tutto il sistema.
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
