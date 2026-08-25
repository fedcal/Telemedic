---
title: Principi e metodo
sidebar_position: 2
description: Come si decide che cosa entra e che cosa esce — le quattro classi di attività, i criteri di priorità in ordine lessicografico, le attività retroattivamente irrecuperabili, il rapporto fra valore clinico e costo, il debito tecnico e il debito regolatorio, e la regola con cui una data si calcola invece di essere annunciata.
---

# Principi e metodo

Questo capitolo esiste per una ragione precisa: **una priorità senza un criterio dichiarato è
una preferenza travestita**, e in un progetto con una data fissa e una capacità non dichiarata
le preferenze si accumulano fino a produrre un piano che nessuno può difendere. I criteri che
seguono sono stati fissati **prima** delle decisioni del capitolo
[02 — Traguardi](./02-traguardi.md), e sono applicati a tutte le voci allo stesso modo.

---

## 1. Il problema, formulato con precisione

Telemedic ha, al 25 agosto 2026: una data di consegna dichiarata dal committente (30 novembre
2026, `D5`, `D16`), un perimetro funzionale ampio e già catalogato, un obbligo di tracciabilità
che non ammette scorciatoie, un obbligo di traduzione integrale, un obbligo di accessibilità che
è criterio di accettazione di ogni schermata, e **nessuna dichiarazione di capacità**.

Le prime cinque grandezze sono note. La sesta non lo è, ed è quella che determina tutte le date.
Ne discende la regola che governa l'intero capitolo:

> **Una data non si annuncia: si calcola da una capacità dichiarata e da una sequenza vincolata.**
> Se la capacità non è dichiarata, la data si esprime come funzione di un'ipotesi, e l'ipotesi
> si scrive accanto alla data.

Chi legge una roadmap costruita in questo modo può fare due cose che una roadmap a date secche
non consente: verificare se l'ipotesi regge, e **ricalcolare** la data da sé quando l'ipotesi
cambia. È un trasferimento di potere dal pianificatore al lettore, ed è deliberato.

---

## 2. Le quattro classi di attività

Ogni attività del progetto appartiene a una di queste quattro classi. La classe non dipende dal
valore dell'attività: dipende da **che cosa accade se la si sposta in avanti**. È la sola
proprietà che conti in una decisione di sequenza.

| Classe | Definizione | Che cosa accade se si sposta in avanti | Comprimibile? |
|---|---|---|---|
| **A — Retroattivamente irrecuperabile** | Il suo risultato non è ricostruibile a posteriori, o lo è a un costo qualitativamente diverso | Il risultato è **perduto**, non ritardato. Nessuna quantità di lavoro successivo lo recupera | No |
| **B — A tempo di attraversamento lungo** | La durata dipende da un terzo, non dal lavoro che vi si dedica | Il ritardo si trasferisce **integralmente** alla fine della catena | No |
| **C — Sul percorso critico altrui** | Sblocca altre attività, spesso a costo proprio modesto | Blocca **n** attività a valle, e il costo del ritardo è **n** volte il costo dell'attività | No, ma è breve |
| **D — Comprimibile** | Produce valore proporzionale al lavoro dedicato, e il valore non si degrada con l'attesa | Il valore arriva più tardi. Nient'altro | Sì |

**La regola di sequenza che ne discende è banale a enunciarsi e difficile a praticarsi**: si
fanno prima A, B e C — nell'ordine, e a prescindere dal loro valore apparente — e si comprime D.

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
sistema sanitario sicuro — tracciabilità, gestione del rischio, verificabilità delle esclusioni —
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
condivisa. Al 25 agosto 2026 il progetto non ha nessuna delle tre: non ha una capacità
dichiarata (`Q-181`), non ha cronologia di consegna su cui calibrare, e non ha un'unità che
attraversi lavori tanto diversi quanto la stesura di un capitolo, la traduzione di un corpus, la
scrittura di un motore di validazione e una sessione di prova con utenti rappresentativi.

**Ciò che si fa al posto della stima** è dichiarare tre grandezze che sono osservabili anche
senza cronologia:

1. **L'ordine di grandezza relativo**, in classi discrete e dichiarate — giorni, settimane,
   mesi, trimestri — mai numeri.
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
per intero, si può mostrare, e — proprietà decisiva per un progetto regolato — **si può
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
applicativo.** Non «accompagna»: precede. Il controllo `G5` — un componente presente nella
distinta e assente dalle annotazioni fa fallire la costruzione — è ciò che rende la regola
effettiva invece che esortativa.

