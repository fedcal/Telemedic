# ARCH-A - Contenitori e installazione nativa: che cosa costa soddisfare entrambi

> Analisi scritta, non codice e non configurazione eseguibile. Redatta sotto `V-182`, che vieta
> ogni riga di codice applicativo prima della chiusura di `T-03` (26 settembre 2026): nessuna
> proposta di questo documento presuppone che quel vincolo sia già superato, e nessuna proposta lo
> aggira. Nessun file diverso da questo è stato toccato.

## 1. La domanda posta e come l'ho ristretta

Il committente vuole due cose che convivono male: **tutto a contenitori**, con le tecnologie
moderne dell'ecosistema, per avere flessibilità; **e** la possibilità di installare presso il
proprio server senza contenitori, per chi li preferisce evitare. Il compito non è progettare
nessuna delle due cose - non esiste ancora codice da containerizzare, e non ne esisterà prima del
26 settembre 2026 - mentre è dire con onestà tecnica **quanto costa** ciascuna delle due strade e
**che cosa si rompe** se si prova a percorrerle entrambe senza dichiararne il prezzo.

Ho ristretto il compito in tre modi, tutti dichiarati qui perché non siano scoperti a metà
lettura.

**Primo.** Il confezionamento a contenitori non è una scelta aperta: `D8` (`00_PROJECT_BRIEF.md`,
riportata a verbale in `docs/01_technical/01-stack-e-motivazioni.md` §1) lo ha già deciso -
Docker Compose per il tenant unico, chart Helm per il servizio gestito - e `08-viste-di-deployment`
§3.1 conferma che anche l'assetto «installazione presso il cliente» è oggi pensato come orchestrato
con «la definizione di composizione fornita dal progetto oppure con il pacchetto per orchestratore
di contenitori». La parte "confezionamento a contenitori" di questa analisi quindi non decide *se*,
decide **come**, scelta per scelta, con il costo di ciascuna dichiarato - è la forma corretta di
una richiesta di «tecnologie moderne» che non sia una lista modaiola.

**Secondo.** L'installazione senza contenitori non esiste oggi in nessun documento del repository
come terzo assetto: `§1` di `08-viste-di-deployment` dichiara letteralmente «Telemedic esiste in
due assetti», e nessuno dei due è nativo. Introdurla non è un dettaglio implementativo: è una
proposta che tocca il vincolo strutturale più stringente del capitolo sui dispiegamenti - «nessuna
funzione può dipendere da un componente disponibile solo in uno dei due assetti» - e per questo la
tratto come la parte difficile del compito, con tre esiti valutati e uno raccomandato, non come
un'appendice tecnica del primo punto.

**Terzo.** Non produco stime in ore. La roadmap dichiara al §0 di `docs/09_roadmap/02-traguardi.md`
di non produrle per mancanza di «una cronologia di consegna su cui calibrare»: inventare un numero
qui violerebbe la stessa regola che il progetto applica a se stesso. Dove serve un ordine di
grandezza uso il peso relativo già in uso nel piano `T-03` (`▪`, `▪▪`, `▪▪▪`), mai un'ora.

## 2. Che cosa i documenti già decidono, con i rinvii puntuali

Prima di proporre qualunque cosa, questo è ciò che è già scritto e che questa analisi recepisce
senza rinegoziare.

**Il doppio modello è di contenitori, non di packaging generico.** `D8` (`.telemedic/context/00_PROJECT_BRIEF.md:80`):
«Doppio modello: SaaS multi-tenant... E on-premise single-tenant (Docker Compose + Helm chart)».
`docs/01_technical/01-stack-e-motivazioni.md` §11 lo ribadisce e aggiunge il vincolo che conta di
più per questa analisi: «I due non sono alternativi: sono i due modelli di `D8`... Nessun ramo
separato, nessuna variante di compilazione: la differenza sta nella configurazione, e la
configurazione è provata». Compose e Helm sono quindi **lo stesso codice**, non due prodotti.

**Il peso operativo dell'installazione presso il cliente è un vincolo di progetto, non
un'aspirazione.** `docs/02_architecture/08-viste-di-deployment.md` §1: «Ogni componente aggiunto va
installato, aggiornato, sorvegliato e messo in sicurezza da un'organizzazione che non è un
fornitore di servizi informatici. Un componente in più non costa solo la sua complessità: costa la
probabilità che venga configurato male». Lo stesso capitolo, §2.1, elenca quattordici componenti
con obbligatorietà e sostituibilità dichiarate; §3.2 elenca ciò che il cliente deve fornire; §3.3 ne
sono le verifiche di configurazione bloccanti all'avvio; §7 è la matrice delle differenze ammesse,
sempre «dimensionale o di responsabilità, mai funzionale»; §5 tratta l'isolamento del relay come
difesa primaria del rischio più grave dell'intera architettura.

**Il criterio C5 dello stack lega esplicitamente la scelta dei componenti alla sostenibilità
dell'installazione presso il cliente.** `01-stack-e-motivazioni` §2: «Un componente che richiede un
cluster di cinque nodi per esistere rende il secondo modello impraticabile per uno studio
associato». È il criterio che ha già escluso una griglia di servizi e un registro di scoperta (§13)
e che ha portato Kafka in modalità KRaft a nodo singolo (§10.3) proprio per questo.

**La catena di costruzione è parte del dispositivo, non un servizio di supporto.**
`docs/01_technical/09-integrazione-continua-e-rilascio.md` apre così, e distingue due cicli di vita
(repository vs distribuzione, §1), fissa costruzione riproducibile byte per byte (§6), firma e
provenienza con materiale fuori dalla pipeline (§7), distinta dei materiali per ogni artefatto,
generata dalla costruzione (§8), promozione dell'artefatto senza ricostruzione (§9), e dichiara
esplicitamente al §12 che la pipeline «non decide sulle licenze» e «non produce la marcatura».
Nessuna di queste regole è scritta come specifica dei soli contenitori: sono scritte a livello di
«artefatto», il che le rende in linea di principio applicabili a qualunque forma di pacchetto - ma
il capitolo esemplifica sempre con immagini, senza mai nominare un pacchetto nativo, il che è di
per sé un'informazione: oggi il documento **presuppone** contenitori, non li impone per definizione.

**La distinta dei materiali è un obbligo normativo, non una buona pratica.**
`docs/06_security/07-catena-di-fornitura.md` §2 cita l'Allegato I, Parte II, punto 1, del
Regolamento (UE) 2024/2847: il fabbricante deve produrre una distinta base del software leggibile
automaticamente che copra almeno le dipendenze di primo livello. Vale **per il prodotto**, a
prescindere dalla forma di distribuzione: un'installazione nativa non ne è esonerata, ne cambia
solo la forma (§6 di questa analisi).

