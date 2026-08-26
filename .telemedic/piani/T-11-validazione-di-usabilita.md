# Piano di `T-11` - Validazione sommativa di usabilità

> **Che cos'è questo documento.** È il piano di lavoro di un traguardo marcato `[INTENZIONE]`,
> collocato oltre il primo rilascio installabile. Non è una procedura del sistema di gestione
> della qualità (`V-174`), non è un documento del fascicolo tecnico, e non è materiale
> pubblicabile: vive in `.telemedic/`, che il § 1 di
> [`docs/08_compliance/10-controllo-dei-documenti.md`](../../docs/08_compliance/10-controllo-dei-documenti.md)
> non elenca fra i documenti sottoposti a controllo formale.
>
> **Stato di fatto, ripetuto qui perché è la sola riga che cambia le decisioni di chi legge.**
> Oggi il prodotto **non reca marcatura CE**, non è coperto da alcuna dichiarazione di conformità
> e **non è utilizzabile per l'erogazione di prestazioni sanitarie su pazienti reali**. **Nessuna
> valutazione formativa è stata condotta con utenti reali e nessuna validazione sommativa
> esiste.** Il progetto **intende** assumere il ruolo di fabbricante (`D58`), e **il soggetto
> giuridico che lo eserciterebbe è ancora da costituire**. Nessuna riga di questo piano attenua
> nulla di tutto ciò.
>
> **Nessuna data di marcatura compare in questo documento, in alcuna forma.** Lo vietano `V-171`
> ([`08/01 §11`](../../docs/08_compliance/01-inquadramento-normativo.md)) e `V-280`
> ([`09/00 §3.1`](../../docs/09_roadmap/00-indice.md)), e il divieto non ammette eccezioni per la
> pianificazione interna.

---

## 0. Come si legge questo piano, e che cosa in esso è nuovo

**Gli identificativi `T-11/L-nn` sono designazioni interne di questo piano.** Non appartengono
agli spazi congelati da `V-120` (`RF-*`, `RNF-*`, `BR-*`, `ATT-*`, `UC-*`, `OUT-*`, `EX-*`,
`DM-*`), non appartengono allo spazio dei documenti regolatori di `V-172` (`MDR-*`, `QMS-*`,
`SW-*`, `RM-*`, `UE-*`, `UEF-*`, `CE-*`, `PMCF-*`, `PMS-*`, `PSUR-*`, `VIG-*`, `ON-*`), non
entrano nella matrice di tracciabilità e **non possono comparire in una prova**. Valgono quanto
le sigle `OL-nn` del § 1.1 di
[`09/04`](../../docs/09_roadmap/04-oltre-il-primo-rilascio.md): un modo per riferirsi a una riga
senza ricopiarla.

**Una dichiarazione di metodo che va fatta prima di ogni altra cosa, perché senza di essa questo
piano si legge male.** Il § 5 di [`09/02`](../../docs/09_roadmap/02-traguardi.md) descrive `T-11`
con un obiettivo, una dipendenza dura e una motivazione di classe, **ma non con criteri di
completamento binari numerati**, che è invece la forma che il § 0 dello stesso capitolo prescrive
per ogni traguardo e che il vincolo `V-181` rende obbligatoria. I criteri del § 2 di questo piano
sono quindi **derivati e proposti**, non citati: sono ricavati da
[`08/06`](../../docs/08_compliance/06-usabilita-e-accessibilita.md) §§ 4, 5, 8 e 9 e da
[`03_functional/06`](../../docs/03_functional/06-accessibilita-e-usabilita.md) §§ 2 e 6. **Non
sono in vigore finché la roadmap non li adotta** con la procedura di revisione fuori cadenza di
[`09/00 §8.2`](../../docs/09_roadmap/00-indice.md). Un piano che presentasse criteri propri come
criteri della roadmap avrebbe deciso al posto di chi decide.

---

## 1. La marcatura, verificata

| Voce | Valore accertato | Dove |
|---|---|---|
| Classe di attività | **`B`** - tempo di attraversamento determinato da terzi | [`09/02 §5`](../../docs/09_roadmap/02-traguardi.md) |
| Classe di enunciato | **`[INTENZIONE]`** | *ibidem*, confermato nella tabella di sintesi [`09/02 §7.1`](../../docs/09_roadmap/02-traguardi.md) |
| Data | **Nessuna.** «successiva al congelamento dell'interfaccia» | *ibidem* |
| Innesco | **Congelamento dell'interfaccia** | *ibidem* |
| Titolare | **Committente** per l'ingaggio della competenza esterna; **progetto** per il protocollo | *ibidem* |

**Che cosa discende dalla marcatura, e vincola questo piano.**

`[INTENZIONE]` significa, ai sensi del § 2 di [`09/00`](../../docs/09_roadmap/00-indice.md), che
il progetto dichiara di volerlo fare e **non assume un impegno sul quando**. Questo piano non
produce quindi una data, non produce una finestra, e non produce una sequenza da cui una data si
possa ricavare per somma. **Dove una durata è dichiarata, è una durata e non un termine**, ed è
citata dalla fonte che la dichiara - la distinzione è la stessa che l'avvertenza di
[`08/07`](../../docs/08_compliance/07-valutazione-clinica.md) applica ai sei-nove mesi della
valutazione clinica.

