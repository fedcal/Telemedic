# Log agente B4 — Cybersecurity normativa (NIS2, ACN, L. 90/2024, CRA, AgID)

**Output**: `.telemedic/research/B4-cybersecurity-normativa.md` — 16 sezioni.
Contiene **58 requisiti verificabili numerati SEC-001…SEC-058**, la **matrice di sovrapposizione**
fra 9 fonti normative, e il piano operativo «Che cosa deve fare il progetto entro il 31 ottobre 2026».
Risponde alla **questione Q10** di R3.

## ESITO DELLA VERIFICA RICHIESTA — gli estremi delle determinazioni ACN

R3 li riportava da fonte secondaria. **Letti su fonte primaria (PDF firmati digitalmente, sito ACN).**

| Dato R3 | Esito |
|---|---|
| Det. ACN n. **379907/2025**, specifiche di base | ✅ **CONFERMATO**. Integrazione: la data è **19 dicembre 2025** (firma 18.12.2025, pubblicazione 24.12.2025) |
| Efficace dal **15 gennaio 2026** | ✅ **CONFERMATO** — art. 9, c. 3 |
| Sostituisce «una versione dell'aprile 2025» | ✅ **CONFERMATO e precisato** — art. 9, c. 1: sostituisce la **Det. ACN n. 164179 del 14 aprile 2025** |
| «da 37 a 43 misure» | ✅ **CONFERMATO su fonte ACN**: **37 misure / 87 requisiti** per i soggetti importanti (All. 1), **43 misure / 116 requisiti** per gli essenziali (All. 2) |
| Det. ACN n. **379887/2025**, Portale NIS, dal 31 dicembre 2025 | ⚠️ **NON verificato sul testo** — coerente con tutte le fonti secondarie; sostituisce la Det. 333017/2025 |
| Finestra di registrazione **1° gennaio – 28 febbraio** | ✅ confermata (art. 11 Det. 379887/2025) |
| «attuazione dimostrabile entro il 31 ottobre 2026» | ⚠️ **IMPRECISO come regola**. Vedi punto 1 sotto |

## FATTI CHE CAMBIANO LE DECISIONI DI PROGETTO

### 1. Il «31 ottobre 2026» non è scritto in nessun atto — ed esistono due determinazioni che R3 non poteva conoscere
La regola è **«18 mesi dalla ricezione della comunicazione di inserimento nell'elenco»** (art. 3,
c. 1, Det. 379907/2025). ACN ha iniziato a inviare le comunicazioni il **12 aprile 2025**: per la
prima ondata i 18 mesi maturano **entro il 31 ottobre 2026**. **Il termine è soggettivo: ogni cliente
ha la propria data.** Per la notifica degli incidenti il termine è **9 mesi** (→ metà gennaio 2026).

**Novità del 13 aprile 2026, successiva alla ricerca di R3:**
- **Det. ACN n. 127434 del 13 aprile 2026** (letta integralmente, applicabile dal 30 aprile 2026):
  per i soggetti inseriti per la prima volta nel **2026**, misure di sicurezza entro il **31 luglio
  2027** e obbligo di notifica dal **1° gennaio 2027**.
- **Det. ACN n. 127437 del 13 aprile 2026**: introduce l'**art. 18 sui «fornitori rilevanti»**
  (punto 2).

### 2. L'obbligo che tocca Telemedic più da vicino: l'elenco dei fornitori rilevanti — CRITICO
L'**art. 18 della Det. ACN 127437/2026** obbliga ogni soggetto NIS a **dichiarare nominativamente ad
ACN**, fra il **15 aprile e il 31 maggio** di ogni anno, i propri fornitori rilevanti, con cinque
dati: ragione sociale, codice fiscale, **Paese della sede legale**, **codici CPV**, criterio di
rilevanza. Prima scadenza: **31 maggio 2026** (già trascorsa).

Un fornitore è rilevante se (A) la fornitura è riconducibile all'Allegato I, punti 8 e 9 del decreto
NIS (infrastrutture digitali; servizi TIC gestiti B2B) **oppure** (B) è **non fungibile**.
**Telemedic in SaaS ricade sotto entrambi i criteri; on-premise ricade comunque sotto B** (supporto e
manutenzione non fungibili).

Tre conseguenze immediate:
- **la sovranità del dato (V1) smette di essere marketing e diventa un campo obbligatorio della
  dichiarazione del cliente ad ACN**;
- il progetto deve **pubblicare i propri codici CPV e il Paese della sede legale** in forma
  riutilizzabile (SEC-007), o ogni cliente li ricostruirà in modo diverso;
