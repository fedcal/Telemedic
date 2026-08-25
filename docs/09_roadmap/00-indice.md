---
title: Roadmap — indice e orientamento
sidebar_position: 1
description: Come si legge la roadmap di Telemedic, che cosa in essa è impegno e che cosa è intenzione, lo stato di fatto al 25 agosto 2026, le quattro decisioni che ne hanno determinato la forma e la procedura con cui questo piano viene aggiornato.
---

# Roadmap — indice e orientamento

> **Una roadmap che promette tutto non serve a nessuno.**
> Il valore di questo documento non sta nell'elenco delle cose che si faranno: sta nella precisione
> con cui distingue ciò che è **impegnato** da ciò che è **intenzione**, e nella chiarezza con cui
> dichiara **che cosa resta fuori e perché**. Un piano che non esclude nulla non è un piano: è un
> desiderio con una tabella intorno.

## 1. Che cosa è questa area e che cosa non è

Quest'area risponde a **quando accade che cosa**, e a nient'altro. Non descrive come il sistema è
fatto — quello è [`docs/02_architecture/`](../02_architecture/00-indice.md) — né come è realizzato —
[`docs/01_technical/`](../01_technical/00-indice.md) — né che cosa fa —
[`docs/03_functional/`](../03_functional/00-indice.md). Non contiene requisiti, non contiene decisioni
architetturali, non contiene analisi normativa.

Contiene invece cinque cose che nessun'altra area può contenere senza duplicarsi:

1. **Il metodo con cui si decide che cosa entra e che cosa esce**, dichiarato prima delle decisioni e
   non dopo ([01 — Principi e metodo](./01-principi-e-metodo.md)).
2. **I traguardi datati con criteri di completamento binari**, ciascuno con innesco, titolare,
   dipendenze e rischi ([02 — Traguardi](./02-traguardi.md)).
3. **Il perimetro esatto del primo rilascio installabile**, e — sezione centrale di quest'area —
   **che cosa è stato tagliato per rispettare la data**, con l'indicazione di quali tagli sono
   irreversibili ([03 — Primo rilascio utilizzabile](./03-primo-rilascio-utilizzabile.md)).
4. **La coda di ciò che viene dopo**, distinguendo il pianificato dal desiderabile
   ([04 — Oltre il primo rilascio](./04-oltre-il-primo-rilascio.md)).
5. **Il registro dei rischi di programma** — non clinici: quelli appartengono all'area di conformità —
   con probabilità, impatto sul calendario, indicatore anticipatore, risposta e titolare
   ([05 — Rischi e dipendenze](./05-rischi-e-dipendenze.md)).

## 2. Le tre classi di enunciato, e perché la distinzione è vincolante

Ogni voce di questa roadmap appartiene a una delle tre classi seguenti. La classe **non è una sfumatura
di linguaggio**: determina che cosa il progetto può dichiarare a un integratore, in una risposta a una
gara, in una nota di rilascio o in una pagina pubblica.

| Classe | Marcatore | Significato | Che cosa autorizza a dire |
|---|---|---|---|
| **Impegno** | `[IMPEGNO]` | Il progetto si assume la voce, ne ha il controllo, e la voce ha un criterio di completamento verificabile | «Il progetto consegna X, e X è fatto quando vale il criterio Y» |
| **Intenzione** | `[INTENZIONE]` | Il progetto intende farlo, l'ordine di priorità è motivato, ma la data dipende da una variabile non ancora determinata | «È pianificato, in questa posizione della coda, e la data dipende da Z» |
| **Ipotesi** | `[IPOTESI]` | Enunciato condizionato a un evento che il progetto non controlla | «Se accade Z, allora X; oggi Z non è accaduto» |

A queste tre si aggiunge una quarta categoria, che non è una classe di enunciato ma una **esclusione di
perimetro**: ciò che il progetto ha deciso di non fare. Le esclusioni definitive non vivono qui: vivono
in [`docs/03_functional/07-fuori-perimetro.md`](../03_functional/07-fuori-perimetro.md) con
identificativo `OUT-nn` e categoria di riapribilità. Quest'area vi rinvia e non le riscrive, perché
un'esclusione scritta in due posti diverge in due posti diversi.