**Lo stato reale della catena di costruzione oggi è quasi nullo.**
`.telemedic/piani/T-03-catena-di-costruzione.md` misura il divario criterio per criterio: due
controlli obbligatori su otto esistono, la distinta dei materiali si genera solo per il sito
Docusaurus con uno strumento fissato a `@latest` (difetto dichiarato al §3.2), non esiste ancora il
registro dei componenti di terze parti, non esiste ancora firma degli artefatti, e la decisione
sulla custodia del materiale di firma (`L-04`) è aperta e sul percorso critico più lungo del
traguardo. **Nessuna immagine di contenitore esiste ancora**, perché non esiste codice applicativo
sotto `V-182`.

**`D63` rende la catena di fornitura parte del fascicolo tecnico, non una rifinitura.**
`.telemedic/piani/D63-recepimento-del-ruolo-di-fabbricante.md`: il committente ha deciso che il
sistema deve diventare adatto all'erogazione di prestazioni su pazienti reali e che il progetto
intende assumere il ruolo di fabbricante. Restano fermi, senza attenuazione: oggi il prodotto non
reca marcatura, non è utilizzabile su pazienti reali, nessuna data è dichiarabile per la marcatura
(`V-171`), e le due formule - il traguardo ingegneristico `RU-1` del 30 novembre 2026 e il percorso
di conformità - **non vanno mai accostate**, perché l'art. 7 del Regolamento (UE) 2017/745 vieta
dichiarazioni fuorvianti anche in assenza di marcatura.

**La capacità è quantificata: 10-20 ore a settimana, un solo contributore.** `D62` emenda `D54`
(`docs/09_roadmap/00-indice.md:173`). La finestra di `T-08` - lo scheletro e il percorso verticale
ridotto, il traguardo software più pesante del calendario, che comprende il registro immutabile
dichiarato «il singolo elemento di maggiore sforzo del catalogo» - copre quarantanove giorni fra il
26 settembre e il 14 novembre 2026, cioè circa settanta-centoquaranta ore in tutto. `RU-1`, il primo
rilascio installabile, è fissato al 30 novembre 2026. Ogni proposta di questa analisi è misurata
contro questi due numeri, non contro un'astrazione.

## 3. Il confezionamento a contenitori, scelta per scelta

Per ciascuna scelta: che cosa compra, che cosa costa, che cosa si rompe se manca, e se è
preferenza o necessità dato quanto già deciso al §2.

### 3.1 Costruzione a più stadi, con cache

**Compra.** Un'immagine finale senza la catena di compilazione (compilatore, gestore di pacchetti
di sviluppo, dipendenze di solo sviluppo): meno pacchetti, meno voci nella distinta dei materiali,
meno rumore nella dichiarazione di esposizione richiesta da `06_security/07` §4 - che deve coprire
**tutte** le vulnerabilità aperte della distinta, quindi ogni pacchetto di compilazione trascinato
in produzione è una voce in più da valutare invano da un contributore unico. La cache di
costruzione (livelli, o una cache remota) riduce il tempo della fascia rapida e della fascia
completa di `09` §2.

**Costa.** Un `Dockerfile` più complesso da mantenere, e - punto che qui va detto esplicitamente
perché il progetto ha già scelto da che parte stare - la cache **non può** essere lasciata libera
di introdurre non determinismo nell'artefatto finale: `01-stack-e-motivazioni` §12 è netto, «la
velocità di costruzione non è un vincolo di questo progetto, mentre la riproducibilità lo è». La
cache è quindi ammessa come ottimizzazione, mai come sostituto della riproducibilità di `09` §6:
l'immagine di base resta fissata per impronta e non per etichetta mobile, e ogni contenuto
scaricato in costruzione resta fissato e verificato per impronta, cache o non cache.

**Si rompe se manca.** Un'immagine a stadio singolo porta in produzione la catena di compilazione:
più superficie, più CVE non sfruttabili ma da triare comunque, e - per il criterio C3 già scelto
dallo stack - meno sorvegliabilità reale, perché la sorveglianza di una distinta rumorosa costa più
tempo di quanto un contributore a 10-20 ore settimanali ne abbia.

**Necessità o preferenza.** Necessità per lo stadio finale minimale, dato `IEC 62304` §8.1.2 e
`C3`. Preferenza per l'aggressività della cache, sempre subordinata alla riproducibilità.

### 3.2 Immagini di base minimali e il loro effetto sulla superficie e sulla distinta

**Compra.** Meno pacchetti di sistema, quindi una distinta più corta e una dichiarazione di
esposizione più governabile - la stessa ragione di C3, applicata al sistema operativo dentro
l'immagine invece che alla catena di compilazione. Per il relay - l'unico componente esposto a
Internet senza autenticazione preventiva, con la cadenza di rilascio più alta dello stack (`01-stack`
§9.1: quattordici versioni in poco più di sette mesi) - un'immagine minimale accorcia anche il
tempo necessario a ricostruire e ripubblicare dopo un avviso di sicurezza, che è precisamente il
vincolo `V-10`.

**Costa.** Un'immagine priva di interprete di comandi complica la diagnosi in campo quando qualcosa
va storto su un'installazione presso il cliente che, per §1 di `08-viste-di-deployment`, non ha un
fornitore di servizi informatici alle spalle. Con un solo contributore a tempo parziale, ogni
incidente che richiede di entrare a mano in un'immagine minimale costa più tempo del previsto - è
una tensione reale, non teorica, e la registro al §8.

**Si rompe se manca.** Un'immagine di base piena (una distribuzione generalista completa) produce
decine di pacchetti di sistema nella distinta, la maggior parte irraggiungibili in esercizio ma
tutti da valutare per la dichiarazione di esposizione di `06_security/07` §4: la regola del
progetto - «copertura parziale non è utilizzabile» - diventa più onerosa esattamente in proporzione
al numero di pacchetti che l'immagine di base porta senza motivo applicativo.

**Necessità o preferenza.** Necessità per il servizio applicativo, dove un'immagine di sola
esecuzione della piattaforma (senza la catena di compilazione, coerente con `01-stack` §4.2 che
fissa la piattaforma alla versione 21) è raggiungibile senza rinunciare a nulla di funzionale.
Preferenza, da valutare caso per caso, per i componenti di terze parti dove il progetto non
costruisce l'immagine da sé (`[NV]` - se il fornitore a monte del componente di relay pubblichi già
un'immagine minimale ufficialmente sorvegliata è cosa da verificare sulla fonte primaria del
progetto a monte, non da assumere).

### 3.3 Esecuzione senza privilegi di amministratore

