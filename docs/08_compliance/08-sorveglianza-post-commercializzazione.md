---
title: Sorveglianza post-commercializzazione e vigilanza
sidebar_position: 9
description: "Due processi con logiche opposte: la sorveglianza che rileva e la vigilanza che segnala. Il piano dell'Allegato III tradotto in capacità di prodotto, gli indicatori e le soglie che riaprono il file di rischio, il rapporto periodico di aggiornamento sulla sicurezza e il problema del modello aperto, incidenti gravi e termini, azioni correttive sul campo, il modello a due velocità delle modifiche, chi è titolare degli obblighi quando il software è aperto ora che il progetto intende assumere il ruolo di fabbricante con il soggetto giuridico ancora da costituire, e il raccordo con la risposta agli incidenti di sicurezza, che ha orologi diversi."
---

# Sorveglianza post-commercializzazione e vigilanza

> **Che cosa questo capitolo non contiene.** Non contiene i termini di notifica dei regimi di
> sicurezza informatica e di protezione dei dati: sono in
> [06 §10 - Risposta agli incidenti](../06_security/10-risposta-agli-incidenti.md), con i quattro
> orologi e il quinto, il momento di decorrenza dall'acquisizione dell'evidenza e le capacità che
> il prodotto deve fornire. **Quel capitolo non va riformulato qui.** Il § 9 di questo capitolo vi
> aggiunge la sola prospettiva mancante, che è quella del fabbricante di dispositivo.
>
> **Avvertenza che governa l'intero capitolo, e va letta prima di ogni termine.** **Il prodotto
> non reca marcatura CE**, **non è coperto da alcuna dichiarazione di conformità** e **non è
> utilizzabile per l'erogazione di prestazioni sanitarie su pazienti reali**. **Non esiste alcuna
> distribuzione identificata marcata**, quindi **non esiste alcun sistema di sorveglianza in
> esercizio**: nessun piano dell'Allegato III è istituito, nessun rapporto periodico è stato
> prodotto, nessun canale di segnalazione all'autorità è aperto. È lo stato di fatto da cui il
> capitolo parte, e nessuna riga di ciò che segue lo attenua.
>
> **La titolarità degli obblighi non cambia; cambia chi sarà titolare.** Sorveglianza e vigilanza
> gravano sul **fabbricante della distribuzione identificata marcata CE** - è il vincolo `V-06`, e
> `D58` non lo tocca in questa parte. Ciò che `D58` cambia è che quel ruolo **il progetto intende
> assumerlo**, e **il soggetto giuridico che lo eserciterebbe è ancora da costituire**: gli
> obblighi dei §§ 2–7 non gravano oggi sul progetto perché non esiste né il soggetto né la
> distribuzione marcata, non perché riguardino qualcun altro. Il § 8 dice chi ne è titolare e in
> quale doppia veste il progetto vi si rapporta.
>
> **La conseguenza operativa è la sola ragione per cui questa avvertenza sta in testa.** Da quando
> quegli obblighi saranno nostri, le **capacità di prodotto** che li rendono materialmente
> soddisfacibili - tassonomia stabile degli eventi contati, conservazione della diagnostica pari
> alla finestra di vigilanza, tracciabilità delle versioni installate, indicatori che chiudono su
> righe del registro dei rischi - smettono di essere un servizio reso a un terzo e diventano
> **infrastruttura del nostro percorso**. Vanno perciò **costruite, non soltanto documentate**, e
> vanno costruite prima di servire: nessuna di esse è recuperabile a posteriori, perché contano
> eventi che nel frattempo sono già accaduti o non accaduti (§ 5.2, `V-178`; § 3).
>
> **E il varco che questa avvertenza potrebbe aprire, chiuso qui.** Chi legge che il progetto
> intende assumere il ruolo di fabbricante e ne conclude che esista una sorveglianza a coprirlo
> trae una conclusione **sbagliata**, e in questo capitolo l'errore è particolarmente insidioso
> perché la sorveglianza è precisamente il presidio che si suppone attivo quando non lo è.
> **Nessuno sorveglia le installazioni odierne**: non esiste un canale verso l'autorità, non
> esiste un rapporto periodico, non esiste un obbligo di notifica di sicurezza sul campo che
> qualcuno stia adempiendo. Chi installa, integra o mette in servizio il software oggi assume per
> intero gli obblighi che ne derivano - **e, se costruisce un dispositivo e lo immette sul
> mercato, è il fabbricante di quel dispositivo** (§ 8.1), con gli obblighi dei §§ 2–7 addosso.
> L'intenzione del progetto non gliene toglie nessuno.
>
> **Sui termini che questo capitolo contiene.** Sono **termini normativi del regime di vigilanza**
> - ore e giorni dalla conoscenza di un evento - e obblighi contrattuali verso l'utilizzatore:
> non sono date del progetto e non ne implicano alcuna. Il vincolo `V-171` vieta di affermare o
> lasciare intendere che il prodotto sarà marcato entro un termine, e questa è l'unica occorrenza
> ammessa di quella parola in tal senso. Le date del progetto stanno unicamente in
> [09](./09-percorso-e-calendario.md) e sono pianificazione interna (`D57`).

## 1. Due processi con logiche opposte