**Regola redazionale che ne discende, e che vale oltre quest'area** (vincolo `V-184`): nessun materiale
del progetto — documentazione, sito, risposta a gara, nota di rilascio, comunicazione pubblica — può
presentare una voce `[INTENZIONE]` o `[IPOTESI]` come se fosse `[IMPEGNO]`. È la forma più comune di
danno reputazionale in un progetto tecnico, e si commette in buona fede.

## 3. Chi si impegna, e che cosa `D57` e `D58` hanno cambiato

### 3.1 La roadmap è pianificazione interna

`D57` stabilisce che **il titolare della pianificazione è il progetto**. Nessun traguardo di quest'area
è attribuito a «terzi», a «chi certifica» o a un soggetto indefinito. `D58` aggiunge che **il ruolo di
fabbricante sarà assunto dal progetto** e che il soggetto giuridico **va costituito**: è un prerequisito
interno con un proprio tempo, ed è a calendario come traguardo `T-14`.

Le due decisioni hanno cambiato **l'attribuzione della pianificazione**. Non hanno cambiato nulla dello
stato di fatto del prodotto, e la tabella seguente esiste perché le due cose non si confondano mai.

| Che cosa è vero oggi, e resta vero | Che cosa `D57` e `D58` cambiano |
|---|---|
| **Il prodotto non reca marcatura CE** e non è coperto da alcuna dichiarazione di conformità | Nulla |
| **Nessun artefatto distribuito è utilizzabile per l'erogazione di prestazioni sanitarie su pazienti reali** (`D16`) | Nulla |
| **Chi installa, integra o mette in servizio assume gli obblighi che ne derivano** | Nulla. L'intenzione di certificare in futuro **non trasferisce alcun obbligo e non copre alcuna installazione presente** |
| **La responsabilità verso il danneggiato non è escludibile per contratto** | Vale con più forza, non con meno |
| Il percorso di conformità era attribuito a un soggetto esterno indefinito | È **nostro**, con date di **pianificazione interna** in [02 §5](./02-traguardi.md) |

> **Il limite invalicabile, posto come vincolo `V-280`.** Una data di pianificazione interna **non è una
> promessa di esito**. **In nessun luogo di quest'area, e in nessun materiale del progetto, si scrive che
> il prodotto sarà marcato entro una data** (`V-171`). L'intenzione di certificare e la promessa di un
> esito datato sono cose diverse, e la seconda produce un effetto regolatorio che la prima non produce.

### 3.2 Che cosa resta di un altro soggetto

`V-280` riformula `V-180` e ne conserva il nucleo: restano non dichiarabili le date che **la norma pone
in capo a un soggetto diverso**. Sono due, e sono le sole:

- **Il termine entro cui un utilizzatore deve aver adottato le misure nazionali di sicurezza**, che è
  soggettivo e decorre dalla comunicazione di inserimento ricevuta dal singolo soggetto (`D39`). Il
  prodotto dichiara **le evidenze e la data di disponibilità di ciascuna**, mai il termine (`V-186`).
- **L'accreditamento come fornitore di servizi** verso la federazione nazionale delle identità, che è di
  chi installa (`D36`, `V-05`, `OUT-22`) e i cui tempi **non sono dichiarati da alcuna fonte primaria**.

La ripartizione riga per riga delle misure di sicurezza è in
[`docs/06_security/09-ripartizione-delle-responsabilita.md`](../06_security/09-ripartizione-delle-responsabilita.md);
quest'area ne applica la logica al **tempo**, e la applica riga per riga in
[03 §11](./03-primo-rilascio-utilizzabile.md).

## 4. Lo stato di fatto al 25 agosto 2026

Un piano che non parta da una fotografia verificabile della situazione è un esercizio di retorica.
Questa è la fotografia, e ogni riga è verificabile aprendo il repository.

