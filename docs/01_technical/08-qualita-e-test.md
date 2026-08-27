---
title: Qualità e test
sidebar_position: 9
description: Piramide delle prove, prove a contratto, dati sintetici, verifica dell'accessibilità automatica e manuale, prove di carico, copertura minima e differenziata, e la tracciabilità dal requisito alla prova che rende certificabile il lavoro.
---

# Qualità e test

In un progetto ordinario la suite di prove serve a non rompere ciò che funziona. Qui serve anche
a **dimostrare**: la tracciabilità dal requisito alla prova è condizione di certificabilità
(D12, conseguenza 6) e non è ricostruibile a posteriori. D45 lo dice senza mezzi termini: gli
identificativi di requisito vanno congelati subito, perché la tracciabilità non si ricostruisce.

Questo capitolo descrive la struttura tecnica. Il piano di verifica e validazione in senso
regolatorio è in `docs/08_compliance/`.

---

## 1. La piramide, con le proporzioni dichiarate

| Livello | Che cosa prova | Dove gira | Tempo di esecuzione atteso |
|---|---|---|---|
| **Unitarie di dominio** | Invarianti, macchine a stati, politiche, calcoli | In memoria, senza contenitore | Secondi per l'intera suite |
| **Di componente** | Un caso d'uso con le sue porte simulate | In memoria | Secondi |
| **Di integrazione** | Persistenza, migrazioni, isolamento fra tenant, outbox, sicurezza a livello di riga | Contenitori effimeri | Minuti |
| **A contratto** | Compatibilità delle interfacce pubbliche | Contro schemi versionati | Secondi |
| **Da estremo a estremo** | Percorsi utente completi | Navigatore reale, ambiente completo | Minuti |
| **Media** | Sessione, qualità, degrado, relay | Navigatori reali, rete simulata | Minuti |
| **Accessibilità** | Criteri automatizzabili | Sul DOM renderizzato | Secondi |
| **Sicurezza** | Analisi statica e dinamica, dipendenze, segreti, abuso | Pipeline | Minuti |
| **Carico e resistenza** | Capacità e degradazione | Ambiente dedicato | Ore |

**La forma della piramide non è un'estetica: è un vincolo di tempo di ciclo.** Se le prove che
girano a ogni modifica impiegano più di pochi minuti, smettono di girare a ogni modifica, e la
suite diventa un rito di fine giornata invece di uno strumento. Le prove lente esistono e sono
necessarie, ma stanno in fasce diverse della pipeline (vedi
[`09-integrazione-continua-e-rilascio.md`](./09-integrazione-continua-e-rilascio.md) §3).

**Le prove di dominio sono la base larga perché il dominio è la parte che conta.** La regola di
dipendenza n. 5 di [`02-backend.md`](./02-backend.md) §1 esiste esattamente per questo: un dominio
senza dipendenze infrastrutturali è un dominio che si prova migliaia di volte al giorno.

---

## 2. Regole di scrittura

Poche e non negoziabili, perché una prova instabile è peggio di una prova assente: consuma tempo
e insegna a ignorare i fallimenti.

1. **Deterministica.** Nessuna dipendenza dall'ora del sistema, dall'ordine di esecuzione, da uno
   stato condiviso, da una risorsa esterna, da un numero casuale non seminato. Una prova che
   fallisce a intermittenza va **riparata o rimossa nella stessa giornata**, non annotata.
2. **Orologio iniettato.** Nessuna chiamata diretta all'ora corrente nel codice di produzione.
   È ciò che rende provabili scadenze, finestre di attesa, validità temporali dei consensi e dei
   ruoli - cioè gran parte del dominio.
3. **Nessuna attesa a tempo fisso.** Si attende una **condizione**, con un limite. Un'attesa a
   tempo fisso è instabilità garantita su una macchina più lenta.
4. **Isolamento reale.** Ogni prova di integrazione parte da uno stato noto e non lascia residui.
   Il contenitore effimero è per classe di prove, e lo schema è ricreato.
5. **Il nome descrive il comportamento**, non il metodo invocato. Il nome della prova è la
   documentazione che si legge quando fallisce.
6. **Una prova, un'asserzione concettuale.** Una prova che verifica cinque cose fallisce sulla
   prima e nasconde le altre quattro.

---

## 3. Prove a contratto

