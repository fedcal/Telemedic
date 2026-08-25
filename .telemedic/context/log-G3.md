# Log G3 — Modulo 11 «Fondamenti informatici»

**Agente**: G3
**Mandato**: decisione `D35`, blocco D della guida dei fondamenti.
**Deliverable**: `docs/10_fondamenti/11-fondamenti-informatici.md`
**Data**: 25 agosto 2026
**Stato**: completato.

---

## 1. Conteggio e struttura

| Grandezza | Valore |
|---|---|
| Righe totali del file | 3.075 |
| Righe non vuote | 2.418 |
| **Parole (stima)** | **≈ 26.000** |
| Requisito di mandato | ≥ 9.000 parole — **soddisfatto con ampio margine** |
| Sezioni di primo livello | 14 tematiche + «Cosa devi ricordare» + «Termini introdotti» + «Dove continuare» |
| Diagrammi Mermaid | 4 (saga di chiusura con compensazione; outbox transazionale; mappa dei contesti ridotta; piramide dei test) |
| Blocchi di codice con linguaggio dichiarato | 8 (`sql` ×3, `java` ×2, `http`, `json`, testo per formule) |
| Tabelle | 27 |
| Marcature `[NV]` | 14 (elenco al §3) |

> **Nota sul conteggio.** Gli strumenti disponibili nella sessione non permettono un conteggio
> esatto delle parole (il `Grep` in modalità `count` restituisce righe con corrispondenza, non
> occorrenze totali; non è disponibile la shell). Il valore è una stima da righe non vuote per
> lunghezza media di riga. **Da verificare con `wc -w` alla prima occasione utile.**

### Mappa delle sezioni

| § | Titolo | Riga |
|---|---|---|
| 1 | Perché la telemedicina è un sistema distribuito | 36 |
| 2 | Consistenza e disponibilità | 182 |
| 3 | Transazioni | 291 |
| 4 | Architettura a eventi | 543 |
| 5 | La doppia scrittura e l'outbox transazionale | 711 |
| 6 | Consegna e idempotenza | 905 |
| 7 | Domain-Driven Design | 1190 |
| 8 | Modellazione del tempo e dei dati | 1492 |
| 9 | Multi-tenancy | 1738 |
| 10 | API e contratti | 1869 |
| 11 | Prestazioni e capacità | 2110 |
| 12 | Osservabilità | 2341 |
| 13 | Affidabilità | 2522 |
| 14 | Qualità del software | 2689 |
| — | Cosa devi ricordare (17 punti) | 2942 |
| — | Termini introdotti in questo modulo (62 voci) | 2996 |
| — | Dove continuare | 3064 |

Tutti e quattordici i punti del mandato sono coperti, uno per sezione, nello stesso ordine
richiesto.

---

## 2. Ancoraggio al dominio e alle fonti di progetto

Ogni concetto teorico è ancorato a un esempio di questo dominio. Nessun esempio da manuale
(carrello, bonifico) è stato usato. Ancoraggi principali:

| Concetto | Esempio del dominio |
|---|---|
| Guasto parziale | I sei effetti di «concludi e firma» su componenti diversi |
| Ordine non garantito | `SessioneAvviata` dopo `ContattoConcluso` → contatto aperto per sempre |
| Consistenza forte vs finale | Tabella di 11 categorie di dato con criterio «cancelli e prove contro derivati» |
| Scrittura obliqua | Overbooking involontario su slot con capienza 1 (`BR-020`, `BR-023`) |
| Transazione distribuita | Repository documentale, fornitore di identità, servizio di firma non transazionabili |
| Saga e compensazione | Referto trasmesso al fascicolo: rettifica, non annullamento (`RefertoRettificato`, `BR-044`) |
| Comando vs evento | `InviaNotificaAlPaziente` contro `ContattoConcluso` |
| Partizionamento | Chiave = identificativo di `Encounter`; errore di partizionare per tenant |
| Doppia scrittura | Firma del referto: evento perso contro evento fantasma, con codice del difetto |
| Idempotenza | Tabella di 8 operazioni del dominio classificate; contatore sessioni contro fatti |
| Effetti non idempotenti | Messaggio al paziente, deposito nel fascicolo, costo per accesso all'identità (`D38`) |
| Paratie | Rapporto di rendicontazione che esaurisce il pool e blocca l'ingresso in sala d'attesa |
| Timeout | Gerarchia numerica sul percorso «paziente entra in lobby», budget 3 s |
| Aggregati distinti | `Encounter` vs `MediaSession`: sei conseguenze dell'unione, tutte reali |
| Bitemporale | Misura di telemonitoraggio delle 8:00 trasmessa alle 14:30; revoca retroattiva del consenso |
| Fusi e ora legale | Slot ricorrenti alle 02:30 nelle due domeniche di cambio |
| Orologi | Finestra di 300 s sulla verifica delle firme dei webhook (`R5` §4.3.1) |
| Multi-tenancy | Paziente non globale (`RF-023`); appuntamento con branca = dato sulla salute |
| Paginazione | Interazione con l'oscuramento (`BR-064`): i totali si calcolano sull'insieme filtrato |
| Percentili | Dieci chiamate a p99 500 ms → p90 di schermata |
| Legge di Little | Dimensionamento pool, connessioni, e attesa dei pazienti in agenda |
| Bilancio di latenza | Scomposizione di `RNF-001` con relay, cuscinetto anti-jitter, propagazione |
| Osservabilità | Elenco chiuso di ciò che non può comparire nei registri (`RNF-075`, `RNF-038`) |
| Affidabilità | RPO zero per i documenti firmati (`RNF-022`) → replica sincrona |
| Ripristino provato | Sette modi banali in cui una copia risulta inutile |
| Tracciabilità | Catena `BR-071 → RF-139 → invariante → codice → 3 test → misura ISO 14971` |

