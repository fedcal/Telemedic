---
title: Attori e ruoli
sidebar_position: 2
description: Catalogo degli attori di Telemedic con obiettivo, veste giuridica, attività, dati necessari e vincoli reali di tempo, competenza digitale, dispositivo e rete; relazioni abilitanti, separazione fra ruolo tecnico e ruolo clinico, attori non umani e matrice attore per capacità.
---

# Attori e ruoli

Un attore, in questo catalogo, non è «un utente del sistema». È **un soggetto che persegue un
obiettivo determinato, in una veste determinata, con vincoli determinati**, e da cui discendono
permessi che non esistono se non li richiede una sua attività. Il criterio è di necessità: un
permesso senza un'attività che lo giustifichi è un difetto di progettazione, non una comodità.

La descrizione di ciascun attore comprende quattro elementi che nella maggior parte delle
specifiche mancano, e la cui assenza è la ragione per cui i sistemi sanitari a distanza
falliscono nell'uso reale invece che in collaudo:

- **il tempo che ha davvero a disposizione** — un medico fra due televisite ha novanta secondi,
  non «il tempo necessario»;
- **la competenza digitale che si può presumere** — che per la popolazione di riferimento del
  telemonitoraggio è bassa, e va progettata come stato normale e non come caso limite;
- **il dispositivo su cui opera davvero** — smartphone di fascia media di quattro anni fa, non
  la postazione di sviluppo;
- **la rete che ha davvero** — mobile, intermittente, con banda variabile nell'arco della stessa
  sessione.

Questi quattro vincoli non sono contesto: sono **requisiti**, e la decisione D25 del progetto li
rende criterio di accettazione di ogni schermata. Un requisito funzionale che non può essere
completato da un paziente anziano su smartphone in rete mobile, e da un professionista con la
sola tastiera e uno screen reader, non è soddisfatto.

## 1. Come si legge il catalogo

Ogni voce riporta: identificativo congelato, veste, obiettivo primario, attività, dati
strettamente necessari, vincolo di autorizzazione che ne discende, e vincoli reali di esercizio.
Gli identificativi `ATT-01` … `ATT-19` provengono dalla fase di ricerca e non sono
rinumerabili; `ATT-20` … `ATT-26` sono introdotti qui e da questo momento sono a loro volta
congelati.

Una precisazione di linguaggio che vale per tutto il documento. **Attore, ruolo e persona sono
tre cose diverse.** La persona è il soggetto fisico. Il ruolo è una **relazione fra una persona e
un'organizzazione, con validità temporale**, non un attributo permanente della persona: lo stesso
medico ha ruoli distinti in strutture distinte, con permessi distinti e agende distinte. L'attore
è la figura funzionale che questo catalogo descrive, e una persona può incarnarne più d'una nello
stesso giorno. Modellare la specialità o la professione come attributo dell'utente è l'errore
che rompe il multi-tenant al primo cliente con due sedi.

## 2. Attori che ricevono la prestazione

### ATT-01 — Assistito, paziente

**Veste**: destinatario dell'atto sanitario; titolare dei dati; nella maggioranza dei casi anche
soggetto che presta il consenso.

**Obiettivo primario**: ricevere la prestazione senza che la tecnologia diventi una barriera. Non
«usare la piattaforma»: il paziente non ha alcun interesse nel software, e ogni requisito
formulato assumendo il contrario è sbagliato in partenza.

**Attività**: verifica tecnica preventiva; lettura dell'informativa e manifestazione dei consensi;
ingresso in sala d'attesa virtuale; partecipazione alla sessione; caricamento di documenti;
inserimento manuale di misure e risposte a questionari se arruolato in telemonitoraggio;
consultazione e scaricamento dei propri documenti; disdetta e riprogrammazione; consultazione del
registro degli accessi ai propri dati.

**Dati necessari**: i propri, e nient'altro. Nessuna capacità di ricerca su altri soggetti,
nessun accesso al diario clinico interno della struttura.