- ogni dipendenza *runtime* di Telemedic (TURN gestito, push, CDN, firma remota) diventa fornitore
  rilevante di secondo livello per il cliente: **V1 riduce la superficie dichiarativa del cliente**.

### 3. ACN riconosce esplicitamente il conflitto MDR/NIS2 — e ci lascia una porta
La *Guida alla lettura* ACN, § 2.3.3, illustra la clausola «fatte salve motivate e documentate
ragioni normative o tecniche» proprio con il caso dei dispositivi medici: l'installazione di sistemi
di protezione degli *endpoint* (misura `DE.CM-09`) «ne potrebbe invalidare la certificazione».
La deroga è ammessa ma richiede **misure compensative documentate nel piano di trattamento del
rischio**. → **Telemedic deve fornire una dichiarazione tecnica di deroga** (SEC-010) che il cliente
possa allegare. Senza, il cliente non può chiudere la misura.

### 4. Il Cyber Resilience Act NON si applica a Telemedic marcato CE — ma si applica ai suoi pezzi
**Art. 2, par. 2 del Reg. (UE) 2024/2847: il CRA non si applica ai prodotti cui si applica l'MDR
2017/745.** La decisione D6 (marcatura CE Classe I) **esclude** il prodotto dal CRA.
**Ma l'esclusione è per prodotto, non per progetto.** SDK Java, SDK TypeScript, Web Component
white-label, chart Helm e immagini container **non coperti dalla marcatura CE** possono ricadere nel
CRA dall'11 dicembre 2027, se immessi sul mercato nel corso di un'attività commerciale.
**Serve un ADR: tabella artefatto → regime applicabile** (SEC-006).

Date CRA: entrata in vigore **10 dicembre 2024**; Capo IV dall'**11 giugno 2026**; **art. 14
(segnalazione vulnerabilità sfruttate e incidenti gravi: 24 h / 72 h / 14 gg) dall'11 settembre
2026**; il resto dall'**11 dicembre 2027**.

### 5. Regime open source: oggi nessun obbligo, ma tre soglie lo attivano
Il CRA non esenta «l'open source» ma **ciò che non è immesso sul mercato nel corso di un'attività
commerciale**. Costituiscono attività commerciale: prezzo del prodotto, **prezzo per il supporto
tecnico**, piattaforma con cui si monetizzano altri servizi, uso di dati personali per fini diversi
dal miglioramento di sicurezza/compatibilità/interoperabilità. Le **donazioni non eccedenti i costi**
no.
- L'*open-source software steward* (art. 3, punto 14) è **una persona giuridica**: il titolare
  attuale, persona fisica, **non può esserlo**. Obblighi dello steward (art. 24): politica di
  cibersicurezza documentata, cooperazione con le autorità, art. 14 nei limiti dello sviluppo.
  **Nessuna sanzione, nessuna marcatura CE.**
- **Chi monetizza diventa fabbricante**; **chi integra Telemedic in un prodotto commerciale è
  fabbricante del prodotto risultante**. **Apache-2.0 non trasferisce obblighi regolatori** — va
  scritto esplicitamente nella documentazione, perché è la prima domanda dell'integratore.

### 6. L'audit log immutabile NON è Hibernate Envers — decisione architetturale da prendere subito
Envers **versiona**, non rende immutabile: le tabelle `_aud` sono modificabili da chiunque abbia
privilegi sulla base dati. Il vincolo **V5**, il requisito **R30** delle linee guida AgID sul
procurement («log non cancellabile con il reset»), l'ABSC 3.5.1 e la misura `PR.PS-04` richiedono
catena di *hash*, conservazione separata e verifica indipendente. **È il singolo elemento di maggior
sforzo dell'intero catalogo** (SEC-033÷036). → **ADR necessario (QB4-6)**.

### 7. La disponibilità del servizio diventa un fatto giuridico: la tassonomia IS-1…IS-4
Gli incidenti significativi di base sono **3 per gli importanti** (IS-1 riservatezza, IS-2 integrità,
IS-3 violazione dei livelli di servizio) e **4 per gli essenziali** (+ IS-4 accesso non autorizzato o
**abuso dei privilegi concessi**).
- **IS-3 dipende dai «livelli di servizio attesi» definiti dal soggetto ai sensi di `DE.CM-01`, che
  ACN distingue nettamente dagli SLA contrattuali.** Esempio ufficiale ACN: con SL al 99% giornaliero,
  **un'indisponibilità di 14 minuti e 24 secondi è un incidente notificabile**. → serve una metrica
  di **disponibilità per tenant e per servizio**, distinta dalle metriche di qualità della sessione
  già previste su TimescaleDB (SEC-037).