Classe `B` significa che il fattore limitante **non è la capacità del progetto**. Sotto `D54` e
`D62` - contributore unico, dieci-venti ore a settimana - questo è l'unico blocco di lavoro di
`T-11` che la capacità non penalizza e, simmetricamente, l'unico che la capacità non accelera.

---

## 2. I criteri, uno per uno

Ciascun criterio ha tre colonne: **che cosa serve**, **che cosa esiste già** (misurato sul
repository, non dedotto), **come si dimostra soddisfatto** in forma binaria. Nessuna percentuale,
nessun avverbio.

### C-1 - Esiste la specifica d'uso `UE-SPEC-001`

**Che cosa serve.** Indicazione, popolazione, profilo di ciascun gruppo di utilizzatori, ambiente
d'uso previsto, principio operativo (artefatti 1 e 2 della tabella di
[`08/06 §4`](../../docs/08_compliance/06-usabilita-e-accessibilita.md)).

**Che cosa esiste già.** L'analisi da cui il documento si scrive: i sei profili di utente reale
di [`03_functional/06 §3`](../../docs/03_functional/06-accessibilita-e-usabilita.md), le otto
funzioni correlate alla sicurezza del § 6 dello stesso capitolo, la mappa dei quattro gruppi di
utilizzatori di [`08/06 §5`](../../docs/08_compliance/06-usabilita-e-accessibilita.md). **Il
documento non esiste**: nessun file nello spazio `UE-*` è presente nel repository. `08/06 §4`
qualifica la posizione del progetto come «bozza integrale ricavabile», che è cosa diversa da
«prodotta».

**Come si dimostra soddisfatto.** Esiste un documento con tutte le sezioni compilate **tranne**
quella dell'ambiente e del dispositivo di riferimento, che porta il rinvio esplicito a `Q-115` e
`Q-175` e **non un valore inventato**. Il § 10 di `08/06` è esplicito: finché quei due non sono
dichiarati, `UE-SPEC-001` **non è completabile** e `RNF-106` non è verificabile. Un documento che
compilasse quella sezione con una scelta non decisa sarebbe peggio di un documento incompleto,
perché renderebbe non visibile una lacuna che oggi è visibile.

### C-2 - Esistono i pericoli, le situazioni pericolose e gli scenari d'uso pericolosi `UE-HAZ-001`

**Che cosa serve.** Artefatti 3 e 4 di `08/06 §4`, in forma narrativa, con rinvio al registro dei
rischi.

**Che cosa esiste già.** Le otto funzioni correlate alla sicurezza con l'errore d'uso temuto e il
requisito che lo presidia
([`03_functional/06 §6`](../../docs/03_functional/06-accessibilita-e-usabilita.md)); le cinque
righe di [`08/06 §6.1`](../../docs/08_compliance/06-usabilita-e-accessibilita.md) che collegano
difetto di accessibilità ed errore d'uso alle righe `RM-07`, `RM-14`, `RM-12`, `RNF-054` e a
`D22`; l'esempio del campo soglia (`RM-06`, `V-123`). **Il documento non esiste.**

**Come si dimostra soddisfatto.** Ogni funzione correlata alla sicurezza dell'elenco di
`03_functional/06 §6` ha **almeno uno scenario narrativo**, e ogni scenario ha **una riga
corrispondente nel registro dei rischi oppure la motivazione documentata del perché non ne
produce**. La terza regola operativa di [`08/06 §3`](../../docs/08_compliance/06-usabilita-e-accessibilita.md)
non ammette una terza possibilità, e in particolare non ammette il rinvio a fine progetto.

### C-3 - Esiste la specifica dell'interfaccia utente `UE-UIS-001`, in termini verificabili

**Che cosa serve.** Artefatto 6 di `08/06 §4`.

**Che cosa esiste già.** I requisiti verificabili di
[`03_functional/06 §4`](../../docs/03_functional/06-accessibilita-e-usabilita.md), fra cui
`RNF-044` (livello AA sui percorsi critici, zero violazioni A e AA) e `RNF-046` (percorsi critici
completabili con almeno due strumenti di lettura su due sistemi operativi). **Nessuna interfaccia
esiste**: [`09/00 §4`](../../docs/09_roadmap/00-indice.md) accerta «Codice applicativo: assente»,
e `V-182` vieta ogni riga applicativa prima di `T-03`.

**Come si dimostra soddisfatto.** Esiste un documento che descrive l'interfaccia della
configurazione designata al congelamento in termini verificabili, e ogni enunciato è riferibile a
un requisito del catalogo con identificativo presente nel registro
`registro/identificativi-requisiti.tsv`. Il controllo `scripts/verifica-identificativi-requisiti.sh`
è già in esercizio e fa fallire la costruzione su un identificativo assente: **la verifica è
meccanica e non a vista**.

### C-4 - Esiste la selezione motivata degli scenari da validare

**Che cosa serve.** Artefatto 5 di `08/06 §4`: la selezione motivata sulla gravità.

**Che cosa esiste già.** Nulla come documento.

