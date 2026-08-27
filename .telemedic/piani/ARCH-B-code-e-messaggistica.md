# `ARCH-B` - Code, messaggistica e forma del sistema

> **Che cos'è questo documento.** È **analisi interna di area architetturale**, non pianificazione
> di traguardo e non codice: `V-182` vieta ogni riga di codice applicativo prima di `T-03`
> (5 settembre 2026 dopo la ritaratura del 27 agosto, era il 26 settembre), e questo documento lo
> rispetta alla lettera - non contiene codice, non
> contiene SQL, non contiene manifesti di dispiegamento.
>
> **Che cosa non fa.** Non riapre di soppiatto nessuna decisione già presa. Le decisioni degli
> `ADR-0008`, `0009`, `0010`, `0011`, `0012` e `0022` escono da questa analisi **confermate**, e
> dove la conferma poggia su motivi che gli ADR non avevano, i motivi nuovi sono dichiarati come
> tali. Dove propongo di **modificare** un enunciato già scritto - accade tre volte - lo dico per
> numero di ADR e per paragrafo, e la modifica proposta è una **restrizione** di una garanzia
> dichiarata, mai un ampliamento.
>
> **Nessun dato reale, nessun dato di paziente, nessuna soglia clinica.** I valori numerici che
> compaiono sono capacità di progetto o riferimenti a documenti esistenti.

---

## 1. La domanda, e come si è ristretta dopo la lettura

La domanda è arrivata nella forma: *rivedere la gestione delle code e della messaggistica fra le
parti del sistema e verso l'archivio dati, con tecnologie moderne, in un'ottica di microservizi.*

La lettura ha spostato tre cose, e vale la pena dire quali prima di rispondere, perché la risposta
utile non è alla domanda posta ma a quella che resta in piedi dopo aver letto.

**Primo spostamento: questo sistema non è scomposto in servizi separati, e non per omissione.**
`docs/02_architecture/02-contesti-delimitati.md` §7 lo scrive in forma esplicita - «non implica un
microservizio per contesto» - e `docs/10_fondamenti/16-architettura-del-progetto.md` §600 lo
ripete. I tredici contesti delimitati sono confini **di modello e di linguaggio**, e la vista di
dispiegamento (`docs/02_architecture/08-viste-di-deployment.md` §2.1) elenca una sola voce
**Applicazione** che li contiene tutti. La domanda «come organizziamo la messaggistica fra i
microservizi» presuppone quindi un sistema che non esiste. La domanda che resta in piedi è
diversa e più interessante: **la scomposizione va fatta?** - ed è un'ipotesi da valutare, che
§3 valuta contro i tre metri indicati dal committente.

**Secondo spostamento: il broker non c'è, e non c'è per decisione presa.** Il taglio `TG-04`
(`docs/09_roadmap/03-primo-rilascio-utilizzabile.md` §5.2) toglie il broker di eventi dal
perimetro del primo rilascio utilizzabile. Nel perimetro ridotto l'outbox resta la sorgente di
verità e **consegna per chiamata autenticata** verso il sistema di origine, con **un solo
consumatore configurato per tenant**, nessuna sottoscrizione multipla e nessuna riproduzione della
cronologia. La reintroduzione è la voce `OL-18`, tredicesima in ordine di priorità, con innesco
esterno e preciso: il primo tenant che chieda un secondo consumatore. Un'analisi sulle code che
non tenesse conto di questo descriverebbe un impianto che, nell'orizzonte in cui il codice verrà
scritto, **non sarà installato da nessuno**. Tutto ciò che segue è quindi scritto su due
orizzonti dichiarati, e ogni proposta dice a quale dei due appartiene.

**Terzo spostamento: la parte davvero rischiosa non è la coda, è l'evento che non arriva.**
Ordinamento, idempotenza e ritentativi sono già decisi con cura in `ADR-0010`. Ciò che manca -
e §5 lo mostra in tre punti distinti - è il presidio sull'**assenza**: un evento che non arriva
mai, una lacuna nella numerazione che nessuno rileva, una riga di outbox che nessun relay prende
in carico. In un dominio in cui l'assenza di dato è informazione clinica, il piano della
messaggistica è l'ultimo luogo in cui si può accettare che il silenzio significhi normalità.

Il perimetro di questa analisi è quindi: la forma del sistema; il modo in cui gli eventi lasciano
l'archivio; le garanzie di consegna e i loro guasti; la riservatezza del contenuto lungo tutto il
percorso, comprese le code di servizio; l'effetto dei due assetti di distribuzione. Restano fuori:
il piano del tempo reale, che ha un meccanismo proprio già deciso (`ADR-0012`); il registro
immutabile, che ha garanzie più forti e un percorso proprio (`ADR-0013`); il contratto pubblico
verso gli integratori, che appartiene all'area di integrazione.

---

## 2. Che cosa è già deciso

Otto decisioni vincolano questa analisi. Le riporto in forma compatta, perché ciò che segue le
presuppone e perché il modo più rapido per sbagliare, qui, è argomentare come se una di esse fosse
ancora aperta.

| ADR | Che cosa fissa | Che cosa ne discende per questa analisi |
|---|---|---|
| **`ADR-0008`** | L'outbox transazionale è l'**unica** sorgente degli eventi in uscita; nessun percorso applicativo scrive sul broker; la tabella sta nello schema del contesto che produce l'evento, quindi è **per tenant**; il relay marca come pubblicato **dopo** la conferma | La sorgente di verità non è il canale. Ogni garanzia dichiarabile deve poggiare sull'archivio, non sul mezzo |
| **`ADR-0009`** | Il relay legge per **interrogazione periodica**, in entrambi gli assetti; la cattura delle modifiche dal registro di replica resta opzione dichiarata a due condizioni congiunte; la soglia di volume non è fissata | La motivazione decisiva è **di perimetro, non tecnica**: l'installazione presso il cliente deve restare leggera e senza privilegi speciali |
| **`ADR-0010`** | Busta standard in modalità strutturata; consegna **almeno una volta**; chiave di partizionamento = **aggregato**, non tenant; **numero di sequenza per aggregato**; idempotenza per costruzione in tre forme; esattamente una volta **non garantibile** attraverso il confine di un sistema esterno | L'ordine di arrivo deve essere reso irrilevante, non garantito |
| **`ADR-0011`** | Eventi **magri**: identificativi, riferimenti e attributi di discriminazione; **nessun contenuto clinico** verso sistemi terzi; il contenuto si rilegge sotto l'autorizzazione del ricevente | Vale su tutto il percorso, code di servizio e messaggi non consegnabili compresi. È il vincolo che rende la coda dei non consegnabili ispezionabile |
| **`ADR-0012`** | Il segnalamento della sessione **non transita** per l'outbox né per il broker; instradamento deterministico al nodo che possiede la sessione; consegna esattamente una volta e in ordine **per sessione**; drenaggio graduale | Esiste già un precedente per sottrarre al piano degli eventi un percorso con budget di latenza proprio. §5.6 chiede di applicarlo una seconda volta |
| **`ADR-0022`** | **Orchestrazione esplicita** per i processi clinici critici, coreografia per le propagazioni semplici; quattro processi orchestrati; ogni passo idempotente; il processo ha un termine; il **meccanismo** è decisione rinviata (`A-1`) | Lo stato del processo è interrogabile: è la proprietà che impedisce al fallimento parziale di essere silenzioso |
| **`ADR-0007`** | Uno schema per tenant su base dati condivisa, con sicurezza di riga come difesa in profondità; contesto risolto dall'asserzione di identità; iterazione esplicita sui tenant per ogni processo che non nasce da una richiesta | Il relay itera sui tenant. Non esiste un relay che legge da tutti gli schemi in una sola interrogazione |
| **`ADR-0013`** | Registro immutabile a quattro strati; la scrittura è **bloccante**; le voci **non passano dall'outbox** | Il registro è l'unico percorso in cui il fallimento fa fallire l'operazione applicativa. Gli eventi no, e la differenza va tenuta ferma |

A queste si aggiungono tre vincoli non architetturali che pesano quanto gli ADR.

**Il vincolo di invarianza fra assetti.** `08-viste-di-deployment.md` §1: *nessuna funzione può
dipendere da un componente disponibile solo in uno dei due assetti*. Le uniche differenze ammesse
sono nella matrice del §7, e sono **dimensionali o di responsabilità, mai funzionali**.

**Il peso operativo dell'installazione presso il cliente.** Stesso §1: ogni componente aggiunto va
installato, aggiornato, sorvegliato e messo in sicurezza da un'organizzazione che non è un
fornitore di servizi informatici, e costa anche la probabilità di essere configurato male. È il
criterio `C5` dell'area tecnica.

**La capacità dichiarata.** `D54` fissa **un contributore unico a tempo parziale**, `D62` lo
quantifica in **dieci-venti ore a settimana**, e
`docs/09_roadmap/01-principi-e-metodo.md` §9 impone che la capacità **ricorrente** - sorveglianza
e aggiornamento dei componenti di terze parti in primo luogo - si sottragga **prima** di allocare
qualunque data. `R-12` osserva che il taglio del broker è l'unico che alleggerisce anche il
progetto, e non solo chi installa.

---

## 3. La forma del sistema, e la raccomandazione sulla scomposizione

