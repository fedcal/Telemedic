---
title: Rischi e dipendenze
sidebar_position: 6
description: Il registro dei rischi di programma — trenta voci con probabilità dichiarata, impatto sul calendario, indicatore anticipatore, risposta e titolare — il rischio dominante della data ravvicinata con capacità dichiarata bassa, le funzioni che richiedono soggetti distinti, le dipendenze esterne famiglia per famiglia e la procedura con cui il registro si sorveglia.
---

# Rischi e dipendenze

> **Questo è il registro dei rischi di programma, e la parola «programma» è la parte vincolante.**
> Qui si misura una sola grandezza: **l'effetto sul calendario e sulla consegnabilità**. I rischi per
> la sicurezza dell'assistito non appartengono a questo registro, hanno una disciplina propria, una
> scala propria e un file proprio, e mescolarli produrrebbe il danno peggiore che un documento di
> pianificazione possa produrre: far apparire negoziabile un rischio clinico perché sta in una
> tabella accanto a un ritardo.

> **Che cosa è cambiato in questa revisione.** `D53` conferma la data del primo rilascio installabile;
> `D54` dichiara la capacità; `D57` stabilisce che **la pianificazione è del progetto** e non di
> soggetti terzi; `D58` attribuisce al progetto il ruolo di fabbricante, ancora da costituire. Ne
> discende che **i rischi il cui titolare era «chi certifica» sono ora rischi del progetto**, con
> l'impatto ricalcolato su di noi, e che tre voci nuove entrano in registro: `R-28`, `R-29` e `R-30`.
> Una voce — `R-01` — **si chiude**, perché la condizione che la produceva è stata rimossa.

---

## 1. Che cosa entra qui, e con quale forma

### 1.1 Il confine con la gestione del rischio clinico

I rischi che riguardano la sicurezza della persona assistita sono governati dal file di gestione del
rischio del pacchetto regolatorio, in
[`docs/08_compliance/05-gestione-del-rischio.md`](../08_compliance/05-gestione-del-rischio.md), con la
propria analisi, la propria stima, le proprie misure di controllo e la **verifica di efficacia** di
ciascuna misura. Questo registro **vi rinvia e non li riscrive**.

La distinzione è operativa e si applica con una domanda sola:

> **Se questo accade, chi ne subisce l'effetto?** Se la risposta è «una persona assistita», la voce
> non è qui. Se la risposta è «il calendario, il perimetro o la consegnabilità», la voce è qui.

**Un rischio di programma può avere un rischio clinico come conseguenza indiretta**, e in quel caso
compare in entrambi i registri con due formulazioni diverse. Il caso tipico è `R-23`, la deriva del
perimetro: sul calendario produce una rivalutazione di conformità; sul piano clinico produce una
funzione che interpreta senza essere stata valutata come tale. **Le due voci non si sostituiscono a
vicenda.**

**Nessuna voce di questo registro ha come risposta «si accetta il rischio clinico».** Dove la risposta
a un rischio di programma toccherebbe un controllo di rischio clinico, la risposta ammessa è una sola:
**si riduce l'ambito, e se l'ambito non è più riducibile la data si dichiara mancata** — mai si
comprime il controllo. È la traduzione, sul piano del tempo, del divieto di debito su registro degli
accessi, verifica delle chiavi, avviso di qualità, allerte, consenso, isolamento fra tenant e assenza
di contenuto clinico nei registri, elencato in [01 §7.3](./01-principi-e-metodo.md) e ripreso come
terza regola dell'ordine di sacrificio in [03 §6.1](./03-primo-rilascio-utilizzabile.md).

### 1.2 La scala di probabilità, definita prima delle voci

Non esistono percentuali in questo registro. Una percentuale su un progetto senza cronologia di
consegna è un numero che qualcuno citerà come dato entro due settimane, e sarebbe inventato.

| Classe | Definizione operativa |
|---|---|
| **Accertato** | Non è un rischio: è **già accaduto**. Resta in registro perché ne va sorvegliata l'evoluzione e perché la risposta è ancora aperta |
| **Alta** | Esistono **già oggi** le condizioni che lo producono, e non esiste una misura in vigore che le rimuova |
| **Media** | Le condizioni che lo producono sono plausibili nel periodo considerato, oppure esistono ma sono parzialmente presidiate |
| **Bassa** | Richiede il concorso di più circostanze indipendenti, oppure è presidiato da una misura verificata |
| **Non stimabile** | Dipende da una variabile di cui il progetto non ha né osservazione né fonte. **Si dichiara, non si stima** |

### 1.3 La scala di impatto, che misura il calendario e nient'altro

| Classe | Effetto |
|---|---|
| **I1** | Giorni. Assorbibile dentro il traguardo colpito |
| **I2** | Settimane. Sposta il traguardo colpito, non i successivi se esiste margine |
| **I3** | Mesi. Sposta il traguardo colpito **e la catena a valle** |
| **I4** | Il traguardo colpito **non è raggiungibile** nella forma dichiarata. Richiede una riformulazione, non un rinvio |
| **I5** | **Irrecuperabile.** Il risultato non è ottenibile in seguito, a nessun costo |

**La classe `I5` è la ragione per cui questo registro esiste in questa posizione della roadmap.** Un
rischio `I5` con probabilità anche solo media vale più di dieci rischi `I2` con probabilità alta, e
nessuna somma pesata deve poter produrre il contrario.

**Una precisazione che `D54` rende necessaria.** Con il piano del capitolo
[02](./02-traguardi.md) privo di margine di tempo, la scala va letta diversamente: **`I2` e `I3` non
producono più uno slittamento, producono una riduzione di ambito**, perché la data è fissata e il
margine sta nell'ambito ([01 §10](./01-principi-e-metodo.md), vincolo `V-282`). Un rischio `I2` che si
materializza consuma una riga dell'ordine di sacrificio di
[03 §6](./03-primo-rilascio-utilizzabile.md), e l'ordine ha sette righe.

### 1.4 Le quattro risposte ammesse

**Evitare** — si rimuove la condizione che lo produce. **Ridurre** — si abbassa la probabilità o
l'impatto con una misura verificabile. **Trasferire** — si sposta su un soggetto che è nella posizione
di sostenerlo. **Accettare** — si dichiara e si sorveglia, senza misura.

Sul trasferimento vale un limite non negoziabile: **nessun rischio si trasferisce su chi installa o
sull'assistito per il tramite di una clausola.** La licenza permissiva del progetto vale fra le parti,
non verso il danneggiato, e la fonte europea in materia di responsabilità da prodotto difettoso vieta
l'esclusione contrattuale della responsabilità verso di lui — **e con `D58` questo vale con più forza,
non con meno**. Il trasferimento ammesso è quello **verso chi ha già l'obbligo per legge** — chi
installa, il titolare del trattamento — e consiste nel dichiararlo, non nell'imporlo.

`D57` restringe ulteriormente le risposte disponibili, e va detto: **non è più ammesso trasferire un
rischio a «chi certifica»**, perché chi certifica siamo noi. Dove la versione precedente di questo
registro trasferiva con dichiarazione, ora si riduce o si accetta.

### 1.5 La forma di una voce, e il vincolo che la governa

Ogni voce porta: che cos'è, probabilità, impatto sul calendario, **indicatore anticipatore**, risposta,
titolare. Posto come vincolo `V-189`:

> **Ogni rischio del registro ha un indicatore anticipatore osservabile e un titolare nominato. Un
> rischio senza indicatore non si sorveglia: va riformulato o chiuso.**

Il **titolare** è chi ha l'autorità di attuare la risposta, non chi ne subisce l'effetto.

---

## 2. Il registro

### 2.1 Capacità e organizzazione

> **`R-01` — La capacità del progetto non è dichiarata** · **CHIUSO**
> *Chiuso il 25 agosto 2026 da `D54`* · *Titolare della chiusura* **committente**

**Perché si chiude, e non semplicemente sparisce.** La regola del §5.2 è che un rischio si chiude solo
se la condizione che lo produce è stata rimossa e la rimozione è verificabile. `D54` dichiara la
capacità — **un contributore unico, a tempo parziale** — e chiude `Q-181`: la condizione è rimossa e la
rimozione è verificabile leggendo la decisione. Le tre ipotesi `H1`, `H2` e `H3` su cui la roadmap
produceva date sono decadute ([01 §11](./01-principi-e-metodo.md)).

**Che cosa non si chiude con esso.** La capacità **dichiarata** non è la capacità **sufficiente**. Il
rischio che ne discende è nuovo, ha un'altra forma e un altro indicatore, ed è `R-28`. Cancellare
`R-01` senza aprire `R-28` avrebbe prodotto l'illusione che una decisione risolva un'aritmetica.

> **`R-28` — Data pubblica ravvicinata con capacità dichiarata bassa**
> *Probabilità* **Alta** · *Impatto* **I4** · *Titolare* **committente**, con il contributore unico
> per l'esecuzione dell'ordine di sacrificio

**Che cos'è, ed è il rischio dominante dell'intero piano fino al 30 novembre 2026.** `D53` fissa in
pubblico una data a novantasette giorni; `D54` dichiara una capacità di un contributore unico a tempo
parziale, di cui `[NV]` il numero di ore settimanali **non è dichiarato**. Il piano del capitolo
[02](./02-traguardi.md) alloca l'intero calendario residuo a nove traguardi e **non ha margine di
tempo**: nove barre su dieci sono critiche.

**Che cosa il rischio non è**, e va detto per non confonderlo con altro. Non è che la decisione sia
sbagliata: la decisione è presa e non si rilitiga. Non è che il lavoro sia impossibile: l'ambito è
stato ridotto perché sia possibile. **È che il margine, essendo tutto nell'ambito, si consuma in modo
silenzioso**: ogni scostamento mangia una riga dell'ordine di sacrificio senza che nessuno debba
annunciarlo, e quando l'ordine finisce non resta niente da tagliare che non sia un criterio bloccante.

