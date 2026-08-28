# P2 - Protocollo di validazione del token in ingresso al confine di autorizzazione

**Artefatto** `P2` del piano [`T-04`](../.telemedic/piani/T-04-verifiche-empiriche.md) § 3 ·
**Serve** il criterio 1 di `T-04` ([`docs/09_roadmap/02-traguardi.md`](../docs/09_roadmap/02-traguardi.md))
**Prodotto prima** dell'apertura della finestra del 26 settembre 2026, e non durante

> **Che cosa è questo documento.** È il protocollo scritto della validazione che il confine di
> autorizzazione esegue sul token presentato dall'integratore: quali controlli, in quale ordine, e
> che cosa produce ciascun fallimento. Descrive **che cosa il codice dovrà fare e su che cosa sarà
> giudicato**.
>
> **Che cosa questo documento non è.** Non è codice e non ne contiene, nemmeno usa-e-getta. Non è
> una specifica di interfaccia pubblica: la superficie che l'integratore vede è descritta in
> [`docs/04_protocols/06-api-di-progetto.md`](../docs/04_protocols/06-api-di-progetto.md). Non
> decide la forma del token interno, che è la questione aperta `Q-135` verso l'area di
> architettura.
>
> **Perché esiste prima e non dopo.** Un protocollo scritto dopo che il codice esiste descrive il
> codice, non lo giudica. La finestra di `T-04` dura sette giorni e la sua massa critica è la
> scrittura, non l'esecuzione: ciò che non è scritto prima si scrive dentro la finestra, e ciò che
> si scrive dentro la finestra si scrive guardando il comportamento ottenuto.

---

## 1. Dove si applica, e perché il confine è uno solo

Il confine di autorizzazione è **unico e sta all'ingresso**: nessuna richiesta raggiunge un
contesto delimitato senza averlo attraversato, e nessun contesto ripete la validazione del token.
La ripetizione darebbe l'illusione della difesa in profondità e produrrebbe, in pratica, versioni
divergenti della stessa logica, che è il modo ordinario in cui una validazione si indebolisce
senza che nessuno la indebolisca. Il vincolo è di
[`docs/01_technical/02-backend.md`](../docs/01_technical/02-backend.md) § 3 e questo protocollo lo
recepisce senza modifiche.

Lo scambio è realizzato **nel gateway del progetto**, non delegato al prodotto di federazione, la
cui funzione corrispondente era in stato di anteprima al momento della ricerca e su cui `D18`
vieta di dipendere. Ne discende che il percorso di validazione qui descritto è **codice di
sicurezza scritto in proprio**, con gli obblighi che il resto del codice non ha: prove di abuso
dedicate, copertura sostanzialmente totale sul percorso di validazione, e una revisione esterna
indipendente che nel periodo di `RU-1` **non è producibile** ed è dichiarata assente
(`TG-20`, `TG-21`). Questa verifica accerta il **comportamento**; non rivede il codice, e la
differenza va scritta nell'esito invece di essere attenuata.

L'insieme delle configurazioni su cui il protocollo si applica è
[`P1`](./P1-configurazioni-supportate.tsv), ed è chiuso. Le dieci righe con claim dell'attore
obbligatorio sono quelle in cui un token proviene da un emittente esterno; le sette righe
rimanenti non presentano alcun token esterno da validare, e per esse questo protocollo non ha
oggetto - hanno invece la propria prova negativa di irraggiungibilità, che `P1` descrive.

---

## 2. I cinque controlli, nel loro ordine dichiarato

I cinque controlli sono quelli del piano di `T-04` e di
[`docs/01_technical/02-backend.md`](../docs/01_technical/02-backend.md) § 3, punto 1. Non sono
riformulati, non sono ridotti e non ne sono aggiunti. Il token in ingresso è validato **per intero
prima di qualunque altra cosa**: prima della risoluzione del tenant applicativo, prima della
mappatura dei claim, prima di qualsiasi lettura di configurazione che non serva alla validazione
stessa.

