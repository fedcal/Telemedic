# T-08 - Scheletro eseguibile e percorso verticale ridotto, provato

**Traguardo** `T-08` · **Classe di attività** `D` · **Classe di enunciato** `[IMPEGNO]`
**Data** 14 novembre 2026 · **Titolare** contributore unico
**Innesco** chiusura di `T-01`, `T-03`, `T-04` e posizione registrata delle decisioni di `T-05`

> **Che cosa è questo documento.** È il piano di esecuzione dei criteri di `T-08` come sono
> scritti in [`docs/09_roadmap/02-traguardi.md`](../../docs/09_roadmap/02-traguardi.md). Non li
> riformula, non li attenua e non ne aggiunge. Dove il piano non chiude, lo dice.
>
> **Che cosa questo documento non è.** Non è codice e non ne contiene. `V-182` vieta ogni riga di
> codice applicativo prima di `T-03`, e questo piano si scrive **prima** del cancello per essere
> eseguito **dopo**. Non contiene classi, moduli, configurazioni applicative, frammenti di schema
> né nomi di file sorgente da creare: contiene che cosa va costruito, in quale ordine, e con quale
> criterio si dichiara fatto.
>
> **Le date sono allocazioni del calendario residuo, non stime.** Non compare alcuna percentuale di
> avanzamento: `V-181` la esclude, e un traguardo con otto criteri e sette soddisfatti è un
> traguardo non raggiunto.

---

## 1. Il cancello, e che cosa esso governa davvero

`V-182` non dice «prima la pipeline, poi il codice» come questione di ordine gradevole. Dice che
**nessuna riga di codice applicativo precede la catena di costruzione che genera la distinta dei
materiali e il registro degli identificativi di requisito**. La ragione è che la distinta e la
tracciabilità sono attività retroattivamente irrecuperabili: un componente entrato prima
dell'inventario è un componente che nessuno ha valutato, e una prova scritta prima del registro è
una prova che cita un identificativo che nessuno controlla.

Ne discendono tre conseguenze operative per questo piano, e vanno tenute distinte.

**Prima.** Il lavoro di `T-08` comincia il giorno in cui `T-03` chiude, cioè il **26 settembre
2026**, e non un giorno prima. Il piano deve quindi essere completo prima di quella data, perché
il tempo speso a decidere che cosa fare il 27 settembre è tempo sottratto alla finestra.

**Seconda.** Ciò che questo piano può produrre **prima** del cancello, senza violarlo, è
esattamente ciò che non è codice applicativo: il presente documento, l'elenco enumerato e
versionato delle configurazioni supportate su cui le prove negative dovranno esaurire i casi, la
lista di controllo manuale di accessibilità, il vocabolario chiuso delle operazioni del registro
immutabile, e le decisioni che `T-05` deve chiudere. Nulla di tutto questo è codice, e tutto
questo è massa che altrimenti graverebbe sulla finestra.

**Terza.** Il codice usa-e-getta delle verifiche di `T-04` è l'unica eccezione dichiarata, e
`T-03` la circoscrive: dichiarato tale, residente in un'area separata, non incluso in alcun
artefatto distribuito. **Quel codice non diventa il gateway di `T-08`.** «Una verifica riuscita
autorizza a progettare; non è progettazione» è scritto in `T-04` ed è la regola che protegge il
confine di autorizzazione dall'essere ereditato da uno spike.

---

## 2. La finestra, e l'aritmetica dichiarata

Fra `T-03` (26 settembre 2026) e `T-08` (14 novembre 2026) corrono **quarantanove giorni**, cioè
**sette settimane esatte**. Con la capacità dichiarata da `D62` - dieci-venti ore a settimana,
contributore unico - la finestra vale **settanta-centoquaranta ore**.

Quelle ore non sono tutte di `T-08`. Nella stessa finestra cadono:

| Traguardo | Data | Che cosa sottrae alla finestra |
|---|---|---|
| `T-04` | 3 ottobre 2026 | La prima delle sette settimane, per intero: le verifiche empiriche sono l'innesco di `T-08` e non sono comprimibili |
| `T-02` | 10 ottobre 2026 | Parte della seconda settimana: chiusura del corpo documentale al minimo prerequisito |
| `T-06` | 21 novembre 2026 | La coda: il diagramma di [02 §7](../../docs/09_roadmap/02-traguardi.md) lo colloca dal 7 novembre, cioè **sovrapposto all'ultima settimana di `T-08`** |

Resta a `T-08`, al netto, un intervallo dell'ordine di **cinque settimane utili**, cioè
**cinquanta-cento ore**, per otto criteri di cui due che il progetto stesso qualifica «mesi»: il
criterio 4 (registro immutabile, rinviato a `R-20` e dichiarato «il singolo elemento di maggiore
sforzo del catalogo») e il criterio 6 (percorso verticale completo).

**Il registro delle revisioni ha già dichiarato che l'aritmetica non chiude** - [00 §8.4](../../docs/09_roadmap/00-indice.md),
revisione fuori cadenza del 26 agosto 2026 - e la decisione `S-8` ha ridotto il criterio 6 senza
toccare il criterio 4, che è protetto per costruzione da [01 §7.3](../../docs/09_roadmap/01-principi-e-metodo.md).
**Questo piano non finge che chiuda.** Il §8 dice dove si rompe per primo e con quale segnale, in
forma binaria, agganciato alla soglia già fissata dalla roadmap: la settimana che si apre lunedì
**19 ottobre 2026**.

---

## 3. Il percorso verticale, definito con precisione

Il criterio 6 chiede «un percorso verticale completo per la televisita programmata a due
partecipanti, provato da estremo a estremo, con matrice di tracciabilità generata». «Completo» è
la parola che va fissata prima di cominciare, perché è quella su cui, sotto pressione di
calendario, si negozia in silenzio.

### 3.1 Da quale atto a quale atto

**Dall'appuntamento ricevuto per riferimento dal sistema di origine, fino alla restituzione
dell'esito strutturato al sistema di origine.** Sono i due estremi dichiarati da
[03 §2.1](../../docs/09_roadmap/03-primo-rilascio-utilizzabile.md), nella forma in cui `TG-01` li
ha ridotti: il percorso **si ferma prima della refertazione**, e ciò che torna al sistema di
origine è un esito strutturato ([03 §3.6](../../docs/09_roadmap/03-primo-rilascio-utilizzabile.md)),
non un documento firmato.

Gli atti intermedi, nell'ordine del dominio e con i casi d'uso che li governano in
[`docs/03_functional/03-casi-d-uso.md`](../../docs/03_functional/03-casi-d-uso.md):

1. **Prenotazione per riferimento dal sistema esterno** (`UC-01`). L'integratore chiama
   l'interfaccia applicativa di progetto; l'anagrafica è risolta o creata **per riferimento**;
   l'ammissibilità del canale è verificata; i collegamenti di accesso sono monouso e a scadenza.
2. **Verifica di eseguibilità e registrazione delle condizioni di erogabilità** (`UC-02`).
3. **Verifica tecnica preventiva** (`UC-03`). È ciò che protegge l'assistito da una sessione che
   non funzionerà, ed è dichiarata non tagliabile insieme a `S-3`.
4. **Raccolta delle manifestazioni di volontà** (`UC-04`), con i **tre** oggetti di consenso del
   perimetro ridotto - atto sanitario, trattamento dei dati ove applicabile, trasmissione
   dell'esito al sistema esterno - ciascuno riferito alla versione immutabile del testo
   informativo. La verifica è **bloccante e non degradabile**: `CTX-09` è in partnership con
   `CTX-04`, non in relazione cliente-fornitore, e non esiste percorso «degradato senza verifica
   del consenso».
