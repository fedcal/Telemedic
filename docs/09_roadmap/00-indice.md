---
title: Roadmap — indice e orientamento
sidebar_position: 1
description: Come si legge la roadmap di Telemedic, che cosa in essa è impegno e che cosa è intenzione, la distinzione fra ciò che promette il progetto e ciò che grava su chi installa, lo stato di fatto al 25 agosto 2026 e la procedura con cui questo piano viene aggiornato.
---

# Roadmap — indice e orientamento

> **Una roadmap che promette tutto non serve a nessuno.**
> Il valore di questo documento non sta nell'elenco delle cose che si faranno: sta nella
> precisione con cui distingue ciò che è **impegnato** da ciò che è **intenzione**, e nella
> chiarezza con cui dichiara **che cosa resta fuori e perché**. Un piano che non esclude nulla
> non è un piano: è un desiderio con una tabella intorno.

## 1. Che cosa è questa area e che cosa non è

Quest'area risponde a **quando accade che cosa**, e a nient'altro. Non descrive come il sistema
è fatto — quello è [`docs/02_architecture/`](../02_architecture/00-indice.md) — né come è
realizzato — [`docs/01_technical/`](../01_technical/00-indice.md) — né che cosa fa —
[`docs/03_functional/`](../03_functional/00-indice.md). Non contiene requisiti, non contiene
decisioni architetturali, non contiene analisi normativa.

Contiene invece quattro cose che nessun'altra area può contenere senza duplicarsi:

1. **Il metodo con cui si decide che cosa entra e che cosa esce**, dichiarato prima delle
   decisioni e non dopo ([01 — Principi e metodo](./01-principi-e-metodo.md)).
2. **I traguardi datati con criteri di completamento binari**, ciascuno con dipendenze e rischi
   ([02 — Traguardi](./02-traguardi.md)).
3. **Il perimetro esatto del primo rilascio installabile**, con ciò che non contiene e con i
   presupposti che il rilascio dà per acquisiti
   ([03 — Primo rilascio utilizzabile](./03-primo-rilascio-utilizzabile.md) e
   [04 — Oltre il primo rilascio](./04-oltre-il-primo-rilascio.md)).
4. **Il registro dei rischi di programma** — non clinici: quelli appartengono all'area di
   conformità — con probabilità, impatto sul calendario, risposta e titolare
   ([05 — Rischi e dipendenze](./05-rischi-e-dipendenze.md)).

## 2. Le tre classi di enunciato, e perché la distinzione è vincolante

Ogni voce di questa roadmap appartiene a una delle tre classi seguenti. La classe **non è una
sfumatura di linguaggio**: determina che cosa il progetto può dichiarare a un integratore, in
una risposta a una gara, in una nota di rilascio o in una pagina pubblica.

| Classe | Marcatore | Significato | Che cosa autorizza a dire |
|---|---|---|---|
| **Impegno** | `[IMPEGNO]` | Il progetto si assume la voce, ne ha il controllo, e la voce ha un criterio di completamento verificabile da un terzo | «Il progetto consegna X, e X è fatto quando vale il criterio Y» |
| **Intenzione** | `[INTENZIONE]` | Il progetto intende farlo, l'ordine di priorità è motivato, ma la data dipende da una variabile non ancora determinata | «È pianificato, in questa posizione della coda, e la data dipende da Z» |
| **Ipotesi** | `[IPOTESI]` | Enunciato condizionato a un evento che il progetto non controlla, o costruito su un'assunzione dichiarata | «Se accade Z, allora X; oggi Z non è accaduto» |

A queste tre si aggiunge una quarta categoria, che non è una classe di enunciato ma una
**esclusione di perimetro**: ciò che il progetto ha deciso di non fare. Le esclusioni definitive
non vivono qui: vivono in [`docs/03_functional/07-fuori-perimetro.md`](../03_functional/07-fuori-perimetro.md)
con identificativo `OUT-nn` e categoria di riapribilità. Quest'area vi rinvia e non le riscrive,
perché un'esclusione scritta in due posti diverge in due posti diversi.

