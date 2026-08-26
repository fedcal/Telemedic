# Piano - `T-09`, traduzione integrale del corpus residuo

> **Traguardo**: `T-09` · classe `D` · `[INTENZIONE]` · **2027, in parallelo allo sviluppo**
> **Innesco**: chiusura di `T-06`. **Titolare**: contributore unico, con la modalità assistita di `D56`.
> **Obiettivo** (`02 §5`): estendere alla totalità del corpus ciò che `T-06` ha fatto sulle sole aree
> prerequisito, portando il controllo di divergenza da «segnala» a «blocca» **area per area**.
> **Fonti**: `docs/09_roadmap/02-traguardi.md` §5, `docs/09_roadmap/00-indice.md` §4 e §8.4,
> `.telemedic/context/RUNBOOK-TRADUZIONE-EN.md`, `.telemedic/context/REGISTRO-DIFETTI-TRADUZIONE.md`,
> `.telemedic/context/GLOSSARIO-TRADUZIONE-EN.md`, `scripts/verifica-divergenza-traduzioni.sh`,
> `.github/workflows/verifiche.yml`.
> **Data di redazione**: 26 agosto 2026.

Questo è un piano. **Non traduce nulla** e non modifica `docs/`, `website/`, `scripts/` né i file di
contesto in `.telemedic/context/`. Ogni volume dichiarato è misurato; il metodo è al §6.

---

## 1. Il criterio, e come si dimostra soddisfatto

`T-09` ha **un solo criterio di completamento**, ed è per area:

> Per ogni area, la transizione da segnalazione a bloccanza è **registrata con la data**, e da quel
> momento **non è reversibile**: un'area che torna a divergere fa fallire la costruzione. Il traguardo
> è chiuso quando **nessuna area è più in sola segnalazione**.

Il criterio è binario e si applica **nove volte**, non otto. Le aree oggi in sola segnalazione sono
nove: le otto non tradotte, **più `04_protocols`**, che è tradotta per intero (11 file su 11, tutti
allineati) ma **non compare in `AREE_ESIGITE`** nello script. È un fatto misurato, non dedotto:
`AREE_ESIGITE="10_fondamenti 06_security 08_compliance"`.

### 1.1 Che cosa esiste già, e non si ripianifica

| Elemento | Stato | Prova |
|---|---|---|
| Comportamento differenziato del controllo | **Esiste**, versionato in un file di configurazione e non cablato | `AREE_ESIGITE` in `scripts/verifica-divergenza-traduzioni.sh` |
| Regime di segnalazione sulle aree non esigite | **Esiste** | riga `· traduzione assente (pianificata): <percorso>` per ciascun file |
| `04_protocols` tradotta per intero | **Esiste** | 11 file IT, 11 file EN, nessun divergente |
| Nessuna traduzione interrotta a metà | **Esiste** | `grep -rn "CONT-->" website/i18n/en/` vuoto |
| Rese vincolanti accumulate | **Esistono** | `GLOSSARIO-TRADUZIONE-EN.md`, più `log-TRAD-1.md` §3 e §7 |
| Precondizione `esempio.it` per `07_integration` | **Chiusa** il 26 agosto 2026 | 71 occorrenze su 11 host sostituite con il TLD riservato `.example` |

### 1.2 Che cosa manca, area per area

| Area | File IT | File EN | In `AREE_ESIGITE` | Che cosa manca |
|---|---:|---:|:-:|---|
| `04_protocols` | 11 | 11 | no | **solo la promozione**: zero parole |
| `02_architecture` | 10 | 0 | no | traduzione + **5 ancore verso `10_fondamenti`**, 3 rotte oggi |
| `05_domain` | 10 | 0 | no | traduzione |
| `01_technical` | 10 | 0 | no | traduzione |
| `07_integration` | 11 | 0 | no | traduzione |
| `03_functional` | 8 | 0 | no | traduzione |
| `adr` | 31 | 0 | no | traduzione |
| `00_overview` | 5 | 0 | no | traduzione |
| `09_roadmap` | 6 | 0 | no | traduzione |

### 1.3 Come si dimostra soddisfatta la transizione di **una** area

Cinque fatti, tutti verificabili da chiunque, e nell'ordine:

1. i file inglesi dell'area esistono, integrali, in **posizione speculare** (stesso nome, stesso
   percorso relativo), e nessuno porta marcatore di continuazione;
2. `npm run build` passa **e l'elenco delle ancore rotte della locale inglese non è cresciuto**; per
   `02_architecture` la soglia è più dura: le tre ancore del registro §17 devono essere **zero**;
3. il nome dell'area è aggiunto a `AREE_ESIGITE` **nello stesso commit** che consegna l'ultimo file;
4. `verifica-divergenza-traduzioni.sh` esce `0` con l'area esigita;
5. **l'irreversibilità è provata al contrario**: si degrada deliberatamente un file inglese dell'area e
   si verifica che la costruzione **fallisca**; poi si ripristina. Senza questa prova la transizione è
   una riga di configurazione, non un fatto.

E la data si registra: nel registro delle revisioni della roadmap (`00 §8.4`) e nel registro dei
difetti di traduzione, con il riferimento del commit.

### 1.4 La precondizione che `T-09` non possiede