| # | Controllo | Che cosa accerta |
|---|---|---|
| 1 | **Firma** verificata su chiave risolta dal materiale pubblico **dichiarato per quel tenant** | Che il token sia stato emesso da chi dice di essere, e che non sia stato modificato dopo l'emissione |
| 2 | **Emittente atteso** | Che l'emittente sia l'ancora di fiducia registrata **per il tenant del client chiamante**, e non un emittente fidato per qualcun altro |
| 3 | **Destinatario atteso** | Che il token sia stato emesso per questo sistema, e non intercettato da un sistema per cui era destinato altrove |
| 4 | **Finestra temporale** con **tolleranza dichiarata** | Che il token sia dentro il proprio periodo di validità, con lo scarto di orologio ammesso e nessuno di più |
| 5 | **Identificativo di chiave** nell'insieme consentito **per quel tenant** | Che la chiave usata sia una di quelle registrate per quell'ancora di fiducia, e non una scelta dal chiamante |

### 2.1 Controllo 1 - la firma, su chiave risolta dal materiale dichiarato per quel tenant

La chiave con cui la firma si verifica **non si prende dal token**. Si prende dal materiale
pubblico registrato per l'ancora di fiducia del tenant a cui il client chiamante appartiene.
L'indirizzo dell'insieme di chiavi è su **elenco esplicito per tenant**: un indirizzo arbitrario
letto nell'intestazione di un token è, insieme, una superficie di richiesta verso risorse interne
e un vettore di confusione di chiavi, e non va mai seguito ciecamente. Se il valore presente
nell'intestazione non coincide con quello registrato, la richiesta è **rifiutata**, non corretta e
non ignorata.

Tre proprietà appartengono a questo controllo e non sono un sesto controllo travestito, perché
senza di esse la firma non è verificata affatto:

- l'algoritmo è preso da un **elenco esplicito**, mai dal token;
- l'algoritmo nullo non è mai accettato, in nessuna configurazione e per nessun tenant;
- un algoritmo simmetrico applicato a una chiave pubblica non è mai accettato.

Un token con algoritmo nullo che «superasse» la verifica della firma non ha superato una verifica:
non ne ha eseguita alcuna. Chi ritenesse che queste tre proprietà costituiscano un controllo
autonomo modificherebbe l'enumerazione dei cinque su cui il criterio 1 di `T-04` è scritto: la
questione appartiene a `SEC`, che possiede il modello di minaccia, e va chiusa prima della finestra
e non dentro.

La cache dell'insieme di chiavi ha una durata dichiarata; il recupero forzato avviene **solo** su
identificativo di chiave sconosciuto ed è limitato in frequenza, perché un identificativo casuale
generato in serie non diventi un amplificatore di traffico verso l'infrastruttura di un terzo. È
lo stesso registro unico della questione `Q-161`.

### 2.2 Controllo 2 - l'emittente atteso, e la parola «atteso»

«Atteso» non significa «presente in un elenco di emittenti fidati». Significa: **l'ancora di
fiducia registrata per il tenant del client che sta chiamando**. Il legame è client verso tenant
verso ancora di fiducia, ed è la sola via ammessa. Senza questa relativizzazione, un integratore
potrebbe presentare un'asserzione emessa dall'emittente di un altro integratore, formalmente valida
e firmata da una chiave legittima, ottenendo un token per un'identità che non gli appartiene.

È il controllo che intercetta il riuso fra tenant, ed è la ragione per cui un elenco globale di
emittenti fidati - la forma che una realizzazione ragionevole produce per prima - è un difetto e
non una semplificazione.

### 2.3 Controllo 3 - il destinatario atteso

Il destinatario non è cosmetico. Un server di autorizzazione che non lo valida consente a un
server di risorse ostile di farsi emettere token validi per sé, e la specifica dell'avvio
applicativo clinico motiva il parametro corrispondente proprio con la prevenzione della fuga di un
token genuino verso un server di risorse contraffatto. La postura predefinita del progetto va oltre
il minimo: ogni token porta un destinatario esplicito, e **un server di risorse che non si
riconosce nel destinatario rifiuta**, invece di accettare qualunque token emesso dal proprio
emittente.

### 2.4 Controllo 4 - la finestra temporale, con la tolleranza dichiarata

Si verificano l'istante di scadenza e l'istante di inizio della validità, e l'istante di emissione
quando presente. La tolleranza ammessa per lo scarto di orologio è **configurazione con un valore
predefinito dichiarato, mai una costante**: è la regola generale del progetto sui valori, ed è
richiamata qui perché la tolleranza temporale è il parametro che, cablato, sopravvive più a lungo
di ogni altro. Il § 5 la tratta per esteso.

