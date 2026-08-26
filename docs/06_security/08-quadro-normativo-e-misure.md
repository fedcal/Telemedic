---
title: Quadro normativo e misure
sidebar_position: 9
description: Quali norme di sicurezza si applicano e a chi, il termine soggettivo dei diciotto mesi, l'esclusione per prodotto e non per progetto, il conflitto riconosciuto dall'autorità fra protezioni endpoint e certificazione del dispositivo, e la matrice di sovrapposizione fra le fonti.
---

# Quadro normativo e misure

> **Presupposto di lettura.** Il quadro regolatorio generale - che cosa sono la disciplina dei
> dispositivi medici, il regolamento sulla protezione dei dati, la direttiva sulla sicurezza
> delle reti e il regolamento sulla resilienza informatica, e come si collocano fra loro - è in
> [10 §12 §10](../10_fondamenti/12-crittografia-e-sicurezza.md) e in
> [10 §15 - Regolatorio da zero](../10_fondamenti/15-regolatorio-da-zero.md). Qui si tratta la
> sola sicurezza, con le date, i destinatari e i punti di conflitto.
>
> **Avvertenza.** Questo capitolo è **analisi tecnica di conformità, non consulenza legale**. Le
> qualificazioni giuridiche di un soggetto e di un prodotto dipendono da elementi di fatto che
> vanno accertati caso per caso da un professionista abilitato.

## 1. Il problema in una riga

**Il progetto quasi certamente non è, in proprio, soggetto della disciplina nazionale sulla
sicurezza delle reti.** Lo sono i suoi utilizzatori - aziende sanitarie, aziende ospedaliere,
strutture accreditate sopra soglia, gestionali sanitari in cloud - e questi **riversano
contrattualmente sul fornitore** una parte consistente dei propri obblighi, per effetto di tre
meccanismi cumulativi:

1. **l'art. 24, comma 2, lettera d), e comma 3 del d.lgs. 4 settembre 2024, n. 138**, che fa
   della sicurezza della catena di approvvigionamento una misura obbligatoria **del cliente**;
2. **le misure sulla catena di fornitura delle specifiche di base** dell'autorità nazionale, che
   traducono quell'obbligo in requisiti documentali e contrattuali verificabili;
3. **l'obbligo di dichiarazione nominativa dei fornitori rilevanti** introdotto nel 2026, che
   trasforma la composizione della catena in un dato trasmesso a un'autorità
   ([07 §3](./07-catena-di-fornitura.md)).

## 2. Regola di citazione: che cosa questo capitolo non scrive

**Questione Q-151.** Gli allegati di dettaglio della determinazione dell'autorità nazionale non
sono stati letti riga per riga. Ne discende una regola vincolante per quest'area e per ogni
documento pubblico del progetto:

> **Nessun requisito puntuale delle misure di sicurezza di base è citato testualmente prima
> della lettura degli allegati di dettaglio.**

Ciò che questo capitolo cita, e che è verificato: i **codici** delle misure, la loro
**ripartizione** fra le due tipologie di soggetto, la **corrispondenza** con gli elementi
dell'art. 24, comma 2, del decreto, le **clausole di proporzionalità**, l'**aritmetica interna**
del catalogo, e i passaggi della guida alla lettura dell'autorità che sono stati letti.

Ciò che questo capitolo **non** cita, e marca `[NV]`: il **testo dei singoli requisiti**. Un
fornitore che citi male un requisito produce, presso il cliente, un'evidenza documentale che
non chiude - che è esattamente il danno che voleva evitare.

## 3. Il termine è soggettivo, non una data unica

Questa è la correzione più importante del capitolo, perché una data sbagliata cablata in una
roadmap produce un impegno che il prodotto non può mantenere e una rassicurazione che il cliente
non può usare.

**«Il 31 ottobre 2026» non compare in alcun atto.** È il risultato del combinato disposto di due
elementi:

1. **L'art. 3, comma 1, della determinazione dell'autorità nazionale n. 379907 del 19 dicembre
   2025**: il termine per l'adozione delle misure di sicurezza di base è fissato in **diciotto
   mesi dalla ricezione, da parte del soggetto, della comunicazione di inserimento nell'elenco**.
   Il termine per l'obbligo di notifica degli incidenti significativi di base è di **nove mesi**
   dalla stessa data.
2. **L'autorità ha iniziato a inviare le comunicazioni di inserimento nell'aprile 2025.** Per i
   soggetti che l'hanno ricevuta entro il 30 aprile 2025 - la larga maggioranza della prima
   ondata - i diciotto mesi maturano entro il 31 ottobre 2026.

**Il termine è quindi soggettivo: ciascun cliente ha la propria data.** Il 31 ottobre 2026 è il
**limite esterno della prima ondata**, ed è la data oltre la quale l'autorità passa dalla fase
di accompagnamento a quella ispettiva.

**Per i soggetti inseriti per la prima volta nell'anno solare 2026 il quadro è diverso**
(determinazione n. 127434 del 13 aprile 2026, art. 1): misure di sicurezza di base entro il
**31 luglio 2027**; obbligo di notifica degli incidenti significativi di base **dal 1° gennaio
2027**.

Va aggiunto un elemento che determina il momento in cui il prodotto incontra il mercato: secondo
i chiarimenti dell'autorità, i soggetti **non sono tenuti a rinegoziare i contratti in essere**,
ma devono inserire i requisiti di sicurezza «nei contratti **nuovi, rinnovati o prorogati** a
partire dal termine per l'adozione delle misure».

**Conseguenza di prodotto, e la si scrive perché è la parte che si dimentica: la conformità va
parametrizzata sul termine del singolo utilizzatore, non su una data cablata.** Il prodotto deve
poter dichiarare quali evidenze fornisce; **non può dichiarare una data**, perché la data è del
cliente. È la questione Q-09 della bacheca, indirizzata alla roadmap.

### 3.1 Le altre date che contano

| Data | Che cosa | Fonte |
|---|---|---|
| **15 gennaio 2026** | Applicabilità della determinazione sulle specifiche di base, che sostituisce quella dell'aprile 2025 | Det. n. 379907/2025, art. 9, c. 3 |
| **11 giugno 2026** | Applicabilità del capo sulla notifica degli organismi di valutazione della conformità del regolamento sulla resilienza informatica | Reg. (UE) 2024/2847, art. 71 |
| **11 settembre 2026** | **Applicabilità dell'art. 14**: obblighi di segnalazione delle vulnerabilità attivamente sfruttate e degli incidenti gravi | Reg. (UE) 2024/2847, art. 71 |
| **31 ottobre 2026** | Limite esterno della prima ondata per le misure di base | §3 |
| **1° gennaio 2027** | Decorrenza dell'obbligo di notifica per i soggetti inseriti nel 2026 | Det. n. 127434/2026 |
| **31 luglio 2027** | Misure di base per i soggetti inseriti nel 2026 | Det. n. 127434/2026 |
| **11 dicembre 2027** | Il resto del regolamento sulla resilienza informatica: requisiti essenziali, valutazione della conformità, marcatura | Reg. (UE) 2024/2847, art. 71 |

## 4. Le misure di base: struttura, non contenuto

| | Soggetti **importanti** | Soggetti **essenziali** |
|---|---|---|
| Misure e requisiti | **37 misure, 87 requisiti** | **43 misure, 116 requisiti** |
| Incidenti significativi di base | 3 tipologie | **4 tipologie**, con la quarta dedicata all'accesso non autorizzato o con abuso dei privilegi |
| Vigilanza | *ex post* | *ex ante* ed *ex post* |
| Massimale sanzionatorio | fino a 7 M€ o 1,4% del fatturato mondiale annuo | fino a 10 M€ o 2% |

L'aritmetica interna, verificata sulla guida alla lettura dell'autorità: **27** misure hanno
requisiti identici per entrambe le tipologie; **10** hanno requisiti aggiuntivi per i soli
essenziali; **6** sono previste per i soli essenziali. 27 + 10 + 6 = 43; 43 − 6 = 37.

