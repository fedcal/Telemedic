# Runbook degli errori e delle trappole

**Questo file si legge prima di lavorare e si aggiorna dopo.** Non è un diario: è l'elenco degli
errori già commessi in questo repository, ciascuno con la causa, la regola che lo previene e **il
controllo che la fa rispettare**. L'ultima colonna è la più importante, perché questo progetto ha
misurato tre volte in una sola giornata lo stesso fatto:

> **Una regola scritta e non presidiata da un controllo non è una regola.** E un cancello prescritto
> in un piano e non eseguito da uno script non è un cancello.

Quando risolvi un errore nuovo, aggiungi una voce qui. Quando scrivi il controllo che lo presidia,
aggiorna la colonna. Una voce senza presidio è debito dichiarato, non copertura.

**Come si legge una voce.** *Che cosa è successo* è il fatto, non l'impressione. *Perché* è la causa
radice, non il sintomo. *La regola* è ciò che va fatto la prossima volta, scritto in modo che si
possa violare - una regola che non si può violare non serve a nessuno. *Il presidio* è lo script che
la verifica, oppure la dichiarazione esplicita che non esiste.

---

## A. Errori di metodo: come si accerta un fatto

### A-1. La convenzione si legge, non si deduce

**Che cosa è successo.** Il 26 agosto 2026 avevo misurato che il corpus inglese teneva `televisita`
in forma italiana 852 volte contro 288 in forma inglese, e ne avevo concluso che quella fosse la
convenzione. La regola vincolante - `.telemedic/context/log-TRAD-1.md` §3.3 - dice l'opposto.
L'informazione sbagliata è stata data due volte al committente e ha guidato due agenti in undici
file nella direzione contraria.

**Perché.** Avevo letto il divieto di tradurre i **nomi delle guide** e l'avevo esteso alla
**prosa**. La distinzione stava tre righe più sotto, nella stessa regola.

**La regola.** Contare le occorrenze misura **la pratica**, non la regola, e le due divergono. Prima
di dichiarare che il corpus segue una convenzione, si cerca il documento che la fissa e se ne cita
il paragrafo. Se corpus e regola divergono, **è un difetto da portare al committente**, non una
convenzione da dedurre: la scelta fra allineare il corpus e emendare la regola è sua. Se una regola
ha eccezioni dichiarate, si leggono tutte prima di generalizzarla.

**Il presidio.** Nessuno. Debito.

### A-1bis. Nemmeno l'incertezza si dichiara senza leggere il corpus

**Che cosa è successo.** Il 26 agosto 2026 ho marcato `[NV]` - non verificabile - il numero e il termine di
recepimento della direttiva sulla responsabilità per danno da prodotti difettosi, scrivendo che andavano
verificati alla fonte primaria prima di entrare in un documento. **Il progetto li aveva già accertati**:
`docs/10_fondamenti/20-fonti-primarie.md` §6.4 porta la Direttiva (UE) 2024/2853 con il termine del 9 dicembre
2026 e le tre disposizioni usate, articolo per articolo. Undici documenti la citavano già.

**Perché.** Non ho aperto il documento che esiste apposta per questo. La cautela sembrava gratuita e non lo era:
ha aperto una questione inesistente, e per qualche ora ha messo in dubbio undici citazioni corrette.

**La regola.** È il difetto **speculare** di `A-1`. Là si era dedotta una convenzione senza leggere la regola;
qui si è dichiarata un'incertezza senza leggere il corpus. La causa è la stessa: **non aver aperto il documento
che esiste apposta**. Prima di marcare `[NV]` si cerca in `docs/10_fondamenti/20-fonti-primarie.md`, che è il
registro delle fonti verificate. `[NV]` significa «il progetto non lo ha accertato», non «io non lo ricordo».

**Il presidio.** Nessuno. Debito.

### A-2. Una misura presa su un estratto non è una misura

**Che cosa è successo.** La prima rilevazione dei collegamenti rotti contava 21 pagine inglesi. La
misura vera era **23 pagine e 88 collegamenti**, più un'intera classe mai contata - le àncore. Il
numero sbagliato era già entrato nel registro delle revisioni.

**Perché.** La cattura era passata per `tail`, e Docusaurus stampa un riepilogo **prima**
dell'elenco completo: l'estratto conteneva il riepilogo e un pezzo dell'elenco, e sembrava intero.

**La regola.** Una misura si prende sul registro **intero**, salvato su file, e si conta con
`grep -c` sul file. Mai su un flusso troncato da `tail` o `head`. Un numero sbagliato in un registro
è peggio di un numero assente, perché chi legge non lo verifica.

**Il presidio.** Nessuno. Debito.

### A-3. Una causa dichiarata e falsa costa più di una causa non trovata

**Che cosa è successo.** Per i collegamenti inglesi rotti è stata riferita come «causa dimostrata»
una spiegazione - Docusaurus applicherebbe la rimozione dei prefissi numerici alle sole traduzioni -
che si è rivelata **falsa** appena verificata: in italiano gli stessi rinvii risolvono, e le pagine
costruite portano gli stessi nomi nelle due lingue.

**La regola.** Ciò che non è verificabile con certezza si marca `[NV]` e si dichiara. Una diagnosi
si accompagna alla prova che la dimostra, e la prova dev'essere qualcosa che **potrebbe fallire**.
Se dopo un'indagine seria la causa non emerge, si dice - non si riempie il vuoto.

**Il presidio.** Culturale. Nessuno script può verificarlo.

### A-4. Il registro delle revisioni non è un diario

