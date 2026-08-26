# Chiusura delle verifiche documentali V1-V10 + requisiti tecnici minimi

**Agente B1 - seconda ondata di ricerca - Telemedic**
**Data: 25 agosto 2026**

---

## 0. Nota metodologica e avvertenze

**Fonti effettivamente lette.** Il testo del DM 19 novembre 2025 è stato letto sulle **pagine della Gazzetta Ufficiale Serie generale n. 301 del 30 dicembre 2025** (pagg. 36–74), acquisite in formato immagine tramite un mirror documentale (`medicoeleggi.com`) che riproduce le pagine GU con intestazione e numerazione originali. **Il mirror si autodichiara «documento non autentico»**: ho verificato che le pagine riportano l'intestazione «GAZZETTA UFFICIALE DELLA REPUBBLICA ITALIANA - Serie generale - n. 301 - 30-12-2025» e la numerazione progressiva di pagina, il che rende la riproduzione attendibile, ma **prima di trasferire citazioni letterali nella documentazione di conformità va acquisito il PDF firmato dalla GU certificata**. L'articolato (artt. 1–19) è stato letto nella trasposizione HTML dello stesso mirror: per gli articoli l'attendibilità è inferiore rispetto agli allegati letti come immagine GU, e lo segnalo voce per voce.

**Fonti primarie parlamentari.** Per la legge di bilancio 2026 ho usato il dossier **Camera dei deputati, «Legge di bilancio 2026 - Legge 30 dicembre 2025, n. 199 - Profili di interesse della XII Commissione», 6 febbraio 2026** (`documenti.camera.it/leg19/dossier/pdf/AS0477.pdf`), documento istituzionale primario.

**Avvertenza su Normattiva.** Le interrogazioni a `normattiva.it` tramite fetch automatico hanno restituito **contenuti non affidabili** (rubriche di articoli incoerenti con la struttura reale della legge). Ho scartato tali risultati e li segnalo come inutilizzabili con questo strumento: **Normattiva va consultato a mano**.

**Budget di ricerca.** Il budget di ricerca web è stato esaurito prima di completare V5 e V10, che restano dichiarate come non risolte con indicazione puntuale di dove cercare.

---

## V1 - DM 19 novembre 2025: testo integrale - **RISOLTA (con riserva formale sulla certificazione GU)**

### V1.a Struttura dell'atto

**Titolo esatto** (verificato su `gazzettaufficiale.it/eli/id/2025/12/30/25A06938/SG`): «**Disciplina del trattamento dei dati personali nell'ambito della infrastruttura della Piattaforma nazionale telemedicina**» - DECRETO del Ministero della salute 19 novembre 2025, GU Serie generale n. 301 del 30 dicembre 2025, atto 25A06938, pag. 27.

Nota: R3 riportava il titolo con «*dell'infrastruttura della Piattaforma nazionale di telemedicina*». Il titolo pubblicato in GU è «*della infrastruttura della Piattaforma nazionale telemedicina*» (senza «di»). Correzione minore ma da recepire nelle citazioni.

**Articolato (19 articoli):**

| Art. | Rubrica |
|---|---|
| 1 | Definizioni |
| 2 | Piattaforma nazionale di telemedicina |
| 3 | Caratteristiche e contenuti della INT e delle IRT |
| 4 | Servizi abilitanti per l'erogazione dei servizi minimi di telemedicina |
| 5 | Accesso dell'assistito alla IRT |
| 6 | Accesso alla IRT per finalità di cura |
| 7 | Modifiche al decreto 7 settembre 2023 (FSE 2.0) |
| 8 | Servizi della INT |
| 9 | Modifiche al decreto EDS |
| 10 | Informativa all'assistito |
| 11 | Diritti dell'interessato |
| 12 | Periodo di conservazione dei dati |
| 13 | Titolarità dei trattamenti della PNT |
| 14 | Registrazione delle operazioni |
| 15 | Misure di sicurezza |
| 16 | Allegati |
| 17 | Disposizioni transitorie |
| 18 | Disposizioni finanziarie |
| 19 | Entrata in vigore |

**Allegati (5):**

| All. | Titolo | Pagine GU |
|---|---|---|
| 1 | Telemedicina - Dati e documenti generati dalle IRT e conferiti al FSE | 36–52 |
| 2 | Telemedicina - Integrazione servizi EDS | 53–55 |
| 3 | Telemedicina - Servizi della INT e delle IRT (PNT) | 56–68 |
| 4 | Telemedicina - Misure di sicurezza PNT | 69–74 |
| 5 | Dettaglio PNT - Flusso dati telemedicina | - (non letto) |

### V1.b **Scoperta non presente in R3: il NIT**

L'**Allegato 4, § 8** introduce una terza componente architetturale che R3 non aveva individuato: il **NIT - nodo di interoperabilità della telemedicina**, realizzato ai sensi dell'**art. 3, comma 4** del decreto.

> «Il NIT garantisce, **senza meccanismi di persistenza di dati**, l'interoperabilità delle IRT interessate al fine di garantire la trasmissione dei dati, immagini e documenti, mediante **microservizi completamente automatizzati**.»
> «L'architettura del NIT prevede un modello a microservizi erogato in **modalità SaaS multi-tenancy**, dove ogni componente funziona in modo autonomo e comunica attraverso API. All'interno dell'architettura a microservizi, è presente un modulo **IAM** […] migliora l'integrazione tra sistemi tramite meccanismi di **Single Sign-On (SSO)**.»
> «L'API Management offre un **unico punto di ingresso** per tutte le richieste esterne. I client non interagiscono direttamente con i microservizi ma attraverso l'API Management […]. Questo può includere l'uso di token **JWT, OAuth, API key**.»

**Il NIT è il punto di aggancio interregionale**: è il componente che rende operativa la regola del DM 21 settembre 2022 secondo cui le API dei servizi minimi devono essere uniformi e accessibili tra IRT.

### V1.c Allegato 4 - misure di sicurezza (testo GU, tradotto in requisiti)

Struttura dell'Allegato 4: § 1 Architettura della PNT; § 2 Continuità del servizio; § 3 Protezione dei dati; § 4 Tecniche e modalità di elaborazione; § 5 Trattamenti; § 6 Registrazione e monitoraggio delle operazioni; § 7 Misure di sicurezza IRT; § 8 Misure di sicurezza NIT. I §§ 1–5 «si intendono applicabili alla Piattaforma nazionale di telemedicina nella sua interezza, **sia alle IRT che alla INT**».

Passaggi testuali di rilievo:

**Premessa - classificazione ACN obbligatoria.**
> «l'applicazione del **Regolamento per le infrastrutture digitali e per i servizi cloud per la pubblica amministrazione n. 21007, adottato dall'ACN il 27 giugno 2024**, determina la necessità di: 1) operare la **classificazione** per la Piattaforma Nazionale di Telemedicina (PNT) […]; 2) prevedere un coerente livello di **adeguamento per le infrastrutture digitali e per i servizi cloud delle Amministrazioni** […]; 3) prevedere un coerente livello di adeguamento per le infrastrutture dei servizi cloud e di **qualifica dei servizi cloud dei fornitori**.»

Questo **conferma e irrigidisce** il § 8.1 di R3: il Decreto direttoriale ACN n. 21007/24 non è solo «l'atto vigente da verificare», è **espressamente richiamato come vincolo dal decreto sulla PNT**.

**§ 2 - continuità operativa.** Aggiornamenti software secondo i rilasci delle case produttrici; configurazione delle basi dati per ripristino completo senza perdita di integrità, riservatezza e disponibilità; **configurazioni cloud che garantiscono la continuità operativa tramite le Availability Zone definite sia per la INT sia per le IRT e puntualmente definite nei relativi documenti tecnici di progetto**; backup periodico; data recovery; **procedure per la verifica dell'efficacia sia del backup che del possibile, successivo, ripristino**.

**§ 3 - protezione dei dati.**
> «la definizione delle predette misure terrà conto di quanto indicato dai **Considerando n. 84, 89, 90 e 91** del GDPR nella parte che invita allo svolgimento di una **valutazione d'impatto sulla protezione dei dati prima dell'avvio del trattamento**.»
> «L'accesso ai dati avviene previo superamento di procedure di autenticazione informatica basate sui sistemi nazionali **SPID, CIE e TS-CNS**, sia per i cittadini che per gli operatori.»
> «la INT e le IRT prevedono **sempre un'autenticazione a due fattori con utilizzo di un codice OTP**.»

Elenco puntuale delle misure (testuale): cifratura dei dati *at rest* e *in transit* mediante algoritmi robusti allo stato dell'arte; **cifratura dell'infrastruttura**; **isolamento logico della rete con tecniche di microsegmentazione e protezione perimetrale**; **virtual patching infrastrutturale e applicativo**; autenticazione e profilazione degli utenti; controllo dell'accesso alle applicazioni ed ai dati; protezione e limitazione degli accessi amministrativi; integrità dei messaggi scambiati; monitoraggio di sicurezza della rete.

E ancora: modelli strutturati di gestione delle chiavi crittografiche **anche garantite da HSM**; **IDS e IPS collocati nei punti di accesso alla rete e su ogni nodo**; firewall; **WAF e API security**; antivirus e antimalware; **strumento di controllo e monitoraggio per l'accesso degli amministratori di sistema**; **Transparent Data Encryption (TDE)**; crittografia simmetrica e asimmetrica; **hardening dei sistemi operativi**; sistema di tracciatura delle operazioni di accesso «sia tramite funzioni applicative o tramite accesso diretto»; **Threat Intelligence**; attività di sicurezza preventiva periodica; **SIEM e SOAR**; **processo ricorrente di analisi del rischio finalizzato anche alla revisione della DPIA**.

**§ 4 - elaborazione.** La pseudonimizzazione è effettuata **dall'EDS**, non dalla INT. Nota in calce, testuale:
> «Tale processo viene eseguito in sequenza, in modo automatico, **senza intervento umano e 1 volta nelle 24 ore**. […] tale processo di aggiornamento viene normalmente eseguito **nelle ore notturne**.»
> «verifica puntuale del rispetto di specifiche delle regole di clusterizzazione, al fine di garantire che nessun risultato […] possa essere riconducibile ad un singolo individuo (**cardinalità uno**), indipendentemente dal livello o dalla dimensione di analisi.»

**§ 5 - trattamenti.** **Principio di Separazione**: «i dati clinici saranno separati dai dati amministrativi e vengono gestiti in maniera distribuita da componenti dedicati. Questo permette il **disaccoppiamento tra dati** rendendo le informazioni sicure e non decodificabili». Protezione delle chiavi con **HSM per la INT**.

**§ 6 - logging.** Sistema di logging per la tracciabilità delle operazioni di cui all'art. 14; log protetti; **registrazione delle operazioni di consultazione dei log da parte del personale autorizzato**; **log conservati per 24 mesi e cancellati alla scadenza**; trattamento dei log **in forma aggregata**, in forma non aggregata solo «laddove ciò risulti indispensabile ai fini della verifica della correttezza e legittimità delle singole operazioni effettuate»; funzioni di *detection*, monitoraggio dell'accesso, *auditing*.

**§ 7 - misure di sicurezza IRT (il passaggio più importante per un fornitore).**
> «Ferme restando le misure di sicurezza di cui al "**capitolo 5 dell'Allegato 1 - Capitolato Tecnico della procedura aperta, ai sensi dell'art. 60 del d.lgs. n. 50/2016, per la stipula di un accordo quadro per l'affidamento del servizio di infrastruttura regionale di telemedicina - `aria_2023_807`**" - adottate per tutte le IRT - ivi incluse quelle che non sono state parte della suddetta procedura, le Regioni/PPAA adottano strumenti e soluzioni per garantire il rispetto degli obblighi di cui agli articoli 24, 32 e 35 del Regolamento con particolare riguardo:
> - alla **verifica regolare dell'efficacia delle misure tecniche e organizzative** adottate […];
> - alla **conservazione dell'inventario delle componenti software in uso comprensive delle librerie di terzi e/o open source** in modo da poter rispondere più tempestivamente in caso di segnalazioni di vulnerabilità (**SBOM SW bill of materials**).»

