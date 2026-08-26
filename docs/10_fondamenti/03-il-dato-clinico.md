---
title: Il dato clinico
sidebar_position: 4
description: Cos'è un dato relativo alla salute, perché l'art. 9 GDPR ne fa una categoria particolare, base giuridica contro consenso informato, ruoli privacy, pseudonimizzazione, dossier/cartella/FSE, referti e firme, conservazione, oscuramento, DPIA, violazioni e la regola assoluta sui dati sintetici.
---

# Il dato clinico

Un sistema informativo ordinario tratta dati che, se esposti, causano un danno economico o
reputazionale. Un sistema sanitario tratta dati che, se esposti, possono costare a una persona
il lavoro, la copertura assicurativa, l'affidamento di un figlio, una relazione, la
reputazione sociale, e in alcuni casi la sicurezza fisica.

Non è una considerazione morale che si aggiunge alla progettazione: è la ragione per cui il
diritto europeo colloca questi dati in una categoria a divieto di principio, e per cui una
quantità di scelte architetturali che altrove sarebbero legittime qui non lo sono.

Questo modulo spiega cosa sia un dato relativo alla salute, quali obblighi ne discendano, e
come questi obblighi si traducano in decisioni di codice. Non presuppone nozioni di diritto:
ogni istituto è spiegato da zero. Presuppone però il modulo
[01](01-sistema-sanitario-italiano.md), perché alcuni esempi usano il vocabolario del sistema
sanitario italiano.

---

## 1. Il dato relativo alla salute

### 1.1 La definizione

Il **Regolamento (UE) 2016/679**, comunemente **GDPR** (*General Data Protection Regulation*,
regolamento generale sulla protezione dei dati), definisce all'**art. 4, n. 15**:

> «*dati relativi alla salute*»: i dati personali attinenti alla salute fisica o mentale di
> una persona fisica, compresa la prestazione di servizi di assistenza sanitaria, **che
> rivelano informazioni relative al suo stato di salute**.

Il **considerando 35** amplia in modo decisivo:

> Nei dati personali relativi alla salute dovrebbero rientrare tutti i dati riguardanti lo
> stato di salute dell'interessato che rivelino informazioni connesse allo stato di salute
> passato, presente o futuro dello stesso. Questi comprendono le informazioni sulla persona
> fisica raccolte **nel corso della sua registrazione al fine di ricevere servizi di
> assistenza sanitaria** […]; **un numero, un simbolo o un elemento specifico attribuito a
> una persona fisica per identificarla in modo univoco a fini sanitari**; le informazioni
> risultanti da esami e controlli effettuati su una parte del corpo o una sostanza organica
> […]; e qualsiasi informazione riguardante, ad esempio, una malattia, una disabilità, il
> rischio di malattie, l'anamnesi medica, i trattamenti clinici o lo stato fisiologico o
> biomedico dell'interessato, **indipendentemente dalla fonte**.

Le due espressioni sottolineate fanno saltare l'intuizione comune. Non è dato sanitario solo
il referto: lo è **il fatto stesso di essersi registrati per ricevere assistenza**.

### 1.2 Perché quasi tutto, in questo sistema, è dato sanitario

Applichiamo la definizione al dominio del progetto. Sono dati relativi alla salute - con
tutte le conseguenze - anche:

- **l'esistenza di un appuntamento con una determinata branca specialistica.** Un
  appuntamento in oncologia rivela un sospetto o una diagnosi oncologica. Un appuntamento in
  un servizio per le dipendenze rivela una dipendenza;
- **il codice di esenzione per patologia**, che *è* la patologia in forma codificata (modulo
  [01](01-sistema-sanitario-italiano.md), § 7.4);
- **l'indirizzo di consegna di un dispositivo di telemonitoraggio**, che rivela che quella
  persona è in un percorso di monitoraggio domiciliare;
- **la frequenza e la durata delle sessioni** con uno psicoterapeuta;
- **il nome del professionista** con cui si ha un contatto, se la sua specialità è pubblica;
- **il tipo di prestazione** in un promemoria inviato via SMS;
- **il tesserino dispositivi** con il modello e il fabbricante di un apparecchio medico
  assegnato.

Da qui una regola di progettazione che il progetto adotta come vincolo: **gli oggetti
«amministrativi» non sono neutri**. Non esiste uno schema «anagrafica e agenda» a cui
applicare tutele attenuate perché «non contiene dati clinici». Contiene dati sanitari per
inferenza, e l'inferenza è esattamente ciò che il considerando 35 intende con «rivelano».

Conseguenza operativa immediata e non negoziabile: **il promemoria di un appuntamento non
può contenere dato clinico**. Data, ora, struttura, collegamento. Nessuna prestazione,
nessuna branca, nessun nome di reparto.

### 1.3 La categoria particolare: divieto di principio, deroghe tassative

L'**art. 9, paragrafo 1** del GDPR stabilisce un **divieto**:

> È vietato trattare dati personali che rivelino l'origine razziale o etnica, le opinioni
> politiche, le convinzioni religiose o filosofiche, o l'appartenenza sindacale, nonché
> trattare dati genetici, dati biometrici intesi a identificare in modo univoco una persona
> fisica, **dati relativi alla salute** o alla vita sessuale o all'orientamento sessuale
> della persona.

Questa è la differenza strutturale rispetto a tutti gli altri dati personali. Per i dati
comuni la regola è: si può trattare, purché esista una base giuridica fra quelle dell'art. 6.
Per le categorie particolari la regola è: **è vietato**, salvo che ricorra una delle deroghe
tassative dell'art. 9, paragrafo 2 - e **in aggiunta** una base giuridica dell'art. 6.

Servono cioè **due condizioni cumulative**, non una. È l'errore più comune nelle
autovalutazioni di conformità: individuare la deroga dell'art. 9 e fermarsi lì.

Le deroghe rilevanti per questo dominio:

| Lettera art. 9.2 | Contenuto | Uso tipico qui |
|---|---|---|
| **h)** | Finalità di medicina preventiva o del lavoro, diagnosi, **assistenza o terapia sanitaria**, gestione dei sistemi e servizi sanitari, sulla base del diritto dell'Unione o degli Stati membri | **La base ordinaria della cura** |
| **i)** | Motivi di interesse pubblico nel settore della sanità pubblica | Sorveglianza epidemiologica, emergenze |
| **j)** | Finalità di ricerca scientifica, statistica o di archiviazione nel pubblico interesse | Ricerca, anche negli IRCCS |
| **a)** | Consenso esplicito dell'interessato | Casi residuali: registrazione della sessione, finalità ulteriori |
| **c)** | Interesse vitale, quando l'interessato è incapace di prestare il consenso | Emergenza, accesso in *break-glass* |
| **f)** | Accertamento, esercizio o difesa di un diritto in sede giudiziaria | Contenzioso |

L'**art. 9, paragrafo 3** aggiunge una condizione essenziale per la lettera h): i dati devono
essere trattati «*da o sotto la responsabilità di un professionista soggetto al segreto
professionale*» o da altro soggetto soggetto a un obbligo di segretezza. **La deroga di cura
non è disponibile a chiunque**: presuppone la relazione di cura e il vincolo di segretezza.

### 1.4 La normativa italiana di completamento

Il GDPR lascia agli Stati margini di intervento, e l'Italia li ha esercitati con il **D.lgs.
30 giugno 2003, n. 196** (Codice in materia di protezione dei dati personali), profondamente
novellato dal **D.lgs. 10 agosto 2018, n. 101**. Due articoli contano qui:

