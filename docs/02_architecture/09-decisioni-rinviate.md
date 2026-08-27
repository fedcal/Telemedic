---
title: Decisioni rinviate
sidebar_position: 10
description: Ciò che quest'area deliberatamente non decide - con il criterio con cui andrà deciso, chi decide, che cosa serve per decidere, entro quando la decisione va presa e che cosa accade se non viene presa.
---

# Decisioni rinviate

## 1. Perché un capitolo sulle non decisioni

Un'architettura che pretende di aver deciso tutto sta nascondendo qualcosa. Le decisioni prese
senza informazioni sufficienti hanno lo stesso aspetto di quelle prese con cognizione, e la
differenza si manifesta quando è costoso correggere.

Questo capitolo elenca ciò che **non è deciso**, e per ciascun punto dichiara: la domanda, le
opzioni con i loro compromessi, il criterio con cui si deciderà, che cosa serve per poter decidere,
chi decide, entro quale momento la decisione va presa e che cosa accade se non viene presa.

Vale una regola operativa: **una decisione elencata qui non può essere presa d'ufficio in una pull
request**. Chi si imbatte in una di queste questioni durante la realizzazione apre una voce in
bacheca; non sceglie l'opzione più comoda per proseguire.

Ne discende la regola simmetrica, che vale nel momento in cui una decisione viene presa: **la voce
esce da questo capitolo**, e il riepilogo di §5 registra l'atto che l'ha chiusa. Tenerla elencata
dopo che è stata decisa non è un residuo innocuo: finché compare qui, chi realizza secondo la
decisione presa sta violando, formalmente, la regola del capoverso precedente. La prima voce a
uscire per questa via è `B-4`, il registro unico della fiducia verso gli integratori, chiusa il 25
agosto 2026 da [ADR-0029](../adr/0029-registro-di-fiducia-unico-per-tenant.md): una sola fonte di
verità per tenant, con le capacità concesse dichiarate voce per voce.

Le decisioni rinviate si dividono in tre famiglie:

| Famiglia | Chi decide | Che cosa serve |
|---|---|---|
| **A - Rinviate a una verifica** | Quest'area, dopo la verifica | Una misura o una prova empirica |
| **B - Rinviate ad altra area** | L'area competente | La competenza specifica |
| **C - Rinviate al committente** | Il committente | Una scelta di prodotto o di rischio |

## 2. Famiglia A - In attesa di una verifica

### A-1 - Meccanismo di realizzazione dell'orchestrazione

**Che cosa è già deciso**: i processi clinici critici sono **orchestrati**, non coreografati, e lo
stato del processo è interrogabile. È deciso perché vincola le altre aree.

**Che cosa non è deciso**: il meccanismo. Motore di flusso di lavoro dedicato, macchina a stati
persistita in tabella con un componente applicativo, oppure componente applicativo con
riprogrammazione basata su tempi.

| Opzione | Compromesso |
|---|---|
| Motore dedicato | Funzioni pronte per compensazione, tempi e ripresa; **un componente di terze parti in più** da censire, aggiornare e installare anche presso il cliente |
| Macchina a stati persistita | Nessun componente aggiunto; il codice di ripresa, di tempo scaduto e di compensazione è a carico del progetto |
| Componente applicativo con tempi | Il più leggero; il più fragile sulle riprese dopo un riavvio |

**Criterio di decisione**: il peso sull'installazione presso il cliente ha precedenza sulla
comodità di sviluppo; il numero di processi orchestrati individuati è quattro, e con questa
cardinalità il costo di un motore dedicato è difficile da giustificare.

**Che cosa serve**: un prototipo del processo di chiusura, refertazione e trasmissione realizzato
con la macchina a stati persistita, con misura del codice necessario alla ripresa e alla
compensazione.

**Entro quando**: prima della realizzazione del secondo processo orchestrato. Il primo può essere
scritto con la macchina a stati e migrato; il secondo cristallizzerebbe la scelta.

**Se non viene presa**: ogni processo verrà realizzato in modo diverso e la proprietà «lo stato del
processo è interrogabile» resterà vera per alcuni e falsa per altri.

### A-2 - Modalità di lettura dell'outbox in assetti ad alto volume

**Che cosa è già deciso**: l'interrogazione periodica è la modalità **predefinita**, in entrambi
gli assetti, e la cattura delle modifiche dal registro di replica resta un'opzione dichiarata.