Il criterio dice «fa fallire la costruzione». Oggi **non può**: il lavoro `divergenza-traduzioni` in
`verifiche.yml` porta `continue-on-error: true`. Finché resta, aggiungere un'area a `AREE_ESIGITE` non
produce alcun effetto e la transizione **non è registrabile come irreversibile**, perché non è
reversibile né irreversibile: è inerte. La rimozione è lavoro di `T-06` (§2 di quel piano) ed è la
precondizione operativa di ogni transizione di `T-09`.

---

## 2. L'ordine delle aree, ricavato e motivato

Tre criteri concorrono, tutti misurati sul repository il 26 agosto 2026. Il metodo di ciascuna misura è
dichiarato; i numeri grezzi sono al §6.

**Criterio A - dipendenze di ancora.** Numero di collegamenti con frammento (`#…`) che escono dall'area
verso un'area **già tradotta**: sono i collegamenti che, quando l'area verrà tradotta, dovranno usare lo
slug **inglese** del bersaglio, e che oggi sono già rotti nella locale inglese perché Docusaurus serve
l'area non tradotta con contenuto italiano che punta a un'ancora nel frattempo diventata inglese.

**Criterio B - pressione di puntamento.** Numero di righe, nei 54 file inglesi già pubblicati, che
contengono almeno un collegamento verso l'area. Misura **il danno che esiste oggi**: quante volte un
lettore inglese, dentro una pagina già in inglese, viene rinviato a una pagina italiana.

**Criterio C - volume.** Parole misurate, §6.

### 2.1 Le tre misure

| Area | A - ancore in uscita verso aree tradotte | B - righe con collegamenti in entrata dall'inglese | C - parole (calibrate) | File |
|---|:-:|---:|---:|---:|
| `02_architecture` | **5** (di cui **3 rotte oggi**) | 28 | ≈ 41.800 | 10 |
| `05_domain` | 0 | **141** (129 dal solo `19-glossario` EN) | ≈ 46.800 | 10 |
| `01_technical` | 0 | 49 | ≈ 37.700 | 10 |
| `03_functional` | 0 | 27 | ≈ 45.500 | 8 |
| `07_integration` | 0 | 25 | ≈ 44.100 | 11 |
| `adr` | 0 | 12 | ≈ 25.200 | 31 |
| `09_roadmap` | 0 | 6 | ≈ 54.700 | 6 |
| `00_overview` | 0 | **0** | ≈ 21.300 | 5 |
| `04_protocols` | - già tradotta | - | **0** | 11 |

Le cinque ancore di `02_architecture`, per intero, perché sono il dato che decide la prima posizione:

| Da | Verso |
|---|---|
| `07-tracciamento-e-registro-immutabile.md` | `../10_fondamenti/12-crittografia-e-sicurezza.md#5-funzioni-di-hash` |
| `06-eventi-e-integrazione-interna.md` | `../10_fondamenti/11-fondamenti-informatici.md#5-la-doppia-scrittura-e-loutbox-transazionale` |
| `03-modello-di-dominio.md` | `../10_fondamenti/11-fondamenti-informatici.md#8-modellazione-del-tempo-e-dei-dati` |
| `05-multi-tenancy.md` | `../10_fondamenti/11-fondamenti-informatici.md#9-multi-tenancy` |
| `03-modello-di-dominio.md` | `../10_fondamenti/11-fondamenti-informatici.md#7-domain-driven-design` |

Le prime tre sono esattamente le tre che il registro dei difetti §17 e §19.5 dichiarano rotte. Le altre
due **non si rompono** perché lo slug inglese coincide con quello italiano - `multi-tenancy`,
`domain-driven-design`. È la conferma che il criterio A misura la cosa giusta e non un'approssimazione.

### 2.2 Come i tre criteri sono pesati

- **A ha priorità assoluta, ma su una sola area.** È l'unico criterio che chiude un **difetto già
  visibile nella costruzione pubblicata**, non che aggiunge contenuto. Vale solo per
  `02_architecture`: tutte le altre aree hanno A = 0.
- **B è il criterio primario per tutto il resto.** È l'unico che misura un danno **che esiste oggi**: un
  collegamento in entrata da una pagina già inglese è un lettore che il progetto ha già conquistato e
  che rimanda all'italiano. Volume e ancore misurano costo e rischio; B misura il beneficio.
- **C è subordinato: fa da spareggio dentro B, e pone un veto sull'ultima posizione.** Il veto è
  motivato al punto 8 dell'elenco seguente.

### 2.3 L'ordine che ne discende