- **art. 2-*septies*** - il Garante per la protezione dei dati personali adotta **misure di
  garanzia** per il trattamento dei dati genetici, biometrici e relativi alla salute. Sono
  prescrizioni ulteriori e vincolanti, aggiornate periodicamente. `[NV]` sull'elenco delle
  misure vigenti alla data odierna: vanno verificate sul sito del Garante prima di derivarne
  requisiti;
- **art. 2-*sexies*** - individua i motivi di interesse pubblico rilevante che consentono il
  trattamento di categorie particolari da parte di soggetti pubblici, richiedendo che siano
  previsti da legge o regolamento.

---

## 2. Base giuridica e consenso informato: due cose diverse

### 2.1 La confusione più costosa del dominio

Chi arriva dall'informatica ha in testa un modello mentale unico: «il consenso». C'è un banner,
l'utente clicca, il trattamento diventa lecito. In sanità questo modello è **doppiamente
sbagliato**, e produce errori architetturali che si scoprono tardi e costano molto.

Ci sono due istituti con nomi simili e nature del tutto diverse.

**Il consenso informato all'atto sanitario.** È un istituto di **diritto sanitario**,
disciplinato in Italia dalla **legge 22 dicembre 2017, n. 219** («Norme in materia di consenso
informato e di disposizioni anticipate di trattamento»). Riguarda la volontà della persona di
**sottoporsi a un trattamento sanitario**. Il suo fondamento è l'art. 32 della Costituzione:
nessuno può essere obbligato a un trattamento sanitario se non per disposizione di legge. Se
manca, l'atto medico è illegittimo a prescindere da ogni considerazione sui dati.

**La base giuridica del trattamento dei dati.** È un istituto di **diritto della protezione
dei dati**. Risponde alla domanda: perché è lecito trattare questi dati? Il consenso è **una
delle possibili risposte**, e nel contesto della cura **non è quella normale**.

### 2.2 Perché per la cura il consenso non è la base giuridica

Il consenso, ai sensi dell'art. 4, n. 11 e dell'art. 7 del GDPR, deve essere **libero,
specifico, informato, inequivocabile** e **revocabile in qualsiasi momento con la stessa
facilità con cui è stato prestato**.

Ora si consideri cosa accadrebbe se il trattamento dei dati per finalità di cura poggiasse
sul consenso:

- il paziente potrebbe **revocarlo a metà di un percorso terapeutico**, obbligando la
  struttura a cessare il trattamento dei suoi dati - cioè a smettere di poterlo curare in
  sicurezza;
- il consenso non sarebbe **libero**, perché il rifiuto comporterebbe l'impossibilità di
  ricevere la prestazione: manca la genuina possibilità di scelta;
- la struttura non potrebbe adempiere agli **obblighi di legge** (documentazione sanitaria,
  alimentazione del FSE, flussi di rendicontazione) che esistono indipendentemente dalla
  volontà del paziente.

Per questo la base giuridica ordinaria della cura è la combinazione **art. 6.1.c o 6.1.e**
(obbligo legale, oppure interesse pubblico o esercizio di pubblici poteri) **più art. 9.2.h**
(finalità di assistenza o terapia) **più art. 9.3** (professionista soggetto a segreto).
**Chiedere il consenso dove non serve non è una cautela in più: è un difetto**, perché genera
una revocabilità che l'ordinamento non prevede e che, se onorata, blocca la cura; e se non
onorata, rende il sistema incoerente con ciò che ha dichiarato.

### 2.3 I quattro oggetti da tenere separati

Il progetto codifica come regola di dominio la separazione fra almeno quattro manifestazioni
di volontà distinte, ciascuna raccolta, revocata e conservata separatamente:

| Oggetto | Natura | Base o fondamento | Effetto della revoca |
|---|---|---|---|
| **Consenso informato all'atto sanitario** | Atto clinico | L. 219/2017; art. 32 Cost. | L'atto non può essere compiuto o va interrotto |
| **Adesione informata alla prestazione in telemedicina** | Atto clinico-organizzativo | Accordo 215/CSR 2020 | Il canale a distanza non è utilizzabile; resta la prestazione in presenza |
| **Base giuridica del trattamento dei dati** | Protezione dei dati | Art. 6 + art. 9.2 GDPR | Se la base è il consenso, cessa il trattamento futuro; se non lo è, non c'è revoca |
| **Consenso alla registrazione della sessione** | Protezione dei dati, consenso esplicito ex art. 9.2.a | Consenso | Interruzione immediata della registrazione in corso |
| **Consenso alla presenza di terzi** (interprete, discente, osservatore) | Protezione dei dati e relazione di cura | Consenso | Il terzo esce dalla sessione |
| **Consenso alla consultazione del FSE da parte di terzi** | Protezione dei dati | Consenso esplicito ex DM 7 settembre 2023, art. 8 | I terzi non consultano; chi ha prodotto il documento continua a vederlo |

Due regole ulteriori che il progetto tratta come invarianti:

- **ogni consenso registra la versione esatta dell'informativa o del testo presentato**,
  l'istante, il canale, l'identità del dichiarante e - se diverso - quella dell'interessato.
  Un consenso non riferito a un testo versionato è **indimostrabile**: nel contenzioso non si
  può provare *a cosa* la persona abbia acconsentito;
- **un caregiver non presta consenso in sostituzione di un paziente capace**, in nessuna
  configurazione. Assistere non è rappresentare. Per l'incapace servono i titoli di
  rappresentanza, e l'**amministratore di sostegno** ha poteri **delimitati dal decreto di
  nomina**, che possono o meno includere le decisioni sanitarie: il sistema deve registrare
  l'**ambito** dei poteri e verificarlo rispetto all'atto richiesto, non trattarlo come un
  tutore.

### 2.4 Il consenso nel FSE: un caso a parte

Il fascicolo sanitario elettronico ha una disciplina propria che va conosciuta perché
contraddice l'intuizione. Il **DM 7 settembre 2023, art. 8**:

- l'**alimentazione** del FSE **non richiede consenso**: è un obbligo di legge in capo agli
  erogatori (art. 12);
- la **consultazione da parte di terzi** è invece subordinata a **consenso libero, specifico,
  informato, inequivocabile ed esplicito**, distinto per finalità di cura, di prevenzione e di
  profilassi internazionale;
- le finalità di **governo** e di **ricerca** operano su dati pseudonimizzati e non richiedono
  quel consenso;
- «*i dati e i documenti presenti nel FSE **sono sempre consultabili, oltre che
  dall'assistito, dai soggetti che li hanno prodotti***» (art. 8, c. 7).

Si può quindi alimentare senza poter consultare il pregresso. **Sono due permessi distinti**,
e un modello che li unifichi in un unico flag non è implementabile.

---

## 3. Titolare, responsabile, contitolare: chi è cosa

### 3.1 Le definizioni

- **Titolare del trattamento** (*data controller*, art. 4, n. 7) - chi **determina le finalità
  e i mezzi** del trattamento. È il soggetto che risponde verso l'interessato e verso
  l'autorità.
- **Responsabile del trattamento** (*data processor*, art. 4, n. 8) - chi tratta **per conto
  del titolare**, sulla base di un contratto o altro atto giuridico che rispetti i contenuti
  dell'**art. 28**. Non decide le finalità; esegue istruzioni documentate.
- **Contitolari** (art. 26) - due o più titolari che **determinano congiuntamente** finalità e
  mezzi. Devono definire con un accordo trasparente le rispettive responsabilità, e
  l'interessato può esercitare i diritti nei confronti di ciascuno di essi.