5. **Ingresso in sala d'attesa e ammissione** (`UC-05`). È la superficie che `S-3` sacrifica per
   prima fra quelle del percorso: va costruita tardi, per la ragione del §7.4.
6. **Identificazione del paziente** (`UC-06`), che **non coincide con l'autenticazione** e produce
   una registrazione distinta in un momento distinto.
7. **Svolgimento della prestazione** (`UC-07`), con la **verifica delle chiavi come stato
   bloccante** della macchina a stati (`D22`), la misura della qualità per sessione e l'**avviso di
   qualità inadeguata al professionista** con l'esito della sua decisione conservato. Verifica
   delle chiavi e avviso sono entrambi nell'elenco del debito vietato: non sono funzioni, sono
   controlli di rischio.
8. **Degrado del canale, ripiego e riconnessione** (`UC-08`), nella scala dichiarata: risoluzione,
   fluidità secondo la preferenza impostata, sospensione del video con **audio mantenuto**, avviso
   di inidoneità con proposta di rinvio o di canale alternativo. Ogni transizione è annunciata in
   modo percepibile anche senza vista e senza udito.
9. **Chiusura con esito tipizzato**, con lo **stato distinto dall'esito** e gli effetti
   amministrativi opposti mantenuti separati (`V-141`). Nessuna chiusura automatica per scadenza
   produce un esito clinico: il contatto non passa a concluso senza un esito dichiarato da un
   professionista.
10. **Restituzione dell'esito al sistema di origine** per chiamata autenticata, con
    l'attestazione della qualità del collegamento **misurata dal sistema e confermata dal
    professionista**, mai generata autonomamente, e con l'evento in uscita che trasporta **soli
    riferimenti**.

**Che cosa non è nel percorso.** `UC-10` (refertazione, firma e consegna) e `UC-11` (rettifica) -
escono con `TG-01`. `UC-12` (teleconsulto) e tutti i casi d'uso del telemonitoraggio, da `UC-13` a
`UC-24` - escono con `S-8`. `UC-09` (emergenza clinica con riprogrammazione in presenza) è un
esito legittimo del catalogo e resta rappresentato nel dominio; la prova da estremo a estremo non
lo esercita, ed è una riduzione che va **registrata come tale** e non lasciata implicita.

### 3.2 Quali contesti attraversa

Dei **tredici** contesti fissati da `D61` e descritti in
[`docs/02_architecture/02-contesti-delimitati.md`](../../docs/02_architecture/02-contesti-delimitati.md),
il percorso ne attraversa **nove**:

| Contesto | Ruolo nel percorso |
|---|---|
| `CTX-01` Identità e accessi | Confine di autorizzazione unico, delega con claim dell'attore, livello di garanzia qualificato eseguito/riferito |
| `CTX-02` Anagrafiche | Riferimenti agli identificativi del sistema di origine; nessun identificatore esterno è chiave primaria |
| `CTX-03` Agenda | Appuntamento ricevuto per riferimento; lo stato si riflette, non si governa |
| `CTX-04` Prestazione clinica | Macchina a stati della televisita programmata, selezionata dal catalogo; stato ed esito distinti |
| `CTX-05` Sessione media | Segnalazione, negoziazione, verifica delle chiavi, misura della qualità, degrado |
| `CTX-08` Notifiche | **Forma minima**: recapito dell'invito sui canali di chi installa, senza contenuto clinico su canale non autenticato |
| `CTX-09` Consenso | Tre oggetti distinti, verifica bloccante |
| `CTX-11` Interoperabilità in uscita | Unica superficie verso l'esterno; restituzione dell'esito per chiamata autenticata |
| `CTX-12` Tracciamento | Registro immutabile, copertura integrale del percorso |
| `CTX-13` Amministrazione tenant | Configurazione come contratto versionato; nessun accesso al dato clinico |

Sono dieci righe per nove contesti perché `CTX-13` non è attraversato dal percorso clinico: lo
**alimenta**, e la distinzione va mantenuta.

I quattro non attraversati: `CTX-06` documentazione clinica (`TG-01`), `CTX-07` telemonitoraggio
(`S-8`), `CTX-10` terminologie - presente come punto di estensione **disattivato per impostazione
predefinita** (`TG-05`) - e nessun altro. Il conto torna a tredici.

**Decisione di struttura che questo piano prende e registra.** Lo scheletro dei moduli comprende
**tutti e tredici** i contesti, anche quelli non attraversati, perché il criterio 1 chiede che le
regole di dipendenza siano verificate automaticamente e una regola che non ha nulla da verificare
non è provata. I quattro non attraversati esistono come confine e come `api` dichiarata, senza
contenuto di dominio esercitato: è precisamente ciò che `S-8` prescrive quando dice che
teleconsulto e telemonitoraggio «restano progettati nel dominio e nei requisiti **senza esercizio
nel codice**».

### 3.3 Quale prova lo dimostra da capo a fondo

Una sola prova da estremo a estremo, eseguita su navigatore reale e ambiente completo, che
attraversa i dieci atti del §3.1 con **due contesti di navigazione nella stessa esecuzione** - uno
per il professionista, uno per l'assistito - e che asserisce su fatti osservabili e non su
«funziona». Le asserzioni che la rendono una prova e non una dimostrazione:

- lo stato terminale raggiunto è quello atteso, e l'**esito** registrato è distinto dallo stato;
- la sessione **non si è avviata** nel ramo in cui una manifestazione di volontà obbligatoria non
  è verificata, e il rifiuto è strutturato e registrato;
- la verifica delle chiavi ha attraversato lo stato bloccante, **e la procedura in caso di mancata
  corrispondenza è esercitata con la stessa evidenza del caso positivo**;
- **ogni accesso a dato sanitario del percorso ha prodotto una voce di registro**, e il conteggio
  delle voci attese è determinato dal percorso, non osservato a posteriori;
- l'evento in uscita non contiene contenuto clinico, e una prova tenta di farvelo passare e
  fallisce se ci riesce;
- l'esito restituito al sistema di origine contiene l'attestazione di qualità **confermata dal
  professionista**, e il ramo in cui il professionista non conferma produce un esito diverso;
- la matrice di tracciabilità generata dall'esecuzione collega la prova agli identificativi di
  requisito che realizza, e la vista «requisiti senza prove» è vuota o è una lista di lacune
  dichiarate con motivazione.

**Che cosa la prova non dimostra, e va scritto accanto ad essa.** Non dimostra l'adeguatezza
clinica. Non dimostra l'accessibilità reale, di cui copre la sola parte automatizzabile. Non
dimostra il comportamento su ogni dispositivo: la matrice dei dispositivi provati va dichiarata.

---

## 4. I criteri, uno per uno

Per ciascuno: che cosa serve, in quale ordine, **come si dimostra**. La dimostrazione è binaria e
osservabile da chiunque con la procedura descritta - che è ciò che
[01 §12.1](../../docs/09_roadmap/01-principi-e-metodo.md) richiede e che sotto `D54` è producibile;
**che l'accertamento sia stato eseguito da un secondo soggetto non è richiesto e non è
producibile**, ed è la lacuna `TG-20`.

### Criterio 1 - Struttura dei moduli e regole di dipendenza verificate

