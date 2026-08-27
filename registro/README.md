# Registro degli identificativi di requisito

## Che cos'è

Questo registro risponde ai criteri 3 e 4 del traguardo `T-01` della roadmap
(`docs/09_roadmap/02-traguardi.md`). Il criterio 3 chiede l'esistenza di un registro degli
identificativi di requisito - le otto famiglie `RF-*`, `RNF-*`, `BR-*`, `ATT-*`, `UC-*`, `OUT-*`,
`EX-*`, `DM-*` - in sola aggiunta, con lo stato di ciascun identificativo e il divieto esplicito di
riuso di un identificativo ritirato. Il criterio 4 chiede che il registro sia leggibile da
macchina con un formato dichiarato, perché il controllo di costruzione del criterio 5 dello stesso
traguardo vi si appoggia: quel controllo fa fallire la costruzione quando una prova cita un
identificativo assente da qui.

Il file dati è `identificativi-requisiti.tsv`, in questa stessa cartella. Questo documento ne
descrive il formato, la regola di sola aggiunta, il calcolo dello stato, il divieto di riuso, ciò
che il registro non è, e i difetti trovati durante la sua prima popolazione, avvenuta il 26 agosto
2026.

## Perché un giornale di eventi e non una tabella di stati

Il registro non elenca «l'identificativo X è in vigore»: elenca ogni evento che riguarda un
identificativo, nell'ordine in cui è stato registrato. È una scelta obbligata, non stilistica. Il
criterio 3 impone la sola aggiunta, e una tabella con una colonna «stato» richiederebbe di
*modificare* la riga esistente ogni volta che un identificativo viene ritirato - il che è
precisamente ciò che la sola aggiunta vieta. È anche la forma che il progetto usa altrove nel
proprio dominio per lo stesso problema: la vista `V-121` sull'allarme stabilisce che «l'allarme è
una sequenza di eventi immutabili; lo stato è una proiezione», e questo registro applica lo stesso
principio ai propri identificativi.

## Il formato

`identificativi-requisiti.tsv` è un file di testo separato da carattere TAB (`\t`), con codifica
UTF-8. Le righe che iniziano con `#` sono commenti - compreso il blocco di intestazione che apre il
file, che dichiara il formato in forma leggibile anche senza questo documento - e un lettore
automatico le deve ignorare. Segue la riga di intestazione con i nomi delle colonne, e poi una riga
per evento. Le colonne, in quest'ordine esatto, sono:

| Colonna | Contenuto |
|---|---|
| `data` | data dell'evento, in formato ISO `AAAA-MM-GG` |
| `identificativo` | la forma esatta dell'identificativo così come appare nel corpus di `docs/`, senza normalizzazione della larghezza dei numeri |
| `evento` | uno fra due soli valori ammessi: `introdotto` oppure `ritirato` |
| `fonte` | percorso del file, relativo alla radice del repository, in cui l'identificativo è **definito**; quando la definizione non è individuabile nel corpus attuale, il file con più occorrenze, con la circostanza dichiarata nella colonna `nota` (vedi § Difetti) |
| `nota` | testo libero, può essere vuoto; non contiene mai un carattere TAB, perché romperebbe l'allineamento delle colonne |

Le righe sono ordinate per famiglia (in ordine alfabetico del prefisso) e poi per valore numerico
dell'identificativo, per restare leggibili anche a occhio; l'ordine non ha alcun significato
temporale - quello lo dà solo la colonna `data`, e in caso di parità solo l'ordine fisico delle
righe nel file, che uno script di verifica può usare come ordine di applicazione degli eventi.

## La grammatica degli identificativi, per famiglia

Le otto famiglie **non condividono tutte la stessa grammatica**, ed è una circostanza che chi
scriverà il controllo di costruzione del criterio 5 di `T-01` deve conoscere prima di scrivere
un'unica espressione regolare, non dopo che quella espressione avrà ignorato in silenzio una
famiglia intera - è esattamente quello che è successo nella prima stesura di questo stesso
registro con `EX-*` (vedi § Difetti). La tabella descrive la forma osservata nel corpus attuale,
non una forma prescritta altrove: dove il corpus mostra eccezioni, sono elencate come tali, non
assorbite nella regola.