- **Sub-responsabile** (art. 28, par. 2 e 4) - il responsabile può ricorrere ad altri
  responsabili solo con autorizzazione del titolare, e resta pienamente responsabile del loro
  operato.
- **Responsabile della protezione dei dati (RPD, o *DPO*)** (artt. 37-39) - figura di
  sorveglianza e punto di contatto. **Obbligatoria** quando il trattamento riguarda su larga
  scala categorie particolari di dati.

### 3.2 Chi è cosa in un'installazione di questo progetto

La risposta dipende dal modello di distribuzione, e non è la stessa nei due casi previsti.

**Installazione presso l'erogatore (*on-premise*, singolo tenant).**

| Soggetto | Ruolo |
|---|---|
| Struttura sanitaria (ASL, azienda ospedaliera, studio, poliambulatorio) | **Titolare** per la finalità di cura |
| Professionista sanitario che opera in autonomia | **Titolare** per i propri atti |
| Fornitore che gestisce l'installazione, se esiste | **Responsabile**, con contratto ex art. 28 |
| Fornitore del servizio TURN, del gateway di posta o SMS, del servizio di conservazione | **Sub-responsabili**, da censire nel registro e nella catena contrattuale |
| Il progetto in quanto tale | **Nessun ruolo**: distribuisce codice sorgente, non tratta dati |

**Installazione multi-tenant gestita da un operatore.**

| Soggetto | Ruolo |
|---|---|
| Ciascun tenant (struttura o professionista) | **Titolare autonomo** per i propri dati |
| Operatore della piattaforma | **Responsabile** per ciascun titolare |
| Operatore della piattaforma, per i propri log tecnici, sicurezza e fatturazione | **Titolare** per quelle finalità distinte |

Il secondo caso genera un requisito architetturale preciso: **il modello dati deve poter
rappresentare titolari diversi sulla stessa installazione**, con informative diverse, registri
diversi, tempi di conservazione diversi e responsabili della protezione dei dati diversi.
Non è una funzione di reportistica: è il vincolo di consapevolezza del tenant, per cui ogni
riga di dato, ogni evento di dominio e ogni voce di audit porta l'identificativo di tenant, e
**una scrittura senza tenant è un errore, non un valore nullo tollerato**.

### 3.3 I ruoli nell'ecosistema nazionale

Nell'architettura pubblica italiana la titolarità è distribuita per norma, non per contratto:

- i soggetti che hanno in cura l'assistito, «*presso cui sono redatti i dati e i documenti
  sanitari che alimentano il FSE, **sono titolari del trattamento per finalità di cura***»
  (DM 7 settembre 2023, art. 12, c. 2);
- **AGENAS** è titolare dei soli trattamenti dell'infrastruttura nazionale di telemedicina;
- **Regioni e Province autonome** sono titolari per le infrastrutture regionali;
- le **Regioni** sono titolari dei trattamenti di verifica formale e semantica dei documenti
  (art. 13);
- i provider di identità digitale sono titolari per l'identificazione; la Regione di erogazione
  per l'autenticazione dei professionisti; la Regione di assistenza per quella degli assistiti
  (DM 19 novembre 2025, Allegato 3, § 5).

### 3.4 L'amministratore di sistema

Chi ha privilegi tecnici elevati su un sistema che tratta dati sanitari è, nel lessico del
Garante italiano, **amministratore di sistema**, e la sua posizione è soggetta a prescrizioni
specifiche: designazione individuale, elenco aggiornato, verifica periodica dell'operato,
registrazione degli accessi con caratteristiche di completezza, inalterabilità e conservazione
minima. La fonte storica è il provvedimento generale del Garante del 27 novembre 2008 e
successive modificazioni. `[NV]` sulla formulazione e sulla piena vigenza post-GDPR delle
singole prescrizioni: va verificata prima di derivarne requisiti puntuali.

Indipendentemente dalla verifica, il progetto adotta una postura più stringente e
architetturalmente esplicita: **l'amministratore di sistema è progettato come ruolo senza
accesso in chiaro al contenuto clinico**, con azioni sempre tracciate e, per le operazioni
critiche, doppio controllo. Analogamente, l'amministratore di tenant **non deve poter leggere
i dati clinici del proprio tenant per il solo fatto di amministrarlo**, e ogni assegnazione a
sé stesso di un ruolo clinico genera un evento di audit ad alta severità.

Il responsabile della protezione dei dati, per parte sua, **non è un amministratore di
sistema**: deve poter leggere audit e registri **senza** poter accedere al contenuto clinico,
e ogni sua lettura è a sua volta tracciata. Chi controlla è controllato.

---

## 4. Pseudonimizzazione e anonimizzazione

### 4.1 Le due nozioni

**Pseudonimizzazione** (art. 4, n. 5 GDPR): trattamento dei dati in modo che non possano più
essere attribuiti a un interessato specifico **senza l'utilizzo di informazioni aggiuntive**,
a condizione che tali informazioni siano conservate separatamente e soggette a misure tecniche
e organizzative.

Il punto decisivo: **il dato pseudonimizzato resta un dato personale**. È una misura di
sicurezza, non un'uscita dal perimetro del regolamento. Cifrare, sostituire il codice fiscale
con un identificatore opaco, sostituire i nomi con etichette: tutte queste operazioni
riducono il rischio, nessuna rende il GDPR inapplicabile.

**Anonimizzazione**: il considerando 26 la definisce per esclusione. Il regolamento non si
applica alle informazioni anonime, cioè quelle «*che non si riferiscono a una persona fisica
identificata o identificabile*» o rese anonime «*in modo tale che l'interessato non sia o non
sia più identificabile*». Per stabilire l'identificabilità «*si dovrebbe tener conto di tutti
i mezzi […] di cui il titolare del trattamento o un terzo può ragionevolmente avvalersi*».

### 4.2 Perché quasi nessun dato clinico è davvero anonimo

Rimuovere nome, cognome e codice fiscale è banale e quasi sempre insufficiente. Le ragioni:

- **i quasi-identificatori.** La combinazione di data di nascita, sesso e comune di residenza
  è nota per identificare univocamente una frazione elevata della popolazione. Aggiungendo la
  data di una prestazione e la struttura erogante, l'unicità diventa quasi certa;
- **la rarità clinica.** Una diagnosi rara in una provincia piccola identifica la persona
  senza bisogno di altro. È esattamente il motivo per cui esistono le soglie di aggregazione;
- **la longitudinalità.** Una sequenza temporale di misure - pressione, glicemia, peso - è una
  firma. Due serie storiche di telemonitoraggio non si confondono;
- **i dati intrinsecamente identificanti.** I dati genetici lo sono per costruzione. Le
  immagini che ritraggono il volto lo sono. Le registrazioni audio-video lo sono in modo
  totale: voce, viso, ambiente domestico, altre persone presenti;
- **la reidentificazione per differenza.** Interrogazioni aggregate successive con filtri
  leggermente diversi permettono di isolare un individuo per sottrazione, anche se ogni
  singola risposta rispetta la soglia minima.

**La conseguenza operativa** è che il progetto non usa la parola «anonimo» a cuor leggero.
Ciò che il sistema produce è, quasi sempre, **pseudonimizzato**, e come tale resta soggetto a
tutte le tutele.

### 4.3 Le regole quantitative che esistono

