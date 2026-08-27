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

**La quinta e la sesta ricaduta, e l'affinamento che ne discende.** Il 27 agosto 2026, un'ora
dopo aver riletto questa stessa voce. Due compiti aperti contemporaneamente: a
`documentation-engineer` era chiesto di eseguire `scripts/verifica-divergenza-traduzioni.sh` per
**ottenere l'elenco** degli otto documenti su cui lavorare; a `technical-writer` di eseguire
`scripts/verifica-bacheca.sh` per **ottenere l'elenco** delle ventidue voci da annotare. Nessuno dei
due ha la shell. La clausola di ripiego ha funzionato dove era stata scritta - il primo agente ha
dichiarato apertamente di non poter eseguire lo script e si è fermato invece di dedurre l'elenco -
ma il lavoro non è stato fatto da nessuno dei due, e sono andati perduti circa duecentoquarantamila
gettoni e due esecuzioni.

**La regola si affina, e l'affinamento è più stretto della regola.** Non basta non chiedere a un
agente di **verificare** con un comando: non gli si chiede nemmeno di **procurarsi con un comando
l'oggetto del proprio lavoro**. La distinzione che conta non è fra «eseguire» e «descrivere» - è
fra un compito che contiene **i dati** e uno che contiene **il comando che li produce**. Un elenco
di otto percorsi o di ventidue sigle sta in venti righe di compito: l'orchestratore lo produce una
volta, in un secondo, e lo incolla. Il compito riscritto con gli elenchi dentro è partito e ha
lavorato.

Ne discende una regola di lettura del compito prima di inviarlo: **si cerca ogni imperativo che
comincia con «esegui» e ci si chiede se ciò che quel comando produce sia un dato o una verifica.**
Se è un dato, va sostituito dal dato. Se è una verifica, va spostato all'orchestratore.

**Il presidio.** Nessuno. È disciplina di orchestrazione, e il costo di dimenticarla è pagato
dall'orchestratore, che deve rieseguire tutto ciò che ha creduto verificato - e, da questa
ricaduta, anche rilanciare gli agenti che si sono fermati sulla soglia.

### B-7. `git add -A` in una cartella condivisa committa il lavoro in corso di un altro

**Che cosa è successo.** Il 27 agosto 2026, mentre un agente stava costruendo una tenuta di banco non
ancora tracciata, ho chiuso un lavoro mio con `git add -A` seguito da un commit sulla firma degli
artefatti. Il commit ha inglobato **per intero** la tenuta dell'agente, che non c'entrava nulla con
il suo messaggio. L'agente se n'è accorto e l'ha segnalato: nessuna perdita, nessuna corruzione - il
contenuto committato coincide byte per byte con quello che aveva scritto - ma la tenuta vive oggi
sotto un messaggio di commit che non la nomina, e chi un giorno cercherà quando è entrata nel
repository non la troverà dove si aspetta.

**Perché è insidioso.** `git add -A` è il gesto che si compie a fine lavoro senza pensarci, ed è
corretto in una cartella con un solo autore. Il presupposto - «tutto ciò che è cambiato è mio» -
smette di valere nel momento in cui un agente lavora in parallelo, e non c'è nulla, nell'esito del
comando, che segnali la differenza: il commit riesce, i controlli passano, la storia sembra pulita.
Il danno non è tecnico ma **archivistico**, e si manifesta mesi dopo, quando la storia è l'unica
fonte rimasta.

C'è un aggravante che questo repository conosce già: il messaggio di commit di questo progetto non è
un'etichetta, è **la spiegazione del perché**. Un commit che dice «la firma senza certificato non è
verificabile» e contiene anche una tenuta Docusaurus per i collegamenti rotti afferma implicitamente
un nesso che non esiste.

**La regola.** Con agenti attivi sulla stessa cartella non si usa `git add -A` né `git commit -a`.
Si aggiungono **i percorsi che si è scritti**, elencandoli - `git add <percorso> <percorso>` -
oppure, quando sono molti, si verifica prima `git status --porcelain` e si esclude ciò che non si
riconosce. Se un file cambiato non si riconosce, **è di qualcun altro**, e va lasciato dov'è: la
domanda non è «questo file è pronto» ma «questo file l'ho scritto io».

**Il presidio.** Nessuno, ed è disciplina di orchestrazione: un controllo non può sapere chi ha
scritto un file. L'unica difesa praticabile è la lettura di `git status --porcelain` prima di ogni
commit fatto mentre un agente è in esecuzione, ed è la stessa disciplina della voce `B-5` - non si
tocca un file mentre un agente lo sta mutando - applicata al gesto che tocca tutti i file insieme.

---

## C. Trappole degli strumenti

### C-1. `bash` - la tabulazione è un carattere di IFS *bianco*

**Che cosa è successo.** `IFS=$'\t' read -r a b c` su un file separato da tabulazioni: due
tabulazioni consecutive vengono **fuse**, e ogni campo vuoto fa scalare di uno tutti quelli che
seguono. Il controllo leggeva il campo sbagliato e dichiarava il falso con sicurezza.

**La regola.** I campi di un file separato da tabulazioni si estraggono per **posizione** con
`cut -f`, che i campi vuoti li conta. Mai con `read`.

**Il presidio.** Dal 27 agosto 2026 un cancello e non più un avvertimento:
`scripts/verifica-lettura-dei-tsv.sh` rifiuta la forma vietata in **ogni** script del repository,
ed è bloccante in fascia rapida. Prima di quel giorno il presidio era un caso di regressione nel
banco più tre commenti sparsi negli script, e **non è bastato**: la regola è stata riviolata due
volte il 27 agosto, ed è la voce `D-29`.

Il caso di regressione originario resta, e conserva ciò che aveva rivelato: il difetto colpiva
**ogni riga bloccante reale**, non i soli casi patologici, perché una riga bloccante ha per
costruzione la casella della data vuota.

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

### C-8. Un avviso di sicurezza senza versione corretta - il componente a monte è archiviato

**Che cosa è successo.** Il 27 agosto 2026 la sorveglianza automatica del repository segnalava due
vulnerabilità di gravità alta sul ramo principale, `GHSA-w3rx-r6r6-pgpr` (CVE-2025-71330, parser
ICNS) e `GHSA-5p2g-fcmc-qvqq` (CVE-2025-71329, parser JXL e HEIF). Stesso componente in entrambe:
`image-size@2.0.2`, dipendenza transitiva del sito di documentazione, tirata da
`@docusaurus/mdx-loader@3.10.2` e da nessun altro. In tutte e due il difetto è un ciclo infinito
nel lettore del formato quando un campo di lunghezza vale zero: chi fornisce l'immagine blocca per
sempre il ciclo di eventi di Node. La classificazione dice l'essenziale, `C:N/I:N/A:H` - nessuna
perdita di riservatezza, nessuna alterazione di integrità, solo indisponibilità.

**Perché non si chiude con un aggiornamento.** Non esiste la versione che lo corregge, e non è una
questione di attesa. Il campo `first_patched_version` degli avvisi è nullo, l'intervallo vulnerabile
è `<= 2.0.2` e `npm audit` risponde `range: "*"` con `fixAvailable: false`: sono vulnerabili tutte
le versioni pubblicate. La `2.0.2` del 2 aprile 2025 è l'ultima, e il progetto a monte risulta
archiviato in sola lettura - verificato il 27 agosto 2026 sull'interfaccia di GitHub, `archived:
true`. Un componente archiviato non pubblicherà mai la versione successiva: attendere non è una
strategia, è una rinuncia non dichiarata. Nemmeno salire di versione su chi lo tira serve, perché
`@docusaurus/mdx-loader@3.10.2` è già l'ultima pubblicata e dichiara `image-size: ^2.0.2`. A monte
il tema è aperto e tracciato nella segnalazione `facebook/docusaurus#12231`, con due proposte di
sostituzione ancora non unite, `#12235` e `#12388`.

**Perché non si forza la sostituzione, che è la parte importante.** La tentazione, davanti a due
righe rosse, è dirottare il nome con un `overrides` verso un altro pacchetto. Le due strade
disponibili sono entrambe peggiori del difetto che rimuoverebbero. La prima è `image-dimensions`,
quella che una delle proposte a monte adotta: è però un modulo di soli ESM, espone un unico punto
di ingresso e funzioni con altro nome, mentre `mdx-loader` fa `require("image-size/fromFile")` e
invoca `imageSizeFromFile`; il dirottamento del nome non produce un avviso, produce una costruzione
rotta. La seconda sono le diramazioni comparse su npm dopo l'archiviazione - `image-size-next` è la
più visibile, tre versioni pubblicate, un solo manutentore, nessuna attestazione di provenienza,
diciottomila installazioni la settimana contro i trentacinque milioni dell'originale. Sostituire
significherebbe scambiare un blocco del ciclo di eventi, che non tocca l'integrità di nulla, con
l'esecuzione di codice arbitrario di ignoti dentro la catena che costruisce e **firma** ciò che il
progetto pubblica. È lo spostamento di rischio che una riga verde nel cruscotto non racconta.