**Compra.** Una difesa in profondità, esattamente della stessa forma già scelta per il relay in
`08-viste-di-deployment` §5.2 - «l'isolamento di rete in uscita è la difesa primaria; le liste di
indirizzi vietati sono difesa in profondità» - qui applicata al processo invece che alla rete: se un
componente viene compromesso, un processo non privilegiato limita che cosa l'aggressore può fare
dentro il contenitore. `01-stack-e-motivazioni` §14.3 lo richiede già in prosa per i «componenti che
trattano contenuto proveniente dall'esterno»: analizzatori di documenti clinici, decodificatori di
allegati. Estenderlo per impostazione predefinita a **tutte** le immagini che il progetto costruisce
è la generalizzazione naturale di un principio già scritto, non un'invenzione di questa analisi.

**Costa.** Poco, tecnicamente: attenzione a porte privilegiate (il relay tipicamente non richiede il
bit di amministratore per le porte usate in questo tipo di dispiegamento, ma va verificato caso per
caso - `[NV]` sulla configurazione esatta finché non esiste), e disciplina nella scrittura delle
immagini perché un processo non privilegiato non può scrivere ovunque per impostazione predefinita,
il che è precisamente il punto.

**Si rompe se manca.** Un'esecuzione privilegiata dentro il nodo del relay, che è già per progetto
il componente più esposto e ospita il rischio più grave dell'architettura (`08-viste-di-deployment`
§5.1), trasformerebbe una compromissione applicativa in una compromissione dell'intero nodo,
esattamente nella zona che §5.2 dichiara isolata per non doversi fidare della correttezza di
un'analisi sintattica.

**Necessità o preferenza.** Necessità, a costo pressoché nullo, coerente con un principio già
scritto altrove nello stack.

### 3.4 Immagini multi-architettura

**Compra.** Portabilità su hardware diverso da quello prevalente - server a basso costo o
infrastrutture cloud su un'architettura di processore diversa - che in teoria aiuta proprio la
sostenibilità dell'installazione presso uno studio associato che C5 protegge.

**Costa.** Moltiplica la matrice di costruzione, di prova, di firma e di distinta: ogni architettura
in più è un'esecuzione di costruzione in più, una distinta in più da generare e verificare, un
artefatto in più da firmare (§7 di `09`), e - se l'emulazione non basta - un esecutore di
costruzione nativo in più da procurare e mantenere. Nessun documento del repository dichiara oggi un
target su architettura diversa da quella prevalente, e nessun cliente reale esiste ancora.

**Si rompe se manca.** Nulla, oggi: nessun requisito funzionale o cliente dichiarato ne dipende. Il
costo di non averla è un'opportunità mancata, non un guasto.

**Necessità o preferenza.** Preferenza rinviabile. È l'esempio più chiaro, fra tutte le scelte di
questo paragrafo, di una «tecnologia moderna» che va misurata contro `D54`/`D62` prima di essere
adottata: raddoppiare la matrice di costruzione oggi, con settanta-centoquaranta ore disponibili per
il traguardo software più pesante del calendario, non ha un beneficiario dichiarato. Proposta 4 al
§7 la rinvia esplicitamente.

### 3.5 Attestazioni di provenienza e distinta dei materiali generate dalla costruzione

**Compra.** È l'unico modo per rispondere, senza fidarsi di un'affermazione, alla domanda «da dove
viene questo artefatto» (`09` §7.2) e per soddisfare l'obbligo normativo di `06_security/07` §2. Con
`D63`, entra nel fascicolo tecnico del fabbricante come evidenza di sviluppo sicuro.

**Costa.** Tre fonti da generare e da tenere coerenti, non una: le dipendenze applicative (Maven,
npm - quest'ultima già in uso per il sito, con lo strumento non fissato a versione esatta, difetto
già dichiarato in `T-03` §3.2), i pacchetti di sistema dell'immagine di base, ed eventuali
librerie native. Il precedente già in produzione - la distinta del sito - mostra il costo reale:
cinque scostamenti dichiarati fra ciò che esiste e ciò che le regole del progetto chiedono, tutti
ancora aperti al 26 agosto 2026.

**Si rompe se manca.** Una distinta assente o incompleta rende impossibile la dichiarazione dei
fornitori rilevanti che il cliente deve produrre (`06_security/07` §3), viola l'Allegato I, Parte
II, punto 1 del regolamento sulla resilienza informatica, e priva il fascicolo tecnico del
fabbricante dell'evidenza che `D63` richiede.

**Necessità o preferenza.** Necessità normativa, non negoziabile con nessuna urgenza di calendario.

### 3.6 Firma degli artefatti

**Compra.** Verificabilità dell'integrità e dell'origine, richiesta sia da `09` §7.1 sia da
`06_security/07` §8. È inoltre la base su cui poggia la procedura di verifica a cura di chi installa
(criterio 8 di `T-03`), oggi non ancora scritta.

**Costa.** Una decisione non ancora presa dal committente e già identificata come la più a rischio
di slittamento dell'intero traguardo `T-03`: la custodia del materiale di firma. `T-03` §5.6 espone
le due famiglie di soluzione senza sceglierne una - materiale custodito fuori dalla pipeline con
operazione tracciata, oppure identità effimera legata all'esecuzione della pipeline - e dichiara
senza attenuanti che «sotto `D54` la prima famiglia introduce un costo ricorrente di custodia che il
progetto oggi non ha, e la seconda lega la verificabilità degli artefatti alla piattaforma che
ospita la pipeline: nessuna delle due è gratuita».

**Si rompe se manca.** Nessun artefatto pubblicato come distribuzione (§1 dei due cicli di vita, §7
di `09`) può uscire senza firma per le regole già scritte dal progetto: il costo non è evitabile,
solo rinviabile fino al momento in cui il primo artefatto di distribuzione esiste.

**Necessità o preferenza.** Necessità, con una decisione (non tecnica: del committente) ancora
aperta e sul percorso critico.

### 3.7 Riproducibilità byte per byte

**Compra.** La sola proprietà che permette a un terzo di verificare che l'artefatto distribuito
corrisponda al sorgente pubblicato (`09` §6.1), ed è, per dichiarazione esplicita di
`06_security/07` §8, «la sola difesa contro una compromissione della pipeline che sopravviva alla
firma».

**Costa.** Disciplina sulle versioni esatte (già in pratica per i file di blocco delle dipendenze,
`01-stack` §12), marcatura temporale derivata dalla revisione e non dall'orologio, ordinamento
deterministico degli archivi, immagine di base fissata per impronta. Un limite va dichiarato con
onestà e non nascosto: pinnare l'immagine di base per impronta garantisce che l'**ingresso** della
propria costruzione sia identico ogni volta, non che la costruzione della **stessa immagine di
base**, fatta dal suo fornitore a monte, sia a sua volta riproducibile - è una proprietà ereditata e
non verificabile dal progetto, e va trattata come tale nella distinta e nel registro dei componenti
di terze parti (`01-stack` §14), non taciuta.

