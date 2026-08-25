---
title: Rischi e dipendenze
sidebar_position: 6
description: Il registro dei rischi di programma — ventisette voci con probabilità dichiarata, impatto sul calendario, indicatore anticipatore, risposta e titolare — le dipendenze esterne famiglia per famiglia, il rischio strutturale di dipendenza da un solo integratore e la procedura con cui il registro si sorveglia.
---

# Rischi e dipendenze

> **Questo è il registro dei rischi di programma, e la parola «programma» è la parte
> vincolante.** Qui si misura una sola grandezza: **l'effetto sul calendario e sulla
> consegnabilità**. I rischi per la sicurezza dell'assistito non appartengono a questo registro,
> hanno una disciplina propria, una scala propria e un file proprio, e mescolarli produrrebbe il
> danno peggiore che un documento di pianificazione possa produrre: far apparire negoziabile un
> rischio clinico perché sta in una tabella accanto a un ritardo.

---

## 1. Che cosa entra qui, e con quale forma

### 1.1 Il confine con la gestione del rischio clinico

I rischi che riguardano la sicurezza della persona assistita sono governati dal file di gestione
del rischio del pacchetto regolatorio, che vive in `docs/08_compliance/05-gestione-del-rischio.md`
ai sensi di `D6`, `D12` e `D49`, con la propria analisi, la propria stima, le proprie misure di
controllo e la **verifica di efficacia** di ciascuna misura. Questo registro **vi rinvia e non li
riscrive**.

La distinzione è operativa e si applica con una domanda sola:

> **Se questo accade, chi ne subisce l'effetto?** Se la risposta è «una persona assistita», la
> voce non è qui. Se la risposta è «il calendario, il perimetro o la consegnabilità», la voce è
> qui.

Ne discendono due conseguenze che vanno dette per esteso.

**Un rischio di programma può avere un rischio clinico come conseguenza indiretta**, e in quel
caso compare in entrambi i registri con due formulazioni diverse: qui come effetto sul
calendario, là come pericolo per la persona con la propria misura di controllo. Il caso tipico è
`R-23`, la deriva del perimetro: sul calendario produce una rivalutazione di conformità; sul
piano clinico produce una funzione che interpreta senza essere stata valutata come tale. **Le
due voci non si sostituiscono a vicenda.**

**Nessuna voce di questo registro ha come risposta «si accetta il rischio clinico».** La
tolleranza al rischio di programma è una scelta di pianificazione; quella al rischio clinico non
lo è, e non è competenza di quest'area. Dove la risposta a un rischio di programma toccherebbe
un controllo di rischio clinico, la risposta ammessa è una sola: **il traguardo slitta**. È la
traduzione, sul piano del tempo, del divieto di debito tecnico su registro degli accessi,
verifica delle chiavi, avviso di qualità, allerte, consenso, isolamento fra tenant e assenza di
contenuto clinico nei registri, elencato in [01 §7.3](./01-principi-e-metodo.md).

### 1.2 La scala di probabilità, definita prima delle voci

Non esistono percentuali in questo registro. Una percentuale su un progetto senza cronologia di
consegna è un numero che qualcuno citerà come dato entro due settimane, e sarebbe inventato. Le
classi sono cinque e hanno una definizione operativa.

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
| **I5** | **Irrecuperabile.** Il risultato non è ottenibile in seguito, a nessun costo. È la classe delle attività `A` di [01 §2](./01-principi-e-metodo.md) |

**La classe `I5` è la ragione per cui questo registro esiste in questa posizione della roadmap.**
Un rischio `I5` con probabilità anche solo media vale più di dieci rischi `I2` con probabilità
alta, e nessuna somma pesata deve poter produrre il contrario.

### 1.4 Le quattro risposte ammesse

**Evitare** — si rimuove la condizione che lo produce, tipicamente cambiando una scelta di
progetto. **Ridurre** — si abbassa la probabilità o l'impatto con una misura verificabile.
**Trasferire** — si sposta su un soggetto che è nella posizione di sostenerlo. **Accettare** — si
dichiara e si sorveglia, senza misura.

Sul trasferimento vale un limite che non è negoziabile e va scritto ogni volta: **nessun rischio
si trasferisce su chi installa o sull'assistito per il tramite di una clausola.** La licenza
permissiva del progetto vale fra le parti, non verso il danneggiato, e la fonte europea in
materia di responsabilità da prodotto difettoso vieta l'esclusione contrattuale della
responsabilità verso di lui. Il trasferimento ammesso è quello **verso chi ha già l'obbligo per
legge** — chi certifica, chi installa, il titolare del trattamento — e consiste nel dichiararlo,
non nell'imporlo.

### 1.5 La forma di una voce, e il vincolo che la governa

Ogni voce porta: che cos'è, probabilità, impatto sul calendario, **indicatore anticipatore**,
risposta, titolare.

L'indicatore anticipatore non è un ornamento: è **il fatto osservabile che precede il verificarsi
del rischio**, e la sua assenza rende la voce inutile, perché un rischio che si riconosce solo
quando è accaduto è un incidente. Posto come vincolo `V-189`:

> **Ogni rischio del registro ha un indicatore anticipatore osservabile e un titolare nominato.
> Un rischio senza indicatore non si sorveglia: va riformulato o chiuso.**

Il **titolare** è chi ha l'autorità di attuare la risposta, non chi ne subisce l'effetto. È una
distinzione che si perde facilmente e la cui perdita produce registri in cui ogni rischio è di
tutti, cioè di nessuno.

---

## 2. Il registro

### 2.1 Capacità e organizzazione

> **`R-01` — La capacità del progetto non è dichiarata**
> *Probabilità* **Accertato** · *Impatto* **I4** · *Titolare* **committente**

**Che cos'è.** Al 25 agosto 2026 non esiste una dichiarazione di quante persone lavorino al
progetto, con quali competenze e con quale continuità. Senza quella grandezza **nessuna data
interna è calcolabile**, e l'intera roadmap è costruita sotto l'ipotesi dichiarata `H2` di
[01 §11](./01-principi-e-metodo.md). È la questione `Q-181`.

**Indicatore anticipatore.** Il superamento del 15 settembre 2026 senza risposta: è il punto di
decisione irreversibile di [02 §6](./02-traguardi.md), oltre il quale l'opzione che mantiene
invariato il traguardo di `D5` decade da sé.

**Risposta.** *Ridurre*, non evitare: la roadmap produce comunque date, ma **sotto ipotesi
dichiarata e con la regola di ricalcolo scritta** ([01 §10](./01-principi-e-metodo.md)), così che
chi legge possa rifare il calcolo invece di fidarsi. È un trasferimento di potere dal
pianificatore al lettore, ed è deliberato.

> **`R-02` — Concentrazione del progetto su un unico contributore**
> *Probabilità* **Alta** · *Impatto* **I4** · *Titolare* **committente**

**Che cos'è.** Sotto l'ipotesi `H1`, e in parte sotto `H2`, la conoscenza del progetto risiede in
una sola persona. L'indisponibilità di quella persona non ritarda il progetto: lo ferma. Il
rischio è aggravato dalla natura regolata del prodotto, perché alcune registrazioni — revisione,
approvazione, riesame — richiedono **soggetti distinti** e non sono producibili da chi ha svolto
l'attività.