**Come si dimostra soddisfatto.** Esiste la **proposta motivata** del progetto, con per ciascuno
scenario incluso o escluso la ragione fondata sulla gravità. **La determinazione è dell'atto del
fabbricante** e non del progetto: il criterio è quindi soddisfatto dalla proposta, e la sua
adozione è un atto riservato (§ 6 di questo piano).

### C-5 - Esiste il piano di validazione `UE-PLAN-001`, approvato prima dell'esecuzione

**Che cosa serve.** Protocollo, criteri di superamento, numero e profilo dei partecipanti,
ambiente, compiti (artefatto 7 di `08/06 §4`), **approvato prima dell'esecuzione** (riga 2 della
tabella di [`08/06 §8`](../../docs/08_compliance/06-usabilita-e-accessibilita.md)).

**Che cosa esiste già.** La mappa dei quattro gruppi di utilizzatori e la regola che quattro
gruppi significano **quattro coorti** (`08/06 §5`); la regola che la disabilità e l'età avanzata
sono caratteristiche **dentro** ciascuna coorte pertinente e non una quinta coorte; la posizione
del progetto sul numero di partecipanti, che è di dichiarare il **criterio di sufficienza** e non
un numero, perché la cifra di quindici partecipanti per gruppo proviene dalla linea guida di
un'autorità extraeuropea, **non è un requisito dell'Unione** ed è marcata `[NV]` in `08/06 §5`.

**Come si dimostra soddisfatto.** Esistono, insieme e non alternativamente: (a) la bozza tecnica
del protocollo, che copre le quattro coorti; (b) la dichiarazione del criterio di sufficienza
adottato, tipicamente la saturazione degli errori d'uso osservati, **e non un numero presentato
come obbligo**; (c) la registrazione di approvazione anteriore alla data della prima sessione. Il
punto (c) **non è eseguibile oggi** (§ 6). Verifica testuale binaria compresa nel criterio:
nessuna occorrenza, nel protocollo, di un numero di partecipanti presentato come requisito
normativo.

### C-6 - La validazione sommativa è stata condotta su utenti rappresentativi

**Che cosa serve.** Artefatto 8 di `08/06 §4`, con le sei condizioni di validità della tabella di
`08/06 §8`: interfaccia congelata, protocollo approvato prima, partecipanti rappresentativi e non
sostituti, ogni gruppo coperto, anziani e persone con disabilità dentro le coorti, fallimento
analizzato e non riparato in corsa.

**Che cosa esiste già.** Nulla. L'avvertenza di apertura di `08/06` lo dichiara senza
attenuazioni: «nessuna validazione sommativa esiste».

**Come si dimostra soddisfatto.** Esiste il rapporto `UE-SUM-001`, riferito a un'interfaccia
identificata per impronta esatta, che copre le quattro coorti, e nel quale ciascun partecipante è
attestato come appartenente alla popolazione di riferimento. **Sviluppatori, colleghi e
conoscenti non sono utilizzatori rappresentativi**: `08/06 §8` stabilisce che una sommativa
condotta su di essi **non è una sommativa**, e il criterio recepisce quella frase come condizione
di fallimento, non come raccomandazione.

### C-7 - La lacuna formativa è dichiarata, datata e non attenuata

**Che cosa serve.** `T-11` in `09/02 §5` dichiara: la valutazione **formativa** non è
recuperabile, è fra i tagli irreversibili di
[`09/03 §5`](../../docs/09_roadmap/03-primo-rilascio-utilizzabile.md), e questo traguardo copre
la sommativa e **dichiara la lacuna formativa**.

**Che cosa esiste già.** La dichiarazione dello stato di fatto in `08/06` e nella tabella di
[`09/02 §4.2`](../../docs/09_roadmap/02-traguardi.md), riga «Ingegneria dell'usabilità»,
reversibile: **No**.

**Come si dimostra soddisfatto.** Esiste, nell'elenco delle lacune dichiarate che il criterio 2
di `T-10` impone nel fascicolo di rilascio, la riga della lacuna formativa **con la data in cui è
nata e il periodo cui si riferisce**, e il fascicolo `UEF-001` la riporta senza formule
attenuative. Un fascicolo che non la contenesse sarebbe peggiore della lacuna stessa
([`09/01 §8.2`](../../docs/09_roadmap/01-principi-e-metodo.md)).

### C-8 - Il fascicolo `UEF-001` è consolidato

**Che cosa serve.** L'insieme degli artefatti 1–8 più le tracciature verso il registro dei
rischi, con il collegamento bidirezionale di `V-175`.

**Che cosa esiste già.** Il vincolo `V-175` con la sua conseguenza meccanica: l'elenco delle
caratteristiche legate alla sicurezza e l'elenco dei criteri oggetto di non conformità dichiarata
devono avere **intersezione vuota**, e la verifica è automatica una volta che entrambi gli
elenchi sono versionati. Nessuno dei due elenchi è oggi versionato come artefatto.

**Come si dimostra soddisfatto.** Esistono i due elenchi versionati, esiste il controllo che
verifica l'intersezione vuota, ed è stato **visto fallire** su un caso deliberatamente
sovrapposto - la stessa regola del criterio 2 di `T-03`: un controllo che non è stato visto
fallire non è un controllo. La **composizione e la firma** del fascicolo restano atto riservato
(§ 6).

### C-9 - Nessun dato reale di paziente è entrato nella validazione, in alcuna forma