**Regola redazionale che ne discende, e che vale oltre quest'area** (vincolo `V-184`): nessun
materiale del progetto — documentazione, sito, risposta a gara, nota di rilascio, comunicazione
pubblica — può presentare una voce `[INTENZIONE]` o `[IPOTESI]` come se fosse `[IMPEGNO]`. È la
forma più comune di danno reputazionale in un progetto tecnico, e si commette in buona fede.

## 3. La seconda distinzione: chi si impegna

Un impegno del progetto e un impegno di chi installa sono due cose diverse, e confonderle è
l'errore che porta un cliente a credersi coperto dove non lo è. La ripartizione riga per riga
delle misure di sicurezza è in
[`docs/06_security/09-ripartizione-delle-responsabilita.md`](../06_security/09-ripartizione-delle-responsabilita.md);
quest'area ne applica la logica al **tempo**.

| Chi | Che cosa può impegnarsi a fare | Che cosa non può |
|---|---|---|
| **Il progetto** | Produrre artefatti, con una data e un criterio di completamento | Adempiere obblighi che la norma pone in capo a un soggetto diverso |
| **Chi installa** | Adempiere i propri obblighi verso le autorità, entro i propri termini | Delegare al fornitore ciò che la norma gli attribuisce |
| **Chi certifica** | Costituirsi fabbricante, ingaggiare un organismo, apporre la marcatura | — |

Ne discende il **vincolo `V-180`**, che quest'area impone a tutte le altre:

> **Nessun documento del progetto dichiara una data per un traguardo che non è del progetto.**

Ricadono in questa regola, senza eccezioni: la marcatura CE (decisioni `D28`, `D44`, `D49`,
vincolo `V-06`), l'accreditamento presso la federazione nazionale delle identità (`D36`,
`V-05`, `OUT-22`), la data entro cui un utilizzatore deve aver adottato le misure nazionali di
sicurezza (`D39`, questione `Q-09`), la disponibilità dei modelli documentali per le tipologie
del fascicolo (`Q-07`). Di ciascuno il progetto dichiara **le condizioni** e **ciò che
fornisce**; mai la data.

## 4. Lo stato di fatto al 25 agosto 2026

Un piano che non parta da una fotografia verificabile della situazione è un esercizio di
retorica. Questa è la fotografia, e ogni riga è verificabile aprendo il repository.

| Ambito | Stato accertato al 25 agosto 2026 |
|---|---|
| **Dichiarazioni pubbliche obbligatorie** (`D51`) | **Presenti**: `NOT-A-MEDICAL-DEVICE.md`, `DISTRIBUTION-POLICY.md`, `LICENSE`, `NOTICE`, `CONTRIBUTING.md`, `GOVERNANCE.md`, `SECURITY.md`, `CODE_OF_CONDUCT.md` |
| **Guida dei fondamenti** (`D35`, ventuno moduli) | **Diciassette moduli presenti** (`00`–`15`, `17`). Mancano i moduli `16`, `18`, `19`, `20`, `21` |
| **Area tecnica** | **Completa**: dieci file |
| **Area architetturale** | **Completa**: dieci file |
| **Area funzionale** | **Completa**: otto file |
| **Area protocolli** | **Completa**: undici file |
| **Area dominio** | **Completa**: dieci file |
| **Area sicurezza** | **Completa**: undici file |
| **Area integrazione** | **Completa**: undici file |
| **Panoramica** (`docs/00_overview/`) | **In stesura** |
| **Conformità** (`docs/08_compliance/`) | **Completa**: dieci file. Resta l'area con il maggior numero di questioni pendenti verso di essa |
| **Roadmap** (`docs/09_roadmap/`) | Quest'area |
| **Registro delle decisioni architetturali** | **Trenta voci** (`0001`–`0030`) più indice |
| **Versione inglese** (`D3`, `D50`) | **Solo l'involucro del sito.** Tradotte le stringhe di interfaccia; i documenti sono ancora tutti in italiano |
| **Sito di documentazione** (`D7`, `D52`) | **Costruito e pubblicato** su GitHub Pages, in italiano e in inglese |
| **Codice applicativo** | **Assente.** Nessun file sorgente del servizio o dell'interfaccia. Gli unici file strutturati presenti sono i modelli di segnalazione e di proposta di modifica |
| **Catena di costruzione** | **Parziale.** Esistono i flussi di verifica — terminologie sotto licenza, conformità redazionale, ricerca di segreti, distinta dei materiali del sito — ma nessuna catena per il codice applicativo, che non esiste ancora |