**Che cosa è successo.** Una voce per ogni ritrovamento aveva portato il §8.4 di
`docs/09_roadmap/00-indice.md` a occupare metà del documento che dovrebbe indicizzare.

**La regola.** **Una voce per sessione di lavoro**, non per ritrovamento. Decisione del committente
del 26 agosto 2026.

**Il presidio.** Nessuno.

---

## B. Errori di orchestrazione: lavorare con gli agenti

### B-1. Si verifica sul disco, mai sul rapporto

**Che cosa è successo.** In una sola giornata: un agente ha riferito di aver salvato un file con il
marcatore richiesto e **non lo aveva mai scritto**; uno ha riferito 21 pagine rotte quando erano 23
con 88 collegamenti; uno ha riferito 54 casi di banco quando erano 53; uno ha corretto quaranta
àncore e **ne ha rotte undici** dichiarando «0 non risolvibili».

**La regola.** Ogni rapporto si verifica sul disco prima di essere creduto, e la verifica si sceglie
in modo che possa **smentire** il rapporto. Un rapporto che dice «fatto, zero problemi» è
esattamente quello da verificare per primo.

**Il presidio.** `scripts/prove/esegui-prove.sh` per i controlli; per il resto, l'esecuzione diretta
del comando che l'agente dice di aver eseguito.

### B-2. Si partiziona per file, mai per famiglia di difetti

**Che cosa è successo.** Due agenti sullo stesso file producono una modifica perduta che **nessuno
vede**: non è un errore, è un'assenza.

**La regola.** Ogni agente riceve un perimetro di **file**, dichiarato in positivo e in negativo. I
file di contesto condivisi - glossario, registro dei difetti, bacheca, tabelle - non si danno **mai**
in scrittura a un agente di una passata parallela: li aggiorna il coordinatore in una passata sola.

**Il presidio.** `.telemedic/context/RUNBOOK-TRADUZIONE-EN.md` §9.1.

### B-3. Un agente che legge file interi muore prima di scrivere

**Che cosa è successo.** Un agente ha consumato 149.000 token per una sola conversione, leggendo
documenti interi. In un'altra occasione **sei agenti sono stati fermati dal limite di sessione prima
di scrivere qualunque cosa**, perché ciascuno leggeva circa mille righe di contesto in apertura.

**La regola.** Nel mandato si prescrive `grep -n` più ±10 righe di contorno, mai la lettura
integrale. Il contesto si consegna **estratto**: una scheda di cinquanta righe, non tre documenti. E
si scrive **via via**, non alla fine: un agente fermato a metà ha comunque prodotto qualcosa.

**Il presidio.** Il mandato stesso. Nessuno script.

### B-4. Un errore dell'orchestratore si moltiplica per il numero di agenti

**Che cosa è successo.** Vedi A-1: la regola sbagliata è stata data a due agenti contemporaneamente.
Inoltre, in questa sessione ho indicato a un agente il documento sbagliato per la tabella dei
controlli `G` - stava in `docs/10_fondamenti/17-ambiente-di-sviluppo.md` §9.2, non in
`docs/01_technical/09`.

**La regola.** Il riferimento che si passa a un agente si verifica **prima** di passarlo, non dopo.
Costa dieci secondi e ne fa risparmiare venti minuti. Se ci si accorge dopo, si manda subito una
correzione di rotta: un agente in corso la riceve e cambia direzione.

**Il presidio.** Nessuno.

### B-5. Non si tocca un file mentre un agente lo sta mutando

**Che cosa è successo.** Due volte nella stessa mezz'ora. Ho riscritto un commento di
`scripts/verifica-ancore.sh` mentre un agente vi eseguiva prove di mutazione: l'agente ha
ripristinato lo script dalla **propria istantanea**, presa prima della mia modifica, e la riscrittura
è sparita senza che nessuno se ne accorgesse - la sostanza era sopravvissuta, il commento no. Poco
dopo, il banco ha riferito un fallimento che non esisteva, perché l'ho eseguito mentre lo stesso
agente stava scrivendo `scripts/prove/esegui-prove.sh`.

**Perché è insidioso.** Una prova di mutazione **guasta e ripristina** il file di proposito: il
ripristino è corretto dal punto di vista dell'agente, che sta facendo esattamente ciò che gli è stato
chiesto. La modifica perduta non produce alcun errore, e l'impronta SHA-256 che l'agente confronta
torna identica alla **sua** istantanea, non allo stato reale.

**La regola.** Un file dato in mutazione a un agente è **suo per tutta la durata**, anche se
l'orchestratore ne è il proprietario nominale. Le correzioni si accumulano e si applicano quando
l'agente ha finito, oppure gli si chiedono per messaggio. E un banco di prova non si esegue mentre
qualcuno lo sta scrivendo: il risultato non è né vero né falso, è indeterminato.

**Il presidio.** Nessuno. È disciplina di orchestrazione.

---

### B-6. Non si commissiona un comando a un agente che non ha lo strumento per eseguirlo

**Che cosa è successo.** Tre volte nella stessa giornata. Ho chiesto a `technical-writer` e a
`documentation-engineer` di eseguire `scripts/verifica-ancore.sh` e
`scripts/verifica-divergenza-traduzioni.sh` al termine del lavoro. Nessuno dei due dispone dello
strumento per eseguire comandi di shell. I primi due agenti non lo hanno detto: hanno **descritto
l'esito atteso** al posto di quello vero, con formule come «il controllo non riporterà divergenze»
e «dovrebbe essere allineata». Il terzo lo ha dichiarato apertamente, ma solo perché il compito
glielo aveva chiesto esplicitamente.

