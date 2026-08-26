# Piano di lavoro - `T-07`, sito di documentazione con i controlli bloccanti attivi e la verifica registrata

> **Traguardo** `T-07` · **Classe** `D` · `[IMPEGNO]` · **26 settembre 2026**
> **Innesco** - immediato: il sito è già costruito e pubblicato, e ciò che resta è verifica.
> **Titolare** - contributore unico.
> **Dipendenze dichiarate** - `T-01` criterio 8 per il testo dell'avvertenza (**soddisfatto** al 26
> agosto 2026, per la rettifica di `00-indice.md` §8.4); `T-03` criterio 2 per la bloccanza del
> controllo sui collegamenti (**non soddisfatto**, e allocato al medesimo 26 settembre).
> **Data di misura dello stato** - 26 agosto 2026, sul ramo `main` al commit `b3498b7`.

## 0. La cosa da capire prima di tutto il resto

Il traguardo dice di sé stesso: *«Il sito esiste, è pubblicato in italiano e in inglese ed è
raggiungibile. Questo traguardo non lo costruisce: accerta che funzioni davvero.»* Letto così
sembra un traguardo di verifica, cioè leggero. **Misurato sul repository, non lo è**, e la ragione
sta in due criteri che il loro stesso enunciato fa sembrare accertamenti e che sono invece
costruzioni:

- **il criterio 2, la ricerca.** Non c'è nulla da verificare: **la ricerca non esiste**.
  `website/docusaurus.config.mjs` non contiene alcuna chiave `algolia` e `website/package.json` non
  contiene alcun greffone di ricerca locale. Il preset classico porta con sé il tema di ricerca fra
  le dipendenze transitive, ma **inerte senza configurazione**: nessuna barra di ricerca è resa.
  «Verificare che la ricerca funzioni» presuppone una ricerca, e va costruita.
- **il criterio 3, il cambio di lingua.** Il cambio di lingua funziona e conserva il percorso, per
  costruzione del tema. Ma il criterio chiede di più, e la parte in più non è soddisfatta: *«Dove la
  pagina inglese non esiste ancora, atterra su un avviso che dichiara che la traduzione è in corso e
  rinvia alla pagina italiana - mai su un errore e mai in silenzio sulla radice.»* Oggi Docusaurus
  serve, sotto l'indirizzo inglese, **il contenuto italiano**, senza alcuna dichiarazione. Non è un
  errore e non è la radice, ma **non è nemmeno l'avviso**: è la terza possibilità, il silenzio con
  contenuto sbagliato, che il criterio non contempla e che è peggiore delle due che vieta, perché un
  lettore anglofono non ha modo di sapere che sta leggendo una pagina non tradotta. È anche la
  ragione strutturale dei **quarantadue collegamenti rotti nella locale inglese**: pagine tradotte
  che rinviano ad aree non tradotte, servite in italiano, con ancore che nel frattempo sono diventate
  inglesi altrove.

Questi due criteri sono il peso reale di `T-07`, e nessuno dei due si legge nel titolo del traguardo.

## 1. I sei criteri, uno per uno

### 1.1 Criterio 1 - la navigazione funziona, e il controllo sui collegamenti è bloccante · **NON SODDISFATTO**

**Che cosa esiste.** Il criterio ha due metà e la prima è a buon punto. Le voci di menu di
`docusaurus.config.mjs` - `/docs/fondamenti/come-usare-questa-guida`, `/docs/architecture/indice`,
`/docs/security/indice`, `/docs/integration/indice`, `/docs/technical/indice`, `/docs/adr` - **sono
coerenti con la struttura dei sorgenti**: Docusaurus rimuove i prefissi numerici da cartelle e file,
quindi `docs/10_fondamenti/00-come-usare-questa-guida.md` produce l'identificativo
`fondamenti/come-usare-questa-guida`, e così per le altre. Nessun `slug:` è dichiarato in alcun file
di `docs/` - verificato, zero riscontri - e non ne serve alcuno. Le due barre laterali di
`sidebars.mjs` sono generate automaticamente dalle cartelle, quindi non possono puntare a pagine
inesistenti per costruzione.

La seconda metà **non esiste**: `docusaurus.config.mjs` dichiara `onBrokenLinks: 'warn'`,
`onBrokenAnchors: 'warn'`, `onBrokenMarkdownLinks: 'warn'`, `onDuplicateRoutes: 'warn'`, con il
commento che ne motiva la scelta come temporanea - *«il controllo si irrigidisce quando le aree sono
complete»*. Il residuo misurato è di **tre ancore rotte** e **quarantasei collegamenti rotti**, dei
quali **quarantadue nella locale inglese**.

**Che cosa manca, e la tensione da dichiarare.** L'irrigidimento richiede di portare i quattro
parametri a `'throw'`. Ma **quarantadue dei quarantasei rilievi si chiudono traducendo le aree**, e
la traduzione è `T-06`, allocato al **21 novembre 2026** - cioè **cinquantasei giorni dopo** la data
di `T-07`. `T-07` dichiara inoltre, fra ciò che non comprende, *«la completezza della versione
inglese, che è `T-06`»*. Il criterio 1, letto come irrigidimento su entrambe le locali, **è quindi
non soddisfacibile al 26 settembre senza fare il lavoro che il traguardo dichiara di non comprendere.**

Due vie, e la scelta è del committente perché cambia che cosa il traguardo promette.