**Indicatore anticipatore.** Un'attività che richiede due ruoli distinti — audit interno,
riesame del rilascio, verifica di configurazione eseguita da chi non l'ha scritta — che viene
completata da una sola persona con due cappelli. È osservabile nelle registrazioni, non nelle
intenzioni.

**Risposta.** *Ridurre*, con tre misure già in vigore o pianificate: la guida dei fondamenti
`D35`, che esiste per rendere il progetto apprendibile da un estraneo; il modello «documenti come
codice», che rende la cronologia delle decisioni leggibile senza chiedere a nessuno; l'ambiente
di sviluppo avviabile su una macchina disconnessa da tutto (`V-190`), che abbassa la soglia
d'ingresso di un contributore esterno. **Resta scoperta** la parte relativa alle registrazioni a
ruoli distinti, che è la questione `Q-189`.

> **`R-12` — La capacità ricorrente di sorveglianza consuma capacità di sviluppo**
> *Probabilità* **Accertato** · *Impatto* **I2 ricorrente** · *Titolare* **progetto**

**Che cos'è.** Il livello di servizio di aggiornamento dei componenti di terze parti si esprime
in **giorni dalla pubblicazione dell'avviso, differenziato per gravità** (`V-185`), e questo
impegno consuma capacità **ogni mese, per sempre**. L'osservazione che lo fonda è misurata: il
nodo di relay ha avuto quattordici rilasci in poco più di sette mesi, cinque nel solo mese di
agosto 2026, con una vulnerabilità critica corretta a metà percorso.

**Quantificazione.** `[NV]` — non è stimabile senza cronologia di consegna propria. Ciò che si
può dichiarare è la **regola**: la capacità ricorrente si sottrae dalla capacità dichiarata
**prima** di calcolare qualunque data ([01 §9](./01-principi-e-metodo.md)). Un piano costruito
sulla capacità lorda è già in ritardo il giorno in cui viene pubblicato.

**Indicatore anticipatore.** Il primo avviso di sicurezza su un componente esposto che viene
chiuso oltre la finestra dichiarata. La misura è il livello di servizio stesso, che si pubblica
**misurato** e non promesso.

**Risposta.** *Ridurre*: automazione dell'aggiornamento delle dipendenze, distinta dei materiali
generata a ogni costruzione e registro dei componenti con annotazioni versionate, che è il
meccanismo per cui un componente non valutato non entra (controllo `G5`). *Accettare* il residuo,
dichiarandolo.

> **`R-21` — Il reclutamento di utenti rappresentativi non si comprime**
> *Probabilità* **Alta** · *Impatto* **I3** · *Titolare* **committente**, per l'ingaggio

**Che cos'è.** La validazione sommativa di usabilità richiede utenti rappresentativi che
comprendono persone anziane e persone con disabilità — che sono la **popolazione di riferimento**
e non un caso limite — e il loro reclutamento ha un tempo di calendario proprio, con consensi da
raccogliere e protocollo da approvare prima dell'esecuzione. La fonte richiamata da `D12` lo
colloca fra le attività non comprimibili.

**Indicatore anticipatore.** L'assenza di un protocollo di validazione approvato al momento in
cui l'interfaccia si avvicina al congelamento. Il protocollo si approva **molto prima** della sua
esecuzione, e chi se ne accorge dopo ha già perso il tempo.

**Risposta.** *Ridurre*, anticipando il protocollo e le valutazioni formative; *accettare* la
durata del reclutamento, che non dipende dalla velocità del progetto. È la ragione per cui il
traguardo `T-11` è di classe `B` in [02 §5](./02-traguardi.md).

> **`R-22` — Le figure specialistiche necessarie sono una risorsa scarsa**
> *Probabilità* **Media** · *Impatto* **I3** · *Titolare* **committente**

**Che cos'è.** Il percorso richiede competenze che non si improvvisano: ingegneria dei fattori
umani, redazione clinica con qualifica documentabile, verifica di sicurezza indipendente,
responsabile della qualità disponibile in modo permanente. La ricerca sul percorso di
certificazione osserva inoltre che le persone in possesso della qualifica di responsabile del
rispetto della normativa sono scarse, e che la deroga per le micro e piccole imprese **ne
aumenta la domanda**, perché consente a molte strutture di attingere allo stesso mercato esterno.

**Indicatore anticipatore.** Il tempo che intercorre fra la prima richiesta di preventivo a un
professionista specializzato e la sua risposta. Se supera le due settimane, il mercato è saturo e
la pianificazione va rifatta su quel dato.

**Risposta.** *Ridurre*, avviando la ricerca dei profili **prima** che servano — è la ragione per
cui la fonte colloca l'identificazione del candidato responsabile fra le azioni dei primi trenta
giorni e non fra quelle della fase di ingaggio. Per la parte che grava su chi certifica,
*trasferire* con dichiarazione: il progetto documenta il fabbisogno, non lo assume (`D49`,
`V-06`).

> **`R-24` — Le priorità si spostano su richiesta esterna**
> *Probabilità* **Alta** · *Impatto* **I2, cumulativo** · *Titolare* **committente**

**Che cos'è.** Una richiesta che arriva da fuori — un integratore, una gara, una dimostrazione —
ha una forza di persuasione che una voce di coda non ha, e la deviazione singola costa poco. Il
costo è **cumulativo**: tre deviazioni da due settimane consumano il margine di un traguardo
senza che nessuna delle tre appaia significativa nel momento in cui viene concessa.

**Indicatore anticipatore.** Una revisione mensile che registri un sorpasso in coda **senza
innesco verificato** ai sensi di [04 §2.3](./04-oltre-il-primo-rilascio.md).

**Risposta.** *Ridurre*, con il metodo: ogni deviazione passa dalla procedura di ampliamento del
perimetro e dalla revisione mensile, ed è registrata con la sua causa. Un registro dei sorpassi
rende visibile un fenomeno che altrimenti è invisibile per costruzione.

### 2.2 Volume del corpus e regime linguistico

> **`R-03` — Il volume del corpus documentale eccede la capacità di traduzione**
> *Probabilità* **Alta** · *Impatto* **I4 sul traguardo del 30 novembre 2026** · *Titolare*
> **committente**, per la modalità

**Che cos'è.** È il rischio dominante dell'intero piano fino al 30 novembre 2026. `D50` impone la
versione inglese **integrale**, non in sintesi; il corpus italiano è dell'ordine delle centinaia
di migliaia di parole; la modalità di produzione della traduzione non è decisa (`Q-182`); e
`D52` impedisce di dichiarare chiusa un'area che non sia navigabile online **nelle due lingue**.
Le tre condizioni insieme rendono `T-06` e, per dipendenza, `T-07` non databili con certezza.

**Indicatore anticipatore.** Il superamento del 30 settembre 2026 senza decisione su `Q-182`. È
un punto di decisione irreversibile dichiarato in [02 §6](./02-traguardi.md): oltre quella data
`T-06` non cade nel 2026, e con esso non cade `T-07`.

**Risposta.** *Ridurre* con la misura preliminare — il **conteggio esatto delle parole**, che è
criterio di completamento di `T-02` e senza il quale la durata non è nemmeno esprimibile — e con
il congelamento del corpus italiano prima di iniziare: **non si traduce un corpus che cambia**.
Poi *accettare* l'esito e riformulare il traguardo, che è l'opzione 1 di
[02 §4.2](./02-traguardi.md).