Due letture di questa tabella, e sono le due che determinano tutto il resto della roadmap.

**La prima.** Il progetto ha, al 25 agosto 2026, un corpo documentale di dimensione
ragguardevole e nessuna riga di software. I registri delle aree dichiarano conteggi che vanno
da circa ventunomila a circa cinquantamila parole per area; il totale è dell'**ordine delle
centinaia di migliaia di parole**. `[NV]` — il conteggio esatto non è stato eseguito, perché
nessuno strumento di conteggio era disponibile agli agenti che hanno prodotto il corpo, e i
valori dichiarati nei registri sono a loro volta stime da densità di riga. **Il conteggio esatto
è esso stesso un'attività da mettere a piano**, perché è il moltiplicatore dell'obbligo di
traduzione integrale imposto da `D50`.

**La seconda.** La sequenza approvata dal committente (`D52`) impone di completare **tutta** la
documentazione, poi costruire il sito con internazionalizzazione, pubblicarlo e verificarne il
funzionamento reale, prima di considerare chiusa una qualsiasi area. Sommata alla prima lettura,
questa sequenza determina la composizione del traguardo del 30 novembre 2026 in modo che il
capitolo [02](./02-traguardi.md) espone senza attenuazioni e che porta a una questione aperta al
committente (`Q-180`).

## 5. I sei documenti

| # | Documento | Che cosa risolve | Chi lo deve leggere |
|---|---|---|---|
| 00 | Questo | Orientamento, classi di enunciato, stato di fatto, procedura di aggiornamento | Chiunque, prima di tutto il resto |
| 01 | [Principi e metodo](./01-principi-e-metodo.md) | Come si decide che cosa entra: criteri di priorità in ordine lessicografico, attività retroattivamente irrecuperabili, rapporto fra valore clinico e costo, debito tecnico e **debito regolatorio** | Chi propone una funzione, chi contesta una priorità, chi deve dire di no |
| 02 | [Traguardi](./02-traguardi.md) | I traguardi datati fino al 30 novembre 2026 e oltre, con criteri di completamento binari, dipendenze e rischi; i punti di decisione irreversibili | Committente, contributori, chi valuta l'avanzamento |
| 03 | [Primo rilascio utilizzabile](./03-primo-rilascio-utilizzabile.md) | Che cosa contiene esattamente il primo rilascio installabile, che cosa non contiene, che cosa presuppone da chi installa, quali limiti dichiara | Chi installa, chi integra, chi valuta il prodotto |
| 04 | [Oltre il primo rilascio](./04-oltre-il-primo-rilascio.md) | Che cosa viene dopo, in ordine di priorità motivata, distinguendo pianificato, condizionato e desiderabile | Integratori, committente, chi pianifica un'adozione pluriennale |
| 05 | [Rischi e dipendenze](./05-rischi-e-dipendenze.md) | Registro dei rischi di programma con probabilità, impatto sul calendario, indicatore anticipatore, risposta e titolare | Committente, chi conduce la revisione periodica |

## 6. Percorsi di lettura

**Se sei il committente e devi decidere.** [01 §11](./01-principi-e-metodo.md) sulle ipotesi di
capacità, poi [02 §2](./02-traguardi.md) e [02 §6](./02-traguardi.md) sui punti di decisione
irreversibili, poi [05 §2](./05-rischi-e-dipendenze.md). Le questioni che richiedono
espressamente una tua decisione sono `Q-180`, `Q-181`, `Q-182`, `Q-185` e `Q-186`, elencate al
§9.