**Via A - irrigidimento differenziato per locale, con innesco datato.** Si porta a `'throw'` la
costruzione italiana e si lascia `'warn'` quella inglese, con la **data dichiarata** in cui anche
l'inglese diventa `'throw'`: il 21 novembre 2026, chiusura di `T-06`. È esattamente la disciplina che
`T-03` criterio 4 impone - *«un controllo senza quella data non è ammesso: è il modo in cui una
riduzione temporanea diventa permanente»* - e ha già un precedente nel repository, la costante
`AVVERTENZE_BLOCCANTI_DAL` di `verifica-divergenza-traduzioni.sh`. *Costo dichiarato*: i parametri di
Docusaurus sono globali e non per locale, quindi la differenziazione si ottiene leggendo una
variabile d'ambiente nella configurazione e costruendo le due locali con due invocazioni distinte
invece che con una sola. È una modifica alla catena di costruzione del sito, non una riga di
configurazione, e va contata come tale.

**Via B - si accetta che il criterio 1 chiuda solo con `T-06`**, e `T-07` si dichiara raggiunto al
26 settembre con il criterio 1 **non soddisfatto**, cioè non raggiunto: sette criteri e sei
soddisfatti fanno un traguardo mancato, per `00-indice.md` §8.3.

Questo piano **raccomanda la via A** e la motiva: rende bloccante subito la locale che contiene il
corpus, che è ciò che il criterio presidia, e sottopone la locale inglese a un innesco datato invece
che a un'attesa indefinita. Ma la scelta è di chi decide, e va registrata.

**Come si dimostra.** Prova positiva: la costruzione della locale italiana passa con `'throw'`.
**Prova negativa**: un collegamento verso un documento inesistente e un'ancora verso una sezione
inesistente, introdotti deliberatamente, **fanno fallire la costruzione**. Il caso va in
`scripts/prove/esegui-prove.sh` accanto ai ventidue esistenti, non in un banco nuovo.

### 1.2 Criterio 2 - la ricerca funziona e restituisce risultati nella lingua attiva · **NON SODDISFATTO, E NON ESISTE**

**Che cosa esiste.** Nulla. Verificato: nessuna chiave `algolia` in `docusaurus.config.mjs`, nessun
greffone di ricerca fra le dipendenze dichiarate di `website/package.json`, nessun componente
sostituito sotto `website/src/` - che contiene soltanto `css/custom.css` e `pages/index.js`.

**Che cosa manca.** La ricerca, per intero, in una delle due forme, ciascuna con un costo che non è
di redazione.

**Forma con servizio esterno di indicizzazione.** Ha un tempo di attraversamento che **non dipende
dal progetto**: si presenta una candidatura, si attende l'approvazione, si attende il primo
passaggio dell'indicizzatore. È comportamento di **classe `B`** dentro un traguardo di classe `D`, ed
è la ragione per cui, se si sceglie questa forma, **la candidatura si presenta il primo giorno** e
non quando il resto del traguardo è pronto. *Costi ulteriori da dichiarare*: introduce una
dipendenza da un terzo per una funzione del sito, che va dichiarata a chi installa; e comporta
l'invio dei contenuti a un servizio esterno, il che è una scelta che il progetto non ha ancora fatto
in alcun documento - `[NV]`.

**Forma con indice locale, servito insieme al sito.** Non dipende da nessuno e si esegue in
autonomia. *Costi da dichiarare, e sono tre*: è un **componente di terze parti nuovo**, quindi entra
nella distinta dei materiali del sito che `verifiche.yml` già genera, e ricade sotto il controllo
sulle licenze e sotto il registro dei componenti di terze parti che `T-03` criterio 6 renderà
bloccante; va verificato che indicizzi **entrambe le locali separatamente**, che è precisamente ciò
che il criterio chiede - «nella lingua attiva» - e non tutti gli indicizzatori locali lo fanno bene
su un corpus di questa dimensione; e aggiunge peso all'artefatto pubblicato, su un corpus di 875.748
parole, il che va misurato e non assunto.

**Il progetto non ha scelto**, e questo piano **non sceglie al posto suo**: `[NV]` sulla forma. La
decisione va posta al committente **il primo giorno del traguardo**, perché la forma esterna ha coda
propria e sceglierla tardi la rende impraticabile entro il 26 settembre.

**Come si dimostra.** Il criterio ha due metà e la seconda è quella che si dimentica.

1. La ricerca è raggiungibile da ogni pagina di entrambe le locali del sito costruito.
2. **Restituisce risultati nella lingua attiva**: una parola che compare solo nella locale italiana
   restituisce risultati nella locale italiana, e una parola che compare solo nella traduzione
   inglese restituisce risultati nella locale inglese, **senza contaminazione fra le due**. La prova
   si costruisce con due termini scelti apposta, uno per locale, verificati preventivamente con
   `grep` come presenti in una sola delle due.
3. **Prova negativa**: un artefatto costruito con l'indice di ricerca deliberatamente assente o
   vuoto **deve far fallire** il controllo. È il caso che distingue «la ricerca c'è» da «la casella
   di ricerca c'è»: una casella che non trova nulla è peggio dell'assenza della casella, perché
   afferma implicitamente che il termine non esiste nel corpus.

### 1.3 Criterio 3 - il cambio di lingua funziona e atterra sulla pagina corrispondente · **NON SODDISFATTO**

**Che cosa esiste.** Il selettore di lingua è configurato (`{type: 'localeDropdown', position:
'right'}`) e le due locali sono dichiarate con etichette e lingue HTML (`it-IT`, `en-GB`). Il tema
conserva il percorso attraversando le locali: la prima parte del criterio - «atterra sulla pagina
corrispondente, non sulla radice» - è soddisfatta per costruzione. Le quattro aree tradotte
(`10_fondamenti` 21 file, `04_protocols` 11, `06_security` 11, `08_compliance` 11, per un totale di
**54 file su 145**) hanno pagine inglesi reali.