**Vincolo di autorizzazione**: accesso limitato alla propria risorsa `Patient` e alle risorse che
la referenziano, con il livello di garanzia dell'identità digitale richiesto dal tenant per la
categoria di documento (`BR-018`).

**Vincoli reali.** È l'attore su cui si concentra tutto il rischio di fallimento del servizio.
Va progettato assumendo: dispositivo mobile di fascia media, spesso condiviso; rete mobile con
banda variabile; nessuna familiarità con la distinzione fra browser e motore di ricerca; nessuna
capacità di interpretare un messaggio di errore tecnico; una sola possibilità di riuscita prima
di rinunciare e telefonare alla struttura; possibile deficit visivo, uditivo, motorio o cognitivo
non dichiarato. Ne discendono, come requisiti e non come raccomandazioni: percorso unico senza
scelte iniziali, test tecnico dentro il percorso e non come opzione, istruzioni specifiche per il
browser e il sistema operativo rilevati, ripiego telefonico dichiarato in anticipo, nessuna
installazione richiesta, testo e comandi grandi per impostazione predefinita.

### ATT-02 — Caregiver

**Veste**: persona che assiste stabilmente il paziente. **Assistere non è rappresentare**: un
caregiver non presta consenso al posto di un paziente capace, in nessuna configurazione
(`BR-062`).

**Obiettivo primario**: mettere il paziente nelle condizioni di ricevere la prestazione, e
capire che cosa deve fare dopo.

**Attività**: assistenza tecnica al paziente prima e durante la sessione; presenza in sessione se
consentita; ricezione e comprensione delle istruzioni; inserimento di misure per conto del
paziente quando il piano lo prevede; gestione dei dispositivi domiciliari.

**Dati necessari**: il sottoinsieme dei dati del paziente **esplicitamente delegato**, con
ambito e scadenza.

**Vincolo di autorizzazione**: accesso derivato, a scadenza obbligatoria e revocabile in ogni
momento dal paziente; nessuna capacità di prestare consenso in sostituzione.

**Vincoli reali.** Il caregiver è spesso un figlio adulto che lavora, contattabile in fasce orarie
ristrette, che assiste **più di una persona**. Da qui due requisiti che non sono ovvi: il
contesto del soggetto assistito deve essere permanentemente visibile e non ambiguo, e il cambio
di soggetto richiede una conferma esplicita (`RF-264`) — l'inserimento di una misura sul paziente
sbagliato è uno scenario d'uso pericoloso documentato, non un'ipotesi teorica. Il caregiver ha
inoltre bisogno di un **proprio collegamento di accesso e di istruzioni scritte per chi assiste**,
diverse da quelle destinate al paziente.

### ATT-03 — Rappresentante legale

**Veste**: tutore, amministratore di sostegno, esercente la responsabilità genitoriale. Sono tre
figure con poteri diversi e vanno tenute distinte: il tutore sostituisce la volontà del
rappresentato, l'amministratore di sostegno ha poteri **delimitati dal decreto di nomina** che
possono o meno comprendere le decisioni sanitarie, l'esercente la responsabilità genitoriale
decide per il minore tenendo conto della sua opinione in ragione di età e maturità.

**Obiettivo primario**: decidere per il rappresentato, nei limiti del titolo.

**Vincolo di autorizzazione**: l'ambito dei poteri è un attributo registrato e **verificato per
atto**, non una qualifica generica (`RF-117`). Il compimento della maggiore età dell'assistito
sospende automaticamente gli accessi del rappresentante e impone una nuova configurazione delle
deleghe (`RF-118`). Trattare l'amministratore di sostegno come un tutore è l'errore più frequente
del dominio e produce un consenso invalido.

## 3. Attori clinici

### ATT-04 — Medico specialista erogante

**Obiettivo primario**: erogare l'atto e refertare in sicurezza, nel tempo che ha.