> **`R-16` — Le due versioni linguistiche divergono**
> *Probabilità* **Alta**, in assenza di controllo automatico · *Impatto* **I5 sul piano
> regolatorio** · *Titolare* **progetto**

**Che cos'è.** Un contenuto normativo che dice due cose diverse in due lingue non è un problema
di traduzione: è **un difetto documentale in un dispositivo medico**, e come tale è classificato
in [01 §8.1](./01-principi-e-metodo.md). L'impatto è `I5` perché una divergenza scoperta in sede
di verifica non si «corregge»: obbliga a riemettere e a dimostrare da quando esisteva.

**Indicatore anticipatore.** La prima proposta di modifica accettata che tocchi il contenuto
italiano **senza** aggiornare l'inglese. È osservabile automaticamente dal controllo `G8`, ed è
la ragione per cui quel controllo deve esistere prima del corpus inglese e non dopo.

**Risposta.** *Evitare*, per costruzione: il controllo `G8` fa fallire la costruzione, e la
regola di completezza della proposta di modifica è dichiarata in `D50`. Il costo è noto e
dichiarato: **raddoppia il costo marginale di ogni modifica documentale, per sempre**.

### 2.3 Conformità, decisioni e perimetro

> **`R-04` — L'area di conformità concentra le questioni pendenti delle altre aree**
> *Probabilità* **Accertato** · *Impatto* **I3** · *Titolare* **orchestrazione**, poi `COMP`

**Che cos'è.** L'area `docs/08_compliance/` è ora scritta — dieci documenti — e il documento di
ricerca sul percorso di certificazione è stato completato dopo essere risultato troncato
(`Q-25`). Il rischio non si chiude con la stesura, però, e va riformulato invece che
cancellato: quell'area resta quella verso cui converge il maggior numero di questioni pendenti
delle altre, e su di essa poggiano la procedura di controllo dei documenti di `T-01`, il
registro degli identificativi di requisito e l'intero pacchetto regolatorio di `T-12`. Scrivere
i documenti ha rimosso il rischio di partenza; non ha risolto le questioni che vi convergono, e
scambiare le due cose sarebbe il modo più rapido per perderne il controllo.

**Indicatore anticipatore.** Il numero di questioni `APERTA` indirizzate a `COMP` che cresce fra
due revisioni mensili consecutive senza che nessuna si chiuda.

**Risposta.** *Ridurre*, con la sequenza: le attività di classe `A` che appartengono
naturalmente a quell'area — controllo dei documenti, registro degli identificativi — sono
**anticipate in `T-01`** e non attendono che l'area sia scritta, perché il loro costo di
omissione cresce ogni giorno.

> **`R-05` — I modelli documentali delle tipologie di telemedicina non sono disponibili**
> *Probabilità* **Accertato** · *Impatto* **I0 sul progetto, I3 su chi conferisce** · *Titolare*
> **`COMP`**, per l'interlocuzione

**Che cos'è.** Modelli di documento strutturato, codici di tipologia e metadati di indicizzazione
non sono pubblicamente disponibili (`Q-07`, `B-7`, `V-136`). Senza di essi il conferimento alle
infrastrutture documentali non è realizzabile.

**Perché l'impatto sul progetto è nullo, ed è un risultato e non una fortuna.** Perché il
contenuto è modellato come **dataset canonico** e ogni serializzazione è sostituibile (`V-07`).
L'arrivo del materiale sarà la scrittura di un mappatore, non una migrazione del modello. Il
rischio esisteva, è stato **evitato per progettazione**, e la voce resta in registro per
sorvegliare l'unica cosa che può ancora andare storta: che qualcuno cabli un template per
convenienza.

**Indicatore anticipatore.** La comparsa, in una proposta di modifica, di un template
documentale dentro il dominio invece che dietro il punto di estensione.

**Risposta.** *Evitare* per costruzione, con verifica automatica; *trasferire* con dichiarazione
la parte di calendario, che è di un terzo e ricade in `V-180`.

> **`R-17` — Le decisioni del committente non vengono prese entro le date dichiarate**
> *Probabilità* **Media** · *Impatto* **da I2 a I5, secondo la decisione** · *Titolare*
> **committente**

**Che cos'è.** Sette decisioni hanno una data oltre la quale **la mancata decisione è essa stessa
una decisione**: capacità (`Q-181`), modalità di traduzione (`Q-182`), congelamento della
destinazione d'uso (`Q-144`), riformulazione del traguardo (`Q-180`), correzione del materiale
pubblico (`Q-185`), periodo di supporto (`C-4`, `Q-186`), regime di licenza di scale e
questionari (`B-3`). L'elenco con le conseguenze è in [02 §6](./02-traguardi.md).

**L'impatto varia, e la variazione è la parte istruttiva.** Il congelamento della destinazione
d'uso è `I5` verso l'esterno — cambiarlo dopo aver ingaggiato un organismo comporta una
rivalutazione, e la differenza fra le due formulazioni vale mesi e un ordine di grandezza di
costo. La correzione del materiale pubblico è `I5` in senso proprio: **un periodo di
pubblicazione non si annulla**. Le altre sono `I2` o `I3`.

**Indicatore anticipatore.** Il calendario stesso. È l'unico rischio del registro che ha una data
di scadenza esplicita per ciascuna delle sue componenti.

**Risposta.** *Ridurre*: la roadmap **pone** le decisioni con la conseguenza dichiarata accanto,
e dichiara l'opzione che applica in assenza di risposta — per `Q-180` è l'opzione 1. Un piano che
attende in silenzio una decisione che non arriva ha già scelto, senza dirlo.

> **`R-18` — Una decisione dichiarata rinviata viene presa d'ufficio in una proposta di modifica**
> *Probabilità* **Media** · *Impatto* **I2, con coda `I5` sulla coerenza documentale** ·
> *Titolare* **progetto**

**Che cos'è.** Diciannove decisioni sono dichiarate rinviate in
[`docs/02_architecture/09-decisioni-rinviate.md`](../02_architecture/09-decisioni-rinviate.md).
Chi realizza si imbatte in una di esse e sceglie l'opzione più comoda per proseguire: la
scelta è locale, ragionevole e invisibile. Il costo emerge quando **il codice fa una cosa e la
documentazione ne dice un'altra**, ed è la forma di debito regolatorio più difficile da scoprire
perché nessuno la sta cercando.

**Indicatore anticipatore.** Una proposta di modifica che tocca un'area coperta da una decisione
rinviata **senza** citarla. È verificabile a revisione, se i revisori conoscono l'elenco.

**Risposta.** *Evitare*: la regola è già scritta e vincolante — chi si imbatte in una decisione
rinviata **apre una voce in bacheca e non sceglie**. *Ridurre*: le decisioni con scadenza
anteriore al primo codice sono raccolte nel traguardo `T-05`, che esiste esattamente per questo.

> **`R-19` — Il materiale pubblico non è allineato ai claim approvati**
> *Probabilità* **Accertato** · *Impatto* **I5** · *Titolare* **committente**, con `PROD`

