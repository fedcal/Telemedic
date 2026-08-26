---
title: Principi e metodo
sidebar_position: 2
description: Come si decide che cosa entra e che cosa esce - le quattro classi di attività, i criteri di priorità in ordine lessicografico, le attività retroattivamente irrecuperabili, il debito tecnico e il debito regolatorio, la capacità dichiarata di D54 e la regola con cui l'ambito si riduce invece di far scivolare la data.
---

# Principi e metodo

Questo capitolo esiste per una ragione precisa: **una priorità senza un criterio dichiarato è
una preferenza travestita**, e in un progetto con una data fissa e una capacità piccola le
preferenze si accumulano fino a produrre un piano che nessuno può difendere. I criteri che
seguono sono stati fissati **prima** delle decisioni del capitolo
[02 - Traguardi](./02-traguardi.md), e sono applicati a tutte le voci allo stesso modo.

---

## 1. Il problema, formulato con precisione

Telemedic ha, al 25 agosto 2026, sei grandezze e **tutte e sei sono note**:

1. Una **data di consegna decisa dal committente**: il 30 novembre 2026 è il **primo rilascio
   installabile** (`D53`, che chiude `Q-180`).
2. Una **capacità dichiarata**: **un contributore unico, a tempo parziale** (`D54`, che chiude
   `Q-181`).
3. Un perimetro funzionale ampio e già catalogato.
4. Un obbligo di tracciabilità che non ammette scorciatoie.
5. Un obbligo di traduzione integrale (`D50`), che `D56` rende **parallelo allo sviluppo** e non
   più prerequisito di ogni riga di codice.
6. Un obbligo di accessibilità che è criterio di accettazione di ogni schermata.

Fino alla terza tornata di decisioni la seconda grandezza mancava, e questo capitolo produceva
date sotto ipotesi. **Ora la capacità è un dato**, e ne discende una regola diversa e più dura:

> **Con la data fissa e la capacità dichiarata, l'unica variabile libera è l'ambito.**
> Non si negozia la data, non si inventa capacità: **si riduce l'ambito e si dichiara che cosa
> è stato tolto**, con l'indicazione di che cosa è recuperabile e che cosa no.

È una regola aritmetica, non un giudizio. Tre grandezze legano un piano - data, capacità,
ambito - e due sono fissate da una decisione del committente. La terza si determina di
conseguenza. Un piano che lasciasse l'ambito invariato non produrrebbe più lavoro: produrrebbe
**una data mancata in pubblico**, che è l'unico esito peggiore di un ambito ridotto.

Chi legge una roadmap costruita in questo modo può fare due cose che una roadmap a date secche
non consente: verificare che il perimetro dichiarato sia effettivamente costruibile, e
**vedere che cosa è stato sacrificato** invece di scoprirlo all'installazione. Il capitolo
[03 §5](./03-primo-rilascio-utilizzabile.md) è dedicato interamente a questo, ed è la parte di
quest'area che ha più valore per chi deve decidere se adottare il prodotto.

---

## 2. Le quattro classi di attività

Ogni attività del progetto appartiene a una di queste quattro classi. La classe non dipende dal
valore dell'attività: dipende da **che cosa accade se la si sposta in avanti**. È la sola
proprietà che conti in una decisione di sequenza.

| Classe | Definizione | Che cosa accade se si sposta in avanti | Comprimibile? |
|---|---|---|---|
| **A - Retroattivamente irrecuperabile** | Il suo risultato non è ricostruibile a posteriori, o lo è a un costo qualitativamente diverso | Il risultato è **perduto**, non ritardato. Nessuna quantità di lavoro successivo lo recupera | No |
| **B - A tempo di attraversamento lungo** | La durata dipende da un terzo, non dal lavoro che vi si dedica | Il ritardo si trasferisce **integralmente** alla fine della catena | No |
| **C - Sul percorso critico altrui** | Sblocca altre attività, spesso a costo proprio modesto | Blocca **n** attività a valle, e il costo del ritardo è **n** volte il costo dell'attività | No, ma è breve |
| **D - Comprimibile** | Produce valore proporzionale al lavoro dedicato, e il valore non si degrada con l'attesa | Il valore arriva più tardi. Nient'altro | Sì |

**La regola di sequenza che ne discende è banale a enunciarsi e difficile a praticarsi**: si
fanno prima A, B e C - nell'ordine, e a prescindere dal loro valore apparente - e si comprime D.

È difficile a praticarsi per una ragione psicologica documentabile: le attività di classe A, B e
C **non si vedono**. Un registro degli identificativi di requisito non si dimostra a nessuno;
una richiesta di informazioni inviata a un terzo non produce nulla di visibile per settimane; una
verifica empirica di due giorni su un meccanismo di sicurezza produce, nel caso migliore, la
conferma che ciò che si pensava era vero. Le attività di classe D, al contrario, si vedono
tutte: una schermata, un endpoint, una demo. **La pressione a invertire l'ordine è costante ed è
la principale causa di fallimento dei progetti regolati.**

---

## 3. I criteri di priorità, in ordine lessicografico

I criteri **non hanno pesi** e non si sommano. Si applicano in ordine: il criterio successivo si
usa solo a parità sul precedente. Un sistema a pesi consente di compensare un difetto di
sicurezza del paziente con un beneficio commerciale, e questa è precisamente la proprietà che
qui non si vuole.

| # | Criterio | Domanda operativa |
|---|---|---|
| **1** | **Sicurezza del paziente** | Se questa cosa manca o è fatta male, qualcuno può essere danneggiato? |
| **2** | **Irrecuperabilità** | Se la rinvio, il risultato è ancora ottenibile, e allo stesso costo? |
| **3** | **Legittimità dell'uso** | Senza questa cosa, l'uso del prodotto è lecito? Il repository può restare pubblico? |
| **4** | **Sblocco** | Quante altre attività dipendono da questa, e quanto costa il loro fermo? |
| **5** | **Valore clinico per unità di costo** | A parità di tutto il resto, che cosa produce più beneficio per l'assistito con meno lavoro? |
| **6** | **Desiderabilità** | Che cosa vorremmo, se ci fosse tempo? |