| Famiglia | Forma | Esempio | Larghezza del numero o del codice | Eccezioni osservate |
|---|---|---|---|---|
| `RF-*` | `RF-` + numero progressivo | `RF-230` | 3 cifre, con lo zero iniziale | `RF-0142`, a 4 cifre - caso dubbio, vedi § Difetti |
| `RNF-*` | `RNF-` + numero progressivo | `RNF-090` | 3 cifre, con lo zero iniziale | `RNF-0031`, a 4 cifre - caso dubbio, vedi § Difetti |
| `BR-*` | `BR-` + numero progressivo | `BR-100` | 3 cifre, con lo zero iniziale | nessuna |
| `ATT-*` | `ATT-` + numero progressivo | `ATT-20` | 2 cifre, con lo zero iniziale | nessuna |
| `UC-*` | `UC-` + numero progressivo | `UC-13` | 2 cifre, con lo zero iniziale | nessuna |
| `OUT-*` | `OUT-` + numero progressivo | `OUT-08` | 2 cifre, con lo zero iniziale | nessuna |
| `DM-*` | `DM-` + numero progressivo | `DM-06`, `DM-100` | 2 cifre da `01` a `99`, poi 3 cifre da `100` in avanti - normale attraversamento della soglia, non un'incoerenza | nessuna |
| `EX-*` | `EX-` + codice mnemonico maiuscolo, oppure `EX-TM-` + codice mnemonico maiuscolo per il telemonitoraggio | `EX-NOSHOW`, `EX-TM-ESCFAIL` | variabile, lettere maiuscole e trattini, **mai un numero progressivo** | `EX-ABUSE`, citato ma privo di definizione - caso dubbio, vedi § Difetti |

In termini di espressione regolare indicativa (da adattare, non da copiare senza verifica): le
prime sette famiglie rispondono tutte a `^PREFISSO-[0-9]{2,3}$` con il prefisso e la larghezza
propri di ciascuna; `EX-*` risponde invece a `^EX-(TM-)?[A-Z][A-Z]*(-[A-Z]+)*$`, senza cifre. Un
controllo che applichi la prima forma a `EX-*` non troverebbe mai una corrispondenza e tratterebbe
ogni citazione di un esito tipizzato come un identificativo assente dal registro - un falso
negativo pericoloso proprio perché sistematico, non occasionale.

## La regola di sola aggiunta

Una riga scritta nel registro non si modifica e non si cancella mai, per nessun motivo, nemmeno
per correggere un errore di trascrizione: un errore si corregge aggiungendo un nuovo evento che lo
dichiara, non alterando la riga difettosa. L'unica operazione ammessa sul file è l'aggiunta di
nuove righe in coda a quelle esistenti, ciascuna con la data dell'evento che rappresenta. Un
identificativo che compare più volte nel file non è un'anomalia: è la sua storia. Un identificativo
introdotto una sola volta e mai ritirato ha una sola riga; un identificativo ritirato ne ha almeno
due, nell'ordine `introdotto` poi `ritirato`.

## Come si calcola lo stato

Lo stato di un identificativo non è memorizzato: si calcola. Si prendono tutte le righe che
condividono lo stesso valore di `identificativo`, si ordinano per `data` e, a parità di data, per
ordine di comparizione nel file, e si guarda l'ultimo evento della sequenza. Se l'ultimo evento è
`introdotto`, l'identificativo è **in vigore**. Se l'ultimo evento è `ritirato`, l'identificativo è
**ritirato**. Un identificativo che non compare affatto nel registro non è né in vigore né
ritirato: è assente, e - per il controllo di costruzione del criterio 5 di `T-01` - citarlo in una
prova è un errore che deve far fallire la costruzione.

## Il divieto di riuso

Un identificativo ritirato non torna mai disponibile per designare un requisito diverso. Nella
sequenza di eventi di un identificativo, dopo un `ritirato` non può comparire un secondo
`introdotto`: sarebbe un secondo requisito che si maschera dietro l'identificativo di un altro, e
renderebbe inservibile ogni prova, ogni matrice di tracciabilità e ogni verifica retrospettiva
costruita su quell'identificativo. Il controllo di costruzione promesso dal criterio 5 di `T-01`
rifiuta questa sequenza; questo registro ne è il presupposto. Il controllo esiste in
`scripts/verifica-identificativi-requisiti.sh`, che emette il rilievo `riuso vietato - <id>
reintrodotto dopo essere stato ritirato` quando la sequenza è violata, e **il divieto è verificato
automaticamente** come parte della fase 2 di quel controllo. Finché `V-182` vieta il codice
applicativo, l'insieme dei riusi vietati rimane vuoto per costruzione.

