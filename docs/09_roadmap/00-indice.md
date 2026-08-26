---
title: Roadmap - indice e orientamento
sidebar_position: 1
description: Come si legge la roadmap di Telemedic, che cosa in essa è impegno e che cosa è intenzione, lo stato di fatto al 25 agosto 2026, le quattro decisioni che ne hanno determinato la forma e la procedura con cui questo piano viene aggiornato.
---

# Roadmap - indice e orientamento

> **Una roadmap che promette tutto non serve a nessuno.**
> Il valore di questo documento non sta nell'elenco delle cose che si faranno: sta nella precisione
> con cui distingue ciò che è **impegnato** da ciò che è **intenzione**, e nella chiarezza con cui
> dichiara **che cosa resta fuori e perché**. Un piano che non esclude nulla non è un piano: è un
> desiderio con una tabella intorno.

## 1. Che cosa è questa area e che cosa non è

Quest'area risponde a **quando accade che cosa**, e a nient'altro. Non descrive come il sistema è
fatto - quello è [`docs/02_architecture/`](../02_architecture/00-indice.md) - né come è realizzato -
[`docs/01_technical/`](../01_technical/00-indice.md) - né che cosa fa -
[`docs/03_functional/`](../03_functional/00-indice.md). Non contiene requisiti, non contiene decisioni
architetturali, non contiene analisi normativa.

Contiene invece cinque cose che nessun'altra area può contenere senza duplicarsi:

1. **Il metodo con cui si decide che cosa entra e che cosa esce**, dichiarato prima delle decisioni e
   non dopo ([01 - Principi e metodo](./01-principi-e-metodo.md)).
2. **I traguardi datati con criteri di completamento binari**, ciascuno con innesco, titolare,
   dipendenze e rischi ([02 - Traguardi](./02-traguardi.md)).
3. **Il perimetro esatto del primo rilascio installabile**, e - sezione centrale di quest'area -
   **che cosa è stato tagliato per rispettare la data**, con l'indicazione di quali tagli sono
   irreversibili ([03 - Primo rilascio utilizzabile](./03-primo-rilascio-utilizzabile.md)).
4. **La coda di ciò che viene dopo**, distinguendo il pianificato dal desiderabile
   ([04 - Oltre il primo rilascio](./04-oltre-il-primo-rilascio.md)).
5. **Il registro dei rischi di programma** - non clinici: quelli appartengono all'area di conformità -
   con probabilità, impatto sul calendario, indicatore anticipatore, risposta e titolare
   ([05 - Rischi e dipendenze](./05-rischi-e-dipendenze.md)).

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
del progetto - documentazione, sito, risposta a gara, nota di rilascio, comunicazione pubblica - può
presentare una voce `[INTENZIONE]` o `[IPOTESI]` come se fosse `[IMPEGNO]`. È la forma più comune di
danno reputazionale in un progetto tecnico, e si commette in buona fede.

## 3. Chi si impegna, e che cosa `D57`, `D58` e `D63` hanno cambiato

### 3.1 La roadmap è pianificazione interna

`D57` stabilisce che **il titolare della pianificazione è il progetto**. Nessun traguardo di quest'area
è attribuito a «terzi», a «chi certifica» o a un soggetto indefinito. `D58` aggiunge che **il ruolo di
fabbricante sarà assunto dal progetto** e che il soggetto giuridico **va costituito**: è un prerequisito
interno con un proprio tempo, ed è a calendario come traguardo `T-14`.

`D63` va oltre l'attribuzione. Stabilisce che **il sistema deve diventare adatto all'erogazione di
prestazioni su utenti reali**: non cambia nulla di ciò che il prodotto è oggi, ma cambia lo stato
dell'obiettivo, da intenzione a **requisito di prodotto**. Con esso cambia la natura di uno dei
limiti registrati qui sotto, che smette di essere permanente e diventa a termine.

Le tre decisioni hanno cambiato **l'attribuzione della pianificazione** e, con `D63`, **lo stato
dell'obiettivo**. Non hanno cambiato nulla dello stato di fatto del prodotto, e la tabella seguente
esiste perché le due cose non si confondano mai.

| Che cosa è vero oggi | Che cosa `D57`, `D58` e `D63` cambiano |
|---|---|
| **Il prodotto non reca marcatura CE** e non è coperto da alcuna dichiarazione di conformità | Nulla |
| **Nessun artefatto distribuito è utilizzabile per l'erogazione di prestazioni sanitarie su pazienti reali** (`D16`) - ed è l'unica riga di questa colonna che **non resta vera per sempre** | `D63` la trasforma in un limite **a termine**: cade quando la valutazione della conformità è completata e la marcatura è apposta, non prima e non per decisione unilaterale del progetto. **Quando** ciò accada non è dichiarabile in nessun materiale (`V-171`, `V-280`) |
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

## 4. Lo stato di fatto al 26 agosto 2026

Un piano che non parta da una fotografia verificabile della situazione è un esercizio di retorica.
Questa è la fotografia, e ogni riga è verificabile aprendo il repository.

| Ambito | Stato accertato al 26 agosto 2026 |
|---|---|
| **Dichiarazioni pubbliche obbligatorie** (`D51`) | **Presenti**: dichiarazione di non dispositivo medico, politica di distribuzione, licenza, avviso, guida ai contributi, governance, politica di sicurezza, codice di condotta. **Da riallineare a `D58`** senza attenuare alcuna avvertenza: è il criterio 8 di `T-01` |
| **Guida dei fondamenti** (`D35`, ventuno moduli) | **Completa**: ventuno moduli, `00`–`20`, glossario e fonti primarie compresi |
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
| **Versione inglese dei contenuti** (`D3`, `D50`) | **Quattro aree complete su dodici**: guida dei fondamenti, protocolli, sicurezza, conformità. **439.982 parole su 860.718**, il 51% del corpus di `docs/`. Il controllo di divergenza è in esercizio e riporta **«Assenti ed esigiti: 0»** |
| **Flussi di verifica automatica** | **Presenti**: terminologie sotto licenza, conformità redazionale, ricerca di segreti, distinta dei materiali del sito |
| **Codice applicativo** | **Assente.** Nessun file sorgente del servizio o dell'interfaccia |
| **Catena di costruzione per il codice** | **Assente**, perché il codice non esiste. È il traguardo `T-03`, e `V-182` impone che preceda la prima riga |