**La forma in cui si materializza.** Non uno slittamento — la data è fissa — ma una delle due:

1. **Un rilascio più povero di quanto dichiarato**, se l'ordine di sacrificio viene eseguito senza
   essere registrato: è l'esito peggiore, perché la scelta di che cosa sacrificare **smette di essere
   leggibile**, che è esattamente ciò che `D53` obbliga a garantire.
2. **Una data mancata in pubblico**, se l'ordine si esaurisce. È l'esito dichiarato e previsto, ed è
   preferibile al primo.

**Indicatore anticipatore, ed è misurabile ogni settimana.** **Il numero di righe dell'ordine di
sacrificio di [03 §6.2](./03-primo-rilascio-utilizzabile.md) ancora disponibili.** Sono sette. Una
revisione che ne registri il consumo di due nello stesso mese anticipa l'esaurimento prima della data.
Indicatore secondario: **un traguardo del capitolo [02](./02-traguardi.md) che non chiude entro la
propria data senza che una riga dell'ordine sia stata consumata** — significa che lo scostamento è
stato assorbito in silenzio, che è la condizione che precede l'esito 1.

**Risposta.** *Ridurre*, con quattro misure tutte già in vigore:

- **L'ambito è già ridotto e la riduzione è dichiarata voce per voce**
  ([03 §5](./03-primo-rilascio-utilizzabile.md)), con la reversibilità di ciascun taglio.
- **L'ordine di sacrificio è scritto in anticipo** ([03 §6](./03-primo-rilascio-utilizzabile.md)),
  perché scriverlo dopo significherebbe sceglierlo sotto pressione.
- **Nell'ordine entrano soltanto tagli reversibili**, e i criteri di rilascio bloccanti e l'elenco del
  debito vietato non vi entrano mai (`V-282`).
- **La revisione passa da mensile a settimanale nelle ultime sei settimane**, dal 19 ottobre 2026, con
  il solo contenuto del conteggio delle righe residue e dei criteri chiusi. Una revisione mensile su un
  piano senza margine osserva il fenomeno quando è finito.

*Accettare* il residuo, dichiarandolo: con data e capacità fissate, un residuo esiste per costruzione e
nessuna misura di pianificazione lo elimina.

> **`R-02` — Concentrazione della conoscenza su un unico contributore**
> *Probabilità* **Accertato** · *Impatto* **I4** · *Titolare* **committente**

**Che cos'è.** `D54` dichiara un contributore unico: la conoscenza del progetto risiede in una sola
persona, e la sua indisponibilità non ritarda il progetto, **lo ferma**. Non è più un'ipotesi da
sorvegliare — era `Alta` sotto `H1` e `H2` — è un dato **accertato**.

**Indicatore anticipatore.** Il tempo che intercorre fra la pubblicazione della guida dei fondamenti e
**la prima proposta di modifica accettata da una persona diversa dal contributore unico**. Finché quel
tempo non ha un termine, la misura di riduzione non è stata verificata: è stata solo pubblicata.
Indicatore secondario, e più immediato: l'**assenza di un profilo minimo praticabile dichiarato** per
l'ambiente locale (`Q-191`), senza il quale la condizione che rende possibile la partecipazione di un
contributore esterno **non è verificabile**.

**Risposta.** *Ridurre*, con tre misure in vigore o pianificate: la guida dei fondamenti `D35`, che
esiste per rendere il progetto apprendibile da un estraneo; il modello «documenti come codice», che
rende la cronologia delle decisioni leggibile senza chiedere a nessuno; l'ambiente di sviluppo
avviabile su una macchina disconnessa da tutto (`V-190`). *Accettare* il residuo.

**Che cosa questo rischio non copre più.** La parte relativa alle **registrazioni a ruoli distinti**,
che nella versione precedente era una sua componente, è stata **estratta in `R-29`**. La ragione non è
redazionale: sono rischi di natura diversa. `R-02` è un rischio di **continuità** — se la persona resta,
non si materializza — mentre `R-29` è **già materializzato ogni giorno che il progetto lavora**, e
nessuna presenza lo attenua.

> **`R-29` — Le registrazioni a ruoli distinti non sono producibili, e la lacuna si ripete a ogni
> rilascio**
> *Probabilità* **Accertato** · *Impatto* **I5** · *Titolare* **committente**

**Che cos'è.** Alcune registrazioni richieste dal sistema di gestione della qualità **presuppongono
soggetti distinti**: **audit interno**, **riesame del rilascio**, **verifica di configurazione eseguita
da chi non ha scritto il codice**, **revisione esterna indipendente del codice di sicurezza critico**
prescritta da `D18`. Sotto `D54` **non sono producibili internamente**, e **non per mancanza di ore**:
un auditor non audita la propria attività, un riesame non accerta chi lo conduce, una verifica
indipendente non è indipendente se la esegue l'autore ([01 §9-bis](./01-principi-e-metodo.md)).

**Perché l'impatto è `I5` e non `I3`.** Perché una registrazione di riesame **di un rilascio già
avvenuto** non è un riesame: è una ricostruzione, e chi verifica la riconosce come tale. Lo stesso vale
per un audit riferito a un periodo concluso. **La lacuna resta datata a `RU-1` per sempre**, e ciò che
si acquisisce dopo vale dai rilasci successivi in avanti (`OL-22`).

**Perché è il rischio che peggiora da solo.** Perché **la perdita si ripete**: ogni rilascio prodotto
nelle stesse condizioni aggiunge una riga all'elenco delle lacune datate, invece di lasciarlo costante.
È l'unica voce del registro con questa proprietà, ed è la ragione per cui `OL-22` è in prima posizione
nella coda di [04 §3](./04-oltre-il-primo-rilascio.md).

**Indicatore anticipatore.** Il superamento del **30 settembre 2026** senza decisione su `Q-189`. È un
punto di decisione irreversibile dichiarato in [02 §6](./02-traguardi.md): oltre quella data l'esito
predefinito è la lacuna dichiarata su `RU-1`. Indicatore continuo, per i rilasci successivi: **il
numero di lacune datate nell'elenco del fascicolo di rilascio**, che deve smettere di crescere.

**Risposta.** *Ridurre* per la parte che si acquisisce all'esterno, secondo la ripartizione che `Q-189`
deve decidere. *Accettare formalmente* per il resto — e «formalmente» è la parola vincolante: una
lacuna accettata è **una decisione registrata con motivazione, titolare e data**, non un silenzio
(criterio 2 di `OL-22`). Ciò che il progetto fa comunque, e che non sostituisce la verifica
indipendente ma è ciò che resta producibile:

- tutti i criteri di `RU-1` restano **verificabili da chiunque** con la procedura descritta
  ([01 §12.1](./01-principi-e-metodo.md));
- il fascicolo di rilascio **dichiara esplicitamente, in entrambe le lingue, che nessuna verifica è
  stata eseguita da un secondo soggetto** (criterio bloccante 17 di
  [03 §8](./03-primo-rilascio-utilizzabile.md));
- la procedura di verifica lato deployer è pubblicata perché **chi installa la esegua**: in `RU-1` è
  l'unica verifica indipendente che esisterà ([03 §10](./03-primo-rilascio-utilizzabile.md)).

**Il vincolo che ne discende**, posto come `V-281`: **nessun traguardo entra nel piano se richiede due
soggetti distinti e il secondo non esiste.** Si dichiara come lacuna con la data in cui nasce, non si
pianifica come attività — perché pianificare un'attività non producibile è il modo più efficace di
farla sparire dalla vista.

> **`R-12` — La capacità ricorrente di sorveglianza consuma capacità di sviluppo**
> *Probabilità* **Accertato** · *Impatto* **I2 ricorrente** · *Titolare* **progetto**

**Che cos'è.** Il livello di servizio di aggiornamento dei componenti di terze parti si esprime in
**giorni dalla pubblicazione dell'avviso, differenziato per gravità** (`V-185`), e consuma capacità
**ogni mese, per sempre**. L'osservazione che lo fonda è misurata: il nodo di relay ha avuto quattordici
rilasci in poco più di sette mesi, cinque nel solo mese di agosto 2026, con una vulnerabilità critica
corretta a metà percorso.

**Perché sotto `D54` pesa più di prima.** Perché la capacità ricorrente si sottrae da una capacità
lorda che è **una persona a tempo parziale**: la frazione sottratta è la stessa in valore assoluto e
molto maggiore in proporzione. È la ragione per cui `TG-04` — il taglio del broker — è l'unico taglio
che alleggerisce anche il progetto e non solo chi installa: un componente esposto in meno è
sorveglianza ricorrente in meno.

**Quantificazione.** `[NV]` — non stimabile senza cronologia di consegna propria. Ciò che si dichiara è
la **regola**: la capacità ricorrente si sottrae **prima** di calcolare qualunque data
([01 §9](./01-principi-e-metodo.md)).

**Indicatore anticipatore.** Il primo avviso di sicurezza su un componente esposto chiuso oltre la
finestra dichiarata.

**Risposta.** *Ridurre*: automazione dell'aggiornamento delle dipendenze, distinta generata a ogni
costruzione, registro dei componenti con annotazioni versionate. *Accettare* il residuo, dichiarandolo.

> **`R-21` — Il reclutamento di utenti rappresentativi non si comprime**
> *Probabilità* **Alta** · *Impatto* **I3** · *Titolare* **committente**, per l'ingaggio

**Che cos'è.** La validazione di usabilità richiede utenti rappresentativi che comprendono persone
anziane e persone con disabilità — **popolazione di riferimento e non caso limite** — e il loro
reclutamento ha un tempo di calendario proprio, con consensi da raccogliere e protocollo da approvare
prima dell'esecuzione.

**Come si è già materializzato.** Non è più solo un rischio futuro: è la causa del taglio irreversibile
`TG-22`, la **valutazione formativa durante lo sviluppo**, che non si recupera perché è contemporanea
per definizione alle decisioni di progettazione che valuta.