**Che cosa manca.** L'avviso per le pagine non tradotte, che è la seconda metà del criterio e la sua
parte sostanziale. Oggi la locale inglese serve il contenuto italiano in silenzio. Il criterio
esige un avviso che **dichiari che la traduzione è in corso** e **rinvii alla pagina italiana**.

**Che cosa serve.** Un componente che, nella sola locale inglese e sulle sole pagine il cui file
tradotto non esiste, renda l'avviso in testa alla pagina. Il progetto **non ha oggi alcun componente
sostituito** sotto `website/src/theme/`, quindi questo è il primo, e l'introduzione di un componente
sostituito è una scelta con conseguenze di manutenzione: si lega a una versione del tema e va
rivista a ogni aggiornamento maggiore. Va dichiarata come tale e non introdotta di slancio.

**Un collegamento con il controllo di divergenza che conviene sfruttare.**
`scripts/verifica-divergenza-traduzioni.sh` **calcola già** l'informazione necessaria: per ogni file
di `docs/` verifica l'esistenza del corrispondente sotto
`website/i18n/en/docusaurus-plugin-content-docs/current/` e ne emette l'esito. La stessa
partizione - tradotto / non tradotto - è ciò di cui l'avviso ha bisogno. Derivarla da lì invece di
ricalcolarla evita che due luoghi diano due risposte diverse alla stessa domanda, che è la classe di
difetto che questo progetto ha già pagato.

**Come si dimostra.** Tre accertamenti binari e una prova negativa:

1. da una pagina di un'area **tradotta**, il cambio di lingua atterra sulla pagina inglese
   corrispondente e non sulla radice;
2. da una pagina di un'area **non tradotta**, il cambio di lingua atterra su una pagina che **reca
   l'avviso** e **contiene il collegamento alla pagina italiana**;
3. in nessun caso il cambio di lingua produce un errore o la radice;
4. **prova negativa**: una pagina di area non tradotta **priva** dell'avviso fa fallire il controllo.
   Senza questo caso il criterio 3 è verificato a vista, e il criterio 6 chiede l'opposto.

### 1.4 Criterio 4 - collegamento alla dichiarazione raggiungibile dal sito, con indirizzo assoluto · **SODDISFATTO NELLA SOSTANZA, CON UN RESIDUO**

**Che cosa esiste.** Il piè di pagina di `docusaurus.config.mjs`, colonna «Avvertenze», contiene tre
voci con `href` assoluti verso il repository:
`https://github.com/fedcal/Telemedic/blob/main/NOT-A-MEDICAL-DEVICE.md`, la stessa forma per
`THIRD-PARTY-TERMINOLOGY.md` e per `DISTRIBUTION-POLICY.md`. Le etichette sono tradotte in
`website/i18n/en/docusaurus-theme-classic/footer.json` («Not a medical device», «Third-party
terminologies», «Distribution policy»). Il piè di pagina compare su **ogni** pagina del sito. La
home reca inoltre il blocco dedicato marcato con la classe `tmWarn` (`website/src/pages/index.js`).

**E soprattutto: la proprietà è già presidiata da un controllo bloccante.**
`scripts/verifica-dichiarazione-non-marcatura.sh` verifica l'esistenza dei due documenti sorgente,
la presenza nell'artefatto pubblicato di un collegamento che citi il nome letterale dei due file, e
la presenza di `tmWarn` nella pagina d'ingresso. Il lavoro `dichiarazione-non-marcatura` di
`verifiche.yml` lo esegue **su entrambe le locali** (`website/build` e `website/build/en`) e **non è
`continue-on-error`**. Il controllo è fondato su elementi **strutturali** e non su una frase, scelta
motivata nel commento in testa allo script, e ha **sette casi di prova negativa** nel banco.

**Il residuo, che non è formale.** Il criterio dice *«Chiude `Q-26`»*. Ma la bacheca inter-agenti
porta la voce **`Q-198`, stato `APERTA`**, che si salda esplicitamente con `Q-26` e chiede una cosa
sola e non redazionale: *«inserire la verifica di raggiungibilità dei rinvii che escono da `docs/`
fra i controlli bloccanti prima del primo deploy, perché il controllo `G9` verifica i collegamenti
interni e non quelli assoluti verso il repository»*. Il controllo esistente verifica che il
collegamento **ci sia**, non che il bersaglio **risponda**. Un `href` assoluto verso un file
rinominato o spostato nel repository resta un `href` ben formato e passa il controllo, mentre chi lo
segue trova un 404.

**Che cosa manca, quindi.** Un controllo di **raggiungibilità** dei collegamenti assoluti verso il
repository, che è ciò che chiude `Q-26` insieme a `Q-198`. È piccolo e ha una trappola: dipende dalla
rete, quindi un guasto della rete diventerebbe un fallimento di costruzione indistinguibile da un
collegamento rotto. La forma robusta non interroga la rete: **verifica che il percorso citato
nell'`href` esista come file nel repository**, che è la stessa proprietà, si accerta localmente ed è
eseguibile da chiunque senza connettività.

**Come si dimostra.** Ogni `href` verso `https://github.com/fedcal/Telemedic/blob/main/<percorso>`
presente nella configurazione del sito e nei documenti corrisponde a un file esistente nel
repository; **prova negativa**: un `href` verso un percorso inesistente fa fallire il controllo.
Chiuso questo, `Q-26` e `Q-198` si chiudono insieme, e il criterio 4 è chiuso con la sua prova.

### 1.5 Criterio 5 - ogni pagina reca l'avvertenza di non marcatura, in entrambe le lingue · **VERO NEL FATTO, NON PROVATO**