### 3.1 Che cosa dicono i documenti, contato

Il conteggio dei processi distribuibili **prodotti dal progetto** è questo, e non è desumibile da
un solo capitolo.

| Eseguibile proprio | Contenuto | Obbligatorio | Fonte |
|---|---|---|---|
| **Applicazione** | I tredici contesti delimitati, i due piani di esposizione, il livello anticorruzione, il relay dell'outbox, l'orchestratore | Sì | `08` §2.1, `02` §7 |
| **Servizio di segnalamento** | La macchina a stati della sessione media, con instradamento deterministico | Sì per le prestazioni sincrone | `08` §2.1, `ADR-0012` |
| **Componente di registrazione** | Registrazione lato server, dove abilitata | Solo se la funzione è attiva; **assente in `RU-1`** | `08` §2.1, `03` §9 limite 13 |

L'**interfaccia utente** è un'applicazione a pagina singola, cioè materiale statico servito, non un
processo con stato. Tutto il resto dell'elenco di `08` §2.1 - archivio relazionale, archivio a
serie temporali, archivio del registro, broker, prodotto di federazione, relay di attraversamento
della rete, servizio terminologico, firma, recapito, sorveglianza - è **componente di terze parti o
servizio esterno**, non codice del progetto.

Quindi: **i contesti di dominio sono tredici, gli eseguibili propri sono due, più uno
condizionale.** La scomposizione in servizi separati non è ciò che i documenti descrivono, e non
è nemmeno un'omissione da colmare: è una scelta enunciata due volte con la stessa formula.

Va segnalata una sola ambiguità reale nel corpus. `02-contesti-delimitati.md` §7 scrive che il
progetto sostiene «un assetto a processo unico per l'installazione presso il cliente e un assetto
**distribuito** per il servizio gestito». Letta da sola, quella frase suggerisce una scomposizione
per contesto nel servizio gestito. `08-viste-di-deployment.md` §4.1 dice altro: nel servizio
gestito i componenti sono **replicati**, con separazione fra i percorsi interattivi, di sfondo e di
esportazione - cioè più istanze dello **stesso** eseguibile con profili di pool diversi, che è
esattamente ciò che `05-multi-tenancy.md` §3.4 richiede come requisito architetturale. La matrice
del §7 conferma: non contiene alcuna riga sul numero di servizi. «Distribuito» significa
**replicato**, non **scomposto**. L'ambiguità va chiusa in un enunciato, perché è il genere di
frase che, letta fra due anni da chi realizza, produce un'architettura diversa da quella decisa.

### 3.2 L'ipotesi della scomposizione, misurata sui tre metri

**Primo metro - l'invarianza fra assetti.** Una scomposizione per contesto porta con sé una
famiglia di componenti che oggi non esistono: individuazione dei servizi, instradamento interno,
autenticazione reciproca fra servizi, propagazione del tracciamento distribuito, gestione
centralizzata della configurazione. Ciascuno di essi è un componente in più nell'inventario dei
componenti di terze parti - lo stesso inventario che `ADR-0009` ha già usato come argomento
decisivo per **scartare** un solo componente aggiuntivo. Nell'installazione presso il cliente
quella famiglia o si installa, e allora il peso operativo cresce di un ordine di grandezza, oppure
non si installa, e allora esistono funzioni - o garanzie - disponibili in un solo assetto. La
seconda strada è vietata dal §1 di `08`; la prima è vietata da `C5` e da `D62`. **La scomposizione
non supera il primo metro**, e il primo metro basta da solo.

**Secondo metro - il peso su chi installa.** `RU-1` si installa con definizioni a contenitori nel
solo profilo a tenant unico (`TG-08`), senza interfaccia di amministrazione (`TG-10`): ogni
operazione avviene per configurazione dichiarativa versionata e riga di comando. In quel contesto,
passare da due eseguibili a tredici significa moltiplicare per sei il numero di unità da avviare,
aggiornare, sorvegliare e diagnosticare, presso un'organizzazione che non ha un fornitore di
servizi informatici. Il costo non è la complessità: è che **l'aggiornamento diventa un'operazione
con un ordine**, e un ordine sbagliato in un aggiornamento è un guasto.

**Terzo metro - la capacità.** Con dieci-venti ore settimanali e un solo contributore, tredici
unità di rilascio significano tredici catene di costruzione, tredici distinte dei materiali,
tredici superfici di dipendenze da sorvegliare con il livello di servizio in giorni dall'avviso di
`V-185`. La capacità ricorrente si sottrae prima di pianificare: la scomposizione la moltiplica in
modo permanente, in cambio di un beneficio - rilascio indipendente, scalabilità differenziata - che
nessun requisito ha chiesto e che nessun volume misurato giustifica.

### 3.3 Due argomenti che i tre metri non contengono, e che pesano di più

**Il consenso è in partnership e la sua verifica è bloccante e non degradabile.**
`02-contesti-delimitati.md` §3.1 lo dice senza attenuanti: nessun percorso «degradato senza
verifica del consenso» è ammesso, e `CTX-04` invariante 3 lo ripete. In un eseguibile unico quella
verifica è una chiamata al confine di un contesto, nello stesso ambito di processo. In una
scomposizione diventa una chiamata di rete **sul percorso critico di ogni atto clinico**, con la
conseguenza che l'indisponibilità del servizio del consenso è indisponibilità della prestazione.
Non è un rischio ipotetico: è la definizione stessa di una dipendenza non degradabile spostata su
una rete. La scomposizione, qui, **peggiora una proprietà di sicurezza clinica** per ottenere una
proprietà di rilascio.

**La separazione che di solito si compra con i servizi, qui è già comprata dal motore.**
`01_technical/03-persistenza.md` §2.2 assegna a **ogni contesto un ruolo di base dati proprio, con
privilegi solo sui propri schemi**, e §2.1 assegna a ogni coppia tenant-contesto uno schema
distinto. La regola «nessun contesto accede alla base dati di un altro» non è quindi disciplina di
codice: è imposta dai privilegi, verificabile interrogando il catalogo di sistema. È precisamente
il beneficio che si adduce a favore dei servizi separati - confini che non si erodono - e in questo
progetto **esiste già senza pagare la rete**.

### 3.4 La domanda normativa, che va affrontata e non evitata

Va detto, perché è probabilmente l'origine della domanda del committente e perché tacerlo sarebbe
smussare una tensione. Il **DM 21 settembre 2022, Allegato A** prescrive fra i requisiti
tecnologici l'architettura a **micro-servizi** con orchestrazione e gestione di immagini
container, e - nella stessa tabella - l'architettura a eventi **con event broker**
(`docs/10_fondamenti/02-prestazioni-di-telemedicina.md` §6.4). Tre osservazioni, tutte necessarie.

La prima: quei requisiti sono `[TECNICO-VINCOLANTI]` **per le infrastrutture regionali di
telemedicina**, e `docs/08_compliance/01-inquadramento-normativo.md` §9 li classifica come `P+D` -
di prodotto per la parte tecnica, organizzativi per i due centri e per i livelli di servizio. Sono
requisiti di ammissibilità di una **infrastruttura regionale**, non di ogni applicativo che vi
partecipi. Telemedic non è un'infrastruttura regionale e non appone marcatura CE: dichiarare che
il progetto «è conforme» a quel driver sarebbe una formula di conformità non dimostrata, ed è
vietata.

La seconda: il termine «micro-servizio» compare nel corpus con **due significati diversi**, e
confonderli è l'errore da evitare. Nel DM 19 novembre 2025, Allegato 3 §4.1, i «micro-servizi
essenziali» sono un **catalogo funzionale** - gestione dei questionari, motore di workflow,
videoconferenza, eventi e notifiche, messaggistica, arruolamento - dichiarato «a titolo
esemplificativo e non esaustivo». È un elenco di **capacità**, non una topologia di
dispiegamento. Telemedic possiede quelle capacità come contesti delimitati, il che è la lettura
sostanziale del requisito.

La terza, che è la sola con conseguenze operative: se un giorno un'installazione fosse destinata a
un'infrastruttura soggetta al driver «architettura a eventi con event broker», il taglio `TG-04`
diventerebbe un impedimento di ammissibilità, e l'innesco oggi dichiarato per `OL-18` - il primo
tenant che chieda un secondo consumatore - **non lo intercetterebbe**. `[NV]` - in che cosa
consista operativamente il Processo di Validazione di AGENAS previsto dal DM 19 novembre 2025,
art. 3, comma 4, non è pubblicamente documentato, e questa analisi non lo inventa. Ne discende la
decisione `AB-13`.

### 3.5 La raccomandazione

**Il sistema resta un monolite modulare a due eseguibili propri, più uno condizionale. La
scomposizione in servizi separati non si fa, e la sua non esecuzione va enunciata come decisione
invece che dedotta da due frasi sparse.**

Perché una decisione così venga presa una sola volta e non venga riaperta a ogni pull request,
serve però il **criterio di estrazione**, cioè la risposta alla domanda «quando è invece corretto
staccare un processo». Il criterio si ricava dai due casi già decisi, e non ne ammette altri:

