# log-F1 — Guida dei fondamenti, primo blocco (moduli 01-03 + 07)

**Agente F1 / F1-bis — Telemedic — 25 agosto 2026**
**Decisione di riferimento: D35 («non dare nulla per scontato»). Collocazione: `docs/10_fondamenti/`.**

> **Nota di continuità.** I moduli 01, 02 e 03 sono stati redatti dall'agente F1, che si è
> interrotto per limite di sessione prima del quarto. Il modulo 07 è stato redatto da F1-bis,
> che **non ha modificato i tre moduli precedenti**. Questo log copre il blocco nel suo insieme
> ma la sezione dei termini per il glossario (§ 4) è **limitata al modulo 07**, perché gli altri
> tre portano già la propria tabella «Termini introdotti in questo modulo» in coda al file.

---

## 1. Moduli consegnati

| File | Titolo | `sidebar_position` | Righe | Parole (stima) | Stato |
|---|---|:-:|--:|--:|---|
| `docs/10_fondamenti/00-come-usare-questa-guida.md` | Come usare questa guida | 1 | 75 | ~600 | Preesistente, non modificato |
| `docs/10_fondamenti/01-sistema-sanitario-italiano.md` | Il sistema sanitario italiano | 2 | 1.107 | **~8.500** | Completo (F1) |
| `docs/10_fondamenti/02-prestazioni-di-telemedicina.md` | Le prestazioni di telemedicina | 3 | 1.417 | **~11.500** | Completo (F1) |
| `docs/10_fondamenti/03-il-dato-clinico.md` | Il dato clinico | 4 | 914 | **~7.500** | Completo (F1) |
| `docs/10_fondamenti/07-fse-e-infrastrutture-nazionali.md` | FSE e infrastrutture nazionali | 8 | 1.428 | **~12.000** | Completo (F1-bis) |

> **Onestà sul conteggio.** I valori in parole sono **stime** ricavate dal numero di righe e
> dalla densità media del testo: l'ambiente di redazione non disponeva di uno strumento di
> conteggio. Il vincolo di mandato («almeno 6.500 parole» per il modulo 07) è superato con
> ampio margine — il modulo 07 ha una lunghezza comparabile al modulo 02, che è il più esteso
> del blocco. **Prima di pubblicare metriche, eseguire `wc -w` sui file.**

### 1.1 Struttura del modulo 07 (per chi deve rivederlo)

| § | Contenuto |
|---|---|
| 1 | Modello mentale: quattro affermazioni portanti (indice ≠ archivio; quattro ruoli distinti; produttore ≠ archivio; obbligo del soggetto ≠ capacità del software) |
| 2 | FSE: base legale, titolarità, contenuti art. 3, alimentazione art. 12, consultazione art. 15, consensi/oscuramento/dati a maggiore tutela, FSE 2.0 e fasi |
| 3 | INI ed EDS: cosa fanno, in cosa differiscono, tabella di confronto, livello regionale, diagramma logico |
| 4 | Ciclo di vita del documento: generazione, firma, controllo formale e semantico, indicizzazione INI, termine, consultazione, oscuramento + **diagramma Mermaid di sequenza** + tabella dei punti non verificati |
| 5 | **PDND e ModI da zero**: il problema, il ModI, il vocabolario PDND (e-service, erogatore, fruitore, finalità, voucher), flusso in sequenza, cosa la PDND **non** è |
| 6 | Attori istituzionali; il peso dei pareri del Garante; **i quattro sensi della parola «qualificare»** |
| 7 | Residenza dei dati a due livelli; misure di sicurezza dell'All. 4; anomalia di tracciabilità delle fonti |
| 8 | Identità digitale in sintesi operativa; **il progetto non può essere accreditato** (D36); SPID in SAML2, CIE anche in OIDC, TS-CNS in mTLS; rinvio al modulo 04 |
| 9 | **Tabella a due colonne**: cosa fa il progetto / cosa resta a chi installa |
| 10 | EHDS: Reg. (UE) 2025/327, uso primario e secondario, capo III, raccordo con MDR, conseguenze di progetto |
| 11 | Riepilogo dei 14 punti `[NV]` con destinatario della richiesta |
| — | «Cosa devi ricordare» (11 punti) + «Termini introdotti in questo modulo» (36 voci) |