**Se devi contribuire al codice.** [01](./01-principi-e-metodo.md) per intero — in particolare
i §§ 6 e 8, che spiegano perché alcune attività apparentemente burocratiche precedono la prima
riga di software — poi [02 §3](./02-traguardi.md) e
[03 §7](./03-primo-rilascio-utilizzabile.md), che contiene i criteri bloccanti di rilascio.

**Se devi decidere se adottare il prodotto.**
[03](./03-primo-rilascio-utilizzabile.md) per intero, poi
[04 §§1–3](./04-oltre-il-primo-rilascio.md), poi [05 §3](./05-rischi-e-dipendenze.md) sulle
dipendenze esterne. Il §1 del capitolo 03 contiene il limite che nessuna configurazione rimuove
e va letto prima di ogni altra cosa.

**Se devi rispondere a un capitolato o valutare un'offerta.**
[00 §§2–3](./00-indice.md) di questo documento, per non attribuire al fornitore impegni che non
ha assunto, poi [03 §10](./03-primo-rilascio-utilizzabile.md) e la ripartizione delle
responsabilità in
[`docs/06_security/09-ripartizione-delle-responsabilita.md`](../06_security/09-ripartizione-delle-responsabilita.md).

**Se intendi certificare il prodotto.** Quest'area **non è il tuo piano**. Il tuo piano è il
percorso operativo che l'area di conformità produrrà in `docs/08_compliance/` ai sensi di `D20`
e `D49`. Qui trovi soltanto la parte che il progetto assume: le attività retroattivamente
irrecuperabili di `D45`, elencate in [02 §3](./02-traguardi.md) come traguardo `T-01`, e la
consegna del pacchetto regolatorio come traguardo `T-12`.

## 7. Che cosa questa roadmap non promette

L'elenco è breve e va letto per intero, perché è la parte che protegge insieme il progetto e
chi lo adotta.

- **Non promette una data di marcatura CE**, né una data in cui il prodotto diventi utilizzabile
  su pazienti reali. Il progetto non appone marcatura e non costituisce un soggetto fabbricante
  (`D28`, `D49`, `V-06`, `OUT-20`). Le date dello scenario di riferimento della certificazione
  sono riportate in [02 §5](./02-traguardi.md) come **traguardi di terzi**, con la fonte, e non
  costituiscono impegno del progetto.
- **Non promette una data di conformità alle misure nazionali di sicurezza** per un
  utilizzatore, perché quel termine è **soggettivo**: decorre dalla comunicazione di inserimento
  ricevuta dal singolo soggetto (`D39`). È la questione `Q-09`, risolta al §9 di questo
  documento e recepita come vincolo `V-186`.
- **Non promette prestazioni numeriche.** Le soglie di prestazione sono specifica di prodotto e
  non conformità (`V-12`), e quelle non ancora misurate sono dichiarate come tali in
  [`docs/01_technical/07-prestazioni-e-capacita.md`](../01_technical/07-prestazioni-e-capacita.md).
  Una roadmap non è il posto dove una cifra non misurata acquista credibilità.
- **Non promette l'integrazione con un sistema di terze parti a una data.** L'integrazione
  richiede un ambiente di prova, credenziali e una controparte disponibile: nessuno dei tre è
  sotto il controllo del progetto.
- **Non promette che il perimetro non cambi.** Promette che ogni variazione passi dalla
  procedura di [`docs/03_functional/07-fuori-perimetro.md`](../03_functional/07-fuori-perimetro.md) §7,
  con il costo proporzionato alla categoria dell'esclusione.

## 8. Come si aggiorna questa roadmap

Una roadmap che non ha una procedura di aggiornamento diventa, in poche settimane, un documento
che tutti citano e nessuno crede.

### 8.1 Cadenza ordinaria

**Revisione mensile**, con esito registrato anche quando l'esito è «nessuna variazione». La
revisione produce, per ciascun traguardo aperto: stato dei criteri di completamento (soddisfatto
/ non soddisfatto, mai una percentuale), variazioni delle dipendenze, variazioni del registro dei
rischi, e — se una data si sposta — **la causa**, non solo la nuova data. Una data che si sposta
senza una causa registrata si sposterà di nuovo.