1. **Ciclo di vita incompatibile con quello dell'applicazione.** `ADR-0012` impone al segnalamento
   il **drenaggio graduale**: un nodo che si aggiorna smette di accettare sessioni nuove e attende
   la conclusione di quelle attive entro una finestra dichiarata. Se il segnalamento vivesse nel
   processo dell'applicazione, **ogni rilascio dell'applicazione drenerebbe tutte le sessioni in
   corso**, e la cadenza di rilascio del prodotto diventerebbe un vincolo clinico. È questo - non
   la scalabilità - a giustificare il secondo eseguibile.
2. **Regime di sicurezza o di esposizione incompatibile.** Il componente di registrazione tratta
   media **non cifrato fino agli estremi** (`08` §2.2); il relay di attraversamento sta in una zona
   **senza rotte verso le reti interne** (`08` §5.2). Un regime di isolamento diverso è un confine
   di rete, e un confine di rete è un processo.

**Nessun terzo criterio è ammesso.** In particolare non lo è la scalabilità differenziata: la
separazione dei pool per classe di operazione (`05` §3.4, `08` §4.2) la ottiene già dentro un solo
eseguibile, ed è già un requisito architetturale.

---

## 4. La messaggistica verso l'archivio

### 4.1 Il quadro, e che cosa si sta davvero decidendo

`ADR-0008` ha deciso **dove nasce** l'evento: nella stessa transazione del dato. `ADR-0009` ha
deciso **come si legge**: interrogazione periodica. La domanda del committente riguarda la seconda,
e va posta con precisione, perché le tre alternative moderne che nomina non sono sullo stesso
piano.

- La **notifica dall'archivio** è un meccanismo di sveglia: non trasporta il dato, non è durevole,
  e può solo ridurre la latenza di una lettura che avviene comunque.
- La **decodifica logica del giornale delle transazioni** e la **cattura delle modifiche** sono la
  stessa famiglia vista da due lati: un componente esterno legge il giornale di scrittura anticipata
  e pubblica. `ADR-0009` l'ha già valutata come alternativa 2 e scartata come predefinita.

Il quadro non cambia. Cambia però la **qualità dei motivi**, e in un punto cambia la conclusione
di dettaglio. Vado per condizioni, come chiesto.

### 4.2 Notifica asincrona dall'archivio

**Che cosa richiede all'archivio.** Nulla di più di ciò che il progetto già usa: è un meccanismo
nativo dell'archivio relazionale adottato, non un'estensione e non un privilegio. La notifica è
emessa al consolidamento della transazione e raggiunge i soli processi in ascolto in quel momento.

**Che cosa comporta per l'installazione presso il cliente.** Nessun componente aggiuntivo, nessun
privilegio speciale, nessuna voce nuova nell'inventario. Su questo metro - che è quello decisivo
in `ADR-0009` - la notifica **passa**, mentre la cattura delle modifiche non passa.

**Che cosa comporta per la sicurezza di riga e per lo schema per tenant.** Qui sta il punto
delicato, e ha due facce. La prima: **la notifica non è soggetta alle politiche di riga.** Il
canale di notifica è un oggetto della connessione, non una tabella: ciò che vi transita non è
filtrato dal contesto di tenant. Ne discende una regola non negoziabile - la notifica trasporta
**esclusivamente l'identificativo opaco del tenant** che ha lavoro pendente, e nulla altro. Non il
tipo di evento, non l'aggregato, non il conteggio. Un carico più ricco sarebbe informazione che
attraversa un canale privo del presidio che protegge tutto il resto. La seconda faccia: con
centinaia di schemi, **un ascoltatore per tenant significa una connessione per tenant**, che è
insostenibile e contraddice il pool condiviso di `05` §2.2. Serve quindi un canale unico con
l'ordinale opaco del tenant nel carico, che è esattamente la struttura già adottata per i nomi di
schema in `03-persistenza.md` §2.1.

**Se renda più fragile la garanzia che `ADR-0009` dichiara di volere.** Sì, se usata come
sorgente. La garanzia che `ADR-0009` protegge è **la riproducibilità**: comportamento identico fra
ambiente di sviluppo, installazione presso il cliente e servizio gestito, «ciò che si prova è ciò
che si esegue». La notifica non è durevole: se nessun processo è in ascolto nell'istante in cui
viene emessa - riavvio del relay, riconnessione, partizione momentanea - **quella sveglia è persa
per sempre**, e la riga resta in outbox senza che nulla la reclami. Un relay che si affidasse alla
sola notifica avrebbe la peggiore delle modalità di guasto: funziona sempre in prova, e in
esercizio dimentica in silenzio esattamente gli eventi prodotti nel momento peggiore.

**Conclusione.** La notifica è ammissibile **solo come acceleratore** dell'interrogazione
periodica, mai come sua sostituzione. L'interrogazione resta il presidio e resta dimensionata come
se la notifica non ci fosse; la notifica riduce la latenza tipica senza modificare quella di caso
peggiore, che è il valore da dichiarare nel contratto pubblico (`L4` di
`07-prestazioni-e-capacita.md`). Formulata così, non tocca `ADR-0009` in ciò che decide, e va
registrata come sua estensione - decisione `AB-11`.

### 4.3 Decodifica logica del giornale e cattura delle modifiche

**Che cosa richiede all'archivio.** Privilegi di replica, uno slot di replica persistente e un
componente esterno che lo consumi. Lo slot è la parte che di solito si sottovaluta: **è persistente
sul lato dell'archivio**, e un consumatore fermo impedisce il riciclo del giornale delle
transazioni, con crescita di occupazione su disco che si arresta soltanto quando qualcuno se ne
accorge o quando il disco finisce. È una modalità di guasto **che oggi il progetto non ha**, e che
colpirebbe l'archivio primario - cioè il percorso clinico, che `ADR-0008` ha deliberatamente
sganciato dalla disponibilità del canale.

**Che cosa comporta per l'installazione presso il cliente.** Tutto ciò che `ADR-0009` ha già
elencato, e che la lettura degli altri documenti aggrava: un componente in più nell'inventario dei
componenti di terze parti, con la sorveglianza ricorrente che `R-12` quantifica come non
trascurabile e non stimabile sotto `D54`; privilegi che il cliente potrebbe non voler concedere;
uno stato di avanzamento della lettura da sorvegliare, con una propria modalità di guasto.

**Che cosa comporta per la sicurezza di riga e per lo schema per tenant.** È l'argomento nuovo, e
da solo è dirimente. Il lettore del giornale **opera al di sotto del livello a cui le politiche di
riga esistono**: legge modifiche fisiche, non righe filtrate da una politica. In un modello in cui
la sicurezza di riga è la seconda barriera **deliberatamente ridondante** (`ADR-0007`), introdurre
un percorso di uscita del dato che quella barriera non attraversa significa creare l'unico punto
del sistema in cui l'isolamento fra titolari autonomi dipende dalla correttezza della
configurazione di un componente di terze parti. Si aggiunge una conseguenza pratica dello schema
per tenant: il lettore va configurato per pubblicare **le tabelle di outbox di tutti gli schemi**,
e la creazione di un tenant - che per `05` §7 è integralmente automatizzata e senza passaggi
manuali - dovrebbe estendere quella configurazione. Un tenant creato e non aggiunto alla
pubblicazione **è un tenant i cui eventi non escono, senza alcun errore**. Di nuovo: guasto
silenzioso.

**Conclusione.** L'alternativa resta esattamente dove `ADR-0009` l'ha messa - opzione dichiarata
per assetti ad alto volume, alle due condizioni congiunte già scritte - e vi resta con **due
motivi in più** che l'ADR non aveva: l'aggiramento della seconda barriera di isolamento, e la
dipendenza della correttezza dal ciclo di vita automatizzato del tenant. Propongo che entrambi
siano registrati come condizioni ulteriori: se l'opzione verrà adottata, dovrà dimostrare che la
creazione di un tenant estende la pubblicazione **in modo atomico rispetto alla creazione dello
schema**, e che nessun percorso di uscita elude le politiche di riga senza un presidio equivalente.

### 4.4 La decisione esistente regge, e regge meglio di come è motivata

Detto con la stessa chiarezza con cui avrei detto il contrario: **l'interrogazione periodica
resta la modalità corretta**, e i motivi nuovi la rafforzano invece di indebolirla. Il motivo
originale - il perimetro dell'installazione presso il cliente - è ancora il più forte. Ma vanno
aggiunti tre motivi che nel 2026 pesano più di quanto pesassero quando l'ADR è stato scritto:

1. **`TG-04` toglie il broker.** Senza broker non esiste alcun vantaggio di latenza da inseguire,
   perché la consegna avviene per chiamata autenticata verso un solo consumatore per tenant: il
   costo dominante è la latenza del destinatario, non quella della lettura.
2. **La cattura delle modifiche elude la seconda barriera di isolamento** (§4.3), che è il punto
   su cui questo progetto ha scelto di essere ridondante per decisione e non per residuo.
3. **`R-12` misura il costo ricorrente di ogni componente esposto**, e sotto `D62` la frazione
   sottratta alla capacità è la stessa in valore assoluto e molto maggiore in proporzione.

