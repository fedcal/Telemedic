---
title: Il linguaggio ubiquo
sidebar_position: 2
description: Il vocabolario condiviso fra clinici e sviluppatori — definizione normativa dove esiste, operativa dove non esiste, regola di precedenza fra le fonti, falsi sinonimi e collisioni terminologiche da presidiare.
---

# Il linguaggio ubiquo

Il linguaggio ubiquo non è un glossario. Un glossario si consulta; un linguaggio ubiquo si
**usa**, e si usa in tre luoghi che devono coincidere: la conversazione fra clinico e
sviluppatore, il nome delle classi e delle colonne, il testo che l'utente legge sullo schermo.
Quando i tre luoghi divergono il costo non è estetico. È il costo di riunioni in cui due
persone dicono «sessione» intendendo cose diverse e se ne accorgono dopo il rilascio.

In questo dominio la divergenza ha un aggravante che altrove non esiste: **una parte del
vocabolario non è nostra**. «Televisita», «teleconsulto», «referto», «oscuramento» hanno una
definizione stabilita da un atto normativo. Non sono nomi di funzionalità che il prodotto può
scegliere. Chi li usa in senso diverso da quello normativo non è originale: è in errore, e
l'errore si propaga fino al documento che finisce nel fascicolo sanitario.

## 1. Le quattro fonti di definizione e la regola di precedenza

Un termine di questo dominio può avere definizione da quattro fonti, che non hanno pari
autorità.

| Livello | Fonte | Esempio di termine | Che cosa comporta |
|---|---|---|---|
| **1** | **Norma o atto amministrativo italiano** | *televisita*, *teleconsulto*, *dati a maggiore tutela dell'anonimato*, *oscuramento* | La definizione è vincolante. Il progetto non può restringerla, estenderla né rinominarla |
| **2** | **Guida di implementazione nazionale** | *`EncounterTelemedicina`*, *`CompositionRefertoTelevisita`* | Prevale sul modello generico in caso di divergenza **[BASE]**, `04_BASELINE_ARCHITETTURALE.md` § 3 |
| **3** | **Standard internazionale adottato** | *`Encounter`*, *`Observation`*, *`Consent`*, *`Provenance`* | Definisce la struttura, non il significato clinico. Si adotta salvo divergenza con i livelli 1 e 2 |
| **4** | **Definizione operativa del progetto** | *sessione media*, *pre-verifica tecnica*, *ambito di consulto*, *finestra di refertazione* | Ammessa **solo** dove i tre livelli superiori tacciono, e sempre dichiarata come tale |

> **`DM-01` [MOD] — Regola di precedenza.** In caso di conflitto fra due definizioni si applica
> il livello più basso di numero. Una definizione di livello 4 che entri in conflitto con una
> di livello 1 non è un'estensione: è un difetto, e va corretta nel codice, non negoziata.

La conseguenza pratica è che **non tutti i termini del sistema hanno lo stesso grado di
libertà**. Su «televisita» il progetto non ha alcuna libertà. Su «sala d'attesa virtuale» ne ha
molta, perché nessuna fonte superiore la definisce. Confondere i due regimi porta a due errori
simmetrici: irrigidire ciò che è libero, e riscrivere ciò che è vincolato.

### 1.1 Perché le definizioni normative sono citate verbatim

Nei capitoli di quest'area le definizioni di livello 1 sono riportate **testualmente**, con
l'atto, l'articolo e l'allegato. Non parafrasate. La ragione è tecnica: la parafrasi di una
definizione normativa introduce sistematicamente una sfumatura che il modello poi eredita. Il
modulo [02 dei fondamenti](../10_fondamenti/02-prestazioni-di-telemedicina.md) contiene i testi
integrali; quest'area li cita solo nella misura in cui determinano una scelta di modellazione,
e rinvia per il resto.

### 1.2 Il glossario nazionale

AGENAS ha pubblicato un **Glossario nazionale di Telemedicina, v. 1.0.0 del 29 gennaio 2026**
(fonte: `B1-verifiche-documentali-italiane.md`, § 14). Il **Business Glossary** è inoltre un
modulo dichiarato dell'Infrastruttura nazionale di telemedicina (DM 19 novembre 2025, art. 2).

> **`DM-02` [MOD]** — Il glossario del progetto ([capitolo 09](09-glossario-del-dominio.md))
> dichiara per ogni voce se coincide con il glossario nazionale, se lo specializza o se è
> propria del progetto. Una divergenza non dichiarata è un difetto documentale.
>
> **[NV]** Il contenuto puntuale del glossario nazionale v. 1.0.0 non è stato letto in questa
> area: l'allineamento voce per voce va eseguito prima del congelamento del capitolo 09. Da
> chiedere all'area `COMP`, che ha il canale documentale verso le fonti nazionali.