**Attività**: valutazione di eseguibilità e appropriatezza del canale; ammissione dalla sala
d'attesa; identificazione del paziente; conduzione della sessione; condivisione di documenti;
decisione di degradare, interrompere o rinviare in presenza; chiusura con esito tipizzato;
redazione e firma del referto; attivazione della procedura di emergenza.

**Vincolo di autorizzazione**: accesso subordinato a una **relazione di cura** attiva o recente;
l'accesso fuori relazione esiste ma è eccezionale, motivato, a durata finita e notificato
(`RF-019`).

**Vincoli reali.** Eroga dodici televisite in una mattina. Ha esigenze **opposte** a quelle del
paziente: densità informativa, scorciatoie da tastiera, nessuna schermata di cortesia, nessuna
finestra modale non richiesta durante l'atto. Le informazioni cliniche devono essere già presenti
al momento dell'ammissione, non dopo. Ogni campo obbligatorio aggiuntivo va giustificato: nel
dominio reale i campi obbligatori non necessari vengono compilati con valori falsi, degradando la
qualità del dato più di quanto la migliorerebbe la loro assenza. Va assunto che operi anche da
postazione condivisa e talvolta da dispositivo mobile fra un ambulatorio e l'altro.

### ATT-05 — Medico di medicina generale, pediatra di libera scelta

**Veste particolare**: titolare del rapporto di fiducia continuativo con l'assistito. È il
**destinatario naturale della comunicazione clinica** anche quando non è l'erogante, e va
modellato come destinatario, non solo come utente.

**Rilevanza funzionale specifica**: il *setting* di erogazione cambia le regole. La televisita
programmata ed erogata direttamente dal medico di assistenza primaria o dal pediatra di libera
scelta **non richiede prescrizione** e si conclude con annotazione digitale in luogo del referto
(DM 30 settembre 2022, Allegato B, sezione «Modalità di erogazione»). Il modello deve rappresentare
il *setting* come discriminante di regole (`RF-349`), non come etichetta descrittiva.

### ATT-06 — Medico consulente

**Obiettivo primario**: rispondere a un quesito clinico su materiale trasmesso, senza entrare
nella presa in carico.

**Vincolo di autorizzazione**: accesso **puntuale e limitato all'atto**, circoscritto ai soli
documenti allegati al quesito e a scadenza dopo la risposta (`BR-014`). È la differenza sostanziale
rispetto a un normale accesso clinico e va implementata come ambito effimero, non come eccezione
gestita a mano.

### ATT-07 — Infermiere

**Obiettivo primario**: erogare teleassistenza, preparare la sessione, condurre operativamente il
telemonitoraggio.

**Attività**: verifica dei prerequisiti; educazione terapeutica; raccolta e validazione di
parametri; teleassistenza; presa in carico degli allarmi clinici secondo il piano; contatto
proattivo del paziente silente.

**Vincolo di autorizzazione**: nessun accesso in scrittura alla refertazione medica; abilitazione
alla firma limitata ai propri atti professionali. La matrice di visibilità documentale dell'Allegato
3, § 5.2 del DM 19 novembre 2025 è più fine di quanto si presuma: il **referto di specialistica per
la televisita non è accessibile in consultazione a infermiere e ostetrica**, mentre lo sono la
relazione collaborativa del teleconsulto e la relazione clinico-assistenziale conclusiva della
teleassistenza. È una regola di autorizzazione da implementare e da testare, non una convenzione
organizzativa.

### ATT-08 — Psicologo, psicoterapeuta

**Vincolo di dominio non aggirabile**: se il tipo di prestazione è marcato non registrabile, la
funzione di registrazione è **assente**, e la sua abilitazione è rifiutata anche a un
amministratore (`BR-075`). Le note di seduta portano il livello di riservatezza massimo e sono
escluse dai riepiloghi aggregati di struttura.

### ATT-09 — Professionista della riabilitazione