**Indicatore anticipatore.** L'assenza di un protocollo di validazione approvato al momento in cui
l'interfaccia si avvicina al congelamento. Il protocollo si approva **molto prima** della sua
esecuzione.

**Risposta.** *Ridurre*, anticipando il protocollo; *accettare* la durata del reclutamento e la lacuna
formativa già maturata, che il fascicolo di ingegneria dell'usabilità dichiara con la sua data.

> **`R-22` — Le figure specialistiche necessarie sono una risorsa scarsa**
> *Probabilità* **Media** · *Impatto* **I3** · *Titolare* **committente**

**Che cos'è.** Il percorso richiede competenze che non si improvvisano e che sotto `D54` **non esistono
internamente**: ingegneria dei fattori umani, redazione clinica con qualifica documentabile, verifica di
sicurezza indipendente, responsabile della qualità distinto da chi sviluppa. Con `D58` si aggiunge la
**persona responsabile del rispetto della normativa**, la cui qualifica è documentabile e la cui
disponibilità deve essere permanente: la ricerca osserva che tali figure sono scarse e che la deroga
per le micro e piccole imprese **ne aumenta la domanda**, perché consente a molte strutture di attingere
allo stesso mercato esterno.

**Indicatore anticipatore.** Il tempo che intercorre fra la prima richiesta a un professionista
specializzato e la sua risposta. Se supera le due settimane, il mercato è saturo e la pianificazione va
rifatta su quel dato. È misurabile dal criterio 2 di `T-14`, che registra la data della prima richiesta.

**Risposta.** *Ridurre*, avviando la ricerca **prima** che serva: è la ragione per cui `T-14` è al 19
settembre 2026 e non dopo il primo rilascio. **Non è più ammesso trasferire con dichiarazione**: con
`D58` il fabbisogno è nostro, non di un terzo che lo assumerà.

> **`R-24` — Le priorità si spostano su richiesta esterna**
> *Probabilità* **Alta** · *Impatto* **I2, cumulativo** · *Titolare* **committente**

**Che cos'è.** Una richiesta che arriva da fuori — un integratore, una gara, una dimostrazione — ha una
forza di persuasione che una voce di coda non ha, e la deviazione singola costa poco. Il costo è
**cumulativo**: tre deviazioni da due settimane consumano il margine di un traguardo senza che nessuna
delle tre appaia significativa nel momento in cui viene concessa.

**Perché sotto `D53` cambia natura.** Perché non esiste margine di tempo da consumare: una deviazione
**non ritarda, riduce**. Consuma direttamente una riga dell'ordine di sacrificio, e quindi si somma a
`R-28` invece di restare indipendente.

**Indicatore anticipatore.** Una revisione che registri un sorpasso in coda **senza innesco verificato**
ai sensi di [04 §2.3](./04-oltre-il-primo-rilascio.md), oppure il consumo di una riga dell'ordine di
sacrificio la cui causa registrata sia una richiesta esterna.

**Risposta.** *Ridurre*, con il metodo: ogni deviazione passa dalla procedura di ampliamento del
perimetro e dalla revisione, ed è registrata con la sua causa.

### 2.2 Volume del corpus e regime linguistico

> **`R-03` — Il volume del corpus documentale eccede la capacità di traduzione**
> *Probabilità* **Alta** · *Impatto* **I3 sul piano 2027**, non più `I4` sul traguardo del 30 novembre
> 2026 · *Titolare* **progetto**

**Che cos'è, e come si è ridotto.** `D50` impone la versione inglese **integrale**; il corpus italiano è
dell'ordine delle centinaia di migliaia di parole. Nella versione precedente di questo registro il
rischio era `I4` sul traguardo del 30 novembre, perché `D52` impediva di dichiarare chiusa un'area non
navigabile online nelle due lingue. **`D56` emenda `D52`**: la traduzione procede **in parallelo**, area
per area, e non è più prerequisito di ogni riga di codice. L'impatto si sposta quindi dal traguardo del
2026 al piano del 2027 (`T-09`).

**Che cosa resta, e non è poco.** Restano prerequisito non negoziabile **le avvertenze pubbliche, la
guida dei fondamenti e le aree di conformità e sicurezza**, dove il controllo di divergenza **blocca**
(`T-06`). Su quel sottoinsieme il rischio è invariato.

**Indicatore anticipatore.** Il rapporto di segnalazione del controllo di divergenza, pubblicato a ogni
costruzione: **la distanza fra corpus italiano e corpus inglese, misurata e non stimata**. Se cresce fra
due revisioni consecutive, la traduzione assistita non tiene il passo della produzione.

**Risposta.** *Ridurre* con la misura preliminare — il **conteggio esatto delle parole**, criterio 5 di
`T-02` — e con la modalità di `D56`. *Accettare* per il resto: la parte non tradotta è **visibile e
misurata**, che è la condizione minima perché non degeneri in `R-16`.

> **`R-16` — Le due versioni linguistiche divergono**
> *Probabilità* **Alta**, in assenza di controllo automatico · *Impatto* **I5 sul piano regolatorio** ·
> *Titolare* **progetto**

**Che cos'è.** Un contenuto normativo che dice due cose diverse in due lingue non è un problema di
traduzione: è **un difetto documentale in un dispositivo medico**. L'impatto è `I5` perché una
divergenza scoperta in sede di verifica non si «corregge»: obbliga a riemettere e a dimostrare da quando
esisteva.

**Perché `D56` non lo attenua, e va detto.** La traduzione in parallelo riduce il rischio di **ritardo**
e **non** quello di **divergenza**: un corpus tradotto a scaglioni ha più occasioni di divergere, non
meno. Ciò che lo presidia non è la modalità di traduzione ma **il comportamento differenziato del
controllo**: blocca sulle aree prerequisito, segnala sul resto con rapporto pubblicato (`T-03` criterio
3). Le aree in sola segnalazione **hanno un rischio di divergenza accettato e misurato**, non assente.

**Indicatore anticipatore.** La prima proposta di modifica accettata che tocchi un'area **prerequisito**
senza aggiornare l'inglese: è impossibile per costruzione, e se accade il controllo è mal configurato.
Per le aree in segnalazione, l'indicatore è la crescita del rapporto di divergenza.

**Risposta.** *Evitare* per costruzione sulle aree prerequisito; *accettare e misurare* sulle altre, con
la transizione da segnalazione a bloccanza registrata area per area e **non reversibile** (`T-09`).

### 2.3 Conformità, decisioni e perimetro

> **`R-04` — L'area di conformità concentra le questioni pendenti delle altre aree**
> *Probabilità* **Accertato** · *Impatto* **I3** · *Titolare* **orchestrazione**, poi `COMP`

**Che cos'è.** L'area di conformità è ora scritta — dieci documenti — e il documento di ricerca sul
percorso di certificazione è stato completato. Il rischio non si chiude con la stesura: quell'area resta
quella verso cui converge il maggior numero di questioni pendenti delle altre, e su di essa poggiano la
procedura di controllo dei documenti di `T-01`, il registro degli identificativi di requisito e l'intero
pacchetto regolatorio di `T-12`. **Con `D58` vi si aggiunge la riscrittura dei capitoli costruiti sulla
figura del terzo**, che è lavoro nuovo e non rinviabile, perché quei capitoli oggi attribuiscono a
qualcun altro un percorso che è nostro.

**Indicatore anticipatore.** Il numero di questioni `APERTA` indirizzate a `COMP` che cresce fra due
revisioni consecutive senza che nessuna si chiuda.

**Risposta.** *Ridurre*, con la sequenza: le attività di classe `A` che appartengono naturalmente a
quell'area — controllo dei documenti, registro degli identificativi, riallineamento delle avvertenze
pubbliche a `D58` — sono **anticipate in `T-01`** e non attendono, perché il loro costo di omissione
cresce ogni giorno.

> **`R-05` — I modelli documentali delle tipologie di telemedicina non sono disponibili**
> *Probabilità* **Accertato** · *Impatto* **I0 sul progetto** · *Titolare* **`COMP`**, per
> l'interlocuzione

**Che cos'è.** Modelli di documento strutturato, codici di tipologia e metadati di indicizzazione non
sono pubblicamente disponibili (`Q-07`, `B-7`, `V-136`).

**Perché l'impatto sul progetto è nullo, ed è un risultato e non una fortuna.** Perché il contenuto è
modellato come **dataset canonico** e ogni serializzazione è sostituibile (`V-07`). Il rischio esisteva,
è stato **evitato per progettazione**, e la voce resta in registro per sorvegliare l'unica cosa che può
ancora andare storta: che qualcuno cabli un template per convenienza — **e sotto pressione di calendario
la convenienza aumenta**, che è la ragione per cui la voce non si chiude ora.

**Indicatore anticipatore.** La comparsa, in una proposta di modifica, di un template documentale dentro
il dominio invece che dietro il punto di estensione.

**Risposta.** *Evitare* per costruzione, con verifica automatica.

> **`R-17` — Le decisioni del committente non vengono prese entro le date dichiarate**
> *Probabilità* **Media** · *Impatto* **da I2 a I5, secondo la decisione** · *Titolare* **committente**

**Che cos'è, e come si è ridotto.** Nella versione precedente erano sette le decisioni con una data oltre
la quale la mancata decisione è essa stessa una decisione. **Quattro sono state prese**: capacità
(`D54`), riformulazione del traguardo (`D53`), modalità di traduzione (`D56`), congelamento della
destinazione d'uso (`D55`). Restano, con l'aggiunta di due che `D57` e `D58` introducono:

| Decisione | Impatto | Data |
|---|---|---|
| Forma giuridica del soggetto fabbricante e profilo della persona responsabile (`Q-280`) | `I3`, crescente e non recuperabile con più lavoro | 19 settembre 2026 |
| Ripartizione delle registrazioni a ruoli distinti (`Q-189`) | `I5` per il periodo di `RU-1` | 30 settembre 2026 |
| Periodo di supporto dichiarato (`C-4`, `Q-186`) | `I2`, ma è **prerequisito di `T-10`** | 15 ottobre 2026 |
| Correzione del materiale pubblico (`Q-185`) | `I5` in senso proprio: un periodo di pubblicazione non si annulla | 31 ottobre 2026 |
| Formulazione della differenza fra materiale pubblico e ciò che `RU-1` consegna (`Q-281`) | `I5`, stessa natura del precedente | 31 ottobre 2026 |
| Regime di licenza di scale e questionari (`B-3`) | `I2` | Prima del primo motore di calcolo |

**Indicatore anticipatore.** Il calendario stesso. È l'unico rischio del registro che ha una data di
scadenza esplicita per ciascuna delle sue componenti.

**Risposta.** *Ridurre*: la roadmap **pone** le decisioni con la conseguenza dichiarata accanto, e
dichiara l'esito predefinito in assenza di risposta — per `Q-189` è la lacuna dichiarata su `RU-1`. Un
piano che attende in silenzio una decisione che non arriva ha già scelto, senza dirlo.

> **`R-18` — Una decisione dichiarata rinviata viene presa d'ufficio in una proposta di modifica**
> *Probabilità* **Media** · *Impatto* **I2, con coda `I5` sulla coerenza documentale** · *Titolare*
> **progetto**

**Che cos'è.** Diciannove decisioni sono dichiarate rinviate in
[`docs/02_architecture/09-decisioni-rinviate.md`](../02_architecture/09-decisioni-rinviate.md). Chi
realizza si imbatte in una di esse e sceglie l'opzione più comoda per proseguire: la scelta è locale,
ragionevole e invisibile. Il costo emerge quando **il codice fa una cosa e la documentazione ne dice
un'altra**.

**Perché sotto `D54` è più insidioso.** Perché la regola che lo presidia — chi si imbatte in una
decisione rinviata **apre una voce in bacheca e non sceglie** — è presidiata dalla revisione, e la
revisione con un contributore unico è **auto-revisione** (`R-29`). L'unico presidio che resta effettivo
è **l'elenco delle decisioni rinviate come lista di controllo esplicita** prima di ogni proposta di
modifica che tocchi un'area coperta.

**Indicatore anticipatore.** Una proposta di modifica che tocca un'area coperta da una decisione
rinviata **senza** citarla.

**Risposta.** *Evitare* con la regola; *ridurre* con `T-05`, che raccoglie le decisioni con scadenza
anteriore al primo codice e le **pone** entro il 3 ottobre 2026.

> **`R-19` — Il materiale pubblico non è allineato ai claim approvati**
> *Probabilità* **Accertato** · *Impatto* **I5** · *Titolare* **committente**, con `PROD`

**Che cos'è.** Le riformulazioni approvate con `D19` e `D29` non risultano recepite nella pagina pubblica
(`Q-185`). Finché non lo sono, ogni giorno di esposizione è un giorno di affermazione non sostenibile.
L'impatto è `I5` per la ragione più semplice di tutte: **un periodo di pubblicazione non si annulla**.

**Che cosa `D53` e `D58` aggiungono, e sono due cose diverse.** `D53` aggiunge che il materiale pubblico
dichiara capacità che `RU-1` **non consegnerà**: alla pubblicazione del rilascio la distanza fra i due
diventa verificabile da chiunque, ed è la questione `Q-281`. `D58` aggiunge un rischio nuovo e più
grave: **la tentazione di annunciare l'intenzione di certificare come se fosse un esito datato.** È
precisamente ciò che `V-171` vieta, e la vicinanza fra le due affermazioni le rende facili da
confondere in buona fede.

**Perché è più grave di quanto sembri.** La destinazione d'uso di un dispositivo è determinata **anche
dal materiale promozionale**. Un'affermazione commerciale non allineata alla dichiarazione formale non è
un errore di comunicazione: **modifica la destinazione d'uso**, con effetti sulla qualificazione, e viene
rilevata al primo confronto fra il fascicolo e i canali pubblici.

**Indicatore anticipatore.** Non ce n'è uno anticipatore, perché il rischio è già in essere. Ciò che si
sorveglia è la **durata**: ogni revisione registra da quanti giorni la condizione persiste.

**Risposta.** *Evitare*, con una data. Il presidio strutturale è di processo: **l'allineamento fra
dichiarazione formale e comunicazione pubblica va verificato a ogni modifica del materiale pubblico, e
la verifica va registrata** — è `Q-174` verso `COMP`. Vi si aggiunge la verifica testuale che nessun
materiale contenga una data di marcatura, che è criterio bloccante 15 di
[03 §8](./03-primo-rilascio-utilizzabile.md) e criterio 5 di `T-14`.

> **`R-23` — Deriva del perimetro verso l'innalzamento di classe**
> *Probabilità* **Media** · *Impatto* **I4** · *Titolare* **`COMP`**, con il committente

**Che cos'è.** Tre funzionalità sono **a una singola storia utente** dall'innalzamento di classe: allerta
su soglia, elaborazione dell'immagine, refertazione assistita. La deriva non avviene per decisione,
avviene per accumulo di richieste ragionevoli: un avviso che «suggerisce», una precompilazione che
«aiuta», un miglioramento d'immagine che «rende più leggibile».

**Che cosa `D55` cambia, ed è in meglio.** Il congelamento della destinazione d'uso sulla **raccolta
differita** rende la deriva **riconoscibile**: esiste una formulazione di riferimento contro cui
misurare ogni proposta, e il divieto è enunciato — nessuna funzione può spostare il sistema verso il
tempo reale clinico, e la valutazione **precede** la scrittura della funzione.

**Che cosa `D58` cambia, ed è in peggio.** La rivalutazione conseguente a una deriva **è a carico
nostro**: nella versione precedente il costo di una riclassificazione sarebbe ricaduto su un fabbricante
esterno, e ora ricade sul progetto. L'impatto resta `I4`, ma il soggetto che lo subisce è cambiato.

**Indicatore anticipatore.** Una proposta formulata come capacità tecnica e non come caso d'uso con un
attore — «sarebbe utile calcolare un punteggio» — è il primo sintomo.

**Risposta.** *Evitare*: controllo delle modifiche sulle tre funzionalità di confine, prove negative per
ciascuna esclusione, e la regola per cui **la valutazione di impatto regolatorio precede la stima dello
sforzo**.

> **`R-26` — La fonte normativa cambia durante il programma**
> *Probabilità* **Alta** · *Impatto* **da I1 a I3** · *Titolare* **`COMP`**

**Che cos'è.** Il progetto poggia su fonti in movimento: tipologie documentali di recente istituzione,
determinazioni dell'autorità nazionale per la cybersicurezza già modificate una volta nel 2026, guide di
implementazione in stato preliminare, obblighi di segnalazione con decorrenza recente.

**Indicatore anticipatore.** La pubblicazione di una versione nuova di una specifica fissata è un innesco
di **revisione fuori cadenza** dichiarato in [00 §8](./00-indice.md).

**Risposta.** *Ridurre*: **politica di fissaggio delle versioni** per ogni specifica adottata, con la
versione dichiarata accanto a ogni affermazione di conformità e con il divieto di formule che presentino
come standard ciò che non lo è (`V-133`); nessun template cablato (`V-136`). *Accettare* il residuo.

### 2.4 Rischi tecnici sul percorso critico

> **`R-13` — I difetti noti del prodotto di federazione tornano al primo aggiornamento**
> *Probabilità* **Media** · *Impatto* **I1, con conseguenza di sicurezza** · *Titolare* **progetto**

**Che cos'è.** Tre comportamenti del prodotto di federazione adottato — l'utente federato può alterarsi
gli attributi, cambiare l'indirizzo di posta senza verifica, darsi una credenziale locale — sono
chiudibili in configurazione. Una configurazione chiusa e non sorvegliata si riapre a un aggiornamento, e
nessuno se ne accorge.

**Indicatore anticipatore.** L'assenza di una prova che fallisca se la configurazione regredisce.

**Risposta.** *Evitare*: sono trattati come **controlli di rischio**, non come note di configurazione, e
il criterio 3 di `T-04` richiede sia la chiusura sia la prova di non regressione. **È fra le verifiche
che non sono state tagliate**, benché la federazione nazionale sia fuori dal perimetro di `RU-1`: il
prodotto di federazione è comunque nel percorso di ingresso.

> **`R-14` — Il lotto della doppia istanza per fornitore di identità è sottostimato**
> *Probabilità* **Alta** · *Impatto* **I2** · *Titolare* **progetto**

**Che cos'è.** Il contesto di autenticazione richiesto è configurato **staticamente sulla singola
istanza**: un livello variabile per operazione richiede un'istanza per ciascuna coppia fornitore per
livello. Il moltiplicatore agisce su un insieme la cui cardinalità si legge da un registro nazionale e
**cambia nel tempo**, e ogni variazione comporta un nuovo deposito del documento di metadata presso
l'autorità. È **costo di procedura, non di codice**, e per questo viene sottostimato con regolarità.

**Perché resta in registro benché la voce sia fuori da `RU-1`.** Perché l'errore che presidia è di
**stima**, e si commette nel momento in cui si pianifica `OL-08`, non nel momento in cui la si realizza.

**Indicatore anticipatore.** Una stima dello sforzo per l'identità digitale nazionale che non distingua
fra costo di codice e costo di procedura.

**Risposta.** *Ridurre*: perimetro dichiarato a **due soli livelli**, con fattore moltiplicativo pari a
due e non a *n*; convenzione di alias con prefisso stabile, verificata in integrazione continua sul
documento di metadata generato.

> **`R-15` — Un meccanismo di sicurezza viene documentato prima di essere verificato**
> *Probabilità* **Media** · *Impatto* **I5 reputazionale** · *Titolare* **`INTEG`**, con `TECH`