## 2. Il linguaggio ha tre incarnazioni e devono coincidere

Il progetto è bilingue per decisione `D3` e `D50`: italiano lingua primaria, inglese completo.
Il codice, però, non è né italiano né inglese: è **allineato allo standard adottato**. Ne
discende una regola in tre righe che vale per tutto il sistema.

| Luogo | Lingua | Regola |
|---|---|---|
| **Identificatori di codice** (classi, campi, eventi, colonne, endpoint) | Inglese, allineato a FHIR R4 e alle guide nazionali | `Encounter`, `MediaSession`, `ConsentRecord`. Mai la traduzione italiana, mai un sinonimo di comodo |
| **Testo dell'interfaccia e della documentazione** | Italiano primario, inglese completo | «contatto», «sessione», «consenso alla registrazione». Le stringhe vivono nel catalogo di internazionalizzazione, mai nel codice |
| **Nomi degli eventi di dominio** | Italiano, come già fissato in `R6` § 8.2 | `ContattoConcluso`, `RefertoFirmato`, `ConsensoRevocato` |

L'asimmetria fra la seconda e la terza riga è deliberata e va spiegata, perché a prima vista
sembra incoerente. Gli identificativi strutturali seguono lo standard perché devono
corrispondere uno a uno alle risorse e agli elementi che attraversano il confine
dell'interoperabilità: un campo che si chiama `dataInizioErogazione` e mappa su
`Encounter.period.start` costringe a una traduzione mentale a ogni lettura. Gli **eventi di
dominio**, invece, non attraversano alcuno standard: sono il vocabolario interno del dominio, e
sono l'unico artefatto tecnico che un clinico può leggere e verificare. `ContattoConcluso` è
verificabile da chi conosce il dominio; `EncounterFinishedEvent` no.

> **`DM-03` [MOD]** — Un evento di dominio il cui nome non sia comprensibile a un clinico che
> non conosce il codice è mal nominato. Il criterio di accettazione è letterale: si legge il
> nome dell'evento a un professionista sanitario e gli si chiede che cosa è successo. Se non
> sa rispondere, il nome cambia.

### 2.1 La trappola della traduzione dei display

Esiste un caso in cui tradurre è vietato per ragioni di licenza, non di stile. Le stringhe
`Coding.display` di una terminologia di terzi appartengono al titolare della terminologia; una
loro traduzione è un'**opera derivata** che, nel caso di LOINC, è assegnata a Regenstrief
(decisione `D34`).

> **[BASE]** Le stringhe di internazionalizzazione del progetto sono **separate
> architetturalmente** da `Coding.display` (`04_BASELINE_ARCHITETTURALE.md` § 7). L'etichetta
> che l'utente legge non è mai il `display` ufficiale tradotto: è una stringa del progetto,
> collegata al codice, con un proprio ciclo di vita.

Il capitolo [07](07-terminologie-nel-dominio.md) ne descrive la struttura dati. Qui basta la
regola linguistica: **il display ufficiale e l'etichetta di interfaccia sono due termini
diversi del linguaggio ubiquo**, e chiamarli entrambi «descrizione» è l'inizio del problema.

## 3. I termini con definizione normativa

Sono i termini su cui il progetto ha grado di libertà zero. La tabella riporta la fonte esatta
e — colonna decisiva — **che cosa il modello è obbligato a rappresentare** per non tradire la
definizione. I testi integrali stanno nel modulo
[02 dei fondamenti](../10_fondamenti/02-prestazioni-di-telemedicina.md) § 4.

