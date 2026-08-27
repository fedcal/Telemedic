---
title: Stato e limiti
sidebar_position: 5
description: "Lo stato reale del progetto senza attenuazioni: che cosa esiste oggi, che cosa non esiste ancora, i limiti dichiarati, le tensioni accettate consapevolmente e ciò che chi lo adotta deve sapere prima di decidere."
---

# Stato e limiti

Questo è il capitolo che va letto per primo se si sta valutando un'adozione, e per ultimo se si
sta cercando una ragione per entusiasmarsi. Non contiene attenuazioni.

> **Un limite dichiarato è una funzionalità del prodotto; un limite scoperto in produzione è un
> incidente.** È il criterio con cui questo capitolo è scritto, ed è lo stesso con cui è scritta
> l'intera documentazione.

## 1. Il limite che precede tutti gli altri

**Il software non è utilizzabile per l'erogazione di prestazioni sanitarie su pazienti reali.**

Non è una cautela redazionale: è la condizione dichiarata da `D16`, e resta vera per ogni artefatto
distribuito finché non esiste una marcatura apposta da un soggetto fabbricante che se ne assume la
responsabilità. **Oggi il prodotto non reca marcatura CE** e non è coperto da alcuna dichiarazione
di conformità.

Il progetto **ha deciso di assumere in proprio il ruolo di fabbricante** (`D58`), che emenda le
decisioni precedenti nella parte in cui attribuivano il percorso a un soggetto esterno indefinito.
Va letto per ciò che è e non per ciò che sembra: **il soggetto giuridico è ancora da costituire e
formalizzare**, la costituzione è un prerequisito interno con un proprio tempo, e l'intenzione non
modifica lo stato di fatto del prodotto. **In nessun documento del progetto è scritta una data
entro cui il prodotto sarà marcato**, e non lo sarà: una pianificazione interna non diventa una
promessa solo perché è del progetto, e la promessa di un esito regolatorio datato produce un
effetto che l'intenzione non produce (vincolo [`V-171`](../11_registri/01-vincoli-in-vigore.md#v-171)).

Il limite ha tre proprietà che chi valuta il prodotto tende a sottovalutare:

1. **Non è rimovibile per configurazione.** Nessun parametro, nessun profilo, nessuna licenza,
   nessun accordo contrattuale con il progetto lo modifica.
2. **È verificabile.** Ogni artefatto reca la dichiarazione di non marcatura, e la sua assenza
   impedisce la pubblicazione.
3. **Non si trasferisce con la licenza.** Chi integra il software in un prodotto commerciale e lo
   immette sul mercato **è fabbricante per legge**, indipendentemente da quanto scritto nella
   licenza - e indipendentemente dal fatto che il progetto intenda certificare la propria
   distribuzione.