| Ambito | Stato accertato al 25 agosto 2026 |
|---|---|
| **Dichiarazioni pubbliche obbligatorie** (`D51`) | **Presenti**: dichiarazione di non dispositivo medico, politica di distribuzione, licenza, avviso, guida ai contributi, governance, politica di sicurezza, codice di condotta. **Da riallineare a `D58`** senza attenuare alcuna avvertenza: è il criterio 8 di `T-01` |
| **Guida dei fondamenti** (`D35`, ventuno moduli) | **Diciannove moduli presenti** (`00`–`18`). Mancano il **glossario** e le **fonti primarie** |
| **Area tecnica** | **Completa** |
| **Area architetturale** | **Completa** |
| **Area funzionale** | **Completa** |
| **Area protocolli** | **Completa** |
| **Area dominio** | **Completa** |
| **Area sicurezza** | **Completa** |
| **Area integrazione** | **Completa** |
| **Panoramica** (`docs/00_overview/`) | **Scritta** |
| **Conformità** (`docs/08_compliance/`) | **Scritta**: dieci file. Resta l'area verso cui converge il maggior numero di questioni pendenti, e `D58` vi aggiunge la riscrittura dei capitoli costruiti sulla figura del terzo |
| **Roadmap** (`docs/09_roadmap/`) | Quest'area, **rilavorata** dopo `D53`…`D58` |
| **Registro delle decisioni architetturali** | **Trenta voci** più indice |
| **Sito di documentazione** (`D7`, `D52`) | **Costruito e pubblicato** su GitHub Pages, in italiano e in inglese |
| **Versione inglese dei contenuti** (`D3`, `D50`) | **Solo l'involucro del sito.** Tradotte le stringhe di interfaccia; i documenti sono ancora tutti in italiano. `D56` fissa la modalità: **assistita, area per area, con controllo di divergenza** |
| **Flussi di verifica automatica** | **Presenti**: terminologie sotto licenza, conformità redazionale, ricerca di segreti, distinta dei materiali del sito |
| **Codice applicativo** | **Assente.** Nessun file sorgente del servizio o dell'interfaccia |
| **Catena di costruzione per il codice** | **Assente**, perché il codice non esiste. È il traguardo `T-03`, e `V-182` impone che preceda la prima riga |

Tre letture di questa tabella, e sono quelle che determinano tutto il resto della roadmap.

**La prima.** Il progetto ha, al 25 agosto 2026, **un corpo documentale sostanzialmente completo, un
sito pubblicato, quattro flussi di verifica in esercizio — e nessuna riga di software applicativo.** La
distanza fra ciò che è documentato e ciò che è costruito è la grandezza da cui il piano parte.

**La seconda.** Il volume del corpus è dell'**ordine delle centinaia di migliaia di parole**. `[NV]` —
il conteggio esatto non è stato eseguito, e i valori dichiarati nei registri di area sono stime da
densità di riga. **Il conteggio esatto è esso stesso un'attività a piano** (criterio 5 di `T-02`),
perché è il moltiplicatore dell'obbligo di traduzione integrale imposto da `D50`.

**La terza, ed è quella che ha rifatto quest'area.** Con `D53` la data del **30 novembre 2026** resta il
**primo rilascio installabile**, e con `D54` la capacità è **un contributore unico a tempo parziale**.
Data e capacità sono fissate: **l'unica variabile libera è l'ambito**. Il §5 dice dove questa
conseguenza è scritta.

## 5. Le quattro decisioni che hanno determinato questa revisione

| # | Decisione | Che cosa ha cambiato in quest'area |
|---|---|---|
| **`D53`** | Il **30 novembre 2026 resta il primo rilascio installabile**. Chiude `Q-180` | Il traguardo `T-10` è datato e `[IMPEGNO]`; il perimetro di [03](./03-primo-rilascio-utilizzabile.md) è **ridotto**, e il §5 di quel capitolo dichiara che cosa è uscito |
| **`D54`** | Capacità: **contributore unico, a tempo parziale**. Chiude `Q-181` | Le ipotesi `H1`/`H2`/`H3` sono decadute; il rischio `R-01` è **chiuso** e sostituito da `R-28`; quattro tagli sono **irreversibili** perché richiedono soggetti distinti |
| **`D55`** | Destinazione d'uso del telemonitoraggio congelata sulla **raccolta differita**. Chiude `Q-144` | Il telemonitoraggio non è più lavoro a rischio di riscrittura; resta fuori da `RU-1` per ampiezza. Ne discende un **divieto permanente**: nessuna funzione può spostare il sistema verso il tempo reale clinico |
| **`D56`** | Traduzione **assistita, area per area**, con controllo di divergenza. **Emenda `D52`**. Chiude `Q-182` | La traduzione integrale non è più prerequisito di ogni riga di codice: `T-06` copre le sole aree prerequisito, il resto è `T-09`. Il rischio `R-03` scende da `I4` a `I3` |