### Decisioni e vincoli citati

`D8`, `D10`, `D13`, `D15`, `D19`, `D22`, `D24`, `D25`, `D35`, `D38`, `D42`, `D45`;
vincoli `V1`, `V2`, `V3`, `V4`, `V5`, `V6`.

### Requisiti di `R6` citati

`RF-114`, `RF-165`, `RF-188`, `RF-196`, `RF-205`, `RF-023`; `BR-020`, `BR-023`, `BR-030`,
`BR-032`, `BR-034`, `BR-044`, `BR-060`, `BR-061`, `BR-064`, `BR-071`, `BR-090`, `BR-094`;
`RNF-001…011`, `RNF-013`, `RNF-014`, `RNF-016`, `RNF-021`, `RNF-022`, `RNF-025`, `RNF-027`,
`RNF-037`, `RNF-038`, `RNF-042`, `RNF-043`, `RNF-044…047`, `RNF-054`, `RNF-057`, `RNF-059`,
`RNF-063…065`, `RNF-069`, `RNF-070…076`, `RNF-078`, `RNF-083`. Contesti `BC-05…BC-13`.

### Riservatezza (R0)

Verificato: **nessun nome di azienda, prodotto commerciale, marchio o dominio di potenziali
partner**. Si usano soltanto le formule «l'integratore», «gestionale sanitario di terze parti»,
«sistema EHR di terze parti», «repository documentale nazionale o regionale», «fornitore di
identità digitale». Le uniche tecnologie nominate sono dipendenze dichiarate nel brief
(PostgreSQL, Apache Kafka, TimescaleDB, Docker Compose) e non sono partner commerciali. Tutti i
dati negli esempi sono sintetici (`tenant-demo`, `enc-77213`, `ext:pz-000117`, `apt-0000931`,
`obs-sintetico-0001`, `doc-8842`).

---

## 3. Punti `[NV]` — da verificare prima di trasformarli in requisito o in codice

### 3.1 Attribuzioni bibliografiche (basso rischio, alta visibilità)

| # | § | Riga | Affermazione da verificare | Chi dovrebbe chiuderla |
|---|---|---|---|---|
| NV-01 | 1.2 | 83 | Paternità e data delle «otto fallacie del calcolo distribuito» (Peter Deutsch, Sun Microsystems, fine anni Novanta; ottava aggiunta da James Gosling) | agente bibliografia / modulo 20 |
| NV-02 | 2.2 | 222 | Teorema CAP: congettura di Eric Brewer (2000), dimostrazione di Gilbert e Lynch (2002) | agente bibliografia / modulo 20 |
| NV-03 | 2.2 | 243 | PACELC: formulazione di Daniel Abadi | agente bibliografia / modulo 20 |
| NV-04 | 3.4 | 440 | Saga: Garcia-Molina e Salem, 1987 — riferimento bibliografico esatto | agente bibliografia / modulo 20 |
| NV-05 | 7 | 1193 | Domain-Driven Design: Eric Evans, 2003 — riferimento esatto | agente bibliografia / modulo 20 |
| NV-06 | 8.6 | 1707 | Contatore di Lamport: Leslie Lamport, 1978 — riferimento esatto | agente bibliografia / modulo 20 |
| NV-07 | 11.3 | 2193 | Legge di Little: John Little, 1961 — riferimento esatto | agente bibliografia / modulo 20 |