**Assunzione di lavoro del progetto.** Una piattaforma che eroga televisita e teleconsulto per
un soggetto essenziale sarà classificata come **sistema rilevante**. La documentazione presume
quindi l'applicazione del **profilo più severo** - secondo fattore, cifratura delle copie di
sicurezza, prove di ripristino, monitoraggio di rete, protezione degli endpoint - e non del
profilo minimo.

### 4.1 Le quattro clausole di proporzionalità

Le specifiche non impongono tutto a tutti. L'autorità ha declinato la proporzionalità con
quattro clausole che compaiono nei singoli requisiti e che, **quando compaiono insieme, si
applicano in cascata**:

| Clausola | Effetto |
|---|---|
| «per almeno i sistemi informativi e di rete **rilevanti**» | Limita l'**ambito** ai sistemi la cui compromissione avrebbe impatto significativo. Interessa 13 requisiti per i soggetti importanti e **22** per gli essenziali |
| «in accordo agli esiti della **valutazione del rischio**» | Modalità e ambito definiti dagli esiti della valutazione. 6 e **10** requisiti |
| «fatte salve **motivate e documentate ragioni normative o tecniche**» | Deroga ammessa, **con obbligo di misure compensative** e descrizione del rischio residuo nel piano di trattamento del rischio. 8 e **10** requisiti |
| «forniture con potenziali impatti sulla sicurezza» | Limita l'ambito alle forniture la cui compromissione può determinare effetti sulla sicurezza. 3 requisiti in entrambe le tipologie, tutti sulla catena di fornitura |

La terza clausola è quella che regge il §6.

### 4.2 La lettera che nomina questo prodotto

Fra i dieci elementi che l'art. 24, comma 2, del decreto impone di coprire, uno nomina
espressamente ciò che il progetto fa: la lettera l), «uso di soluzioni di autenticazione a più
fattori o di autenticazione continua, di **comunicazioni vocali, video e testuali protette**, e
di sistemi di comunicazione di emergenza protetti».

È l'unica che nomina le comunicazioni protette. Per un soggetto sanitario, una piattaforma di
consulto video cifrato con canale testuale **è il mezzo con cui quella misura viene attuata**.
La misura sulle comunicazioni protette è riservata ai soli soggetti essenziali, ed è quella su
cui la funzione del prodotto si aggancia più direttamente a un obbligo di legge.

### 4.3 La dimostrabilità è documentale

**Non esiste un modello di attestazione né una certificazione rilasciata dall'autorità.** La
dimostrabilità è documentale e organizzativa, e le tipologie di evidenza sono elenchi,
inventari, piani, politiche, procedure e registri.

**Undici documenti richiedono l'approvazione degli organi di amministrazione e direttivi**:
organizzazione per la sicurezza informatica; politiche di sicurezza; valutazione del rischio;
piano di trattamento del rischio; piano di gestione delle vulnerabilità; piano di adeguamento;
piano di continuità operativa; piano di ripristino in caso di disastro; piano di gestione delle
crisi; piano di formazione; piano per la gestione degli incidenti.

**Il fornitore non approva nessuno di questi documenti: li approva il consiglio di
amministrazione del cliente.** Ma **due non sono redigibili senza il fornitore**: l'inventario
dei servizi erogati dai fornitori e il piano di gestione delle vulnerabilità, che deve tenere
conto delle vulnerabilità delle dipendenze del prodotto. È da qui che nasce il deliverable
naturale del progetto: un **fascicolo di conformità precompilato** che il cliente incorpora -
distinta dei materiali, elenco dei flussi di rete verso l'esterno, elenco dei sistemi
accessibili da remoto, configurazioni di riferimento, ripartizione delle responsabilità,
procedura di divulgazione.

## 5. L'esclusione è per prodotto, non per progetto

**Decisione D41, e questa sezione la giustifica.**