### 2.5 Controllo 5 - l'identificativo di chiave nell'insieme consentito per quel tenant

L'identificativo di chiave presente nell'intestazione del token è **ingresso non fidato**: serve a
scegliere fra le chiavi **già consentite** per quel tenant, non a indicare quale chiave andare a
prendere. Se non appartiene all'insieme consentito, la richiesta è rifiutata. La qualificazione
«per quel tenant» ha lo stesso peso che ha nel controllo 2: una chiave consentita per l'ancora di
fiducia di un tenant non è consentita per un altro, e trattare l'insieme come globale riapre per
la chiave la stessa porta che il controllo 2 chiude per l'emittente.

### 2.6 L'ordine dichiarato e l'ordine di esecuzione, che non coincidono

Va detto invece di essere lasciato scoprire a chi scriverà il codice. **I cinque controlli sono
enumerati in un ordine che non è integralmente eseguibile in quell'ordine.** La verifica della
firma - controllo 1 - richiede che una chiave sia già stata scelta, e la scelta della chiave è il
controllo 5. Preso alla lettera, l'ordine dichiarato chiede di verificare una firma prima di sapere
con che cosa verificarla.

La conciliazione non è un'inversione dei due controlli, ed è la seguente. Il controllo 5 ha **due
momenti**, e sono entrambi necessari:

1. **prima di qualunque operazione crittografica**, l'identificativo di chiave letto
   dall'intestazione è confrontato con l'insieme consentito per il tenant del client chiamante; se
   non vi appartiene, la richiesta è respinta e nessuna operazione crittografica viene eseguita;
2. **dopo la verifica della firma**, si asserisce che la chiave che ha effettivamente verificato la
   firma è quella selezionata al passo precedente, e non un'altra risolta per un percorso
   alternativo.

L'ordine di esecuzione è dunque: momento 1 del controllo 5, controllo 1, controllo 2, controllo 3,
controllo 4, momento 2 del controllo 5. L'ordine dichiarato dei cinque resta quello del piano e del
capitolo tecnico, e questo documento non lo modifica: dichiara che il primo dei cinque ha un
prerequisito appartenente al quinto, e lo rende esplicito perché una realizzazione che leggesse
l'elenco alla lettera risolverebbe la chiave dall'intestazione del token - cioè esattamente il
difetto che il controllo 5 esiste per impedire.

Il secondo momento non è ridondante. Serve a intercettare la classe di difetti in cui la
selezione della chiave e la verifica della firma sono eseguite da due componenti diversi, e il
secondo non usa il risultato del primo: è il modo in cui una libreria di validazione, invocata con
i valori predefiniti, torna a fidarsi dell'intestazione dopo che il codice chiamante aveva già
deciso di non fidarsene.

La formalizzazione di questa lettura appartiene a `SEC` e a `TECH`, che possiedono rispettivamente
il modello di minaccia e il capitolo del confine di autorizzazione. Chi la contesti lo faccia prima
della finestra: dentro la finestra, l'ordine di esecuzione è già nel codice.

### 2.7 Che cosa non appartiene a questo confine

**Il livello minimo richiesto per l'operazione non si verifica qui.** Il confine accerta chi è il
chiamante, con quale garanzia e per conto di chi; se quella garanzia basti per **questa**
operazione è una decisione che avviene nel **punto di decisione** e non nel gateway. La
distinzione è del capitolo tecnico ed è recepita qui perché la sua violazione produce un difetto
sottile: un gateway che rifiutasse per livello insufficiente restituirebbe un tentativo respinto là
dove il fatto da registrare è un accesso negato a un'operazione, con l'attore risolto e la risorsa
nota. Sono due righe di tracciamento diverse e non intercambiabili.

Non appartengono a questo confine nemmeno l'autorizzazione fondata sulla relazione di cura,
l'introspezione sulle operazioni ad alto impatto, e il token d'ingresso a uso singolo con cui
l'integratore avvia la sessione, che è il criterio 2 di `T-04` e ha il protocollo `P4`.

---

## 3. Che cosa produce un fallimento, e come la differenza si rende verificabile

