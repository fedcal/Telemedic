# Log agente R3 — Quadro istituzionale e normativo italiano

**Output**: `.telemedic/research/R3-normativa-italiana.md` (~17.400 parole, 12 sezioni)
Contiene **32 requisiti vincolanti numerati** per Telemedic (§11) e **13 questioni aperte** (§12).

## FATTI CHE CAMBIANO LE DECISIONI DI PROGETTO

### 1. Il perimetro MDR Classe I è più stretto di quanto assunto in D6 — CRITICO
Il **DM 21 settembre 2022, Allegato A, Sezione 2** impone **espressamente** la certificazione come dispositivo medico per:
- il micro-servizio `viewer dati clinici` **unitamente a quello di refertazione**, nei teleconsulti radiologico e istopatologico;
- il software **e** l'hardware della **televisita**, «ove nel servizio vengano usati dispositivi medici»;
- l'infrastruttura per il **telemonitoraggio** (richiamando espressamente la MDCG sulla qualificazione del software), con classe **potenzialmente superiore alla IIa** per il telemonitoraggio di livello 2.

Anche l'Accordo 215/CSR 2020 pone tra gli elementi minimi la «certificazione dell'hardware e/o del software, come dispositivo medico, idonea alla tipologia di prestazione».
**Conseguenza**: la strategia Classe I regge **solo** se la v1.0 esclude dalla destinazione d'uso il viewer diagnostico e il telemonitoraggio. Serve un ADR che delimiti il perimetro. → questione Q1 per l'agente MDR.

### 2. Lo stack dichiarato è incompleto rispetto ai driver tecnologici obbligatori
Il DM 21 settembre 2022 impone alle infrastrutture regionali: **architettura a micro-servizi**, **event-driven con event broker**, **containerizzazione** (con prevenzione del lock-in), **multi-tenant application in cloud**, **cloud native SaaS/PaaS**, **mobile first**.
**Lo stack dichiarato (Spring Boot + Angular + TimescaleDB) non include un event broker.** Va scelto e conciliato col vincolo Docker Compose per l'on-premise. → questione Q7.

### 3. TS-CNS non è opzionale
Il DM 19 novembre 2025 (All. 4) e il DM 7 settembre 2023 (art. 11) impongono autenticazione forte con identità digitale **ex art. 64 CAD: SPID, CIE e TS-CNS**. La decisione D9 va estesa a TS-CNS.

### 4. La telemetria di qualità è un requisito normativo, non una feature
L'Accordo 215/CSR 2020 impone che nel referto di televisita siano registrati **la qualità del collegamento e la conferma della sua idoneità** all'esecuzione della prestazione. La feature «metriche TimescaleDB» va quindi collegata esplicitamente all'obbligo normativo e il dato va portato nel referto, sottoposto a conferma del medico.

### 5. Conformità alle Implementation Guide di HL7 Italia, non a FHIR R4 "vanilla"
Esistono e sono pubblicate: **Televisita v0.2.0** (set. 2025), **Teleconsulto v0.2.0** (ott. 2025), **Teleassistenza v0.2.0** (dic. 2025), **Telemonitoraggio v0.2.0** (gen. 2026), **IT-Core v0.2.0** (mag. 2026). Tutte su FHIR R4 4.0.1. Confermano l'uso di `Composition` + `Bundle` per il referto (coerente con R1). → questione Q3.

### 6. Due tassonomie di prestazioni che NON coincidono
- **Accordo 215/CSR 2020**: televisita, teleconsulto, teleconsulenza, teleassistenza, telerefertazione + telecontrollo e telemonitoraggio come «modalità operative».
- **DM 21 settembre 2022**: quattro **servizi minimi** — televisita, teleconsulto/teleconsulenza (unificati), telemonitoraggio (promosso), teleassistenza. La telerefertazione scompare come servizio autonomo.
Il modello di dominio deve rappresentare **entrambe** e la loro mappatura.

### 7. I micro-servizi trasversali vanno INTEGRATI, non reimplementati
Il DM è esplicito: per «refertazione e firma digitale» «**non si deve realizzare un modulo ad hoc**» ma prevedere l'integrazione con il modulo regionale. Vale anche per `viewer dati clinici`, `booking management`, `billing management`. Riduce il perimetro da costruire e sposta il valore sull'integrazione. → questione Q5.

### 8. SLA obbligatori H24 7/7
Tempi di presa in carico / risoluzione vincolanti: Critica **30/60 min**; Alta **30/90 min**; Media **60 min/8 h**; Bassa **60 min/24 h**.

### 9. Residenza dei dati: il vincolo V1 è troppo permissivo
V1 dice «non fuori dall'UE». Il requisito italiano per la PA sanitaria è **residenza sul territorio nazionale**, con servizi cloud **qualificati ACN** al livello corrispondente (i dati sanitari ricadono con altissima probabilità nella classe «critici») o su **PSN**. Servono tre profili di deployment documentati: (a) UE, (b) Italia, (c) PSN/cloud qualificato.

### 10. Il canale di acquisto pubblico PNRR è chiuso
Le Regioni finanziate possono attivare le soluzioni **esclusivamente tramite le gare delle Regioni capofila**. Un progetto open source entra come **componente di una soluzione di un aggiudicatario**, oppure fuori dal perimetro PNRR, oppure nel mercato privato/assicurativo/mutualistico.

### 11. Nessuna tariffa nazionale per la telemedicina — onestà commerciale obbligatoria
La televisita è remunerata **come visita di controllo**; **teleconsulto e teleconsulenza non sono remunerati** (nessuna voce a nomenclatore, nessuna prescrizione SSN, nessuna compartecipazione); il nuovo nomenclatore non contiene voci di telemedicina. La documentazione commerciale non deve suggerire il contrario. → questione Q12.

### 12. «Riusabile ex art. 69 CAD» sarebbe un'affermazione scorretta
L'art. 69 riguarda il software di **titolarità di una PA**. Un progetto privato si pubblica nel catalogo Developers Italia con `publiccode.yml` per facilitare la valutazione comparativa **ex art. 68**, ma non genera automaticamente il diritto di «presa in riuso».

### 13. Il vincolo sulla prima visita va spiegato in modo stratificato
Il testo nazionale contiene due affermazioni di intensità diversa; le aperture in prima visita a valle di teleconsulto sono **regionali**, non nazionali. Sia «non può mai sostituire la prima visita» sia «è ammessa in prima visita» sono formulazioni imprecise. → questione Q11.

## Debolezza formale segnalata nella catena normativa
Il DM 21 settembre 2022 rinvia a documenti AGENAS **non pubblicati in Gazzetta Ufficiale**, creando requisiti sostanzialmente cogenti in sede di gara ma non reperibili in fonte ufficiale. Va segnalato nella documentazione di conformità come rischio di tracciabilità dei requisiti.

## 10 verifiche documentali ancora aperte (V1-V10)
Testo integrale DM 19 novembre 2025 · legge di bilancio 2026 · contraddizione sulle tariffe 2026 · esistenza di una tipologia documentale FSE per il referto di televisita · recepimento del valore `T = telemedicina` nel flusso art. 50 · riprogrammazione PNRR · stato reale delle IRT · perimetro PSNC · Allegato B al DM 30 settembre 2022 · indicazioni metodologiche AGENAS.
**Nessuno di questi dati va pubblicato senza verifica su fonte primaria.**