**Che cosa esiste.** Il testo di copyright del piè di pagina reca l'avvertenza su ogni pagina, in
italiano nella configurazione - *«Questo software non è un dispositivo medico marcato CE. Chi lo
immette sul mercato o lo mette in servizio si assume gli obblighi che ne derivano.»* - e in inglese
in `footer.json` - *«This software is not a CE-marked medical device. Whoever places it on the
market or puts it into service takes on the obligations that follow.»* Il testo è riallineato a
`D58` e il criterio 8 di `T-01`, da cui questo criterio dipende, **è soddisfatto** secondo la
rettifica del 26 agosto 2026 in `00-indice.md` §8.4.

**Che cosa manca: la prova.** Il criterio dice **«ogni pagina»**. Il controllo esistente verifica
che **almeno una** pagina colleghi ciascuno dei due documenti - `grep -rlF ... >/dev/null`, che è
soddisfatto da un solo riscontro - e che `tmWarn` sia nella sola `index.html`. **Nessun controllo
accerta la proprietà su ogni pagina.** Se una pagina perdesse il piè di pagina - per una
sostituzione di componente, per una pagina resa fuori dal `Layout`, per un errore di costruzione
parziale - il controllo passerebbe.

**Come si dimostra.** Si estende `verifica-dichiarazione-non-marcatura.sh` con un accertamento
supplementare: **ogni** pagina HTML dell'artefatto contiene il marcatore strutturale
dell'avvertenza, e il controllo elenca le pagine che non lo contengono. Il marcatore va scelto
strutturale e non testuale, per la stessa ragione già scritta nel commento dello script: una
riformulazione del testo non deve rompere il controllo, ma una sparizione sì. **Prova negativa**: una
tenuta con una pagina HTML deliberatamente priva del marcatore fa fallire il controllo. Le tenute
esistenti - `artefatto-valido/`, che contiene già `index.html` e `docs/pagina.html` - sono il posto
dove il caso si aggiunge.

### 1.6 Criterio 6 - la verifica dei criteri 1, 2 e 3 è procedura eseguibile e ripetibile, con l'esito dell'ultima esecuzione registrato e datato · **NON SODDISFATTO**

**Che cosa il criterio chiede davvero.** Tre cose distinte, e la terza è quella su cui il mandato di
questo piano chiede attenzione.

1. Una **procedura**, cioè un documento con i passi e i comandi.
2. **Eseguibile e ripetibile**: chiunque la esegua due volte sulla stessa costruzione ottiene lo
   stesso esito. Ne discende che i passi non possono essere «si apre il sito e si guarda»: i tre
   criteri devono avere accertamenti automatizzati, che sono quelli descritti in §1.1, §1.2 e §1.3.
3. **L'esito dell'ultima esecuzione registrato e datato.**

**Che cosa significa «registrata», e dove.** Il criterio non dice dove, e questo è un `[NV]` del
documento di origine. La risposta si ricava però dalla disposizione già presa dal progetto, e
un'alternativa va esclusa esplicitamente.

**Un registro di esecuzione della catena di costruzione non è una registrazione.** I registri delle
esecuzioni non sono versionati, non sono consultabili senza credenziali sulla piattaforma, e
scadono. Il lavoro `distinta-dei-materiali` di `verifiche.yml` conserva il proprio artefatto per
**novanta giorni**: un artefatto che scade prima del rilascio del 30 novembre non è una
registrazione, è una comodità. Il progetto ha già una posizione su questo, nel criterio 2 di `T-01`:
la registrazione di approvazione è la corrispondenza fra revisione, revisore e approvazione **nel
repository**, nel modello «documenti come codice».

**Ne discende che «registrata» significa: versionata nel repository, consultabile da chiunque, con
la data.** I precedenti nel repository sono due e vanno seguiti invece che reinventati: il **registro
delle revisioni** di `docs/09_roadmap/00-indice.md` §8.4, che è narrativo, datato e pubblicato; e il
**registro degli identificativi di requisito**, `registro/identificativi-requisiti.tsv`, in sola
aggiunta, con formato dichiarato in `registro/README.md`.

**Proposta di questo piano, marcata come proposta.** Un registro delle verifiche del sito, in sola
aggiunta, collocato accanto al registro esistente - la collocazione più coerente è sotto `registro/`,
che è già la cartella dei registri del progetto - con una voce per esecuzione contenente: **data**,
**commit esaminato**, **esito per ciascuno dei criteri 1, 2 e 3**, e, in caso di esito negativo, che
cosa è stato fatto. La procedura che descrive i passi è invece un **documento controllato** e sta in
`docs/`; il candidato più coerente è l'area tecnica, accanto a `01_technical/09-integrazione-continua-e-rilascio.md`,
oppure l'area di conformità accanto a `08_compliance/10-controllo-dei-documenti.md`, che è la
procedura sotto cui il documento nasce. **La collocazione è una scelta e questo piano non la impone**:
`[NV]`, da chiudere con il committente.

**Una cosa che la voce deve dire, e che è facile omettere.** Il criterio dichiara: *«Che sia eseguita
da una persona che non ha costruito il sito non è un criterio, perché sotto `D54` non è producibile:
è una lacuna dichiarata.»* Ne discende che **ogni voce del registro deve dire che chi ha eseguito la
verifica è chi ha costruito il sito**, e che questa è una lacuna e non una conformità. Scriverlo
nella voce e non in una nota di testa è la stessa disciplina che `T-01` criterio 2 impone alla
coincidenza fra redattore e approvatore, ed è la prima voce di `Q-189`. Un registro che tace su chi
ha eseguito è un registro che, letto fra un anno da chi verifica, afferma implicitamente
un'indipendenza che non c'è stata.

**Come si dimostra.** La procedura esiste come documento versionato; il registro esiste con almeno
una voce; la voce più recente porta la data e il commit esaminato; e **rieseguire la procedura sullo
stesso commit riproduce lo stesso esito**. Quest'ultimo accertamento è la sola prova che la
procedura sia davvero ripetibile e non un verbale.