**Un token che non superi anche uno solo dei cinque controlli non produce un token interno e non
produce una registrazione di accesso: produce un tentativo respinto, che finisce nel
tracciamento.** L'enunciato è del piano e del capitolo tecnico. Questo paragrafo lo rende
verificabile, perché il piano dichiara che «la differenza fra le due cose è essa stessa oggetto di
asserzione» e una differenza asserita deve prima essere definita.

### 3.1 Le due cose, definite in modo da poterle distinguere

Una **registrazione di accesso** è una riga del registro immutabile che afferma che un soggetto
identificato ha compiuto un'operazione su una risorsa riferita a un assistito: porta un attore
risolto a un'identità interna, un oggetto con il suo riferimento e il soggetto interessato, e un
esito. È la riga che risponde alla domanda «l'assistito X è stato consultato dal professionista
Y», e la sua esistenza afferma che quella consultazione è avvenuta.

Un **tentativo respinto** è una riga del registro che afferma che qualcuno ha presentato una
credenziale che non è stata accettata. Non ha un attore risolto, perché non c'è stata alcuna
risoluzione; non ha un oggetto né un soggetto interessato, perché nessuna risorsa è stata
raggiunta. Porta i descrittori **presentati** - e presentati significa non verificati - insieme
all'indicazione di quale controllo ha respinto la richiesta.

Le due righe convivono nella stessa struttura in sola aggiunta e nella stessa catena di impronte:
un tentativo respinto è una riga, non un silenzio, e le righe di esito negativo sono spesso più
informative di quelle positive perché descrivono ciò che qualcuno ha provato a fare.

### 3.2 Le sei asserzioni, per ciascun caso di abuso

Per ciascuno dei sette casi di [`P3`](./P3-casi-di-abuso.tsv), la verifica asserisce tutte e sei
le proposizioni seguenti. Sono formulate al negativo dove il negativo è ciò che conta, perché è
l'assenza che va dimostrata e l'assenza non si dimostra guardando ciò che c'è.

1. **Nessun token interno è emesso.** Non «non è restituito al chiamante»: non è **emesso**. La
   distinzione è materiale, perché un token emesso e non restituito è un token che esiste, che è
   finito in un registro applicativo e che qualcuno potrà usare.
2. **Nessuna registrazione di accesso esiste**, cioè nessuna riga con esito positivo e con un
   oggetto riferito a un assistito compare per quella richiesta.
3. **Esiste esattamente una riga di tentativo respinto.** Esattamente una: zero è il silenzio che
   il progetto vieta, e più di una è un difetto di doppio conteggio che falsa l'indicatore di
   rilevazione costruito su queste righe.
4. **Nessuna identità interna è creata o risolta** per il soggetto presentato. È l'asserzione che
   distingue un rifiuto da un rifiuto tardivo: una realizzazione che risolva prima e rifiuti poi
   lascia dietro di sé un'anagrafica popolata da chiunque abbia presentato un token non valido.
5. **La riga non contiene il token, la chiave, né alcun contenuto clinico.** Un token in un
   registro è un token compromesso, e il vincolo `V-150` non ammette eccezioni per le righe di
   errore.
6. **La risposta al chiamante non distingue quale controllo ha respinto la richiesta**, secondo il
   § 3.4.

### 3.3 Che cosa la riga di tentativo respinto contiene

Contiene ciò che serve a diagnosticare e a rilevare, e nulla che serva ad attaccare. In
particolare: l'istante; il tenant, quando risolvibile dal client autenticato, e l'indicazione
esplicita che non lo era quando non lo è; l'identificativo del client autenticato, quando
l'autenticazione del client è riuscita; il controllo che ha respinto la richiesta, in forma di
codice; l'emittente presentato, il destinatario presentato e l'identificativo di chiave presentato,
tutti e tre marcati come **non verificati**; l'identificativo di correlazione della richiesta;
l'esito.

Non contiene il token, né in chiaro né in forma troncata - un frammento di token è ancora un
segreto parziale e la sua utilità diagnostica non giustifica il rischio - né alcun identificativo
diretto di assistito, che su un tentativo respinto non esiste comunque, non essendo stata
raggiunta alcuna risorsa.