**Si rompe se manca.** La separazione fra repository e distribuzione dichiarata al §1 di `09`
diventa un'affermazione non verificabile, e il fascicolo tecnico del fabbricante perde l'unica prova
indipendente che ciò che è stato pubblicato corrisponde a ciò che è stato scritto e provato.

**Necessità o preferenza.** Necessità, già requisito di `D17` prima ancora di questa analisi.

### 3.8 Sonde di salute e di prontezza

**Compra.** Nulla di nuovo da inventare: `01-stack-e-motivazioni` §5.2 ha già scelto Spring Boot 3.4
in parte per «attuatore con endpoint di prontezza e di vivacità distinti, requisito diretto del
confezionamento su orchestratore di contenitori». Le sonde sono il meccanismo attraverso cui
l'orchestratore osserva le verifiche di configurazione bloccanti all'avvio di `08-viste-di-deployment`
§3.3 e §8: un sistema che si rifiuta di avviarsi in una configurazione insicura deve poterlo
comunicare all'orchestratore, altrimenti il rifiuto è invisibile e il componente resta fuori rotazione
senza che nessuno lo sappia - che è precisamente la «falsa rassicurazione» che §8 avverte essere
peggiore dell'assenza dichiarata di servizio.

**Costa.** Poco: la scelta tecnica esiste già a monte, resta da cablare la sonda di prontezza
distintamente da quella di vivacità, per evitare che un riavvio in ciclo mascheri un rifiuto di
avvio deliberato con un guasto transitorio - la distinzione fra le due è ciò che rende la sonda
utile invece che rumorosa.

**Si rompe se manca.** Le verifiche bloccanti all'avvio, già scritte come requisito, diventano
invisibili all'orchestratore: un componente che si rifiuta di partire per una ragione di sicurezza
può essere riavviato all'infinito senza che l'operatore veda mai il motivo.

**Necessità o preferenza.** Necessità, e a basso costo perché la scelta a monte l'ha già resa
possibile.

### 3.9 `profiles` nella specifica di composizione per i componenti opzionali

**Compra.** È l'operazionalizzazione diretta di due cose già scritte: la tabella dei quattordici
componenti con obbligatorietà differenziata (`08-viste-di-deployment` §2.1 - registrazione «solo se
abilitata», firma «dipende dalla configurazione del tenant», recapito «dipende dai canali
abilitati») e il terzo passo della verifica di percorribilità dei profili di collocazione (§6.1):
«una prova che esegue la suite funzionale con tutte le dipendenze facoltative disattivate. Se
qualcosa fallisce, quella dipendenza non era facoltativa». I `profiles` della specifica di
composizione sono il modo più diretto per rendere quella prova eseguibile in pipeline: si accende e
si spegne un componente opzionale con un comando, e la suite gira in entrambe le configurazioni.

**Costa.** Un vincolo di disciplina, non di codice: nessun componente opzionale può diventare, per
scorciatoia, un modo per far funzionare una funzione del percorso principale solo quando è acceso -
sarebbe l'esatta violazione del vincolo di §1. E un costo di parità non ancora dichiarato altrove:
`profiles` è un termine della sola specifica di composizione (Compose); Helm, usato per il servizio
gestito, non ha un meccanismo chiamato allo stesso modo, e il principio di `01-stack` §11 - «stessa
struttura» - impone che il meccanismo equivalente lato Helm (attivazione condizionale via valori)
resti semanticamente identico. È un lavoro non ancora scoping, lo dichiaro come tensione al §8.

**Si rompe se manca.** Senza un meccanismo dichiarativo e uniforme per attivare/disattivare i
componenti opzionali, la terza verifica di percorribilità di §6.1 resta un'idea in prosa invece che
una prova eseguibile, e lo scenario di qualità SQ-07 (il servizio terminologico assente) resta
provato solo a mano.