Resta un punto di sostanza che l'analisi **cambia**, ed è nella tabella dei costi di `ADR-0009`,
non nella decisione. L'ADR elenca fra i compromessi «carico costante sull'archivio anche in assenza
di eventi». Con lo schema per tenant quel carico **non è costante: è proporzionale al numero di
tenant**, perché il relay itera esplicitamente e non esiste un'interrogazione unica su tutti gli
schemi (`05` §3.3). A parità di intervallo, il carico di sola sorveglianza cresce linearmente con i
clienti, e con centinaia di tenant - l'ordine di grandezza dichiarato in `03-persistenza.md` §2.4 -
diventa la grandezza che fissa l'intervallo minimo praticabile, prima e più del volume di eventi.
**Questa, e non il volume di eventi, è la condizione che farà scattare la rivalutazione di `A-2`**,
e va scritta così, perché una rivalutazione innescata dalla grandezza sbagliata non scatta.

---

## 5. Code, consegna, guasti, e l'evento clinico perduto

### 5.1 Ordinamento: che cosa è garantito davvero

`06-eventi-e-integrazione-interna.md` §4.1 dichiara, in tabella: «Ordine fra eventi con la stessa
chiave di partizionamento - **Sì**, all'interno della partizione». `07-prestazioni-e-capacita.md`
`L5` lo ripete. La realizzazione descritta **non produce quella garanzia**, e la distanza fra
l'enunciato e la realizzazione è il tipo di difetto che si scopre in esercizio, in modo
intermittente, presso un integratore.

Tre ragioni indipendenti, ciascuna sufficiente.

**Prima - il prelievo con blocco che salta le righe già prese.** `03-persistenza.md` §7 dichiara
esplicitamente che quel meccanismo «consente a più istanze di lavorare in parallelo senza
coordinatore». È vero, ed è il pregio del meccanismo; ma due istanze che prendono due lotti diversi
possono contenere due eventi **dello stesso aggregato** e pubblicarli in ordine invertito. Il salto
delle righe bloccate è ciò che rende il relay parallelo e ciò che rompe l'ordine per chiave: non è
un difetto di realizzazione, è una proprietà del meccanismo.

**Seconda - i ritentativi in pubblicazione.** Un tentativo fallito e ripetuto può inserirsi dopo
un tentativo successivo andato a buon fine, anche con un solo relay, se il produttore consente più
richieste in volo verso la stessa destinazione.

**Terza - il riassestamento delle partizioni**, già dichiarato `[NV]` in `ADR-0010` e in `06`
§4.2.

Ne discende che la riga della tabella va **riscritta come condizionale**, non cancellata:
l'ordine per chiave è garantito **se e solo se** tre condizioni valgono insieme - un solo
lavoratore per volta detiene le righe di una data chiave; il produttore è idempotente e limita le
richieste in volo verso la stessa destinazione; il numero di partizioni non cambia. Fuori da
quelle condizioni, l'ordine **non è garantito**, e va dichiarato come non garantito nel contratto
pubblico, che è precisamente ciò che `ADR-0010` dice di voler fare quando scrive che «il contratto
è esplicito su ciò che non garantisce».

C'è una lettura consolante e va respinta: si potrebbe dire che tanto il numero di sequenza per
aggregato rende l'ordine irrilevante. Rende irrilevante **il riordino**, non la **lacuna**, e §5.4
mostra che le due cose sono diverse. E c'è una conseguenza specifica di `RU-1`: **senza broker non
esistono partizioni**, quindi la prima riga della tabella non ha nemmeno un luogo dove valere, e il
numero di sequenza per aggregato passa da presidio ridondante a **unico meccanismo di ordinamento
esistente**. Ciò che in `06` è cintura e bretelle, in `RU-1` è la sola cintura.

### 5.2 Idempotenza e la chiave che la realizza

Non c'è nulla da rivedere: `ADR-0010` fissa la chiave di deduplicazione come coppia sorgente più
identificativo, unica per costruzione, e ordina le tre forme di idempotenza per preferenza,
imponendo la verifica di stato prima dell'effetto per i due effetti non ritrattabili - il recapito
di un messaggio a una persona e il deposito di un documento in un'infrastruttura esterna. La prova
di accettazione - consegnare due volte lo stesso evento e verificare l'identità dello stato - è
`EV-3`, ed è già obbligatoria.

Due precisazioni che l'esercizio renderà necessarie.

**La finestra di conservazione delle chiavi è già `[NV]` e va chiusa insieme alla politica di
ritentativo, non dopo.** `ADR-0010` dice che non può essere inferiore alla finestra massima di
ritentativo. Aggiungo la condizione che la rende effettiva: la riesecuzione manuale di un messaggio
non consegnabile **riusa lo stesso identificativo** (`EV-9`), e la coda dei non consegnabili ha una
conservazione dichiarata (`06` §5.4, proprietà 1). Ne discende che la finestra di conservazione
delle chiavi non deve superare la finestra massima di ritentativo, ma **la conservazione della coda
dei non consegnabili**, che è più lunga. Una riesecuzione oltre la scadenza della chiave duplica, e
duplica proprio nel caso in cui un essere umano sta rimediando a un guasto.

**L'idempotenza del ricevente è un requisito di integrazione che va scritto nel contratto e
provato una volta sola**, perché `RU-1` ha un solo consumatore per tenant: è l'unica finestra in
cui la prova è economica.

### 5.3 Ritentativi, interruttore, contropressione

La politica è già fissata in `06` §5.1 - attesa esponenziale con variazione casuale obbligatoria,
parametri configurabili e dichiarati nel contratto pubblico - e la motivazione della variazione
casuale è corretta e non banale. `06` §5.2 elenca che cosa innesca il ritentativo e che cosa no;
`06` §5.3 fissa interruttore e quote **per tenant e per destinazione, mai globali** (`SQ-05`,
`EV-12`).

Ciò che manca è la contropressione **sul lato dell'outbox**, e la sua assenza non è una svista: è
una tensione fra due regole entrambe scritte.

`07-prestazioni-e-capacita.md` §6.1 prescrive «coda **limitata**, con rifiuto dichiarato quando è
piena», e la motiva bene: proteggere il sistema dall'accumulo. `ADR-0008` prescrive l'opposto per
l'outbox, e altrettanto bene: la disponibilità del percorso clinico non dipende da quella del
canale, e la pubblicazione è ritentabile indefinitamente perché la sorgente è persistita. Le due
regole non possono valere insieme sullo stesso oggetto, e **il conflitto va risolto per enunciato,
non per omissione**.

La risoluzione corretta è: **l'outbox è l'eccezione dichiarata alla regola della coda limitata.**
Non applica contropressione al percorso clinico, non rifiuta scritture, non scarta eventi. Un
evento clinico non si scarta mai, per nessuna soglia. Ne discendono però tre obblighi, perché
un'eccezione senza presidi è un difetto in attesa:

1. La crescita illimitata dell'outbox in caso di indisponibilità prolungata del destinatario è
   **dichiarata**, con la capacità di archiviazione necessaria per una finestra di indisponibilità
   dichiarata: è un dato che entra nella lista di ciò che il cliente deve fornire (`08` §3.2).
2. La soglia di allarme scatta **molto prima** dell'esaurimento dello spazio, perché lo
   spazio esaurito sull'archivio primario è indisponibilità del percorso clinico - cioè
   esattamente ciò che `ADR-0008` voleva evitare, ottenuto per una via più lenta e più difficile
   da diagnosticare.
3. Il degrado, se serve, avviene **sul lato dei consumatori** - riduzione della frequenza,
   sospensione della destinazione, interruttore - mai sul lato della produzione.

### 5.4 L'evento clinico che finisce fra i non consegnabili

Questa è la parte in cui l'analisi vale più della media, e la domanda del committente è già la
forma giusta: **chi se ne accorge, in quanto tempo, e come rientra.**

Ciò che i documenti garantiscono oggi è buono ma incompleto. `06` §5.4 richiede quattro proprietà -
conservazione dichiarata, ispezionabilità dall'interfaccia applicativa, rieseguibilità con lo
stesso identificativo, visibilità a un essere umano - e aggiunge che il fallimento su contenuto
diretto al sistema di origine entra in una **coda di riconciliazione presidiata** con un'azione
possibile. `CTX-11` invariante 5 lo ripete. `08` §8 dichiara che la profondità della coda dei non
consegnabili e il ritardo del relay sono grandezze architetturalmente rilevanti. Le soglie sono
rinviate a `B-6`.

Restano tre buchi, e sono tutti buchi di **assenza**.

**Buco 1 - la profondità non rileva la riga bloccata.** La profondità di una coda misura ciò che è
entrato. Una riga di outbox che nessun relay prende in carico - perché il tenant è stato saltato
nell'iterazione, perché una configurazione lo esclude, perché il lavoro è terminato a metà ciclo -
**non entra in nessuna coda**: resta ferma in una tabella, con profondità dei non consegnabili pari
a zero e cruscotti verdi. Allo stesso modo, un ritardo del relay calcolato in forma aggregata su
tutta l'installazione resta piccolo mentre un singolo tenant è fermo da ore. La grandezza corretta
non è la profondità e non è il ritardo medio: è **l'età della più vecchia riga di outbox non ancora
in stato terminale, misurata per tenant**, e la grandezza da sorvegliare è il suo massimo. È
l'unica formulazione che si accorge di un tenant fermo mentre tutti gli altri lavorano, ed è
coerente con il principio secondo cui l'iterazione sui tenant è esplicita e mai implicita.