A queste si aggiungono, nella stessa tornata, `D57` — la pianificazione è interna — e `D58` — il ruolo
di fabbricante sarà assunto dal progetto, con il soggetto da costituire. Il loro effetto è al §3.

**Le decisioni sono prese e quest'area non le rilitiga.** Ne espone le conseguenze, che è cosa diversa e
più utile.

## 6. I sei documenti

| # | Documento | Che cosa risolve | Chi lo deve leggere |
|---|---|---|---|
| 00 | Questo | Orientamento, classi di enunciato, stato di fatto, decisioni, procedura di aggiornamento | Chiunque, prima di tutto il resto |
| 01 | [Principi e metodo](./01-principi-e-metodo.md) | Come si decide che cosa entra: criteri di priorità in ordine lessicografico, attività retroattivamente irrecuperabili, **ciò che una persona sola non può fare**, debito tecnico e **debito regolatorio**, la capacità dichiarata | Chi propone una funzione, chi contesta una priorità, chi deve dire di no |
| 02 | [Traguardi](./02-traguardi.md) | I traguardi datati fino al 30 novembre 2026 con criteri binari, innesco e titolare; la pianificazione interna oltre la data; i punti di decisione irreversibili | Committente, contributori, chi valuta l'avanzamento |
| 03 | [Primo rilascio utilizzabile](./03-primo-rilascio-utilizzabile.md) | Che cosa contiene il primo rilascio, **che cosa è stato tagliato per rispettare la data e quali tagli sono irreversibili**, l'ordine in cui si taglierebbe ancora, i presupposti, i limiti, i criteri bloccanti | Chi installa, chi integra, chi valuta il prodotto |
| 04 | [Oltre il primo rilascio](./04-oltre-il-primo-rilascio.md) | Che cosa viene dopo, in ordine di priorità motivata, distinguendo pianificato e desiderabile | Integratori, committente, chi pianifica un'adozione pluriennale |
| 05 | [Rischi e dipendenze](./05-rischi-e-dipendenze.md) | Registro dei rischi di programma con indicatore anticipatore e titolare; le dipendenze esterne, compresa quella che non ha modalità degradata | Committente, chi conduce la revisione |

## 7. Percorsi di lettura

**Se sei il committente e devi decidere.** [01 §11](./01-principi-e-metodo.md) sulla capacità dichiarata
e §9-bis su ciò che una persona sola non può fare, poi
[03 §5.3](./03-primo-rilascio-utilizzabile.md) sui quattro tagli irreversibili, poi
[02 §6](./02-traguardi.md) sui punti di decisione, poi [05 §2.1](./05-rischi-e-dipendenze.md) su `R-28`
e `R-29`. Le questioni che richiedono espressamente una tua decisione sono `Q-185`, `Q-186`, `Q-187`,
`Q-188`, `Q-189`, `Q-280` e `Q-281`, elencate al §10. **Le due più urgenti sono `Q-280`, al 19 settembre
2026, e `Q-189`, al 30 settembre 2026**: la prima perché è di classe `B` e il ritardo non si recupera
lavorando di più; la seconda perché il suo esito predefinito è una lacuna che resta datata per sempre.

**Se devi contribuire al codice.** [01](./01-principi-e-metodo.md) per intero — in particolare i §§ 5 e
8, che spiegano perché alcune attività apparentemente burocratiche precedono la prima riga di software —
poi [02 §3](./02-traguardi.md) e [03 §8](./03-primo-rilascio-utilizzabile.md), che contiene i criteri
bloccanti di rilascio. Poi [03 §6](./03-primo-rilascio-utilizzabile.md): l'ordine di sacrificio è ciò
che si esegue quando il calendario non tiene, e va conosciuto prima di trovarsi a doverlo eseguire.

**Se devi decidere se adottare il prodotto.** [03 §1](./03-primo-rilascio-utilizzabile.md) sul limite che
nessuna configurazione rimuove, poi **[03 §5](./03-primo-rilascio-utilizzabile.md) per intero**, poi
[03 §7](./03-primo-rilascio-utilizzabile.md) sui presupposti e [03 §9](./03-primo-rilascio-utilizzabile.md)
sui limiti dichiarati, poi [04 §§1–3](./04-oltre-il-primo-rilascio.md). **Il §5 non è un'appendice: è la
parte che ti dice che cosa il prodotto non potrà mai dimostrare del proprio primo periodo**, ed è
l'informazione che nessun elenco di funzioni contiene.