**Necessità o preferenza.** Necessità del principio (un meccanismo di attivazione condizionale
c'è già bisogno che esista); `profiles` come sintassi specifica è la scelta naturale a costo
marginale nullo per Compose, ma non chiude da sola il problema di parità con Helm.

## 4. L'installazione senza contenitori

### 4.1 Che cosa richiede davvero, componente per componente

Il punto che va detto per primo, perché cambia la forma di tutto il resto: **il codice scritto dal
progetto non è, di per sé, legato a un motore di contenitori.** Un archivio eseguibile della
piattaforma applicativa gira con una sola macchina virtuale della piattaforma installata, senza
alcun motore di contenitori; l'interfaccia utente, una volta costruita, è un insieme di file statici
che un qualunque server web può servire. Il costo dell'installazione nativa non sta primariamente
nel codice di Telemedic - sta **per intero nei tredici componenti di terze parti** elencati in
`08-viste-di-deployment` §2.1, ciascuno dei quali, oggi, il progetto presuppone raggiungibile
tramite un'immagine di contenitore e non presuppone raggiungibile tramite un pacchetto di sistema.

La maggior parte di quei componenti ha, a monte, una forma di distribuzione nativa: l'archivio
relazionale, il prodotto di federazione dell'identità, il broker di eventi e il server di relay sono
tutti software distribuiti anche come pacchetto di sistema o archivio eseguibile dai rispettivi
progetti a monte, indipendentemente dal fatto che Telemedic li usi oggi sempre e solo attraverso
un'immagine. `[NV]` - quali versioni esatte, per quali distribuzioni Linux, con quale cadenza di
correzioni di sicurezza siano effettivamente supportate nativamente da ciascuno di questi progetti a
monte non è verificato in nessun documento del repository e va accertato sulla fonte primaria di
ciascuno, non assunto per plausibilità.

Quattro cose, però, non esistono ancora in nessuna forma nativa e vanno costruite dal progetto se
questo percorso si apre:

**Pacchetti o archivi distribuibili per i componenti scritti dal progetto.** Non basta che
l'applicazione sia «vicina» a un'esecuzione nativa: serve un archivio con la struttura attesa da un
gestore di pacchetti di sistema (o, in alternativa, un archivio autonomo con file di unità per il
gestore di servizi), costruito, provato e pubblicato con la stessa disciplina di riproducibilità,
firma e distinta già richiesta per le immagini (§2). È un secondo tipo di artefatto di distribuzione
per la stessa applicazione, non un sostituto.

**Gestione dei servizi di sistema.** Avvio, arresto, riavvio ordinato, gestione dei log, limiti di
risorsa: quello che un motore di orchestrazione fa oggi implicitamente per il progetto, sotto
un'installazione nativa deve essere scritto come file di unità per il gestore di servizi del sistema
operativo del cliente, e mantenuto per ciascuna famiglia di sistema operativo supportata.

**Le verifiche di configurazione bloccanti all'avvio restano un punto a favore, non a sfavore.**
Vivendo dentro l'applicazione stessa (`08-viste-di-deployment` §3.3, §8), queste verifiche non
dipendono dal motore di esecuzione: un'installazione nativa le eredita gratis, allo stesso modo di
un'installazione a contenitori. È l'unico elemento di questa analisi in cui il costo del terzo
assetto è nullo.

**Le migrazioni dell'archivio** sono tecnicamente identiche a prescindere dal packaging - restano
comandi eseguiti contro un archivio relazionale raggiungibile - ma la loro **consegna** non lo è: in
un'immagine, il meccanismo di migrazione arriva incorporato nell'artefatto già costruito e
riproducibile; in un'installazione nativa serve una procedura documentata e provata per eseguirlo
contro un archivio nativo, con la stessa garanzia di espansione e contrazione già richiesta per il
ritorno a una versione precedente (`09` §10.3).

### 4.2 Il punto che pesa di più: l'isolamento del relay

`08-viste-di-deployment` §5.2 è netto sulla gerarchia delle difese: «l'isolamento di rete in uscita
è la difesa primaria; le liste di indirizzi vietati sono difesa in profondità... l'unico strato che
non dipende dalla correttezza di un'analisi sintattica». Per il modello a contenitori, quella difesa
si esprime come un artefatto **dichiarativo** - una definizione di rete che nega le rotte verso
l'interno - che il progetto può provare in integrazione continua contro il proprio riferimento e che
il cliente applica eseguendo, sostanzialmente, lo stesso comando che il progetto ha già verificato.
Il divario fra ciò che il progetto verifica e ciò che il cliente effettivamente esegue esiste anche
qui - nessuna prova di integrazione continua può osservare la rete realmente configurata su un nodo
del cliente - ma è **piccolo**, perché il riferimento è lo stesso oggetto che il cliente applica.

Per un'installazione nativa quel divario si allarga, e non per un difetto di disciplina ma per la
natura del problema: la stessa proprietà - nessuna rotta dalla zona del relay verso le reti interne
o verso i servizi di metadati - va tradotta in istruzioni imperative specifiche del sistema operativo
e del meccanismo di filtraggio del cliente (che varia da distribuzione a distribuzione), applicate a
mano o con strumenti che il progetto non controlla. Il quarto strato della difesa - «una prova
tenta l'instradamento... e fa fallire la costruzione se una qualunque richiesta riesce» - resta
eseguibile dal progetto solo contro il **proprio** riferimento imperativo, non contro ciò che ogni
singolo cliente ha effettivamente applicato. Questo non è un'obiezione contro l'installazione
nativa in sé: è la ragione tecnica per cui, se si apre quella strada, la responsabilità di
quell'isolamento deve essere dichiarata **per iscritto** come del cliente, con la stessa forza con
cui `08-viste-di-deployment` §3.2 già dichiara a carico del cliente la separazione dei privilegi fra
archivio applicativo e archivio del registro.

### 4.3 La distinta dei materiali quando i componenti non arrivano come immagini

Per l'installazione a contenitori, la distinta di un'immagine è quasi gratuita da mantenere accurata
nel tempo: l'immagine è immutabile, e la sua identità (l'impronta) **è** la configurazione di
riferimento di `06_security/07` §8. Per un'installazione nativa, i pacchetti di sistema selezionati
non sono immutabili allo stesso modo: il cliente può aggiornarli, sostituirli o rimuoverli fuori dal
controllo del progetto, e la distinta pubblicata dal progetto diventa una fotografia di riferimento
che può divergere da ciò che gira realmente, in silenzio. `06_security/07` §8 chiede già, per
qualunque configurazione, «rilevazione delle deviazioni in esercizio»: per un pacchetto di sistema
questa capacità non esiste ancora in nessuna forma e va costruita ex novo - non è un adattamento di
ciò che già esiste per le immagini, è un secondo meccanismo, con la propria manutenzione.

L'ampiezza reale del componente da annotare, però, va detta con misura: i componenti di terze parti
coinvolti sono gli stessi quattordici (o meno, contando i sostituibili e gli opzionali) già censiti
in `08-viste-di-deployment` §2.1 e già destinati al registro di `01-stack-e-motivazioni` §14. Non è
un insieme aperto: è lo stesso insieme conosciuto, con una seconda dimensione di identità - il nome
e la versione del pacchetto di sistema, per ciascuna famiglia di distribuzione supportata - da
aggiungere accanto a quella già prevista per le immagini.

### 4.4 Firma e verifica a cura di chi installa

Le distribuzioni native hanno meccanismi di firma maturi e standard, analoghi per solidità a quelli
delle immagini di contenitore. Il costo non è quindi tecnico in senso stretto: è che si tratta di
una **terza catena di firma** (oltre a quella dei commit, già adottata, e a quella delle immagini,
ancora da attuare - `L-04` di `T-03`), con la propria gestione del materiale di firma, la propria
procedura di verifica documentata con i comandi (criterio 8 di `T-03`), e il proprio banco di prova
che dimostri che un pacchetto manomesso viene rifiutato. Ogni catena di firma aggiunta moltiplica
il numero di decisioni del tipo `L-04` ancora aperte, non le risolve.

### 4.5 Quanto cresce la matrice di prova, e il vincolo del §1

Oggi la matrice di configurazione di dispiegamento è, in sostanza, **una sola dimensione**: le
versioni dei componenti sono fissate dentro le immagini, provate una volta, e portabili ovunque
esista un motore di contenitori compatibile. Aprire un'installazione nativa aggiunge una dimensione
**ortogonale e non anticipata da nessun meccanismo esistente**: la famiglia di sistema operativo del
cliente. Il meccanismo già scritto per verificare la sostituibilità dei componenti (§6.1 di
`08-viste-di-deployment` - inventario, classificazione, verifica di percorribilità) risponde alla
domanda «quali componenti posso togliere restando funzionale», non alla domanda «su quale sistema
operativo resto corretto», che è una domanda diversa e che oggi non ha alcuna procedura di verifica
dichiarata.

Concretamente: per essere credibile, un'installazione nativa non può dichiarare supporto a **una
sola** famiglia di sistema operativo senza apparire arbitraria, il che significa - a titolo di
ordine di grandezza qualitativo, non quantitativo, per non violare la regola del §1 su questo
documento - almeno due famiglie con gestori di pacchetti, meccanismi di filtraggio di rete e
convenzioni di gestione dei servizi diversi fra loro. Ciascuna famiglia moltiplica: la procedura di
installazione, la procedura di migrazione, la traduzione delle regole di isolamento del relay del
§4.2, il banco di prova di firma del §4.4, e il tempo di sorveglianza per gli avvisi di sicurezza dei
pacchetti nativi selezionati. Nessuna di queste moltiplicazioni è compensata da qualcosa che il
progetto già fa per i contenitori: sono tutte lavoro aggiuntivo, non lavoro spostato.