| # | Area | Criterio che la colloca |
|:-:|---|---|
| 0 | **`04_protocols`** | Fuori dai tre criteri: **è già tradotta**. La transizione costa **zero parole** ed è l'unica del traguardo a costo nullo. Va per prima perché non ha alcun motivo di non esserlo, e perché è il collaudo del meccanismo del §1.3 su un'area in cui un errore non costa traduzione |
| 1 | **`02_architecture`** | **A = 5, di cui 3 rotte oggi.** Unica area con dipendenze di ancora. Chiude tre difetti visibili nella costruzione inglese, che nessun'altra attività chiude |
| 2 | **`05_domain`** | **B = 141**, cinque volte la seconda. 129 delle 141 vengono da `19-glossario.md` EN: il glossario inglese della guida rimanda il lettore a una pagina italiana 129 volte. È la concentrazione di danno più alta del corpus |
| 3 | **`01_technical`** | **B = 49**, seconda pressione, e **C = 37.700**, secondo volume più basso fra le aree di prosa. Il rapporto fra collegamenti chiusi e parole spese è il migliore dell'insieme |
| 4 | **`07_integration`** | B = 25 contro 27 di `03_functional`, C = 44.100 contro 45.500. **I tre criteri non separano le due aree**: due righe e 1.400 parole sono dentro il rumore delle due misure. Si dichiara lo spareggio invece di fingere che i tre criteri decidano: **`07_integration` è la sola area scritta per un terzo che integra**, cioè per il lettore per cui la versione inglese esiste in primo luogo (`D3`, `D50`) |
| 5 | **`03_functional`** | vedi sopra |
| 6 | **`adr`** | B = 12, C = 25.200. Bassa pressione, basso volume. Va qui e non prima perché B è primario; va qui e non dopo perché è l'area **più partizionabile** del corpus (31 file brevi) e la sua chiusura registra una transizione a basso rischio |
| 7 | **`00_overview`** | **B = 0**: nessuna pagina già tradotta vi rimanda. C = 21.300, il volume più basso. Chiude zero collegamenti, ma è la porta d'ingresso del sito e costa meno di ogni altra area |
| 8 | **`09_roadmap`** | **Ultima per veto di C, contro B.** È l'area di **volume massimo** (54.700) e di **pressione minima fra le aree di prosa** (B = 6). Ma la ragione decisiva non è nessuna delle due: è che quest'area è **progettata per cambiare**. `00 §8.1` impone revisione mensile con esito registrato anche quando è «nessuna variazione», e **settimanale dal 19 ottobre 2026**. Un'area promossa a bloccante mentre il suo italiano si muove ogni settimana genera una divergenza a ogni revisione, e ciascuna va chiusa in entrambe le lingue nello stesso commit. Tradurla prima significa comprare lavoro ricorrente al posto di lavoro finito |

**La tensione, dichiarata.** Mettere `09_roadmap` in fondo significa che **il blocco residuo più grande
del traguardo è anche l'ultimo**: quando le altre otto transizioni saranno registrate, resterà da
tradurre la singola area più voluminosa del residuo. È il prezzo del veto di volatilità e va conosciuto
prima di pagarlo, non dopo.

**La regola di ingresso che precede ogni area, e che nessun ordine sostituisce.** Prima di aprire
un'area si rilegge il registro dei difetti cercando le voci che vanno chiuse **sull'italiano prima** di
tradurre. Il precedente è `§12`: 71 occorrenze di `esempio.it`, dominio registrabile, concentrate per 55
in `07_integration`, cioè proprio l'area da cui un integratore copia gli host in una configurazione;
tradurle prima della sostituzione avrebbe significato rifare il lavoro **e** pubblicare in inglese lo
stesso host registrabile. Quella voce è chiusa; la regola resta. Alla data di questo piano l'unica voce
aperta che tocchi un'area non tradotta è quella delle tre ancore di `02_architecture`.

**E la regola di uscita, che è la simmetrica.** Ogni area tradotta diventa **bersaglio di ancore** per
le successive. La misura del criterio A va **rifatta prima di ogni area**, non riusata: oggi è zero per
sette aree su otto perché quelle aree non puntano ancora a nulla di inglese; dopo la seconda transizione
non sarà più vero.

---

## 3. La partizione del lavoro fra agenti

### 3.1 La regola, e perché non è negoziabile

Runbook §9.1, scritto dopo la tornata a cinque agenti del 26 agosto 2026:

> **Si partiziona per file, mai per famiglia di difetto.** Due agenti finiscono sullo stesso documento e
> si sovrascrivono a vicenda, e **la collisione non produce un errore - produce una modifica persa, che
> nessuno vede**.

Per una passata di traduzione la regola si legge così: **si partiziona per file, mai per sezione, mai
per famiglia terminologica, mai per «tutte le tabelle» o «tutti i diagrammi».** Nessun documento
appartiene a due mandati nello stesso passaggio.

### 3.2 Come si partiziona un'area

Il mandato di ogni agente contiene, alla lettera:

1. **l'elenco nominativo dei file** che gli appartengono, e la frase «nessun altro file, in nessuna
   circostanza»;
2. il divieto di toccare `docs/`: il lavoro è **interamente additivo** su
   `website/i18n/en/docusaurus-plugin-content-docs/current/`;
3. il divieto di scrivere sui file di contesto condivisi (§5), enunciato e non sottinteso;
4. il divieto di riscrivere `code.json`, `current.json`, `navbar.json`, `footer.json`, che sono **fonte**
   delle rese già fissate, e di creare `_category_.json`;
5. il divieto di eseguire commit;
6. l'obbligo di leggere glossario e runbook **prima** di aprire il sorgente, e di riversare le rese nuove
   **nel rapporto**, non nel glossario;
7. l'obbligo di **segnalare, non correggere**, i difetti dell'originale, con file, punto preciso e
   bersaglio corretto - perché una correzione in traduzione crea una divergenza silenziosa, che è peggio
   del difetto;
8. l'obbligo di segnalare le **conseguenze fuori dal proprio perimetro** invece di inseguirle (runbook
   §9.4).

**La dimensione dei mandati, per area**, misurata in file e in file più grande:

| Area | File | File più esteso (righe non vuote) | Agenti massimi in un passaggio |
|---|---:|---|---:|
| `04_protocols` | 11 | - (già tradotta) | 0 |
| `02_architecture` | 10 | `02-contesti-delimitati.md` (666) | 10 |
| `05_domain` | 10 | `02-le-prestazioni-modellate.md` (772) | 10 |
| `01_technical` | 10 | `05-media-e-tempo-reale.md` (494) | 10 |
| `07_integration` | 11 | `03-integrazione-per-api.md` (511) | 11 |
| `03_functional` | 8 | `02-catalogo-dei-requisiti.md` (1.011) | 8 |
| `adr` | 31 | `README.md` (175) | 31 |
| `00_overview` | 5 | `02-le-quattro-prestazioni.md` (394) | 5 |
| `09_roadmap` | 6 | `04-oltre-il-primo-rilascio.md` (818) | 6 |

### 3.3 Dove sta il limite - quattro limiti, e il terzo è quello vero

**Primo, il file.** Sotto il file non esiste parallelismo. Un documento troppo grande per un mandato
**non si divide fra due agenti**: si mette in sequenza con il protocollo di continuazione (§4.1). I
sette documenti del residuo che più probabilmente lo richiederanno, per estensione:
`03_functional/02-catalogo-dei-requisiti.md` (1.011), `03_functional/03-casi-d-uso.md` (854),
`09_roadmap/04-oltre-il-primo-rilascio.md` (818), `09_roadmap/05-rischi-e-dipendenze.md` (817),
`05_domain/02-le-prestazioni-modellate.md` (772), `09_roadmap/02-traguardi.md` (706),
`02_architecture/02-contesti-delimitati.md` (666). Nessuno raggiunge la scala dei moduli della guida che
superavano le trentamila parole: la continuazione servirà meno spesso, non mai.

**Secondo, l'area.** Si tiene **una sola area aperta per volta**. Non è un vincolo tecnico: è che il
glossario è alimentato da un solo dominio terminologico per passata, e il consolidamento resta piccolo e
verificabile. Aprire due aree in parallelo raddoppia il numero di rese nuove che arrivano insieme e
rende il consolidamento il collo di bottiglia - cioè sposta il problema, non lo risolve.

**Terzo, ed è il limite vero: i file di contesto condivisi sono una risorsa seriale.** Il numero di
agenti in parallelo non è limitato dai file dell'area ma dalla passata di consolidamento che ne segue
(§5), la cui dimensione cresce **con il numero di agenti, non con il numero di parole**. Il precedente
misurato: cinque agenti in parallelo hanno prodotto `W-1`, una collisione di numerazione nel glossario -
**sul file condiviso, non sui documenti**, perché sui documenti la partizione per file aveva funzionato.
La regola pratica che ne discende: **fino a quattro agenti su un'area di prosa**, con l'unica eccezione
di `adr`, dove 31 file brevi condividono uno schema fisso e un lessico già fissato dalle aree tradotte, e
il numero può salire perché la superficie terminologica per file è minima.

**Quarto, la convergenza terminologica.** Due agenti su due file della stessa area introducono due rese
dello stesso termine se il glossario non basta. Non è eliminabile con la partizione: si gestisce con la
lettura obbligatoria prima, il consolidamento dopo, e la verifica di perimetro del runbook §9.3 - prima
di chiudere una resa, `grep` sull'intero corpus (`docs/` **e** `website/i18n/en/`) per la forma scartata,
e il risultato dev'essere vuoto; le eccezioni si dichiarano con la ragione.

---

## 4. Il protocollo di continuazione e i cancelli

### 4.1 Continuazione - runbook §2, alla lettera

1. Si traduce **in ordine**, dalla prima sezione non ancora resa.
2. Ci si ferma **solo a un confine di sezione di livello `##`**. Una sezione a metà non si consegna mai:
   il lettore di una sezione troncata non ha modo di sapere che manca qualcosa.
3. In coda si scrive il marcatore `<!--TRADn-CONT-->` su una riga propria.
4. Nel rapporto si dichiara **l'ultima sezione tradotta e la prima non tradotta, per numero e titolo**.
   È l'unico dato che permette all'agente successivo di riprendere senza rileggere tutto.
5. Chi riprende **rimuove il marcatore** e lo sostituisce con la traduzione. Un file consegnato completo
   non contiene marcatori.
6. Chi riprende **legge la parte già tradotta** prima di scrivere: deve proseguire in modo
   indistinguibile per registro, lessico e ampiezza.
7. Chi riprende valuta la **prima occorrenza di un estremo normativo sull'intero documento**, non sulla
   propria porzione: se il termine compare già nella parte tradotta, la glossa non si ripete.

### 4.2 I cancelli, prima di dichiarare tradotta un'area

Nell'ordine, dal più economico al più costoso. Un'area non è tradotta finché il nono non è passato.