## Che cosa il registro non è

Il registro non è il catalogo dei requisiti. Non dice che cosa un requisito richiede, chi lo ha
scritto con quale motivazione, quale priorità ha o quale criterio di accettazione lo verifica: tutto
questo sta in `docs/03_functional/` (in particolare in `02-catalogo-dei-requisiti.md` per `RF-*` e
`RNF-*`, in `04-regole-di-business.md` per `BR-*`, in `01-attori-e-ruoli.md` per `ATT-*`, in
`03-casi-d-uso.md` per `UC-*` e per i diciassette esiti `EX-TM-*` del telemonitoraggio, in
`07-fuori-perimetro.md` per `OUT-*`) e nei documenti dell'area di dominio in `docs/05_domain/` per
`DM-*` e per i dodici esiti `EX-*` della prestazione sincrona (`02-le-prestazioni-modellate.md`).
Il registro è solo l'anagrafe degli identificativi: dice
quali esistono, da quando (nel senso della data di registrazione, non necessariamente della data di
prima assegnazione - vedi il difetto corrispondente più sotto), e se sono in vigore o ritirati.
Un identificativo presente nel registro non garantisce che il requisito corrispondente sia ben
formato o completo: garantisce solo che l'identificativo è tracciato e non riusabile.

## Difetti trovati durante la popolazione

Questa prima popolazione (26 agosto 2026) ha raccolto 614 identificativi distinti cercando nel
corpus di `docs/` - esclusa la traduzione inglese in `website/i18n/en/`, che userebbe gli stessi
identificativi e li conterebbe due volte, ed esclusa `.telemedic/`, materiale di lavoro interno.
Tutti gli eventi registrati in questo primo popolamento sono `introdotto`, con data `2026-08-26`:
è la data di istituzione del registro, non la data reale in cui ciascun identificativo fu
assegnato per la prima volta, che per la maggior parte di essi non è ricostruibile dal corpus
attuale (vedi sotto). Il conteggio per famiglia è: `RF` 214, `RNF` 70, `BR` 141, `ATT` 26, `UC` 24,
`OUT` 24, `EX` 30, `DM` 85. Il conteggio di `EX` è stato rivisto rispetto alla prima stesura di
questo registro, che lo dichiarava erroneamente vuoto: vedi il paragrafo che segue.

**`EX-*` esiste, con una grammatica diversa dalle altre sette famiglie - corretto rispetto alla
prima stesura di questo registro.** Una prima ricerca, ristretta al pattern numerico `EX-nnn` che
le altre sette famiglie usano, non aveva trovato occorrenze e questo registro dichiarava la
famiglia vuota. È un errore di metodo, non un fatto: il criterio 3 di `T-01` chiede la famiglia
`EX-*`, cioè un *prefisso*, non prescrive una grammatica numerica progressiva. Il corpus contiene
30 identificativi con quel prefisso, i codici di **esito tipizzato** che i casi d'uso e i flussi di
allarme citano per dire come si è concluso un atto o un evento di sorveglianza. Sono di due
sottogruppi, entrambi definiti per esteso in tabella, nessuno dei due nella forma `EX-nnn`:

- **dodici codici per la prestazione sincrona** - `EX-COMPLETE`, `EX-NOSHOW`, `EX-TECH-PATIENT`,
  `EX-TECH-DROP`, `EX-TECH-FAIL`, `EX-QOS`, `EX-CLIN-STOP`, `EX-ESCALATE`, `EX-EMERGENCY`,
  `EX-IDENT-FAIL`, `EX-CAPACITY`, `EX-THIRD-PARTY` - definiti nella tabella «Codice esito» di
  `docs/05_domain/02-le-prestazioni-modellate.md`;