**Che cosa non è deciso**: la soglia di volume oltre la quale l'opzione diventa raccomandata, e se
adottarla nel servizio gestito.

**Criterio**: si adotta solo se l'interrogazione periodica non regge il volume misurato con
l'intervallo necessario a rispettare il ritardo dichiarato, e solo dopo che il componente è stato
censito nell'inventario dei componenti di terze parti.

**Che cosa serve**: misura del ritardo del relay a volumi crescenti, su dati sintetici.

**Entro quando**: non prima che esista un volume reale. È una decisione che non va anticipata.

**Se non viene presa**: nulla di grave. È l'unica di questo elenco che può restare aperta a lungo
senza costo, perché il contratto degli eventi non cambia fra le due modalità.

### A-3 - Convivenza con la revisione successiva dello standard di interoperabilità

**Che cosa non è deciso**: se e quando affiancare la revisione successiva a quella adottata, e in
quale forma - percorsi di base distinti oppure negoziazione del contenuto.

| Opzione | Compromesso |
|---|---|
| Percorsi di base distinti | Instradamento e cache semplici; due superfici da documentare |
| Negoziazione del contenuto | Una sola superficie; instradamento e cache più delicati, e maggiore probabilità di errore da parte dell'integratore |

**Criterio**: la scelta segue la domanda reale degli integratori, non l'evoluzione dello standard.
Finché le guide nazionali adottate sono sulla versione corrente, affiancare la successiva aggiunge
superficie senza aggiungere interoperabilità.

**Che cosa serve**: almeno un integratore che la richieda, e la pubblicazione di guide nazionali
sulla nuova versione.

**Entro quando**: non è urgente. Il vincolo da rispettare da subito è che il modello di dominio non
conosca la versione dello standard, che è già una verifica automatica.

### A-4 - Rappresentazione dell'endpoint di sessione in FHIR

**Che cosa è già deciso**: l'indirizzo della sessione **non si espone** nel piano clinico; è una
capacità del piano applicativo.

**Che cosa non è deciso**: che cosa fare quando un integratore richieda comunque una
rappresentazione nel formato di scambio. Sistema di codifica di progetto, oppure il pacchetto
ufficiale di estensioni di versione incrociata.

**Criterio**: il pacchetto di estensioni è preferibile in linea di principio perché standard, ma
**non è adottabile finché è in stato preliminare**. Un sistema di codifica di progetto è
sostituibile e dichiarabile come tale.

**Che cosa serve**: verifica dello stato di pubblicazione del pacchetto al momento della
realizzazione.

**Entro quando**: alla prima richiesta di un integratore.

## 3. Famiglia B - Rinviate ad altra area

### B-1 - Parametri del registro immutabile

**Non deciso**: intervallo di ancoraggio, forma dell'attestazione temporale, conservazione degli
ancoraggi, cadenza delle verifiche di integrità, forma minima dell'origine della richiesta
compatibile con la minimizzazione.

**Chi decide**: area di sicurezza, con `COMP` per le implicazioni probatorie.

**Che cosa quest'area ha già fissato**: la combinazione dei quattro strati, la catena per tenant,
la conservazione separata, il carattere bloccante della scrittura, l'elenco chiuso di ciò che non
compare, la verificabilità indipendente dell'estratto.

**Perché non decide quest'area**: l'ampiezza della finestra di vulnerabilità residua è un
parametro di rischio, e la sua determinazione appartiene a chi conduce l'analisi dei rischi.

**Se non viene presa**: il meccanismo è realizzabile lo stesso con un intervallo provvisorio, ma la
garanzia dichiarabile pubblicamente non è determinabile.

### B-2 - Motore e archivio del registro immutabile

**Non deciso**: se l'archivio del registro possa essere lo stesso motore dell'archivio applicativo
con credenziali e privilegi disgiunti, oppure debba essere un motore diverso.

**Chi decide**: area di sicurezza.

**Perché conta**: incide direttamente sul peso dell'installazione presso il cliente. Un motore in
più è un componente in più da installare, aggiornare e mettere in sicurezza in un'organizzazione
che non è un fornitore di servizi informatici.

**Criterio suggerito da quest'area**: la separazione dei **privilegi** è il requisito; la
separazione del **motore** è una realizzazione possibile di quel requisito, non il requisito
stesso. Se la separazione dei privilegi è dimostrabile sullo stesso motore, il motore aggiuntivo
non è giustificato.