Tre osservazioni su questa scala, perché è controintuitiva e va difesa.

**Il valore clinico è quinto, non primo.** Non perché conti poco: perché è **l'unico criterio che
non si degrada con il tempo**. Una funzione clinicamente utile è altrettanto utile fra sei mesi;
un identificativo di requisito non congelato oggi è irrecuperabile fra sei mesi; una domanda non
posta oggi a un terzo produce una risposta fra sei mesi invece che fra due. Mettere il valore
clinico al primo posto significa, in pratica, sacrificare le condizioni che ne rendono possibile
la consegna.

**La sicurezza del paziente precede l'irrecuperabilità, ma raramente vi entra in conflitto.**
Nella quasi totalità dei casi le due spingono nella stessa direzione, perché ciò che rende un
sistema sanitario sicuro - tracciabilità, gestione del rischio, verificabilità delle esclusioni -
è precisamente ciò che non si ricostruisce a posteriori.

**La legittimità è terza e non prima** perché, nello stato attuale del progetto, è già
soddisfatta: le dichiarazioni obbligatorie sono pubblicate, il repository dichiara di non essere
un dispositivo medico, la separazione fra repository e distribuzione è formalizzata. Se una
soltanto di queste condizioni venisse meno, il criterio salirebbe immediatamente al primo posto,
perché la sua violazione è continuativa: non si «recupera» un periodo di pubblicazione senza
disclaimer.

---

## 4. Il rapporto fra valore clinico e costo

### 4.1 Perché la stima non si può fare, e che cosa si fa al suo posto

Una stima di costo richiede una capacità nota, una produttività osservata e un'unità di misura
condivisa. Al 25 agosto 2026 il progetto ha la prima - `D54` dichiara **un contributore unico a
tempo parziale** - e **non ha le altre due**: non ha cronologia di consegna su cui calibrare, e
non ha un'unità che attraversi lavori tanto diversi quanto la stesura di un capitolo, la
traduzione di un corpus, la scrittura di un motore di validazione e una sessione di prova con
utenti rappresentativi.

`D62`, il 26 agosto 2026, ha quantificato la capacità in **dieci-venti ore a settimana**,
chiudendo il `[NV]` che quest'area portava. **Restano mancanti le altre due condizioni**: non
esiste ancora una cronologia di consegna su cui calibrare, e non esiste un'unità di misura
condivisa. Ne discende che le durate del capitolo [02](./02-traguardi.md) **restano allocazioni
del calendario residuo** a una sequenza vincolata, e non diventano stime per il solo fatto che le
ore siano note. La differenza è sostanziale e va capita, perché determina che cosa protegge la
data:

> Una stima protegge la data prevedendo lo sforzo. Un'allocazione di calendario **non prevede
> nulla**: protegge la data soltanto se esiste, dichiarato in anticipo, **l'ordine in cui
> l'ambito viene sacrificato** quando l'allocazione si rivela insufficiente.

Quell'ordine esiste, è dichiarato in [03 §6](./03-primo-rilascio-utilizzabile.md), ed è il
meccanismo di protezione della data del 30 novembre 2026. Non è un piano di riserva: è **la parte
del piano che si esegue per prima quando la realtà si discosta**, ed è scritta prima di
discostarsi proprio perché scriverla dopo significherebbe scegliere sotto pressione.

**Ciò che si fa al posto della stima** è dichiarare tre grandezze che sono osservabili anche
senza cronologia:

1. **L'ordine di grandezza relativo**, in classi discrete e dichiarate - giorni, settimane,
   mesi, trimestri - mai numeri.
2. **La forma della curva di costo**: lineare nel volume (traduzione), a gradino (un componente
   in più da installare e sorvegliare), a soglia (una verifica che o passa o richiede un ciclo
   completo), o **non comprimibile** (attesa di un terzo).
3. **Il costo che non si vede**, elencato esplicitamente al §4.3, perché è quello che fa
   fallire le stime anche quando la capacità è nota.

### 4.2 Il beneficio clinico non è una proprietà della funzione

È una proprietà della funzione **nel percorso in cui vive**. Una funzione di refertazione
eccellente in un sistema che non consegna il documento al sistema di origine produce beneficio
zero, perché il documento resta dove il clinico non lo cerca. Ne discende il criterio di
composizione del primo rilascio, che il capitolo
[03](./03-primo-rilascio-utilizzabile.md) applica alla lettera:

> **Si consegna il percorso verticale completo più stretto possibile, non l'insieme più ampio
> possibile di funzioni.**

Un percorso verticale completo produce beneficio dal primo giorno in cui esiste, si può provare
per intero, si può mostrare, e - proprietà decisiva per un progetto regolato - **si può
tracciare per intero dal requisito alla prova**. Un insieme largo di funzioni incomplete non ha
nessuna di queste proprietà, e in più non consente di dire che cosa è fatto.

### 4.3 Il costo che non si vede

Ogni voce di questo elenco è, in un progetto sanitario regolato, dello stesso ordine di grandezza
del lavoro di realizzazione a cui si riferisce. Le stime che le ignorano sbagliano di un fattore
due o più, sistematicamente.