L'art. 2, par. 2, del Regolamento (UE) 2024/2847 stabilisce che il regolamento **non si applica**
ai prodotti con elementi digitali cui si applicano, fra gli altri, il Regolamento (UE) 2017/745
sui dispositivi medici e il Regolamento (UE) 2017/746 sui dispositivi diagnostici in vitro.

**L'esclusione è riferita al prodotto, non al soggetto che lo produce.** Ne discendono tre casi
distinti:

| Artefatto | Il regolamento sulla resilienza si applica? | Perché |
|---|---|---|
| La distribuzione marcata come dispositivo medico, immessa sul mercato come tale | **No** | Si applica la disciplina dei dispositivi. I requisiti di cibersicurezza arrivano dall'**Allegato I, §§ 17.2 e 17.4** del regolamento sui dispositivi |
| Componenti distribuiti separatamente e **non coperti dalla marcatura**: kit di sviluppo, componente incorporabile, immagini e pacchetti di distribuzione | **Potenzialmente sì**, se immessi sul mercato nel corso di un'attività commerciale | Un kit di sviluppo che non è il dispositivo non è coperto dall'esclusione |
| Il prodotto commerciale dell'integratore che incorpora il progetto | **Sì**, salvo che sia esso stesso un dispositivo | L'integratore è **fabbricante** per ciò che immette sul mercato |

**L'asimmetria va documentata**, perché il confine passa **dentro** il perimetro del progetto e
coincide solo in parte con il confine già tracciato fra veicolo di comunicazione e supporto alla
decisione clinica. Serve un documento di decisione architetturale con la tabella artefatto →
regime applicabile: è la questione Q-10 della bacheca, e la Q-24 aperta dall'area di conformità.

Due punti ulteriori, che sono le domande che ogni integratore pone:

**La licenza non trasferisce obblighi regolatori.** Nessuna clausola di esclusione di garanzia
sposta sul ricevente la responsabilità di un regolamento. **Chi integra in un prodotto
commerciale è fabbricante per legge**, indipendentemente da quanto scritto nella licenza. Va
scritto con chiarezza in ogni documento rivolto agli integratori.

**La condizione attuale del progetto.** Il progetto non è, oggi, un prodotto immesso sul mercato
nel corso di un'attività commerciale, e il titolare, in quanto persona fisica, non può essere
qualificato come amministratore fiduciario di software libero, figura che il regolamento riserva
a una **persona giuridica**. Nessun obbligo sorge oggi in capo al progetto. **Tre soglie
cambierebbero il quadro**, in ordine di probabilità: il passaggio a una persona giuridica che
fornisca sostegno sistematico e continuativo; la **monetizzazione**, che rende fabbricante chi
monetizza; l'incorporazione da parte di un integratore commerciale, che rende fabbricante
l'integratore. La prima e la seconda sono **decisioni del committente**: questione Q-155.

Indipendentemente dall'obbligo, la strategia dichiarata è quella di **essere un buon
componente**: adottare volontariamente l'insieme minimo che l'integratore-fabbricante chiederà
comunque per la propria diligenza dovuta, ed è quello del capitolo
[07](./07-catena-di-fornitura.md).

## 6. Il conflitto riconosciuto dall'autorità

**Questa è l'informazione con il maggiore valore pratico dell'intero capitolo, ed è quella che i
clienti non sanno di poter usare.**

L'autorità nazionale, nella propria guida alla lettura, illustra la clausola «fatte salve
motivate e documentate ragioni normative o tecniche» con un esempio che riguarda **direttamente
i dispositivi medici**. A proposito del requisito sulla presenza di sistemi di protezione degli
endpoint per il rilevamento del codice malevolo, l'autorità scrive:

> «Tale requisito potrebbe tuttavia non essere applicabile nel caso di *endpoint* come, ad
> esempio, **i dispositivi medici per i quali un'eventuale installazione dei sistemi di
> protezione ne potrebbe invalidare la certificazione**.»