| Termine | Fonte normativa | Vincolo di modellazione che ne discende |
|---|---|---|
| **Televisita** | Accordo Stato-Regioni 17 dicembre 2020, rep. atti n. 215/CSR, All. A; DM 21 settembre 2022, All. A, Appendice | Atto **medico**, in **tempo reale**, con il paziente. È «limitata alle attività di controllo di pazienti la cui diagnosi sia già stata formulata nel corso di visita in presenza». Il modello deve rappresentare la condizione di ammissibilità e la deroga motivata, non presumerle |
| **Teleconsulto medico** | Accordo 215/CSR 2020, All. A | Fra **due o più medici**; il paziente può essere assente; ammessa l'**asincronia**; «contribuisce alla definizione del referto […] ma non dà luogo ad un referto a sé stante». Il modello non può generare un referto autonomo di teleconsulto |
| **Teleconsulenza medico-sanitaria** | Accordo 215/CSR 2020, All. A | Fra professionisti sanitari **con responsabilità differenti**, non necessariamente medici; **sempre programmata**; **divieto espresso** di uso in surroga del soccorso |
| **Teleassistenza** | Accordo 215/CSR 2020, All. A; DM 21 settembre 2022, All. A | Atto **di pertinenza della professione sanitaria non medica**; con paziente o caregiver; prevalentemente programmata e ripetibile. Il DM impone che il servizio renda disponibili anche le funzionalità di televisita e telemonitoraggio |
| **Telerefertazione** | Accordo 215/CSR 2020, All. A | Atto **asincrono** su esame già acquisito; «firma digitale validata del medico responsabile»; non genera contatto con il paziente |
| **Telemonitoraggio** | Accordo 215/CSR 2020, All. A; DM 21 settembre 2022, All. A | Rilevamento e trasmissione a distanza di parametri; «non afferisce all'ambito di specialistica ambulatoriale, a meno che non sia affiancato dal telecontrollo medico, da una televisita o anche da una visita in presenza» |
| **Telecontrollo medico** | Accordo 215/CSR 2020, All. A | Prestazione **medica** a contatti cadenzati, con videochiamata e condivisione di dati. È a nomenclatore; il telemonitoraggio da solo non lo è |
| **Servizi minimi** | DM 21 settembre 2022, All. A, Sez. 1 | Sono **quattro**: televisita; teleconsulto/teleconsulenza; telemonitoraggio; teleassistenza. Non coincidono con le cinque attività dell'Accordo 2020 |
| **Centro servizi** / **Centro erogatore** | DM 21 settembre 2022, All. A | Due soggetti distinti: compiti **prettamente tecnici** il primo, **prettamente sanitari** il secondo. Gestiscono classi di allarme diverse. Il modello dei ruoli deve poterli separare |
| **Referto** | DM 7 settembre 2023, art. 3, c. 1, lett. b); DM 19 novembre 2025, art. 7 | Tipologia documentale del fascicolo. Per la televisita esiste dal DM 19 novembre 2025 una tipologia **propria**: «referto di specialistica per la televisita», lett. p) |
| **Oscuramento** | DM 7 settembre 2023, art. 9 | Diritto esercitabile prima, durante o dopo l'alimentazione; deve avvenire «con modalità tali da garantire che tutti i soggetti abilitati all'accesso non possano venire automaticamente a conoscenza del fatto che l'assistito ha effettuato tale scelta» (c. 6) |
| **Dati a maggiore tutela dell'anonimato** | DM 7 settembre 2023, art. 6 | Categoria chiusa e nominata; visibili a terzi solo previo consenso esplicito, informato e specifico reso al soggetto erogante |
| **Alimentazione del fascicolo** | DM 7 settembre 2023, artt. 12–13 | Obbligo entro **cinque giorni** dall'erogazione, con responsabilità per alimentazione mancante, intempestiva o inesatta |
| **Titolare del trattamento per finalità di cura** | DM 7 settembre 2023, art. 12, c. 2 | È il soggetto **presso cui sono redatti** i dati e i documenti. Non è la piattaforma |

### 3.1 Le due tassonomie che non coincidono

È il punto in cui il linguaggio normativo italiano è internamente disallineato, ed è quindi il
punto in cui un modello ingenuo rompe.

- L'**Accordo 215/CSR 2020** elenca **cinque attività ambulatoriali** — televisita, teleconsulto,
  teleconsulenza, teleassistenza, telerefertazione — più telecontrollo e telemonitoraggio come
  «modalità operative».
- Il **DM 21 settembre 2022** elenca **quattro servizi minimi** — televisita,
  teleconsulto/teleconsulenza, telemonitoraggio, teleassistenza — unificando teleconsulto e
  teleconsulenza, promuovendo il telemonitoraggio a servizio e degradando la telerefertazione a
  micro-servizio trasversale («refertazione e firma digitale»).

> **`DM-04` [MOD]** — Il modello rappresenta **entrambe le tassonomie e la loro mappatura**, e
> non ne sceglie una. Concretamente: il tipo di prestazione porta due attributi distinti —
> `attivitaAccordo2020` e `servizioMinimoDM2022` — perché servono a scopi diversi. Il primo
> determina attori ammessi, obblighi documentali e regime tariffario; il secondo determina
> l'aggancio a un'infrastruttura regionale e il perimetro di micro-servizi atteso.
>
> Un `enum` unico con sette valori sembra più semplice e produce, alla prima gara regionale,
> una mappatura implicita scritta a mano in un punto qualsiasi del codice.

### 3.2 La mappatura, resa esplicita