**Che cosa serve.** I tredici moduli di contesto, i moduli trasversali di piattaforma, i moduli di
interfaccia e il modulo di assemblaggio, nella struttura di
[`docs/01_technical/02-backend.md`](../../docs/01_technical/02-backend.md) §1. Dentro ciascun
contesto, la stessa forma interna ripetuta: contratto verso gli altri, dominio senza effetti
collaterali, applicazione con il confine transazionale, infrastruttura sostituibile.

**In quale ordine.** È il primo lavoro in assoluto e non ammette parallelismo: ogni altro criterio
scrive dentro questa struttura, e spostarla dopo costa una migrazione di tutto ciò che vi è stato
messo.

**Come si dimostra.** Il controllo delle regole di dipendenza è **visto fallire** su una
violazione deliberata, e il caso deliberatamente errato resta nel banco di prova. Le regole da
verificare sono cinque, e la quinta è quella che si viola per prima: il dominio non dipende da
nulla se non dalla libreria standard e dalla piattaforma - nessuna annotazione di persistenza,
nessuna annotazione web, nessun tipo del quadro di lavoro nel dominio.

> **Ambiguità da chiudere prima di scrivere il controllo, e non dopo.** La regola 1 dell'area
> tecnica dice «nessun contesto dipende da un altro contesto» e nella stessa riga dice che i
> contesti comunicano «per interfaccia sincrona esposta nel proprio pacchetto `api`». La mappa dei
> contesti dichiara relazioni cliente-fornitore fra contesti. Le due formulazioni convivono solo
> se il controllo distingue la dipendenza sul contratto - ammessa - dalla dipendenza su dominio,
> applicazione o infrastruttura - vietata. Il criterio 1 di `T-08` riporta la formulazione
> assoluta. **Il controllo non è scrivibile finché la formulazione non è resa precisa**, ed è la
> prima voce del §9.2.

### Criterio 2 - Contesto di tenant impostato dentro la transazione

**Che cosa serve.** Lo schema per tenant su base dati condivisa, con sicurezza a livello di riga
come difesa in profondità; la risoluzione del tenant dall'asserzione di identità e **mai** dalla
richiesta; l'impostazione del contesto **dentro** la transazione, nella forma che decade alla sua
chiusura e non in quella che persiste sulla connessione; la negazione predefinita in assenza di
contesto.

**In quale ordine.** Secondo. Precede il registro immutabile, perché la catena è **per tenant** e
ogni voce porta il tenant senza eccezioni; precede l'outbox, perché ogni busta porta il tenant;
precede il percorso verticale, perché nessun accesso ai dati avviene fuori da una transazione con
tenant risolto.

**Come si dimostra.** Con la prova che **esaurisce deliberatamente il pool di connessioni** e
verifica l'isolamento - è il testo del criterio e non va addolcito - e con le tre verifiche che
distinguono un meccanismo attivo da un meccanismo efficace: in assenza di contesto le politiche
negano tutto; le politiche sono imposte anche al proprietario delle tabelle; il ruolo applicativo
non possiede l'attributo che consente di superarle. La verifica interroga il catalogo di sistema:
accertare che le politiche esistano non è accertare che producano l'effetto.

Va provato inoltre che **la connessione restituita al pool non conserva il contesto della
richiesta precedente**. È il difetto che non dà sintomi visibili e si manifesta come dato altrui
in una schermata.

### Criterio 3 - Prove di isolamento fra tenant

**Che cosa serve.** Prove che **tentano attivamente l'accesso illegittimo**, per ogni contesto e
per ogni interfaccia esposta, in condizioni avverse: pool esaurito, contesto non risolto, richiesta
senza tenant, tenant sostituito a metà percorso. La suite di integrazione esercita **sempre almeno
due tenant e due integratori distinti, con configurazioni divergenti** (`V-188`).

**In quale ordine.** Contestuale al criterio 2, non successivo: una proprietà di isolamento
scritta e provata dopo è una proprietà che il codice ha già aggirato in tre punti.

**Come si dimostra.** Ogni prova ha un caso che **deve fallire** e che fa fallire la suite se
passa. Il banco eredita la proprietà già dimostrata su `T-01`: sottoposto a prova di mutazione,
un controllo reso deliberatamente sempre-verde deve far scendere il numero di casi conformi. Un
banco che non si accorge di un controllo disattivato è teatro.

### Criterio 4 - Registro immutabile

Ha un capitolo proprio: **§5**. È la massa che nessun taglio tocca.

### Criterio 5 - Outbox transazionale unica sorgente

**Che cosa serve.** La tabella di outbox nello schema del tenant; la scrittura dell'evento **nella
stessa transazione del dato**; il relay a interrogazione periodica con blocco saltato, che legge la
propria tabella nello schema del tenant con contesto impostato - **non esiste un relay che legge
da tutti gli schemi in una sola interrogazione**; la busta con attributi obbligatori, fra cui il
tenant senza eccezioni e la versione esplicita nel nome del tipo.

Nel perimetro ridotto **non esiste il broker** (`TG-04`): l'outbox resta la sorgente di verità e
consegna per **chiamata autenticata** verso il sistema di origine, con un solo consumatore
configurato per tenant. Le verifiche obbligatorie dell'area architetturale che presuppongono il
broker vanno rilette in questo assetto, e la rilettura va registrata invece che dedotta - §11.3.

**In quale ordine.** Dopo il criterio 2, in parallelo concettuale al criterio 4 ma non
temporalmente: con un contributore unico i due si contendono lo stesso confine transazionale e lo
stesso file di assemblaggio.

**Come si dimostra.** Con quattro prove che verificano assenze e non presenze: interrotta la
transazione, **non esiste evento**; interrotto il processo fra consolidamento e pubblicazione,
l'evento **viene pubblicato al ripristino**; consegnato due volte lo stesso evento, lo stato del
consumatore è identico; e la prova che **ispeziona ogni tipo di evento e fallisce se un campo
clinico compare**, che è il criterio nella sua lettera: «nessuna busta contiene contenuto clinico».

### Criterio 6 - Percorso verticale completo per la televisita a due partecipanti

Definito al §3. La sequenza di costruzione è al §7.

**Come si dimostra.** Con la prova del §3.3 **e** con la matrice di tracciabilità **generata**
dall'esecuzione della suite, non compilata a mano. Un identificativo di requisito citato in una
prova e assente dal registro fa fallire la costruzione: è il controllo che `T-01` ha già consegnato
e che qui riceve il primo insieme non vuoto su cui lavorare.

**La riduzione già decisa va scritta accanto al criterio, ogni volta.** Il modello di dominio
contiene tre prestazioni; il percorso ne dimostra una. Chi valuta il progetto vede un solo caso
d'uso esercitato, e i modelli delle altre due restano progettati senza esercizio nel codice.

### Criterio 7 - Accessibilità

**Che cosa serve.** I criteri automatizzabili applicati al DOM renderizzato di **ogni schermata e
di ogni stato significativo** - modale aperta, errore mostrato, elenco vuoto, elenco lungo,
caricamento in corso - con blocco in pipeline; e **almeno una verifica manuale con tecnologia
assistiva reale**, con lista di controllo versionata ed esito registrato.

**In quale ordine.** La parte automatica dal primo giorno in cui esiste una schermata: è l'unico
lavoro che si degrada in modo irrecuperabile se rinviato, perché correggere l'accessibilità di
venti schermate esistenti costa più che costruirne venti accessibili. La verifica manuale a
percorso completo.

