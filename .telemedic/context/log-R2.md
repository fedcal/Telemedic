# Log agente R2 — Ricerca normativa (MDR, GDPR, licenze)

**Data:** 25 agosto 2026
**Output prodotto:** `/home/federicocalo/Scrivania/prj/Telemedic/.telemedic/research/R2-normativa-mdr-gdpr-licenze.md`

Documento in italiano, ~9 sezioni, con citazioni puntuali a regolamento/articolo/allegato, linee guida
MDCG, standard e URL. Include disclaimer (analisi tecnica, non consulenza legale) e marcatori
**[DA VERIFICARE]** su ogni punto non accertato su fonte primaria.

---

## Fatti chiave accertati

1. **MDCG 2019-11 è stata rivista il 17 giugno 2025 (Rev.1).** La revisione ha riscritto la sezione
   sui **Moduli** (§ 7), aggiornato l'Annex I c.1 per il raccordo con l'**EHDS**, aggiunto un **nuovo
   esempio di Classe I** nell'Annex IV, ampliato la Regola 11a e introdotto il termine **MDAI**.
   PDF: <https://health.ec.europa.eu/document/download/b45335c5-1679-4c71-a91c-fc7a4d37f12b_en?filename=mdcg_2019_11_en.pdf>

2. **La Rev.1 contiene un passaggio testuale decisivo sulla telemedicina** (Annex I, d.1, p. 27):
   «*Telemedicine that solely transfers and displays information for monitoring purposes without
   interpreting data does not qualify as a medical device.*» E sui sistemi di comunicazione (Annex I, d):
   «*Communication systems are normally based on software for general purposes, and do not fall within
   the definition of a medical device*», con menzione esplicita dei *video communication systems*.
   La § 3.1 elenca *e-mailing, web or voice messaging* fra gli scopi **non** medici.

3. **La Classe I per Regola 11c esiste ma è quasi vuota.** La tabella IMDRF dell'Annex III MDCG dichiara
   testualmente: «*This table does not take into account MDSW which is Class I*» — nessuna cella della
   matrice Regola 11a produce Classe I. Gli unici due esempi di Classe I forniti da MDCG sono una app di
   fertilità e un ausilio alla comunicazione per disabilità.

4. **Il testo italiano della Regola 11 e delle regole di applicazione 3.1–3.7 dell'Allegato VIII** è
   stato recuperato integralmente. Rilevanti: **3.3** (software non connesso ad altri dispositivi si
   classifica separatamente), **3.5** (prevale la regola/sotto-regola più rigorosa), **3.7** (diagnosi
   diretta anche quando il dispositivo «fornisce informazioni decisive per la diagnosi»).

5. **Il DM 21 settembre 2022 (linee guida telemedicina, GU n. 256/2022, Allegato A) richiede
   espressamente la certificazione come dispositivo medico** per l'infrastruttura di telemonitoraggio,
   per la televisita quando vi si usano dispositivi medici, e per il teleconsulto in istologia e
   radiologia. È un vettore di rischio **italiano** indipendente dall'analisi MDR (capitolati pubblici).

6. **L'art. 16(1)(a) MDR** trasferisce gli obblighi di fabbricante a chi mette a disposizione un
   dispositivo **con il proprio nome o marchio**: è esattamente la fattispecie dell'embed white-label
   previsto dal context pack. L'esimente richiede un accordo che indichi il fabbricante sull'etichetta.

7. **EUDAMED: i primi quattro moduli sono obbligatori dal 28 maggio 2026** — quindi già in vigore alla
   data della ricerca. SRN necessario prima dell'immissione sul mercato.

8. **Il PSUR (art. 86) NON si applica alla Classe I**: la Classe I richiede PMS plan (art. 84) e
   **PMS report** (art. 85). La decisione D6 del context pack scrive «PMS/PSUR» ed è da correggere.