**L'esposizione reale, misurata e non stimata.** `image-size` è caricato soltanto dal trasformatore
delle immagini di `mdx-loader`, che lo invoca su file letti dal disco quando un documento Markdown
rinvia a un'immagine. Il sito ne contiene due, `favicon.svg` e `logo.svg`, entrambe vettoriali e
sotto `static/`, e nessun documento delle due lingue rinvia a un'immagine raster: il percorso
vulnerabile oggi non viene eseguito nemmeno una volta. Dopo la costruzione, la ricerca di
`image-size` e dei nomi dei suoi lettori negli 880 file dell'artefatto pubblicato non trova nulla:
è un componente di sola costruzione, non arriva al browser di chi legge. Chi potrebbe attivarlo è
solo chi riesce a far entrare nel repository un file ICNS, JXL o HEIF costruito apposta, e
l'effetto sarebbe un lavoro di pipeline appeso fino al proprio `timeout-minutes: 20` - che tutti i
lavori che eseguono `npm run build` dichiarano già - senza alcun artefatto prodotto e quindi senza
nulla da firmare.

**La regola.** Davanti a un avviso su una dipendenza transitiva si accertano tre cose, in
quest'ordine, prima di toccare qualunque file: se esiste davvero una versione corretta
(`first_patched_version`, e `fixAvailable` di `npm audit`, non l'impressione che «basta
aggiornare»); se il componente a monte è ancora vivo, perché un archivio non pubblicherà altro; e
se il percorso vulnerabile è raggiungibile dall'artefatto che il progetto pubblica. Quando la
versione corretta non esiste, **una vulnerabilità dichiarata e motivata vale più di una
sostituzione forzata**: il rimedio che introduce nella catena di costruzione un componente senza
provenienza verificabile non chiude il rischio, lo sposta dove nessuno lo sta guardando. Il
sostituto si accetta solo se ha provenienza verificabile e interfaccia compatibile, e le due
condizioni si verificano prima, non dopo aver visto fallire la costruzione.

**Il presidio.** Nessuno, e va detto invece di lasciarlo intendere. L'attività che coprirebbe il
caso - analisi delle dipendenze contro le banche dati di vulnerabilità, `SEC-C2` in
`pipeline/collocazione-dei-controlli.tsv` - è in sola segnalazione e diventa bloccante il 26
settembre 2026; fino a quel giorno l'unico presidio è la sorveglianza automatica del repository, che
avvisa e non blocca. La dichiarazione di esposizione prescritta dal §4 di
`docs/06_security/07-catena-di-fornitura.md` è la sede in cui questa valutazione andrà scritta in
forma leggibile da una macchina e firmata: oggi quell'artefatto non esiste, e questa voce non lo
sostituisce.

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

### D-16. Una tenuta modellata sul controllo, e non sulla realtà, collauda il controllo contro sé stesso

**Che cosa è successo.** `scripts/verifica-registro-componenti.sh` attua `G2` e `G5`: legge la
distinta dei materiali e verifica che ogni componente sia annotato e che la licenza sia
compatibile. Sulla distinta vera falliva in tre modi contemporaneamente, e nessuno si vedeva.
Leggeva `.name` senza `.group`, quindi i 412 componenti con spazio dei nomi npm non potevano
combaciare con il registro - e due componenti diversi collassavano sulla stessa chiave. Cercava la
licenza in `.license.name`, mentre il generatore la scrive in `.license.id` o in `.expression`:
**tutti e 1236 i componenti si leggevano `NOLICENSE`**, e il controllo sulle licenze non ne aveva
mai confrontata una in vita sua. E la licenza letta veniva **buttata via**: estratta e mai
confrontata con quella dichiarata nel registro, sicché una riga poteva dire «MIT, compatibile» per
un componente che spedisce GPL-3.0.

**Perché il banco non se n'era accorto.** Le tenute erano scritte nella forma che il controllo si
aspettava - `license.name`, nessun `group` - invece che nella forma che il generatore produce. Il
banco collaudava il controllo contro **una finzione fatta a sua immagine**, e passava. È il difetto
più insidioso di tutta questa famiglia, perché produce esattamente i segnali del funzionamento: un
banco verde, un cancello verde, e una copertura che non esiste.

**La regola.** Una tenuta si modella sulla **realtà che il controllo incontrerà**, mai sul codice
del controllo. Quando la realtà è prodotta da uno strumento di terze parti - un generatore di
distinta, un formatore, un compilatore - la tenuta si ricava **da un artefatto vero**, non si
scrive a mano leggendo che cosa il controllo si aspetta. E quando una variabile viene estratta e
mai usata, la domanda giusta non è «serve?» ma «che cosa doveva verificare, e chi lo verifica al
posto suo?».

**Il presidio.** Le tenute portate alla forma reale, più tre casi nuovi: lo spazio dei nomi npm,
la licenza in forma di espressione composta, e il registro che dichiara una licenza diversa da
quella del componente. La mutazione che neutralizza la lettura della licenza, che prima non faceva
cadere nulla, ora isola.

---

### D-17. Un controllo che forza la propria radice non è collaudabile da nessuna tenuta

**Che cosa è successo.** `scripts/verifica-dco.sh` legge la cronologia git e comincia con
`cd "$(dirname "$0")/.."`, che è la cosa giusta in esercizio: deve verificare **questo**
repository. Il primo caso del banco costruiva un repository sintetico con un commit privo del
marcatore e si aspettava che il controllo fallisse. Passava. Il controllo stava esaminando
Telemedic, non la tenuta, e in Telemedic quel commit aveva il marcatore.

**Perché è insidioso.** Il caso non era rotto in un modo visibile: era **verde**, e verde per la
ragione sbagliata. La stessa mutazione che avrebbe dovuto smascherarlo faceva cadere un altro caso,
il che sembrava un fatto sulla forma del codice - e sarebbe stato archiviato come tale se non si
fosse guardato *quale* caso cadeva.

**La regola.** Un controllo che stabilisce da sé il proprio oggetto - la radice del repository, la
directory di lavoro, il ramo di riferimento - espone una variabile d'ambiente per sostituirlo,
**che esiste per il collaudo e mai come sorgente alternativa in esercizio**. È la stessa disciplina
di `D-10` applicata alla radice invece che ai dati. E quando una mutazione fa cadere un caso
diverso da quello atteso, non si conclude nulla prima di aver letto **quale** caso è caduto.

**Il presidio.** La variabile `REPO`, e i quattro casi del banco che senza di essa passavano tutti
per la ragione sbagliata.

---

### D-18. Una regola scritta nel documento che la impone, e non osservata da chi l'ha scritta

**Che cosa è successo.** `CONTRIBUTING.md` §147 prescrive il *Developer Certificate of Origin* per
**ogni** commit. Al 26 agosto 2026, dei **36 commit** della cronologia, ne portavano il marcatore
**cinque** - tutti scritti quel giorno, tutti successivi alla misura che ha scoperto la lacuna.
Nello stesso momento `docs/09_roadmap/00-indice.md` dichiarava il DCO «**attivo e obbligatorio**».
Nessun controllo lo verificava.

**Perché è insidioso.** La regola non era dimenticata: era **scritta, pubblicata e citata** come
soddisfatta in un capitolo di roadmap. Chi legge il repository dall'esterno trova la prescrizione,
trova l'affermazione che è in vigore, e non ha modo di sapere che la cronologia dice il contrario -
a meno di contare, che è precisamente ciò che nessuno fa. È la forma pubblica del difetto che
`CLAUDE.md` enuncia in astratto: **una regola scritta e non presidiata da un controllo non è una
regola**.

**La regola.** Una prescrizione che riguarda **ogni** unità di lavoro - ogni commit, ogni proposta,
ogni file - va misurata sull'intera popolazione prima di dichiararla in vigore, e il numero va
scritto. «È obbligatorio» non è un'affermazione sullo stato: è un'affermazione sulla norma. Lo stato
si dice contando.

**Il presidio.** `scripts/verifica-dco.sh`, riga `RD-C2` della tabella, lavoro `dco` in fascia
rapida. Il controllo esamina l'intervallo non ancora spinto e non tutta la cronologia: pretendere il
marcatore da commit scritti prima che il controllo esistesse renderebbe il cancello impossibile da
soddisfare, e **un cancello impossibile non è un cancello, è un cancello che qualcuno aggirerà**.

---

### D-19. Una sigla superata continua a designare, in prosa, il vincolo di prima

**Che cosa è successo.** I vincoli e le questioni nascevano con una numerazione **locale di area** -
`V-13` di `SEC`, `V-13` di `INTEG` - e venivano poi globalizzati in blocchi da dieci: `SEC` in
`V-150`…`V-157`, `INTEG` in `V-160`…`V-166`. La globalizzazione ha riscritto la tabella e **non ha
riscritto il corpus**. Al 27 agosto 2026 la documentazione pubblicata portava **settantasei
citazioni** con numerazione superata, in entrambe le lingue, e almeno **tre numerazioni diverse**
convivevano per gli stessi sei vincoli: quella locale di `INTEG` (`V-13`…`V-18`), una intermedia
usata solo nell'area di sicurezza (`V-21`…`V-25`) e quella ufficiale (`V-160`…`V-165`). Nessuna
delle tre risolveva, perché la tabella globale non contiene affatto l'intervallo `V-13`…`V-109`.