| # | Cancello | Verifica | Che cosa impedisce di passare |
|:-:|---|---|---|
| 1 | Marcatori | `grep -rn "CONT-->" website/i18n/en/` vuoto | un file creduto finito |
| 2 | **Parità strutturale fra le due lingue** | stesso numero di `.md`, stessi nomi, stessi percorsi relativi dell'area italiana; `git diff` sul frontmatter **non** mostra `sidebar_position` | una traduzione che sposta la navigazione o che «dimentica» un file |
| 3 | Ampiezza | `wc -w` inglese entro il **±15%** dell'italiano su ogni file. Sotto il −15% si presume riassunto, non traduzione | un agente che riassume e non lo dichiara: è il modo più comune in cui questo lavoro fallisce |
| 4 | **Costruzione del sito** | `cd website && npm ci && npm run build` | frontmatter con due punti seguiti da spazio non quotato; etichette Mermaid riscritte; **ancore rotte**, che il gate elenca tutte |
| 5 | **Ancore** | il numero di ancore rotte della locale inglese **non è cresciuto**; le ancore che l'area contribuisce sono zero. Per `02_architecture` le tre del registro §17 devono essere **zero** | il fenomeno invisibile: si manifesta **solo** nella costruzione inglese e solo quando il bersaglio è tradotto |
| 6 | **Controllo di divergenza** | `./scripts/verifica-divergenza-traduzioni.sh` esce `0` con l'area **aggiunta a `AREE_ESIGITE` nello stesso commit** | una transizione dichiarata e non attuata |
| 7 | **Irreversibilità provata al contrario** | si degrada deliberatamente un file inglese dell'area; la costruzione **deve fallire**; si ripristina | un controllo che non è stato visto fallire non è un controllo |
| 8 | Regola `R0`, terminologie, non marcatura | `verifica-conformita-redazionale.sh`, `verifica-terminologie.sh`, `verifica-dichiarazione-non-marcatura.sh website/build/en` | perifrasi risolte, terminologie a licenza vincolata, pagine inglesi senza avvertenza |
| 9 | **Consolidamento dei file di contesto** | passaggio unico di chi orchestra (§5), eseguito e registrato | glossario e registro che divergono dai fatti che li hanno prodotti |

**Il cancello 4 non è sostituibile con una lettura.** È il gate che nessuna passata può saltare: il
frontmatter non quotato e le etichette Mermaid riscritte sono i due punti che rompono, e nessuno dei due
produce un errore che indichi la causa reale.

**Il cancello 7 è ciò che rende `T-09` un traguardo e non un elenco di attività.** Il suo criterio dice
«non è reversibile»: senza la prova, «irreversibile» è un aggettivo.

---

## 5. I file di contesto condivisi, e il passaggio di consolidamento

Runbook §9.1, corollario:

> `REGISTRO-DIFETTI-TRADUZIONE.md`, `GLOSSARIO-TRADUZIONE-EN.md`, `05_BACHECA_INTERAGENTI.md` **non si
> danno in scrittura a un agente di una passata parallela**. Li consolida chi orchestra, in un passaggio
> unico, quando tutti sono rientrati. **Nel mandato va scritto esplicitamente.**

Il precedente è `W-1`: **due sezioni numerate `## 9`** nel glossario, un terzo blocco a `## 10`, un
quarto a `## 18`, per scrittura concorrente. La convenzione è stata cambiata - blocchi `Modulo NN - …`,
identificati **dalla fonte e non dalla posizione** - ma la convenzione riduce il danno, non toglie la
regola.

**Il consolidamento è un passo del piano con titolare, ingressi e uscite.** Titolare: chi orchestra,
mai un agente della passata. Si esegue **una volta per area**, quando tutti gli agenti sono rientrati, e
**prima** del cancello 6: un'area promossa a bloccante con il glossario non consolidato porta con sé le
proprie divergenze terminologiche dentro il regime irreversibile.

**Ingressi**, dai rapporti:

1. le **rese nuove**, con l'alternativa scartata dove la scelta era contesa;
2. i **difetti dell'originale** trovati, con file, punto preciso e bersaglio corretto, perché una
   sessione successiva li chiuda **sull'italiano e sull'inglese insieme**;
3. gli **errori trovati nel registro dei difetti stesso**: nella tornata del 26 agosto **nove voci su
   circa cinquanta erano sbagliate** - una poggiava su una premessa falsa e applicarla avrebbe
   *introdotto* l'incoerenza che dichiarava di correggere, sette avevano perimetro incompleto, due
   davano riferimenti di sezione in cui il termine non compariva;
4. le **voci risultate corrette dopo verifica**, che confermano il metodo;
5. le **conseguenze fuori perimetro**, che alimentano la **passata di coda** (runbook §9.4): unificare
   un termine in un modulo lascia un'altra area disallineata; rinominare un titolo fa divergere il nome
   di una procedura dal nome del criterio di traguardo che la richiama;
6. le **perdite di traduzione dichiarate**, che non sono difetti e vanno registrate perché un revisore
   che le incontri non le riapra - e il caso opposto, l'anglismo che è difetto in italiano e resa
   corretta in inglese, verificato **prima** di agire.

**Uscite**: glossario consolidato e rinumerato; registro con le voci chiuse marcate con il riferimento
del commit e la sezione degli errori del registro aggiornata; bacheca senza voci `APERTA` orfane;
**runbook aggiornato**; e la riga di registro della transizione dell'area, con la data.

**Un corollario che vale prima di toccare qualsiasi titolo di sezione**: `grep` per verificare che
nessun file punti alla sua ancora. Se qualcuno la punta, o si aggiornano i rinvii nello stesso
passaggio, o non si cambia il titolo.

---

## 6. Il costo dichiarato

**Non ore. Volume, e ciò da cui dipende.**

### 6.1 Il metodo di misura, dichiarato perché sia rifatto

La sessione che ha prodotto questo piano non disponeva di una shell: `wc -w` non è stato eseguito. Il
volume è stato misurato con una **funzione di sopravvivenza sulle righe**, che è esatta per costruzione e
approssimata solo dal campionamento:

- per ciascuna area si conta, con `ripgrep`, il numero di righe che contengono **almeno `N` parole**,
  per `N` = 1, 4, 8, 12, 16, 21, 27, 35, 45, 60, 85. L'espressione usata è `^\s*(\S+\s+){N-1}\S`, e per
  `N` = 1 è `\S`;