9. **Apache-2.0 non è nell'Appendice delle «Compatible Licences» dell'EUPL-1.2.** La definizione EUPL
   di «Distribution or Communication» include «*providing access to its essential functionalities*»:
   è la ragione precisa per cui EUPL avrebbe bloccato l'embed white-label in un SaaS proprietario. La
   decisione D1 (Apache-2.0) è confermata come corretta e per il motivo giusto.

10. **La Direttiva (UE) 2024/2853 esenta il FOSS solo se «sviluppato o fornito al di fuori di
    un'attività commerciale»** (art. 2, par. 2) e il considerando 14 fa cadere l'esenzione con
    corrispettivo o scambio di dati personali. L'**art. 15** vieta l'esclusione o limitazione
    contrattuale della responsabilità: **le clausole §§ 7–8 di Apache-2.0 non tengono** verso il
    paziente danneggiato. L'**art. 10** introduce presunzioni di difettosità, fra cui quella innescata
    dalla **non conformità a requisiti obbligatori di sicurezza previsti dal diritto UE**.

11. **Il CRA (Reg. 2024/2847) esclude i dispositivi medici MDR/IVDR (art. 2, par. 2).** Corollario
    controintuitivo: **non essere un dispositivo medico fa entrare Telemedic nel CRA** (applicazione
    generale dall'11 dicembre 2027; obblighi di segnalazione delle vulnerabilità attivamente sfruttate
    dall'**11 settembre 2026**, cioè fra tre settimane). L'art. 24 prevede obblighi alleggeriti per
    l'*open-source software steward*, senza sanzioni amministrative.

12. **EHDS (Reg. 2025/327):** in vigore dal 26 marzo 2025, applicazione generale dal 26 marzo 2027,
    capo III sui sistemi EHR dal 2029/2031. La Rev.1 MDCG impone di dichiarare se il prodotto o i suoi
    moduli ricadono sotto MDR/IVDR **oppure sotto l'EHDS**.

---

## RISCHI DA SEGNALARE SULLA DECISIONE D6 (percorso MDR Classe I)

> **Segnalazione principale: la decisione D6 così com'è formulata non è sostenibile giuridicamente.**
> Non perché l'ambizione sia sbagliata, ma perché la qualificazione «Classe I» presuppone di essere un
> dispositivo medico, e Telemedic — correttamente qualificato — **non lo è**.

1. **Contraddizione logica interna.** Per stare in Classe I bisogna prima essere dispositivo; per essere
   dispositivo serve una finalità medica propria; ma se si dichiara una finalità medica propria, la
   sotto-regola 11a («generalmente applicabile a tutti i MDSW» secondo MDCG) porta a **Classe IIa con
   Organismo Notificato**. Non esiste una casella Classe I comoda per una piattaforma di teleconsulto.

2. **Rischio speculare, spesso ignorato:** apporre la marcatura CE-MDR a un non-dispositivo è
   un'**irregolarità autonoma** (artt. 7 e 20 MDR: divieto di segni idonei a indurre in errore
   sull'attribuzione di funzioni e proprietà che il prodotto non possiede) e falsa il rapporto con
   l'integratore, che potrebbe fondare la propria conformità su una marcatura non dovuta.

3. **Il claim pubblico è materiale regolatorio (art. 2, punto 12, MDR).** Le formule già presenti nel
   posizionamento — «consulti video con **qualità clinica**», specialità target «cardiologia,
   psichiatria, **dermatologia**» — sono il singolo fattore che può far scivolare il prodotto in
   Classe IIa. Con la regola 3.7 (informazioni «decisive per la diagnosi») e con la § 3.1 Rev.1
   («software which alters the representation of data for a medical purpose»), la compressione video
   **lossy** in teledermatologia è un argomento sostenibile in contraddittorio contro il progetto.
   **Non ritengo che sia la lettura corretta, ma non è una lettura frivola.**

4. **Deriva funzionale.** Ho isolato nove funzionalità (C1–C9) che farebbero scattare la IIa o oltre.
   **Tre sono a una user story di distanza dal backlog dichiarato**: alert su soglia (la feature 7 già
   prevede «alert su soglia», seppur su metriche di rete: la distinzione va scritta), replay della
   registrazione con controlli di enhancement, refertazione assistita/codifica automatica.

5. **`DiagnosticReport` è gestibile ma richiede un'invariante di progetto.** Il nome della risorsa FHIR
   non ha rilievo regolatorio; ciò che conta è che **nessun campo clinicamente significativo sia
   derivato, inferito o precompilato dal sistema**. Serve un vincolo *pass-through autoriale*
   implementato, testato e protetto da un controllo in CI.

6. **Fabbricante persona fisica = esposizione patrimoniale illimitata.** L'art. 2(30) MDR ammette la
   persona fisica, ma con art. 10(16) (copertura finanziaria), art. 15 (PRRC da contrattualizzare
   esternamente per micro-impresa) e la nuova PLD si crea un'esposizione personale non schermata.
   **Nessuna dichiarazione di conformità UE prima della costituzione di un veicolo societario.**

7. **Correzione minore ma da fare:** D6 cita «PMS/PSUR»; per la Classe I il PSUR non è dovuto.

### Proposta di riformulazione di D6 (senza tagli allo scope)

- **Binario A — Determinazione di non-qualificazione documentata** (fascicolo di qualificazione con
  albero MDCG motivato passo per passo, funzioni escluse come design constraint, change control).
- **Binario B — Conformità volontaria «MDR-ready» + regulatory pack per l'integratore**: ISO 13485,
  IEC 62304, ISO 14971, IEC 62366-1, IEC 82304-1, ISO/IEC 81001-5-1, tracciabilità, SBOM, SOUP,
  processi PMS-like e vigilanza-like. **Stesso carico di lavoro di D6, valore commerciale superiore**:
  l'integratore potrà trattare Telemedic come SOUP documentato nel proprio fascicolo tecnico.
- **Binario C — Certificazione IIa con Organismo Notificato**, solo su decisione esplicita e come
  progetto a sé (telemonitoraggio, triage, refertazione assistita).

---

## Questioni aperte per gli altri agenti

### Per l'agente di architettura
- **V2 non è più un'opzione di design ma un requisito documentale**: la § 7 «Modules» della Rev.1 impone
  di delineare esplicitamente confini e interfacce dei moduli e di dichiarare quali ricadono sotto
  MDR/IVDR e quali sotto altra legislazione (EHDS incluso). Serve un diagramma dei moduli con
  attributo di regime normativo.
- **Invariante `DiagnosticReport` pass-through** da progettare come vincolo architetturale verificabile.
- **Rischio S4 «mis-associazione paziente–sessione–referto»**: è il singolo rischio più grave
  dell'architettura. Richiede misure di controllo dedicate (doppio identificatore, checksum, conferma
  esplicita del professionista) e test dedicati.