**Che cosa serve.** La regola non negoziabile del progetto, ripetuta nel criterio 2 di `T-03`
come controllo bloccante sugli identificativi sintetici e sull'assenza di dati reali.

**Come si dimostra soddisfatto.** Il materiale su cui i partecipanti operano è **interamente
sintetico e riconoscibile come tale**, il controllo bloccante gira sull'insieme dei fascicoli di
collaudo della sommativa e passa, e il rapporto dichiara che i compiti sono stati eseguiti su
dati sintetici. **Vincolo sulla forma della prova, e va detto perché è un costo reale**: un
errore d'uso osservato su dato sintetico è evidenza utilizzabile solo se il fascicolo sintetico
riproduce le caratteristiche discriminanti del caso reale - valore prossimo alla soglia, unità
ambigua, quasi-omonimia per lo scenario del cambio di soggetto (`RM-09`). **La progettazione dei
vettori sintetici è quindi parte del protocollo e non un'attività di contorno**, ed è il lavoro
`T-11/L-06`.

### C-10 - Nessun materiale prodotto dal traguardo contiene una data di marcatura

**Come si dimostra soddisfatto.** Verifica **testuale** su tutto il materiale prodotto, come nel
criterio 5 di `T-14`, con esito registrato. È un criterio del traguardo e non una raccomandazione.

---

## 3. L'innesco, reso osservabile

`T-11` non ha una data: ha un innesco, ed è il **congelamento dell'interfaccia**. Un innesco che
non si osserva è un innesco che non scatta mai, e la prima cosa che questo piano deve produrre è
la forma osservabile di quella parola.

### 3.1 Che cosa «congelata» non significa

Non significa «l'interfaccia ha smesso di cambiare». È una proprietà che si accerta solo a
posteriori e che nessuno può dichiarare in anticipo. Assumerla come innesco significa attendere
un evento non osservabile, cioè non cominciare.

### 3.2 Che cosa significa, in forma binaria

Il congelamento è **un atto registrato, non uno stato di fatto**. Si considera verificato quando
tutte e cinque le condizioni seguenti sono vere insieme, e ciascuna è accertabile da chiunque:

1. **Esiste un rilascio designato**, identificato per **impronta esatta** e non per etichetta
   mobile, sul quale la validazione sarà condotta. L'esclusione dell'etichetta mobile è la stessa
   regola della voce 9 della lista di autocontrollo di
   [`08/04 §16`](../../docs/08_compliance/04-fascicolo-tecnico.md) e del vincolo `V-173`.
2. **Esiste l'elenco versionato dei percorsi critici coperti** da quel rilascio, confrontato con i
   dieci percorsi critici di
   [`03_functional/06 §2`](../../docs/03_functional/06-accessibilita-e-usabilita.md) - accesso e
   autenticazione, verifica tecnica preventiva, sala d'attesa e ammissione, sessione con i
   controlli essenziali, raccolta delle manifestazioni di volontà, consultazione e scaricamento
   dei documenti, inserimento manuale di una misura, compilazione di un questionario, lettura
   dell'istruzione di instradamento, dichiarazione di indisponibilità - con **dichiarato quali di
   essi il rilascio non contiene** e perché.
3. **Esiste la dichiarazione scritta, versionata e datata** che nessuna modifica all'interfaccia
   di quel rilascio è ammessa senza una **valutazione di impatto registrata**, e che una modifica
   che tocchi una funzione correlata alla sicurezza comporta una **ripetizione parziale** della
   validazione (riga 1 della tabella di `08/06 §8`).
4. **Esiste la procedura di eccezione**: chi può autorizzare una modifica dopo il congelamento,
   con quale registrazione, e con quale conseguenza dichiarata sulla validità di ciò che è già
   stato condotto. Una procedura di eccezione assente non produce un congelamento più rigido:
   produce un congelamento che verrà violato senza traccia.
5. **Le voci di coda che modificano i percorsi critici sono chiuse o esplicitamente escluse dal
   perimetro del congelamento**, con la conseguenza dichiarata. È il § 3.3.

Quando le cinque condizioni sono vere, l'innesco è scattato, e la registrazione della data in cui
lo è va nel registro delle revisioni di [`09/00 §8.4`](../../docs/09_roadmap/00-indice.md).

### 3.3 La condizione 5 è quella che costa, ed è la ragione per cui va scritta prima

Congelare un'interfaccia mentre restano in coda voci che la modificano significa **eseguire la
sommativa due volte**: è la prima delle tre modalità di fallimento elencate in `08/06 §8`. Le
voci della coda di [`09/04 §3`](../../docs/09_roadmap/04-oltre-il-primo-rilascio.md) che toccano
percorsi critici sono almeno quattro, e vanno guardate una per una prima di congelare.

| Voce di coda | Perché tocca il congelamento |
|---|---|
| `OL-15` Documentazione clinica e refertazione | Introduce redazione, firma, oscuramento applicato dal motore e accesso d'emergenza: sono percorsi nuovi del professionista e cambiano «consultazione e scaricamento dei documenti» |
| `OL-02` Terzo partecipante alla sessione | **È il caso più delicato di tutti**, ed è il § 3.4 |
| `OL-17` Componente incorporabile white-label | Cambia il tema, e il tema è oggetto di `V-163`: le dichiarazioni obbligatorie non sono tematizzabili né occultabili. Una sommativa condotta sull'interfaccia propria non copre l'interfaccia tematizzata |
| `OL-19` Interfaccia di amministrazione | Il suo criterio 1 impone i criteri di accessibilità **come criteri di accettazione**, e il gruppo «operatore non sanitario» di `08/06 §5` vi opera |