**Perché è insidioso.** La citazione **resta leggibile e sembra corretta**: «il vincolo `V-13` di
`SEC`» nomina l'area giusta, dice una cosa vera sul contenuto e rinvia a una sigla che, per chi
legge, ha tutta l'aria di esistere. Solo chi va a cercarla scopre che non c'è. E non poteva
accorgersene nessuno: i vincoli vivevano in una tabella di prosa dentro `.telemedic/`, che nessuno
proiettava in una forma leggibile da macchina, quindi non esisteva l'insieme rispetto a cui
verificare. La stessa cosa vale per le questioni: `Q-18` era il numero superato di `Q-160`, `Q-19`
di `Q-156`, e `Q-20` non era mai stata registrata affatto.

**La regola.** Una rinumerazione non è finita quando la tabella è corretta: è finita quando **ogni
citazione nel corpus è stata riscritta e un controllo lo verifica**. E finché una famiglia di sigle
non ha una forma leggibile da macchina, nessuno può dire se una citazione risolva - quindi la forma
leggibile da macchina viene **prima** della rinumerazione, non dopo.

**Il presidio.** `scripts/verifica-registri-di-vincoli-e-questioni.sh`, riga `SIG-C1` della tabella,
lavoro `registri-delle-sigle` in fascia completa. Verifica che ogni sigla citata in `docs/` e nello
specchio inglese risolva nei registri, e che le due lingue citino lo stesso insieme.

---

### D-20. Un controllo che vieta un carattere non può contenerlo, nemmeno per spiegare la regola

**Che cosa è successo.** La convenzione dei trattini vieta il trattino lungo in ogni file e ammette
quello medio solo fra due cifre. Il controllo che la presidia, e la sezione di `CLAUDE.md` che la
enuncia, devono quindi essere scritti **senza mai contenere in forma letterale i caratteri che
vietano**: nel controllo i due caratteri si nominano per punto di codice, e nel documento il medio
compare solo nei due esempi ammessi e il lungo mai.

**Perché è insidioso.** È il rovescio di `D-10`. Là un controllo che porta dentro di sé una copia di
ciò che sorveglia **smette di sorvegliare**; qui un controllo che porta dentro di sé un esempio di
ciò che vieta **non può passare sul proprio repository**, e il fallimento si presenta come un
difetto del corpus invece che dello strumento. Chi lo incontra corregge il corpus, non trova nulla,
e conclude che il controllo è rotto.

**La regola.** Chi modifica un controllo testuale, o il documento che ne enuncia la regola, deve
**mantenere la proprietà che il file soddisfa la regola che descrive**. Se la regola non si può
spiegare senza esibire ciò che vieta, si esibisce per punto di codice, mai in forma letterale.

**Il presidio.** `scripts/verifica-trattini.sh`, riga `CV-C1` della tabella, lavoro `trattini` in
fascia rapida: il controllo passa sull'intero repository, se stesso compreso.

---

### D-21. Una tabella usata come registro e mai analizzata accumula malformazioni invisibili

**Che cosa è successo.** La tabella dei vincoli e delle questioni della bacheca inter-agenti è la
fonte di verità di duecentoventuno sigle. Nessuno l'aveva mai analizzata a macchina. Alla prima
proiezione, il 27 agosto 2026, sono emerse **sei righe malformate**: quattro con una colonna in più
- la risoluzione scritta come colonna a sé invece che dentro lo stato -, una con una barra verticale
spuria dentro la prosa che spezzava la questione in due celle, e una, `Q-26`, **priva del tutto
della colonna di stato**. La riga di `Q-135` diceva nello stesso momento «`RISOLTA` da `ARCH`» nel
testo e `APERTA` nel gettone di stato, con l'ADR che la risolve già sul disco.

**Perché è insidioso.** Una tabella markdown malformata **si legge lo stesso**: l'occhio umano
ricompone le celle e non nota la colonna mancante. Il difetto resta invisibile finché qualcosa non
prova a leggerla in modo univoco - e in quel momento non è un difetto solo di forma, perché una riga
senza stato è una questione di cui **nessuno sa se sia aperta**.

**La regola.** Una struttura che funge da registro va **proiettata da uno strumento severo fin dal
primo giorno**: un generatore che rifiuta di produrre l'uscita e nomina la riga, invece di assorbire
la malformazione in silenzio. Il difetto sta nella fonte, non nella proiezione, e assorbirlo lo
renderebbe invisibile proprio nell'istante in cui è stato scoperto.

**Il presidio.** `scripts/genera-registri-di-vincoli-e-questioni.py` fallisce con il numero di riga
e non scrive nulla; `scripts/verifica-registri-di-vincoli-e-questioni.sh` fa fallire la costruzione
quando la proiezione non è rigenerabile o non è aggiornata.

---

### D-22. La definizione più citata di un progetto può essere quella che non è mai stata pubblicata

**Che cosa è successo.** I sei vincoli fondanti del progetto - sovranità del dato, separazione dal perimetro del dispositivo medico, integrabilità totale, consapevolezza del tenant, auditabilità immutabile, usabilità e accessibilità - erano citati **duecento volte** nella documentazione pubblicata e dichiarati in **nessun file pubblicato**. Vivevano solo in `.telemedic/context/00_PROJECT_BRIEF.md` §7, un documento di contesto interno. Ogni lettore esterno che seguiva uno di quei duecento rinvii trovava prosa che dava per nota la loro natura e il loro significato, senza mai trovare dove fossero definiti. Una ricerca nel corpus per «sovranità» produceva duecento risultati; una ricerca per «V1» produceva zero risultati. Il 27 agosto 2026 sono stati pubblicati in `docs/11_registri/03-vincoli-fondanti.md`, nelle due lingue, insieme a un controllo che li verifica.

**Perché è insidioso.** Ciò che è ovvio a chi lo usa ogni giorno viene taciuto come se fosse risaputo. La ricerca per una sigla fallisce non perché la sigla sia assente, ma perché è stata usata così a lungo che nessuno ricorda di averla mai visto scrivere. E il silenzio è invisibile: non è una lacuna nota, è l'assenza di una domanda - nessuno si accorge che qualcosa manca finché qualcuno non la cerca in un modo che la rivela. Nel frattempo ogni nuovo lettore deduce la natura dei vincoli dal contesto locale, e dieci lettori producono dieci interpretazioni.

**La regola.** Una definizione centrale a un progetto - cioè una che compare nel discorso più di qualche decina di volte - va dichiarata una volta sola, in un luogo designato e reso scopribile, **prima** che il corpus la citi in forma narrativa. Se il corpus la cita già, la dichiarazione recupera quel vincolo da `[NV]` a definizione verificabile. Una volta dichiarata, ogni nuova citazione nel corpus la può dare per nota. Una citazione che non sa dove la definizione vive non è una citazione: è un rimando che fallisce silenziosamente.

**Il presidio.** `scripts/verifica-registri-di-vincoli-e-questioni.sh`, riga `SIG-C1` della tabella, verifica che le sigle della forma `V-<numero>` citate nel corpus risolvano nei registri generati. **Il controllo attuale non copre le sigle `V1`…`V6`**, che designano i vincoli fondanti e seguono una forma diversa - nessun trattino, nessun numero a due cifre. Una copertura completa richiederebbe un'estensione del controllo per cercare anche la forma `V[1-6]` senza trattino. Fino a quel momento, la dichiarazione che il controllo presidia D-22 nel registro dei difetti è falsa, e va marcata `non-presidiata` o corredata di un'eccezione scoperta.

---

### D-23. Un cancello sulla corsia sbagliata protegge un percorso che nessuno percorre

**Che cosa è successo.** `scripts/verifica-dichiarazione-non-marcatura.sh` esiste dal principio,
è provato con sette casi negativi nel banco - fra cui un artefatto costruito deliberatamente privo
della dichiarazione - ed è invocato senza `continue-on-error` in fascia completa. La riga `T01-C7`
della tabella di collocazione lo dichiara bloccante, e il controllo che sorveglia quella tabella
apre il file di corsia e verifica che il comando ci sia davvero. Tutto in regola.

Il 27 agosto 2026 si è scoperto che `.github/workflows/docs.yml` - **il flusso che pubblica**, e
l'unico - costruisce il sito, carica l'artefatto delle Pages e lo distribuisce con
`actions/deploy-pages@v4` **senza invocare quel controllo nemmeno una volta**. Nemmeno
`fascia-di-rilascio.yml` lo invocava: firmava un artefatto che nessuno aveva verificato.
L'intestazione dello script affermava di sé «Questo controllo impedisce la pubblicazione».

**Perché è insidioso.** Ogni singolo presidio funzionava. Il controllo era scritto bene, provato
bene, collocato in una corsia reale, e la tabella che lo descrive diceva il vero. Il difetto non
sta in nessuno di quei livelli: sta nel fatto che **la corsia dichiarata non è il percorso che
produce il danno**. Un artefatto privo della dichiarazione veniva pubblicato mentre, in parallelo,
una corsia separata diventava rossa - e la rossa arrivava dopo, quando la copia era già scaricabile.
È la voce `D-13` portata al caso peggiore: là una tabella diceva dove stava un controllo che non
c'era; qui il controllo c'è, gira, e sorveglia un percorso che non è quello.