**Che cos'è.** Le riformulazioni approvate con `D19` e `D29` non risultano recepite nella pagina
pubblica (`Q-185`). Finché non lo sono, ogni giorno di esposizione è un giorno di affermazione
non sostenibile. L'impatto è `I5` per la ragione più semplice di tutte: **un periodo di
pubblicazione non si annulla**, e una correzione successiva non cancella ciò che è stato
affermato.

**Perché è più grave di quanto sembri.** La destinazione d'uso di un dispositivo è determinata
**anche dal materiale promozionale**. Un'affermazione commerciale non allineata alla
dichiarazione formale non è un errore di comunicazione: **modifica la destinazione d'uso**, con
effetti sulla qualificazione, e viene rilevata al primo confronto fra il fascicolo e i canali
pubblici.

**Indicatore anticipatore.** Non ce n'è uno anticipatore, perché il rischio è già in essere. Ciò
che si sorveglia è la **durata**: ogni revisione mensile registra da quanti giorni la condizione
persiste.

**Risposta.** *Evitare*, con una data. Il presidio strutturale, però, non è redazionale ma di
processo: **l'allineamento fra dichiarazione formale e comunicazione pubblica va verificato a
ogni modifica del materiale pubblico, e la verifica va registrata.**

> **`R-23` — Deriva del perimetro verso l'innalzamento di classe**
> *Probabilità* **Media** · *Impatto* **I4** · *Titolare* **`COMP`**, con il committente

**Che cos'è.** Tre funzionalità sono **a una singola storia utente** dall'innalzamento di classe:
allerta su soglia, elaborazione dell'immagine, refertazione assistita. La deriva non avviene per
decisione, avviene per accumulo di richieste ragionevoli: un avviso che «suggerisce», una
precompilazione che «aiuta», un miglioramento d'immagine che «rende più leggibile».

**Indicatore anticipatore.** Una proposta formulata come capacità tecnica e non come caso d'uso
con un attore — «sarebbe utile calcolare un punteggio» — è il primo sintomo, e la procedura di
[`docs/03_functional/07-fuori-perimetro.md`](../03_functional/07-fuori-perimetro.md) §7 la
rifiuta in quella forma proprio per renderla visibile.

**Risposta.** *Evitare*: controllo delle modifiche sulle tre funzionalità di confine, prove
negative per ciascuna esclusione, e la regola di sequenza per cui **la valutazione di impatto
regolatorio precede la stima dello sforzo**. Invertire l'ordine fa apparire economica una
modifica che comporta una rivalutazione.

> **`R-26` — La fonte normativa cambia durante il programma**
> *Probabilità* **Alta** · *Impatto* **da I1 a I3** · *Titolare* **`COMP`**

**Che cos'è.** Il progetto poggia su fonti in movimento: tipologie documentali di recente
istituzione, determinazioni dell'autorità nazionale per la cybersicurezza già modificate una
volta nel 2026, guide di implementazione in stato preliminare, obblighi di segnalazione con
decorrenza recente. Una variazione può invalidare una mappatura, un termine o una formula
pubblicata.

**Indicatore anticipatore.** La pubblicazione di una versione nuova di una specifica fissata è
un innesco di **revisione fuori cadenza** dichiarato in [00 §8.2](./00-indice.md). L'indicatore
esiste già come procedura.

**Risposta.** *Ridurre*: **politica di fissaggio delle versioni** per ogni specifica adottata,
con la versione dichiarata accanto a ogni affermazione di conformità e con il divieto di
formule che presentino come standard ciò che non lo è (`V-133`); e nessun template cablato
(`V-136`). *Accettare* il residuo, che non è eliminabile.

### 2.4 Rischi tecnici sul percorso critico

> **`R-13` — I difetti noti del prodotto di federazione tornano al primo aggiornamento**
> *Probabilità* **Media** · *Impatto* **I1, con conseguenza di sicurezza** · *Titolare*
> **progetto**

**Che cos'è.** Tre comportamenti del prodotto di federazione adottato — l'utente federato può
alterarsi gli attributi, cambiare l'indirizzo di posta senza verifica, darsi una credenziale
locale — sono chiudibili in configurazione. Una configurazione chiusa e non sorvegliata si
riapre a un aggiornamento, e nessuno se ne accorge.

**Indicatore anticipatore.** L'assenza di una prova che fallisca se la configurazione
regredisce. Se la prova non esiste, il rischio è già presente e non è anticipato da niente.

**Risposta.** *Evitare*: sono trattati come **controlli di rischio**, non come note di
configurazione — è la formulazione di `D37` — e il criterio 5 di `T-04` richiede sia la chiusura
sia la prova di non regressione.

> **`R-14` — Il lotto della doppia istanza per fornitore di identità è sottostimato**
> *Probabilità* **Alta** · *Impatto* **I2** · *Titolare* **progetto**

**Che cos'è.** Il contesto di autenticazione richiesto è configurato **staticamente sulla singola
istanza**: un livello variabile per operazione richiede un'istanza per ciascuna coppia fornitore
per livello. Il moltiplicatore agisce su un insieme la cui cardinalità si legge da un registro
nazionale e **cambia nel tempo**, e ogni variazione comporta un nuovo deposito del documento di
metadata presso l'autorità. È **costo di procedura, non di codice**, e per questo viene
sottostimato con regolarità.

**Indicatore anticipatore.** Una stima dello sforzo per l'identità digitale nazionale che non
distingua fra costo di codice e costo di procedura.

**Risposta.** *Ridurre*: perimetro dichiarato a **due soli livelli**, con il fattore
moltiplicativo pari a due e non a *n*; convenzione di alias con prefisso stabile, verificata in
integrazione continua sul documento di metadata generato.

> **`R-15` — Un meccanismo di sicurezza viene documentato prima di essere verificato**
> *Probabilità* **Media** · *Impatto* **I5 reputazionale** · *Titolare* **`INTEG`**, con `TECH`

**Che cos'è.** Non è verificato se il prodotto di federazione inoltri il livello richiesto
attraverso il realm di intermediazione (`Q-160`, `B-8`). Se non lo inoltra, l'innalzamento di
livello per operazione non è ottenibile per sola configurazione. Il costo della verifica è quasi
nullo; **il costo di aver documentato un comportamento inesistente su un meccanismo di sicurezza
non lo è**, perché comporta una rettifica pubblica.

**Indicatore anticipatore.** La comparsa, in una bozza di documentazione pubblica, di una
descrizione del meccanismo priva di rinvio a un esito di verifica registrato.

**Risposta.** *Evitare*, con una regola binaria già in vigore: **finché l'esito non è registrato,
la documentazione pubblica non descrive il meccanismo.** È il criterio 3 di `T-04`.

> **`R-20` — Il registro immutabile è più costoso di quanto una pianificazione ingenua assuma**
> *Probabilità* **Alta** · *Impatto* **I3** · *Titolare* **progetto**

**Che cos'è.** È dichiarato dall'area di sicurezza come **il singolo elemento di maggiore sforzo
dell'intero catalogo**. La ragione è che non è una configurazione: il versionamento delle entità
**non rende immutabile**, e il requisito richiede quattro strati che coprono minacce diverse —
catena applicativa, archivio a scrittura singola, conservazione a privilegi disgiunti,
ancoraggio periodico firmato — più la scrittura bloccante, la catena per tenant, la procedura di
verifica e quella di esportazione.

