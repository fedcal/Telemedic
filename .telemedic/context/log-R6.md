# Log R6 - Dominio funzionale e di business

**Agente**: R6 · **Data**: 25 agosto 2026 · **Stato**: completato
**Output**: `/home/federicocalo/Scrivania/prj/Telemedic/.telemedic/research/R6-dominio-funzionale.md`

---

## 1. Output prodotto

Documento unico, in italiano, strutturato in 11 sezioni più elenco fonti. Contenuto quantificato:

| Artefatto | Identificativi | Numero |
|---|---|---|
| Glossario del dominio (IT / EN / FHIR R4 / definizione / utilizzatori / trappola semantica) | §1.1 … §1.6 | **105 termini** |
| Attori con obiettivi, attività, dati e vincoli di autorizzazione derivati | ATT-01 … ATT-19 | **19** |
| Permessi atomici RBAC + attributi e relazioni ABAC | PRM-IAM … PRM-INT | **132 permessi**, 8 tipi di relazione, 12 ruoli predefiniti |
| Regole di dominio verificabili con razionale e fonte | BR-001 … BR-096 | **88** |
| Requisiti funzionali con attore, MoSCoW, dipendenze e Gherkin | RF-001 … RF-223 | **195** (Must 133, Should 46, Could 15, Won't-now 1) |
| Requisiti non funzionali con metrica, soglia e metodo di verifica | RNF-001 … RNF-083 | **83** su 12 categorie |
| Contesti delimitati DDD con aggregati, VO, eventi, invarianti | BC-01 … BC-13 | **13** |
| Indicatori di prodotto | KPI-01 … KPI-18 | **18** |
| Diagrammi Mermaid | - | **10** (4 `stateDiagram-v2`, 5 `sequenceDiagram`, 1 `flowchart` context map) |

Processi modellati end-to-end: ciclo di vita della televisita (macchina a stati del contatto + macchina a stati della sessione media + sequence end-to-end), teleconsulto asincrono senza paziente, teleconsulto sincrono con paziente, fallimento tecnico e ripresa, emergenza clinica, paziente non identificabile, minore/incapace, terzi in sessione, cancellazione e riprogrammazione con finestre temporali.

Sezioni aggiuntive: percorsi utente e 14 punti di fallimento reali con requisiti di mitigazione, misurazione dei KPI senza violare la privacy, modello di sostenibilità e governance del progetto open source.

---

## 2. Decisioni di modellazione assunte (proposte di R6, contestabili)

| # | Decisione | Motivazione | Impatto se rigettata |
|---|---|---|---|
| **M1** | **`Encounter` e `MediaSession` sono due radici di aggregato distinte**, con due macchine a stati separate e sincronizzate solo per identificativo (BR-030). | La sessione media è volatile, il contatto è documentazione clinica. Una caduta di rete non deve alterare lo stato clinico. | Ogni disconnessione produrrebbe contatti fantasma e falsi no-show; è la decisione con il maggiore impatto architetturale. |
| **M2** | **RBAC per le capacità, ABAC per l'ambito**, con PDP a default *deny* e quattro condizioni congiuntive (permesso ∧ relazione di cura ∧ assenza di `deny` da `Consent` ∧ coincidenza di tenant). | Il ruolo «medico» non dice nulla su *quale* paziente. | Senza le relazioni ABAC servirebbero liste di controllo per risorsa, ingestibili in multi-tenant. |
| **M3** | **Separazione strutturale fra ruoli amministrativi e contenuto clinico** (BR-012): comporre un ruolo che li unisce è un errore di validazione, non una scelta di configurazione. | Il front-office e i due livelli di amministrazione sono gli attori più esposti agli errori di autorizzazione. | Il modello diventerebbe difendibile solo per disciplina operativa. |
| **M4** | **`CONSULT_SCOPE` effimero per il teleconsulto** (BR-014): il consulente vede solo il materiale allegato al quesito, per il tempo della risposta + 15 giorni. | Minimizzazione: il consulente non ha titolo sull'intero dossier. | Il teleconsulto diventerebbe una via di accesso generalizzata al dossier. |
| **M5** | **Quattro tipi di consenso indipendenti** (atto sanitario, dati, registrazione, terzi/trasmissione), ciascuno riferito a una versione immutabile di informativa (BR-060, BR-061). | Sono atti giuridicamente diversi con revocabilità ed effetti diversi. | Un unico flag di consenso rende indimostrabile qualunque manifestazione di volontà. |
| **M6** | **Tre concetti distinti dietro la parola «prestazione»**: `ServiceRequest` (richiesta), `Procedure`/`Encounter` (esecuzione), `ChargeItem` (addebito). | Errore di modellazione più frequente del dominio. | Modello con campi nulli e regole condizionali fragili. |
| **M7** | **BC-11 unico punto di frontiera con livello anticorruzione bidirezionale**; nessuna struttura di formato esterno entra nel nucleo. | Condizione per il multi-integratore (context pack §6.2.6) senza logica per singolo partner. | Ogni nuovo integratore inquinerebbe il dominio. |
| **M8** | **Il sistema non genera né interpreta contenuto clinico** (BR-004, BR-032, BR-040, RF-083, RF-126): trasporta, struttura, firma e conserva contenuto redatto dal professionista. Ogni requisito a rischio è marcato `⚠ V2`. | Vincolo V2 del context pack e Regola 11 MDR. | Cambierebbe l'intero percorso di conformità (D6). |
| **M9** | **`EX-TECH-PATIENT` è un esito distinto dal no-show** (BR-024): non si dichiara mancata presentazione se la telemetria registra un tentativo di connessione. | Addebitare un no-show a chi ha tentato senza riuscire è un danno ingiustificato e distorce KPI-03. | KPI di no-show inutilizzabili e contenziosi. |
| **M10** | **Soglie di qualità per tipo di prestazione, non globali** (BR-033), configurabili entro limiti codificati. | Dermatologia e colloquio psicologico hanno requisiti visivi incomparabili. | Soglia unica: o troppo permissiva o inutilizzabile. |
| **M11** | **Registrazione disabilitata per default a quattro livelli a cascata** e non abilitabile per prestazioni marcate non registrabili, nemmeno da un amministratore (BR-070, BR-075). | La registrazione è il dato più sensibile prodotto dal sistema. | Rischio privacy sproporzionato per una funzione opzionale. |
| **M12** | **Indirizzo di svolgimento chiesto e confermato a ogni sessione** (BR-039, RF-081), con pannello di emergenza a un comando (RF-082) che espone solo informazioni logistiche. | In emergenza il medico è a distanza e l'indirizzo anagrafico è inutile; il supporto logistico non è supporto decisionale clinico. | Scenario di rischio più alto dell'analisi ISO 14971 privo di mitigazione. |
| **M13** | **Conclusione del contatto e refertazione disaccoppiate**, con finestra di refertazione e sollecito (BR-042, RF-130). | Refertare col paziente collegato degrada la qualità del documento e allunga la coda. | Peggioramento clinico e organizzativo. |
| **M14** | **Nessun master patient index proprio** (RF-023, RF-026): identificazione per riferimento esterno, nessuna fusione automatica, nessuna correlabilità fra tenant. | Vincoli §6.2.3 e V4 del context pack. | Telemedic diventerebbe master data contro il modello di integrazione. |
| **M15** | **Soppressione sotto soglia con protezione dalla differenza** per tutta la reportistica (BR-090, RF-200, RF-201). | In una struttura piccola «una televisita di psichiatria quel giorno» identifica una persona. | Reidentificazione banale da aggregati. |
| **M16** | **Numerazione con lacune riservate per area** (RF arriva a 223 pur essendo 195; BR a 096 pur essendo 88). | Consente inserimenti senza rinumerare, requisito della matrice di tracciabilità IEC 62304. | Rinumerazioni distruttive della tracciabilità. |

---

## 3. Questioni aperte per gli altri agenti

### 3.1 Per **R3** (normativa italiana) - 11 questioni, marcate `[da confermare con R3]` nel documento

| # | Questione | Cosa si sblocca / cosa cambia |
|---|---|---|
| Q1 | Definizioni ufficiali vincolanti delle prestazioni di telemedicina ed elenco esaustivo | catalogo prestazioni RF-030; regole BR-001…BR-008 |
| Q2 | Condizioni esatte di ammissibilità della televisita rispetto a prima visita e presa in carico | BR-002, BR-003, RF-041: dove il sistema blocca vs richiede deroga |
| Q3 | Metodi di identificazione del paziente ammessi e loro gerarchia | RF-077, RF-080 |
| Q4 | Livello di firma richiesto per il referto e regole di conservazione del documento sanitario | BR-043, BR-044, BR-081, RF-127 |
| Q5 | Regole di alimentazione, consultazione e oscuramento del fascicolo sanitario | BR-064, RF-119, RF-120 |
| Q6 | Periodi minimi e massimi di conservazione per categoria di documento | BR-080, BR-081, RNF-039 |
| Q7 | Requisiti funzionali e livelli di servizio imposti alle piattaforme, e obblighi di collegamento a infrastrutture nazionali | RNF-017, RNF-018 e **possibile nuovo contesto delimitato di integrazione istituzionale** |
| Q8 | Regime di rendicontazione e tariffazione delle prestazioni in telemedicina | BR-005, BC-13 |
| Q9 | Rappresentanza legale e consenso per minori e soggetti incapaci (in particolare i poteri dell'amministratore di sostegno) | BR-062, BR-063, RF-117, RF-118 |
| Q10 | Categorie di dati sanitari a tutela rafforzata e conseguenze operative | BR-065, RF-135 |
| Q11 | Quadro dei fondi pubblici e degli obblighi per il riuso del software nella PA | §10.2 del documento |

### 3.2 Per **R2** (MDR e GDPR) - 7 questioni, marcate `[da confermare con R2]`

| # | Questione | Cosa cambia |
|---|---|---|
| Q12 | **Il perimetro `⚠ V2` è sufficiente?** Le regole BR-004, BR-032, BR-040 e i requisiti RF-083, RF-126 bastano a mantenere la classificazione attesa? | se no, cambia l'intero percorso di conformità (D6) |
| Q13 | Base giuridica del trattamento per l'erogazione e conseguente ruolo del consenso | BR-060, BC-06: cambia la semantica della revoca |
| Q14 | Ripartizione titolare/responsabile in SaaS multi-tenant e on-premise, e catena dei sub-responsabili (relay, gateway di notifica, conservazione) | §1.4, RF-187 |
| Q15 | Ammissibilità e limiti della registrazione; trattamento del frammento acquisito prima della revoca | BR-070…BR-076, RF-142 |
| Q16 | Regime del riconoscimento a vista e dei metodi alternativi rispetto ai dati biometrici | RF-080 |
| Q17 | Requisiti IEC 62366-1 per la valutazione sommativa e definizione degli errori d'uso a rischio | RNF-053, RNF-079 |
| Q18 | Strumenti giuridici necessari per il terzo in sessione (interprete, caregiver, discente) | BR-066, BR-067 |

### 3.3 Per l'agente di **architettura**

1. **M1 è vincolante**: `Encounter` e `MediaSession` come aggregati separati non è un dettaglio implementativo. Le loro macchine a stati sono in §3.1.1 e §3.1.2.
2. La **context map** (§8.3) definisce 13 contesti e le loro relazioni tipizzate. RNF-065 chiede la verifica automatica delle regole di dipendenza: le relazioni della mappa vanno tradotte in test di architettura.
3. **BC-11 è l'unico punto di frontiera**: nessun tipo proveniente da formati esterni può comparire nei contesti del nucleo.
4. Serve una risposta su **dove risiede il PDP** di autorizzazione (§2.2): servizio dedicato, libreria condivisa o filtro applicativo. La scelta condiziona la latenza di RNF-003 e la testabilità della decisione.
5. La proposta di mappatura degli stati di dominio su `Encounter.status` (§3.1.1) usa `onleave` per lo stato «sospeso»: è un riuso semanticamente accettabile ma va documentato nel profilo FHIR e validato con l'agente di interoperabilità.

### 3.4 Per l'agente di **sicurezza**

1. Il catalogo dei **132 permessi atomici** (§2.3) e le **8 relazioni ABAC** (§2.2) sono la base del modello delle minacce STRIDE.
2. `BREAK_GLASS` (BR-015, RF-019, RF-199) è un elemento di progettazione con coda di revisione del DPO: va incluso nel threat model come funzione legittima, non come anomalia.
3. RF-015 esclude strutturalmente l'impersonificazione: verificare che nessuna via indiretta (token di servizio, replay di contesto, sessione di assistenza RF-016) la reintroduca.
4. BR-017 impedisce che una chiave di integratore compromessa diventi accesso indiscriminato: richiede contesto utente delegante verificabile per ogni operazione clinica.

### 3.5 Per l'agente di **interoperabilità e integrazione**

1. Le risorse FHIR minime in ingresso e in uscita sono elencate in RF-210 e RF-211; i profili vanno pubblicati come *published language* versionato con periodo di deprecazione dichiarato (RF-209).
2. `Encounter.class = VR` (v3-ActCode) è la mappatura canonica del contatto virtuale; l'informazione di *setting clinico* va conservata a parte (§1.2, voce «Regime di erogazione»).
3. RF-215 (restituzione al sistema di origine) e BR-048 richiedono una **coda di riconciliazione visibile anche al front-office**: non è un dettaglio infrastrutturale ma un requisito funzionale.
4. Il modello di eventi (§8.4) elenca 11 eventi principali con i rispettivi consumatori: è il punto di partenza per il contratto dei webhook (RF-213, RF-214).

### 3.6 Per l'agente di **qualità e test**

1. Gli identificativi `RF-nnn`, `RNF-nnn`, `BR-nnn` sono **stabili e non rinumerabili**: sono la chiave di join della matrice di tracciabilità richiesta da IEC 62304 (RF-205, RNF-069).
2. Ogni RNF ha già un **metodo di verifica dichiarato**: va trasformato in un test o in una procedura documentata, non reinventato.
3. Requisiti che richiedono attrezzature di test particolari: RF-067/RNF-002 (dispositivi media simulati), RF-074/RNF-009 (interruzione controllata della rete), RNF-011 (sovraccarico), RNF-016 (resistenza 72 h), RNF-025 (guasto controllato del relay), RNF-046 (due lettori di schermo su due sistemi operativi).
4. RNF-052 e RNF-053 richiedono **prove di usabilità con partecipanti rappresentativi**, incluse persone anziane e con disabilità: vanno pianificate con anticipo perché non sono automatizzabili.

### 3.7 Per l'agente di **prodotto / roadmap**

La ripartizione MoSCoW (Must 133 su 195) riflette la **criticità di dominio**, non la fattibilità nelle ~14 settimane residue (D5). Occorre una riconciliazione esplicita. Punti di attenzione:

- I 133 Must includono l'intera catena minima di sicurezza clinica: prerequisiti tecnici, consenso, identificazione, sessione, refertazione firmata, restituzione al sistema di origine, audit. Tagliarne uno spezza la catena.
- I Should e i Could sono l'area di negoziazione naturale (46 + 15 requisiti).
- L'unico Won't-now (RF-097, lavagna condivisa) è già fuori scope.
- **Ordine di implementazione suggerito da R6**, guidato dal rischio di dominio anziché dalla facilità: (1) BC-01 + BC-02 (identità, tenant, isolamento - perché retrofittare il multi-tenant è impossibile); (2) BC-03 + BC-04 (riferimenti e agenda); (3) BC-06 (consenso, prima della sessione perché ne è precondizione bloccante); (4) BC-05 + BC-08 (contatto e media); (5) BC-09 (telemetria, contestualmente alla sessione perché ne è la prova); (6) BC-07 (documentazione clinica); (7) BC-11 (integrazione); (8) BC-12 trasversale fin dall'inizio, mai alla fine.

---

## 4. Rispetto dei vincoli del mandato

- **R0**: nessuna azienda, marchio, prodotto commerciale o dominio di potenziale partner è nominato. Si usano solo «gestionale sanitario cloud», «sistema EHR di terze parti», «integratore», «repository documentale esterno», «provider di identità digitale».
- **Verificabilità**: nessun requisito contiene qualità non misurabili; ogni RNF ha metrica, soglia, condizione di misura e metodo di verifica.
- **Identificatori stabili** con lacune riservate per area.
- **Fatti normativi**: mai inventati; separati in tre registri (`NORM` con fonte, `CTX` da context pack, `R6` come proposta) e marcati `[da confermare con R3]` / `[da confermare con R2]` dove serve.
- **Mermaid**: 10 diagrammi, sintassi verificata (dichiarazioni `state "..." as ID`, alias di partecipante, blocchi `alt`/`opt`/`loop` bilanciati, etichette di arco quotate).
- **Fonti**: elencate in coda al documento con URL.