> Il modulo [20 — Fonti primarie](../../docs/10_fondamenti/20-fonti-primarie.md) prescrive
> «sole fonti primarie»: questi sette riferimenti vanno risolti su articolo o libro originale,
> non su enciclopedie o sintesi.

### 3.2 Comportamenti tecnici da verificare sulla versione adottata (rischio operativo)

| # | § | Riga | Cosa verificare | Impatto se sbagliato |
|---|---|---|---|---|
| NV-08 | 3.2 | 359 | Comportamento di `repeatable read` in PostgreSQL (snapshot isolation): esclude i fantasmi ma ammette la scrittura obliqua — sulla versione effettivamente adottata | Un requisito di isolamento scritto sull'assunzione sbagliata lascia aperto l'overbooking |
| NV-09 | 4.4 | 654 | Comportamento del riassegnamento delle partizioni Kafka in caso di **aumento** del numero di partizioni: la funzione di assegnazione cambia e può spezzare l'ordine per aggregato | Un ridimensionamento in esercizio produrrebbe eventi fuori ordine su contatti attivi |
| NV-10 | 6.1 | 938 | Limiti reali della garanzia «exactly-once» di Kafka nell'assetto **KRaft a nodo singolo** previsto da `D15` | Affidarsi a una garanzia non disponibile nell'assetto on-premise |
| NV-11 | 8.5 | 1671 | Comportamento della libreria di date adottata sugli istanti inesistenti e doppi al cambio di ora legale (02:30 delle due domeniche) | Slot di agenda inesistenti o doppi due volte l'anno |
| NV-12 | 11.2 | 2168 | Comportamento degli strumenti di prova di carico adottati rispetto all'**omissione coordinata** | Tutte le misure di percentile delle prove di carico risulterebbero ottimistiche |

### 3.3 Decisioni di progetto non ancora approvate (richiedono un ADR)

| # | § | Riga | Questione aperta | Proposta contenuta nel modulo |
|---|---|---|---|---|
| NV-13 | 3.4 | 455 | **Meccanismo di orchestrazione delle saghe**: motore di workflow dedicato, macchina a stati persistita in tabella, o componente applicativo | Il modulo dichiara l'adozione dell'**orchestrazione** (non coreografia) per i flussi clinici critici, ma non il meccanismo |
| NV-14 | 5.3 | 843 | **Modalità del relay dell'outbox**: interrogazione periodica contro cattura delle modifiche dal registro di replica | Il modulo propone interrogazione periodica come predefinita (peso operativo on-premise) e cattura delle modifiche come opzione ad alto volume |

---

## 4. Questioni per gli altri agenti

### 4.1 Per l'agente di architettura

| ID | Questione | Motivazione |
|---|---|---|
| Q-G3-01 | **Serve un ADR sull'orchestrazione delle saghe** (NV-13). Il modulo 11 ha già insegnato al lettore che i flussi clinici critici sono orchestrati e non coreografati: se l'architettura decidesse diversamente, la guida andrebbe corretta | `RNF-068` richiede un registro per ogni decisione architetturale rilevante |
| Q-G3-02 | **Serve un ADR sulla modalità del relay dell'outbox** (NV-14), con la conseguenza sull'inventario SOUP: la cattura delle modifiche introduce un componente di terze parti da censire ai sensi di `D45` | `D45` impone l'inventario SOUP dalla prima pipeline |
| Q-G3-03 | **RPO = 0 per i documenti firmati (`RNF-022`) implica replica sincrona per quella categoria di dati.** Il modulo lo afferma come conseguenza logica. Va confermato che l'architettura di persistenza lo preveda, e va documentato il costo in latenza di scrittura sulla firma | Requisito già approvato in `R6`; la conseguenza architetturale non è ancora esplicitata altrove |
| Q-G3-04 | **Modello di isolamento: RLS o schema per tenant?** `D8` ammette entrambi. Il modulo espone la tabella comparativa senza scegliere, ma segnala che il **ripristino selettivo di un singolo tenant** è difficile con righe condivise e che `RNF-059` vieta passaggi manuali per creare un tenant. La scelta va fatta prima del primo schema | La multi-tenancy non è retrofittabile (§9.3) |
| Q-G3-05 | **Il segnalamento WebRTC non deve passare dall'outbox.** Il modulo lo dichiara esplicitamente (§5.4) per non introdurre la latenza del relay in un percorso vincolato da `RNF-005` (p95 < 150 ms). Va reso vincolo esplicito nell'architettura, non lasciato all'implementazione | Rischio reale: la tentazione di far passare tutto dal broker |
| Q-G3-06 | **Interruttori automatici e quote sono per tenant e per endpoint, mai globali** (§6.6). Corollario di `V4` applicato alla capacità. Da verificare che l'architettura del dispatcher lo preveda | Isolamento del rumore fra tenant |