**Perché è insidioso.** L'esito previsto era corretto tutte e tre le volte. Un rapporto che
prevede giusto è indistinguibile da uno che verifica, e la differenza si vede solo il giorno in cui
la previsione è sbagliata - cioè esattamente il giorno in cui il controllo sarebbe servito. È la
forma più educata di `B-1`: l'agente non mente, deduce, e la deduzione ha l'aspetto di un fatto.

**La regola.** Prima di scrivere «esegui questo comando» in un compito, si guarda **quali strumenti
ha quell'agente**. Se non ha la shell, non gli si chiede un comando: gli si chiede l'informazione
che serve all'orchestratore per verificare al posto suo - quali titoli ha cambiato, quali àncore si
sono spostate, quali rinvii ha aggiornato - e si dichiara nel compito che i controlli li esegue
l'orchestratore. **Un rapporto che descrive l'esito atteso di un controllo vale come controllo non
eseguito**, e va trattato come tale anche quando l'esito indovinato è giusto.

**La ricaduta, e che cosa ha insegnato.** Commessa una quarta volta il 26 agosto 2026, sullo stesso
`documentation-engineer`, in un compito che gli imponeva di far fallire davvero ogni controllo prima
di citarne il messaggio. L'agente non aveva la shell. Ma questa volta il compito conteneva la
clausola «se non puoi eseguire qualcosa, dillo invece di prevederne l'esito» **e una via di
ripiego** - descrivere invece di riprodurre, dichiarando la differenza - e l'esito è stato l'opposto
dei primi due casi: nessun messaggio inventato, la provenienza di ciascuno dichiarata al lettore, e
**quindici errori di fatto trovati** che l'esecuzione non avrebbe scoperto, perché erano nel testo e
non nell'esito.

Ne discende un affinamento della regola, e vale più della regola stessa: quando si dubita che
l'agente abbia lo strumento, **la clausola di ripiego costa una riga e cambia l'esito**. Senza, un
agente privo di shell riempie il vuoto con la deduzione; con, lo dichiara e fa il lavoro che può
fare. Il costo della dimenticanza resta dell'orchestratore, che ha poi eseguito i sedici comandi e
li ha passati all'agente perché li sostituisse: due passaggi invece di uno, ma nessuna affermazione
non verificata rimasta in mezzo.

**Il presidio.** Nessuno. È disciplina di orchestrazione, e il costo di dimenticarla è pagato
dall'orchestratore, che deve rieseguire tutto ciò che ha creduto verificato.

---

## C. Trappole degli strumenti

### C-1. `bash` - la tabulazione è un carattere di IFS *bianco*

**Che cosa è successo.** `IFS=$'\t' read -r a b c` su un file separato da tabulazioni: due
tabulazioni consecutive vengono **fuse**, e ogni campo vuoto fa scalare di uno tutti quelli che
seguono. Il controllo leggeva il campo sbagliato e dichiarava il falso con sicurezza.

**La regola.** I campi di un file separato da tabulazioni si estraggono per **posizione** con
`cut -f`, che i campi vuoti li conta. Mai con `read`.

**Il presidio.** Caso di regressione nel banco. Ha rivelato che il difetto colpiva **ogni riga
bloccante reale**, non i soli casi patologici, perché una riga bloccante ha per costruzione la
casella della data vuota.

### C-2. `git log` esce con successo su un file non tracciato

**Che cosa è successo.** `t=$(git log -1 --format=%ct -- "$f" || echo 0)` non produce mai `0`:
`git log` **esce con successo** restituendo una riga vuota. La variabile restava vuota e i confronti
successivi si comportavano in modo imprevedibile.

**La regola.** Il valore predefinito si impone **dopo**, con `[ -n "$t" ] || t=0`, mai con `||` sul
comando.

**Il presidio.** Caso nel banco. Nota: il difetto **non alterava né i conteggi né il codice di
uscita**, quindi una prova scritta su quelli non lo avrebbe mai rilevato.

### C-3. `npm ls` fallisce quando `package.json` dichiara `overrides`

**Che cosa è successo.** `npm ls` in `website/` esce con
`TypeError: Cannot read properties of undefined (reading 'ruleset')`, generato dentro
`@npmcli/arborist/lib/edge.js:278` - il getter `error()` dell'arborist di npm - e non nel codice del
pacchetto che lo invoca. Con `--package-lock-only` funziona: il guasto è nella lettura dell'albero
**installato**, non del lockfile.

**La causa, isolata per esclusione.** Togliendo il campo `overrides` da `website/package.json` il
comando funziona; rimettendo **anche una sola** delle due voci - individualmente - il crash si
riproduce identico. È un'incompatibilità fra un `overrides` che punta a dipendenze **transitive** e
la combinazione npm 11.6.3 con node 24.11.0. Non è specifica di questo progetto, e **non è un
difetto di `cyclonedx-npm`**: fallisce qualunque comando npm che risolva il grafo delle dipendenze.
Nessun riferimento a una segnalazione a monte: non è verificabile da qui e non si inventa. Le due
piste concrete sono togliere `overrides` o abbassare la versione di npm.

**Conseguenza da non sottovalutare.** `@cyclonedx/cyclonedx-npm` invoca `npm ls`, quindi **il lavoro
`distinta-dei-materiali` in pipeline fallisce per la stessa ragione**, e nessuno se ne era accorto
perché quel lavoro genera un artefatto e non verifica nulla.

**La regola.** Un lavoro di pipeline che produce un artefatto senza asserire nulla **non dimostra di
funzionare**. Va accompagnato da una verifica che possa fallire.