I tre descrittori presentati vanno marcati come non verificati in modo che la marcatura sia leggibile
da chi consulta il registro e non solo da chi ne conosce la convenzione. Un emittente registrato
accanto a un tentativo respinto e non qualificato come «dichiarato dal chiamante» è
un'affermazione falsa scritta in un registro immutabile: dice che quell'emittente ha emesso quel
token, mentre l'unica cosa accertata è che qualcuno lo ha scritto in un campo.

### 3.4 La risposta al chiamante non distingue, e la tensione che questo produce

La risposta restituita a chi ha presentato il token **non dichiara quale dei cinque controlli ha
respinto la richiesta**, e ha forma identica per tutti i casi di abuso, salvo l'identificativo di
correlazione. La ragione è che un errore che distingue è un oracolo: consente di stabilire per
tentativi successivi quale emittente sia atteso, quale destinatario, quale insieme di chiavi sia
consentito e quale finestra temporale sia ammessa, cioè di ricostruire per interrogazione la
configurazione di fiducia di un tenant. È la stessa disciplina per cui la revoca risponde con esito
positivo anche su un token già invalido, e per cui su una risorsa riferita a un assistito un
chiamante privo del diritto riceve «non trovato» invece di «vietato».

**La tensione con il catalogo degli errori esiste e non si smussa.** Il progetto ha scelto un
catalogo degli errori servito e risolvibile, che «trasforma un errore in un'istruzione e abbatte il
carico di assistenza»; qui la stessa scelta produrrebbe l'oracolo. Le due esigenze si conciliano su
un solo punto, ed è l'identificativo di correlazione: la risposta lo porta, la riga di tracciamento
lo porta, e la diagnosi dell'integratore in buona fede avviene mettendoli in relazione attraverso il
canale di assistenza, che è autenticato e che l'attaccante non ha. Il costo è reale e va dichiarato
a chi integra: **la diagnosi di un fallimento di validazione richiede un passaggio in più**, e non è
una svista dell'interfaccia. La formulazione contrattuale di questo passaggio appartiene a `INTEG`,
che possiede il rapporto con l'integratore, e a `SEC`.

Resta da fissare, prima della finestra, **su quale superficie la risposta viene resa** - risposta
di errore del punto di emissione dei token, oppure rappresentazione del problema sul piano
applicativo - perché la scelta dipende dalla forma del token interno e quindi dalla questione
aperta `Q-135`. `P3` registra per ciascun caso le due forme possibili invece di sceglierne una.

---

## 4. Il livello di garanzia è qualificato dalla provenienza

Un livello di garanzia in un token può significare due cose radicalmente diverse: che
l'autenticazione **è stata eseguita** dal sistema, che ha visto l'asserzione del fornitore
d'identità e ne ha verificato la firma; oppure che il livello **è riferito** dall'integratore, che
afferma di aver autenticato l'utente a quel livello nel proprio dominio. Sono due fatti con forza
probatoria diversa. **Copiare il livello del token in ingresso nel token emesso senza qualificarlo
farebbe apparire come verificata dal progetto un'autenticazione che il progetto non ha eseguito**,
e in un sistema il cui registro deve rispondere alla domanda «chi ha garantito l'identità di questa
persona» è la differenza fra un registro utile e uno ingannevole.

Ne discendono due regole che questo protocollo impone, e una conseguenza che appartiene al punto di
decisione e non al confine.

**Prima regola.** Il token interno emesso porta la qualificazione della provenienza del livello, e
la porta in modo che sia leggibile **dal token soltanto**, senza contesto esterno. Un consumatore
che riceva il token e nient'altro deve poter stabilire se il livello sia stato eseguito o riferito.

**Seconda regola.** Il valore asserito dall'integratore è **conservato alla lettera** e non viene
perso nella qualificazione. Perderlo renderebbe impossibile ricostruire che cosa l'integratore
avesse dichiarato, che è il fatto su cui la responsabilità dell'integratore si misura.

**La conseguenza, che non è di questo confine.** Un'operazione che la normativa lega
all'autenticazione forte richiede un livello **eseguito**, e un livello riferito non la soddisfa per
quanto elevato sia il valore asserito. La verifica avviene nel punto di decisione. Il confine deve
soltanto rendere impossibile che il punto di decisione **non possa** distinguere: se la
qualificazione non è nel token, la decisione a valle sarà sbagliata anche se il codice a valle è
giusto.