**Indicatore anticipatore.** Una pianificazione che tratti il registro come una proprietà di uno
strato di persistenza invece che come un componente con un ciclo di vita proprio.

**Risposta.** *Ridurre*: è criterio di completamento esplicito del traguardo `T-08` e criterio di
rilascio bloccante di `RU-1`, quindi non è comprimibile nemmeno sotto pressione. *Accettare* il
costo, dichiarandolo nella pianificazione invece di scoprirlo.

> **`R-27` — La costruzione riproducibile non si ottiene**
> *Probabilità* **Media** · *Impatto* **I2** · *Titolare* **progetto**

**Che cos'è.** Due costruzioni della stessa revisione su esecutori diversi devono produrre
artefatti identici. È criterio di `T-03`, è la sola verifica che accerti che la distribuzione
corrisponde al sorgente pubblicato, ed è quindi il fondamento tecnico della separazione fra
repository e distribuzione di `D17`. Ottenerla richiede il controllo di ogni sorgente di non
determinismo, e la prima misura tipicamente fallisce.

**Indicatore anticipatore.** Il primo confronto di impronte fra due esecutori diversi che non
viene eseguito perché «tanto è uguale». La riproducibilità non è una proprietà che si assume: si
misura, e l'esito si conserva.

**Risposta.** *Ridurre*: la verifica è un lavoro pianificato con esito conservato fin dal
traguardo `T-03`, cioè **prima** che esista codice applicativo, quando le sorgenti di non
determinismo sono poche e identificabili.

### 2.5 Catena di fornitura e licenze

> **`R-08` — Un componente incorporato ha un regime di licenza incompatibile**
> *Probabilità* **Media** · *Impatto* **da I2 a I4** · *Titolare* **`COMP`**, con `TECH`

**Che cos'è.** Un componente entra nella distinta con una licenza che non è compatibile con
quella del progetto, oppure con una licenza di tipo «sorgente disponibile» con restrizioni
sull'offerta come servizio gestito a terzi. Il caso già rilevato riguarda le funzionalità
avanzate dell'estensione per serie temporali (`Q-112`), ed è `[NV]` in attesa di verifica sul
testo della licenza primaria.

**Il principio che rende il rischio ricorrente.** Una dichiarazione di licenza apposta su un
contenitore **non dispone dei diritti di terzi sul contenuto ricompreso**: la verifica va fatta
artefatto per artefatto, sulla licenza primaria, e non sulla dichiarazione del contenitore.

**Indicatore anticipatore.** Un componente che compare nella distinta dei materiali e non nelle
annotazioni versionate: è esattamente ciò che il controllo `G5` fa fallire.

**Risposta.** *Evitare* per costruzione con il controllo di licenza in pipeline; *ridurre* con un
ripiego progettato e **provato in integrazione continua** dove esiste, come nel caso citato.

> **`R-09` — Contenuto terminologico a licenza vincolata entra nel repository pubblico**
> *Probabilità* **Bassa**, presidiata · *Impatto* **I5** · *Titolare* **progetto**

**Che cos'è.** Alcune terminologie cliniche hanno licenze incompatibili con un repository
pubblico e con la licenza del progetto: l'accesso stesso al contenuto perfeziona il vincolo, la
clausola che impone di non renderlo accessibile se non a utenti autorizzati è incompatibile con
un repository pubblico, e la catena di sub-licenza è incompatibile per costruzione con una
licenza permissiva. L'impatto è `I5` perché **un contenuto pubblicato una volta non si
ritira**: si può rimuovere dal ramo corrente, non dalla cronologia né dalle copie altrui.

**Indicatore anticipatore.** Una richiesta di aggiungere una voce alla lista di ammissione del
controllo terminologico che non passi dalla revisione prevista per il materiale di conformità.
La modifica di quella lista **è materia di conformità**, non di configurazione (`V-191`).

**Risposta.** *Evitare*, con tre misure cumulative: la regola per cui il progetto non scarica mai
il contenuto vincolato; il controllo terminologico in integrazione continua con lista di
ammissione versionata; la proprietà, verificata eseguendo la suite funzionale completa, che il
sistema resti **pienamente operativo con quei sistemi disattivati** (`V-03`). Il costo è
dichiarato, non nascosto: una parte dei binding non si valida.

> **`R-25` — Un componente esposto ha una cadenza di rilascio superiore alla capacità di
> aggiornamento**
> *Probabilità* **Alta** · *Impatto* **I1 ricorrente, con conseguenza di sicurezza** ·
> *Titolare* **progetto**, per il rilascio; **chi installa**, per l'applicazione

**Che cos'è.** Il nodo di relay è il componente più esposto dell'architettura e ha la cadenza di
rilascio più alta. La stessa famiglia di difetti — aggiramento delle liste di indirizzi vietati
per canonicalizzazione o confronto errato delle forme di indirizzo estese — ha prodotto **sei
vulnerabilità distinte in otto anni** su un componente maturo, quattro delle quali negli ultimi
otto mesi.

**Indicatore anticipatore.** La distanza fra la versione minima dichiarata dal progetto e
l'ultima versione pubblicata dal componente, misurata a ogni revisione mensile.

**Risposta.** *Ridurre* e *trasferire con dichiarazione*, nella ripartizione già scritta: il
progetto rilascia gli aggiornamenti su canale autenticato entro il livello di servizio dichiarato
in giorni per gravità; **chi installa li applica**. La difesa che non dipende da nessuna delle
due è però un'altra, ed è la ragione per cui il rischio resta `I1` e non sale: **l'isolamento di
rete in uscita del relay è difesa primaria** e non dipende dalla correttezza del codice; le liste
di indirizzi vietati sono difesa in profondità (`V-10`, `V-157`).

### 2.6 Rischi che dipendono interamente da terzi

> **`R-06` — I tempi dell'organismo di valutazione della conformità**
> *Probabilità* **Alta** · *Impatto* **I3 su chi certifica, I0 sul progetto** · *Titolare* **chi
> certifica**

**Che cos'è.** Il 51 % degli organismi impiega **13–18 mesi** dalla firma dell'accordo al
certificato e il 31 % ne impiega **19–24**; a fine 2025 il divario era di 25 978 domande contro
13 953 certificati; l'organico degli organismi è in **contrazione** — meno 8 % di personale
interno e meno 21 % di subappaltatori — per la prima volta in oltre un decennio. Ne discende
l'aritmetica di `D44`: anche firmando entro dicembre 2026 il certificato non arriva prima di
gennaio 2028 nell'ipotesi più favorevole, e realisticamente fra giugno 2028 e giugno 2029.

**Due elementi che vanno detti perché sono quelli che si scoprono tardi.** Il primo: **un
fabbricante nuovo, micro, alla prima certificazione non è un cliente prioritario** per un
organismo con capacità in contrazione, e va messo in conto nella negoziazione. Il secondo: il
**tempo di attesa prima di essere accettati** non è misurato da alcuna indagine pubblica, ed è
per questo la variabile più pericolosa dell'intero percorso.