**Buco 2 - la lacuna nella numerazione non è rilevabile a valle.** `ADR-0010` prescrive che il
consumatore che ha già applicato il numero `n` scarti ciò che arriva con numero inferiore o uguale.
Quella regola protegge da duplicati e riordini, e **non protegge dall'evento che non arriverà
mai**. Se l'evento `n+1` finisce fra i non consegnabili e l'evento `n+2` viene consegnato, il
consumatore applica `n+2` senza alcun segnale: da quel momento il suo stato è **silenziosamente
incompleto**, e se un giorno `n+1` viene riesumato e riconsegnato, la regola dello scarto lo
elimina - cioè il rimedio corretto viene annullato dal presidio. Il rimedio è scrivere nel
contratto pubblico che **il numero di sequenza per aggregato è denso**, cioè contiguo senza salti,
e che una lacuna è pertanto **rilevabile dal ricevente e va segnalata, non attesa**. La densità è
una proprietà del produttore che va garantita e provata; senza la dichiarazione di densità, il
numero di sequenza è utile contro il rumore e inutile contro la perdita, che è il rischio più
grave. È la decisione `AB-6`, ed è la traduzione diretta del principio secondo cui l'assenza di
dato è informazione.

**Buco 3 - nessuno verifica in positivo che l'evento sia stato prodotto.** Tutti i presidi
elencati agiscono su eventi che **esistono**. `EV-1` e `EV-2` coprono i due difetti classici
- evento fantasma ed evento perso fra consolidamento e pubblicazione - ma non coprono il percorso
applicativo che, per una svista, **non scrive affatto** l'evento nella transazione. Quel caso è
esattamente il difetto che `ADR-0008` descrive come il peggiore, cioè quello in cui «non c'è nulla
che segnali l'assenza di un evento che non è mai esistito», e l'outbox lo elimina solo a condizione
che la scrittura ci sia. Il presidio corretto non è di esercizio ma di costruzione: **ogni fatto di
dominio che il modello dichiara come rilevante ha un tipo di evento associato, e la costruzione
fallisce se un fatto rilevante non ne ha uno**. È verificabile staticamente, costa poco e chiude
una classe intera; il suo posto naturale è accanto a `EV-7`, che già richiede che ogni tipo di
evento abbia uno schema registrato e versionato.

**Come rientra, in concreto.** La sequenza che propongo è già interamente compatibile con ciò che è
deciso, e non aggiunge componenti: la riga di outbox esaurisce la politica di ritentativo; passa in
stato terminale «parcheggiata» con la causa da catalogo chiuso; se il tipo di evento è marcato come
**clinicamente rilevante**, la parcheggiatura genera un allarme destinato al presidio del tenant e
non un semplice contatore; l'operatore la ispeziona dall'interfaccia applicativa senza vedere
contenuto clinico, perché la busta è magra; la rimette in coda con lo stesso identificativo, e la
deduplicazione del ricevente regge; il ricevente che nel frattempo avesse rilevato una lacuna nella
numerazione la vede colmata. Manca un solo elemento perché la catena si chiuda: **la distinzione
fra tipi di evento clinicamente rilevanti e tipi ordinari**, che oggi non esiste in nessun
documento e senza la quale la coda dei non consegnabili tratta allo stesso modo un promemoria non
recapitato e un referto che non ha raggiunto il sistema di origine.

**In quanto tempo.** Il valore non lo fissa quest'analisi - è `B-6`, area di sicurezza e roadmap -
ma la **forma** del requisito sì, e va detta: il tempo di accorgersi non può essere superiore alla
finestra entro cui l'azione di rimedio è ancora utile per l'assistito. Per un evento che alimenta
il sistema di origine, quella finestra è il ciclo di lavoro del professionista; per un'allerta
di telemonitoraggio è la finestra di presa in carico già dichiarata in `CTX-07` invariante 6 e in
`CTX-08` invariante 4. Il presidio della coda non è quindi un parametro di esercizio libero: è
**derivato da finestre cliniche già dichiarate altrove**, e va derivato invece che scelto.

### 5.5 Veleno da messaggio, e la trappola che introduce

Un evento che fa fallire deterministicamente il consumatore - busta non validabile, tipo
sconosciuto, riferimento a un aggregato che il ricevente non conosce - esaurisce i tentativi e
viene parcheggiato. Con il prelievo che salta le righe bloccate, il resto del flusso prosegue: è il
comportamento giusto, e va detto che è un pregio del meccanismo scelto.

La trappola è che **parcheggiare una riga di mezzo apre una lacuna nella numerazione dell'aggregato**,
cioè produce esattamente la condizione del buco 2. Ne discende una regola che oggi non è scritta e
che va scritta: quando una riga relativa a una chiave viene parcheggiata, il sistema deve scegliere
in modo dichiarato fra due comportamenti, e la scelta è per tipo di evento, non globale -
**parcheggiare anche le righe successive della stessa chiave**, conservando la coerenza a costo di
fermare l'aggregato, oppure **proseguire e dichiarare la lacuna** al ricevente. Per i tipi
clinicamente rilevanti la prima è l'unica ammissibile: uno stato parziale su un aggregato clinico
presso un sistema terzo è peggio di un aggiornamento fermo, perché lo stato parziale ha l'aspetto
di uno stato completo.

Un secondo caso di veleno riguarda il **relay** e non il consumatore: una riga la cui busta non
supera la validazione di schema al momento della pubblicazione. Va trattata come veleno di
consumatore - parcheggiata con causa - e non come errore ritentabile, perché nessun numero di
tentativi cambia il contenuto di una riga immutabile. Va inoltre segnalata con severità più alta
delle altre, perché **è un difetto del produttore, cioè nostro**, e non del destinatario.

### 5.6 Il percorso che non deve pagare l'intervallo del relay

`07-prestazioni-e-capacita.md` §6.2 elenca ciò che non si sacrifica mai, e vi include
«**emissione e recapito delle allerte cliniche**». `CTX-07` invariante 6 e `CTX-08` invariante 4
impongono che la finestra di presa in carico sia dichiarata e che il fallimento dell'inoltro sia
esplicito. La mappa dei contesti colloca il passaggio da `CTX-07` a `CTX-08` come relazione
cliente-fornitore alimentata da eventi.

Se quel passaggio transita per l'outbox, **la latenza dichiarata di `L4` entra nel budget di presa
in carico dell'allarme**, e con essa la latenza del canale e quella dei ritentativi. Nessun
documento lo ha calcolato. È la stessa struttura di problema che `ADR-0012` ha già risolto per il
segnalamento: un percorso con budget di latenza proprio non può usare il meccanismo generale solo
perché il meccanismo generale è generale.

La risposta corretta qui è però diversa da quella del segnalamento, e più economica: **`CTX-07` e
`CTX-08` vivono nello stesso eseguibile.** Il passaggio può quindi essere una **chiamata sincrona
al confine dei contesti** - che `06` §2.5 ammette esplicitamente, ricordando che le interrogazioni
sincrone fra contesti non sono eventi - con l'evento emesso **in aggiunta**, nella stessa
transazione, per la tracciabilità e per i consumatori esterni. L'allerta non paga l'intervallo del
relay; l'evento resta l'unica sorgente per chi sta fuori; `ADR-0008` non è toccato, perché nulla
scrive sul broker fuori dall'outbox.

Vale la pena notare che questo è un **argomento a favore del monolite modulare** che nessuno dei
tre metri di §3.2 conteneva: in un sistema scomposto quella chiamata sarebbe di rete, e il percorso
dichiarato non sacrificabile dipenderebbe dalla disponibilità di un secondo processo.

### 5.7 Consumo esattamente una volta, e perché di solito non esiste

`ADR-0010` lo ha già liquidato correttamente, e non c'è nulla da riaprire. Aggiungo solo la ragione
per cui la formula ricompare periodicamente e va saputa respingere. Alcuni canali offrono una
semantica «esattamente una volta» che è reale ma **chiusa dentro il canale stesso**: vale fra la
lettura da un argomento e la scrittura su un altro argomento dello stesso sistema, in una
transazione che il sistema coordina. Nel momento in cui l'effetto del consumo è **fuori** - una
riga in un archivio di terzi, una chiamata a un sistema di origine, un messaggio recapitato a una
persona - la transazione non lo comprende, e la semantica torna a essere «almeno una volta più
deduplicazione a valle». Poiché ogni consumatore di questo sistema ha effetti fuori dal canale, la
semantica dichiarabile è **almeno una volta, sempre**. Dichiarare altro produrrebbe integratori che
non deduplicano, che è il difetto che si voleva evitare.

C'è un solo punto del sistema in cui «esattamente una volta e in ordine» è **richiesto**, ed è il
segnalamento della sessione. `ADR-0012` lo ottiene non usando una coda: tenendo la macchina a stati
in un solo processo. È la conferma per via negativa della regola generale - **l'unico modo per
avere esattamente una volta è non attraversare un canale**.

---

## 6. Riservatezza del contenuto lungo tutto il percorso