Nel contesto nazionale esistono due prescrizioni quantitative da conoscere, entrambe dal DM 19
novembre 2025, Allegato 4:

- la **pseudonimizzazione è effettuata dall'Ecosistema dati sanitari**, non dall'infrastruttura
  nazionale di telemedicina, ed è eseguita «*in sequenza, in modo automatico, **senza
  intervento umano e 1 volta nelle 24 ore***», normalmente nelle ore notturne;
- è imposta la «*verifica puntuale del rispetto di specifiche delle regole di
  clusterizzazione, al fine di garantire che nessun risultato […] possa essere riconducibile
  ad un singolo individuo (**cardinalità uno**), indipendentemente dal livello o dalla
  dimensione di analisi*».

Il progetto adotta una regola coerente e più conservativa: le statistiche aggregate non sono
restituite se il gruppo risultante ha cardinalità inferiore a una soglia configurata (valore
predefinito proposto: cinque), **né in forma diretta né deducibile per differenza fra
interrogazioni successive**. La seconda parte è quella che richiede lavoro vero: impedire la
reidentificazione per differenza significa tracciare le interrogazioni o applicare rumore, non
soltanto filtrare la singola risposta.

### 4.4 La regola sui log

Da tutto quanto sopra discende una regola che vale come vincolo, e che il § 10 riprende: **i
log applicativi non contengono contenuto clinico né identificatori diretti del paziente**.
L'identificazione avviene tramite pseudonimo, risolvibile solo tramite un audit autorizzato e
a sua volta tracciato. I log sono la via di esfiltrazione più comune e la più sottovalutata,
perché finiscono in sistemi di aggregazione, in ticket di assistenza, in schermate condivise e
in incolla su chat.

---

## 5. Dove stanno i dati: quattro contenitori diversi

Questa sezione risolve una confusione che produce regole di accesso sbagliate. **Dossier
sanitario, cartella clinica, fascicolo sanitario elettronico e archivio dell'erogatore sono
quattro cose diverse**, con ambito, titolarità, regole di accesso e tempi di conservazione
diversi.

| | **Cartella clinica** | **Dossier sanitario** | **Archivio dell'erogatore** | **FSE** |
|---|---|---|---|---|
| **Ambito** | Un singolo **episodio di ricovero** o percorso, presso una struttura | Tutti i dati di un paziente presso **una singola struttura** | Tutto ciò che l'erogatore detiene per obblighi propri | **Nazionale/regionale**, tutta la vita dell'assistito |
| **Chi lo forma** | I professionisti che partecipano all'episodio | La struttura, aggregando i propri contatti | La struttura | Tutti gli erogatori che alimentano |
| **Sotto il controllo di chi** | La struttura, che ne è depositaria | La struttura | La struttura | **L'assistito**, che consente, oscura e revoca |
| **Accesso di terzi** | Su richiesta motivata, secondo la disciplina della documentazione sanitaria | Interno alla struttura, con profilazione | Interno | Subordinato a **consenso esplicito** dell'assistito, per profili di accesso normati |
| **Base di formazione** | Obbligo di legge legato all'atto sanitario | Trattamento per finalità di cura interne | Obblighi documentali, fiscali, di conservazione | D.L. 179/2012, art. 12; DM 7 settembre 2023 |
| **Conservazione** | Illimitata secondo la prassi consolidata `[NV]` | Secondo le finalità dichiarate | Secondo l'obbligo di riferimento | Indice e documenti cancellati **trent'anni dopo il decesso**, eccettuata la cartella clinica |

Alcune precisazioni che meritano di essere esplicite.

**La cartella clinica** è il complesso della documentazione formata durante un episodio di
ricovero. La giurisprudenza le riconosce natura di atto pubblico quando redatta da personale
di struttura pubblica, con la conseguenza che l'alterazione successiva integra una fattispecie
penale e non un mero errore amministrativo. `[NV]` sull'esatta qualificazione e sulle
pronunce di riferimento, non verificate nelle fonti consultate dal progetto. La conseguenza
pratica che il progetto adotta in ogni caso: **una correzione non è una sovrascrittura**. Ogni
modifica successiva alla chiusura è un'aggiunta tracciata, con autore, istante e motivo,
mentre la versione precedente resta leggibile.

**Il dossier sanitario** è l'insieme dei dati del paziente presso una singola struttura,
costruito per garantire continuità di cura al suo interno. Il Garante ne ha disciplinato
formazione, consenso e profilazione degli accessi con linee guida dedicate. `[NV]` sugli
estremi e sulla vigenza aggiornata del provvedimento.

**L'archivio dell'erogatore** è la nozione più prosaica e più trascurata: è tutto ciò che una
struttura conserva perché obbligata da norme non sanitarie - obblighi fiscali, contabili,
contrattuali, di conservazione documentale. È la ragione per cui il «diritto alla
cancellazione» ha limiti robusti in questo settore (§ 7.3).

**Il fascicolo sanitario elettronico** non è la cartella clinica della struttura: è nazionale
o regionale, sotto il controllo dell'assistito, con regole proprie di alimentazione, di
consultazione e di oscuramento. Il modulo
[07](07-fse-e-infrastrutture-nazionali.md) lo tratta per intero.

**Dove sta questo progetto.** Nel modello di integrazione adottato, la cartella clinica **resta
al sistema di origine**: il progetto non ne è il *master*. Produce documenti, li restituisce al
sistema che ha in carico il paziente, e nel contesto delle infrastrutture regionali **non
conserva** il contenuto clinico generato (modulo
[02](02-prestazioni-di-telemedicina.md), § 8).

---

## 6. I documenti: referto, relazione, verbale, lettera di dimissione

### 6.1 Referto

Documento sanitario **firmato** che riporta l'esito e le conclusioni di un atto sanitario,
destinato al paziente e al medico richiedente. È il documento certificativo per eccellenza:
attesta che un esame o una visita è stata eseguita e cosa ne è risultato.

Requisiti formali che il progetto deve garantire:

- identificazione univoca dell'assistito, del **medico refertante** e - dato non intuitivo,
  ma imposto dal tracciato ministeriale - del **medico firmatario**, che può essere persona
  diversa;
- identificazione della struttura su tre livelli: azienda, presidio, unità operativa;
- riferimenti all'atto che lo ha originato: numero di ricetta, codice CUP, data e ora di
  inizio e di fine erogazione;
- contenuto clinico: quesito diagnostico codificato, prestazione eseguita, refertazione,
  diagnosi, conclusioni;
- **firma digitale** e data di firma.

**Uno stato di bozza non firmato non è un referto**: è un documento di lavoro. Modellare lo
stato `draft` come distinto e non consegnabile è obbligatorio, e la transizione a `signed` è
il punto in cui il documento acquista effetti giuridici e diventa non modificabile per
sovrascrittura.

### 6.2 Relazione clinica

Comunicazione discorsiva fra professionisti su un caso - tipicamente dal consulente al
curante. **Non è un referto**: non certifica l'esecuzione di un esame, non è necessariamente
destinata al paziente, e non ha lo stesso regime di consegna.

Nel dominio della telemedicina la fattispecie ha assunto forma normativa precisa: la
**relazione collaborativa per il teleconsulto/teleconsulenza** e la **relazione
clinico-assistenziale conclusiva per la teleassistenza** sono tipologie documentali autonome
del FSE, con set informativo pubblicato (modulo
[02](02-prestazioni-di-telemedicina.md), § 7.1). La prima ha per giunta una regola
strutturale: viene conferita al FSE **come allegato** del referto dell'evento principale.