- **diciassette codici per il telemonitoraggio**, tutti con il segmento `TM` dopo il prefisso -
  `EX-TM-NOSIGNAL`, `EX-TM-DEVICE`, `EX-TM-LINK`, `EX-TM-INGEST`, `EX-TM-USEERR`,
  `EX-TM-DECLARED`, `EX-TM-ADMIN`, `EX-TM-UNEXPLAINED`, `EX-TM-DROPOUT`, `EX-TM-IMPLAUS`,
  `EX-TM-LATE`, `EX-TM-CORRECTED`, `EX-TM-OUTOFHOURS`, `EX-TM-NOACK`, `EX-TM-ESCFAIL`,
  `EX-TM-EXIT`, `EX-TM-PLANSTALE` - definiti nella tabella «Codice» di
  `docs/03_functional/03-casi-d-uso.md`.

La conseguenza pratica, per chi scriverà il controllo di costruzione del criterio 5 di `T-01`: **non
si può usare una sola espressione regolare per tutte e otto le famiglie**. Le altre sette hanno
tutte la forma `PREFISSO-nnn`, un prefisso seguito da un numero progressivo a larghezza fissa
all'interno di ciascuna (con le eccezioni già segnalate più sotto). `EX-*` no: è
`EX-CODICE-MNEMONICO` oppure `EX-TM-CODICE-MNEMONICO`, un prefisso seguito da un codice alfabetico
leggibile, di lunghezza variabile. Un controllo scritto assumendo una grammatica unica per le otto
famiglie fallirebbe silenziosamente su `EX-*`, o peggio la ignorerebbe senza errore. La sezione
«Grammatica degli identificativi» più sotto formalizza la forma di ciascuna famiglia proprio per
questo.

**Un falso positivo escluso: `EX-TM` come prefisso generico, non come identificativo.** La stringa
`EX-TM`, da sola, compare due volte nel corpus (`docs/03_functional/00-indice.md` e
`docs/03_functional/02-catalogo-dei-requisiti.md`), in entrambi i casi dentro la notazione
`EX-TM-*` - l'asterisco indica «l'intera famiglia dei codici che iniziano per `EX-TM-`», non un
identificativo specifico. Una ricerca con confine di parola cattura `EX-TM` isolato, perché
l'asterisco che segue non fa parte della parola, ed è un falso positivo esattamente della stessa
specie di `RF-353` (§ successivo): un riferimento alla categoria, non un evento di introduzione.
Escluso dal registro per lo stesso motivo. Non sono stati trovati altri prefissi generici della
stessa specie per le altre famiglie.