**Che cos'è.** Non è verificato se il prodotto di federazione inoltri il livello richiesto attraverso il
realm di intermediazione (`Q-160`, `B-8`). Il costo della verifica è quasi nullo; **il costo di aver
documentato un comportamento inesistente su un meccanismo di sicurezza non lo è**, perché comporta una
rettifica pubblica.

**Perché il rischio è aumentato con la riduzione di ambito, e va detto.** La verifica corrispondente è
stata **rinviata con la funzione** (`T-04`, criterio 5): non essendo più a calendario, l'unica cosa che
impedisce di descrivere il meccanismo è **la regola**, non un'attività imminente che la renderebbe
superflua. Una regola senza un'attività che la accompagni si dimentica più facilmente.

**Indicatore anticipatore.** La comparsa, in una bozza di documentazione pubblica, di una descrizione del
meccanismo priva di rinvio a un esito di verifica registrato.

**Risposta.** *Evitare*, con una regola binaria in vigore e **registrata esplicitamente nel criterio 5 di
`T-04` insieme al rinvio**: finché l'esito non è registrato, la documentazione pubblica non descrive il
meccanismo.

> **`R-20` — Il registro immutabile è più costoso di quanto una pianificazione ingenua assuma**
> *Probabilità* **Alta** · *Impatto* **I3** · *Titolare* **progetto**

**Che cos'è.** È dichiarato dall'area di sicurezza come **il singolo elemento di maggiore sforzo
dell'intero catalogo**. Il versionamento delle entità **non rende immutabile**, e il requisito richiede
strati che coprono minacce diverse — catena applicativa, archivio in sola aggiunta, conservazione a
privilegi disgiunti, ancoraggio periodico firmato — più la scrittura bloccante, la catena per tenant, la
procedura di verifica e quella di esportazione.

**Come si è già materializzato.** È la causa del taglio `TG-23`: `RU-1` consegna la **copertura
integrale** e **due strati su quattro**, senza ancoraggio periodico firmato. La copertura non era
tagliabile ([03 §5.4](./03-primo-rilascio-utilizzabile.md)); lo strato sì, con la conseguenza dichiarata
di essere **irreversibile per il periodo**.

**Indicatore anticipatore.** Una pianificazione che tratti il registro come una proprietà di uno strato
di persistenza invece che come un componente con un ciclo di vita proprio.

**Risposta.** *Ridurre*: la copertura è criterio di completamento esplicito di `T-08` e criterio di
rilascio bloccante, quindi non è comprimibile nemmeno sotto pressione. *Accettare e dichiarare* la
riduzione di uno strato, con `OL-21` in terza posizione in coda.

> **`R-27` — La costruzione riproducibile non si ottiene**
> *Probabilità* **Media** · *Impatto* **I2** · *Titolare* **progetto**

**Che cos'è.** Due costruzioni della stessa revisione su esecutori diversi devono produrre artefatti
identici. È la sola verifica che accerti che la distribuzione corrisponde al sorgente pubblicato, ed è
quindi il fondamento tecnico della separazione fra repository e distribuzione di `D17`. Ottenerla
richiede il controllo di ogni sorgente di non determinismo, e la prima misura tipicamente fallisce.

**Come si è già materializzato.** È la causa del taglio `TG-14`: la verifica è ridotta all'**artefatto
principale del servizio**, ed è criterio bloccante 6 su quel perimetro. La riduzione è dichiarata nel
fascicolo di rilascio, perché determina che cosa chi installa può verificare.

**Indicatore anticipatore.** Il primo confronto di impronte fra due esecutori diversi che non viene
eseguito perché «tanto è uguale». La riproducibilità non è una proprietà che si assume: si misura, e
l'esito si conserva.

**Risposta.** *Ridurre*: la verifica sull'artefatto principale è criterio bloccante e non entra
nell'ordine di sacrificio. *Accettare* la riduzione di perimetro, con `OL-20` in coda.

### 2.5 Catena di fornitura e licenze

> **`R-08` — Un componente incorporato ha un regime di licenza incompatibile**
> *Probabilità* **Media** · *Impatto* **da I2 a I4** · *Titolare* **`COMP`**, con `TECH`

**Che cos'è.** Un componente entra nella distinta con una licenza non compatibile con quella del
progetto, oppure con una licenza di tipo «sorgente disponibile» con restrizioni sull'offerta come
servizio gestito a terzi. Il caso già rilevato riguarda le funzionalità avanzate dell'estensione per
serie temporali (`Q-112`), ed è `[NV]` in attesa di verifica sul testo della licenza primaria.

**Il principio che rende il rischio ricorrente.** Una dichiarazione di licenza apposta su un contenitore
**non dispone dei diritti di terzi sul contenuto ricompreso**: la verifica va fatta artefatto per
artefatto, sulla licenza primaria.

**Indicatore anticipatore.** Un componente che compare nella distinta dei materiali e non nelle
annotazioni versionate.

**Risposta.** *Evitare* per costruzione con il controllo di licenza in pipeline, che è **fra i controlli
bloccanti dal primo giorno** e non fra quelli in sola segnalazione (`T-03` criterio 2), proprio perché
presidia un divieto pubblico.

> **`R-09` — Contenuto terminologico a licenza vincolata entra nel repository pubblico**
> *Probabilità* **Bassa**, presidiata · *Impatto* **I5** · *Titolare* **progetto**

**Che cos'è.** Alcune terminologie cliniche hanno licenze incompatibili con un repository pubblico e con
la licenza del progetto: l'accesso stesso al contenuto perfeziona il vincolo. L'impatto è `I5` perché
**un contenuto pubblicato una volta non si ritira**: si può rimuovere dal ramo corrente, non dalla
cronologia né dalle copie altrui.

**Indicatore anticipatore.** Una richiesta di aggiungere una voce alla lista di ammissione del controllo
terminologico che non passi dalla revisione prevista per il materiale di conformità. La modifica di
quella lista **è materia di conformità**, non di configurazione (`V-191`).

**Risposta.** *Evitare*, con tre misure cumulative: il progetto non scarica mai il contenuto vincolato;
il controllo terminologico è **bloccante dal primo giorno**; il sistema resta pienamente operativo con
quei sistemi disattivati (`V-03`). **Una nota di onestà sulla terza misura**: in `RU-1` la verifica è
**degenere**, perché il perimetro ridotto non contiene contenuto codificato (`TG-05`). La proprietà è
dichiarata, non ancora dimostrata sul caso che conta, e `OL-20` la riporta a verifica reale.

> **`R-25` — Un componente esposto ha una cadenza di rilascio superiore alla capacità di aggiornamento**
> *Probabilità* **Alta** · *Impatto* **I1 ricorrente, con conseguenza di sicurezza** · *Titolare*
> **progetto**, per il rilascio; **chi installa**, per l'applicazione

**Che cos'è.** Il nodo di relay è il componente più esposto dell'architettura e ha la cadenza di rilascio
più alta. La stessa famiglia di difetti — aggiramento delle liste di indirizzi vietati per
canonicalizzazione o confronto errato delle forme di indirizzo estese — ha prodotto **sei vulnerabilità
distinte in otto anni** su un componente maturo, quattro delle quali negli ultimi otto mesi.

**Indicatore anticipatore.** La distanza fra la versione minima dichiarata dal progetto e l'ultima
versione pubblicata dal componente, misurata a ogni revisione.

**Risposta.** *Ridurre* e *trasferire con dichiarazione* nella ripartizione già scritta. La difesa che non
dipende da nessuna delle due è però un'altra, ed è la ragione per cui il rischio resta `I1`:
**l'isolamento di rete in uscita del relay è difesa primaria** e non dipende dalla correttezza del
codice; le liste di indirizzi vietati sono difesa in profondità (`V-10`, `V-157`). La verifica
corrispondente è `T-04` criterio 4, **non tagliata**.

### 2.6 Percorso di conformità — ora rischi del progetto

> **Che cosa è cambiato in questa sezione.** Con `D57` e `D58` le tre voci che seguono **non sono più
> rischi di terzi con impatto nullo sul progetto**. Sono nostre, e l'impatto è ricalcolato su di noi.
> Resta invariato lo stato di fatto: **oggi il prodotto non reca marcatura CE**, non è coperto da alcuna
> dichiarazione di conformità, e **nessuna data di questo registro è una promessa di marcatura**
> (`V-171`, `V-280`).

> **`R-30` — Il ruolo di fabbricante non è ancora costituito**
> *Probabilità* **Accertato** · *Impatto* **I3, crescente** · *Titolare* **committente**

**Che cos'è.** `D58` attribuisce al progetto il ruolo di fabbricante, e **il soggetto giuridico non
esiste**. Più passi della pianificazione interna di [02 §5](./02-traguardi.md) lo presuppongono
formalmente: la firma di un contratto con un organismo notificato richiede un soggetto; la nomina della
persona responsabile del rispetto della normativa richiede un soggetto che la nomini; la registrazione
dell'operatore economico richiede un soggetto da registrare.

**Perché l'impatto cresce e non è costante.** Perché è di **classe `B`**: la durata dipende da
procedimenti amministrativi esterni e non dalla capacità di lavoro. Ogni settimana di ritardo **si
trasferisce integralmente in fondo alla catena**, e nessun aumento di capacità la recupera. È
esattamente la proprietà che rende `T-14` il secondo traguardo del calendario e non l'ultimo.

**Che cosa il rischio non è.** Non è un rischio sul prodotto: `RU-1` si costruisce e si pubblica
indipendentemente dall'esistenza del soggetto, perché `RU-1` **non è marcato e non lo dichiara**. È un
rischio sulla pianificazione oltre il 2026.

**Indicatore anticipatore.** Il superamento del **19 settembre 2026** senza che `Q-280` sia decisa e
senza che la data di avvio della pratica di costituzione sia registrata (criterio 1 di `T-14`).

**Risposta.** *Ridurre*, anticipando ciò che si può anticipare: **la richiesta di informazioni agli
organismi notificati non richiede il soggetto costituito** e si invia prima (criterio 3 di `T-14`),
perché la coda è il vincolo effettivo. *Accettare* la durata del procedimento, che non dipende da noi, e
**dichiararla non stimabile** invece di inventarla.