- **Se un giorno si introduce un SFU** per sessioni multiparte, la dichiarazione «nessuna decifratura
  intermedia / end-to-end» diventa falsa salvo E2EE con Insertable Streams/SFrame. Va deciso ora come
  formulare il claim.
- **Codec**: privilegiare VP8/VP9/AV1/Opus per la posizione brevettuale; H.264/H.265 sono coperti da
  patent pool e Apache-2.0 § 3 **non** li licenzia (copre solo i brevetti dei contributori).

### Per l'agente di sicurezza
- Serve un **runbook unico di incident response** che orchestri quattro orologi: GDPR 72 h · NIS2
  24 h/72 h/1 mese · MDR 2/10/15 giorni (se applicabile) · CRA 24 h (dall'11 settembre 2026).
- Servono: `SECURITY.md` con CVD policy e SLA (CRA art. 24), Security Risk Management File distinto ma
  collegato al file ISO 14971, dichiarazione di **fine supporto** per ciascuna minor, documento
  MDS2-equivalente per gli acquisti sanitari.
- **FIPS 140-2 è uno standard statunitense**: citarlo è lecito ma non conferisce presunzione UE ed è in
  tensione retorica con il posizionamento *sovereign*. Riferimenti UE appropriati: ENISA, SOG-IS,
  BSI TR-02102, raccomandazioni AgID.
- **DTLS-SRTP protegge il media, non i metadati**: signaling e TURN vedono identità, orari, durate e IP.
  Minimizzazione e retention breve sono requisiti ex art. 32 GDPR, non opzioni.

### Per l'agente frontend/accessibilità
- **WCAG 2.1 AA non basta.** Il riferimento corretto è **EN 301 549**, la cui **clausola 6
  (comunicazione bidirezionale vocale)** impone: **RTT / testo in tempo reale** quando è supportata la
  voce, identificazione del chiamante, e per il video **risoluzione, frame rate e sincronizzazione
  labiale sufficienti per la lingua dei segni**. Sono requisiti che nessuna audit WCAG rileva.
  Riformulare V6 come «EN 301 549 clausole 5, 6, 9, 10, 11, 12 inclusi i requisiti WCAG 2.1 AA» e
  produrre una **dichiarazione di accessibilità** in formato AgID.
- WCAG 2.1 AA va documentato anche come **misura di controllo del rischio d'uso** ai sensi di
  IEC 62366-1, non solo come adempimento di accessibilità.

### Per l'agente di integrazione
- **Documentazione device-agnostica obbligatoria**: dichiarare che la piattaforma non abilita, non
  comanda e non condiziona alcun dispositivo medico specifico, altrimenti scatta la qualificazione come
  **accessorio** (art. 2(2) MDR) e la regola 3.3 trascina nella classe del dispositivo pilotato.
- Deliverable contrattuali da produrre: *Regulatory Roles & Responsibilities Statement*,
  *Intended Purpose Statement*, *SOUP disclosure pack*, clausola di divieto di riqualificazione
  unilaterale, DPA art. 28 e catena sub-responsabile.
- **Target di interoperabilità nazionale = Gateway FSE 2.0 / EDS**, non solo API generiche
  (DM 21/09/2022 lo richiede per i servizi regionali).
- Componente pronto «Informazioni / Licenze open source» generato dalla SBOM, per soddisfare
  Apache-2.0 § 4(d) nell'embed white-label.

### Per l'agente CI/CD e qualità
Gate automatici da implementare (ognuno soddisfa più regimi contemporaneamente):
1. **DCO check** obbligatorio in branch protection;
2. **license gate** su SBOM con allowlist e blocco su GPL/AGPL/EUPL (dirette e transitive);
3. **`reuse lint`** bloccante (SPDX headers + `LICENSES/`) → soddisfa IEC 62304 § 8.1.2;
4. **SBOM CycloneDX + SPDX** generate dalla build, firmate (cosign) e pubblicate come release asset con
   attestazione di provenienza;
5. **matrice di tracciabilità** requisiti↔architettura↔test generata in CI, build **fallita** se un
   requisito è senza test o un rischio senza misura di controllo verificata;
6. **documentation linting** su una lista di termini a rischio regolatorio nei testi pubblici;
7. **checklist obbligatoria nel PR template**: impatto sulla qualificazione regolatoria.

### Per l'agente di documentazione
- Aggiungere `docs/08_compliance/` come *Medical Device File* / fascicolo di qualificazione versionato.
- Aggiungere il documento **«Requisiti dell'ambiente operativo e limiti d'uso»** (IEC 82304-1 § 7):
  è al tempo stesso conformità, misura di controllo del rischio U3 e — punto cruciale — **la prova su
  cui poggia l'unica esenzione da responsabilità realisticamente invocabile dal progetto** ai sensi
  dell'art. 11 della Direttiva 2024/2853 (difetto imputabile all'integrazione o alle istruzioni del
  fabbricante del prodotto finale).
- Inserire in home page, README, docs e UI la **dichiarazione di stato regolatorio**.

### Rischio di programma da segnalare al committente
La **validazione sommativa di usabilità** con utenti rappresentativi (medici e pazienti reali) richiesta
da IEC 62366-1 § 5.9 è l'attività più a rischio di essere sacrificata dalla deadline del 30 novembre 2026.
Va pianificata subito o dichiarata esplicitamente come non svolta nel fascicolo — non va lasciata
implicita.