- la somma su tutti gli `N` del numero di righe con almeno `N` parole **è** il numero di parole. Il
  campionamento la approssima per trapezi fra i punti misurati;
- il risultato è stato **calibrato su un'area di volume noto**: `10_fondamenti`, che `00 §4` dichiara di
  **397.315 parole**. Il metodo grezzo ne dà **386.320**, cioè **−2,8 %**. Il fattore di correzione
  applicato a tutte le aree è **1,0285**;
- **controprova indipendente**: la somma calibrata su tutte e dodici le aree dà **≈868.000 parole**
  contro le **860.718** dichiarate da `00 §4` per `docs/`, cioè **+0,9 %**. Le due ancore indipendenti
  concordano, e il margine del metodo è dell'ordine del ±3 %.

Chiunque rifaccia la misura con `wc -w` otterrà numeri leggermente diversi: **quelli fanno fede**, questi
sono la misura che era possibile fare con gli strumenti disponibili, dichiarata come tale.

### 6.2 Il volume misurato delle otto aree

| # | Area | Righe non vuote | Parole (grezze) | Parole (calibrate) | File |
|:-:|---|---:|---:|---:|---:|
| 1 | `09_roadmap` | 3.914 | 53.227 | **≈ 54.700** | 6 |
| 2 | `05_domain` | 4.055 | 45.462 | **≈ 46.800** | 10 |
| 3 | `03_functional` | 3.363 | 44.289 | **≈ 45.500** | 8 |
| 4 | `07_integration` | 4.068 | 42.848 | **≈ 44.100** | 11 |
| 5 | `02_architecture` | 3.642 | 40.685 | **≈ 41.800** | 10 |
| 6 | `01_technical` | 3.365 | 36.666 | **≈ 37.700** | 10 |
| 7 | `adr` | 2.517 | 24.470 | **≈ 25.200** | 31 |
| 8 | `00_overview` | 1.716 | 20.730 | **≈ 21.300** | 5 |
| | **Totale residuo** | **26.640** | **308.377** | **≈ 317.100** | **91** |

E per contrasto, le quattro aree già tradotte: `10_fondamenti` ≈397.300 (misura calibrata sul valore
dichiarato), `08_compliance` ≈72.600, `04_protocols` ≈42.500, `06_security` ≈38.700 - **≈551.000 parole
su 54 file**, cioè circa il **63 % di `docs/`**, non il 51 % dichiarato in `00 §4` (§9).

### 6.3 Da che cosa il costo dipende, oltre alle parole

Il volume è il moltiplicatore, non il costo. Cinque grandezze lo governano, e tre non sono note prima
della passata:

1. **Stabilità dell'italiano durante la passata.** Nota e misurabile: `09_roadmap` è progettata per
   cambiare - revisione mensile, **settimanale dal 19 ottobre 2026**. `01_technical`,
   `02_architecture` e `03_functional` si muoveranno quando il codice arriverà (`T-08`, `T-10`).
2. **Ampiezza del lessico non ancora fissato dal glossario.** `05_domain` e `03_functional` introducono
   un vocabolario proprio; `02_architecture` e `adr` riusano in larga parte le rese già fissate da
   `16-architettura-del-progetto.md` EN. È la ragione per cui l'ordine del §2.3 non è, e non deve
   essere, un ordine per volume crescente.
3. **Numero di difetti che la traduzione fa emergere.** È **la varianza maggiore e non è stimabile**:
   tradurre è la revisione più severa che un testo riceva. Precedente misurato: la tornata su quattro
   aree ha prodotto una cinquantina di voci di registro, fra cui **quattro divergenze sul contratto
   pubblicato verso gli integratori** che hanno richiesto decisioni del committente, non correzioni.
4. **Numero di ancore da aggiornare**, misurato oggi e **da rimisurare prima di ogni area**: 5 per
   `02_architecture`, 0 per le altre - ma zero solo finché quelle aree non puntano a nulla di inglese.
5. **Il costo ricorrente che ogni transizione crea, e che non si estingue.** Dal momento in cui un'area
   entra in `AREE_ESIGITE`, **ogni correzione italiana su quell'area va chiusa in entrambe le lingue
   nello stesso commit, per sempre**. `T-09` non spende solo parole: **alza il costo fisso di ogni
   modifica successiva all'italiano**, area dopo area. Sotto `D62` - dieci-venti ore settimanali - è
   capacità ricorrente, e va sottratta prima di calcolare qualunque data, con lo stesso ragionamento che
   `V-185` e `R-12` applicano al livello di servizio di aggiornamento.

### 6.4 Le date

`T-09` è **`[INTENZIONE]`**, con riferimento temporale «2027, in parallelo allo sviluppo». **Il capitolo
dei traguardi non alloca alcuna data per area, e questo piano non ne inventa nessuna.** Sarebbe la sola
cosa che il piano può aggiungere e che il progetto ha deciso di non dire: `00 §11` prescrive che dove un
tempo non è stimabile con le informazioni disponibili si dichiari da che cosa dipende, ed è preferibile
una lacuna dichiarata a una cifra che qualcuno citerà come propria.

Ciò che il piano fissa è **l'ordine** (§2.3) e **la forma della registrazione**: la data di ciascuna
transizione è **registrata quando avviene**, non pianificata prima. È esattamente ciò che il criterio di
completamento richiede - «la transizione è registrata con la data» - e nient'altro.