**Un identificativo citato ma non definito: `EX-ABUSE`.** L'elenco dei «codici di esito già
congelati» della prestazione sincrona, in `docs/03_functional/03-casi-d-uso.md`, cita dodici
codici includendo `EX-ABUSE`; ma la tabella che li definisce per esteso, in
`docs/05_domain/02-le-prestazioni-modellate.md`, ne elenca dodici anch'essa, con `EX-COMPLETE` al
posto di `EX-ABUSE`. `EX-ABUSE` non ha quindi, in nessun punto del corpus, una riga di definizione
propria: compare **solo** in quell'unico elenco. È stato incluso nel registro - perché la stringa
esiste testualmente ed è presentata come un identificativo reale, non come un esempio o un
riferimento a una categoria - con `fonte` uguale al solo file in cui compare e una nota di difetto
che dichiara l'assenza di definizione. Non è stato deciso se sia un tredicesimo codice sincrono
la cui riga di tabella manca, o un refuso per uno degli altri undici (il candidato più prossimo per
significato, «terzo non previsto o non autorizzato», sarebbe `EX-THIRD-PARTY`, ma è
un'illazione, non una verifica, e per questo non è stata usata per correggere la voce).

**Nessun identificativo `EX-*` isolato dentro un esempio puramente didattico**, del genere trovato
per `RF-042`: tutte le occorrenze di `EX-TM-*` nei diagrammi di
`docs/03_functional/05-gestione-degli-allarmi.md` (un flowchart e un diagramma di sequenza)
illustrano il comportamento reale del progetto - la stessa catena di allarme descritta nel testo
circostante e nella tabella di `03-casi-d-uso.md` - e non un caso di scuola generico affiancato a
identificativi di fantasia. Nessuna nota di dubbio è stata quindi necessaria per queste occorrenze.

**Due identificativi a quattro cifre isolati, dentro un unico esempio di codice dichiarato
illustrativo.** `RF-0142` e `RNF-0031` compaiono, identici, in due file (`docs/10_fondamenti/17-
ambiente-di-sviluppo.md` e `docs/01_technical/08-qualita-e-test.md`) dentro un blocco di codice
Java preceduto dal commento `// Illustrativo.`, come esempio della sintassi dell'annotazione
`@Requisito`. La larghezza a quattro cifre non ha riscontro in nessun'altra parte del corpus: esiste
un `RF-142` reale, a tre cifre, citato altrove come identificativo genuino (per esempio in
`docs/05_domain/06-consenso-e-riservatezza.md` e in `docs/09_roadmap/01-principi-e-metodo.md`), ma
non esiste alcun `RNF-031` a tre cifre corrispondente. Per la regola dichiarata nel mandato di
questo lavoro - forme diverse sono identificativi diversi, e vanno segnalate come difetto, non
fuse - sono stati registrati come voci proprie, distinte da `RF-142`, con una nota che spiega il
dubbio: potrebbe trattarsi di un refuso nell'esempio (un secondo zero digitato per errore) oppure di
un valore scelto liberamente perché l'esempio non doveva riferirsi a un requisito reale. Non è stato
deciso quale delle due ipotesi sia corretta: lo segnala il registro, non lo risolve.

**Un identificativo isolato dentro un diagramma generico.** `RF-042` compare una sola volta in tutto
il corpus, dentro un diagramma Mermaid puramente didattico su che cos'è la tracciabilità secondo IEC
62304, in `docs/10_fondamenti/15-regolatorio-da-zero.md`. Nello stesso diagramma compaiono
`SRS-118` e `RM-017`, identificativi di fantasia che non appartengono a nessuna delle otto famiglie
di questo registro e che non sono quindi in discussione qui. `RF-042` invece **ha** la forma di un
identificativo reale della famiglia `RF-*`, e cade nell'intervallo congelato nella fase di ricerca
(`RF-001` … `RF-223`), ma il contenuto del blocco a cui appartiene per numerazione (5.C, agende e
slot) non ha alcun rapporto con l'esempio in cui compare. È stato incluso nel registro, perché la
stringa esiste testualmente nel corpus, con una nota che dichiara il dubbio: potrebbe essere un
riferimento reale usato come comodo esempio, oppure un numero scelto senza intenzione di
riferimento. Non è stato deciso quale delle due ipotesi sia corretta.

**Un caso di falso positivo risolto, non registrato.** Il paragrafo «Governo degli identificativi»
di `docs/03_functional/02-catalogo-dei-requisiti.md` dichiara esplicitamente **liberi** e non ancora
assegnati gli identificativi `RF-353`, `RNF-111` e `BR-186` («restano liberi e vanno richiesti in
bacheca prima dell'uso: `RF-353` e successivi, `RNF-111` e successivi, `BR-186` e successivi»). La
ricerca automatica per pattern li avrebbe intercettati come identificativi presenti nel corpus, ma
non sono mai stati assegnati a un requisito: sono la dichiarazione del **prossimo numero
disponibile**, non un evento di introduzione. Per questo motivo **non sono stati inseriti nel
registro**: inserirli avrebbe significato affermare che un requisito con quell'identificativo
esiste, il che è esattamente il contrario di ciò che la fonte dice. È il tipo di falso positivo per
cui il mandato di questo lavoro chiedeva un confine di parola e una verifica a campione; qui la
verifica ha trovato, nel testo immediatamente circostante, un segnale esplicito e non ambiguo
(«restano liberi») che ha permesso di risolvere il caso invece di lasciarlo dubbio.

**La maggioranza degli identificativi non ha una definizione individuabile in `docs/`.** Il
progetto dichiara, in `docs/03_functional/00-indice.md` e nei file di catalogo delle singole
famiglie, che gli intervalli `RF-001` … `RF-223`, `RNF-001` … `RNF-083`, `BR-001` … `BR-096` e
`ATT-01` … `ATT-19` furono assegnati in una fase di ricerca precedente e **restano in vigore senza
essere riscritti** nell'area funzionale attuale: il testo che li definiva per intero - enunciato,
criterio di accettazione, attore, priorità - non è presente nel corpus di `docs/` che questo lavoro
poteva percorrere. Per 106 identificativi `RF-*` e 52 identificativi `RNF-*` (oltre alle 64 `BR-*`
al netto delle due eccezioni descritte sotto) non è stato quindi possibile individuare un file di
definizione: la colonna `fonte` riporta, per ciascuno di essi, il file del corpus in cui
l'identificativo compare più volte come citazione, con una nota che dichiara esplicitamente
l'assenza di una definizione individuabile. In 61 di questi casi il conteggio delle occorrenze è
risultato in parità fra due o più file: la scelta è caduta, in modo deterministico e dichiarato
nella nota di ciascuna riga, sul primo file in ordine alfabetico del percorso. È una convenzione di
lavoro, non un giudizio su quale file «meriti» di essere la fonte: chi possiede il catalogo dei
requisiti può correggere singolarmente queste righe aggiungendo l'evento più preciso, quando la
definizione originaria della fase di ricerca sarà eventualmente recuperata o ricostruita altrove.

Due identificativi di questo stesso gruppo, `BR-010` e `BR-096`, fanno eccezione parziale:
`docs/03_functional/04-regole-di-business.md` li richiama per esteso in un paragrafo che ne
riassume il contenuto («i cardini di tutto ciò che segue»), pur senza la forma tabellare completa
usata per `BR-100` … `BR-185`. Per questi due la colonna `fonte` punta a quel file, con una nota che
distingue il richiamo testuale da una definizione integrale.

**Sulla forma degli identificativi.** A parte i due casi di larghezza numerica descritti sopra
(`RF-0142`, `RNF-0031`), nessun'altra incoerenza di forma è stata trovata: ogni famiglia usa una
larghezza costante per tutti i propri identificativi (due cifre per `ATT-*`, `UC-*` e `OUT-*`, tre
cifre per `RF-*`, `RNF-*` e `BR-*`, con l'eccezione dei due casi segnalati; la doppia larghezza a due
e tre cifre di `DM-*` - da `DM-01` a `DM-99` e poi `DM-100` - è la normale conseguenza
dell'attraversamento della soglia delle cento unità, non un'incoerenza).

**File in cui non è stato possibile individuare la definizione.** Oltre ai casi di intervallo
congelato già descritti, non esiste in `docs/` alcun file che definisca per esteso i blocchi
`PRM-*`, `BC-01` … `BC-13` e `KPI-01` … `KPI-18` menzionati come congelati insieme a `RF-*`, `RNF-*`,
`BR-*` e `ATT-*` in `docs/03_functional/00-indice.md`: questo registro non li include perché non
appartengono alle otto famiglie elencate dal criterio 3 di `T-01`, ma la circostanza è annotata qui
perché chi legge questo registro per capire lo stato completo degli identificativi del progetto deve
sapere che esistono famiglie di identificativi **fuori dal perimetro di questo registro**, non solo
quelle otto.

# Gli altri registri di questa cartella

La cartella `registro/` non contiene un solo registro. Tutto ciò che precede riguarda
`identificativi-requisiti.tsv`; ciò che segue documenta gli altri file di dati, uno per sezione.
La convenzione comune è sempre la stessa e non si ridiscute file per file: testo separato da
carattere TAB, codifica UTF-8, righe di commento che iniziano con `#` e che un lettore automatico
deve ignorare, poi la riga di intestazione delle colonne e infine una riga per voce. Nessuna cella
contiene un carattere TAB, perché romperebbe l'allineamento delle colonne. Il blocco di commento in
testa a ciascun file dichiara il proprio formato in forma leggibile anche senza questo documento:
è deliberato, perché un file di dati che dipende da un documento esterno per essere interpretato
diventa illeggibile nel momento in cui i due si separano.

## `organismi-notificati.tsv` - il registro degli invii agli organismi notificati

**Che cos'è.** Risponde al terzo criterio del traguardo `T-14` della roadmap
(`docs/09_roadmap/02-traguardi.md`), che chiede l'invio della richiesta di informazioni a ciascun
organismo notificato designato per la categoria di dispositivo pertinente, **con data e testo
versionato**. Il criterio si dimostra con tre cose che devono coesistere: il testo della richiesta,
la ricognizione degli organismi designati con la fonte e la data di consultazione, e questo
registro. Le prime due stanno nel capitolo
`docs/08_compliance/11-richiesta-agli-organismi-notificati.md` e nel suo gemello inglese; qui sta
la terza.

**Le colonne, in quest'ordine esatto.**

| Colonna | Contenuto |
|---|---|
| `data_invio` | Data **effettiva** di invio, in formato ISO `AAAA-MM-GG` |
| `organismo` | Denominazione dell'organismo come pubblicata nell'elenco ufficiale |
| `numero` | Numero di identificazione dell'organismo, come pubblicato |
| `paese` | Paese di stabilimento, come pubblicato |
| `codice_designazione` | Codice o codici in base ai quali l'organismo è stato incluso fra i destinatari; vale `NV` finché il codice pertinente non è determinato |
| `canale` | Come la lettera è partita: modulo pubblicato dall'organismo, recapito istituzionale di posta elettronica, posta elettronica certificata, altro dichiarato |
| `recapito` | Recapito **istituzionale** effettivamente usato, come pubblicato dall'organismo |
| `revisione_del_testo` | Versione del testo della richiesta effettivamente spedita |
| `lingua` | `it` oppure `en`, secondo quale dei due testi è stato spedito |
| `nota` | Testo libero, può essere vuoto; non contiene mai un carattere TAB |

**Perché una tabella di righe e non un giornale di eventi.** È la differenza con
`identificativi-requisiti.tsv`, ed è deliberata. Quel registro deve essere in sola aggiunta perché
il criterio 3 di `T-01` lo impone e perché lo stato di un identificativo è una proiezione di eventi.
Qui l'oggetto è diverso: una lettera parte una volta sola, verso un destinatario individuato una
volta sola, e la riga registra un fatto compiuto invece di uno stato che evolve. Una risposta
ricevuta, un sollecito, un secondo invio a una revisione successiva del testo sono **nuove righe**,
distinte dalla prima e con la propria data: non modifiche della riga esistente. In questo senso la
regola di sola aggiunta vale anche qui, e vale per la ragione più semplice, cioè che una data
riscritta non è più una registrazione.

**Le quattro regole che il file dichiara in testa, e che qui si ripetono perché sono la sostanza.**

La prima: **`data_invio` è la data effettiva, mai una data programmata.** Una riga priva di data
rende il criterio 3 di `T-14` non soddisfatto anche se tutte le altre colonne sono compilate, e la
ragione non è formale: senza la data di invio non è misurabile l'indicatore del rischio `R-06`,
che conta quanti organismi rispondono con una disponibilità reale entro un termine registrato a
partire dall'invio. Un rischio senza indicatore osservabile non è sorvegliato.

La seconda: **nessun dato personale.** La colonna `recapito` accoglie soltanto recapiti
istituzionali pubblicati dall'organismo. Mai il nome di una persona fisica, mai un recapito
personale, in nessuna colonna e in nessuna nota.

La terza: **nessun nome di organismo si scrive se non è stato letto sull'elenco pubblicato nella
banca dati europea**, con la data di lettura registrata nel capitolo. Un elenco ricostruito a
memoria o da fonti secondarie ha esattamente l'aspetto di un elenco verificato, e chi lo legge non
ha modo di distinguerlo: è l'esito peggiore possibile di questo lavoro, peggiore di un elenco
assente, perché sembra lavoro fatto.

La quarta: **il criterio di inclusione si dichiara.** Normalmente è il codice di designazione. Se
per qualunque ragione l'elenco dei destinatari fosse costruito su un criterio diverso, quel criterio
va dichiarato per esteso nella colonna `nota` di ciascuna riga. Inviare a un insieme scelto per
comodità senza dichiarare come è stato costruito non è ammesso, ed è precisamente il modo in cui un
criterio binario diventa una percentuale.

**Stato alla data di istituzione, 27 agosto 2026: zero righe di dato.** Il file contiene il blocco
di commento, la riga di intestazione e nient'altro. Zero righe significa zero invii, e zero invii
significa che il criterio 3 di `T-14` **non è soddisfatto**. La ragione non è che le lettere siano
pronte e non spedite - il testo esiste, versionato, in due lingue - ma che l'elenco dei destinatari
non è determinabile: il codice di designazione pertinente è dichiarato `[NV]` e il contenuto
dell'elenco pubblicato non è stato letto. La circostanza è scritta nel file invece che lasciata
dedurre da un file corto, perché un registro assente si confonde con un registro non ancora
popolato, mentre un registro vuoto e dichiarato tale no.