| Costo nascosto | Perché è dello stesso ordine di grandezza | Dove è documentato |
|---|---|---|
| **Tracciabilità requisito → progettazione → codice → prova** | Non è una relazione da registrare: è un'annotazione su ogni prova, un registro che fa fallire la costruzione su un identificativo inesistente, e un rapporto generato a ogni rilascio | [`01_technical/08-qualita-e-test.md`](../01_technical/08-qualita-e-test.md) §9 |
| **Traduzione integrale e sua non divergenza** | Il volume è quello del corpus italiano, e il controllo di divergenza in integrazione continua rende ogni modifica italiana un lavoro doppio, per sempre | `D50`; controllo `G8` in [`01_technical/09-integrazione-continua-e-rilascio.md`](../01_technical/09-integrazione-continua-e-rilascio.md) §3 |
| **Prove negative** | Ogni esclusione di perimetro ha una prova che tenta di violarla e deve fallire. Sono più numerose delle prove positive nel perimetro clinico | [`03_functional/07-fuori-perimetro.md`](../03_functional/07-fuori-perimetro.md), colonna «verifica» |
| **Accessibilità manuale e con utenti rappresentativi** | L'automazione intercetta una parte minoritaria dei difetti; il resto è sessioni con tecnologie assistive reali e con persone reali | [`01_technical/08-qualita-e-test.md`](../01_technical/08-qualita-e-test.md) §6.1 |
| **Prove su dispositivi reali** | Due criteri *mobile first* non sono verificabili su emulatore, e richiedono hardware e tempo di persona | [`01_technical/04-frontend.md`](../01_technical/04-frontend.md) §6, criteri `M4` e `M5` |
| **Ripieghi provati** | Un ripiego che non gira nella suite di prove non è un ripiego. Il costo di ogni alternativa dichiarata è il costo di mantenerla provata | [`01_technical/01-stack-e-motivazioni.md`](../01_technical/01-stack-e-motivazioni.md) §7.3 |
| **Sorveglianza dei componenti di terze parti** | È capacità **ricorrente**, non un'attività una tantum, e va sottratta dalla capacità prima di calcolare qualunque data | §9 di questo capitolo |
| **Riemissione di documenti nati fuori controllo** | Ciò che nasce fuori dal controllo dei documenti va riemesso, e riemettere costa più che emettere bene | `D45` |
| **Cicli di risposta a non conformità** | Non è lavoro del progetto ma occupa le stesse persone, e la sua durata non dipende da loro | [05 §2](./05-rischi-e-dipendenze.md), rischio `R-07` |

---

## 5. Perché alcune cose vanno fatte prima anche se rendono dopo

È il cuore di questo capitolo e la ragione per cui la sequenza del capitolo
[02](./02-traguardi.md) ha la forma che ha.

Esiste una classe di attività il cui rendimento è **differito** e il cui costo di omissione è
**crescente e non lineare**. Rinviarle è, in ogni istante, la scelta localmente razionale: non
producono nulla di visibile oggi e il loro costo apparente è tutto immediato. Il difetto del
ragionamento è che il conto non arriva quando si smette di rinviare: arriva **moltiplicato**,
nel momento in cui qualcun altro chiede di dimostrare qualcosa.

### 5.1 Le cinque attività di classe A, una per una

Sono elencate in `D45` e qui ricevono ciascuna il proprio moltiplicatore e la propria
collocazione temporale.

**1. Congelamento degli identificativi di requisito** (`RF-*`, `RNF-*`, `BR-*`, `ATT-*`, `UC-*`,
`OUT-*`) **con registro.**
*Perché è irrecuperabile*: la tracciabilità richiesta dal ciclo di vita del software per
dispositivi medici lega un requisito alla progettazione, al codice e alla prova. Se gli
identificativi cambiano dopo che il codice esiste, la matrice non si aggiorna: **si ricostruisce
a mano**, requisito per requisito, e la ricostruzione è essa stessa non verificabile perché
nessuno può dimostrare che il requisito `RF-142` di oggi sia quello di sei mesi fa.
*Stato*: gli intervalli sono congelati e dichiarati (vincolo `V-120`); manca il **registro in
sola aggiunta** e il controllo che faccia fallire la costruzione su un identificativo inesistente.
*Costo di ometterla*: non quantificabile, perché non è un ritardo: è l'impossibilità per
chiunque di certificare in seguito.

**2. Inventario dei componenti di terze parti e distinta dei materiali generata dalla prima
pipeline.**
*Perché è irrecuperabile*: censire a posteriori le dipendenze di un progetto maturo costa,
secondo la fonte richiamata da `D45`, **da tre a cinque volte** il costo di censirle mentre
entrano. La ragione è che una dipendenza entrata senza valutazione porta con sé le proprie
transitive, e il grafo va ricostruito quando nessuno ricorda perché una libreria è lì.
*Conseguenza operativa*, posta come vincolo `V-182`: **la prima pipeline precede il primo codice
applicativo.** Non «accompagna»: precede. Il controllo `G5` - un componente presente nella
distinta e assente dalle annotazioni fa fallire la costruzione - è ciò che rende la regola
effettiva invece che esortativa.

**3. Controllo dei documenti, prima di produrre altri documenti.**
*Perché è irrecuperabile*: ciò che nasce fuori dal controllo documentale va **riemesso**, e la
riemissione non è una formalità: è la ripetizione dell'approvazione con i revisori nominati e la
registrazione dell'atto.
*Osservazione sullo stato attuale*: il progetto ha già prodotto un corpo documentale ingente.
Ogni giorno in cui il controllo non esiste aumenta il volume da riemettere. **È l'attività di
classe A con il costo di omissione che cresce più rapidamente**, ed è la ragione per cui compare
nel primo traguardo del capitolo 02 e non in un traguardo successivo.
*Mitigazione realistica*: la forma proposta è quella **documenti come codice** - procedure
versionate nel repository, approvazione tramite proposta di modifica con revisori nominati,
immutabilità garantita dalla protezione dei rami e dalla firma delle revisioni - che soddisfa i
requisiti di controllo dei documenti e delle registrazioni in modo più robusto di un archivio di
file, **a condizione** che sia validata come strumento e che esista la procedura che spiega a chi
verifica come la corrispondenza fra revisione, revisore e approvazione costituisce la
registrazione di approvazione.

**4. Separazione fra repository e distribuzione, con dichiarazione pubblicata.**
*Perché è irrecuperabile*: non è il documento a essere irrecuperabile, è il **periodo di
pubblicazione senza dichiarazione**. Un artefatto reso disponibile senza l'avvertenza di non
marcatura è un'affermazione implicita che nessuna correzione successiva cancella.
*Stato*: **soddisfatta**. `NOT-A-MEDICAL-DEVICE.md` e `DISTRIBUTION-POLICY.md` sono presenti nel
repository pubblico. Resta il controllo di pipeline che impedisce la pubblicazione di un
artefatto privo della dichiarazione.