È il punto di raccordo **esplicito** fra i due regimi. Un soggetto che utilizzi il prodotto come
dispositivo medico marcato può derogare a quel requisito, ma deve **motivare e documentare** la
ragione normativa e adottare **misure compensative** iscritte nel piano di trattamento del
rischio.

**Le misure compensative sono a carico del fornitore.** Non nel senso che il fornitore le
applichi al posto del cliente, ma nel senso che **il cliente non può documentarle senza il
fornitore**: solo il fornitore sa quali componenti sono coperti dalla marcatura e quale
alterazione la invaliderebbe. Ne discende un deliverable preciso, che il progetto produce come
parte del pacchetto per l'utilizzatore:

**Dichiarazione tecnica di deroga**, che (a) individua i componenti la cui alterazione
invaliderebbe la marcatura; (b) elenca le **misure compensative disponibili nativamente** -
irrobustimento del contenitore, filesystem in sola lettura, verifica dell'integrità delle
immagini, monitoraggio esterno del comportamento del processo, segmentazione di rete; (c)
definisce la **configurazione supportata** di protezione degli endpoint sull'host ospitante.

**Senza questo documento il cliente non può chiudere la deroga**, e la deroga non chiusa è un
requisito non soddisfatto in sede ispettiva. È, per il progetto, un elemento di
differenziazione che costa poco e che quasi nessun fornitore fornisce.

## 7. Le altre fonti e ciò che ciascuna aggiunge

| Fonte | Destinatario diretto | Che cosa aggiunge a questo prodotto |
|---|---|---|
| **Art. 32 del Regolamento (UE) 2016/679** | Titolare e responsabile del trattamento | Pseudonimizzazione e cifratura; riservatezza, integrità, disponibilità e resilienza su base permanente; capacità di ripristino; **procedura per testare e valutare regolarmente l'efficacia** |
| **Art. 25 del Regolamento (UE) 2016/679** | Titolare | Protezione fin dalla progettazione e per impostazione predefinita. Formalmente non si rivolge al produttore, ma il considerando 78 lo chiama in causa: va **documentata come processo**, non asserita |
| **Regolamento (UE) 2017/745, All. I §§ 17.2 e 17.4** | Fabbricante | Sviluppo conforme allo **stato dell'arte** con gestione dei rischi comprensiva della sicurezza delle informazioni; **requisiti minimi di hardware, rete e misure di sicurezza** necessari al funzionamento previsto |
| Guida sulla cibersicurezza dei dispositivi medici | Fabbricante | Processo di gestione del rischio di cibersicurezza distinto e raccordato con quello di sicurezza; sicurezza fin dalla progettazione e per impostazione predefinita; aspetti precedenti e successivi all'immissione |
| **Norma sulle attività di sicurezza nel ciclo di vita del software sanitario** | Fabbricante | Ciclo di vita di sviluppo sicuro integrato nel sistema di gestione della qualità. **Lo stato di armonizzazione non è stato accertato: `[NV]`.** Anche se non armonizzata resta il riferimento di elezione per dimostrare lo stato dell'arte |
| **Circolare sulle misure minime di sicurezza per le pubbliche amministrazioni** | Pubbliche amministrazioni | Il cliente pubblico deve dimostrare i controlli **anche sulla componente fornita**: inventario software, configurazioni sicure, gestione delle vulnerabilità, separazione delle utenze privilegiate, centralizzazione dei log, copie di sicurezza cifrate e verificate |
| **Linee guida nazionali sulla sicurezza negli approvvigionamenti informatici** | Amministrazioni acquirenti | **Rese obbligatorie per le infrastrutture regionali di telemedicina** dal DM 21 settembre 2022 nella parte relativa alle azioni sulla scelta dello strumento, sui requisiti di capitolato, sulle competenze della commissione e alla protezione dei dati personali. È, di fatto, **il capitolato di sicurezza che il prodotto si troverà davanti** |
| **Accordo Stato-Regioni del 17 dicembre 2020** | Erogatori di prestazioni in telemedicina | **Tutti i trasferimenti di voce, video, immagini e file devono essere crittografati**; registro delle manutenzioni e dei collaudi; prove di funzionamento dopo ogni aggiornamento rilevante |
| **DM 19 novembre 2025, Allegato 4** | Titolari nel contesto della telemedicina | I **termini di conservazione**: 24 e 12 mesi (V-152) |
| **Elementi essenziali di cybersicurezza nei contratti pubblici** | Stazioni appaltanti | Progettazione sicura e priva di vulnerabilità note; aggiornamenti automatici; autenticazione e controllo degli accessi; cifratura; gestione trasparente delle vulnerabilità; valutazione della catena. **Criteri di premialità geografica**. `[NV]` sul testo dei decreti attuativi |

