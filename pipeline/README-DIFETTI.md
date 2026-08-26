# Registro dei difetti

Questo documento dichiara il formato e la disciplina di `registro/difetti.tsv`, letto dal
controllo `scripts/verifica-registro-dei-difetti.sh`. Risponde a una richiesta precisa del
committente: sapere, per ciascuno degli errori già commessi in questo repository e
raccolti in `.telemedic/context/RUNBOOK-ERRORI-E-TRAPPOLE.md`, se è presidiato, da che cosa, e
che cosa succede il giorno in cui quella stessa classe di errore si ripresenta come difetto nel
codice applicativo che ancora non esiste.

## Che cos'è, e perché esiste

Il runbook degli errori chiude con una tabella intitolata «Voci senza presidio, in un elenco
solo», che il documento stesso chiama «il debito di questo runbook». È una buona lista, e ha un
difetto strutturale: nessuno sorveglia se cresce, nessuno si accorge se una voce viene
dimenticata quando il presidio arriva, e soprattutto nulla lega quelle voci a un evento futuro
verificabile. Il progetto ha una regola non negoziabile che rende questo esigibile: **una regola
scritta e non presidiata da un controllo non è una regola**, e **un controllo che nessuno ha
visto fallire non è un controllo**. Applicata al runbook stesso, quella regola dice che l'elenco
del debito - finché resta prosa non sorvegliata - non è un registro del debito: è una speranza
che nessuno controlla.

Questo registro rende quell'elenco leggibile da macchina e presidiato. Per ciascuna delle
voci del runbook dichiara: se è presidiata da un controllo esistente (con il nome dello
script e del caso di banco che lo prova, non un «sì»); se non lo è ma esiste una data - legata a
un traguardo o a un criterio reale della roadmap - da cui la lacuna smette di essere tollerata;
oppure se non è presidiabile oggi, con la ragione scritta invece di un silenzio. Il controllo di
costruzione fa fallire la pipeline quando una di queste tre condizioni viene violata, quando la
data di una lacuna arriva senza che il presidio esista, o quando il registro stesso è malformato.

## Che cosa NON è questo registro

**Non è una riscrittura del runbook.** Il runbook resta l'unica fonte della prosa - che cosa è
successo, perché, qual è la regola. Questo registro non duplica quel testo: lo indicizza, con una
riga per voce che punta al file (`fonte`) e aggiunge le informazioni che il runbook, per sua
natura di prosa, non rende interrogabili in un colpo solo.

**Non certifica che un controllo sia corretto**, solo che esiste, che è eseguibile, e che almeno
un caso del banco lo dimostra capace di fallire. Un controllo presidiato può comunque avere una
copertura parziale rispetto a ciò che la voce del runbook descrive per intero: quando succede -
è il caso di `C-4`, dettagliato nella sua riga - la colonna `motivazione` lo dichiara invece di
tacerlo, perché una riga che dice «presidiata» senza quella precisazione affermerebbe più di
quanto è vero.

**Non sostituisce `pipeline/collocazione-dei-controlli.tsv`.** Quella tabella descrive dove sta
ciascun controllo della pipeline, con quale forza blocca e quale prova lo dimostra; è la fonte
di verità sui controlli **come oggetti della pipeline**. Questo registro descrive le voci del
runbook **come classi di difetto**, e cita i controlli della tabella di collocazione quando
esistono, senza duplicarne i dati diversi da quelli necessari a rispondere alle proprie domande
(quale controllo, quale caso di banco).

## Perché un giornale in sola aggiunta, e non una tabella di stati

Stessa scelta, e per la stessa ragione, di `registro/identificativi-requisiti.tsv`: una riga non
si modifica e non si cancella mai. Quando lo stato dichiarato per una voce cambia - un debito
che viene chiuso da un controllo scritto più tardi, una data che viene rivista - **si aggiunge
una riga nuova**, non si riscrive quella esistente. Lo stato corrente di una voce è la
**proiezione del suo ultimo evento**, calcolata ordinando le righe di quella voce per `data` e,
a parità di data, per ordine di comparizione fisica nel file - esattamente il metodo descritto in
`registro/README.md`, § «Come si calcola lo stato», qui applicato a un giornale con più
informazione per riga.

La ragione non è stilistica: un registro che si può riscrivere in-place perde la propria storia
ogni volta che qualcuno lo aggiorna, e la storia è precisamente ciò che risponde alla domanda del
committente - **da quando** una voce è presidiata, e con quale controllo, non solo se lo è oggi.

## Il formato

