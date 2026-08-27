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

## Le sette regole che il controllo fa rispettare

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
6. **Un criterio nella forma `T-NN/M` deve risolvere.** Il traguardo `T-NN` deve esistere in
   `docs/09_roadmap/02-traguardi.md` e avere almeno `M` criteri di completamento numerati.
   Aggiunta il 27 agosto 2026 dopo aver trovato una riga (`T01-C8`, oggi `CR-C1`) che citava
   `T-01/8` - un criterio sulle avvertenze pubbliche - per uno script che verifica tutt'altro, la
   conformità redazionale. Nessuna delle prime cinque regole poteva vederlo: la colonna era ben
   formata, e la falsità stava nel *rapporto* fra la colonna e il documento che descrive.
7. **Un criterio nella forma `T-NN/M` citato da due righe diverse è un errore, salvo che il
   criterio sia dichiarato collettivo** in [`criteri-collettivi.tsv`](./criteri-collettivi.tsv).
   Due controlli su un criterio che ne nomina uno solo significano che almeno uno dei due sta
   parlando d'altro: è il difetto per cui la regola nasce, `SIG-C1` che citava `T-01/5`, già di
   `T01-C5` per un oggetto diverso - gli identificativi di requisito citati nelle prove, non le
   sigle `V-*`/`Q-*` citate nella prosa. **Si applica solo alla forma `T-NN/M`**: `N/D` è escluso
   apposta, perché più righe possono legittimamente dichiarare di non presidiare alcun criterio
   numerato, e lo fanno oggi `CR-C1`, `RD-C1` e `SIG-C1`, ciascuna per un motivo proprio.

   **L'eccezione, e perché non è un'attenuazione.** La prima formulazione di questa regola vietava
   il duplicato senza eccezioni, ed era una generalizzazione tratta da due soli casi. Applicata al
   repository reale segnalava diciannove righe, **e tutte e diciannove erano legittime**: i criteri
   2 e 4 di `T-03` sono, per il proprio testo, criteri *collettivi*. Il secondo enumera per nome più
   controlli come oggetto congiunto - licenze, terminologie, distinta, collegamenti, identificativi
   sintetici, termini vietati, i due controlli di `T-01` - e il quarto si applica per definizione a
   «i controlli non compresi nel criterio 2», cioè al complemento di un insieme. La forma `A + B`
   non li rappresenta e non è pensata per farlo: descrive **un** controllo che vive in due luoghi, e
   ammette una fascia sola, mentre i controlli che presidiano `T-03/2` stanno in fasce diverse
   (`G1`, `G9`, `G10`, `G11` in rapida; `G2`, `G3` in completa). Comprimerli in una riga renderebbe
   falsa la colonna `fascia`, che è precisamente il difetto che la regola 5 esiste per impedire.

   L'eccezione **non indebolisce la regola**, perché non è una lista di esenzioni ma una
   dichiarazione con la ragione, scritta in un file versionato e non dentro il controllo (voce
   `D-10` del runbook). Chi vi aggiunge una riga deve aprire il criterio in `02-traguardi.md` e
   verificare che il suo **testo** ne affidi davvero l'oggetto a più controlli. Se la dichiarazione
   manca o non è leggibile, il controllo **esce `2`** - errore d'uso, non violazione - invece di
   decidere da solo quali criteri siano collettivi.

   **Che cosa questo lascia aperto.** Che `T-03/2` e `T-03/4` siano collettivi è un fatto del testo
   di quei criteri, non una scelta di formato. Riscriverli in `02-traguardi.md` come sotto-criteri
   numerati singolarmente renderebbe la tabella più precisa - ogni riga presidierebbe un
   sotto-criterio proprio - e cambierebbe la numerazione di un traguardo `[IMPEGNO]`. È una
   decisione del committente e non è stata presa qui.

## Gli altri file di configurazione di questa cartella

Tre controlli leggono da qui la propria configurazione invece di portarla dentro di sé. La ragione
è sempre la stessa - voce `D-10` del runbook degli errori: un controllo che porta dentro di sé una
copia di ciò che sorveglia non sorveglia più - e la disciplina è sempre la stessa: **nessuna copia
di riserva nello script**, e se il file manca il controllo esce `2`, che è errore d'uso e non
violazione.

| File | Letto da | Che cosa dichiara |
|---|---|---|
| [`differenziazione-traduzioni.tsv`](./differenziazione-traduzioni.tsv) | `scripts/verifica-divergenza-traduzioni.sh` | Quali aree esigono la traduzione, quali avvertenze pubbliche sono sorvegliate e con quale forza. È il criterio 3 di `T-03`, che la vuole «versionata in un file di configurazione, non cablata» |
| [`criteri-collettivi.tsv`](./criteri-collettivi.tsv) | `scripts/verifica-collocazione-dei-controlli.sh` | Quali criteri di traguardo il proprio testo affida a più controlli, e sono quindi citabili da più righe. Vedi la regola 7 |
| [`documenti-senza-data-di-marcatura.tsv`](./documenti-senza-data-di-marcatura.tsv) | `scripts/verifica-date-di-marcatura.sh` | Quali documenti sono sottoposti alla regola 4 del §11: nessuna data, nessuna finestra temporale, nessun «entro» riferiti alla marcatura |

**Il marcatore del controllo sulle date, e perché è locale.** La regola 4 ammette un'eccezione che
essa stessa nomina: l'unica occorrenza consentita di quelle parole è **dentro l'enunciato del
divieto stesso**, perché il capoverso che vieta di scrivere una data è costretto a nominare sia la
marcatura sia la forma temporale. Nessun criterio testuale può distinguere l'enunciato dalla
violazione, e non deve provarci. Quel capoverso si dichiara:

```
<!-- data-e-marcatura: enunciato del divieto, §11 regola 4 -->
```

La ragione è obbligatoria: un marcatore nudo è un'esenzione senza motivo, cioè esattamente ciò che
il controllo esiste per impedire, e il banco lo prova. La divergenza da `G11`, che le eccezioni le
tiene in un file centrale, è deliberata: là l'eccezione riguarda un dominio o un nome, che è lo
stesso in tutto il corpus; qui riguarda **un capoverso**, e un elenco centrale che dicesse «riga 86
di quel file» sarebbe falso alla prima riscrittura.

## Le quattro forme di `eseguibile`, e che cosa la regola 5 verifica su ciascuna

| Forma | Che cosa deve essere vero |
|---|---|
| `percorso/script.sh` o `percorso/script.py` | il flusso della fascia dichiarata dalla riga lo nomina. Il linguaggio non cambia la verifica: ciò che la regola accerta è che la collocazione esista, non in che cosa sia scritta. La forma `.py` è ammessa dal 27 agosto 2026, quando il criterio 6 di `T-03` ha ricevuto per metà un **generatore** invece di un controllo |
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
