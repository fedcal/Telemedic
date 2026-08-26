---
title: Le quattro prestazioni
sidebar_position: 3
description: "Televisita, teleconsulto, teleassistenza, telemonitoraggio: che cosa sono secondo le fonti italiane, in che cosa differiscono davvero, quali obblighi distinti portano e quali nozioni di confine vengono abitualmente confuse con esse."
---

# Le quattro prestazioni

Questo capitolo serve a una cosa sola: far capire **perché le prestazioni di telemedicina non
sono varianti della stessa cosa**, e quali conseguenze concrete discendono dalle loro differenze.

Non è la trattazione completa. Le definizioni verbatim, la catena normativa e le schede per
prestazione sono nel modulo
[`docs/10_fondamenti/02-prestazioni-di-telemedicina.md`](../10_fondamenti/02-prestazioni-di-telemedicina.md);
le macchine a stati, gli attori ammessi, gli esiti tipizzati e le invarianti di modellazione sono
in [`docs/05_domain/02-le-prestazioni-modellate.md`](../05_domain/02-le-prestazioni-modellate.md).
Qui si spiega **che cosa cambia da una all'altra e perché conta**.

## 1. Il primo fatto: la telemedicina è un canale, non una specialità

La telemedicina è una **modalità di erogazione** di prestazioni sanitarie a distanza. Non è una
disciplina clinica, non è un reparto, non è un tipo di prestazione: è il canale attraverso cui si
eroga una prestazione che, nella grande maggioranza dei casi, esiste già anche in presenza.

L'Accordo Stato-Regioni del 17 dicembre 2020, rep. atti n. 215/CSR, Allegato A, lo enuncia
testualmente:

> «per tutte le prestazioni sanitarie erogate a distanza si applica il quadro normativo
> nazionale/regionale che regolamenta l'accesso ai diversi Livelli essenziali di Assistenza, il
> sistema di remunerazione/tariffazione vigente per l'erogazione delle medesime prestazioni in
> modalità "tradizionale", ivi incluse le norme per l'eventuale compartecipazione alla spesa.»

Tradotto: **non esiste un regime giuridico speciale della telemedicina**. Esiste il regime della
prestazione, che si applica anche a distanza, con l'aggiunta di alcuni obblighi specifici. È la
ragione per cui il catalogo delle prestazioni del progetto porta **due codifiche native** - il
codice del catalogo del tenant e il codice nazionale - e la modalità a distanza è un **modificatore
di canale**, non una prestazione diversa.

## 2. Il secondo fatto: due tassonomie che non coincidono

È lo scoglio che un modello dati deve superare per primo, e che quasi nessuno rappresenta.

L'**Accordo 215/CSR 2020** elenca **cinque attività ambulatoriali** - televisita, teleconsulto,
teleconsulenza, teleassistenza, telerefertazione - più **telecontrollo** e **telemonitoraggio**
come «modalità operative».

Il **DM 21 settembre 2022**, Allegato A, individua invece **quattro «servizi minimi»** che
l'infrastruttura regionale deve erogare: «televisita; teleconsulto/teleconsulenza;
telemonitoraggio; teleassistenza».

| Accordo 215/CSR 2020 | DM 21 settembre 2022 | Che cosa cambia |
|---|---|---|
| Televisita | Televisita | Coincidono |
| Teleconsulto | Teleconsulto/teleconsulenza | **Unificati** in un solo servizio minimo |
| Teleconsulenza | Teleconsulto/teleconsulenza | **Unificati** in un solo servizio minimo |
| Teleassistenza | Teleassistenza | Coincidono |
| Telerefertazione | *(assente)* | **Scompare come servizio autonomo**: diventa il micro-servizio trasversale «refertazione e firma digitale» |
| Telemonitoraggio (modalità operativa) | Telemonitoraggio | **Promosso a servizio minimo** |
| Telecontrollo (modalità operativa) | *(non elencato fra i minimi)* | Resta modalità operativa, ma è **prestazione tariffata** |

**Non è possibile sceglierne una.** La prima tassonomia determina la legittimità dell'atto e la
refertazione; la seconda determina l'ammissibilità in gara e la struttura dei micro-servizi. Il
catalogo delle prestazioni del progetto porta quindi **due attributi tassonomici, non uno**, e
nessuno dei due è derivabile dall'altro.