**La regola.** Per ogni controllo che protegge da un danno **irrecuperabile**, non ci si chiede
«in quale fascia sta», ma **«qual è il percorso che produce il danno, e il controllo sta su
quello?»**. Le due domande hanno risposte diverse più spesso di quanto sembri, perché le fasce
sono organizzate per costo di esecuzione e i danni per momento in cui accadono. Un controllo che
impedisce una pubblicazione sta nel flusso che pubblica; uno che impedisce una firma sta prima
della firma; uno che impedisce un rilascio sta nel rilascio. La fascia è dove il controllo gira
**anche**, non dove basta che giri.

**Il corollario, che vale da solo.** Se l'intestazione di uno script afferma di impedire qualcosa,
quell'affermazione è verificabile: si apre il flusso che compie l'atto e si cerca il comando. Una
capacità affermata da uno script su se stesso è una dichiarazione come le altre, e in questo
progetto una dichiarazione senza una prova che possa fallire è essa stessa un difetto.

**Il presidio.** Il controllo è ora invocato in `.github/workflows/docs.yml`, come passo del lavoro
`costruzione` **prima** di `actions/upload-pages-artifact`, e in `.github/workflows/fascia-di-rilascio.yml`
**prima** dei due passi di firma. La riga `T01-C7` della tabella nomina entrambe le collocazioni.

---

### D-24. La colonna che nomina il criterio non dimostra che il controllo lo verifichi

**Che cosa è successo.** `pipeline/collocazione-dei-controlli.tsv` ha una colonna `criterio` che
lega ogni controllo al criterio di traguardo che presidia. Il 27 agosto 2026, mentre si verificava
che cosa restasse aperto di `T-01`, sono emerse due righe che quella colonna faceva sembrare
presidiate e non lo erano.

La riga `T01-C8` dichiarava `T-01/8` e nominava `scripts/verifica-conformita-redazionale.sh`. Quel
controllo verifica il frontmatter YAML non quotato, i rinvii relativi che escono da `docs/` e i
segnaposto di segreti. Il criterio 8 di `T-01` riguarda le avvertenze pubbliche riallineate a
`D58` e prive di qualunque data di marcatura. Fra le due cose non c'è alcun rapporto. La seconda,
`SIG-C1`, dichiarava `T-01/5`, che era già di `T01-C5`: due righe sullo stesso criterio, e i due
controlli verificano oggetti diversi - identificativi di requisito citati nelle prove l'uno, sigle
`V-` e `Q-` citate nella documentazione l'altro.

**Perché è insidioso.** L'identificativo stesso della riga, `T01-C8`, ripete l'affermazione che la
colonna fa, e due affermazioni concordi si leggono come una conferma invece che come una sola
affermazione scritta due volte. Chi contava i criteri presidiati di `T-01` trovava otto righe e
otto criteri e concludeva che il traguardo fosse coperto per intero; il criterio 8 non aveva, e non
ha, alcun controllo. È la famiglia di `D-13` - una tabella che dice dove sta un controllo non dice
che il controllo sia là - spostata di un passo: qui il controllo esiste, gira, blocca ed è provato,
e ciò che è falso è **che cosa presidia**.

**La regola.** Una colonna che lega un controllo a un criterio afferma un fatto sul mondo, e va
verificata come tale: si apre il criterio, si legge che cosa chiede, si apre il controllo e si
guarda che cosa verifica. Quando l'identificativo del controllo contiene già il numero del
criterio, la coincidenza fra i due **non è una prova**: è la stessa affermazione che si conferma da
sola.

**Il corollario.** Correggere questa colonna **riduce** la copertura dichiarata, e questo è
l'esito giusto. Una tabella che sovrastima il presidio è peggiore di una che lo dichiara assente,
perché la seconda produce lavoro e la prima produce quiete. Corrette le due righe, il criterio 8 di
`T-01` è risultato privo di qualsiasi controllo, ed è così che è stato scritto nella roadmap.

**Il presidio.** Regola 6 di `scripts/verifica-collocazione-dei-controlli.sh`: ogni criterio nella
forma `T-NN/M` deve risolvere sul registro dei traguardi - il traguardo esiste e ha almeno `M`
criteri numerati. Non dimostra che il controllo verifichi quel criterio, che nessuno script può
sapere, ma toglie di mezzo il caso in cui il criterio citato non esiste affatto. La regola 7,
sotto, copre il resto.

---

### D-25. Una regola dedotta da due casi è un'ipotesi, e va provata sull'insieme prima di diventare un cancello

**Che cosa è successo.** Trovato il difetto di `D-24` su due righe, la regola per impedirne il
ritorno è stata dettata così: «nessun criterio datato può essere citato da due righe diverse,
perché se due controlli lo presidiano davvero la riga è una sola nella forma `A + B` che la tabella
già prevede». Sembrava una deduzione e non lo era: era una generalizzazione da due soli casi, e i
due casi erano entrambi difetti. Applicata al repository reale, la regola ha segnalato **diciannove
righe**, e tutte e diciannove erano legittime.

I criteri `T-03/2` e `T-03/4` sono, per il proprio testo, **collettivi**: il secondo enumera per
nome più controlli come oggetto congiunto, il quarto si applica per definizione a «i controlli non
compresi nel criterio 2», cioè al complemento di un insieme. E la forma `A + B`, invocata come
soluzione, non li rappresenta: descrive **un** controllo che vive in due luoghi e ammette una sola
fascia, mentre i controlli che presidiano `T-03/2` stanno in fasce diverse. La via d'uscita
proposta insieme alla regola non esisteva.

**Perché è insidioso.** La regola era vera sui casi da cui era stata tratta, e li avrebbe colti
entrambi. Il campione era piccolo e composto di soli esempi positivi: nessun controesempio poteva
comparire, perché non se ne era cercato alcuno. Un cancello nato così non si vede sbagliato quando
lo si scrive - si vede sbagliato quando lo si esegue, e a quel punto la tentazione è di disattivarlo
o di piegare i dati perché tornino, che sono i due modi di perdere la regola.

**La regola.** Prima di trasformare in cancello una regola dedotta da pochi casi, la si **esegue in
sola misura sull'insieme reale** e si guarda quante righe segnala. Se ne segnala molte, l'ipotesi
da esaminare per prima non è che il repository sia pieno di difetti: è che la regola sia scritta
male. E la domanda che decide non è «quante ne segnala», ma **«ho letto una per una le segnalazioni
prima di scegliere che farne?»**.

**Il corollario, sul come si corregge.** Una regola che segnala casi legittimi si **riscrive**, non
si disattiva e non si annacqua. Qui l'eccezione dei criteri collettivi vive in un file versionato
con la ragione scritta accanto a ciascuna voce - non in una lista dentro il controllo, che sarebbe
`D-10` - e se quel file manca il controllo esce `2` invece di indovinare. Una regola con
un'eccezione dichiarata e motivata è più forte di una regola senza eccezioni che nessuno esegue.

**Il presidio.** Regola 7 di `scripts/verifica-collocazione-dei-controlli.sh`, nella forma
riscritta, e `pipeline/criteri-collettivi.tsv` che ne porta le eccezioni. Quattro casi di banco: il
duplicato non dichiarato deve fallire, il duplicato dichiarato deve passare, `N/D` ripetuto deve
passare, e la dichiarazione assente deve uscire `2`. Quest'ultimo caso non usa l'attesa «fallisce»,
che accetterebbe qualunque uscita diversa da zero e confonderebbe l'errore d'uso con la violazione:
verifica il codice esatto.

---

### D-33. Un'espressione regolare scritta su una misura in minuscolo non vede le maiuscole

**Che cosa è successo.** Il 27 agosto 2026 il controllo `NV-C1` è stato allargato per riconoscere
quattro formule di destinatario che il corpus usava e l'espressione non vedeva. Le formule sono
state **misurate**, non dedotte, ed è la cosa giusta da fare: `grep -rho 'spetta a' docs | wc -l`
e così per le altre. L'espressione è stata scritta sulla forma misurata, il banco l'ha provata per
mutazione, il controllo è passato al verde e il numero delle marcature prive di destinatario è
sceso da 372 a 37.

Ventisei occorrenze reali restavano invisibili. Ogni formula scritta a **inizio di periodo** o a
inizio di **cella di tabella** porta l'iniziale maiuscola - «Da chiedere a» diciannove volte, «Va
richiesto a» quattro, «Spetta a» tre - e nessuna di esse corrispondeva a un'espressione costruita
su `da chiedere a`. Fra quelle ventisei c'erano tre marcature che indirizzavano **esplicitamente e
per nome** a un ente: all'agenzia dell'identità digitale, ad AGENAS, all'area tecnica del fascicolo.
Il controllo le accusava di non dichiarare un destinatario che stava scritto nella stessa riga.