| Attività dell'Accordo 215/CSR 2020 | Servizio minimo del DM 21 settembre 2022 | Osservazione |
|---|---|---|
| Televisita | Televisita | corrispondenza piena |
| Teleconsulto medico | Teleconsulto/teleconsulenza | **due attività in un servizio**: gli attori ammessi restano diversi |
| Teleconsulenza medico-sanitaria | Teleconsulto/teleconsulenza | idem |
| Teleassistenza | Teleassistenza | il decreto vi aggiunge il vincolo funzionale ibrido |
| Telerefertazione | *(nessuno)* | degradata a micro-servizio trasversale «refertazione e firma digitale» |
| Telemonitoraggio *(modalità operativa)* | Telemonitoraggio | **promosso** a servizio minimo |
| Telecontrollo medico *(modalità operativa)* | *(nessuno)* | resta modalità operativa; è però prestazione a nomenclatore |

Tre conseguenze pratiche discendono da questa tabella e vanno tenute presenti in ogni capitolo
che segue.

1. **Il vincolo professionale si applica all'attività, non al servizio.** Un unico servizio
   minimo copre teleconsulto e teleconsulenza, che hanno attori ammessi diversi: medici il
   primo, professioni sanitarie con responsabilità differenti il secondo. Autorizzare sul
   servizio significa autorizzare troppo.
2. **La telerefertazione esiste come atto e non come servizio.** Va rappresentata, perché
   l'Accordo la definisce e ne fissa gli obblighi di firma, ma non concorre al perimetro dei
   servizi minimi.
3. **Il telecontrollo è la sola prestazione tariffata dell'area del monitoraggio.** Il
   telemonitoraggio da solo «non afferisce all'ambito di specialistica ambulatoriale»: la
   distinzione decide se esiste o meno un evento rendicontabile.

## 4. I termini con definizione operativa del progetto

Sono i termini di livello 4: nessuna fonte superiore li definisce, il progetto li definisce e
**lo dichiara**. Ognuno è qui accompagnato dalla ragione per cui esiste — un termine operativo
senza necessità è rumore nel vocabolario.

| Termine del progetto | Definizione operativa | Perché serve un termine proprio |
|---|---|---|
| **Sessione media** | Istanza di collegamento in tempo reale fra i partecipanti a un contatto, con negoziazione, qualità e ciclo di vita propri | «Sessione» da sola è ambigua fra atto clinico, connessione e unità rendicontabile (`R6` § 8.1). Il termine composto rende il confine `V-01` visibile nel linguaggio |
| **Pre-verifica tecnica** | Controllo di dispositivo, permessi, banda e raggiungibilità del relay eseguito **prima** dell'ingresso in sala d'attesa, con esito registrato | La norma non la nomina, ma l'Accordo 215/CSR 2020 impone al medico di attestare l'idoneità del collegamento: l'attestazione ha bisogno di un fatto registrato a cui riferirsi |
| **Compliance digitale dell'assistito** | Accertamento della capacità della persona di interagire con i sistemi digitali, distinto dalla verifica tecnica del dispositivo | Introdotta dal *Modello orientativo di erogazione della Televisita* AGENAS, v. 1.0.25 del 16 aprile 2026, come fase della «verifica di eseguibilità» **[RACCOMANDATO, non vincolante]**. È una **proprietà della persona**, non del dispositivo: confonderle produce un pre-check verde su un paziente che non sa usare il sistema |
| **Ambito di consulto** | Insieme chiuso ed effimero di documenti a cui un consulente accede in forza di una richiesta di teleconsulto, con scadenza | Il consulente non ha titolo sul dossier: serve un oggetto che rappresenti *che cosa* gli è stato mostrato e *fino a quando* (`BR-014`) |
| **Finestra di refertazione** | Intervallo fra conclusione del contatto e termine entro cui il documento deve essere firmato | Il tempo di refertazione è un fatto misurabile con conseguenze organizzative (`BR-042`); senza un termine di dominio resta un numero in un rapporto |
| **Esito del contatto** | Codice strutturato che dichiara come l'atto si è concluso, distinto dallo stato del contatto | Lo stato dice *dove* è il contatto; l'esito dice *che cosa è successo*. `EX-NOSHOW` ed `EX-TECH-PATIENT` sono due esiti dello stesso stato terminale, con effetti amministrativi opposti (`BR-024`) |
| **Ripiego di canale** | Passaggio dichiarato da un canale a un altro durante l'atto, con motivazione registrata | «Fallback» è termine tecnico; qui è un fatto clinico-amministrativo che può incidere sulla natura dell'atto (`BR-006`) e va nominato come tale |
| **Copertura oraria dichiarata** | Fascia oraria e giorni in cui il servizio garantisce presa in carico degli allarmi e risposta, resa esplicita all'assistito | È un **requisito di sicurezza**, non un parametro commerciale: un servizio mal dichiarato produce falsa rassicurazione (modulo [10 dei fondamenti](../10_fondamenti/10-percorsi-di-cura-e-sicurezza.md) § 4.5; questione `Q-14` in bacheca) |
| **Dataset canonico** | Rappresentazione del contenuto informativo di un documento, indipendente dal formato di serializzazione | Imposto da `V-07`. Senza un termine proprio si dice «il CDA» e in tre mesi il modello dipende dal template |
| **Registro degli accessi** | Catena append-only con impronte, conservata separatamente, che registra chi ha fatto cosa su quale soggetto | «Audit» in italiano corrente significa anche revisione contabile e verifica di conformità. Il termine composto evita che `V-04` venga soddisfatto con un versionamento di entità (`D42`) |