### 1.2 Vincoli redazionali rispettati

- **R0**: nessuna azienda, marchio, prodotto commerciale o dominio di potenziale partner. Le
  amministrazioni citate (Ministero della salute, MEF, Ministero dell'Interno, AGENAS, AgID,
  ACN, Sogei, Poligrafico) sono autorità o gestori di infrastrutture pubbliche.
- **Nessuna duplicazione con il modulo 02**: le dieci tipologie documentali FSE, il set
  informativo del referto di televisita, l'architettura PNT/INT/IRT/NIT, la matrice di
  visibilità documentale e l'art. 3, c. 4 sono **rinviati con link relativi**, non ripetuti.
- **Nessuna specifica di interfaccia inventata**: dove la documentazione tecnica non è pubblica
  è dichiarato `[NV]` con l'indicazione del soggetto a cui va richiesta.
- Distinzione costante fra «la norma stabilisce», «è prassi» e «è una valutazione del progetto»
  (in particolare § 10.3 sull'EHDS e § 8.3 sull'accreditamento).

---

## 2. Punti `[NV]` aperti

### 2.1 Aperti dal modulo 07 (14 voci, § 11 del modulo)

| # | Punto | Destinatario della richiesta | Impatto |
|---|---|---|---|
| NV-07-01 | Template CDA2 delle dieci tipologie documentali di telemedicina | Portale FSE, area tecnica; Sogei / INI | **Bloccante** per la serializzazione documentale |
| NV-07-02 | Codici di tipologia documentale (`typeCode`, `classCode`, codifica LOINC) e metadati IHE XDS | Come sopra | **Bloccante** per `SubmissionSet` / `DocumentEntry` |
| NV-07-03 | Se la v. 2.6.4 di «Affinity Domain Italia» contenga già i template di telemedicina | Portale FSE, area tecnica | Alto |
| NV-07-04 | Specifiche di interfaccia delle soluzioni tecnologiche AGENAS ex comma 15-*quater* | AGENAS; Regione di riferimento | **Bloccante** per l'adattatore di conferimento |
| NV-07-05 | Mappa consolidata delle differenze regionali di alimentazione e consultazione | Singole Regioni | Alto, per il deployer |
| NV-07-06 | Codifica della modalità di erogazione a distanza nei flussi di rendicontazione | Sistema TS; disciplinari regionali di specialistica ambulatoriale | Medio (eredita V5 di B1, non risolta) |
| NV-07-07 | Contenuto operativo del **Processo di Validazione** AGENAS ex art. 3, c. 4 | AGENAS | **Strategico**: è la porta d'ingresso al mercato pubblico |
| NV-07-08 | Capitolo 5 del capitolato tecnico reso cogente per tutte le IRT dall'All. 4, § 7 | Centrale di committenza regionale; atti della procedura | Alto (sicurezza) |
| NV-07-09 | Indicazioni metodologiche AGENAS 2022 richiamate *per relationem* dal DM 21/09/2022 | AGENAS, anche via accesso civico generalizzato ex art. 5, c. 2, D.lgs. 33/2013 | Medio (in gran parte assorbito dall'All. 3 al DM 19/11/2025) |
| NV-07-10 | Specifiche operative di dettaglio della PDND (voucher, durata, algoritmi, *onboarding*, collaudo) | Linee guida AgID PDND v2, maggio 2025; documentazione tecnica della piattaforma | Medio |
| NV-07-11 | Stato di attuazione effettivo della Fase III del FSE, Regione per Regione, ad agosto 2026 | Ministero della salute; Regioni; relazione annuale AGENAS/ASD | Basso per il codice, alto per il *go-to-market* |
| NV-07-12 | Mappatura puntuale delle date di applicazione del capo III EHDS | Disposizioni finali del Reg. (UE) 2025/327 | Medio (orizzonte 2029-2031) |
| NV-07-13 | Documento AgID che associa il livello di garanzia SPID alla categoria «servizi sanitari» | AgID | Medio |
| NV-07-14 | Se resti vera l'indisponibilità di OIDC presso i gestori di identità SPID in produzione | AgID; forum ufficiale SPID | Alto per la stima di lavoro |

### 2.2 `[NV]` già aperti dai moduli 01-03 e non chiusi da 07

Elencati per completezza del blocco; la titolarità resta ai moduli che li hanno sollevati.

- **Modulo 02, § 6.2** — Processo di Validazione AGENAS: coincide con NV-07-07, **stessa voce**.
- **Modulo 02, § 7.1** — stato di attuazione del termine del 30 giugno 2026 per la messa a
  regime dell'integrazione dei contenuti FSE (art. 7, c. 3, DM 19/11/2025).
- **Modulo 02, § 7.3** — template CDA2 e metadati IHE: coincide con NV-07-01 e NV-07-02.
- **Modulo 02, § 9.3** — estremi di pubblicazione in GU del nuovo decreto tariffe.
- **Modulo 02, § 4.8** — assenza di una definizione normativa nazionale autonoma della
  telecooperazione sanitaria.

**Osservazione**: tre `[NV]` sono condivisi fra il modulo 02 e il modulo 07. Vanno tracciati
**una volta sola** nel registro delle questioni aperte del progetto, con riferimento a entrambi
i punti di consumo, per evitare che vengano chiusi due volte o mai.

---

## 3. Questioni per gli altri agenti

### 3.1 All'agente architetturale

1. **Adattatore di conferimento al FSE.** Il § 4 del modulo 07 documenta un flusso con almeno
   quattro punti di variabilità non pubblici (NV-07-01, 02, 04, 05). Serve un ADR che fissi:
   contratto interno stabile del conferimento, **dataset canonico** come modello primario,
   serializzazione (CDA2 / FHIR) come strategia sostituibile, implementazione configurabile per
   Regione. **Nessun template CDA2 va cablato nel dominio.**
2. **Il conferimento non può bloccare la cura** (art. 13, c. 4, DM 7 settembre 2023) ma deve
   rispettare il termine di **cinque giorni dall'erogazione** (art. 12, c. 3). Ne discende una
   coda durevole, con ripetizione dei tentativi, osservabile, e una **coda di eccezioni
   lavorabile**: il rifiuto del controllo formale e semantico è uno **stato di dominio**, non
   un'eccezione tecnica.
3. **Indistinguibilità dell'oscuramento** (art. 9, c. 6). È un requisito trasversale che tocca
   interfaccia, API, contatori, identificativi progressivi e codici di errore: `403` e `404`
   non devono essere distinguibili. Va tradotto in criteri di accettazione e in test dedicati.
   **Non è deducibile dai requisiti funzionali ordinari.**
4. **RdA ≠ RdE**: ogni documento porta entrambe, non deducibili l'una dall'altra. Impatta il
   modello dati e la logica di instradamento dell'indice (art. 24: l'indice si sposta, il
   documento no).