**Se devi rispondere a un capitolato o valutare un'offerta.** [00 §§2–3](./00-indice.md) di questo
documento, per non attribuire al fornitore impegni che non ha assunto, poi
[03 §11](./03-primo-rilascio-utilizzabile.md) e la ripartizione delle responsabilità in
[`docs/06_security/09-ripartizione-delle-responsabilita.md`](../06_security/09-ripartizione-delle-responsabilita.md).
**Attenzione alla riga sulla marcatura**: che il progetto intenda assumere il ruolo di fabbricante non
autorizza nessuna affermazione su un esito datato.

## 8. Come si aggiorna questa roadmap

Una roadmap che non ha una procedura di aggiornamento diventa, in poche settimane, un documento che tutti
citano e nessuno crede.

### 8.1 Cadenza ordinaria, e la cadenza straordinaria che `D53` impone

**Revisione mensile**, con esito registrato anche quando l'esito è «nessuna variazione». La revisione
produce, per ciascun traguardo aperto: stato dei criteri di completamento (soddisfatto / non soddisfatto,
mai una percentuale), variazioni delle dipendenze, variazioni del registro dei rischi, e — se qualcosa non
tiene — **la causa**, non solo la conseguenza.

**Dal 19 ottobre 2026 la revisione è settimanale**, con contenuto ridotto a due numeri: **righe residue
dell'ordine di sacrificio** di [03 §6.2](./03-primo-rilascio-utilizzabile.md) e **criteri bloccanti di
`RU-1` soddisfatti**. È la contromisura del rischio `R-28`: su un piano senza margine di tempo, una
revisione mensile osserva il fenomeno quando è finito.

### 8.2 Revisioni fuori cadenza

Sono obbligatorie, non facoltative, e ciascuna ha un innesco preciso.

| Innesco | Che cosa si rivede |
|---|---|
| Chiusura o riapertura di una decisione del committente | L'intera roadmap, perché le decisioni sono la sua base |
| **Consumo di una riga dell'ordine di sacrificio** | `R-28`, il traguardo colpito e il perimetro dichiarato di `RU-1`. **La riga consumata si registra con la data e la causa**: una riduzione non registrata è un taglio non deciso |
| Un rischio del registro che si materializza | Il traguardo colpito, i suoi successori, e la risposta pianificata |
| Variazione della capacità dichiarata (`D54`) | Tutte le date interne e l'ambito, con la regola di [01 §10](./01-principi-e-metodo.md) |
| **Ingresso di un contributore continuativo** | La capacità, e insieme i rischi `R-02` e `R-29`: un secondo contributore è insieme continuità e secondo soggetto |
| Modifica della destinazione d'uso (`D46`, `D55`) | Il perimetro del primo rilascio e tutte le esclusioni collegate |
| Pubblicazione di una versione nuova di una specifica fissata | La voce corrispondente e la sua collocazione fra i traguardi |
| Superamento di un punto di decisione irreversibile senza decisione | Lo scenario di riferimento, che decade automaticamente |

### 8.3 Che cosa non si fa mai

- **Non si sposta una data senza spostare il criterio o la causa.** Con `D53` e `D54` la data non si
  sposta affatto: si riduce l'ambito, oppure **si dichiara che la data è mancata** (`V-282`).
- **Non si riduce l'ambito senza registrarlo.** Una riduzione silenziosa fa perdere alla scelta la sola
  proprietà che `D53` obbliga a garantirle: essere leggibile.
- **Non si aggiunge un traguardo senza criterio di completamento.** È il vincolo `V-181`.
- **Non si pianifica un'attività che richiede due soggetti quando il secondo non esiste.** È il vincolo
  `V-281`: si dichiara come lacuna, con la data in cui nasce.
- **Non si dichiara «completato al novanta per cento».** Il criterio è binario per costruzione. Un
  traguardo con dieci criteri e nove soddisfatti è un traguardo non raggiunto, e il rapporto dice quale
  criterio manca.
