---
title: Inquadramento normativo
sidebar_position: 2
description: La mappa delle norme che toccano il progetto e perché ciascuna lo tocca. Per ogni fonte, il soggetto obbligato, la data di decorrenza e se l'obbligo ricade sul progetto o su chi installa. Con la tabella artefatto → regime applicabile, il riscontro sulla ripartizione dei ruoli e le tre soglie che cambierebbero il quadro.
---

# Inquadramento normativo

> **Presupposto di lettura.** Che cosa siano un dispositivo medico, una destinazione d'uso, una
> classe di rischio, un fabbricante, un organismo notificato, una norma armonizzata è spiegato
> da zero in [10 §15 - Il quadro regolatorio da zero](../10_fondamenti/15-regolatorio-da-zero.md).
> **Qui non si ripete: si attribuisce.** Questo capitolo risponde a tre domande per ciascuna
> fonte - *chi è il soggetto obbligato*, *da quando*, *l'obbligo è del progetto o di chi
> installa* - e a nessun'altra.
>
> **Avvertenza.** Questo capitolo è analisi tecnica di conformità, **non consulenza legale né
> regolatoria**. La qualificazione giuridica di un soggetto e di un prodotto dipende da elementi
> di fatto che vanno accertati caso per caso da un professionista abilitato. Dove una fonte non è
> stata verificata su testo primario, è marcata **`[NV]`** e si dichiara che cosa va verificato e
> presso chi.

## 1. Perché una mappa e non un elenco

Un elenco di norme applicabili è inutile e pericoloso allo stesso tempo. Inutile, perché non dice
a chi fare che cosa. Pericoloso, perché produce nel lettore la convinzione di essere coperto -
oppure quella opposta, di essere schiacciato da obblighi che in realtà non lo riguardano.

La sola cosa che conta, in un progetto costruito come questo, è **l'attribuzione**. Il progetto
pubblica codice sorgente; chi lo prende e lo mette in servizio eroga prestazioni sanitarie. Sono
due posizioni giuridiche diverse, e quasi tutte le norme di questo capitolo si rivolgono alla
seconda. La confusione fra le due è l'errore più costoso che questa documentazione possa
commettere, in entrambe le direzioni: attribuire al progetto un obbligo che non ha significa
paralizzarlo; attribuire a chi installa un obbligo che il progetto avrebbe dovuto soddisfare
significa consegnargli un prodotto non certificabile.

### 1.1 La regola di attribuzione, in tre domande

Ogni sezione di questo capitolo applica la stessa procedura, nello stesso ordine:

1. **Chi è il soggetto obbligato secondo la definizione della norma?** Non «chi è coinvolto», non
   «chi ne trae beneficio»: chi la norma nomina.
2. **Il progetto integra oggi quella definizione?** La risposta è quasi sempre no, ed è una
   risposta **di fatto**, non di principio.
3. **Quali fatti la farebbero integrare?** È la parte che va scritta, perché è la sola che rende
   la risposta 2 verificabile nel tempo invece che una formula ripetuta.

### 1.2 Legenda dell'attribuzione

Si adotta la stessa legenda dell'area di sicurezza, per non introdurre un secondo vocabolario:

| Sigla | Significato |
|---|---|
| **P** | **Progetto.** L'obbligo - o la porzione tecnica che lo rende soddisfacibile - è del progetto |
| **D** | **Chi installa, integra o mette in servizio.** Il progetto può fornire evidenze, modelli e capacità tecniche; non può sostituirsi |
| **P+D** | **Condivisa.** Entrambe le parti hanno una porzione, e **la porzione dell'una non copre quella dell'altra** |
| **-** | Non applicabile all'oggetto della riga |

**Una riga marcata `P` non esonera chi installa**: gli impone di verificare che la configurazione
distribuita non abbia disattivato ciò che il prodotto attua, e di conservarne l'evidenza. Una riga
marcata `D` non significa che il progetto se ne disinteressi: significa che il suo contributo è
documentale. Il dettaglio misura per misura, per la sola sicurezza, è in
[06 §09 - Ripartizione delle responsabilità](../06_security/09-ripartizione-delle-responsabilita.md),
che **quest'area riprende e non ridiscute**.

### 1.3 Il fatto da cui dipende quasi tutto

Il progetto non ha, oggi, obblighi diretti sotto la maggior parte delle fonti di questo capitolo,
e la ragione è una sola e sempre la stessa: **non svolge un'attività commerciale e non immette
nulla sul mercato**. Non vende, non offre servizi gestiti, non fattura supporto, non monetizza.

Questo fatto:

- **non dipende dalla licenza.** Nessuna licenza conferisce immunità, e l'argomento «è open
  source, quindi non è immissione sul mercato» è giuridicamente infondato: l'art. 2, punto 27,
  del Regolamento (UE) 2017/745 definisce la messa a disposizione sul mercato come qualsiasi
  fornitura «a titolo oneroso **o gratuito**» nel corso di un'attività commerciale;
- **non dipende dalla volontà di chi scrive la documentazione.** È accertabile da un terzo;
- **è revocabile.** Tre soglie lo cambierebbero, e sono elencate al § 12.

Ne discende la regola redazionale che governa tutta l'area: **la posizione del progetto si scrive
sempre al presente e con la sua condizione**, mai come proprietà permanente. «Il progetto non è
fabbricante» è falso se non accompagnato dal perché. La formulazione corretta è: *il progetto non
è fabbricante perché non commercializza alcun dispositivo apponendovi il proprio nome, e cesserà
di non esserlo nel momento in cui lo facesse*.

## 2. Regolamento (UE) 2017/745 - dispositivi medici

**Perché tocca il progetto.** Perché il perimetro funzionale comprende il telemonitoraggio con
valutazione delle soglie configurate dal professionista, e quella funzione - non il video, non la
persistenza, non il trasporto - costituisce *interpretazione* del dato ai sensi di MDCG 2019-11
Rev.1, Allegato I, lett. d.1). Il ragionamento completo è nel capitolo
[02 - Qualificazione e classificazione](./02-qualificazione-e-classificazione.md).

| Voce | Contenuto |
|---|---|
| **Soggetto obbligato** | Il **fabbricante** (art. 2, punto 30: chi fabbrica o fa fabbricare un dispositivo **e lo commercializza apponendovi il proprio nome o marchio**), con obblighi propri per mandatario (art. 11), importatore (art. 13) e distributore (art. 14) |
| **Da quando** | Applicabile dal **26 maggio 2021**, in sostituzione della Direttiva 93/42/CEE |
| **Attribuzione** | **D** per l'intero blocco degli obblighi dell'art. 10. **P** per il solo materiale che rende quegli obblighi soddisfacibili da chi li assume |

**Il punto di attribuzione, per esteso.** L'art. 2, punto 30, richiede **due elementi cumulativi**:
far progettare o fabbricare il dispositivo, **e** commercializzarlo col proprio nome. Il progetto
soddisfa al più il primo. Non esiste nell'MDR una figura di «co-fabbricante per contribuzione»:
chi propone una modifica al codice non commercializza nulla e non appone alcun marchio.

L'art. 16, paragrafo 1, lettera a), aggiunge la fattispecie che riguarda direttamente il modello
di integrazione di questo progetto: chi mette a disposizione un dispositivo **con il proprio nome,
la propria denominazione commerciale o il proprio marchio registrato** assume gli obblighi che
incombono ai fabbricanti. È letteralmente la fattispecie del prodotto in marchio bianco, che è la
modalità di integrazione principale prevista dal progetto. L'integratore che incorpora il
componente nel proprio prodotto e lo presenta ai propri clienti **è fabbricante per legge**, e non
per scelta contrattuale.