Tre letture di questa tabella, e sono quelle che determinano tutto il resto della roadmap.

**La prima.** Il progetto ha, al 25 agosto 2026, **un corpo documentale sostanzialmente completo, un
sito pubblicato, quattro flussi di verifica in esercizio - e nessuna riga di software applicativo.** La
distanza fra ciò che è documentato e ciò che è costruito è la grandezza da cui il piano parte.

**La seconda.** Il corpus è di **875.748 parole**: 860.718 in `docs/`, distribuite su dodici aree e
centoquarantaquattro file, più 15.030 nei nove documenti alla radice del repository. Il conteggio è
stato **eseguito il 26 agosto 2026** e chiude il `[NV]` che quest'area portava, insieme al criterio
5 di `T-02`. L'area `10_fondamenti` da sola pesa 397.315 parole, il 46% del totale.

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

A queste si aggiungono, nella stessa tornata, `D57` - la pianificazione è interna - e `D58` - il ruolo
di fabbricante sarà assunto dal progetto, con il soggetto da costituire. Il loro effetto è al §3.

### 5.1 La quarta tornata, del 26 agosto 2026

Quattro decisioni prese dopo la traduzione integrale della guida dei fondamenti e dell'area di
conformità. Tre nascono da **contraddizioni fra documenti già pubblicati**, trovate perché tradurre
è la revisione più severa che un testo riceva.

| # | Decisione | Che cosa cambia in quest'area |
|---|---|---|
| **`D59`** | Fra la guida didattica e l'area di specifica **prevale la specifica** | Nessun effetto sulle date. Chiude cinque divergenze di contratto verso gli integratori, fra cui la politica di ritentativo dei webhook, che passa da «fino a 24 ore» a **dodici tentativi e circa settantadue ore** (`P-08`) |
| **`D60`** | La firma degli eventi in uscita è **asimmetrica per impostazione predefinita** | Conferma `V-162` e la riga `S-6` dell'ordine di sacrificio. `04_protocols/07` era l'unico documento fuori linea rispetto a tre aree già pubblicate |
| **`D61`** | I contesti delimitati sono **tredici**: il gateway terminologico è un contesto | Allinea i tre alberi dei sorgenti a `16 §4.2-4.3` e a `ADR 0016`. Nessun effetto sulle date |
| **`D62`** | **Capacità quantificata: dieci-venti ore a settimana.** Emenda `D54` | **Innesco di revisione fuori cadenza** su tutte le date interne e sull'ambito, secondo il §8.2. Chiude il `[NV]` che `01 §4.1` indicava come la ragione per cui il progetto non produce stime |

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

**Se devi contribuire al codice.** [01](./01-principi-e-metodo.md) per intero - in particolare i §§ 5 e
8, che spiegano perché alcune attività apparentemente burocratiche precedono la prima riga di software -
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
mai una percentuale), variazioni delle dipendenze, variazioni del registro dei rischi, e - se qualcosa non
tiene - **la causa**, non solo la conseguenza.

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

### 8.4 Registro delle revisioni

**26 agosto 2026 - revisione fuori cadenza.** Inneschi, dalla tabella del §8.2: *chiusura di
decisioni del committente* (`D59`…`D62`) e *variazione della capacità dichiarata* (`D62`, che
emenda `D54`). Il primo impone di rivedere l'intera roadmap, il secondo tutte le date interne e
l'ambito.

**Stato dei traguardi aperti**, in forma binaria come prescrive il §8.3.

| Traguardo | Criteri soddisfatti | Criteri non soddisfatti |
|---|---|---|
| `T-01` (12 set) | 6 - le dichiarazioni pubbliche sono presenti senza interruzione. **8** - le avvertenze pubbliche sono allineate a `D58` in entrambe le lingue (vedi la rettifica in calce) | 1, 2, 3, 4, 5, 7 |
| `T-03` (26 set) | 3 - il controllo di divergenza esiste con comportamento differenziato e dichiarato | 1, 2, 4, 5, 6, 7, 8 |
| `T-06` (21 nov) | 2 e 3 - il controllo blocca sulle aree prerequisito e non produce rilievi; segnala sul resto. 4 - i riferimenti normativi italiani restano nella forma originale con la spiegazione in inglese, verificato a campione. **1** - guida dei fondamenti, conformità e sicurezza sono complete, e le avvertenze pubbliche esistono in inglese nei file bilingui (vedi la rettifica in calce) | 5, 6 **in parte** - la procedura di allineamento è scritta ma non ancora versionata come documento controllato |
| `T-08` (14 nov) | nessuno: `V-182` vieta il codice applicativo prima di `T-03` | tutti |
| `T-10` (30 nov) | nessuno | tutti |

**Rettifica del 26 agosto 2026, stessa giornata.** Le due righe sopra dichiaravano non soddisfatti
il criterio 8 di `T-01` e in parte il criterio 1 di `T-06`, con la motivazione che «le avvertenze
pubbliche non esistono in inglese». **La motivazione era falsa, e l'errore era di metodo.** Le
avvertenze pubbliche - dichiarazione di non dispositivo medico, politica di distribuzione,
richiamo in evidenza del documento di presentazione - sono **bilingui in un file solo**: blocco
italiano, separatore, blocco inglese, con un rimando «*English version below*» in testa. La stessa
convenzione vale per `CONTRIBUTING.md`. I blocchi inglesi erano già allineati a `D58` e dicono
«That entity **does not exist today**, no date is stated».

L'errore nasce dal controllo di divergenza, che era stato esteso alle avvertenze pubbliche
assumendo file `.en.md` separati - una convenzione che il repository non usa. Il controllo cercava
file inesistenti e ne concludeva che l'inglese mancasse. È stato corretto: verifica ora il blocco
inglese **dentro** il file bilingue, e vi cerca le due avvertenze che non possono mancare -
nessuna marcatura, nessuna dichiarazione di conformità - quali che siano le parole intorno. La
correzione è stata provata al contrario, degradando deliberatamente il testo inglese, e il
controllo lo rileva.