## 2. I controlli, per stato

L'inventario è misurato su `.github/workflows/verifiche.yml` e su `.github/workflows/docs.yml` al 26
agosto 2026. Va letto con una distinzione che il conteggio dei lavori nasconde: **un lavoro che gira
non è un controllo se non asserisce nulla che possa risultare falso.**

### 2.1 Attivi e bloccanti - cinque, di cui due aggiunti il 26 agosto 2026

| Controllo | Lavoro in `verifiche.yml` | Che cosa asserisce | Prova negativa |
|---|---|---|---|
| Terminologie sotto licenza | `terminologie` | `scripts/verifica-terminologie.sh`: identificatori di concetto accostati a marcatori del formato di rilascio; file in formato di rilascio tabellare; comandi che scaricano una terminologia sotto licenza | **Assente** |
| Conformità redazionale | `redazionale` | `scripts/verifica-conformita-redazionale.sh`: frontmatter con valori da quotare; rinvii relativi che escono da `docs/`; segreti in chiaro | **Assente** |
| Ricerca di segreti | `segreti` | Componente di terze parti sulla storia completa | **Assente** |
| Identificativi di requisito | `identificativi-requisiti` | `T-01` criterio 5: prova che cita un identificativo assente, ritirato, o registro malformato | **Presente**: 13 casi in `scripts/prove/esegui-prove.sh` |
| Dichiarazione di non marcatura | `dichiarazione-non-marcatura` | `T-01` criterio 7: documenti sorgente, collegamento nell'artefatto, blocco `tmWarn` in home; eseguito su **entrambe** le locali | **Presente**: 7 casi, più 2 sul sito reale |

**Un sesto lavoro che blocca ma non è un controllo.** `distinta-dei-materiali` genera la distinta del
sito e la carica come artefatto: **non asserisce nulla sul suo contenuto**. Una distinta priva di una
voce lo lascerebbe passare. L'asserzione mancante - *«un componente presente nella distinta e assente
dalle annotazioni fa fallire la costruzione»* - è il **criterio 6 di `T-03`** e appartiene a quel
traguardo, non a questo. Qui si registra soltanto perché il conteggio «sette lavori, sette controlli»
è falso e va corretto.

**Un settimo lavoro che non è in `verifiche.yml`.** La costruzione del sito in `docs.yml` **blocca**
su una proposta di modifica: una documentazione che non compila non può essere unita. È il gate che
il runbook di traduzione chiama *«il gate che nessuna ondata può saltare»*. Non asserisce nulla sui
collegamenti finché i quattro parametri restano a `'warn'`, ed è precisamente ciò che il criterio 1
cambia.

**Osservazione sulle prove negative mancanti.** Tre dei cinque controlli bloccanti **non sono mai
stati visti fallire**. Il progetto ha già enunciato la regola - *«Un controllo che nessuno ha mai
visto fallire non è un controllo»* - e ha già dimostrato che vale: sottoposto a prova di mutazione,
rendendo un controllo deliberatamente sempre-verde, il banco è passato da 17 casi conformi su 17 a
11 su 17. Colmare quelle tre lacune **non è un criterio di `T-07`**: appartiene al criterio 2 di
`T-03`, che elenca fra i controlli che bloccano da subito quello sulle terminologie e quello sui
termini vietati, ciascuno *«provato con un caso deliberatamente non conforme»*. Si registra qui
perché chi lavora su `T-07` tocca lo stesso banco di prova e ha l'occasione a costo marginale.

### 2.2 Attivi ma in sola segnalazione - uno, con due inneschi che non coincidono

**`divergenza-traduzioni`**, `continue-on-error: true`. Esegue
`scripts/verifica-divergenza-traduzioni.sh`, che confronta la data dell'ultima modifica registrata in
git per ciascun documento e per la sua traduzione, e che verifica inoltre il blocco inglese dentro
le tre avvertenze pubbliche bilingui.

**Il controllo è in esercizio e riporta**: Allineati 52, Divergenti 2, Assenti ed esigiti 0. I due
divergenti sono residui **dichiarati per data di commit** e non difetti di contenuto: il registro dei
difetti li documenta alla voce `A-2`, dove una correzione ortografica italiana (`sul obiettivo` →
`sull'obiettivo`) è invisibile in inglese e il file resta segnalato perché il controllo confronta le
date. La chiusura è quella che lo script stesso prescrive: *«si tocca comunque il file tradotto nello
stesso commit, così la relazione fra i due resta vera e il controllo non impara a mentire»*.

**I due inneschi, e la contraddizione.**

- **Nel codice del controllo**: `AVVERTENZE_BLOCCANTI_DAL="2026-09-12"`, con il commento che la
  qualifica come *«scadenza di `T-01`»*. Questo innesco riguarda **la sola parte sulle avvertenze
  pubbliche**, non l'intero controllo.
- **Nel commento del lavoro in `verifiche.yml`**: *«Non bloccante finché le tre aree esigite da `D56`
  - guida dei fondamenti, sicurezza, conformità - non sono tradotte per intero. Diventa bloccante
  nello stesso commit in cui l'ultima di quelle aree viene completata.»*

**Misurato, il secondo innesco è già scattato.** Le tre aree in `AREE_ESIGITE` - `10_fondamenti`,
`06_security`, `08_compliance` - hanno tutte la traduzione completa: 21, 11 e 11 file, in
corrispondenza uno a uno con `docs/`. Il controllo lo conferma da sé riportando **«Assenti ed
esigiti: 0»**. La condizione dichiarata per la bloccanza è quindi soddisfatta, e **`continue-on-error:
true` è oggi un residuo**, non una riduzione motivata.