**3. Controllo dei documenti, prima di produrre altri documenti.**
*Perché è irrecuperabile*: ciò che nasce fuori dal controllo documentale va **riemesso**, e la
riemissione non è una formalità: è la ripetizione dell'approvazione con i revisori nominati e la
registrazione dell'atto.
*Osservazione sullo stato attuale*: il progetto ha già prodotto un corpo documentale ingente.
Ogni giorno in cui il controllo non esiste aumenta il volume da riemettere. **È l'attività di
classe A con il costo di omissione che cresce più rapidamente**, ed è la ragione per cui compare
nel primo traguardo del capitolo 02 e non in un traguardo successivo.
*Mitigazione realistica*: la forma proposta è quella **documenti come codice** — procedure
versionate nel repository, approvazione tramite proposta di modifica con revisori nominati,
immutabilità garantita dalla protezione dei rami e dalla firma delle revisioni — che soddisfa i
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
*Stato*: il modello di dominio è scritto **interamente** sulla seconda formulazione (vincolo
`V-144`), e nessun artefatto del progetto usa la prima. Manca la **conferma formale del
committente** al congelamento: è la questione `Q-144`, aperta e indirizzata a `ORCH`.
*Conseguenza per la roadmap*: finché `Q-144` è aperta, ogni lavoro sul contesto di
telemonitoraggio è lavoro **a rischio di riscrittura**. È il motivo per cui il telemonitoraggio
non è nel percorso verticale del primo rilascio (capitolo
[03 §4](./03-primo-rilascio-utilizzabile.md)).

### 5.2 Le attività di classe B che il progetto **non** assume

Coerentemente con `D49` e con il vincolo `V-06`, il progetto **non** costituisce un soggetto
fabbricante, **non** nomina una persona responsabile del rispetto della normativa, **non** invia
richieste di informazioni agli organismi di valutazione della conformità e **non** avvia la
valutazione clinica. Sono attività di classe B — durata determinata da terzi, non comprimibile —
ma gravano su **chi intende certificare**, e la roadmap le riporta soltanto come traguardi di
terzi in [02 §5](./02-traguardi.md), con la fonte e senza assumerle.

La distinzione ha una conseguenza pratica che va scritta: **chi intende certificare deve avviare
quelle attività adesso**, indipendentemente dalla roadmap del progetto, perché il loro tempo di
attraversamento è maggiore del tempo residuo del progetto. Il manuale operativo che le descrive
è il deliverable richiesto da `D20`, in `docs/08_compliance/`.

### 5.3 Le attività di classe C, e perché costano poco e valgono molto

Sono verifiche empiriche brevi che rimuovono un'incertezza da cui dipendono decisioni costose.
Il loro tratto comune è che **il costo della verifica è di ordini di grandezza inferiore al costo
di aver documentato un comportamento inesistente**.

| Verifica | Che cosa sblocca | Che cosa costa averla omessa |
|---|---|---|
| Scambio di token nel gateway con delega esplicita (`D18`) | L'intera modalità di identità federata verso l'integratore | Riprogettazione del confine di autorizzazione dopo che il codice esiste |
| Inoltro del contesto di autenticazione richiesto attraverso l'intermediazione (`Q-160`, `B-8`) | La propagazione del livello di garanzia, e la sua descrizione pubblica | **Rettifica di documentazione pubblica su un meccanismo di sicurezza** |
| Contenitore di registrazione negoziato a runtime (`V-11`, `V-115`, `C-3`) | La formulazione pubblica sulla registrazione | Un'affermazione falsa per una parte del parco installato |
| Difetti noti del prodotto di federazione (`D37`) chiusi in configurazione e sorvegliati da prova | La postura di sicurezza dell'identità | Una via di scalata di privilegio che ritorna al primo aggiornamento |
| Comportamento del broker in assetto a nodo singolo | Le garanzie dichiarabili nell'installazione presso il cliente | Requisiti funzionali che dipendono da garanzie non disponibili |

`D18` è esplicita sulla collocazione della prima: **spike di verifica nella prima settimana di
sviluppo, prima di ogni altra attività.** La roadmap la recepisce senza attenuazioni.

---

## 6. Come si dice di no

Una roadmap che non contiene un metodo per rifiutare non rifiuta: rimanda, e il rimando è
peggiore del rifiuto perché non produce una decisione.