- **IS-4 è, letteralmente, l'accesso indebito alla cartella clinica da parte di personale
  autorizzato** — il caso più frequente nei provvedimenti del Garante. Richiede «parametri
  quali-quantitativi» (es. soglia di interrogazioni per utente; accesso di un amministratore fuori
  orario). → l'audit log deve essere **interrogabile per soglie e pattern**, non solo consultabile
  (SEC-020, SEC-031).
- Il ***dies a quo* delle 24 ore è l'acquisizione dell'evidenza**, non l'occorrenza dell'incidente.
  Rilevare prima non allunga il termine: riduce il ritardo.

### 8. L'Appendice A delle linee guida AgID sul procurement È il capitolato che Telemedic troverà davanti
Il DM 21 settembre 2022 rende obbligatorie per le IRT le azioni **AP2, AP3, AP4** e il **cap. 5**.
AgID **raccomanda alle amministrazioni di attingere dall'Appendice A** anziché scrivere requisiti
*ex novo*. I 45 requisiti R1–R45 sono quindi il testo che finirà nei capitolati. I più pesanti:
- **R2/R3**: **ISO/IEC 27001** mantenuta per tutta la durata della fornitura, o in alternativa SGSI +
  piano di qualità ISO 10005;
- **R4/R5**: **audit annuale di terza parte a spese del fornitore**, più audit su preavviso di 20 gg;
- **R14**: il fornitore **si fa carico delle bonifiche** dei sistemi del committente compromessi;
- **R15**: repliche dei dati **sempre nel territorio UE**;
- **R19**: aggiornamento tecnologico **senza oneri aggiuntivi** in corso di contratto;
- **R42/R43/R44**: notifica immediata dell'incidente; *report* **entro il giorno successivo** con
  «la **sequenza temporale degli eventi**»; **log in CSV o TXT entro il giorno successivo alla
  richiesta**. → sono la specifica funzionale di SEC-035, SEC-036, SEC-039.

Ulteriore effetto di **AP2**: per le acquisizioni di **alta criticità** — e un sistema di
telemedicina lo è per definizione (il DM lo qualifica *ex ante* «fornitura critica per la PA») —
l'amministrazione deve **scartare gli accordi quadro** privi di requisiti adeguati. Si va a **gara
dedicata con capitolato specifico**.
Effetto di **AP4**: i requisiti vanno scritti «in maniera chiara, oggettiva e quanto più possibile
*chiusa*». → la documentazione di conformità va strutturata come **matrice requisito → evidenza**,
non come prosa. **Stesso formato della tracciabilità requisiti↔test di IEC 62304 (D10): un unico
artefatto serve entrambi.**

### 9. Il cap. 5 delle linee guida AgID vieta i DPA standard non negoziabili
Testo verificato: il capitolato deve individuare le misure ex art. 32 GDPR e la ripartizione delle
responsabilità, **«evitando, in particolare, la previsione di sproporzionati esoneri di
responsabilità specialmente in caso di contratti standard con margini di negoziazione pressoché nulli
in capo al titolare»**. Il quadro **si applica espressamente anche al SaaS, PaaS e IaaS**.
→ **il DPA di Telemedic deve essere negoziabile nelle clausole di responsabilità** (SEC-005).

### 10. La lettera l) dell'art. 24, c. 2 nomina espressamente le «comunicazioni vocali, video e testuali protette»
È attuata dalle misure `PR.AA-03`, `PR.DS-02` e `PR.IR-03` (quest'ultima **solo per i soggetti
essenziali**). **Telemedic è il mezzo con cui un soggetto NIS sanitario attua quella misura.** È il
punto in cui la proposta di valore del progetto si aggancia più direttamente a un obbligo di legge.

### 11. Il modello di erogazione decide se Telemedic diventa soggetto NIS in proprio
Un operatore SaaS multi-tenant che supera le soglie della media impresa (≥ 50 addetti *oppure*
fatturato/bilancio > 10 M€) **è soggetto NIS come fornitore di servizi cloud** (Allegato I, punto 8)
o di servizi TIC gestiti B2B (punto 9). **La decisione D8 (doppio modello SaaS + on-premise) va
accompagnata da una valutazione esplicita di questo effetto.** L'on-premise lascia l'obbligo
interamente al deployer.
Lo stesso vale per l'**integratore archetipo**: un gestionale sanitario cloud con «alcune migliaia di
professionisti attivi» supera quasi certamente le soglie ed è soggetto NIS come cloud provider.