Sorveglianza e vigilanza vengono confuse in continuazione, e la confusione produce due
inadempimenti simmetrici: un piano che esiste e non produce dati, e un termine che decorre senza
che nessuno se ne accorga.

|  | **Sorveglianza post-commercializzazione** | **Vigilanza** |
|---|---|---|
| Base | Artt. 83–86 e Allegato III del Regolamento (UE) 2017/745 | Artt. 87–92 |
| Innesco | **Nessuno**: è un processo continuo e proattivo | Un **evento**: incidente grave o azione correttiva di sicurezza sul campo |
| Logica | Raccogliere e analizzare sistematicamente l'esperienza sul campo | Segnalare all'autorità entro termini brevissimi |
| Orizzonte | Continuo, con rapporti periodici | **Ore e giorni** |
| Prodotto | Piano, rapporto periodico, aggiornamento del registro dei rischi e della valutazione clinica | Segnalazione di incidente, rapporto di andamento, notifica di sicurezza, azione correttiva |
| Errore tipico | Il piano esiste e **non produce dati** | Il termine decorre e nessuno se ne accorge, perché manca il momento di acquisizione dell'evidenza |

**Il collegamento fra i due.** La sorveglianza è il processo che **rileva**; la vigilanza è il
processo che **segnala**. Un sistema di sorveglianza che non alimenta la vigilanza produce
inadempimenti; una vigilanza senza sorveglianza a monte reagisce soltanto a ciò che qualcun altro
le porta - cioè arriva sempre dopo, e sempre da un canale che non controlla.

## 2. Il piano di sorveglianza, tradotto in capacità di prodotto

L'**art. 83** impone di istituire, documentare e mantenere un sistema di sorveglianza
**proporzionato alla classe di rischio e al tipo di dispositivo**, come parte del sistema di
gestione della qualità. L'**art. 84** richiede che il sistema si fondi su un **piano** conforme
all'**Allegato III**.

Il contenuto minimo del piano merita una lettura operativa, perché ciascuna voce ha una
conseguenza tecnica che va progettata prima e non dopo.

| Voce del piano | Conseguenza tecnica per questo prodotto |
|---|---|
| Processo di raccolta dei dati | Definire le **fonti**: reclami, segnalazioni degli utilizzatori, registri di assistenza, dati di disponibilità e qualità del servizio, segnalazioni di sicurezza, letteratura, banche dati pubbliche su dispositivi analoghi |
| **Indicatori e valori soglia** per la rivalutazione del rischio | Sono numeri e vanno scelti (§ 3). **Ogni soglia superata riapre il registro dei rischi** |
| Metodi di indagine su reclami ed esperienza sul campo | Procedura di analisi della causa radice, con termine di riscontro dichiarato |
| Metodi e protocolli per gli eventi soggetti a **rapporto di andamento** | § 5 |
| Metodi di comunicazione con utilizzatori e distributori | Canale di avvisi di sicurezza ed **elenco dei destinatari mantenuto aggiornato** |
| Rinvio alle procedure di conformità agli obblighi degli artt. 83–86 | Rimando alle procedure del sistema di gestione della qualità |
| Verifica sistematica delle azioni preventive e correttive | Registro delle azioni **con verifica dell'efficacia**, non della sola esecuzione |
| **Strumenti di tracciabilità** | Identificativo unico, registro delle versioni installate, capacità di sapere **chi ha quale versione** |
| Piano di seguito clinico o motivazione della non applicabilità | Capitolo [07 §7](./07-valutazione-clinica.md) |

**Le due righe in grassetto non si risolvono con una procedura: richiedono una capacità di
prodotto e un obbligo contrattuale.** Le soglie richiedono che i dati esistano e siano
confrontabili fra installazioni e nel tempo; la tracciabilità delle versioni richiede di sapere
quali installazioni esistono e a quale versione si trovano - e in un modello di distribuzione
aperta **quel dato non esiste per costruzione**. È il § 8.2.

## 3. Gli indicatori e le soglie: numeri, non intenzioni

Un piano senza soglie numeriche non è un piano di sorveglianza: è una dichiarazione di intenti che
rende impossibile persino accorgersi che qualcosa sta peggiorando, perché «aumento significativo»
senza una soglia predefinita è un giudizio formulabile solo a posteriori - e a posteriori significa
dopo che l'evento è accaduto.

Le soglie plausibili per questo prodotto derivano direttamente dalle righe del registro dei rischi
del capitolo [05 §6](./05-gestione-del-rischio.md), ed è così che devono derivare: **un indicatore
che non chiude su una riga del registro sorveglia qualcosa che nessuno ha classificato come
rischio**.

| Indicatore | Riga di rischio sorvegliata | Che cosa fa scattare il superamento |
|---|---|---|
| Frequenza di **sessioni interrotte** e di prestazioni non concluse per causa tecnica | `RM-02` | Riesame dei requisiti dell'ambiente operativo dichiarati nelle istruzioni per l'uso |
| Frequenza di **allarmi non riscontrati** nella finestra dichiarata | `RM-13`, `RM-12` | Riesame della copertura oraria dichiarata e della catena di escalation |
| Frequenza di **misure non pervenute** e durata del silenzio | `RM-01` | Riesame delle finestre di attesa e della tassonomia del silenzio |
| **Valore predittivo per regola** e volume di allarmi per operatore | `RM-11` | Riesame delle soglie: l'affaticamento è esso stesso un rischio |
| Frequenza di **errori di associazione** segnalati | `RM-03`, `RM-09` | Riesame del percorso di identificazione e del cambio di soggetto |
| Frequenza di **documenti clinici rimasti in stato non trasmesso** | `RM-08` | Riesame degli stati di trasmissione e delle conferme di presa in carico |