### 6.3 Verbale di pronto soccorso

Documento che attesta l'accesso al pronto soccorso, il triage assegnato, gli accertamenti
eseguiti, la diagnosi e l'esito (dimissione, ricovero, trasferimento, rifiuto di cure). È una
delle tipologie documentali storiche del FSE (DM 7 settembre 2023, art. 3, lett. c). Fuori
perimetro per il progetto, ma va conosciuto perché è il documento che precede e giustifica
molti percorsi successivi.

### 6.4 Lettera di dimissione ospedaliera

Documento redatto alla conclusione di un ricovero, indirizzato al medico curante, che riporta
il motivo del ricovero, il decorso, gli accertamenti, la diagnosi di dimissione, la terapia
alla dimissione e le indicazioni di follow-up. È una delle cinque tipologie storiche di
documento nativo digitale del FSE, insieme al referto di laboratorio, al referto di radiologia,
al referto di specialistica ambulatoriale e al referto di anatomia patologica.

**Non va confusa con la scheda di dimissione ospedaliera (SDO)**, che è invece un tracciato
amministrativo di rendicontazione, non un documento clinico destinato al paziente.

### 6.5 Diario clinico

Annotazioni cronologiche del decorso, redatte da medici e infermieri durante un episodio.
**Non è il referto** e non va consegnato automaticamente al paziente: ha destinatario,
formato, firma e regime di accesso diversi. Confonderlo con il referto in un modello unico di
«nota clinica» produce consegne indebite.

---

## 7. Firma, validazione, marca temporale, conservazione

### 7.1 Le firme non sono tutte uguali

Il **Regolamento (UE) n. 910/2014** (**eIDAS**, *electronic IDentification, Authentication
and trust Services*), come modificato dal **Regolamento (UE) 2024/1183**, distingue tre
livelli:

| Livello | Sigla | Caratteristiche | Valore probatorio |
|---|---|---|---|
| **Firma elettronica semplice** | FES | Qualunque dato in forma elettronica connesso ad altri dati e usato per firmare | Non può essere rifiutata solo per la forma elettronica, ma il valore è liberamente valutabile |
| **Firma elettronica avanzata** | FEA | Connessa unicamente al firmatario, ne consente l'identificazione, creata con mezzi sotto il suo controllo esclusivo, collegata ai dati in modo da rilevare ogni modifica | Valore rafforzato, ma non equivalente per legge all'autografa |
| **Firma elettronica qualificata** | FEQ | FEA creata da un dispositivo qualificato e basata su un **certificato qualificato** | **Effetto giuridico equivalente a quello della firma autografa** (art. 25, par. 2 eIDAS) |

Nell'ordinamento italiano il **Codice dell'amministrazione digitale** (D.lgs. 82/2005) integra
il quadro: l'art. 20 disciplina il valore probatorio del documento informatico e l'art. 21 gli
effetti delle firme. Un documento sottoscritto con firma elettronica qualificata o digitale ha
l'efficacia prevista dall'art. 2702 del codice civile.

**Che livello serve per un referto?** L'Accordo 215/CSR 2020 richiede la «sottoscrizione
digitale» e, per la telerefertazione, la «firma digitale validata del medico responsabile».
`[NV]` sull'individuazione puntuale del livello richiesto dall'ordinamento per ciascuna
tipologia documentale sanitaria: non è stato verificato nelle fonti consultate, e la scelta
va documentata come decisione con la relativa motivazione, non assunta implicitamente.

**Formati.** Le firme si applicano al documento in formati normalizzati: **PAdES** per i
documenti PDF, **CAdES** per file generici (estensione `.p7m`), **XAdES** per XML. Lo standard
documentale nazionale del FSE è **HL7 CDA Rel. 2**, veicolato dentro un PDF firmato
digitalmente - impostazione confermata dalle specifiche nazionali di interoperabilità.

### 7.2 Firma, validazione e marca temporale sono tre cose

- **Validazione clinica** è l'atto con cui il professionista dichiara che il contenuto è
  quello definitivo e se ne assume la responsabilità. È un evento di dominio.
- **Firma** è l'operazione crittografica che lega quel contenuto a quell'identità.
- **Marca temporale** (*time-stamp*) è l'attestazione, rilasciata da un prestatore di servizi
  fiduciari, che quel documento esisteva in quella forma a quell'istante.

**La data di sistema non è una marca temporale.** Un `created_at` scritto dall'applicazione è
un dato che il gestore dell'applicazione può alterare: non è opponibile a terzi. La marca
temporale serve, fra l'altro, a estendere la validità della firma oltre la scadenza del
certificato: senza di essa, alla scadenza del certificato la verifica della firma diventa
problematica.

### 7.3 Conservazione a norma

**Backup e conservazione non sono la stessa cosa.** Il backup protegge dalla perdita del dato;
la **conservazione a norma** protegge dalla contestazione, garantendo nel tempo autenticità,
integrità, affidabilità, leggibilità e reperibilità del documento informatico. È un processo,
con un responsabile della conservazione, un manuale, pacchetti di versamento, archiviazione e
distribuzione, e - nel contesto pubblico - regole tecniche puntuali. Le linee guida AgID sulla
formazione, gestione e conservazione del documento informatico sono la fonte tecnica di
riferimento. `[NV]` su versione e data di ultimo aggiornamento delle linee guida vigenti.

**Tempi di conservazione.** Il quadro è frammentato e va conosciuto nella sua frammentazione:

| Oggetto | Termine | Fonte |
|---|---|---|
| Indice e documenti del FSE | **Trent'anni dalla data del decesso**, con cancellazione a periodicità annuale; **eccettuata la cartella clinica e i documenti afferenti** | DM 7 settembre 2023, art. 10 |
| Dati di autenticazione e accesso ai servizi minimi di telemedicina | **Dodici mesi** | DM 19 novembre 2025, art. 12 |
| Log delle operazioni | **Ventiquattro mesi**, con cancellazione alla scadenza | DM 19 novembre 2025, All. 4, § 6 |
| Documenti e dati generati dalle infrastrutture regionali | **Non conservati** dalla IRT | DM 19 novembre 2025, artt. 4, c. 4 e 12 |
| Cartella clinica ospedaliera | Illimitata secondo la prassi consolidata | `[NV]` - la fonte comunemente citata è una circolare ministeriale del 1986, la cui vigenza e portata non sono state verificate |
| Referti e documentazione diagnostica | Termini pluriennali, differenziati per tipologia | `[NV]` - non verificato nelle fonti consultate |

Dalla frammentazione discende un requisito che non ammette scorciatoie: **ogni categoria di
dato ha un periodo di conservazione dichiarato, applicato da un processo automatico
verificabile, con evidenza dell'avvenuta cancellazione**. Una retention dichiarata e non
applicata equivale, in sede di verifica, all'assenza di retention.

E una precisazione sul **diritto alla cancellazione** (art. 17 GDPR): **non è assoluto**. Il
paragrafo 3 lo esclude, fra l'altro, quando il trattamento è necessario per l'adempimento di
un obbligo legale o per finalità di sanità pubblica ai sensi dell'art. 9.2.h e i. **Il
documento sanitario firmato non è cancellabile su richiesta dell'interessato quando prevale
l'obbligo di conservazione.** La revoca di un consenso ha effetto sui trattamenti futuri; gli
effetti sui dati già raccolti seguono le regole di conservazione e non l'arbitrio
dell'operatore.

---

## 8. Oscuramento, e oscuramento dell'oscuramento