---

## 7. Il rapporto fra `T-06` e `T-09`

**`T-06` comprende** il sottoinsieme che `D56` dichiara **non rinviabile**: avvertenze pubbliche, guida
dei fondamenti, conformità, sicurezza, più il meccanismo di controllo. Il criterio di appartenenza non è
l'importanza ma **l'irrecuperabilità del costo di omissione**: sono i testi che dichiarano obblighi
regolatori e limiti d'uso, e un contenuto normativo che dice due cose diverse in due lingue è un difetto
documentale in un dispositivo medico (`R-16`, `I5`).

**`T-09` comprende tutto il resto**: nove transizioni, ≈317.100 parole di traduzione su 91 file, più una
transizione a costo nullo (`04_protocols`).

**Perché `T-09` è in parallelo allo sviluppo e non prima.**

1. **Perché una decisione lo ha stabilito.** `D56` emenda `D52`: la traduzione integrale non è più
   prerequisito di ogni riga di codice, e chiude `Q-182`. `D53` lo rende anche non eseguibile:
   novantasette giorni e un contributore unico.
2. **Perché l'aritmetica non lascia scelta.** ≈317.100 parole davanti a `T-08` significa nessun codice
   entro il 30 novembre 2026: mancare `D53` in pubblico per proteggere `D50`. `00 §8.3` dice che cosa
   succede allora - la data non si sposta, si riduce l'ambito, oppure **si dichiara mancata** (`V-282`).
3. **Perché sei delle otto aree descrivono un sistema che non esiste ancora in codice.** Tradurle prima
   che il codice le muova garantisce di ritradurle. È la ragione di merito, ed è l'unica che varrebbe
   anche se la capacità fosse doppia.
4. **Perché il rinvio è reso sicuro dal meccanismo, non dalla speranza.** `V-183` mantiene le due lingue
   obbligatorie sulle aree prerequisito e sottopone il resto al **regime di segnalazione misurata**. È
   ciò che ha fatto scendere `R-03` da `I4` a `I3`: non la riduzione del volume, ma il fatto che la
   parte non tradotta sia **visibile e misurata**. `T-09` è l'attività che consuma quella misura fino ad
   azzerarla.

**Il rapporto d'ordine operativo, che è più stretto dell'innesco dichiarato.** L'innesco di `T-09` è la
chiusura di `T-06`; ma la condizione minima è più precisa: **finché `continue-on-error: true` resta su
`divergenza-traduzioni`, nessuna transizione di `T-09` ha conseguenza** (§1.4).

---

## 8. Rischi propri, e che cosa il traguardo non comprende

### 8.1 Rischi

| # | Rischio | Contromisura |
|---|---|---|
| 1 | **Un'area tradotta e poi riscritta dal codice.** Riguarda `01_technical`, `02_architecture`, `03_functional` dopo `T-08` e `T-10` | Non è eliminabile con l'ordine, e **non si finge che lo sia**: si accetta, e il controllo di divergenza rende il ritardo visibile invece che silenzioso. Per `09_roadmap`, dove il fenomeno è certo e settimanale, l'ordine lo colloca ultimo |
| 2 | **Deriva terminologica fra aree tradotte in passate diverse.** Su un sito bilingue è l'equivalente inglese del problema `Q-06` | Glossario letto prima e riversato dopo; consolidamento a passaggio unico; verifica di perimetro del runbook §9.3 - `grep` sull'intero corpus per la forma scartata, risultato vuoto, eccezioni dichiarate con la ragione |
| 3 | **Ancore rotte in due direzioni.** Chi traduce un file ne traduce i titoli e quindi gli *slug*; il fenomeno è **invisibile finché il bersaglio non è tradotto** e si manifesta **solo nella costruzione inglese** | Regola doppia del runbook §8: chi traduce un file **aggiorna le ancore in entrata** dai file già tradotti, e chi traduce un file che punta a un bersaglio già tradotto **usa lo slug inglese**. Misura del criterio A rifatta **prima di ogni area**. Il gate `npm run build` le elenca tutte |
| 4 | **Il registro dei difetti è a sua volta fallibile**: nove voci su circa cinquanta erano sbagliate, e una avrebbe *introdotto* l'incoerenza che dichiarava di correggere | Ogni voce si **verifica sul testo bersaglio** prima di applicarla - aprire le sezioni citate, contare gli elementi, cercare le altre occorrenze; gli errori si riferiscono in una sezione dedicata; si dichiara **anche** quando una voce risulta corretta |
| 5 | **Un agente che riassume invece di tradurre non lo dichiara** | Controllo di ampiezza al ±15 % per file, cancello 3. È l'unico modo per accorgersene |
| 6 | **Un difetto chiuso in una lingua sola.** È già successo, con `7750d38` | Ogni voce si chiude **sull'italiano e sull'inglese nello stesso commit**. Dove la correzione italiana non ha versante inglese, **non si forza una modifica fittizia**: si dichiara la perdita, e il file inglese si tocca comunque nello stesso commit con la ragione scritta |
| 7 | **La transizione irreversibile su un'area il cui italiano si muove ancora** - l'errore che `09_roadmap` renderebbe strutturale | L'ordine, e la regola: **non si promuove un'area la cui cadenza di modifica è superiore alla cadenza con cui si può chiuderne la traduzione** |
| 8 | **Il costo ricorrente cresce a ogni transizione** e non torna indietro (§6.3, punto 5) | Dichiararlo prima di ogni promozione. Sotto `D62` è capacità sottratta, non aggiunta |
| 9 | **`R-03` - il volume del corpus eccede la capacità di traduzione.** Probabilità alta, impatto `I3` sul piano 2027 | L'indicatore anticipatore è il rapporto del controllo: **se la distanza fra i due corpus cresce fra due revisioni consecutive, la traduzione assistita non tiene il passo della produzione**. La risposta dichiarata è *accettare*, a condizione che la distanza resti misurata |
| 10 | **`R-24` - le priorità si spostano su richiesta esterna.** `T-09` è `[INTENZIONE]` senza data: è la voce di coda più facile da rinviare, e il rinvio non produce alcun segnale | La contromisura è il criterio stesso: **ogni transizione registrata con la data** rende il rinvio leggibile. Un traguardo senza transizioni registrate per un periodo lungo è un traguardo fermo, e si vede |