**Due vincoli che l'area tecnica ha già posto e che valgono qui senza attenuazioni.** Nessun
contatore cumulativo grezzo può essere citato come indicatore: perdita, byte, durata dei
congelamenti e ritardo del buffer crescono in modo monotono e vanno differenziati fra campioni
consecutivi (`V-113`). E l'indice sintetico di qualità della sessione è proprietario e va
dichiarato tale (`V-114`): usarlo in un rapporto periodico presentandolo come una misura
riconosciuta sarebbe una dichiarazione infondata ai sensi di `V-171`.

**Una soglia superata non è un allarme operativo: è la riapertura di un file.** La conseguenza
dichiarata deve essere scritta nel piano per ciascun indicatore, e deve essere un'attività con un
responsabile e un termine - non «si valuta».

## 4. Il rapporto periodico di aggiornamento sulla sicurezza

Per la Classe IIa l'**art. 86** richiede un rapporto periodico di aggiornamento sulla sicurezza,
aggiornato **almeno ogni due anni**. Sintetizza i risultati e le conclusioni dell'analisi dei dati
di sorveglianza, la motivazione e la descrizione delle azioni preventive e correttive intraprese,
le conclusioni della determinazione del **rapporto benefici/rischi**, i principali risultati del
**seguito clinico** e il **volume di vendite** con la stima della popolazione che utilizza il
dispositivo e la frequenza d'uso ove praticabile.

`[NV]` - la ripartizione fra i paragrafi dell'art. 86 in funzione della classe, e in particolare
la modalità e il destinatario della trasmissione per la Classe IIa, vanno verificate sul testo
consolidato prima di scrivere la procedura.

### 4.1 Il volume di vendite è un problema strutturale del modello aperto

Un fabbricante che distribuisce a titolo oneroso conosce i propri clienti. Un fabbricante la cui
distribuzione è ottenibile da un repository pubblico **non li conosce**, e non per negligenza: per
costruzione.

Ne discende una conseguenza regolatoria diretta sulla **politica di distribuzione**, e va decisa
presto perché condiziona il modello di rilascio. La distribuzione identificata di `D17` non è una
formalità di tracciabilità: è **la sola condizione a cui il rapporto periodico è compilabile** e a
cui la tracciabilità delle versioni dell'Allegato III è soddisfacibile. Se la distribuzione
certificata fosse ottenibile in modo anonimo, due voci obbligatorie del rapporto resterebbero
vuote e la lacuna non sarebbe sanabile a posteriori.

È la questione `Q-177`, indirizzata al committente, e va tenuta distinta da una scelta di
licenza: **il repository resta pubblico e aperto** (`D51`); ciò che si decide è se la
**distribuzione marcata** - che è un altro artefatto, con un altro nome e un altro ciclo di vita -
sia disponibile solo attraverso un canale che identifica il destinatario.

## 5. La vigilanza: incidenti gravi, termini, e il nesso difficile

L'**art. 87** impone di segnalare alle autorità competenti **qualsiasi incidente grave** relativo
a dispositivi messi a disposizione sul mercato dell'Unione.

| Fattispecie | Termine |
|---|---|
| Incidente grave in genere | **non oltre 15 giorni** dalla conoscenza |
| **Decesso** o **grave deterioramento imprevisto** dello stato di salute | **non oltre 10 giorni** |
| **Minaccia grave per la salute pubblica** | **immediatamente**, e comunque **non oltre 2 giorni** |

`[NV]` - i termini sono verificati; la corrispondenza con i numeri di paragrafo dell'art. 87 va
confermata sul testo consolidato. La definizione di **incidente grave** è nell'art. 2, punto 65:
un incidente che ha direttamente o indirettamente causato, può aver causato o può causare il
decesso di un paziente, di un utilizzatore o di altre persone, il grave deterioramento temporaneo
o permanente del loro stato di salute, o una grave minaccia per la salute pubblica. `[NV]` sul
numero del punto.

**Il punto operativo che determina tutto è quando decorre il termine.** Decorre dalla
**conoscenza** dell'evento e del suo **possibile** nesso con il dispositivo, non dalla certezza
del nesso. Ne discende che non si può attendere l'esito dell'indagine tecnica prima di segnalare:
**la segnalazione iniziale si fa sull'ipotesi**, e si integra dopo. Un processo costruito su
«prima capiamo, poi segnaliamo» produce inadempimenti sistematici, e li produce proprio nei casi
più gravi, che sono quelli in cui l'indagine è più lunga.

### 5.1 Perché per questo prodotto il nesso è particolarmente difficile

Le conseguenze cliniche di questo sistema sono **quasi tutte indirette**: non esiste un'azione
fisica sulla persona, esiste un'informazione che arriva tardi, sbagliata, o che non arriva.
Stabilire che una prestazione mancata, un allarme non riscontrato o un referto non trasmesso
abbiano contribuito a un deterioramento richiede due cose insieme:

1. **ricostruire la sequenza tecnica**, che sta nei registri dell'installazione;
2. **ottenere l'informazione clinica sull'esito**, che sta presso la struttura sanitaria e **non**
   presso il fabbricante.

La procedura di vigilanza deve quindi prevedere un **canale verso l'utilizzatore** per ottenere il
secondo elemento, ed è una previsione **contrattuale prima che tecnica**: nessuna capacità di
prodotto la sostituisce, perché il dato clinico sull'esito non è nel prodotto e non deve esserlo.

### 5.2 Rapporti di andamento e rapporti riassuntivi periodici

Due istituti che si confondono e servono a cose opposte.

- Il **rapporto di andamento** dell'**art. 88** riguarda **incidenti non gravi** ed effetti
  collaterali indesiderati attesi che, presi singolarmente, non sono segnalabili, ma il cui
  **aumento statisticamente significativo** di frequenza o gravità incide sul rapporto
  benefici/rischi. È il motivo per cui il piano deve contenere soglie numeriche (§ 3).
- Il **rapporto riassuntivo periodico** è invece una **modalità alternativa di segnalazione** di
  incidenti gravi simili e ricorrenti, di cui sia stata individuata la causa radice e per i quali
  sia stata attuata un'azione correttiva, o che siano comuni e ben documentati: si concorda con
  l'autorità competente la trasmissione in forma aggregata invece che singola. `[NV]` sul
  paragrafo che lo prevede e sulle condizioni esatte.

**Il primo è una capacità di prodotto, il secondo è un accordo con l'autorità.** Ed è il primo che
impone un requisito al progetto oggi.

> **`V-178`.** Due capacità senza le quali l'obbligo di vigilanza **non è materialmente
> soddisfacibile**, e che vanno costruite prima di servire perché non sono recuperabili a
> posteriori.
>
> **(a) Tassonomia stabile degli eventi contati.** Gli eventi non gravi devono essere **contati in
> modo confrontabile fra installazioni e nel tempo**. Ne discende che la tassonomia degli esiti e
> degli eventi si definisce ora e **non si riscrive a ogni versione**: rinominare o accorpare una
> categoria rende la serie storica incomparabile e fa sparire l'aumento significativo invece di
> rilevarlo. È l'applicazione, sul piano della vigilanza, di ciò che `V-126` già impone sul piano
> del dominio.
>
> **(b) Conservazione dei segnali di diagnostica pari almeno alla finestra di vigilanza.** Se un
> incidente può emergere a distanza di settimane e i registri di diagnostica durano giorni, la
> ricostruzione è impossibile e l'obbligo non è soddisfacibile. **Il termine di conservazione
> della diagnostica è quindi determinato dagli obblighi di vigilanza, non dal fabbisogno
> operativo**, ed è **distinto** dai termini di `V-152` - ventiquattro mesi per i registri di
> tracciabilità, dodici per i dati di accesso e autenticazione - che rispondono ad altra fonte e
> ad altra finalità.

**Determinazione del valore, che è ciò che la questione `Q-116` chiedeva.** Il termine minimo si
ricava per composizione, non per scelta: latenza massima realistica fra evento e segnalazione
dell'utilizzatore, più il termine contrattuale entro cui l'utilizzatore è tenuto a segnalare al
fabbricante, più il tempo di indagine necessario a integrare la segnalazione iniziale. Il progetto
propone **dodici mesi** come valore configurabile predefinito per i segnali di diagnostica
riferibili a una prestazione o a un allarme - non per i registri applicativi generali - e dichiara
che **la determinazione finale è del fabbricante**, perché dipende dal termine contrattuale che
egli impone ai propri utilizzatori. `[NV]` sul valore: è una proposta motivata, non un obbligo
normativo, e nessuna fonte fissa un termine per la diagnostica.

## 6. Azioni correttive di sicurezza sul campo

Un'**azione correttiva di sicurezza sul campo** è l'azione intrapresa dal fabbricante per
prevenire o ridurre il rischio di incidente grave connesso a un dispositivo messo a disposizione
sul mercato; la comunicazione con cui la si porta a conoscenza degli utilizzatori è la **notifica
di sicurezza sul campo**. L'azione va **notificata all'autorità competente**, di norma **prima**
della sua esecuzione salvo urgenza.

**Che cosa è, in concreto, per un software.** È il punto che disorienta chi arriva dallo sviluppo,
perché sembra che ogni correzione lo sia. Non è così, e la distinzione va scritta nella procedura
con criteri, non lasciata al giudizio del momento.

| Situazione | Regime |
|---|---|
| Correzione di un difetto **senza** impatto sulla sicurezza o sulle prestazioni cliniche | Manutenzione ordinaria: gestione delle modifiche e risoluzione dei problemi |
| Correzione di un difetto **con** impatto potenziale sulla sicurezza, distribuita a tutte le installazioni | **Azione correttiva**, con notifica all'autorità e notifica agli utilizzatori |
| Modifica della configurazione consigliata o dei limiti d'uso per ridurre un rischio emerso | **Azione correttiva anche senza rilascio di software** |
| Ritiro di una versione dal canale di distribuzione | **Azione correttiva** |
| Avviso di sicurezza informatica con istruzione di aggiornamento | Valutare **entrambi** i regimi |