### 8.1 Cosa è

L'**oscuramento** è il diritto dell'assistito di rendere determinati documenti invisibili a
determinati soggetti nel fascicolo sanitario elettronico. È disciplinato dal **DM 7 settembre
2023, art. 9**, ed è esercitabile in tre momenti: al momento dell'erogazione, prima
dell'alimentazione, oppure successivamente.

Il decreto impone che sia «*garantito l'immediato oscuramento*» tramite funzionalità in linea,
e stabilisce una regola a cascata: **l'oscuramento della prescrizione determina l'oscuramento
automatico dei documenti di erogazione e dei referti correlati** (art. 9, c. 7).

### 8.2 La regola che rende l'implementazione difficile

**Art. 9, comma 6**: l'oscuramento avviene «*con modalità tali da garantire che tutti i
soggetti abilitati all'accesso **non possano venire automaticamente a conoscenza del fatto che
l'assistito ha effettuato tale scelta***».

Questo è l'**oscuramento dell'oscuramento**, ed è il requisito che distingue
un'implementazione corretta da una che sembra corretta. Un oscuramento inferibile non è un
oscuramento: se un professionista può dedurre che *qualcosa* è stato nascosto, sa che c'è
qualcosa da nascondere, e in un contesto clinico ristretto questo è spesso sufficiente a
sapere cosa.

Le vie di inferenza da chiudere, in pratica:

- **buchi nella numerazione** o negli identificatori progressivi visibili;
- **conteggi**: «12 documenti» quando ne sono visibili 11;
- **paginazione**: pagine di risultati con cardinalità irregolare;
- **notifiche**: un avviso di «nuovo documento disponibile» che poi non compare;
- **filtri e faccette**: un contatore per tipologia che non torna;
- **tempi di risposta** misurabilmente diversi fra ricerca con e senza documenti oscurati;
- **messaggi di errore** distinti fra «non esiste» e «non autorizzato».

L'ultima riga è il caso classico: il sistema deve rispondere allo stesso modo per un documento
inesistente e per un documento oscurato.

### 8.3 I dati a maggiore tutela dell'anonimato

Il **DM 7 settembre 2023, art. 6** individua una categoria rinforzata: sieropositività,
interruzione volontaria di gravidanza, violenza sessuale e pedofilia, uso di sostanze
stupefacenti, psicotrope e alcol, parto in anonimato, prestazioni dei consultori familiari.

Regole specifiche: sono visibili a terzi **solo previo consenso esplicito, informato e
specifico reso al soggetto erogante**; in assenza di consenso, «*l'erogatore della prestazione
è responsabile dell'eventuale mancato oscuramento del dato o documento*»; e in caso di
prestazioni erogate in anonimato **l'alimentazione del FSE non è ammessa affatto**.

**Effetto sul modello dati.** Ogni documento clinico porta un **livello di riservatezza**. I
documenti a riservatezza rafforzata sono esclusi per impostazione predefinita dalla
condivisione automatica e dalle notifiche, e richiedono un'azione esplicita per la
trasmissione. Non basta cifrare: serve un attributo di sensibilità che governi visibilità e
notifiche lungo tutto il percorso del dato.

---

## 9. DPIA, violazioni e obblighi di notifica

### 9.1 La valutazione d'impatto

La **valutazione d'impatto sulla protezione dei dati** (*Data Protection Impact Assessment*,
DPIA) è disciplinata dall'**art. 35 GDPR**: quando un trattamento «*può presentare un rischio
elevato per i diritti e le libertà delle persone fisiche*», il titolare effettua, **prima di
procedere al trattamento**, una valutazione dell'impatto.

Il paragrafo 3 elenca casi in cui è **richiesta in particolare**, e due riguardano
direttamente questo progetto:

- lettera **a)** - valutazione sistematica e globale di aspetti personali basata su un
  trattamento automatizzato, su cui si fondano decisioni che producono effetti giuridici o
  incidono significativamente;
- lettera **b)** - **trattamento su larga scala di categorie particolari di dati** di cui
  all'art. 9, paragrafo 1.

Una piattaforma di telemedicina multi-tenant ricade nella lettera b) senza margini di dubbio.
E il **DM 19 novembre 2025, Allegato 4, § 3**, rende la questione esplicita, richiamando i
considerando 84, 89, 90 e 91 del GDPR «*nella parte che invita allo svolgimento di una
valutazione d'impatto sulla protezione dei dati **prima dell'avvio del trattamento**»*, e
imponendo un «*processo ricorrente di analisi del rischio finalizzato anche alla **revisione
della DPIA***».

Il Garante italiano ha inoltre adottato l'elenco delle tipologie di trattamento soggette al
requisito di valutazione d'impatto ai sensi dell'art. 35, par. 4. `[NV]` sugli estremi e
sull'eventuale aggiornamento del provvedimento.

**Cosa significa per chi scrive codice.** La DPIA è un artefatto di progetto, non un documento
di runtime. Ma **alcune sue misure diventano requisiti** e vanno tracciate come tali: se la
DPIA individua come misura di mitigazione la cifratura a riposo con chiavi per tenant, quella
è una specifica implementativa vincolante, non una buona pratica opzionale. La tracciabilità
fra misure della DPIA e requisiti non funzionali va mantenuta.

### 9.2 Violazione dei dati personali

Il GDPR definisce la **violazione dei dati personali** (*data breach*, art. 4, n. 12) come
«*la violazione di sicurezza che comporta accidentalmente o in modo illecito la distruzione,
la perdita, la modifica, la divulgazione non autorizzata o l'accesso ai dati personali
trasmessi, conservati o comunque trattati*».

Va notato: **non è solo la fuga di dati**. Anche la perdita irreversibile e l'alterazione sono
violazioni. Un backup corrotto senza copia recuperabile è una violazione.

Gli obblighi:

- **art. 33** - notifica all'autorità di controllo **senza ingiustificato ritardo e, ove
  possibile, entro 72 ore** dal momento in cui il titolare ne è venuto a conoscenza, salvo che
  sia improbabile un rischio per i diritti e le libertà. Se la notifica supera le 72 ore, va
  motivato il ritardo. **Il responsabile informa il titolare senza ingiustificato ritardo**;
- **art. 34** - comunicazione **all'interessato** senza ingiustificato ritardo quando la
  violazione è suscettibile di presentare un **rischio elevato**;
- **art. 33, par. 5** - il titolare **documenta qualsiasi violazione**, comprese le circostanze,
  le conseguenze e i provvedimenti adottati, anche quando non la notifica. È il **registro
  delle violazioni**, ed è verificabile dall'autorità.

Il DM 19 novembre 2025, art. 15, aggiunge che in caso di incidente il titolare fornisce
«*tempestivamente*» ogni informazione utile per l'adempimento degli obblighi ex artt. 33-34.

### 9.3 Tre regimi di notifica con finestre diverse

Qui sta un errore ricorrente: assumere che «72 ore» sia la risposta a tutto. Nel contesto di
un erogatore sanitario italiano coesistono almeno tre regimi:

| Regime | Fonte | Prima segnalazione | Notifica | Relazione finale |
|---|---|---|---|---|
| **Protezione dei dati** | GDPR artt. 33-34 | - | **72 ore** al Garante | - |
| **NIS2** | D.lgs. 4 settembre 2024, n. 138 | Pre-notifica **24 ore** al CSIRT Italia | **72 ore** | **1 mese** |
| **L. 90/2024** (PA, incluse le ASL) | L. 28 giugno 2024, n. 90 | Segnalazione **24 ore** ad ACN | **72 ore** | - |
| **Perimetro di sicurezza nazionale cibernetica** | D.L. 105/2019 conv. L. 133/2019 | **Da 1 a 6 ore** per gli incidenti gravi | 72 ore | - |