**Perché è insidioso.** Non è disattenzione, ed è per questo che va scritto qui: **la misura e
l'espressione condividono la stessa assunzione**. Chi misura con `grep 'da chiedere a'` vede
diciannove occorrenze in meno e non ha modo di accorgersene, perché il conteggio che userà per
convincersi di aver coperto la forma è prodotto dallo stesso comando che la sbaglia. Il banco non
poteva aiutare: le tenute erano state scritte dallo stesso autore, sulla stessa forma, e sono
passate tutte. È la voce `D-31` vista da un'altra angolazione - un banco verde prova che il
controllo fa ciò che l'autore intendeva, mai che ciò che l'autore intendeva copra la regola.

C'è un secondo motivo. L'iniziale maiuscola non è un caso limite del corpus: è **la forma normale**
di una frase italiana che comincia, e di una cella di tabella. La forma più frequente era quella
esclusa.

**La regola.** Quando si misura una forma nel corpus per scriverci sopra un'espressione regolare,
**si misura anche il verso che si sta per escludere**: `grep -c 'da chiedere a'` va accompagnato da
`grep -c 'Da chiedere a'` prima di concludere. Vale per l'iniziale, e per ogni altra variazione che
un testo naturale produce da sé senza che nessuno l'abbia decisa: maiuscola d'inizio, accento,
apostrofo tipografico contro apostrofo dritto, forma plurale, forma passiva. Nell'espressione si
rende indifferente **solo la parte che deve esserlo** - qui l'iniziale, con `[Dd]a` - e mai
l'espressione intera: `IGNORECASE` avrebbe fatto riconoscere `comp` come se fosse la sigla d'area
`COMP`, che è maiuscola per convenzione dichiarata.

**Il presidio.** Il caso «marcature non verificate: la formula a inizio di periodo e di cella si
riconosce» in `scripts/prove/esegui-prove.sh`, su una tenuta che porta le formule a inizio di
periodo e dentro una cella. Provato per mutazione: riportando l'iniziale a sola minuscola cade
quel caso e nessun altro. Resta scoperto il caso generale - **nessun controllo verifica che
un'espressione regolare copra le varianti tipografiche della forma che dichiara di riconoscere** -,
ed è debito dichiarato: non è presidiabile da uno script, perché richiede di sapere quale forma
l'espressione intendeva coprire, e quell'intenzione vive solo nel commento.

### D-32. Una bonifica applicata a un file generato sparisce alla generazione successiva

**Che cosa è successo.** Il 27 agosto 2026 centottantadue rinvii testuali sono stati convertiti in
collegamenti per chiudere il criterio 7 di `T-02`, e il controllo `RT-C1` è passato al verde.
Centoventi di quelle conversioni stavano nei due capitoli di `docs/11_registri/`, che **sono
generati** da `scripts/genera-capitoli-dei-registri.py`. La sera dello stesso giorno una modifica
alla bacheca ha reso necessario rigenerarli. La rigenerazione ha annullato tutte e centoventi le
conversioni in un colpo solo, e `RT-C1` è tornato rosso con quaranta rilievi.

Il difetto non era nel controllo, che ha fatto esattamente il suo mestiere segnalando la
regressione lo stesso giorno in cui è avvenuta. Era nel punto in cui la correzione era stata
applicata: **al prodotto invece che alla sorgente**. Un file generato non ha memoria di ciò che
qualcuno gli ha scritto sopra.

**Perché è insidioso.** I due capitoli portano in testa l'avvertenza «Questo capitolo è generato.
Modificarlo a mano non ha effetto: la modifica sparisce alla rigenerazione successiva». L'avvertenza
c'era, era in cima al file, ed è stata letta da chi ha fatto la bonifica. Non è servita, perché una
bonifica non si vive come «modificare a mano un capitolo»: si vive come «far passare un controllo»,
e il file su cui il controllo segnala è il prodotto. **L'avvertenza parla del gesto, mentre chi
lavora pensa all'esito**, e i due non si incontrano.

C'è un secondo motivo per cui è insidioso: fra la bonifica e la rigenerazione può passare molto
tempo. Se la bacheca non fosse cambiata quel giorno, la regressione sarebbe arrivata settimane dopo,
in un commit che non c'entrava nulla, e la causa sarebbe stata cercata ovunque tranne che in una
correzione fatta un mese prima.

**La regola.** Prima di applicare una bonifica che fa passare un controllo, si guarda **se il file
è generato**, e se lo è la correzione si scrive **nel generatore**. Vale per ogni artefatto
prodotto da uno script di `scripts/`: i due capitoli dei registri, i registri `.tsv` proiettati
dalla bacheca, il registro dei componenti, la matrice di tracciabilità. La domanda da farsi non è
«dove segnala il controllo» ma **«chi scrive questo file»**.

**Il presidio.** La conversione dei rinvii ora vive in `collega_rinvii()` dentro
`scripts/genera-capitoli-dei-registri.py`, con il commento che spiega perché sta lì e non nel testo.
Il banco ha un caso che genera un capitolo da una tenuta sintetica contenente un rinvio testuale e
verifica che l'uscita porti un collegamento: se qualcuno riportasse la conversione fuori dal
generatore, quel caso cadrebbe. Resta scoperto il caso generale - **nessun controllo verifica oggi
che una bonifica non sia stata applicata a un file generato** -, ed è debito dichiarato: sarebbe
scrivibile confrontando l'uscita del generatore con il file versionato, ed è la stessa forma del
controllo di divergenza già in uso per le due lingue.

### D-31. Un banco scritto da chi ha scritto il controllo prova la forma prevista, non la regola

**Che cosa è successo.** Il 27 agosto 2026 sei controlli nuovi erano tutti verdi sul repository e
tutti provati per mutazione: duecentoquarantotto casi, nessuno rosso, ogni controllo visto fallire
almeno una volta su una tenuta costruita apposta. Una revisione indipendente, condotta lo stesso
giorno con il mandato esplicito di cercare **ciò che il banco non aveva colto**, ha trovato
**cinque falsi negativi riproducibili** - casi in cui una violazione reale e ben formata viene
ignorata e lo script dichiara «conforme» con uscita zero.

Nessuno dei cinque era esotico. Una scheda di traguardo con il mese abbreviato - `1 ago. 2026`
invece di `1 agosto 2026` - nella stessa forma già in uso nella tabella di sintesi dello stesso
documento: il traguardo finiva fra i «saltati» e una divergenza di un mese intero passava. `IFS`
impostato su una riga e `read` sulla successiva, che è **peggio** della forma vietata perché `IFS`
resta impostato per il resto dello script. Un recinto di codice aperto indentato dentro un elenco
numerato e chiuso a colonna 1, che rendeva invisibile ogni rinvio del resto del file. Una riga di
tabella scritta `|Q-99|` invece di `| Q-99 |`, resa identica dal markdown e completamente ignorata
dal controllo. E un limite di analisi che il commento dello script dichiarava in un verso solo.

**Perché è insidioso, e non è una questione di casi in più.** Chi scrive un controllo costruisce la
tenuta a partire dalla forma che ha in mente, cioè **la stessa forma su cui ha scritto
l'espressione regolare**. La tenuta e il controllo condividono l'assunzione, e nessun numero di casi
scritti dallo stesso autore la mette in discussione: sono tutti dentro lo stesso presupposto. Il
banco verifica che il controllo faccia ciò che l'autore intendeva; non verifica che ciò che l'autore
intendeva copra la regola.

**La regola.** Ogni controllo nuovo va sottoposto a una lettura di qualcuno - o qualcosa - che **non
lo ha scritto**, con un mandato preciso: non «va bene?», ma **«trova un caso che dovrebbe segnalare
e non segnala»**. La domanda formulata così produce risultati; formulata come richiesta di parere
generico produce complimenti. E il risultato torna nel banco: un falso negativo trovato e corretto
senza un caso che lo fissi è un difetto che aspetta la prossima riscrittura.

**Il corollario, sui limiti che non si correggono.** Uno dei cinque non era correggibile - legare un
destinatario alla singola marcatura richiede di capire il testo, non di leggerlo. Quel limite è
diventato **un caso di prova che attende esito positivo**, con il nome che dichiara di essere un
limite noto. Vale più della sua descrizione in un commento: chi un giorno lo correggerà vedrà il
caso cambiare esito, invece di dover scoprire da solo che cosa il controllo non guardava.

**Il presidio.** Il blocco «Controllo 31» di `scripts/prove/esegui-prove.sh`, che raccoglie i sette
casi in un gruppo separato invece di distribuirli fra i controlli di appartenenza: raggruppati
dicono **che classe di errore rappresentano** - la forma legittima ma diversa da quella prevista -
e ricordano di cercarla per ogni controllo nuovo. La regola sulla revisione indipendente, invece,
resta disciplina: nessuno script può verificare che una revisione sia stata fatta da qualcuno che
non ha scritto il codice.

---

### D-30. L'esito che si legge in fondo a una catena di comandi non e' quello del comando

**Che cosa è successo.** Il 27 agosto 2026 la costruzione del sito è stata lanciata come
`npm run build 2>&1 | tail -25`, e il codice di uscita letto è stato `0`. **La costruzione era
fallita**: la locale inglese si era interrotta su quattro collegamenti verso file inesistenti, e
`website/build/en` non era stato prodotto affatto. Lo `0` era l'esito di `tail`, che aveva letto le
sue venticinque righe con successo - come fa sempre, qualunque cosa dica il comando a monte.