Da qui discende la conseguenza operativa più facile da sbagliare, e la si enuncia in forma di
regola perché è codificata come vincolo di dominio non configurabile dal cliente:

> **Il vincolo professionale si applica all'attività, non al servizio minimo.**

Teleconsulto e teleconsulenza stanno nello stesso servizio minimo e hanno **attori ammessi
diversi**: il teleconsulto è fra medici, la teleconsulenza è ammessa anche fra professioni
sanitarie non mediche. Autorizzare sul servizio minimo significa autorizzare troppo.

## 3. Quadro sinottico

Le colonne di questa tabella sono le dimensioni che cambiano davvero da una prestazione all'altra.
Ogni riga in cui due prestazioni divergono è una riga che, se collassata, produce un difetto.

| | **Televisita** | **Teleconsulto** | **Teleconsulenza** | **Teleassistenza** | **Telemonitoraggio** |
|---|---|---|---|---|---|
| **Atto riservato a** | medico | due o più medici | professioni sanitarie con responsabilità differenti | professione sanitaria non medica | rilevazione; la valutazione è del professionista |
| **Assistito presente** | sempre | facoltativo | facoltativo | sempre (o caregiver) | non applicabile |
| **Asincronia** | no | **sì** | sì, differita, ma sempre programmata | no | per costruzione |
| **Contenitore** | contatto singolo | contatto singolo o scambio asincrono | contatto singolo | **ciclo pluri-sessione** | **piano con orizzonte** |
| **Sessione media** | obbligatoria | facoltativa | obbligatoria se sincrona | obbligatoria | assente |
| **Produce** | referto, con eccezioni di setting | **nessun referto autonomo**; relazione collaborativa allegata | documentazione dell'atto richiedente | relazione clinico-assistenziale **conclusiva** | tesserino, piano, report, relazione finale |
| **Tariffata** | sì, con il codice della prestazione erogata | **no** | **no** | secondo il regime della professione | **non da sola** |
| **Ammessa in urgenza** | **no** | sì | sì, ma **mai in surroga del soccorso** | - | - |

Fonti: Accordo Stato-Regioni 17 dicembre 2020, rep. atti n. 215/CSR, All. A; DM 21 settembre 2022,
All. A; DM 30 settembre 2022, All. B; DM 19 novembre 2025, art. 7 e All. 1.

## 4. Televisita

### 4.1 Che cos'è

> «È un atto medico in cui il professionista interagisce a distanza in tempo reale con il
> paziente, anche con il supporto di un *care-giver*.» (Accordo 215/CSR 2020, All. A)

La stessa fonte aggiunge due limiti che non sono di contorno: la televisita non può essere il
mezzo per condurre la relazione medico-paziente **esclusivamente** a distanza, né può essere
considerata in modo automatico sostitutiva della prima visita in presenza.

### 4.2 Che cosa la distingue davvero

**È l'unica prestazione in cui l'atto è riservato al medico e l'assistito deve essere presente in
tempo reale.** Da questa doppia condizione discende tutto il resto: esiste un atto di
identificazione dell'assistito, che è atto del professionista e non esito di un algoritmo; la
sessione media è obbligatoria; ed esiste una sala d'attesa con **ammissione sempre esplicita**,
perché l'ingresso automatico in una stanza dove si sta già svolgendo un altro atto è una
violazione di riservatezza.

È inoltre l'unica prestazione con **condizioni di erogabilità** stabilite dalla fonte: prestazioni
che non richiedono la completezza dell'esame obiettivo, e presenza di almeno una fra cinque
condizioni cliniche indicate dall'Accordo 215/CSR 2020. Il sistema **non decide
l'appropriatezza**: la registra.

### 4.3 Gli obblighi distinti che porta

**Il referto obbligatorio - ma condizionato al setting.** «La televisita erogata nell'ambito
dell'attività specialistica ambulatoriale deve sempre concludersi con un referto» (Accordo
215/CSR 2020, All. A). Il DM 30 settembre 2022, All. B, correttivamente stabilisce però che la
televisita programmata ed erogata direttamente da medico di medicina generale o pediatra di libera
scelta **non richiede prescrizione** e prevede **annotazione digitale in luogo del referto**.
Cablare l'obbligo di referto come incondizionato è un errore che si manifesta al primo cliente che
sia una medicina di gruppo (vincolo `V-145`).