Il progetto ha già lo strumento e non ne costruisce un secondo:
[`docs/03_functional/07-fuori-perimetro.md`](../03_functional/07-fuori-perimetro.md) §7 definisce
la procedura di ampliamento del perimetro, con un costo **proporzionato alla categoria
dell'esclusione**. La roadmap vi aggiunge tre regole di sequenza.

**Prima — la proposta parte da un caso d'uso con un attore, non da una capacità tecnica.** «Sarebbe
utile calcolare un punteggio» non è una proposta. La formulazione corretta nomina chi ha il
problema, che decisione deve prendere e che cosa gli manca oggi.

**Seconda — per le esclusioni di categoria `QUAL` la valutazione di impatto regolatorio precede
la stima dello sforzo.** L'ordine è vincolante: valutazione, poi decisione, poi pianificazione.
Stimare per primo produce l'effetto sistematico di far apparire economica una modifica che
comporta una rivalutazione di conformità.

**Terza — tre funzionalità sono a una singola storia utente dall'innalzamento di classe** e sono
sotto controllo delle modifiche per `D26` e `OUT-21`: allerta su soglia, elaborazione
dell'immagine, refertazione assistita. Una proposta che le tocchi non è una proposta di
funzione: è una proposta di modifica del dispositivo, e segue quel percorso.

---

## 7. Il debito tecnico

### 7.1 Definizione operativa

Debito tecnico è una scelta realizzativa che **riduce il costo oggi e lo aumenta domani**. Non è
un difetto — un difetto va corretto — e non è una scorciatoia inconfessata: è una decisione con
un interesse, e come tale si registra.

Il progetto adotta la classificazione a due assi — deliberato o inavvertito, prudente o
imprudente — e ne trae una regola per ciascun quadrante.

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
senza prova **non blocca** la costruzione — bloccare produrrebbe l'effetto opposto, cioè prove
finte scritte per soddisfare il controllo — ma **compare nel rapporto e va giustificato al
rilascio**.

### 8.3 Il debito regolatorio già in essere, al 25 agosto 2026

Onestà minima: il progetto ne ha già. Elencarlo è la prima rata.

| Lacuna | Da quando | Chi la può chiudere |
|---|---|---|
| Controllo dei documenti non istituito, con un corpo documentale già prodotto | Dall'inizio | `COMP`, con il traguardo `T-01` |
| Nessun registro in sola aggiunta degli identificativi di requisito, benché gli intervalli siano congelati | Dall'inizio | `COMP` e `TECH`, con `T-01` |
| Area di conformità assente; documento di ricerca sul percorso di certificazione **troncato** (`Q-25`) | Dalla fase di ricerca | `ORCH`, poi `COMP` |
| Versione inglese assente per intero, con obbligo di integralità (`D50`) | Dall'inizio | `Q-182` → `ORCH` |
| Numerosi `[NV]` aperti nelle aree già scritte, ciascuno con destinatario dichiarato | Progressivamente | Le aree destinatarie |
| Destinazione d'uso non formalmente congelata (`Q-144`) | Dalla fase di dominio | → `ORCH` |
| Pagina pubblica non allineata alle riformulazioni approvate (`D19`, `D29`) | Dall'approvazione di `D19` | `Q-185` → `PROD`, `ORCH` |

---

## 9. La capacità è una grandezza, e va sottratta prima di essere spesa

Il calcolo delle date parte da una capacità **netta**, non lorda. Le voci seguenti sono capacità
ricorrente: consumano tempo ogni mese, per sempre, e vanno sottratte prima di pianificare
qualunque cosa.

| Voce ricorrente | Perché è ricorrente | Ordine di grandezza |
|---|---|---|
| Sorveglianza e aggiornamento dei componenti di terze parti | Il livello di servizio è in giorni dall'avviso (`V-185`), e la cadenza di rilascio dei componenti esposti è alta | Non trascurabile e non stimabile senza cronologia. `[NV]` |
| Mantenimento dell'allineamento fra le due lingue | Ogni modifica al contenuto italiano è incompleta finché non aggiorna l'inglese (`D50`, controllo `G8`) | **Raddoppia** il costo marginale di ogni modifica documentale |
| Manutenzione della matrice di tracciabilità | Si genera automaticamente, ma le lacune vanno giustificate a ogni rilascio | Basso, se automatizzato dall'inizio; alto se recuperato |
| Risposta alle segnalazioni e divulgazione coordinata | Il canale deve funzionare, e un canale che non risponde è peggio di un canale assente | Non stimabile senza volume osservato. `[NV]` |
| Revisione mensile della roadmap e dei rischi | È la procedura del §8.1 del capitolo [00](./00-indice.md) | Ore, non giorni |