> **`R-06` — I tempi degli organismi notificati**
> *Probabilità* **Alta** · *Impatto* **I3 sulla pianificazione del progetto** · *Titolare* **progetto**

**Che cos'è.** Il 51 % degli organismi impiega **13–18 mesi** dalla firma dell'accordo al certificato e il
31 % ne impiega **19–24**; a fine 2025 il divario era di 25 978 domande contro 13 953 certificati;
l'organico degli organismi è in **contrazione** — meno 8 % di personale interno e meno 21 % di
subappaltatori — per la prima volta in oltre un decennio. Ne discende l'aritmetica di `D44`: anche
firmando entro dicembre 2026 il certificato non arriva prima di gennaio 2028 nell'ipotesi più favorevole,
e realisticamente fra giugno 2028 e giugno 2029.

**Perché l'impatto non è più nullo.** Nella versione precedente questa voce aveva impatto `I0` sul
progetto, perché il progetto non ingaggiava organismi. **Con `D58` li ingaggiamo noi**, e il tempo di
attraversamento entra nella nostra pianificazione. Cambia l'attribuzione; **non cambia il fatto che sia
una dipendenza esterna**, e quindi non comprimibile.

**Due elementi che vanno detti perché sono quelli che si scoprono tardi.** Il primo: **un fabbricante
nuovo, micro, alla prima certificazione non è un cliente prioritario** per un organismo con capacità in
contrazione, e va messo in conto nella negoziazione — **il profilo descritto siamo noi**. Il secondo: il
**tempo di attesa prima di essere accettati** non è misurato da alcuna indagine pubblica, ed è per questo
la variabile più pericolosa dell'intero percorso.

**Indicatore anticipatore.** Il numero di organismi contattati che rispondono con una disponibilità
reale, non con un listino, entro un termine registrato dalla data di invio del criterio 3 di `T-14`. Se è
zero dopo il primo giro, lo scenario di riferimento del §5 di [02](./02-traguardi.md) è già decaduto e la
tabella va aggiornata alla revisione successiva.

**Risposta.** *Ridurre*: inviare le richieste **prima** che il soggetto esista, chiedere il calcolo e non
il prezzo, chiedere impegni sui tempi delle singole fasi. *Accettare* la durata. **Non è più ammesso
trasferire con dichiarazione**: non c'è nessun altro a cui trasferire.

> **`R-07` — I cicli di risposta alle non conformità occupano le stesse persone**
> *Probabilità* **Alta** · *Impatto* **I3** · *Titolare* **progetto**

**Che cos'è.** Da due a quattro cicli, ciascuno con una coda dell'organismo. **Occupano le stesse persone**
che scrivono il software e la documentazione — che sotto `D54` è **una sola persona** — e la loro durata
non dipende da loro.

**Perché sotto `D54` e `D58` è più grave di prima, ed è aritmetica.** Nella versione precedente era lavoro
di un fabbricante esterno con effetto indiretto sul progetto. Ora è **lavoro nostro**, svolto dalla stessa
capacità che produce il software, e la sovrapposizione è totale: un ciclo di non conformità **ferma lo
sviluppo**, non lo rallenta.

**Perché non è stimabile.** Perché il numero e la gravità dei rilievi dipendono dalla qualità del fascicolo
e dall'organismo. Due cicli o quattro sono la stessa pianificazione con costi diversi di un fattore due.
**Va messo a bilancio come riserva dichiarata, non omesso**: un piano privo di riserva per i cicli di non
conformità assume l'esito migliore come esito atteso. È la questione `Q-188`.

**Indicatore anticipatore.** L'esito della verifica di completezza della domanda: una richiesta di
integrazione a quello stadio anticipa un numero di cicli superiore alla media.

**Risposta.** *Ridurre*, con le misure che la fonte indica come efficaci: chiedere il calcolo e non il
prezzo, chiedere un riesame preliminare a pagamento quando è offerto, **confrontare il totale e non la
tariffa**. *Accettare* con riserva dichiarata, secondo la decisione di `Q-188`.

### 2.7 Rischi che dipendono da controparti

> **`R-10` — Dipendenza strutturale da un singolo integratore**
> *Probabilità* **Alta** · *Impatto* **I4 sul perimetro, I2 sul calendario** · *Titolare* **committente**

Il rischio è descritto per esteso al §4, perché la sua trattazione richiede più spazio di quanto una voce
di registro ne conceda e perché la sua contromisura è architetturale.

> **`R-11` — Ambienti di prova e controparti non disponibili**
> *Probabilità* **Alta** · *Impatto* **I3 sulle voci che ne dipendono, I0 sul resto** · *Titolare*
> **committente**, per la ricerca delle controparti

**Che cos'è.** Quattro capacità richiedono qualcosa che il progetto non possiede: ambienti di
pre-produzione e credenziali per l'identità digitale nazionale; un motore di integrazione reale per la
messaggistica ospedaliera; un server di controparte per l'avvio applicativo in contesto clinico; un
gateway di misure reale per verificare se espone i due segnali richiesti dal modello di sicurezza
(`Q-122`, `B-9`).

**La conseguenza che non è di integrazione ma di sicurezza.** Senza il segnale di presenza periodico
indipendente dalla misura e senza la telemetria di stato del dispositivo, la tassonomia del silenzio perde
due categorie tecniche su sette: il sistema non distingue «il dispositivo non ha misurato» da «il
dispositivo non ha trasmesso», il silenzio residuo si diluisce, i contatti a vuoto crescono e con essi
l'affaticamento dell'operatore.

**Indicatore anticipatore.** Il tempo trascorso dalla prima richiesta di accesso a un ambiente di prova
senza risposta. È l'unico indicatore disponibile, e va registrato dalla prima richiesta.

**Risposta.** *Ridurre*: le capacità che ne dipendono sono classificate `[IPOTESI]` in
[04 §3](./04-oltre-il-primo-rilascio.md) e **non sono sul percorso del primo rilascio**, così che la loro
indisponibilità non blocchi il resto. *Accettare* per la parte residua, assumendo in via cautelativa che
la causa dell'assenza di misura sia marcata **non determinabile** invece che dedotta.

---

## 3. Le dipendenze esterne, famiglia per famiglia

Una dipendenza esterna non è un rischio: è una **condizione strutturale**. Il rischio è ciò che accade
quando la si mette sul percorso critico. Questa sezione elenca le famiglie, dichiara chi le controlla, e
— la parte che conta — **che cosa il progetto ha fatto per non esserne bloccato**.

| Famiglia | Chi la controlla | Che cosa ne dipende | Come il progetto evita di esserne bloccato |
|---|---|---|---|
| **Funzioni che richiedono un soggetto distinto** | Il mercato dei servizi professionali, e una decisione di spesa | Riesame del rilascio, audit interno, verifica di configurazione indipendente, revisione esterna del codice di sicurezza critico | **Non lo evita.** È l'unica famiglia per cui non esiste una modalità degradata: si acquisisce o si dichiara la lacuna. `R-29`, `Q-189`, `OL-22` |
| **Procedimenti amministrativi di costituzione del soggetto** | Amministrazione | Ogni passo del percorso di conformità che presuppone il fabbricante | Le attività che **non** richiedono il soggetto costituito sono anticipate: le richieste di informazioni si inviano prima (`T-14` criterio 3). `R-30` |
| **Organismi notificati** | Terzi privati designati | Il calendario di conformità di [02 §5](./02-traguardi.md) | Nessun traguardo **del prodotto** vi dipende: `RU-1` si costruisce e si pubblica senza. `R-06` |
| **Infrastrutture documentali nazionali e regionali** | Amministrazione | `OL-07`; conferimento dei documenti | Dataset canonico e serializzazione sostituibile (`V-07`, `V-136`). L'attesa costa zero |
| **Federazione nazionale delle identità** | Amministrazione e fornitori | `OL-08`; il canale privo di dipendenze esterne è completabile da solo | Conformità **verificabile in integrazione continua**, non accreditamento (`V-05`). Il fornitore di servizi è chi installa, **e `D58` non lo cambia** |
| **Terminologie a licenza vincolata** | Titolari dei diritti | Validazione di una parte dei binding | Il sistema è **pienamente funzionale senza** (`V-03`). In `RU-1` la proprietà è dichiarata e verificata solo in forma degenere (`TG-05`) |
| **Componenti di terze parti** | Comunità e fornitori | Ogni artefatto distribuito | Distinta generata, registro annotato, ripieghi provati, isolamento di rete come difesa primaria |
| **Contributori** | Nessuno | Tutto | Guida dei fondamenti, ambiente avviabile su macchina disconnessa, documenti come codice |
| **Controparti di integrazione** | Integratori ed enti | `OL-09`, e la misura della perdita informativa nella traduzione | Contratti e prove pubblicate in entrambe le direzioni; nessuna dichiarazione di conformità senza una prova reale |

### 3.1 La regola comune, e la famiglia che la viola

Tutte le famiglie sono trattate con lo stesso schema:

> **Ogni dipendenza esterna vive dietro un punto di estensione con contratto dichiarato, ha una modalità
> degradata provata, e la modalità degradata è la configurazione predefinita della suite di prove.**

L'ultima clausola è quella che rende la regola effettiva invece che esortativa. Una modalità degradata
che non gira nelle prove non è una modalità degradata: è un ramo di codice mai eseguito, che fallirà la
prima volta che serve.

**La prima famiglia della tabella non ammette modalità degradata, e va detto senza attenuazioni.** Non
esiste una versione degradata di un riesame: **o lo esegue un secondo soggetto, o non c'è**. È la ragione
per cui `TG-20` è un taglio irreversibile e non una riduzione, e la ragione per cui `R-29` ha impatto
`I5`. Nessuna soluzione tecnica lo aggira, e presentarne una sarebbe la forma più costosa di debito
regolatorio: una registrazione formalmente presente e sostanzialmente vuota.