**Gazzetta ufficiale.** La ricognizione della norma applicabile, della data di entrata in vigore
e dei considerando rilevanti vanno verificate su fonte primaria; **`[NV]`** su fonte primaria,
da verificare da `COMP`.

**Che cosa produce il progetto e il ruolo che intende assumere.** Da `D58` il progetto
intende assumere il ruolo di fabbricante, e con `D63` la marcatura al termine di una valutazione
della conformità conclusa è un **requisito di prodotto**; il soggetto giuridico è ancora da
costituire. La
decisione `D58` allarga il perimetro della decisione `D49`: il progetto produce e pubblica il
fascicolo tecnico, la documentazione di ciclo di vita ai sensi di IEC 62304, la gestione del
rischio ai sensi di ISO 14971 e il file di ingegneria dell'usabilità ai sensi di IEC 62366-1
come materiale che rende il percorso di valutazione della conformità possibile. Quando il soggetto
fabbricante sarà costituito, assumerà gli atti riservati al ruolo: ingaggerà organismi
notificati, condurrà la valutazione clinica e apporrà la marcatura CE. Oggi il progetto non reca
marcatura CE, non è coperto da alcuna dichiarazione di conformità e non è utilizzabile per
l'erogazione di prestazioni sanitarie su pazienti reali. La ragione per cui questo materiale **non
è recuperabile a posteriori** (`D45`) è quella di sempre: la sua assenza renderebbe impossibile a
*chiunque* certificare in seguito, indipendentemente da chi assuma il ruolo di fabbricante.
Il capitolo [04 - Fascicolo tecnico](./04-fascicolo-tecnico.md) elenca voce per voce che cosa
questo significa.

**L'esenzione dell'art. 5, paragrafo 5, va menzionata solo per escluderla.** I dispositivi
fabbricati e utilizzati esclusivamente all'interno di istituzioni sanitarie dell'Unione sono
sottratti alla maggior parte del regolamento, a condizione - fra le altre - che non siano ceduti
ad altra persona giuridica e che l'istituzione **giustifichi che le esigenze del gruppo di
pazienti non possono essere soddisfatte da un dispositivo equivalente disponibile sul mercato**.
Un'azienda sanitaria che installa un prodotto sviluppato da terzi **non lo ha fabbricato**, e la
condizione sull'assenza di equivalenti sul mercato è insostenibile per la telemedicina. È una via
d'uscita apparente, invocata impropriamente in sede di gara: la documentazione del progetto non la
avalla.