Ne discende la formulazione che il capitolo [02](./02-traguardi.md) usa per tutte le date
interne:

> Capacità netta = capacità dichiarata − capacità ricorrente. **Le date si calcolano sulla
> netta.** Un piano costruito sulla capacità lorda è già in ritardo il giorno in cui viene
> pubblicato.

---

## 10. Come si tratta una data

Ogni data interna di questa roadmap è costruita con tre elementi espliciti, e i tre compaiono
sempre insieme.

**1. Il piano di riferimento.** Una sequenza di traguardi con criteri binari, in ordine di
dipendenza. La sequenza è la parte robusta del piano: cambia solo se cambiano le dipendenze, che
sono poche e dichiarate.

**2. L'ipotesi di capacità dichiarata.** La data si ottiene applicando alla sequenza un'ipotesi
di capacità netta, scritta accanto alla data. Le ipotesi sono al §11.

**3. La regola di ricalcolo.** Che cosa succede alla data se l'ipotesi cambia. La regola è
dichiarata una volta e vale per tutte:

> Se la capacità netta effettiva è una frazione `k` di quella ipotizzata, la durata delle
> attività di **classe D** si divide per `k`. Le attività di **classe A, B e C non si comprimono
> né si dilatano con la capacità**: A e C hanno una durata propria breve e vanno fatte comunque;
> B ha una durata determinata da terzi. Ne discende la proprietà che rende utile questa regola:
> **una riduzione di capacità sposta il primo rilascio, non i traguardi di classe A.** Se li
> sposta, il piano è stato costruito male.

**Che cosa questa disciplina rende impossibile**, ed è il suo scopo: annunciare una data e poi
scoprire che dipendeva da un'assunzione che nessuno aveva scritto.

---

## 11. Le tre ipotesi di capacità

La capacità del progetto **non è dichiarata** ed è la questione `Q-181`, indirizzata al
committente. In sua assenza la roadmap non rinuncia a produrre date: le produce **sotto ipotesi
dichiarata**, e dichiara quale ipotesi ha usato.

| Ipotesi | Contenuto | Che cosa comporta |
|---|---|---|
| **H1 — minima** | Una persona in continuità sul progetto, con competenze generaliste; competenze specialistiche (usabilità, sicurezza offensiva, redazione clinica, traduzione) **assenti** | Le attività di classe A e C sono comunque eseguibili. Il corpo documentale si chiude; la traduzione integrale **non** si chiude; il software non supera lo scheletro |
| **H2 — di riferimento** | Una persona in continuità sullo sviluppo, più competenze specialistiche acquisite puntualmente all'esterno per usabilità, verifica di sicurezza indipendente e traduzione | Il corpo documentale e il sito si chiudono. Il software raggiunge un percorso verticale provato. Il primo rilascio installabile **non** cade entro il 30 novembre 2026 |
| **H3 — estesa** | Più contributori in continuità, con separazione dei ruoli, e un responsabile qualità distinto da chi sviluppa | Diventa discutibile un primo rilascio installabile entro il 30 novembre 2026, **a condizione** che le attività di classe A siano già chiuse e che il perimetro sia quello del capitolo [03](./03-primo-rilascio-utilizzabile.md) |

**Il piano di riferimento del capitolo [02](./02-traguardi.md) è costruito su `H2`**, ed è
dichiarato. Sotto `H1` le date dei traguardi di classe D si spostano secondo la regola del §10;
le date dei traguardi di classe A **non si spostano**, perché sotto `H1` restano comunque le
attività prioritarie.

Va detto con chiarezza che nessuna delle tre ipotesi è una previsione: sono tre scenari, e la
scelta di quale sia vero è del committente, non del pianificatore. Finché `Q-181` è aperta,
**ogni data interna di questa roadmap è condizionata e va letta come tale**.

---

## 12. Che cosa significa «fatto»

La definizione vale per ogni traguardo della roadmap e per ogni voce che vi entri in futuro.

Un traguardo è **fatto** quando:

1. **tutti** i suoi criteri di completamento sono soddisfatti — non la maggioranza, non i più
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

---

## 13. Le regole redazionali che quest'area si impone

Sono cinque e sono verificabili sul testo.

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

---

**Prosegue in**: [02 — Traguardi](./02-traguardi.md), dove questi criteri diventano una sequenza
datata con criteri binari.