Il falso verde è durato più di un'ora, e in quell'ora il lavoro è proseguito sulla convinzione che
i collegamenti nuovi risolvessero tutti. Se ne è accorto un altro controllo,
`scripts/verifica-ricerca.sh`, che ha detto una cosa apparentemente diversa - «directory
dell'artefatto assente (inglese)» - e che era invece la stessa cosa vista dall'altro capo.

**Perché è insidioso.** Non è un errore di distrazione ed è per questo che vale una voce: la forma
`comando | tail` è **il modo normale** di guardare l'esito di un comando prolisso, e in quella forma
l'informazione che serve - l'esito - è esattamente quella che la catena distrugge. Il testo che
resta a schermo, poi, viene dal comando vero, quindi *sembra* la sua risposta; solo il numero non lo
è. E la coda di una costruzione fallita di Docusaurus contiene messaggi di errore che assomigliano a
quelli che compaiono anche nelle costruzioni riuscite.

**La regola.** L'esito di un comando si legge **sul comando**, mai in fondo a una catena. In forma
interattiva: `comando > registro.log 2>&1; echo $?`, e la coda si guarda dopo, sul file. Negli
script: `set -o pipefail`, oppure `${PIPESTATUS[0]}` quando la catena serve davvero. Vale anche per
la forma opposta, già registrata come `C-2`: un comando che **esce con successo** restituendo una
riga vuota - `git log` su un file non tracciato - richiede di imporre il valore predefinito
**dopo**, con `[ -n "$t" ] || t=0`, mai con `||` sul comando.

**Il corollario, sulla lettura degli esiti in generale.** Quando due controlli dicono cose diverse,
la spiegazione più probabile non è che uno dei due sbagli: è che **guardino cose diverse**. Qui il
controllo della ricerca vedeva l'assenza dell'artefatto inglese e la costruzione dichiarava
successo, e la contraddizione era l'unico indizio disponibile. Una contraddizione fra due
osservazioni va inseguita fino a capire quale delle due misura che cosa, e non risolta scegliendo
quella più comoda.

**Il presidio.** `scripts/verifica-pipefail.sh`, riga `PF-C1` di
`pipeline/collocazione-dei-controlli.tsv`, bloccante in fascia rapida: ogni script **eseguibile**
che contiene una catena di comandi deve dichiarare `pipefail`. Le librerie - file non eseguibili,
inclusi con `source` - sono escluse, perché le loro catene girano con le impostazioni del chiamante
e una libreria che imponesse `set` altererebbe l'ambiente di chi la include.

**Una rettifica sulla misura, fatta il giorno stesso.** La prima stesura di questa voce affermava
che `verifica-trattini.sh` «contiene quattro catene ed è quindi esposto allo stesso difetto».
**È falso.** Le quattro barre verticali contate erano `||` e occorrenze dentro commenti: contate
con `grep -c '|'`, che non distingue l'operatore dalla catena. Lo script ha **zero** catene, e
l'unico file senza `pipefail` era la libreria `scripts/lib/date-dei-traguardi.sh`, che non deve
averlo. La misura grezza aveva prodotto un'accusa sbagliata dentro la voce di runbook scritta per
denunciare un'accusa sbagliata - e la lezione è la stessa che la voce `D-25` già porta: contare non
è misurare, e il conteggio va fatto sullo stesso criterio che il controllo poi applicherà.

**Ciò che resta senza presidio, ed è la metà del difetto.** Il falso verde del 27 agosto non è nato
dentro uno script: è nato da un comando digitato a mano. Nessun controllo può presidiare la forma
usata da chi lavora in forma interattiva, dove la disciplina resta l'unica difesa - si scrive
`comando > registro.log 2>&1; echo $?` e si guarda la coda dopo, sul file.

---

### D-29. Una regola scritta nel runbook e presidiata da soli commenti viene riviolata da chi l'ha scritta

**Che cosa è successo.** Il 26 agosto 2026 il repository ha trovato, corretto e registrato la voce
`C-1`: per `bash` la tabulazione è un carattere di `IFS` **bianco**, due tabulazioni consecutive
vengono fuse, e ogni campo vuoto fa scalare di uno tutti quelli che seguono. La regola è stata
scritta in chiaro - *«i campi si estraggono per posizione con `cut -f`, che i campi vuoti li conta.
Mai con `read`»* - e presidiata con un caso di regressione nel banco e **tre commenti di
avvertimento** in tre script diversi.

Il 27 agosto, scrivendo due controlli nuovi con il runbook aperto sulla stessa scrivania, la regola
è stata **riviolata due volte**. Il difetto si è manifestato in un modo che merita di essere
riportato: un caso di prova costruito apposta per fallire **è passato**, perché il campo vuoto della
tenuta era stato riassorbito e la condizione che doveva scattare leggeva un'altra colonna.

Nel misurarne l'estensione è emerso il resto. La correzione del 26 agosto aveva lasciato in piedi
una **seconda occorrenza nello stesso script già corretto**, `verifica-registro-dei-difetti.sh`, su
una proiezione a cinque colonne di cui la quarta è la casella `bloccante_dal`. Quella casella è
vuota **per costruzione su ogni voce ancora bloccante**: oggi il registro non ne ha alcuna, quindi
il difetto non cade; la prima voce bloccante che vi entrerà farà leggere al controllo il **numero di
riga** come se fosse una data.

**Perché è insidioso, e non è una questione di disattenzione.** Chi scrive uno script nuovo non
legge i commenti degli script vecchi: li legge chi modifica *quegli* script. Un commento presidia il
punto in cui sta, non la regola. E il runbook stesso - il documento che esiste perché un errore non
si ripeta - non è un presidio: è una memoria, e una memoria non si oppone a nulla nel momento in cui
si scrive la riga sbagliata. Fra il momento della lettura e quello della violazione passano ore, e
in mezzo c'è il resto del lavoro.

**La regola.** Ogni voce di questo runbook che descriva una proprietà **meccanicamente verificabile**
va trasformata in un cancello, non in un avvertimento. Il criterio per distinguere è netto: se si
può scrivere uno script che risponda sì o no leggendo i file, allora l'avvertimento non basta e la
voce resta debito finché il cancello non esiste. Le voci che restano legittimamente senza presidio
sono quelle che descrivono un **errore di metodo** - una deduzione sbagliata, una fretta - dove uno
script cadrebbe nello stesso errore di categoria che la voce descrive.

**Il corollario, sulla misura dell'estensione.** Quando una regola nota viene riviolata, la domanda
giusta non è «dove ho sbagliato adesso» ma **«quante altre volte è già successo e non lo sappiamo»**.
Qui la seconda domanda ha prodotto un difetto latente in uno script che si riteneva corretto - e
lo ha prodotto solo perché la ricerca è stata fatta su **tutti** gli script, non sui due appena
scritti.

**Il presidio.** `scripts/verifica-lettura-dei-tsv.sh`, riga `TSV-C1` di
`pipeline/collocazione-dei-controlli.tsv`, bloccante in fascia rapida. Cinque casi nel blocco
«Controllo 27» di `scripts/prove/esegui-prove.sh`, fra cui quello che distingue una riga che **usa**
la forma vietata da un commento che la **nomina** per spiegarla: senza quella distinzione il
controllo segnalerebbe i tre commenti di avvertimento che presidiavano la regola prima di lui, il
che sarebbe insieme corretto e inutile.

---

### D-28. La stessa data scritta in tre punti si aggiorna in uno, e il documento contraddice se stesso

**Che cosa è successo.** Il 27 agosto 2026 la ritaratura del calendario ha spostato `T-03` e `T-07`
dal 26 settembre al 5 settembre. La modifica ha toccato le **schede** dei due traguardi in
`docs/09_roadmap/02-traguardi.md` e ha lasciato intatte le altre due rappresentazioni della stessa
data nello stesso capitolo: la barra del **diagramma di Gantt** al §7 e la riga della **tabella di
sintesi** al §7.1. In entrambe le lingue. Per un giorno il capitolo ha dichiarato «5 settembre» in
un punto e «26 settembre» in altri due, senza che nulla lo segnalasse.

Nel misurarlo è emerso che la divergenza era **anteriore** alla ritaratura e più estesa di essa: il
diagramma italiano faceva cominciare `T-03` il 27 agosto e quello inglese il 12 settembre, e il
paragrafo che spiega la sovrapposizione fra `T-01` e `T-03` esisteva soltanto in italiano. Il
disallineamento non era l'effetto di una modifica frettolosa: era lo stato normale di un documento
in cui la stessa affermazione vive in sei copie e nessuna sa delle altre.

**Perché è insidioso.** Nessuna delle sei copie è sbagliata in sé. Ciascuna, letta da sola, è
plausibile, e chi legge il capitolo per decidere qualcosa ne legge **una**: la tabella di sintesi se
vuole il quadro, il diagramma se vuole la catena, la scheda se vuole la motivazione. Il lettore non
ha modo di sapere che le altre due dicono altro, e il documento non ha modo di dirglielo. Peggio:
gli strumenti che il progetto ha - il controllo di divergenza fra le lingue, quello delle ancore,
quello della conformità redazionale - guardano tutti la **relazione fra documenti**, e nessuno
guardava la coerenza di un documento **con sé stesso**.