**L'ultima riga ha l'orologio più corto e va progettata prima di servire.** Una vulnerabilità
sfruttabile in un componente che partecipa a una misura di controllo del rischio è
**simultaneamente** un evento di sicurezza informatica, con termini in ore, e potenzialmente
un'azione correttiva, con termini in giorni. Il processo deve produrre **una sola valutazione con
due uscite**, non due valutazioni parallele che divergono: due valutazioni della stessa
vulnerabilità che concludono diversamente sono, davanti a un'autorità, una prova di disordine
organizzativo.

**Riscontro parziale alla questione `Q-113`.** L'impegno di aggiornamento dei componenti di terze
parti va espresso **in giorni dalla pubblicazione dell'avviso, differenziato per gravità**, e non
in mesi: un impegno mensile è privo di significato per un componente che riceve quattordici
rilasci in sette mesi. La collocazione formale di quell'impegno è **qui**, nel piano di
sorveglianza, e nel **periodo di supporto dichiarato**, che è la questione `Q-155` e resta al
committente. Ciò che quest'area può fissare senza invadere è la struttura: valutazione avviata
entro il giorno lavorativo successivo alla pubblicazione, decisione motivata registrata anche
quando è di non aggiornare, e finestra di rimedio differenziata per gravità con il valore
dichiarato dal fabbricante e non dal progetto.

## 7. Le modifiche: il modello a due velocità

Il conflitto strutturale fra il ritmo del software e il ritmo regolatorio si concentra qui.
L'**Allegato IX** stabilisce che le modifiche al sistema di gestione della qualità approvato e le
modifiche al dispositivo approvato che possano incidere sulla conformità, sulla sicurezza, sulle
prestazioni o sulle condizioni d'uso richiedono l'**approvazione preventiva** dell'organismo
notificato.

Serve quindi un **processo decisionale documentato**, non un giudizio caso per caso. Per ogni
modifica destinata a una versione certificata si decide, con criteri scritti e verbalizzazione, se
la modifica:

1. **non incide** su sicurezza, prestazioni o condizioni d'uso → si documenta e si rilascia;
2. **incide** ma resta nell'ambito del certificato → si documenta, si aggiorna il fascicolo
   tecnico e la si dichiara all'organismo secondo le modalità concordate;
3. **è sostanziale** → **approvazione preventiva** prima del rilascio.

**Avvertenza sul metodo che circola.** I diagrammi decisionali di **MDCG 2020-3** sulle modifiche
significative sono ampiamente usati anche per i dispositivi certificati sotto il regolamento, ma
il loro **ambito proprio è la disciplina transitoria dei dispositivi preesistenti**: applicarli
per analogia è prassi diffusa e ragionevole, **non è un fondamento normativo**. Vanno presentati
per ciò che sono - metodo adottato dal fabbricante, motivato - e le condizioni concrete vanno
**concordate per iscritto con l'organismo** in sede contrattuale. `[NV]` sull'ambito dichiarato e
sulla revisione corrente del documento.

**Conseguenza sulla politica di rilascio, che condiziona il versionamento e la struttura dei rami
e va progettata ora.**

| | **Repository** | **Distribuzione identificata** |
|---|---|---|
| Ritmo | Il proprio, senza vincoli regolatori | Cadenza più lenta, con valutazione delle modifiche |
| Licenza e dichiarazione | Apache-2.0, con la dichiarazione permanente che **non è un dispositivo** | Artefatto con fabbricante, versione e ciclo di vita propri |
| Stato di configurazione | Cronologia del controllo di versione | **Registro dello stato di configurazione per ogni versione** |
| Correzioni di sicurezza | Al momento | **Fuori cadenza**, senza aprire la procedura di modifica sostanziale - il che richiede che siano, **per costruzione, prive di impatto funzionale** |

L'ultima cella è un requisito di ingegneria, non una policy: una correzione di sicurezza che
cambia comportamento funzionale **non è distribuibile fuori cadenza**, e scoprirlo al momento
dell'urgenza significa dover scegliere fra un inadempimento e un rischio.

## 8. Chi è titolare degli obblighi quando il software è aperto

È la domanda che il modello duale rende inevitabile, e la risposta deve essere scritta in modo che
non resti ambigua per nessuno dei soggetti coinvolti.

**Il titolare degli obblighi di sorveglianza e di vigilanza è il fabbricante della distribuzione
identificata marcata CE.** Non il repository, non il titolare del progetto, non i contributori,
non l'autore di una copia derivata che non immette nulla sul mercato. È il vincolo `V-06`, e i
§§ 2–7 di questo capitolo descrivono obblighi che **oggi non gravano sul progetto**, perché non
esiste né una distribuzione marcata né il soggetto che potrebbe esserne fabbricante.

**Che cosa `D58` cambia in questa frase, e che cosa deliberatamente no.** Non cambia il **criterio
di imputazione**: gli obblighi seguono il ruolo, e il ruolo segue chi immette sul mercato una
distribuzione identificata. Cambia che il progetto **intende** essere uno di quei soggetti - con
il **soggetto giuridico ancora da costituire** - e che quindi **i §§ 2–7 descrivono obblighi che
assumeremo**, non obblighi di terzi che il progetto illustra per cortesia. La differenza non è di
tono: è che ogni riga di quei paragrafi che richiede una capacità di prodotto diventa un
**requisito nostro con una scadenza logica anteriore** al momento in cui l'obbligo scatta, perché
una capacità che conta eventi non si accende retroattivamente.