**Vincolo funzionale**: le prestazioni vivono dentro un **progetto riabilitativo individuale**;
non esistono sedute isolate (Accordo Stato-Regioni 18 novembre 2021, rep. atti n. 231/CSR).
Modellare la teleriabilitazione come singolo contatto perde il ciclo e rende impossibile misurare
l'aderenza al programma.

### ATT-20 — Professionista responsabile del piano di telemonitoraggio

> **Identificativo introdotto da quest'area. Congelato.**

**Veste**: professionista abilitato che, nell'ambito di una presa in carico esistente, decide
l'arruolamento, redige il piano, **fissa le soglie individuali** e ne risponde clinicamente.

**Obiettivo primario**: mantenere il paziente in compenso intercettando il deterioramento nella
finestra utile, senza generare un carico di allarmi che il servizio non è in grado di sostenere.

**Attività**: valutazione di eleggibilità sulle quattro dimensioni (clinica, tecnologica, di
autonomia e competenza, di contesto); redazione e firma del piano di telemonitoraggio; definizione
di parametri, cadenze, fasce orarie, soglie, regole di comportamento in caso di violazione e item
di uscita dal canale; revisione periodica del piano; conclusione del percorso con motivazione
tipizzata.

**Dati necessari**: quadro clinico del paziente nell'ambito della presa in carico; serie storiche
dei parametri; esiti degli allarmi generati sul proprio piano; indicatori di aderenza.

**Vincolo di autorizzazione**: è l'unico ruolo che può fissare o modificare una soglia
individuale. La modifica produce una **nuova versione del piano**, con autore, motivazione e
istante di efficacia (`RF-244`); nessuna soglia è modificabile da ruoli amministrativi o tecnici,
in nessuna configurazione.

**Vincoli reali.** Redige il piano in coda a una visita, sotto pressione di tempo, ed è
esattamente il momento in cui un valore predefinito verrebbe confermato per inerzia. È la ragione
per cui il campo soglia parte **vuoto e obbligatorio** e i riferimenti del percorso si mostrano
attribuiti e in sola lettura, con un'azione esplicita di copia (`RF-240`, `RNF-104`). La
differenza fra «mostrare un riferimento attribuito» e «precompilare un campo» è invisibile a chi
scrive il codice e decisiva per chi ne risponde.

### ATT-21 — Case manager

> **Identificativo introdotto da quest'area. Congelato.**

**Veste**: figura di coordinamento continuativo della presa in carico, frequentemente un
infermiere. È elencato fra i micro-servizi essenziali del telemonitoraggio dal DM 19 novembre
2025, Allegato 3, § 4.1.

**Obiettivo primario**: essere il punto di contatto stabile del paziente e la prima linea di
risposta agli allarmi clinici.

**Attività**: sorveglianza dell'andamento; presa in carico degli allarmi entro la scadenza;
contatti programmati; contatto proattivo in caso di silenzio inspiegato; attivazione del
professionista responsabile quando il caso esce dalla propria competenza; educazione terapeutica
e rinforzo dell'aderenza.

**Vincolo di autorizzazione**: accesso al contenuto clinico limitato ai pazienti dei piani di cui
è case manager; **non può modificare le soglie**; può registrare la propria valutazione e chiudere
l'allarme con esito tipizzato nei limiti previsti dal piano.

**Vincoli reali.** Gestisce decine di pazienti contemporaneamente ed è il destinatario su cui si
scarica l'affaticamento da allarme. Da qui il requisito, tutt'altro che decorativo, di un **tetto
configurabile di allarmi per destinatario e per turno** e della misura dell'esito degli allarmi
(`RF-290`): un carico di allarmi non azionabili riduce la capacità di risposta all'allarme che
conta, e questo è un meccanismo documentato di produzione del danno, non un problema di comfort.

### ATT-22 — Operatore del centro servizi

> **Identificativo introdotto da quest'area. Congelato.**

