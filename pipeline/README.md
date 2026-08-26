# Collocazione dei controlli della catena di costruzione

Questa cartella contiene un solo dato: **dove sta ciascun controllo della pipeline, con quale forza
blocca, e quale prova dimostra che sa fallire.** Il file è `collocazione-dei-controlli.tsv`.

Serve perché tre criteri del traguardo `T-03` - il primo, il terzo e il quarto - erano verificabili
soltanto leggendo i file YAML dei flussi di lavoro, uno per uno, e ricostruendo a mente quale
controllo bloccasse davvero. Leggere una tabella è un'altra cosa: la si può anche far leggere a un
programma, ed è ciò che fa `scripts/verifica-collocazione-dei-controlli.sh`.

## Formato

Valori separati da tabulazione. Le righe che cominciano con `#` sono commenti. La prima riga non
commentata è l'intestazione e dichiara le nove colonne.

| Colonna | Contenuto |
|---|---|
| `controllo` | Identificativo. `G1`…`G13` sono i controlli obbligatori del §3 di [`01_technical/09`](../docs/01_technical/09-integrazione-continua-e-rilascio.md). `T01-Cn` è **provvisorio** e designa un controllo che attua un criterio di `T-01` a cui il §3 non ha ancora assegnato una `G`: la designazione definitiva arriverà da lì, non da qui. `SEC-Cn` è **provvisorio** allo stesso modo e designa un'attività di sicurezza prescritta dal §5 di [`06_security/07`](../docs/06_security/07-catena-di-fornitura.md) a cui il §3 non ha ancora assegnato una `G`; `RD-Cn` designa un controllo su un registro di governo che nessun criterio numerato nomina |
| `nome` | Nome leggibile, quello con cui il controllo compare nella pipeline |
| `fascia` | `rapida` · `completa` · `estesa` · `rilascio` |
| `stato` | `bloccante` · `segnalazione` |
| `bloccante_dal` | Data ISO `AAAA-MM-GG`. **Obbligatoria quando `stato` è `segnalazione`**, vuota quando il controllo è già bloccante |
| `criterio` | Il criterio che il controllo attua, nella forma `T-03/2` |
| `eseguibile` | Percorso dello script, o `flusso#lavoro` quando il controllo vive dentro un flusso di lavoro |
| `prova_negativa` | Uno o più casi del banco `scripts/prove/esegui-prove.sh` che dimostrano che il controllo fallisce quando deve, separati da `|`. **Mai vuota** |
| `motivo_collocazione` | Perché il controllo sta in quella fascia |

## Le cinque regole che il controllo fa rispettare

1. **Una fascia deve essere una delle quattro dichiarate.** Un valore fuori elenco è quasi sempre un
   refuso, e un refuso qui significa un controllo che nessuno esegue.
2. **`stato = segnalazione` esige `bloccante_dal`.** È la regola che impedisce a una riduzione
   temporanea di diventare permanente. Una riduzione senza data di scadenza non è temporanea: è una
   rinuncia che nessuno ha dichiarato.
3. **`prova_negativa` è esigibile da quando il controllo blocca.** Un controllo **bloccante**
   senza prova negativa è una dichiarazione di intenti che gira in pipeline, e la riga fallisce
   sempre. Un controllo in **segnalazione** può averla vuota, ma **solo finché la sua data non è
   arrivata**: un controllo che presuppone codice ancora inesistente non ha un comportamento che
   possa fallire, e non c'è nulla da provare. Dal giorno di `bloccante_dal` la prova diventa
   esigibile e lo script la pretende da solo, senza che nessuno se ne ricordi. Non è una casella
   di esenzione: è la stessa data della regola 2, che qui acquista un secondo effetto.
4. **Ogni caso citato in `prova_negativa` deve esistere nel banco.** Altrimenti la colonna dice il
   vero solo finché nessuno rinomina un caso, e la garanzia scade in silenzio.
5. **La corsia dichiarata deve eseguire davvero il controllo.** Le prime quattro regole verificano
   che una riga sia *ben formata*; nessuna verificava che fosse *vera*. La differenza non è
   teorica: la riga `RD-C1` ha dichiarato per giorni «fascia completa, bloccante» mentre
   `fascia-completa.yml` non invocava affatto il suo script, e questo controllo è rimasto verde -
   perché `completa` è una delle quattro stringhe ammesse e i casi citati nel banco esistevano
   tutti. Una tabella di collocazione che non sa dire se la collocazione esiste sorveglia la
   propria sintassi, non la pipeline.

## Le quattro forme di `eseguibile`, e che cosa la regola 5 verifica su ciascuna

| Forma | Che cosa deve essere vero |
|---|---|
| `percorso/script.sh` | il flusso della fascia dichiarata dalla riga lo nomina |
| `flusso.yml#lavoro` | quel flusso esiste e contiene quel lavoro, ed è il flusso della fascia dichiarata |
| `A + B` | un controllo che vive in **due luoghi** perché presidia due metà diverse. La **prima** metà deve stare nella fascia dichiarata dalla riga - altrimenti la colonna `fascia` direbbe il falso - le successive devono soltanto esistere |
| `da collocare` | ammesso **solo finché `bloccante_dal` non è arrivata**, con la stessa logica della regola 3: un'attività prescritta e non ancora collocata è debito visibile, ma dal giorno in cui blocca dev'essere collocata davvero, o non bloccherà nulla. Uno `stato = bloccante` con `da collocare` è sempre un errore |

La forma `A + B` non è una concessione alla comodità: `G9` la usa perché le **ancore** si verificano
in mezzo secondo con uno script di fascia rapida, mentre i **collegamenti** si verificano solo
costruendo il sito, che costa minuti e sta in fascia completa. Spezzarla in due righe avrebbe
sdoppiato un controllo che il §9.2 dichiara come uno solo; nasconderne una metà avrebbe reso la
tabella incompleta. La regola 5 accetta la forma e verifica entrambe le metà.

## Che cosa fare quando la data non esiste

La regola 2 esige una data e non ammette eccezioni, ed è giusto così: quasi sempre «non c'è una
data» significa «non ho cercato il traguardo a cui legarla». Ma esiste il caso in cui la data
davvero non c'è, perché **l'oggetto del controllo dipende da un terzo** e nessun traguardo datato lo
porta: è il caso della verifica di conformità della federazione delle identità, che
[`02-traguardi.md` §8](../docs/09_roadmap/02-traguardi.md) elenca fra ciò che non è datato.

In quel caso **non si inventa una data plausibile** - avrebbe l'aspetto di un impegno e non lo
sarebbe - e non si scrive una riga di dati senza data, che il controllo respinge. Si scrive un
**blocco di commento in coda alla tabella** con l'identificativo, l'attività, il motivo per cui la
data non esiste e il documento che lo accerta. Il debito resta visibile e non si traveste da
copertura. È una forma di ripiego, e lo si dichiara: la tabella non sa ancora rappresentare uno
stato «non databile», allo stesso modo in cui non sa rappresentare uno stato «non collaudabile»
(questione `Q-288`).

## Come si cita un caso del banco

Con una porzione **stabile e univoca** della sua descrizione, quella fra virgolette in
`esegui_caso`. Non con un numero di riga, che cambia a ogni aggiunta.

## Perché la tabella sta qui e non in `scripts/config/`

Perché `scripts/` contiene eseguibili, e mescolare configurazione ed eseguibili rende meno leggibile
la regola su chi può modificare che cosa. La forma è la stessa già collaudata in
[`registro/`](../registro/): formato dichiarato in prosa, dati in TSV, commenti con `#`.