**Contenuti obbligatori propri del referto.** L'Accordo 215/CSR 2020 impone che il referto della
televisita riporti gli eventuali **collaboratori partecipanti** - caregiver, altro medico - e la
**qualità del collegamento con conferma dell'idoneità all'esecuzione della prestazione**. Il
tracciato ministeriale del referto di televisita (DM 19 novembre 2025, All. 1, § 2.20) **non
prevede un campo dedicato** a quest'ultima: il progetto ne propone la collocazione fra i
«parametri descrittivi della procedura», con il vincolo che **il valore è misurato dal sistema e
confermato dal professionista**, mai generato autonomamente e inserito nel documento. La verifica
di conformità di questa scelta è una questione ancora aperta (`Q-131`).

**Tipologia documentale propria.** Il referto di televisita ha una tipologia documentale FSE
dedicata (DM 19 novembre 2025, art. 7, lett. p, e All. 1 § 2.20). L'ipotesi «referto di
specialistica ambulatoriale» è **errata** e non va usata in alcun documento, esempio, profilo o
materiale pubblico (vincolo `V-143`).

**Esclusione dall'urgenza.** Il DM 30 settembre 2022, All. B, esclude la televisita dai contesti
di urgenza-emergenza, perché «non deve costituire ragione per ritardare interventi in presenza».

**Obbligo di completamento in presenza.** «Qualora lo strumento di Telemedicina non permetta di
mantenere inalterato il contenuto sostanziale della prestazione da erogare, le Aziende e gli
erogatori privati sono tenuti a completare la prestazione in modalità tradizionale senza ulteriori
oneri a carico del SSN e/o utente» (Accordo 215/CSR 2020, All. A). Sul piano del modello questo
significa che gli esiti di fallimento tecnico, di qualità inidonea e di rinvio **generano un fatto
successivo** - una nuova richiesta collegata alla precedente - e non si limitano a chiudere il
contatto. La riprogrammazione in presenza è parte della macchina a stati, non gestione dell'errore.

### 4.4 La differenza che nessuno vede finché non produce danni

Lo **stato** dice dove si trova il contatto; l'**esito** dice che cosa è successo. Sono attributi
distinti, e il secondo determina gli effetti amministrativi.

Due esiti condividono lo stesso stato terminale - l'assistito non è stato visitato - e hanno
effetti economici **opposti**: la mancata presentazione, rilevabile per assenza di qualunque
tentativo di connessione, e il fallimento tecnico attribuibile all'assistito, rilevabile per
telemetria, che **non è** mancata presentazione e comporta riprogrammazione senza addebito.
Addebitare una mancata presentazione a chi ha tentato e non è riuscito a collegarsi è un difetto
di dominio, non un caso limite (vincolo `V-141`).

## 5. Teleconsulto e teleconsulenza

### 5.1 Che cosa sono

Il **teleconsulto** è «un atto medico in cui il professionista interagisce a distanza con uno o
più medici per dialogare […] riguardo la situazione clinica di un paziente, basandosi
primariamente sulla condivisione di tutti i dati clinici, i referti, le immagini, gli audio-video
riguardanti il caso specifico. […] **può svolgersi anche in modalità asincrona**, quando la
situazione del paziente lo permette in sicurezza. **Quando il paziente è presente al teleconsulto,
allora esso si svolge in tempo reale […] e si configura come una visita multidisciplinare.**»

La **teleconsulenza medico-sanitaria** è «un'attività sanitaria, **non necessariamente medica ma
comunque specifica delle professioni sanitarie**, che si svolge a distanza ed è eseguita da due o
più persone che hanno **differenti responsabilità** rispetto al caso specifico. […] È un'attività
su richiesta ma **sempre programmata** e **non può essere utilizzata per surrogare le attività di
soccorso**.» (entrambe: Accordo 215/CSR 2020, All. A)

### 5.2 Le quattro differenze fra le due

Sono sottili e vanno tenute a mente, perché un decreto le unifica mentre l'accordo le distingue:

1. **gli attori** - nel teleconsulto sono medici; nella teleconsulenza sono esercenti le
   professioni sanitarie con responsabilità differenti sul caso;
2. **l'elemento preminente** - nel teleconsulto è la condivisione documentale; nella
   teleconsulenza è la videochiamata, con la condivisione garantita all'occorrenza;