### 4.1 Una divergenza fra due capitoli del progetto, dichiarata

I due capitoli che descrivono questo marcatore **non concordano sulla sua forma**, e la
constatazione è verificabile sul testo.

[`docs/04_protocols/08-identita-e-autorizzazione.md`](../docs/04_protocols/08-identita-e-autorizzazione.md)
§ 5.2 mostra un token in cui il claim standard del contesto di autenticazione porta **il valore
nazionale asserito dall'integratore**, affiancato da un claim di progetto che ne dichiara l'origine.
[`docs/06_security/02-identita-e-accessi.md`](../docs/06_security/02-identita-e-accessi.md) § 4
mostra un token in cui lo stesso claim standard porta **un valore proprio del progetto** che
significa «asserito dall'emittente», e il valore nazionale asserito è conservato dentro una
struttura di provenienza insieme all'indicazione che il progetto non l'ha verificato.

Le due forme non sono equivalenti per un consumatore esterno. Nella prima, un consumatore che legga
soltanto il claim standard - cioè il comportamento predefinito di qualunque libreria - **legge un
livello nazionale e non vede la qualificazione**: la regola è rispettata dal token e violata dal
lettore ordinario. Nella seconda, lo stesso consumatore legge un valore che non riconosce e, se è
scritto bene, rifiuta; se è scritto male, lo ignora. La prima forma è più interoperabile e più
facile da fraintendere; la seconda è più sicura e rompe i consumatori che non la conoscono.

Questo protocollo **non sceglie**, perché la scelta appartiene alle due aree che possiedono i due
capitoli, e sceglierla qui la nasconderebbe in un artefatto di verifica. Fissa invece le tre
proprietà che la prova asserisce **in entrambe le forme**, così che la scelta possa arrivare senza
riscrivere le asserzioni: dal solo token si stabilisce se il livello sia eseguito o riferito; il
valore asserito dall'integratore è presente e alla lettera; nessuna configurazione produce un token
in cui un livello riferito sia indistinguibile da uno eseguito. **La scelta della forma va chiusa da
`SEC` e `PROTO` prima dell'apertura della finestra**: dentro la finestra verrebbe presa da chi
scrive la prima riga di codice, e sarebbe una decisione di interoperabilità presa per comodità di
scrittura.

Va conservata, sempre e per entrambe le forme, la coppia composta dal livello **richiesto** e dal
livello **asserito**, perché il livello propagato è quello richiesto e non quello asserito; sul
canale dell'identità elettronica su documento il livello asserito è dichiarato costante e quindi non
informativo, e la verifica empirica di quella dichiarazione è fra le tre **rinviate** dal criterio 5
di `T-04`. Finché il rinvio è aperto, nessuna documentazione pubblica descrive il meccanismo di
inoltro: la regola resta in vigore anche se la verifica non si fa, ed è il punto che il criterio 5
esiste per non far dimenticare.

---

## 5. La delega si rappresenta con il claim dell'attore, mai sostituendo il soggetto

**Impersonificazione** è presentare il solo token del soggetto: il token risultante rende
l'integratore indistinguibile dall'utente, e il registro annota soltanto «il professionista X ha
fatto Y», perdendo «per il tramite del sistema Z». **Delega** è un token che contiene entrambe le
identità, con l'attore espresso nel claim dedicato di RFC 8693 § 4.1. La differenza è sostanziale in
sede di indagine: la delega dice «X ha operato per conto di Y», l'impersonificazione dice «era Y», e
cancella la responsabilità reale.

Il protocollo impone quattro regole sull'emissione, e la quarta è quella che una realizzazione
ragionevole non scrive.

1. **Il soggetto del token interno è derivato in modo deterministico** dall'emittente e dal soggetto
   del token in ingresso. Non è inventato dal progetto, e non è l'identificativo del client: due
   professionisti omonimi di due integratori diversi non collidono, e il progetto non diventa
   l'anagrafe delle identità.
2. **L'attore è calcolato dall'identità del client autenticato**, e non è mai copiato da un claim
   del token in ingresso. Un attore copiato è un attore dichiarato dal chiamante, cioè esattamente
   ciò che il claim esiste per non essere.