Il piano non decide quali di queste voci precedano il congelamento: **la decisione è del
committente** e ha un costo dichiarato in entrambe le direzioni. Il piano rende visibile che una
decisione esiste.

### 3.4 La dipendenza fra il congelamento e `OL-02`, che non è visibile da nessuno dei due lati

Il progetto dichiara **una sola** non conformità di accessibilità, sul criterio relativo ai
sottotitoli in tempo reale (`D24`), e la sua **misura alternativa è l'interprete come
partecipante a pieno titolo** ([`08/06 §6.4`](../../docs/08_compliance/06-usabilita-e-accessibilita.md)).
L'interprete è un terzo partecipante, e il terzo partecipante è `OL-02`, la cui ammissibilità
dipende da una misura non ancora eseguita (`Q-111`, `Q-115`).

Ne discendono due conseguenze che vanno dette insieme:

- **Congelare prima che `OL-02` esista** significa condurre la sommativa su un'interfaccia nella
  quale la misura alternativa alla non conformità dichiarata **non è esercitabile**. Il fascicolo
  di usabilità dovrebbe allora documentare l'interprete come misura di controllo del rischio
  senza poterlo mostrare in esercizio, e `08/06 §6.4` prescrive esplicitamente che l'interprete
  vada documentato **anche** nel fascicolo di usabilità, non soltanto nella dichiarazione di
  accessibilità.
- **Se la misura di `Q-111` escludesse il terzo partecipante**, la misura alternativa cadrebbe
  insieme alla dichiarabilità della non conformità, e il riesame sarebbe a carico di chi ha
  dichiarato la non conformità. Questo riaprirebbe il fascicolo di usabilità **dopo** il
  congelamento.

**È un legame fra una decisione di ingegneria e un adempimento di accessibilità che non è
visibile da nessuno dei due lati**, e questo piano lo registra come tale invece di lasciarlo
scoprire.

---

## 4. I lavori

Tre insiemi: eseguibili ora, eseguibili al congelamento, non eseguibili senza il soggetto
fabbricante (che è il § 6 e non si ripete qui).

### 4.1 Eseguibili ora, senza attendere nulla

| # | Prodotto | File toccati | Dipendenze | Criterio di fatto (binario) |
|---|---|---|---|---|
| `T-11/L-01` | Bozza di `UE-SPEC-001`: specifica d'uso e caratteristiche dell'interfaccia legate alla sicurezza | nuovo, in `docs/08_compliance/` o in uno spazio `UE-*` da collocare | `Q-115`, `Q-175` **aperte** | Il documento esiste con tutte le sezioni compilate tranne ambiente e dispositivo di riferimento; quella sezione porta il rinvio a `Q-115` e `Q-175` e nessun valore |
| `T-11/L-02` | Bozza di `UE-HAZ-001`: pericoli, situazioni pericolose e scenari d'uso pericolosi in forma narrativa | nuovo; rinvii a `docs/03_functional/06`, `docs/08_compliance/05` | `T-11/L-01` per la specifica d'uso | Ogni funzione dell'elenco di `03_functional/06 §6` ha almeno uno scenario; ogni scenario ha una riga nel registro dei rischi **oppure** la motivazione scritta del perché non ne produce |
| `T-11/L-03` | Proposta motivata di selezione degli scenari da validare | sezione di `UE-PLAN-001` | `T-11/L-02` | Ogni scenario di `L-02` compare nella proposta come incluso o escluso, con la motivazione fondata sulla gravità. Nessuno scenario resta senza riga |
| `T-11/L-04` | Definizione osservabile del congelamento e procedura di eccezione | nuovo; recepimento in `docs/09_roadmap/` a cura del titolare della roadmap | nessuna | Le cinque condizioni del § 3.2 esistono in forma versionata, e la procedura di eccezione nomina chi autorizza, con quale registrazione e con quale conseguenza |
| `T-11/L-05` | Bozza tecnica del protocollo `UE-PLAN-001`: compiti, criteri di superamento, quattro coorti, ambiente, criterio di sufficienza | nuovo | `T-11/L-03` | Il protocollo esiste, copre le quattro coorti di `08/06 §5`, dichiara il **criterio di sufficienza** e **non** un numero, e non contiene alcun dato reale di paziente. La verifica dell'ultima condizione è **testuale ed è parte del lavoro** |
| `T-11/L-06` | Vettori sintetici di collaudo per la sommativa | nuovo, in un'area di dati sintetici; controllo esistente di `T-03` criterio 2 | `T-11/L-03` | Esiste almeno un fascicolo sintetico per ciascuno scenario selezionato; ciascuno riproduce la caratteristica discriminante dichiarata; il controllo sugli identificativi sintetici e sull'assenza di dati reali gira su di essi e **passa** |
| `T-11/L-07` | Piano di reclutamento: profilo delle quattro coorti, canali, testo del consenso alla partecipazione, sequenza | nuovo | nessuna interna | Il documento esiste, e per ciascuna coorte dichiara il canale di reclutamento e le caratteristiche che devono essere presenti **dentro** la coorte, non accanto ad essa |
| `T-11/L-08` | Registrazione datata della lacuna formativa | elenco delle lacune dichiarate previsto dal criterio 2 di `T-10` | nessuna | Esiste la riga con: data di nascita della lacuna, periodo cui si riferisce, ragione, titolare, e la dichiarazione che **non è chiudibile a posteriori** |
| `T-11/L-09` | Elenco versionato delle caratteristiche dell'interfaccia legate alla sicurezza e elenco versionato dei criteri oggetto di non conformità dichiarata | nuovi | `T-11/L-01` | I due elenchi esistono, sono versionati e sono leggibili da macchina |
| `T-11/L-10` | Controllo automatico dell'intersezione vuota fra i due elenchi di `L-09` (`V-175`) | `scripts/`, `.github/workflows/verifiche.yml` | `T-11/L-09` | Il controllo esiste, è bloccante, ed è stato **visto fallire** su un caso deliberatamente sovrapposto |
| `T-11/L-11` | Verifica testuale di assenza di date di marcatura e di numeri di partecipanti presentati come obbligo, su tutto il materiale del traguardo | `scripts/` | `L-01`…`L-08` | La verifica esiste, gira sull'intero materiale, ha esito registrato e datato, ed è stata provata su un testo deliberatamente non conforme |