**Veste**: ruolo **tecnico**. Il DM 21 settembre 2022 separa espressamente il centro servizi dal
centro erogatore e attribuisce a ciascuno una categoria di allarmi: al centro servizi i compiti
di manutenzione, gestione degli account, help desk per tutti gli utenti, distribuzione e
sanificazione dei dispositivi domiciliari, e la gestione degli **alert tecnici**.

**Obiettivo primario**: mantenere funzionante la catena di misura, così che il silenzio residuo
sia informativo.

**Attività**: presa in carico degli allarmi tecnici; sostituzione e taratura dei dispositivi;
assistenza al paziente sull'uso; verifica della connettività; segnalazione dei guasti sistemici.

**Vincolo di autorizzazione**: **nessun accesso al contenuto clinico**, in nessuna forma. La
separazione non è una convenzione organizzativa: è un vincolo di autorizzazione da implementare e
da testare (`BR-166`). Il tentativo di comporre un ruolo tecnico che includa permessi di lettura
clinica è rifiutato con errore di validazione, come già previsto per i ruoli amministrativi
(`BR-012`).

**Vincoli reali.** Opera su turni, spesso in copertura estesa, e riceve allarmi da molti tenant se
la piattaforma è erogata come servizio gestito. Ha bisogno di sapere **quale paziente**, ma non
**perché è in cura**: la vista tecnica mostra lo stato del dispositivo, non la condizione clinica.

### ATT-23 — Operatore del centro erogatore

> **Identificativo introdotto da quest'area. Congelato.**

**Veste**: ruolo **sanitario**. Gestisce gli **alert sanitari** e l'erogazione delle prestazioni.
Nel modello di autorizzazione è la controparte clinica di `ATT-22` e le due non si sovrappongono.

**Vincolo di autorizzazione**: accesso clinico nei limiti della relazione di cura; **non dipende
dal turno tecnico per essere raggiunto**. Una catena di escalation che, fuori dall'orario del
centro servizi, non riesce più a raggiungere un ruolo clinico è una catena rotta, e va rilevata
come tale (`RF-281`).

### ATT-25 — Redattore e approvatore del percorso di cura

> **Identificativo introdotto da quest'area. Congelato.**

**Veste**: gruppo di lavoro multiprofessionale e organo che adotta formalmente il percorso
diagnostico terapeutico assistenziale con un atto — deliberazione regionale, delibera aziendale,
provvedimento del direttore sanitario.

**Obiettivo primario**: rendere eseguibile nel sistema il percorso adottato, senza che questo
richieda una nuova versione del software.

**Attività**: redazione del percorso come dato strutturato; pubblicazione con versione, ambito e
data di decorrenza; ritiro e sostituzione con una versione successiva; consultazione degli
indicatori di processo e di esito calcolati sulle istanze.

**Vincolo di autorizzazione**: può pubblicare percorsi solo nell'ambito organizzativo di
competenza; **non può in alcun caso fissare soglie individuali**, che appartengono al piano del
singolo assistito. Il percorso propone e attribuisce i propri riferimenti; il piano individuale
dispone.

**Vincoli reali.** Non è una figura tecnica. Il linguaggio di descrizione del percorso deve essere
sufficientemente espressivo da rappresentare attività, cadenze, punti di decisione, responsabilità
e criteri, e sufficientemente ristretto da non diventare un linguaggio di programmazione arbitrario
eseguito in produzione. Un percorso incoerente — nodo irraggiungibile, cadenza senza unità, soglia
senza parametro — va rifiutato **alla pubblicazione**, con un messaggio comprensibile a chi lo ha
redatto, non quando un paziente ci passa dentro (`RF-231`).

### ATT-26 — Formatore del paziente e del caregiver

> **Identificativo introdotto da quest'area. Congelato.**

**Veste**: professionista che eroga la formazione all'uso dei dispositivi e dell'interfaccia,
prevista come micro-servizio essenziale del telemonitoraggio dal DM 19 novembre 2025, Allegato 3,
§ 4.1.