**5. Congelamento della destinazione d'uso.**
*Perché è irrecuperabile in senso proprio*: è l'unica delle cinque il cui costo di omissione non
è un moltiplicatore ma un **salto discreto**. La differenza fra «monitoraggio in tempo reale dei
parametri vitali» e «raccolta differita di parametri per la revisione periodica del
professionista» sposta la classe di rischio, la classe di sicurezza del software, il perimetro
della valutazione clinica e l'ordine di grandezza del costo (`D46`).
*Stato*: **soddisfatta**. `D55` congela la formulazione su «**raccolta differita di parametri per
la revisione periodica del professionista**», mantiene Classe IIa e classe di sicurezza software
B, ed esclude la formulazione in tempo reale. Il modello di dominio era già scritto **interamente**
su questa formulazione (vincolo `V-144`): la decisione lo conferma e non comporta riscritture.
Chiude `Q-144`.
*Conseguenza permanente, che sostituisce quella precedente*: non è più un rischio di riscrittura,
è un **divieto**. Nessuna funzione può essere aggiunta se sposta il sistema verso il tempo reale
clinico, e **la valutazione va fatta prima di scrivere la funzione, non dopo**. È il caso in cui
il §6 di questo capitolo - come si dice di no - smette di essere una procedura e diventa un
confine.

### 5.2 Le attività di classe B che il progetto assume con `D58`

`D58` **emenda `D28`, `D45`, `D49` e il vincolo `V-06` quanto al destinatario del percorso di
certificazione**: il ruolo di fabbricante sarà assunto dal progetto, e il soggetto giuridico va
costituito. Le attività che `D45` attribuiva a «chi intende certificare» diventano quindi
**attività del progetto**, e sono quattro:

1. **Costituzione e formalizzazione del soggetto fabbricante.**
2. **Nomina della persona responsabile del rispetto della normativa**, con qualifica documentabile.
3. **Richieste di informazioni agli organismi notificati.**
4. **Avvio del piano di valutazione clinica.**

Sono tutte e quattro di **classe B**: la loro durata è determinata da terzi - procedimenti
amministrativi, code di organismi, disponibilità di competenza clinica documentabile - e **non si
comprime dedicandovi più lavoro**. Ne discende la conseguenza di sequenza più importante di
questo capitolo, e va enunciata senza attenuazioni:

> **Le attività di `D58` costano poche ore e molti mesi. Vanno quindi avviate adesso, non dopo
> il primo rilascio.** Sono l'unico blocco di lavoro che `D54` non penalizza - un contributore a
> tempo parziale può inviare una richiesta di informazioni e attendere esattamente come potrebbe
> farlo un ufficio - e ogni settimana in cui non partono si trasferisce **integralmente** in
> fondo alla catena, dove nessun aumento di capacità la recupera.

Sono a calendario in [02 §5](./02-traguardi.md), con il progetto come titolare, e con una
avvertenza che accompagna ogni data di quel paragrafo e non si separa mai da essa: **sono date di
pianificazione interna, non promesse di esito.** Il divieto di `V-171` resta intero - **in nessun
luogo si scrive che il prodotto sarà marcato entro una data** - e resta intero lo stato di fatto:
oggi il prodotto **non reca marcatura CE** e chi lo installa o lo mette in servizio assume
comunque gli obblighi che ne derivano.

### 5.3 Le attività di classe C, e perché costano poco e valgono molto

Sono verifiche empiriche brevi che rimuovono un'incertezza da cui dipendono decisioni costose.
Il loro tratto comune è che **il costo della verifica è di ordini di grandezza inferiore al costo
di aver documentato un comportamento inesistente**.

| Verifica | Che cosa sblocca | Che cosa costa averla omessa | Nel perimetro ridotto |
|---|---|---|---|
| Scambio di token nel gateway con delega esplicita (`D18`) | L'intera modalità di identità federata verso l'integratore | Riprogettazione del confine di autorizzazione dopo che il codice esiste | **Sì** - è il percorso di ingresso di `RU-1` |
| Ripiego a token d'ingresso a uso singolo, emesso su canale posteriore (`D18`) | L'avvio della sessione da parte dell'integratore **senza componente incorporabile** | L'assenza di ogni via di integrazione, una volta tagliato l'incorporamento | **Sì**, e con peso maggiore di prima: nel perimetro ridotto non è un ripiego, è **la** modalità |
| Isolamento di rete in uscita del nodo di relay | La postura di sicurezza del componente più esposto | Una via di uscita verso le reti interne di chi installa | **Sì** - difesa primaria (`V-10`) |
| Difetti noti del prodotto di federazione (`D37`) chiusi in configurazione e sorvegliati da prova | La postura di sicurezza dell'identità | Una via di scalata di privilegio che ritorna al primo aggiornamento | **Sì** |
| Inoltro del contesto di autenticazione richiesto attraverso l'intermediazione (`Q-160`, `B-8`) | La propagazione del livello di garanzia, e la sua descrizione pubblica | **Rettifica di documentazione pubblica su un meccanismo di sicurezza** | **No** - segue la conformità sull'identità digitale nazionale, fuori dal perimetro ridotto. **La regola resta**: finché l'esito non è registrato, la documentazione pubblica non descrive il meccanismo |
| Contenitore di registrazione negoziato a runtime (`V-11`, `V-115`, `C-3`) | La formulazione pubblica sulla registrazione | Un'affermazione falsa per una parte del parco installato | **No** - segue la registrazione della sessione, tagliata da `RU-1` |
| Comportamento del broker in assetto a nodo singolo | Le garanzie dichiarabili nell'installazione presso il cliente | Requisiti funzionali che dipendono da garanzie non disponibili | **No** - il broker è tagliato da `RU-1` (taglio reversibile, [03 §5](./03-primo-rilascio-utilizzabile.md)) |

`D18` è esplicita sulla collocazione della prima: **spike di verifica nella prima settimana di
sviluppo, prima di ogni altra attività.** La roadmap la recepisce senza attenuazioni.

**La regola che governa l'ultima colonna**, e che vale ogni volta che l'ambito si riduce: una
verifica empirica serve a rimuovere un'incertezza da cui dipende una decisione costosa. Se la
decisione è stata rinviata insieme alla funzione, **la verifica si rinvia con essa** - ma **la
regola che essa presidiava resta in vigore**, e il documento lo dice riga per riga invece di
lasciare che la verifica sparisca portandosi via il divieto.