3. **La catena annidata è preservata** quando il token in ingresso porta a sua volta un attore, e
   l'attore più esterno resta il client autenticato.
4. **Un attore presente nel token in ingresso, quando l'ancora di fiducia del tenant non dichiara
   quell'emittente abilitato ad asserire catene di delega, fa rifiutare la richiesta**; non viene
   rimosso in silenzio. Rimuoverlo in silenzio farebbe sparire il fatto che qualcuno ha asserito
   una delega che non era abilitato ad asserire, che è precisamente l'evento da registrare. È la
   stessa disciplina a fallimento chiuso che il progetto applica alla revoca dei certificati, ed è
   una **proposta di questo protocollo** che `SEC` e `PROTO` confermano o correggono prima della
   finestra.

### 5.1 L'asserzione negativa che rende la regola dimostrabile

Per ogni riga di `P1` con claim dell'attore obbligatorio, la prova asserisce che il token emesso
porta il claim dell'attore **e** che il valore dell'attore è **diverso** dal valore del soggetto.
La seconda metà non è pleonastica: un token in cui attore e soggetto coincidono è
un'impersonificazione che ha superato un controllo di presenza del claim, e un controllo di
presenza è ciò che una realizzazione scrive per prima quando legge il criterio. Il criterio chiede
che nessuna configurazione produca un token **privo** del claim; questa asserzione aggiunge che
nessuna configurazione ne produca uno in cui il claim c'è e non significa nulla.

La prova negativa vera e propria - «non esiste percorso che produca un token privo del claim» - è
vista fallire su una configurazione deliberatamente alterata, secondo la disciplina del progetto per
cui un controllo che nessuno ha visto fallire non è un controllo.

---

## 6. La tolleranza temporale è configurazione, e questo protocollo dice quale

La tolleranza del controllo 4 è **un parametro di configurazione con un valore predefinito
dichiarato**, mai una costante. Il piano di `T-04` colloca fra i rischi propri del traguardo il caso
in cui «un valore comodo scritto nel codice dello spike sopravvive nel prodotto», e la tolleranza è
il candidato migliore: è piccola, sembra innocua, e nessuno la rilegge più.

**Le regole vincolanti, che non dipendono dal valore.**

- Il parametro è **uno solo** e si applica ai tre istanti del token - scadenza, inizio della
  validità, emissione - con lo stesso valore. Tre parametri distinti divergono, e la divergenza è
  sistematicamente a favore di chi attacca.
- Il valore **zero è ammesso e supportato**. Una realizzazione con un minimo implicito diverso da
  zero ha una costante cablata, comunque la si chiami.
- Esiste un **massimo ammesso**, e la configurazione che lo superi **è rifiutata all'avvio**, non
  ridotta in silenzio. Una configurazione corretta in silenzio è una configurazione che chi installa
  crede in vigore e non lo è.
- Il massimo ammesso è espresso **in rapporto alla più breve vita di token ammessa dal sistema**, e
  non come numero indipendente. Una tolleranza dello stesso ordine della vita del token rende il
  controllo 4 una formalità: raddoppia la finestra di rigioco senza che nulla nella configurazione
  lo dichiari.
- La deroga per tenant è ammessa **solo verso il basso**. Un tenant può essere più severo del
  valore predefinito, mai più permissivo.

**Il valore predefinito - proposta di progetto, non norma.** Trenta secondi. La derivazione, per
poterla contestare sul merito: la specifica dei servizi di backend indica trecento secondi come vita
raccomandata del token di sistema, ed è la più breve delle vite ammesse dal progetto; una tolleranza
di trenta secondi estende quella finestra di un decimo, che è dichiarabile, mentre una tolleranza di
qualche minuto la estenderebbe di una frazione che nessuno accetterebbe se fosse scritta come tale.
Sull'altro versante, lo scarto fra due orologi sincronizzati con un servizio di tempo di rete resta
sotto il secondo, e trenta secondi coprono con larghezza il caso in cui la sincronizzazione sia
degradata senza essere assente.