**La regola.** Quando un dato compare più di una volta nello stesso documento, una delle occorrenze
è la **fonte** e le altre sono **copie**; e la fonte è quella che porta con sé la motivazione, non
quella che compare per prima. Qui la fonte è la scheda del traguardo, perché è l'unica delle tre a
dire *perché* quella data è quella. Le copie si aggiornano nella stessa modifica che tocca la fonte,
mai in una successiva, e la loro coerenza non si affida all'attenzione di chi modifica: la verifica
uno script.

**Il corollario, che vale oltre le date.** Un diagramma e una tabella di sintesi non sono
illustrazioni del testo: sono **affermazioni autonome**, che continuano a dire ciò che dicevano anche
dopo che il testo è cambiato. Ogni volta che si aggiunge una rappresentazione sintetica di un dato
già scritto altrove - un diagramma, una tabella riassuntiva, un cruscotto - si aggiunge una copia
che potrà divergere, e la si aggiunge **insieme al controllo che la lega alla fonte**, non dopo.

**Il presidio.** `scripts/verifica-coerenza-delle-date.sh`, riga `CD-C1` di
`pipeline/collocazione-dei-controlli.tsv`, bloccante in fascia rapida dal primo giorno - senza data
di innesco, perché il repository era già stato riportato alla coerenza quando il controllo è nato, e
un controllo che nasce verde su un repository conforme non ha debito da scadenzare. Otto casi nel
blocco «Controllo 25» di `scripts/prove/esegui-prove.sh`, provati per mutazione su tenute costruite
apposta: diagramma divergente, tabella divergente, inglese divergente, traguardo datato e assente
dal diagramma, e i due errori d'uso che devono uscire `2` e non `0`. Il controllo **dichiara a ogni
esecuzione quali schede salta** - quelle la cui data non è di calendario, «2027» o «successiva al
congelamento dell'interfaccia» - perché un salto silenzioso è indistinguibile da una verifica
riuscita.

---

### D-27. Una corsia mai eseguita diverge in silenzio, e la scoperta arriva nel momento peggiore

**Che cosa è successo.** Il 27 agosto 2026, preparando l'esecuzione della fascia di rilascio - mai
eseguita: zero esecuzioni, zero rilasci - sono emerse due divergenze fra quella corsia e le altre
due, che nessuno poteva vedere perché nessuno l'aveva mai fatta girare.

La prima: `fascia-di-rilascio.yml` dichiarava `actions/setup-node@v4` e `node-version: 24.x`,
mentre `docs.yml` e `fascia-completa.yml` dichiarano `@v5` e `node 22`. **La corsia che firma
costruiva l'artefatto con un major di Node diverso da quella che pubblica.** Un artefatto firmato
ha senso se è l'artefatto che le persone ricevono; costruito con un altro interprete non è
garantito che lo sia, e la firma attesterebbe qualcosa che nessuno ha visto.

La seconda discende dalla prima ed è più concreta. Node 24 porta npm 11, e il comando che
`@cyclonedx/cyclonedx-npm` esegue per produrre la distinta - `npm ls --all` - **fallisce con npm
11.6.3**: `Cannot read properties of undefined (reading 'ruleset')`, dentro `OverrideSet.
haveConflictingRules` di arborist. Il difetto scatta quando il progetto dichiara `overrides` in
`package.json`, e questo progetto ne ha due, messi lì per ragioni di sicurezza. Misurato: con npm
10.9.8, che accompagna Node 22, lo stesso comando esce `0`. **Il passo della distinta di quella
corsia sarebbe quindi fallito alla prima esecuzione**, e con esso i due controlli bloccanti che
dalla distinta dipendono.

**Perché è insidioso.** Una corsia che non gira non è rossa: è **assente**, e l'assenza non compare
in nessun cruscotto. Peggio, la corsia di rilascio è per costruzione quella che gira **meno** e nel
momento in cui conta di più - il primo rilascio, quando l'attenzione è sul contenuto e non
sull'infrastruttura. Ogni divergenza accumulata in mesi si presenta tutta insieme, lì.

**La regola.** Una corsia che non è mai stata eseguita **va trattata come non funzionante finché
non lo è**, e la sua configurazione va **confrontata riga per riga** con quella delle corsie che
girano: versione dell'interprete, versione delle azioni, ordine dei passi. Le differenze si
giustificano una per una o si eliminano. E la prima esecuzione **si programma in anticipo, su un
oggetto che si può buttare**, mai sul primo rilascio vero.

**Il corollario, sugli strumenti di terze parti.** Uno strumento che invoca un altro programma
eredita i difetti di quel programma, e la versione di quel programma dipende dall'ambiente e non
dallo strumento. `@cyclonedx/cyclonedx-npm` non ha difetti qui: ne ha `npm`, che è la sua
dipendenza invisibile. Fissare la versione dell'interprete in tutte le corsie **allo stesso
valore** non è pedanteria di uniformità: è l'unico modo per cui un difetto trovato in una corsia
valga anche come garanzia per le altre.

**Il presidio.** Nessuno automatico, e va detto invece di lasciarlo intendere. Un controllo che
confronti le versioni dichiarate dalle corsie sarebbe scrivibile - è una lettura di YAML e un
confronto - e **non esiste**. Oggi la garanzia è l'allineamento appena fatto e questa voce. La
riga sta nell'elenco delle voci senza presidio di questo runbook finché lo script non esiste.

---

### D-26. Un controllo verde sempre non si vede leggendo il codice: si vede solo sulle tenute

**Che cosa è successo.** Il 27 agosto 2026 è nato
`scripts/verifica-date-di-marcatura.sh`, il controllo che il criterio 8 di `T-01` non aveva mai
avuto. Cerca, dentro uno stesso capoverso, la co-occorrenza di una menzione della marcatura e di un
riferimento temporale. Eseguito sul repository reale ha detto: **nessun rilievo**. Eseguito sulle
tenute costruite apposta per farlo fallire - un capoverso che promette la marcatura «entro il primo
trimestre del 2029», un altro che la annuncia «no later than July» - ha detto la stessa cosa:
nessun rilievo. **Era verde sempre.**

La causa è di un carattere. I confini di parola erano scritti `\b`, che è sintassi PCRE. Il motore
usato, `awk`, adotta le espressioni regolari estese POSIX, dove `\b` non è un confine di parola:
ogni alternativa della famiglia temporale ne conteneva uno, nessuna corrispondeva mai, e la
condizione «c'è un riferimento temporale» era falsa per costruzione. Il controllo non era rotto in
modo rumoroso: rispondeva, contava i documenti, stampava il proprio verde.

**Perché è insidioso.** Un controllo verde su un repository sano è indistinguibile da un controllo
verde perché non guarda. Nessuna lettura del codice se n'era accorta - la riga *sembra* giusta a
chiunque abbia scritto più espressioni regolari in un linguaggio che le supporta - e nessuna
esecuzione sul repository reale poteva accorgersene, perché su un repository conforme il risultato
atteso è esattamente quel verde. **L'unico osservabile che distingue i due casi è la tenuta
deliberatamente non conforme**, ed è per questo che il banco esiste.

**La regola.** Un controllo appena scritto si esegue **prima** sulla tenuta che deve farlo fallire,
e solo **dopo** sul repository. L'ordine non è di comodo: eseguirlo prima sul repository produce un
verde che si legge come conferma e che spegne il sospetto proprio quando servirebbe. Vale in
particolare per i controlli che cercano l'**assenza** di qualcosa, dove il successo e il guasto
totale hanno lo stesso aspetto.

**Il corollario, sulle espressioni regolari.** La sintassi delle espressioni regolari non è una:
`grep -E`, `grep -P`, `awk`, `sed` e Python accettano cose diverse e ne **ignorano** altre in
silenzio invece di rifiutarle. `\b` in ERE non è un errore di sintassi: è la lettera `b`, oppure
niente. Ogni espressione regolare che usa una scorciatoia - `\b`, `\d`, `\w`, `\s` - va provata
nel motore in cui girerà davvero, e non in quello in cui è stata pensata.

**Il presidio.** Nove casi nel blocco «Controllo 23» di `scripts/prove/esegui-prove.sh`, fra cui i
due che hanno colto il guasto, e tre mutazioni che li isolano uno per uno. Non esiste un controllo
che verifichi le espressioni regolari altrui: il presidio è il banco, ed è sufficiente **solo se
ogni controllo nuovo vi entra con almeno una tenuta che deve farlo fallire**.

---

### D-34. Un tag di versione che sembra un tag maggiore, e non esiste

**Che cosa è successo.** Il 27 agosto 2026, alla prima esecuzione della corsia di rilascio, il
lavoro è caduto in nove secondi con `unable to resolve action 'sigstore/cosign-installer@v4'`. Il
tag `v4` non esiste in quel deposito: i tag pubblicati sono `v4.0.0`, `v4.1.0`, `v4.1.1`, `v4.1.2`.
La corsia era stata scritta giorni prima, era coerente con le altre e compariva nella tabella di
collocazione: nulla, nella sua lettura, la distingueva da una corsia funzionante.