**Come si dimostra.** Nessuna violazione delle regole automatizzabili su alcuna schermata e alcuno
stato significativo; esito della verifica manuale registrato e datato. E due prove che verificano
un **divieto**: quella che tenta di occultare l'indicatore di registrazione con ogni mezzo previsto
dalla configurazione e deve fallire in tutti, e quella che tenta di salvare una configurazione di
tema che degrada il contrasto e deve essere **rifiutata al salvataggio**, non accettata con un
avviso.

> **Come va chiamata, e come non va chiamata.** Non è una valutazione formativa di usabilità.
> Chiamarla così sarebbe la forma di debito regolatorio più costosa: una registrazione formalmente
> presente e sostanzialmente vuota, peggiore dell'assenza perché falsamente rassicurante. La
> valutazione formativa è `TG-22`, ed è irreversibile.

### Criterio 8 - Prove media su rete simulata, due profili

**Che cosa serve.** Due profili di rete come costanti condivise: **nominale** e **degradato
limite**. I profili intermedi sono `TG-12`, taglio reversibile dichiarato. Sorgenti sintetiche
deterministiche; due contesti di navigazione nella stessa esecuzione con lettura delle statistiche
da entrambi i lati.

**Come si dimostra.** Su fatti osservabili: **suite di cifratura presente e non degenere**; avviso
emesso **quando e solo quando** la soglia è superata; **riga corrispondente nel tracciamento**. Le
tre asserzioni insieme, e non due su tre: la terza è ciò che collega il controllo di rischio alla
sua evidenza.

> **La soglia non è una costante.** La soglia di qualità che innesca l'avviso è **configurazione
> per tenant** (`CTX-05`, invariante 4) e la prova la imposta esplicitamente, in entrambi i sensi,
> per dimostrare il «quando e solo quando». Non è una soglia clinica: **nel percorso della
> televisita non esiste alcuna soglia clinica**, perché le soglie cliniche sono per assistito e
> appartengono al telemonitoraggio, che `S-8` esclude. Se una soglia clinica comparisse in questo
> percorso, sarebbe un difetto di modellazione, non un parametro da tarare.

---

## 5. Il criterio 4, affrontato di petto

### 5.1 Perché è la massa che nessun taglio tocca

`01 §7.3` colloca la registrazione degli accessi nel registro immutabile fra le voci in cui **il
debito non è ammesso in nessuna forma**, perché il suo interesse non è pagato dal progetto ma da
una persona assistita. `03 §5.4` lo ripete: ciò che si è potuto ridurre è **uno strato di
garanzia**, mai la copertura. L'ordine di sacrificio del §6.2 non contiene alcuna riga che lo
tocchi, e non ne conterrà: `V-282` ammette nell'ordine soltanto tagli reversibili, e un accesso non
registrato non si registra dopo.

Ne discende la proprietà che governa tutta la pianificazione di `T-08`: **il criterio 4 è
incomprimibile e il criterio 6 è già stato compresso una volta**. Ogni ora che manca si scarica
quindi sul criterio 6, e le righe residue dell'ordine di sacrificio tagliano superficie del
criterio 6, non massa del criterio 4.

### 5.2 Che cosa lo rende costoso

Non è una proprietà di uno strato di persistenza: è **un componente con un ciclo di vita proprio**,
e trattarlo diversamente è l'indicatore anticipatore dichiarato di `R-20`. Le voci di costo,
ciascuna con la ragione:

1. **Il versionamento delle entità non lo sostituisce.** Le tabelle di storico sono tabelle come
   le altre e chi ha accesso in scrittura le modifica come le altre. Il versionamento versiona, non
   rende immutabile. Ogni ora risparmiata qui è un'ora spesa a spiegare perché non conta.
2. **La scrittura è bloccante.** Il fallimento della scrittura di registro fa fallire l'operazione
   applicativa. Ne discende che il registro sta **sul percorso critico** di ogni operazione su dato
   clinico e che la sua indisponibilità è indisponibilità del sistema. È una scelta severa e
   deliberata, e il piano deve costruirla come tale fin dalla prima operazione, non aggiungerla
   dopo.
3. **La catena è per tenant e la sequenza è determinata alla scrittura.** Il numero di sequenza è
   strettamente crescente per tenant e una scrittura concorrente si serializza su quel punto. È un
   punto di contesa deliberato, e va progettato e provato come tale.
4. **La conservazione è a privilegi disgiunti.** Chi amministra l'archivio applicativo non ha
   privilegi di scrittura sull'archivio del registro. È un secondo insieme di credenziali, un
   secondo percorso di migrazione, e un controllo che **rileva e segnala** la configurazione in cui
   i due archivi condividono le credenziali.
5. **Il vocabolario è chiuso e versionato, e la retrocompatibilità è probatoria.** Il tracciamento
   riceve un linguaggio pubblicato perché le voci devono essere leggibili a distanza di anni da chi
   verifica, con strumenti che oggi non esistono. È l'unico contesto in cui la retrocompatibilità
   non è comodità.
6. **Il registro non si migra.** Una modifica di schema produce una **nuova generazione**, non una
   riscrittura. È la ragione per cui lo schema della voce è l'artefatto più costoso da cambiare
   dell'intero traguardo, e per cui va congelato per primo.
7. **L'elenco di ciò che non compare mai è chiuso e verificato automaticamente**, non affidato al
   buon senso: valori clinici, testi di documenti, contenuti di messaggi, identificativi esterni
   del soggetto assegnati dall'integratore, e ogni segreto. L'identificativo esterno merita
   attenzione perché è quello che si lascia passare in buona fede: il registro è consegnabile a
   soggetti diversi dal titolare, e l'identificativo esterno è una chiave verso un altro archivio.
8. **La verifica dell'integrità ha tre profondità**, produce **un esito registrato** ciascuna, ed è
   disponibile **su richiesta e programmata**. Il lavoro programmato è per tenant, iterando sul
   registro dei tenant attivi: non esiste una versione che operi su tutti in una sola
   interrogazione.
9. **Il fallimento della verifica è un incidente di sicurezza**, non un difetto da correggere in
   silenzio, e la procedura non «ripara» la catena: apre una nuova generazione ancorata alla
   precedente e registra l'evento della rottura. La procedura va costruita insieme alla catena,
   perché è il ramo che non si scrive mai se si rinvia.
10. **L'estratto è verificabile in modo indipendente da chi lo ha prodotto**, il che impone che il
    metodo di calcolo delle impronte e la struttura della catena siano documentati pubblicamente.
11. **Le verifiche obbligatorie sono dodici**, e diverse sono negative: modifica, cancellazione e
    inserimento retroattivo rilevati; lettura del registro che produce una voce; diniego che
    produce una voce; nessuna voce che contenga elementi dell'elenco chiuso; nessun percorso
    applicativo che legga dal registro per decidere.

### 5.3 Che cosa `TG-23` toglie, e che cosa ne discende per il piano

`TG-23` toglie l'**ancoraggio periodico firmato**, ed è irreversibile per il periodo: attivarlo
dopo non retrodata nulla. Il piano deve trarne tre conseguenze operative che i documenti lasciano
implicite:

- **La verifica «da ancoraggio» non ha riferimento.** Delle tre profondità, restano l'incrementale
  e l'integrale, e l'integrale ricalcola dall'inizio della generazione corrente. Va dichiarato,
  perché altrimenti una procedura documentata resta senza il proprio punto di partenza.
- **La rimozione per scadenza avviene per segmenti delimitati da ancoraggi.** Senza ancoraggi
  serve un delimitatore sostitutivo dichiarato - il confine di generazione è il candidato naturale
  - ed è una decisione, non un dettaglio.