**Rilevanza funzionale**: l'esito della formazione è una **precondizione di attivazione**
registrata, non un adempimento amministrativo. Un paziente attivato senza formazione completata e
senza verifica tecnica di funzionamento dei dispositivi genera un flusso di falsi allarmi di
assenza già dal primo giorno (`RF-242`, `RF-243`).

## 4. Attori amministrativi e di governo

### ATT-10 — Operatore di front-office

È l'attore che **assorbe tutti i fallimenti degli altri** ed è il miglior indicatore anticipato
dei problemi del sistema. Il suo strumento principale non è un elenco di appuntamenti ma una
**vista dei rischi della giornata**: test tecnico non eseguito o fallito, attività preliminari
incomplete, consensi mancanti, recapiti non verificati.

**Vincolo di autorizzazione**: nessun accesso al contenuto clinico. Vede *che* c'è un
appuntamento, non *perché*. È l'attore più esposto agli errori di autorizzazione, perché la
tentazione di mostrargli «giusto un po' di contesto clinico» per aiutarlo a lavorare meglio è
costante e va rifiutata per costruzione.

### ATT-11 — Amministratore di struttura

Configura utenti, ruoli, agende, cataloghi, personalizzazione, politiche locali. **Non accede al
contenuto clinico in virtù del ruolo**, e l'assegnazione a sé stesso di un ruolo clinico genera un
evento di audit di severità critica con notifica al responsabile della protezione dei dati
(`BR-013`).

### ATT-12 — Amministratore di sistema

Gestisce l'installazione. È progettato come ruolo **strutturalmente privo di accesso in chiaro al
contenuto clinico**, con operazioni sempre tracciate e, per quelle critiche, doppio controllo. Non
esiste alcuna funzione di impersonificazione che consenta di operare come utente clinico
(`RF-015`): non è disattivata, non esiste.

### ATT-13 — Responsabile della protezione dei dati

Legge **audit e metadati, non contenuto**. Ogni sua lettura è a sua volta registrata (`BR-094`).
Riceve le notifiche degli accessi in deroga e ne rivede la coda.

### ATT-14 — Direzione sanitaria e responsabile di servizio

Governa qualità e volumi su **statistiche aggregate e pseudonimizzate**, con soglia minima di
cardinalità e protezione dalla deduzione per differenza fra interrogazioni successive (`BR-090`,
`RF-201`). Riceve due indicatori che in quest'area sono qualificati come **indicatori di
sicurezza** e non come metriche tecniche: il tasso di mancato riscontro degli allarmi e l'esito
degli allarmi generati (`RNF-095`, `RNF-096`).

### ATT-16 — Auditor, organismo di verifica

Sola lettura, a finestra temporale, con esportazione firmata e pseudonimizzata quando sufficiente.

## 5. Attori terzi ammessi alla sessione

### ATT-17 — Discente, osservatore

Ammesso previo **consenso specifico e preventivo** del paziente, revocabile in qualunque momento
senza conseguenze sull'erogazione (`BR-067`). Nessun accesso a documenti, nessuna persistenza,
presenza visibile a tutti i partecipanti. Il paziente non deve subire la didattica.

### ATT-18 — Interprete, mediatore culturale

Come sopra, con canale audio attivo. È un terzo che accede a dati sanitari: servono base
giuridica, vincolo di riservatezza documentato e registrazione degli orari di ingresso e di uscita
(`BR-066`). Per le disabilità uditive l'interprete della lingua dei segni è un **partecipante a
pieno titolo**, non un accessorio dell'interfaccia.

## 6. Attori non umani

Sono attori a tutti gli effetti: hanno obiettivi, capacità e limiti, e la loro omissione dal
catalogo è la causa più comune di autorizzazioni troppo larghe.

### ATT-15 — Integratore tecnico