Il vincolo del §1 di `08-viste-di-deployment` - «nessuna funzione può dipendere da un componente
disponibile solo in uno dei due assetti» - non vieta di per sé un terzo assetto: vieta che
quell'assetto introduca una **differenza funzionale**. Il punto delicato, che tratto per intero al
§4.6, è se il divario di verificabilità dell'isolamento del relay descritto al §4.2 sia una
differenza di **responsabilità** (ammissibile, sul modello già in uso nella matrice del §7 per la
«conservazione separata del registro», dichiarata «requisito a carico del cliente» nell'installazione
presso il cliente) o una differenza **funzionale mascherata da responsabilità**. La mia lettura,
argomentata al §4.6, è che resta responsabilità finché è dichiarata con lo stesso rigore con cui il
progetto dichiara già le altre responsabilità a carico del cliente - ma è una lettura, non un fatto
accertato, e la registro come tensione al §8.

### 4.6 Tre esiti, valutati

**(a) Terzo assetto pienamente sostenuto.** Significa: matrice di prova moltiplicata per almeno due
famiglie di sistema operativo su ogni asse del §4.5; una seconda pipeline di packaging con la stessa
disciplina di riproducibilità, firma, distinta e attestazione di provenienza della prima, mantenuta
in parallelo e non in sostituzione; un meccanismo nuovo di rilevazione delle deviazioni per pacchetti
di sistema non immutabili; e - il punto più pesante - la responsabilità di dimostrare, per ciascuna
famiglia di sistema operativo supportata, che l'isolamento del relay resta la difesa primaria
dichiarata da `08-viste-di-deployment` §5.2. Misurato contro `D54`/`D62` e contro le settanta-centoquaranta
ore già scarse della finestra di `T-08` - che deve produrre, fra le altre cose, il registro
immutabile dichiarato il singolo elemento di maggiore sforzo del catalogo - **non c'è capacità
visibile per sostenere in parallelo un secondo percorso di distribuzione con questo peso**, né oggi
né nell'orizzonte di `RU-1`. Lo scarto. Non per un giudizio di merito sulla sua utilità, ma perché
misurato contro la capacità dichiarata non è credibile come impegno.

**(b) Percorso documentato ma dichiaratamente non sostenuto.** Significa: pubblicare, accanto agli
artefatti a contenitori, una procedura di riferimento - versioni richieste per componente, procedura
di migrazione, configurazione di riferimento (non applicata, non verificata dal progetto) per
l'isolamento di rete del relay su una o due combinazioni di sistema operativo e meccanismo di
filtraggio comuni, le stesse verifiche bloccanti all'avvio già gratuite (§4.1) - dichiarando per
iscritto, con la stessa forma delle formule vincolate di `V-06`, che: il progetto non verifica in
integrazione continua l'isolamento di rete effettivamente applicato su questo percorso; la distinta
dei materiali per i pacchetti di sistema è una fotografia di riferimento, non una garanzia continua;
non esiste una seconda catena di firma equivalente a quella delle immagini finché non è
esplicitamente costruita; e chi sceglie questo percorso assume su di sé, per intero, la
responsabilità di mantenerlo conforme al riferimento pubblicato. Il costo per il progetto è quasi
interamente documentale - scrivere la procedura, provarla una volta a mano, dichiararne i limiti -
non una seconda pipeline mantenuta a regime. È coerente con una pratica già in uso nel repository:
dichiarare apertamente un costo o un limite invece di nasconderlo (la licenza dell'estensione per
serie temporali, il nodo singolo del broker, la cadenza di rilascio del relay sono tutti trattati
così in `01-stack-e-motivazioni`).

**(c) Non offerto.** Significa dichiarare, con la stessa onestà, che il progetto non pubblica alcun
percorso nativo, nemmeno come riferimento non sostenuto, perché anche una procedura dichiaratamente
non sostenuta rischia di essere trattata come sostenuta da un'organizzazione cliente sotto pressione
commerciale o politica, e perché l'unico bene che l'esito (b) protegge - l'onestà sul limite - dipende
da una disciplina di lettura che il progetto non controlla una volta che il documento è pubblico.

**Raccomandazione: (b), non ora.** Motivo del «(b)»: onora l'obiettivo del committente - la
possibilità di installare senza contenitori per chi la preferisce - senza falsificare la disciplina
di onestà tecnica che il progetto ha già adottato altrove, e senza toccare il vincolo del §1 nella
sua sostanza, perché la mancanza di sostegno può essere scritta come differenza di responsabilità
(sul modello già ammesso dalla matrice del §7), non come differenza di funzione - a condizione che
l'elenco delle assunzioni a carico di chi installa sia scritto con lo stesso rigore delle formule
vincolate del progetto, non come una nota a margine. Motivo del «non ora»: nessuno dei tre esiti è
scritto in nessun traguardo a calendario, e il costo anche solo documentale di (b) - una procedura da
scrivere e provare a mano, dichiarazioni da redigere con lo stesso rigore delle formule vincolate -
non è gratuito, e la sequenza già a rischio di `T-03`→`T-08`→`T-10` non ha margine dichiarato per
assorbirlo prima di `RU-1`. La proposta 7 al §7 registra questa raccomandazione come decisione **di
principio**, con la data di produzione affidata alla roadmap, non a questa analisi.

## 5. Effetto sui due assetti esistenti e sulla matrice delle differenze ammesse

Le scelte di containerizzazione del §3 sono, quasi tutte, trasversali ai due assetti già esistenti e
non li alterano nella loro parità: costruzione a più stadi, immagini minimali, esecuzione senza
privilegi, sonde di salute, riproducibilità, firma e distinta si applicano allo **stesso** artefatto
usato sia con Compose sia con Helm, perché `01-stack-e-motivazioni` §11 impone che siano lo stesso
codice. Non introducono quindi nuove righe nella matrice del §7 di `08-viste-di-deployment`: sono
miglioramenti di qualità dell'artefatto, non differenze fra assetti.

Due eccezioni vanno segnalate. Le immagini multi-architettura, se mai adottate, si applicherebbero
comunque a entrambi gli assetti allo stesso modo - non introducono asimmetria. I `profiles` della
specifica di composizione, invece, sono per costruzione un meccanismo della sola Compose: la parità
richiesta da §11 impone che il meccanismo equivalente in Helm (attivazione condizionale per valori)
resti semanticamente identico, ed è un lavoro non ancora scoping - lo dichiaro come tensione al §8,
non come rischio già misurato.