`ADR-0011` decide che gli eventi sono magri, e la verifica `EV-6` lo presidia con un elenco chiuso
di forme rilevabili. La proposta di questa analisi **non introduce alcun punto in cui contenuto
clinico entri in un canale**, e vale la pena verificarlo un luogo alla volta invece di affermarlo.

| Luogo | Che cosa vi transita nella proposta | Verifica |
|---|---|---|
| Tabella di outbox | La busta magra, identica a quella pubblicata | `EV-6`, esteso alla colonna della busta a riposo |
| Notifica asincrona dell'archivio (§4.2) | **Solo** l'identificativo opaco del tenant con lavoro pendente | Nuova: il carico della notifica appartiene a un insieme chiuso di un solo elemento |
| Canale di consegna | La busta magra | `EV-6` |
| Coda dei non consegnabili | La busta magra più la causa di fallimento da catalogo chiuso | Nuova, vedi sotto |
| Registri diagnostici | Identificativo, sorgente, tipo, tenant opaco, codice di esito. **Mai la busta integrale** | Nuova, vedi sotto |
| Grandezze di sorveglianza | Conteggi ed età, etichettati con l'identificativo **opaco** del tenant | Coerente con `08` §5.3 e con `05` §2.3 |

Tre punti richiedono una decisione, perché oggi non sono coperti.

**Primo - la causa di fallimento.** `03-persistenza.md` §7 prevede nell'outbox una colonna per
l'ultimo errore. È il luogo naturale in cui finisce, per comodità di diagnosi, il **corpo della
risposta del destinatario**. Un sistema di origine sanitario può rispondere con messaggi che
contengono dati dell'assistito, e in quel momento contenuto personale - potenzialmente clinico -
si deposita in una tabella che l'amministratore del tenant può ispezionare e che le copie di
sicurezza replicano. La regola va scritta prima che qualcuno scriva la riga: **si conserva un
codice di esito appartenente al catalogo chiuso degli errori**, che il progetto già impone con
`V-110` e `V-130`, più eventualmente un estratto normalizzato **privo di corpo di risposta di
terzi**. Nessun corpo di risposta esterno viene persistito verbatim.

**Secondo - la busta nei registri diagnostici.** La busta è magra, e questo è un merito, ma **magro
non significa non personale**. Il tipo dell'evento nomina il fatto - un referto di televisita
firmato - e il soggetto nomina l'aggregato; la coppia, dentro un tenant, è riconducibile a una
persona con i mezzi di chi ha accesso al tenant. In un dominio in cui il solo fatto del contatto
con uno specialista è dato relativo alla salute (`08` §5.3, `05` §1), registrare la busta integrale
a livello di errore è il gesto più naturale del mondo e va vietato per iscritto.

**Terzo - e questo è il punto che considero il più significativo di questa sezione: il nome del
tenant non deve comparire nella busta.** L'esempio di `06` §3.1 mostra `source` nella forma
`/tenants/tenant-dimostrativo/contexts/documentazione-clinica` e `tenantid` con lo stesso valore
parlante. Ora si legga `03-persistenza.md` §2.1: il nome dello schema usa un **ordinale opaco**, e
il motivo è dichiarato - «il nome è un dato personale nel momento in cui il tenant è uno studio
medico individuale, e i nomi degli schemi compaiono nei messaggi di errore, nei piani di esecuzione
e negli strumenti di amministrazione». Il ragionamento vale **a maggior ragione** per la busta, che
non resta nell'archivio: viaggia verso sistemi di terzi, si deposita nei registri diagnostici, nei
sistemi di sorveglianza, negli archivi di ritentativo e nella coda dei non consegnabili - cioè
nell'elenco esatto che `ADR-0011` cita come ragione della magrezza. Il progetto ha già deciso il
criterio in un luogo e non l'ha applicato nell'altro. **Nella busta, `source` e `tenantid` portano
l'identificativo opaco del tenant.** È una correzione a costo zero oggi e costosa dopo, perché
`tenantid` è un attributo del contratto pubblico e cambiarlo dopo il primo integratore è una
modifica non retrocompatibile.

Un'ultima verifica, sul confine con il tempo reale: nulla di ciò che propongo fa transitare per il
piano degli eventi le descrizioni di negoziazione, i candidati di rete, i campioni di misura o i
flussi. La tabella di `ADR-0012` resta valida parola per parola, e `EV-11` la presidia.

---

## 7. Effetto sui due assetti, e che cosa sparisce nell'assetto minimo

`08` §3.1 dichiara `[NV]` sui limiti effettivi delle garanzie del broker a nodo singolo e stabilisce
la regola: **nessun requisito funzionale può dipendere da garanzie non disponibili nell'assetto
minimo**. Questa analisi non può chiudere quell'`[NV]` - la misura spetta all'area tecnica e non si
inventa - ma può fare due cose utili: dire che cosa **sparisce con certezza** e che cosa **non
sparisce**, distinguendo ciò che dipende dalla replica da ciò che non vi dipende; e mostrare che,
adottando `AB-2`, l'`[NV]` **esce dal percorso critico** e resta un fatto da documentare invece che
una decisione da prendere.

| Garanzia | Assetto pieno | Nodo singolo | Natura |
|---|---|---|---|
| L'evento prodotto non si perde | Sì | **Sì**, ma per l'outbox, non per il broker | Poggia sull'archivio |
| Copie multiple del messaggio consegnato al canale | Sì | **No** | Dipende dalla replica: sparisce |
| Continuità del canale durante un aggiornamento del broker | Sì | **No**: interruzione per la durata | Dipende dalla replica: sparisce |
| Ordine di apposizione all'interno di una partizione | Sì, alle condizioni di §5.1 | **Sì**, alle stesse condizioni | Proprietà del giornale della partizione, non della replica |
| Rilettura della cronologia da parte di un nuovo consumatore | Sì | Sì, entro la conservazione configurata | Non dipende dalla replica |
| Semantica transazionale del produttore verso il canale | `[NV]` | `[NV]` | Da verificare, e da **non** usare in nessun caso |

Ne discendono quattro affermazioni.

**Prima - ciò che sparisce a nodo singolo è la durabilità del canale, non quella del sistema.**
`01_technical/01-stack-e-motivazioni.md` §10.3 lo dice già: la perdita del broker significa ritardo
nella consegna, non perdita di eventi, perché la sorgente di verità è l'outbox. È corretto, ed è la
proprietà che rende l'assetto minimo accettabile.

**Seconda - quella proprietà ha una condizione che nessun documento enuncia, e va enunciata.**
Se il relay ha già marcato una riga come pubblicata e il canale perde poi i propri dati, l'evento è
recuperabile **solo se la riga è ancora in outbox**. `03-persistenza.md` §7 dispone che le righe
pubblicate si potino, «restano il tempo necessario alla diagnosi - l'orizzonte è configurato».
L'orizzonte di potatura non è quindi un parametro di diagnosi: **è la finestra di ripristino da una
perdita di dati del canale**, ed è l'unico parametro che rende vera la frase «ritardo, non
perdita». Va dichiarato come parametro di durabilità, con un limite inferiore non inferiore alla
conservazione configurata sul canale nell'assetto a nodo singolo. È la decisione `AB-4`, e la
considero fra le più importanti di questo documento perché oggi un valore scelto per ragioni di
spazio disco romperebbe in silenzio una garanzia dichiarata altrove.

**Terza - la regola generale che chiude la questione.** Se nessuna garanzia dichiarata poggia sul
canale, l'invarianza fra assetti è soddisfatta **per costruzione** e non per misura: le uniche
differenze restano di latenza e di continuità, cioè dimensionali, cioè ammesse dalla matrice del §7
di `08`. Formulata così - decisione `AB-2` - è anche la formulazione che sopravvive a `TG-04`,
perché in `RU-1` il canale non c'è affatto e nessuna garanzia cade.

**Quarta - `RU-1` è un terzo assetto e va trattato come tale.** Senza broker: non esistono
partizioni, quindi la garanzia di ordine per chiave non ha luogo dove valere; non esiste rilettura
della cronologia; esiste un solo consumatore per tenant. Ne discende una conseguenza concreta e
non ovvia: **la coda dei messaggi non consegnabili non può essere un argomento del canale**, perché
il canale non c'è. Deve essere una struttura persistente **nello schema del tenant**, il che è
peraltro migliore su tre fronti già decisi - la conservazione è dichiarata e governata dalla
politica di conservazione del tenant; l'ispezionabilità dall'interfaccia applicativa è naturale; la
dismissione del tenant la porta con sé, esattamente come porta con sé l'outbox. Va deciso ora e non
al momento di `OL-18`, perché la reintroduzione del canale **non deve spostarla**: una coda dei non
consegnabili che cambia luogo quando si installa un componente è una migrazione di dati con valore
probatorio.

---

## 8. Le decisioni proposte

Ciascuna è formulata per diventare, senza riscritture, una voce di registro o un ADR. La colonna
«forma» dice quale delle due, e a chi è indirizzata.