5. **PDND**: il progetto non è né erogatore né fruitore. Se si prevede un modulo di
   pubblicazione di e-service, va progettato come **capacità offerta al deployer**, non come
   integrazione del prodotto.

### 3.2 All'agente sicurezza

6. **Residenza dei dati a due livelli** (§ 7.1 del modulo): territorio nazionale per IRT/PNT,
   **almeno UE** per il nodo di interoperabilità. La documentazione di sicurezza non deve
   appiattire i due livelli. Corregge la lettura originaria di R3, § 8.2, come già rilevato da
   B1 (REQ-43).
7. **La SBOM è conformità normativa**, non buona pratica (All. 4, § 7, DM 19/11/2025). Va detto
   così nel capitolo sicurezza.
8. **Sessione singola obbligatoria**: «l'infrastruttura IAM non permette a nessun utente di
   effettuare accessi multipli contemporanei utilizzando le proprie credenziali» (All. 4, § 8).
   Ha effetti su Keycloak, sul componente incorporabile e sui casi d'uso di più postazioni.
9. **Secondo fattore OTP obbligatorio in aggiunta all'identità digitale**, con livello di
   garanzia almeno L2. Va coordinato con il modello a realm broker e con la propagazione di
   `acr`.
10. **NV-07-08 (capitolo 5 del capitolato richiamato dall'All. 4)** è la lacuna di sicurezza
    più grave del blocco: una fonte cogente non pubblicata. Priorità di acquisizione alta.

### 3.3 All'agente identità digitale / IAM

11. Il modulo 07, § 8, è **una sintesi operativa con rinvio esplicito al modulo 04**. Chi
    scriverà il modulo 04 deve mantenere coerenti: (a) la formula «SPID-ready / CIE-ready /
    TS-CNS-ready» e il divieto di dire «accreditato»; (b) SPID in SAML2 e CIE anche in OIDC;
    (c) TS-CNS in mutua autenticazione TLS come unico canale senza dipendenze da terzi; (d) i
    livelli `SpidL1|L2|L3` ↔ LoA2/LoA3/LoA4. **Non riscrivere queste affermazioni in forma
    diversa**: sono citate nel modulo 07 e la divergenza sarebbe visibile al lettore.
12. NV-07-13 e NV-07-14 sono da chiudere in sede di modulo 04 o di implementazione.

### 3.4 All'agente MDR / regolatorio

13. **EHDS, capo III.** Il modulo 07, § 10, dichiara come **valutazione del progetto** (non
    come certezza) che Telemedic ricadrà con elevata probabilità nell'ambito del capo III, con
    possibile marcatura CE ai sensi dell'EHDS **indipendentemente** dalla disciplina dei
    dispositivi medici. Serve una posizione formale e una tabella artefatto → regime, coerente
    con quanto già richiesto da D41 per il CRA. Il modulo rinvia al modulo 10.
14. Il raccordo MDR/EHDS (tre casi dell'art. 2, par. 2, lett. k) va sviluppato nel modulo 10:
    il modulo 07 lo enuncia ma non lo tratta.

### 3.5 All'agente prodotto / documentazione

15. **La parola «qualificato» non va mai usata senza specificare da chi, per cosa e ai sensi di
    quale atto** (§ 6.3 del modulo: quattro procedimenti distinti). Regola redazionale da
    propagare a tutta la documentazione e alla pagina pubblica.
16. **Il perimetro assicurativo va riformulato.** Il *context pack* elenca fra i casi d'uso
    target «mutue e assicurazioni sanitarie»; l'art. 15, c. 4, del DM 7 settembre 2023 esclude
    **sempre** compagnie di assicurazione, periti e datori di lavoro dall'accesso al FSE. Il
    modulo 07, § 2.5, lo dichiara. La documentazione commerciale deve distinguere «prestazione
    erogata da professionisti convenzionati» da «consultazione del fascicolo», che è preclusa.
17. **Il taccuino personale dell'assistito** introduce una distinzione di qualità del dato —
    dato inserito dal cittadino ≠ dato certificato da un professionista — che va rappresentata
    nel modello dati e nel modulo 06. Segnalata al § 2.3 del modulo 07.

### 3.6 Ai futuri autori dei moduli 04, 05, 06, 09, 10, 12

18. Il modulo 07 contiene link relativi verso `04-identita-e-anagrafiche.md`,
    `05-standard-di-interoperabilita.md`, `06-fhir-da-zero.md`, `09-sicurezza-da-zero.md`,
    `10-regolatorio-da-zero.md`, `12-ambiente-di-sviluppo.md`. **I file 04, 09, 10 e 12 non
    esistono ancora**: i link sono coerenti con l'indice del modulo 00 ma **rompono la build
    Docusaurus** finché i file non sono creati. Va verificato prima del primo *deploy*.
19. Il modulo 07 rinvia al modulo 05 per IHE XDS, `SubmissionSet` e `DocumentEntry`: quel
    modulo deve coprirli, altrimenti resta un buco formativo.
20. Il modulo 07 rinvia al modulo 06 per il rapporto fra set informativo ministeriale (fonte
    normativa) e Implementation Guide FHIR nazionali (rappresentazione tecnica), e per la
    *gap analysis* campo per campo.

---

## 4. Termini per il glossario — **solo modulo 07**

Da riversare nel modulo `14-glossario.md` in forma bilingue. I moduli 01, 02 e 03 hanno già la
propria tabella dei termini in coda al file e non sono ripetuti qui.

| Termine (IT) | Resa inglese suggerita | Definizione breve |
|---|---|---|
| ACN — Agenzia per la cybersicurezza nazionale | National Cybersecurity Agency | Autorità che dal 19 gennaio 2023 qualifica servizi e infrastrutture cloud per la PA ed emana le misure di sicurezza NIS2; ospita il CSIRT Italia |
| Affinity Domain Italia | Italian Affinity Domain | Specifiche tecniche nazionali per l'interoperabilità fra i sistemi regionali di FSE; versione dichiarata pubblicata: 2.6.4 |
| AgID — Agenzia per l'Italia digitale | Agency for Digital Italy | Autorità delle regole tecniche trasversali ex art. 71 CAD: ModI, PDND, accessibilità, riuso; gestisce federazione e Registro SPID |
| AGENAS | National Agency for Regional Healthcare Services | Anche Agenzia nazionale per la sanità digitale; gestisce INT ed EDS, fornisce le soluzioni di controllo e conversione, svolge il Processo di Validazione |
| Anagrafe consensi e revoche | Consent and revocation registry | Componente dell'INI che registra i consensi alla consultazione del FSE e le loro revoche |
| ANA — Anagrafe nazionale degli assistiti | National registry of assisted persons | Anagrafe ex art. 62-*ter* CAD da cui il FSE rileva i dati identificativi e amministrativi |
| CAD — Codice dell'amministrazione digitale | Digital Administration Code | D.lgs. 82/2005; artt. 50-*ter* (PDND), 64 (identità digitale), 68-69 (riuso), 71 (regole tecniche) |
| CDA2 — HL7 Clinical Document Architecture Rel. 2 | — | Standard documentale nazionale del FSE, veicolato dentro un PDF firmato digitalmente |
| Categorie prioritarie (EHDS) | Priority categories | Insiemi di dati sanitari che devono circolare nell'EHDS: profilo sanitario sintetico, prescrizione elettronica, referti di laboratorio e di imaging, lettere di dimissione |
| CIE — Carta d'identità elettronica | Electronic identity card | Canale di identità digitale ex art. 64 CAD; gestore l'Interno; disponibile in SAML2 **e** OIDC |
| Dati a maggiore tutela dell'anonimato | Data subject to enhanced anonymity protection | Categoria dell'art. 6 DM 7 settembre 2023; visibili a terzi solo con consenso esplicito reso all'erogante |
| E-service | E-service | Servizio applicativo basato su API pubblicato sul catalogo PDND da un ente erogatore |
| EDS — Ecosistema dati sanitari | Health Data Ecosystem | Repository centrale (DM 31 dicembre 2024); titolare il Ministero della salute, gestione AGENAS; opera su pseudonimi, aggiornato ogni 24 ore |
| EHDS — Spazio europeo dei dati sanitari | European Health Data Space | Reg. (UE) 2025/327; uso primario e secondario; il capo III disciplina i sistemi di cartelle cliniche elettroniche |
| Ente erogatore / ente fruitore | Provider / consumer entity | Nella PDND, chi pubblica un e-service e chi ne chiede la fruizione: **soggetti giuridici**, non software |
| Finalità (PDND) | Purpose | Ragione dichiarata di accesso a un e-service; base dell'approvazione e della verificabilità a posteriori |
| FSE — Fascicolo sanitario elettronico | Electronic Health Record (national) | Insieme dei dati e documenti digitali sanitari generati da eventi clinici riguardanti l'assistito, ex art. 12 D.L. 179/2012 |
| FSE 2.0 | — | Riforma introdotta dall'art. 21 D.L. 4/2022: alimentazione per legge, finalità distinte, componenti nazionali, EDS, soluzioni AGENAS |
| Indice nazionale FSE | National EHR index | Componente dell'INI che indicizza i metadati; trasferisce l'indice a quello della RdA quando questa viene associata |
| INI — Infrastruttura nazionale per l'interoperabilità | National Interoperability Infrastructure | Componente nazionale del sistema FSE, realizzata dal MEF attraverso il Sistema Tessera Sanitaria |
| ModI — Modello di Interoperabilità | Interoperability Model | Regole tecniche AgID (Det. 547/2021) sui pattern di interazione, sicurezza e tracciatura delle API della PA |
| PDND — Piattaforma Digitale Nazionale Dati | National Digital Data Platform | Catalogo di e-service e autorità di autorizzazione ex art. 50-*ter* CAD; rilascia voucher, **non trasporta i dati** |
| Portale nazionale FSE | National EHR portal | Componente dell'INI che espone il fascicolo *online* ad assistito e operatori |
| Profilo sanitario sintetico | Patient summary | Documento derivato, redatto e aggiornato dal medico di fiducia, che riassume la storia clinica rilevante |
| PSN — Polo Strategico Nazionale | National Strategic Hub | Infrastruttura PNRR che ospita dati e servizi critici e strategici delle PA su *data center* nazionali |
| QC1-QC4 / QI1-QI4 | — | Livelli di qualificazione ACN, rispettivamente dei servizi cloud e delle infrastrutture che li ospitano |
| RdA / RdE | Region of assistance / Region of delivery | Regione di iscrizione dell'assistito e Regione di erogazione della prestazione; vanno rappresentate entrambe |
| SBOM — Distinta base del software | Software Bill of Materials | Inventario delle componenti software, librerie di terzi e open source comprese; **imposto** dall'All. 4 al DM 19 novembre 2025 |
| Soluzioni tecnologiche AGENAS | AGENAS technological solutions | Componenti ex comma 15-*quater*: controllo formale e semantico, conversione nei formati standard, invio all'EDS; **senza persistenza** |
| SPID | Public Digital Identity System | Federazione di gestori di identità accreditati da AgID; in produzione utilizzabile in **SAML2** |
| Sistema Tessera Sanitaria | Health Insurance Card System | Infrastruttura del MEF ex art. 50 D.L. 269/2003 su cui è realizzata l'INI |
| Taccuino personale dell'assistito | Personal health notebook | Sezione del FSE alimentata dal cittadino; i contenuti **non sono dati clinici certificati** |
| TS-CNS | Health card / National Services Card | Tessera sanitaria con microchip CNS; identità ex art. 64 CAD realizzata con **mutua autenticazione TLS** |
| Voucher (PDND) | Authorization voucher | Token rilasciato dalla PDND al fruitore, presentato all'erogatore per dimostrare l'autorizzazione |

---

## 5. Stato del blocco e prossimi passi

**Completato**: moduli 00 (preesistente), 01, 02, 03, 07. Sono presenti anche 05 e 06, redatti
da altro agente.

**Mancante nella guida** (rispetto all'indice del modulo 00): 04, 08, 09, 10, 11, 12, 13, 14,
15. In particolare **04 è prerequisito dichiarato di due percorsi di lettura** e **14
(glossario)** deve raccogliere le tabelle dei termini di tutti i moduli.

**Verifica tecnica da eseguire prima del primo *deploy* Docusaurus**: i link relativi verso i
moduli non ancora scritti rompono la build. Va deciso se creare i file come segnaposto o se
rinviare l'attivazione dei link.

**Riservatezza (R0)**: verificata. Nessun nome di azienda, marchio, prodotto commerciale o
dominio di potenziale partner compare nei moduli del blocco né in questo log.