Sull'ultima riga va detto con precisione ciò che la ricerca del progetto ha accertato: **la
sanità non figura tra i settori del perimetro di sicurezza nazionale cibernetica** secondo
l'elenco pubblicato dall'Agenzia per la cybersicurezza nazionale. La designazione dei soggetti
è però nominativa e **non pubblica**: non è escluso che un singolo ente sanitario vi sia
incluso. La presunzione operativa corretta è: **NIS2 e L. 90/2024 si applicano; il perimetro
è possibile ma va verificato caso per caso con il cliente**.

**Conseguenza di prodotto.** Il sistema deve consentire di rispettare **il più stringente
regime applicabile**, quindi va progettato per la finestra di **un'ora**: rilevazione,
ricostruzione della linea temporale degli eventi, esportazione forense in tempi compatibili.
E, corollario di igiene documentale: **non dichiarare mai che il prodotto «è conforme al
perimetro» o «vi rientra»**, perché lo status dipende dal cliente e non dal prodotto.

---

## 10. La regola assoluta: nessun dato reale

### 10.1 L'enunciato

**Nel repository, nelle issue, nelle pull request, nei log, negli screenshot, nei dataset di
test, negli ambienti di sviluppo e di collaudo, nella documentazione e negli esempi compaiono
esclusivamente dati sintetici.**

Non è una raccomandazione. È una regola del progetto, dichiarata nel modulo
[00](00-come-usare-questa-guida.md), ed è la sola regola di questa guida formulata in termini
assoluti.

### 10.2 Perché è assoluta

Perché ogni forma attenuata è stata provata e fallisce:

- «*è un solo paziente*» - un solo dato sanitario esposto è una violazione notificabile;
- «*ho tolto il nome*» - restano data di nascita, comune, data della prestazione, struttura,
  diagnosi. È pseudonimizzazione, non anonimizzazione (§ 4.2);
- «*è un ambiente di test*» - la copia del database di produzione in ambiente di collaudo è
  una delle modalità di violazione più frequenti in assoluto, perché il collaudo ha
  tipicamente controlli di accesso più deboli, meno registrazione e più persone con
  privilegi;
- «*l'ho incollato solo nella issue per far capire il bug*» - le issue di un repository
  pubblico sono indicizzate dai motori di ricerca e archiviate da terzi in modo permanente. La
  cancellazione non rimuove le copie;
- «*è uno screenshot, non un dato strutturato*» - è leggibile da una persona, che è
  esattamente il rischio;
- «*l'ho passato a un assistente per farmi aiutare a diagnosticare*» - il trasferimento di
  dati sanitari a un servizio terzo, spesso extra-UE, senza base giuridica e senza contratto
  ex art. 28, è una violazione compiuta, e ha per giunta conseguenze sul vincolo di sovranità
  del dato adottato dal progetto.

### 10.3 Dove si sbaglia più spesso

Elenco concreto dei punti in cui il dato reale entra nel repository senza che nessuno abbia
deciso di farlo entrare:

1. **Log applicativi** che serializzano l'oggetto intero anziché il suo identificatore. È
   sufficiente un `toString()` su un aggregato per riversare l'anagrafica in un file di testo.
2. **Messaggi di eccezione** che includono il corpo della richiesta.
3. **Tracce distribuite** con attributi che portano il codice fiscale.
4. **Dump di database** allegati a una issue per riprodurre un difetto.
5. **Registrazioni video** delle sessioni di collaudo con utenti reali.
6. **File di configurazione** con credenziali e riferimenti a un'installazione reale.
7. **Test di regressione** costruiti a partire da un caso reale «perché era quello che si
   ruppe».
8. **Screenshot** in una guida utente o in una presentazione.
9. **Messaggi di posta** e allegati inoltrati a una lista di sviluppo.
10. **Copie del database di produzione** in ambienti non di produzione.

### 10.4 Come si generano dati sintetici realistici

L'obiezione ricorrente è che i dati sintetici non sono realistici e quindi i test non
intercettano i difetti veri. È un'obiezione seria, e la risposta non è rinunciare alla regola
ma investire nel generatore. Un buon generatore per questo dominio ha queste proprietà.

**Deterministico.** A parità di seme produce lo stesso dataset. Serve a riprodurre i difetti e
a rendere i test stabili.

**Referenzialmente coerente.** Se un contatto riferisce un paziente, quel paziente esiste; se
un referto riferisce una prenotazione, la prenotazione esiste, la sua data precede quella del
referto, e il professionista firmatario ha il ruolo che gli consente di firmare. Le
incoerenze referenziali sono il modo più rapido per generare falsi positivi nei test.

**Clinicamente plausibile.** Le distribuzioni contano. Le età non sono uniformi, le
prestazioni non sono equiprobabili per fascia d'età, i valori di pressione arteriosa non sono
casuali fra 0 e 300, le serie di telemonitoraggio hanno autocorrelazione. Un generatore che
produca rumore bianco non fa emergere i difetti dei grafici, delle soglie e degli aggregati.

**Localizzato.** Nomi, cognomi, indirizzi e comuni devono essere italiani, con la
distribuzione di lunghezze e di caratteri accentati che il sistema incontrerà davvero. Un
dataset con nomi anglosassoni non fa emergere i problemi di collazione, di ordinamento e di
resa tipografica.

**Non attribuibile.** È il punto delicato. Un codice fiscale **sintatticamente valido** può
appartenere a una persona reale: l'algoritmo è deterministico e derivato da nome, cognome,
data e luogo di nascita. Generare codici fiscali «validi» a partire da nomi verosimili
significa, con probabilità non trascurabile, generare il codice fiscale di qualcuno.

Le tecniche per evitarlo, in ordine di robustezza:

- usare **codici di comune non assegnati** nella posizione del codice catastale, così che il
  codice sia formalmente ben strutturato ma non corrisponda ad alcun luogo reale;
- usare **date di nascita impossibili** per una persona vivente registrata (per esempio
  future), quando il sistema sotto test lo consente;
- usare l'intervallo di identificativi riservati alle **anagrafiche temporanee** (STP per
  stranieri temporaneamente presenti, ENI per europei non iscritti), che hanno formati propri
  e che il sistema deve comunque saper gestire - è anzi un'occasione per testare un caso
  reale spesso trascurato;
- marcare ogni record generato con un **attributo esplicito di sinteticità** persistito nel
  dato stesso, così che sia sempre possibile verificare, con una singola interrogazione, che
  un ambiente non contenga dati reali.

**Verificabile in integrazione continua.** Un controllo automatico in *pipeline* che rifiuti
il commit quando rileva pattern sospetti - sequenze conformi al formato del codice fiscale,
numeri di ricetta elettronica, indirizzi di posta elettronica di domini reali, coordinate
geografiche precise - chiude il canale prima che il dato entri nella storia del repository.
Una volta entrato in un commit, il dato è di fatto permanente: la riscrittura della storia di
un repository pubblico non ne elimina le copie già distribuite.