### 4.2 Eseguibili quando l'innesco è scattato

| # | Prodotto | File toccati | Dipendenze | Criterio di fatto (binario) |
|---|---|---|---|---|
| `T-11/L-12` | `UE-UIS-001`: specifica dell'interfaccia in termini verificabili, riferita al rilascio designato | nuovo | Congelamento (§ 3.2); esistenza dell'interfaccia (`T-08`, `T-10`) | Ogni enunciato è riferito a un identificativo presente nel registro `registro/identificativi-requisiti.tsv`, e il controllo esistente non produce rilievi |
| `T-11/L-13` | Esecuzione del reclutamento sulle quattro coorti | - | `T-11/L-07`; dipendenza esterna `E-1`; ingaggio della competenza esterna | Per ciascuna delle quattro coorti esiste un insieme di partecipanti reclutati e consenzienti, con le caratteristiche di età e disabilità **presenti dentro la coorte**; una coorte scoperta è un criterio non soddisfatto, non una copertura parziale |
| `T-11/L-14` | Conduzione della sommativa e rapporto `UE-SUM-001` | - | **Atto riservato** (§ 6) | Il rapporto esiste, è riferito all'impronta esatta del rilascio congelato, copre le quattro coorti, e dichiara che i compiti sono stati eseguiti su dati sintetici |
| `T-11/L-15` | Consolidamento del fascicolo `UEF-001` | - | **Atto riservato** (§ 6) | Il fascicolo contiene gli artefatti 1–8, le tracciature verso il registro dei rischi, la lacuna formativa datata di `L-08`, ed è firmato |

---

## 5. Le dipendenze

### 5.1 Interne

| # | Da che cosa dipende | Che cosa fornisce |
|---|---|---|
| I-1 | `T-08`, `T-10` | L'interfaccia. Senza un'interfaccia non esiste nulla da congelare né da validare |
| I-2 | Registro degli identificativi (`T-01` criteri 3 e 4) | Il riferimento verificabile di `UE-UIS-001`. **Già soddisfatto**: `registro/identificativi-requisiti.tsv` esiste con 614 identificativi su otto famiglie, e `scripts/verifica-identificativi-requisiti.sh` è in esercizio |
| I-3 | `T-03` criterio 2 | Il controllo bloccante sugli identificativi sintetici e sull'assenza di dati reali, su cui poggia `C-9` |
| I-4 | `Q-111` e `Q-115` | Il limite di partecipanti e il dispositivo di riferimento. Il primo determina la sopravvivenza della misura alternativa (§ 3.4); il secondo determina la completabilità di `UE-SPEC-001` |
| I-5 | Posizione in coda di `OL-02`, `OL-15`, `OL-17`, `OL-19` | Il perimetro del congelamento (§ 3.3) |

### 5.2 Esterne, e che cosa succede se non arrivano

**Sotto `D54` una dipendenza esterna non è una formalità: è la condizione di esistenza
dell'attività.** Va detto senza minimizzarlo.