**Il criterio resta però bidirezionale, e questa è la parte che non va persa.** Chiunque altro
costruisca un dispositivo a partire da questo codice e lo immetta sul mercato è, per ciò stesso,
fabbricante di quel dispositivo, con gli stessi obblighi e senza che la nostra intenzione di
certificare gliene tolga alcuno (§ 8.1). Le due cose convivono: il progetto ha da un lato un
percorso proprio da costruire, dall'altro una posizione di **fornitore a monte** verso chi integra
(§ 8.4), e le due vesti hanno obblighi di natura diversa che non vanno confusi.

Ne discendono cinque conseguenze, tutte da documentare nel materiale per chi integra
([07 §09 - Obblighi di chi integra](../07_integration/09-obblighi-di-chi-integra.md)).

### 8.1 Chi costruisce un dispositivo a partire dal codice **è** il fabbricante di quel dispositivo

Il regolamento attribuisce gli obblighi del fabbricante a chi modifica la destinazione d'uso di un
dispositivo o lo modifica in modo che possa incidere sulla conformità. Nel caso di un codice
sorgente **non marcato**, la questione non è nemmeno di modifica: chi costruisce un dispositivo a
partire da esso e lo immette sul mercato **è il fabbricante originario** di quel dispositivo.

La licenza Apache-2.0 concede il diritto d'uso e di modifica; **non trasferisce né esclude alcun
obbligo regolatorio**, che non è disponibile per contratto. È la stessa struttura del punto 8.4.

### 8.2 Il fabbricante deve sapere che cosa succede nelle installazioni, e con questo modello non lo sa

Va risolto con **tre misure combinate**, e nessuna delle tre da sola è sufficiente:

1. distribuzione della versione certificata attraverso un **canale che identifica il destinatario**
   (§ 4.1, questione `Q-177`);
2. **obbligo contrattuale dell'utilizzatore** di segnalare gli incidenti al fabbricante entro un
   termine compatibile con quelli dell'art. 87 - cioè **inferiore** ad essi, perché il termine del
   fabbricante decorre dalla sua conoscenza e un utilizzatore che segnala al quattordicesimo
   giorno lascia un giorno per valutare, indagare e segnalare;
3. **capacità del prodotto** di produrre l'evidenza tecnica necessaria a ricostruire una sequenza
   a distanza di settimane (`V-178`).

### 8.3 La responsabilità civile non si esclude per contratto verso il danneggiato

Le clausole di esclusione di garanzia e di limitazione della responsabilità della licenza operano
**fra le parti del rapporto di licenza**. La disciplina della responsabilità per danno da prodotti
difettosi vieta l'esclusione contrattuale nei confronti del **danneggiato** e presume la
difettosità in caso di non conformità a requisiti obbligatori di sicurezza dell'Unione
([01 §6](./01-inquadramento-normativo.md)).

**La clausola di licenza non è, e non è mai stata, una tutela verso il danneggiato.** Ciò che
oggi tiene il progetto fuori da quella disciplina è un **fatto**: non esiste una distribuzione
identificata immessa sul mercato sotto il suo nome, e non esiste un soggetto che ne sia
fabbricante. È una distinzione da tenere ferma anche quando è scomoda, perché confidare nella
clausola produce esattamente il comportamento che fa perdere il fatto: pubblicare artefatti che
lasciano intendere un'immissione sul mercato.

**E `D58` va detto qui con particolare chiarezza, perché è il punto in cui conviene di meno
tacerlo.** Quel fatto è **temporaneo per scelta nostra**: il progetto **intende** assumere il
ruolo di fabbricante, e **il soggetto giuridico che lo eserciterebbe è ancora da costituire**.
Quando lo sarà, la disciplina della responsabilità per danno da prodotti difettosi si applicherà
a quel soggetto **per intero**, senza che alcuna clausola della licenza possa escluderla verso il
danneggiato (Direttiva (UE) 2024/2853, art. 15). Ne discendono due conseguenze pratiche, e nessuna
è rinviabile: le decisioni di sicurezza prese **oggi**, su un prodotto che non è ancora un
dispositivo, sono le decisioni di cui quel soggetto risponderà domani; e la copertura assicurativa
del futuro fabbricante è una voce da dimensionare in sede di costituzione, non dopo il primo
incidente. Nel frattempo lo stato di fatto è invariato e va ripetuto: **il prodotto non reca
marcatura CE**, e chi lo installa oggi assume gli obblighi che ne derivano.

### 8.4 Due vesti: fornitore a monte oggi, e il ruolo di fabbricante che il progetto intende assumere con un soggetto ancora da costituire

Il progetto **non segnala incidenti gravi**, oggi, e non perché se ne astenga: non ha una
distribuzione marcata su cui un incidente grave possa essere qualificato come tale, e non ha il
soggetto che potrebbe segnalarlo. Deve però rendere possibile a chi li segnala di rispettare i
propri termini. È il rovescio esatto della nota di posizionamento sui componenti di terze parti:
**il progetto è un componente di terze parti per chi lo integra**, e un componente privo di
sorveglianza dichiarata è un componente che il suo utilizzatore **non può giustificare** nel
proprio inventario ai sensi di IEC 62304.