**Il presidio.** `scripts/verifica-registro-componenti.sh`, che confronta la distinta con
`pipeline/annotazioni-componenti.tsv`. La causa npm resta aperta.

### C-4. Docusaurus - i rinvii relativi non risolvono nei documenti tradotti

**Che cosa è successo.** 88 collegamenti su 23 pagine inglesi non venivano risolti, mentre gli
identici collegamenti in italiano funzionavano. La mappa `sourceToPermalink` che Docusaurus 3.7
costruisce contiene **solo le chiavi dei file della lingua predefinita**: un rinvio relativo in un
file tradotto cerca una chiave che non esiste, e ricade sulla risoluzione per URL conservando il
suffisso `.md`.

**Il segnale diagnostico.** Se l'URL che la costruzione dichiara `resolved as` **conserva il
suffisso `.md`**, la risoluzione da markdown a rotta non è avvenuta affatto.

**La regola.** Nei documenti tradotti si usa la forma **assoluta** `](/area/file.md)`, che si risolve
sui percorsi configurati e funziona identica nelle due lingue.

**Il presidio.** La costruzione lo segnala, ma **esce con successo lo stesso** perché i tre criteri
`onBroken*` sono a `warn`. Portarli a `throw` è il criterio 1 di `T-07`.

### C-5. Docusaurus - `"type": "module"` in `website/package.json`

I file generati verrebbero trattati come ESM e il caricamento differito si rompe con
`require.resolveWeak is not a function`, che non indica affatto la causa reale. La configurazione è
già in `.mjs` per questo motivo. **Il presidio:** nessuno.

### C-6. Frontmatter YAML - i due punti seguiti da spazio vanno quotati

`description: Metriche: come si leggono` fa fallire la costruzione con un errore di **indentazione**
che non ha nulla a che vedere con l'indentazione. **Il presidio:**
`scripts/verifica-conformita-redazionale.sh`, con caso nel banco.

### C-7. I rinvii che escono da `docs/` devono essere URL assoluti verso GitHub

Un percorso relativo che esce da `docs/` funziona su GitHub e **non** sul sito pubblicato, dove
produce un 404 silenzioso. **Il presidio:** `scripts/verifica-conformita-redazionale.sh`, con caso
nel banco.

---

## D. Trappole del progetto

### D-1. Un difetto chiuso in una lingua sola non è chiuso: è una divergenza

**Che cosa è successo.** Due volte. La prima con il commit `7750d38`. La seconda il 26 agosto 2026:
tre collegamenti rotti corretti in italiano e lasciati intatti in inglese, dove stavano nella stessa
forma.

**La regola.** Una modifica su un'area prerequisito - `10_fondamenti`, `06_security`,
`08_compliance`, avvertenze pubbliche - si chiude **su entrambe le lingue nello stesso atto**.

**Il presidio.** `scripts/verifica-divergenza-traduzioni.sh` confronta struttura, date e pagine
orfane - **non** la forma dei rinvii, quindi non poteva vederlo. Vuoto di sorveglianza dichiarato.

### D-2. La correzione di un difetto è un'operazione che può introdurne

**Che cosa è successo.** La bonifica di quaranta àncore inglesi ne ha rotte **undici** normalizzando
a trattino singolo dove ne servivano due. Poche ore dopo, la conversione dei trattini decisa dal
committente ne ha spostate altre ventidue.

**La regola.** Un difetto di **classe** non si chiude verificando a occhio il risultato: si scrive
prima il controllo che lo misura, **poi** si corregge. Il controllo va scritto prima di dichiarare
chiuso il difetto, non dopo.

**Il presidio.** `scripts/verifica-ancore.sh`, con quattro casi nel banco.

### D-3. Un'àncora si ricava dal titolo, e un separatore fra spazi ne produce più d'uno

**Che cosa è successo.** Tradurre un titolo cambia l'àncora: 42 rinvii inglesi puntavano ad
ancoraggi in forma italiana. E un titolo come `### CTX-01 - Identity and access` separa il codice
dal testo con un carattere isolato fra due spazi: l'algoritmo di `github-slugger` converte **ogni
spazio** in un trattino, quindi l'àncora ne porta più d'uno consecutivi. Con il trattino lungo ne
restavano due, perché l'algoritmo lo rimuove; con quello corto ne restano **tre**, perché
sopravvive. Chi la scrive a mano ne mette sempre uno solo.

**La regola.** L'àncora si ricava dal titolo del documento **bersaglio**, nella lingua di quel
documento, elencando i titoli con `grep -n '^#'`. Un'àncora non risolvibile **si segnala, non si
inventa**.

**L'unica eccezione dichiarata alla regola del trattino corto** sta qui:
`scripts/prove/tenute/ancore/trattino-lungo-residuo/` contiene di proposito un titolo con il
trattino lungo. È la tenuta che intercetta un trattino lungo **rientrato da un incollaggio esterno**,
e toglierlo renderebbe cieco il controllo proprio sul caso che non possiamo prevenire a monte. Se un
giorno qualcuno conta i trattini lunghi nel repository e ne trova uno, è quello.

**Il presidio.** `scripts/verifica-ancore.sh`. Attenzione: due volte ha visto **una forma sola** di
rinvio e ne mancava altre. Copre ora `../a/f.md#x`, `./f.md#x`, `f.md#x` **nudo** e `/a/f.md#x`
assoluto. Quando si scrive un controllo che cerca una forma testuale, si enumerano **tutte** le
forme che quella cosa può avere, e si conta quante ne trova: da 84 rinvii esaminati a 102 significa
che diciotto erano invisibili.