| # | Dipendenza | Se non arriva |
|---|---|---|
| **E-1** | **Utenti rappresentativi reclutabili nelle quattro coorti**, con anziani e persone con disabilità **dentro** le coorti | **La sommativa non si conduce, e non si sostituisce.** `08/06 §8` è esplicito: una sommativa condotta su sviluppatori, colleghi o conoscenti **non è una sommativa**. L'esito non è un ritardo: è che il requisito generale di sicurezza resta **non dimostrato**, e la conseguenza è una lacuna del fascicolo tecnico. `03_functional/06 §6` impone in quel caso di **dichiarare che non è stata svolta**, non di lasciare intendere il contrario. Il reclutamento è dichiarato in [`08/09 §8.1`](../../docs/08_compliance/09-percorso-e-calendario.md) come **sei-dieci settimane**, la voce più lenta e più incerta dell'intero preventivo - ed è una durata, non un termine |
| **E-2** | **Specialista di fattori umani esterno**, con conduzione appaltata ([`08/09 §9`](../../docs/08_compliance/09-percorso-e-calendario.md)) | Il protocollo resta bozza e la conduzione non avviene. Si somma a `R-22`: le figure specialistiche sono una risorsa scarsa |
| **E-3** | **Soggetto fabbricante costituito** | I lavori `L-14` e `L-15` non sono eseguibili, e con essi i criteri `C-6` e `C-8`. Tutto il resto del piano **è eseguibile lo stesso**, ed è la ragione per cui il § 6 esiste |
| **E-4** | **Osservatore diverso da chi ha progettato l'interfaccia** | È la questione `Q-273`, aperta in `08/06 §10`: osservare un utilizzatore rappresentativo mentre esegue un compito **richiede soggetti distinti**, esattamente come l'audit interno, e non è un problema di ore. Se non arriva, non arriva neanche la valutazione **formativa**, e con essa cade l'unica contromisura alla terza modalità di fallimento (§ 8) |
| **E-5** | **Organismo notificato** con cui concordare numerosità e composizione delle coorti | **Non blocca.** La posizione del progetto è già di dichiarare il criterio di sufficienza e non il numero (`08/06 §5`, `§10` ultima riga). L'assenza dell'organismo lascia il criterio dove è |
| **E-6** | **Ambiente di conduzione e consensi dei partecipanti** | I dati dei partecipanti a una sommativa sono dati personali **dei partecipanti**, e il titolare del trattamento è chi conduce lo studio, non il progetto. Se il quadro non è predisposto, la sessione non si tiene. Nota di perimetro: questa è cosa **distinta** dal divieto di dati reali di paziente, che riguarda il materiale su cui i partecipanti operano ed è coperto da `C-9` |

---

## 6. Che cosa non è eseguibile finché il soggetto fabbricante non esiste

`D58` stabilisce che il ruolo di fabbricante sarà assunto dal progetto e che **il soggetto è da
costituire**. La tabella del § 9 di
[`08/06`](../../docs/08_compliance/06-usabilita-e-accessibilita.md) riserva a quel ruolo alcuni
atti, e la riserva **non cade perché il ruolo sarà nostro**: cade quando il soggetto esiste **e**
il controllo dei documenti è in esercizio, perché senza quest'ultimo ciò che si firma è una firma
su un testo e non una dichiarazione.

| Atto | Perché non è anticipabile | Criterio del piano che ne dipende |
|---|---|---|
| **Approvazione e datazione** di `UE-SPEC-001`, `UE-HAZ-001`, `UE-UIS-001` | Riservato al ruolo (`08/06 §4`, colonna 5) | `C-1`, `C-2`, `C-3` restano soddisfatti **come bozze**; l'approvazione è oltre |
| **Determinazione** della selezione degli scenari da validare | Riservato al ruolo (artefatto 5) | `C-4` |
| **Approvazione del protocollo prima dell'esecuzione** | Riservato al ruolo; ed è un punto di non ritorno: approvarlo dopo, o modificarlo alla luce dei primi risultati, **invalida la validazione** ([`08/09 §3.5`](../../docs/08_compliance/09-percorso-e-calendario.md)) | `C-5` punto (c) |
| **Conduzione o commissione della sommativa, e assunzione dell'esito** | Riservato al ruolo | `C-6` |
| **Composizione e firma di `UEF-001`** | Riservato al ruolo | `C-8` |

**La riga che va letta due volte.** Leggere questa colonna come «lavoro di qualcun altro» era
corretto prima di `D58` ed è **scorretto ora**: è **lavoro nostro non ancora eseguibile**, che è
una condizione più onerosa e non meno.

**Che cosa invece non attende nulla, e va detto con la stessa forza.** Tutti i lavori del § 4.1
sono eseguibili oggi. Le **valutazioni formative** in particolare - che questo traguardo non
copre, ma che ne determinano il costo - si conducono su prototipi, anche non funzionanti, prima
che il soggetto esista, senza organismo notificato e senza interfaccia congelata: `08/06 §8`
stabilisce che **nessuna delle condizioni che bloccano gli altri artefatti le tocca**, e che da
`D58` rinviarle non è più un'attesa ma **una perdita nostra**. Restano però soggette a `Q-273`
(dipendenza `E-4`).

---

## 7. Il costo dichiarato

**Non si dichiarano ore.** `D62` quantifica la capacità in dieci-venti ore a settimana per un
contributore unico, e `09/02 §0` stabilisce che le date del progetto sono allocazioni del
calendario residuo e non stime. Si dichiara la **classe di sforzo** e ciò da cui dipende.