Il valore va confermato da `SEC`, che possiede il modello di minaccia, e da `TECH` per il massimo
ammesso in rapporto alla vita del token. Questo documento lo propone perché la finestra di `T-04` non
è il posto in cui deciderlo: un valore non deciso prima diventa il valore che compare nel codice
usa-e-getta, e il codice usa-e-getta non diventa il gateway ma i suoi numeri sì.

---

## 7. Che cosa questo protocollo non copre

Non copre il **token d'ingresso a uso singolo** alla sessione, che è il criterio 2 di `T-04` e ha il
proprio protocollo `P4`. Non copre la **decisione di autorizzazione** a valle - relazione di cura,
ruolo con validità temporale, livello minimo per operazione, accesso d'emergenza - che avviene nel
punto di decisione. Non copre l'**introspezione** sulle operazioni irreversibili o ad alto impatto,
né l'elenco di negazione distribuito con cui il progetto accorcia la finestra di revoca. Non copre
la **forma del token interno**, opaco o autoportante, che è `Q-135`. Non copre le **configurazioni a
identità di sistema e ad accesso diretto** di `P1`, che non presentano alcun token esterno da
validare e portano la propria prova negativa di irraggiungibilità.

Non copre, infine, la **revisione esterna indipendente** del codice di sicurezza critico che `D18`
prescrive: non è producibile nel periodo, è il taglio `TG-21`, ed è dichiarata assente nelle note di
rilascio. Questo protocollo descrive un comportamento e ne consente la verifica; non sostituisce
l'esame del codice da parte di un terzo, e presentarlo come tale sarebbe la formulazione di
conformità che il progetto vieta.

---

## 8. Le lacune dichiarate, in un elenco unico

Sono raccolte qui perché un artefatto prodotto prima della finestra vale per ciò che chiude e per
ciò che dichiara di non chiudere. Ciascuna porta chi deve chiuderla.

| # | Lacuna | Chi la chiude | Perché prima della finestra |
|---|---|---|---|
| 1 | La forma del marcatore di provenienza del livello, su cui i due capitoli del progetto divergono (§ 4.1) | `SEC` e `PROTO` | Dentro la finestra verrebbe scelta da chi scrive la prima riga di codice |
| 2 | Se le tre proprietà della verifica di firma - elenco esplicito degli algoritmi, divieto dell'algoritmo nullo, divieto del simmetrico su chiave pubblica - siano parte del controllo 1 o un controllo autonomo (§ 2.1) | `SEC` | Cambierebbe l'enumerazione dei cinque su cui il criterio 1 è scritto |
| 3 | Il rifiuto, invece della rimozione silenziosa, di un attore asserito da un emittente non abilitato a farlo (§ 5, regola 4) | `SEC` e `PROTO` | È una proposta di questo protocollo, non una regola già in vigore |
| 4 | Il valore predefinito della tolleranza temporale e il massimo ammesso in rapporto alla vita del token (§ 6) | `SEC` e `TECH` | Un valore non deciso prima è il valore che resta |
| 5 | La superficie su cui la risposta di rifiuto viene resa, che dipende dalla forma del token interno (§ 3.4) | Architettura, questione aperta `Q-135` | `P3` registra entrambe le forme invece di sceglierne una |
| 6 | La divergenza fra il vincolo `V-132`, che qualifica «quando l'identità proviene da un emittente esterno», e i criteri di roadmap che non lo qualificano | `PROTO` e `ROAD` | È dichiarata in `P1` e determina su quante righe corre il quantificatore |

---

## 9. Vincoli che valgono comunque su questa verifica

Nessun dato reale: identità, tenant, integratori ed emittenti usati sono sintetici e riconoscibili
come tali, su domini riservati. Nessun segreto: soli segnaposto nella forma
`${VARIABILE_AMBIENTE}`, per il materiale di chiave dei client di prova come per le credenziali
dell'istanza effimera. Nessuna soglia cablata: la tolleranza del controllo 4 è configurazione, e il
suo valore predefinito è dichiarato qui e non nel codice. Nessuna formula di conformità: questo
documento descrive che cosa il confine deve fare e come lo si giudica, e non afferma che il
progetto sia conforme ad alcunché. Le prove girano contro un'**istanza effimera**, mai contro un
ambiente condiviso. Il codice usa-e-getta con cui la verifica si esegue **non diventa il gateway di
`T-08`**: una verifica riuscita autorizza a progettare, non è progettazione.