**Perché l'impatto sul progetto è nullo.** Perché il progetto **non ingaggia organismi e non
appone marcatura** (`D28`, `D49`, `V-06`, `OUT-20`). Le date dello scenario di riferimento sono
riportate in [02 §5](./02-traguardi.md) come traguardi di terzi, con la fonte, e non
costituiscono impegno. La voce è in registro perché **chi legge la roadmap deve poter collocare
il proprio piano**, non perché il progetto la subisca.

**Indicatore anticipatore, per chi certifica.** Il numero di organismi contattati che rispondono
con una disponibilità reale, non con un listino. Se è zero dopo il primo giro, lo scenario di
riferimento è già decaduto.

**Risposta.** *Trasferire con dichiarazione*: il progetto documenta il percorso come **manuale
per chi certifica** ai sensi di `D20` e `D49`, e non lo assume.

> **`R-07` — I cicli di risposta alle non conformità occupano le stesse persone**
> *Probabilità* **Alta** · *Impatto* **I3** · *Titolare* **chi certifica**, con effetto sul
> progetto

**Che cos'è.** Da due a quattro cicli, ciascuno con una coda dell'organismo. Non è lavoro del
progetto, ma **occupa le stesse persone** che scrivono il software e la documentazione, e la sua
durata non dipende da loro. È elencato fra i costi nascosti in [01 §4.3](./01-principi-e-metodo.md)
proprio per questo: una pianificazione che lo ignori sbaglia di un fattore due.

**Perché non è stimabile.** Perché il numero e la gravità dei rilievi dipendono dalla qualità del
fascicolo e dall'organismo. Due cicli o quattro sono la stessa pianificazione con costi diversi
di un fattore due. **Va messo a bilancio come riserva dichiarata, non omesso**: un piano
economico privo di riserva per i cicli di non conformità è un piano che assume l'esito migliore
come esito atteso.

**Indicatore anticipatore.** L'esito della verifica di completezza della domanda: una richiesta
di integrazione a quello stadio anticipa un numero di cicli superiore alla media.

**Risposta.** *Ridurre*, con le misure che la fonte indica come efficaci: chiedere il calcolo e
non il prezzo, chiedere impegni sui tempi delle singole fasi, chiedere un riesame preliminare a
pagamento quando è offerto, e **confrontare il totale e non la tariffa** — l'organismo più
economico per giornata può risultare il più costoso se genera più cicli.

> **`R-10` — Dipendenza strutturale da un singolo integratore**
> *Probabilità* **Alta** · *Impatto* **I4 sul perimetro, I2 sul calendario** · *Titolare*
> **committente**

Il rischio è descritto per esteso al §4, perché la sua trattazione richiede più spazio di quanto
una voce di registro ne conceda e perché la sua contromisura è architetturale.

> **`R-11` — Ambienti di prova e controparti non disponibili**
> *Probabilità* **Alta** · *Impatto* **I3 sulle voci che ne dipendono, I0 sul resto** ·
> *Titolare* **committente**, per la ricerca delle controparti

**Che cos'è.** Quattro capacità richiedono qualcosa che il progetto non possiede: ambienti di
pre-produzione e credenziali per l'identità digitale nazionale; un motore di integrazione reale
per la messaggistica ospedaliera; un server di controparte per l'avvio applicativo in contesto
clinico; un gateway di misure reale per verificare se espone i due segnali richiesti dal modello
di sicurezza (`Q-122`, `B-9`).

**La conseguenza che non è di integrazione ma di sicurezza.** Senza il segnale di presenza
periodico indipendente dalla misura e senza la telemetria di stato del dispositivo, la tassonomia
del silenzio perde due categorie tecniche su sette: il sistema non distingue «il dispositivo non
ha misurato» da «il dispositivo non ha trasmesso», il silenzio residuo si diluisce, i contatti a
vuoto crescono e con essi l'affaticamento dell'operatore.

**Indicatore anticipatore.** Il tempo trascorso dalla prima richiesta di accesso a un ambiente di
prova senza risposta. È l'unico indicatore disponibile, e va registrato dalla prima richiesta.

**Risposta.** *Ridurre*: le capacità che ne dipendono sono classificate `[IPOTESI]` in
[04 §3](./04-oltre-il-primo-rilascio.md) e **non sono sul percorso del primo rilascio**, così che
la loro indisponibilità non blocchi il resto. *Accettare* per la parte residua, assumendo in via
cautelativa che la causa dell'assenza di misura sia marcata **non determinabile** invece che
dedotta — che è la scelta corretta anche indipendentemente dal rischio.

---

## 3. Le dipendenze esterne, famiglia per famiglia

Una dipendenza esterna non è un rischio: è una **condizione strutturale**. Il rischio è ciò che
accade quando la si mette sul percorso critico. Questa sezione elenca le famiglie, dichiara chi
le controlla, e — la parte che conta — **che cosa il progetto ha fatto per non esserne
bloccato**.

| Famiglia | Chi la controlla | Che cosa ne dipende | Come il progetto evita di esserne bloccato |
|---|---|---|---|
| **Infrastrutture documentali nazionali e regionali** | Amministrazione | `OL-07`; conferimento dei documenti | Dataset canonico e serializzazione sostituibile (`V-07`, `V-136`). L'attesa costa zero |
| **Federazione nazionale delle identità** | Amministrazione e fornitori | `OL-08`; il canale privo di dipendenze esterne è completabile da solo | Architettura di federazione e realm di intermediazione già in `RU-1`; conformità **verificabile in integrazione continua**, non accreditamento (`V-05`) |
| **Organismi di valutazione della conformità** | Terzi privati designati | Marcatura, che **non è del progetto** | Il progetto produce il pacchetto e non lo sottomette (`D49`). Nessun traguardo del progetto vi dipende |
| **Terminologie a licenza vincolata** | Titolari dei diritti | Validazione di una parte dei binding | Il sistema è **pienamente funzionale senza** (`V-03`), e la proprietà si verifica eseguendo la suite completa con la disattivazione attiva |
| **Componenti di terze parti** | Comunità e fornitori | Ogni artefatto distribuito | Distinta generata, registro annotato, ripieghi provati, isolamento di rete come difesa primaria |
| **Contributori** | Nessuno | Tutto | Guida dei fondamenti, ambiente avviabile su macchina disconnessa, documenti come codice |
| **Controparti di integrazione** | Integratori ed enti | `OL-09`, e la misura della perdita informativa nella traduzione | Contratti e prove pubblicate in entrambe le direzioni; nessuna dichiarazione di conformità senza una prova reale |

### 3.1 La regola comune

Tutte le famiglie sono trattate con lo stesso schema, che è la ragione per cui nessuna di esse
compare fra le dipendenze del primo rilascio:

> **Ogni dipendenza esterna vive dietro un punto di estensione con contratto dichiarato, ha una
> modalità degradata provata, e la modalità degradata è la configurazione predefinita della suite
> di prove.**

L'ultima clausola è quella che rende la regola effettiva invece che esortativa. Una modalità
degradata che non gira nelle prove non è una modalità degradata: è un ramo di codice mai
eseguito, che fallirà la prima volta che serve — cioè nel momento peggiore, quando la dipendenza
è caduta.

### 3.2 La dipendenza che nessuno tratta come tale