`registro/difetti.tsv` è un file di testo separato da carattere TAB (`\t`), con codifica UTF-8.
Le righe che iniziano con `#` sono commenti - compreso il blocco di intestazione che apre il
file - e un lettore automatico le deve ignorare. Segue la riga di intestazione con i nomi delle
colonne, e poi una riga per evento. Le undici colonne, in quest'ordine esatto:

| Colonna | Contenuto |
|---|---|
| `data` | data dell'evento, ISO `AAAA-MM-GG` |
| `voce` | l'identificativo esatto della voce del runbook, es. `A-1`, `B-6`, `D-8` |
| `famiglia` | `A`, `B`, `C` o `D` - la famiglia del runbook a cui la voce appartiene |
| `fonte` | percorso di `.telemedic/context/RUNBOOK-ERRORI-E-TRAPPOLE.md`. Senza ancora: un'ancora sbagliata è più pericolosa di nessuna ancora, per la stessa ragione che `D-3` dello stesso runbook descrive |
| `evento` | `registrata` (prima comparsa della voce nel giornale) oppure `aggiornata` (un evento successivo che rivede lo stato dichiarato) |
| `stato` | `presidiata`, `esigibile-da-data`, oppure `non-presidiabile` |
| `controllo` | percorso dello script che presidia la voce, relativo alla radice del repository; vuoto quando `stato` non è `presidiata` |
| `caso_banco` | uno o più casi di `scripts/prove/esegui-prove.sh`, separati da ` \| `, citati con una porzione stabile e univoca della loro descrizione - stessa convenzione di `pipeline/collocazione-dei-controlli.tsv`; vuoto quando `stato` non è `presidiata` |
| `bloccante_dal` | data ISO da cui la lacuna smette di essere tollerata; obbligatoria quando `stato` è `esigibile-da-data`, sempre vuota altrimenti |
| `diventa_in_sviluppo` | che cosa diventa la voce quando esisterà codice applicativo: vedi § dedicato più sotto |
| `motivazione` | testo libero: perché non presidiabile, perché nessuna data è legabile, o dettaglio della collocazione; mai vuota quando `stato` non è `presidiata` |

## Lo stato di una voce, e le tre condizioni

**`presidiata`.** Esiste uno script, versionato ed eseguibile, e almeno un caso del banco che
dimostra - per mutazione, con l'impronta SHA-256 confrontata prima e dopo - che quello script sa
fallire quando la regola viene violata. La riga cita entrambi per nome. Un controllo che nessuno
ha visto fallire non è un controllo: se un giorno un caso del banco viene rinominato o rimosso
senza aggiornare questa riga, `scripts/verifica-registro-dei-difetti.sh` lo segnala.

**`esigibile-da-data`.** Non esiste ancora un controllo, ma esiste una data - legata a un
criterio o a un traguardo reale della roadmap, mai inventata per plausibilità - da cui
l'assenza del controllo smette di essere una tolleranza dichiarata e diventa un errore di
costruzione. Solo due delle voci ricadono qui in questo primo popolamento (`D-1`,
`D-6`): non perché le altre lacune siano meno gravi, ma perché nessun altro criterio dei cinque
traguardi verificati (`T-01`, `T-03`, `T-04`, `T-08`, `T-10`) nomina esplicitamente le altre
classi di difetto. Una data non legabile non si inventa: si dichiara come tale nella
`motivazione`, e la voce resta `non-presidiabile` finché una data reale non emerge.

**`non-presidiabile`.** Copre due circostanze diverse, entrambe legittime, e la `motivazione`
distingue sempre quale delle due si applica: (a) la voce descrive un fatto sulla conduzione di
una sessione di lavoro o dell'orchestrazione fra agenti - non lascia traccia nel repository, e
nessuno script potrebbe verificarla anche volendo (è il caso dichiarato esplicitamente da `A-3`,
e per estensione da tutta la famiglia `B`); oppure (b) la voce è presidiabile in linea di
principio, ma oggi non esiste alcuna data legabile a un traguardo o a un criterio reale che la
renda esigibile (è il caso di `C-5`). Il primo caso è un limite strutturale del registro (vedi §
Limiti); il secondo è debito silenzioso, destinato a restare tale finché qualcuno non gli
assegna una data reale o non scrive il controllo direttamente.

## Come si legge dallo sviluppo: da un difetto futuro alla classe che lo aveva previsto

È la colonna che risponde alla richiesta del committente. Quando esisterà codice applicativo,
ciascuna voce diventa una delle quattro cose seguenti - e la colonna `diventa_in_sviluppo` lo
dichiara per ciascuna riga:

- **resta disciplina umana.** La voce riguarda come un umano o un agente conduce il proprio
  lavoro - leggere una regola prima di generalizzarla, verificare un rapporto sul disco,
  partizionare per famiglia e non per file - non una proprietà del codice o del repository.
  Nessuna quantità di codice applicativo la rende automatizzabile: resta tale anche dopo.
  Riguarda tutte le voci delle famiglie `A` e `B`, più `C-5` non per la sua natura ma per
  assenza di una data.
- **diventa un controllo di costruzione.** La voce descrive una proprietà del repository o
  dell'artefatto costruito - una forma di file, un collegamento, un dato - verificabile da uno
  script alla costruzione. Molte di queste sono **già** controlli di costruzione oggi (`C-1`,
  `C-2`, `C-3`, `C-6`, `C-7`, `D-3`, `D-7`, e con la riserva dichiarata nella propria riga `C-4`):
  la colonna lo dice comunque, perché la domanda del committente riguarda la classe di difetto
  nel tempo, non solo il presente. Due voci (`D-1`, `D-6`) diventeranno un controllo di
  costruzione **da una data dichiarata**, quando la loro `stato` è `esigibile-da-data`.
- **diventa una regola di prova.** La voce descrive una disciplina di collaudo che si applica a
  ogni futuro caso di prova sul codice applicativo, non un singolo controllo - per esempio,
  «un'asserzione sul solo codice di uscita non distingue un fallimento corretto da un crash» di
  `D-8`, o «un difetto di classe si chiude scrivendo prima il controllo che lo misura» di `D-2`.
  Il codice applicativo non genera un nuovo controllo per queste voci: genera l'obbligo, per chi
  scrive una prova di mutazione su quel codice, di seguire la stessa disciplina.
- **diventa un requisito con identificativo nel registro dei requisiti.** Questo è il caso in
  cui la voce si trasforma in una **proprietà del prodotto** - qualcosa che un utente, un
  clinico o un integratore può osservare - e non solo in una proprietà del processo con cui il
  progetto si costruisce. Il meccanismo, per quando succederà: si assegna un identificativo
  (tipicamente `RNF-*`, perché queste voci descrivono vincoli trasversali più che funzioni
  singole) in `registro/identificativi-requisiti.tsv`, con un evento `introdotto` che cita
  questa riga di `registro/difetti.tsv` nella propria colonna `nota`; la prova che verifica quel
  requisito cita l'identificativo, come impone
  `scripts/verifica-identificativi-requisiti.sh` (criterio 5 di `T-01`); e questa riga del
  registro dei difetti si aggiorna con un evento `aggiornata` che riporta l'identificativo
  assegnato nella propria `motivazione`. Da quel momento, chi trova un difetto di codice che
  cita quell'`RNF-*` può risalire, tramite questa riga, alla classe di errore già commessa che
  lo aveva previsto - ed è esattamente il percorso a ritroso che il committente ha chiesto.
  **Nessuna delle voci di questo primo popolamento ricade in questo caso**: sono tutte
  difetti di processo o di strumento propri della fase di scrittura della documentazione e della
  pipeline, non proprietà del prodotto telemedico. Il meccanismo resta qui descritto e pronto,
  non esercitato, perché non si inventa un requisito per avere una riga da mostrare.

## Il controllo legge il runbook, non una copia

`scripts/verifica-registro-dei-difetti.sh` non tiene un elenco delle voci scritto dentro di sé.
Una prima stesura lo faceva, motivandolo con «il runbook è prosa, non un elenco leggibile da
macchina» - un'affermazione che sembrava ragionevole e non lo era: le voci sono titoli nella
forma `### A-1.`, `### D-10.`, e si estraggono tutte con

```
grep -oE '^### [A-D]-[0-9]+(bis)?' .telemedic/context/RUNBOOK-ERRORI-E-TRAPPOLE.md | sed 's/### //'
```

La copia interna era comoda ed era esatta il giorno in cui fu scritta: quando il runbook ha
ricevuto due voci nuove, `D-9` e `D-10`, il controllo ha continuato a uscire verde dichiarando
«tutte le voci presenti», perché sorvegliava se stesso e non il runbook. È l'errore che il
runbook chiama `D-10`, ed è la stessa classe di difetto trovata lo stesso giorno in
`scripts/verifica-terminologie.sh`, che teneva una copia di riserva dei propri riconoscitori.