Una nota sulle linee guida sugli approvvigionamenti che ha effetto diretto sulla forma della
documentazione: le linee guida raccomandano alle amministrazioni di attingere all'appendice dei
requisiti eleggibili invece di scriverne di nuovi, e di formularli in modo **«chiaro, oggettivo
e quanto più possibile chiuso»**, lasciando meno spazio possibile alla valutazione soggettiva
della commissione. **Le risposte del fornitore saranno quindi valutate contro requisiti chiusi -
sì o no, con evidenza - non contro narrazioni.** La documentazione di conformità del progetto è
strutturata come matrice requisito → evidenza → riferimento puntuale, ed è la stessa struttura
richiesta dalla tracciabilità del ciclo di vita: un artefatto per entrambi gli scopi.

Un'ultima, sulla protezione dei dati negli appalti: le stesse linee guida avvertono
espressamente contro «la previsione di **sproporzionati esoneri di responsabilità**, specialmente
in caso di contratti standard con margini di negoziazione pressoché nulli in capo al titolare».
L'avvertimento è rivolto ai modelli di servizio gestito con accordo sul trattamento non
negoziabile. **L'accordo sul trattamento offerto dal progetto è negoziabile nelle clausole di
responsabilità**, o sarà contestato in sede di gara.

## 8. Matrice di sovrapposizione

Legenda: **●** obbligo diretto · **○** obbligo indiretto, che ricade sul progetto per via
contrattuale · **-** non applicabile.

| Controllo | Sicurezza reti | Contratti pubblici | Resilienza informatica | Protezione dati | Dispositivi medici | Misure minime PA | Approvvigionamenti | Telemedicina | Destinatario primario |
|---|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|---|
| Inventario e distinta dei materiali | ● | - | ● | ○ | ● | ● | ● | - | **Progetto** produce, chi installa mantiene |
| Configurazioni sicure di riferimento | ● | ● | ● | ● | ● | ● | ● | ● | **Progetto** documenta, chi installa applica |
| Gestione e divulgazione delle vulnerabilità | ● | ● | ● | ○ | ● | ● | ● | - | **Entrambi** |
| Aggiornamenti di sicurezza | ● | ● | ● | ● | ● | ● | ● | ● | **Progetto** rilascia, chi installa applica |
| Controllo degli accessi e privilegi | ● | ● | ● | ● | ● | ● | ● | ● | **Entrambi** |
| Autenticazione a più fattori | ● | ● | ● | ● | ● | ● | ● | ● | **Progetto** abilita, chi installa configura |
| Cifratura in transito | ● | ● | ● | ● | ● | ● | ● | ● | **Progetto** |
| Cifratura a riposo | ● | ● | ● | ● | ● | ● | ● | ● | **Progetto** abilita, chi installa gestisce le chiavi |
| Copie di sicurezza cifrate con prova di ripristino | ● | - | - | ● | ● | ● | - | ● | **Chi installa**, con procedura del progetto |
| Continuità e ripristino | ● | - | - | ● | ● | ● | - | ● | **Chi installa** |
| Registro non alterabile e tracciabilità | ● | ● | ● | ● | ● | ● | ● | ● | **Progetto** |
| Rilevazione e monitoraggio | ● | ● | ● | ● | ● | ● | ● | ● | **Chi installa**, con integrazione del progetto |
| Notifica degli incidenti | ● | ● | ● | ● | ● | - | ● | ● | **Chi installa** notifica, **progetto** fornisce l'evidenza |
| Esportazione forense e cronologia | ○ | ○ | ○ | ○ | ○ | - | ● | - | **Progetto** |
| Sicurezza della catena di fornitura | ● | ● | ● | ● | ● | - | ● | - | **Chi installa** obbligato; **progetto** oggetto della verifica |
| Dichiarazione dei fornitori rilevanti | ● | - | - | - | - | - | - | - | **Chi installa**; il progetto ne è il soggetto dichiarato |
| Ciclo di vita di sviluppo sicuro | ● | ● | ● | ● | ● | - | ● | - | **Progetto** |
| Formazione del personale | ● | ● | - | ● | ● | - | ● | ● | **Chi installa** |
| Governance e approvazione dei piani | ● | ● | - | ● | ● | - | ● | - | **Chi installa** |
| Comunicazioni protette | ● | - | ● | ● | ● | - | ● | ● | **Progetto** |
| Residenza dei dati | ○ | ● | - | ● | - | - | ● | ● | **Entrambi** |