| # | Decisione | Forma |
|---|---|---|
| **`AB-1`** | **Il sistema resta un monolite modulare** con due eseguibili propri - applicazione e servizio di segnalamento - più il componente di registrazione dove abilitato. La scomposizione dei contesti in servizi separati **non si adotta**. L'estrazione di un nuovo processo è ammessa solo per **ciclo di vita incompatibile** con quello dell'applicazione o per **regime di sicurezza o esposizione incompatibile**; **non** per scalabilità, che si ottiene replicando lo stesso eseguibile con profili di pool distinti. La frase «assetto distribuito per il servizio gestito» di `02` §7 va letta e riscritta come «assetto **replicato**» | **Nuovo ADR**, area ARCH |
| **`AB-2`** | **Nessuna garanzia dichiarata pubblicamente sugli eventi poggia sul canale.** Tutte poggiano sull'outbox. Ne discende che le differenze fra assetto pieno, nodo singolo e assetto senza canale di `RU-1` sono **di latenza e di continuità**, mai di garanzia, e l'invarianza del §1 di `08` è soddisfatta per costruzione | **Nuovo ADR**, area ARCH; chiude la dipendenza decisionale dall'`[NV]` di `08` §3.1 |
| **`AB-3`** | **La tabella di outbox sta nello schema del tenant e del contesto produttore**, come dispongono `ADR-0008` punto 1, `06` §2.3 e il criterio 5 di `T-08`. La collocazione nello schema comune `platform` descritta in `03-persistenza.md` §2.1 e §7 **è una contraddizione** e va corretta dall'area tecnica: nello schema comune l'outbox non segue la dismissione del tenant, non è coperta dalle politiche di riga dello schema del tenant e obbliga il relay a un'interrogazione unica che `05` §3.3 vieta | **Voce di registro**, indirizzata a TECH |
| **`AB-4`** | **L'orizzonte di potatura delle righe pubblicate è un parametro di durabilità**, non di diagnosi: è la finestra entro cui una perdita di dati del canale è rimediabile ripubblicando. Il suo limite inferiore non è inferiore alla conservazione configurata sul canale nell'assetto a nodo singolo, ed è dichiarato nel manuale di installazione | **Voce di registro**, ARCH con TECH |
| **`AB-5`** | **L'ordine per chiave di partizionamento è garantito solo sotto tre condizioni congiunte** - un solo lavoratore per volta detiene le righe di una data chiave, il produttore è idempotente e limita le richieste in volo verso la stessa destinazione, il numero di partizioni non cambia. Fuori da esse **non è garantito**, e va dichiarato tale. La riga di `06` §4.1 e il limite `L5` di `07` vanno riformulati di conseguenza | **Modifica a `ADR-0010`**, area ARCH |
| **`AB-6`** | **Il numero di sequenza per aggregato è denso**, cioè contiguo e senza salti, e la densità è dichiarata nel contratto pubblico. Una lacuna è pertanto **rilevabile dal ricevente** ed è un allarme, non un'attesa. Il produttore garantisce la densità e la prova; il ricevente segnala la lacuna | **Modifica a `ADR-0010`**, area ARCH, con INTEG per il contratto |
| **`AB-7`** | **La grandezza sorvegliata è l'età della più vecchia riga di outbox non in stato terminale, per tenant**, e non la profondità di una coda né un ritardo aggregato. La soglia resta a `B-6`, ma la **forma** del requisito è derivata: il tempo di accorgersi non può eccedere la finestra clinica già dichiarata per il fatto corrispondente - finestra di presa in carico per gli allarmi, ciclo di lavoro del professionista per l'alimentazione del sistema di origine | **Voce di registro**, ARCH; integra `08` §8 e alimenta `B-6` |
| **`AB-8`** | **La coda dei messaggi non consegnabili è una struttura persistente nello schema del tenant**, in tutti e tre gli assetti, e non un argomento del canale. La causa di fallimento conservata è un **codice del catalogo chiuso degli errori**; **nessun corpo di risposta di un sistema terzo è persistito verbatim**. La riesecuzione riusa lo stesso identificativo (`EV-9`) | **Nuovo ADR**, area ARCH |
| **`AB-9`** | **Nella busta, `source` e `tenantid` portano l'identificativo opaco del tenant**, mai il nome, per la stessa ragione per cui gli schemi usano un ordinale opaco (`03-persistenza.md` §2.1). **Nessun registro diagnostico contiene la busta integrale**: identificativo, sorgente, tipo, tenant opaco ed esito | **Voce di registro**, ARCH con SEC; **urgente**, perché `tenantid` è attributo del contratto pubblico |
| **`AB-10`** | **Il passaggio dell'allerta clinica da `CTX-07` a `CTX-08` non paga l'intervallo del relay**: è una chiamata sincrona al confine dei contesti, con l'evento emesso in aggiunta nella stessa transazione per la tracciabilità e per i consumatori esterni. `ADR-0008` non è toccato: nulla scrive sul canale fuori dall'outbox | **Nuovo ADR**, area ARCH; stessa struttura di `ADR-0012` |
| **`AB-11`** | **La notifica asincrona dell'archivio è ammessa solo come acceleratore** dell'interrogazione periodica, mai come sorgente. L'interrogazione resta il presidio e resta dimensionata come se la notifica non esistesse; il carico della notifica è **il solo identificativo opaco del tenant**, perché il canale di notifica non è soggetto alle politiche di riga; la latenza dichiarata nel contratto resta quella di caso peggiore | **Estensione di `ADR-0009`**, area ARCH; voce in `A-2` |
| **`AB-12`** | **L'outbox è l'eccezione dichiarata alla regola della coda limitata** di `07` §6.1: non applica contropressione al percorso clinico e non scarta mai un evento. In cambio: capacità di archiviazione dichiarata per una finestra di indisponibilità dichiarata, soglia di allarme molto anteriore all'esaurimento dello spazio, e degrado esclusivamente sul lato dei consumatori | **Voce di registro**, ARCH con TECH |
| **`AB-13`** | **`OL-18` acquisisce un secondo innesco**, accanto al primo tenant che chieda un secondo consumatore: **un'installazione destinata a un'infrastruttura soggetta al driver «architettura a eventi con event broker» del DM 21 settembre 2022, Allegato A**. `[NV]` sul contenuto operativo del Processo di Validazione di AGENAS: finché non è documentato, nessuna affermazione di conformità è sostenibile, e l'innesco resta condizionale | **Voce di registro**, indirizzata a ROAD e COMP |
| **`AB-14`** | **Ogni fatto di dominio dichiarato rilevante ha un tipo di evento associato, e la costruzione fallisce se non ce l'ha.** È il presidio contro l'unico difetto che l'outbox non elimina: il percorso applicativo che non scrive affatto l'evento. Posto accanto a `EV-7` | **Voce di registro**, ARCH; nuova verifica automatica |
| **`AB-15`** | **I tipi di evento sono classificati come clinicamente rilevanti o ordinari.** La classificazione governa tre comportamenti: la parcheggiatura genera allarme e non contatore; alla parcheggiatura di una riga seguono parcheggiate le righe successive della stessa chiave; la finestra di rilevazione è derivata dalla finestra clinica corrispondente | **Nuovo ADR** oppure attributo di `AB-8`, area ARCH con DOM |

---

## 9. Decisioni rinviate: quali si chiudono, quali restano

### 9.1 Che cosa questa analisi chiude

**La forma del sistema.** Non era formalmente una decisione rinviata, ed è peggio: era
un'ambiguità fra due capitoli, che è la condizione in cui una decisione si prende per errore
durante la realizzazione. `AB-1` la chiude, e con essa chiude l'unica lettura di
`02-contesti-delimitati.md` §7 che avrebbe autorizzato la scomposizione.

**La dipendenza decisionale dall'`[NV]` di `08` §3.1.** L'`[NV]` sulle garanzie del canale a nodo
singolo resta - la misura spetta all'area tecnica e questa analisi non la produce - ma con `AB-2`
**smette di essere bloccante**: nessuna decisione attende quel numero, perché nessuna garanzia
dichiarata vi poggia. Passa da questione aperta a fatto da documentare, che è la differenza fra un
rischio e una nota.

**La parte di `A-2` relativa alle alternative moderne.** La domanda «un meccanismo diverso di
lettura cambia il quadro?» ha risposta: no per la cattura delle modifiche, che resta dov'è con due
motivi in più contro; **parzialmente sì** per la notifica asincrona, che `ADR-0009` non aveva
considerato e che `AB-11` colloca come acceleratore. Resta aperta la sola parte quantitativa - la
soglia di volume - e con una correzione al criterio: **la grandezza che farà scattare la
rivalutazione è il numero di tenant, non il volume di eventi**, perché il carico di sola
sorveglianza è proporzionale ai tenant per effetto dell'iterazione esplicita.

**Il luogo della coda dei non consegnabili.** Non era posta come decisione ed è deciso ora
(`AB-8`), prima di `OL-18`, perché deciderla dopo significherebbe migrare dati con valore
probatorio.

### 9.2 Che cosa resta aperto, e che cosa questa analisi vi aggiunge