---

## 6. Come si dice di no

Una roadmap che non contiene un metodo per rifiutare non rifiuta: rimanda, e il rimando è
peggiore del rifiuto perché non produce una decisione.

Il progetto ha già lo strumento e non ne costruisce un secondo:
[`docs/03_functional/07-fuori-perimetro.md`](../03_functional/07-fuori-perimetro.md) §7 definisce
la procedura di ampliamento del perimetro, con un costo **proporzionato alla categoria
dell'esclusione**. La roadmap vi aggiunge tre regole di sequenza.

**Prima - la proposta parte da un caso d'uso con un attore, non da una capacità tecnica.** «Sarebbe
utile calcolare un punteggio» non è una proposta. La formulazione corretta nomina chi ha il
problema, che decisione deve prendere e che cosa gli manca oggi.

**Seconda - per le esclusioni di categoria `QUAL` la valutazione di impatto regolatorio precede
la stima dello sforzo.** L'ordine è vincolante: valutazione, poi decisione, poi pianificazione.
Stimare per primo produce l'effetto sistematico di far apparire economica una modifica che
comporta una rivalutazione di conformità.

**Terza - tre funzionalità sono a una singola storia utente dall'innalzamento di classe** e sono
sotto controllo delle modifiche per `D26` e `OUT-21`: allerta su soglia, elaborazione
dell'immagine, refertazione assistita. Una proposta che le tocchi non è una proposta di
funzione: è una proposta di modifica del dispositivo, e segue quel percorso.

---

## 7. Il debito tecnico

### 7.1 Definizione operativa

Debito tecnico è una scelta realizzativa che **riduce il costo oggi e lo aumenta domani**. Non è
un difetto - un difetto va corretto - e non è una scorciatoia inconfessata: è una decisione con
un interesse, e come tale si registra.

Il progetto adotta la classificazione a due assi - deliberato o inavvertito, prudente o
imprudente - e ne trae una regola per ciascun quadrante.

| | **Prudente** | **Imprudente** |
|---|---|---|
| **Deliberato** | «Sappiamo che la forma corretta è X, consegniamo Y perché serve ora, e Y ha un costo dichiarato» → **ammesso, con voce di registro** | «Non abbiamo tempo per farlo bene» senza sapere che cosa significhi «bene» → **non ammesso** |
| **Inavvertito** | «Adesso sappiamo come si sarebbe dovuto fare» → **fisiologico**, si registra quando emerge | «Non sapevamo che esistesse un modo corretto» → **è un difetto di competenza**, si risolve con la guida dei fondamenti, non con una voce di debito |

### 7.2 La forma della voce di registro

Una voce di debito senza queste cinque informazioni non è una voce: è una lamentela.

1. **Che cosa si è consegnato** e che cosa sarebbe la forma corretta.
2. **Perché** si è scelto così, con la data e la persona.
3. **L'interesse**: che cosa costa in più, e a chi, ogni volta che si tocca quell'area.
4. **L'innesco di estinzione**: l'evento al verificarsi del quale il debito va estinto, non una
   data. «Al secondo integratore», «prima del primo esercizio con dati reali», «prima che il
   volume superi la soglia misurata».
5. **Che cosa impedisce l'estinzione oggi**, se qualcosa lo impedisce.

### 7.3 Il debito vietato

Esistono aree in cui il debito **non è ammesso in nessuna forma**, perché il suo interesse non è
pagato dal progetto ma da una persona assistita. L'elenco è chiuso e discende dai vincoli in
vigore:

- **Registrazione degli accessi nel registro immutabile.** Nessuna consegna può ridurne la
  copertura, nemmeno temporaneamente.
- **Verifica delle chiavi della sessione.** È un controllo di rischio, non una funzione.
- **Avviso di qualità inadeguata al professionista.** Idem.
- **Emissione e recapito delle allerte cliniche.**
- **Raccolta e verifica del consenso.**
- **Isolamento fra tenant.**
- **Assenza di contenuto clinico nei registri, nelle metriche, nelle tracce e nelle buste degli
  eventi.**

La regola operativa che ne discende è già scritta nell'area tecnica e la roadmap la recepisce:
se una di queste proprietà non può essere garantita, **il sistema rifiuta di erogare la
prestazione** invece di erogarla senza. Un dispositivo che degrada silenziosamente i propri
controlli di sicurezza è più pericoloso di un dispositivo indisponibile.

---

## 8. Il debito regolatorio

È una categoria distinta dal debito tecnico e va trattata diversamente, perché ha una proprietà
che il debito tecnico non ha: **non si può rifinanziare**.

Un debito tecnico si paga quando si vuole, con gli interessi. Un debito regolatorio si paga
**quando qualcun altro decide**, e in quel momento o è pagato o il fascicolo non chiude. Non
esiste una versione ridotta del pagamento, non esiste una proroga negoziabile con sé stessi, e
non esiste la possibilità di dichiararlo accettabile: l'accettabilità la decide chi verifica.

### 8.1 Le forme che assume

| Forma | Come si presenta | Quando si paga |
|---|---|---|
| **Requisito senza prova** | Il rapporto di tracciabilità elenca il requisito nella vista «senza prove» | Alla richiesta di dimostrare la copertura |
| **Controllo di rischio senza verifica di efficacia** | Esiste la prova che la misura c'è, non quella che funziona | Alla verifica del file di gestione del rischio |
| **`[NV]` non chiuso** su un componente rilasciato | Un'affermazione tecnica non verificata è in produzione | Alla prima contestazione, o al primo incidente |
| **Divergenza fra le due lingue** | Un contenuto normativo dice due cose diverse in due lingue | È **un difetto documentale in un dispositivo medico**, non un problema di traduzione |
| **Esclusione di perimetro non verificabile** | Nella colonna «verifica» c'è una dichiarazione, non una prova | Alla prima consegna sotto pressione, quando l'esclusione rientra dalla finestra |
| **Documento prodotto fuori dal controllo** | Non ha revisore, approvazione o versione registrata | Alla riemissione, che è integrale |
| **Decisione presa d'ufficio** su una voce dichiarata rinviata | Una proposta di modifica ha risolto una questione di [`02_architecture/09-decisioni-rinviate.md`](../02_architecture/09-decisioni-rinviate.md) | Quando emerge la divergenza fra ciò che il codice fa e ciò che la documentazione dice |