**Questo è un risultato dirimente e va evidenziato nella documentazione di progetto.** Un decreto ministeriale **incorpora per rinvio il capitolo 5 del capitolato tecnico di una gara regionale** (procedura ARIA `aria_2023_807`, Regione Lombardia, pubblicata il 22 giugno 2023, aggiudicata l'8 maggio 2024) ed estende le misure ivi previste a **tutte** le IRT, anche a quelle che non hanno partecipato alla gara. È lo stesso vizio di tracciabilità normativa già segnalato da R3 al § 4.1 per le indicazioni AGENAS, ma qui è **peggiore**: la fonte cogente è un documento di gara. **Il capitolo 5 del capitolato `aria_2023_807` non è stato reperito in questa ricerca** (la pagina di gara su `ariaspa.it` e su Sintel esiste, ma la documentazione tecnica non è stata scaricata): va richiesto ad ARIA S.p.A. o recuperato dagli atti della procedura su Sintel (`sintel.regione.lombardia.it`, ID gara 171039205).

**Nota SBOM.** Il decreto impone testualmente la SBOM, con menzione esplicita delle **librerie open source**. La decisione D10 del *context pack* (SBOM CycloneDX) è quindi **conformità normativa italiana**, non buona pratica.

**§ 8 - NIT.** Oltre a quanto sopra: **Security e Privacy by Design e by Default**; gestione certificati con **CA propria per ciascuna organizzazione**, servizio **OCSP e/o CRL**, cambio di stato del certificato compromesso «**entro un'ora dalla ricezione della notifica**» e diffusione dello stato «**entro un'ora dal cambio di stato**», **obbligo di verificare lo stato di revoca a ogni instaurazione di comunicazione**; HSM per le chiavi private della CA; **mutua autenticazione con certificato client per i sistemi applicativi terzi**, secondo le **Linee Guida Funzioni Crittografiche ACN**; **IAM + PAM** per gli amministratori; **«L'infrastruttura IAM non permette a nessun utente di effettuare accessi multipli contemporanei utilizzando le proprie credenziali»**.

**Residenza dei dati - divergenza da segnalare.**
> «L'infrastruttura NIT sarà completamente dedicata e realizzata su **Cloud Service Provider che disponga di infrastrutture (*Region*) residenti sul territorio UE** secondo la attuale normativa vigente sui servizi cloud alle Pubbliche Amministrazioni (Regolamento […] n. 21007/24 del 27 giugno 2024, e applicabile dal 1° agosto 2024), nonché quella sul GDPR.»

Il DM 21 settembre 2022 prescriveva i tre modelli di *deployment* «**su territorio nazionale**». Il DM 19 novembre 2025 per il NIT prescrive «**territorio UE**». **Le due formulazioni non coincidono**: R3 (§ 8.2) aveva concluso che il requisito italiano è più stringente del vincolo V1 del *context pack*. La conclusione va rivista: il vincolo è **almeno UE per il NIT**, **nazionale per le IRT/PNT ai sensi del DM 2022 e della classificazione ACN dei dati critici**. La documentazione deve rappresentare entrambi i livelli, senza appiattirli.

### V1.d Allegato 2 - integrazione con l'EDS

Testo GU pagg. 53–55. Integra l'Allegato A del decreto EDS (DM 31 dicembre 2024) con quattro servizi:

**Finalità di cura** - nuovo servizio «**Consultazione dei dati e documenti relativi alle prestazioni di telemedicina**» (aggiunto al § 5.2 dell'All. A al decreto EDS): a valle della ricerca dell'assistito, il professionista consulta tipologia di prestazione, data, quesito diagnostico, struttura sanitaria, medico specialista, e da lì visualizza i documenti associati; **«il professionista deve poter visualizzare esclusivamente i dati estratti dai documenti che l'assistito non ha oscurato»**. Attori: professionista, EDS, Anagrafe Consensi INI. Riferimento: artt. 13 e 14.

**Finalità di governo** (aggiunti al § 5.6) - tre servizi di estrazione di dati pseudonimizzati richiesti da Uffici delle Regioni/PP.AA., Ministero della salute e AGENAS: (a) **programmazione** delle prestazioni; (b) **monitoraggio** delle prestazioni, «anche per la valutazione del raggiungimento dei target e milestone»; (c) **individuazione e aggiornamento delle tariffe** delle prestazioni di telemedicina; (d) **valutazione delle tecnologie sanitarie (HTA)**.

Per ciascuno l'EDS esegue la stessa sequenza: identifica gli assistiti corrispondenti ai parametri; **sostituisce all'identificativo dell'assistito lo pseudonimo**; **esclude dai dati da restituire tutti gli elementi identificativi diretti**; estrae i dati pertinenti e li restituisce al richiedente. Dimensioni di delimitazione ammesse: base temporale, caratteristiche anagrafiche (sesso, classe di età, ASL di assistenza), caratteristiche sanitarie (codici di esenzione, patologie in essere o pregresse), **base distrettuale (ASL di erogazione)**, tipologia di servizio minimo erogato, caratteristica del regime di erogazione e assistenza.

**Rilevanza per Telemedic**: la piattaforma non parla con l'EDS. Alimenta il FSE; l'EDS estrae. Ma le **dimensioni di analisi sopra elencate devono esistere come attributi strutturati** nei documenti prodotti, altrimenti il dato non è estraibile. In particolare: *tipologia di servizio minimo* e *regime di erogazione e assistenza* sono attributi obbligatori di fatto.

### V1.e Art. 17 - disposizioni transitorie (testo, fonte HTML del mirror)

- **c. 1** - conferma la lettura di R3: i trattamenti della PNT per finalità **diverse** da diagnosi, cura e riabilitazione descritti nelle Linee guida approvate con DM 21 settembre 2022 **sono sospesi fino all'aggiornamento delle stesse linee guida**.
- **c. 2** - l'aggiornamento avviene «con decreto da adottare successivamente all'entrata in vigore del presente decreto, **previo parere dell'Autorità garante**». **Alla data odierna non risulta adottato**: quindi la sospensione è tuttora operante.
- **c. 3** - all'entrata in vigore, il **Portale nazionale FSE** presenta al primo accesso dell'assistito l'informativa delle IRT e l'informativa integrata ex art. 11, c. 5.
- **c. 4** - «**La gestione del PN-DT sarà trasferita ad Agenas entro novanta giorni dalla data del collaudo.**» → **conferma il dato che R3 aveva marcato [NON VERIFICATO]**.

### V1.f Altri articoli con obblighi tecnici (fonte HTML del mirror - riverificare in GU)

- **Art. 3, c. 4** - clausola decisiva per un fornitore alternativo: «Le regioni possono erogare telemedicina con **infrastrutture, applicativi o strumenti diversi**, purché rispettino **standard tecnici certificati da Agenas** e alimentino il Fascicolo Sanitario Elettronico.» **Esiste quindi una porta d'ingresso normativa esplicita per soluzioni non provenienti dalle gare capofila**, subordinata alla certificazione degli standard tecnici da parte di AGENAS (funzione svolta dal micro-servizio INT «**Gestore Soluzioni di Telemedicina (GST)**», che «svolge il compito di assistere, nel **Processo di Validazione**, gli erogatori di servizi di telemedicina che interoperano con l'ecosistema sanitario digitale nazionale» - All. 3, § 3.1). **Questo modifica sostanzialmente la conclusione del § 5.4 di R3.**
- **Art. 4, c. 4** - «Le IRT delle RdE consentono ai professionisti sanitari la generazione di dati e documenti, indicati all'art. 7, **che sono conferiti dalle strutture sanitarie al Fascicolo sanitario elettronico**.» Il soggetto conferente è la **struttura**, non la piattaforma.
- **Art. 7, c. 3** - «Entro il **30 giugno 2026** è prevista la messa a regime dell'integrazione dei contenuti del FSE.» **Termine scaduto alla data odierna.**
- **Art. 12** - «I dati personali relativi all'**autenticazione e all'accesso** ai servizi minimi di telemedicina, offerti dalla IRT, sono conservati per **dodici mesi**.» «Le IRT **non conservano** i dati e documenti generati ai sensi dell'art. 4, comma 4.»
- **Art. 14** - registrazione di quattro tipologie di operazione: (a) autorizzazione all'accesso a seguito di autenticazione, da parte del soggetto erogatore, dell'assistito o di un suo delegato; (b) accesso ai servizi minimi; (c) accesso dell'assistito o delegato; (d) **generazione di dati e documenti**. Per (a)-(c): data e ora, servizio di telemedicina utilizzato, identificativo univoco del soggetto. Per (d): data e ora di creazione, **tipologia di documento**, identificativo del soggetto che lo ha generato. **c. 4: «L'assistito può prendere visione delle registrazioni […] accedendo all'apposita funzionalità presente nelle IRT.»**
- **Art. 15** - misure ex artt. 25 e 32 GDPR; rispetto dell'**art. 51 CAD** e delle linee guida AgID/ACN; sistemi di autorizzazione **basati su ruoli**; **verifiche periodiche dei profili**; protocolli di comunicazione sicuri basati su standard crittografici; cifratura e separazione dei dati sensibili; tracciabilità degli accessi; audit log; pseudonimizzazione e anonimizzazione; **sessioni formative** su utilizzo, rischi e misure; in caso di incidente il titolare fornisce «**tempestivamente**» ogni informazione utile per gli obblighi ex artt. 33-34 GDPR.

### V1.g Allegato 3 - servizi della INT e delle IRT

**Sistemi centrali con cui la PNT garantisce integrazione** (All. 3, § 2): SPID/CIE, **FSE nazionale**, **ANA**, **PagoPA**, **Sistema Tessera Sanitaria**, **PDND**, **Anagrafe nazionale dei consensi**.

**Servizi abilitanti della INT** (§ 3): Gestore soluzioni telemedicina (GST); **Business Glossary** con quattro moduli - **Terminology Server** (CodeSystem, ValueSet, ConceptMap **FHIR**), **Authoring Tool**, **Library Repository** (archiviazione **FHIR** delle risorse con cui sono modellate linee guida, PDTA e protocolli), Linee di indirizzo/PDTA/Protocolli; **Cruscotto per il Monitoraggio e la Reportistica**.

> «consentendo di strutturare i contenuti su una piattaforma tecnologica altamente evoluta e svilupparli secondo il linguaggio **Health Level Seven (HL7) Clinical Quality Language (CQL)**, uno standard internazionale definito all'interno delle specifiche HL7 FHIR. Tale linguaggio supporta la logica implementativa **Sistema di supporto alle decisioni cliniche (Clinical Decision Support System - CDSS)**.»

**Attenzione MDR**: il decreto colloca esplicitamente un CDSS dentro l'architettura nazionale, ma **a livello INT** (a titolarità AGENAS), non a livello IRT. Ne discende che una IRT che *consumi* linee guida CQL dal Library Repository nazionale non produce autonomamente informazione clinica. Va tracciato nell'analisi MDR.

**Nuova classificazione dei micro-servizi** (§ 4.1) - **si affianca**, non sostituisce, quella specifici/trasversali/opzionali del DM 21 settembre 2022:
- **Servizio essenziale (*core*)** - «componente applicativa essenziale per l'erogazione del servizio verso pazienti e personale sanitario»;
- **Servizio complementare locale** - «componente applicativa ausiliaria che completa il modello di servizio del contesto in cui è integrato […] adottando i modelli di interoperabilità standard definiti a livello nazionale (es. **collaborazione applicativa mediante API REST**)»;
- **Servizio sperimentale innovativo**.

**Micro-servizi essenziali *core* per la televisita** (elenco testuale): *Gestione dei questionari (Survey management)*; *Motore di workflow*; *Sistema di Video conferenza*; *Sistema di gestione eventi e notifiche*; *Arruolamento del paziente (Patient onboarding)*; *Messaggistica (Chat messaging)*.

> Chat messaging: «Sistema di messaggistica istantanea che consente una comunicazione asincrona o in tempo reale e la condivisione di file, **senza persistenza di dati e documenti**, adottando protocolli sicuri in termini di **crittografia end to end delle conversazioni**.»

**Questo è un requisito normativo esplicito di E2EE sulla chat.** Il *context pack* prevede DTLS-SRTP per il media ma **non** dichiara E2EE sulla messaggistica: va colmato.

Per il **teleconsulto** i *core* sono: *Gestione lista di lavoro*, Sistema di videoconferenza, Chat, Patient onboarding, Eventi e notifiche, ***Definizione di secondo parere (Second opinion)***.
Per **telemonitoraggio/telecontrollo**: *Definizione percorso di cura*, Motore di workflow, ***Validazione qualità dei dati***, Video conferenza, ***Configuratore Dispositivi Medici*** (soglie di allarme, frequenza, intervalli critici), *Formazione paziente/caregiver*, Survey, ***Case manager***, Eventi e notifiche, Chat.
Per la **teleassistenza**: Survey, Definizione percorso di cura, Patient onboarding, Video conferenza, Motore di workflow, Eventi e notifiche, ***Gestione del gruppo multiprofessionale di cura***, Chat, ***Supporto caregiver*** (con canale digitale dedicato, «ad esempio, *MobileApp*»).

Chiusura testuale: «Si precisa che l'elenco dei microservizi (core) è fornito **a titolo esemplificativo e non esaustivo**, e potrà essere soggetto a integrazioni e aggiornamenti in base alle necessità operative e strategiche della PNT.»

**Gestione degli accessi** (§ 5): titolari dell'identificazione sono **i provider SPID e CIE**; per autenticazione/autorizzazione sono titolari la **regione di erogazione per i professionisti** e la **regione di assistenza per gli assistiti**, AGENAS per la INT. Fasi sequenziali obbligatorie: registrazione preliminare (identificazione personale + contesti operativi) → attribuzione del profilo da parte dell'**amministratore di sicurezza** → identificazione e autenticazione. **Livello di Garanzia almeno pari a L2** (LoA 2). Nelle more delle regole SPID professionale, «è ammesso l'utilizzo di **identità SPID ad uso personale** escludendo l'uso di dati personali attinenti alla sfera privata del soggetto». All'autenticazione «sono acquisiti **esclusivamente il codice fiscale, il nome e il cognome**».

**Profili di accesso** (§ 5.2), sei ruoli di prima applicazione: Assistito; Medico e altri dirigenti sanitari (odontoiatra, farmacista, biologo, psicologo, chimico, fisico); Infermiere/Ostetrica; Professioni tecnico sanitarie (TSRM, tecnico di neurofisiopatologia); Professioni sanitarie assistenziali e della riabilitazione (dietista, fisioterapista, logopedista, ortottista, TNPEE, tecnico riabilitazione psichiatrica); Personale Amministrativo.

**Matrice di visibilità (tabella «Accesso in consultazione delle IRT per la finalità di diagnosi, cura, riabilitazione»)** - dato di implementazione diretta:

| Documento | Medico/dirig. | Infermiere/Ostetrica | Prof. tecnico san. | Prof. assist./riab. | Amministrativo | Assistito |
|---|:-:|:-:|:-:|:-:|:-:|:-:|
| Dati identificativi e amministrativi | SÌ | SÌ | SÌ | SÌ | SÌ (solo amm.) | SÌ |
| Prescrizione ed erogazione televisita/teleassistenza/telemonitoraggio | SÌ | SÌ | SÌ | SÌ | SÌ | SÌ |
| Richiesta di teleconsulto | SÌ | - | | | - | SÌ |
| **Referto di specialistica per la televisita** | SÌ | **-** | SÌ | SÌ | **-** | SÌ |
| Relazione collaborativa teleconsulto/teleconsulenza | SÌ | SÌ | SÌ | SÌ | - | SÌ |
| Relazione clinico-assistenziale conclusiva teleassistenza | SÌ | SÌ | SÌ | SÌ | - | SÌ |
| Tesserino dispositivi telemonitoraggio/teleriabilitazione | SÌ | SÌ | | | - | SÌ |
| Piano di telemonitoraggio/teleriabilitazione/teleassistenza | SÌ | SÌ | | | - | SÌ |
| Report rilevazioni telemonitoraggio | SÌ | SÌ | | | - | SÌ |
| Relazione finale telemonitoraggio/teleriabilitazione | SÌ | SÌ | | | - | SÌ |

Nota testuale: «Il personale amministrativo accede limitatamente ai dati amministrativi.»

**Da rilevare: il referto di televisita non è visibile a infermiere e ostetrica**, a differenza della relazione collaborativa del teleconsulto e della relazione conclusiva della teleassistenza. È una regola di autorizzazione fine, non deducibile dai profili FSE generali.

---

## V4 - Referto di televisita nel FSE - **RISOLTA** (la verifica più importante)

**L'assunzione di R3 era errata.** Non si tratta di veicolare il referto di televisita come «Referto di Specialistica Ambulatoriale (RSA)». Il **DM 19 novembre 2025, art. 7, comma 1** aggiunge all'**art. 3, comma 1 del DM 7 settembre 2023 (FSE 2.0)** dieci nuove lettere, creando **dieci nuove tipologie documentali del FSE dedicate alla telemedicina**:

| Lett. | Tipologia documentale FSE | Paragrafo All. 1 |
|---|---|---|
| n) | prescrizione televisita, teleassistenza e telemonitoraggio ai sensi del **DM 2 novembre 2011** | 2.18 |
| o) | **richiesta teleconsulto** | 2.19 |
| p) | **referto di specialistica per la televisita** | 2.20 |
| q) | **relazione collaborativa per il teleconsulto/teleconsulenza** | 2.21 |
| r) | relazione clinico-assistenziale conclusiva per la teleassistenza/teleriabilitazione | 2.22 |
| s) | tesserino dispositivi per il telemonitoraggio | 2.23 |
| t) | piano di telemonitoraggio / teleriabilitazione e teleassistenza | 2.24 |
| u) | report rilevazioni telemonitoraggio | 2.25 |
| v) | report settimanale rilevazioni telemonitoraggio | 2.26 |
| w) | relazione finale per il telemonitoraggio/teleriabilitazione | 2.27 |