### 8.1 I sette controlli a massimo rendimento

Sette controlli, se implementati una volta e documentati bene, soddisfano **cinque o più fonti
ciascuno**. Sono la priorità assoluta:

1. **Distinta dei materiali firmata e dichiarazione di esposizione** ([07 §§2, 4](./07-catena-di-fornitura.md)).
2. **Registro a sola aggiunta con catena di impronte, conservazione a 24 mesi, esportazione firmata
   in formato aperto** ([04](./04-tracciamento.md)). **È il singolo elemento di maggiore
   sforzo dell'intero catalogo** e va pianificato come tale.
3. **Secondo fattore e federazione delle identità sui tre canali nazionali**
   ([02](./02-identita-e-accessi.md)).
4. **Cifratura fino agli estremi del media e trasporto cifrato per la segnalazione**
   ([03 §2](./03-protezione-dei-dati.md), [05](./05-sicurezza-del-tempo-reale.md)).
5. **Ciclo di vita di sviluppo sicuro con modello delle minacce, verifiche automatiche in
   integrazione continua e divulgazione coordinata** ([07 §§5, 6](./07-catena-di-fornitura.md)).
6. **Misurazione della disponibilità per tenant e per servizio, con soglie e allarmi**
   ([10 §5](./10-risposta-agli-incidenti.md)).
7. **Configurazione di riferimento documentata, artefatti firmati, configurazione sicura per
   impostazione predefinita** ([07 §8](./07-catena-di-fornitura.md)).

## 9. Che cosa quest'area lascia aperto

| Riferimento | Questione | A chi |
|---|---|---|
| Q-151 | Lettura riga per riga degli allegati di dettaglio e completamento della ripartizione delle responsabilità con il testo dei requisiti. **Nessuna citazione puntuale prima di allora** | Conformità |
| Q-10, Q-24 | Tabella artefatto → regime applicabile come documento di decisione architetturale (§5) | Conformità, architettura |
| Q-09 | Parametrizzazione della conformità sul termine del singolo utilizzatore (§3) | Roadmap |
| Q-154 | Se l'operatore del servizio gestito supera le soglie della media impresa **diventa soggetto in proprio**, con tutti gli obblighi del capitolo [09](./09-ripartizione-delle-responsabilita.md) | → Committente |
| Q-155 | Monetizzazione e ruolo di fabbricante; **periodo di supporto dichiarato**, minimo cinque anni (§5) | → Committente |
| `[NV]` | Stato di armonizzazione della norma sulle attività di sicurezza nel ciclo di vita (§7) | Conformità |
| `[NV]` | Testo dei decreti sugli elementi essenziali di cybersicurezza nei contratti pubblici e verifica se la fornitura ricada nelle categorie tecnologiche elencate (§7) | Conformità, con consulente di appalti |