**Principal applicativo**, non utente. Ha proprie chiavi, propri webhook, propri limiti di
frequenza e propria configurazione di personalizzazione. Le credenziali applicative **non
conferiscono da sole accesso a dati clinici**: ogni operazione clinica richiede un contesto utente
delegante verificabile, rappresentato con la delega e mai con l'impersonificazione (`BR-017`,
decisione D18). Una chiave compromessa non deve diventare un accesso indiscriminato.

### ATT-24 — Gateway di acquisizione delle misure

> **Identificativo introdotto da quest'area. Congelato.**

**Veste**: sistema di terze parti che raccoglie le misure dai dispositivi domiciliari e le
trasmette a Telemedic. Il perimetro del progetto è l'**ingestione da un gateway di terze parti**,
più l'inserimento manuale da paziente o caregiver, più i questionari strutturati: **il progetto
non dialoga direttamente con i dispositivi medici** e non assume responsabilità sull'accuratezza
della catena di misura hardware (decisione D21).

**Obiettivo funzionale**: consegnare misure attribuibili, datate due volte (istante di misura e
istante di ricezione), con provenienza, unità e stato del dispositivo.

**Vincolo di autorizzazione**: principal applicativo con ambito limitato all'ingestione sul
proprio tenant; nessuna capacità di lettura del contenuto clinico; nessuna capacità di generare,
prendere in carico o chiudere allarmi.

**Vincoli reali, e la ragione per cui questo attore è delicato.** Il gateway è il punto in cui il
sistema perde il controllo della qualità del dato. Può consegnare in ritardo, fuori ordine, in
duplicato, con unità diverse da quelle attese, o smettere di consegnare senza segnalarlo. Da qui
quattro requisiti che non sono negoziabili con il fornitore del gateway ma sono **difese del
sistema ricevente**: idempotenza su un criterio di identità dichiarato (`RF-260`), separazione
obbligatoria dei due istanti (`RF-254`), verifica dell'unità di misura al confine (`RF-256`) e
rilevazione dell'assenza indipendente dalla dichiarazione del gateway (`RF-293`). Il segnale di
presenza periodico e la telemetria di stato del dispositivo sono richiesti al gateway, ma la loro
assenza non può disattivare la sorveglianza: `[NV]` sulla capacità effettiva dei gateway di
mercato di esporre un segnale di presenza indipendente dalla misura — questione aperta verso
l'area integrazione.

### ATT-19 — Sistema esterno di monitoraggio

Osserva lo stato di salute della piattaforma su un endpoint separato, con metriche tecniche non
identificanti e nessun accesso a identificatori di paziente.

## 7. Il modello di autorizzazione, in breve

Il sistema adotta **ruoli per le capacità, attributi per l'ambito**. Il fatto che un utente sia
«medico» non dice nulla su *quale* paziente possa vedere: serve una relazione abilitante vigente.
La decisione è presa da un punto di valutazione con default *negare*, e l'accesso a un dato
clinico è consentito **se e solo se** ricorrono, congiuntamente, quattro condizioni (`BR-010`):

1. il permesso atomico è compreso nei ruoli del soggetto;
2. esiste una **relazione abilitante vigente** fra soggetto e paziente;
3. nessuna manifestazione di volontà di tipo negativo copre la risorsa (oscuramento, revoca);
4. il contesto di tenant del soggetto coincide con quello della risorsa.

Le relazioni abilitanti riconosciute, con la durata che ne governa la vigenza, sono: appuntamento
di cura, contatto erogato, episodio di cura attivo, ambito di consulto, assistenza primaria,
delega volontaria, rappresentanza legale, accesso in deroga. Quest'area ne aggiunge due, proprie
del telemonitoraggio, e le congela:

| Relazione | Condizione di esistenza | Durata | Effetto |
|---|---|---|---|
| `MONITORING_PLAN` | il professionista è autore o referente clinico di un piano di telemonitoraggio attivo | finché il piano è attivo, più il periodo di conservazione del percorso | accesso alle serie del piano, alle soglie e agli allarmi generati |
| `CASE_MANAGEMENT` | il professionista è case manager designato nel piano | finché dura la designazione | presa in carico degli allarmi, contatto proattivo, lettura delle serie; **nessuna modifica delle soglie** |