### 8.2 La regola del progetto

> **Il debito regolatorio non si contrae. Si dichiara come lacuna, con la data in cui è nato.**

La differenza fra le due cose non è formale. Un debito contratto è invisibile e si scopre in
sede di verifica; una lacuna dichiarata è una riga nel rapporto di tracciabilità, con la sua
motivazione, ed è precisamente la forma che chi verifica si aspetta di trovare. Un requisito
senza prova **non blocca** la costruzione - bloccare produrrebbe l'effetto opposto, cioè prove
finte scritte per soddisfare il controllo - ma **compare nel rapporto e va giustificato al
rilascio**.

### 8.3 Il debito regolatorio già in essere, al 25 agosto 2026

Onestà minima: il progetto ne ha già. Elencarlo è la prima rata.

| Lacuna | Da quando | Chi la può chiudere |
|---|---|---|
| Controllo dei documenti non istituito, con un corpo documentale già prodotto | Dall'inizio | `COMP`, con il traguardo `T-01` |
| Nessun registro in sola aggiunta degli identificativi di requisito, benché gli intervalli siano congelati | Dall'inizio | `COMP` e `TECH`, con `T-01` |
| **Riemissione sotto controllo dei documenti già prodotti**: sotto `D54` non è eseguibile entro il 30 novembre 2026 ed è **dichiarata come lacuna**, non pianificata | Da `T-01` in avanti | `COMP`, dopo il primo rilascio. Il volume da riemettere **cresce ogni giorno**: è la lacuna con il costo di omissione più rapidamente crescente |
| Versione inglese assente per la maggior parte del corpus, con obbligo di integralità (`D50`) | Dall'inizio | `D56`: traduzione assistita area per area, **parallela allo sviluppo**. Prerequisiti non rinviabili: avvertenze pubbliche, guida dei fondamenti, aree di conformità e sicurezza |
| Numerosi `[NV]` aperti nelle aree già scritte, ciascuno con destinatario dichiarato | Progressivamente | Le aree destinatarie |
| Pagina pubblica non allineata alle riformulazioni approvate (`D19`, `D29`) | Dall'approvazione di `D19` | `Q-185` → `PROD`, `ORCH` |
| **Registrazioni a ruoli distinti non producibili** - audit interno, riesame del rilascio, verifica di configurazione eseguita da chi non ha scritto il codice | Da `D54` | **Nessuno internamente.** Non è un problema di ore: `Q-189` decide quale sottoinsieme si accetta come lacuna dichiarata e quale si copre acquisendo la funzione all'esterno |
| **Ruolo di fabbricante non ancora costituito**, mentre `D58` lo attribuisce al progetto e più passi del calendario lo presuppongono formalmente | Da `D58` | Committente, con `Q-280`. È di classe `B`: la sua durata non dipende dalla capacità di lavoro |

Le ultime due righe non sono come le altre, e la differenza va detta. Le prime cinque sono lacune
che **il lavoro chiude**: qualcuno le paga in ore e spariscono. Le ultime due **non si chiudono
lavorando di più**, perché una richiede una persona diversa e l'altra un procedimento
amministrativo. Confonderle produce piani in cui una riga irrisolvibile viene messa in coda a
righe risolvibili e sparisce dalla vista.

---

## 9. La capacità è una grandezza, e va sottratta prima di essere spesa

Il calcolo delle date parte da una capacità **netta**, non lorda. Sotto `D54` la capacità lorda è
**un contributore unico a tempo parziale**, e la sottrazione che segue non è un raffinamento: è
la differenza fra un piano e un annuncio. Le voci seguenti sono capacità ricorrente: consumano
tempo ogni mese, per sempre, e vanno sottratte prima di pianificare qualunque cosa.

| Voce ricorrente | Perché è ricorrente | Ordine di grandezza |
|---|---|---|
| Sorveglianza e aggiornamento dei componenti di terze parti | Il livello di servizio è in giorni dall'avviso (`V-185`), e la cadenza di rilascio dei componenti esposti è alta | Non trascurabile e non stimabile senza cronologia. `[NV]` |
| Mantenimento dell'allineamento fra le due lingue | Ogni modifica al contenuto italiano è incompleta finché non aggiorna l'inglese (`D50`, controllo `G8`) | **Raddoppia** il costo marginale di ogni modifica documentale |
| Manutenzione della matrice di tracciabilità | Si genera automaticamente, ma le lacune vanno giustificate a ogni rilascio | Basso, se automatizzato dall'inizio; alto se recuperato |
| Risposta alle segnalazioni e divulgazione coordinata | Il canale deve funzionare, e un canale che non risponde è peggio di un canale assente | Non stimabile senza volume osservato. `[NV]` |
| Revisione mensile della roadmap e dei rischi | È la procedura del §8.1 del capitolo [00](./00-indice.md) | Ore, non giorni |

Ne discende la formulazione che il capitolo [02](./02-traguardi.md) usa per tutte le date
interne:

> Capacità netta = capacità dichiarata − capacità ricorrente. **Le date si allocano sulla
> netta.** Un piano costruito sulla capacità lorda è già in ritardo il giorno in cui viene
> pubblicato.

Sotto `D54` c'è una seconda sottrazione, che è nuova e che pesa più della prima: **la capacità
di un contributore unico si divide fra scrivere e verificare**, e la verifica non è comprimibile
perché è ciò che rende dimostrabile il lavoro. Quando la stessa persona scrive e verifica, non
si guadagna tempo: si perde una proprietà, ed è precisamente quella che il §9-bis descrive.

### 9-bis. Ciò che una persona sola non può fare, e non per mancanza di ore

`D54` porta con sé una conseguenza che va accettata formalmente e non aggirata. Alcune
registrazioni richieste dal sistema di gestione della qualità **presuppongono soggetti distinti**,
e nessuna quantità di lavoro individuale le produce:

| Registrazione | Perché richiede due soggetti | Che cosa vale se la produce una persona sola |
|---|---|---|
| **Audit interno** | L'auditor non può auditare la propria attività: è la definizione stessa dell'audit | Nulla. Non è un audit con un difetto: **non è un audit** |
| **Riesame del rilascio** | Il riesame accerta che chi ha deciso non stia accertando sé stesso | Una registrazione formalmente presente e sostanzialmente vuota, ed è peggio dell'assenza perché è **falsamente rassicurante** |
| **Verifica di configurazione eseguita da chi non ha scritto il codice** | La verifica serve a intercettare ciò che chi ha scritto non vede, per costruzione | Nulla, per la stessa ragione |
| **Revisione esterna indipendente del codice di sicurezza critico** (`D18`) | La prescrizione dice **esterna e indipendente**, ed è una proprietà del revisore, non della revisione | Nulla |

**Non è un problema di ore.** È la ragione per cui questo capitolo pone il vincolo `V-281`:

> **Nessun traguardo entra nel piano se richiede due soggetti distinti e il secondo non esiste.**
> La registrazione che ne deriverebbe si dichiara come **lacuna, con la data in cui nasce**, e
> non si pianifica come attività. Pianificare un'attività non producibile è il modo più efficace
> di farla sparire dalla vista.

La ripartizione - quale sottoinsieme si accetta come lacuna dichiarata e quale si copre
acquisendo la funzione all'esterno - è **decisione del committente** e resta aperta come `Q-189`.
Il capitolo [03 §5](./03-primo-rilascio-utilizzabile.md) la elenca fra i tagli **irreversibili**,
perché una registrazione datata a un periodo non si produce dopo che il periodo è passato.

---

## 10. Come si tratta una data

Ogni data interna di questa roadmap è costruita con tre elementi espliciti, e i tre compaiono
sempre insieme.

**1. Il piano.** Una sequenza di traguardi con criteri binari, in ordine di dipendenza, ciascuno
con un **innesco** e un **titolare**. La sequenza è la parte robusta del piano: cambia solo se
cambiano le dipendenze, che sono poche e dichiarate.

**2. L'allocazione del calendario residuo.** Non una stima: la ripartizione dei giorni che
restano fra i traguardi della sequenza, sotto la capacità dichiarata da `D54` e con
`[NV]` sul numero di ore settimanali (§4.1).

**3. La regola di assorbimento degli scostamenti.** Che cosa succede quando un traguardo non
chiude alla sua data. La regola è dichiarata una volta e vale per tutte, ed è cambiata rispetto
alla versione precedente di questo capitolo perché è cambiato ciò che è fissato:

> Con `D53` e `D54`, **data e capacità sono fissate**. Uno scostamento **non si assorbe spostando
> la data e non si assorbe aumentando la capacità**: si assorbe **riducendo l'ambito**, secondo
> l'ordine di sacrificio dichiarato in [03 §6](./03-primo-rilascio-utilizzabile.md), che si
> esegue dall'alto e per intero. Restano fuori da quell'ordine, in ogni circostanza, i criteri di
> rilascio bloccanti di [03 §8](./03-primo-rilascio-utilizzabile.md) e l'elenco del §7.3 di
> questo capitolo, dove il debito non è ammesso in nessuna forma.

Posta come vincolo **`V-282`**. Ne discendono due proprietà, e la seconda è quella che conta:

- **Una data non si sposta in silenzio.** Se l'ambito non è più riducibile senza toccare un
  criterio bloccante, la data **si dichiara mancata** con la causa registrata (§8.2 del capitolo
  [00](./00-indice.md)). Non è un fallimento del metodo: è il metodo che funziona.
- **La scelta di che cosa sacrificare resta leggibile e reversibile.** Ogni voce dell'ordine di
  sacrificio porta scritto se il taglio è recuperabile e che cosa comporta per chi installa. Chi
  legge il rilascio può quindi ricostruire **perché il prodotto ha quella forma**, che è
  l'informazione che un elenco di funzioni consegnate non contiene.

**Che cosa questa disciplina rende impossibile**, ed è il suo scopo: consegnare un ambito ridotto
facendolo apparire come l'ambito previsto.

---

## 11. La capacità dichiarata

`D54` chiude `Q-181`. La capacità **non è più un'ipotesi**: è il dato su cui ogni allocazione si
costruisce.

> **Capacità del progetto: un contributore unico, a tempo parziale.**
> Le tre ipotesi `H1`, `H2` e `H3` che questo paragrafo conteneva sono **decadute**. Il piano di
> riferimento del capitolo [02](./02-traguardi.md) non è più costruito su `H2`: è costruito su
> questo dato.

### 11.1 Che cosa comporta, voce per voce

| Ambito | Conseguenza sotto `D54` |
|---|---|
| **Attività di classe `A`** (irrecuperabili) | **Si fanno comunque e per prime.** La capacità piccola non le rinvia: le rende più urgenti, perché il costo di ometterle non si paga in ritardo ma in impossibilità |
| **Attività di classe `B`** (durata di terzi) | **Si avviano subito**, perché costano poche ore e molti mesi. È l'unico blocco che `D54` non penalizza. Vi rientrano per intero le attività di `D58` (§5.2) |
| **Attività di classe `C`** (sbloccanti) | Ridotte al sottoinsieme che serve al perimetro effettivo del primo rilascio. Una verifica empirica su una funzione tagliata **è essa stessa una funzione tagliata** |
| **Attività di classe `D`** (comprimibili) | È da qui che viene tutta la riduzione di ambito. L'ordine è dichiarato in [03 §6](./03-primo-rilascio-utilizzabile.md) |
| **Competenze specialistiche** - usabilità, sicurezza offensiva, redazione clinica, traduzione | **Non presenti internamente.** Ciascuna è o acquisita all'esterno, o dichiarata come lacuna. Non esiste una terza possibilità, e in particolare non esiste quella di supplirvi con più ore |
| **Registrazioni a ruoli distinti** | **Non producibili**, per il §9-bis. `Q-189` |