### 3.2 La dipendenza che nessuno tratta come tale

**I contributori.** È l'unica famiglia il cui titolare è «nessuno», ed è quella che decide se tutto il
resto accade — **e sotto `D54` è anche quella che risolverebbe due rischi in una volta**, `R-02` e
`R-29`, perché un secondo contributore continuativo è insieme continuità e secondo soggetto.

Le misure elencate esistono per una ragione precisa: un progetto che richieda una macchina potente, un
accesso a un servizio di terzi o una conoscenza pregressa non scritta **seleziona i propri contributori**
senza dichiararlo. È la ragione per cui il consumo di memoria e disco dell'ambiente locale, oggi non
misurato (`Q-191`), non è una curiosità tecnica ma una **dipendenza di programma**: senza un profilo
minimo praticabile dichiarato, la condizione che rende possibile la partecipazione di un contributore
esterno non è verificabile, e l'obiettivo di `D35` resta un'intenzione.

---

## 4. Il rischio di dipendenza da un solo integratore

### 4.1 Come si presenta

Il rischio **non è** che esista un integratore importante: è del tutto normale che ne esista uno prima
degli altri. Il rischio è **strutturale** e consiste in una deriva progressiva in cui il prodotto smette
di essere un componente integrabile da molti e diventa un componente di uno, senza che nessuno lo abbia
deciso e senza che compaia in alcun documento.

La deriva ha una forma riconoscibile e si compie in cinque passi, ciascuno dei quali è localmente
ragionevole:

1. Una configurazione ottiene un **valore predefinito** che corrisponde a ciò che serve a un solo
   interlocutore.
2. Una prova di integrazione viene scritta contro **un solo** insieme di ipotesi, e passa.
3. Una scelta di interfaccia viene fatta per **evitare un cambiamento** al sistema di controparte,
   invece che per la sua correttezza.
4. Un termine di dominio dell'interlocutore entra nel **modello** o nella documentazione.
5. La coda delle priorità viene ordinata dalle sue richieste, e le voci che non lo riguardano scendono
   senza che il criterio sia stato applicato.

Al quinto passo il prodotto non è più multi-integratore: lo è ancora nel codice, non più nel
comportamento. E la proprietà perduta non si recupera aggiungendo un secondo integratore: si recupera
**rifacendo** ciò che è stato costruito su ipotesi che valevano per uno solo.

### 4.2 Perché `D53` e `D54` lo aggravano

Va detto, perché è la variazione di questa revisione. Un perimetro ridotto è **più facile da piegare a un
solo interlocutore**: con una sola superficie di integrazione (`TG-02` ha tagliato la seconda), con un
solo consumatore di eventi (`TG-04`), con l'avvio della sessione per rinvio invece che per incorporamento
(`TG-03`), le scelte da fare sono poche e ciascuna ha un candidato naturale — **quello che serve
all'unico interlocutore che sta provando il prodotto**. E la revisione che dovrebbe intercettarlo è
auto-revisione (`R-29`).

Ne discende una conseguenza sull'indicatore, che si trova al §4.4 e che è l'unica variazione operativa:
la sorveglianza non può appoggiarsi alla revisione fra pari, perché non c'è.

### 4.3 Le contromisure, che sono architetturali e verificabili

Il progetto non affronta questo rischio con una dichiarazione di intenti. Lo affronta con proprietà del
sistema che si verificano automaticamente.

| Contromisura | Come si verifica |
|---|---|
| **Multi-tenancy per costruzione**, con l'installazione a tenant unico come caso degenere dello stesso codice | Prove di isolamento che tentano attivamente l'accesso illegittimo, per ogni contesto e ogni interfaccia |
| **Nessuna logica cablata su un interlocutore**: più integratori coesistono sulla stessa installazione, ciascuno con le proprie chiavi, il proprio recapito degli eventi e i propri limiti di traffico | Configurazione per tenant; assenza di rami condizionali su identità di controparte |
| **Registro di fiducia unico per tenant**, con capacità esplicite per voce | Elenchi operativi **derivati** dalla sorgente, mai redatti a mano |
| **Lavoro per riferimento** sugli identificativi del sistema di origine, con registro degli identificatori di sistema versionato | Nessun identificatore esterno è chiave primaria; normalizzazione al confine, mai nel dominio (`V-142`) |
| **Contratto pubblico dichiarato**, con perimetro chiuso di ciò che è contratto e ciò che è interno (`V-160`) | Prove a contratto in **entrambe le direzioni**; dismissione con preavviso dichiarato |
| **Nessuna capacità raggiungibile solo dall'interfaccia** (`V3`, `V-164`) | L'interfaccia del progetto consuma le stesse interfacce applicative offerte agli integratori |

A queste il presente capitolo aggiunge una misura di prova, che è la sola che intercetta la deriva
**prima** del quinto passo, ed è posta come vincolo `V-188`:

> **La suite di prove di integrazione esercita sempre almeno due tenant e due integratori distinti, con
> configurazioni deliberatamente divergenti** — domini di attribuzione degli identificatori diversi,
> profili di uscita diversi, modalità di recapito degli eventi diverse. Una prova che passa con un solo
> integratore configurato non dimostra la proprietà che si vuole dimostrare.

**`V-188` non è entrato in nessun taglio, ed è deliberato.** Sarebbe stato un candidato ovvio alla
riduzione — due configurazioni costano più di una — ed è stato escluso perché è **l'unica contromisura
automatica** al §4.2, ora che la revisione fra pari non esiste.

### 4.4 Indicatore anticipatore, e che cosa resta da decidere

**L'indicatore, riformulato sotto `D54`.** Nella versione precedente era «una proposta di modifica che
introduca un valore predefinito, un termine di dominio o una prova riferibile a un solo interlocutore,
osservabile in revisione». **Sotto `D54` la revisione è auto-revisione**, e un indicatore che dipende da
un revisore indipendente non è osservabile. L'indicatore diventa quindi automatico, ed è **il numero di
configurazioni distinte esercitate dalla suite di prove di integrazione**: se scende a una, il quinto
passo è già cominciato. È misurabile a ogni costruzione e non richiede nessuno che guardi.

**Che cosa resta da decidere, ed è del committente.** Fino a quale grado di concentrazione la dipendenza è
accettabile, e in quale momento il progetto deve procurarsi una **seconda controparte di prova** — che può
essere un secondo integratore reale, un ente, o un'implementazione di riferimento costruita apposta. È la
questione `Q-187`.

**Una regola redazionale che discende dalla regola `R0`.** Nessun documento, commit, segnalazione,
proposta di modifica o materiale pubblico del progetto nomina aziende, prodotti commerciali, marchi o
domini di potenziali partner. Questo rischio, in particolare, si descrive **strutturalmente** — «un
integratore», «la controparte», «il sistema di origine» — e mai per nome.

---

## 5. Come si sorveglia il registro

### 5.1 Cadenza e forma della revisione

Il registro si rivede nella **revisione periodica** di [00 §8](./00-indice.md), con esito registrato anche
quando l'esito è «nessuna variazione». Per ciascun rischio aperto la revisione produce quattro
informazioni e non una in più:

1. **Lo stato dell'indicatore anticipatore**: osservato o non osservato. Mai «in miglioramento».
2. **Le variazioni di probabilità o di impatto**, con la causa. Una variazione senza causa è
   un'impressione.
3. **Lo stato della risposta**: attuata, in attuazione, non attuata. Se non attuata, **perché**.
4. **La durata**, per i rischi con probabilità *Accertato*: da quanti giorni la condizione persiste. È
   l'unico modo per impedire che una condizione accertata diventi normale — e **sette voci di questo
   registro sono `Accertato`**: `R-02`, `R-04`, `R-05`, `R-12`, `R-19`, `R-29` e `R-30`.

**La cadenza cambia nelle ultime sei settimane.** Dal 19 ottobre 2026 la revisione è **settimanale** e ha
un contenuto ridotto a due numeri: **righe residue dell'ordine di sacrificio** e **criteri bloccanti di
`RU-1` soddisfatti**. È la contromisura di `R-28`, e una revisione mensile su un piano senza margine
osserverebbe il fenomeno quando è finito.

### 5.2 Quando un rischio si chiude, e quando no

Un rischio si chiude **solo** se la condizione che lo produce è stata rimossa, e la rimozione è
verificabile. Non si chiude perché non si è verificato, perché il traguardo che colpiva è passato, o
perché nessuno lo cita più. Un rischio la cui risposta è *accettare* **non è chiuso**: è accettato, resta
in registro, e la sua accettazione è una decisione registrata con un titolare.

**`R-01` è l'unica voce chiusa di questo registro**, e il §2.1 dichiara sia la causa della chiusura sia
ciò che **non** si è chiuso con essa. È il modello che ogni chiusura futura deve seguire: chiudere un
rischio senza dichiarare che cosa resta è il modo più rapido per farlo riapparire senza nome.

### 5.3 Quando un rischio nuovo entra

Un rischio entra quando è formulato con tutti gli elementi di `V-189`: che cos'è, probabilità secondo la
scala del §1.2, impatto sul calendario secondo la scala del §1.3, **indicatore anticipatore osservabile**,
risposta fra le quattro ammesse, titolare nominato. Una segnalazione priva di indicatore o priva di
titolare non è un rischio nuovo: è una preoccupazione, e va riformulata.

**Gli inneschi di revisione fuori cadenza** sono quelli di [00 §8](./00-indice.md), e tre riguardano
direttamente questo registro: il verificarsi di un rischio; il superamento di un punto di decisione
irreversibile senza decisione; e — nuovo con `D53` — **il consumo di una riga dell'ordine di sacrificio**,
che obbliga a rivedere `R-28` e il traguardo colpito.

---

## 6. Che cosa non è in questo registro