3. **la programmazione** - il teleconsulto può essere estemporaneo, la teleconsulenza è sempre
   programmata;
4. **il divieto espresso** - solo la teleconsulenza porta il divieto di surrogare il soccorso.

I due divieti in materia di urgenza **non coincidono e non si sovrappongono**: il teleconsulto e
la teleconsulenza sono eseguibili anche in urgenza secondo la stessa fonte che esclude la
televisita, ma la teleconsulenza non può sostituire il soccorso. Un unico attributo booleano «uso
in urgenza» non riesce a rappresentare entrambe le regole, e per questo nel modello sono due
attributi distinti del tipo di prestazione.

### 5.3 Che cosa li distingue davvero da una televisita

**L'asse della relazione non è medico-assistito ma professionista-professionista.** Ne discende
che l'assistito può non essere presente, che l'asincronia è ammessa, e che il consulente **non
riceve accesso al dossier dell'assistito**: riceve accesso soltanto al materiale che il richiedente
ha selezionato, per il tempo necessario alla risposta.

Quel materiale è modellato come **aggregato con ciclo di vita proprio**: nasce con la richiesta,
contiene un elenco chiuso di riferimenti documentali, ha una scadenza obbligatoria e decade in tre
modi - risposta firmata, rifiuto, scadenza. La revoca è un fatto registrato, non l'assenza di un
rinnovo. Ha una conseguenza spesso trascurata: a distanza di anni, la domanda «su che cosa si è
espresso il consulente» ha una risposta solo se l'insieme è stato registrato come tale, e non
ricostruito dal registro degli accessi.

Nella forma sincrona con assistito presente compaiono quattro problemi che la televisita non ha:
chi è l'erogante, chi documenta, chi conduce la sessione, e se l'assistito sa chi c'è. Il modello
li risolve con un unico contatto a più partecipanti, un ruolo esplicito di conduttore, documenti
con autori distinti che il sistema **non fonde**, e una lista dei presenti visibile per l'intera
durata **senza possibilità di occultamento**. La stanza laterale fra professionisti - colloquio
riservato che esclude temporaneamente l'assistito - è rappresentata come **periodo dichiarato**
con inizio, fine e annuncio: non esiste modalità silenziosa.

### 5.4 Gli obblighi distinti

**Nessun referto autonomo, ma un documento autonomo.** «Il teleconsulto contribuisce alla
definizione del referto che viene redatto al termine della visita erogata al paziente, ma non dà
luogo ad un referto a sé stante» (Accordo 215/CSR 2020, All. A). Per anni questo passaggio è stato
letto come «il teleconsulto non produce nulla»: **è una lettura errata**. Il DM 19 novembre 2025
crea una tipologia documentale FSE autonoma - la relazione collaborativa per il
teleconsulto/teleconsulenza, lett. q) - con una regola strutturale esplicita (All. 1, § 2.21): «La
relazione collaborativa viene conferita al FSE come allegato del documento di referto relativo
alla prestazione o all'evento principale […] redatto dal medico richiedente la consulenza».

Nel modello sono quindi due cose distinte: il divieto riguarda la generazione di un referto
specialistico; l'obbligo riguarda la produzione della relazione e la sua correlazione con il
documento principale. Trattarla come sezione del referto del richiedente cancella l'autore;
trattarla come documento indipendente viola la regola di conferimento.

**Non è remunerato.** Il teleconsulto non ha voce a nomenclatore, non prevede prescrizione a
carico del servizio sanitario né compartecipazione alla spesa, e rientra nell'attività lavorativa
ordinaria del professionista. Genera però attività registrabile ai fini del carico di lavoro, che
è un'altra cosa e va tenuta separata.

**La modalità di esecuzione è a tre assi, non un enumerativo.** Il tracciato ministeriale (DM 19
novembre 2025, All. 1, § 2.21) impone di indicare **estemporaneo o programmato** × **sincrono o
asincrono** × **con o senza presenza dell'assistito**. Sono tre assi binari indipendenti.

## 6. Teleassistenza

### 6.1 Che cos'è