**La colonna che segue è cambiata di natura, ed è il punto centrale di questo paragrafo.** Fino a
`D58` elencava obblighi del progetto **verso un terzo** che avrebbe certificato: era, in
sostanza, una cortesia motivata. Ora elenca **obblighi che assumiamo**, e li assumiamo due volte -
una come fornitore a monte di chi integra, una come **futuro fabbricante di noi stessi**. La
conseguenza è che nessuna di queste righe è soddisfatta scrivendola: sono **capacità che vanno
costruite**, e la loro assenza si scopre nel momento in cui servono, quando è tardi per
costruirle.

| Obbligo che il progetto assume | Perché esiste, e verso chi |
|---|---|
| Canale di segnalazione funzionante, con destinatario e tempo di riscontro dichiarati | Senza di esso **chi integra** non può rispettare il proprio termine di ventiquattro ore. È la stessa infrastruttura che servirà **a noi** quando il soggetto fabbricante sarà costituito: costruirla due volte non ha senso, costruirla dopo nemmeno |
| **Politica di divulgazione coordinata** con tempi dichiarati | È requisito di **chi integra** prima che obbligo proprio ([06 §10 §2.5](../06_security/10-risposta-agli-incidenti.md)); diventa obbligo proprio con il ruolo di fabbricante, e la politica non si improvvisa alla prima segnalazione |
| **Distinta dei materiali software firmata** per ogni rilascio | È l'ingresso dell'inventario dei componenti di terze parti del fabbricante - **di chi integra oggi, nostro poi** - ed è la seconda delle attività retroattivamente irrecuperabili di `D45` |
| Comunicazione tempestiva delle vulnerabilità nei componenti di terze parti | Il fabbricante non sorveglia i componenti del progetto: **sorveglia il progetto**. La sorveglianza a monte resta un'attività a monte anche quando le due vesti coincidono nello stesso soggetto, e va tenuta distinta nelle registrazioni |
| Artefatti di ciclo di vita pubblicati e identificabili per versione | Senza di essi il fabbricante deve ricostruirli, e ciò che è retroattivamente irrecuperabile **non lo può ricostruire affatto** (`D45`). Con `D58` il fabbricante che si troverebbe a doverlo fare **siamo noi**, il che rende l'omissione un danno diretto e non un'ipotesi |
| **Capacità di prodotto del § 5.2** - tassonomia stabile degli eventi contati e conservazione della diagnostica pari alla finestra di vigilanza (`V-178`) | Riga aggiunta perché con `D58` non è più una fornitura ma un **prerequisito nostro**: sono capacità che **contano eventi**, quindi non si accendono retroattivamente. Non figurano fra le quattro attività irrecuperabili di `D45` e hanno la stessa proprietà - è la questione `Q-276` |

### 8.5 Il caso che nessuna delle misure precedenti copre

Chi prende il codice, lo modifica e lo mette in servizio **senza alcun rapporto con il progetto**
non è raggiungibile da nessuna delle misure del § 8.2, e non lo sarà mai: è la conseguenza
accettata della licenza aperta e non è un difetto da correggere.

Ciò che il progetto può fare è **rendere impossibile l'equivoco**: la dichiarazione permanente che
il repository non è un dispositivo medico, la destinazione d'uso e i limiti d'uso visibili in ogni
momento in cui il repository è accessibile (`D51`), e la politica di distribuzione che tiene i due
artefatti separati per nome, versione e ciclo di vita. Ciò che **non** può fare è impedire a un
terzo di immettere sul mercato un derivato non conforme - e la circostanza che quel terzo diventi
per ciò stesso fabbricante, con tutti gli obblighi che ne discendono, è la sola risposta
disponibile.

**`D58` peggiora questo caso invece di migliorarlo, e va detto.** Un'intenzione di certificare
dichiarata pubblicamente è **materiale rassicurante**: chi prende il codice e lo mette in servizio
può leggerla come una copertura in formazione e concluderne che il rischio sia transitorio. Non lo
è. **Chi installa oggi installa una versione non certificata**, sorvegliata da nessuno, e
l'intenzione del progetto non gli trasferisce alcun obbligo, non gli fornisce alcuna sorveglianza
e non gli attenua alcuna responsabilità. È la ragione per cui la dichiarazione permanente e la
politica di distribuzione **non si alleggeriscono** ora che il percorso è nostro: si irrigidiscono,
perché il malinteso disponibile è aumentato di uno.

Resta aperta la questione simmetrica: **come il progetto viene a sapere** di un incidente occorso
in un'installazione derivata di cui ignora l'esistenza. Non esiste un canale in ingresso, e la
sua assenza non è neutra: un difetto che il progetto non conosce resta nel codice di tutti. È la
questione `Q-178`.

## 9. Il raccordo con la risposta agli incidenti di sicurezza