- **Non si riscrive la storia.** Una data mancata resta nella cronologia con la sua causa: è l'unica base
  su cui la stima successiva può essere migliore della precedente.

## 9. Bacheca: che cosa quest'area ha chiuso

### 9.1 Le questioni chiuse dalla terza tornata di decisioni

| # | Chiusa da | Esito |
|---|---|---|
| `Q-180` | **`D53`** | Il 30 novembre 2026 resta il **primo rilascio installabile**. Ne discende l'obbligo di ridurre l'ambito e di dichiarare i tagli: [03 §5](./03-primo-rilascio-utilizzabile.md) |
| `Q-181` | **`D54`** | Capacità: **contributore unico, a tempo parziale**. Resta aperta la ripartizione di `Q-189` |
| `Q-182` | **`D56`** | Traduzione **assistita area per area** con controllo di divergenza; la traduzione integrale non è più prerequisito del codice |
| `Q-144` | **`D55`** | Destinazione d'uso del telemonitoraggio congelata sulla **raccolta differita**; classe IIa e classe di sicurezza software B confermate |

**Non si riaprono.** Le conseguenze sono recepite nei cinque capitoli che seguono; le decisioni non
vengono ridiscusse in nessuno di essi.

### 9.2 La questione `Q-09`, risolta

> *«Il termine di adeguamento alle misure di sicurezza è soggettivo per ciascun cliente: la roadmap non
> può cablare una data unica. Come si parametrizza.»* — `ORCH` → `ROAD`

**Risposta.** Non si parametrizza una data: si **smette di dichiarare date** e si dichiara la
**disponibilità delle evidenze**.

**Primo — il prodotto dichiara evidenze, non conformità.** Per ciascuna delle evidenze elencate in
[`docs/06_security/09-ripartizione-delle-responsabilita.md`](../06_security/09-ripartizione-delle-responsabilita.md) §12
la roadmap dichiara **a partire da quale rilascio l'evidenza è disponibile**. È un fatto del prodotto, non
del cliente, ed è databile.

**Secondo — il termine del cliente è un dato di configurazione, non del piano.** La data entro cui un
utilizzatore deve aver adottato le misure discende dalla comunicazione di inserimento **che ha ricevuto
lui**. Il prodotto non la conosce e non deve conoscerla. Ciò che deve fare — ed è un requisito, non una
nota — è **non impedire** al cliente di rispettarla.

**Terzo — il momento in cui il prodotto incontra il mercato non è il termine, è il contratto.** I
requisiti di sicurezza entrano nei contratti **nuovi, rinnovati o prorogati**: ne discende che
**l'evidenza deve essere disponibile al momento della trattativa, non al momento del termine**, e la
trattativa precede il termine di mesi.

Formulazione ammessa, che sostituisce ogni data: *«a partire dal rilascio N, il progetto consegna con ogni
artefatto il fascicolo di conformità che comprende le evidenze E1…En; il termine entro cui il soggetto
obbligato deve aver adottato le misure è determinato dalla comunicazione di inserimento da lui ricevuta e
non è determinabile dal fornitore».*

Posta come vincolo **`V-186`**.

### 9.3 La questione `Q-113`, evasa per la parte di quest'area

> *«Livello di servizio di aggiornamento dei componenti di terze parti, espresso in giorni dalla
> pubblicazione dell'avviso e differenziato per gravità.»* — `TECH` → `COMP`, `ROAD`

Quest'area **conferma la forma** e **non fissa i numeri**, che appartengono al piano di sorveglianza
post-commercializzazione. Ciò che la roadmap stabilisce, e che pone come vincolo **`V-185`**, è che **un
impegno espresso in mesi non è pianificabile e non viene accettato**: con la cadenza di rilascio osservata
sul nodo di relay — quattordici rilasci in poco più di sette mesi, cinque nel solo mese di agosto 2026 —
un impegno mensile è già scaduto quando viene pubblicato. Il livello di servizio si esprime in **giorni
dalla pubblicazione dell'avviso, differenziato per gravità**, si misura e si pubblica misurato. La
roadmap aggiunge una conseguenza di pianificazione: **la capacità necessaria a onorare quel livello di
servizio è capacità ricorrente**, e va sottratta prima di calcolare qualunque data — **sotto `D54` da una
capacità che è una persona a tempo parziale**. La quantificazione è in
[05 §2.1](./05-rischi-e-dipendenze.md), rischio `R-12`. **Resta aperta verso `COMP`** per l'impegno
formale.