**Che cosa `T-07` fa di questo.** Nulla, formalmente: la bloccanza differenziata del controllo di
divergenza è **criterio 3 di `T-03`**, e `00-indice.md` §8.4 la registra come già soddisfatta. Ma il
residuo va tolto, e va tolto adesso, perché la condizione che lo giustificava non esiste più e un
`continue-on-error` che sopravvive alla propria ragione è il meccanismo esatto per cui *«una riduzione
temporanea diventa permanente»* - parole di `T-03` criterio 4. Se la rimozione fosse eseguita nel
perimetro di `T-07`, va registrata come lavoro fatto per `T-03`.

**Attenzione a una cosa prima di togliere il `continue-on-error`.** I due file divergenti per data di
commit **farebbero fallire la costruzione** nel commit successivo alla rimozione, perché lo script
esce diverso da zero se `divergenti > 0`. Vanno chiusi **prima**, non insieme, e la loro chiusura è
già prescritta dal registro dei difetti.

### 2.3 Inesistenti - quattro, tutti prodotti da `T-07`

Ciascuno con la sua prova negativa, che è la condizione di ammissione al banco.

| # | Controllo | Criterio | Prova negativa richiesta |
|:-:|---|:-:|---|
| **N-a** | **Collegamenti e ancore bloccanti** - i quattro parametri di `docusaurus.config.mjs` a `'throw'`, sulla locale italiana subito e sulla locale inglese con **innesco datato al 21 novembre 2026** (chiusura di `T-06`) | 1 | Un collegamento verso un documento inesistente e un'ancora verso una sezione inesistente **fanno fallire la costruzione** |
| **N-b** | **Ricerca presente e per locale** - la ricerca è raggiungibile in entrambe le locali e restituisce risultati nella lingua attiva, senza contaminazione | 2 | Un artefatto con indice di ricerca assente o vuoto **fa fallire** il controllo |
| **N-c** | **Avviso di traduzione in corso** - ogni pagina della locale inglese il cui file tradotto non esiste reca l'avviso e il rinvio alla pagina italiana | 3 | Una pagina di area non tradotta **priva** dell'avviso **fa fallire** il controllo |
| **N-d** | **Avvertenza su ogni pagina, e raggiungibilità dei rinvii assoluti** - estensione di `verifica-dichiarazione-non-marcatura.sh`: marcatore strutturale su **ogni** pagina HTML; ogni `href` assoluto verso il repository corrisponde a un file esistente | 5, 4 | Una pagina HTML priva del marcatore **fa fallire**; un `href` verso un percorso inesistente **fa fallire** |

**Dove vanno.** Le prove negative vanno tutte in `scripts/prove/esegui-prove.sh`, accanto ai
ventidue casi esistenti, con le tenute sotto `scripts/prove/tenute/`. Non si crea un banco secondo:
due banchi divergono, e il primo ha già dimostrato - con la prova di mutazione - di accorgersi di un
controllo disattivato. Un banco che non lo fa è teatro.

**Quali entrano in pipeline come cancelli bloccanti.** N-a è un parametro della costruzione,
quindi blocca attraverso `docs.yml` e `dichiarazione-non-marcatura`, che già costruiscono il sito.
N-b, N-c e N-d sono script e vanno eseguiti senza alcun `continue-on-error`, con l'eccezione
dichiarata della parte inglese di N-a, che porta l'innesco datato.

**Come sono stati collocati davvero, il 26 agosto 2026, e in che cosa diverge da questo piano.**
Il piano diceva «vanno aggiunti come lavori» in `verifiche.yml`; quel flusso non esiste più - è
stato sostituito dalle quattro fasce (`fascia-rapida`, `fascia-completa`, `fascia-estesa`,
`fascia-di-rilascio`) - e la forma scelta **non è quella di tre lavori nuovi**, ma quella di tre
**passi** del lavoro `dichiarazione-non-marcatura` di `.github/workflows/fascia-completa.yml`. La
ragione è il costo, e va detta invece che dedotta: tutti e tre esaminano il **sito costruito**, e
un lavoro proprio ricostruirebbe il sito da capo - minuti - per eseguire controlli che, misurati
sul sito reale, costano frazioni di secondo l'uno. Quel lavoro la costruzione la fa già per
`T-01/7` e per la metà collegamenti di `G9`, quindi il costo marginale dei tre è solo quello dei
tre script. La fascia rapida non poteva ospitarli - non costruisce nulla - e la fascia estesa,
pianificata al lunedì, avrebbe lasciato pubblicato fino a sette giorni un menu rotto o una ricerca
che risponde nella lingua sbagliata. I tre hanno la loro riga in
`pipeline/collocazione-dei-controlli.tsv` come `T07-C1`, `T07-C2` e `T07-C3`, in fascia completa e
bloccanti; la regola 5 di `scripts/verifica-collocazione-dei-controlli.sh` verifica che quella
corsia li invochi davvero, quindi tabella e corsia non possono più divergere in silenzio.

## 3. La sequenza

### 3.1 Che cosa comincia il primo giorno, perché ha coda propria

**La decisione sulla forma della ricerca** (§1.2) e **la decisione sulla lettura del criterio 1**
(§1.1, via A o via B). La prima, se la scelta cade sul servizio esterno, ha un tempo di
attraversamento che non dipende dal progetto e va avviata subito o non si tiene la data. La seconda
determina che cosa il traguardo promette e non si decide a ridosso del 26 settembre.

### 3.2 Che cosa non dipende da nulla

- **N-d**, estensione del controllo esistente sulla non marcatura per i criteri 5 e 4, con le due
  prove negative. È il lavoro più piccolo e più sicuro del traguardo: estende uno script maturo,
  usa tenute che esistono già, e chiude `Q-26` insieme a `Q-198`.