| Blocco | Classe | Da che cosa dipende |
|---|---|---|
| Lavori del § 4.1 (bozze, protocollo, vettori sintetici, controlli) | **`D` - comprimibile**, sulla capacità del contributore unico | Dal numero di scenari selezionati in `L-03`, che a sua volta dipende dal numero di funzioni correlate alla sicurezza esercitate dal rilascio designato |
| Reclutamento | **`B` - tempo di calendario di terzi** | Da quattro coorti, dalla difficoltà di reperire persone anziane e persone con disabilità **dentro** ciascuna, e dai consensi. Durata dichiarata dalla fonte: **sei-dieci settimane** (`08/09 §8.1`), da avviare con mesi di anticipo (`08/06 §8`) |
| Conduzione e analisi | **`B`**, e non è del progetto | Dal numero di coorti, dal numero di compiti per sessione, e dalla disponibilità dello specialista esterno |
| Rilavorazione dopo la sommativa | **Non stimabile**, e va detto invece di inventare un numero | È esplicitamente fra le voci **non stimabili** del blocco C di [`08/09 §8.2`](../../docs/08_compliance/09-percorso-e-calendario.md). Un errore d'uso grave richiede una riprogettazione e una nuova validazione parziale: `08/06 §8` lo qualifica come lo scenario che «aggiunge un trimestre al percorso» |

**La variabile che determina l'ordine di grandezza è il numero di coorti**, ed è già fissata a
quattro dalla mappa di `08/06 §5`. Va dichiarata **prima** di chiedere un preventivo, non dopo.

---

## 8. I rischi propri, con la contromisura

| Rischio | Contromisura | Efficacia |
|---|---|---|
| **Si esegue troppo presto**, su un'interfaccia che poi cambia, e va rifatta (prima modalità di `08/06 §8`) | L'innesco osservabile del § 3.2, con la procedura di eccezione e la condizione 5 sulle voci di coda | **Piena**, se la condizione 5 è rispettata |
| **Si esegue su partecipanti sbagliati**, perché il reclutamento non è partito in tempo (seconda modalità) | `T-11/L-07` prodotto **prima** del congelamento e non dopo | **Piena sul metodo**, nulla sulla disponibilità delle persone, che è `E-1` |
| **Si scopre un errore d'uso grave** che richiede riprogettazione e nuova sommativa parziale (terza modalità) | `08/06 §8` indica le valutazioni formative come **l'unica assicurazione** contro questo scenario | **Nessuna, oggi.** Le formative sono un taglio irreversibile di `09/03 §5` e la loro esecuzione dipende da `Q-273`, non decisa. **Il rischio più costoso di questo traguardo è oggi privo di contromisura**, e questo piano lo dichiara invece di attenuarlo |
| **Il congelamento precede `OL-02`** e la sommativa gira su un'interfaccia priva della misura alternativa alla non conformità dichiarata | Registrazione della dipendenza al § 3.4 e decisione esplicita del committente sul perimetro del congelamento | **Parziale**: rende visibile la scelta, non la compie |
| `R-22` - figure specialistiche scarse | Avvio anticipato della ricerca di `E-2` ed `E-4` | Parziale |
| `R-02` - registrazioni a ruoli distinti | `Q-189`, decisione del committente con punto irreversibile al 30 settembre 2026 | Nessuna interna: è per definizione un problema di persone diverse (`V-281`) |

---

## 9. Che cosa il traguardo non comprende

- **La valutazione formativa.** È un taglio **irreversibile** (`09/02 §4.2`, riga «Ingegneria
  dell'usabilità»; `09/03 §5`). `T-11` copre la sommativa e **dichiara** la lacuna formativa.
- **La dichiarazione di accessibilità del servizio.** Non è mai del progetto e **non lo diventa
  per effetto di `D58`**: è il vincolo `V-273`. Il soggetto obbligato è chi eroga il servizio in
  rete, cioè chi installa.
- **La verifica di conformità ai criteri di accessibilità.** È un obbligo distinto, con fondamento
  diverso e soggetto obbligato diverso (`08/06 §1`), e **nessuna delle due verifiche sostituisce
  l'altra** (`08/06 §6.2`). La verifica automatica e la verifica manuale con tecnologie assistive
  sono nel prodotto e sono già requisiti di `03_functional/06 §4`.
- **La verifica manuale con tecnologia assistiva del criterio 7 di `T-08`.** Quel criterio è
  esplicito: **non è una valutazione formativa di usabilità e non va presentata come tale**.
- **L'accessibilità dell'interfaccia di amministrazione**, che è il criterio 1 di `OL-19`.
- **Qualunque atto che presupponga il ruolo di fabbricante** (§ 6).
- **Qualunque affermazione su un esito datato della certificazione.** Non ne compaiono, e non ne
  possono comparire.

---

## 10. Registro delle modifiche di questo piano

Piani e roadmap si aggiornano insieme all'implementazione: una modifica a questo piano che non
produca una riga qui non è avvenuta.

| Data | Che cosa è cambiato | Perché | Effetto sulla roadmap |
|---|---|---|---|
| - | - | - | - |

**Regole di compilazione.** (a) Ogni riga dichiara l'effetto sulla roadmap anche quando l'effetto
è «nessuno», perché «nessuno» è un'informazione. (b) Una modifica che tocchi un criterio del § 2
o l'innesco del § 3 **richiede la revisione fuori cadenza** di
[`09/00 §8.2`](../../docs/09_roadmap/00-indice.md) e va registrata anche là. (c) La marcatura
`[INTENZIONE]` non si converte in `[IMPEGNO]` con una riga di questo registro: è una decisione
del committente.