**La lezione, che vale oltre questo caso**: un controllo tarato su una convenzione sbagliata non
tace, *afferma il falso* - e lo afferma con l'autorevolezza di una verifica automatica, che è
peggio di non averla. Prima di estendere un controllo a una nuova classe di documenti, va
verificata sul repository la convenzione che quei documenti seguono davvero.

**26 agosto 2026 - chiusura di `S-8`, con la procedura ordinaria.** Il committente ha deciso che il
percorso verticale dimostrabile di `RU-1` si riduce a una sola prestazione: la **televisita
programmata a due partecipanti**. Il taglio è **reversibile**: teleconsulto e telemonitoraggio
restano integralmente progettati nel modello di dominio e nei requisiti funzionali, e la loro
implementazione è rinviata. Il taglio **morde sul criterio 6 di `T-08`** - il percorso verticale
completo - e **non tocca il criterio 4** - il registro immutabile - che resta intatto per
costruzione (`01 §7.3`): la copertura non è riducibile. La decisione è registrata nell'ordine di
sacrificio di [03 §6.2](./03-primo-rilascio-utilizzabile.md) come voce `S-8`.

**Aritmetica dopo `S-8`.** Con `D62` (dieci-venti ore settimanali) e una finestra di quarantanove
giorni fra `T-03` (26 settembre) e `T-08` (14 novembre), l'ambito non è ancora riducibile senza
toccare i criteri di rilascio bloccanti. L'ordine di sacrificio, eseguito per intero, acquista
volume sufficiente - i tagli reversibili (`S-1`…`S-8`) assorbono uno spessore di lavoro - ma il
margine resta **assente**. La data del 30 novembre 2026 è protetta solo dall'ambito dichiarato, non
da riserve di tempo. Se nella settimana del 19 ottobre 2026 uno qualunque dei nove traguardi di
classe `A`, `B` e `C` del capitolo [02 §3](./02-traguardi.md) non è chiuso, la data diverrà
intenibile senza ulteriori riduzioni che siano reversibili.

**26 agosto 2026 - avanzamento su `T-01`, verbalizzato a lavoro eseguito.** Non è una revisione
della roadmap: è la registrazione di che cosa i criteri di `T-01` hanno ora dietro di sé. `V-182`
vieta il codice applicativo prima di `T-03`, e i criteri 5 e 7 sono controlli di pipeline che
`T-01` colloca **deliberatamente prima** di quella pipeline: sono i primi due controlli che essa
riceverà.

| Criterio | Stato | Che cosa esiste |
|---|---|---|
| 1 | **In parte** | `docs/08_compliance/10-controllo-dei-documenti.md`, con tutte e cinque le voci richieste. **L'approvazione resta la lacuna di `Q-189`**: sotto `D54` redattore e approvatore coincidono, e il criterio chiede una procedura *approvata* |
| 2 | **Soddisfatto** | La procedura dichiara come commit, revisore e approvazione costituiscono la registrazione, elenca i quattro strumenti in vista della validazione, e dichiara la coincidenza redattore/approvatore come **lacuna e non come conformità** |
| 3 | **Soddisfatto** | `registro/identificativi-requisiti.tsv`: **614 identificativi** su otto famiglie, giornale in **sola aggiunta**, stato come proiezione degli eventi, divieto di riuso esplicito e verificato dal controllo |
| 4 | **Soddisfatto** | TSV a cinque colonne con formato dichiarato in `registro/README.md`, che documenta anche la **grammatica di ciascuna famiglia** - non è uniforme, ed è ciò che ha già prodotto un difetto |
| 5 | **Soddisfatto** | `scripts/verifica-identificativi-requisiti.sh`, provato con registro malformato, identificativo assente, identificativo ritirato e **riuso dopo ritiro**. Corretto a insieme vuoto, come dev'essere finché `V-182` vieta il codice |
| 6 | **Soddisfatto** | Già al 25 agosto |
| 7 | **Soddisfatto** | `scripts/verifica-dichiarazione-non-marcatura.sh`, provato su artefatto deliberatamente privo. Fondato su **elementi strutturali** - nome del file nel collegamento, classe del blocco in evidenza - e non su una frase, che una riformulazione cambierebbe |
| 8 | **Soddisfatto** | Vedi la rettifica sopra: lo era già |

**Il banco di prova, e perché conta più dei controlli.** `scripts/prove/` esegue **22 casi**, e ogni
caso «deve fallire» fa fallire la prova se il controllo passa. Il banco è stato sottoposto a
**prova di mutazione**: rendendo un controllo deliberatamente sempre-verde, il banco è passato da
17 casi conformi su 17 a 11 su 17. Un banco che non si accorge di un controllo disattivato è
teatro, e questo se ne accorge.

**Due controlli nuovi entrano in `verifiche.yml`**, `identificativi-requisiti` e
`dichiarazione-non-marcatura`, **nessuno dei due in sola segnalazione**: possono far fallire la
costruzione, che è il senso di `T-01`.

**Che cosa il lavoro ha aperto, e non chiuso.** La procedura di controllo documentale **prescrive
due controlli che il progetto non ha attuato**: la protezione del ramo principale - verificato il
26 agosto 2026, `gh api .../branches/main/protection` risponde `404 Branch not protected` - e la
firma crittografica dei commit, che nessun commit porta. Sono registrati come `Q-283` e `Q-284`.
Da non confondere con il `Signed-off-by` (DCO), che è **attivo e obbligatorio** ed è ciò che
soddisfa oggi la tracciabilità nominativa dell'autore.

Finché quei due restano non attuati, la registrazione di approvazione **non ha la forma che la
procedura descrive**, e va letta per ciò che è: la traccia di che cosa è stato fatto, non la prova
che non si potesse fare altrimenti. `Q-283` si intreccia con `D54`: con un contributore unico, una
protezione del ramo che esiga un revisore diverso dall'autore bloccherebbe ogni lavoro, quindi la
forma dell'attivazione va decisa insieme alla lacuna di `Q-189`.