Per l'installazione nativa, se adottata secondo l'esito (b), la scelta corretta - argomentata al
§4.6 - **non** è aggiungere una terza colonna alla matrice del §7. Quella matrice descrive i due
assetti disciplinati da §1, con la garanzia che ogni differenza ammessa sia «dimensionale o di
responsabilità, mai funzionale»; forzarvi dentro un percorso dichiaratamente non sostenuto
rischierebbe di farlo leggere come un terzo assetto con lo stesso livello di garanzia degli altri
due, che è esattamente ciò che l'esito (b) intende evitare. La forma corretta è una tabella
complementare, separata e chiaramente etichettata come riguardante un percorso fuori dal perimetro
disciplinato da §1, sul modello di come il servizio terminologico è già trattato come eccezione
dichiarata (§2.1: «l'unica dipendenza esterna che il sistema deve poter perdere restando pienamente
operativo») invece che forzato dentro la tabella dei componenti obbligatori.

## 6. Effetto sulla catena di costruzione e sul materiale regolatorio

Sul piano della catena di costruzione, ogni artefatto nativo aggiunto è, per le regole già scritte
in `09` §7.1 e §8 e nel piano `T-03` (`L-12`: «elenco degli artefatti dichiarato»), un artefatto in
più nello stesso elenco: distinta propria, firma propria, attestazione di provenienza propria, tutte
sotto lo stesso controllo bloccante `G5` che oggi collega distinta e registro dei componenti per il
sito. Non serve una seconda infrastruttura di controllo - quella infrastruttura, una volta costruita
da `T-03` per le immagini, è riusabile - ma serve **wiring** aggiuntivo, e ogni artefatto in più
allunga proporzionalmente la fascia di rilascio.

Sul piano regolatorio, `D63` impone due cose che si scontrano direttamente con un percorso nativo
dichiaratamente non sostenuto. La prima: il fascicolo tecnico del fabbricante deve descrivere lo
sviluppo sicuro e la catena di fornitura per ciascuna configurazione che il fabbricante **sostiene**;
un percorso non sostenuto va esplicitamente **escluso** da quella descrizione, con la stessa
disciplina con cui `V-06` distingue oggi «il progetto intende assumere il ruolo di fabbricante» da
«oggi il prodotto non reca marcatura». La seconda, più delicata: il materiale pubblico che descrive
il percorso nativo e il fascicolo tecnico devono dire **la stessa cosa**, con lo stesso grado di
enfasi, perché l'art. 7 del Regolamento (UE) 2017/745 - già citato in `D63` per un altro accostamento
vietato, quello fra `RU-1` e il percorso di conformità - vieta dichiarazioni fuorvianti anche in
assenza di marcatura. Un materiale che promuovesse «installabile senza contenitori» senza la stessa
evidenza dei limiti dichiarati nel fascicolo tecnico produrrebbe esattamente il tipo di lettura
fuorviante che `D63` §2 avverte essere il rischio da evitare.