Il capitolo [06 §10](../06_security/10-risposta-agli-incidenti.md) censisce **cinque regimi** con
termini e destinatari diversi che possono scattare per uno stesso evento tecnico, e stabilisce che
tutti decorrono dall'**acquisizione dell'evidenza**, che è un istante da registrare. **Non va
riformulato qui.** Ciò che va aggiunto è la prospettiva del fabbricante di dispositivo, che quel
capitolo non poteva assumere.

| Regime | Termine più stringente | Chi è obbligato | Innesco |
|---|---|---|---|
| Vigilanza sui dispositivi medici | **2 giorni** | Il **fabbricante** della distribuzione marcata - ruolo che il progetto **intende** assumere, con il soggetto **ancora da costituire** | Conoscenza dell'incidente grave e del **possibile** nesso |
| Resilienza informatica | **24 ore** | Il fabbricante del prodotto con elementi digitali | Vulnerabilità attivamente sfruttata o incidente grave |
| Sicurezza delle reti | Termini brevi dalla conoscenza | Il **soggetto** che eroga il servizio | Incidente significativo |
| Protezione dei dati personali | 72 ore | Il **titolare** del trattamento | Conoscenza della violazione |
| Obblighi contrattuali verso il cliente | **Sotto le 24 ore** | Il fornitore | Rilevazione |

**Tre proprietà di questa tabella vanno comprese insieme, e sono ciò che questo capitolo aggiunge
a quello di sicurezza.**

**Primo: i soggetti obbligati sono diversi, e in un'installazione presso il cliente non
coincidono.** Il fabbricante, il titolare del trattamento, il soggetto obbligato alla sicurezza
delle reti e l'erogatore della prestazione sanitaria possono essere **quattro persone giuridiche
distinte**. Una procedura di risposta che assuma un soggetto unico è inapplicabile, e lo scopre
durante il primo incidente reale.

**Secondo: il termine più corto governa il processo, ma il termine più difficile è quello più
lungo.** Le ventiquattro ore della resilienza informatica sono impegnative sul piano
**organizzativo**: si risolvono con reperibilità e modulistica pronta. I **due giorni** della
vigilanza sono impegnativi sul piano **valutativo**, perché richiedono di stabilire un nesso fra
un evento tecnico e una conseguenza clinica - cioè di rispondere in poche ore alla domanda
«questo evento può aver danneggiato una persona?». La sola struttura, in tutta la documentazione
del progetto, che consenta di rispondere è la tabella delle conseguenze cliniche del modello di
minaccia ([06 §01 §5](../06_security/01-modello-di-minaccia.md)), che a quel punto smette di
essere un esercizio di modellazione e diventa **uno strumento di triage**.

**Terzo: il momento di decorrenza è un fatto documentabile, e va documentato.** Tutti i termini
decorrono dalla conoscenza, e la conoscenza è un evento con data, ora e contenuto: chi ha saputo
che cosa e quando. In assenza di quella registrazione la decorrenza viene ricostruita da chi
contesta, **e sempre a sfavore**. È la ragione per cui la riga di registro che attesta
l'acquisizione dell'evidenza è essa stessa un artefatto di conformità, e non un dettaglio di
osservabilità.

## 10. Che cosa questo capitolo lascia aperto

| Riferimento | Questione | A chi |
|---|---|---|
| `Q-177` | **Se la distribuzione identificata marcata sia disponibile solo attraverso un canale che identifica il destinatario** (§ 4.1). Da questa decisione dipende la compilabilità di due voci obbligatorie del rapporto periodico e la soddisfacibilità della tracciabilità delle versioni. Non tocca l'apertura del repository, che resta invariata | → Committente |
| `Q-178` | **Come il progetto viene a sapere di un incidente occorso in un'installazione derivata di cui ignora l'esistenza** (§ 8.5). Non esiste oggi un canale in ingresso, e la sua assenza non è neutra: un difetto che il progetto non conosce resta nel codice di chiunque lo usi | Sicurezza, → Committente |
| `Q-276` | **Le capacità di prodotto della vigilanza sono retroattivamente irrecuperabili quanto le quattro attività di `D45`, e non figurano in quell'elenco** (§ 5.2, `V-178`; § 8.4, ultima riga). Tassonomia stabile degli eventi contati e conservazione della diagnostica pari alla finestra di vigilanza **contano eventi**: non si accendono a posteriori, e la serie storica mancante non si ricostruisce. Finché l'obbligo era di un terzo la lacuna era un problema suo; con `D58` è **nostra**, e va valutato se le due capacità vadano aggiunte all'elenco delle attività irrecuperabili del capitolo [09 §5](./09-percorso-e-calendario.md) | Tecnica, → **ORCH** |
| `Q-155` | **Periodo di supporto dichiarato**, da cui dipendono le finestre di rimedio del § 6 | → Committente |
| `Q-116` | **Riscontrata** al § 5.2: la conservazione della diagnostica è determinata dagli obblighi di vigilanza, con proposta di dodici mesi configurabili e determinazione finale del fabbricante | Tecnica |
| `Q-113` | **Riscontrata parzialmente** al § 6: struttura dell'impegno fissata, valore rinviato al periodo di supporto dichiarato | Tecnica, roadmap |
| `[NV]` | Ripartizione fra i paragrafi degli artt. 86 e 87 in funzione della classe; numero del punto dell'art. 2 sull'incidente grave; ambito e revisione corrente di MDCG 2020-3 | Conformità |