**Un difetto trovato dal controllo appena scritto.** L'espressione che riconosceva gli
identificativi era `\b(RF|RNF|BR|ATT|UC|OUT|EX|DM)-[0-9]+\b`, e la famiglia `EX-*` **non ha
grammatica numerica**: i suoi identificativi sono parlanti (`EX-TM-ESCFAIL`). Il controllo era
cieco su trenta identificativi - e proprio quelli di **esito**, cioè i più citati da una prova.
Corretto con due grammatiche riconosciute separatamente, e provato che il prefisso generico
`EX-TM-*` non venga scambiato per un identificativo.

**Che cosa è avanzato.** La traduzione ha chiuso la guida dei fondamenti per intero - ventuno
moduli - e l'area di conformità. Quattro aree su dodici sono complete, il 51% del corpus in
parole. Il conteggio esatto del corpus è stato eseguito: **875.748 parole**, che chiude il criterio
5 di `T-02` e il `[NV]` del §4.

**Che cosa non tiene, e la causa.** Con la capacità ora quantificata da `D62`, la finestra per il
codice applicativo è di **quarantanove giorni** - `V-182` vieta ogni riga prima di `T-03` - cioè
circa **settanta-centoquaranta ore**. In quella finestra `T-08` porta **due criteri che il progetto
stesso classifica «mesi»**: il criterio 4, il registro immutabile, che `T-08` rinvia a `R-20` e
qualifica «il singolo elemento di maggiore sforzo del catalogo»; e il criterio 6, il percorso
verticale completo. **L'aritmetica non chiude.** La causa non è una stima sbagliata - non ci sono
stime - ma il fatto che l'ambito non è stato ridotto in misura corrispondente alla capacità che
`D53` e `D54` avevano già fissato.

**Che cosa ne discende, e non è ancora deciso.** L'ordine di sacrificio del §6.2 di
[03](./03-primo-rilascio-utilizzabile.md) taglia superficie - esportazione delle metriche, sala
d'attesa, elenco del giorno, tipizzazione del ripiego telefonico - e **non tocca né il criterio 4
né il criterio 6 di `T-08`**, che sono protetti per costruzione: la copertura del registro non è
riducibile ([01 §7.3](./01-principi-e-metodo.md)) e il percorso verticale *è* il rilascio.
Eseguire l'ordine per intero compra quindi poco contro il vincolo reale.

**È aperta la valutazione di un taglio reversibile ulteriore**, da aggiungere all'ordine come
`S-8`, con la **procedura ordinaria e prima che la pressione di calendario arrivi** - perché la
regola 2 del §6.1 di [03](./03-primo-rilascio-utilizzabile.md) vieta di decidere un taglio sotto
pressione. La valutazione è aperta il 26 agosto 2026 e **non è chiusa da questa revisione**.

**`T-03` è cominciato, e la prima fase è in corso.** L'innesco scritto del traguardo è la chiusura
dei criteri 3 e 4 di `T-01`, entrambi soddisfatti oggi: il traguardo può partire il **27 agosto
2026**, non il 12 settembre come mostrava il diagramma di Gantt del capitolo
[02](./02-traguardi.md). Dove il testo e il diagramma divergevano ha prevalso il testo, e il
diagramma è stato corretto. La sovrapposizione con `T-01` non significa lavoro parallelo: con
`D54` un solo contributore **alterna**, e la sovrapposizione compra soltanto la libertà di
scegliere quale traguardo far avanzare.

**La catena di costruzione ha quattro fasce, e `verifiche.yml` è ritirato.** Fascia rapida a ogni
invio, con il solo controllo dei segreti; fascia completa sulle proposte di modifica **e** sugli
invii al ramo principale, con i sei controlli obbligatori più il sorvegliante nuovo; fascia estesa
a cadenza settimanale e fascia di rilascio su procedura esplicita, che oggi dichiarano entrambe
«nessun codice applicativo: nulla da verificare», come `V-182` impone. L'aggiunta dell'innesco su
`main` non era prevista dal piano: una proposta di modifica si verifica sull'esito *previsto*
dell'unione, e un controllo obbligatorio che non ha mai visto lo stato reale del ramo principale
presidia un'ipotesi. La protezione del ramo è stata configurata oggi (`Q-283`), quindi la fascia
completa ha da oggi entrambe le vie.

**Il `continue-on-error` è caduto, e con esso la seconda delle due rettifiche.** Le due divergenze
di traduzione residue erano refusi italiani, e l'inglese diceva già la cosa giusta; chiuse quelle,
il presupposto della tolleranza è venuto meno e il lavoro `divergenza-traduzioni` è **bloccante**.
Il criterio 3 di `T-03`, che questo registro aveva dichiarato soddisfatto e poi rettificato come
non soddisfatto, è ora soddisfatto davvero: il controllo esiste, blocca, ed è stato visto fallire.

**La dottrina del «tocco» è stata sostituita da una dichiarazione falsificabile.** Quando l'italiano
cambia per un refuso e l'inglese è già corretto, la regola scritta imponeva di toccare comunque il
file tradotto per riallineare le date - cioè di produrre una modifica priva di contenuto solo per
far tacere un controllo. Al suo posto il file inglese porta ora
`<!--TRAD-VERIFICATA: <revisione>-->`: vale **solo** se la revisione nominata contiene già l'ultima
modifica dell'originale, il che si verifica con `git merge-base --is-ancestor`, e **scade da sola**
alla modifica successiva. Chi la scrive dichiara di avere letto entrambi i testi, ed è tracciabile.
Il controllo dà ora `Allineati: 145 · Divergenti: 0 · Assenti ed esigiti: 0 · Orfani: 0`.