### 4.2 Per l'agente di sicurezza / conformità

| ID | Questione | Motivazione |
|---|---|---|
| Q-G3-07 | **La sicurezza a livello di riga richiede `FORCE ROW LEVEL SECURITY` e un utente applicativo privo dell'attributo di superamento delle politiche.** Il modulo lo scrive (§9.2). Va aggiunto al catalogo delle verifiche di configurazione bloccanti | Senza, RLS è disattivata di fatto |
| Q-G3-08 | **Reset della variabile di sessione del tenant alla restituzione della connessione al pool: serve un test dedicato.** Il modulo lo qualifica come da provare, non da assumere (§9.2, §14.2) | Una connessione con tenant residuo è una fuga di dati fra titolari autonomi |
| Q-G3-09 | **`D42` è ripreso nel modulo (§8.2): il versionamento automatico delle entità versiona ma non rende immutabile.** Va verificato che nessun documento della guida o della documentazione pubblica presenti il versionamento delle entità come «audit immutabile» | Rischio di claim non sostenibile su `V5` |
| Q-G3-10 | **Elenco chiuso di ciò che non può comparire nei registri (§12.4).** Comprende il riferimento di autorizzazione del canale di messaggi con l'ospitante e l'identificativo esterno del paziente. Va allineato con il catalogo di rilevamento automatico di `RNF-038` | La verifica automatica ha bisogno di un elenco, non di un principio |
| Q-G3-11 | **Il modulo afferma che la collocazione delle copie di sicurezza ricade sotto `V1`/`D24`.** Va confermato e riportato nel materiale sui profili di distribuzione | Una copia fuori perimetro è meno visibile di una dipendenza di esercizio |

### 4.3 Per l'agente che redige gli altri moduli della guida

| ID | Questione | Modulo interessato |
|---|---|---|
| Q-G3-12 | Il modulo 11 rinvia a **12, 13, 14, 16, 19**. I collegamenti sono già scritti come relativi: verificare che i nomi di file coincidano con quelli dell'indice del modulo 00 | 12, 13, 14, 16, 19 |
| Q-G3-13 | **Il ripiego telefonico non è la stessa prestazione** (`BR-034`): il modulo 11 lo cita in §13.2 ma la trattazione sostanziale spetta ai moduli 02 e 14. Evitare duplicazione divergente | 02, 14 |
| Q-G3-14 | **`Encounter` contro `MediaSession`**: il modulo 11 ne fa il caso didattico centrale del DDD (§7.5). Il modulo 16 dovrà riprenderlo come fatto architetturale, non rispiegarlo | 16 |
| Q-G3-15 | **La distinzione fra registro di diagnostica e registro degli accessi** (§12.4) va ripresa nel modulo 12 sul versante delle misure (catena di impronte, conservazione separata) | 12 |
| Q-G3-16 | Il modulo 11 usa `[NV]` come marcatore; il modulo 06 usa `[V]` per l'affermazione verificata. **Le due convenzioni coesistono ma non sono dichiarate nel modulo 00.** Proposta: dichiararle una volta nel modulo 00 e rimuovere le note locali | 00, tutti |

### 4.4 Per l'agente qualità e test

| ID | Questione |
|---|---|
| Q-G3-17 | Il modulo elenca test di integrazione **obbligatori per costruzione** che non emergono da un catalogo di requisiti funzionali: atomicità di dato e outbox nella stessa transazione; isolamento effettivo delle politiche RLS; assenza di tenant residuo nella connessione restituita al pool; reversibilità delle migrazioni. Vanno inseriti nel piano di verifica |
| Q-G3-18 | **Omissione coordinata** (NV-12): il piano delle prove di carico deve dichiarare come lo strumento adottato la evita, altrimenti i percentili di `RNF-001…011` non sono verificati |
| Q-G3-19 | Il generatore di dati sintetici deve coprire i casi limite elencati in §14.5 (minori con esercente la responsabilità genitoriale, assenza di codice fiscale, amministrazione di sostegno con poteri delimitati, omonimie, identificativi esterni collidenti, nomi lunghi e caratteri non latini). Non è un requisito già presente in `R6` in questa forma |
| Q-G3-20 | **Tolleranza zero per i test intermittenti** con termine dichiarato di correzione o rimozione: proposta del modulo (§14.4), da recepire in `CONTRIBUTING.md` |

---

## 5. Termini per il glossario (modulo 19)