## 5. I falsi sinonimi

Sono coppie di termini che il linguaggio corrente scambia e che il modello non può scambiare.
Ognuna è un confine di aggregato, un vincolo di autorizzazione o una regola di rendicontazione.
La colonna finale indica il difetto che si produce fondendo i due concetti.

### 5.1 Assistito e paziente

**Assistito** è una qualifica amministrativa: titolarità del diritto all'assistenza presso un
servizio sanitario o un ente. **Paziente** è una qualifica clinica: destinatario di un atto
sanitario. La stessa persona è assistita senza essere paziente per anni.

Il modello ne risente in un punto preciso: le regole di accesso ai dati amministrativi
(esenzioni, recapiti, scelta del medico) e quelle di accesso ai dati clinici hanno domini
diversi. Un operatore di front-office lavora sull'assistito; non deve poter lavorare sul
paziente. Se il modello ha una sola entità con un solo insieme di permessi, la separazione va
ricostruita a mano su ogni campo — e prima o poi qualcuno dimentica un campo.

### 5.2 Prestazione richiesta, prestazione eseguita, prestazione addebitata

Tre concetti che l'italiano chiama con una parola sola. Sono tre entità con **cicli di vita,
autori e stati distinti**: la richiesta nasce dal prescrittore e può non essere mai eseguita;
l'esecuzione nasce dall'erogante e può avvenire senza richiesta; l'addebito nasce
dall'amministrazione e può non seguire l'esecuzione (prestazione esente, prestazione non
tariffata come il teleconsulto).

> **`DM-05` [MOD]** — Il modello non contiene alcuna entità chiamata «Prestazione». Contiene
> `ServiceRequest` (richiesta), l'atto eseguito rappresentato dall'`Encounter` e dalle sue
> procedure, e l'evento rendicontabile. Il termine italiano «prestazione» resta nel linguaggio
> parlato e nella documentazione, sempre qualificato: prestazione *richiesta*, *erogata*,
> *rendicontata*.

### 5.3 Erogata, refertata, consegnata, rendicontata

Quattro stati successivi che nessuno implica automaticamente l'altro. Una prestazione erogata e
non refertata è un inadempimento visibile; una refertata e non consegnata può essere una scelta
clinica legittima (consegna differita, `BR-047`); una consegnata e non rendicontata è un
problema amministrativo, non clinico.

Il difetto tipico è un unico campo `stato` con un valore `completata` che significa una delle
quattro cose a seconda di chi guarda. Il capitolo [02](02-le-prestazioni-modellate.md) separa i
quattro momenti in stati distinti proprio per questo.

### 5.4 Autenticazione e identificazione

L'**autenticazione** accerta che chi si è collegato possieda una credenziale. L'**identificazione**
accerta che la persona davanti alla telecamera sia il paziente atteso. Sono due controlli, in due
momenti, con due evidenze e due responsabili: la prima è del sistema, la seconda è **un atto
del professionista** (`BR-031`).

Un sistema che tratta l'autenticazione come identificazione non ha un difetto di sicurezza
astratto: ha un difetto che si manifesta il giorno in cui un familiare si collega con le
credenziali del paziente e la sessione risulta regolarmente identificata.

### 5.5 Consenso all'atto sanitario e consenso al trattamento dei dati

Due manifestazioni di volontà con natura giuridica, effetti e revocabilità diversi. Il modulo
[03 dei fondamenti](../10_fondamenti/03-il-dato-clinico.md) § 2 spiega perché, per la finalità
di cura, il consenso non è tipicamente la base giuridica del trattamento. Qui interessa la
conseguenza sul modello: **fonderli in un unico oggetto rende la revoca ingovernabile**, perché
la revoca del consenso all'atto interrompe la cura mentre la revoca di un consenso a un
trattamento accessorio non deve farlo. Il capitolo [06](06-consenso-e-riservatezza.md) tiene
distinti quattro oggetti, non due.