L'**Allegato 1** al decreto «integra l'allegato A del decreto 7 settembre 2023» aggiungendo i paragrafi 2.18–2.27 **dopo la tabella prevista al paragrafo 2.17**. Termine di messa a regime: **30 giugno 2026** (art. 7, c. 3).

### Metadati obbligatori del «Referto di specialistica per la televisita» (All. 1, § 2.20)

Set informativo completo, come pubblicato in GU. Lo riporto per gruppi perché è direttamente traducibile in modello dati.

**Assistito**: Cognome, Nome, Codice identificativo (Codice Fiscale/STP/ENI/altro), Sesso, Data di nascita, Comune di nascita, Indirizzo di residenza, CAP residenza, Comune di residenza, Indirizzo di domicilio, CAP domicilio, Comune di domicilio, Descrizione Comune di residenza, Provincia di residenza, Regione di residenza, Stato di residenza, Recapito telefonico (fisso e/o mobile), e-mail, **PEC**.

**Professionisti e struttura**: Cognome/Nome/CF **medico refertante**; Cognome/Nome/CF **medico firmatario** (distinto dal refertante); Codice e descrizione **azienda sanitaria**; Codice e descrizione **presidio**; Codice e descrizione **unità operativa**; Numero di telefono Unità Operativa / CUP / Azienda Sanitaria; **Cognome/Nome/CF di altra figura tecnica coinvolta nell'esecuzione della procedura**; Cognome/Nome/CF **medico prescrittore** («medico del ruolo unico di assistenza primaria/PLS o Specialista»).

**Riferimenti amministrativi**: Numero ricetta medica; **Data firma referto**; **Codice CUP** (codice della prenotazione); **Codici identificazione oggetti correlati** («es. ID PACS, Accession number, Studio DICOM»); Codice Nosologico; Provenienza (es. PS, Reparto); **Tipologia Accesso** (programmata / ad accesso diretto); Disciplina specialistica ambulatoriale; **Branca**.

**Contenuto clinico**: Codice quesito diagnostico (**ICD9-CM**) e descrizione; Anamnesi; Allergie e fonti dichiarate; Precedenti esami eseguiti (codice, descrizione, metodica, data); **Codice AIC/ATC farmaco** e descrizione terapia farmacologica in atto; **Esame obiettivo**; Codice e descrizione prestazione eseguita; **Data e ora di inizio erogazione**; **Data e ora di fine erogazione**; Codice e descrizione **procedura operativa**; Quantità; **Modalità esecuzione procedura operativa** («Rappresenta la declinazione pratica del come viene eseguita la procedura»); **Strumentazione utilizzata**; **Parametri descrittivi della procedura**; Note; Confronto con precedenti esami eseguiti; **Refertazione** («Referto della/e prestazione/i, oggetto principale del referto»); Codice e descrizione **diagnosi**; Conclusioni; Suggerimenti per il medico prescrittore; Codice e descrizione accertamento consigliato; Codice AIC/ATC e descrizione terapia farmacologica consigliata.

**Osservazione critica.** Il tracciato **non contiene un campo esplicito per la «qualità del collegamento e conferma dell'idoneità»** richiesta dall'Accordo 215/CSR 2020. I candidati naturali per veicolarla sono i campi **«Modalità esecuzione procedura operativa»**, **«Strumentazione utilizzata»** e **«Parametri descrittivi della procedura»**. Analogamente, la presenza di *caregiver* o di altro medico trova posto nei campi «altra figura tecnica coinvolta nell'esecuzione della procedura» e nelle Note. **Va aperta una decisione di mappatura esplicita** (candidata a ADR): dove si scrive l'evidenza normativamente obbligatoria della qualità del collegamento, all'interno di un tracciato ministeriale che non le riserva un campo.

### Relazione collaborativa per il teleconsulto (§ 2.21) - regola strutturale

> «La relazione collaborativa **viene conferita al FSE come allegato del documento di referto** relativo alla prestazione o all'evento principale (es. visita specialistica, ricovero, visita del medico del ruolo unico di assistenza primaria, etc.) redatto dal medico richiedente la consulenza.»

**Conferma e precisa** il requisito 4 di R3: il teleconsulto non produce referto autonomo, ma **produce un documento FSE autonomo per tipologia** (lettera q) che viene **allegato** al referto dell'evento principale. Non è la stessa cosa di «non produce nulla».

Il tracciato contiene, tra gli altri: `idRichiesta` (correlazione con la richiesta di teleconsulto), Cognome/Nome/CF **medico consultato**, medico **firmatario**, medico **richiedente**, Tipo struttura richiedente / Tipo struttura erogante, **Data della ricezione della richiesta di teleconsulto da parte del medico consulente**, **Data e ora della presa in carico**, **Data e ora della programmazione della consulenza in caso sincrono, con o senza presenza del paziente**, DisciplinaMedicoConsulente, BrancaMedicoConsulente. E, decisivo:

> **Modalità esecuzione procedura operativa** - «Nel caso del teleconsulto indicare se è stata eseguita una **estemporaneo/programmato, sincrono/asincrono, con la presenza dell'assistito/senza presenza assistito**.»

### Richiesta di teleconsulto (§ 2.19) - regola di generazione

> «La richiesta di teleconsulto **viene generata internamente alle IRT**. La piena operatività del servizio in caso di interoperabilità tra IRT di regioni o province autonome diverse da quella di assistenza è garantita dalla **INT, ai sensi dell'articolo 3, comma 4**.»