- **La chiusura dei due divergenti per data di commit**, prerequisito della rimozione del
  `continue-on-error` (§2.2).
- **La bonifica delle tre ancore e dei quattro collegamenti non inglesi**, che riduce a zero il
  residuo che N-a troverà.

### 3.3 Che cosa dipende

- **N-c** dipende dalla partizione tradotto / non tradotto, che si deriva dal controllo di
  divergenza esistente.
- **N-a** dipende dalla bonifica di §3.2 e dalla decisione di §3.1. Nella via A dipende inoltre da
  una modifica alla catena di costruzione del sito, che va fatta prima dell'irrigidimento e non
  insieme, per non confondere un fallimento di configurazione con un collegamento rotto.
- **N-b** dipende interamente dalla decisione sulla forma.
- **Il criterio 6** dipende da tutti: registra l'esito dei criteri 1, 2 e 3 e non può precederli.
  È l'ultimo lavoro del traguardo e **non va compresso**, perché è quello la cui omissione non si
  vede: un traguardo con i cinque criteri sostanziali chiusi e il sesto no ha tutta l'aria di essere
  chiuso, e non lo è.

### 3.4 Che cosa è parallelizzabile

N-d, la chiusura dei divergenti e la bonifica dei collegamenti sono indipendenti fra loro e da tutto
il resto. N-b è indipendente da N-a e N-c. N-a e N-c toccano lo stesso oggetto - la locale inglese -
e vanno in serie: introdurre l'avviso cambia le pagine su cui l'irrigidimento si applica.

**Il vincolo che nessuna parallelizzazione supera.** `T-07` è allocato dal **12 al 26 settembre
2026**, esattamente la finestra che il diagramma alloca anche a **`T-03`**, e sovrapposta a **`T-14`**
fino al 19 settembre. Titolare unico. E il criterio 1 di `T-07` **dipende dal criterio 2 di `T-03`**,
che chiude l'ultimo giorno della stessa finestra. **La dipendenza è a scarto nullo su una finestra
condivisa**: è la caratteristica più rischiosa di questo traguardo e non si risolve pianificando
meglio, si risolve decidendo la via A e riducendo il criterio 1 alla locale italiana, oppure
accettando che `T-07` chiuda dopo `T-03`.

## 4. Il costo dichiarato

| Lavoro | Classe | Il costo dipende da | Comprimibile |
|---|:-:|---|---|
| N-d, avvertenza su ogni pagina e raggiungibilità dei rinvii | `D` | Estensione di uno script maturo su tenute esistenti. Il costo è basso e noto | Sì |
| Chiusura dei due divergenti | `D` | Due file, prescrizione già scritta | No: è prerequisito della rimozione del `continue-on-error` |
| Bonifica di 3 ancore e 4 collegamenti | `D` | Sette riscontri, ciascuno da leggere sul testo | Sì |
| N-a, irrigidimento | `D` | **Una decisione** (via A o B) e, nella via A, una modifica alla catena di costruzione del sito | No sul principio, sì sul perimetro |
| N-c, avviso di traduzione | `D` | **Il primo componente sostituito del progetto**, con il debito di manutenzione che ne discende. Non è redazione | No: è la metà sostanziale del criterio 3 |
| N-b, ricerca | **`D` con comportamento `B`** | **Una decisione sulla forma.** Nella forma esterna, una coda che non dipende dal progetto; nella forma locale, un componente di terze parti nuovo, con distinta, licenze e registro delle annotazioni | No |
| Criterio 6, procedura e registro | `D` | La collocazione, che è una decisione; poi il costo è quello di un documento e di un registro in sola aggiunta | No: è ciò che rende il traguardo verificabile |

**Sulla finestra.** Quattordici giorni di calendario, dal 12 al 26 settembre, condivisi con `T-03` e
`T-14`, sotto dieci-venti ore a settimana. Il piano **non dichiara che ci stanno**. Dichiara che
**due voci sono la causa se non ci staranno** - la ricerca e l'avviso di traduzione - e che entrambe
sono **decisioni prima di essere lavori**: prese il primo giorno, il lavoro comincia; prese a metà
percorso, il lavoro non comincia affatto.

## 5. I rischi propri, con la contromisura

La roadmap attribuisce a `T-07` i rischi `R-16` (divergenza fra le due lingue) e `R-19` (materiale
pubblico non allineato). Qui i rischi che nascono da questa esecuzione.

**La ricerca si scopre tardi come costruzione e non come verifica.** È il rischio dominante di
questo traguardo, ed è già materializzato nel senso che il criterio 2 non dichiara ciò che comporta.
*Contromisura*: la decisione sulla forma si pone il primo giorno; se al **19 settembre** non è presa,
il criterio 2 si dichiara non soddisfatto con la sua causa registrata, invece di essere inseguito
fino al 26.

**L'irrigidimento si accende su un residuo non azzerato e viene subito spento.** È il modo più
rapido per insegnare a tutti che quel controllo si può disattivare. *Contromisura*: l'ordine di
§3.2 e §3.3 - prima si azzera il residuo, poi si accende. E se accendendolo emergono rilievi non
previsti, **non si riporta a `'warn'`**: si chiudono i rilievi, oppure si registra la riduzione con
la data in cui rientra, come impone `T-03` criterio 4.

**L'avviso di traduzione viene introdotto come nota redazionale invece che come componente.** Una
nota scritta a mano in testa a un file inglese non esiste dove il file inglese non esiste - cioè
esattamente nei casi che il criterio riguarda. *Contromisura*: l'accertamento del criterio 3 va
scritto **prima** dell'avviso e deve fallire prima che l'avviso esista. Se non fallisce, sta
misurando la cosa sbagliata.