### 8.2 Revisioni fuori cadenza

Sono obbligatorie, non facoltative, e ciascuna ha un innesco preciso:

| Innesco | Che cosa si rivede |
|---|---|
| Chiusura o riapertura di una decisione del committente (`D1`–`D52`) | L'intera roadmap, perché le decisioni sono la sua base |
| Variazione della capacità dichiarata (`Q-181`) | Tutte le date interne, con la regola di ricalcolo di [01 §10](./01-principi-e-metodo.md) |
| Un rischio del registro che si materializza | Il traguardo colpito, i suoi successori, e la risposta pianificata |
| Modifica della destinazione d'uso (`D46`) | Il perimetro del primo rilascio e tutte le esclusioni collegate |
| Pubblicazione di una versione nuova di una specifica fissata | La voce corrispondente e la sua collocazione fra i traguardi |
| Ingresso di un contributore continuativo | Le ipotesi di capacità e le date che ne dipendono |
| Superamento di un punto di decisione irreversibile senza decisione | Lo scenario di riferimento, che decade automaticamente |

### 8.3 Che cosa non si fa mai

- **Non si sposta una data senza spostare il criterio o la causa.** Se il criterio resta lo
  stesso e nulla è cambiato, la data non si sposta: si dichiara che è mancata.
- **Non si aggiunge un traguardo senza criterio di completamento.** È il vincolo `V-181`.
- **Non si dichiara «completato al novanta per cento».** Il criterio è binario per costruzione.
  Un traguardo con dieci criteri e nove soddisfatti è un traguardo non raggiunto, e il rapporto
  dice quale criterio manca.
- **Non si riscrive la storia.** Una data mancata resta nella cronologia con la sua causa: è
  l'unica base su cui la stima successiva può essere migliore della precedente.

## 9. Bacheca: che cosa quest'area ha chiuso e che cosa ha aperto

### 9.1 La questione `Q-09`, risolta

> *«Il termine di adeguamento alle misure di sicurezza è soggettivo per ciascun cliente: la
> roadmap non può cablare una data unica. Come si parametrizza.»* — `ORCH` → `ROAD`

**Risposta.** Non si parametrizza una data: si **smette di dichiarare date** e si dichiara la
**disponibilità delle evidenze**. La parametrizzazione ha tre elementi, tutti verificabili.

**Primo — il prodotto dichiara evidenze, non conformità.** Per ciascuna delle evidenze elencate
in [`docs/06_security/09-ripartizione-delle-responsabilita.md`](../06_security/09-ripartizione-delle-responsabilita.md) §12
— fascicolo di conformità per rilascio, dichiarazione tecnica di deroga, modello di accordo sul
trattamento, dati per la dichiarazione dei fornitori rilevanti, periodo di supporto dichiarato,
politica di divulgazione, procedura di copia e ripristino, modello di rapporto di incidente,
registro delle manutenzioni, tabella artefatto → regime — la roadmap dichiara **a partire da
quale rilascio l'evidenza è disponibile**. È un fatto del prodotto, non del cliente, ed è
databile.

**Secondo — il termine del cliente è un dato di configurazione, non del piano.** La data entro
cui un utilizzatore deve aver adottato le misure discende dalla comunicazione di inserimento
**che ha ricevuto lui** (art. 3, c. 1, della determinazione dell'autorità nazionale n. 379907 del
19 dicembre 2025), o dalla determinazione n. 127434 del 13 aprile 2026 se è stato inserito nel
2026. Il prodotto non la conosce e non deve conoscerla. Ciò che il prodotto deve fare — e che
è un requisito, non una nota — è **non impedire** al cliente di rispettarla: le evidenze devono
esistere prima che il cliente ne abbia bisogno, e il cliente le chiede quando si avvicina il
**suo** termine.

