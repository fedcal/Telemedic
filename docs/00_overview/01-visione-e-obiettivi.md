---
title: Visione e obiettivi
sidebar_position: 2
description: "Che cos'è Telemedic, il problema reale che affronta, chi ne beneficia e i non obiettivi dichiarati: ciò che il progetto ha deciso di non essere, con la ragione di ciascuna rinuncia."
---

# Visione e obiettivi

## 1. Che cos'è, in una definizione che non promette

Telemedic è **codice sorgente e documentazione** per l'erogazione a distanza di prestazioni
sanitarie, pubblicato sotto licenza Apache-2.0 nel repository pubblico
[`github.com/fedcal/Telemedic`](https://github.com/fedcal/Telemedic).

Copre le quattro prestazioni che il DM 21 settembre 2022, Allegato A, individua come **servizi
minimi** che un'infrastruttura regionale di telemedicina deve erogare - televisita,
teleconsulto/teleconsulenza, telemonitoraggio, teleassistenza - nella forma e con i vincoli che
le fonti italiane danno a ciascuna, non nella forma che sarebbe comoda a un prodotto software.

Tre precisazioni vanno fatte prima di ogni altra cosa, perché senza di esse la frase precedente
si presta a essere letta come non è.

**Non è un prodotto immesso sul mercato.** **Oggi non reca marcatura CE**, non è coperto da alcuna
dichiarazione di conformità e non è stato sottoposto alla valutazione di un organismo notificato.
Finché una marcatura non esiste, nessun artefatto distribuito è utilizzabile per l'erogazione di
prestazioni sanitarie su persone reali (`D16`). Il progetto **ha deciso di assumere in proprio il
ruolo di fabbricante** (`D58`), ma il soggetto giuridico che lo eserciterà **è ancora da costituire
e formalizzare**: è un prerequisito interno con un proprio tempo, e finché non esiste lo stato di
fatto del prodotto non cambia. **In nessun luogo si scrive che il prodotto sarà marcato entro una
data**: l'intenzione di certificare e la promessa di un esito datato sono due cose diverse, e la
seconda produce un effetto regolatorio che la prima non produce. La dichiarazione integrale è in
[`NOT-A-MEDICAL-DEVICE.md`](https://github.com/fedcal/Telemedic/blob/main/NOT-A-MEDICAL-DEVICE.md).

**Al 25 agosto 2026 non esiste codice applicativo.** Esiste un corpo documentale esteso,
esistono le decisioni architetturali che lo reggono, e non esiste una riga di software del
servizio o dell'interfaccia. Il capitolo [04 - Stato e limiti](./04-stato-e-limiti.md) espone la
fotografia senza attenuazioni, ed è il capitolo da leggere per primo se si sta valutando
un'adozione.

**Non è un prodotto pensato per un solo interlocutore.** È progettato per una molteplicità di
integratori, e la proprietà multi-integratore è verificata dalla suite di prove, non dichiarata
(vincolo `V-188`: ogni prova di integrazione esercita almeno due tenant e due integratori
distinti, con configurazioni deliberatamente divergenti).

## 2. Il problema reale

La telemedicina italiana non ha bisogno di un'altra piattaforma di videochiamata. Ha bisogno di
software che tratti sul serio quattro fatti che quasi nessuna soluzione affronta per intero.

### 2.1 Le prestazioni hanno definizioni normative, non commerciali

«Televisita» e «teleconsulto» non sono etichette di marketing. L'Accordo Stato-Regioni del
17 dicembre 2020, rep. atti n. 215/CSR, Allegato A, le definisce testualmente, e da quelle
definizioni discendono conseguenze che un modello dati deve saper rappresentare:

- la televisita è **un atto medico**: un infermiere non può erogarla, e il vincolo non è
  configurabile dal cliente;
- la televisita erogata in specialistica ambulatoriale **deve sempre concludersi con un
  referto**, mentre il teleconsulto «**non dà luogo ad un referto a sé stante**»;
- la televisita è remunerata secondo il regime della prestazione corrispondente in presenza; il
  teleconsulto **non è remunerato affatto**.

Un sistema che rappresenti le quattro prestazioni con un unico tipo e un campo discriminante
funziona finché non deve rispondere alla prima domanda seria: chi può erogarla, che documento
produce, chi ne risponde, è tariffata. Il capitolo
[02 - Le quattro prestazioni](./02-le-quattro-prestazioni.md) mostra dove le differenze mordono.

### 2.2 Esistono obblighi documentali specifici, e sono recenti

Il DM 19 novembre 2025, art. 7, ha introdotto **dieci nuove tipologie documentali** del Fascicolo
sanitario elettronico dedicate alla telemedicina, con set informativo definito in Gazzetta
Ufficiale (Allegato 1). Non sono varianti del referto di specialistica ambulatoriale: sono
tipologie proprie, e usare quella sbagliata è un difetto di conformità, non un'imprecisione
(vincolo `V-143`).

Il progetto ne ricava una scelta strutturale: il contenuto informativo dei documenti destinati al
fascicolo si modella come **dataset canonico**, e le serializzazioni concrete sono
**sostituibili** e non cablate (vincolo `V-07`). È l'unica forma che sopravvive al fatto che i
modelli documentali, i codici di tipologia e i metadati di indicizzazione di quelle dieci
tipologie **non sono oggi pubblicamente disponibili** (questione `Q-07`, aperta).

### 2.3 Esiste una terza via per gli applicativi non nazionali

Il DM 19 novembre 2025, art. 3, comma 4, consente alle Regioni e alle Province autonome di
erogare telemedicina con applicativi diversi da quelli acquisiti nelle procedure nazionali,
purché rispettino standard certificati e alimentino il fascicolo. È la ragione per cui un
progetto indipendente ha uno spazio: non deve sostituire l'infrastruttura nazionale, deve saperci
parlare.

### 2.4 L'integrazione viene prima delle funzionalità

Un sistema di telemedicina che non dialoga con il gestionale già in uso non viene adottato, per
quanto buono sia. Da qui il vincolo architetturale `V3` - **ogni capacità del sistema deve essere
raggiungibile da un sistema terzo tramite interfaccia documentata; nessuna funzionalità è
accessibile soltanto dall'interfaccia utente** - e il suo corollario operativo `V-164`: l'area
che introduce una capacità introduce anche il contratto, e finché il contratto non c'è la
capacità non è completa.

Ne discendono tre proprietà che l'area di integrazione tratta come condizioni di progetto e non
come opzioni: Telemedic **non impone la propria interfaccia**, **non impone la propria
autenticazione**, **non diventa il dato di riferimento** di assistiti, professionisti e agende.

## 3. Le cinque scelte che spiegano tutto il resto

Chi legge la documentazione per la prima volta trova decine di decisioni. Cinque ne generano la
maggior parte.

### 3.1 Il modello deve poter dire la verità su ciò che è accaduto

È il criterio enunciato in apertura dell'area di dominio e vale per tutto il sistema. Un modello
che non sa distinguere un assistito che non si è presentato da un assistito che ha tentato e non
è riuscito a collegarsi non è impreciso: è falso, e produce addebiti ingiusti. Gli esiti
`EX-NOSHOW` ed `EX-TECH-PATIENT` condividono lo stesso stato terminale e hanno effetti
amministrativi **opposti**, e nessuna area può collassarli in un unico campo (vincolo `V-141`).

Lo stesso criterio genera altre regole apparentemente scollegate: il documento clinico firmato è
immutabile e si rettifica con una versione successiva; il consenso è un fatto con validità
temporale e non un valore booleano; il ruolo è una relazione fra persona e organizzazione con
validità temporale e non un attributo della persona; **l'assenza di dato è informazione clinica**
e il silenzio non è mai trattato come normalità (vincolo `V-09`).

### 3.2 Il confine fra registrare e interpretare è la linea che regge la qualificazione

Il sistema **trasporta, struttura, firma e conserva** contenuto clinico redatto da un
professionista. Non lo **genera** e non lo **interpreta**. La formulazione positiva del confine,
che vale come criterio di progettazione, è nell'area funzionale:

> l'instradamento risponde alla domanda «questo canale è adeguato?», la valutazione risponde alla
> domanda «che cosa ha questa persona?». La prima è una proprietà del servizio, e il servizio la
> può conoscere. La seconda è un atto riservato.

Un'eccezione dichiarata esiste, ed è quella su cui il progetto ha assunto la propria
qualificazione: il **confronto di una misura con la soglia individuale fissata da un
professionista** e la generazione della conseguente allerta sono nel perimetro. Ciò che è escluso
è che il sistema **stabilisca** la soglia, la **deduca** dallo storico o dalla popolazione, o
**interpreti** il risultato del confronto (`OUT-08`).

### 3.3 La destinazione d'uso del telemonitoraggio è congelata sulla formulazione più stretta

Una singola frase sposta la classificazione di rischio. «Monitoraggio in tempo reale dei parametri
vitali» porta in Classe IIb e classe di sicurezza software C; «raccolta differita di parametri per
la revisione periodica del professionista» resta in Classe IIa e classe B. La differenza vale
mesi e un ordine di grandezza di costo (`D46`).

Il modello di dominio è scritto **interamente** sulla seconda formulazione, e nessun artefatto del
progetto - documentazione, interfaccia, materiale pubblico, nome di classe o di evento - può usare
«monitoraggio in tempo reale», «sorveglianza continua» o formule equivalenti (vincolo `V-144`).
Non è cautela redazionale: è la scelta da cui dipende tutto il percorso regolatorio a valle. Il
**congelamento formale è stato deliberato** (`D55`, che chiude la questione `Q-144`), e ne discende
un divieto permanente: **nessuna funzione può essere aggiunta se sposta il sistema verso il tempo
reale clinico**, e la valutazione va fatta prima di scrivere la funzione, non dopo.

### 3.4 Sovranità del dato come proprietà verificabile, non come slogan

Il vincolo `V1` stabilisce che **nessun componente obbligatorio del percorso principale dipenda da
servizi non sostituibili o stabiliti fuori dall'Unione europea**. Tre profili di dispiegamento
sono documentati e supportati - Unione europea, territorio italiano, cloud qualificato nazionale -
e nessuna dipendenza di runtime può impedire il profilo più restrittivo (`D24`).

La ragione per cui questo ha smesso di essere un argomento commerciale è precisa: la
determinazione dell'Autorità nazionale per la cybersicurezza n. 127437/2026, art. 18, obbliga il
soggetto destinatario della disciplina sulla sicurezza delle reti a **dichiarare nominativamente
all'autorità i propri fornitori rilevanti**, con ragione sociale, codice fiscale, **Paese della
sede legale**, codici della nomenclatura degli appalti e criterio di rilevanza. Il Paese in cui
un componente è stabilito è quindi un dato che il cliente deve comunicare, non una preferenza
architetturale (`D40`). Il progetto fornisce, come artefatto, la scheda con i dati che il cliente
è tenuto a dichiarare.

La stessa logica vale in negativo: il servizio esterno di terminologia, se stabilito fuori
dall'Unione, è un trasferimento nel momento in cui riceve dati riferibili a un assistito. La
risposta del progetto non è collocarlo altrove ma **non mandargli mai identificativi
dell'assistito** - la sovranità si soddisfa per assenza di dato (vincolo `V-151`).

### 3.5 Accessibilità e progettazione a partire dallo schermo piccolo sono requisiti funzionali

`D25` lo stabilisce come vincolo trasversale di tutto il sistema - interfaccia dell'assistito,
interfaccia clinica, pannelli di amministrazione, componente incorporabile, documentazione,
messaggi di errore, notifiche - e non come rifinitura finale. Il criterio di accettazione
operativo è verificabile:

> ogni requisito funzionale deve poter essere completato da un assistito anziano su smartphone in
> rete mobile, e da un professionista con la sola tastiera e un lettore di schermo. Se non è
> possibile, il requisito non è soddisfatto.

Ne discende un limite invalicabile per chi incorpora il componente: indicatore di registrazione in
corso, avvisi e testi di consenso, esito della verifica delle chiavi, messaggi di errore clinico e
indicatore dello stato di cifratura **non sono tematizzabili né occultabili**, e una configurazione
di tema che degradi il contrasto **viene rifiutata al salvataggio**, non segnalata come avviso
(vincolo `V-163`).

## 4. Chi ne beneficia, e in che modo

Il capitolo [03 - A chi si rivolge](./03-a-chi-si-rivolge.md) tratta ciascun destinatario per
esteso, con ciò che ottiene, ciò che deve mettere di suo e ciò che il progetto non gli dà. Qui la
sintesi.

| Destinatario | Che cosa il progetto gli offre |
|---|---|
| **Struttura sanitaria** che eroga a distanza | Un sistema installabile presso di sé, con dispiegamento riproducibile, registro immutabile, ripartizione delle responsabilità dichiarata riga per riga |
| **Professionista sanitario** | Un modello che rispetta i confini dell'atto professionale: nessuna chiusura automatica di un contatto, nessuna soglia dedotta, nessun contenuto clinico precompilato |
| **Assistito e chi lo assiste** | Percorsi progettati per lo schermo piccolo e la rete peggiore, ripiego telefonico, dichiarazioni persistenti su ciò che il servizio non è |
| **Integratore** | Quattro modalità di integrazione, contratti versionati, dodici mesi di preavviso di dismissione, nessuna imposizione di interfaccia, di identità o di anagrafica |
| **Ente regionale o committente pubblico** | Documentazione verificabile invece di dichiarazioni, tabelle di ripartizione da mettere accanto a un capitolato, esclusioni di perimetro con identificativo |
| **Chi immette sul mercato un prodotto derivato** | Il pacchetto regolatorio come materiale utilizzabile: fascicolo tecnico, ciclo di vita del software, gestione del rischio, ingegneria dell'usabilità, e in particolare le attività retroattivamente irrecuperabili già impostate |

## 5. I non obiettivi

Questa sezione ha lo stesso rango della precedente. In un sistema sanitario a distanza, **ciò che
il software non fa vale quanto ciò che fa**, e per tre ragioni distinte: perché una capacità in
più può spostare la qualificazione di rischio del prodotto; perché un servizio che sembra fare
qualcosa che non fa produce affidamento improprio, e il danno non nasce da ciò che il sistema fa
ma da ciò che una persona non fa perché si fida; perché il perimetro è il confine fra ciò di cui
risponde il progetto e ciò di cui risponde chi lo usa.

L'elenco completo, con identificativo `OUT-nn`, categoria di riapribilità e - soprattutto -
**colonna di verifica**, è in
[`docs/03_functional/07-fuori-perimetro.md`](../03_functional/07-fuori-perimetro.md).
Un'esclusione che non si può verificare rientra dalla finestra alla prima consegna sotto
pressione. Qui si riportano i non obiettivi nella forma in cui contano per chi valuta il progetto.

### 5.1 Telemedic non è, oggi, un dispositivo medico - e non promette di esserlo entro una data

Questo non obiettivo è quello che ha subito la modifica più importante, e va letto per intero
perché è facile leggerlo come il contrario di ciò che dice.

**Che cosa è cambiato.** Il progetto **ha deciso di assumere in proprio il ruolo di fabbricante**
(`D58`), che emenda le decisioni precedenti nella parte in cui attribuivano il percorso di
certificazione a un soggetto esterno indefinito. Le attività che erano attribuite a «chi intende
certificare» - costituzione del fabbricante, nomina della persona responsabile del rispetto della
normativa, richieste di informazioni agli organismi notificati, avvio del piano di valutazione
clinica - **sono del progetto**. Il soggetto giuridico che le eserciterà è però **ancora da
costituire**, ed è un prerequisito interno con un proprio tempo.

**Che cosa non è cambiato**, e va detto ogni volta che serve:

1. **Oggi il prodotto non reca marcatura CE** e non è coperto da alcuna dichiarazione di
   conformità. È uno stato di fatto, non una posizione, e resta vero finché non cambia.
2. **Chi installa, integra o mette in servizio il software assume comunque gli obblighi che ne
   derivano.** Che il progetto intenda certificare in futuro non trasferisce nulla a chi installa
   una versione non certificata, e lasciarlo intendere sarebbe più dannoso del silenzio.
3. **Non si scrive in nessun luogo che il prodotto sarà marcato entro una data.** Vale per la
   documentazione, per la comunicazione pubblica e per il materiale di presentazione. Una
   pianificazione interna non diventa una promessa solo perché è del progetto, e la promessa di un
   esito regolatorio datato è precisamente ciò che il divieto sulle dichiarazioni fuorvianti
   colpisce (vincolo `V-171`).
4. **La responsabilità verso il danneggiato non è escludibile per contratto** (Direttiva (UE)
   2024/2853, art. 15). Vale ora come prima, e con più forza da quando l'intenzione di certificare
   è del progetto.

**Che cosa resta prioritario a prescindere.** Alcune attività non sono recuperabili a posteriori
(`D45`) e la loro assenza renderebbe impossibile certificare in seguito, a chiunque: congelamento
degli identificativi di requisito, inventario dei componenti di terze parti e distinta dei
materiali generati dalla prima catena di costruzione, controllo dei documenti, separazione
dichiarata fra repository e distribuzione. Erano prioritarie quando il fabbricante era un terzo
indefinito; lo sono a maggior ragione ora che il fabbricante sarà il progetto.

### 5.2 Telemedic non vuole essere accreditato presso la federazione nazionale delle identità

Un progetto open source **non può** esserlo. Il fornitore di servizi ai sensi del DPCM 24 ottobre
2014, art. 1, c. 1, lett. i), è chi *eroga servizi in rete*, e la convenzione impegna a dichiarare
all'autorità l'elenco dei servizi attivi: il fornitore di servizi è **chi installa**, mai il
progetto (`D36`, vincolo `V-05`, `OUT-22`).

L'obiettivo è quindi un prodotto **conforme e verificabile in integrazione continua**, non
un'installazione accreditata. La differenza non è nominale: i tempi dell'accreditamento non sono
dichiarati in alcuna fonte primaria, e dichiararli sarebbe inventarli.

### 5.3 Telemedic non vuole essere il sistema di riferimento delle anagrafiche

Assistiti, professionisti, sedi e appuntamenti sono già gestiti altrove. Il sistema lavora **per
riferimento**, con gli identificatori del dominio di attribuzione di chi integra, e non implementa
un indice di riconciliazione delle identità né fusioni automatiche per somiglianza (`OUT-15`).
Nessun identificatore esterno è chiave primaria, e la normalizzazione avviene al confine, mai nel
dominio (vincolo `V-142`).

### 5.4 Telemedic non vuole essere l'archivio clinico della struttura

Non svolge conservazione a norma e non è l'archivio clinico primario (`OUT-23`). Il modello
prevede espressamente una **modalità di esercizio a non conservazione del contenuto clinico**,
coerente con il DM 19 novembre 2025, art. 12, in cui le infrastrutture regionali non conservano i
dati e i documenti generati e il conferimento al fascicolo è a carico delle strutture sanitarie.

### 5.5 Telemedic non vuole essere un canale di emergenza

Non chiama i soccorsi e non li allerta automaticamente (`OUT-13`). Ciò che fa è **logistico, non
clinico**: rende immediatamente disponibili al professionista le informazioni che non ha perché
l'assistito non è nella stessa stanza - indirizzo in cui la persona si trova **in quel momento**,
recapiti, contatto di emergenza dichiarato. Da qui un requisito che sorprende chi non ha pensato
al caso: l'indirizzo di svolgimento va chiesto e confermato all'inizio di ogni sessione, perché
l'indirizzo di residenza anagrafico è inutile in emergenza.

Simmetricamente, il progetto non offre percorsi di televisita in contesti qualificati come urgenza
o emergenza (`OUT-19`): il DM 30 settembre 2022, Allegato B, stabilisce che la prestazione a
distanza «non deve costituire ragione per ritardare interventi in presenza».

### 5.6 Telemedic non vuole essere un sistema di supporto alla decisione clinica

Non formula ipotesi diagnostiche, non stima probabilità cliniche, non produce prognosi, non gradua
l'urgenza con un algoritmo proprio, non suggerisce dosaggi o terapie, non verifica interazioni fra
farmaci, non applica all'immagine elaborazioni che ne modifichino il contenuto informativo a fini
di lettura clinica, non precompila contenuto clinico interpretativo nel documento, non deduce
soglie, non decide di non allarmare sulla base di altri dati clinici (`OUT-01` … `OUT-09`).

Il presidio non è documentale: una proposta che introduca una di queste funzioni **non si valuta
nel merito tecnico, si rifiuta per politica di perimetro**, con motivazione regolatoria scritta
(vincolo `V-170`). Vale anche per l'introduzione di un componente di intelligenza artificiale, che
è un cambio di regime normativo e non una scelta tecnica.

### 5.7 Telemedic non vuole mediare l'accesso di un pagatore al fascicolo

L'art. 15, c. 4, del DM 7 settembre 2023 esclude **sempre** le compagnie di assicurazione
dall'accesso al Fascicolo sanitario elettronico, insieme a periti e datori di lavoro. Il caso
d'uso in cui una prestazione è **pagata** da un fondo, una mutua o una polizza resta pienamente
valido: **il pagatore non è un consultatore** (`D48`, vincolo `V-08`, `OUT-18`).

Nessun ambito di autorizzazione, nessun tipo di evento, nessun modulo sostituibile e nessuna
configurazione di tenant può costituire un percorso - diretto o mediato da un professionista - con
cui un pagatore ottiene contenuto clinico. Il profilo di integrazione del pagatore è
**amministrativo per costruzione**: identificativo della prestazione, esito amministrativo,
importo (vincolo `V-166`). È l'esclusione **non riapribile** finché la fonte è in vigore.

### 5.8 Telemedic non vuole distribuire contenuto di terzi che non può distribuire

Il repository non contiene e non distribuisce contenuti SNOMED CT, ATC/DDD, ICD-10, ICD-11, CPT,
né i documenti degli standard HL7 v2.x, i Technical Framework IHE o lo standard DICOM. Vi fa
riferimento soltanto tramite l'URI canonico del sistema di codifica, i codici immessi
dall'utilizzatore e le operazioni terminologiche rivolte a un servizio esterno configurato da chi
installa. Le condizioni e le conseguenze per chi installa sono in
[`THIRD-PARTY-TERMINOLOGY.md`](https://github.com/fedcal/Telemedic/blob/main/THIRD-PARTY-TERMINOLOGY.md).

Il corollario obbligato, che non è un ripiego: **il sistema è pienamente funzionale senza SNOMED
CT** e nessun percorso principale può richiederlo (vincolo `V-03`). Il costo è dichiarato invece
di essere taciuto.

Con la stessa logica il progetto **non distribuisce alcun catalogo di prestazioni**, nemmeno come
esempio: la struttura di una voce di catalogo è nel prodotto, il contenuto è dato di tenant.
Ventuno cicli regionali indipendenti dentro un prodotto significherebbero una cadenza di rilascio
determinata da atti amministrativi altrui.

### 5.9 Telemedic non vuole costruire un modello di ricavo sui volumi di teleconsulto

È un fatto normativo, non una scelta: il teleconsulto non è prestazione specialistica autonoma,
non ha voce a nomenclatore, non prevede prescrizione a carico del servizio sanitario né
compartecipazione alla spesa. Un modello di business fondato sul volume di teleconsulti nel
servizio sanitario nazionale **non ha fonte di ricavo diretta**, e nessun materiale del progetto
può suggerire il contrario.

### 5.10 Telemedic non vuole essere la documentazione controllata di un fabbricante

Nessun capitolo di `docs/` è una procedura del sistema di gestione della qualità né un documento
del fascicolo tecnico, e nessuna area può presentarlo come tale: i capitoli sono **ingressi**,
contengono l'analisi da cui un documento controllato si scrive (vincolo `V-174`). È il punto di
giunzione dell'intero modello: il progetto può compilare quasi tutto il fascicolo tecnico, tranne
ciò che presuppone un sistema di controllo dei documenti di un fabbricante.

## 6. Che cosa il progetto si vieta di dire

Due elenchi di formule vietate sono in vigore, e valgono per ogni artefatto pubblico -
documentazione, sito, `README`, titolo di sezione, descrizione di interfaccia, messaggio di
errore, nota di rilascio, risposta a una gara.

Il primo è di natura tecnica (vincolo `V-133`, elenco completo in
[`docs/04_protocols/10-conformita-e-prove.md`](../04_protocols/10-conformita-e-prove.md) §2):
niente «conforme» su mappe che le specifiche stesse qualificano come informative; niente
«standard» su intestazioni che non sono mai state standardizzate; niente «conforme alla guida
italiana» senza la versione, che oggi è una bozza; niente «cifrato fino agli estremi» senza la
condizione della modalità senza registrazione.

Il secondo è di natura regolatoria (vincolo `V-171`, tabella in
[`docs/08_compliance/01-inquadramento-normativo.md`](../08_compliance/01-inquadramento-normativo.md)
§11): nessun testo può affermare o lasciare intendere una conformità, una marcatura o una
certificazione inesistenti. Il fondamento è che l'art. 7 e l'art. 2, punto 12, del Regolamento (UE)
2017/745 fanno del materiale promozionale **materiale regolatorio**, e il divieto di dichiarazioni
fuorvianti **non presuppone la marcatura**.

A questi si aggiungono tre riformulazioni già in vigore su affermazioni tecniche che il progetto
ha corretto invece di ereditarle:

| Formula scartata | Formula adottata |
|---|---|
| «peer-to-peer» come proprietà assoluta | «cifrato fino agli estremi, **instradato direttamente quando la rete lo consente**» |
| «latenza inferiore a 200 ms» come promessa | metrica **misurata, registrata e notificata**, con le soglie dichiarate come specifica di prodotto e mai come conformità |
| «rotazione delle chiavi per sessione» | «materiale crittografico generato ex novo per ogni sessione, senza riuso». **La rotazione durante la sessione non esiste nella tecnologia e non si rivendica** |

Una quarta riformulazione riguarda l'indice di qualità della sessione: è **proprietario e va
dichiarato tale**, perché non esiste un punteggio di opinione media applicabile al tempo reale
secondo alcuna raccomandazione internazionale (vincolo `V-114`).

## 7. Perché la documentazione è venuta prima del codice

La sequenza originariamente approvata (`D52`) prevedeva che si completasse **tutta** la
documentazione, si costruisse il sito con internazionalizzazione e lo si pubblicasse prima di ogni
riga di software. È stata **emendata** (`D53`, `D56`): il primo rilascio installabile resta al 30
novembre 2026, la traduzione integrale non è più prerequisito di ogni riga di codice e procede in
parallelo. Restano prerequisiti non negoziabili, perché il loro costo di omissione è
irrecuperabile, le avvertenze pubbliche obbligatorie, la guida dei fondamenti e le aree di
conformità e sicurezza.

L'inversione iniziale non era un vezzo: è la conseguenza di due fatti.

Il primo è regolatorio. Alcune attività non sono recuperabili a posteriori: la tracciabilità
richiesta da IEC 62304 non si ricostruisce, gli identificativi di requisito riusati per un
requisito diverso rendono inservibile l'intera matrice, censire i componenti di terze parti a
posteriori costa molte volte tanto, e ciò che nasce fuori dal controllo dei documenti va riemesso
(`D45`). Da qui il vincolo `V-182`: **nessuna riga di codice applicativo precede la catena di
costruzione** che genera la distinta dei materiali e il registro degli identificativi.

Il secondo è di adozione. In sanità un software non documentato non è installabile. La
documentazione dell'integrazione, la ripartizione delle responsabilità e il perimetro escluso sono
ciò che un responsabile della sicurezza, un responsabile della protezione dei dati o una
commissione di gara leggono prima di guardare il codice.

C'è un costo, ed è dichiarato: al 25 agosto 2026 il progetto ha un corpo documentale ampio e
nessun software, e la capacità disponibile è **un contributore unico a tempo parziale** (`D54`).
Da qui l'obbligo che discende da `D53` e che non è un'opzione: **l'ambito del primo rilascio si
riduce a ciò che quella capacità può costruire e verificare nel tempo disponibile**, dichiarando
che cosa entra, che cosa è tagliato e quali tagli sono reversibili. Il capitolo
[04 - Stato e limiti](./04-stato-e-limiti.md) espone la fotografia e le tensioni che ne discendono.

## Dove continuare

- [02 - Le quattro prestazioni](./02-le-quattro-prestazioni.md): che cosa distingue davvero
  televisita, teleconsulto, teleassistenza e telemonitoraggio, e quali obblighi distinti portano.
- [03 - A chi si rivolge](./03-a-chi-si-rivolge.md): per ciascun destinatario, che cosa ottiene,
  che cosa deve mettere di suo, che cosa il progetto non gli dà.
- [04 - Stato e limiti](./04-stato-e-limiti.md): la fotografia reale, i limiti dichiarati e le
  tensioni accettate consapevolmente.
- [`docs/03_functional/07-fuori-perimetro.md`](../03_functional/07-fuori-perimetro.md): l'elenco
  completo delle esclusioni con la categoria di riapribilità e la verifica di ciascuna.
- [`NOT-A-MEDICAL-DEVICE.md`](https://github.com/fedcal/Telemedic/blob/main/NOT-A-MEDICAL-DEVICE.md)
  e [`DISTRIBUTION-POLICY.md`](https://github.com/fedcal/Telemedic/blob/main/DISTRIBUTION-POLICY.md):
  la destinazione d'uso dichiarata e la distinzione fra ciò che il progetto pubblica e ciò che
  qualcuno mette in servizio.