### 9.4 Le questioni `Q-152` e `B-6`, con la parte di quest'area dichiarata

Quest'area **non propone valori**: non ne ha la competenza. Dichiara però tre cose che le competono.

**Quando serve.** La soglia deve esistere **prima del primo esercizio con un tenant reale**, non prima del
primo rilascio: la tipologia di incidente che vi dipende poggia su un numero che **il cliente sceglie**.
Ciò che deve esistere al primo rilascio è la **capacità di misura**, non il valore.

**Che cosa la roadmap chiede in cambio.** Che la capacità di misura sia trattata come requisito del primo
rilascio e non come attività di esercizio, perché aggiungerla dopo significa non avere serie storiche nel
momento in cui servono. **È stata deliberatamente esclusa dai tagli** ed è in
[03 §3.1](./03-primo-rilascio-utilizzabile.md).

**Che cosa resta a `SEC` e ad `ARCH`.** I valori di riferimento e la loro distinzione dagli accordi
contrattuali. Aperta come `Q-184`.

### 9.5 I vincoli posti da quest'area

| # | A | Vincolo |
|---|---|---|
| `V-180` | tutte | **Riformulato da `V-280`.** Nella forma originaria vietava di dichiarare date per traguardi non del progetto; con `D57` e `D58` la pianificazione è interna e il divieto si restringe alle date che la norma pone in capo a un soggetto diverso |
| `V-181` | tutte | Ogni traguardo ha un criterio di completamento binario. Una percentuale di avanzamento non è un criterio |
| `V-182` | `TECH`, `COMP` | Nessuna riga di codice applicativo precede la catena di costruzione che genera la distinta dei materiali e il registro degli identificativi di requisito |
| `V-183` | tutte | **Emendato da `D56`.** Il rilascio del corpo documentale è per area completa; l'obbligo delle **due lingue** resta per le aree prerequisito — avvertenze pubbliche, guida dei fondamenti, conformità, sicurezza — e per il resto vale il regime di segnalazione misurata |
| `V-184` | `PROD`, `COMP`, `INTEG` | Nessun materiale può presentare una voce `[INTENZIONE]` o `[IPOTESI]` come `[IMPEGNO]` |
| `V-185` | `TECH`, `SEC`, `COMP` | Il livello di servizio di aggiornamento si esprime in giorni dalla pubblicazione dell'avviso, per gravità, e si misura |
| `V-186` | tutte | La conformità alle misure nazionali di sicurezza **non ha una data di prodotto**: il prodotto dichiara le evidenze e la data di disponibilità di ciascuna |
| `V-187` | tutte | **Pianificato contro desiderabile**: senza criterio binario, innesco e titolare la voce è desiderabile e va marcata tale |
| `V-188` | `TECH`, `INTEG`, `ARCH` | La suite di prove di integrazione esercita **sempre almeno due tenant e due integratori distinti**, con configurazioni divergenti |
| `V-189` | tutte | Ogni rischio ha **indicatore anticipatore osservabile** e **titolare nominato** |
| `V-280` | tutte | La roadmap è **pianificazione interna del progetto** (`D57`, `D58`). **Una data di pianificazione interna non è una promessa di esito**: nessun materiale scrive che il prodotto sarà marcato entro una data (`V-171`) |
| `V-281` | tutte, in particolare `COMP` | **Nessun traguardo entra nel piano se richiede due soggetti distinti e il secondo non esiste.** Si dichiara come lacuna con la data in cui nasce |
| `V-282` | tutte | **L'ambito è l'unica variabile libera.** Ogni scostamento si assorbe riducendo l'ambito secondo l'ordine di sacrificio dichiarato, che contiene **soltanto tagli reversibili**; se l'ordine si esaurisce, la data si dichiara mancata |

## 10. Le questioni aperte da quest'area