Un ultimo punto, per misura: l'obbligo di distinta dei materiali dell'Allegato I, Parte II, punto 1
del Regolamento (UE) 2024/2847 si applica al prodotto indipendentemente dalla forma di
distribuzione, ma i componenti coinvolti sono gli stessi quattordici (o meno) già censiti - non è un
obbligo che nasce ex novo con l'installazione nativa, è un obbligo che già esiste e che l'installazione
nativa costringe a soddisfare **due volte**, con due identità diverse per lo stesso componente
(l'immagine e il pacchetto di sistema). `[NV]` - se l'Allegato I, Parte II, punto 1 richieda
esplicitamente l'inventario a livello di pacchetto di sistema anche quando il sistema operativo non è
distribuito dal fabbricante ma configurato dal cliente secondo istruzioni pubblicate, è cosa da
verificare sul testo primario prima di dichiararlo come obbligo puntuale.

## 7. Che cosa propongo di decidere

Numerate, pronte a diventare voci di registro. Ciascuna indica l'area titolare proposta, senza
sostituirsi alla sua decisione.

1. **(`ARCH`)** Confermare `D8` senza modificarlo nella sostanza: il confezionamento a contenitori
   - Compose per il tenant unico, Helm per il servizio gestito, stesso codice e stessa struttura -
   resta l'unico percorso pienamente sostenuto per entrambi gli assetti disciplinati da `08-viste-di-deployment`
   §1. Nessuna funzione, oggi o in roadmap, dipende da un componente disponibile solo con o senza
   contenitori.

2. **(`ARCH`/`TECH`)** Adottare, per ogni immagine costruita dal progetto, costruzione a più stadi
   con stadio finale a immagine minimale, esecuzione senza privilegi di amministratore per
   impostazione predefinita, e sonde di prontezza e di vivacità distinte, collegate alle verifiche di
   configurazione bloccanti già previste in `08-viste-di-deployment` §3.3 e §8. Necessità, non
   preferenza, dato `C3` e dato che il requisito delle sonde discende già dalla scelta di Spring Boot
   3.4 (`01-stack-e-motivazioni` §5.2).

3. **(`TECH`)** La cache di costruzione è ammessa come ottimizzazione di velocità, mai come sostituto
   della riproducibilità di `09` §6: ogni meccanismo di cache adottato deve poter essere invalidato
   senza cambiare l'esito byte per byte della costruzione, e l'immagine di base resta fissata per
   impronta, non per etichetta.

4. **(`ARCH`)** Rinviare le immagini multi-architettura oltre `RU-1`. Nessun requisito funzionale o
   cliente dichiarato le richiede oggi, e il costo - raddoppio della matrice di costruzione, di
   distinta, di firma - non è giustificato sotto `D54`/`D62` prima che esista un caso d'uso concreto.
   Riaprire la questione quando un cliente reale la richieda, non prima.

5. **(`TECH`/`COMP`)** Generare distinta dei materiali e attestazioni di provenienza a ogni
   costruzione per ciascuna immagine, con lo stesso meccanismo già tracciato da `T-03` (`L-12`,
   `L-14`) per il sito, includendo esplicitamente i pacchetti di sistema dell'immagine di base come
   componenti di terze parti soggetti ai controlli `G5` e `G2`, non solo le dipendenze applicative.

6. **(`COMP`, committente)** Decidere la custodia del materiale di firma - la questione `L-04` di
   `T-03`, già aperta e sul percorso critico più lungo del traguardo - **prima** che qualunque
   immagine venga pubblicata come artefatto di distribuzione. Nessuna immagine esce firmata con
   materiale residente nella pipeline.

7. **(`ARCH`, committente)** Non impegnare, per `RU-1` e per l'orizzonte immediatamente successivo,
   un terzo assetto di installazione senza contenitori pienamente sostenuto (esito (a), scartato al
   §4.6). Adottare come decisione **di principio** - non come lavoro schedulato - l'esito (b): un
   percorso nativo documentato e dichiaratamente non sostenuto, con la produzione affidata a un
   traguardo dedicato che la roadmap collocherà dopo `T-10`, e non prima.

8. **(`SEC`/`ARCH`)** Per il percorso nativo dell'esito (b), dichiarare per iscritto - con la stessa
   forma delle formule vincolate di `V-06` - che l'isolamento di rete del relay (`08-viste-di-deployment`
   §5.2, difesa primaria del rischio più grave dell'architettura) è responsabilità integrale di chi
   installa su quel percorso, con un riferimento fornito dal progetto ma senza la verifica automatica
   equivalente al quarto strato di §5.2 per quel target. L'elenco di ciò che chi lo sceglie assume su
   di sé va scritto per intero, non riassunto.

9. **(`ARCH`)** Non forzare il percorso nativo dell'esito (b) dentro la matrice delle differenze
   ammesse del §7 di `08-viste-di-deployment`, che descrive i due assetti disciplinati da §1.
   Pubblicare invece una tabella complementare, separata e chiaramente etichettata, sul modello già
   in uso per il servizio terminologico come eccezione dichiarata.

10. **(`COMP`)** Nel fascicolo tecnico del fabbricante prodotto sotto `D63`, la copertura di sviluppo
    sicuro e catena di fornitura dichiarata riguarda esplicitamente e soltanto la distribuzione a
    contenitori. Il percorso nativo, se pubblicato secondo l'esito (b), è escluso da quella
    dichiarazione con la stessa formula usata nel materiale pubblico - le due non vanno mai scritte in
    modo divergente, per la stessa ragione per cui `D63` vieta di accostare `RU-1` al percorso di
    conformità.

## 8. Le tensioni non risolte

**Se il percorso nativo dell'esito (b) sia un terzo assetto che riapre la lettera di §1 di
`08-viste-di-deployment` - «Telemedic esiste in due assetti» - o un documento complementare che sta
fuori da quella disciplina.** Ho argomentato per la seconda lettura al §4.6 e al §5, ma è una
lettura di questa analisi, non un fatto già deciso: spetta ad `ARCH` accertarlo, eventualmente
riscrivendo esplicitamente §1 per dichiarare l'eccezione, sullo stesso modello con cui il servizio
terminologico è già trattato come eccezione dichiarata al vincolo di obbligatorietà.

**Se il divario fra riferimento e configurazione realmente applicata dal cliente per l'isolamento del
relay (§4.2) sia davvero riducibile a una differenza di responsabilità, o se sia una differenza
funzionale mascherata da responsabilità.** La funzione (l'inoltro del media) è presente in entrambi
i percorsi; ciò che manca nel percorso nativo è la garanzia automatica che quella funzione non apra
anche una rotta verso l'interno. Se si considera la garanzia stessa parte della funzione di
sicurezza dichiarata, la differenza non è più solo di responsabilità. Non la sciolgo qui.

**Se l'immagine di base minimale, senza interprete di comandi, sia sostenibile per un contributore
unico che deve fare diagnosi in campo su un'installazione presso il cliente senza fornitore di
servizi informatici alle spalle.** È una tensione fra la sicurezza per superficie ridotta e la
capacità operativa di risposta agli incidenti con una sola persona part-time, e non ha una risposta
tecnica: dipende da quanto spesso, in pratica, un'immagine minimale costringerà a un percorso di
diagnosi più lento proprio nel momento in cui serve rapidità.

**Se il meccanismo `profiles` di Compose e il suo equivalente Helm restino davvero semanticamente
identici nel tempo, senza un controllo dedicato che lo verifichi.** Oggi nessun controllo del piano
`T-03` copre questa parità: è un lavoro non ancora scoping, e la sua assenza è un rischio silenzioso
esattamente della forma che il progetto già teme per le regole di dipendenza («se si erodono, si
erodono in silenzio», citato nella tabella di collocazione dei controlli per `G13`).

**Se la produzione, anche solo documentale, dell'esito (b) distragga capacità dal percorso critico
già a rischio - `T-03` → `T-08` → `T-10` - prima di `RU-1`.** La proposta 7 la colloca dopo `T-10`
proprio per questo, ma la decisione finale sulla sequenza non è di questa analisi.

**Se la richiesta stessa del committente - flessibilità per chi preferisce non usare contenitori -
sia pienamente compatibile con l'obiettivo di prodotto di `D63` quando il percorso che la soddisfa è
dichiaratamente non verificato dalla catena di costruzione del progetto.** È una tensione fra un
desiderio commerciale legittimo e l'onestà regolatoria che il progetto si è già impegnato a
mantenere. Non si scioglie riformulando meglio: si scioglie decidendo, con lo stesso rigore con cui
`D63` ha già trattato l'accostamento fra `RU-1` e il percorso di conformità, quanto il materiale
pubblico può promettere senza che il fascicolo tecnico lo debba poi contraddire.

## 9. I punti `[NV]` e come si accertano

| Punto | Da verificare | Su quale fonte |
|---|---|---|
| Disponibilità e cadenza di sicurezza dei pacchetti nativi (non a contenitore) per l'archivio relazionale con l'estensione per serie temporali, il prodotto di federazione dell'identità, il broker di eventi e il server di relay, per le principali famiglie di distribuzione Linux | Fonte primaria di ciascun progetto a monte, non fonti secondarie | Area tecnica |
| Se esista uno strumento di generazione della distinta dei materiali per l'ecosistema della piattaforma applicativa (equivalente a quanto già usato per il sito, che ha il difetto dichiarato dell'`@latest` in `T-03` §3.2) fissabile a versione esatta | Documentazione dello strumento scelto, verificata artefatto per artefatto | Area tecnica |
| Se l'Allegato I, Parte II, punto 1 del Regolamento (UE) 2024/2847 richieda esplicitamente l'inventario a livello di pacchetto di sistema quando il sistema operativo non è distribuito dal fabbricante ma configurato dal cliente secondo istruzioni pubblicate | Testo primario del regolamento | Conformità |
| Se una richiesta concreta di installazione nativa o di supporto multi-architettura sia già stata posta da un cliente reale | Bacheca inter-agenti; nessun riscontro trovato nei documenti letti per questa analisi | Committente |
| Il meccanismo scelto per la custodia del materiale di firma (`L-04` di `T-03`) e il suo costo ricorrente | Decisione del committente, non ancora presa | Committente |
| Se il fornitore a monte del server di relay pubblichi un'immagine di base ufficialmente minimale e sorvegliata, oltre alla distribuzione di sistema già nota | Fonte primaria del progetto a monte | Area di sicurezza |

---

**Non modifica altri file.** Nessun commit prodotto da questa analisi.