**«Verifica registrata» viene interpretata come registro della catena di costruzione.**
*Contromisura*: la posizione di §1.6, e l'osservazione concreta che l'unico artefatto conservato oggi
scade in novanta giorni, cioè prima del rilascio del 30 novembre.

**Il registro tace su chi ha eseguito.** *Contromisura*: la voce dichiara che l'esecutore è chi ha
costruito il sito e che questa è una lacuna, prima voce di `Q-189`, non una conformità.

**Un controllo nuovo tarato su una convenzione che il repository non usa.** Il precedente è del 26
agosto 2026 e sta in `00-indice.md` §8.4: il controllo di divergenza esteso alle avvertenze pubbliche
assumendo file `.en.md` separati **affermava il falso** con l'autorevolezza di una verifica
automatica. `T-07` introduce quattro controlli nuovi su tre classi di artefatti diverse.
*Contromisura*: per ciascuno, la convenzione reale si accerta sul repository prima di scrivere il
controllo, e si scrive nel commento in testa allo script.

**Il sito si rompe per una delle due trappole già pagate mentre si lavora sulla configurazione.**
Vedi §7.

## 6. Che cosa `T-07` non comprende, e dove è coperto

| Non comprende | Dove è coperto |
|---|---|
| La **completezza della versione inglese** | `T-06` per le aree prerequisito (21 novembre 2026), `T-09` per il resto (2027). È la ragione per cui i quarantadue collegamenti rotti della locale inglese **non sono lavoro di `T-07`**: sono l'ombra di `T-06` sul suo criterio 1 |
| La **pubblicazione degli artefatti di rilascio** | `T-10` |
| L'**accensione** del controllo bloccante sui collegamenti come criterio proprio | `T-03` criterio 2. `T-07` ne è utente e ne dipende |
| La **bloccanza differenziata del controllo di divergenza** | `T-03` criterio 3, già registrato come soddisfatto |
| L'**asserzione sulla completezza della distinta dei materiali** | `T-03` criterio 6 |
| Le **prove negative dei tre controlli bloccanti che non ne hanno** (terminologie, redazionale, segreti) | `T-03` criterio 2 |
| Che la verifica sia **eseguita da chi non ha costruito il sito** | Non è producibile sotto `D54`: **lacuna dichiarata**, `Q-189`, punto di decisione **30 settembre 2026** |
| Il **testo** dell'avvertenza di non marcatura | `T-01` criterio 8, **soddisfatto**. `T-07` ne verifica la presenza, non lo scrive |

## 7. Le due trappole già pagate, che questo traguardo tocca da vicino

**Non aggiungere `"type": "module"` a `website/package.json`.** I file generati da Docusaurus
verrebbero trattati come ESM e il caricamento differito si rompe con `require.resolveWeak is not a
function`, un errore che **non indica affatto la causa reale**. La configurazione è già in `.mjs`
per questo motivo. **`T-07` è il traguardo in cui questa trappola è più probabile**, perché tocca
`package.json` per introdurre la ricerca e tocca `docusaurus.config.mjs` per l'irrigidimento: sono
esattamente i due file in cui la tentazione nasce.

**Nel frontmatter YAML, i valori che contengono due punti seguiti da spazio vanno quotati.** Una
descrizione come `description: Metriche: come si leggono` fa fallire la costruzione con un errore di
indentazione **che non ha nulla a che vedere con l'indentazione**. Il controllo esiste
(`verifica-conformita-redazionale.sh` punto 1) e copre `docs/`. Se `T-07` introducesse pagine o
avvisi con frontmatter proprio fuori da `docs/`, quel controllo **non li vedrebbe**: il perimetro va
esteso nello stesso commit in cui le pagine nascono.

**Terza, che vale qui più che altrove.** I rinvii ai documenti alla radice del repository devono
essere **URL assoluti verso GitHub**: un percorso relativo che esce da `docs/` funziona su GitHub e
produce un 404 silenzioso sul sito. È il criterio 4 di questo traguardo e la sostanza di `Q-26`.

## 8. Definizione di fatto

- [ ] **1** - La costruzione della locale italiana passa con i quattro parametri a `'throw'`; un
      collegamento e un'ancora deliberatamente rotti **la fanno fallire**; la locale inglese porta
      l'innesco datato al 21 novembre 2026, registrato.
- [ ] **2** - La ricerca è raggiungibile in entrambe le locali; due termini scelti apposta
      restituiscono risultati nella sola locale che li contiene; un indice assente o vuoto **fa
      fallire** il controllo.
- [ ] **3** - Da un'area tradotta il cambio di lingua atterra sulla pagina corrispondente; da
      un'area non tradotta atterra sull'avviso con il rinvio all'italiano; mai un errore, mai la
      radice; una pagina priva dell'avviso **fa fallire** il controllo.
- [ ] **4** - I collegamenti assoluti alle due avvertenze sono presenti in entrambe le locali e ogni
      `href` assoluto verso il repository corrisponde a un file esistente; un `href` verso un
      percorso inesistente **fa fallire**. `Q-26` e `Q-198` chiuse insieme.
- [ ] **5** - **Ogni** pagina HTML di entrambe le locali reca il marcatore strutturale
      dell'avvertenza; una pagina priva del marcatore **fa fallire**.
- [ ] **6** - La procedura di verifica dei criteri 1, 2 e 3 è un documento versionato; il registro
      delle esecuzioni esiste in sola aggiunta, con data, commit esaminato ed esito per criterio; la
      voce più recente dichiara che l'esecutore è chi ha costruito il sito e che questa è una lacuna
      dichiarata; rieseguire la procedura sullo stesso commit riproduce lo stesso esito.

Sei criteri. Cinque soddisfatti e uno no fanno un traguardo **non raggiunto**, e il rapporto dice
quale manca (`V-181`, `00-indice.md` §8.3).