Nessuna delle due conferisce accesso all'intero dossier del paziente: l'ambito è il piano, non la
persona.

## 8. Matrice attore per capacità

Sintesi delle capacità distintive introdotte da quest'area. `●` capacità piena, `◐` capacità
limitata all'ambito indicato, `—` capacità assente per vincolo di dominio, non per configurazione.

| Capacità | ATT-01 Paziente | ATT-02 Caregiver | ATT-20 Resp. piano | ATT-21 Case manager | ATT-22 Centro servizi | ATT-23 Centro erogatore | ATT-25 Percorsi | ATT-24 Gateway |
|---|---|---|---|---|---|---|---|---|
| Proporre l'arruolamento | — | — | ● | ◐ proposta | — | ◐ | — | — |
| Fissare o modificare una soglia individuale | — | — | ● | — | — | — | — | — |
| Pubblicare un percorso di popolazione | — | — | — | — | — | — | ● | — |
| Attivare il piano | — | — | ● | ◐ su delega del piano | — | ◐ | — | — |
| Inserire una misura | ● propria | ◐ per delega | ◐ | ◐ | — | ◐ | — | ● per ingestione |
| Dichiarare non valida una misura | ● propria | ◐ per delega | ● | ● | — | ● | — | — |
| Dichiarare un'indisponibilità programmata | ● | ◐ per delega | ● | ● | — | ● | — | — |
| Prendere in carico un allarme clinico | — | — | ● | ● | — | ● | — | — |
| Prendere in carico un allarme tecnico | — | — | — | ◐ visibilità | ● | ◐ visibilità | — | — |
| Leggere il contenuto clinico | ● proprio | ◐ per delega | ● ambito piano | ● ambito piano | — | ● ambito cura | — | — |
| Chiudere il percorso con motivazione | — | — | ● | ◐ proposta | — | ◐ | — | — |
| Modificare la copertura oraria dichiarata | — | — | — | — | — | ◐ proposta | — | — |
| Vedere lo stato corrente della copertura | ● | ● | ● | ● | ● | ● | ● | — |

L'ultima riga è deliberata: **lo stato della copertura è visibile a tutti**, paziente compreso, in
ogni momento e non solo in fase di adesione. È il presidio contro la falsa rassicurazione, ed è
trattato come requisito di sicurezza in [05 — Gestione degli allarmi](05-gestione-degli-allarmi.md).

## 9. Errori di modellazione degli attori che questo catalogo esclude

1. **Un solo tipo di «utente» con un campo `ruolo`.** Produce autorizzazioni che si valutano con
   una catena di condizioni, impossibile da verificare e da provare.
2. **La professione come attributo della persona.** Rompe il multi-tenant e rende irrappresentabile
   il medico con ruoli in due strutture, che è il caso normale e non l'eccezione.
3. **Il caregiver modellato come «paziente con permessi ridotti».** Perde la distinzione fra
   assistenza e rappresentanza, e prima o poi produce un consenso invalido.
4. **Il centro servizi e il centro erogatore fusi in un ruolo «operatore».** Viola una separazione
   che è imposta e non organizzativa, e apre l'accesso clinico a un turno tecnico.
5. **Il gateway di misure trattato come parte del sistema.** Sposta sul progetto una
   responsabilità sull'accuratezza della catena di misura che il progetto ha esplicitamente
   escluso, e fa saltare la delimitazione della destinazione d'uso.
6. **L'integratore trattato come utente.** Produce chiamate cliniche senza contesto utente
   delegante, cioè accessi a dati sanitari senza un soggetto responsabile identificabile.
7. **L'assenza dell'attore «chi risponde all'allarme».** È l'omissione più costosa: un allarme
   senza destinatario individuabile *in quel momento* non è un allarme, è un registro.