**Documentato.** Il generatore fa parte del progetto ed è descritto nel modulo
[17 - L'ambiente di sviluppo](17-ambiente-di-sviluppo.md), insieme alle istruzioni per
popolare un ambiente completo.

### 10.5 E se un dato reale entra comunque

Procedura, in ordine:

1. **fermarsi.** Non aprire una pull request «di pulizia» che descriva il problema in chiaro:
   moltiplicherebbe l'esposizione;
2. **segnalare per canale riservato** al manutentore, secondo la politica di sicurezza del
   progetto;
3. **valutare se si tratta di una violazione notificabile** ai sensi dell'art. 33 GDPR: se il
   dato proviene da un'installazione reale, quasi certamente lo è, e il titolare è la struttura
   che lo ha esposto, non il progetto;
4. **rimuovere il contenuto** e, se è entrato nella storia del repository, valutare la
   riscrittura con la consapevolezza che non elimina le copie già distribuite;
5. **ruotare ogni credenziale** eventualmente esposta;
6. **documentare l'accaduto** nel registro delle violazioni del titolare e **correggere la
   causa**, non solo il sintomo: quasi sempre la causa è un controllo automatico assente.

---

## Cosa devi ricordare

1. **Il dato relativo alla salute è una categoria a divieto di principio.** Servono due
   condizioni cumulative: una deroga dell'art. 9.2 **e** una base giuridica dell'art. 6.
2. **Quasi tutto, in questo dominio, è dato sanitario per inferenza**: l'appuntamento, la
   branca, l'esenzione, l'indirizzo di consegna di un dispositivo. Non esiste uno schema
   «amministrativo» a tutele attenuate.
3. **Base giuridica e consenso informato all'atto sanitario sono istituti diversi.** Per la
   cura il consenso non è la base giuridica: chiederlo dove non serve è un difetto, non una
   cautela.
4. **Il consenso non è un booleano**: sono almeno quattro oggetti distinti, ciascuno riferito
   alla versione esatta del testo presentato.
5. **Il dato pseudonimizzato resta un dato personale.** Quasi nessun dato clinico è davvero
   anonimo: quasi-identificatori, rarità clinica, longitudinalità e reidentificazione per
   differenza.
6. **Cartella clinica, dossier, archivio dell'erogatore e FSE sono quattro contenitori
   diversi** con regole di accesso e conservazione diverse. Confonderli produce autorizzazioni
   sbagliate.
7. **Una bozza non firmata non è un referto**, e una correzione non è una sovrascrittura.
8. **L'oscuramento deve nascondere sé stesso.** Buchi nella numerazione, conteggi, notifiche e
   messaggi di errore differenziati lo rendono inferibile, e un oscuramento inferibile non è
   un oscuramento.
9. **La DPIA è obbligatoria qui**, e alcune sue misure diventano requisiti implementativi
   tracciabili.
10. **Progetta la notifica di violazione per la finestra di un'ora**, la più stringente fra
    quelle applicabili, e non dichiarare mai una conformità che dipende dal cliente.
11. **Nessun dato reale, mai, da nessuna parte.** L'investimento va nel generatore di dati
    sintetici, non nelle eccezioni alla regola.

---

## Termini introdotti in questo modulo

| Termine | Definizione breve |
|---|---|
| **Amministratore di sistema** | Chi ha privilegi tecnici elevati su sistemi che trattano dati personali; soggetto a designazione individuale, tracciamento e verifica periodica |
| **Anonimizzazione** | Trattamento che rende l'interessato non più identificabile con mezzi ragionevolmente disponibili; fa uscire il dato dal perimetro del GDPR |
| **Archivio dell'erogatore** | Ciò che una struttura conserva per obblighi propri (fiscali, contabili, documentali), distinto dal dossier e dal FSE |
| **Base giuridica** | Fondamento di liceità del trattamento; attributo del trattamento (finalità × categoria × soggetto), non del paziente né del documento |
| **CAdES / PAdES / XAdES** | Formati normalizzati di firma elettronica, rispettivamente per file generici, PDF e XML |
| **Cartella clinica** | Documentazione formata durante un episodio di ricovero presso una struttura |
| **Categorie particolari di dati** | Le categorie dell'art. 9.1 GDPR, fra cui i dati relativi alla salute; trattamento vietato salvo deroghe tassative |
| **Consenso informato all'atto sanitario** | Manifestazione di volontà del paziente riguardo all'esecuzione di un trattamento sanitario (L. 219/2017) |
| **Conservazione a norma** | Processo che garantisce nel tempo autenticità, integrità, leggibilità e reperibilità del documento informatico; distinta dal backup |
| **Contitolarità** | Determinazione congiunta di finalità e mezzi da parte di più titolari, con accordo trasparente ex art. 26 GDPR |
| **Dati a maggiore tutela dell'anonimato** | Categoria rinforzata del FSE (sieropositività, IVG, violenza sessuale, sostanze, parto in anonimato, consultori) con consenso esplicito per la visibilità a terzi |
| **Dato relativo alla salute** | Dato personale che rivela informazioni sullo stato di salute passato, presente o futuro, indipendentemente dalla fonte |
| **Diario clinico** | Annotazioni cronologiche del decorso; non è il referto e non si consegna automaticamente al paziente |
| **Dossier sanitario** | Insieme dei dati del paziente presso una singola struttura, per la continuità di cura interna |
| **DPIA** | Valutazione d'impatto sulla protezione dei dati, obbligatoria prima del trattamento quando il rischio è elevato (art. 35 GDPR) |
| **eIDAS** | Regolamento (UE) 910/2014 su identificazione elettronica e servizi fiduciari, come modificato dal Reg. (UE) 2024/1183 |
| **FEA / FEQ / FES** | Firma elettronica avanzata, qualificata, semplice: tre livelli con effetti giuridici diversi; solo la FEQ equivale all'autografa |
| **Lettera di dimissione ospedaliera** | Documento conclusivo del ricovero indirizzato al medico curante; da non confondere con la SDO |
| **Marca temporale** | Attestazione opponibile, rilasciata da un prestatore fiduciario, che un documento esisteva in quella forma a quell'istante |
| **Oscuramento** | Diritto dell'assistito di rendere invisibili determinati documenti del FSE a determinati soggetti |
| **Oscuramento dell'oscuramento** | Requisito per cui l'esistenza stessa del documento oscurato non deve essere inferibile |
| **Pseudonimizzazione** | Trattamento che impedisce l'attribuzione a un interessato senza informazioni aggiuntive conservate separatamente; il dato resta personale |
| **Referto** | Documento sanitario firmato con esito e conclusioni di un atto, destinato al paziente e al richiedente |
| **Registro delle violazioni** | Documentazione obbligatoria di ogni violazione, anche non notificata (art. 33, par. 5 GDPR) |
| **Relazione clinica** | Comunicazione discorsiva fra professionisti su un caso; non certifica un esame e non è necessariamente destinata al paziente |
| **Responsabile del trattamento** | Chi tratta per conto del titolare sulla base di un atto ex art. 28 GDPR |
| **RPD / DPO** | Responsabile della protezione dei dati: sorveglianza e punto di contatto; obbligatorio per trattamenti su larga scala di categorie particolari |
| **Titolare del trattamento** | Chi determina finalità e mezzi del trattamento e ne risponde |
| **Validazione clinica** | Atto con cui il professionista dichiara definitivo il contenuto e se ne assume la responsabilità; distinto dalla firma |
| **Verbale di pronto soccorso** | Documento che attesta l'accesso al pronto soccorso, il triage, gli accertamenti, la diagnosi e l'esito |
| **Violazione dei dati personali** | Distruzione, perdita, modifica, divulgazione o accesso non autorizzati; non solo la fuga di dati |