**I contributori.** È l'unica famiglia il cui titolare è «nessuno», ed è quella che decide se
tutto il resto accade. Le misure elencate esistono per una ragione precisa: un progetto che
richieda una macchina potente, un accesso a un servizio di terzi o una conoscenza pregressa non
scritta **seleziona i propri contributori** senza dichiararlo. È la ragione per cui il consumo di
memoria e disco dell'ambiente locale, oggi non misurato (`Q-191`), non è una curiosità tecnica ma
una **dipendenza di programma**: senza un profilo minimo praticabile dichiarato, la condizione
che rende possibile la partecipazione di un contributore esterno non è verificabile, e
l'obiettivo di `D35` resta un'intenzione.

---

## 4. Il rischio di dipendenza da un solo integratore

### 4.1 Come si presenta

Il rischio **non è** che esista un integratore importante: è del tutto normale che ne esista uno
prima degli altri, ed è il modo in cui un progetto di questo tipo incontra il mondo reale. Il
rischio è **strutturale** e consiste in una deriva progressiva in cui il prodotto smette di
essere un componente integrabile da molti e diventa un componente di uno, senza che nessuno lo
abbia deciso e senza che compaia in alcun documento.

La deriva ha una forma riconoscibile e si compie in cinque passi, ciascuno dei quali è
localmente ragionevole:

1. Una configurazione ottiene un **valore predefinito** che corrisponde a ciò che serve a un
   solo interlocutore.
2. Una prova di integrazione viene scritta contro **un solo** insieme di ipotesi, e passa.
3. Una scelta di interfaccia viene fatta per **evitare un cambiamento** al sistema di
   controparte, invece che per la sua correttezza.
4. Un termine di dominio dell'interlocutore entra nel **modello** o nella documentazione.
5. La coda delle priorità viene ordinata dalle sue richieste, e le voci che non lo riguardano
   scendono senza che il criterio sia stato applicato.

Al quinto passo il prodotto non è più multi-integratore: lo è ancora nel codice, non più nel
comportamento. E la proprietà perduta non si recupera aggiungendo un secondo integratore: si
recupera **rifacendo** ciò che è stato costruito su ipotesi che valevano per uno solo.

### 4.2 Perché è un rischio di programma e non commerciale

Perché produce effetti misurabili su tempi e perimetro, e sono tre. **Primo**, il perimetro si
deforma: le voci di coda vengono ordinate da una fonte esterna invece che dal criterio, che è il
rischio `R-24` nella sua forma più insidiosa perché appare come attenzione al cliente.
**Secondo**, il costo del secondo integratore esplode: ciò che appariva configurazione si scopre
essere ipotesi, e va estratto e generalizzato dopo che il codice esiste. **Terzo**, la perdita
dell'interlocutore diventa un rischio di continuità del progetto, che è precisamente la
condizione che un prodotto integrabile da molti serve a evitare.

### 4.3 Le contromisure, che sono architetturali e verificabili

Il progetto non affronta questo rischio con una dichiarazione di intenti. Lo affronta con
proprietà del sistema che si verificano automaticamente, e che erano già in vigore prima che il
rischio si presentasse.

| Contromisura | Come si verifica |
|---|---|
| **Multi-tenancy per costruzione**, con l'installazione a tenant unico come caso degenere dello stesso codice | Prove di isolamento che tentano attivamente l'accesso illegittimo, per ogni contesto e ogni interfaccia |
| **Nessuna logica cablata su un interlocutore**: più integratori coesistono sulla stessa installazione, ciascuno con le proprie chiavi, i propri webhook, il proprio branding e i propri limiti di traffico | Configurazione per tenant; assenza di rami condizionali su identità di controparte |
| **Registro di fiducia unico per tenant**, con capacità esplicite per voce | Elenchi operativi **derivati** dalla sorgente, mai redatti a mano; un elenco derivato che diverge è un difetto rilevabile |
| **Lavoro per riferimento** sugli identificativi del sistema di origine, con registro degli identificatori di sistema versionato e configurazione per tenant su che cosa si accetta e che cosa si emette | Nessun identificatore esterno è chiave primaria; normalizzazione al confine, mai nel dominio (`V-142`) |
| **Contratto pubblico dichiarato**, con perimetro chiuso di ciò che è contratto e ciò che è interno (`V-160`) | Prove a contratto in **entrambe le direzioni**; dismissione con dodici mesi di preavviso |
| **Nessuna capacità raggiungibile solo dall'interfaccia** (`V3`, `V-164`) | L'interfaccia del progetto consuma le stesse interfacce applicative offerte agli integratori |

A queste il presente capitolo aggiunge una misura di prova, che è la sola che intercetta la
deriva **prima** del quinto passo, ed è posta come vincolo `V-188`:

> **La suite di prove di integrazione esercita sempre almeno due tenant e due integratori
> distinti, con configurazioni deliberatamente divergenti** — domini di attribuzione degli
> identificatori diversi, profili di uscita diversi, modalità di recapito degli eventi diverse,
> insiemi di moduli sostituiti diversi. Una prova che passa con un solo integratore configurato
> non dimostra la proprietà che si vuole dimostrare.

### 4.4 Indicatore anticipatore, e che cosa resta da decidere

**L'indicatore.** Una proposta di modifica che introduca un valore predefinito, un termine di
dominio o una prova riferibile a un solo interlocutore. È osservabile in revisione, ed è
osservabile **soltanto** in revisione: nessuno strumento lo rileva, perché ogni singola riga è
corretta.

**Che cosa resta da decidere, ed è del committente.** Fino a quale grado di concentrazione la
dipendenza è accettabile, e in quale momento il progetto deve procurarsi una **seconda
controparte di prova** — che può essere un secondo integratore reale, un ente, o
un'implementazione di riferimento costruita apposta. È la questione `Q-187`.

**Una regola redazionale che discende dalla regola `R0` e che vale per tutti.** Nessun documento,
commit, segnalazione, proposta di modifica o materiale pubblico del progetto nomina aziende,
prodotti commerciali, marchi o domini di potenziali partner. Questo rischio, in particolare, si
descrive **strutturalmente** — «un integratore», «la controparte», «il sistema di origine» — e
mai per nome. Non è soltanto una cautela verso una trattativa: è la forma corretta di descrivere
un rischio che riguarda **la classe** degli interlocutori e non uno di essi.

---

## 5. Come si sorveglia il registro

### 5.1 Cadenza e forma della revisione

Il registro si rivede nella **revisione mensile** di [00 §8.1](./00-indice.md), con esito
registrato anche quando l'esito è «nessuna variazione». Per ciascun rischio aperto la revisione
produce quattro informazioni e non una in più:

1. **Lo stato dell'indicatore anticipatore**: osservato o non osservato. Mai «in
   miglioramento».
2. **Le variazioni di probabilità o di impatto**, con la causa. Una variazione senza causa è
   un'impressione.
3. **Lo stato della risposta**: attuata, in attuazione, non attuata. Se non attuata, **perché**.
4. **La durata**, per i rischi con probabilità *Accertato*: da quanti giorni la condizione
   persiste. È l'unico modo per impedire che una condizione accertata diventi normale.

### 5.2 Quando un rischio si chiude, e quando no