**Perché è insidioso.** La forma `@v4` è **corretta e diffusa**: molte azioni pubblicano
deliberatamente un tag mobile di versione maggiore che segue l'ultima minore, e `actions/checkout@v5`
- che sta tre righe più sopra nello stesso file - funziona esattamente così. Non è una convenzione
della piattaforma: è una scelta di chi pubblica l'azione, e chi la usa non ha modo di dedurla dal
nome. GitHub Actions non risolve nulla da sé, si limita a cercare il riferimento e a fallire.

**La regola.** Ogni `uses: proprietario/azione@versione` si verifica contro i tag realmente
pubblicati, non contro l'aspetto del riferimento:
`gh api repos/proprietario/azione/git/refs/tags --jq '.[].ref'`. Vale anche - e soprattutto - per
le azioni copiate da un esempio della documentazione a monte, che invecchia.

**Il presidio.** Nessuno oggi, ed è debito dichiarato. È scrivibile: le righe `uses:` delle cinque
corsie si estraggono con un'espressione regolare e si confrontano contro l'API dei tag, con
fallimento sul riferimento inesistente. Costa una chiamata di rete per riferimento distinto, e
appartiene alla fascia estesa, non a quella rapida.

---

### D-35. Il bit di esecuzione è versionato, e uno script che gira qui può non girare in corsia

**Che cosa è successo.** `scripts/firma-artefatto.sh` era versionato con permessi `644`. Sulla
macchina di sviluppo veniva sempre invocato come `bash scripts/firma-artefatto.sh`, che funziona a
prescindere dal bit, e nessuno se n'era accorto. In corsia l'invocazione diretta è fallita.

**Perché è insidioso.** È lo stesso difetto già pagato due volte in questo repository - il registro
dei difetti rifiuta una riga che nomini un controllo privo del bit di esecuzione - ma qui si è
presentato dall'altro lato: non un controllo, uno script di rilascio, e non su questa macchina, in
corsia. **Il modo in cui si invoca uno script durante lo sviluppo nasconde il difetto che l'invoca
in produzione lo rivelerà.**

**La regola.** Ogni file `.sh` di `scripts/` porta il bit di esecuzione al momento in cui entra nel
deposito. Si verifica con `git ls-files --stage 'scripts/*.sh' | grep -v '^100755'`, che deve
restituire il vuoto - **sul contenuto dell'indice, non sui permessi della cartella di lavoro**, che
possono divergere.

**Il presidio.** Parziale: `scripts/verifica-registro-dei-difetti.sh` rifiuta una riga che nomini
come controllo uno script non eseguibile, quindi copre i controlli e non gli altri script. La
copertura piena è debito dichiarato, e costa una riga di banco.

---

### D-36. Un artefatto di distribuzione è una cartella, e ciò che lo firma vuole un file

**Che cosa è successo.** La corsia tentava di firmare `website/build`, che è una cartella. Lo
strumento di firma accetta un solo file e ha risposto `reading payload: read website/build: is a
directory`. Il difetto era invisibile finché la corsia non è girata, perché nessun controllo di
lettura può sapere che cosa quello strumento accetti.

**La regola, che non è «comprimere».** La compressione è la parte facile. La parte che si sbaglia è
**che cosa l'attestazione di provenienza dichiara**: se registra il nome e l'impronta dell'archivio
temporaneo, attesta un file che non esiste più e che nessuno potrà mai riprodurre, perché il nome
contiene un istante e l'impronta dipende dai metadati che l'archiviatore vi ha messo dentro.
L'attestazione deve dichiarare **il contenuto originale** - il nome della cartella e un'impronta
calcolata in modo riproducibile - e l'archivio resta un dettaglio del gesto di firma.

**Il presidio.** `scripts/firma-artefatto.sh` riconosce la cartella, calcola l'impronta prima di
comprimere, registra nome e impronta originali nell'attestazione e rimuove l'archivio temporaneo
con una trappola sull'uscita. Il caso di banco corrispondente è debito dichiarato: provarlo
richiede lo strumento di firma installato, che oggi il banco non ha.

---

### D-38. Un'assenza in un registro non è una prova di assenza, se non si sa che cosa elenca

**Che cosa è successo.** Il 27 agosto 2026, esaminando la prima esecuzione della corsia di rilascio,
ho letto il gruppo «GITHUB_TOKEN Permissions» del registro - `Contents: read`, `Metadata: read` - e
ho concluso che il permesso `id-token: write` non fosse concesso, benché dichiarato in testa al file,
e che la firma keyless non potesse quindi funzionare. L'ho scritto nel piano di `T-03` come secondo
difetto della corsia, accanto a quello vero.

**Perché era falso.** Quel gruppo elenca i permessi di **un solo token**, quello che la piattaforma
espone come `GITHUB_TOKEN`. Il permesso `id-token` governa un token diverso, emesso da un altro
servizio, e **non compare in quell'elenco per costruzione**: cercarlo lì è come cercare il numero di
targa in un passaporto. La prova sta altrove ed è inequivocabile - se il permesso mancasse, la firma
fallirebbe alla richiesta del certificato. Il registro della prima esecuzione riuscita mostra
«Generating ephemeral keys», «Retrieving signed certificate», «Successfully verified SCT» e due voci
nel registro di trasparenza pubblico.

**Perché è insidioso.** L'affermazione aveva tutte le apparenze di un accertamento: nominava un
registro, citava valori testuali, e la conclusione era plausibile. Mancava l'unica domanda che
contava - **che cosa elenca questo elenco?** - ed è la stessa forma della voce `A-1`: contare le
occorrenze misura la pratica, non la regola. Qui: leggere un elenco misura ciò che quell'elenco
contiene, non ciò che esiste. Il difetto è peggiore quando l'assenza *sembra* confermare un sospetto
che si aveva già, come qui, dove la corsia stava effettivamente fallendo per altro.

**La regola.** Da un'assenza non si conclude nulla finché non si è stabilito che cosa la fonte
elencherebbe se la cosa ci fosse. In concreto: si cerca la **prova positiva** - il passo che non
potrebbe riuscire senza ciò che si sospetta mancante - invece della conferma negativa. E se la prova
positiva non è disponibile perché il passo non è mai stato eseguito, l'affermazione si marca come
**non verificata** con il suo destinatario, non si scrive come fatto.

**Il presidio.** Nessuno, ed è disciplina di accertamento, non di costruzione. Il costo è pagato da
chi legge il piano: un difetto inesistente scritto accanto a uno vero fa perdere tempo con la stessa
efficacia di un difetto vero taciuto.

---

### D-37. Una versione maggiore nuova cambia il formato dell'uscita, non solo l'implementazione

**Che cosa è successo.** Risolti i tre difetti precedenti, la corsia è caduta di nuovo: la versione
maggiore `4` dello strumento di firma ha sostituito le due uscite separate - firma e attestazione -
con un unico contenitore, e l'opzione che chiedeva le due uscite separate non produce più nulla.
Il primo tentativo di rimedio è stato aggiungere l'opzione che, secondo le note di rilascio,
ripristina il comportamento precedente. **Quell'opzione non esiste nella versione installata**, e
la corsia è caduta una quarta volta su `unknown flag`. Il rimedio adottato è stato tornare alla
versione `3.10.1`, che produce nativamente le due uscite che il resto della catena si aspetta.

**Perché è insidioso, ed è la parte che vale.** Il difetto era sotto altri tre, e **ciascuno era
visibile solo dopo che il precedente era stato corretto**. Una corsia mai eseguita non contiene un
difetto: ne contiene una pila, e il numero di tentativi necessari non si può stimare guardandola.
Il secondo insegnamento è più scomodo: **le note di rilascio di un progetto a monte descrivono
l'intenzione, non ciò che è stato pubblicato.** L'opzione di compatibilità era annunciata e non
c'era. Ciò che decide è `--help` della versione che sta girando, non la pagina che la descrive.

**La regola.** Il salto di versione maggiore di uno strumento della catena di rilascio non è un
aggiornamento: è una migrazione, e si fa in un cambiamento suo, con la corsia eseguita davvero. Fino
a quel momento si resta sulla versione che produce il formato che il resto della catena consuma, e
la si dichiara **esatta** - `@v3.10.1`, mai `@v3` - così che la corsia non migri da sola il giorno in
cui il tag mobile avanza.

**Il presidio.** `scripts/verifica-coerenza-delle-corsie.sh` verifica che le dichiarazioni di
versione siano concordi fra le corsie, e questo copre la divergenza fra corsie ma non l'esattezza
del riferimento. Il presidio vero di questa voce è l'esecuzione: **una corsia mai eseguita non è una
corsia.** Vedi `D-27`, che dice la stessa cosa dal lato della divergenza silenziosa.

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
| D-28 | Controllo dei tag di GitHub Actions non automatico; proposta: verificare contro l'API |
| D-29 | Controllo dei permessi eseguibili negli script: `git ls-files --stage scripts/*.sh` |