**Terzo — il momento in cui il prodotto incontra il mercato non è il termine, è il contratto.**
I soggetti non sono tenuti a rinegoziare i contratti in essere, ma devono inserire i requisiti
di sicurezza nei contratti **nuovi, rinnovati o prorogati** a partire dal proprio termine per
l'adozione delle misure. Ne discende la conseguenza operativa che riguarda la roadmap:
**l'evidenza deve essere disponibile al momento della trattativa, non al momento del termine**,
e la trattativa precede il termine di mesi.

Formulazione ammessa, che sostituisce ogni data: *«a partire dal rilascio N, il progetto
consegna con ogni artefatto il fascicolo di conformità che comprende le evidenze E1…En; il
termine entro cui il soggetto obbligato deve aver adottato le misure è determinato dalla
comunicazione di inserimento da lui ricevuta e non è determinabile dal fornitore».*

Posta come vincolo **`V-186`**.

### 9.2 La questione `Q-113`, evasa per la parte di quest'area

> *«Livello di servizio di aggiornamento dei componenti di terze parti, espresso in giorni dalla
> pubblicazione dell'avviso e differenziato per gravità.»* — `TECH` → `COMP`, `ROAD`

Quest'area **conferma la forma** e **non fissa i numeri**, che appartengono al piano di
sorveglianza post-commercializzazione e quindi a `COMP`. Ciò che la roadmap stabilisce, e che
pone come vincolo **`V-185`**, è che **un impegno espresso in mesi non è pianificabile e non
viene accettato**: con la cadenza di rilascio osservata sul nodo di relay — quattordici rilasci
in poco più di sette mesi, cinque nel solo mese di agosto 2026 — un impegno mensile è già scaduto
quando viene pubblicato. Il livello di servizio si esprime in **giorni dalla pubblicazione
dell'avviso, differenziato per gravità**, si misura e si pubblica misurato. La roadmap aggiunge
una conseguenza di pianificazione: **la capacità necessaria a onorare quel livello di servizio è
capacità ricorrente**, e va sottratta dalla capacità disponibile per lo sviluppo prima di
calcolare qualunque data. La quantificazione è in [05 §2](./05-rischi-e-dipendenze.md), rischio
`R-12`. **Resta aperta verso `COMP`** per l'impegno formale.

### 9.3 Le questioni `Q-152` e `B-6`, con la parte di quest'area dichiarata

> *«Livelli di servizio attesi ai fini del monitoraggio continuo, distinti da quelli previsti dal
> decreto sulle infrastrutture regionali.»* — `SEC` → `ARCH`, `ROAD`

Quest'area **non propone valori**: non ne ha la competenza e inventarli produrrebbe esattamente
il difetto che `V-12` vieta. Dichiara però tre cose che le competono e che sbloccano la
decisione altrui.

**Quando serve.** La soglia deve esistere **prima del primo esercizio con un tenant reale**, non
prima del primo rilascio. La ragione è che la terza tipologia di incidente significativo dipende
da un numero che **il cliente sceglie**, e che il prodotto misura: finché non esiste un cliente,
non esiste il numero. Ciò che deve esistere al primo rilascio è la **capacità di misura** — la
storicizzazione della disponibilità per tenant e per servizio con granularità sufficiente a
riconoscere il superamento di una soglia dell'ordine del punto percentuale su base giornaliera —
non il valore.

**Che cosa la roadmap chiede in cambio.** Che la capacità di misura sia trattata come requisito
del primo rilascio e non come attività di esercizio, perché aggiungerla dopo significa non avere
serie storiche nel momento in cui servono. È recepito in
[03 §3](./03-primo-rilascio-utilizzabile.md).

**Che cosa resta a `SEC` e ad `ARCH`.** I valori di riferimento da proporre al cliente e la loro
distinzione dagli accordi contrattuali sui livelli di servizio. Aperta come `Q-184` per la parte
di coordinamento temporale.

### 9.4 I vincoli posti da quest'area