**I controlli dichiarano dove stanno, con quale forza e con quale prova.** `pipeline/collocazione-dei-controlli.tsv`
è la tabella nuova: per ogni controllo, la fascia, se blocca o segnala, da quale data diventerà
bloccante, il criterio di roadmap che presidia, il lavoro che lo esegue, il caso del banco che lo
ha visto fallire e la motivazione della collocazione. `scripts/verifica-collocazione-dei-controlli.sh`
la sorveglia, ed è esso stesso una riga della tabella: **un controllo esente dalla regola che
impone è la forma più pura di controllo che mente.** Il sorvegliante ha portato alla luce un debito
che nessuno aveva contato, perché nessuno lo aveva mai misurato: **quattro controlli di pipeline su
sette non avevano una prova negativa** - `G1`, `G3`, `G5` e il redazionale. Nessuno di essi era mai
stato visto fallire.

**Il banco è passato da ventisette casi a quarantacinque, e il debito da otto errori a due.** Ogni
caso nuovo è stato provato per mutazione, un guasto isolato per volta: guastata la regola, solo il
caso corrispondente passa da ✓ a ✗; ripristinata, torna a passare, con impronta SHA-256 identica
prima e dopo. Il meccanismo `TRAD-VERIFICATA` ha cinque casi su un repository git effimero con date
di commit esplicite; il sorvegliante della tabella ne ha sei, fra cui una **regressione mirata al
difetto di lettura per tabulazione** - e quella regressione ha rivelato un fatto che l'analisi non
aveva previsto: il difetto colpiva **ogni riga bloccante reale**, non i soli casi patologici, perché
una riga bloccante ha per costruzione la casella della data vuota.

**I due errori residui non sono trascuratezza, e non si chiudono scrivendo un caso.** `G1` vive come
azione GitHub di terze parti e non come script locale: imitarla nel banco proverebbe l'imitazione,
non il controllo. `G5` genera la distinta e **non asserisce nulla**, quindi non esiste oggi un
comportamento che possa fallire - un collaudo qui presuppone il criterio 5 di `T-03`, non il
contrario. La scelta fra rendere `gitleaks` eseguibile in locale, ammettere nel formato uno stato
dichiarato di non collaudabile, o lasciare il cancello rosso, è posta come `Q-288`.

**E una riga della tabella dichiarava il falso.** `T01-C8` annoverava le formule di conformità
vietate di [04 §10.2](../04_protocols/10-conformita-e-prove.md) fra ciò che il controllo redazionale
presidia. **Lo script non le cerca, e non le cerca nessun altro controllo del repository**: ne
implementa tre diverse - frontmatter non quotato, rinvii relativi fuori da `docs/`, segnaposto di
segreti. La riga è stata corretta perché dicesse il vero; il debito resta intero ed è posto come
`Q-289`. È la terza occorrenza in una giornata dello stesso fatto: una regola scritta e non
presidiata da un controllo non è una regola - e quando qualcuno annota che un controllo la presidia
senza verificarlo, diventa peggio di una regola senza controllo, perché smette di essere cercata.

**Un rilievo che tocca la regola non negoziabile numero uno.** Il controllo nuovo sui dati non
sintetici - `scripts/verifica-dati-sintetici.sh`, `L-08` - trova sul ramo principale **trentasette
codici fiscali con carattere di controllo valido**: `RSSMRA80A01H501·` (sedicesimo carattere mascherato) trentasei volte e
`TSTPSN80A01D612·` una, verificati di persona sulle tabelle del DM 23 dicembre 1976. Non sono dati
di persone reali note, ma **non sono nemmeno riconoscibili come finti**, ed è precisamente ciò che
il §6.1 del piano di `T-03` vieta: una forma sintetica dev'essere *non valida per costruzione*. La
convenzione corretta esiste già nel corpus - `VRDLGU75E41D612B` e `AAABBB00A00A000A` hanno il
carattere di controllo deliberatamente errato - e non è stata applicata dappertutto. La correzione
è di un carattere per occorrenza, su entrambe le lingue nello stesso atto.