Campi notevoli: `idRichiesta`, `cfMedico1` (medico "titolare") e `cfMedico2` (medico "sostituto"), `codRegione`, `codASL/AO`, `codStruttura`, `codSpecializzazione`, `codEsenzione`, `nonEsente`, `codDiagnosi`/`descrizioneDiagnosi`, `classePriorita`, **`Slot temporale`** («Proposta di slot temporale per la presa in carico della teleconsulenza»), **`Richiesta disponibilità immediata`** («compatibile solo con urgenza alta»), i dati del medico consulente se espressamente richiesto uno specifico specialista, e **`Raggiodierogazione`** («Raggio di erogazione all'interno del quale viene estesa la ricerca dei professionisti che erogheranno la consulenza: **aziendale, regionale, nazionale**»). Sezione dati singole prestazioni: `codProdPrest` (nomenclatore nazionale), `descrProdPrest`, `descrTestoLiberoNote`, **`codCatalogoPrescr`** (catalogo regionale unico delle prestazioni). Sono previsti anche i campi per assistiti **SASN** (`socNavigaz`) e per soggetti assicurati da istituzioni estere (`statoEstero`, `istituzCompetente`, `numIdentPers`, `numIdentTess`, `dataNascitaEstero`).

### Tesserino dispositivi per il telemonitoraggio (§ 2.23) - rilevanza MDR

> «documento generato dalle IRT, prodotto e **firmato digitalmente dal professionista sanitario che assegna il dispositivo al paziente**.»

Campi: Denominazione, Modello, Tipologia del dispositivo, **Identificazione unica del dispositivo (UDI)** - «L'UDI utilizza il formato "identificazione automatica e raccolta dei dati" (AIDC), ad esempio codici a barre lineari o 2D e l'identificativo del dispositivo UDI (UDI-DI) utilizza un formato leggibile dall'uomo» -, Numero di serie o numero di lotto, **Nome e indirizzo del fabbricante**, **Sito web del fabbricante**, Patologia paziente (ICD9-CM), **Data di impianto**, istituzione che ha effettuato l'assegnazione, **Tipo collegamento (es. bluetooth)**, **Tipo di alimentazione (cavo o batterie)**, **Check tecnico** («Esito attività di verifica tecnica del funzionamento dei dispositivi»), **Parametri tecnici del dispositivo (dati di connettività, dati di configurazione, dati di taratura)**.

### Piano di telemonitoraggio (§ 2.24) - parametri operativi

Tipologia di piano, Codice/Descrizione attività, **Tipologia di attività**, **Numero di cicli**, **Durata del Ciclo**, **Numero di attività per Ciclo**, **Frequenza** («Indicare la periodicità (1 ril/die, 2 ril/die, 2 ril/sett) / indicare "incontinuo" se è un telemonitoraggio incontinuo»), **Orario** (fascia oraria), **Durata prevista del piano (massimo 1 anno)**, Prima programmazione / Riprogrammazione, **CodiceUDI**, **Parametri**, **Tipo di rilevazione** («Intermediato, ciclo chiuso (interoperabilità diretta)»), **SogliaAllarme**, **Regole** («Testo descrittivo delle regole di comportamento in violazione delle soglie»).

### Cosa resta aperto su V4

**Non ho reperito il *template CDA2* né i codici di tipologia documentale (`typeCode`/LOINC) e i metadati IHE XDS** per le nuove dieci tipologie. La pagina `fascicolosanitario.gov.it` dichiara pubblicata la **versione 2.6.4 delle «Specifiche tecniche di interoperabilità tra i sistemi regionali di FSE»**, ma **non ho potuto accertare se tale versione contenga già i template CDA2 di telemedicina**. R3 citava la v. 2.5 del 12 dicembre 2023 (`AffinityDomainItalia_v2-5_v20231212.pdf`).

**Dove cercare**: area tecnica di `fascicolosanitario.gov.it` (documento *Affinity Domain Italia* v. 2.6.4 e i «Documenti di specifica CDA2» per singola tipologia); in subordine, richiesta formale a Sogei/INI. **Fino ad allora, il progetto deve modellare il contenuto informativo dell'Allegato 1 come *dataset* canonico e trattare CDA2 come *serializzazione* pluggabile**, senza cablare un template.

**Rapporto con le IG FHIR di HL7 Italia.** La IG «Televisita» v0.2.0 di HL7 Italia usa `CompositionRefertoTelevisita` + Bundle `RefertoDiTelevisita`. Il set informativo dell'Allegato 1 è la fonte normativa; la IG è la rappresentazione FHIR. **Va verificata la copertura campo-per-campo fra i due**: è un'attività di *gap analysis* da mettere in backlog, non una verifica documentale.

---

## V5 - Flusso ex art. 50 L. 326/2003 e flusso DEMA: valore «T = telemedicina» - **NON RISOLTA**

**Cosa è stato accertato indirettamente.** Il DM 19 novembre 2025, All. 1, § 2.18 stabilisce che per televisita, teleassistenza/teleriabilitazione e telemonitoraggio:

> «è prevista una fase prescrittiva ai sensi del **DM 2 novembre 2011** e relativi allegati tecnici con successivi aggiornamenti. In particolare, si è ritenuto di utilizzare il **tracciato della prescrizione specialistica** per le prestazioni di televisita, teleassistenza/teleriabilitazione e telemonitoraggio, e ove necessario utilizzare il **tracciato della prescrizione farmaceutica** per le richieste dei dispositivi di telemonitoraggio.»

Ne discende che il legislatore **non ha creato un tracciato prescrittivo nuovo** per la telemedicina: riusa i tracciati DEMA esistenti. Ciò è coerente con l'ipotesi che la modalità a distanza sia veicolata da un valore aggiuntivo su un campo esistente, ma **non lo dimostra**.

**Cosa non è stato accertato.** Non ho potuto verificare se il campo «luogo di erogazione» (A = ambulatorio, D = domicilio) del flusso ex art. 50 sia stato esteso con **T = telemedicina**, né se i disciplinari tecnici del Sistema TS siano stati aggiornati in tal senso. Le pagine tecniche del portale `sistemats1.sanita.finanze.it` interrogate hanno restituito 404 o contenuti generici, e il budget di ricerca si è esaurito.

**Dove cercare, in ordine di efficacia:**
1. `sistemats1.sanita.finanze.it` → area «Documenti» / «Specifiche tecniche» → allegati tecnici al **DM 2 novembre 2011** e successivi aggiornamenti (tracciato «prescrizione specialistica» e tracciato «erogato specialistica ex art. 50»);
2. il **disciplinare tecnico allegato al DM MEF** sulle modalità di trasmissione dei dati al Sistema TS (`sistemats1.sanita.finanze.it/portale/documents/20182/66501/DM+RGS+-+All.+A.pdf`);
3. i **disciplinari regionali** del flusso ASA/SPA (specialistica ambulatoriale), dove il valore aggiuntivo compare per primo (Emilia-Romagna, Veneto, Lombardia pubblicano i tracciati);
4. richiesta diretta a Sogei / MEF-Ragioneria (Sistema TS) o all'*help desk* 800 030 070.

**Conseguenza per il progetto.** Il requisito 13 di R3 («tracciamento della modalità di erogazione a distanza nei flussi») resta **valido come obbligo** (deriva dall'Accordo 215/CSR 2020, punto 3 del dispositivo), ma **la codifica concreta è ignota**. Il modello dati deve esporre la modalità di erogazione come **attributo di dominio con codifica configurabile per Regione**, non come costante.

---

## V3 - Tariffe 2026: risoluzione della contraddizione - **PARZIALE (contraddizione risolta, estremi GU non verificati)**

### Ricostruzione

Le due fonti secondarie che R3 riportava come contraddittorie **non lo sono**: descrivono due passaggi successivi di una stessa vicenda, che coinvolge anche un elemento che R3 non aveva: **una pronuncia del TAR del Lazio**.

1. **DM 25 novembre 2024** (pubblicato in GU il 25 novembre 2024, applicazione dal 30 dicembre 2024) - nuove tariffe di specialistica ambulatoriale e protesica.
2. **Il TAR del Lazio ha annullato il DM 25 novembre 2024**, **differendo gli effetti dell'annullamento di 365 giorni** per consentire al Governo di riadottare l'atto. *(Fonte secondaria qualificata: Quotidiano Sanità. **Gli estremi della sentenza - sezione, numero, data - non sono stati accertati**: vanno cercati su `giustizia-amministrativa.it`.)*
3. **Milleproroghe**: **D.L. 31 dicembre 2025, n. 200**, convertito con **L. 27 febbraio 2026, n. 26** (GU Serie generale n. 49 del 28 febbraio 2026, in vigore dal 1° marzo 2026), che secondo fonti secondarie ha differito **al 31 dicembre 2026** l'entrata in vigore delle nuove tariffe per specialistica ambulatoriale e diagnostica di laboratorio. **L'articolo e il comma non sono stati accertati** (Normattiva non interrogabile con affidabilità tramite fetch).
4. **Nuovo decreto tariffe**: schema trasmesso il **14 luglio 2026**, **intesa in Conferenza Stato-Regioni il 23 luglio 2026**, sostitutivo del decreto 2024; **decorrenza 21 settembre 2026**; **448 prestazioni** di specialistica ambulatoriale e **222 codici** di assistenza protesica; impatto **210,7 M€/anno** (183,1 specialistica + 27,6 protesica; 70,3 M€ nel 2026 pro-rata); incrementi medi del 5,8% sulle branche interessate; incremento della remunerazione delle **prime visite specialistiche** e +15% su alcune prestazioni di dialisi peritoneale domiciliare.

**Lettura coerente**: il Milleproroghe ha fissato il termine ultimo di vigenza del regime tariffario previgente; il nuovo decreto, adottato in esecuzione della pronuncia del TAR, anticipa l'entrata in vigore al 21 settembre 2026. **Non c'è antinomia**: c'è successione.

### Telemedicina nelle nuove tariffe

**Nessuna voce di telemedicina.** Né le 448 prestazioni specialistiche né i 222 codici protesici comprendono prestazioni di telemedicina. La conclusione del § 10.4 di R3 **resta integralmente valida**: non esiste una tariffa nazionale dedicata alla telemedicina; la televisita è remunerata con il codice di visita di controllo; teleconsulto e teleconsulenza non sono remunerati.

**Elemento nuovo di segno opposto**, però: il DM 19 novembre 2025, **Allegato 2**, istituisce presso l'EDS un servizio di estrazione dati per finalità di governo **specificamente finalizzato all'«individuazione e aggiornamento delle tariffe delle prestazioni di telemedicina»**, con riferimento normativo all'**art. 12, comma 15-*undecies*, lettere g) e h), del D.L. 179/2012**. È il presupposto informativo per una futura tariffazione dedicata. **La documentazione commerciale può dire che l'infrastruttura per tariffare la telemedicina è stata costruita, ma non che la tariffa esista.**

### Cosa manca

Gli **estremi in GU del nuovo decreto tariffe** (data del DM, data e numero di GU, atto). Alla data odierna - 25 agosto 2026 - il decreto ha ottenuto l'intesa ma la pubblicazione in GU va verificata su `gazzettaufficiale.it`, ricerca per data nell'intervallo agosto-settembre 2026, e sul repertorio della Conferenza Stato-Regioni, **seduta del 23 luglio 2026**, per il numero di repertorio dell'intesa.

---

## V2 - Legge di bilancio 2026 - **RISOLTA (con correzione dell'ipotesi di R3)**

**R3 riportava «art. 85» come non verificato. L'ipotesi è errata quanto alla legge, corretta quanto al disegno di legge.**

**Estremi accertati** (fonte: dossier Camera dei deputati AS0477, 6 febbraio 2026, indice pag. II e schede pagg. 119–123):

> **Legge 30 dicembre 2025, n. 199** - «Bilancio di previsione dello Stato per l'anno finanziario 2026 e bilancio pluriennale per il triennio 2026-2028» - GU n. 301 del 30 dicembre 2025, Supplemento ordinario n. 42.
> **Articolo 1, commi 410-412 - «Potenziamento dei servizi di telemedicina».**

L'«art. 85» delle fonti secondarie è la numerazione del **disegno di legge (A.S. 1689)**, confluito nel maxi-emendamento e trasfuso nell'articolo unico della legge. **Nella documentazione di progetto va citato «art. 1, commi 410-412, della legge 30 dicembre 2025, n. 199», non «art. 85».**

**Contenuto (testo del dossier):**

- **Comma 410** - assegna ad **AGENAS**, «in qualità di Agenzia nazionale per la sanità digitale», **20 milioni di euro per l'anno 2026** per il potenziamento dei servizi di telemedicina «mediante l'implementazione delle procedure finalizzate a fornire ai professionisti sanitari **dispositivi medici per il monitoraggio dei pazienti** e per lo **sviluppo omogeneo dei percorsi di telemedicina**».
- **Comma 411** - rimette l'**individuazione dei dispositivi medici e dei professionisti sanitari** interessati a un **decreto del Ministro della salute**, sentito il MEF, **d'intesa con la Conferenza Stato-Regioni**, **proposto da AGENAS** d'intesa con le competenti direzioni generali del Ministero, «da adottare **entro centottanta giorni** dalla data di entrata in vigore della legge di bilancio». → **Termine: circa 28 giugno 2026. Alla data odierna il decreto non risulta adottato: va verificato in GU.**
- **Comma 412** - copertura tramite le risorse dell'**art. 1, comma 275, della legge 30 dicembre 2024, n. 207** (obiettivi sanitari di carattere prioritario e di rilievo nazionale ex art. 1, commi 34 e 34-*bis*, L. 662/1996): 773,9 M€ per il 2026, 340,9 M€ per il 2027, 379,2 M€ annui dal 2028.

**Le «due letture diverse sugli importi» segnalate da R3 si chiudono così**: i 20 M€ sono l'unico stanziamento della legge di bilancio 2026 per la telemedicina. Le cifre «12,5 M€ per il primo anno e 25 M€ annui dal 2027» **non trovano riscontro** in questa fonte primaria e vanno considerate non confermate.

**Altre disposizioni della stessa legge, rilevanti e non rilevate da R3:**
- **Art. 1, commi 405-406** - «**Servizi di scambio transfrontaliero per le ricette mediche elettroniche, il profilo sanitario sintetico, i documenti clinici originali, i referti di laboratorio, le schede di dimissione ospedaliera e i referti di diagnostica per immagini**». È il capitolo **MyHealth@EU / EHDS**: rilevante per la strategia FHIR e per la roadmap di interoperabilità europea. **Da girare all'agente che tratta il Regolamento (UE) 2025/327 sullo spazio europeo dei dati sanitari.**
- **Art. 1, commi 349-350** - finanziamento destinato all'aggiornamento delle tariffe di specialistica ambulatoriale e protesica (collegato a V3).
- **Art. 1, comma 399** - spesa per l'acquisto di dispositivi medici; **commi 417-418** - Fondo per il governo dei dispositivi medici (*payback* 0,75%, interpretazione autentica: solo vendita diretta al SSN; esclusione sotto 50.000 € di fatturato annuo). **Rilevante per il piano MDR/economico**: se Telemedic diventa dispositivo medico immesso sul mercato e venduto direttamente al SSN, il *payback* si applica sopra soglia.

---

## V9 - Allegato B al DM 30 settembre 2022: aree cliniche - **RISOLTA**

Documento letto integralmente nella parte rilevante: «**Linee di Indirizzo per i Servizi di Telemedicina - ALLEGATO B**», PNRR M6C1, sub-investimento 1.2.3, sub-intervento 1.2.3.2 (38 pagine + appendice).

**Struttura**: Premessa; Obiettivi; **Requisiti clinici dei servizi di telemedicina**; Televisita, Teleconsulto/Teleconsulenza e Teleassistenza nell'assistenza sanitaria territoriale; Telemonitoraggio e Telecontrollo per area clinica; Appendice (Definizioni, Acronimi).

**Le aree cliniche individuate sono cinque**, tutte riferite a **Telemonitoraggio e Telecontrollo**, più due capitoli trasversali:

| # | Area | Sottosezioni |
|---|---|---|
| Trasversale | **Televisita e teleconsulto/teleconsulenza** nell'assistenza sanitaria territoriale | Popolazione; Modalità di erogazione; Professionisti e branche specialistiche coinvolti |
| Trasversale | **Teleassistenza** nell'assistenza sanitaria territoriale | idem |
| 1 | **Telemonitoraggio e Telecontrollo nel paziente con Diabete** | Popolazione; Modalità di erogazione; **Parametri da monitorare/controllare**; Professionisti |
| 2 | **…nel paziente con patologie respiratorie** | idem |
| 3 | **…nel paziente con patologie cardiologiche** | idem |
| 4 | **…nel paziente Oncologico** | Condizione clinica e carico di malattia; Popolazione; Modalità; Parametri; Professionisti |
| 5 | **…nel paziente Neurologico** | idem |

**Requisiti clinici generali** (sezione omonima, testo):

> «I servizi di telemedicina possono essere svolti in favore di **qualsiasi paziente**; prima dell'attivazione del servizio, va **esplicitamente richiesto e ottenuto il consenso informato all'utilizzo del servizio e dei dati**.
> I limiti dei servizi dipendono dalle **risorse hardware, software e di telecomunicazione** e all'adeguata formazione sulla pratica in telemedicina del personale sanitario coinvolto e del paziente/caregiver al momento in cui la prestazione si svolge. Le soluzioni tecnologiche devono tenere conto delle possibili **limitazioni fisiche tipiche delle età avanzata, condizioni cliniche, condizioni sociali ed economiche**.»

**Finalità tipizzate della televisita per target** (testo): paziente con patologia cronica/malattia rara → conferma diagnostica, prognosi, decisione terapeutica, verifica del trattamento, modifica del trattamento, prevenzione terziaria, follow-up; paziente con patologia acuta ma non in urgenza/emergenza → stesse finalità più controlli in convalescenza; **paziente in urgenza/emergenza → «non è suggeribile in quanto non deve costituire ragione per ritardare interventi in presenza nei casi in cui questi garantiscono maggiore efficacia o sicurezza rispetto all'intervento da remoto»**; disabili e età pediatrica → «solo se mediate da caregiver»; età evolutiva → per patologie acute, con supporto psicologico per le croniche; gestanti → priorità alla continuità assistenziale, personale dedicato, supporto psicologico specialmente nel puerperio; anziani → finalità mediate da caregiver per le croniche.

**Requisiti di accessibilità per categoria** (sezione «Popolazione»), che sono **requisiti funzionali diretti sull'interfaccia**:
- **Anziani**: «il sistema di accesso alla videochiamata per la televisita deve essere **fruibile in autonomia** (o anche supportati dal caregiver)»;
- **Bambini**: utilizzabile dagli esercenti la patria potestà «con modalità che facilitino il contemporaneo accudimento del minore, specie se malato»;
- **Adolescenti minorenni**: «priorità all'uso in prima persona di tali pazienti, ma in presenza o con autorizzazione dell'esercente la patria potestà»;
- **Disabili**: uso da parte di qualsiasi tipo di caregiver, con dispositivi e software adatti «mentre egli prosegue ad accudire il disabile»;
- **Disabilità uditive**: «occorrono sistemi di **comunicazione scritta in sovrapposizione all'immagine video** e di **condivisione schermo**»;
- **Cecità totale o parziale**: sistemi che facilitino l'assistenza dal caregiver «e occorre lasciare la possibilità di uso di altri eventuali supporti tecnologici».

**Due regole che modificano requisiti già formulati da R3** (sezione «Modalità di erogazione»):

> «La **prescrizione della televisita non è necessaria** qualora venga programmata ed erogata direttamente **dal MMG o dal PLS** e sono erogabili in qualsiasi tipo di PDTA.»
> «La televisita **si conclude sempre con un referto (ad eccezione nei casi in cui la televisita sia effettuata dal MMG/PLS)** che deve essere inviato al FSE. Tuttavia, qualora il paziente abbia difficoltà ad accedere al proprio FSE, su richiesta, il referto potrà essere inviato anche in **modalità sicura, con doppia autenticazione**.»

**Il requisito 3 di R3 («referto obbligatorio per la televisita») va quindi condizionato al *setting***: obbligatorio in specialistica ambulatoriale, sostituito da annotazione digitale quando l'erogatore è MMG/PLS.

**Clausola di responsabilità tecnologica** (sezione finale):

> «Sia per la televisita che per il teleconsulto/teleconsulenza, **l'organizzazione sanitaria è responsabile della corretta dotazione delle risorse hardware, software e di telecomunicazione e della loro conformità alle leggi, ai regolamenti e alle norme tecniche di riferimento in Italia**, a quanto stabilito al momento della messa a disposizione del servizio.»

Riferimento richiamato per il teleconsulto: **Intesa Stato-Regioni 21 settembre 2017, rep. n. 158**, Rete Nazionale dei Tumori Rari, che richiede la presenza «necessaria e inderogabile» del teleconsulto/teleconsulenza clinico (singolo o continuativo), clinico con visita del paziente, **istopatologico** e **radiologico**. → **Rilevante per l'analisi MDR (§ 4.6 di R3): è la fonte che rende non ipotetico lo scenario del teleconsulto istopatologico e radiologico.**

---

## V10 - Indicazioni metodologiche AGENAS per la perimetrazione delle proposte di PPP - **NON RISOLTA (ma in gran parte superata)**

**Il documento non è stato reperito.** L'esistenza e gli estremi sono confermati su fonte primaria: l'Allegato B al DM 30 settembre 2022, sezione «Obiettivi», elenca tra i documenti di riferimento:

> «"**Indicazioni metodologiche per la perimetrazione delle proposte di PPP per la Piattaforma Nazionale di Telemedicina**", pubblicate da Agenas in allegato all'avviso di PPP per la realizzazione dei Servizi Abilitanti della PNT **in data 18 marzo 2022 (ed aggiornate il 04 maggio 2022)**.»

La pagina AGENAS dedicata alla telemedicina (`agenas.gov.it/view-article-id-2329-la-telemedicina-catid-85`, ultimo aggiornamento 19 dicembre 2024) **non lo pubblica**: espone gli atti di gara delle Regioni capofila e i progetti di 20 Regioni/PP.AA., non l'avviso PPP 2022 né i suoi allegati.

**Dove cercare:**
1. sezione **Amministrazione trasparente → Bandi di gara e contratti** di `agenas.gov.it`, annualità 2022, avviso di PPP per i Servizi Abilitanti della PNT;
2. archivio della piattaforma di *e-procurement* usata da AGENAS nel 2022;
3. **istanza di accesso civico generalizzato ex art. 5, c. 2, D.lgs. 33/2013** ad AGENAS - è il canale realistico, dato che il documento è richiamato *per relationem* da un decreto ministeriale e quindi ha rilevanza esterna.

**Perché la lacuna è oggi meno grave di quanto R3 assumesse.** Il DM 19 novembre 2025, **Allegato 3**, ha **normativizzato in Gazzetta Ufficiale** ciò che nel 2022 era contenuto solo nel documento AGENAS: i servizi abilitanti della INT (GST, Business Glossary con Terminology Server/Authoring Tool/Library Repository, Cruscotto), i servizi minimi delle IRT e i relativi **micro-servizi essenziali *core***. Il rinvio *per relationem* del DM 21 settembre 2022 **è stato in larga parte assorbito**. La segnalazione di R3 (§ 4.1) come «rischio di tracciabilità dei requisiti» va aggiornata: il rischio si è **spostato** dal documento AGENAS 2022 al **capitolo 5 del capitolato `aria_2023_807`** richiamato dall'Allegato 4 (v. V1.c).

**In compenso**, AGENAS ha pubblicato un corpus documentale nuovo e accessibile - il **Business Glossary della PNT** (`bg.pnt.agenas.it/ckpportal`), che è di fatto il repository di linee di indirizzo previsto dall'All. 3, § 3.2.4:

| Documento | Versione | Data |
|---|---|---|
| **Linee di indirizzo sulla realizzazione e il funzionamento dei Centri Servizi per la Telemedicina** | v. 1.0.4 | 30 luglio 2026 |
| Costituzione e gestione delle Community per l'utilizzo dell'Authoring tool | v. 1.0.1 | 4 maggio 2026 |
| **Modello orientativo di erogazione di Telemonitoraggio (TLMon) e Telecontrollo (TLCnt)** | v. 1.0.38 | 16 aprile 2026 |
| **Modello orientativo di erogazione della Televisita** | v. 1.0.25 | 16 aprile 2026 |
| **Modello orientativo di erogazione della Teleassistenza** | v. 1.0.4 | 16 aprile 2026 |
| **Glossario nazionale di Telemedicina** | v. 1.0.0 | 29 gennaio 2026 |
| Modello orientativo di erogazione del Teleconsulto (*in consultazione*) | v. 1.0.29 | 24 novembre 2025 |

**Questi documenti sono la fonte metodologica corrente e vanno usati al posto del documento PPP 2022.** In particolare il **Glossario nazionale di Telemedicina** risolve la questione Q13 di R3 (le due tassonomie non coincidenti): esiste ora un glossario ufficiale a cui il glossario di progetto deve allinearsi.

---

## V7 - Stato reale di attivazione - **PARZIALE**

### Dati accertati su fonte primaria

**Numero di assistiti presi in carico** - dossier Camera AS0477, pag. 121, che cita la banca dati **ReGiS del MEF**:

> «Secondo la banca dati **Regis** del Ministero dell'economia e delle finanze, il citato obiettivo **M6C1-9** è stato conseguito con **467.479 assistiti** tramite strumenti di telemedicina già a **settembre 2025** e il conseguente superamento del *target* comunitario di **300.000 assistiti**.»

**Progetti regionali** - pagina AGENAS «La telemedicina» (aggiornata al 19 dicembre 2024): **20 Regioni/Province autonome** hanno pubblicato piani operativi, schede progetto e modelli organizzativi. Il target **M6C1-8** («almeno un progetto per Regione sulla telemedicina», Q4 2023) risulta conseguito.

**Gara Regione capofila Lombardia** - pagina AGENAS «Stato avanzamento gara - Regione Lombardia»: accordo quadro **ARIA_2023_807**, procedura aperta comunitaria, **aggiudicata l'8 maggio 2024**; alla data della pagina «è in corso la finalizzazione dell'iter propedeutico alla stipula dei contratti applicativi» fra le amministrazioni regionali e gli aggiudicatari.

**Piattaforma nazionale** - presentata da AGENAS il 4 febbraio 2025 (già in R3); DM 19 novembre 2025 art. 7, c. 3 fissa al **30 giugno 2026** la messa a regime dell'integrazione dei contenuti FSE.

### Cosa non è stato accertato

**Non ho reperito un dato ufficiale, verificabile e datato agosto 2026, sul numero di IRT effettivamente in esercizio e agganciate alla INT.** Il portale `telemedicina.gov.it` è raggiungibile ma le sezioni di monitoraggio non hanno restituito valori tramite fetch automatico. La pagina AGENAS di riferimento è ferma al 19 dicembre 2024.

**Osservazione importante sulla natura del dato «467.479 assistiti».** Il *target* M6C1-9 conta gli **assistiti presi in carico con strumenti di telemedicina**, non le IRT in esercizio. Il conteggio include soluzioni regionali preesistenti e progetti finanziati con 1.2.3.2, non necessariamente collegati alla INT. **Un numero alto di assistiti non implica IRT operative e federate.** È esattamente la distinzione che il DM 19 novembre 2025 art. 3, c. 4 presuppone quando ammette «infrastrutture, applicativi o strumenti diversi» purché certificati da AGENAS.

**Dove cercare:** cruscotto di monitoraggio su `telemedicina.gov.it` (sezione dati di utilizzo prevista dall'All. 3, § 3.3, con dati aggregati «per prestazioni, mese e distretto» ai sensi dell'art. 3, c. 8); **relazione annuale di AGENAS quale Agenzia nazionale per la sanità digitale**; portale **Italia Domani** (`italiadomani.gov.it`), sezione M6C1 investimento 1.2; banca dati **ReGiS** (accesso non pubblico); **richiesta diretta ad AGENAS**.

---

## V6 - Riprogrammazione PNRR del sub-investimento M6C1-1.2.3 - **PARZIALE (dato nuovo e rilevante)**

**Dato accertato su fonte primaria** (dossier Camera AS0477, pag. 120):

> «Le risorse previste per il citato investimento 1.2 della Missione 6 sono pari a **4.750 milioni di euro** e sono suddivise tra tre linee di intervento:
> - presa in carico tramite assistenza domiciliare del 10% della popolazione di età superiore ai 65 anni (**Sub-I. 1.2.1 - 2.970 milioni di euro**);
> - attivazione di almeno **480 Centrali operative territoriali** (**Sub-I. 1.2.2 - 280 milioni di euro**);
> - **investimenti nel settore della telemedicina per il supporto dei pazienti cronici (Sub-I. 1.2.3 - 1.500 milioni di euro)**.»

**Il sub-investimento 1.2.3 è passato da 1.000 a 1.500 milioni di euro.** R3 riportava 1.000 M€ (250 per la piattaforma + 750 per i servizi), ricavati dal DM 1° aprile 2022 e confermati dall'Allegato B al DM 30 settembre 2022 (che infatti dice «A tale sub-investimento è destinato 1 miliardo di euro»). Il dato aggiornato **al febbraio 2026** è **1.500 M€**.

**Target rivisto** (pagina AGENAS, verificata): da «almeno 200.000 persone» a «**almeno 300.000 persone** assistite con strumenti di telemedicina», scadenza **Q4 2025**. Il target M6C1-8 («almeno un progetto per Regione») ha scadenza **Q4 2023**.

**Atti attuativi successivi non rilevati da R3** (dossier Camera, pag. 121):
- **DM 28 settembre 2023** - riparto delle risorse M6C1-1.2.3.2 (già in R3);
- **DM 19 febbraio 2025** - «**ripartite le risorse residue** relative al medesimo investimento 1.2.3.2». Coerente con l'incremento della dotazione;
- **DM 7 ottobre 2025**, in attuazione dell'**art. 9, comma 2, del D.lgs. n. 29 del 2024** - «individua le prestazioni di telemedicina da erogare, con prioritario riferimento ai "**grandi anziani**" (cioè persone **ultra 80enni affetti da almeno una patologia cronica**), al fine di consentire il mantenimento delle migliori condizioni di vita degli stessi presso il proprio domicilio (**telemonitoraggio domiciliare**); le risorse finanziarie assegnate con tale decreto sono pari a **150 milioni di euro**».

**Il DM 7 ottobre 2025 è una fonte normativa italiana della telemedicina che R3 non ha rilevato affatto** ed è potenzialmente il più rilevante per il *go-to-market* 2026-2027, perché individua una popolazione target finanziata e un percorso (telemonitoraggio domiciliare per ultra-80enni cronici) fuori dal perimetro delle gare capofila. **Va reperito in GU e letto integralmente.** Base legale: D.lgs. 15 marzo 2024, n. 29 (riforma dell'assistenza agli anziani non autosufficienti), art. 9, comma 2.

**Cosa non è stato accertato**: la **portata esatta della revisione ECOFIN** (quale decisione di esecuzione del Consiglio, quale data, come si è passati da 1.000 a 1.500 M€, quali milestone sono state riformulate). **Dove cercare**: `italiadomani.gov.it` → «Il Piano» → Missione 6 → documenti di revisione; **Decisione di esecuzione del Consiglio UE** che approva la valutazione del PNRR italiano modificato e relativo *Operational Arrangement*; **Relazioni semestrali al Parlamento sullo stato di attuazione del PNRR**.

---

## V8 - Perimetro di sicurezza nazionale cibernetica - **RISOLTA**

**Fonte primaria: portale ACN, sezione PSNC** (`acn.gov.it/portale/psnc`).

**Base normativa**: D.L. 21 settembre 2019, n. 105, convertito con L. 18 novembre 2019, n. 133.

**Modalità di individuazione dei soggetti** (testo del portale): sono inclusi i soggetti pubblici e privati con sede in Italia che (a) esercitano una funzione essenziale dello Stato o assicurano un servizio essenziale, e (b) il cui esercizio dipende da reti, sistemi informativi e servizi informatici. Il **Tavolo interministeriale per l'attuazione del PSNC**, presieduto da ACN, individua i candidati; **la designazione avviene con atto amministrativo del Presidente del Consiglio dei ministri che non è pubblicato**.

**Settori/funzioni ricompresi**, come elencati dall'ACN: governo, difesa, spazio e aerospazio, energia, telecomunicazioni, economia e finanza, trasporti, servizi digitali, tecnologie critiche, enti previdenziali e del lavoro.

> **La sanità non figura tra i settori del PSNC.**

Questa è la risposta operativa che mancava a R3. La sanità è invece **espressamente in ambito NIS2** (D.lgs. 138/2024, Allegato I). Non è escluso in assoluto che un singolo ente sanitario sia designato - la designazione è nominativa e non pubblica - ma **la presunzione operativa corretta è che una piattaforma di telemedicina ricada in NIS2 e nella L. 90/2024, non nel PSNC**.

**Obblighi PSNC, se applicabili** (rilevanti perché uno soltanto ricade direttamente sul fornitore):
- inventario dei beni ICT critici entro 6 mesi, aggiornato annualmente;
- notifica degli incidenti a **CSIRT Italia**: **da 1 a 6 ore** per gli incidenti gravi, **72 ore** per gli altri - termini **più stringenti** di NIS2 (24 h/72 h) e della L. 90/2024 (24 h/72 h);
- misure di sicurezza su struttura organizzativa, gestione del rischio, risposta agli incidenti, **controllo della catena di fornitura**;
- **notifica preventiva al CVCN (Centro di Valutazione e Certificazione Nazionale) prima dell'acquisizione di determinate forniture ICT**;
- sanzioni fino a **1,8 milioni di euro**, triplicabili in caso di reiterazione.

### Come deve comportarsi un fornitore

1. **Non dichiarare mai** che il prodotto «è conforme al PSNC» né che «rientra nel perimetro»: sono affermazioni non verificabili e potenzialmente false, perché lo status dipende dal cliente e non dal prodotto.
2. **Trattare il PSNC come clausola contrattuale condizionale**: prevedere nel contratto/SLA un'ipotesi in cui il committente dichiari di essere soggetto PSNC e il bene ICT fornito sia notificato, con conseguente attivazione di: notifica incidenti a 1-6 ore, supporto alla compilazione dell'inventario dei beni ICT, e **assoggettamento della fornitura alla procedura CVCN**.
3. **Prepararsi al CVCN a livello di prodotto**, indipendentemente dal cliente: la valutazione CVCN richiede documentazione di architettura, catena di fornitura, gestione delle vulnerabilità, codice sorgente disponibile per l'ispezione. Per un progetto **open source con SBOM CycloneDX e build riproducibile** questo è un vantaggio competitivo strutturale, e va detto esplicitamente nella documentazione di conformità.
4. **Non confondere** i tre regimi di notifica: PSNC (1-6 h / 72 h), NIS2 (pre-notifica 24 h, notifica 72 h, relazione finale 1 mese), L. 90/2024 (segnalazione 24 h, notifica 72 h). Il prodotto deve consentire di rispettare **il più stringente applicabile**, quindi progettare per **1 ora**.

---

## Mandato aggiuntivo - Requisiti tecnici minimi normativi per la telemedicina in Italia - **RISOLTA in senso negativo**

### Conclusione

**Non esistono, nelle fonti nazionali italiane esaminate, soglie tecniche quantitative vincolanti per l'erogazione di prestazioni in telemedicina.** Nessuna risoluzione video minima, nessun *frame rate*, nessuna banda minima in Mbps, nessuna latenza massima, nessun requisito quantitativo di dispositivo.

Il modello normativo italiano è **qualitativo e a responsabilità distribuita**. Le fonti verificate dicono, testualmente:

**Accordo 215/CSR 2020** - il referto deve registrare «**qualità del collegamento e conferma dell'idoneità dello stesso all'esecuzione della prestazione**». Il giudizio di idoneità è del medico, sul singolo atto. Nessun parametro.

**DM 21 settembre 2022, All. A** - impone architettura a micro-servizi, *event-driven*, containerizzata, cloud native SaaS/PaaS, multi-tenant, *mobile first*, accessibile, e SLA di *incident management* (Critica 30/60 min, Alta 30/90 min, Media 60 min/8 h, Bassa 60 min/24 h, H24 7/7). **Sono SLA di servizio, non parametri di qualità del media.**

**DM 30 settembre 2022, All. B** - «I limiti dei servizi dipendono dalle risorse hardware, software e di telecomunicazione» e «**l'organizzazione sanitaria è responsabile della corretta dotazione delle risorse hardware, software e di telecomunicazione e della loro conformità alle leggi, ai regolamenti e alle norme tecniche di riferimento in Italia**». Rinvio aperto, senza contenuto numerico.

**DM 19 novembre 2025, All. 3** - il micro-servizio «Sistema di Video conferenza» è definito come «**Sistema di comunicazione multimediale per le video chiamate che permette di collegare da remoto il paziente con il professionista sanitario**». Nessun parametro. L'unico requisito tecnico specifico sulla comunicazione è la **crittografia end-to-end sulla chat**.

**DM 19 novembre 2025, All. 4** - parametri quantitativi presenti, ma **solo su sicurezza e processo**: cambio stato certificato compromesso **entro un'ora**; diffusione stato revoca **entro un'ora**; log **24 mesi**; dati di accesso **12 mesi**; pseudonimizzazione EDS **1 volta ogni 24 ore**; cardinalità minima **1** nelle regole di clusterizzazione.

**AGENAS, Modello orientativo di erogazione della Televisita, v. 1.0.25 del 16 aprile 2026** - il documento metodologico più recente. Introduce una fase obbligatoria di **«verifica della compliance digitale del paziente»** (accertamento della capacità di interazione con i sistemi digitali) all'interno della fase 2 «Verifica di eseguibilità», accanto a utilità clinica e sicurezza clinica. Requisiti tecnici espressi in forma qualitativa: piattaforma che consenta collegamento video adeguato e **condivisione dello schermo**; dispositivi PC/tablet/smartphone con camera e microfono; connessione affidabile presso il paziente. E, quanto al fallimento:

> «se problemi tecnici impediscono una comunicazione adeguata, **il medico deve interrompere la televisita**» e organizzare una visita in presenza, garantendo prenotazione su agende digitali «in tempi adeguati alle necessità del paziente».

**Regioni e capitolati.** Ho esaminato il documento di strategia di gara della Regione capofila Lombardia (allegato alla DGR 747/2023, «Infrastruttura Regionale di Telemedicina», 11 pagine) e il modello organizzativo regionale del Veneto (DGR 775/2023, All. A): **nessuna soglia quantitativa**. Il documento lombardo è esplicito nel delimitare l'oggetto: «l'oggetto di fornitura non includerà né le funzionalità per svolgere i percorsi di valutazione dell'assistito […] **né i dispositivi medici, intesi come strumentazione elettromedicale**, necessari allo svolgimento del Telemonitoraggio». Il **capitolato tecnico vero e proprio della procedura `aria_2023_807`, e in particolare il suo capitolo 5**, non è stato acquisito: è l'unico luogo dove soglie quantitative potrebbero comparire, ed è per di più **normativamente rilevante** perché richiamato dall'All. 4 al DM 19 novembre 2025.

### Che cosa ne discende per Telemedic

1. **Il target «< 200 ms» dichiarato nel *context pack* non ha e non può avere natura di conformità normativa.** Va presentato come **obiettivo ingegneristico del progetto**, non come «requisito di legge». Affermare il contrario in documentazione pubblica sarebbe un errore verificabile.
2. **Le proposte ingegneristiche del progetto non sono in conflitto con alcuna norma: sono lo strumento con cui la norma viene soddisfatta.** La catena logica corretta, da esplicitare nella documentazione, è: la norma impone al medico di attestare l'idoneità del collegamento → l'attestazione richiede evidenza oggettiva → le metriche di sessione (RTT, *packet loss*, *jitter*, *bitrate*) su TimescaleDB **sono** quell'evidenza → la soglia di allarme è una scelta del progetto, configurabile per *tenant*, e non una soglia di legge.
3. **Il progetto ha quindi spazio, e interesse, a definire le proprie soglie** e a documentarle come **specifica di prodotto**, con la conseguenza - questa sì normativamente rilevante - che diventano parte della **destinazione d'uso** ai fini MDR e input della **gestione del rischio ISO 14971** (fattori ambientali, condizioni del paziente, prestazioni essenziali).
4. **Il fallimento tecnico è un requisito funzionale obbligatorio**, non una gestione dell'errore: il sistema deve poter registrare l'interruzione, tracciarne la causa e generare l'evento di riprogrammazione in presenza (Accordo 2020 + Modello orientativo AGENAS).
5. **La «compliance digitale del paziente» è una nuova fase da modellare**, distinta dall'adesione informata e dal consenso al trattamento.

---

# Requisiti verificabili aggiuntivi (REQ-33 → REQ-59)

In continuità con i 32 requisiti di R3. Ciascuno con fonte e qualifica di cogenza secondo la convenzione del § 0 di R3.

### G. Sicurezza imposta dal DM 19 novembre 2025, Allegato 4

**REQ-33 - Classificazione ACN e qualificazione cloud su tre livelli.** Il *deployment* deve consentire: (a) classificazione della piattaforma ai sensi del **Regolamento ACN n. 21007 del 27 giugno 2024**; (b) esecuzione su infrastrutture e servizi cloud dell'amministrazione con livello di adeguamento coerente; (c) esecuzione su servizi cloud di fornitori **qualificati** al livello corrispondente. Nessuna dipendenza runtime che impedisca (b) o (c). *Fonte: DM 19 novembre 2025, All. 4, premessa. [VINCOLANTE]*

**REQ-34 - Continuità operativa con Availability Zone.** Configurazioni cloud che garantiscano la continuità tramite **Availability Zone** «puntualmente definite nei relativi documenti tecnici di progetto»; ripristino completo delle basi dati senza perdita di integrità, riservatezza e disponibilità; backup periodico; *data recovery*; **procedure documentate di verifica dell'efficacia sia del backup sia del ripristino**. *Fonte: All. 4, § 2. [VINCOLANTE]*

**REQ-35 - Autenticazione a due fattori con OTP, in aggiunta all'identità digitale.** «la INT e le IRT prevedono **sempre** un'autenticazione a due fattori con utilizzo di un codice OTP», oltre a SPID/CIE/TS-CNS. **Livello di garanzia SPID/CIE almeno L2.** All'autenticazione sono acquisiti **esclusivamente codice fiscale, nome e cognome** (minimizzazione ex art. 5, par. 1, lett. c, GDPR). *Fonte: All. 4, § 3; All. 3, § 5.1. [VINCOLANTE]* - **Estende REQ-15 di R3**: SPID/CIE non basta, serve un secondo fattore OTP.

**REQ-36 - DPIA preventiva e processo ricorrente di analisi del rischio.** DPIA **prima dell'avvio del trattamento** (Considerando 84, 89, 90, 91 GDPR) e «processo ricorrente di analisi del rischio finalizzato anche alla **revisione della DPIA**». *Fonte: All. 4, §§ 3. [VINCOLANTE]*

**REQ-37 - Elenco chiuso di controlli di sicurezza implementati e dimostrabili.** Cifratura *at rest* e *in transit* con algoritmi robusti allo stato dell'arte; **cifratura dell'infrastruttura**; **isolamento logico della rete con microsegmentazione e protezione perimetrale**; **virtual patching** infrastrutturale e applicativo; controllo dell'accesso ad applicazioni e dati; **protezione e limitazione degli accessi amministrativi**; integrità dei messaggi scambiati; monitoraggio di sicurezza della rete; **HSM** per la gestione delle chiavi; **IDS e IPS su ogni nodo di accesso alla rete**; **firewall di rete**; **WAF e API security**; antivirus/antimalware; **strumento di controllo e monitoraggio degli accessi degli amministratori di sistema**; **Transparent Data Encryption**; **hardening dei sistemi operativi**; **Threat Intelligence**; attività periodica di sicurezza preventiva; **SIEM e SOAR**. *Fonte: All. 4, § 3. [VINCOLANTE]* - **Sostituisce e dettaglia il REQ-20 di R3**, che si limitava a «IPS e SIEM/SOAR».

**REQ-38 - Principio di separazione dei dati clinici dai dati amministrativi.** «i dati clinici saranno separati dai dati amministrativi e vengono gestiti in maniera distribuita da componenti dedicati». **Requisito architetturale, non solo di cifratura**: impone componenti distinti. *Fonte: All. 4, § 5. [VINCOLANTE]* - **Impatta direttamente la scelta di schema-per-tenant / RLS della decisione D8**: la separazione richiesta è per *classe di dato*, non solo per *tenant*.

**REQ-39 - Logging conforme all'art. 14 con meta-tracciamento.** Registrazione di: autorizzazione post-autenticazione, accesso ai servizi minimi, accesso dell'assistito o delegato, **generazione di dati e documenti** (con data/ora di creazione, **tipologia di documento**, identificativo del generatore). Log protetti da misure contro l'uso improprio. **Registrazione delle operazioni di consultazione dei log**. Conservazione **24 mesi** e **cancellazione alla scadenza**. Trattamento **in forma aggregata**, in forma non aggregata solo se indispensabile. Funzioni di *detection*, monitoraggio degli accessi, *auditing*. **Funzionalità per l'assistito di prendere visione delle proprie registrazioni.** *Fonte: DM 19 novembre 2025, art. 14; All. 4, § 6. [VINCOLANTE]* - **Estende REQ-17 di R3** con: tracciamento della consultazione dei log, obbligo di aggregazione, e accesso dell'assistito alle proprie registrazioni.

**REQ-40 - SBOM come obbligo normativo.** «conservazione dell'**inventario delle componenti software in uso comprensive delle librerie di terzi e/o open source** in modo da poter rispondere più tempestivamente in caso di segnalazioni di vulnerabilità (**SBOM SW bill of materials**)». *Fonte: All. 4, § 7. [VINCOLANTE per le IRT]* - Conferma D10 come conformità, non come buona pratica.

**REQ-41 - Verifica regolare dell'efficacia delle misure.** «verifica regolare dell'efficacia delle misure tecniche e organizzative adottate tenuto conto dello stato dell'arte tecnologico e delle variazioni del rischio». Ex artt. 24, 32 e 35 GDPR. *Fonte: All. 4, § 7. [VINCOLANTE]*

**REQ-42 - Interoperabilità con il NIT: mutua autenticazione a certificati.** Per l'integrazione con il nodo di interoperabilità: **certificato client con mutua autenticazione** emesso da CA, secondo le **Linee Guida Funzioni Crittografiche ACN**; servizio **OCSP e/o CRL**; cambio di stato del certificato compromesso **entro un'ora** dalla notifica e diffusione **entro un'ora** dal cambio di stato; **verifica dello stato di revoca a ogni instaurazione di comunicazione**; HSM per le chiavi private della CA. **API Management come unico punto di ingresso** (i client non chiamano i micro-servizi direttamente); token **JWT / OAuth / API key**; **IAM con SSO**; **PAM** per gli amministratori di sicurezza, autenticati con metodi di autenticazione forte. **Divieto di sessioni multiple contemporanee con le stesse credenziali.** *Fonte: All. 4, § 8. [TECNICO-VINCOLANTE]*

**REQ-43 - Residenza dei dati a doppio livello.** La documentazione deve distinguere: (a) **territorio nazionale** per i *deployment* delle IRT/PNT, ai sensi del DM 21 settembre 2022 e della classificazione ACN dei dati critici; (b) **territorio UE** per il nodo di interoperabilità, ai sensi dell'All. 4, § 8. Non appiattire i due livelli. *Fonte: DM 21 settembre 2022, All. A; DM 19 novembre 2025, All. 4, § 8. [VINCOLANTE]* - **Corregge la lettura del § 8.2 di R3.**

### H. Contenuto documentale e FSE

**REQ-44 - Produzione delle dieci tipologie documentali FSE di telemedicina.** Il sistema deve poter generare, secondo il set informativo dell'Allegato 1, i documenti di cui alle lettere **n)-w)** dell'art. 3, comma 1, del DM 7 settembre 2023, come introdotte dall'art. 7 del DM 19 novembre 2025. Per il perimetro televisita/teleconsulto sono obbligatori almeno: **prescrizione (lett. n)**, **richiesta teleconsulto (lett. o)**, **referto di specialistica per la televisita (lett. p)**, **relazione collaborativa per il teleconsulto/teleconsulenza (lett. q)**. *Fonte: DM 19 novembre 2025, art. 7 e All. 1. [VINCOLANTE]* - **Sostituisce il REQ-10 di R3** nella parte in cui assumeva il veicolo RSA.

**REQ-45 - Set informativo del referto di televisita.** Modellare integralmente i campi dell'All. 1, § 2.20, incluse le distinzioni **medico refertante ≠ medico firmatario**, **altra figura tecnica coinvolta nell'esecuzione della procedura**, **medico prescrittore**, **Codice CUP**, **codici identificazione oggetti correlati (ID PACS, Accession number, Studio DICOM)**, **Tipologia Accesso**, **data e ora di inizio e di fine erogazione**, **Modalità esecuzione procedura operativa**, **Strumentazione utilizzata**, **Parametri descrittivi della procedura**. *Fonte: All. 1, § 2.20. [VINCOLANTE]*

**REQ-46 - Mappatura esplicita dell'evidenza di qualità del collegamento.** Poiché il tracciato ministeriale non prevede un campo dedicato, il progetto deve stabilire con decisione documentata (ADR) in quale campo dell'All. 1, § 2.20 confluiscono l'attestazione di **qualità del collegamento e idoneità** e l'indicazione dei **collaboratori partecipanti** richieste dall'Accordo 215/CSR 2020, e produrre tale contenuto in forma strutturata e ripetibile. *Fonte: Accordo 215/CSR 2020 + All. 1, § 2.20. [VINCOLANTE il contenuto, PROGETTUALE la collocazione]*

**REQ-47 - Relazione collaborativa del teleconsulto come allegato, non come documento autonomo.** La relazione (lett. q) va conferita al FSE **come allegato del documento di referto della prestazione o dell'evento principale redatto dal medico richiedente**, con correlazione tramite `idRichiesta`. Deve registrare **data di ricezione della richiesta**, **data e ora di presa in carico**, **data e ora di programmazione della consulenza**. *Fonte: All. 1, § 2.21. [VINCOLANTE]* - **Precisa il REQ-4 di R3.**

**REQ-48 - Codifica della modalità di esecuzione del teleconsulto.** Il campo «Modalità esecuzione procedura operativa» deve rappresentare, in forma strutturata, la combinazione: **estemporaneo | programmato** × **sincrono | asincrono** × **con presenza dell'assistito | senza presenza dell'assistito**. *Fonte: All. 1, §§ 2.19 e 2.21. [VINCOLANTE]*

**REQ-49 - Richiesta di teleconsulto generata internamente alla IRT, con routing.** Modellare `idRichiesta`, medico titolare e medico sostituto, `classePriorita`, **`Slot temporale`** proposto, **`Richiesta disponibilità immediata`** (ammessa solo con urgenza alta), **`Raggiodierogazione`** con valori **aziendale | regionale | nazionale**, `codProdPrest` (nomenclatore nazionale) e **`codCatalogoPrescr`** (catalogo regionale unico). Supportare gli assistiti **SASN** (`socNavigaz`) e i soggetti **assicurati da istituzioni estere**. *Fonte: All. 1, § 2.19. [VINCOLANTE]*

**REQ-50 - Prescrizione sui tracciati esistenti.** Le prescrizioni di televisita, teleassistenza/teleriabilitazione e telemonitoraggio usano il **tracciato della prescrizione specialistica ex DM 2 novembre 2011**; le richieste di dispositivi di telemonitoraggio, ove necessario, il **tracciato della prescrizione farmaceutica**. Nessun tracciato prescrittivo proprietario. *Fonte: All. 1, § 2.18. [VINCOLANTE]*

**REQ-51 - Tesserino dispositivi con UDI e dati tecnici (rilevante MDR).** Se il perimetro include il telemonitoraggio: documento generato dalla IRT e **firmato digitalmente dal professionista sanitario che assegna il dispositivo**, contenente **UDI in formato AIDC e UDI-DI leggibile dall'uomo**, numero di serie o lotto, **nome, indirizzo e sito web del fabbricante**, **tipo di collegamento**, **tipo di alimentazione**, **esito del check tecnico**, **parametri tecnici (connettività, configurazione, taratura)**. *Fonte: All. 1, § 2.23. [VINCOLANTE nel perimetro telemonitoraggio]*

**REQ-52 - Le IRT non conservano i documenti generati.** «Le IRT non conservano i dati e documenti generati ai sensi dell'art. 4, comma 4.» I documenti sono conferiti al FSE **dalle strutture sanitarie**. I dati di autenticazione e accesso sono conservati **12 mesi**. **Il modello di persistenza deve prevedere una configurazione «no-retention» del contenuto clinico**, con la piattaforma in ruolo di produttore e non di *repository*. *Fonte: DM 19 novembre 2025, artt. 4, c. 4, e 12. [VINCOLANTE]* - **Impatto architetturale forte: incide sulla feature «recording opzionale cifrato» e sulla retention configurabile.**

**REQ-53 - Matrice di autorizzazione documentale per ruolo.** Implementare la tabella «Accesso in consultazione delle IRT per la finalità di diagnosi, cura, riabilitazione» dell'All. 3, § 5.2, con i sei ruoli previsti. In particolare: **il referto di specialistica per la televisita non è accessibile a infermiere/ostetrica né a personale amministrativo**; il personale amministrativo accede **limitatamente ai dati amministrativi**; la richiesta di teleconsulto è accessibile solo a medici e altri dirigenti sanitari e all'assistito. *Fonte: All. 3, § 5.2. [VINCOLANTE]* - **Affina il REQ-16 di R3.**

### I. Micro-servizi e comunicazione

**REQ-54 - Crittografia end-to-end sulla messaggistica, senza persistenza.** Il micro-servizio *core* «Messaggistica (Chat messaging)» deve consentire comunicazione asincrona o in tempo reale e condivisione di file **«senza persistenza di dati e documenti, adottando protocolli sicuri in termini di crittografia end to end delle conversazioni»**. *Fonte: DM 19 novembre 2025, All. 3, § 4.1.1. [VINCOLANTE]* - **Requisito nuovo: il *context pack* dichiara E2EE sul media (DTLS-SRTP) ma non sulla chat.**

**REQ-55 - Perimetro *core* per servizio minimo.** Per candidarsi come componente di IRT il sistema deve coprire, per la **televisita**: gestione questionari, motore di *workflow*, videoconferenza, gestione eventi e notifiche, *patient onboarding*, chat. Per il **teleconsulto**: gestione lista di lavoro, videoconferenza, chat, *patient onboarding*, eventi e notifiche, **definizione di secondo parere**. *Fonte: All. 3, §§ 4.1.1 e 4.1.2. [TECNICO-VINCOLANTE]* - L'elenco è dichiarato «esemplificativo e non esaustivo».

**REQ-56 - Integrazione con i sistemi centrali nazionali.** La piattaforma deve poter integrarsi con: **SPID/CIE**, **FSE nazionale**, **ANA**, **PagoPA**, **Sistema Tessera Sanitaria**, **PDND**, **Anagrafe nazionale dei consensi**. *Fonte: All. 3, § 2. [TECNICO-VINCOLANTE]* - Amplia il REQ-29 di R3: PagoPA e Anagrafe consensi non erano nell'elenco.

**REQ-57 - Consumo delle terminologie e delle linee guida nazionali in FHIR.** La piattaforma deve poter consumare dal Business Glossary della INT le risorse terminologiche **FHIR** (`CodeSystem`, `ValueSet`, `ConceptMap`) dal **Terminology Server** e le linee guida/PDTA/protocolli dal **Library Repository** in formato documentale FHIR, con logica espressa in **HL7 CQL**. *Fonte: All. 3, § 3.2. [TECNICO-VINCOLANTE]* - **Nota MDR: l'esecuzione locale di logica CQL configura supporto alla decisione clinica. Va delimitata nella destinazione d'uso o esclusa dal perimetro certificato di Classe I.**

### L. Percorso clinico e accessibilità

**REQ-58 - Fase di «verifica di eseguibilità» tracciata su tre dimensioni.** Prima dell'erogazione, il sistema deve richiedere e registrare: **utilità clinica**, **sicurezza clinica** e **verifica della compliance digitale del paziente** (capacità di interazione con i sistemi digitali). *Fonte: AGENAS, «Modello orientativo di erogazione della Televisita», v. 1.0.25 del 16 aprile 2026, § Verifica di eseguibilità. [RACCOMANDATO, di fatto atteso in gara]* - **Estende il REQ-2 di R3.**

**REQ-59 - Referto condizionato al *setting*, e canale alternativo al FSE.** Il sistema deve distinguere: televisita in specialistica ambulatoriale → **referto obbligatorio** inviato al FSE; televisita programmata ed erogata direttamente da **MMG/PLS** → **prescrizione non necessaria** e **annotazione digitale in luogo del referto**. Deve inoltre supportare, «qualora il paziente abbia difficoltà ad accedere al proprio FSE, su richiesta», l'invio del referto **in modalità sicura con doppia autenticazione**. *Fonte: DM 30 settembre 2022, All. B, § Modalità di erogazione. [VINCOLANTE]* - **Corregge il REQ-3 di R3, che poneva l'obbligo di referto come incondizionato.**

**REQ-60 - Requisiti di accessibilità per categoria di utente.** Oltre a WCAG 2.1 AA / EN 301 549 (REQ-26 di R3): **sottotitolazione o comunicazione scritta in sovrapposizione all'immagine video** e **condivisione schermo** per le disabilità uditive; supporto all'assistenza del caregiver e compatibilità con ausili per cecità totale o parziale; accesso alla videochiamata **fruibile in autonomia** da persone anziane; modalità che consentano l'uso da parte dell'esercente la patria potestà con contemporaneo accudimento del minore; per gli adolescenti minorenni, uso in prima persona con presenza o autorizzazione dell'esercente la patria potestà. *Fonte: DM 30 settembre 2022, All. B, § Popolazione. [VINCOLANTE]*

**REQ-61 - Interruzione tecnica e riprogrammazione.** Il sistema deve tracciare come esito tipizzato l'interruzione per comunicazione inadeguata e generare l'evento di **riprogrammazione della visita in presenza**, con prenotazione su agende digitali «in tempi adeguati alle necessità del paziente». *Fonte: Accordo 215/CSR 2020; AGENAS, Modello orientativo Televisita v. 1.0.25. [VINCOLANTE]* - Rafforza il REQ-6 di R3 con la componente di prenotazione.

**REQ-62 - Divieto di uso in urgenza/emergenza per la televisita.** La televisita «non è suggeribile» in urgenza/emergenza «in quanto non deve costituire ragione per ritardare interventi in presenza». Il sistema non deve offrire percorsi di televisita in contesti di urgenza; il teleconsulto/teleconsulenza è invece «eseguibile anche in situazioni di urgenza o emergenza». *Fonte: DM 30 settembre 2022, All. B. [VINCOLANTE]* - **Nota: si combina con il divieto dell'Accordo 2020 di usare la teleconsulenza per surrogare il soccorso.**

**REQ-63 - Dichiarazione onesta delle soglie tecniche.** La documentazione di prodotto deve dichiarare esplicitamente che le soglie di qualità del collegamento (RTT, *packet loss*, *jitter*, *bitrate*, latenza target) sono **specifiche di prodotto**, non requisiti normativi, e devono essere **configurabili per tenant**; e deve documentarle come input della gestione del rischio ISO 14971 e come parte della destinazione d'uso ai fini MDR. *Fonte: assenza di soglie in tutte le fonti nazionali esaminate. [ONESTÀ DOCUMENTALE - vincolo di progetto]*

---

# Impatto sulle decisioni di progetto

Elenco di ciò che **cambia** rispetto a quanto R3 aveva assunto o lasciato aperto, in ordine di gravità.

### 1. Il referto di televisita ha una tipologia documentale FSE propria - l'ipotesi RSA era errata

R3 ipotizzava il veicolo «Referto di Specialistica Ambulatoriale (RSA)» dichiarandolo da verificare. **È errato.** Il DM 19 novembre 2025 crea **dieci nuove tipologie documentali FSE** dedicate alla telemedicina, fra cui «**referto di specialistica per la televisita**», con set informativo definito in Gazzetta Ufficiale. **Il modello dati del progetto va costruito su quel set**, non su RSA. Resta da acquisire il template CDA2 e i metadati IHE.

### 2. Esiste una porta d'ingresso normativa alternativa alle gare delle Regioni capofila

R3 concludeva (§ 5.4) che «il canale di acquisto pubblico per le soluzioni PNRR è chiuso» e che un progetto open source entra solo come componente di un aggiudicatario, in riuso o nel mercato non-SSN. **Il DM 19 novembre 2025, art. 3, c. 4 apre una terza via**: le Regioni possono erogare telemedicina con «infrastrutture, applicativi o strumenti diversi» purché rispettino **standard tecnici certificati da AGENAS** e alimentino il FSE, con il **Gestore Soluzioni di Telemedicina (GST)** della INT come organo del **Processo di Validazione**. **È il percorso strategicamente più promettente per Telemedic**, e va documentato come tale. Va accertato in che cosa consista operativamente il Processo di Validazione (richiesta ad AGENAS).

### 3. Le fonti cogenti includono un capitolato di gara regionale

L'Allegato 4, § 7 impone a **tutte** le IRT, «ivi incluse quelle che non sono state parte della suddetta procedura», le misure di sicurezza del **capitolo 5 del capitolato tecnico della gara ARIA `aria_2023_807`**. È un documento non pubblicato in GU e non reperito in questa ricerca. **Il rischio di tracciabilità dei requisiti segnalato da R3 al § 4.1 non è stato eliminato: si è spostato, e su una fonte peggiore.** Priorità alta: acquisire il capitolato.

### 4. Esiste un nodo di interoperabilità (NIT) che R3 non aveva individuato

Con requisiti tecnici puntuali: mutua autenticazione a certificati client, OCSP/CRL con SLA di un'ora, API Management come unico punto di ingresso, IAM+SSO, PAM, divieto di sessioni concorrenti. **È il punto di aggancio interregionale** e definisce l'interfaccia che Telemedic deve saper parlare per essere federabile. Va aggiunto agli scenari architetturali (che in R3 erano solo A e B).

### 5. La retention del contenuto clinico va ripensata: «le IRT non conservano»

Art. 12, c. 2: le IRT **non conservano** i dati e documenti generati. Solo autenticazione/accesso per 12 mesi, log per 24 mesi. **Questo confligge con l'idea implicita di una piattaforma che sia anche archivio**, e incide direttamente su due feature dichiarate: il **recording opzionale cifrato con retention configurabile** e le **metriche su TimescaleDB**. Vanno riclassificati: il *recording* non è documento clinico ai sensi del decreto e va trattato con una base giuridica e una retention proprie; le metriche di qualità sono dati tecnici, non clinici. **Serve un ADR sulla tassonomia dei dati e sulla retention per classe.** Nota: R3 aveva già posto la domanda (Q8), ma senza conoscere l'art. 12.

### 6. La sicurezza richiesta è molto più prescrittiva di quanto R3 avesse ricostruito

R3, basandosi sul parere del Garante, elencava cinque misure. **Il testo dell'Allegato 4 ne elenca oltre trenta**, con nomi di tecnologia espliciti (HSM, TDE, WAF, IDS+IPS, SIEM, SOAR, PAM, microsegmentazione, virtual patching, Threat Intelligence, SBOM). Il capitolo «Sicurezza» della documentazione va riscritto su questa base. **La SBOM è obbligo normativo, non buona pratica.**

### 7. La residenza dei dati non è univocamente «territorio nazionale»

Il NIT è ammesso su CSP con *region* **UE**. Le IRT restano su territorio nazionale. **La conclusione del § 8.2 di R3** - «il requisito italiano applicabile alla PA sanitaria è residenza sul territorio nazionale», più stringente del vincolo V1 del *context pack* - **va articolata su due livelli**, altrimenti la documentazione è imprecisa.

### 8. Il referto non è sempre obbligatorio, e la prescrizione non è sempre necessaria

Il REQ-3 di R3 va condizionato: se la televisita è programmata ed erogata da **MMG/PLS**, la prescrizione non serve e il referto è sostituito da annotazione digitale. **Il modello di dominio deve rappresentare il *setting* di erogazione come discriminante di regole.**

### 9. La legge di bilancio va citata correttamente

**Art. 1, commi 410-412, L. 30 dicembre 2025, n. 199**, non «art. 85». 20 M€ per il 2026, DM attuativo entro 180 giorni proposto da AGENAS. Le cifre alternative (12,5 M€ / 25 M€) non sono confermate e vanno rimosse.

### 10. Il sub-investimento PNRR 1.2.3 vale 1.500 M€, non 1.000

Dato di fonte parlamentare primaria, febbraio 2026. **Il § 5.2 di R3 va aggiornato.** Il target M6C1-9 (300.000 assistiti) risulta **superato** con 467.479 assistiti a settembre 2025 secondo ReGiS. Ma il dato conta assistiti, non IRT federate: la narrazione «finestra di adozione 2026-2028» del § 5.4 di R3 **resta valida e anzi si rafforza**, perché il consolidamento è ancora davanti.

### 11. Esiste un decreto sui «grandi anziani» che R3 non ha rilevato

**DM 7 ottobre 2025**, in attuazione dell'art. 9, c. 2, del **D.lgs. 15 marzo 2024, n. 29**, con **150 milioni di euro** per prestazioni di telemedicina - telemonitoraggio domiciliare - rivolte a ultra-80enni con almeno una patologia cronica. **Potenzialmente il canale di finanziamento più rilevante del 2026-2027 fuori dal perimetro delle gare capofila.** Da reperire in GU e analizzare.

### 12. Non esistono soglie tecniche normative: la questione B2 si chiude, ma con una conseguenza

Nessuna norma italiana impone risoluzione, *frame rate*, banda o latenza. **Le proposte ingegneristiche del progetto non sono in conflitto con nulla - ma non possono essere presentate come conformità.** Il target «< 200 ms» del *context pack* va riqualificato come specifica di prodotto, e proprio per questo diventa **input della gestione del rischio ISO 14971 e della destinazione d'uso MDR**. La feature «metriche qualità su TimescaleDB» va documentata come **strumento di adempimento** dell'obbligo di attestazione medica della qualità del collegamento, non come vezzo tecnico.

### 13. Il perimetro di sicurezza nazionale cibernetica non copre la sanità

La sanità non è fra i settori PSNC secondo l'ACN. **Presunzione operativa: NIS2 + L. 90/2024, non PSNC.** Il PSNC resta possibile per designazione nominativa non pubblica del singolo cliente: va gestito come clausola contrattuale condizionale, con progettazione della notifica incidenti su **finestra di 1 ora** (la più stringente) e predisposizione documentale per una eventuale valutazione **CVCN** - dove l'apertura del codice sorgente e la SBOM sono un vantaggio strutturale.

### 14. Domande da girare ad altri agenti

- **All'agente MDR**: il Terminology Server e il Library Repository nazionali distribuiscono logica clinica in **HL7 CQL** per **CDSS**. Se Telemedic la esegue localmente, la Classe I non regge. Serve una delimitazione esplicita (consumare terminologie ≠ eseguire logica decisionale). Inoltre: se Telemedic diventa dispositivo medico venduto direttamente al SSN, si applica il *payback* dello 0,75% ex art. 1, commi 417-418, L. 199/2025, con esclusione sotto 50.000 € di fatturato annuo da vendita diretta.
- **All'agente architetturale**: (a) il **principio di separazione** clinico/amministrativo su componenti dedicati impatta la scelta RLS vs schema-per-tenant; (b) va progettato il client verso il **NIT** e non solo verso il *Gateway* FHIR; (c) va aggiunta **E2EE sulla chat**; (d) il modello «no-retention del contenuto clinico» va reso una modalità di esercizio configurabile.
- **All'agente sicurezza**: riscrivere il capitolo sicurezza sull'elenco dell'Allegato 4; progettare la notifica incidenti sulla finestra più stringente (1 ora); acquisire il capitolo 5 del capitolato `aria_2023_807`.
- **All'agente prodotto/documentazione**: allineare il glossario al **Glossario nazionale di Telemedicina AGENAS v. 1.0.0 del 29 gennaio 2026** (chiude la Q13 di R3); citare correttamente la legge di bilancio; non affermare mai che esistano soglie tecniche di legge.
- **Nuovo tema, non coperto da R3**: **art. 1, commi 405-406, L. 199/2025** - servizi di scambio transfrontaliero (MyHealth@EU) per ricette elettroniche, profilo sanitario sintetico, documenti clinici originali, referti di laboratorio, SDO e referti di diagnostica per immagini. Va incrociato con il Regolamento sullo Spazio europeo dei dati sanitari.

---

## Riepilogo esiti

| # | Voce | Esito |
|---|---|---|
| V1 | DM 19 novembre 2025, testo integrale | **RISOLTA** (riserva formale sulla certificazione GU; All. 5 non letto) |
| V2 | Legge di bilancio 2026 | **RISOLTA** (art. 1, commi 410-412, L. 199/2025 - non art. 85) |
| V3 | Tariffe 2026 | **PARZIALE** (contraddizione risolta; estremi GU del nuovo decreto e della sentenza TAR non accertati) |
| V4 | Referto di televisita nel FSE | **RISOLTA** quanto a tipologia documentale e metadati; **aperta** quanto a template CDA2 e codici |
| V5 | Flusso art. 50 / DEMA, valore `T` | **NON RISOLTA** |
| V6 | Riprogrammazione PNRR 1.2.3 | **PARZIALE** (1.500 M€ e target 300.000 accertati; atti di revisione ECOFIN non letti) |
| V7 | Stato reale di attivazione | **PARZIALE** (467.479 assistiti, 20 Regioni con piani; nessun dato su IRT federate ad agosto 2026) |
| V8 | Perimetro di sicurezza nazionale cibernetica | **RISOLTA** |
| V9 | Allegato B al DM 30 settembre 2022 - aree cliniche | **RISOLTA** |
| V10 | Indicazioni metodologiche AGENAS PPP | **NON RISOLTA** (in gran parte superata dall'All. 3 al DM 19 novembre 2025 e dal Business Glossary PNT) |
| B2 | Soglie tecniche minime normative | **RISOLTA in senso negativo**: non esistono |

**Riservatezza (R0).** Nessun nome di azienda, marchio, prodotto commerciale o dominio di potenziale partner compare in questo documento. Gli operatori economici sono indicati con le sole denominazioni istituzionali necessarie a identificare atti amministrativi pubblici (ARIA S.p.A. quale centrale di committenza regionale, AGENAS, Sogei), che non sono partner commerciali del progetto.