La dichiarazione integrale di destinazione d'uso e di limiti d'uso è in
[`NOT-A-MEDICAL-DEVICE.md`](https://github.com/fedcal/Telemedic/blob/main/NOT-A-MEDICAL-DEVICE.md);
la distinzione fra ciò che il progetto pubblica e ciò che qualcuno mette in servizio è in
[`DISTRIBUTION-POLICY.md`](https://github.com/fedcal/Telemedic/blob/main/DISTRIBUTION-POLICY.md).

## 2. La fotografia

Ogni riga è verificabile aprendo il repository. Lo stato è quello accertato al momento della
stesura di questo capitolo.

| Ambito | Stato |
|---|---|
| **Dichiarazioni pubbliche obbligatorie** (`D51`) | **Presenti**: [`NOT-A-MEDICAL-DEVICE.md`](https://github.com/fedcal/Telemedic/blob/main/NOT-A-MEDICAL-DEVICE.md), [`DISTRIBUTION-POLICY.md`](https://github.com/fedcal/Telemedic/blob/main/DISTRIBUTION-POLICY.md), [`THIRD-PARTY-TERMINOLOGY.md`](https://github.com/fedcal/Telemedic/blob/main/THIRD-PARTY-TERMINOLOGY.md), [`LICENSE`](https://github.com/fedcal/Telemedic/blob/main/LICENSE), [`NOTICE`](https://github.com/fedcal/Telemedic/blob/main/NOTICE), [`CONTRIBUTING.md`](https://github.com/fedcal/Telemedic/blob/main/CONTRIBUTING.md), [`GOVERNANCE.md`](https://github.com/fedcal/Telemedic/blob/main/GOVERNANCE.md), [`SECURITY.md`](https://github.com/fedcal/Telemedic/blob/main/SECURITY.md), [`CODE_OF_CONDUCT.md`](https://github.com/fedcal/Telemedic/blob/main/CODE_OF_CONDUCT.md) |
| **Guida dei fondamenti** (`D35`, ventuno moduli) | **Diciassette moduli presenti**. Mancano i moduli `16` (architettura del progetto), `18` (matrice area → conoscenze), `19` (glossario), `20` (fonti primarie) |
| **Panoramica** (`docs/00_overview/`) | Quest'area |
| **Area tecnica** (`docs/01_technical/`) | **Completa**: dieci capitoli |
| **Area architetturale** (`docs/02_architecture/`) | **Completa**: dieci capitoli |
| **Area funzionale** (`docs/03_functional/`) | **Completa**: otto capitoli |
| **Area protocolli** (`docs/04_protocols/`) | **Completa**: undici capitoli |
| **Area dominio** (`docs/05_domain/`) | **Completa**: dieci capitoli |
| **Area sicurezza** (`docs/06_security/`) | **Completa**: undici capitoli |
| **Area integrazione** (`docs/07_integration/`) | **Completa**: undici capitoli |
| **Area conformità** (`docs/08_compliance/`) | **Completa**: dieci capitoli |
| **Roadmap** (`docs/09_roadmap/`) | **Completa**: sei capitoli |
| **Registro delle decisioni architetturali** | **Trenta voci** più indice |
| **Sito di documentazione** | **Impalcatura presente**: configurazione del generatore, definizione della barra laterale, flussi di lavoro di verifica e pubblicazione, file di internazionalizzazione delle **sole stringhe di interfaccia**. **Nessun contenuto documentale tradotto** |
| **Versione inglese integrale** (`D3`, `D50`) | **Assente**. Nessun capitolo di `docs/` esiste in inglese |
| **Codice applicativo** | **Assente.** Nessun file sorgente del servizio o dell'interfaccia |
| **Catena di costruzione del software** | **Assente** per il software applicativo. Esistono i flussi di lavoro che verificano il corpo documentale - controlli redazionali, guardia sulle terminologie sotto licenza, ricerca di segreti, distinta dei materiali del sito, divergenza fra italiano e inglese - e generano la distinta del solo sito |
| **Capacità di sviluppo** (`D54`) | **Un contributore unico, a tempo parziale.** Non è più un'ipotesi: è il dato su cui ogni stima si costruisce |
| **Soggetto fabbricante** (`D58`) | **Da costituire.** La decisione di assumere il ruolo è presa; il soggetto giuridico non esiste |

> **Nota di lettura.** La tabella dello stato di fatto in
> [`docs/09_roadmap/00-indice.md`](../09_roadmap/00-indice.md) §4 fotografa un momento anteriore
> alla stesura di quest'area e riporta come assenti la panoramica e l'`COMP`, e come
> ventiquattro le voci del registro delle decisioni. Le due fotografie non si contraddicono: sono
> datate diversamente. Ma **una fotografia senza data invecchia in silenzio**, ed è la forma di
> errore che quest'area si è imposta di non produrre: la sede unica e la sua generazione automatica
> sono aperte come questione [`Q-202`](../11_registri/02-questioni-aperte.md#q-202).

### 2.1 Le due letture che contano

**La prima.** Il progetto ha un corpo documentale di dimensione ragguardevole e **nessuna riga di
software**. I registri delle aree dichiarano conteggi che vanno da circa ventunomila a circa
cinquantamila parole per area, per un totale dell'ordine delle centinaia di migliaia di parole.
Il conteggio esatto non è stato eseguito, e i valori dichiarati nei registri sono stime da densità
di riga; richiede verifica da `OVER` `[NV]`. Il conteggio esatto è a sua volta un'attività da
mettere a piano, perché è il moltiplicatore dell'obbligo di traduzione integrale imposto da `D50`.

**La seconda.** La sequenza originaria (`D52`) imponeva di completare tutta la documentazione,
costruire il sito bilingue e pubblicarlo prima di ogni riga di software. È stata **emendata**:
`D53` conferma il **primo rilascio installabile al 30 novembre 2026**, e `D56` stabilisce che la
traduzione integrale **non è più prerequisito di ogni riga di codice** e procede in parallelo, con
un controllo automatico di divergenza fra italiano e inglese. Restano prerequisiti non negoziabili,
perché il loro costo di omissione è irrecuperabile: le avvertenze pubbliche obbligatorie, la guida
dei fondamenti e le aree di conformità e sicurezza.

L'emendamento **non attenua** il vincolo [`V-183`](../11_registri/01-vincoli-in-vigore.md#v-183) per le aree che restano prerequisito, e non
elimina la conseguenza che conta: **con la capacità dichiarata da `D54` - un contributore unico a
tempo parziale - l'ambito del primo rilascio si riduce a ciò che quella capacità può costruire e
verificare nel tempo disponibile.** Non esiste una terza via, e un ambito non ridotto sotto questa
decisione produce semplicemente una data mancata in pubblico.

### 2.2 Che cosa si può legittimamente fare, oggi

Quattro impieghi, tutti reali e tutti compatibili con il limite del §1:

| Impiego | Perché ha valore |
|---|---|
| **Valutazione tecnica, di sicurezza e di conformità** | La documentazione è l'artefatto su cui un responsabile della sicurezza, un responsabile della protezione dei dati o una commissione di gara verificano le affermazioni invece di crederle |
| **Progettazione di un'integrazione** | I contratti, le modalità, gli obblighi di chi integra e le trappole note sono scritti prima che il codice esista, che è l'ordine utile a chi deve pianificare |
| **Base per chi intende certificare** | Il pacchetto regolatorio è scritto come manuale operativo per il fabbricante, e le attività retroattivamente irrecuperabili sono già impostate |
| **Contributo** | La guida dei fondamenti esiste perché il contributo non presupponga né un background sanitario né uno informatico |

Quello che **non** è: un prodotto in commercio, una dimostrazione, un prototipo installabile.

## 3. Che cosa non esiste ancora, in ordine di impatto

**Il codice applicativo.** Non esiste, e la sua assenza è la ragione per cui ogni affermazione di
questa documentazione su prestazioni, capacità e comportamento è **specifica verificabile** e non
attestazione. La distinzione è dichiarata in ogni area.

**La catena di costruzione.** Deve **precedere** la prima riga di codice applicativo, non
accompagnarla (vincolo [`V-182`](../11_registri/01-vincoli-in-vigore.md#v-182)): è ciò che genera la distinta dei materiali e il registro degli
identificativi di requisito, e senza di essa la tracciabilità richiesta da IEC 62304 non è
ricostruibile a posteriori (`D45`). L'unica eccezione ammessa è il codice usa-e-getta delle
verifiche empiriche, dichiarato tale, in un'area separata, che non entra in alcun artefatto
distribuito.

**La versione inglese.** `D50` impone italiano e inglese **integrali**, non sintesi, e `D56` ne
fissa il modo: traduzione assistita, **un'area alla volta**, con un controllo automatico di
divergenza. Il rischio reale non è la traduzione mancante: è la **divergenza fra le due versioni**,
che in materia regolatoria produce due documenti che dicono cose diverse sullo stesso obbligo. Il
controllo di divergenza esiste già nei flussi di verifica ed è **deliberatamente non bloccante**
finché le tre aree esigite da `D56` non sono tradotte per intero: diventa bloccante nello stesso
momento in cui l'ultima di esse è completata, perché un controllo che non può fallire è teatro e
lasciarlo permanentemente indulgente è il modo più rapido per abituarsi a ignorarlo.

**Quattro moduli della guida dei fondamenti** - il `16` sull'architettura del progetto, il `18`
sulla matrice area del codice → conoscenze richieste, il `19` glossario, il `20` sulle fonti
primarie. Non è una lacuna come le altre: la guida è **prerequisito dichiarato di
[`CONTRIBUTING.md`](https://github.com/fedcal/Telemedic/blob/main/CONTRIBUTING.md)** e `D56` la colloca fra i tre prerequisiti non negoziabili della traduzione,
quindi i quattro moduli stanno sul percorso critico di due impegni distinti. Due pesano più degli
altri: il **glossario**, perché è citato da più aree e perché il suo allineamento al glossario
nazionale di telemedicina va compiuto **prima** della traduzione - una divergenza scoperta dopo si
propaga su due lingue (questione [`Q-146`](../11_registri/02-questioni-aperte.md#q-146)) -; e il **18**, perché è il documento che dice a un
contributore che cosa deve sapere prima di toccare un'area. Questione [`Q-201`](../11_registri/02-questioni-aperte.md#q-201).

## 4. I limiti dichiarati del primo rilascio

Il perimetro esatto è in
[`docs/09_roadmap/03-primo-rilascio-utilizzabile.md`](../09_roadmap/03-primo-rilascio-utilizzabile.md).
Il criterio di composizione è dichiarato: si consegna il **percorso verticale completo più stretto
possibile**, non l'insieme più ampio possibile di funzioni. Il percorso scelto è la **televisita
programmata**, dall'appuntamento ricevuto per riferimento fino all'**esito strutturato** della
prestazione, perché è quello che attraversa il maggior numero di vincoli trasversali con il minor
numero di dipendenze da terzi.

Il percorso **si ferma prima della refertazione**: bozza, validazione, firma, immodificabilità del
documento firmato, rettifica come nuova versione e consegna del documento al sistema di origine
escono tutte con il taglio `TG-01` dichiarato al §5 di
[`03-primo-rilascio-utilizzabile.md`](../09_roadmap/03-primo-rilascio-utilizzabile.md). Il taglio è
reversibile e la funzione è la prima della coda successiva, ma **finché non rientra, il primo
rilascio non produce un referto**: restituisce un esito strutturato, non un documento firmato.

Ne discende un elenco di limiti che è bene leggere come tale e non come una lista di funzioni in
arrivo:

| Limite | Natura |
|---|---|
| Un solo tipo di prestazione: **televisita programmata** | Perimetro di rilascio. Telemonitoraggio, teleconsulto, teleconsulenza e teleassistenza sono nel perimetro del prodotto ma non del primo rilascio |
| **Nessun referto**: il percorso restituisce un esito strutturato, non un documento firmato | Perimetro di rilascio. È il taglio `TG-01`, reversibile: refertazione e consegna del documento al sistema di origine rientrano subito dopo `RU-1` |
| **Due partecipanti** alla sessione | La topologia oltre due partecipanti è decisione dichiarata rinviata, e non è marginale: l'interprete è la misura alternativa dichiarata per la non conformità di accessibilità nota |
| **Nessuna registrazione della sessione** | Perimetro di rilascio. L'indicatore e i suoi divieti esistono già nel modello |
| **Nessun conferimento alle infrastrutture documentali** | Dipendenza esterna non disponibile: mancano i modelli documentali, non il progetto ([`Q-07`](../11_registri/02-questioni-aperte.md#q-07)) |
| **Latenza da obiettivo a schermo non garantibile** | Dipende da telecamera, calcolo, schermo, rete e stato del buffer. Il sistema la **misura**, la registra e ne informa: non la promette |
| **Nessuna modalità fuori linea per il contenuto clinico** | Scelta dichiarata, motivata dal rischio di contenuto clinico su un dispositivo che il titolare non controlla |
| **Nessuna rotazione delle chiavi durante la sessione** | **Non esiste nella tecnologia.** Non si rivendica |
| **Sottotitoli in tempo reale assenti** | Non conformità dichiarata su un criterio di accessibilità, con misura alternativa e canale dati comunque definito nel protocollo |
| **Ordinamento degli eventi garantito solo dentro la partizione** | Nessun requisito funzionale può dipendere da un ordine globale |
| **Consegna degli eventi almeno una volta** | I consumatori sono idempotenti per costruzione, con chiave di deduplicazione esplicita |
| **Numero di tenant per installazione** | Non misurato, ordinanza di grandezza dichiarata: centinaia. La misura, da verificare da `TECH` `[NV]`, è un'attività di rilascio, non una stima |
| **Nessuna ridondanza del broker** nell'assetto a nodo singolo | La perdita del broker significa **ritardo nella consegna, non perdita di eventi**: la sorgente di verità è l'outbox transazionale |

Due voci meritano una nota, perché è dove si concentrano i fraintendimenti.

**Le soglie di prestazione dell'interfaccia non sono dichiarate.** Non per reticenza: perché il
**dispositivo di riferimento non è ancora dichiarato** (questione [`Q-115`](../11_registri/02-questioni-aperte.md#q-115)), e senza dispositivo il
requisito non è verificabile. Il dispositivo non è quello di chi sviluppa: è un apparecchio di
fascia media di alcuni anni prima, che è ciò che ha in mano la popolazione di riferimento.
Pubblicare una soglia non misurata sarebbe scriverla per preferenza.

**Nessuna soglia tecnica del progetto è conformità.** Nessuna fonte italiana impone soglie
tecniche: i valori del progetto sono specifica di prodotto e limiti dichiarati (vincolo [`V-12`](../11_registri/01-vincoli-in-vigore.md#v-12)).
Chi legge una cifra in questa documentazione non deve leggerla come un requisito di legge
soddisfatto.

## 5. Le tensioni accettate consapevolmente

Sono i punti in cui il progetto ha rinunciato a una proprietà desiderabile per averne un'altra, e
in cui il costo è stato dichiarato invece di essere nascosto. Sono elencate qui perché **una
tensione taciuta diventa una sorpresa**.

### 5.1 Registrazione della sessione contro cifratura fino agli estremi

Sono **incompatibili**, e l'incompatibilità non è risolvibile tecnicamente: un componente che
registra deve poter decifrare, e un flusso decifrato in un punto intermedio non è cifrato fino agli
estremi.

La scelta è stata di **dichiararlo** invece di rivendicare comunque la proprietà, che sarebbe stato
falso e sarebbe stato il tipo di difetto che distrugge la credibilità dell'intero sistema. Ne
discende un'architettura a due modalità: modalità predefinita **senza registrazione**, con media
cifrato fino agli estremi, instradato direttamente quando la rete lo consente, e verifica delle
chiavi a voce; modalità **con registrazione**, attivabile solo con consenso esplicito per la
singola sessione, in cui il media transita per il componente di registrazione.

Gli obblighi che ne derivano non sono negoziabili: l'informativa di consenso **dichiara
esplicitamente** che la sessione non è più cifrata fino agli estremi; l'interfaccia segnala lo
stato di registrazione in modo **persistente e non occultabile** per tutta la durata; il passaggio
fra le due modalità è tracciato; il materiale è cifrato a riposo con chiavi per tenant e ha
**scadenza sempre valorizzata**.

Il costo residuo, dichiarato: la registrazione è **eccezione e non regola**, disabilitata per
impostazione predefinita a ogni livello, e per i tipi di prestazione marcati non registrabili la
funzione è **assente e non disattivabile neppure da un amministratore**.

### 5.2 Classe IIa accettata invece che evitata

Il progetto avrebbe potuto restare fuori dalla qualificazione di dispositivo medico rinunciando
alla valutazione automatica delle soglie. **Non lo ha fatto**, perché quella funzione è ciò che
rende il telemonitoraggio un servizio sanitario invece di un archivio di numeri.

Il costo è dichiarato per intero: serve un organismo notificato; il sistema di gestione della
qualità deve essere **certificato**, non solo implementato; serve una valutazione clinica con un
percorso documentale autonomo. E il fattore limitante non è lo sviluppo: è la disponibilità degli
organismi notificati, con code documentate e organico in contrazione.

La contropartita, altrettanto dichiarata: **le esclusioni di perimetro tengono insieme la classe di
rischio a IIa e la classe di sicurezza del software a B. Cadono insieme, e il costo si somma**
(vincolo [`V-170`](../11_registri/01-vincoli-in-vigore.md#v-170)). È la ragione per cui una funzionalità dell'elenco fuori perimetro non si valuta
nel merito tecnico.

### 5.3 Intenzione di certificare contro stato di fatto del prodotto

È la tensione più delicata da comunicare, perché i due termini si confondono con facilità e la
confusione avvantaggia sempre chi legge in fretta.

Il progetto produce fascicolo tecnico, documentazione di ciclo di vita, gestione del rischio e
ingegneria dell'usabilità, e **ha deciso di assumere in proprio il ruolo di fabbricante** (`D58`).
Ciò significa che le attività prima attribuite a un terzo - costituzione del soggetto, nomina della
persona responsabile del rispetto della normativa, contatti con gli organismi notificati, avvio del
piano di valutazione clinica - sono del progetto e hanno un proprio tempo a calendario.

**Non significa nulla di più.** Il soggetto giuridico non esiste ancora; il prodotto oggi non reca
marcatura; chi installa una versione non certificata assume comunque gli obblighi che ne derivano,
e **il fatto che il progetto intenda certificare in futuro non gliene trasferisce alcuno**.
Lasciarlo intendere sarebbe più dannoso del silenzio.

La tensione accettata è quindi questa: **il progetto dichiara un'intenzione senza dichiarare una
data**, e accetta che ciò sia meno rassicurante di un calendario. La ragione è che un calendario
pubblico su un esito regolatorio è, esso stesso, un'affermazione regolatoria: il divieto di
dichiarazioni fuorvianti **non presuppone la marcatura**, e una data mancata su questo terreno non
è un ritardo, è una dichiarazione risultata falsa.

Va aggiunta una precisazione che il progetto aveva già messo per iscritto e che `D58` rende ancora
più rilevante: la qualificazione del repository come semplice codice sorgente è **fattuale, non
perpetua**. Dipende dal fatto che il progetto non renda disponibile un prodotto pronto all'uso nel
quadro di un'attività commerciale. Nel momento in cui questo cambia, cambia anche la
qualificazione, e i documenti vanno riscritti **prima** del cambiamento, non dopo.

### 5.4 Apache-2.0 non protegge dal danneggiato

Le sezioni 7 e 8 della licenza escludono garanzie e responsabilità **fra le parti della licenza**.
Questo **non si estende alla persona danneggiata**: l'art. 15 della Direttiva (UE) 2024/2853 vieta
l'esclusione o la limitazione contrattuale della responsabilità nei confronti del danneggiato, e
l'art. 10 prevede una presunzione di difettosità in caso di non conformità a requisiti obbligatori
di sicurezza previsti dal diritto dell'Unione.

Chiunque metta in servizio questo software in un contesto clinico se ne assume le conseguenze verso
i pazienti. Nessuna clausola di licenza cambia questo fatto.

### 5.5 Documentazione prima del codice, e la data che è stata confermata

La sequenza iniziale è motivata - le attività retroattivamente irrecuperabili non si recuperano, e
in sanità un software non documentato non è installabile - ma il costo è reale e va detto: **a
oltre metà dell'orizzonte temporale dichiarato non esiste software**.

La tensione è stata portata al committente con tre opzioni argomentate, e la raccomandazione
dell'orchestrazione era di spostare il primo rilascio installabile a un traguardo autonomo
dell'anno successivo. **Il committente ha deciso diversamente** (`D53`): il traguardo del 30
novembre 2026 resta il primo rilascio installabile, e la decisione non si rilitiga.

Questa è una tensione accettata con gli occhi aperti, e il modo in cui viene retta è dichiarato
invece di essere sperato: **si riduce l'ambito**, non si aumenta l'ottimismo. Con la capacità di
`D54` - un contributore unico a tempo parziale - l'area roadmap è tenuta a dichiarare
esplicitamente che cosa entra, che cosa viene tagliato e quali tagli sono reversibili. Chi valuta
il progetto dovrebbe leggere quel documento **prima** di leggere l'elenco delle capacità: un ambito
non ridotto sotto questa decisione produce semplicemente una data mancata in pubblico, ed è il
rischio di programma più concreto oggi in essere.

### 5.6 Il registro immutabile costa disponibilità

La scrittura sull'archivio primario del registro è **bloccante**: il suo fallimento fa fallire
l'operazione applicativa. La conseguenza accettata e dichiarata è che **l'indisponibilità del
registro sia indisponibilità del sistema per le operazioni cliniche**. L'alternativa - registrare
in modo non bloccante - significherebbe che un accesso a dato sanitario può avvenire senza traccia,
che è precisamente ciò che il requisito esclude.

Resta una finestra di vulnerabilità residua dichiarata: le voci fra due ancoraggi dell'impronta
cumulativa, nella sola ipotesi di collusione fra i due amministratori con privilegi disgiunti.

### 5.7 Instradamento deterministico contro resilienza dei nodi

La sessione di segnalazione è instradata in modo deterministico al nodo che la possiede, perché la
consegna dei candidati richiede «esattamente una volta e nello stesso ordine» e un meccanismo di
diffusione senza persistenza non lo garantisce. Modalità di guasto **dichiarata e non nascosta**:
la caduta di un nodo termina le sessioni ospitate, che si ristabiliscono con una rinegoziazione.
Migrare lo stato costerebbe più della rinegoziazione, e il drenaggio graduale è posto come
requisito per l'aggiornamento pianificato.

### 5.8 Token opachi contro latenza e criticità del gateway

I token verso l'esterno sono opachi perché la revoca deve avere come risposta un istante e non un
intervallo. Il costo è che il gateway diventa **componente critico da rendere ridondante**, che la
latenza cambia, e che gli integratori abituati a un formato ispezionabile trovano attrito. È
attrito documentato **con la motivazione**, altrimenti viene letto come limitazione arbitraria.

### 5.9 Piena funzionalità senza SNOMED CT, con il costo scritto

Il sistema è pienamente funzionale con il sistema terminologico oneroso disattivato, e nessun
percorso principale può richiederlo (vincolo [`V-03`](../11_registri/01-vincoli-in-vigore.md#v-03)). Il costo è dichiarato: alcune migliaia di
codici del vincolo di valore sul motivo del contatto **non si validano**. La verifica non è una
dichiarazione: si esegue la suite funzionale completa con la disattivazione attiva.

Va detto anche che il progetto non può fare di più: la clausola di licenza che impone che il
contenuto non sia accessibile se non a utenti autorizzati è **incompatibile con un repository
pubblico**, e la catena di sub-licenza è incompatibile per costruzione con la licenza del progetto.
Due avvertenze restano a carico di chi installa, e sono in
[`THIRD-PARTY-TERMINOLOGY.md`](https://github.com/fedcal/Telemedic/blob/main/THIRD-PARTY-TERMINOLOGY.md):
interrogare un servizio terminologico esterno **non esonera dall'obbligo di licenza**, e chi
distribuisce un prodotto che incorpora Telemedic distribuisce un prodotto soggetto a quella
licenza anche senza contenere un solo concetto.

### 5.10 Moduli propri sostituibili contro coerenza del prodotto

Refertazione, agenda e fatturazione esistono come moduli propri **e** sono disattivabili e
sostituibili per configurazione, perché il decreto vieta di realizzare un modulo *ad hoc* dove
esiste il modulo regionale. La tensione è evidente: un prodotto le cui parti possono essere
sostituite ha più superficie di contratto, più combinazioni da provare e meno controllo sul
risultato finale. La risposta è la suite di prove che esercita sempre **almeno due tenant e due
integratori distinti** con configurazioni deliberatamente divergenti, compresi insiemi di moduli
sostituiti diversi (vincolo [`V-188`](../11_registri/01-vincoli-in-vigore.md#v-188)).

### 5.11 Un contributore unico contro registrazioni che richiedono soggetti distinti

È la tensione dichiarata da `D54`, ed è quella che **nessuna quantità di lavoro individuale
risolve**, perché non è un problema di ore ma di persone diverse.

Alcune registrazioni richieste da un sistema di gestione della qualità - audit interno, riesame del
rilascio, verifica di configurazione eseguita da chi non ha scritto il codice - **presuppongono
soggetti distinti e non sono producibili internamente** da un contributore unico. La conseguenza va
accettata formalmente e non aggirata: va stabilito quale sottoinsieme si accetta come rischio
dichiarato e quale si copre acquisendo la funzione all'esterno. È la questione [`Q-189`](../11_registri/02-questioni-aperte.md#q-189), aperta verso
il committente.

Va detto in questa sede e non solo nell'`COMP`, perché è un'informazione che cambia la
valutazione di chi adotta: un progetto che dichiara di voler certificare con un contributore unico
sta dichiarando insieme un'intenzione e un vincolo strutturale al suo compimento.

## 6. Le questioni aperte che pesano di più

Una questione aperta dichiarata vale più di una risposta inventata. Il registro completo è in
[`.telemedic/context/05_BACHECA_INTERAGENTI.md`](https://github.com/fedcal/Telemedic/blob/main/.telemedic/context/05_BACHECA_INTERAGENTI.md); queste sono quelle il cui esito cambia qualcosa per
chi valuta.

**Quattro questioni che pesavano molto sono state chiuse dal committente il 25 agosto 2026** e non
figurano più fra quelle aperte: [`Q-180`](../11_registri/02-questioni-aperte.md#q-180) (traguardo del 30 novembre 2026, chiusa da `D53`), [`Q-181`](../11_registri/02-questioni-aperte.md#q-181)
(capacità dichiarata, chiusa da `D54`), [`Q-144`](../11_registri/02-questioni-aperte.md#q-144) (congelamento della destinazione d'uso del
telemonitoraggio, chiusa da `D55`), [`Q-182`](../11_registri/02-questioni-aperte.md#q-182) (modello di produzione della versione inglese, chiusa
da `D56`). Le conseguenze di ciascuna sono recepite nei paragrafi precedenti.

| Questione | Perché pesa |
|---|---|
| [`Q-189`](../11_registri/02-questioni-aperte.md#q-189) - continuità dei contributori e registrazioni a ruoli distinti | Determina quale parte del sistema qualità è producibile internamente e quale va acquisita all'esterno (§5.11) |
| [`Q-185`](../11_registri/02-questioni-aperte.md#q-185) - allineamento della pagina pubblica alle riformulazioni approvate | Ogni giorno di esposizione è un giorno di affermazione non sostenibile, e **un periodo di pubblicazione non si annulla**: l'impatto è irrecuperabile, non ritardabile |
| [`Q-07`](../11_registri/02-questioni-aperte.md#q-07) - modelli documentali delle tipologie del fascicolo | Non pubblicamente disponibili. Blocca il conferimento, non la progettazione |
| [`Q-115`](../11_registri/02-questioni-aperte.md#q-115) - dispositivo e viewport di riferimento | Senza di esso nessuna soglia di prestazione dell'interfaccia è verificabile |
| [`Q-170`](../11_registri/02-questioni-aperte.md#q-170) - forma di pubblicazione della traccia di destinazione d'uso | Un documento intitolato «destinazione d'uso» pubblicato sotto il nome del progetto è precisamente il materiale da cui un terzo può ricavarla |
| [`Q-172`](../11_registri/02-questioni-aperte.md#q-172) - versionamento della distribuzione identificata | Va deciso **prima** del primo rilascio: una rinumerazione successiva è una discontinuità di identificazione, e in un dispositivo registrato non si sana con una nota di rilascio. Con `D58` diventa una decisione del progetto, non di un terzo |
| [`Q-186`](../11_registri/02-questioni-aperte.md#q-186) - periodo di supporto dichiarato | Senza la durata, il piano di dismissione delle versioni non è pubblicabile ed è **prerequisito della prima distribuzione**, non voce di coda |
| [`Q-187`](../11_registri/02-questioni-aperte.md#q-187) - concentrazione ammessa su un solo integratore | Il vincolo sulle prove presidia la **forma**, non la **deriva delle priorità**, che si compie in passi ciascuno localmente ragionevole ed è osservabile solo in revisione |
| [`Q-11`](../11_registri/02-questioni-aperte.md#q-11) - licenze di scale e questionari clinici validati | Finché è aperta, il sistema conserva le risposte e **non calcola punteggi**, in via cautelativa e reversibile |
| [`Q-200`](../11_registri/02-questioni-aperte.md#q-200) - recepimento di `D57` e `D58` nei vincoli e nelle aree | Due vincoli in vigore e diverse aree portano ancora l'attribuzione anteriore. Una riscrittura parziale produrrebbe **due attribuzioni coesistenti**, che è peggio di una attribuzione superata |
| [`Q-201`](../11_registri/02-questioni-aperte.md#q-201) - i quattro moduli mancanti della guida dei fondamenti | Stanno sul percorso critico di due impegni distinti: il prerequisito di contribuzione e i prerequisiti di traduzione di `D56` |
| [`Q-202`](../11_registri/02-questioni-aperte.md#q-202) - sede unica della fotografia dello stato di fatto | Una fotografia scritta a mano in due sedi diverge, e queste due hanno già cominciato |

## 7. Che cosa chi adotta deve sapere prima di decidere

Otto punti. Se uno solo di essi è incompatibile con il contesto di chi legge, è meglio saperlo ora.

1. **Non è utilizzabile su pazienti reali** finché un fabbricante non appone una marcatura. Il
   progetto intende assumere quel ruolo (`D58`) ma il soggetto non esiste ancora e **nessuna data
   è dichiarata**. Se il fabbricante deve essere chi adotta, il percorso è lungo e il fattore
   limitante non è lo sviluppo.
2. **Non esiste ancora codice**, e la capacità dichiarata è **un contributore unico a tempo
   parziale** (`D54`). Ciò che si valuta oggi è una progettazione documentata, non
   un'implementazione, e l'ambito del primo rilascio è vincolato da quella capacità.
3. **Il primo rilascio conterrà una sola prestazione.** Chi ha bisogno del telemonitoraggio subito
   deve saperlo, ed è la voce in prima posizione della coda successiva.
4. **Alcune capacità non arriveranno mai**, e non per priorità: sono esclusioni di prodotto con
   categoria di riapribilità dichiarata. L'accesso di un pagatore al fascicolo non è riapribile
   finché la fonte è in vigore.
5. **Una lista di presupposti di installazione va soddisfatta**, e comprende requisiti
   infrastrutturali - isolamento di rete in uscita, separazione dei privilegi fra archivi, custodia
   della chiave radice - che non sono opzioni.
6. **Alcuni obblighi restano interamente di chi adotta**, e nessuna clausola contrattuale li
   sposta: valutazione d'impatto, notifica agli enti, approvazione dei piani, ruolo di fornitore di
   servizi verso la federazione delle identità.
7. **Nessuna data è dichiarata per un esito regolatorio.** Chi cerca una data di marcatura CE, di
   accreditamento presso la federazione delle identità o di conformità alle misure nazionali di
   sicurezza non la troverà, e la sua assenza è deliberata: per gli ultimi due perché il traguardo
   **non è del progetto** (vincolo [`V-180`](../11_registri/01-vincoli-in-vigore.md#v-180)); per la marcatura perché una pianificazione interna non
   diventa una promessa solo perché è nostra (`D57`, `D58`).
8. **Questa documentazione non è documentazione controllata.** Nessun capitolo è una procedura di
   un sistema di gestione della qualità né un documento di un fascicolo tecnico: i capitoli sono
   **ingressi** (vincolo [`V-174`](../11_registri/01-vincoli-in-vigore.md#v-174)).

## 8. Come questo capitolo resta vero

Tre regole, tutte con una conseguenza pratica.

**La fotografia si aggiorna, non si abbellisce.** Una data mancata resta nella cronologia con la
sua causa: è l'unica base su cui la stima successiva può essere migliore della precedente. Non si
sposta una data senza spostare il criterio o dichiarare la causa; non si dichiara «completato al
novanta per cento», perché i criteri di completamento sono binari per costruzione (vincolo [`V-181`](../11_registri/01-vincoli-in-vigore.md#v-181)).

**Ciò che non è verificato resta marcato.** `[NV]` indica un'affermazione non verificata su fonte
primaria, con l'indicazione di chi deve chiuderla. Nessun `[NV]` sopravvive al traguardo che ne
dipende, e in nessun caso una lacuna si colma per inferenza.

**Un testo pubblico può cambiare la destinazione d'uso di un prodotto senza toccare una riga di
codice.** È il rischio che nessuna verifica automatica intercetta: una modifica a una pagina
pubblica non passa dalla revisione del codice, non compare in una distinta di rilascio e non fa
fallire alcun controllo. Per questo è prevista una revisione regolatoria dei testi pubblici prima
della pubblicazione, con la tabella delle formule vietate come lista di controllo (questione
[`Q-174`](../11_registri/02-questioni-aperte.md#q-174), vincolo [`V-171`](../11_registri/01-vincoli-in-vigore.md#v-171)).

## Dove continuare

- [`docs/09_roadmap/00-indice.md`](../09_roadmap/00-indice.md): le tre classi di enunciato -
  impegno, intenzione, ipotesi - e la procedura con cui il piano si aggiorna.
- [`docs/09_roadmap/05-rischi-e-dipendenze.md`](../09_roadmap/05-rischi-e-dipendenze.md): il
  registro dei rischi di programma, ciascuno con indicatore anticipatore e titolare nominato.
- [`docs/03_functional/07-fuori-perimetro.md`](../03_functional/07-fuori-perimetro.md): le
  esclusioni con identificativo, categoria di riapribilità e verifica.
- [`docs/08_compliance/09-percorso-e-calendario.md`](../08_compliance/09-percorso-e-calendario.md):
  gli ottenimenti da conseguire per chi certifica, in quale ordine e con quali prerequisiti. **È la
  sede unica delle date** dell'`COMP`.
- [`docs/02_architecture/09-decisioni-rinviate.md`](../02_architecture/09-decisioni-rinviate.md):
  ciò che **non** è deciso, con i criteri per deciderlo e l'indicazione di chi decide.