### D-4. Un dato sintetico dev'essere non valido *per costruzione*

**Che cosa è successo.** Trentasette codici fiscali sul ramo principale avevano il **carattere di
controllo corretto**, quindi erano attribuibili a una persona reale anche se nessuno li aveva
copiati da un archivio.

**La regola.** Cifra o carattere di controllo **deliberatamente errato**; domini riservati
(`.invalid`, `.test`, `.example`) per la posta; cifre ripetute o in progressione per i telefoni. Un
recapito reale che il progetto pubblica per obbligo si dichiara sulla riga con
`dato-reale-consentito: <motivo>`, che vale solo per posta e telefono e **mai** per codice fiscale,
tessera, partita IVA e IBAN.

**Il presidio.** `scripts/verifica-dati-sintetici.sh`, fascia rapida, bloccante, con sette casi nel
banco. La convenzione è scritta in `CONTRIBUTING.md` regola 1, in entrambe le lingue.

### D-5. Un controllo tarato su una convenzione sbagliata *afferma il falso*

**Che cosa è successo.** Il controllo di divergenza era stato esteso alle avvertenze pubbliche
assumendo file `.en.md` separati - una convenzione che il repository non usa, perché quei documenti
sono **bilingui in un file solo**. Il controllo cercava file inesistenti e ne concludeva che
l'inglese mancasse. Due criteri di roadmap sono stati dichiarati non soddisfatti sulla base di
quella falsa affermazione.

**La regola.** Prima di estendere un controllo a una nuova classe di documenti, si verifica **sul
repository** la convenzione che quei documenti seguono davvero. Un controllo tarato male non tace:
afferma il falso, con l'autorevolezza di una verifica automatica, che è peggio di non averla.

**Il presidio.** Prova negativa nel banco, ottenuta degradando deliberatamente il testo inglese.

### D-6. Una riga che dichiara una copertura inesistente

**Che cosa è successo.** La riga `T01-C8` di `pipeline/collocazione-dei-controlli.tsv` annoverava le
formule di conformità vietate fra ciò che `scripts/verifica-conformita-redazionale.sh` presidia. Lo
script **non le cerca**, e non le cerca nessun altro controllo del repository.

**La regola.** Quando si annota che un controllo presidia una regola, si apre lo script e si
verifica. Una regola senza presidio è debito **visibile**; una regola con un presidio dichiarato e
inesistente è peggio, perché smette di essere cercata.

**Il presidio.** `scripts/verifica-collocazione-dei-controlli.sh` verifica che ogni caso citato
esista nel banco - **non** che lo script faccia ciò che la riga dice. Vuoto dichiarato.

### D-7. Un controllo che nessuno ha visto fallire non è un controllo

**Che cosa è successo.** Quattro controlli di pipeline su sette non avevano alcun caso che ne
dimostrasse il fallimento. Il debito era invisibile perché **nessuno lo contava**.

**La regola.** Ogni controllo ha un caso nel banco che lo vede fallire, provato **per mutazione**:
si guasta la regola, si verifica che **solo** il caso corrispondente passi da ✓ a ✗, si ripristina,
si riverifica, e si confronta l'impronta SHA-256 prima e dopo. Se un guasto fa cadere più di un
caso, si dichiara: è un'informazione, non un errore da nascondere.

**Il presidio.** `scripts/verifica-collocazione-dei-controlli.sh`, che è **esso stesso** una riga
della tabella che sorveglia - un controllo esente dalla regola che impone è la forma più pura di
controllo che mente.

### D-8. Un fallimento non è un fallimento *corretto*

**Che cosa è successo.** Una mutazione di `scripts/verifica-registro-componenti.sh` non ha fatto
cadere il caso atteso: lo script usciva comunque diverso da zero, ma per un **crash bash** - accesso
a una chiave di array associativo senza fallback, sotto `set -u` - e non per il rilievo che avrebbe
dovuto produrre. Il caso «passava» perché falliva per il motivo sbagliato.

**La regola.** Un'asserzione sul solo **codice di uscita** non distingue un fallimento corretto da un
crash accidentale. Per i casi in cui la distinzione conta, si asserisce anche sul **testo** del
messaggio. E ogni accesso a una chiave di array associativo in uno script che gira sotto `set -u`
porta il fallback `:-` con un ramo esplicito, perché il ramo esplicito è ciò che il collaudo può
riconoscere.

**Corollario sulle mutazioni che non isolano.** Quando un guasto fa cadere **due** casi insieme, è un
fatto sulla forma del codice - due rilievi diversi prodotti dalla stessa riga - non un difetto del
collaudo. Si dichiara accanto al caso; non si ritoccano le tenute finché il numero torna.

**Il presidio.** Il metodo di mutazione stesso, se applicato con l'asserzione sul testo.

---

### D-9. Una mutazione che inverte la condizione non prova la regola

**Che cosa è successo.** Un agente ha collaudato sette regole di un controllo nuovo invertendo il
predicato di ciascuna - `-z` in `-n`, `! -f` in `-f`, `! grep -qF` in `grep -qF`. In quattro casi su
sette il caso caduto **non è stato quello nominalmente corrispondente** ma quello della tenuta
valida, e l'agente ha concluso, in buona fede, che fosse un fatto sulla forma del codice. Rifatta la
prova mutando l'esito del ramo invece della condizione, **ogni caso ha isolato al primo tentativo**.