- **La separazione dei privilegi diventa lo strato che resta.** Il suo peso aumenta, ed è un
  **presupposto di installazione**, non una raccomandazione: in sua assenza la garanzia scende alla
  sola catena applicativa e non c'è più uno strato che compensi.

> **Tensione registrata e non chiusa.** `R-20` dichiara che `RU-1` consegna «due strati su
> quattro». I quattro strati dell'area architetturale sono: catena applicativa, archivio con
> scrittura singola sull'oggetto, conservazione separata a privilegi disgiunti, ancoraggio
> periodico firmato. Il criterio 4 di `T-08` ne nomina due - catena di impronte e archiviazione a
> privilegi disgiunti - e `03 §5` dichiara come taglio **il solo ancoraggio** (`TG-23`). **La
> copia su archivio a sola scrittura non compare né fra ciò che si consegna né fra ciò che si
> taglia.** O rientra nel perimetro e va costruita, o esce e va registrata come taglio con la
> procedura ordinaria. Questo piano non la decide: la porta al §11.

### 5.4 La sequenza che consegna prima la parte da cui tutto il resto dipende

L'ordine non è quello della descrizione: è quello del costo di cambiamento.

**Primo - lo schema della voce e il vocabolario chiuso.** Chi, che cosa, quando, su chi, su che
cosa, con quale esito, con quale livello di garanzia e sua provenienza, con quale finalità, da
dove, tenant sempre. Più l'elenco chiuso di ciò che non vi compare mai. È il primo perché **il
registro non si migra**: sbagliarlo significa aprire una generazione nuova, cioè pagare due volte.
Questo lavoro **non richiede il cancello**: è un artefatto documentale versionato e va prodotto
prima del 26 settembre 2026. È la voce più grande di massa che il piano può spostare fuori dalla
finestra.

**Secondo - la scrittura bloccante con catena per tenant e sequenza assegnata alla scrittura.** È
il nucleo. Si dimostra con la prova che rende il registro non scrivibile e verifica che
l'operazione su dato clinico **fallisca**.

**Terzo - la conservazione a privilegi disgiunti, con il controllo che rileva la condivisione delle
credenziali.** Va qui e non dopo perché è un secondo archivio: aggiungerlo a percorso costruito
significa rifare le credenziali, le migrazioni e il dispiegamento.

**Quarto - la rilevazione dell'alterazione.** Modifica, cancellazione, inserimento retroattivo:
tre prove negative che devono rilevare. È la sola cosa che rende la catena un'evidenza invece di
una struttura dati.

**Quinto - la copertura, costruita percorso per percorso.** Ogni atto del §3.1 aggiunge le proprie
voci attese, e il conteggio è determinato dal percorso. **La copertura non si chiude alla fine**:
si chiude a ogni atto, altrimenti l'ultimo atto scopre di doverla costruire per tutti.

**Sesto - la verifica programmata, per tenant, con esito registrato**, e la procedura di
fallimento che apre una generazione nuova.

**Settimo - l'estratto firmato verificabile senza accesso al sistema**, con il metodo documentato
pubblicamente. È l'unico elemento collocabile tardi senza mettere a rischio i precedenti, ed è
quindi il candidato naturale a essere il primo a scivolare - il che va detto ora e non a
novembre.

---

## 6. Ciò che va prodotto prima del cancello, e non è codice

È la sola leva che il piano possiede sulla finestra, e va usata tutta. Nessuna di queste voci è
codice applicativo; tutte sono massa che altrimenti graverebbe sulle sette settimane.

| Artefatto | Perché fuori dalla finestra | Vincolo che rispetta |
|---|---|---|
| Schema della voce di registro e vocabolario chiuso delle operazioni | Il registro non si migra: sbagliarlo costa una generazione | `V-182` non lo tocca: è documentazione versionata |
| Elenco chiuso di ciò che non compare mai in una voce | Alimenta un controllo automatico, che è pipeline e non applicazione | Idem |
| Enumerazione versionata delle **configurazioni supportate** su cui le prove negative devono esaurire i casi | Senza l'insieme dichiarato, «nessuna configurazione supportata» non è binario | Idem |
| Lista di controllo manuale di accessibilità, versionata | È il criterio 7 nella parte che non si automatizza | Idem |
| Definizione dei due profili di rete come costanti condivise dichiarate | È il criterio 8 nella parte che non è codice di prodotto | Idem |
| Elenco degli identificativi di requisito che il percorso verticale deve realizzare | Alimenta la matrice generata; il registro esiste già da `T-01` | Idem |
| Fabbriche di dati sintetici: **regole**, non realizzazione - identificativi sintetici riconoscibili come tali, che non possano coincidere con identificativi attribuiti a persone | «Si genera, non si anonimizza» va deciso prima, non mentre si scrive la prima prova | Nessun dato reale, mai |
| Configurazioni di riferimento con soli segnaposto `${VARIABILE_AMBIENTE}` | Nessun segreto nel codice, e la regola si applica prima che il codice esista | Nessun segreto |

---

## 7. La sequenza dei lavori, le dipendenze, e il parallelismo che esiste davvero

### 7.1 I blocchi

| Blocco | Contenuto | Dipende da | Criterio |
|---|---|---|---|
| **Blocco 1** | Ossatura dei tredici moduli di contesto, piattaforma, interfacce, assemblaggio; controllo delle regole di dipendenza visto fallire | Chiusura di `T-03`; chiusura dell'ambiguità del §9.2 voce 1 | 1 |
| **Blocco 2** | Schema per tenant, sicurezza a livello di riga, contesto risolto dall'asserzione e impostato dentro la transazione, negazione predefinita | Blocco 1 | 2 |
| **Blocco 3** | Prove di isolamento in condizioni avverse, due tenant e due integratori con configurazioni divergenti | Blocco 2 | 3 |
| **Blocco 4** | Registro immutabile, nella sequenza del §5.4, passi secondo-quarto | Blocco 2; schema della voce prodotto prima del cancello | 4 |
| **Blocco 5** | Outbox transazionale, busta, relay per tenant, consegna per chiamata autenticata | Blocco 2; catalogo degli errori | 5 |
| **Blocco 6** | Percorso verticale, atto per atto, nell'ordine del §7.4 | Blocchi 1, 2, 4, 5; esiti registrati di `T-04` | 6 |
| **Blocco 7** | Copertura del registro per ciascun atto del percorso; §5.4 passo quinto | Blocco 4 e, atto per atto, Blocco 6 | 4 |
| **Blocco 8** | Accessibilità automatica su ogni schermata e stato significativo | Prima schermata del Blocco 6 | 7 |
| **Blocco 9** | Prove media, due profili, tre asserzioni | Stati di sessione del Blocco 6 | 8 |
| **Blocco 10** | Verifica programmata dell'integrità, procedura di fallimento, estratto firmato | Blocco 4 | 4 |
| **Blocco 11** | Verifica manuale con tecnologia assistiva reale, esito registrato | Percorso completo | 7 |
| **Blocco 12** | Matrice di tracciabilità generata, vista «requisiti senza prove» | Blocchi 6, 7, 9 | 6 |

### 7.2 Che cosa è davvero parallelizzabile

Con un contributore unico il parallelismo esiste **solo** dove due lavori non si contendono lo
stesso file e non attendono la stessa decisione. Applicando il criterio alla lettera:

- **Blocco 8 è parallelo a tutto il resto.** Tocca configurazione di pipeline e schermate, non il
  dominio, e non attende alcuna decisione che gli altri attendano.
- **Blocco 11 è parallelo nella sua parte documentale.** La lista di controllo è già prodotta prima
  del cancello (§6); resta l'esecuzione, che è un'ora a percorso completo.
- **Blocco 10, nella parte di documentazione pubblica del metodo di calcolo delle impronte**, è
  parallelo e va anticipato: è prosa, non codice.
- **Tutto il resto è sequenziale.** Blocchi 2, 4, 5 si contendono il confine transazionale e il
  modulo di assemblaggio; Blocchi 6 e 7 sono lo stesso lavoro visto da due criteri. Dichiararli
  paralleli sarebbe un modo elegante di contare due volte le stesse ore.

### 7.3 Il rapporto con `T-06`

Il diagramma della roadmap colloca `T-06` dal 7 novembre, cioè sovrapposto all'ultima settimana di
`T-08`. La sovrapposizione è **reale e non risolvibile riorganizzando**: sono le stesse ore. Il
piano la registra come tale invece di allocare le stesse ore due volte, e ne trae il §8: la
settimana dal 7 al 14 novembre non è disponibile per recuperare uno scostamento accumulato prima.

### 7.4 L'ordine di costruzione del percorso verticale, e perché è quello

**Principio: si costruisce per ultimo ciò che si sacrifica per primo.** L'ordine di sacrificio di
[03 §6.2](../../docs/09_roadmap/03-primo-rilascio-utilizzabile.md) è scritto in anticipo proprio
per non doverlo scegliere sotto pressione; usarlo anche come ordine inverso di costruzione fa sì
che, se la finestra si chiude, ciò che manca sia esattamente ciò che era già stato deciso come
sacrificabile - e non ciò che capita di non aver finito.

1. **Percorso sottile da estremo a estremo**: appuntamento per riferimento, sessione avviata,
   chiusura con esito tipizzato, esito restituito. Con registro e contesto di tenant già in
   funzione. È il minimo che dimostra che il verticale esiste.
2. **Consenso**, con la verifica bloccante e i tre oggetti distinti. Non è sacrificabile.
3. **Verifica delle chiavi come stato bloccante**, con la procedura di mancata corrispondenza. Non
   è sacrificabile.
4. **Avviso di qualità inadeguata**, con l'esito della decisione del professionista conservato. Non
   è sacrificabile.
5. **Verifica tecnica preventiva** e **identificazione del paziente**.
6. **Degrado dichiarato** e riconnessione, con il profilo limite.
7. **Firma asimmetrica degli eventi in uscita** - corrisponde a `S-6`, ultima riga dell'ordine di
   sacrificio fra quelle che toccano il percorso, quindi la prima delle sacrificabili a essere
   costruita. Se cade, **non è ammesso il segreto condiviso come sostituto**: o la firma
   asimmetrica, o l'evento non esce e resta il recupero per chiamata autenticata.
8. **Ripiego telefonico come esito tipizzato** (`S-5`).
9. **Elenco delle prestazioni del giorno** (`S-4`).
10. **Sala d'attesa e ammissione come stati distinti** (`S-3`).
11. **Attestazione strutturata della qualità nell'esito restituito** (`S-2`).
12. **Esportazione delle metriche in formato aperto** (`S-1`).

---

## 8. Dove il piano si rompe per primo, e il segnale che lo annuncia

### 8.1 Il punto di rottura

**Il criterio 4.** Non perché sia il più difficile in astratto, ma per una proprietà strutturale:
è l'unico criterio di `T-08` che **non ha alcuna riga dell'ordine di sacrificio che lo alleggerisca**.
Il criterio 6 è già stato ridotto una volta da `S-8` e ha ancora sei righe che ne tagliano
superficie (`S-1`…`S-6`); il criterio 4 ne ha zero, per costruzione, e continuerà ad averne zero
perché `V-282` ammette nell'ordine soltanto tagli reversibili e la copertura del registro non lo è.

Ne discende la forma esatta della rottura, che non è «`T-08` slitta» - la data non slitta, `D53` la
fissa - ma una delle due:

1. **Il percorso verticale esiste e la copertura del registro non è integrale.** È l'esito
   peggiore, perché viola `01 §7.3` in silenzio: un criterio bloccante di rilascio
   ([03 §8](../../docs/09_roadmap/03-primo-rilascio-utilizzabile.md), criterio 3) resterebbe
   formalmente soddisfatto - la catena è verificabile - mentre la proprietà che conta non lo è.
2. **Il registro è integrale e il percorso verticale è più corto di quanto dichiarato**, con righe
   dell'ordine consumate senza essere registrate. È la materializzazione di `R-28` nella forma 1
   già descritta dal registro dei rischi: un rilascio più povero di quanto dichiarato, in cui la
   scelta di che cosa sacrificare **smette di essere leggibile**.

Entrambe si evitano nello stesso modo: **osservando il criterio 4 presto e in forma binaria**, non
a novembre.

### 8.2 Il segnale, agganciato alla soglia già fissata

La roadmap fissa la soglia alla **settimana che si apre lunedì 19 ottobre 2026**, quando la
revisione passa da mensile a settimanale con contenuto ridotto a due numeri - righe residue
dell'ordine di sacrificio e criteri bloccanti soddisfatti. Questo piano **non conia una data
nuova**: si aggancia a quella, e vi colloca quattro osservazioni binarie sul criterio 4 e sui suoi
prerequisiti.

Alla revisione della settimana del 19 ottobre 2026, per ciascuna delle quattro voci si registra
**sì** o **no**, mai «in corso»:

| # | Osservazione | Perché è questa e non un'altra |
|---|---|---|
| **O1** | Il controllo delle regole di dipendenza **è stato visto fallire** su una violazione deliberata | Senza di esso il criterio 1 non è dimostrato e la struttura può ancora spostarsi |
| **O2** | La prova che esaurisce deliberatamente il pool di connessioni esiste, ed **è stata vista fallire** in assenza di contesto di tenant | Il registro è per tenant: senza il contesto, il criterio 4 non è nemmeno cominciabile |
| **O3** | Lo schema della voce di registro è versionato **e** la prova che rende il registro non scrivibile **ha fatto fallire** l'operazione applicativa | È il nucleo del criterio 4 e il punto oltre il quale lo schema non si cambia più senza aprire una generazione |
| **O4** | Le tre prove negative sull'alterazione - modifica, cancellazione, inserimento retroattivo - **rilevano** | È ciò che distingue una catena da una struttura dati, ed è il criterio bloccante 3 di `RU-1` |

**Regola di lettura, dichiarata in anticipo.** Se anche **una sola** di `O1`…`O4` è **no** alla
revisione della settimana del 19 ottobre 2026, il criterio 4 non chiude entro il 14 novembre 2026
e **le sei righe residue dell'ordine di sacrificio non lo alleggeriscono**, perché tagliano
superficie del criterio 6. In quel caso valgono, e in quest'ordine, le uniche due mosse che
`V-282` ammette:

- **un ulteriore taglio reversibile**, deciso con la **procedura ordinaria** e registrato con data
  e causa - mai deciso sotto pressione, che è la seconda regola del §6.1 di
  [03](../../docs/09_roadmap/03-primo-rilascio-utilizzabile.md);
- oppure **la data si dichiara mancata**, con la causa registrata.

Non esiste una terza mossa, e in particolare non esiste la riduzione della copertura del registro.

### 8.3 Il segnale secondario, già in registro