La lacuna a monte pesa più del rilievo: la regola 1 di
[`CONTRIBUTING.md`](https://github.com/fedcal/Telemedic/blob/main/CONTRIBUTING.md) rimanda a
«generatori di dati sintetici del progetto» che **non esistono**, e non dice la cosa che conta -
cifra di controllo deliberatamente errata, dominio riservato, cifre ripetute. È la quarta occorrenza
in una giornata della stessa forma: la regola c'era, il presidio no.

**Il rilievo sui dati sintetici è chiuso nella stessa giornata.** Trentasette codici fiscali
corretti, il sedicesimo carattere reso deliberatamente errato, **su entrambe le lingue nello stesso
atto**; due domini di esempio portati a `.invalid`; cinque recapiti dichiarati con il marcatore di
ammissione invece che rimossi, perché sono l'intestazione della chiave di firma e la clausola 7.5.8
di ISO 13485 esige proprio quella tracciabilità nominativa. Il controllo esamina 407 file e non
trova più nulla.

E la lacuna a monte è colmata: la regola 1 di
[`CONTRIBUTING.md`](https://github.com/fedcal/Telemedic/blob/main/CONTRIBUTING.md) non rimanda più a
generatori inesistenti, ma scrive la convenzione - **non valido per costruzione**, cioè
riconoscibile come finto da una verifica e non dall'occhio di chi legge - e dichiara che i
generatori automatici non ci sono ancora. È la differenza fra una regola che il controllo fa
rispettare e una regola che il controllo insegna soltanto a chi la viola.

**La classe delle àncore è chiusa, e la sua chiusura ha prodotto undici difetti nuovi.**
Quaranta àncore inglesi ricalcolate sul titolo tradotto, quattro già corrette perché il titolo è
identico nelle due lingue. Ma undici erano state normalizzate a trattino singolo dove ne servono
**due**: un titolo come `### CTX-01 - Identity and access` separa il codice dal testo con un
carattere isolato fra due spazi, e l'algoritmo converte ogni spazio in un trattino. All'epoca il
separatore era un trattino lungo, che l'algoritmo rimuove: restavano i due trattini degli spazi.
Dopo la conversione al trattino corto, decisa più tardi nella stessa giornata, i trattini sono
diventati **tre**, perché il separatore non viene più rimosso - e il controllo scritto poche ore
prima ha trovato tutte e ventidue le àncore che si erano spostate, in entrambe le lingue.

Da qui il controllo `scripts/verifica-ancore.sh`, che riproduce l'algoritmo e verifica ogni rinvio
con àncora su entrambe le lingue: **84 esaminati, 0 rotti**. Prima della correzione dava 11 rotti in
inglese e 0 in italiano, ed è quella asimmetria ad averlo convalidato. Il runbook di traduzione,
che sulle àncore non diceva nulla - ed è la ragione per cui la classe è nata - ora lo dice.

**La lezione vale oltre il caso**: la correzione di un difetto è essa stessa un'operazione che può
introdurne, e un difetto di classe non si chiude verificando a occhio ma scrivendo il controllo che
lo misura - **prima** di dichiararlo chiuso, non dopo.

**Due decisioni del committente, nella stessa giornata.** `D63`: il sistema **deve essere adatto
all'erogazione di prestazioni su pazienti reali**. Non è un ampliamento di ambito ma l'attuazione
operativa di `D58`, e ha un solo significato giuridico - marcatura CE al termine di una valutazione
della conformità conclusa, con il risultato minimo di Classe IIa e organismo notificato che il §3 di
[08 §02](../08_compliance/02-qualificazione-e-classificazione.md) ha già determinato. **Non sposta
`RU-1`**: il 30 novembre 2026 resta un traguardo ingegneristico e resta non utilizzabile su
pazienti, mentre il calendario della marcatura è quello già scritto in
[08 §09](../08_compliance/09-percorso-e-calendario.md), con i certificati a giugno 2028 nello
scenario realistico. Le due cose stanno su calendari diversi, e confonderle produrrebbe la
dichiarazione fuorviante che l'art. 7 dell'MDR vieta. `V-171` e `V-280` **restano in vigore**: la
decisione autorizza a perseguire la marcatura, non a dichiarare la data in cui sarà apposta. Aperte
`Q-290` sulla forma del soggetto giuridico e `Q-291` sulla ripartizione della responsabilità.

E la chiusura di `Q-287`: **firma con identità effimera legata all'esecuzione della catena**. La
ragione decisiva è `D54` - la custodia di una chiave è un onere *ricorrente*, e un onere ricorrente
che nessuno ha il tempo di esercitare non è una misura di sicurezza ma una chiave abbandonata. Il
costo accettato è dichiarato e non attenuato: la verificabilità dipende da un registro di
trasparenza di terzi **nel tempo**, che per un dispositivo medico è un orizzonte lungo.

**Il criterio 6 è chiuso, e ha portato alla luce un lavoro di pipeline rotto.** Il registro dei
componenti esiste, con otto componenti annotati e quattro prove negative. Ma il comando che genera
la distinta **fallisce**: `npm ls` va in errore dentro `arborist` perché il campo `overrides` punta
a dipendenze transitive, e con questa combinazione di npm e node la risoluzione del grafo si rompe.
Nessuno se n'era accorto per la stessa ragione per cui quel controllo era senza prova negativa:
**genera un artefatto e non asserisce nulla**. Un lavoro di pipeline che produce senza verificare
non dimostra di funzionare, dimostra soltanto di essere stato eseguito.

**La regola della prova negativa è stata emendata, non aggirata.** Cinque controlli presuppongono
codice che `V-182` vieta, quindi non hanno un comportamento che possa fallire e non c'è nulla da
provare. La regola ora dice che **la prova è esigibile da quando il controllo blocca**: una riga
bloccante senza prova fallisce sempre, una in segnalazione può averla vuota **solo finché la sua
data non è arrivata**. La data acquista un secondo effetto e diventa un vincolo che si fa valere da
sé. La tabella è a quindici righe e **un solo errore**, che è un debito reale e non una formalità.

**Gli errori di questa giornata sono stati raccolti in un file solo**, su richiesta del committente:
`.telemedic/context/RUNBOOK-ERRORI-E-TRAPPOLE.md`, ventitré voci in quattro famiglie - metodo,
orchestrazione, strumenti, progetto - ciascuna con la causa radice, la regola che la previene e **il
controllo che la fa rispettare**, oppure la dichiarazione esplicita che quel controllo non esiste.
In fondo c'è la tabella delle voci senza presidio, che è il debito del runbook stesso. `CLAUDE.md`
lo colloca fra le letture obbligatorie prima di scrivere qualsiasi cosa, con l'obbligo di
aggiornarlo **dopo** il lavoro: un errore risolto una volta e non codificato torna.

**Registro dei rischi.** Nessuna variazione di livello. `R-28` - data ravvicinata con capacità
dichiarata bassa - resta il rischio dominante, e questa revisione ne è la prima misurazione con la
capacità quantificata anziché con un `[NV]`.


**26 agosto 2026 - traduzione delle otto aree residue, e i difetti che ne sono usciti.** Innesco,
dalla tabella del §8.2: nessuno di quelli tabellati. La voce copre una giornata di lavoro intera e
sostituisce, per decisione sulla cadenza del registro, le voci separate che ciascun ritrovamento
avrebbe prodotto: **una voce per sessione, non una per ritrovamento**, perché un registro che occupa
metà del documento che dovrebbe indicizzare ha smesso di servire a orientarsi.

**Che cosa è stato prodotto.** Quattordici piani di esecuzione in `.telemedic/piani/`, uno per
traguardo tranne `T-01`, che non ne ha bisogno perché dipende da una decisione e non da lavoro. E la
traduzione inglese delle otto aree che mancavano, su richiesta del committente, che ha anticipato a
oggi un lavoro che `T-09` collocava nel 2027: **145 file italiani, 145 inglesi**, parità raggiunta.

**Quattro difetti trovati, tutti verificati sul testo.**

1. **Un documento prerequisito era tradotto a metà.** `10_fondamenti/16-architettura-del-progetto.md`
   contava nove sezioni inglesi su diciotto, senza il marcatore di continuazione che il runbook
   impone, e con la data di modifica dalla parte giusta. Il troncamento era nel commit `b3498b7`:
   sul ramo principale. Nessuno dei tre controlli esistenti poteva vederlo - le date erano
   allineate, il marcatore non c'era, e un documento monco è un documento valido. Completato.
2. **La panoramica prometteva ciò che la roadmap aveva tagliato.** `00_overview/04-stato-e-limiti.md`
   descriveva il primo rilascio «fino al documento clinico validato e restituito», mentre il §3 di
   [03](./03-primo-rilascio-utilizzabile.md) dichiara che il percorso si ferma **prima della
   refertazione** con il taglio `TG-01`. La panoramica portava la formulazione precedente al taglio.
   Corretta riducendo ciò che il documento rivendica, e aggiunto il limite mancante alla tabella.
3. **Tre file inglesi non erano traduzioni.** Consegnati con il nome tradotto -
   `03-usable-first-release.md` invece di `03-primo-rilascio-utilizzabile.md` - Docusaurus non li
   avrebbe riconosciuti: avrebbe pubblicato pagine orfane continuando a mostrare l'italiano.
   Rinominati, e riparati sedici rinvii inventati che li accompagnavano.
4. **La regola sulle quattro prestazioni era scritta e disattesa.** `log-TRAD-1 §3.3` fissa
   *remote consultation*, *specialist-to-specialist consultation*, *remote assistance* e *remote
   monitoring*, con l'italiano fra parentesi alla prima occorrenza e un'unica eccezione per
   `04_protocols/`. Era rispettata in meno di un quarto dei casi. **Decisione del committente**:
   allineare il corpus alla regola, non emendare la regola alla pratica. Applicata, con le
   protezioni enumerate - nomi propri delle guide HL7 Italia, URI e valori JSON, tipologie
   documentali del DM, termini menzionati invece che usati, traducenti citati per dichiararli
   inesatti - e con una decisione presa in corso d'opera: **le enumerazioni tassonomiche di un atto
   normativo restano intere in italiano**, perché convertirne solo le voci con resa vincolante
   spezzerebbe l'unità dell'elenco.

**Due rettifiche di questo registro.** Il criterio 3 di `T-03` e il criterio 2 di `T-06` **non** sono
soddisfatti come dichiarato: il lavoro `divergenza-traduzioni` porta `continue-on-error: true` alla
riga 74 di `.github/workflows/verifiche.yml`, quindi lo script esce diverso da zero e la costruzione
non fallisce. E l'ordine di sacrificio ha **sei righe utili, non sette**: `S-8` è consumata e `S-7`
è priva di oggetto, mentre `05 §1.3` e `§2.1` ne dichiarano sette.

**Tre controlli, ciascuno con la sua prova negativa.** `scripts/verifica-divergenza-traduzioni.sh`
aveva un difetto - `git log` esce con successo restituendo una riga vuota sui file non tracciati, e
il ripiego `|| echo 0` non scattava - e ora ha, oltre alla correzione, il **confronto strutturale del
numero di sezioni** e il **rilevamento delle pagine orfane**, che sono le cure dei difetti 1 e 3. Il
banco `scripts/prove/esegui-prove.sh` sta a **27/27**, e ogni controllo nuovo è stato provato per
mutazione: guastato lo script il caso fallisce, ripristinato torna a passare, con impronta SHA-256
identica prima e dopo. Un fatto emerso dall'esercizio e che nessuno aveva previsto: il difetto
originario **non alterava né i conteggi né il codice di uscita**, quindi una prova scritta su quelli
non l'avrebbe mai rilevato.

**Prova in quattro campi.** *Artefatto*: `scripts/verifica-divergenza-traduzioni.sh` e
`scripts/prove/esegui-prove.sh`. *Comando*: `bash scripts/prove/esegui-prove.sh` e
`bash scripts/verifica-divergenza-traduzioni.sh`. *Esito*: banco 27/27; controllo di divergenza
`Allineati: 143 · Divergenti: 2 · Assenti ed esigiti: 0 · Orfani: 0`, poi
`Allineati: 145 · Divergenti: 0 · Assenti ed esigiti: 0 · Orfani: 0` a divergenze chiuse.
*Data*: 26 agosto 2026.

**Baseline dei collegamenti rotti, presa per la prima volta e poi rettificata.** `npm run build`
**esce con codice 0** perché `onBrokenLinks`, `onBrokenAnchors` e `onBrokenMarkdownLinks` sono tutti
e tre a `warn`. È la misura del criterio 1 di `T-07`, che finora era un'impressione. La prima
rilevazione contava tre pagine rotte in italiano e ventuno in inglese; **era presa su un elenco
troncato**, perché la cattura era passata per `tail` e Docusaurus stampa un riepilogo prima
dell'elenco completo. La misura vera, su registro intero: **l'italiano è pulito - zero collegamenti
rotti** dopo la correzione dei tre difetti, e l'inglese ha **ventitré pagine e ottantotto
collegamenti rotti**, cui si aggiunge una classe che nessuno aveva contato, le **àncore**. La
lezione è la stessa del controllo tarato male: *una misura presa su un estratto non è una misura*, e
un numero sbagliato in un registro è peggio di un numero assente, perché chi legge non lo verifica.

**I tre difetti italiani, e la regola che è stata violata chiudendoli.** Erano un rinvio a una
cartella invece che a un documento (`05_domain/07`) e due percorsi relativi privi del prefisso `./`
(`10_fondamenti/01` e `10_fondamenti/08`). Sono stati corretti in italiano, e **l'inglese è stato
lasciato indietro** - gli stessi tre difetti stavano, nella stessa forma, nei file tradotti. È
esattamente ciò che questo progetto ha già visto accadere con il commit `7750d38`: un difetto chiuso
in una lingua sola non è chiuso, è diventato una divergenza. Corretto anche in inglese nella stessa
giornata. Il controllo di divergenza non poteva vederlo, perché confronta struttura e date, non la
forma dei rinvii: è un vuoto di sorveglianza dichiarato, non un caso risolto.

**La classe delle àncore, mai registrata prima.** Quarantadue collegamenti inglesi portano
un'àncora verso un altro documento, e quasi tutte sono **in forma italiana** - `#3-la-busta`,
`#ctx-01--identità-e-accessi`, `#47-contesto-telemonitoraggio`. Un'àncora si ricava dal titolo di
sezione: se il titolo è tradotto, l'àncora cambia, e il rinvio punta a un ancoraggio che nella
pagina inglese non esiste. Ne risultano circa trenta pagine, quasi tutte ADR che rimandano ad
`02_architecture`. Il runbook di traduzione non prescrive nulla sulle àncore: è la lacuna che ha
prodotto la classe, e va colmata prima di bonificarla, altrimenti la prossima tornata la ricrea.

**La diagnosi dei collegamenti inglesi non è conclusa, e non la si dichiara tale.** I fatti
misurati: nessun rinvio nella forma `./` si rompe, tutti gli ottantotto rotti sono nella forma
`../`; le pagine di partenza appartengono a quattro aree sole - `protocols`, `security`,
`compliance`, `fondamenti` - che sono **esattamente le quattro aree dell'ultima tornata di
traduzione**, il commit `b3498b7`; i documenti bersaglio esistono tutti in inglese, l'insieme dei
file è identico nelle due lingue, il frontmatter è omogeneo, non ci sono BOM né fini riga
Windows, e la stessa identica riga di rinvio si rompe in un file e risolve nel file accanto.
L'URL che Docusaurus dichiara «resolved as» conserva il suffisso `.md`, quindi la risoluzione da
markdown a rotta **non avviene affatto** per quei file e il rinvio ricade sulla risoluzione per
URL. La spiegazione riferita in prima battuta - che Docusaurus applichi la rimozione dei prefissi
numerici solo alle traduzioni - **è falsa**: è stata verificata e cade, perché in italiano gli
stessi rinvii risolvono e le pagine costruite hanno gli stessi nomi nelle due lingue. La causa
resta `[NV]`. Finché non è isolata, portare i tre criteri `onBroken*` a `throw` **fermerebbe la
costruzione del sito**, quindi il secondo atto di `L-07` resta aperto e il criterio 1 di `T-07`
resta misurato ma non chiuso.

**Registro dei rischi.** Nessuna variazione di livello. Due fatti che questa giornata misura per la
prima volta, e che hanno la stessa forma: **una regola scritta e non presidiata da un controllo non
è una regola**, e **un cancello prescritto in un piano e non eseguito da uno script non è un
cancello**. `log-TRAD-1 §3.3` esisteva da prima della prima ondata; i tre cancelli del §4 di `T-06`
erano scritti e nessuno li aveva eseguiti sul corpus intero prima di dichiarare le aree complete.
Vale inoltre annotare che **l'ordine di sacrificio produce tagli per costruzione, e ogni taglio ha
l'effetto collaterale del difetto 2**: va valutato se aggiungere al §6 di
[03](./03-primo-rilascio-utilizzabile.md) l'obbligo di elencare, per ciascun `TG-nn`, i documenti da
aggiornare quando il taglio si esegue.


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
> può cablare una data unica. Come si parametrizza.»* - `ORCH` → `ROAD`

**Risposta.** Non si parametrizza una data: si **smette di dichiarare date** e si dichiara la
**disponibilità delle evidenze**.

**Primo - il prodotto dichiara evidenze, non conformità.** Per ciascuna delle evidenze elencate in
[`docs/06_security/09-ripartizione-delle-responsabilita.md`](../06_security/09-ripartizione-delle-responsabilita.md) §12
la roadmap dichiara **a partire da quale rilascio l'evidenza è disponibile**. È un fatto del prodotto, non
del cliente, ed è databile.

**Secondo - il termine del cliente è un dato di configurazione, non del piano.** La data entro cui un
utilizzatore deve aver adottato le misure discende dalla comunicazione di inserimento **che ha ricevuto
lui**. Il prodotto non la conosce e non deve conoscerla. Ciò che deve fare - ed è un requisito, non una
nota - è **non impedire** al cliente di rispettarla.

**Terzo - il momento in cui il prodotto incontra il mercato non è il termine, è il contratto.** I
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
> pubblicazione dell'avviso e differenziato per gravità.»* - `TECH` → `COMP`, `ROAD`

Quest'area **conferma la forma** e **non fissa i numeri**, che appartengono al piano di sorveglianza
post-commercializzazione. Ciò che la roadmap stabilisce, e che pone come vincolo **`V-185`**, è che **un
impegno espresso in mesi non è pianificabile e non viene accettato**: con la cadenza di rilascio osservata
sul nodo di relay - quattordici rilasci in poco più di sette mesi, cinque nel solo mese di agosto 2026 -
un impegno mensile è già scaduto quando viene pubblicato. Il livello di servizio si esprime in **giorni
dalla pubblicazione dell'avviso, differenziato per gravità**, si misura e si pubblica misurato. La
roadmap aggiunge una conseguenza di pianificazione: **la capacità necessaria a onorare quel livello di
servizio è capacità ricorrente**, e va sottratta prima di calcolare qualunque data - **sotto `D54` da una
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
| `V-183` | tutte | **Emendato da `D56`.** Il rilascio del corpo documentale è per area completa; l'obbligo delle **due lingue** resta per le aree prerequisito - avvertenze pubbliche, guida dei fondamenti, conformità, sicurezza - e per il resto vale il regime di segnalazione misurata |
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
| `Q-183` | `COMP` | Evidenze del pacchetto regolatorio consegnabili, e che cosa il fascicolo del nostro percorso conterrà | - |
| `Q-184` | `SEC`, `ARCH` | Capacità di misura come requisito del primo rilascio; valori prima del primo esercizio | Prima dell'esercizio |
| `Q-185` | `PROD`, → **ORCH** | Materiale pubblico non allineato a `D19` e `D29`; impatto **irrecuperabile** | 31 ottobre 2026 |
| `Q-186` | `COMP`, `TECH` | **Periodo di supporto dichiarato**; prerequisito della prima distribuzione e criterio bloccante | 15 ottobre 2026 |
| `Q-187` | → **ORCH** | Concentrazione ammessa su un solo integratore e momento della seconda controparte di prova | Prima del secondo integratore |
| `Q-188` | `COMP`, → **ORCH** | Riserva dichiarata per le voci non stimabili; con `D58` i cicli di non conformità sono lavoro nostro | - |
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