| # | A | Questione | Punto di decisione |
|---|---|---|---|
| `Q-183` | `COMP` | Evidenze del pacchetto regolatorio consegnabili, e che cosa il fascicolo del nostro percorso conterrà | — |
| `Q-184` | `SEC`, `ARCH` | Capacità di misura come requisito del primo rilascio; valori prima del primo esercizio | Prima dell'esercizio |
| `Q-185` | `PROD`, → **ORCH** | Materiale pubblico non allineato a `D19` e `D29`; impatto **irrecuperabile** | 31 ottobre 2026 |
| `Q-186` | `COMP`, `TECH` | **Periodo di supporto dichiarato**; prerequisito della prima distribuzione e criterio bloccante | 15 ottobre 2026 |
| `Q-187` | → **ORCH** | Concentrazione ammessa su un solo integratore e momento della seconda controparte di prova | Prima del secondo integratore |
| `Q-188` | `COMP`, → **ORCH** | Riserva dichiarata per le voci non stimabili; con `D58` i cicli di non conformità sono lavoro nostro | — |
| `Q-189` | → **ORCH** | **Ripartizione delle registrazioni a ruoli distinti**: che cosa si accetta come lacuna e che cosa si acquisisce all'esterno | **30 settembre 2026** |
| `Q-280` | → **ORCH** | **Costituzione del soggetto fabbricante** (`D58`) e persona responsabile del rispetto della normativa. Classe `B`: poche ore e molti mesi | **19 settembre 2026** |
| `Q-281` | `PROD`, → **ORCH** | La differenza fra ciò che il materiale pubblico dichiara e ciò che `RU-1` consegna, e la formulazione con cui si dichiara | 31 ottobre 2026 |
| `Q-282` | `COMP` | Forma della dichiarazione delle **lacune datate** nel fascicolo, per le registrazioni non ricostruibili a posteriori | Prima di `T-10` |

## 11. Convenzioni di quest'area

- **`[NV]`** marca un'affermazione non verificata, con l'indicazione di chi deve chiuderla. Nessun `[NV]`
  sopravvive al traguardo che ne dipende.
- **Le date** sono espresse per esteso e riferite alla fine della giornata indicata. **Non sono stime**:
  sono allocazioni del calendario residuo a una sequenza vincolata, sotto la capacità di `D54`
  ([01 §4.1](./01-principi-e-metodo.md)).
- **Nessuna stima inventata.** Dove un tempo non è stimabile con le informazioni disponibili, il documento
  lo dichiara e spiega da che cosa dipende. È preferibile una lacuna dichiarata a una cifra che qualcuno
  citerà come propria.
- **Le sigle `T-nn`, `RU-n`, `OL-nn`, `DS-nn`, `TG-nn`, `R-nn` e `S-n`** sono **designazioni di
  pianificazione**: non appartengono agli intervalli congelati da `V-120`, non entrano nella matrice di
  tracciabilità e non possono comparire in una prova.
- **Solo dati sintetici**, nessun dato reale, nessun segreto.
- **Regola `R0`.** Nessun nome di azienda, marchio, prodotto commerciale o dominio di potenziale partner
  compare in quest'area. Si usano soltanto formule generiche: «un gestionale sanitario cloud», «un sistema
  EHR di terze parti», «l'integratore».

> **Avvertenza permanente.** Il repository è codice sorgente sotto licenza permissiva, **non un
> dispositivo medico immesso sul mercato**. **Oggi il prodotto non reca marcatura CE**, non è coperto da
> alcuna dichiarazione di conformità, e **nessun artefatto distribuito è utilizzabile per l'erogazione di
> prestazioni sanitarie su pazienti reali** (`D16`). Che il progetto intenda assumere il ruolo di
> fabbricante (`D58`), con il soggetto ancora da costituire, è **pianificazione interna**: non è una data
> di marcatura (`V-171`, `V-280`), non copre alcuna installazione presente e **non toglie alcun obbligo a
> chi installa, integra o mette in servizio il software**. Nessun traguardo di questa roadmap, per quanto
> raggiunto, modifica questa condizione. Le dichiarazioni che la attestano sono pubblicate in
> [`NOT-A-MEDICAL-DEVICE.md`](https://github.com/fedcal/Telemedic/blob/main/NOT-A-MEDICAL-DEVICE.md) e in
> [`DISTRIBUTION-POLICY.md`](https://github.com/fedcal/Telemedic/blob/main/DISTRIBUTION-POLICY.md).