`R-28` porta un indicatore secondario che si applica qui alla lettera: **un traguardo che non
chiude entro la propria data senza che una riga dell'ordine sia stata consumata**. Significa che lo
scostamento è stato assorbito in silenzio, ed è la condizione che precede l'esito 1 del §8.1. Le
date da osservare, tutte già in calendario e nessuna coniata qui: 3 ottobre (`T-04`, `T-05`), 10
ottobre (`T-02`), 15 ottobre (`Q-186`), 31 ottobre (`Q-185`, `Q-281`).

> **Nota sull'indicatore anticipatore di `R-28`, che va letto con attenzione.** `05 §2.1` dichiara
> che le righe dell'ordine di sacrificio disponibili «sono sette». Dopo la revisione del 26 agosto
> 2026 l'ordine ha otto voci, `S-8` risulta **già applicata** al criterio 6 di `T-08`, e `S-7` -
> il conteggio esatto delle parole del corpus - **è già stato eseguito**, quindi non è più
> sacrificabile. Le righe effettivamente disponibili sono **sei**: `S-1`…`S-6`. Il numero
> dell'indicatore va rettificato dalla revisione competente; questo piano lo registra e non lo
> corregge nei documenti.

---

## 9. Le decisioni che devono essere già prese perché il lavoro cominci

Sono la dipendenza che più facilmente blocca, perché non si recuperano lavorando di più.

### 9.1 Le voci di `T-05` da cui `T-08` dipende

`T-05` è datato **3 ottobre 2026** e la sua classe di enunciato è `[INTENZIONE]`: la data è quella
entro cui il progetto **pone** le domande, non quella entro cui vengono decise. `T-08` ne dipende
per quattro voci su sette.

| Voce | Perché `T-08` non comincia senza | Che cosa accade se resta aperta |
|---|---|---|
| **`Q-111` - limite dichiarato di partecipanti** | Il criterio 6 dice «due partecipanti». Il limite va dichiarato come **limite del rilascio**, non come proprietà del prodotto | Il percorso si costruisce su un'assunzione non registrata, e la formulazione pubblica diverge dal codice |
| **`Q-110` - topologia del segnale su più istanze** | La segnalazione è un modulo di interfaccia del Blocco 1. Con un solo profilo di dispiegamento (`TG-08`) il caso è degenere, ma **il contratto va scritto sapendo quale dei due assetti è quello di destinazione** | La decisione viene presa d'ufficio in una proposta di modifica, che è precisamente ciò che `T-05` esiste per impedire |
| **`Q-145` - conferma delle sei rinunce deliberate** | Sono le funzioni che sposterebbero il sistema verso il tempo reale clinico. Con `D55` che congela la destinazione d'uso, la conferma è ciò che la rende difendibile | Si costruisce una capacità che una valutazione successiva obbliga a rimuovere, e la rimozione è più costosa della costruzione |
| **`Q-189` - ripartizione delle registrazioni a ruoli distinti** | Determina che cosa gli esiti registrati di `T-08` possono affermare, e in particolare la verifica manuale del criterio 7 | Esito predefinito: la lacuna dichiarata. È già dichiarato in anticipo, ma il punto di decisione è il **30 settembre 2026**, cioè dentro la prima settimana di lavoro |

Le tre restanti - `C-4`/`Q-186`, `Q-280`, `Q-185` - sono prerequisiti di `T-10` e di `T-14`, non di
`T-08`, e questo piano non le rivendica.

### 9.2 Le decisioni che `T-08` richiede e che **non sono in `T-05`**

Sono la parte più insidiosa, perché nessuno le sta aspettando. Ciascuna è già dichiarata come non
verificata o non decisa in un'area, e ciascuna blocca un lavoro preciso.

1. **La formulazione precisa della regola «nessun contesto dipende da un altro contesto».** Va resa
   compatibile con la comunicazione per contratto, altrimenti il controllo del criterio 1 non è
   scrivibile. Spetta all'area architetturale. **Blocca il Blocco 1, cioè tutto.**
2. **Il delimitatore che sostituisce l'ancoraggio** per la verifica «da ancoraggio» e per la
   rimozione per segmenti. L'area architetturale dichiara l'intervallo di ancoraggio come punto non
   verificato; `TG-23` toglie l'ancoraggio e nessuno ha dichiarato che cosa prende il suo posto.
   **Blocca il Blocco 10.**
3. **La forma minima dell'origine della richiesta** nella voce di registro. È dichiarata punto non
   verificato dall'area architetturale, spetta all'area di sicurezza, e **lo schema della voce non
   si chiude senza**: l'indirizzo di rete di un assistito è dato personale e, nel contesto, dato
   relativo alla salute, perché la sua sola presenza attesta un contatto sanitario. **Blocca il
   passo primo del §5.4, che è il lavoro anticipato al §6.**
4. **I requisiti minimi di separazione dei privilegi esigibili da chi installa.** Dichiarati punto
   non verificato; con `TG-23` la separazione è **lo strato che resta**. **Blocca il Blocco 4,
   passo terzo.**
5. **La cadenza delle tre profondità di verifica.** Dichiarata punto non verificato. **Blocca il
   Blocco 10** nella parte «programmata».
6. **La sorte della copia su archivio a sola scrittura** - §5.3. O rientra e va costruita, o esce e
   va registrata come taglio con la procedura ordinaria. **Blocca il Blocco 4** nel suo perimetro.

**Raccomandazione di questo piano, che non è una decisione:** le sei voci del §9.2 vanno poste
insieme alle sette di `T-05` e **prima del 3 ottobre 2026**, perché il loro tempo di
attraversamento è basso e il loro effetto bloccante è totale. Porle è del contributore unico;
deciderle non è.

---

## 10. Rischi propri, e la contromisura

| Rischio | Come si manifesta qui | Contromisura, e chi la esegue |
|---|---|---|
| **`R-20`** - il registro immutabile è più costoso di quanto una pianificazione ingenua assuma | Trattandolo come proprietà di uno strato di persistenza invece che come componente con ciclo di vita proprio. È l'indicatore anticipatore, alla lettera | La sequenza del §5.4 e le osservazioni `O3`/`O4` del §8.2. La copertura è criterio di completamento e criterio bloccante: non è comprimibile nemmeno sotto pressione |
| **`R-28`** - data ravvicinata con capacità dichiarata bassa | Righe dell'ordine consumate senza registrazione; scostamento assorbito in silenzio | Revisione settimanale dal 19 ottobre 2026 con i due numeri; ogni consumo di riga registrato con data e causa, che è esso stesso innesco di revisione fuori cadenza |
| **`R-02`** - concentrazione della conoscenza su un unico contributore | Il piano stesso è la mitigazione: rende eseguibile da un estraneo ciò che altrimenti vive in una sola testa | Ambiente di sviluppo avviabile su una macchina disconnessa; nessuna conoscenza pregressa non scritta come prerequisito |
| **Proprio del traguardo - il codice usa-e-getta di `T-04` diventa il gateway** | Sotto pressione di calendario è la scorciatoia più naturale e la più costosa: il confine di autorizzazione è codice di sicurezza critico | Area separata dichiarata, esclusione da ogni artefatto distribuito, e la regola scritta: una verifica riuscita autorizza a progettare, non è progettazione |
| **Proprio del traguardo - la copertura del registro si chiude «alla fine»** | L'ultimo atto del percorso scopre di dover coprire tutti i precedenti | Blocco 7 costruito **atto per atto** insieme al Blocco 6, mai come lavoro terminale |
| **Proprio del traguardo - il gateway terminologico disattivato fa apparire soddisfatto un criterio** | Il funzionamento senza terminologie a licenza vincolata risulta soddisfatto **in forma degenere**, perché non esiste contenuto codificato da risolvere | Si dichiara, non si conta come verifica. Va rifatto quando il contenuto codificato entra, e la nota va scritta nello stesso momento in cui il criterio viene marcato |
| **Proprio del traguardo - la verifica manuale di accessibilità viene chiamata valutazione formativa** | È la forma di debito regolatorio più costosa: registrazione formalmente presente e sostanzialmente vuota | Il nome corretto è fissato al criterio 7 e va usato in ogni artefatto, comprese le note di rilascio |