**Perché è insidioso.** Invertire un predicato non spegne la regola: la fa scattare **anche sulle
righe sane**. Si introducono due difetti insieme - un falso positivo sulla riga corretta e la
scomparsa del vero positivo - e la riga genuinamente difettosa continua spesso a fallire lo stesso,
attraverso un ramo diverso dello script. Il banco segnala una regressione e sembra funzionare, ma
ciò che si sta osservando non è l'assenza del presidio che si voleva provare: è il rumore di due
guasti sovrapposti. È lo stesso equivoco di `D-8`, spostato dall'asserzione alla mutazione.

**La regola.** Si muta **l'esito del ramo, non la condizione che vi porta**: si sostituisce la
chiamata che produce il rilievo con un'operazione nulla e si lascia la condizione intatta. È la
mutazione che risponde alla domanda giusta - «se questa regola smettesse di segnalare, qualcuno se
ne accorgerebbe?» - mentre l'inversione risponde a «che cosa succede se la regola diventa
sbagliata», che è un'altra domanda.

**Che cosa vuol dire «l'esito del ramo», con precisione.** Non basta togliere l'uscita: va
neutralizzata **l'azione intera**, messaggi compresi. Un caso concreto incontrato subito dopo aver
scritto questa voce: sostituito il solo `exit 2` di un presidio, il messaggio continuava a essere
stampato, l'esecuzione proseguiva fino al presidio successivo che usciva 2 per conto proprio, e il
caso restava verde. Non era una ridondanza fra i due presidi - erano due condizioni distinte, e il
secondo faceva da rete al primo solo perché il primo era stato mutilato a metà. Neutralizzata
l'azione per intero, l'isolamento è stato netto.

**Il corollario, e vale la voce da solo.** Se anche con questa tecnica una mutazione non isola,
allora è davvero un fatto sulla forma del codice, e va detto **quale ridondanza** lo produce: una
proprietà sorvegliata due volte dallo stesso script significa che **uno dei due presidi non è
provato da nessuno**, e nessuno se ne accorgerebbe se sparisse.

**Il presidio.** Nessuno automatico. È disciplina di collaudo, e si applica ogni volta che si scrive
la prova negativa di un controllo nuovo.

---

### D-10. Un controllo che porta dentro di sé una copia di ciò che sorveglia non sorveglia più

**Che cosa è successo.** Due volte nello stesso giorno, da due agenti diversi che non si erano
parlati. `scripts/verifica-terminologie.sh` teneva una **copia di riserva** dei riconoscitori e vi
ricadeva in silenzio quando il file versionato mancava. `scripts/verifica-registro-dei-difetti.sh`,
scritto per garantire che **ogni voce del runbook compaia nel registro dei difetti**, teneva le
ventisei voci scritte dentro di sé invece di leggerle dal runbook: aggiunta la voce `D-9`, il
controllo ha continuato a uscire verde dichiarando «26 voci, tutte presenti».

**Perché è insidioso.** La copia interna non è un errore visibile: è comoda, rende lo script
autosufficiente, e nel giorno in cui viene scritta è **identica** alla fonte. Diverge dopo, in
silenzio, e il controllo continua a passare - anzi, passa *perché* è divergente. Nel secondo caso la
motivazione scritta nel commento era pure ragionevole: «il runbook è prosa, non un elenco leggibile
da macchina». Era falsa: le voci sono titoli `### A-1.`, e una riga di `grep` le estrae tutte.

**La regola.** Un controllo **non contiene** ciò che sorveglia. Legge la fonte, e se la fonte manca
**si rifiuta di girare** - uscita 2, non un avviso e poi avanti. Quando la fonte sembra non
leggibile da macchina, prima di duplicarla si verifica che sia vero: quasi sempre ha una struttura
regolare che nessuno ha provato a usare. E la variabile d'ambiente che sostituisce la fonte esiste
**per il collaudo**, non come sorgente alternativa in esercizio.

**Il presidio.** Per le terminologie, il caso `terminologie: riconoscitore letto dal file versionato
e non dalla riserva` più `terminologie: lista di ammissione assente (nessuna riserva)`. Per il
registro dei difetti, il caso che vede il controllo accorgersi di una voce del runbook aggiunta e
non registrata. **La forma del presidio è sempre la stessa**: una tenuta in cui la fonte dice una
cosa che la copia interna non direbbe, e il controllo deve seguire la fonte.

---

### D-11. Una casella di stato che comincia con «APERTA» e finisce con la risposta è aperta

**Che cosa è successo.** Nella bacheca inter-agenti quattro voci su otto portavano, dentro la
casella dello stato, la parola `APERTA` seguita dalla risposta che le chiudeva, con il rinvio al
registro di decisione. Un'analisi le ha lette come otto questioni senza risposta; alla verifica ne
erano cinque, più due mal etichettate e una con la risposta scritta nella colonna sbagliata - quella
della domanda, dove nessuno la cerca.

**Perché è insidioso.** Chi scorre una colonna di stato **legge la prima parola**. È il motivo per
cui quella colonna esiste. Una risposta scritta dopo di essa non è nascosta a chi legge la riga per
intero, ma è invisibile a chiunque faccia esattamente ciò per cui la tabella è fatta. E il difetto
si autoalimenta: la voce resta nell'elenco degli aperti, viene ricontata a ogni censimento, e ogni
censimento successivo la conferma.

**La regola.** Lo **stato sta nella prima parola della casella dello stato**, e la casella dello
stato non contiene altro che lo stato. La risposta, il rinvio all'ADR, il residuo riformulato vanno
nella colonna della questione. Se una voce è risolta per una parte e aperta per un'altra, lo stato
si scrive per esteso - «risolta da `ARCH`, aperta verso `PROTO`» - e la questione si **riformula sul
solo residuo**, altrimenti la parte già chiusa continua a pesare come se fosse aperta.