### 3.1 Il perimetro

Il vincolo [V-160](../11_registri/01-vincoli-in-vigore.md#v-160) di `INTEG` definisce che cosa è contratto pubblico. Questa area lo recepisce
integralmente e ne trae la conseguenza operativa: **ciò che è contratto ha una prova a contratto;
ciò che non lo è, non ce l'ha e può cambiare**. Estendere le prove a contratto oltre il perimetro
significa congelare per sbaglio dettagli interni.

Elementi coperti: percorsi, metodi, parametri e schemi dell'interfaccia applicativa; profili
clinici pubblicati e documento di capacità; tipi di evento e relativi schemi; ambiti di
autorizzazione; identificativi di tipo di problema e codici di esito; interfacce dei moduli
sostituibili; protocollo di messaggistica del componente incorporabile e insieme chiuso delle
proprietà di tema.

### 3.2 Le due direzioni

**Come fornitore.** La suite verifica che l'interfaccia esposta corrisponda al documento di
interfaccia versionato e che **le modifiche siano additive**. Il confronto fra la specifica del
ramo principale e quella della modifica proposta produce un elenco di differenze, e una
differenza non additiva - rimozione di un campo, restringimento di un tipo, aggiunta di un
obbligo, rimozione di un valore da un'enumerazione - **fa fallire la costruzione**, a meno che la
modifica non dichiari esplicitamente una nuova versione maggiore.

Lo stesso vale per gli schemi degli eventi e per i profili clinici: uno schema che restringe è uno
schema che rompe un consumatore.

**Come consumatore.** Verso i sistemi esterni - prodotto di federazione, gateway delle
terminologie, sistemi regionali - le prove verificano che le **assunzioni** del progetto siano
esplicite e provate contro un doppio di prova costruito sulla specifica pubblicata, non su
osservazione empirica. Quando la specifica cambia, la prova fallisce, ed è precisamente ciò che
serve.

### 3.3 Webhook

I messaggi in uscita verso terzi hanno una suite propria, perché sono il punto in cui i difetti
si manifestano dal lato di qualcun altro:

- **firma verificabile** con il materiale pubblico dichiarato dal progetto, secondo il vincolo
  [V-162](../11_registri/01-vincoli-in-vigore.md#v-162) di `INTEG` - firma asimmetrica con identificativo di chiave risolvibile, non segreto
  condiviso;
- **nessun contenuto clinico nella busta**, secondo il vincolo [V-161](../11_registri/01-vincoli-in-vigore.md#v-161) di `INTEG`: una prova ispeziona
  ogni tipo di evento e fallisce se un campo clinico compare;
- **ritentativi con attesa esponenziale e jitter**, con verifica che il ricevente non riceva
  raffiche;
- **idempotenza dal lato del ricevente**: la stessa busta consegnata due volte porta la stessa
  chiave di deduplicazione;
- **comportamento verso indirizzi ostili**: un indirizzo di destinazione fornito dall'utente è una
  richiesta uscente verso un indirizzo arbitrario, e le prove verificano che gli indirizzi interni
  siano rifiutati.

---

## 4. Dati sintetici

### 4.1 Il divieto

**Nessun dato reale**, in codice, prove, esempi, registri, documentazione, ambienti di sviluppo o
prove di carico. È il vincolo trasversale della base architetturale §11.2 e non ammette eccezioni
motivate dalla comodità.

Il punto in cui il divieto si viola più spesso non è il codice: è l'ambiente di collaudo popolato
con un'esportazione dell'esercizio «anonimizzata». L'anonimizzazione di dati clinici longitudinali
è, nella pratica, molto meno efficace di quanto si creda, e la reidentificazione a partire da
combinazioni di attributi è un risultato consolidato. La regola del progetto è più semplice e più
sicura: **si genera, non si anonimizza**.

### 4.2 Le fabbriche

I dati di prova nascono da **fabbriche versionate**, con valori predefiniti sensati e sostituzione
esplicita di ciò che la prova sta verificando. Il vantaggio non è la brevità: è che quando il
modello cambia, cambia la fabbrica e non trecento prove.

Requisiti delle fabbriche:

- **identificativi sintetici riconoscibili come tali**, costruiti in modo da non poter coincidere
  con identificativi reali attribuiti a persone. Un identificativo generato «a caso» con
  l'algoritmo reale **può collidere con quello di una persona esistente**: è un errore che si
  commette in buona fede e che produce un dato personale involontario;
- **valori clinici plausibili ma non tratti da casi reali**, con distribuzioni dichiarate quando
  la distribuzione conta;
- **nessun nome di persona reale**, nemmeno come esempio, nemmeno di fantasia comune;
- **nessun riferimento a organizzazioni, prodotti o marchi**: la regola R0 vale anche nei dati di
  prova.

### 4.3 Il vincolo terminologico

Le prove **non possono includere contenuto di sistemi di codifica a licenza vincolata**. È il
vincolo [V-03](../11_registri/01-vincoli-in-vigore.md#v-03) e la policy di D31-D33: nel repository non entrano concetti la cui licenza non lo
consenta, in nessuna forma, incluse le fixture di prova e le cache.

Conseguenza operativa: la suite gira con il gateway delle terminologie in **modalità degradata per
i sistemi non abilitati**, e questa è la configurazione predefinita delle prove. Ne discende un
beneficio collaterale non trascurabile: **il percorso principale viene provato in continuazione
nella configurazione senza terminologie a licenza vincolata**, che è esattamente ciò che il
vincolo [V-03](../11_registri/01-vincoli-in-vigore.md#v-03) richiede di garantire. Una modalità degradata che gira in ogni esecuzione della
suite è una modalità che funziona davvero.

---

## 5. Prove media

L'organizzazione è descritta in [`05-media-e-tempo-reale.md`](./05-media-e-tempo-reale.md) §9; qui
si registra il posto nella suite e i vincoli.

- **Due contesti di navigazione nella stessa esecuzione**, uno per il professionista e uno per
  l'assistito, con verifica della convergenza leggendo le statistiche da entrambi i lati.
- **Sorgenti sintetiche deterministiche** con i flag verificati, incluso quello che accetta i
  permessi di camera e microfono **senza** accettare la cattura dello schermo - necessario perché
  il flusso di consenso alla condivisione dello schermo è un caso d'uso reale del prodotto e deve
  poter essere provato.
- **Profili di rete come costanti condivise**, incluso il profilo limite, che verifica il degrado
  e l'avviso, non il buon funzionamento.
- **Asimmetria dichiarata fra i motori**: la misura automatica della latenza da obiettivo a
  schermo è realizzabile su uno solo. Sugli altri la copertura è limitata e lo si dichiara, invece
  di lasciar credere che sia uniforme.
- **Asserzioni su fatti osservabili**, non su «funziona»: stato raggiunto entro il limite, tipo dei
  candidati coerente con lo scenario, **suite di cifratura presente e non degenere**, byte video in
  ingresso crescenti, avviso emesso quando e solo quando la soglia è superata, riga corrispondente
  nel tracciamento.

L'asserzione sulla cifratura merita una nota: è un controllo di rischio a costo praticamente nullo
che trasforma un'affermazione di sicurezza in un fatto verificato a ogni esecuzione della suite.

---

## 6. Accessibilità

### 6.1 Tre livelli, e il primo non basta

**Automatico.** Regole applicate al DOM renderizzato di ogni schermata e di ogni stato
significativo - non solo lo stato iniziale: modale aperta, errore mostrato, elenco vuoto, elenco
lungo, caricamento in corso. Gira su ogni modifica proposta e **blocca**.

**Manuale strutturato.** Percorsi completi con la sola tastiera; percorsi completi con lettore di
schermo reale su ciascuna delle combinazioni dichiarate di sistema operativo e navigatore;
verifica a ingrandimento; verifica con preferenze di sistema attive. Ha una lista di controllo
versionata e un esito registrato per rilascio.

**Con utenti rappresentativi.** È l'ingegneria dell'usabilità richiesta da IEC 62366-1, resa
obbligatoria da D12: valutazione **formativa** durante lo sviluppo e valutazione **sommativa** con
utenti rappresentativi prima del rilascio. Gli utenti rappresentativi **comprendono assistiti
anziani e persone con disabilità**: D25 lo dichiara e vale la pena ripeterlo, perché non sono un
caso limite, sono la popolazione di riferimento.

### 6.2 Che cosa l'automazione non intercetta

Va scritto, perché è la ragione per cui i tre livelli esistono. L'automazione non intercetta: un
ordine di fuoco tecnicamente corretto ma incomprensibile; un testo alternativo presente ma
inutile; un annuncio dinamico che arriva nel momento sbagliato o si sovrappone; un'etichetta
corretta ma con un linguaggio che l'utente non capisce; una sequenza di passi formalmente
accessibile ma cognitivamente insostenibile per chi non ha dimestichezza; un errore che dice che
cosa è sbagliato ma non come si corregge.

Sono precisamente i difetti che rendono inutilizzabile un servizio a chi ne ha più bisogno.

### 6.3 I criteri come prove

I criteri M1-M8 e A1-A10 di [`04-frontend.md`](./04-frontend.md) §§6–7 **non sono una lista di
buone intenzioni**: ciascuno ha, nella colonna di destra, il modo in cui se ne prova la
violazione. Un criterio senza una prova che possa fallire è un criterio che nessuno rispetta.

Due prove meritano menzione separata perché verificano un divieto invece di una capacità: la prova
che tenta di **occultare l'indicatore di registrazione** con ogni mezzo previsto dalla
configurazione e deve fallire in tutti; e la prova che tenta di **salvare una configurazione di
tema che degrada il contrasto** e deve essere rifiutata al salvataggio, non accettata con un
avviso (vincolo [V-163](../11_registri/01-vincoli-in-vigore.md#v-163) di `INTEG`).

---

## 7. Prove di sicurezza

| Tipo | Che cosa cerca | Frequenza |
|---|---|---|
| Analisi statica del codice | Difetti noti, interrogazioni costruite per concatenazione, uso di primitive vietate, sezioni sincronizzate con attese | Ogni modifica proposta |
| Analisi delle dipendenze | Vulnerabilità note nei componenti di terze parti | Ogni modifica e su pianificazione |
| Ricerca di segreti | Credenziali nei sorgenti e nella cronologia | Ogni modifica, con blocco |
| Analisi dinamica | Superficie esposta dell'applicazione in esecuzione | Su pianificazione |
| **Prove di abuso sul confine di autorizzazione** | Token manomessi, scaduti, con emittente errato, con destinatario errato, con chiave non consentita, con delega falsificata, riusati fra tenant | Ogni modifica del componente |
| **Prove di isolamento fra tenant** | Tentativi deliberati di leggere e scrivere dati di un altro tenant, per ogni contesto e per ogni interfaccia | Ogni modifica |
| Prove di configurazione della federazione | I tre difetti noti di §8.2 di [`01-stack-e-motivazioni.md`](./01-stack-e-motivazioni.md) restano chiusi | Ogni modifica della configurazione |
| Verifica del profilo di esercizio | Nessuna scorciatoia di sviluppo attiva | All'avvio e in pipeline |

**Le prove di isolamento fra tenant sono le più importanti dell'intera suite.** Una fuga fra
tenant in un sistema sanitario non è un difetto: è una violazione notificabile. Le prove non si
limitano a verificare che l'accesso legittimo funzioni: **tentano attivamente l'accesso
illegittimo**, per ogni contesto, per ogni interfaccia, e in condizioni avverse - pool di
connessioni esaurito, contesto non risolto, richiesta senza tenant, tenant sostituito a metà
percorso. Verificano inoltre, interrogando il catalogo di sistema, che le politiche siano attive e
che il proprietario degli oggetti non ne sia esente (vedi
[`03-persistenza.md`](./03-persistenza.md) §2.2–2.3).

Le verifiche periodiche indipendenti - analisi del modello di minaccia, prove di penetrazione
esterne - sono previste da D10 e appartengono a `docs/06_security/`.

---

## 8. Copertura

### 8.1 La soglia e il suo significato

D10 fissa la copertura minima all'ottanta per cento, imposta in integrazione continua. Questa area
la recepisce e aggiunge due precisazioni che ne determinano l'utilità reale.

**La copertura è una condizione necessaria, non sufficiente.** Misura quali righe sono state
eseguite, non se il comportamento è stato verificato. Una suite che esegue tutto il codice senza
asserire nulla raggiunge una copertura eccellente e non prova niente.

**La soglia è differenziata, non uniforme.** Una soglia unica premia la copertura del codice
banale e non chiede nulla al codice che conta.

| Ambito | Soglia |
|---|---|
| Confine di autorizzazione, scambio di token, contesto di tenant | Sostanzialmente totale sul percorso di decisione |
| Dominio clinico: invarianti, macchine a stati, valutazione delle soglie | Alta, con copertura dei rami |
| Contesti applicativi | Soglia generale |
| Infrastruttura e adattatori | Soglia generale, coperti dalle prove di integrazione |
| Codice generato, configurazione, assemblaggio | Escluso, con esclusione dichiarata ed elencata |

Le esclusioni sono **elencate esplicitamente e revisionate**: una regola di esclusione generica è
il modo più rapido di rendere la metrica priva di significato.

### 8.2 La misura che dice davvero qualcosa

Sui moduli critici - confine di autorizzazione, dominio clinico, valutazione delle soglie - si
aggiunge la **copertura per mutazione**: si introducono modifiche automatiche al codice e si
verifica che le prove le rilevino. È la sola misura che distingua una suite che verifica da una
suite che esegue.

Ha un costo di tempo di esecuzione rilevante e per questo gira su un sottoinsieme e su
pianificazione, non a ogni modifica. Ma è ciò che, su una richiesta di dimostrare l'efficacia
della verifica, si può mostrare.

---

## 9. Tracciabilità

### 9.1 Perché è la parte irreversibile

La tracciabilità da requisito ad architettura, a unità, a prova è condizione di certificabilità
(D12, conseguenza 6) e **non si ricostruisce a posteriori**: D45 la elenca fra le attività
retroattivamente irrecuperabili, insieme all'inventario dei componenti di terze parti. Gli
identificativi prodotti nella fase di ricerca **non vanno mai rinumerati**.

### 9.2 Il meccanismo

Ogni prova che verifica un requisito ne porta l'identificativo come annotazione strutturata. La
matrice di tracciabilità è **generata** dall'esecuzione della suite, non compilata a mano.

```java
// Illustrativo.
@Test
@Requisito({"RF-0142", "RNF-0031"})
@ControlloDiRischio("RC-0007")
void avvisa_il_professionista_quando_la_qualita_scende_sotto_la_soglia_di_inidoneita() {
    // ...
}
```

Il rapporto di tracciabilità è un **artefatto di rilascio**, prodotto dalla pipeline e conservato
con la versione. Contiene tre viste:

1. **Requisito → prove**, con l'esito dell'ultima esecuzione.
2. **Requisito senza prove** - l'elenco che conta davvero. È vuoto o è una lista di lacune
   dichiarate, con motivazione.
3. **Controllo di rischio → prove**, che è la vista richiesta da chi verifica la gestione del
   rischio, e che collega la verifica tecnica al file dei rischi.

### 9.3 Le regole che lo tengono in piedi

- **Un identificativo di requisito citato in una prova ma inesistente nel registro fa fallire la
  costruzione.** Senza questo controllo, la matrice si popola di riferimenti a requisiti
  rinominati o eliminati.
- **Un requisito senza prove non blocca**, ma compare nel rapporto e va giustificato al rilascio.
  Bloccare produrrebbe l'effetto opposto a quello voluto: prove finte scritte per soddisfare il
  controllo.
- **La matrice si genera a ogni costruzione**, non a fine progetto. Una matrice prodotta una volta
  sola è già obsoleta quando viene letta.

---

## 10. Che cosa la suite non prova, e va detto

- **Non prova l'adeguatezza clinica.** Che il sistema funzioni non dice che l'uso previsto sia
  clinicamente appropriato: quella è la valutazione clinica, con tempi e metodo propri (D47).
- **Non prova l'accessibilità reale.** Ne prova la parte automatizzabile, che è minoritaria. Il
  resto sono §6.1, livelli due e tre.
- **Non prova il comportamento su ogni dispositivo.** Il parco di dispositivi reali è per
  definizione più ampio della matrice di prova, e la matrice va **dichiarata**: che cosa è provato
  e che cosa no.
- **Non sostituisce la sorveglianza dopo il rilascio.** Il comportamento in campo produce
  informazioni che nessuna prova produce, ed è il motivo per cui esiste la sorveglianza
  post-commercializzazione.

---

**Prosegue in**: [`09-integrazione-continua-e-rilascio.md`](./09-integrazione-continua-e-rilascio.md),
dove queste prove diventano controlli obbligatori di una pipeline.