| # | A | Vincolo |
|---|---|---|
| `V-180` | tutte | Nessun documento del progetto dichiara una data per un traguardo che non è del progetto |
| `V-181` | tutte | Ogni traguardo ha un criterio di completamento binario, verificabile da un terzo. Una percentuale di avanzamento non è un criterio |
| `V-182` | `TECH`, `COMP` | Nessuna riga di codice applicativo precede la catena di costruzione che genera la distinta dei materiali e il registro degli identificativi di requisito |
| `V-183` | tutte | Il rilascio del corpo documentale è per **area completa e in due lingue**, mai per file |
| `V-184` | `PROD`, `COMP`, `INTEG` | Nessun materiale può presentare una voce `[INTENZIONE]` o `[IPOTESI]` come `[IMPEGNO]` |
| `V-185` | `TECH`, `SEC`, `COMP` | Il livello di servizio di aggiornamento si esprime in giorni dalla pubblicazione dell'avviso, per gravità, e si misura |
| `V-186` | tutte | La conformità alle misure nazionali di sicurezza **non ha una data di prodotto**: il prodotto dichiara le evidenze e la data di disponibilità di ciascuna |

### 9.5 Le questioni aperte da quest'area

| # | A | Questione |
|---|---|---|
| `Q-180` | → **ORCH** | Riformulazione del traguardo del 30 novembre 2026 alla luce dello stato di fatto del §4. Tre opzioni argomentate in [02 §4](./02-traguardi.md) |
| `Q-181` | → **ORCH** | **Dichiarazione della capacità**: quante persone, con quali competenze, con quale continuità. È la variabile mancante senza la quale nessuna data interna è calcolabile |
| `Q-182` | → **ORCH** | Modello di produzione della versione inglese integrale (`D50`) e chi la esegue. Determina il traguardo `T-03` e, per dipendenza, `T-04` |
| `Q-183` | `COMP` | Quali evidenze del pacchetto regolatorio sono consegnabili al 30 novembre 2026 e quali no; stato di `Q-25`, poiché il documento di ricerca sul percorso di certificazione risulta troncato |
| `Q-184` | `SEC`, `ARCH` | Coordinamento temporale sui livelli di servizio attesi: quest'area chiede che la **capacità di misura** sia requisito del primo rilascio e che i **valori** siano determinati prima del primo esercizio |
| `Q-185` | `PROD`, → **ORCH** | La pagina pubblica non risulta allineata alle riformulazioni approvate con `D19` e `D29`. Finché non lo è, ogni giorno di esposizione è un rischio di *claim* non sostenibile: serve una data |
| `Q-186` | `COMP`, `TECH` | **Periodo di supporto dichiarato** (`Q-155`, `C-4`). Senza la durata, il piano di dismissione delle versioni non è pubblicabile e il numero di versioni maggiori da mantenere non è determinabile |

## 10. Convenzioni di quest'area

- **`[NV]`** marca un'affermazione non verificata, con l'indicazione di chi deve chiuderla.
  Nessun `[NV]` sopravvive al traguardo che ne dipende.
- **Le date** sono espresse per esteso e riferite alla fine della giornata indicata. Dove una
  data dipende da un'assunzione, l'assunzione è dichiarata accanto alla data e non in nota.
- **Nessuna stima inventata.** Dove un tempo non è stimabile con le informazioni disponibili, il
  documento lo dichiara e spiega da che cosa dipende. È preferibile una lacuna dichiarata a una
  cifra che qualcuno citerà come propria.
- **Solo dati sintetici**, nessun dato reale, nessun segreto.
- **Regola `R0`.** Nessun nome di azienda, marchio, prodotto commerciale o dominio di potenziale
  partner compare in quest'area. Si usano soltanto formule generiche: «un gestionale sanitario
  cloud», «un sistema EHR di terze parti», «l'integratore», «il vendor partner».

> **Avvertenza permanente.** Il repository è codice sorgente sotto licenza permissiva, non un
> dispositivo medico immesso sul mercato. Il progetto non appone marcatura CE (`D28`, `D49`,
> `V-06`) e, finché una marcatura non esiste, **nessun artefatto distribuito è utilizzabile per
> l'erogazione di prestazioni sanitarie su pazienti reali** (`D16`). Nessun traguardo di questa
> roadmap, per quanto raggiunto, modifica questa condizione.