### 5.6 Caregiver e rappresentante legale

**Assistere non è rappresentare.** Il caregiver accompagna, aiuta, può essere presente in
sessione; non può prestare consenso al posto di un paziente capace, in nessuna configurazione
(`BR-062`). Il rappresentante legale sostituisce o integra la volontà, **nei limiti del titolo**.

Errore aggiuntivo, più sottile: trattare l'amministratore di sostegno come un tutore. I poteri
dell'amministratore sono delimitati dal decreto di nomina e possono non comprendere le
decisioni sanitarie: vanno registrati come **ambito** e verificati **per atto** (`BR-063`).

### 5.7 Bozza e referto

Una bozza non firmata **non è un referto**: non è visibile al paziente, non è trasmissibile,
non è conservata come documento sanitario (`BR-041`). Il linguaggio corrente dice «il referto è
in bozza», e il modello che segue il linguaggio crea un `Referto` con `stato = bozza` — dal
quale, prima o poi, qualcuno estrae un elenco senza filtrare lo stato.

Il capitolo [04](04-documenti-clinici.md) tiene il documento in stato di redazione come oggetto
del contesto documentale, non come documento sanitario, e ne fa discendere le regole di
visibilità.

### 5.8 Oscuramento e cancellazione

L'oscuramento rende un documento invisibile a determinati soggetti; **non lo cancella** e non lo
sottrae a chi lo ha prodotto, che continua a vederlo (DM 7 settembre 2023, art. 8, c. 7 e art.
15, c. 5). La cancellazione è un'altra cosa, e nel settore sanitario incontra limiti derivanti
dagli obblighi di conservazione (`BR-081`).

### 5.9 Fascicolo, dossier, cartella

Tre contenitori a tre scale diverse, con tre regimi di accesso diversi: il **fascicolo
sanitario elettronico** è nazionale-regionale e sotto il controllo dell'assistito; il **dossier
sanitario** è l'insieme dei dati presso una singola struttura; la **cartella clinica
elettronica** è il repository del singolo erogante. Nel modello di integrazione la cartella
resta al sistema del partner (`00_PROJECT_BRIEF.md` § 6.2.5).

### 5.10 Slot e appuntamento

Uno slot occupato non è un appuntamento: è la sua **proiezione sull'agenda**. Fonderli rende
impossibile rappresentare l'overbooking controllato (`BR-023`) e produce, sotto concorrenza, la
doppia prenotazione (`BR-020`).

### 5.11 Soglia tecnica e soglia clinica

Una **soglia tecnica** riguarda il canale (perdita di pacchetti, ritardo, banda) ed è una
specifica di prodotto configurabile per tenant. Una **soglia clinica** riguarda un parametro
del paziente ed è configurazione **per assistito**, decisa dal professionista (`V-02`).

Nessuna delle due è imposta dalla normativa italiana: il vincolo `V-12` in bacheca lo dichiara
come fatto verificato in `B1`, § «Requisiti tecnici minimi». Chiamarle entrambe «soglia» in un
unico modulo di configurazione è l'errore che porta a esporre a un amministratore di tenant un
campo che è decisione clinica individuale.

### 5.12 Allarme tecnico e allarme clinico

Discende dal precedente e ha un destinatario diverso: l'allarme tecnico va al **centro
servizi**, quello clinico al **centro erogatore** (DM 21 settembre 2022, All. A). Una coda
unica di notifiche produce due effetti, entrambi gravi: il tecnico che riceve un allarme
clinico e il clinico assuefatto agli allarmi tecnici.

### 5.13 Aderenza e trasmissione

L'**aderenza** è il comportamento della persona rispetto al piano; la **trasmissione** è
l'arrivo del dato. Sono correlate e non coincidono: un dato non arrivato può indicare un
paziente non aderente, un dispositivo guasto, una catena di ingestione interrotta o un
peggioramento clinico che impedisce la misura. Il modulo [10 dei
fondamenti](../10_fondamenti/10-percorsi-di-cura-e-sicurezza.md) § 8.3 ne dà la tassonomia; il
capitolo [05](05-parametri-e-osservazioni.md) la rende modello.

### 5.14 Tenant, organizzazione, struttura erogante, integratore

Quattro concetti che coincidono nei casi semplici e divergono in quelli reali. Il **tenant** è
il confine di isolamento (`V-04`); l'**organizzazione** è un soggetto giuridico; la **struttura
erogante** è chi risponde dell'erogazione; l'**integratore** è un principal applicativo, non un
utente. Un tenant può contenere più strutture eroganti; un integratore può operare su più
tenant.

## 6. Le collisioni: la stessa parola in due domini