> «(infermiere/fisioterapista/logopedista/ecc): è **un atto professionale di pertinenza della
> relativa professione sanitaria** e si basa sull'interazione a distanza tra il professionista e
> paziente/*caregiver* per mezzo di una videochiamata […]. La teleassistenza è **prevalentemente
> programmata e ripetibile** in base a specifici programmi di accompagnamento del paziente.»
> (Accordo 215/CSR 2020, All. A)

### 6.2 Che cosa la distingue davvero

**Non è un contatto: è un programma.** Modellarla come contatto singolo perde l'unità di senso. Il
contenitore è un episodio con programma; i singoli incontri sono contatti collegati all'episodio;
l'aderenza è una proprietà dell'episodio, non dei singoli contatti. Lo stesso vale per la
teleriabilitazione, che l'Accordo Stato-Regioni 18 novembre 2021, rep. atti n. 231/CSR, inquadra
nel **Progetto riabilitativo individuale**: non esistono sedute isolate.

**Non è un atto medico** e non produce referto specialistico. Ha finalità assistenziale, non
diagnostica.

### 6.3 L'obbligo che sorprende chi progetta i confini interni

Il DM 21 settembre 2022, All. A, impone una cosa che a prima vista non ha senso:

> «È infatti necessario che il servizio di Teleassistenza sia in grado di rendere disponibile
> anche **tutte le funzionalità presenti per la televisita e per il telemonitoraggio**.»

Sul piano software la teleassistenza è quindi **un servizio ibrido che riusa le capacità degli
altri due**: non è un modulo autonomo, è una composizione. Chi disegna i confini fra contesti
delimitati deve tenerne conto, perché una separazione troppo rigida fra televisita e
telemonitoraggio rende la teleassistenza impossibile da comporre.

### 6.4 Che cosa produce

La tipologia documentale FSE è la relazione clinico-assistenziale conclusiva per la
teleassistenza/teleriabilitazione (lett. r). **È conclusiva**: si emette a chiusura del programma,
non a chiusura della singola seduta. Le singole sedute producono annotazioni nel diario, che non
sono documenti sanitari destinati al fascicolo.

## 7. Telemonitoraggio

### 7.1 Che cos'è

È la prestazione strutturalmente più diversa dalle altre, e la ragione è semplice: **non ha un
contatto**. Non c'è un momento in cui due persone si incontrano. C'è un piano che dura, misure che
arrivano, allarmi che si generano, revisioni che avvengono.

### 7.2 La regola di afferenza, che è la frase più utile del dominio

> «il telemonitoraggio **non afferisce all'ambito di specialistica ambulatoriale, a meno che non
> sia affiancato dal telecontrollo medico, da una televisita o anche da una visita in presenza**
> in cui i dati registrati in continuo vengono analizzati, discussi e comunicati al paziente. I
> risultati del telemonitoraggio devono essere indicati nel referto della visita di controllo
> periodica.» (Accordo 215/CSR 2020, All. A)

Detto altrimenti: **raccogliere dati non è una prestazione. Diventa prestazione quando un medico
li guarda dentro un atto clinico.** Conseguenza diretta sul modello: esiste un collegamento fra il
piano di telemonitoraggio e il contatto di revisione, e il piano da solo non genera evento
rendicontabile.

### 7.3 Il perimetro del progetto, e perché è scritto così

Il perimetro è **ingestione di misure da un gateway di terze parti**, più **inserimento manuale
da parte dell'assistito o del caregiver**, più **questionari strutturati**. Il progetto **non
dialoga direttamente con i dispositivi medici** e non assume responsabilità sull'accuratezza della
catena di misura hardware (`D21`, `OUT-10`, `OUT-11`).

La formulazione della destinazione d'uso è **congelata per decisione del committente** (`D55`) su
«**raccolta differita di parametri per la revisione periodica del professionista**», e non su
«monitoraggio in tempo reale dei parametri vitali». La differenza vale una classe di rischio, una
classe di sicurezza del software, mesi e un ordine di grandezza di costo (`D46`). Nel modello **non
esiste** alcun concetto di «sorveglianza continua», «allarme in tempo reale» o «monitoraggio attivo
del paziente»: esistono un piano di rilevazione, misure differite, una valutazione rispetto a
soglie configurate dal professionista e una **coda di revisione clinica** (vincolo `V-144`).

Dal congelamento discende un **divieto permanente**, che vale come criterio di ammissibilità di
ogni proposta futura: **nessuna funzione può essere aggiunta se sposta il sistema verso il tempo
reale clinico**, e la valutazione va fatta prima di scrivere la funzione, non dopo.

### 7.4 Perché è il telemonitoraggio a determinare la qualificazione dell'intero prodotto

Il DM 21 settembre 2022 è esplicito nel richiedere che «la Infrastruttura regionale di
telemedicina per il servizio minimo di telemonitoraggio debba essere certificata come dispositivo
medico», e aggiunge che per il telemonitoraggio avanzato «potrebbe essere richiesta una classe di
rischio superiore alla IIa».

L'elemento che fonda la qualificazione è la **valutazione automatica delle soglie**: nel momento in
cui il sistema confronta una misura con una soglia e genera un'allerta, sta *interpretando* un dato
clinico. Il progetto lo accetta, lo dichiara e ne trae il perimetro: la soglia e la regola di
allerta sono **configurate dal professionista, mai dedotte dal sistema** (vincolo `V-02`), il campo
della soglia **parte vuoto e obbligatorio** senza alcuna precompilazione (vincolo `V-123`), e il
calcolo è tracciabile a posteriori con versione del piano, versione della regola, valori in
ingresso ed esito.

### 7.5 Le tre entità che non vanno fuse

Il telemonitoraggio richiede tre cicli di vita distinti che coesistono:

**Il piano.** Ha parametri operativi imposti dal tracciato ministeriale (DM 19 novembre 2025,
All. 1, § 2.24): tipologia, numero di cicli, durata del ciclo, numero di attività per ciclo,
frequenza, fascia oraria, durata prevista **con massimo di un anno**, tipo di rilevazione, soglia
di allarme e regole di comportamento in violazione delle soglie. Il piano è **versionato, e la
versione è parte dell'identità della misura**: una misura acquisita sotto una versione del piano
non va confrontata con le soglie di una versione successiva, altrimenti ogni modifica riscrive
retroattivamente il significato dello storico.

**La misura.** È immutabile e porta con sé il proprio contesto: strumento, metodo, **istante di
rilevazione e istante di ricezione come due campi distinti obbligatori**, soggetto che l'ha
inserita, unità esplicita mai presunta. Le regole operano sull'istante di misura, non su quello di
ricezione (vincolo `V-124`).

**L'assenza di misura.** È un'entità, non l'assenza di una riga: è una riga che dichiara l'assenza,
con la finestra attesa, l'istante di scadenza e la causa quando è nota (vincolo `V-148`). È la
forma operativa di `V-09` e la condizione perché l'aderenza sia una grandezza definita. Senza di
essa, il peggioramento clinico che impedisce la misura resta invisibile.

A queste si aggiunge l'**allarme**, che è una sequenza di eventi immutabili con lo stato corrente
come proiezione (vincolo `V-121`), e che ha tre proprietà che sono decisioni e non dettagli:
«recapitato» non è «preso in carico»; il mancato riscontro è uno stato da registrare e misurare,
non un'assenza; **l'escalation può fallire, e il fallimento è dichiarato** - un'escalation che si
esaurisce senza destinatario non deve terminare in silenzio.

### 7.6 La copertura oraria è un requisito di sicurezza, non un parametro commerciale

È la conseguenza meno intuitiva e la più importante. **Un servizio mal dichiarato è più pericoloso
dell'assenza di servizio, perché produce falsa rassicurazione.**

Nel modello la copertura oraria è un dato di runtime versionato, per cliente e per percorso; è
**condizione di attivabilità del piano** - un piano senza copertura dichiarata non si attiva, e
nessuna configurazione supera il controllo; è visibile in modo persistente all'assistito e al
caregiver **con lo stato corrente**, non con l'orario teorico, e non è occultabile per
personalizzazione; **condiziona la validità del destinatario nella catena di escalation** - un
destinatario fuori copertura non è un destinatario valido (vincolo `V-122`); e la sua riduzione su
un servizio attivo è un evento di sicurezza con motivazione, elenco dei piani coinvolti e notifica
agli arruolati.

### 7.7 Che cosa produce

Il DM 19 novembre 2025, art. 7, gli assegna **quattro tipologie documentali distinte** fra le
dieci: il tesserino dispositivi (lett. s), il piano (lett. t), i report delle rilevazioni
(lett. u e v) e la relazione finale (lett. w).

Il **tesserino dispositivi** merita attenzione perché è l'unico punto in cui il modello incontra
l'identificazione univoca del dispositivo: richiede UDI in formato di identificazione automatica e
UDI-DI leggibile, numero di serie o lotto, nome, indirizzo e sito del fabbricante, tipo di
collegamento e di alimentazione, esito del controllo tecnico e parametri di connettività,
configurazione e taratura (All. 1, § 2.23). È **firmato dal professionista che assegna il
dispositivo**: nel modello è quindi un atto, non una scheda anagrafica.

## 8. Le nozioni di confine

Sono la fonte più comune di equivoci, sia in una trattativa sia in una specifica. Il modello deve
saperle rappresentare **anche quando sono fuori dal proprio perimetro**, perché esistono e i
professionisti le usano.

### 8.1 Telecontrollo medico

> «modalità operativa della telemedicina che consente il controllo a distanza del paziente. Tale
> attività è caratterizzata da una serie cadenzata di contatti con il medico […] per mezzo della
> videochiamata in associazione con la condivisione di dati clinici raccolti presso il paziente»
> (Accordo 215/CSR 2020, All. A)

**È la nozione più confusa con il telemonitoraggio, e ne differisce sul punto che conta di più:
il telecontrollo è prestazione medica a nomenclatore, rendicontata nei flussi della specialistica
ambulatoriale, e quindi remunerato.** Il telemonitoraggio puro non lo è.

Nel modello il telecontrollo **non è una quinta macchina a stati**: è una televisita con
collegamento obbligatorio a un piano di rilevazione, con la precondizione che esista un piano
attivo e con l'obbligo di riportarne i risultati nel documento.

### 8.2 Telerefertazione

È «una relazione rilasciata dal medico che ha sottoposto un paziente a un esame clinico o
strumentale il cui contenuto è quello tipico delle refertazioni eseguite in presenza e che viene
scritta e trasmessa per mezzo di sistemi digitali e di telecomunicazione».

Due precisazioni contro altrettanti equivoci. Primo: **la telerefertazione non è l'invio del
referto per posta elettronica**. È l'atto di refertare a distanza, non il canale di consegna.
Secondo: **non è una prestazione a sé** e non è tariffata autonomamente - «il referto rappresenta
l'attività di completamento della prestazione specialistica».

Nel DM 21 settembre 2022 non compare fra i servizi minimi: diventa il micro-servizio trasversale
«refertazione e firma digitale», su cui il decreto pone un divieto con impatto architetturale
diretto - «non si deve realizzare un modulo *ad hoc* […] ma si deve prevedere l'integrazione con
il modulo regionale, se già presente». Da qui la postura del progetto: moduli propri di
refertazione, agenda e fatturazione esistono, ma sono **disattivabili e sostituibili per
configurazione**. Dove esiste un modulo regionale o dell'integratore, il sistema si integra invece
di duplicare (`D14`).

### 8.3 Teleriabilitazione

Disciplinata autonomamente dall'Accordo Stato-Regioni 18 novembre 2021, rep. atti n. 231/CSR. Le
prestazioni vanno inquadrate nel Progetto riabilitativo individuale; la tariffazione è equivalente
a quella in presenza; le strutture che intendono erogarla a carico del servizio sanitario devono
essere **accreditate per le medesime attività in presenza**. Sul piano del modello riusa il
contenitore pluri-sessione della teleassistenza e produce una relazione finale.

### 8.4 Secondo parere

Valutazione indipendente richiesta a un professionista diverso da quello che ha in carico
l'assistito, di norma asincrona e su documentazione. **Non è un teleconsulto**, e la differenza è
strutturale: il richiedente può essere **l'assistito stesso**, e il consulente non entra nella
presa in carico. Il DM 19 novembre 2025 lo elenca fra i micro-servizi essenziali del teleconsulto,
il che indica che la piattaforma deve supportarlo, ma la fattispecie giuridica resta distinta.

### 8.5 Telecooperazione sanitaria

Assistenza fornita da un medico a distanza a un altro operatore impegnato **in un atto in corso**,
tipicamente in emergenza-urgenza territoriale. La sincronia è vincolante e la latenza tollerabile
è molto più bassa che in televisita: gli obiettivi di servizio non sono riusabili. La fattispecie
non compare nell'elenco delle prestazioni dell'Accordo 215/CSR 2020 ed è trattata dal progetto
come contesto d'uso **fuori perimetro** della versione corrente. `[NV]` su una definizione
normativa nazionale autonoma.

### 8.6 Che cosa non è telemedicina affatto

L'Accordo 215/CSR 2020 esclude espressamente una fattispecie, e l'esclusione è utile perché
disegna il confine per differenza:

> «**Triage telefonico**: il triage o la consulenza telefonica effettuati da medici o operatori
> sanitari verso i pazienti allo scopo di indicare il percorso diagnostico/terapeutico più
> appropriato […] **non rientra tra le attività riconducibili alla telemedicina**.»

L'elemento discriminante non è il mezzo ma la **natura dell'atto**: instradare verso il percorso
appropriato non è erogare una prestazione. Sullo stesso criterio restano fuori, senza che la norma
li nomini uno per uno: l'invio del referto per posta elettronica, che è trasporto di un documento;
il portale che espone documenti già prodotti, che è una funzione di accesso; le applicazioni di
benessere che raccolgono passi, sonno o battito senza un professionista responsabile e senza un
piano, perché raccogliere misure non è telemonitoraggio; la comunicazione amministrativa con
l'assistito, che resta comunicazione e ha per giunta il vincolo di non contenere dato clinico.

Nel modello il contatto telefonico di orientamento è rappresentato come **fatto organizzativo**:
non genera un contatto con macchina a stati clinica, non produce documento sanitario, non genera
evento rendicontabile come prestazione di telemedicina. Va comunque registrato, perché è
un'interazione che ha prodotto un instradamento.

Ne discende un vincolo simmetrico che chiude il cerchio con i non obiettivi del progetto: **se il
sistema calcolasse la priorità invece di registrarla, uscirebbe dal perimetro**. La valutazione di
urgenza e di appropriatezza del canale è atto del professionista; il sistema registra l'esito
deciso, con l'identità di chi lo ha deciso e il criterio dichiarato (`OUT-03`).

## 9. I cinque errori che questo capitolo esiste per impedire

| Errore | Che cosa produce |
|---|---|
| «Teleconsulto e televisita sono la stessa cosa con un partecipante in più» | Un modello che non sa chi è l'erogante, chi documenta e chi risponde; e che tenta di produrre un referto dove la norma lo vieta |
| «Il telemonitoraggio è raccogliere dati da un dispositivo» | Un prodotto privo di piano versionato, di attesa di rilevazione, di copertura oraria dichiarata e di escalation con fallimento dichiarato - cioè privo di tutto ciò che lo rende un servizio sanitario invece di un archivio di numeri |
| «Basta un `enum` con i tipi di prestazione» | Campi nulli, regole condizionali fragili, rendicontazione impossibile. Ogni prestazione è la propria macchina a stati, e il tipo la seleziona invece di aggiungere un campo (vincolo `V-140`) |
| «Il telecontrollo è telemonitoraggio con una videochiamata» | Un errore di rendicontazione: il telecontrollo è tariffato, il telemonitoraggio da solo no |
| «Un attributo booleano basta per l'uso in urgenza» | Due regole diverse collassate in una: la televisita è esclusa dall'urgenza, la teleconsulenza vi è ammessa ma non può surrogare il soccorso |

## Dove continuare

- [`docs/10_fondamenti/02-prestazioni-di-telemedicina.md`](../10_fondamenti/02-prestazioni-di-telemedicina.md):
  le definizioni verbatim, la catena normativa a quattro livelli con cogenza diversa, le dieci
  tipologie documentali del fascicolo, il regime di tariffazione prestazione per prestazione.
- [`docs/05_domain/02-le-prestazioni-modellate.md`](../05_domain/02-le-prestazioni-modellate.md):
  le macchine a stati con transizioni ammesse, gli esiti tipizzati, le transizioni che
  deliberatamente non esistono e la mappatura sullo standard.
- [`docs/03_functional/03-casi-d-uso.md`](../03_functional/03-casi-d-uso.md): i flussi con
  precondizioni, flussi alternativi e flussi di errore.
- [`docs/03_functional/07-fuori-perimetro.md`](../03_functional/07-fuori-perimetro.md): il confine
  fra ciò che il sistema registra e ciò che interpreterebbe.