| Materia | Dove vive | Perché non qui |
|---|---|---|
| Rischi per la sicurezza della persona assistita | [`docs/08_compliance/05-gestione-del-rischio.md`](../08_compliance/05-gestione-del-rischio.md) | Hanno scala, disciplina e verifica di efficacia proprie. Mescolarli farebbe apparire negoziabile un rischio clinico |
| Scenari d'uso pericolosi e ingegneria dell'usabilità | Fascicolo di ingegneria dell'usabilità, in `docs/08_compliance/` | Sono rischi d'uso, non di programma |
| Minacce alla sicurezza informatica del sistema | [`docs/06_security/`](../06_security/00-indice.md) | Hanno un modello di minaccia proprio e prove di abuso proprie |
| Ripartizione delle misure fra fornitore e cliente | [`docs/06_security/09-ripartizione-delle-responsabilita.md`](../06_security/09-ripartizione-delle-responsabilita.md) | È una tabella di responsabilità, non di rischi |
| Esclusioni di perimetro | [`docs/03_functional/07-fuori-perimetro.md`](../03_functional/07-fuori-perimetro.md) | Un'esclusione decisa non è un rischio: è un confine |
| **Tagli di ambito e loro reversibilità** | [03 §5](./03-primo-rilascio-utilizzabile.md) | Un taglio deciso e dichiarato non è un rischio: è **un fatto**, con la sua conseguenza scritta. Il rischio è che se ne facciano altri senza registrarli, ed è `R-28` |
| Debito tecnico e debito regolatorio già contratti | [01 §§7–8](./01-principi-e-metodo.md) | Non sono rischi: sono **fatti**, con un elenco che li dichiara |

---

## 7. Bacheca

### 7.1 I vincoli posti da quest'area

| # | A | Vincolo |
|---|---|---|
| `V-187` | tutte | Una voce non è **pianificata** se non ha insieme criterio di completamento binario, innesco dichiarato e titolare nominato. In assenza anche di uno solo dei tre è **desiderabile**, e va marcata tale in ogni materiale |
| `V-188` | `TECH`, `INTEG`, `ARCH` | La suite di prove di integrazione esercita **sempre almeno due tenant e due integratori distinti**, con configurazioni deliberatamente divergenti |
| `V-189` | tutte | Ogni rischio di programma ha un **indicatore anticipatore osservabile** e un **titolare nominato** |
| `V-280` | tutte | **Riformulazione di `V-180` alla luce di `D57` e `D58`.** La roadmap è **pianificazione interna del progetto** e il titolare dei traguardi è il progetto, compresi quelli del percorso di conformità. Restano non dichiarabili le sole date che la norma pone in capo a un soggetto diverso — il termine di adeguamento del singolo utilizzatore, l'accreditamento del fornitore di servizi. **Una data di pianificazione interna non è una promessa di esito**: nessun materiale scrive che il prodotto sarà marcato entro una data (`V-171`) |
| `V-281` | tutte, in particolare `COMP` | **Nessun traguardo entra nel piano se richiede due soggetti distinti e il secondo non esiste.** La registrazione che ne deriverebbe si dichiara come **lacuna, con la data in cui nasce**, e non si pianifica come attività |
| `V-282` | tutte | **L'ambito è l'unica variabile libera.** Con data e capacità fissate da `D53` e `D54`, ogni scostamento si assorbe **riducendo l'ambito** secondo l'ordine di sacrificio dichiarato in [03 §6](./03-primo-rilascio-utilizzabile.md), che contiene **soltanto tagli reversibili**; mai spostando la data in silenzio, mai comprimendo un criterio di rilascio bloccante. Se l'ordine si esaurisce, **la data si dichiara mancata con la causa registrata** |

### 7.2 Le questioni aperte da quest'area

| # | A | Questione |
|---|---|---|
| `Q-183` | `COMP` | Quali evidenze del **pacchetto regolatorio** sono consegnabili e quali no. Determina il perimetro di `T-12`, e con `D58` determina anche che cosa il fascicolo del **nostro** percorso conterrà |
| `Q-184` | `SEC`, `ARCH` | Coordinamento temporale sui livelli di servizio attesi: la **capacità di misura** è requisito del primo rilascio, i **valori** sono determinati prima del primo esercizio |
| `Q-185` | `PROD`, → **ORCH** | Materiale pubblico non allineato a `D19` e `D29`; l'impatto è **irrecuperabile**. Si salda con `Q-174` e con `Q-281` |
| `Q-186` | `COMP`, `TECH` | **Periodo di supporto dichiarato**. Prerequisito della prima distribuzione e criterio bloccante di `RU-1` |
| `Q-187` | → **ORCH** | **Concentrazione ammessa su un solo integratore** e momento della seconda controparte di prova. Aggravato da `D53` e `D54` (§4.2) |
| `Q-188` | `COMP`, → **ORCH** | **Riserva dichiarata per le voci non stimabili.** Con `D58` i cicli di risposta alle non conformità sono lavoro nostro e occupano la stessa capacità che produce il software: la riserva non è più un capitolo di un piano altrui |
| `Q-189` | → **ORCH** | **Ripartizione delle registrazioni a ruoli distinti.** Quale sottoinsieme si accetta come lacuna dichiarata e quale si copre acquisendo la funzione all'esterno. Punto di decisione: **30 settembre 2026**; esito predefinito in assenza di decisione: lacuna dichiarata su `RU-1`. `R-29`, `TG-20`, `OL-22` |
| `Q-280` | → **ORCH** | **Costituzione del soggetto fabbricante** (`D58`): forma giuridica, avvio della pratica, profilo e reperimento della persona responsabile del rispetto della normativa. È di **classe `B`** — poche ore e molti mesi — e ogni settimana di ritardo si trasferisce integralmente in fondo alla catena. Punto di decisione: **19 settembre 2026**. `R-30`, `T-14` |
| `Q-281` | `PROD`, → **ORCH** | **La differenza fra ciò che il materiale pubblico dichiara e ciò che `RU-1` consegna.** Alla pubblicazione del rilascio la distanza diventa verificabile da chiunque: serve la formulazione approvata che la dichiara, con la stessa evidenza dell'elenco delle funzioni. Vale in particolare per le capacità tagliate con `TG-01`, `TG-02` e `TG-03`. Punto di decisione: **31 ottobre 2026**. `R-19` |
| `Q-282` | `COMP` | **Forma della dichiarazione delle lacune datate nel fascicolo.** Quali registrazioni sono **datate a un periodo** e quindi non ricostruibili — riesame del rilascio, audit interno, valutazione formativa di usabilità, ancoraggio del registro — e con quale forma la loro assenza va dichiarata nel fascicolo tecnico perché sia riconoscibile come lacuna dichiarata e non come omissione. **`Q-189` decide la ripartizione, questa questione decide la forma**: sono complementari e nessuna sostituisce l'altra. `TG-20`…`TG-23` |

### 7.3 Contributo alla questione `Q-191`, per la parte di quest'area

> *«Consumo di memoria e disco dell'ambiente locale: non misurato. Serve una misura su macchina di
> riferimento dichiarata e la dichiarazione del profilo minimo praticabile.»* — `GUIDA` → `TECH`, `ROAD`

**Risposta per la parte di roadmap.** Quest'area **non produce la misura**, che è di `TECH`, e non sceglie
la macchina di riferimento. Dichiara però la collocazione: la misura e la dichiarazione del **profilo
minimo praticabile** sono un criterio della catena di costruzione (`T-03`) e non un'attività successiva.
Finché il profilo minimo non è dichiarato, la dipendenza «contributori» del §3.2 **non ha una condizione
verificabile**, e `R-02` non ha un indicatore anticipatore per la componente «ingresso di un contributore
esterno» — un rischio senza indicatore viola `V-189`.

**Sotto `D54` la questione cambia peso e va detto.** Un contributore esterno non è più soltanto un
acceleratore: è **la sola via per cui due rischi si chiudono insieme**, `R-02` per la continuità e `R-29`
per il secondo soggetto. La barriera d'ingresso non misurata non è quindi un dettaglio di ergonomia dello
sviluppo: è **la variabile che tiene aperto il rischio con impatto `I5` di questo registro**. **Resta
aperta verso `TECH`** per la misura.

---

**Fine dell'area.** Il percorso di lettura per il committente si chiude qui:
[01 §11](./01-principi-e-metodo.md) sulla capacità dichiarata, [02 §§2 e 6](./02-traguardi.md) sulla
decisione presa e sui punti di decisione irreversibili,
[03 §5](./03-primo-rilascio-utilizzabile.md) su che cosa è stato tagliato e che cosa non torna, e questo
capitolo. Le questioni che richiedono espressamente una decisione del committente sono `Q-185`, `Q-186`,
`Q-187`, `Q-188`, `Q-189`, `Q-280` e `Q-281`.

> **Avvertenza permanente.** Nessun rischio di questo registro, per quanto mitigato, e nessun traguardo di
> questa roadmap, per quanto raggiunto, modifica lo stato di fatto: **oggi il prodotto non reca marcatura
> CE**, non è coperto da alcuna dichiarazione di conformità, e **nessun artefatto distribuito è
> utilizzabile per l'erogazione di prestazioni sanitarie su pazienti reali** (`D16`). Il repository è
> codice sorgente sotto licenza permissiva, **non un dispositivo medico**. Che il progetto intenda
> assumere il ruolo di fabbricante (`D58`), con il soggetto ancora da costituire, è **pianificazione
> interna**: non è una data di marcatura (`V-171`, `V-280`), non copre alcuna installazione presente e non
> toglie alcun obbligo a chi installa, integra o mette in servizio il software. La responsabilità verso il
> danneggiato **non è escludibile per contratto**. Le dichiarazioni che attestano lo stato di fatto sono
> pubblicate in
> [`NOT-A-MEDICAL-DEVICE.md`](https://github.com/fedcal/Telemedic/blob/main/NOT-A-MEDICAL-DEVICE.md) e in
> [`DISTRIBUTION-POLICY.md`](https://github.com/fedcal/Telemedic/blob/main/DISTRIBUTION-POLICY.md).