### 8.2 Che cosa `T-09` non comprende

- **Non comprende le aree prerequisito né le avvertenze pubbliche**: sono `T-06`, criterio 1, già
  soddisfatto.
- **Non comprende la procedura di allineamento come documento controllato** né il controllo del
  criterio 5 sulle stringhe di internazionalizzazione: sono `T-06`, criteri 6 e 5.
- **Non comprende la rimozione di `continue-on-error`**, che è `T-06` e ne è la precondizione.
- **Non comprende la riemissione sotto controllo dei documenti** prodotti prima di `T-01`.
- **Non comprende la traduzione dell'involucro del sito**: `code.json`, `current.json`, `navbar.json`,
  `footer.json` sono già tradotti e vanno **usati come fonte**, non riscritti; `_category_.json` non si
  crea, perché le etichette di categoria stanno in `current.json`.
- **Non comprende la traduzione del contesto di lavoro** (`.telemedic/`), del registro degli
  identificativi (`registro/`), degli script, dei messaggi di commit d'esempio - che la convenzione
  vuole in italiano - né degli identificatori nei blocchi di codice, che restano in italiano per la
  scelta di forma registrata e che **si cambierebbe per l'intero repository o per nessun file**.
- **Non comprende alcuna verifica eseguita da un secondo soggetto** (`V-281`): sotto `D54` non è
  producibile, ed è lacuna dichiarata con la data in cui nasce.
- **Non rende l'inglese autoritativo.** La fonte resta l'italiano: `docs/` non si tocca mai, il lavoro è
  interamente additivo, e una divergenza si risolve **ritraducendo il documento, non annotandola**.
- **Non comprende la correzione dei difetti dell'originale**: la traduzione li **riproduce fedelmente e
  li segnala**, perché correggere in traduzione crea la divergenza silenziosa che il progetto considera
  peggiore del difetto.

---

## 9. Contraddizioni fra documenti trovate - non corrette

1. **Il conteggio del corpus non torna con sé stesso.** `00 §4` dichiara 860.718 parole in `docs/`,
   397.315 nella sola `10_fondamenti`, e **439.982 su quattro aree tradotte, il 51 %**. Le tre cifre sono
   incompatibili, e la refutazione non dipende dal metodo di questo piano: le sole righe con **almeno
   dodici parole** valgono già ≥36.780 parole in `08_compliance`, ≥25.896 in `04_protocols`, ≥21.000 in
   `06_security`, cioè ≥83.676 in totale, contro le 42.667 che resterebbero disponibili una volta tolte
   le 397.315 di `10_fondamenti` dalle 439.982. La misura calibrata dà **≈551.000 parole tradotte
   (≈63 %)** e **≈317.100 residue**, non 420.736. La cifra da rifare è la ripartizione, non il totale:
   860.718 e 397.315 sono entrambe compatibili con la misura entro l'1 %.
2. **I file di `docs/` sono 145**, contro i «centoquarantaquattro» di `00 §4`.
3. **`04_protocols` è tradotta per intero ma non è fra le aree esigite dal controllo.** È coerente con
   `D56`, che non la elenca fra i prerequisiti, e produce un esito che nessun documento dichiara:
   un'area completa in entrambe le lingue che il controllo **non protegge**. È la prima transizione di
   `T-09` e costa zero parole.
4. **Il registro delle revisioni dichiara soddisfatti i criteri 2 e 3 di `T-06` e il criterio 3 di
   `T-03`**, mentre il lavoro `divergenza-traduzioni` porta `continue-on-error: true` e il controllo
   riporta `Divergenti: 2` su aree prerequisito. Dettaglio nel piano di `T-06` §9.
5. **Il registro dei difetti §19.5 elenca tre divergenze apparenti**; il controllo ne segnala **due**.
6. **Il runbook §3 dichiara che un collegamento relativo verso un bersaglio non tradotto è «il
   comportamento atteso, non un errore»**, mentre il mandato di questo piano riferisce 42 collegamenti
   rotti nella locale inglese attribuiti proprio a quel fenomeno. Non conciliabili senza l'esito della
   costruzione, che questa sessione non ha eseguito: **`[NV]`**. La misura sostitutiva usata al §2 -
   righe con collegamenti in entrata dall'inglese - è riproducibile e non dipende dalla costruzione.
7. **`09_roadmap` è l'area di volume massimo fra le residue e di pressione di puntamento quasi nulla.**
   Nessun documento del progetto registra questa asimmetria, che è invece la ragione per cui l'ordine di
   traduzione non può essere l'ordine di importanza.