---

## 11. Che cosa `T-08` non comprende

### 11.1 Per dichiarazione del traguardo

**Non è il primo rilascio installabile.** Non ha manuale di installazione ed esercizio, non ha
pacchetti di distribuzione verificati, non ha il fascicolo che accompagna il rilascio. Quello è
`T-10`, al 30 novembre 2026, e i suoi criteri bloccanti sono in blocco quelli di
[03 §8](../../docs/09_roadmap/03-primo-rilascio-utilizzabile.md).

### 11.2 Per effetto dei tagli già dichiarati

Non comprende: refertazione e documento firmato (`TG-01`); facciata di interoperabilità (`TG-02`);
componente incorporabile e tema personalizzato (`TG-03`); broker di eventi (`TG-04`); gateway
terminologico attivo (`TG-05`); accesso d'emergenza (`TG-06`); oscuramento applicato dal motore con
i sei canali di inferenza chiusi (`TG-07`); profilo su orchestratore (`TG-08`); cruscotti versionati
(`TG-09`); interfaccia di amministrazione (`TG-10`); migrazioni per tenant non bloccanti (`TG-11`);
profili di rete intermedi (`TG-12`); misura automatica della latenza da obiettivo a schermo
(`TG-13`); ancoraggio periodico firmato (`TG-23`, irreversibile per il periodo); teleconsulto e
telemonitoraggio nel percorso verticale (`S-8`).

### 11.3 Per conseguenza, e va registrato

- **Le verifiche obbligatorie dell'area architetturale che presuppongono il broker** - in
  particolare quelle sulla scrittura diretta e sull'attraversamento del segnalamento - vanno
  rilette nell'assetto senza broker di `TG-04`. La rilettura è un atto, non una deduzione: finché
  non è registrata, quelle verifiche risultano attese e non producibili.
- **I sei canali di inferenza dell'oscuramento non sono esercitati** (`TG-07`): la loro chiusura
  resta una proprietà di progettazione non ancora provata, e va dichiarata così.
- **Il divieto per il profilo del pagatore amministrativo è una convenzione verificata da prova e
  non un confine strutturale**, perché il contesto autonomo della rendicontazione è decisione
  rinviata (`C-1`). La differenza è dichiarata e non attenuata.

---

## 12. Contraddizioni fra documenti trovate durante la stesura

Registrate, non corrette. Ciascuna appartiene a un'area che questo piano non tocca.

1. **[00 §8.4] «nove traguardi di classe `A`, `B` e `C`».** I traguardi di classe `A`, `B` e `C` del
   capitolo 02 sono **cinque** - `T-01`, `T-03`, `T-14`, `T-04`, `T-05`. Nove è il numero dei
   traguardi che occupano il calendario residuo (§4.1) e delle barre critiche su dieci (§7). La
   soglia del 19 ottobre 2026 è quindi enunciata su un insieme che non esiste, e va riformulata
   dalla revisione competente. Questo piano si aggancia alla **data**, che è chiara, e non
   all'insieme.
2. **[05 §2.1] «Sono sette» righe dell'ordine di sacrificio.** Dopo la revisione del 26 agosto 2026
   le righe effettivamente disponibili sono **sei** - `S-1`…`S-6` - perché `S-7` è già stato
   eseguito e `S-8` è già applicato al criterio 6 di `T-08`. L'indicatore anticipatore di `R-28`
   sovrastima di uno.
3. **[02 §1 contro 00 §4] stato della guida dei fondamenti.** Il capitolo 02 dichiara che «della
   guida dei fondamenti mancano due moduli su ventuno, il glossario e le fonti primarie»; il
   capitolo 00 la dichiara «Completa: ventuno moduli, `00`-`20`, glossario e fonti primarie
   compresi». Ne discende che il criterio 1 di `T-02` e il taglio `TG-16` insistono su artefatti
   che un altro documento dichiara esistenti.
4. **[02 §1 contro 00 §4] stato della versione inglese.** Il capitolo 02 dichiara che «la versione
   inglese dei documenti non esiste»; il capitolo 00 dichiara quattro aree complete su dodici e
   439.982 parole su 860.718.
5. **[`R-20` contro `T-08` criterio 4 contro `03 §5`] il terzo strato del registro.** `R-20`
   dichiara due strati su quattro; il criterio 4 ne nomina due; `03 §5` dichiara come taglio il
   solo ancoraggio. **La copia su archivio a sola scrittura non è né consegnata né tagliata.**
   Dettaglio al §5.3.
6. **[`TG-23` contro area architetturale] la verifica «da ancoraggio» e la rimozione per
   segmenti.** Entrambe sono definite rispetto agli ancoraggi, che `TG-23` toglie. Nessun documento
   dichiara il sostituto. Dettaglio al §5.3 e al §9.2 voce 2.
7. **[`T-04` innesco contro `T-03` eccezione contro `D18`].** `T-04` ha per innesco l'esistenza
   della pipeline di `T-03`; `T-03` esclude dal proprio perimetro il codice usa-e-getta di `T-04`
   dichiarandolo eccezione a `V-182`; `D18` colloca la prima verifica nella prima settimana di
   sviluppo, prima di ogni altra attività. Le tre affermazioni sono conciliabili solo leggendo «la
   prima settimana di sviluppo» come la settimana successiva alla chiusura di `T-03`, che è
   esattamente la finestra 26 settembre - 3 ottobre. La lettura funziona, ma **non è scritta da
   nessuna parte**, ed è il presupposto su cui poggia il piano di `T-04`.

---

## 13. Vincoli che questo piano non tocca, e che valgono comunque

- **Nessun dato reale di paziente**, in nessuna forma, in nessun ambiente: si genera, non si
  anonimizza, e gli identificativi sintetici sono costruiti in modo da non poter coincidere con
  identificativi attribuiti a persone.
- **Nessun segreto**: soltanto segnaposto `${VARIABILE_AMBIENTE}`, e i riferimenti a segreto
  risolti a runtime da un gestore, mai valori nella configurazione applicativa.
- **Nessuna soglia clinica cablata**: nel percorso della televisita non ne esiste alcuna; la soglia
  di qualità è tecnica ed è configurazione per tenant.
- **Nessuna terminologia sotto licenza** versionata o scaricata: il gateway è disattivato per
  impostazione predefinita e il percorso funziona senza, in forma degenere dichiarata.
- **L'assenza di dato è informazione**: il contatto non passa a concluso senza un esito dichiarato
  da un professionista; nessuna chiusura automatica per scadenza produce un esito clinico; il
  diniego di accesso produce una voce di registro.
- **Il progetto non appone marcatura CE**, `T-08` non modifica questa condizione, e nessun
  artefatto prodotto da questo traguardo è utilizzabile per l'erogazione di prestazioni sanitarie
  su pazienti reali.