### 12. Non esiste alcuna «certificazione NIS»: la dimostrabilità è documentale
Nessun modello di attestazione ACN. Servono **elenchi, inventari, piani, politiche, procedure,
registri**; **11 documenti devono essere approvati dagli organi di amministrazione e direttivi**
(art. 23 d.lgs. 138/2024). Due di quegli 11 **non sono redigibili senza il fornitore**: l'inventario
dei servizi erogati dai fornitori e il piano di gestione delle vulnerabilità.
→ il *deliverable* naturale è un **fascicolo di conformità NIS pre-compilato** (SEC-001) e una
**matrice RACI delle 43 misure** (SEC-002).

### 13. La finestra contrattuale si apre esattamente quando esce la v1.0
FAQ ACN: i soggetti **non devono rinegoziare i contratti in essere**, ma devono inserire i requisiti
di sicurezza «**nei contratti nuovi, rinnovati o prorogati a partire dal termine per l'adozione delle
misure**». Il termine della prima ondata è il **31 ottobre 2026**; la v1.0 esce il **30 novembre
2026**. **Il tempismo è ottimale se la documentazione è pronta, pessimo se non lo è.**

## I 7 CONTROLLI A MASSIMO RENDIMENTO (ognuno soddisfa ≥ 5 fonti)
1. SBOM CycloneDX firmata + VEX
2. Log append-only con catena di *hash*, retention 24 mesi, *export* CSV/JSON firmato
3. MFA + federazione OIDC/SAML2 con SPID, CIE e **TS-CNS**
4. Cifratura E2E del media (DTLS-SRTP) + TLS sulla segnalazione
5. SDLC documentato: STRIDE, SAST/DAST/SCA in CI, *disclosure* coordinata
6. Misurazione della disponibilità per tenant e per servizio, con soglie e allarmi
7. *Baseline* di *hardening*, immagini firmate, sicurezza per impostazione predefinita

## PRIORITÀ 1 — deve esistere prima della v1.0, altrimenti il prodotto non è vendibile a un soggetto NIS
SBOM CycloneDX in CI · `SECURITY.md` con *disclosure* coordinata · **audit log immutabile con
*export* firmato (sforzo alto)** · matrice RACI delle 43 misure · fascicolo di conformità NIS
(flussi di rete con i 5 attributi, sistemi accessibili da remoto, configurazioni di riferimento) ·
MFA obbligatoria per le utenze amministrative + SPID/CIE/TS-CNS · misurazione della disponibilità.

## 9 QUESTIONI APERTE (QB4-1…QB4-9)
Leggere riga per riga gli **allegati 1 e 2 in `.xlsx`** (43 misure, 116 requisiti) prima di citarne
il contenuto puntuale in documentazione pubblica · verificare sul testo le Det. **379887/2025** e
**127437/2026** · verificare l'**armonizzazione di EN IEC 81001-5-1:2022** in GUUE (agente MDR) ·
acquisire le **Linee guida ACN sul processo di gestione degli incidenti** (31 dic. 2025) · verificare
**DPCM 30 aprile 2025** e **2 ottobre 2025** in GU · **ADR sull'audit log immutabile** · valutare
l'effetto NIS della decisione D8 · selezionare i **codici CPV** con un consulente di appalti ·
definire i **livelli di servizio attesi (SL)** ex `DE.CM-01`, distinti dagli SLA della Tab. 3 del
DM 21 settembre 2022.

## LIMITI DICHIARATI
Gli **allegati tecnici 1–4 della Det. 379907/2025** (le specifiche di base vere e proprie) **non sono
stati letti**: il contenuto è ricostruito dalla *Guida alla lettura* ufficiale ACN v. 2.1 (aprile
2026), letta integralmente, che ne riporta struttura, conteggi, codici e tre misure per esteso. Il
catalogo delle 43 misure per elemento dell'art. 24, c. 2 è ricostruito dall'**Appendice A** di quel
documento ed è **aritmeticamente coerente** (27 comuni + 10 con requisiti aggiuntivi per gli
essenziali + 6 solo essenziali = 43; 43 − 6 = 37). Reperibili in PDF e `.xlsx` su
`acn.gov.it/portale/nis/modalita-specifiche-base`.
Le Det. **379887/2025**, **127437/2026** e i **DPCM 30 aprile / 2 ottobre 2025** non sono stati letti
sul testo: marcati **[NON VERIFICATO]** nel documento.

**Nessun dato marcato [NON VERIFICATO] va pubblicato senza lettura su fonte primaria.**
Il documento si chiude con il disclaimer: analisi tecnica di conformità, non consulenza legale.
