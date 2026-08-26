# Lista di ammissione delle terminologie

Questo documento dichiara il formato di `lista-ammissione-terminologie.tsv`, letto dal controllo
`scripts/verifica-terminologie.sh` per implementare il criterio 2 di `T-03` (`G3`,
`docs/01_technical/09-integrazione-continua-e-rilascio.md` §3).

## Perché esiste questo file

Il progetto si impegna a non versionare e a non scaricare contenuti di terminologie soggette a
licenza (vedi `THIRD-PARTY-TERMINOLOGY.md` alla radice del repository): la licenza si perfeziona
**accedendo** al contenuto, e la clausola di riservatezza che quasi sempre l'accompagna è
incompatibile con un repository pubblico.

Prima di questo file, la conoscenza di **quali sistemi il controllo sorveglia, con quale
riconoscitore e con quale profondità** viveva soltanto dentro `scripts/verifica-terminologie.sh`:
tre blocchi `if grep ...` scritti in linea, senza alcuna dichiarazione a parte. Una regola che sta
solo nel codice cambia ogni volta che qualcuno modifica il codice, e nessuno può rispondere alla
domanda «che cosa riconosciamo oggi?» senza leggere lo script riga per riga. Questo file rende la
domanda rispondibile leggendo una tabella.

## Che cosa NON è questo file

**Non contiene contenuto di terminologie.** Ogni riga descrive la *forma* con cui un contenuto
sospetto si riconosce - un'espressione regolare che cerca un marcatore testuale (`conceptId`,
un'intestazione tabellare, un dominio di scaricamento), non un concetto, un codice reale o un
frammento di una terminologia. I nomi dei sistemi (`SNOMED CT`, `UMLS`) sono informazione pubblica
sulla loro esistenza, non contenuto sotto licenza: sapere che SNOMED CT esiste e ha un formato di
rilascio tabellare non è diverso da saperlo leggendo la documentazione ufficiale di IHTSDO/SNOMED
International, che è pubblica. Quello che resta vietato - e che questo file non contiene mai - è
un identificativo di concetto reale, una descrizione concettuale reale o un estratto di un file di
rilascio reale.

Questo confine regge finché la tabella resta al livello di «che forma riconosciamo», e si
assottiglierebbe se qualcuno vi aggiungesse, per «completezza», un esempio con un identificativo
plausibile invece che dichiaratamente sintetico (tutto zeri, come fa il banco di prova). Chi
aggiunge una riga a questo file non deve mai incollare un identificativo preso da una fonte reale,
nemmeno come esempio.

## Formato

Valori separati da tabulazione. Le righe che cominciano con `#` sono commenti. La prima riga non
commentata è l'intestazione e dichiara le nove colonne.

| Colonna | Contenuto |
|---|---|
| `id` | Identificativo della riga, nella forma `G3-n`. `G3` è il controllo dichiarato in `pipeline/collocazione-dei-controlli.tsv`; `n` distingue i riconoscitori dentro lo stesso controllo |
| `sistema` | Il sistema di codifica o l'ambito che il riconoscitore sorveglia, in prosa |
| `profondita_riconoscimento` | Fino a dove arriva il riconoscitore: `identificatore` (un singolo identificativo di concetto), `intestazione_file` (la prima riga di un file, non il contenuto), `comando_di_rete` (un comando che scaricherebbe, non l'esito dello scaricamento) |
| `forma_ammessa` | Che cosa resta ammesso nel repository riguardo a questo sistema - il confine che il riconoscitore non oltrepassa |
| `pattern_ere` | L'espressione regolare estesa (POSIX ERE, quella di `grep -E`) che il riconoscitore usa |
| `modalita_grep` | `righe` (equivalente a `grep -rInE`, stampa numero di riga e contesto) oppure `nomefile` (equivalente a `grep -rIlE`, stampa solo il nome del file) |
| `estensioni` | Elenco separato da virgola dei pattern `--include` di `grep` su cui il riconoscitore agisce, ad es. `*.md,*.json`. **Vuoto significa nessun filtro**: il riconoscitore agisce su ogni file di testo del repository |
| `titolo_rilievo` | Il titolo breve stampato quando il riconoscitore trova una corrispondenza |
| `motivo` | La spiegazione più lunga stampata sotto il titolo. La sequenza letterale `\n` dentro questo campo è un'andata a capo voluta: lo script la interpreta a stampa, non la tratta come testo |

## I tre riconoscitori di oggi

- **`G3-1`, SNOMED CT** - identificativo di concetto (`conceptId` o `SCTID`) abbinato a un numero
  lungo, nella forma con cui compare nei file di rilascio. Il solo numero non basta come indizio:
  senza il marcatore testuale, un numero lungo qualunque genererebbe troppi falsi positivi.
- **`G3-2`, formato di rilascio tabellare** - la sola intestazione canonica (`id`, `effectiveTime`,
  `active`, ...) di una tabella in stile RF2. Non serve contenuto sotto l'intestazione: l'avere
  quell'intestazione in un file versionato è già la prova che qualcuno ha copiato (anche solo in
  parte) un file di rilascio.