Per questo il controllo, in esecuzione normale, **legge sempre `RUNBOOK`**
(`.telemedic/context/RUNBOOK-ERRORI-E-TRAPPOLE.md` per difetto) e non accetta un'alternativa
silenziosa: se il file manca o non è leggibile, esce `2` invece di procedere a insieme vuoto; se
l'estrazione trova zero voci, esce `2` allo stesso modo, perché un runbook con decine di errori
già documentati non produce mai un elenco vuoto - un'estrazione vuota è quasi sempre un percorso
sbagliato o un formato di titolo cambiato, non l'assenza di voci. La variabile
`VOCI_CANONICHE_FILE` esiste **solo per il collaudo** di questo script, non come sorgente
alternativa in esercizio: è così che una tenuta può usare due voci sintetiche invece di dover
replicare l'intero runbook reale, senza che questo apra la stessa scorciatoia in produzione che
ha già causato il difetto una volta.

## Come si aggiunge una voce quando si commette un errore nuovo

1. Si scrive prima la voce nel runbook (`.telemedic/context/RUNBOOK-ERRORI-E-TRAPPOLE.md`), con
   causa, regola e presidio dichiarato o assente - è la fonte, e resta tale. Il controllo la vede
   da solo alla prossima esecuzione: non c'è un elenco da aggiornare altrove.
2. Si aggiunge **una riga in coda** a `registro/difetti.tsv`, mai in mezzo, con `evento`
   `registrata`, la `data` odierna, e lo stato che il presidio del runbook già dichiara: se il
   runbook dice «nessuno», lo stato è `esigibile-da-data` (se esiste una data legabile a un
   traguardo o criterio reale) oppure `non-presidiabile` (con la motivazione, sempre); se il
   runbook nomina già uno script e un caso reale, lo stato è `presidiata`.
3. Non si tocca nessuna riga esistente.

## Come si chiude una lacuna

Quando viene scritto il controllo che presidia una voce oggi `esigibile-da-data` o
`non-presidiabile`, si aggiunge una riga nuova per quella voce con `evento` `aggiornata`, `stato`
`presidiata`, il percorso del controllo e almeno un caso del banco che lo dimostra capace di
fallire - **lo stesso ordine di lavoro** che il progetto impone altrove: si scrive prima il caso
che vede fallire il controllo, poi lo si dichiara qui. La riga precedente **non si cancella**: è
la storia della voce, e dice per quanto tempo la lacuna è rimasta aperta.

## Limiti dichiarati: che cosa questo registro NON intercetta

**Non intercetta un errore nuovo, mai commesso prima.** È un registro delle classi di difetto
già osservate in questo repository, non un catalogo di tutto ciò che potrebbe andare storto:
la sua utilità cresce con l'esperienza del progetto, non la sostituisce.

**Non verifica che una voce `non-presidiabile` lo sia davvero.** Il controllo verifica che la
riga dichiari una motivazione, non che quella motivazione sia corretta: una voce presidiabile
etichettata per pigrizia come `non-presidiabile`, con una motivazione plausibile ma falsa,
supera il controllo. È lo stesso limite, per costruzione, di ogni campo di testo libero che un
controllo automatico può solo pretendere non vuoto, non giudicare nel merito - la revisione
umana resta necessaria per la qualità delle motivazioni, non solo per la loro presenza.

**Non verifica che un controllo dichiarato «presidiata» faccia davvero ciò che la voce del
runbook descrive**, solo che esista, sia eseguibile e abbia almeno un caso nel banco che lo fa
fallire. È lo stesso limite dichiarato da `D-6` per `scripts/verifica-collocazione-dei-controlli.sh`
rispetto alla tabella che sorveglia, applicato qui a se stesso.

**Non calcola da solo le date di `bloccante_dal`.** Le cinque date usate in questo primo
popolamento (`T-01` 12 settembre 2026, `T-03` 26 settembre 2026, `T-04` 3 ottobre 2026, `T-08`
14 novembre 2026, `T-10` 30 novembre 2026) sono state verificate a mano su
`docs/09_roadmap/02-traguardi.md` prima di scrivere la riga corrispondente: se quel documento
cambia le proprie date, questo registro non se ne accorge da solo, ed è chi lo mantiene a dover
riallineare le righe.

**Non sorveglia il runbook stesso.** Se una voce del runbook viene modificata nel testo - una
regola riformulata, un presidio nuovo dichiarato - senza che nessuno aggiorni la riga
corrispondente qui con un evento `aggiornata`, il registro continua a proiettare lo stato vecchio
senza saperlo. È un vuoto di sorveglianza dichiarato, della stessa specie di quello che `D-1`
descrive per la traduzione: nessun controllo qui confronta il testo del runbook con la riga del
registro, solo che la riga esista e sia internamente coerente.