### B-3 - Estensione della politica terminologica alle scale e ai questionari clinici validati

**Non deciso**: se e come il sistema possa calcolare punteggi di scale e questionari clinici
validati, che hanno licenze proprie distinte da quelle delle terminologie.

**Chi decide**: `COMP`, con quest'area per le conseguenze strutturali.

**Perché è bloccante**: la questione va chiusa **prima** che venga scritto il primo motore di
calcolo. Scriverlo e poi scoprire che lo strumento non è utilizzabile significa rimuovere una
funzione già promessa.

**Conseguenza già assunta in via cautelativa**: il modello di dominio **non rappresenta punteggi di
scale cliniche** e il contesto di telemonitoraggio non li calcola. La risposta a questionari
strutturati è rappresentata e conservata; il punteggio no.

**Criterio suggerito**: la stessa tassonomia a regimi già adottata per le terminologie -
coesistenza piena, collocazione separata con licenza propria, acquisizione a carico di chi
installa, esclusione totale - applicata strumento per strumento, verificando la licenza primaria e
non la dichiarazione del contenitore che lo ricomprende.

### B-5 - Convenzioni delle interfacce pubbliche

**Non deciso**: dieci convenzioni oggi enunciate come proposte - collocazione della versione, esito
per la precondizione richiesta sulle risorse cliniche, esito che non rivela l'esistenza di una
risorsa non accessibile, conservazione delle chiavi di idempotenza, forma delle intestazioni di
limitazione del traffico, durata del preavviso di dismissione, magrezza del contenuto nei messaggi
in uscita, politica di ritentativo, versionamento del tipo degli eventi, introspezione sulle
operazioni ad alto impatto.

**Chi decide**: quest'area, come registro cumulativo delle convenzioni; l'area dei protocolli le
documenta.

**Stato**: **decise** e raccolte in un registro dedicato, con quattro correzioni verificate da
recepire - la natura di standard di alcune intestazioni citate, la forma corrente delle
intestazioni di limitazione del traffico, l'identificativo corretto della specifica dei dettagli di
errore, e il fatto che la busta di evento **non prevede un'intestazione dedicata per l'attributo di
tipo di contenuto**.

**Nota**: due delle dieci hanno conseguenze architetturali e non solo protocollari, e sono trattate
nel corpo dell'area: la magrezza del contenuto degli eventi e il versionamento del tipo.

### B-6 - Soglie di sorveglianza e livelli di servizio

**Non deciso**: le soglie della sorveglianza continua e i livelli di servizio attesi, distinti da
quelli previsti dalla normativa sulle infrastrutture regionali.

**Chi decide**: area di sicurezza e roadmap.

**Che cosa quest'area ha già fissato**: **che cosa** va sorvegliato - in particolare la profondità
della coda dei messaggi non elaborabili, il ritardo del relay dell'outbox e l'esito delle verifiche
di integrità del registro - perché la loro assenza rende invisibili guasti silenziosi.

### B-7 - Materiale documentale per le tipologie di documento sanitario

**Non deciso**: modelli di documento strutturato, codici documentali e metadati di indicizzazione
per le tipologie documentali di telemedicina, non pubblicamente disponibili.

**Chi decide**: `COMP`, che ha in carico l'interlocuzione.

**Perché quest'area può procedere comunque**: il contenuto informativo è modellato come **dataset
canonico** e ogni serializzazione è sostituibile. L'arrivo del materiale sarà la scrittura di un
mappatore, non una migrazione del modello.

### B-7-bis - Conferma di conformità dell'insieme dei costrutti delle regole del piano

**Non deciso**: se l'insieme chiuso dei costrutti adottati per le regole del piano di
telemonitoraggio (ADR-0026) resti dentro la destinazione d'uso congelata.

**Chi decide**: `COMP`.

**Che cosa quest'area ha già fissato**: l'insieme è **chiuso**, ciascun costrutto ha semantica
dichiarata e prove proprie, non esistono costrutti che deducano soglie da popolazione o storico né
che interpolino le serie, e l'esecutore di logica clinica generica è **assente per costruzione, non
disattivato per configurazione**.