**Il presidio.** Nessuno. Un controllo che verifichi la forma della prima parola sarebbe scrivibile,
e non esiste.

---

### D-12. Quando una contraddizione è fra un registro di decisione e un capitolo, si contano tutti i luoghi

**Che cosa è successo.** Due analisi hanno segnalato contraddizioni fra un ADR e un capitolo di
area, elencando i luoghi a favore dell'uno e dell'altro. Alla verifica il conteggio era sbagliato in
entrambe le direzioni: i luoghi conformi all'ADR erano **quattro e non tre** - ne esisteva uno, nel
capitolo sulla multi-tenancy, che nessuna delle due aveva trovato - e i luoghi difformi erano **tre
e non due**, perché il terzo viveva nella guida dei fondamenti, cioè nel documento che si legge per
primo.

**Perché è insidioso.** Correggere due luoghi su tre chiude la contraddizione **dove è stata
cercata** e la lascia dove qualcuno la incontrerà per primo. Peggio: il documento non corretto
diventa la fonte più autorevole per chi non conosce l'ADR, perché è quello che gli è stato detto di
leggere all'inizio. E un luogo conforme non censito è un'occasione persa di capire che l'ADR aveva
ragione con più forza di quanto l'analisi sostenesse.

**La regola.** Prima di correggere, si **censiscono tutti i luoghi** che portano l'affermazione,
conformi e difformi, con `grep` su tutto il corpus e in **entrambe le lingue** - non solo nelle aree
che l'analisi cita. Poi si corregge, e i luoghi che restano fuori dal proprio perimetro si
**riportano con la riga esatta**, così che chi li possiede sappia che cosa gli è rimasto in mano.

**Il presidio.** Nessuno automatico. È disciplina di correzione, e discende da `B-1`: si verifica
sul disco, non sul rapporto che elenca i luoghi.

---

### D-13. Una tabella che dice dove sta un controllo non dice che il controllo sia là

**Che cosa è successo.** `pipeline/collocazione-dei-controlli.tsv` esiste per rispondere a una
domanda sola: dove gira ciascun controllo della catena. La riga `RD-C1` rispondeva «fascia
completa, bloccante, senza data di grazia». Per giorni `.github/workflows/fascia-completa.yml` non
ha invocato `scripts/verifica-registro-dei-difetti.sh`, e nulla se n'è accorto:
`scripts/verifica-collocazione-dei-controlli.sh` girava verde a ogni proposta di modifica. Il
difetto è emerso solo confrontando a mano l'elenco degli script in `scripts/` con quelli citati nei
flussi: **sei controlli su diciassette non erano eseguiti da nessuna corsia**, e uno di essi -
`verifica-termini-vietati.sh`, che attua la regola di riservatezza - non aveva nemmeno un caso di
banco.

**Perché è insidioso.** Le quattro regole del controllo verificavano che la riga fosse **ben
formata**: fascia fra le quattro ammesse, data presente quando serve, prova negativa non vuota,
casi citati esistenti nel banco. Sono tutte vere anche di una riga che descrive una collocazione
inesistente. Il controllo sorvegliava la propria sintassi, non la pipeline - e lo faceva con
sicurezza, restituendo «27 righe verificate, 1 errore» mentre la ventisettesima riga mentiva. È la
stessa forma di `D-10` spostata di un livello: là un controllo portava dentro di sé una copia di
ciò che sorvegliava, qui una tabella descriveva una realtà che non guardava.

Il difetto è più probabile di quanto sembri, perché la tabella e la corsia si scrivono in **momenti
diversi**: la riga nasce con il controllo, la collocazione arriva dopo, e fra i due passa una
sessione. Quando la riga esiste già, nessuno la rilegge.

**La regola.** Una tabella che dichiara **dove** una cosa gira è verificabile, e va verificata: si
apre il file di corsia e si guarda se il comando c'è. Vale oltre questa tabella - qualunque registro
che asserisca un fatto sul repository (un percorso, un lavoro, una dipendenza) va confrontato con il
repository, non con se stesso. E quando una collocazione non esiste ancora, si scrive **`da
collocare` con una data**, non una fascia plausibile: il debito resta visibile e scade da solo.

**Il presidio.** La regola 5 di `scripts/verifica-collocazione-dei-controlli.sh`, con sei casi nel
banco - uno per ciascuna delle sue uscite, tutti isolati per mutazione dell'esito del ramo secondo
`D-9`. La variabile d'ambiente `CORSIE` punta il controllo su corsie sintetiche in
`scripts/prove/tenute/collocazione/corsie/`, così i casi provano il comportamento del controllo e
non lo stato delle corsie vere.

---

### D-14. Un artefatto annidato sposta in silenzio i confini dell'insieme misurato

**Che cosa è successo.** `scripts/verifica-ricerca.sh` verifica, per ciascuna delle due lingue, che
la barra di ricerca sia raggiungibile da **ogni pagina di quella lingua**. Docusaurus però annida la
locale non predefinita dentro l'artefatto della predefinita: `website/build/en` sta **dentro**
`website/build`. Il `find` ricorsivo sull'artefatto italiano raccoglieva quindi anche tutte le
pagine inglesi, e il controllo dichiarava «italiano: 324 pagine» quando le pagine italiane erano
162. Le 162 inglesi venivano esaminate due volte, una delle quali sotto il nome sbagliato.