**`A-1` - meccanismo di realizzazione dell'orchestrazione.** Resta aperta, ed è dell'area
architetturale. Questa analisi la **restringe** con un argomento che il capitolo delle decisioni
rinviate non contiene: `ADR-0022` impone che ogni passo sia idempotente e che lo stato sia
persistito e interrogabile, e i passi orchestrati emettono eventi. Se lo stato del processo vivesse
in un motore dedicato con un proprio archivio, **l'avanzamento del processo e la scrittura
dell'evento non starebbero nella stessa transazione**, e si ricreerebbe la doppia scrittura che
`ADR-0008` ha eliminato - questa volta fra l'orchestratore e l'outbox. La macchina a stati
persistita nella stessa base dati non ha quel problema per costruzione. Non chiudo la decisione,
che non è mia da chiudere in un'analisi, ma segnalo che il criterio dichiarato in `A-1` - il peso
sull'installazione presso il cliente ha precedenza - **non è l'unico argomento a favore della stessa
opzione**, e il secondo è più forte del primo.

**`A-2` - soglia di volume.** Resta aperta, con il criterio corretto di §9.1.

**`B-6` - soglie di sorveglianza.** Resta all'area di sicurezza e alla roadmap. `AB-7` non la
chiude: le consegna la **forma** del requisito e la grandezza giusta da misurare, che è ciò che
quest'area può fissare senza invadere.

**`B-4` - registro unico della fiducia.** Non è toccata da questa analisi, ma va segnalato il
legame: le destinazioni ammesse per i messaggi in uscita stanno in quel registro, e gli
interruttori per tenant e per destinazione di `06` §5.3 vi si appoggiano. Un registro che diverge
produce una destinazione disattivata in un luogo e attiva in un altro.

**`C-4` - periodo di supporto dichiarato.** Legame diretto e non ovvio: determina per quanto tempo
due versioni di un tipo di evento devono essere emesse in parallelo (`06` §3.4), e quindi per
quanto tempo il produttore deve saper costruire la vecchia forma dal nuovo stato. È un impegno di
manutenzione ricorrente che va sottratto alla capacità prima di essere assunto.

### 9.3 Tensioni dichiarate

**Tensione 1 - due documenti collocano l'outbox in due luoghi diversi.** `ADR-0008`, `06` §2.3 e il
criterio 5 di `T-08` dicono schema del tenant e del contesto; `03-persistenza.md` §2.1 e §7 dicono
schema comune. Non è una sfumatura: cambia la dismissione del tenant, la copertura delle politiche
di riga e la forma dell'interrogazione del relay. `AB-3` propone la risoluzione, che non è
arbitraria - prevale l'ADR - ma la correzione del capitolo tecnico **appartiene all'area tecnica**
e questa analisi non la esegue.

**Tensione 2 - una garanzia dichiarata che la realizzazione non produce.** `06` §4.1 e `L5`
dichiarano l'ordine per chiave senza condizioni; il prelievo parallelo con salto delle righe
bloccate non lo produce. È il tipo di scostamento che, non corretto, diventa un difetto di
integrazione intermittente presso un terzo. `AB-5`.

**Tensione 3 - il taglio del broker e un driver normativo che nomina l'event broker.** `TG-04` è
una decisione di ambito presa bene e con motivi solidi; il DM 21 settembre 2022 nomina l'event
broker fra i requisiti tecnologici delle infrastrutture regionali. Le due cose non si contraddicono
finché il prodotto non è candidato a operare come componente di una di quelle infrastrutture. La
tensione non si smussa: si dichiara, e si presidia con `AB-13`.

**Tensione 4 - un percorso non sacrificabile che attraversa un meccanismo con latenza dichiarata.**
L'emissione e il recapito delle allerte cliniche sono nella prima riga del degrado, quella non
negoziabile; il piano degli eventi ha una latenza dichiarata e ritentativi. `AB-10` la risolve
dentro l'eseguibile unico, e la risoluzione **non sarebbe disponibile** in un sistema scomposto.

**Tensione 5 - due regole opposte sulla stessa struttura.** Coda limitata con rifiuto dichiarato
contro outbox illimitata e mai rifiutata. `AB-12` la dichiara come eccezione governata, invece di
lasciare che si risolva da sola nel modo peggiore, cioè con lo spazio esaurito.

**Tensione 6 - la riconciliazione vorrebbe leggere il registro immutabile.** Sarebbe la sorgente
indipendente ideale per verificare in positivo che a ogni fatto corrisponda un esito di consegna.
`CTX-12` lo vieta: il registro «non è mai letto da un percorso applicativo per prendere una
decisione», e la restrizione è deliberata. La proposta di §5.4 si tiene quindi **dentro l'outbox** -
ogni riga raggiunge uno stato terminale - accettando il limite che ne discende: la verifica copre
gli eventi scritti, non quelli mai scritti, ed è `AB-14` a coprire i secondi, in costruzione e non
in esercizio.

**Tensione 7 - il costo di tutto questo sotto `D54` e `D62`.** Quindici decisioni non sono gratis,
e non dichiararlo sarebbe smussare. Di esse, cinque sono **scritture** che costano ore di redazione
e nessuna ora di realizzazione (`AB-1`, `AB-2`, `AB-3`, `AB-12`, `AB-13`); quattro sono **vincoli
su codice che non è ancora scritto**, e quindi costano solo se decise tardi (`AB-4`, `AB-8`,
`AB-9`, `AB-11`); tre aggiungono **lavoro reale** e vanno pesate contro la capacità netta
(`AB-6` la densità e la sua prova, `AB-7` la grandezza per tenant e la sua esposizione, `AB-14` la
verifica di costruzione); due sono **riformulazioni di enunciati esistenti** (`AB-5`, `AB-15`).
`AB-9` va decisa **prima** delle altre e per una ragione che non ha a che vedere con lo sforzo:
`tenantid` è attributo del contratto pubblico, e cambiarlo dopo il primo integratore è una modifica
non retrocompatibile con preavviso di dismissione.

### 9.4 Punti `[NV]` di questa analisi

| Riferimento | Che cosa non è verificato | A chi va chiesto |
|---|---|---|
| §7 | Garanzie effettive del canale nell'assetto a nodo singolo, e in particolare se una semantica transazionale del produttore sia disponibile e a quali condizioni | Area tecnica. Con `AB-2` la verifica resta necessaria per la documentazione e **non blocca** alcuna decisione |
| §4.2 | Comportamento e limiti del meccanismo di notifica asincrona dell'archivio adottato: dimensione ammessa del carico, comportamento in assenza di ascoltatori, costo di un canale unico con centinaia di tenant | Area tecnica, con misura su dati sintetici |
| §5.1 | Effetto dell'aumento del numero di partizioni sull'ordine per aggregato durante il riassestamento. Già `[NV]` in `ADR-0010` e in `06` §4.2, qui confermato | Area tecnica, **prima** di qualunque ridimensionamento |
| §5.2 | Finestra di conservazione delle chiavi di deduplicazione. Già `[NV]`; questa analisi ne corregge il limite inferiore, che va commisurato alla conservazione della coda dei non consegnabili e non alla sola finestra di ritentativo | Area tecnica |
| §3.4 | Contenuto operativo del Processo di Validazione previsto dal DM 19 novembre 2025, art. 3, comma 4: criteri, durata, artefatti richiesti, e se vi rientrino i driver tecnologici del DM 21 settembre 2022 | Area di conformità, con richiesta diretta ad AGENAS. Già `[NV]` in `10 §02` §6.2 |
| §3.1 | Se, nell'installazione presso il cliente, il servizio di segnalamento sia un processo distinto dall'applicazione o coincida con essa. `08` §2.1 lo elenca come componente proprio, la matrice del §7 dice «processo unico» senza chiarire rispetto a che cosa | Area ARCH, in sede di `AB-1`. La posizione argomentata di questa analisi è **processo distinto in entrambi gli assetti**, per il requisito di drenaggio graduale di `ADR-0012` |
| §5.4 | Le finestre cliniche da cui derivare il tempo di rilevazione per ciascun tipo di evento clinicamente rilevante | Area di dominio e area funzionale, per `AB-15` |

---

## 10. In una pagina

Il sistema **non è** scomposto in servizi, e non deve esserlo: due eseguibili propri, tredici
contesti dentro il primo, un criterio chiuso di estrazione che ammette solo il ciclo di vita e il
regime di esposizione, mai la scalabilità. La messaggistica verso l'archivio **resta come decisa** -
outbox transazionale, lettura per interrogazione periodica - e i motivi nuovi la rafforzano: la
cattura delle modifiche eluderebbe la seconda barriera di isolamento e dipenderebbe dal ciclo di
vita del tenant; la notifica asincrona è ammessa come acceleratore e mai come sorgente. Le garanzie
di consegna sono già decise bene, con **una** eccezione da correggere: l'ordine per chiave è
dichiarato senza condizioni e la realizzazione non lo produce.

Ciò che questa analisi aggiunge sta quasi tutto sul lato dell'assenza, ed è la parte che merita di
sopravvivere alla lettura: la grandezza giusta da sorvegliare non è la profondità di una coda ma
**l'età della più vecchia riga non terminale, per tenant**; il numero di sequenza per aggregato va
dichiarato **denso**, perché protegge dal riordino e non dalla perdita finché una lacuna non è
rilevabile; e nessun presidio di esercizio intercetta l'evento **mai scritto**, che è un difetto di
costruzione e va fermato in costruzione. Sul lato della riservatezza, il nome del tenant non deve
comparire nella busta: il progetto ha già deciso il criterio per i nomi degli schemi e non l'ha
applicato all'unico oggetto che esce davvero dal perimetro.