**Perché conta**: l'insieme dei costrutti sarà oggetto di pressione per essere ampliato. Ogni
ampliamento è una decisione di perimetro e va trattato come tale, non come richiesta di
funzionalità. Serve un criterio di conformità stabilito **prima** della prima richiesta.

### B-9 - Contratto minimo del gateway di misure di terze parti

**Non deciso** (da verificare con `INTEG` `[NV]`): se i gateway di mercato espongano il **segnale di presenza periodico
indipendente dalla misura** e la **telemetria di stato del dispositivo**.

**Chi decide**: `INTEG`, con verifica di mercato; conseguenze di sicurezza a carico
dell'`FUNZ`.

**Conseguenza architetturale**: senza quei due elementi la tassonomia del silenzio perde le
categorie tecniche, e il sistema non distingue «il dispositivo non ha misurato» da «il dispositivo
non ha trasmesso». Quest'area assume in via cautelativa che l'assenza di misura sia rappresentata
comunque come entità, con la causa marcata come **non determinabile** invece che dedotta.

### B-8 - Propagazione del livello di garanzia attraverso l'intermediazione

**Non deciso** (questione `Q-160` `[NV]`): se il prodotto di federazione, agendo verso un fornitore di identità
esterno, **inoltri il livello richiesto** attraverso il realm di intermediazione. Se non lo
inoltra, l'innalzamento di livello per operazione non è ottenibile per sola configurazione.

**Chi decide**: verifica empirica a carico dell'`INTEG` e dell'`TECH`.

**Perché è sul percorso critico**: la documentazione pubblica non può descrivere come si propaga il
livello di garanzia prima che la verifica sia stata fatta. Il costo della verifica è quasi nullo;
il costo di aver documentato un comportamento inesistente non lo è.

## 4. Famiglia C - Rinviate al committente

### C-1 - Il contesto della rendicontazione

**La domanda**: la formazione dell'evento rendicontabile è un **quattordicesimo contesto
delimitato**, oppure resta distribuita fra il contesto della prestazione e quello di frontiera?

**Perché non la decide quest'area**: modificare l'elenco dei contesti della base architetturale
vincolante eccede il mandato di un'area. La base è vincolante e il protocollo prevede che lo
scostamento sia dichiarato e deciso a valle.

**Posizione argomentata di quest'area**: **contesto autonomo**. La ragione decisiva non è di
eleganza ma di verificabilità: esiste un vincolo secondo cui il profilo di integrazione del
pagatore è amministrativo per costruzione e non può in alcun modo costituire un percorso verso il
contenuto clinico. Con un contesto autonomo quel vincolo è un **confine**, verificabile
automaticamente; senza, è una convenzione di codice, verificabile solo con una prova dedicata e
soggetta all'erosione.

**Stato provvisorio**: la responsabilità resta dove la base la lascia implicitamente, **con
l'avvertenza esplicita** che il vincolo è una convenzione e non un confine, e con una prova
dedicata che ne accerta il rispetto.

**Se non viene presa**: il sistema funziona. Il rischio è che un evento destinato alla liquidazione
acquisisca, in una versione successiva, un riferimento a un documento clinico senza che nulla lo
impedisca strutturalmente.

### A-5 - Il numero massimo di partecipanti alla sessione

**Che cosa è già deciso** (ADR-0028): la sessione resta **a maglia senza componente centrale**,
perché è l'unica topologia che preserva la cifratura fino agli estremi; **il limite è dichiarato e
applicato dal codice** con un errore comprensibile al partecipante eccedente; il limite è
configurazione con un massimo imposto, non costante di codice.

**Che cosa non è deciso**: il **numero**. Dipende dal budget di banda in trasmissione del
partecipante peggio connesso, e quel budget si misura su un dispositivo e una rete di riferimento
che non sono ancora dichiarati.

**Criterio**: il massimo è il numero oltre il quale il partecipante di riferimento non regge il
proprio budget di trasmissione con margine. **Misurato, non stimato.**

**Che cosa serve**: la dichiarazione del dispositivo e della rete di riferimento - che è decisione
di prodotto - e poi la misura.

**Se non viene preso**: se la misura dovesse escludere il terzo partecipante, la misura alternativa
dichiarata per una non conformità di accessibilità nota andrebbe riesaminata. È una dipendenza da
segnalare, non da scoprire.

### C-2 - Introdurre un componente che termina la cifratura per aumentare i partecipanti