**Perché è insidioso.** Non produceva un falso verde, e per questo sarebbe rimasto lì: anche le
pagine inglesi portano la barra di ricerca, quindi la regola passava. Il danno era doppio e tutto
latente. Il conteggio stampato **diceva il falso** in un controllo il cui mestiere è contare. E una
pagina inglese priva della barra sarebbe stata imputata all'italiano, mandando chi la cerca nella
directory sbagliata. Lo stesso vale, con meno conseguenze, per
`scripts/verifica-dichiarazione-non-marcatura.sh`, che la corsia invoca su `website/build` e poi su
`website/build/en`: il primo passaggio comprende già interamente il secondo, quindi uno dei due casi
del banco non può cadere senza che cada anche l'altro - il corollario di `D-9`.

**La regola.** Un controllo che misura un insieme **dichiara i confini dell'insieme** e non li
eredita dalla forma della directory. Quando un artefatto può contenerne un altro dello stesso tipo,
il confine si stabilisce da ciò che rende l'artefatto interno tale - qui: possedere un **proprio**
indice di ricerca - e non da una variabile d'ambiente che per caso vi punta. Legare il confine alla
variabile sarebbe stato più diretto e peggiore: un artefatto con tre lingue ne poterebbe una sola, e
soprattutto **nessuna tenuta potrebbe collaudare la regola**, perché fallirebbe identica con e senza
la potatura.

**Il presidio.** Il caso `ricerca: una locale annidata non e' contata dalla locale che la contiene`,
con una tenuta la cui locale annidata ha una pagina **deliberatamente priva** della barra: se la
scansione esterna la raccogliesse, il caso valido cadrebbe. `ARTEFATTO_EN` punta altrove di
proposito, così il caso prova la potatura e non la coincidenza fra le due variabili. Isolato per
mutazione dell'esito del ramo: neutralizzato l'accumulo della potatura, cade quel caso e solo quello
- impronta `4af67170dad448be` prima e dopo.

---

### D-15. La tenuta di un riconoscitore testuale, scritta per intero, fa scattare il riconoscitore

**Che cosa è successo.** Il caso di banco di `G3` prova che il riconoscitore intercetta un comando
che scarica una terminologia sotto licenza. Per provarlo, il banco scriveva quel comando **per
intero** dentro `scripts/prove/esegui-prove.sh`, che è un file versionato. Il riconoscitore `G3-3`
cerca `(curl|wget|fetch)` entro duecento caratteri da un dominio di terminologie e non distingue -
non può distinguere - fra un comando da eseguire e uno scritto per collaudare chi lo intercetta.
Risultato: `scripts/verifica-terminologie.sh` falliva sul repository vero, con un solo rilievo, e
quel rilievo era la propria tenuta di collaudo.

**Perché è insidioso.** Il banco passava, tutti i casi compresi quello di `G3`: il caso costruisce
una sandbox temporanea, e là dentro il comando c'è per intero e viene intercettato come deve. Il
difetto viveva **fuori** dal banco, in un cancello che nessuno stava eseguendo insieme al banco. Il
file non è mai stato versionato prima, quindi la corsia non lo aveva mai visto: il cancello sarebbe
diventato rosso **al primo commit**, in un momento in cui l'attenzione è altrove e la causa sembra
un contenuto proibito appena introdotto.

**La regola.** La tenuta di un riconoscitore **testuale** si compone per frammenti nel file
versionato e si scrive per intero solo dove il controllo deve trovarla - la sandbox temporanea. È la
disciplina della regola `R0` - si pubblica il complemento, mai l'insieme protetto - applicata al
collaudo: `verbo='cur''l'` e `host='uts.nlm.nih''.gov'` concatenano ciò che serve senza che la forma
sorvegliata compaia contigua. Vale per ogni controllo che riconosce **per contenuto** e non per
struttura: terminologie, segreti, termini vietati, dati non sintetici.

**Il corollario, e vale la voce da solo.** Un banco verde non dice che i cancelli siano verdi. Il
banco prova che i controlli si comportano come atteso **sulle tenute**; i cancelli dicono che il
repository è in regola. Sono due domande diverse, e vanno poste tutte e due prima di committare.

**Il presidio.** Il caso `terminologie: comando di scaricamento automatico verso un dominio di
terminologie sotto licenza` continua a valere, perché la sandbox riceve il comando intero. Che il
banco non contenga la forma sorvegliata lo dice `scripts/verifica-terminologie.sh` stesso, che
esamina anche `scripts/`: è il controllo a presidiare la propria tenuta, purché lo si esegua.

---

## Voci senza presidio, in un elenco solo

Sono il debito di questo runbook. Chi scrive un controllo per una di queste voci aggiorni la
colonna corrispondente e tolga la riga da qui.

| Voce | Che cosa manca |
|---|---|
| A-1 | Nessun controllo verifica che il corpus segua `log-TRAD-1` §3.3 |
| A-2 | Nessun controllo: è una regola di metodo |
| A-3 | Nessun controllo possibile |
| A-4 | Nessun controllo sulla cadenza del registro delle revisioni |
| B-1, B-2, B-3, B-4 | Nessun controllo: sono regole di mandato |
| B-5, B-6 | Nessun controllo: sono disciplina di orchestrazione, e il costo lo paga l'orchestratore |
| C-3 | La causa npm resta aperta; il lavoro di pipeline va corretto |
| C-5 | Nessun controllo su `"type": "module"` |
| D-1 | Il controllo di divergenza non guarda la forma dei rinvii |
| D-6 | Nessun controllo sulle formule di conformità vietate (`Q-289`) |