Un rischio si chiude **solo** se la condizione che lo produce è stata rimossa, e la rimozione è
verificabile. Non si chiude perché non si è verificato, perché il traguardo che colpiva è
passato, o perché nessuno lo cita più. Un rischio la cui risposta è *accettare* **non è chiuso**:
è accettato, resta in registro, e la sua accettazione è una decisione registrata con un titolare.

### 5.3 Quando un rischio nuovo entra

Un rischio entra quando è formulato con tutti gli elementi di `V-189`: che cos'è, probabilità
secondo la scala del §1.2, impatto sul calendario secondo la scala del §1.3, **indicatore
anticipatore osservabile**, risposta fra le quattro ammesse, titolare nominato. Una segnalazione
priva di indicatore o priva di titolare non è un rischio nuovo: è una preoccupazione, e va
riformulata.

**Gli inneschi di revisione fuori cadenza** sono quelli di [00 §8.2](./00-indice.md), e due
riguardano direttamente questo registro: il verificarsi di un rischio, che obbliga a rivedere il
traguardo colpito, i suoi successori e la risposta pianificata; e il superamento di un punto di
decisione irreversibile senza decisione, che fa decadere lo scenario di riferimento.

---

## 6. Che cosa non è in questo registro

| Materia | Dove vive | Perché non qui |
|---|---|---|
| Rischi per la sicurezza della persona assistita | `docs/08_compliance/05-gestione-del-rischio.md` | Hanno scala, disciplina e verifica di efficacia proprie. Mescolarli farebbe apparire negoziabile un rischio clinico |
| Scenari d'uso pericolosi e ingegneria dell'usabilità | Fascicolo di ingegneria dell'usabilità, in `docs/08_compliance/` | Sono rischi d'uso, non di programma |
| Minacce alla sicurezza informatica del sistema | [`docs/06_security/`](../06_security/00-indice.md) | Hanno un modello di minaccia proprio e prove di abuso proprie |
| Ripartizione delle misure fra fornitore e cliente | [`docs/06_security/09-ripartizione-delle-responsabilita.md`](../06_security/09-ripartizione-delle-responsabilita.md) | È una tabella di responsabilità, non di rischi |
| Esclusioni di perimetro | [`docs/03_functional/07-fuori-perimetro.md`](../03_functional/07-fuori-perimetro.md) | Un'esclusione decisa non è un rischio: è un confine |
| Debito tecnico e debito regolatorio già contratti | [01 §§7–8](./01-principi-e-metodo.md) | Non sono rischi: sono **fatti**, con un elenco che li dichiara |

---

## 7. Bacheca

### 7.1 I vincoli posti da questo capitolo e dal precedente

| # | A | Vincolo |
|---|---|---|
| `V-187` | tutte | Una voce non è **pianificata** se non ha insieme criterio di completamento binario, innesco dichiarato e titolare nominato. In assenza anche di uno solo dei tre è **desiderabile**, e va marcata tale in ogni materiale |
| `V-188` | `TECH`, `INTEG`, `ARCH` | La suite di prove di integrazione esercita **sempre almeno due tenant e due integratori distinti**, con configurazioni deliberatamente divergenti. È la forma verificabile della difesa contro la dipendenza da un solo integratore |
| `V-189` | tutte | Ogni rischio di programma ha un **indicatore anticipatore osservabile** e un **titolare nominato**. Un rischio privo di uno dei due non si sorveglia: va riformulato o chiuso |

### 7.2 Le questioni aperte da questo capitolo

| # | A | Questione |
|---|---|---|
| `Q-187` | → **ORCH** | **Concentrazione ammessa su un solo integratore.** Fino a quale grado la dipendenza è accettabile, e in quale momento il progetto si procura una seconda controparte di prova — secondo integratore reale, ente, o implementazione di riferimento costruita apposta. Senza questa soglia, `V-188` presidia la forma delle prove ma non la deriva delle priorità (`R-10`, `R-24`) |
| `Q-188` | `COMP`, → **ORCH** | **Riserva dichiarata per le voci non stimabili.** La fonte sul percorso di certificazione classifica come non stimabili i cicli di risposta alle non conformità, la rilavorazione dopo la validazione sommativa e il tempo di attesa prima di essere accettati da un organismo, e prescrive di metterli a bilancio **come riserva dichiarata invece che ometterli**. Alcune voci ricadono comunque sul progetto anche senza certificare — sorveglianza dei componenti, finestre di rimedio, valutazione delle modifiche: serve stabilire chi le mette a bilancio e con quale forma (`R-07`, `R-12`, `R-25`) |
| `Q-189` | → **ORCH** | **Continuità dei contributori e registrazioni a ruoli distinti.** Se il progetto resta a contributore unico, alcune registrazioni richieste dal sistema di gestione della qualità — audit interno, riesame del rilascio, verifica eseguita da chi non ha svolto l'attività — **non sono producibili internamente**. Serve stabilire quale sottoinsieme di `R-02` si accetta formalmente e quale si copre acquisendo la funzione all'esterno |

### 7.3 Contributo alla questione `Q-191`, per la parte di quest'area

> *«Consumo di memoria e disco dell'ambiente locale: non misurato. Serve una misura su macchina
> di riferimento dichiarata e la dichiarazione del profilo minimo praticabile.»* — `GUIDA` →
> `TECH`, `ROAD`

**Risposta per la parte di roadmap.** Quest'area **non produce la misura**, che è di `TECH`, e
non sceglie la macchina di riferimento. Dichiara però la collocazione: la misura e la
dichiarazione del **profilo minimo praticabile** sono un criterio della catena di costruzione
(`T-03`) e non un'attività successiva, per una ragione di programma e non di comodità. Finché il
profilo minimo non è dichiarato, la dipendenza «contributori» del §3.2 **non ha una condizione
verificabile**, e il rischio `R-02` non ha un indicatore anticipatore per la componente
«ingresso di un contributore esterno». Un rischio senza indicatore viola `V-189`. **Resta aperta
verso `TECH`** per la misura.

---

**Fine dell'area.** Il percorso di lettura per il committente si chiude qui:
[01 §11](./01-principi-e-metodo.md) sulle ipotesi di capacità, [02 §§2 e 6](./02-traguardi.md)
sui punti di decisione irreversibili, e questo capitolo. Le questioni che richiedono
espressamente una decisione del committente sono `Q-180`, `Q-181`, `Q-182`, `Q-185`, `Q-186`,
`Q-187`, `Q-188` e `Q-189`.

> **Avvertenza permanente.** Nessun rischio di questo registro, per quanto mitigato, e nessun
> traguardo di questa roadmap, per quanto raggiunto, modifica la condizione dichiarata da `D16`,
> `D28`, `D49` e dal vincolo `V-06`: il repository è codice sorgente sotto licenza permissiva,
> **non un dispositivo medico**, il progetto non appone marcatura CE e nessun artefatto
> distribuito è utilizzabile per l'erogazione di prestazioni sanitarie su pazienti reali. Le
> dichiarazioni che lo attestano sono pubblicate in
> [`NOT-A-MEDICAL-DEVICE.md`](https://github.com/fedcal/Telemedic/blob/main/NOT-A-MEDICAL-DEVICE.md)
> e in
> [`DISTRIBUTION-POLICY.md`](https://github.com/fedcal/Telemedic/blob/main/DISTRIBUTION-POLICY.md).