**L'art. 7 vale già oggi, e vale sul repository.** Il divieto di dichiarazioni fuorvianti su
destinazione d'uso, sicurezza e prestazioni - «in particolare attribuendo funzioni e proprietà che
il dispositivo non possiede» - non presuppone la marcatura. Insieme all'art. 2, punto 12, che fa
del materiale promozionale una fonte da cui si ricava giuridicamente la destinazione d'uso,
produce il vincolo **[V-171](../11_registri/01-vincoli-in-vigore.md#v-171)** del § 11: nessun artefatto pubblico del progetto può contenere
formule che affermino o lascino intendere una conformità che non esiste.

## 3. Regolamento (UE) 2016/679 - protezione dei dati

**Perché tocca il progetto.** Perché il sistema tratta dati relativi alla salute ai sensi
dell'art. 4, punto 15, e perché **il solo fatto che una persona abbia una sessione con uno
specialista è già dato relativo alla salute**, prima e indipendentemente dal contenuto della
sessione. Il presupposto è enunciato in
[06 §00 - Sicurezza, indice e orientamento](../06_security/00-indice.md) e non si ridiscute qui.

| Voce | Contenuto |
|---|---|
| **Soggetto obbligato** | **Titolare** e **responsabile** del trattamento, come definiti dagli artt. 4, punti 7 e 8, e 24, 26, 28 |
| **Da quando** | Applicabile dal **25 maggio 2018** |
| **Attribuzione** | **D** per la totalità degli adempimenti. **P** per le sole capacità tecniche senza le quali gli adempimenti non sono materialmente eseguibili |

**Il progetto non è titolare né responsabile: non tratta dati.** Fornisce codice. Il ruolo si
determina in base a chi decide finalità e mezzi (art. 4, punti 7 e 8) e **non si sceglie per
contratto**: il contratto ne prende atto. Nel momento in cui esiste un'installazione che tratta
dati, i ruoli sono fra l'integratore, i suoi clienti e i suoi fornitori. La casistica è già
mappata in
[07 §09 - Obblighi di chi integra, §3.1](../07_integration/09-obblighi-di-chi-integra.md) e
questo capitolo la **conferma** al § 10.

**Quattro punti di raccordo che appartengono a quest'area e non all'area dati.**

1. **La valutazione del rischio ai sensi di ISO 14971 e la valutazione d'impatto ai sensi
   dell'art. 35 sono due esercizi diversi e non si fondono.** La prima riguarda il **danno alla
   persona**; la seconda i **rischi per i diritti e le libertà**. Un rischio può essere
   accettabile nella prima e inaccettabile nella seconda, e viceversa. Si collegano - la
   valutazione d'impatto attinge al catalogo dei rischi - ma un unico documento che pretenda di
   servire a entrambe è un documento che l'organismo notificato contesta e l'autorità di controllo
   non riconosce.
2. **La protezione fin dalla progettazione (art. 25) si rivolge al titolare, non al produttore.**
   Il considerando 78 chiama in causa i produttori, ma non crea in capo a essi un obbligo diretto.
   Ciò che ne discende per il progetto è comunque vincolante sul piano del prodotto, perché sono
   impostazioni che **nessun titolare può ricostruire dopo**: registrazione disattivata per
   impostazione predefinita, conservazione minima predefinita, registri privi di contenuto clinico
   per impostazione predefinita (vincolo [`V-150`](../11_registri/01-vincoli-in-vigore.md#v-150) di `SEC`).
3. **La valutazione d'impatto è dovuta** per un trattamento su larga scala di dati relativi alla
   salute con tecnologie nuove: i presupposti dell'art. 35, paragrafo 3, lettera b), sono
   ampiamente integrati. È del cliente. Fornirne il materiale strutturale - descrizione del
   trattamento, diagrammi dei flussi, catalogo dei rischi, elenco delle misure con la prova
   automatica che le verifica - è simultaneamente un servizio e un vantaggio competitivo.
4. **L'art. 32 chiede una procedura per testare e valutare regolarmente l'efficacia delle
   misure**, non le misure. È la differenza fra un elenco e un processo, ed è ciò che rende la
   pipeline di verifica automatica del progetto un'evidenza di conformità e non un dettaglio
   ingegneristico.

**Termini di conservazione che non sono negoziabili** e che si citano qui perché sono di fonte
settoriale e non generale: **ventiquattro mesi** per i registri di tracciabilità e **dodici mesi**
per i dati di accesso e autenticazione, ai sensi del DM 19 novembre 2025, Allegato 4 (vincolo
[`V-152`](../11_registri/01-vincoli-in-vigore.md#v-152) di `SEC`).

## 4. Direttiva (UE) 2022/2555 e d.lgs. 4 settembre 2024, n. 138 - sicurezza delle reti

**Perché tocca il progetto.** Non perché il progetto vi sia soggetto - quasi certamente non lo è -
ma perché **i suoi utilizzatori lo sono**, e riversano contrattualmente sul fornitore una parte
consistente dei propri obblighi. Il meccanismo, i codici delle misure e la ripartizione sono
trattati per esteso in
[06 §08 - Quadro normativo e misure](../06_security/08-quadro-normativo-e-misure.md) e
[06 §09](../06_security/09-ripartizione-delle-responsabilita.md): **quest'area non li ridecide e
non li riscrive.** Qui si fissano soltanto i tre elementi di attribuzione.

| Voce | Contenuto |
|---|---|
| **Soggetto obbligato** | Soggetti **essenziali** e **importanti** dei settori individuati dagli allegati del d.lgs. 138/2024, fra cui la **sanità** (Allegato I) e la **fabbricazione di dispositivi medici** (Allegato II) |
| **Da quando** | Il decreto è in vigore dal **16 ottobre 2024**. Il termine per le misure è **soggettivo**: diciotto mesi dalla ricezione della comunicazione di inserimento nell'elenco (Determinazione ACN n. 379907 del 19 dicembre 2025, art. 3, comma 1), applicabile dal **15 gennaio 2026** (art. 9, comma 3). Per i soggetti inseriti nel 2026: misure entro il **31 luglio 2027**, notifiche dal **1° gennaio 2027** (Determinazione n. 127434 del 13 aprile 2026) |
| **Attribuzione** | **D** per la totalità degli adempimenti verso l'autorità. **P+D** per venti delle quarantatré misure. **P** per cinque |

**Tre conseguenze che appartengono a questo capitolo.**

**Primo: il termine non è una data e non si cabla.** «Il 31 ottobre 2026» non compare in alcun
atto: è il limite esterno della prima ondata. La conformità del prodotto va **parametrizzata sul
termine del singolo utilizzatore**. Nessun documento di quest'area, e nessuna roadmap, può
dichiarare una data di adeguamento, perché la data appartiene al cliente.

**Secondo: la sovranità del dato è diventata un campo obbligatorio verso un'autorità.** L'art. 18
della Determinazione n. 127437/2026 obbliga il soggetto a dichiarare nominativamente i «fornitori
rilevanti» con ragione sociale, codice fiscale, **Paese della sede legale**, codici della
nomenclatura degli appalti e criterio di rilevanza. Il vincolo [`V1`](../11_registri/03-vincoli-fondanti.md#v1) del progetto - nessun
componente obbligatorio del percorso principale stabilito fuori dall'Unione - cessa quindi di
essere un argomento di posizionamento: **introdurre una dipendenza di esecuzione extra-UE è un
dato che finisce in una dichiarazione ufficiale di qualcun altro.**

**Terzo: esiste un conflitto fra i due regimi, e l'autorità lo riconosce.** Installare protezioni
di endpoint su un dispositivo medico «ne potrebbe invalidare la certificazione». La deroga esiste
ma richiede misure compensative documentate, **che deve fornire il fornitore**, perché solo il
fornitore sa quali componenti sono coperti dalla marcatura e quale alterazione la invaliderebbe. È
un deliverable del progetto, non un problema del cliente: la *dichiarazione tecnica di deroga* è
descritta in [06 §08 §6](../06_security/08-quadro-normativo-e-misure.md).

**Regola di citazione che quest'area eredita e rispetta.** Gli allegati di dettaglio della
determinazione non sono stati letti riga per riga (questione [`Q-151`](../11_registri/02-questioni-aperte.md#q-151)). **Nessun requisito puntuale
delle misure di base è citato testualmente in alcun documento di quest'area.** Ciò che si cita
sono i codici, la ripartizione fra le due tipologie di soggetto e l'aritmetica del catalogo, che
sono verificati.

### 4.1 Legge 28 giugno 2024, n. 90 - il secondo regime nazionale

Si affianca al precedente e non lo sostituisce. Riguarda le pubbliche amministrazioni, **incluse
le aziende sanitarie**.

| Voce | Contenuto |
|---|---|
| **Soggetto obbligato** | Le amministrazioni e i soggetti indicati dalla legge, fra cui le aziende sanitarie locali |
| **Da quando** | Vigente |
| **Attribuzione** | **D** per gli adempimenti; **P** per l'evidenza tecnica che li rende eseguibili |

Tre elementi rilevanti per il prodotto:

- **art. 1** - segnalazione entro **ventiquattro ore** dalla conoscenza e notifica completa entro
  **settantadue ore**;
- **art. 8** - nomina del **referente per la cybersicurezza**, adempimento organizzativo del
  cliente;
- **art. 14** - contratti pubblici di beni e servizi informatici in contesti connessi alla tutela
  degli interessi nazionali strategici: obbligo di tenere conto degli **elementi essenziali di
  cybersicurezza**, individuati dal DPCM 30 aprile 2025 (GU del 5 maggio 2025) come modificato dal
  DPCM 2 ottobre 2025, con **criteri di premialità** anche geografici. I testi dei due DPCM vanno
  verificati su Normattiva per accertare il contenuto esatto; **`[NV]`** va chiesto a un
  consulente di appalti se una fornitura di telemedicina ricada nelle categorie tecnologiche
  dell'allegato, dato che l'elenco non nomina il software sanitario ma comprende i **servizi
  cloud**: la qualificazione richiede competenza di gara, non solo lettura normativa.

**La conseguenza operativa che conta più di tutte, ed è una sola: le risposte del fornitore
saranno valutate contro requisiti chiusi - sì o no, con evidenza - non contro narrazioni.** Le
linee guida nazionali sugli approvvigionamenti raccomandano alle amministrazioni di formulare i
requisiti in modo «chiaro, oggettivo e quanto più possibile chiuso». La documentazione di
conformità del progetto è perciò strutturata come **matrice requisito → evidenza → riferimento
puntuale**, che è esattamente la struttura richiesta dalla tracciabilità del ciclo di vita: **un
artefatto per due scopi**, non due artefatti.

## 5. Regolamento (UE) 2024/2847 - resilienza informatica dei prodotti

**Perché tocca il progetto.** Perché l'esclusione dell'art. 2, paragrafo 2 - che sottrae al
regolamento i prodotti già coperti dall'MDR e dall'IVDR - **opera per prodotto, non per soggetto e
non per progetto**. Il confine passa quindi *dentro* il perimetro degli artefatti prodotti, e non
coincide con nessuno dei confini già tracciati.

| Voce | Contenuto |
|---|---|
| **Soggetto obbligato** | Il **fabbricante** del prodotto con elementi digitali; con obblighi alleggeriti per il **custode di software open source** (art. 3, punto 14, e art. 24), che deve essere una **persona giuridica** |
| **Da quando** | In vigore dal **10 dicembre 2024**. Capo sugli organismi di valutazione della conformità dall'**11 giugno 2026**; obblighi di segnalazione dell'art. 14 dall'**11 settembre 2026**; applicazione generale, requisiti essenziali e marcatura dall'**11 dicembre 2027** (art. 71) |
| **Attribuzione** | **D** per gli obblighi di fabbricante. **P** per la produzione degli artefatti che li rendono soddisfacibili, adottati **volontariamente e senza invocare esenzioni** (`D27`) |

**Perché il progetto non invoca esenzioni.** Non per prudenza: perché l'insieme minimo che
l'integratore-fabbricante chiederà comunque per la propria diligenza dovuta - distinta dei
materiali leggibile da macchina, politica di divulgazione coordinata, canale di contatto, periodo
di supporto dichiarato, aggiornamenti gratuiti e tempestivi - **è lo stesso che soddisfa
ISO/IEC 81001-5-1, i questionari di sicurezza dei clienti sanitari e le misure sulla catena di
fornitura del regime sulle reti**. Costruirlo una volta soddisfa quattro regimi; costruirlo
quattro volte è l'errore che la matrice di
[06 §08 §8](../06_security/08-quadro-normativo-e-misure.md) esiste per impedire.

### 5.1 Tabella artefatto → regime applicabile

**Questa tabella chiude la questione [`Q-10`](../11_registri/02-questioni-aperte.md#q-10) della bacheca ed è il contributo richiesto da `D41`.**
La sua formalizzazione come documento di decisione architetturale resta la questione [`Q-24`](../11_registri/02-questioni-aperte.md#q-24),
indirizzata all'orchestrazione: **la tabella esiste, l'atto formale che la adotta no.**

| # | Artefatto | Dispositivi medici | Resilienza informatica | Motivazione |
|---|---|:-:|:-:|---|
| A1 | **Repository di codice sorgente**, mantenuto fuori da attività commerciale | - | - | Non è prodotto immesso sul mercato; il titolare, in quanto **persona fisica**, non può essere custode di software open source, figura riservata a una persona giuridica (art. 3, punto 14) |
| A2 | **Distribuzione identificata marcata CE** ai sensi dell'MDR | **●** | - | Esclusa dall'art. 2, par. 2. I requisiti di cibersicurezza arrivano dall'Allegato I, §§ 17.2 e 17.4, dell'MDR |
| A3 | **Kit di sviluppo client** distribuito separatamente | - | **●** | Non è il dispositivo e non è coperto dalla marcatura; se immesso sul mercato nel corso di un'attività commerciale è prodotto con elementi digitali autonomo |
| A4 | **Componente incorporabile**, quando distribuito come artefatto a sé | - | **●** | Idem A3. Se invece è **parte della distribuzione marcata**, segue A2: la collocazione dipende dal perimetro della marcatura, non dal nome del pacchetto |
| A5 | **Immagini di contenitore e pacchetti di distribuzione** non coperti dalla marcatura | - | **●** | Idem A3 |
| A6 | **Moduli sostituibili** forniti dall'integratore | - | dipende | Non sono artefatti del progetto: il regime è dell'integratore, e va determinato sul suo perimetro |
| A7 | **Prodotto commerciale dell'integratore** che incorpora il progetto | dipende | dipende | L'integratore è **fabbricante** per ciò che immette sul mercato; se il suo prodotto è dispositivo, vale l'esclusione, altrimenti no |
| A8 | **Documentazione, sito, materiale pubblico** | - | - | Non è prodotto. Ma è **materiale regolatorio** ai sensi dell'art. 2, punto 12, dell'MDR: v. § 11 |

**Le tre letture che questa tabella impedisce.**

1. «Siamo un dispositivo medico, quindi il regolamento sulla resilienza non ci riguarda» - falso
   per A3, A4, A5.
2. «Non siamo un dispositivo medico, quindi non abbiamo obblighi di cibersicurezza» - falso: è
   esattamente la condizione che fa entrare il prodotto nell'altro regime dall'11 dicembre 2027.
3. «La licenza trasferisce gli obblighi a chi riceve il codice» - falso in radice. **Nessuna
   clausola di esclusione di garanzia sposta sul ricevente la responsabilità di un regolamento.**
   Chi integra in un prodotto commerciale è fabbricante per legge, indipendentemente da quanto
   scritto nella licenza.

## 6. Direttiva (UE) 2024/2853 - responsabilità per danno da prodotti difettosi

**Perché tocca il progetto.** Perché è l'unica fonte di questo capitolo che opera **verso il
danneggiato**, cioè verso una persona che non ha accettato alcuna licenza e non ha firmato alcun
contratto. Nel dominio della telemedicina il danneggiato è tipicamente **l'assistito**.

| Voce | Contenuto |
|---|---|
| **Soggetto obbligato** | Gli **operatori economici**: fabbricante del prodotto, fabbricante di un componente, importatore, mandatario, distributore, con la gradazione prevista dalla direttiva |
| **Da quando** | Termine di recepimento **9 dicembre 2026**; si applica ai prodotti immessi sul mercato o messi in servizio **dopo** tale data. Questo progetto nasce quindi dentro il nuovo regime |
| **Attribuzione** | **D**, con una riserva importante: l'esenzione per il software libero vale solo per il software «sviluppato o fornito **al di fuori di un'attività commerciale**», ed è quindi la stessa condizione del § 1.3 |

**I quattro punti da cui non si può prescindere**, e che quest'area recepisce senza attenuazioni
dalla decisione `D28`:

1. **Il software è un prodotto**, indipendentemente dalla modalità di fornitura: autonomo,
   incorporato, in cloud, come servizio. Il file sorgente in quanto tale è invece considerato
   informazione e non prodotto. La formulazione letterale dell'art. 4 e dei considerando pertinenti
   della Direttiva (UE) 2024/2853 vanno verificati su fonte primaria nella Gazzetta ufficiale
   dell'Unione europea; **`[NV]`** su fonte primaria, da verificare da `COMP`.
2. **La difettosità si presume** quando è dimostrato che il prodotto non è conforme a **requisiti
   obbligatori di sicurezza previsti dal diritto dell'Unione** destinati a proteggere dal rischio
   verificatosi (art. 10). Fra questi rientrano, secondo i casi, i requisiti dell'Allegato I
   dell'MDR, i requisiti essenziali del regolamento sulla resilienza e l'art. 32 del regolamento
   sui dati. **Una non conformità regolatoria diventa una presunzione di difettosità in sede
   civile**: è l'anello che collega l'intero capitolo a una conseguenza patrimoniale.
3. **L'esclusione contrattuale non opera verso il danneggiato** (art. 15). Le clausole §§ 7 e 8
   della licenza Apache-2.0 sono espressamente subordinate al diritto imperativo e restano
   efficaci **fra le parti della licenza**, per la responsabilità contrattuale e il danno
   economico puro. Non proteggono da: azioni della persona danneggiata, responsabilità
   regolatoria, responsabilità per dolo o colpa grave. La numerazione della norma italiana
   equivalente dopo il recepimento della Direttiva (UE) 2024/2853 sarà determinata dal decreto
   legislativo e va verificata su Normattiva; **`[NV]`** sulla norma nazionale equivalente, da
   verificare da `COMP`.
4. **Un prodotto sicuro alla data del rilascio può diventare difettoso in seguito**, quando chi ne
   mantiene il controllo non fornisce gli aggiornamenti di sicurezza necessari. Per un servizio
   gestito il controllo è permanente. **La mancata correzione di una vulnerabilità nota è, in
   questo regime, difettosità**: è la ragione per cui il livello di servizio di aggiornamento e il
   periodo di supporto dichiarato non sono impegni commerciali, ma elementi di esposizione.

**L'unica difesa realisticamente disponibile a chi fornisce un componente** è l'art. 11: il
fabbricante di un componente non risponde se dimostra che il difetto è imputabile alla
progettazione del prodotto in cui il componente è stato integrato **o alle istruzioni del
fabbricante di quel prodotto**. Opera solo se le istruzioni del componente erano **corrette e
complete**. Ne discende che i requisiti dell'ambiente operativo, la documentazione di integrazione
e la dichiarazione di stato regolatorio non sono adempimenti formali: **sono la prova su cui
poggia l'unica difesa disponibile**, e vanno trattate come tali nel fascicolo tecnico
([04 §3](./04-fascicolo-tecnico.md)).

Va detto anche il rovescio, perché è vero: la direttiva costruisce presunzioni contro chi **non è
in grado di esibire evidenze**. Un progetto con distinta dei materiali firmata, tracciabilità
requisito-prova, registro dei rischi pubblico, cronologia delle modifiche firmata e processo
documentato di gestione delle vulnerabilità è, sul piano probatorio, in posizione
**strutturalmente migliore** di un prodotto chiuso che deve ricostruire le proprie evidenze in
giudizio. **In questo regime la trasparenza è una difesa**, non un rischio.

## 7. Regolamento (UE) 2025/327 - spazio europeo dei dati sanitari

**Perché tocca il progetto, ed è il punto meno intuitivo dell'intero capitolo.** Perché il capo
III introduce un regime di conformità - documentazione tecnica, dichiarazione di conformità,
marcatura CE, **di regola senza organismo notificato** - per i **sistemi di cartella clinica
elettronica**, definiti in funzione della finalità di archiviare, intermediare, esportare,
importare, convertire, modificare o visualizzare dati sanitari elettronici personali appartenenti
alle categorie prioritarie. **Un prodotto può ricadere nel capo III pur non essendo un dispositivo
medico.**

| Voce | Contenuto |
|---|---|
| **Soggetto obbligato** | Il **fabbricante del sistema di cartella clinica elettronica**; obblighi specifici per importatori e distributori |
| **Da quando** | In vigore dal **26 marzo 2025**; applicazione generale dal **26 marzo 2027**; il **capo III dal 26 marzo 2029**, e dal **26 marzo 2031** per i sistemi di cui all'art. 26, paragrafo 2. La mappatura esatta delle date per ciascuna disposizione va confermata sull'articolo finale del regolamento su EUR-Lex, verificando i testi in entrambe le lingue, dato che le fonti secondarie consultate divergono. **`[NV]`** da verificare da `COMP` |
| **Attribuzione** | **D**. Con l'avvertenza che l'orizzonte 2029–2031 **non autorizza a rinviare la progettazione**, perché ciò che il capo III chiede è strutturale |

**Perché la valutazione del progetto è che il capo III lo riguardi con elevata probabilità.** Il
sistema archivia contenuti riconducibili alle categorie prioritarie - referti, risultati,
documenti di sintesi -, li esporta e li importa verso il sistema dell'integratore, e li converte
in un formato di interscambio. Sono esattamente le funzioni che il capo III intende disciplinare.
La conclusione è tratta dalla definizione riportata in fonte secondaria e va confermata con lettura
diretta delle definizioni dell'art. 2 e del capo III sul testo del Regolamento (UE) 2025/327 in
Gazzetta ufficiale; **`[NV]`** su fonte primaria, da verificare da `COMP`.

**Il raccordo con il regime dei dispositivi è già scritto dalla linea guida.** MDCG 2019-11
Rev.1, Allegato I, lett. c.1), riporta il considerando 42 del regolamento: quando un software
dispositivo medico **dichiara interoperabilità** con un sistema di cartella clinica elettronica, i
requisiti essenziali di interoperabilità si applicano a quel dispositivo, e le specifiche comuni
per i sistemi di cartella clinica valgono anche per esso. Tradotto per questo progetto: **la
dichiarazione di interoperabilità, che è un argomento commerciale centrale, è anche un fatto
regolatorio con conseguenze proprie.**

Due conseguenze di programma, entrambe attuali:

1. **L'architettura dei dati va progettata oggi** per le categorie prioritarie e per i formati di
   interscambio europei, che è precisamente ciò che il modello a dataset canonico con
   serializzazioni sostituibili ([`V-07`](../11_registri/01-vincoli-in-vigore.md#v-07)) rende possibile senza riscritture.
2. **La posizione del prodotto rispetto a questo regolamento va dichiarata**, come la stessa
   sezione 7 della linea guida richiede: occorre comunicare esattamente quali moduli
   costituiscono il prodotto e se il prodotto o qualcuno dei suoi moduli è soggetto alla
   disciplina dei dispositivi o **ad altra legislazione applicabile**. Non dichiararlo è di per sé
   una non conformità documentale.

Resta aperta una questione di perimetro che non è di quest'area: **se il progetto debba produrre
anche il pacchetto documentale del capo III**, raddoppiando in parte lo sforzo. È la questione
[`Q-171`](../11_registri/02-questioni-aperte.md#q-171), indirizzata all'orchestrazione.

## 8. Accessibilità

**Perché tocca il progetto.** Perché l'accessibilità qui **non è un'attenzione, è una norma con
sanzione**, ed è al tempo stesso una **misura di controllo del rischio d'uso** ai sensi di
IEC 62366-1: un controllo di consenso che un lettore di schermo non annuncia non è un controllo
scomodo, è un controllo che per quell'utente **non esiste**.

| Fonte | Soggetto obbligato | Da quando | Attribuzione |
|---|---|---|---|
| **Direttiva (UE) 2019/882**, recepita con **d.lgs. 27 maggio 2022, n. 82** | Operatori economici che immettono sul mercato i prodotti e i servizi elencati | Prodotti e servizi immessi sul mercato dal **28 giugno 2025** | **D**, con l'avvertenza del paragrafo seguente |
| **Direttiva (UE) 2016/2102**, recepita in Italia dalla **legge 9 gennaio 2004, n. 4** e dalle linee guida dell'agenzia nazionale | Enti pubblici | Vigente | **D** quando il cliente è una pubblica amministrazione - cioè nel caso d'uso principale |
| **EN 301 549** | Norma tecnica di riferimento, incorpora **WCAG 2.1 livello AA** nelle clausole 9, 10 e 11 | - | **P** per il prodotto, **D** per la dichiarazione di accessibilità del servizio |

**L'ambito soggettivo della prima riga è la parte delicata, e va detta com'è: la telemedicina non
è nominata** fra le categorie di prodotti e servizi coperti dall'Accessibility Act. Il prodotto vi
ricadrebbe indirettamente, se venduto tramite un canale di commercio elettronico rivolto ai
consumatori, o eventualmente come componente di un servizio di comunicazione elettronica. La
qualificazione di un servizio di videoconsulto come «servizio di comunicazione interpersonale
indipendente dal numero» è controversa e non è stata accertata; **`[NV]`** merita analisi specifica
con interlocuzione con autorità competenti prima di essere affermata o negata in un documento
contrattuale, da compiere da `COMP`. La via **diretta e sicura** è la terza riga: quando il cliente è pubblico,
l'obbligo esiste senza bisogno di percorrere la prima.

**Perché il requisito del progetto va oltre WCAG, ed è il punto che un'analisi WCAG non
intercetta.** EN 301 549 contiene requisiti che non derivano da WCAG e che riguardano proprio una
piattaforma di videocomunicazione: la **clausola 6** (comunicazione bidirezionale vocale) impone
qualità audio, **comunicazione in tempo reale con testo** quando è supportata la voce,
identificazione del chiamante e - per la videocomunicazione - **risoluzione, frequenza dei
fotogrammi e sincronizzazione labiale sufficienti per la lingua dei segni**. Per un servizio
sanitario destinato anche a persone sorde non sono dettagli.

La versione di EN 301 549 citata nella *Gazzetta ufficiale dell'Unione europea* a supporto
dell'Accessibility Act va verificata su quella fonte primaria; **`[NV]`** da verificare in Gazzetta
ufficiale, da compiere da `COMP`. Fino a quel momento il riferimento giuridicamente efficace resta
la versione effettivamente citata, e la dichiarazione di accessibilità del progetto deve indicare
la versione su cui è stata condotta la verifica, non «EN 301 549» in astratto.

Il progetto dichiara una sola non conformità, sul criterio relativo ai sottotitoli in tempo reale,
con l'interprete come misura alternativa (`D24`). **Dichiarare una non conformità è legittimo;
averla senza dichiararla non lo è.**

## 9. Il quadro italiano della telemedicina

**Perché tocca il progetto.** Perché è la fonte da cui derivano le **definizioni** delle
prestazioni, i **requisiti funzionali** dell'infrastruttura, i **livelli di servizio**, le
**tipologie documentali** e - in due punti espressi - l'**obbligo di certificazione come
dispositivo medico**, che arriva dal capitolato di gara indipendentemente dall'esito dell'analisi
di qualificazione europea.

Il vocabolario delle prestazioni e il funzionamento del fascicolo sono nei moduli
[10 §02](../10_fondamenti/02-prestazioni-di-telemedicina.md) e
[10 §07](../10_fondamenti/07-fse-e-infrastrutture-nazionali.md); il modello di dominio che ne
discende è in [05 - Il dominio sanitario](../05_domain/00-indice.md). **Qui si elencano solo gli
atti, con la loro forza e la loro attribuzione.**

| Atto | Che cosa impone che rilevi qui | Attribuzione |
|---|---|---|
| **Accordo Stato-Regioni 17 dicembre 2020, rep. atti n. 215/CSR**, Allegato A | Definizioni canoniche delle prestazioni; condizioni tassative di erogabilità della televisita; **obbligo di referto** con indicazione dei collaboratori partecipanti e della **qualità del collegamento con conferma di idoneità**; **cifratura di tutti i trasferimenti** di voce, video, immagini e file; adesione preventiva dell'assistito; obbligo di completare in modalità tradizionale se lo strumento non consente di mantenere inalterato il contenuto della prestazione; certificazione dell'hardware e/o del software come dispositivo medico «idonea alla tipologia di prestazione» | **D** per l'erogazione; **P** per le capacità: il campo della qualità del collegamento, la cifratura, il ripiego dichiarato |
| **DM 23 maggio 2022, n. 77** | Colloca la telemedicina dentro il modello organizzativo territoriale. Non detta requisiti software: **determina il contesto** in cui la prestazione è appropriata (percorsi assistenziali programmati) | **D** |
| **DM 21 settembre 2022** (GU n. 256 del 2 novembre 2022, atto 22A06184), Allegato A | L'atto **tecnicamente più prescrittivo**: quattro servizi minimi; architettura a microservizi; architettura a eventi; interoperabilità su modello FHIR; contenitori; modelli di distribuzione **su territorio nazionale**; **paradigma mobile first**; multilingua; conformità alle linee guida di design dei servizi digitali pubblici e a quelle sull'accessibilità; presenza organizzativa obbligatoria di **Centro servizi** tecnico e **Centro erogatore** sanitario; livelli di servizio di manutenzione correttiva vincolanti per i fornitori; **obbligo di certificazione come dispositivo medico** per il telemonitoraggio e per *viewer* e refertazione nei teleconsulti istopatologici e radiologici | **P+D**: i requisiti tecnici sono di prodotto, la presenza dei due centri e i livelli di servizio sono organizzativi |
| **DM 30 settembre 2022** (GU n. 298 del 22 dicembre 2022, atto 22A07125) | Disciplina la selezione delle soluzioni: piani operativi regionali, commissione tecnica, **acquisto esclusivamente attraverso le gare delle regioni capofila** nel perimetro del piano nazionale. Allegato B: la televisita erogata da medico di assistenza primaria o pediatra **non richiede prescrizione** e produce **annotazione digitale in luogo del referto** (vincolo [`V-145`](../11_registri/01-vincoli-in-vigore.md#v-145) di `DOM`) | **D**, con effetto determinante sulla via di accesso al mercato pubblico |
| **DM 7 settembre 2023** (GU n. 249 del 24 ottobre 2023) | Quadro del fascicolo sanitario elettronico: contenuti, soggetti, consensi, alimentazione, consultazione. **Art. 15, comma 4: esclusione permanente delle compagnie di assicurazione, dei periti e dei datori di lavoro dall'accesso** (`D48`, [`V-08`](../11_registri/01-vincoli-in-vigore.md#v-08)) | **D** |
| **DM 31 dicembre 2024** (GU n. 53 del 5 marzo 2025) | Istituzione dell'ecosistema dei dati sanitari | **D** |
| **DM 19 novembre 2025** (GU n. 301 del 30 dicembre 2025, atto 25A06938) | Disciplina del trattamento dei dati nella piattaforma nazionale di telemedicina. **Art. 7: dieci nuove tipologie documentali** del fascicolo dedicate alla telemedicina, con set informativo in Gazzetta Ufficiale (`D30`, [`V-143`](../11_registri/01-vincoli-in-vigore.md#v-143)); **art. 12: le infrastrutture regionali non conservano** i dati e i documenti generati; **art. 14–15**: registrazione delle operazioni e misure di sicurezza; **Allegato 4**: termini di conservazione (24 e 12 mesi), autenticazione con i tre canali nazionali e secondo fattore, **obbligo di inventario delle componenti software comprensive delle librerie di terzi e open source** | **P+D**. L'obbligo di inventario è il punto in cui una **distinta dei materiali diventa conformità normativa italiana**, non buona pratica |

**Tre avvertenze di metodo su questo blocco, che valgono più delle singole righe.**

**Prima - la catena delle fonti è irregolare, e va dichiarato.** L'Allegato 4 del DM 19 novembre
2025 incorpora per rinvio il capitolo di un **capitolato tecnico di una gara regionale** ed
estende le misure ivi previste a tutte le infrastrutture regionali, comprese quelle che non hanno
partecipato alla procedura. Una fonte cogente che rinvia a un documento di gara non è
consultabile con gli strumenti ordinari. Il capitolo richiamato non è stato reperito e va richiesto alla
centrale di committenza **`[NV]`** o recuperato dagli atti della procedura. Finché non lo
si legge, **nessuna affermazione di conformità a quelle misure è sostenibile**.

**Seconda - la residenza dei dati ha due livelli e non vanno appiattiti.** Il DM 21 settembre 2022
prescrive i modelli di distribuzione «su territorio nazionale»; il DM 19 novembre 2025, per il
nodo di interoperabilità, prescrive «territorio UE». **Le due formulazioni non coincidono.** La
documentazione deve rappresentarle entrambe: **almeno UE** per il nodo di interoperabilità,
**nazionale** per le infrastrutture regionali. È il fondamento normativo dei tre profili di
distribuzione di `D24`.

**Terza - la richiesta di certificazione può arrivare dal capitolato prima ancora che dalla
qualificazione.** È il punto per cui il capitolo
[02 §6](./02-qualificazione-e-classificazione.md) esiste: nel mercato pubblico italiano
l'obbligo di essere dispositivo medico può essere **contrattuale** e precedere di anni qualunque
conclusione tratta dall'albero di qualificazione europeo.

## 10. Riscontro sulla ripartizione dei ruoli

**Questa sezione risponde alla questione [`Q-162`](../11_registri/02-questioni-aperte.md#q-162) di `INTEG`**, che chiedeva a quest'area una
revisione di conformità sulla tabella di ripartizione fra titolare e responsabile del trattamento,
fabbricante, fornitore di servizi di identità e soggetto obbligato in materia di sicurezza delle
reti, prima della pubblicazione di
[07 §09](../07_integration/09-obblighi-di-chi-integra.md).

**Esito: la tabella è confermata.** Le trentasette righe sono coerenti con l'attribuzione di
questo capitolo e non contengono attribuzioni errate. Si aggiungono **cinque precisazioni** che
non la contraddicono e la completano.

| # | Precisazione | Riga interessata |
|---|---|---|
| 1 | **Il ruolo di operatore economico ai fini della responsabilità da prodotto va aggiunto come quinto ruolo**, perché non coincide con nessuno degli altri quattro e opera verso un soggetto - il danneggiato - che non compare in nessuna riga. Chi integra è **fabbricante di prodotto**; il progetto, se mai lo fosse, sarebbe **fabbricante di componente**, con la sola esenzione dell'art. 11 e alle condizioni del § 6 | nuova riga, dopo la 7 |
| 2 | **Il ruolo di fabbricante ai sensi del regolamento sulla resilienza è distinto da quello ai sensi dei dispositivi**, e può gravare su chi non è fabbricante di dispositivi: la tabella artefatto → regime del § 5.1 va allegata alla riga 4.4 di quel capitolo | riga 21 |
| 3 | **Il ruolo di fabbricante ai sensi del regolamento sullo spazio dei dati sanitari è un sesto ruolo possibile**, con orizzonte 2029–2031, e **non è coperto da nessuna riga esistente**. Va aggiunto come voce da presidiare, non come adempimento attuale | nuova riga |
| 4 | La riga sulla **contitolarità** va rafforzata: la contitolarità **non è una scelta di comodo** fra le due opzioni precedenti. Si determina quando due soggetti determinano *insieme* finalità e mezzi, e comporta l'accordo dell'art. 26 con la designazione di un punto di contatto e il contenuto essenziale reso disponibile all'interessato | riga 8 |
| 5 | La riga sul **livello di garanzia dell'autenticazione** va letta insieme al vincolo [`V-165`](../11_registri/01-vincoli-in-vigore.md#v-165) di `INTEG` e a [`V-154`](../11_registri/01-vincoli-in-vigore.md#v-154) di `SEC`: **un livello riferito da un integratore non soddisfa un obbligo di autenticazione forte**. È una precisazione di conformità, non di architettura, e appartiene a questa tabella perché è il punto in cui un errore produce una violazione di legge e non un difetto | riga 26 |

**Nessuna riga viene rimossa e nessuna attribuzione viene rovesciata.** In particolare, questa
area **conferma** l'attribuzione delle righe condivise 7, 16, 19, 20, 23, 29, 32 e 37 e ne
rafforza l'avvertenza: una responsabilità condivisa non presidiata è una responsabilità di
nessuno, e va assegnata nominativamente nel contratto, non nella documentazione.

## 11. Le formule che nessun artefatto del progetto può usare

**Questa sezione istituisce il vincolo [`V-171`](../11_registri/01-vincoli-in-vigore.md#v-171).** Ha lo stesso fondamento del vincolo [`V-133`](../11_registri/01-vincoli-in-vigore.md#v-133) di
`PROTO` - che vieta le formule di conformità infondate sui protocolli - e ne estende la logica al
piano regolatorio. Il fondamento è l'art. 7 e l'art. 2, punto 12, del Regolamento (UE) 2017/745: il
materiale promozionale **è** materiale regolatorio, e una dichiarazione fuorviante su destinazione
d'uso, sicurezza o prestazioni è vietata **anche quando non esiste alcuna marcatura**.

| Formula vietata | Perché | Formula ammessa |
|---|---|---|
| «dispositivo medico», riferito al repository o alla documentazione | Il repository è codice sorgente. Attribuirgli la qualifica è falso in entrambe le direzioni | «codice sorgente progettato **perché sia certificabile** come dispositivo medico. **Il prodotto non reca marcatura CE**; il progetto **intende** costituire il soggetto fabbricante, che oggi **non è costituito**, e intraprendere il percorso di certificazione» |
| «marcato CE», «certificato», «conforme all'MDR» | Non esiste marcatura, non esiste dichiarazione di conformità, non esiste valutazione di un organismo notificato | «non ancora marcato CE, **non utilizzabile per l'erogazione di prestazioni sanitarie su pazienti reali**» (`D16`) |
| «certificato ISO 13485» | Il certificato non esiste. Un sistema di gestione della qualità **implementato** non è un sistema **certificato** | «sistema di gestione della qualità impostato secondo ISO 13485, **non certificato**» |
| «classe IIa» usata come attributo del prodotto | La classe è l'esito di una determinazione formale riferita a una destinazione d'uso e a una revisione esatta. Fuori da quel contesto è un'affermazione priva di oggetto | «la determinazione di classificazione del progetto, riferita alla destinazione d'uso nella revisione *n*, conclude per la classe IIa» |
| «conforme al GDPR», «conforme a NIS2» | La conformità è di un titolare o di un soggetto obbligato, non di un software. Un prodotto **abilita**, non è conforme | «fornisce le capacità tecniche e le evidenze documentali richieste da…» |
| «qualità clinica», «adeguato alla diagnosi» riferito al canale | È una rivendicazione di prestazione clinica, e come tale va dimostrata nella valutazione clinica | enunciati tecnici verificabili su risoluzione, frequenza dei fotogrammi e continuità, **senza rivendicare adeguatezza diagnostica** (`D29`) |
| «accreditato» riferito ai canali di identità nazionali | Il fornitore di servizi è chi eroga il servizio in rete, cioè chi installa ([`V-05`](../11_registri/01-vincoli-in-vigore.md#v-05)) | «conforme e verificabile in integrazione continua, **non accreditato**» |
| «monitoraggio in tempo reale», «sorveglianza continua» | Sposta la classificazione e contraddice [`V-144`](../11_registri/01-vincoli-in-vigore.md#v-144) | «raccolta **differita** di parametri per la **revisione periodica** del professionista» |

**Il registro con cui si nomina l'intenzione, e perché è vincolante quanto la tabella.** Da `D58`
il progetto intende assumere il ruolo di fabbricante, e nominare quell'intenzione è la formulazione
più facile da far scivolare in un'affermazione vietata. Valgono quindi, in ogni artefatto, quattro
regole di forma:

1. **l'intenzione si esprime con il verbo «intende»**, mai con un futuro indicativo: «il progetto
   intende certificare», non «il progetto certificherà»;
2. **l'assenza del soggetto giuridico si ripete nella stessa frase** in cui l'intenzione compare,
   e non è rinviabile a una nota;
3. **lo stato di fatto negativo sta in prima posizione**, in grassetto, prima di qualunque
   menzione del percorso: nessuna marcatura CE, nessuna dichiarazione di conformità;
4. **nessuna data, nessuna finestra temporale, nessun «entro»**. L'unica occorrenza ammessa di
   quella parola è **dentro l'enunciato del divieto stesso**.

**E il fraintendimento che le quattro regole servono a impedire**, nominato perché è già
prevedibile: «stanno certificando, allora posso usarlo». È una conclusione **sbagliata**.
L'intenzione di certificare **non copre nessuno**, non trasferisce alcun obbligo e non rende
utilizzabile una versione non certificata: chi installa, integra o mette in servizio il software
oggi assume per intero gli obblighi che ne derivano.

**La verifica di questo vincolo non è documentale ma di processo.** Ogni testo pubblico -
pagina, `README`, titolo di sezione, descrizione di interfaccia, messaggio di errore, annuncio -
è materiale da cui si ricava la destinazione d'uso. Ne discende la questione [`Q-174`](../11_registri/02-questioni-aperte.md#q-174), indirizzata
alle aree di prodotto e della guida: **serve un passaggio di revisione regolatoria prima della
pubblicazione di qualunque testo rivolto all'esterno**, con questa tabella come lista di
controllo.

## 12. Le tre soglie che cambierebbero il quadro

Sono elencate qui perché la posizione del progetto è **fattuale e revocabile**, e una posizione
revocabile va accompagnata dalle condizioni della sua revoca. Sono in ordine di probabilità.

| # | Soglia | Che cosa cambia | Chi decide |
|---|---|---|---|
| 1 | **Monetizzazione**: supporto a pagamento, servizio gestito, consulenza sull'integrazione, sponsorizzazioni ricorrenti | Cade la condizione «fuori da un'attività commerciale». Ne discendono: possibile qualifica di fabbricante ai sensi del regolamento sulla resilienza; caduta dell'esenzione per il software libero nel regime della responsabilità da prodotto; avvicinamento alla nozione di messa a disposizione sul mercato | **Committente** - questione [`Q-155`](../11_registri/02-questioni-aperte.md#q-155) |
| 2 | **Costituzione di una persona giuridica** che fornisca sostegno sistematico e continuativo allo sviluppo | Si apre la posizione di **custode di software open source** (art. 3, punto 14, e art. 24 del regolamento sulla resilienza), con obblighi alleggeriti e senza sanzioni amministrative. È una posizione **migliore** dell'attuale sotto il profilo della certezza, non peggiore | **Committente** - questione [`Q-155`](../11_registri/02-questioni-aperte.md#q-155) |
| 3 | **Distribuzione di un artefatto pronto all'uso** che un'organizzazione sanitaria possa mettere in produzione senza ulteriore lavoro | Avvicina alla nozione di **messa in servizio** (art. 2, punto 29, dell'MDR), che è la soglia decisiva. C'è differenza sostanziale fra pubblicare sorgenti che richiedono compilazione, configurazione e integrazione e pubblicare un pacchetto immediatamente operativo. Non risultano linee guida dedicate alla distribuzione open source di software sanitario `[NV]` da chiedere al Committente: è una lacuna reale del quadro europeo | **Committente**, con effetto immediato sulla politica di distribuzione |

**La soglia 3 è quella che si supera per distrazione.** Le altre due sono decisioni; questa è la
conseguenza di una scelta di comodità operativa - un'immagine preconfigurata, un pacchetto
«pronto», una procedura di installazione a un comando. È la ragione per cui la separazione fra
repository e distribuzione (`D17`) deve essere **formalizzata in un documento di politica** e non
lasciata alla prassi.

## 13. Il calendario delle date che contano

Nessuna di queste date è una scadenza del progetto. Sono le date che determinano **quando un
obbligo diventa esigibile presso qualcun altro**, e quindi quando il prodotto deve essere pronto a
fornirne l'evidenza.

| Data | Che cosa | Su chi grava |
|---|---|---|
| **26 maggio 2021** | Applicabilità del regolamento sui dispositivi medici | Fabbricante |
| **28 giugno 2025** | Accessibility Act sui prodotti e servizi immessi sul mercato | Operatore economico |
| **15 gennaio 2026** | Applicabilità della determinazione sulle specifiche di sicurezza di base | Soggetto obbligato |
| **11 settembre 2026** | Obblighi di segnalazione delle vulnerabilità attivamente sfruttate e degli incidenti gravi (regolamento sulla resilienza, art. 14) | Fabbricante di prodotti con elementi digitali |
| **31 ottobre 2026** | **Limite esterno** della prima ondata per le misure di sicurezza di base - non un termine unico | Soggetto obbligato |
| **30 novembre 2026** | Consegna della versione 1.0: software completo, testato, con fascicolo tecnico avviato (`D5`, `D16`) | **Progetto** |
| **9 dicembre 2026** | Termine di recepimento della direttiva sulla responsabilità da prodotto; si applica ai prodotti immessi dopo | Operatore economico |
| **1° gennaio 2027** | Notifiche per i soggetti inseriti nel 2026 | Soggetto obbligato |
| **26 marzo 2027** | Applicazione generale del regolamento sullo spazio europeo dei dati sanitari | Vari |
| **31 luglio 2027** | Misure di sicurezza di base per i soggetti inseriti nel 2026 | Soggetto obbligato |
| **11 dicembre 2027** | Applicazione generale del regolamento sulla resilienza: requisiti essenziali, valutazione della conformità, marcatura | Fabbricante |
| **26 marzo 2029** | Capo III del regolamento sullo spazio europeo dei dati sanitari - sistemi di cartella clinica elettronica. La mappatura esatta va verificata su EUR-Lex da `COMP` alla data di applicazione. **`[NV]`** sulla mappatura | Fabbricante del sistema |

**Una data manca deliberatamente da questa tabella: quella della marcatura CE. L'omissione resta,
e la sua ragione è cambiata.**

Finché il percorso di certificazione era attribuito a un soggetto esterno, la ragione era semplice:
la data non era del progetto. Da `D58` quella ragione **non è più vera** - il progetto intende
assumere il ruolo di fabbricante, e il soggetto che lo eserciterebbe è ancora da costituire - ma
**l'omissione non si attenua di un giorno**, perché la ragione che la sostiene è più forte della
precedente:

1. **Un'intenzione non è una promessa datata.** Dichiarare che si intende certificare e dichiarare
   che si sarà marcati entro un termine sono due atti diversi, e solo il secondo produce un effetto
   regolatorio: la destinazione d'uso di un dispositivo si ricava anche dal materiale pubblicato
   (art. 2, punto 12) e le dichiarazioni fuorvianti sono vietate anche senza marcatura (art. 7).
   Una data pubblicata **viene letta come previsione dell'esito**, e nessuna cautela redazionale
   riesce a impedirlo.
2. **L'esito non dipende solo da noi.** La valutazione della documentazione tecnica e la
   certificazione del sistema di gestione della qualità hanno tempi di organismi notificati con
   code non misurate: una data sarebbe un impegno su un esito che il progetto non determina.
3. **[`V-171`](../11_registri/01-vincoli-in-vigore.md#v-171) non ammette eccezioni per la pianificazione interna.** Una pianificazione nostra
   **non diventa una promessa perché è nostra**, e non diventa pubblicabile come data perché è
   sincera. Nessuna data, nessuna finestra, nessun «entro».

Il calcolo all'indietro, gli scenari e i punti di non ritorno sono
[pianificazione interna del progetto](./09-percorso-e-calendario.md) (`D57`), e vanno letti con
l'avvertenza che apre quel capitolo.

## 14. Che cosa questo capitolo lascia aperto

| Riferimento | Questione | A chi |
|---|---|---|
| [`Q-24`](../11_registri/02-questioni-aperte.md#q-24) | Adozione formale come documento di decisione architetturale della tabella artefatto → regime del § 5.1. **La tabella ora esiste; l'atto che la adotta no** | → Committente, con architettura |
| [`Q-171`](../11_registri/02-questioni-aperte.md#q-171) | Se il progetto debba produrre anche il pacchetto documentale del capo III del regolamento sullo spazio europeo dei dati sanitari | → Committente |
| [`Q-174`](../11_registri/02-questioni-aperte.md#q-174) | Passaggio di revisione regolatoria dei testi pubblici prima della pubblicazione, con la tabella del § 11 come lista di controllo | Prodotto, guida |
| [`Q-151`](../11_registri/02-questioni-aperte.md#q-151) | Lettura riga per riga degli allegati di dettaglio della determinazione sulla sicurezza. **Nessuna citazione puntuale prima di allora** | Conformità |
| `[NV]` | Testi dei DPCM sugli elementi essenziali di cybersicurezza nei contratti pubblici e verifica se la fornitura ricada nelle categorie tecnologiche (§ 4.1) | `COMP`, con consulente di appalti |
| `[NV]` | Definizioni e mappatura delle date del regolamento sullo spazio europeo dei dati sanitari (§ 7) | `COMP` |
| `[NV]` | Formulazione letterale della definizione di prodotto e dei considerando pertinenti nella direttiva sulla responsabilità (§ 6) | `COMP` |
| `[NV]` | Numerazione della norma italiana che vieta la limitazione preventiva di responsabilità verso il danneggiato, dopo il recepimento (§ 6) | `COMP` |
| `[NV]` | Versione di EN 301 549 citata a supporto dell'Accessibility Act (§ 8) | `COMP` |
| `[NV]` | Qualificazione del videoconsulto come servizio di comunicazione interpersonale indipendente dal numero (§ 8) | `COMP` |
| `[NV]` | Capitolo del capitolato tecnico richiamato per rinvio dall'Allegato 4 del DM 19 novembre 2025 (§ 9) | `COMP` |
| `[NV]` | Riferimenti puntuali di articolo del d.lgs. 5 agosto 2022, n. 137, sugli adempimenti nazionali e sull'obbligo di lingua italiana | `COMP` |
| `[NV]` | Stato di armonizzazione della norma sulle attività di sicurezza nel ciclo di vita del software sanitario | `COMP` |