Diverse dai falsi sinonimi: qui il problema non è che due termini vengano confusi, ma che **una
parola abbia due significati legittimi** in due contesti che convivono nel prodotto. La
soluzione non è scegliere: è qualificare sempre.

| Parola | Significato clinico-amministrativo | Significato informatico | Disambiguazione adottata |
|---|---|---|---|
| **Sessione** | Atto clinico; unità rendicontabile | Connessione media; sessione applicativa | *contatto* / *sessione media* / *sessione applicativa*. Mai «sessione» da sola |
| **Contatto** | Interazione fra paziente e sistema di erogazione | Recapito telefonico o e-mail | `Encounter` nel codice; *recapito* per il secondo. Mai `Contact`, che collide con `Patient.contact` |
| **Ticket** | Compartecipazione alla spesa | Segnalazione di assistenza | *quota di compartecipazione* / *segnalazione di assistenza* |
| **Teleassistenza** | Atto professionale sanitario a distanza | Assistenza tecnica remota all'utente | *teleassistenza* / *supporto tecnico*. Nel codice `TeleAssistanceEncounter` contro `SupportTicket` |
| **Registro (log)** | Registro degli accessi, non ripudiabile | File di diagnostica applicativa | *registro degli accessi* / *registro di diagnostica*. Non sono lo stesso artefatto (`D42`) |
| **Firma** | Sottoscrizione con valore probatorio | Firma crittografica di un messaggio | *firma del documento* / *firma della busta*. Livelli e conseguenze diversi |
| **Priorità** | Classe di urgenza della prestazione richiesta | Priorità di elaborazione di un messaggio | *codice di priorità* / *priorità di consegna* |
| **Stato** | Stato clinico del paziente | Stato di una macchina a stati | *condizione clinica* / *stato del contatto*. Mai `status` senza qualificatore in un'interfaccia rivolta al clinico |
| **Piano** | Piano di cura, piano terapeutico, piano di telemonitoraggio | Piano di esecuzione, piano di rilascio | Sempre qualificato. Il capitolo [08](08-percorsi-e-piani-di-cura.md) distingue quattro «piani» clinici fra loro |
| **Monitoraggio** | Telemonitoraggio del paziente | Monitoraggio tecnico della piattaforma | *telemonitoraggio* / *osservabilità*. Due contesti delimitati diversi |
| **Verifica** | Verifica di eseguibilità clinica | Verifica tecnica del dispositivo | *verifica di eseguibilità* / *pre-verifica tecnica* |
| **Validazione** | Validazione clinica di un documento da parte del medico | Validazione sintattica di una risorsa | *validazione clinica* / *validazione formale* |

> **`DM-06` [MOD]** — Nessuna delle parole della prima colonna compare da sola in un nome di
> classe, di colonna, di endpoint, di evento o di etichetta di interfaccia. Il controllo è
> automatizzabile e va inserito fra le verifiche di stile del progetto: è una lista di dodici
> parole, non un principio.

## 7. Il linguaggio come artefatto versionato

Un linguaggio ubiquo che non ha un proprietario e un processo degrada in sei mesi. Le regole
che seguono sono operative, non esortative.

1. **Un termine entra nel linguaggio solo con la sua fonte.** Livello 1, 2 o 3 con citazione
   esatta; livello 4 con la ragione per cui è necessario. Un termine senza fonte e senza
   necessità viene rifiutato in revisione.
2. **Un termine non si rinomina, si deprezza.** Rinominare rompe la corrispondenza fra codice
   già scritto, dati già registrati ed eventi già pubblicati. Il termine vecchio resta nel
   glossario, marcato come deprecato, con il rinvio a quello nuovo e la data.
3. **La divergenza fra italiano e inglese è un difetto bloccante.** `D50` impone integralità;
   il controllo in integrazione continua segnala i documenti italiani modificati senza il
   corrispondente inglese. Per il glossario la regola è più stretta: una voce italiana senza
   traducente non è una voce.
4. **Ogni evento di dominio nuovo passa dal glossario.** Il nome dell'evento è un termine del
   linguaggio: se non è nel glossario, l'evento non esiste ancora.
5. **La revisione clinica del vocabolario non è facoltativa.** Le voci di livello 1 e 2 vanno
   verificate da chi conosce il dominio sanitario prima del congelamento; quelle di livello 4
   vanno verificate da chi conosce l'architettura.

### 7.1 Rapporto con gli identificativi congelati

`D45` impone il congelamento degli identificativi di requisito `RF-*`, `RNF-*`, `BR-*`: la
tracciabilità richiesta da IEC 62304 non si ricostruisce a posteriori. Ne discende una regola
linguistica che vale per quest'area e per tutte le altre:

> **Il testo di un requisito può essere chiarito; il suo identificativo non cambia mai, e il
> suo significato non può essere spostato.** Se il significato cambia, si emette un nuovo
> identificativo e si dichiara la sostituzione. Un `BR-030` che nel 2027 significhi qualcosa di
> diverso da oggi è peggio di un `BR-030` assente.

## 8. Che cosa non entra nel linguaggio ubiquo

Un vocabolario cresce anche per accumulo, e l'accumulo lo rende inutilizzabile. Quattro
categorie sono escluse per costruzione.

- **I termini di marketing.** «Qualità clinica», «esperienza fluida», «piattaforma
  intelligente» non hanno definizione verificabile. `D29` impone che i claim clinici siano
  riformulati in enunciati tecnici verificabili: il linguaggio ubiquo è il luogo in cui questa
  disciplina si applica per prima.
- **I nomi di fornitori, prodotti e marchi.** `R0` è assoluta. Nel linguaggio del dominio
  esistono «un sistema EHR di terze parti», «l'integratore», «il repository documentale
  nazionale o regionale», «il fornitore di identità digitale»: mai un nome.
- **I termini che descrivono l'implementazione e non il dominio.** «Coda», «cache»,
  «partizione», «pool» appartengono al linguaggio tecnico dei moduli di
  [fondamenti informatici](../10_fondamenti/11-fondamenti-informatici.md), non al linguaggio del
  dominio. Un evento di dominio che si chiami `MessaggioAccodato` sta descrivendo il trasporto,
  non il fatto.
- **Le sigle non sciolte.** `D35` lo impone alla guida dei fondamenti; quest'area lo estende al
  vocabolario: una sigla entra nel glossario con la forma estesa italiana, la forma estesa
  inglese e la fonte.

## 9. Verifica del linguaggio: cinque prove che si possono eseguire

Non sono metafore. Sono controlli eseguibili su un ramo di lavoro prima della fusione.

| # | Prova | Come si esegue | Che difetto intercetta |
|---|---|---|---|
| 1 | **Prova della lettura al clinico** | Si legge il nome di ogni evento di dominio nuovo a un professionista sanitario | Eventi nominati sull'implementazione |
| 2 | **Prova delle dodici parole** | Controllo automatico che nessuna delle parole di § 6 compaia non qualificata in identificatori o etichette | Collisioni terminologiche reintrodotte |
| 3 | **Prova della fonte** | Ogni voce nuova di glossario ha una fonte di livello 1–3 o una motivazione di livello 4 | Termini inventati per comodità |
| 4 | **Prova del traducente** | Ogni voce italiana ha il traducente inglese e viceversa | Divergenza `D50` |
| 5 | **Prova dell'attraversamento** | Per ogni termine che attraversa il confine dell'interoperabilità: esiste la corrispondenza esplicita con l'elemento dello standard | Modello interno che si allontana silenziosamente dal profilo nazionale |

## Cosa devi ricordare

1. **Non tutto il vocabolario è nostro.** Su televisita, teleconsulto, referto, oscuramento la
   libertà è zero: la definizione è normativa e va citata testualmente, non parafrasata.
2. **La regola di precedenza è a quattro livelli** e si applica meccanicamente: norma italiana,
   guida nazionale, standard adottato, definizione del progetto. Un conflitto si risolve verso
   l'alto.
3. **Le due tassonomie nazionali non coincidono** e il modello le rappresenta entrambe con la
   loro mappatura, mai una sola.
4. **Codice in inglese allineato allo standard, interfaccia in italiano, eventi di dominio in
   italiano.** L'asimmetria è deliberata: l'evento è l'unico artefatto tecnico che un clinico
   può verificare.
5. **Le stringhe di interfaccia non sono `Coding.display`.** È una separazione architetturale
   imposta da `D34`, non una scelta di stile.
6. **Quattordici coppie di falsi sinonimi** determinano confini di aggregato, regole di
   autorizzazione e regole di rendicontazione. Sono l'indice dei capitoli che seguono.
7. **Dodici parole hanno due significati legittimi**: si qualificano sempre, e il controllo è
   automatizzabile.
8. **Un termine non si rinomina, si deprezza.** Gli identificativi di requisito non cambiano
   mai, e il loro significato non si sposta.

## Dove continuare

- [02 — Le prestazioni modellate](02-le-prestazioni-modellate.md): il vocabolario normativo
  diventa macchine a stati.
- [09 — Glossario del dominio](09-glossario-del-dominio.md): l'elenco alfabetico bilingue con i
  rinvii.
- Modulo [02 dei fondamenti](../10_fondamenti/02-prestazioni-di-telemedicina.md): i testi
  normativi integrali, che quest'area non ripete.