### 11.2 La differenza fra questa formulazione e la precedente

Va detta perché è la ragione per cui il capitolo [02](./02-traguardi.md) è stato rifatto e non
corretto.

La versione precedente produceva date **sotto ipotesi**, e affidava al lettore il ricalcolo. Era
la scelta giusta finché la capacità era ignota: dichiarare un'incognita è meglio che nasconderla.
Ora la capacità è nota e quella forma diventerebbe una scusa. **Con tutte le grandezze note, un
piano che non chiuda su un ambito preciso non è prudente: è vago.**

Il capitolo [02](./02-traguardi.md) chiude quindi su un ambito preciso, e il capitolo
[03](./03-primo-rilascio-utilizzabile.md) dichiara che cosa è stato tolto per arrivarci.

---

## 12. Che cosa significa «fatto»

La definizione vale per ogni traguardo della roadmap e per ogni voce che vi entri in futuro.

Un traguardo è **fatto** quando:

1. **tutti** i suoi criteri di completamento sono soddisfatti - non la maggioranza, non i più
   importanti;
2. ciascun criterio è **verificabile da un terzo** che non ha partecipato al lavoro, con una
   procedura descritta nel traguardo stesso;
3. gli artefatti che il traguardo produce sono **pubblicati** dove il traguardo dichiara che
   saranno, e non su una macchina di qualcuno;
4. le **lacune dichiarate** che il traguardo lascia aperte sono elencate, ciascuna con il
   destinatario e l'innesco di chiusura;
5. i vincoli in vigore non sono stati violati, e se lo sono stati **la violazione è dichiarata**
   in bacheca e non taciuta.

Un traguardo che soddisfa i criteri 1–4 e non il 5 non è fatto: è un problema che si manifesterà
in un'altra area.

### 12.1 Il criterio 2 sotto `D54`, e come va letto

Il criterio 2 richiede che ciascun criterio sia **verificabile** da un terzo. Sotto `D54` va
distinto con precisione da ciò che esso **non** richiede, perché la confusione fra le due cose
produce o un piano impossibile o un piano compiacente.

| Il criterio 2 richiede | Il criterio 2 **non** richiede |
|---|---|
| Che il criterio sia formulato in modo che **chiunque** possa accertarlo con la procedura descritta - eseguendo un comando, leggendo un artefatto pubblicato, provocando deliberatamente un fallimento | Che l'accertamento sia **stato eseguito** da una persona diversa da chi ha svolto il lavoro |

La prima proprietà è **producibile** con un contributore unico e non è negoziabile: è ciò che
rende la roadmap controllabile dall'esterno, e un criterio che non la soddisfa va riformulato.
La seconda **non è producibile** (§9-bis) e non entra nei criteri di completamento: dove una
fonte la richiede - riesame del rilascio, audit interno, verifica di configurazione da parte di
chi non ha scritto il codice - la roadmap **non finge di soddisfarla**. La dichiara come lacuna,
la marca come **irreversibile** in [03 §5](./03-primo-rilascio-utilizzabile.md), e ne rinvia la
ripartizione a `Q-189`.

È la distinzione che consente di dire con precisione che cosa `RU-1` è: un rilascio i cui
criteri sono **tutti verificabili da chiunque**, e sul quale **nessuna verifica è stata eseguita
da un secondo soggetto**. Le due affermazioni sono compatibili, entrambe vere, ed entrambe vanno
scritte.

---

## 13. Le regole redazionali che quest'area si impone

Sono sette e sono verificabili sul testo.

1. **Ogni traguardo ha criteri di completamento verificabili.** Un traguardo senza criterio è un
   desiderio, e non entra. È il vincolo `V-181`.
2. **Si dichiara ciò che non entra, e perché.** Il capitolo [03](./03-primo-rilascio-utilizzabile.md)
   dedica alle esclusioni almeno lo spazio che dedica alle inclusioni, perché per chi deve
   decidere se adottare il prodotto le due informazioni hanno lo stesso valore.
3. **Niente stime inventate.** Dove un tempo non è stimabile con le informazioni disponibili, si
   dichiara che non lo è e si spiega da che cosa dipende. Una cifra inventata in una roadmap
   viene citata come dato entro due settimane.
4. **Si distingue l'impegno del progetto da quello di chi installa**, riga per riga, e non con
   un'avvertenza generale in fondo.
5. **Nessun dato reale, nessun segreto, nessun nome commerciale** (`R0`). Nessuna soglia clinica.
   Il sistema resta pienamente funzionale senza le terminologie a licenza vincolata (`V-02`,
   `V-03`), e la roadmap non pianifica nulla che lo contraddica.
6. **La roadmap è pianificazione interna del progetto** (`D57`). Nessun traguardo è attribuito a
   «terzi», a «chi certifica» o a un soggetto indefinito. Dove un passo presuppone formalmente il
   ruolo di fabbricante, il documento scrive che **quel ruolo va costituito e formalizzato**
   (`D58`, `Q-280`), con il proprio tempo, invece di spostare il passo su qualcun altro.
7. **Una data di pianificazione interna non è una promessa di esito** (`V-171`, `V-280`). In
   nessun punto di quest'area si scrive che il prodotto **sarà marcato entro una data**; in ogni
   punto in cui la marcatura è nominata si dichiara lo stato di fatto: **oggi il prodotto non
   reca marcatura CE**, non è coperto da alcuna dichiarazione di conformità, e chi lo installa,
   integra o mette in servizio assume comunque gli obblighi che ne derivano.

Le regole 6 e 7 vanno lette insieme, perché separate producono i due errori opposti. La 6 senza
la 7 trasforma un'intenzione in un impegno datato verso il mercato, che è precisamente l'effetto
regolatorio che non si vuole. La 7 senza la 6 riporta la pianificazione su un terzo indefinito e
fa sparire dal calendario attività che sono nostre e che hanno tempi di attraversamento lunghi.

---

**Prosegue in**: [02 - Traguardi](./02-traguardi.md), dove questi criteri diventano una sequenza
datata con criteri binari, un innesco e un titolare per ciascun traguardo.