- **`G3-3`, domini di scaricamento** - un comando `curl`/`wget`/`fetch` che cita un dominio noto di
  terminologie a licenza vincolata (SNOMED International, UMLS) entro una distanza ravvicinata sulla
  stessa riga. Il comando non viene mai eseguito dal controllo: si riconosce dal testo.

## Che cosa questo controllo NON riconosce oggi (il confine dichiarato)

Il controllo è **conservativo ma stretto**: reagisce a tre forme testuali specifiche, non a
«qualunque contenuto di terminologia». Un esito verde prova l'assenza di *queste tre forme*, non
l'assenza di ogni possibile contenuto sotto licenza. In particolare, oggi il controllo:

- **non riconosce altri sistemi di codifica** con marcatori propri - LOINC, ICD-10-CM/PCS, ATC, e
  altri - perché non esiste un riconoscitore dedicato per loro. Se un domani il progetto dovesse
  maneggiare l'estratto di uno di questi sistemi, serve un nuovo riconoscitore, non un'estensione
  implicita di uno esistente.
- **non riconosce un identificativo SNOMED CT privo del marcatore testuale**: un numero lungo da
  solo, senza `conceptId`/`SCTID` accanto, non genera un rilievo. È una scelta deliberata (vedi il
  commento nello script sul rumore dei falsi positivi), non una svista, ma resta un varco che la
  sola revisione umana deve continuare a presidiare.
- **non riconosce uno scaricamento che non nomini esplicitamente il dominio** nella stessa riga del
  comando (ad es. un URL costruito per concatenazione di stringhe, o un dominio passato per
  variabile), né un client HTTP diverso da `curl`/`wget`/`fetch` (ad es. una libreria applicativa).

Questi limiti erano già veri nello script prima di questo file: non sono una regressione introdotta
qui. Sono resi visibili qui per la prima volta.

## Come si aggiunge un riconoscitore

1. Descrivi il sistema che vuoi sorvegliare e **perché** serve un riconoscitore nuovo invece di
   allargare uno esistente.
2. Scrivi `forma_ammessa`: che cosa resta lecito dire su quel sistema nel repository.
3. Scrivi il `pattern_ere` più stretto che identifica la forma vietata, evitando di includere nel
   pattern (o altrove nella riga) un identificativo reale a scopo di esempio.
4. Scegli `profondita_riconoscimento`, `modalita_grep` ed `estensioni` in base a dove il contenuto
   vietato potrebbe comparire.
5. Aggiungi la riga al banco di prova (`scripts/prove/esegui-prove.sh`) con almeno un caso che
   dimostri che il riconoscitore sa fallire: **quel banco non si modifica in autonomia**, va
   proposto a chi lo possiede (regola 4 di `pipeline/README.md`, che vale anche qui per analogia).

## Nessuna copia di riserva nello script

`scripts/verifica-terminologie.sh` usa questa tabella come **unica** fonte dei riconoscitori: non
mantiene più al proprio interno una copia di riserva. Una regola duplicata in due posti può
divergere senza che nessuno se ne accorga, ed è precisamente il difetto che questa scelta chiude.
Se il file non è raggiungibile - assente o illeggibile - il controllo non gira a vuoto e non
passa in silenzio: fallisce con uscita 2, la convenzione di questo repository per «il controllo
non può nemmeno partire» (la stessa di `scripts/verifica-registro-componenti.sh` con il registro
inesistente e di `scripts/verifica-dati-sintetici.sh` con la radice inesistente), e lo dichiara ad
alta voce su standard error. Vedi il commento in testa allo script per il dettaglio.