62 voci, già presenti nel modulo 11 nella tabella «Termini introdotti in questo modulo» con
definizione operativa e traducente inglese. Elenco per il consolidamento nel glossario
bilingue:

Aggregato · Almeno una volta · Al più una volta · Attesa esponenziale · Bitemporale · Cattura
delle modifiche · Chiave di idempotenza · Chiave di partizionamento · Commit a due fasi ·
Compensazione · Consistenza finale · Consistenza forte · Contesto delimitato · Contropressione
· Correlazione · Doppia scrittura · Entità · Esattamente una volta · Evento di dominio ·
Fallacie del calcolo distribuito · Gruppo di consumatori · Guasto parziale · Idempotenza ·
Interruttore automatico · Invariante · Jitter · Latenza · Legge di Little · Linguaggio ubiquo ·
Livello anticorruzione · Livello di isolamento · Log degli eventi · Mappa dei contesti ·
Modalità di guasto · Oggetto valore · Omissione coordinata · Orologio logico · Osservabilità ·
Outbox transazionale · PACELC · Paginazione per cursore · Paratia · Percentile · Prova a
contratto · Punto di ripristino · Radice di aggregato · Relay dell'outbox · Ripiego · Ritardo
del consumatore · Saga · Scrittura obliqua · Serie temporale · Sicurezza a livello di riga ·
Tempo di ripristino · Tempo di sistema · Tempo di validità · Tenant · Timeout · Traccia ·
Tracciabilità · Versionamento.

### Termini già presenti in `R6` §1 che il modulo 11 riusa senza ridefinire

`Encounter`/Contatto, Sessione, Tenant, Integratore, Referto, Consenso (nelle sue tre
accezioni), Oscuramento, Informativa, Conservazione a norma, Fallback telefonico, Qualità
dell'esperienza. **Il glossario deve evitare due voci divergenti per «Tenant»**: la definizione
del modulo 11 (§9.1) è coerente con quella di `R6` §1.5 e con `V4`, ma va unificata.

### Collisioni terminologiche da presidiare nel glossario

| Termine | Accezione informatica (modulo 11) | Accezione di dominio | Disambiguazione proposta |
|---|---|---|---|
| **Log** | Sequenza ordinata immutabile di record (§4.3) | File di diagnostica (§12.2) | «Log degli eventi» contro «registro di diagnostica» |
| **Sessione** | Sessione media, connessione tecnica | Atto clinico; unità rendicontabile | Già trattata in `R6` §8.1 come frattura di linguaggio; il modulo 11 la riprende in §7.2 |
| **Consistenza** | Tre accezioni distinte (§2.1) | — | Il modulo le separa esplicitamente: transazionale, di replica, di visibilità |
| **Latenza** | Tempo di risposta di un'operazione | Latenza percepita nella conversazione clinica | Il modulo le collega in §11.6 |
| **Compensazione** | Transazione che contrasta un effetto | Rettifica documentale | Il modulo dichiara che non coincidono (§3.5) |

---

## 6. Verifiche di conformità redazionale

- [x] Frontmatter YAML con `title`, `sidebar_position: 12`, `description`
- [x] Italiano con accenti e diacritici corretti
- [x] Prosa tecnica densa, senza riempitivi né frasi di raccordo vuote
- [x] Ogni concetto ancorato a un esempio di questo dominio
- [x] Fraintendimenti corretti esplicitamente: CAP «due su tre», C di CAP contro C di ACID,
      exactly-once, media contro percentili, copertura dei test come misura di qualità,
      «versionamento = immutabilità»
- [x] Diagrammi Mermaid dove aiutano (4), con etichette fra virgolette e senza caratteri
      problematici
- [x] Blocchi di codice con linguaggio dichiarato, brevi, con soli dati sintetici
- [x] `[NV]` su tutto ciò che non è verificato nelle fonti lette
- [x] Chiusura con «Cosa devi ricordare» (17 punti) e tabella «Termini introdotti in questo
      modulo» (62 voci)
- [x] Regola R0 rispettata
- [x] File scritto in più passaggi con modifiche incrementali (4 passaggi)

## 7. Cosa resta da fare su questo modulo

1. Conteggio esatto delle parole con `wc -w` (§1).
2. Chiusura dei sette riferimenti bibliografici NV-01…NV-07 sul modulo 20.
3. Chiusura dei cinque comportamenti tecnici NV-08…NV-12 con prove dedicate.
4. Due ADR (NV-13, NV-14).
5. Verifica dei collegamenti relativi verso i moduli 12, 13, 14, 16, 19 quando esisteranno.
6. Traduzione inglese (`D3`), da eseguire dopo il congelamento del testo italiano.