**La domanda**: si accetta di introdurre, in futuro, un componente che ridistribuisce i flussi e
che **termina la cifratura**, per superare il limite della topologia a maglia?

**Perché non la decide quest'area**: è una decisione di sicurezza e di perimetro di prodotto, della
stessa natura di quella sulla registrazione lato server. Il sistema avrebbe una **terza modalità
operativa** con proprietà di sicurezza diverse, e la modalità predefinita non sarebbe più la più
forte in tutti gli scenari.

**Stato**: **esclusa per la versione corrente** (ADR-0028). Riapribile solo come decisione di
sicurezza esplicita, mai come estensione tecnica.

### C-3 - Contenitore del materiale registrato

**La domanda**: quale contenitore per il materiale registrato lato server.

**Perché non la decide quest'area**: il contenuto pubblico originario del progetto dichiarava un
contenitore specifico, e la correzione di un contenuto pubblico è materia del committente.

**Vincolo già in vigore**: il contenitore è **negoziato a runtime, mai assunto**. Nessun documento
del progetto può dichiarare un contenitore come garantito prima della verifica sui browser
effettivamente supportati.

### C-4 - Periodo di supporto dichiarato

**La domanda**: la durata del periodo di supporto che il progetto dichiara per gli artefatti
distribuiti.

**Perché non la decide quest'area**: è un impegno del soggetto che distribuisce, con conseguenze
regolatorie ed economiche.

**Conseguenza architetturale**: la durata determina per quanto tempo una versione maggiore delle
interfacce pubbliche resta attiva, e quindi quante versioni devono poter coesistere. Non è un
parametro neutro: due versioni maggiori attive contemporaneamente sono un impegno di manutenzione
permanente.

## 5. Riepilogo

| # | Questione | Famiglia | Decide | Urgenza |
|---|---|---|---|---|
| A-1 | Meccanismo dell'orchestrazione | A | ARCH | Prima del secondo processo orchestrato |
| A-2 | Lettura dell'outbox ad alto volume | A | ARCH | Non urgente |
| A-3 | Convivenza con la revisione successiva dello standard | A | ARCH | Non urgente |
| A-4 | Rappresentazione dell'endpoint di sessione | A | ARCH | Alla prima richiesta |
| A-5 | Numero massimo di partecipanti | A | ARCH, dopo misura | Prima della progettazione del piano media |
| B-1 | Parametri del registro immutabile | B | SEC, COMP | Prima della dichiarazione pubblica della garanzia |
| B-2 | Motore e archivio del registro | B | SEC | Prima della definizione di dispiegamento |
| B-3 | Licenze di scale e questionari | B | COMP | **Prima del primo motore di calcolo** |
| B-4 | Registro unico della fiducia | B | INTEG, SEC | **Decisa**: [ADR-0029](../adr/0029-registro-di-fiducia-unico-per-tenant.md). Non è più una decisione rinviata |
| B-5 | Convenzioni delle interfacce | B | ARCH, PROTO | Decise; restano le correzioni da recepire |
| B-6 | Soglie di sorveglianza | B | SEC, ROAD | Prima dell'esercizio |
| B-7 | Materiale documentale | B | COMP | Non blocca la modellazione |
| B-7-bis | Conformità dei costrutti delle regole del piano | B | COMP | Prima della prima richiesta di ampliamento |
| B-9 | Contratto minimo del gateway di misure | B | INTEG, FUNZ | Prima della prima integrazione di un gateway |
| B-8 | Propagazione del livello di garanzia | B | INTEG, TECH | **Prima della documentazione pubblica del meccanismo** |
| C-1 | Contesto della rendicontazione | C | Committente | Prima della realizzazione dell'evento di liquidazione |
| C-2 | Componente che termina la cifratura per aumentare i partecipanti | C | Committente | Solo se e quando riaperta |
| C-3 | Contenitore del materiale registrato | C | Committente | Prima della comunicazione pubblica |
| C-4 | Periodo di supporto dichiarato | C | Committente | Prima della prima distribuzione |

Tre righe sono in grassetto perché il costo di decidere tardi è qualitativamente diverso dal costo
di decidere presto: B-3 perché comporterebbe la rimozione di una funzione già scritta, B-8 perché
comporterebbe la rettifica di documentazione pubblica su un meccanismo di sicurezza, C-1 perché la
correzione richiederebbe di spostare responsabilità fra contesti dopo che il codice esiste.
