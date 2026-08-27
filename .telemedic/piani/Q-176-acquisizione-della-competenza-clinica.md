# `Q-176` - le forme di acquisizione della competenza clinica, confrontate

> **Che cos'è questo documento.** È **materiale interno di preparazione di una decisione** (`D57`),
> scritto perché il Committente ha chiesto di anticipare `Q-176` e di vedere il confronto delle
> forme di acquisizione con i numeri davanti. **Non decide**: `Q-176` resta aperta e la scelta resta
> del Committente. Non è un capitolo, non ha gemello inglese, non entra nel sito e non è un documento
> del fascicolo tecnico.
>
> **Che cosa non fa, e va detto prima che dopo.** Non modifica `docs/`, non modifica la bozza di
> `CE-PLAN-001`, non chiude `Q-176` e non riscrive il § 10 di quella bozza: **lo approfondisce**.
> Dove trova una contraddizione fra documenti la registra al § 11 e **non la corregge**, perché la
> correzione appartiene a chi tiene l'area.
>
> **Stato di fatto, ripetuto perché nulla di quanto segue lo modifica.** Il prodotto **non reca
> marcatura CE**, **non è coperto da alcuna dichiarazione di conformità** e **non è utilizzabile per
> l'erogazione di prestazioni sanitarie su pazienti reali**. **Nessuna valutazione clinica è stata
> condotta.** Il progetto **intende** assumere il ruolo di fabbricante (`D58`), e **il soggetto
> giuridico che lo eserciterebbe è ancora da costituire**. Acquisire la competenza clinica non
> cambia una sola di queste righe: sposta il momento in cui una parte del lavoro diventa
> eseguibile, e nient'altro.
>
> **Nessuna data di marcatura compare in questo documento**, in nessuna forma. Le date che vi
> compaiono sono **date di consultazione delle fonti** (§ 12) e **termini di procedimento
> amministrativo citati dalla norma**, e non hanno alcun rapporto con la marcatura.
>
> **Nessun nome di persona fisica**, e nessun nome di azienda, marchio, prodotto o dominio (`R0`).
> Dove una forma passa per un soggetto identificabile, il documento nomina il **registro pubblico**
> in cui quel soggetto si trova, non il soggetto.

---

## 1. La domanda, riportata alla lettera

`Q-176` sta in `registro/questioni.tsv`, è emessa da `COMP` verso il Committente ed è **APERTA**.
Nella riformulazione che `D58` le ha imposto la domanda non è più «se produrre un dossier riusabile
da un terzo che certificherà», ma **se avviare ora il dossier dello stato dell'arte del nostro
percorso di valutazione clinica**, sapendo che ciò *«richiede una competenza clinica documentabile
che il progetto oggi non ha internamente, quindi è un impegno di risorse esterne e non
un'estensione della documentazione»*.

Il capitolo `docs/08_compliance/07-valutazione-clinica.md` § 4.1 usa la stessa formula e ne dichiara
la conseguenza: il dossier *«è la parte più laboriosa della valutazione clinica che non dipende dal
fabbricante»*, e il suo costo *«è un impegno di risorse, non un sottoprodotto della
documentazione»*.

La bozza `CE-PLAN-001` § 10.2 nomina già **quattro forme** - incarico professionale a un redattore
clinico esterno; collaborazione con una struttura che disponga della competenza; acquisizione
interna della qualifica; rinvio dichiarato - ciascuna con ciò da cui dipende, la comprimibilità,
ciò che si ottiene e ciò che resta scoperto, e dichiara espressamente di **non decidere**.

Questo documento parte da lì e aggiunge cinque cose che quella sezione non poteva contenere senza
diventare un piano di acquisto dentro un piano di valutazione clinica: **scompone la forma 2 in
quattro forme distinte** che hanno regimi giuridici diversi e conseguenze diverse; **aggiunge due
forme** che il § 10.2 non nomina; **misura** quali voci del § 4 di `07` ciascuna forma apre davvero;
**dichiara il requisito di qualifica alla fonte primaria** invece di riassumerlo; e **dice che cosa
ciascuna forma lascia scoperto**, che è la parte per cui il documento è stato chiesto.

---

## 2. Che cosa esattamente manca, misurato e non descritto

Prima di confrontare le forme va misurato il buco. Il § 4 di `07-valutazione-clinica.md` elenca
**sette prodotti**. La competenza clinica documentabile non li tocca tutti, e la prima cosa utile
che questo documento può dire è **quanti ne tocca**.

| Sigla locale | Prodotto, dal § 4 di `07` | Che cosa lo blocca oggi | La competenza clinica lo apre? |
|:-:|---|---|:-:|
| `P1` | `CE-PLAN-001` Piano di valutazione clinica | Sei sezioni vuote su competenza clinica; **l'approvazione** sul soggetto fabbricante | **In parte** |
| `P2` | **Dossier dello stato dell'arte** | Solo la competenza clinica | **Sì, interamente** |
| `P3` | Protocollo e risultati della ricerca sistematica | Competenza clinica per le stringhe e i criteri; **due persone distinte** per la doppia selezione; accesso alle banche dati | **In parte** |
| `P4` | Evidenza di validazione tecnica | Assenza di codice applicativo e di catena di costruzione (`V-182`) | **No** |
| `P5` | Evidenza dall'ingegneria dell'usabilità | Soggetti distinti da chi ha progettato l'interfaccia (`Q-273`); la sommativa è riservata al ruolo | **No** |
| `P6` | `CE-REP-001` Rapporto di valutazione clinica | Soggetto fabbricante costituito e valutatore nominato | **No** |
| `P7` | `PMCF-PLAN-001` Piano di seguito clinico | Soggetto fabbricante: è un impegno, non un'analisi | **No** |

**Due prodotti su sette.** È il numero che va tenuto in mano leggendo tutto il resto, ed è
insieme la ragione per cui la decisione è meno grande di quanto sembri e più urgente di quanto
sembri: meno grande perché non sblocca cinque prodotti su sette; più urgente perché i due che
sblocca - `P2` e la parte metodologica di `P3` - stanno **in testa** alla catena seriale del § 2 di
`07`, quella che *«non è comprimibile con risorse»*. Ogni periodo di rinvio su di essi si
trasferisce integralmente in fondo alla catena, e nessun aumento di capacità lo recupera.

Dentro `P1`, le sezioni che la bozza `CE-PLAN-001` dichiara vuote o parziali sono queste, e sono
il metro su cui il § 4 misura ogni forma.

| Sezione di `CE-PLAN-001` | Stato dichiarato dalla bozza | Che cosa la chiude |
|---|---|---|
| § 4.3, prima parte - limiti d'uso e requisiti dell'ambiente operativo | Non compilabile | **Nessuna forma clinica**: sono soglie da **misurare** sul prodotto costruito (`Q-115`) |
| § 4.3, seconda parte - verifica della formulazione del beneficio clinico | Residuo dichiarato | Un lettore clinico qualificato. **È la voce più economica dell'elenco** |
| § 5 - stato dell'arte | Dichiarata vuota | Il dossier `P2` |
| § 6.4 - **valori** dei criteri di accettabilità | Dichiarata vuota | Proposta motivata dal redattore clinico; **adozione** riservata al ruolo |
| § 7.1 - validità dell'associazione clinica | Dichiarata vuota | Discende dal § 5: si apre con esso e non prima |
| § 7.3 - validazione clinica | Dichiarata vuota | **Nessuna forma**: richiede la ricerca eseguita e la sintesi qualificata riservata al ruolo |
| § 8.1 regola 3 - doppia selezione a due valutatori | Lacuna dichiarata (`V-281`, `Q-189`) | Solo una forma che porti **due persone distinte** |
| § 8.2 - banche dati, stringhe, criteri operativi | Dichiarata vuota, con `[NV]` sulle banche dati | Redattore clinico **più** accesso alle banche dati |
| § 9.2 - `PMCF-PLAN-001` | Dichiarata vuota | **Nessuna forma**: è un impegno e richiede il soggetto |
| § 1 - approvazione e assunzione del piano | Nessuna | **Nessuna forma**: atto riservato al ruolo |

**Quattro delle dieci righe non si aprono con nessuna forma di acquisizione della competenza
clinica.** Chi legge il confronto che segue come se scegliesse fra nove modi di finire il piano
legge male: si sceglie fra nove modi di aprirne **sei righe su dieci**, e le altre quattro
dipendono da altro.

---

## 3. Il requisito di qualifica, letto alla fonte e non riassunto

Il requisito è **lo stesso per tutte e nove le forme**. È questo il punto che il confronto rischia
di far perdere: la forma non cambia il requisito, cambia **chi lo può dimostrare, chi custodisce il
curriculum e chi risponde se il curriculum non regge**.

La fonte è **MEDDEV 2.7/1 revisione 4, § 6.4**, alle pagine 14 e 15 di 65 del documento pubblicato
dalla Commissione. È stata **letta direttamente** e non ripresa da terzi (§ 12, fonte `F1`). Dice,
alla lettera:

- la valutazione clinica *«should be conducted by a suitably qualified individual or a team»*;
- il fabbricante *«should be able to justify the choice of the evaluators through reference to their
  qualifications and documented experience, and to present a declaration of interest for each
  evaluator»*;
- i valutatori devono possedere conoscenza di: **metodologia della ricerca** (disegno dell'indagine
  clinica e biostatistica); **gestione dell'informazione** (formazione scientifica o qualifica
  biblioteconomica; esperienza con le banche dati bibliografiche pertinenti); **requisiti
  regolatori**; **redazione medica** (esperienza post-laurea in una scienza pertinente o in
  medicina; formazione ed esperienza in redazione medica, revisione sistematica e valutazione
  critica dei dati clinici);
- in aggiunta, **sul dispositivo specifico**: la tecnologia del dispositivo e la sua applicazione;
  la diagnosi e la gestione delle condizioni che il dispositivo intende diagnosticare o gestire,
  con conoscenza delle alternative mediche, degli standard di trattamento e della tecnologia;
- e come formazione ed esperienza minime: **un titolo di istruzione superiore nel campo pertinente
  e cinque anni di esperienza professionale documentata**, **oppure dieci anni di esperienza
  professionale documentata** se il titolo non è prerequisito per il compito;
- con una clausola di deroga che va conosciuta perché è l'unica flessibilità disponibile: *«There
  may be circumstances where the level of evaluator expertise may be less or different; this should
  be documented and duly justified.»*

**Tre avvertenze sulla fonte, dichiarate invece che taciute.**

La prima è di regime. MEDDEV 2.7/1 revisione 4 è una guida redatta sotto le direttive abrogate: nel
testo che ho letto i richiami normativi sono all'Allegato X della direttiva sui dispositivi medici e
all'Allegato 7 di quella sui dispositivi impiantabili attivi, non al Regolamento (UE) 2017/745.
**Non è formalmente applicabile al regime MDR.** Continua a essere il riferimento operativo di fatto
sulla qualifica del valutatore perché il Regolamento non ne detta uno e i documenti del gruppo di
coordinamento vi rimandano su parti ancora pertinenti. `[NV]` - **non ho verificato alla fonte
primaria** se un documento MDCG abbia sostituito o modificato il § 6.4 per il regime MDR: la
verifica va fatta al momento dell'uso, non una volta per sempre, ed è la stessa disciplina che la
bozza applica già alla revisione corrente di MDCG 2020-1.

La seconda è di sostanza, e conta per il Committente più della prima. La regola dei **cinque anni
con titolo o dieci senza** è una soglia di ammissione, non una garanzia. Il § 2.1 di `07` dichiara
che *«la struttura della qualifica del valutatore è essa stessa oggetto di verifica»*: l'organismo
notificato non conta gli anni, guarda se la **corrispondenza fra le competenze richieste e quelle
possedute** è argomentata voce per voce. Una figura con quindici anni di esperienza in una
specialità e nessuna esperienza di revisione sistematica **non soddisfa** il § 6.4, perché la
revisione sistematica è una delle quattro conoscenze generali richieste.

La terza è la più facile da dimenticare quando si sceglie una forma. Il § 6.2.3 della stessa fonte,
letto alla pagina 12 di 65, stabilisce che la valutazione clinica **si aggiorna attivamente**: *«at
least annually if the device carries significant risks or is not yet well established»*, oppure
*«every 2 to 5 years if the device is not expected to carry significant risks and is well
established, a justification should be provided»*. **La competenza clinica non serve una volta:
serve in modo ricorrente.** Ogni forma di acquisizione va quindi giudicata due volte - sulla prima
consegna e sulla ricorrenza - e le due valutazioni non danno lo stesso risultato. È il criterio che
elimina, da solo, due delle nove forme.

### 3.1 La dichiarazione di assenza di conflitto di interessi, e che cosa dichiara davvero

La fonte chiede una dichiarazione di interessi **per ciascun valutatore**, non una per gruppo, non
una per fornitore. Tre conseguenze che valgono per tutte le forme e che nessuna trattativa
introduce spontaneamente.

**La dichiarazione è un consegnabile contrattuale, non una cortesia.** Se non è scritta nel
contratto fra le cose che si consegnano, arriva quando serve o non arriva; e nel momento in cui
serve, la figura ha già consegnato ed è già stata pagata. La stessa cosa vale per il curriculum:
non basta averlo visto in trattativa, va **conservato come artefatto** perché finisce nel fascicolo.

**Essere pagati dal fabbricante non è il conflitto.** È la condizione normale di ogni valutatore a
contratto, e si dichiara. Il conflitto che pesa è un altro, ed è precisamente quello che alcune
forme di questo confronto **introducono per costruzione**: la figura che appartiene a una struttura
che sarebbe **utilizzatrice** del prodotto, o a un ente che ne sarebbe **acquirente**, o che ha
firmato una pubblicazione **sul prodotto stesso**, ha un interesse che va dichiarato e che
l'organismo pesa quando valuta l'indipendenza dell'evidenza. Il § 4 lo dice forma per forma.

**La dichiarazione è datata e invecchia.** Una dichiarazione resa quando la figura era esterna e
indipendente non descrive più la situazione se nel frattempo la figura è entrata in rapporto stabile
con il soggetto fabbricante. Poiché la valutazione clinica si aggiorna, e con essa il rapporto,
**la dichiarazione va rinnovata a ogni aggiornamento**, e il contratto che non lo prevede costringe
a richiamare una figura che nel frattempo può non esserci più.

---

## 4. Le nove forme, una per una

Le forme sono numerate per essere citabili in questo documento. **Le sigle `F1`…`F9` sono locali** e
non appartengono ad alcuna famiglia di identificativi del progetto: non entrano nella matrice di
tracciabilità e non possono comparire in una prova.

Per ciascuna, sei voci nello stesso ordine: **che cosa ottiene**, **che cosa lascia scoperto**,
**costo e tempi**, **qualifica e conflitto di interessi**, **dipendenza dal soggetto fabbricante**,
**comprimibilità**.

### `F1` - Incarico professionale a un redattore clinico individuale

**Che cosa ottiene.** `P2` per intero. La parte metodologica di `P3`: criteri di inclusione ed
esclusione nella formulazione operativa, stringhe di interrogazione, gerarchia delle fonti. Dentro
`P1` apre il § 5, il § 8.2, il § 7.1 in conseguenza del § 5, la seconda parte del § 4.3, e consente
la **proposta motivata** dei valori del § 6.4. **Restano chiusi** il § 4.3 prima parte, il § 7.3, il
§ 8.1 regola 3, il § 9.2 e l'approvazione del piano.

**Che cosa lascia scoperto**, ed è la voce per cui questa forma va scelta con gli occhi aperti.
*Primo*: **il secondo valutatore della doppia selezione non c'è**. Il § 8.1 regola 3 richiede due
persone distinte con regola di risoluzione dei disaccordi dichiarata prima; una sola persona non lo
soddisfa, per quante ore lavori. La lacuna resta quella di `V-281` e `Q-189`, e va dichiarata, non
pianificata. *Secondo*: **l'accesso alle banche dati bibliografiche non è compreso** se non è
scritto nel contratto. Il § 8.2 della bozza marca `[NV]` l'elenco delle banche dati e osserva che
alcune sono prodotti commerciali ad accesso oneroso: un professionista individuale può avere o non
avere quell'accesso, ed è una domanda da porre in trattativa e non dopo. *Terzo*: **la ricorrenza**.
Una persona sola è un punto singolo di rottura su un obbligo che il § 6.2.3 della fonte primaria
rende ricorrente; se non è più disponibile all'aggiornamento successivo, il subentrante deve
ricostruire il ragionamento da capo su un dossier che non ha scritto. *Quarto*: **la titolarità e la
licenza del prodotto**. Il dossier è destinato alla forma aperta (`07` § 4.1) e a entrare poi in un
fascicolo tecnico di un soggetto che oggi non esiste; se il contratto non lo prevede, il progetto
paga un documento che non può né pubblicare né trasferire. Il § 5 di questo documento ne fa una
clausola obbligatoria.

**Costo e tempi.** `[NV]` **sul denaro.** Non esiste una tariffa pubblica per questa prestazione: la
redazione clinica regolatoria non ha un tariffario professionale vigente in Italia, e nominare
operatori per confrontarne i listini violerebbe `R0`. **Non stimo una cifra e non ne riporto una
sentita.** Che cosa servirebbe per saperlo, in termini eseguibili: una **richiesta di informazioni e
di calcolo** a più figure qualificate, costruita con le stesse cinque regole che
`09-percorso-e-calendario.md` § 8.3 fissa per gli organismi notificati - **chiedere il calcolo e non
il prezzo**, cioè le giornate previste per attività e il metodo con cui si arriva al totale; chiedere
impegni sui tempi delle singole consegne; confrontare il totale e non la tariffa giornaliera. È un
atto che il contributore unico può compiere **oggi**, che non impegna a nulla e che è l'unico modo
di trasformare questo `[NV]` in un numero. `[NV]` **sui tempi di reperimento della figura**: il
progetto ha già un indicatore dichiarato per la famiglia delle figure specialistiche - `R-22` fissa
a due settimane il tempo fra prima richiesta e risposta oltre il quale considera il mercato saturo -
ma è una **soglia dichiarata**, non una misura: nessuna richiesta è stata inviata e quindi nessun
tempo è stato osservato. **Sui tempi di produzione** il progetto ha invece un dato proprio, ed è
l'unico che non va cercato fuori: `07` § 2 assegna alla ricerca sistematica dodici-quattordici
settimane e al piano cinque-sei, e dichiara che quelle durate **non si comprimono raddoppiando le
persone**.

**Qualifica e conflitto di interessi.** Requisito pieno del § 6.4 in capo alla persona. È la forma
in cui la verifica è **più semplice** - un solo curriculum, una sola dichiarazione - e in cui il
rischio è **più concentrato**: se quel curriculum non regge alla verifica dell'organismo, non c'è
nulla dietro. Il conflitto tipico è **assente o lieve**: un professionista indipendente pagato per
la prestazione dichiara il rapporto e la questione si chiude lì.

**Dipendenza dal soggetto fabbricante.** **Nessuna.** Il contratto può essere concluso da una
persona fisica, e il dossier dello stato dell'arte **non è specifico di un fabbricante** (`07`
§ 4.1). Ma va detto ciò che ne discende e che nessuno scrive: se il committente contrattuale è una
persona fisica, il prodotto **appartiene a quella persona fisica**, e il suo ingresso nel fascicolo
tecnico del futuro soggetto è un **trasferimento di titolarità da documentare**, non un fatto
automatico. Va previsto nel contratto fin dall'inizio, perché retrocedere su questo punto significa
riaprire una trattativa già chiusa con una controparte che non ha più ragione di concedere nulla.

**Comprimibilità.** **Alta, ed è la sua qualità migliore.** Si avvia subito, si può limitare per
oggetto - prima la verifica della formulazione del beneficio clinico, che è la voce più economica
dell'elenco, poi il dossier, poi il protocollo - e ogni modulo consegnato ha valore da solo. **Non è
un blocco atomico.**

### `F2` - Incarico a un fornitore di servizi regolatori strutturato

**Che cosa ottiene.** Le stesse voci di `F1` e, in più, **la sola voce che `F1` non può aprire**: il
§ 8.1 regola 3, perché un fornitore strutturato dispone di più persone e la doppia selezione è un
requisito di **numero di persone, non di ore**. In genere porta con sé anche l'accesso alle banche
dati bibliografiche e un proprio sistema di gestione della qualità documentale, che è esattamente
ciò che il § 2 della bozza dichiara mancante al progetto.

**Che cosa lascia scoperto.** *Primo*: **la scomponibilità non è garantita**. `[NV]` - non ho
verificato se questa classe di fornitori accetti incarichi limitati al solo dossier dello stato
dell'arte, e la domanda va posta in trattativa perché il rischio è di trovarsi davanti solo pacchetti
completi di valutazione clinica, che comprendono atti riservati al ruolo e quindi **non acquistabili
oggi**. *Secondo*: **il fornitore non risolve il vuoto del § 7.3**. Compra capacità di redazione, non
evidenza: il ponte fra la letteratura sulla modalità di erogazione e l'affermazione su questo
software resta da costruire e resta l'argomento su cui l'organismo solleva i quesiti. *Terzo*: **la
verifica della qualifica diventa più difficile, non più facile**. La fonte chiede curriculum e
dichiarazione **per ciascun valutatore**: un contratto con una persona giuridica che non nomini le
persone fisiche assegnate produce un fascicolo in cui la qualifica non è verificabile. Va preteso in
contratto il **nome del ruolo e il curriculum di ciascuna persona assegnata**, e la notifica
preventiva di ogni sostituzione. *Quarto*: **la dipendenza è più forte alla ricorrenza che alla
prima consegna** - il costo dell'aggiornamento periodico presso lo stesso fornitore va negoziato
all'inizio, quando si ha ancora potere contrattuale.

**Costo e tempi.** `[NV]` **sul denaro, e più opaco che in `F1`**: il prezzo di un pacchetto non si
confronta con quello di un altro pacchetto se i due non hanno lo stesso perimetro, ed è la ragione
per cui la regola *«chiedere il calcolo e non il prezzo»* del § 8.3 vale qui più che altrove.
`[NV]` sui tempi. Nessun listino pubblico esiste, e `R0` esclude di raccoglierne.

**Qualifica e conflitto di interessi.** Requisito pieno, verificato **per persona** e non per
soggetto. Conflitto tipicamente assente. Va aggiunta una domanda che nessuno pone e che qui conta:
se il fornitore ha in portafoglio altri fabbricanti di dispositivi nello stesso ambito, la
dichiarazione deve poterlo dire, e il progetto deve poter accettare che lo dica.

**Dipendenza dal soggetto fabbricante.** **Nessuna in diritto**, come `F1`. `[NV]` **in fatto**:
non ho verificato se questa classe di controparti accetti come committente una persona fisica priva
di un soggetto giuridico dietro. È una domanda da porre nella stessa richiesta di informazioni, e la
risposta è essa stessa un'informazione che oggi manca.

**Comprimibilità.** **Media.** L'avvio è immediato; la scomposizione dipende dall'offerta e potrebbe
non essere concessa. **Non atomica in linea di principio, potenzialmente atomica in pratica.**

### `F3` - Collaborazione con una struttura sanitaria

**Che cosa ottiene.** `P2`, la parte metodologica di `P3`, e - se la struttura assegna più di una
persona - il § 8.1 regola 3. Porta inoltre due cose che nessuna forma individuale porta: la
**conoscenza della pratica di riferimento vista da dentro**, che è precisamente l'oggetto del
dossier dello stato dell'arte, e con ogni probabilità l'**accesso istituzionale alle banche dati
bibliografiche**. *Quest'ultimo punto è dedotto dal fatto che il § 6.4 della fonte primaria elenca
l'esperienza con le banche dati fra le competenze attese in ambiente clinico e accademico; **non l'ho
verificato** su alcun documento e non va usato come dato.*

**Che cosa lascia scoperto**, e questa forma ha una voce che le altre non hanno. *Primo, ed è la
scoperta più concreta di questo documento*: **il professionista dipendente del servizio sanitario
pubblico non può assumere l'incarico senza autorizzazione della propria amministrazione**.
L'art. 53, comma 7, del decreto legislativo 30 marzo 2001, n. 165 vieta ai dipendenti pubblici di
assumere incarichi retribuiti che non siano stati conferiti o **previamente autorizzati**
dall'amministrazione di appartenenza, la quale deve verificare l'assenza di situazioni di conflitto
di interessi prima di autorizzare; il comma 10 fissa in **trenta giorni** dalla ricezione il termine
per pronunciarsi, elevato a quarantacinque quando il dipendente presta servizio presso più
amministrazioni (fonte `F4`, letta su Normattiva). **È un procedimento di terzi con esito
incerto**, e il progetto non lo governa. *Secondo*: la dirigenza sanitaria con **rapporto di lavoro
esclusivo** ai sensi dell'art. 15-quinquies del decreto legislativo 30 dicembre 1992, n. 502 ha un
regime ulteriore di limitazione delle attività esterne. `[NV]` - **non ho letto il testo consolidato
di quell'articolo** e non ne riporto il contenuto puntuale: va verificato prima di qualunque
trattativa, perché determina se la figura individuata sia ingaggiabile o no. *Terzo, e vale come
avvertenza generale*: una struttura sanitaria è un **potenziale utilizzatore** del prodotto. La
dichiarazione di assenza di conflitto deve dirlo, e l'organismo lo pesa quando valuta l'indipendenza
di chi ha scritto lo stato dell'arte del proprio futuro strumento di lavoro. *Quarto*: la
riservatezza e la titolarità del prodotto vanno regolate **prima**, come già osserva la bozza al
§ 10.2, e a questo si aggiunge la clausola di pubblicabilità del § 5.

**Costo e tempi.** `[NV]` sul denaro. Sui tempi esiste **un dato certo e sourceable**, ed è raro in
questo documento: **trenta giorni** di procedimento autorizzativo, quarantacinque nel caso di
servizio presso più amministrazioni, che si sommano al tempo della trattativa e non vi si
sovrappongono. Il tempo della trattativa è `[NV]`, e ha la proprietà che `07` § 6.2 attribuisce alle
trattative il cui esito non dipende da chi le conduce: **non si pianifica**.

**Qualifica e conflitto di interessi.** Requisito pieno **in capo alla persona fisica assegnata**.
Va detto senza attenuazioni, perché è l'errore che questa forma invita a commettere:
**l'autorevolezza della struttura non è la qualifica del valutatore.** Un organismo notificato non
legge il nome della struttura, legge il curriculum di chi ha firmato, e lo confronta con le sei aree
di competenza del § 6.4.

**Dipendenza dal soggetto fabbricante.** **Nessuna in diritto per la collaborazione in sé.** `[NV]`
**in fatto, e il dubbio è ragionevole**: una struttura sanitaria pubblica delibera convenzioni con
soggetti giuridici e la stipula con una persona fisica priva di soggetto è una domanda aperta che
non ho verificato.

**Comprimibilità.** **Bassa.** L'avvio è possibile subito quanto alla richiesta, ma il procedimento
autorizzativo dell'art. 53 e la deliberazione della struttura sono **passaggi atomici**: si
concludono o non si concludono, non si concludono a metà.

### `F4` - Coinvolgimento di una società scientifica di riferimento

**Che cosa ottiene.** In linea di principio `P2` con la fonte più autorevole disponibile, perché una
società scientifica **produce** le linee guida che il dossier dello stato dell'arte deve censire, e
non le legge soltanto. Il quadro giuridico è italiano e verificabile: l'art. 5 della legge 8 marzo
2017, n. 24 attribuisce alle società scientifiche e alle associazioni tecnico-scientifiche delle
professioni sanitarie iscritte in un apposito elenco il compito di elaborare le linee guida, e il
decreto del Ministero della salute 2 agosto 2017, pubblicato nella Gazzetta Ufficiale, Serie
generale, n. 186 del 10 agosto 2017, disciplina quell'elenco e i requisiti di iscrizione (fonte
`F3`). **L'elenco è pubblico**: è il registro da cui si ricava chi ha titolo, senza che questo
documento nomini alcun soggetto.

**Che cosa lascia scoperto**, ed è molto. *Primo*: **una società scientifica non è un fornitore di
servizi.** Delibera attraverso propri organi, secondo il proprio statuto, con tempi propri e con un
esito che non dipende da chi lo chiede. È la definizione stessa di attività che `07` § 6.2 esclude
dai piani: *«un piano che pianifica una trattativa il cui esito non dipende da chi la conduce non è
un piano»*. *Secondo*: **l'iscrizione all'elenco ministeriale non qualifica una persona.** Certifica
che la società soddisfa i requisiti dell'art. 2, comma 2, del decreto del 2017; non dice nulla sul
curriculum di chi eventualmente firmerà, che va comunque verificato contro il § 6.4. *Terzo*: **il
conflitto di interessi è strutturale e va guardato in faccia.** I membri di una società scientifica
del settore sono i **destinatari professionali** del prodotto; una società che avalli lo stato
dell'arte di un dispositivo che i propri iscritti userebbero ha un interesse che la dichiarazione
deve esprimere e che l'organismo pesa. *Quarto*: **il rischio reputazionale è asimmetrico e gioca
contro il progetto.** Una società scientifica associa il proprio nome a un prodotto che **non reca
marcatura CE**, non è coperto da alcuna dichiarazione di conformità e non è utilizzabile su pazienti
reali; è ragionevole attendersi cautela, ed è una cautela legittima. *Quinto*: il progetto non ha
oggi nulla da offrire in cambio se non l'apertura del codice.

**Costo e tempi.** `[NV]` su entrambi, senza appigli. Non ho una fonte su costi, tempi o
disponibilità di questa forma di collaborazione, e non ne ipotizzo. Che cosa servirebbe per saperlo:
una **ricognizione dell'elenco ministeriale** per individuare le società la cui materia coincide con
il perimetro dichiarato, seguita da una richiesta di informazioni non impegnativa. La ricognizione
costa solo ore del contributore, non impegna a nulla ed è l'unico atto di questa forma eseguibile
oggi.

**Qualifica e conflitto di interessi.** Come `F3`: il requisito è della persona, non
dell'istituzione, e il conflitto è più marcato che in ogni altra forma.

**Dipendenza dal soggetto fabbricante.** **Alta in fatto**, per quanto nessuna norma la imponga.
`[NV]`, e la mia lettura - dichiarata come lettura e non come dato - è che una società scientifica
difficilmente delibera una collaborazione formale con un progetto privo di soggetto giuridico e
privo di prodotto certificato.

**Comprimibilità.** **Nulla oltre la ricognizione. È un blocco atomico**: una società avalla o non
avalla, e non esiste un avallo parziale citabile in un fascicolo.

### `F5` - Contratto conto terzi con un'università o un ente di ricerca

**Che cosa ottiene.** `P2`, la parte metodologica di `P3`, il § 8.1 regola 3 se il gruppo assegnato
ha più persone, e con ogni probabilità l'accesso alle banche dati bibliografiche. Il quadro
giuridico esiste ed è verificabile: l'art. 66 del decreto del Presidente della Repubblica 11 luglio
1980, n. 382 consente alle università di svolgere attività di ricerca e consulenza mediante
contratti e convenzioni con enti pubblici e privati, purché non ne sia ostacolata la funzione
scientifica e didattica, affidandone l'esecuzione ai dipartimenti o ai singoli professori a tempo
pieno, e rinvia a un regolamento di ateneo per la ripartizione dei proventi (fonte `F5`, letta su
Normattiva). **È lo strumento con cui una prestazione di questo tipo si acquista da un'università**,
e conoscerne il nome esatto è già metà della trattativa.

**Che cosa lascia scoperto.** *Primo*: **il regolamento di ateneo è la variabile che decide tutto**
e cambia da ateneo ad ateneo - tariffe minime, quote di prelievo, organo deliberante, tempi. Non
esiste un valore unico da cercare. *Secondo*: **la delibera dipartimentale è un passaggio atomico**
con tempi propri. *Terzo*: **l'interesse accademico non coincide con l'interesse regolatorio**. Un
gruppo di ricerca è attrezzato per produrre una revisione sistematica di qualità scientifica; un
dossier dello stato dell'arte destinato a un fascicolo tecnico ha però requisiti di **forma**
diversi - riferimento ai requisiti generali di sicurezza e prestazione, struttura attesa
dall'organismo, tracciabilità delle fonti nel formato del fascicolo - e se il contratto non li
specifica si riceve un ottimo documento che va poi riscritto. *Quarto*: il regime dell'art. 53 del
decreto legislativo 165/2001 vale anche qui se la prestazione è resa dal singolo docente fuori dal
contratto di ateneo, mentre non si pone se è resa dal dipartimento nella forma dell'art. 66.
Distinguere le due strade **prima** di trattare evita di scoprire il vincolo a trattativa avviata.

**Costo e tempi.** `[NV]` sul denaro: le tariffe conto terzi sono fissate da regolamenti di ateneo
e non da una fonte unica; per conoscerle va letto il regolamento dell'ateneo con cui si tratta, che
è pubblico. `[NV]` sui tempi di delibera. Che cosa servirebbe: individuare gli atenei con un gruppo
di ricerca la cui materia coincide con il perimetro, leggerne il regolamento conto terzi pubblicato
e chiedere un preventivo secondo la forma di quel regolamento.

**Qualifica e conflitto di interessi.** Requisito del § 6.4 in capo alle persone assegnate. È
verosimilmente la forma in cui la voce **metodologia della ricerca e revisione sistematica** è
soddisfatta meglio, e quella in cui va guardata con più attenzione la voce **requisiti regolatori**,
che è competenza di conformità e non di ricerca. Conflitto di interessi normalmente lieve e
dichiarabile senza difficoltà.

**Dipendenza dal soggetto fabbricante.** L'art. 66 parla di contratti con **enti pubblici e
privati**; `[NV]` se e in che forma un contratto conto terzi possa avere come committente una persona
fisica. Va verificato sul regolamento dell'ateneo con cui si tratta, e la risposta può differire da
ateneo ad ateneo.

**Comprimibilità.** **Bassa in avvio, media in esecuzione.** La delibera è atomica; il lavoro,
una volta deliberato, si può articolare per fasi. **Il blocco è all'ingresso, non dentro.**

### `F6` - Co-autore accademico su una pubblicazione

**Che cosa ottiene.** Un articolo sottoposto a revisione paritaria, che è **dato clinico** ai sensi
dell'art. 2 del Regolamento (UE) 2017/745 nella definizione riportata dal § 1 di `07`, e che
alimenta la terza componente dell'evidenza. Sulla carta è la forma che aggredisce il vuoto vero.

**Che cosa lascia scoperto**, ed è la forma che il confronto serve a ridimensionare. *Primo, e da
solo basterebbe*: **una pubblicazione non è un dossier dello stato dell'arte**. Sono due prodotti
documentali diversi, con destinatari diversi e forma diversa: uno risponde a una rivista, l'altro a
un organismo notificato dentro un fascicolo tecnico. `F6` **non apre il § 5 di `CE-PLAN-001`, non
apre il § 8.2 e non apre `P2`.** Apre, semmai, una riga futura del corpus della ricerca sistematica.
*Secondo*: **una pubblicazione co-firmata dal fabbricante è letteratura sponsorizzata dal
fabbricante**, e la sua indipendenza è precisamente ciò che la valutazione critica di ciascuna fonte
inclusa deve pesare. Qui si tocca il paradosso centrale di tutta questa decisione, e va scritto per
esteso perché è la cosa che di solito non si scrive: **più si coinvolge l'esperto clinico come
co-autore della propria evidenza, meno quella evidenza è indipendente**. La stessa persona non può
essere insieme la fonte esterna che dimostra l'associazione clinica e il valutatore interno che
dichiara sufficiente l'evidenza; se lo è, l'organismo lo vede e lo rileva. *Terzo*: **i tempi non
sono governabili**. Sottomissione, revisione, eventuali cicli di revisione e pubblicazione dipendono
da una redazione e da revisori esterni. *Quarto*: **non produce nulla di citabile finché non è
pubblicato**. Non esiste lo stato intermedio utile. *Quinto*: **non copre la ricorrenza** del
§ 6.2.3: un articolo si scrive una volta, la valutazione clinica si aggiorna sempre. *Sesto*: non
esiste ancora l'oggetto di cui pubblicare - non c'è codice applicativo, non c'è prova, non c'è uso
sul campo.

**Costo e tempi.** `[NV]` su entrambi. Non ho una fonte citabile sul tempo mediano fra sottomissione
e pubblicazione, e non ne invento uno: varierebbe comunque per disciplina e per rivista. Che cosa
servirebbe: la politica editoriale pubblicata della rivista candidata, che di norma dichiara i propri
tempi medi. Il costo monetario dipende dal regime di accesso aperto ed è anch'esso pubblicato per
rivista.

**Qualifica e conflitto di interessi.** Il co-autore accademico può benissimo soddisfare il § 6.4,
ma la co-autoria **crea** l'interesse invece di eliminarlo, e va dichiarata come tale. È l'unica
forma di questo elenco in cui l'acquisizione della competenza **peggiora** la posizione di
indipendenza anziché migliorarla.

**Dipendenza dal soggetto fabbricante.** **Nessuna.** Una collaborazione scientifica non richiede
alcun soggetto giuridico.

**Comprimibilità.** **Nulla. È la forma più atomica dell'elenco**, e il suo esito non dipende in
alcuna misura da chi la conduce.

### `F7` - Contributore clinico volontario del progetto aperto

**Che cosa ottiene.** In teoria le stesse voci di `F1`, a costo monetario nullo. È la forma che la
natura aperta del progetto rende pensabile e che il § 10.2 della bozza non nomina.

**Che cosa lascia scoperto**, e va detto senza indulgenza verso l'ottimismo che questa forma
suscita. *Primo*: **non si può obbligare un volontario a consegnare un curriculum e una
dichiarazione di interessi**, e senza quei due documenti il suo lavoro non entra in un fascicolo
tecnico, per quanto sia buono. La fonte primaria li chiede per ciascun valutatore, e un contributo
anonimo o pseudonimo - forma normale e legittima in un progetto aperto - **è inutilizzabile a questo
fine**. *Secondo*: **non si può obbligare un volontario a esserci dopo**. La valutazione clinica si
aggiorna e il fascicolo si difende in cicli di quesiti che durano mesi; una disponibilità volontaria
non è contrattualizzabile, ed è esattamente la proprietà che l'art. 15 del Regolamento richiede alla
persona responsabile del rispetto della normativa - disponibilità **permanente e continuativa** -
per ragioni analoghe. *Terzo*: **non risolve il § 8.1 regola 3** salvo che i volontari qualificati
siano due, e due sono più difficili da trovare che uno. *Quarto*: **non è pianificabile.** Sotto
`V-281` la disponibilità di un secondo soggetto che non esiste si dichiara come lacuna e **non si
mette a piano**; contarci in un calendario sarebbe la violazione tipica di quel vincolo.

**Costo e tempi.** Costo monetario **nullo**. Costo in ore del contributore unico: non nullo, perché
attrarre, verificare e coordinare un contributore qualificato è lavoro. **Tempi non determinabili in
linea di principio**, e non per mancanza di una fonte: dipende dall'arrivo di una persona che
potrebbe non arrivare mai. Non è un `[NV]` che si chiude con una ricerca: è un'incertezza
strutturale.

**Qualifica e conflitto di interessi.** Identico requisito, con la differenza che **non c'è alcuno
strumento per pretenderne la prova**. Il conflitto di interessi di un contributore volontario
motivato dall'interesse per il progetto è reale e va dichiarato, e chiedere quella dichiarazione a
chi lavora gratuitamente è un passaggio scomodo che conviene prevedere invece di scoprire.

**Dipendenza dal soggetto fabbricante.** **Nessuna.**

**Comprimibilità.** Non applicabile: non è una forma che si avvia, è una forma che eventualmente
accade. **Va tenuta come possibilità benvenuta e non come opzione di piano.**

### `F8` - Acquisizione interna della qualifica da parte del contributore

**Che cosa ottiene.** **Nulla nel breve periodo**, e la bozza lo dice già al § 10.2. Questo documento
aggiunge la ragione quantitativa, che ora è alla fonte: il § 6.4 di MEDDEV 2.7/1 revisione 4 richiede
**un titolo di istruzione superiore nel campo pertinente e cinque anni di esperienza professionale
documentata**, oppure **dieci anni** senza titolo. **Una qualifica documentabile è documentabile
perché ha una storia, e una storia non si comprime.**

**Che cosa lascia scoperto.** Tutto ciò che serve ora. E in più: **sottrae capacità a lavoro già a
calendario**. Sotto la capacità dichiarata da `D54` e quantificata da `D62` - contributore unico,
dieci-venti ore settimanali - ogni ora spesa a costruire una qualifica pluriennale è un'ora non spesa
sui traguardi aperti. **Non risolve nemmeno il § 8.1 regola 3**, perché una qualifica in più sulla
stessa persona non produce una seconda persona.

**Costo e tempi.** Il costo in tempo è **dichiarato dalla fonte**: cinque anni con titolo, dieci
senza. È l'unica riga di questo documento in cui una durata è nota con precisione, ed è la durata
che esclude la forma. `[NV]` sul costo monetario della formazione, e irrilevante: la variabile che
decide è il tempo.

**Qualifica e conflitto di interessi.** Il conflitto sarebbe massimo e insanabile per costruzione:
la stessa persona che redige, rivede, approva e certifica. È la lacuna che la bozza dichiara già
alla riga «Chi la redige» del § 1 e che `Q-189` registra.

**Dipendenza dal soggetto fabbricante.** **Nessuna**, ed è irrilevante.

**Comprimibilità.** **Nulla, in modo strutturale. Blocco atomico e lunghissimo.**

### `F9` - Rinvio dichiarato

**Che cosa ottiene.** Nulla, e non pretende il contrario. **È però una forma, e va tenuta
nell'elenco**, perché l'alternativa reale al rinvio dichiarato non è l'acquisto: è il **rinvio non
dichiarato**, che è la stessa cosa senza la data e senza la riga di registro.

**Che cosa lascia scoperto.** Le sei righe del § 2 che una forma clinica aprirebbe. E soprattutto:
il costo **non è il documento mancante**. Lo stato dell'arte sta a monte di una catena seriale che
non si comprime con risorse, e ogni periodo di rinvio si trasferisce integralmente in fondo a quella
catena. È un costo che **non compare in nessun documento** e si osserva solo a valle, quando la
ricerca sistematica non è avviata e il rapporto non esiste.

**Costo e tempi.** Costo monetario nullo. Costo di calendario pari alla durata del rinvio, **uno a
uno**, senza attenuazione e senza recupero.

**Qualifica e conflitto di interessi.** Non applicabile.

**Dipendenza dal soggetto fabbricante.** Nessuna: è una scelta, non una trattativa.

**Comprimibilità.** Non applicabile. **Ma la dichiarazione sì**: rinviare **dichiarando**, con la
data in cui la lacuna nasce, è ciò che `V-281` prescrive e costa solo la riga che la registra.

---

## 5. Le cinque clausole che valgono per ogni forma onerosa

Valgono per `F1`, `F2`, `F3`, `F4` e `F5` senza distinzione, e nessuna di esse si aggiunge dopo. Una
controparte che ha già consegnato non ha ragione di concedere ciò che non ha promesso.

1. **Curriculum e dichiarazione di assenza di conflitto di interessi sono consegnabili
   contrattuali**, per **ciascuna persona fisica** che partecipa alla redazione, con obbligo di
   notifica preventiva delle sostituzioni. Fonte del requisito: MEDDEV 2.7/1 revisione 4, § 6.4.
2. **Licenza di pubblicazione**. Il dossier è destinato alla forma aperta (`07` § 4.1). La licenza
   con cui il progetto può pubblicarlo va scritta nel contratto; un documento consegnato senza quella
   clausola è un documento che si è pagato e non si può pubblicare.
3. **Trasferibilità al futuro soggetto fabbricante**. Se il committente contrattuale è una persona
   fisica, il diritto di cedere il prodotto al soggetto giuridico quando esisterà va previsto
   dall'inizio, altrimenti l'ingresso nel fascicolo tecnico è una trattativa nuova.
4. **Forma citabile e conservazione**. Il prodotto va consegnato in una forma che regga la citazione
   in un fascicolo: fonti puntuali con norma, articolo, comma e data; registrazione delle
   interrogazioni con banca dati, stringa esatta, data di esecuzione e numero di risultati. È la
   stessa disciplina che `V-176` impone agli esiti di prova, applicata qui alle fonti.
5. **Opzione sull'aggiornamento, non obbligo**. Il § 6.2.3 della fonte primaria rende la valutazione
   clinica un processo ricorrente. Il diritto - non il dovere - di richiamare la stessa figura per
   gli aggiornamenti, a condizioni fissate ora, si negozia quando si ha potere contrattuale, cioè
   prima della prima consegna.

---

## 6. Le quattro sintesi trasversali

### 6.1 Che cosa ciascuna forma apre, misurato sulle voci

Legenda: **A** apre, **P** apre in parte, **-** non apre.

| Voce | `F1` | `F2` | `F3` | `F4` | `F5` | `F6` | `F7` | `F8` | `F9` |
|---|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
| `P2` - Dossier dello stato dell'arte (`CE-PLAN-001` § 5) | A | A | A | A | A | - | P | - | - |
| `P3` - Protocollo della ricerca (§ 8.2) | A | A | A | P | A | - | P | - | - |
| `P3` - Doppia selezione a due persone (§ 8.1 regola 3) | - | A | P | P | P | - | - | - | - |
| Verifica del beneficio clinico (§ 4.3, seconda parte) | A | A | A | A | A | P | P | - | - |
| Associazione clinica (§ 7.1) | A | A | A | A | A | - | P | - | - |
| Valori dei criteri di accettabilità (§ 6.4) | P | P | P | P | P | - | P | - | - |
| Soglie dell'ambiente operativo (§ 4.3, prima parte) | - | - | - | - | - | - | - | - | - |
| Validazione clinica (§ 7.3) | - | - | - | - | - | P | - | - | - |
| `P7` - `PMCF-PLAN-001` (§ 9.2) | - | - | - | - | - | - | - | - | - |
| Approvazione di `CE-PLAN-001` | - | - | - | - | - | - | - | - | - |

**Le ultime quattro righe sono vuote da un capo all'altro**, ed è il risultato più importante della
tabella: **nessuna forma di acquisizione della competenza clinica apre la validazione clinica, il
piano di seguito, l'approvazione del piano e le soglie dell'ambiente operativo.** Le prime tre
dipendono dal soggetto fabbricante o dalla ricerca eseguita; la quarta da una misura sul prodotto
costruito.

### 6.2 Dipendenza dal soggetto fabbricante

| Forma | Richiede il soggetto **in diritto** | Lo richiede **in fatto** | Avviabile oggi |
|---|:-:|---|:-:|
| `F1` - Redattore individuale | No | No | **Sì** |
| `F2` - Fornitore regolatorio | No | `[NV]`: da chiedere in trattativa | **Sì, con riserva** |
| `F3` - Struttura sanitaria | No | `[NV]`, probabile per la delibera | Solo la richiesta |
| `F4` - Società scientifica | No | `[NV]`, probabile | Solo la ricognizione dell'elenco |
| `F5` - Università conto terzi | No | `[NV]`: dipende dal regolamento di ateneo | Solo la lettura dei regolamenti |
| `F6` - Co-autore accademico | No | No | Sì, ma manca l'oggetto di cui pubblicare |
| `F7` - Volontario | No | No | Non si avvia: accade |
| `F8` - Qualifica interna | No | No | Sì, e senza effetto utile |
| `F9` - Rinvio dichiarato | No | No | **Sì, immediatamente** |

**La distinzione che decide che cosa si può avviare subito** è quindi meno netta di quanto la bozza
lasci intendere al § 10.2. Nessuna forma richiede il soggetto **in diritto**; tre lo richiedono
plausibilmente **in fatto**, e per tutte e tre il dubbio è `[NV]` e non l'ho verificato. La sola
forma su cui l'avvio non ha ostacoli né di diritto né di fatto è `F1`.

### 6.3 Comprimibilità

| Forma | Si avvia ora e si completa dopo | Blocco atomico | Dove sta il blocco |
|---|:-:|:-:|---|
| `F1` | **Sì** | No | - |
| `F2` | Sì | Forse | Il perimetro dell'offerta, se non è scomponibile |
| `F3` | In parte | **Sì** | Autorizzazione dell'art. 53 e delibera della struttura |
| `F4` | No | **Sì** | Deliberazione degli organi della società |
| `F5` | In parte | **Sì** | Delibera dipartimentale e regolamento di ateneo |
| `F6` | No | **Sì** | Revisione paritaria e decisione editoriale |
| `F7` | Non applicabile | No | Non c'è un blocco: c'è un'assenza |
| `F8` | No | **Sì** | Cinque anni con titolo, dieci senza |
| `F9` | Non applicabile | No | - |

### 6.4 Le cifre `[NV]`, con che cosa servirebbe per chiuderle

| Voce | Perché è `[NV]` | Che cosa la chiuderebbe |
|---|---|---|
| Costo monetario di `F1` e `F2` | Nessun tariffario pubblico per la redazione clinica regolatoria; confrontare listini di operatori violerebbe `R0` | **Richiesta di calcolo** a più figure, nella forma delle cinque regole di `09` § 8.3: giornate per attività e metodo di calcolo, non il prezzo |
| Costo monetario di `F3` e `F4` | Nessuna fonte consultata | Richiesta di informazioni non impegnativa, dopo la ricognizione |
| Costo monetario di `F5` | Le tariffe stanno nei **regolamenti conto terzi di ciascun ateneo**, che sono pubblicati ma distinti | Lettura del regolamento dell'ateneo con cui si tratta |
| Tempo di reperimento della figura | Nessuna richiesta è stata mai inviata: `R-22` fissa una **soglia dichiarata** di due settimane, non una misura | L'invio della prima richiesta con data registrata. È lo stesso indicatore che il criterio 2 di `T-14` rende misurabile |
| Tempo di delibera di `F3`, `F4`, `F5` | Procedimenti di terzi | Non chiudibile in anticipo. Il solo dato certo è il termine di trenta giorni dell'art. 53, comma 10 |
| Regime dell'art. 15-quinquies del d.lgs. 502/1992 | **Non ho letto il testo consolidato** | Lettura su Normattiva prima di qualunque trattativa con `F3` |
| Ammissibilità di un committente persona fisica in `F2`, `F3`, `F5` | Non verificato | Domanda esplicita nella richiesta di informazioni |
| Tempo fra sottomissione e pubblicazione in `F6` | Nessuna fonte citabile, e varierebbe per rivista | Politica editoriale pubblicata della rivista candidata |
| Elenco delle banche dati bibliografiche pertinenti | Già `[NV]` dichiarato nella bozza al § 8.2 | Fa parte del prodotto della forma scelta, non la precede |
| Numero di società scientifiche iscritte all'elenco ministeriale | La pagina del Ministero **non è stata leggibile** nella consultazione (barriera di validazione automatica) | Nuova consultazione della pagina del Ministero |
| Sostituzione del § 6.4 di MEDDEV 2.7/1 rev. 4 sotto MDR | Non verificato alla fonte primaria | Ricognizione dei documenti MDCG pertinenti al momento dell'uso |

---

## 7. Che cosa nessuna forma risolve, e va detto qui

**Il secondo valutatore non è un problema di competenza clinica.** Il § 8.1 regola 3 chiede due
persone distinte con regola di risoluzione dei disaccordi dichiarata prima. `F2` lo risolve;
`F3`, `F4` e `F5` lo risolvono se e solo se assegnano più di una persona, e va chiesto in trattativa
invece che sperato. `F1` non lo risolve. Nessuna forma lo risolve **per il resto del progetto**: la
famiglia di lacune di `V-281` e `Q-189` - audit interno, riesame del rilascio, verifica di
configurazione, revisione indipendente - resta intatta, e comprare un redattore clinico non la
scalfisce.

**La revisione esterna della destinazione d'uso congelata è un'altra cosa.** `Q-275` chiede un
**revisore regolatorio indipendente** sulla formulazione, non un redattore clinico sullo stato
dell'arte. Sono due competenze diverse e due acquisti diversi. Vale però la pena registrare
l'ordine: se la revisione esterna produce un rilievo sulla formulazione, **il dossier dello stato
dell'arte va rifatto**, perché il corpus dipende dalla formulazione (`07` § 2.2). Chi decide di
spendere su `Q-176` senza aver chiuso `Q-275` accetta consapevolmente il rischio di pagare due volte
la stessa cosa. **Non è un argomento per rinviare `Q-176`**: è un argomento per non rinviare
`Q-275`, che costa meno ed è l'unica prescrizione di `D46` eseguibile senza il soggetto costituito.

**Il vuoto della terza componente resta il vuoto.** Nessuna delle nove forme dimostra che l'uso del
dispositivo produca l'effetto atteso sulla gestione del paziente. Il ponte dalla letteratura sulla
modalità di erogazione all'affermazione su questo software è argomentazione da scrivere e da
difendere in cicli di quesiti, e la competenza clinica lo rende **scrivibile**, non **scritto**.

---

## 8. La raccomandazione

**È una raccomandazione e non la decisione.** `Q-176` resta aperta e la scelta è del Committente:
comporta un impegno di risorse esterne e una valutazione imprenditoriale che questo documento non è
in condizione di fare.

Data la capacità dichiarata - **contributore unico, dieci-venti ore settimanali** (`D54`, `D62`) -
il progetto dovrebbe scegliere **`F1`, l'incarico professionale a un redattore clinico individuale,
con perimetro limitato e in due passi**, e arrivarci attraverso un atto preliminare che oggi non è
stato compiuto.

**Passo zero, e va compiuto prima di qualunque decisione di spesa: chiedere, non comprare.** Il
`[NV]` sul costo è oggi la ragione per cui la decisione non è prendibile, e si chiude con una
**richiesta di informazioni e di calcolo** a più figure qualificate, costruita con le cinque regole
che `09` § 8.3 già fissa per gli organismi notificati: chiedere le giornate previste per attività e
il metodo di calcolo, non il prezzo; chiedere impegni sui tempi delle consegne; confrontare il
totale. Non impegna a nulla, non richiede il soggetto costituito, costa solo ore del contributore, e
**produce l'unico numero che oggi manca**. Ha inoltre un effetto laterale che vale da solo: rende
misurabile l'indicatore anticipatore di `R-22`, che senza una prima richiesta datata non esiste.

**Primo passo, dopo aver visto i numeri: incarico limitato a due voci.** Nell'ordine: la **verifica
della formulazione del beneficio clinico** (§ 4.3, seconda parte), che è la voce più economica
dell'elenco e quella su cui poggia tutto il resto; poi il **dossier dello stato dell'arte** (`P2`,
§ 5). Le cinque clausole del § 5 di questo documento nel contratto fin dalla prima riga.

**Secondo passo, e solo dopo: il protocollo operativo della ricerca** (§ 8.2), che ha senso quando
il dossier esiste, perché è il dossier a fondarne i criteri di inclusione.

**Le ragioni, in ordine di peso.**

*È la sola forma senza blocchi atomici.* Si avvia oggi, si scompone per oggetto, e ogni modulo
consegnato ha valore anche se il successivo non arriva mai. Sotto una capacità di dieci-venti ore
settimanali questa proprietà vale più di qualunque altra: è l'unica che non chiede al progetto di
impegnarsi su un esito che non controlla.

*È la sola forma senza dipendenza dal soggetto, né in diritto né in fatto.* `F3`, `F4` e `F5` hanno
un `[NV]` sulla stipulabilità con una persona fisica; `F1` no.

*È la sola forma in cui la verifica della qualifica è semplice.* Un curriculum, una dichiarazione,
sei aree di competenza da confrontare voce per voce con il § 6.4. Le forme istituzionali invitano a
sostituire l'autorevolezza dell'ente alla qualifica della persona, e quella sostituzione non regge
davanti a un organismo notificato.

*Il conflitto di interessi è minimo.* `F4` lo massimizza, `F3` lo introduce, `F6` lo crea per
costruzione. `F1` lo riduce a un rapporto di prestazione che si dichiara e si chiude.

**Che cosa questa raccomandazione accetta consapevolmente**, perché una raccomandazione che non
dichiara ciò che perde non è utilizzabile. Accetta di **non risolvere il § 8.1 regola 3**: con una
sola persona la doppia selezione resta la lacuna di `V-281` e `Q-189`, e va **dichiarata**, non
pianificata. Accetta il **punto singolo di rottura sulla ricorrenza**, mitigato dalla clausola 5 del
§ 5 e non eliminato. Accetta di **rinunciare all'accesso istituzionale alle banche dati** che le
forme `F3` e `F5` porterebbero, il che rende la domanda sull'accesso una voce obbligatoria della
richiesta di informazioni e non un dettaglio.

**Che cosa raccomando di non fare.** Non avviare `F3`, `F4`, `F5` e `F6` prima che il soggetto
esista: sono trattative il cui esito non dipende da chi le conduce, e `07` § 6.2 ha già stabilito
per l'equivalenza che attività di questo tipo **non si pianificano**. Non contare su `F7` in alcun
calendario, pur accogliendola con favore se accade. **Escludere `F8`**: cinque anni con titolo o
dieci senza sono un dato di fonte, non un'opinione, e sotto la capacità dichiarata l'acquisizione
interna sottrarrebbe capacità a lavoro già a calendario senza produrre nulla nel breve periodo.

**Due atti a costo esterno nullo che raccomando comunque**, qualunque cosa il Committente decida
sulla spesa. Il primo: la **ricognizione delle società scientifiche pertinenti** a partire
dall'elenco pubblico del Ministero della salute istituito dal decreto del 2 agosto 2017, registrata
con la fonte e la data di consultazione, esattamente nella forma che il criterio 3 di `T-14` chiede
per gli organismi notificati. Non impegna a nulla e fa sì che, quando il soggetto esisterà, `F4`
parta da un elenco e non da zero. Il secondo: la **lettura del testo consolidato dell'art.
15-quinquies del d.lgs. 502/1992**, che chiude un `[NV]` di questo documento e determina se `F3` sia
percorribile.

**E se la spesa non è possibile.** Allora la scelta è `F9`, **dichiarata**: una riga di registro con
la data in cui la lacuna nasce e la ragione, secondo `V-281`. Non è la stessa cosa di non decidere.
Il rinvio non dichiarato produce lo stesso ritardo e in più lo rende invisibile, e un ritardo
invisibile su una catena seriale non comprimibile è la peggiore delle nove uscite di questo
confronto.

---

## 9. Che cosa questo documento non fa

Non chiude `Q-176`. Non modifica `docs/`, `website/`, `scripts/`, `pipeline/` né `.github/`. Non
modifica la bozza di `CE-PLAN-001` e in particolare non riscrive il suo § 10: se il Committente
decide, la riscrittura di quel paragrafo è lavoro successivo e appartiene a chi tiene l'area. Non
nomina alcuna persona fisica, alcuna azienda, alcun marchio, alcun prodotto e alcun dominio. Non
contiene alcuna data riferita alla marcatura o a una dichiarazione di conformità. Non contiene
alcuna cifra monetaria, perché non ne ho verificata nessuna.

---

## 10. Le fonti

Ciascuna riga distingue **ciò che ho letto** da **ciò che ho soltanto trovato citato**.

| Sigla | Fonte | URL | Consultata il | Letta? |
|:-:|---|---|---|---|
| `F1` | MEDDEV 2.7/1 revisione 4, *Clinical evaluation: a guide for manufacturers and notified bodies*, §§ 6.2.3 e 6.4, pagine 12, 14 e 15 di 65 | `https://webgate.ec.europa.eu/circabc-ewpp/rest/download/7423d348-1e94-4fb8-8a65-02dd2075dec0` | 27 agosto 2026 | **Sì**, testo integrale delle pagine citate |
| `F2` | Regolamento (UE) 2017/745, artt. 2 punto 44, 15, 50, 61 e Allegato XIV | Portale EUR-Lex | 27 agosto 2026 | **No**: le pagine EUR-Lex non hanno restituito testo. I richiami normativi di questo documento riprendono `docs/08_compliance/` e ne conservano gli `[NV]` |
| `F3` | Decreto del Ministero della salute 2 agosto 2017, *Elenco delle società scientifiche e delle associazioni tecnico-scientifiche delle professioni sanitarie*, in attuazione dell'art. 5 della legge 8 marzo 2017, n. 24; Gazzetta Ufficiale, Serie generale, n. 186 del 10 agosto 2017 | `https://www.gazzettaufficiale.it/eli/id/2017/08/10/17A05598/sg` | 27 agosto 2026 | **Sì**, scheda dell'atto: titolo, base legale, riferimento all'art. 2 comma 2 sui requisiti di iscrizione |
| `F4` | Decreto legislativo 30 marzo 2001, n. 165, art. 53, commi 7 e 10 | `https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.legislativo:2001-03-30;165~art53` | 27 agosto 2026 | **Sì** |
| `F5` | Decreto del Presidente della Repubblica 11 luglio 1980, n. 382, art. 66 | `https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.presidente.repubblica:1980-07-11;382~art66` | 27 agosto 2026 | **Sì** |
| `F6` | Decreto del Ministero della salute 21 settembre 2022, *Approvazione delle linee guida per i servizi di telemedicina - Requisiti funzionali e livelli di servizio*; Gazzetta Ufficiale, Serie generale, n. 256 del 2 novembre 2022 | `https://www.gazzettaufficiale.it/eli/id/2022/11/02/22A06184/sg` | 27 agosto 2026 | **Sì**, scheda dell'atto |
| `F7` | Pagina del Ministero della salute sull'elenco delle società scientifiche | `https://www.salute.gov.it/new/it/tema/professioni-sanitarie/elenco-societa-scientifiche-e-associazioni-tecnico-scientifiche-delle/` | 27 agosto 2026 | **No**: la consultazione ha restituito una schermata di validazione automatica e non il contenuto |
| `F8` | Decreto legislativo 30 dicembre 1992, n. 502, art. 15-quinquies | - | - | **No**: non consultato. Resta `[NV]` |

**Una nota sulla fonte `F6`, che non serve a questo confronto ma va registrata perché ne cambia il
prezzo.** Una parte consistente della base documentale del dossier dello stato dell'arte è
**normativa italiana pubblica già individuata dentro il repository**: l'Accordo in sede di
Conferenza permanente del 17 dicembre 2020, repertorio atti n. 215/CSR, il decreto del 21 settembre
2022 e quello del 30 settembre 2022 sono citati puntualmente in `docs/03_functional/` come fonte di
regole di business. Ne discende una conseguenza che riduce il costo di qualunque forma onerosa:
**la parte di ricognizione normativa dello stato dell'arte è in misura non trascurabile già fatta**,
e ciò che manca è la parte clinica - pratica di riferimento, risultati, limiti riconosciuti - e la
sua sistemazione nella forma attesa da un fascicolo tecnico. Vale la pena metterlo nella richiesta
di informazioni: si compra meno lavoro se si dichiara che cosa esiste già.

---

## 11. Contraddizioni e imprecisioni incontrate, non corrette

Nessuna è stata corretta: la correzione appartiene a chi tiene l'area.

1. **Il conteggio delle voci con parte vuota in `CE-PLAN-001` § 3 non torna.** La tabella di quel
   paragrafo attribuisce una parte vuota alle voci 2, 3, 4, 5 e 6 - cioè **cinque voci su sei** - e
   il capoverso immediatamente successivo scrive *«quattro voci su sei hanno una parte vuota»*. La
   voce 1 porta a sua volta un residuo dichiarato al § 4.3. Non ho corretto né il numero né il testo,
   e in questo documento ho contato sulle righe della tabella e non sul capoverso.
2. **La forma 2 del § 10.2 della bozza mette insieme regimi giuridici incompatibili.** Sotto
   l'unica etichetta *«collaborazione con una struttura che disponga della competenza - società
   scientifica, ente di ricerca, struttura sanitaria interessata al percorso»* stanno tre forme che
   hanno strumento contrattuale, organo deliberante, tempi e vincoli diversi: una convenzione con
   una struttura sanitaria incontra l'art. 53 del d.lgs. 165/2001, un contratto conto terzi con
   un'università passa dall'art. 66 del d.P.R. 382/1980, e una società scientifica non ha né l'uno né
   l'altro strumento. Il § 4 di questo documento le tiene distinte come `F3`, `F4` e `F5`, e la
   distinzione cambia la risposta sulla comprimibilità.
3. **La bozza afferma al § 10.2 che «le forme 1 e 2 non richiedono il soggetto fabbricante
   costituito».** È esatto **in diritto** e non verificato **in fatto** per le controparti
   istituzionali. Il § 6.2 di questo documento rende esplicita la distinzione e marca `[NV]` la
   parte non verificata, invece di lasciarla implicita nell'affermazione unica.
4. **Il § 10.1 della bozza elenca tre fabbisogni e dichiara che «le prime due» sono acquisibili
   oggi.** Il secondo fabbisogno - il secondo valutatore per la doppia selezione - è acquisibile solo
   con una forma che porti più persone, e quindi **non** con la forma 1, che è quella che il § 10.2
   presenta come immediatamente avviabile. La tensione fra le due affermazioni non è dichiarata nella
   bozza; il § 7 di questo documento la nomina.

---

## 12. Che cosa non ho potuto verificare

Elencato qui perché un documento che tace le proprie lacune sembra più solido di quanto sia.

- **Nessuna cifra monetaria**, per nessuna delle nove forme. Non ne ho verificata alcuna e non ne
  ho scritta alcuna.
- **Il testo degli articoli del Regolamento (UE) 2017/745**: le pagine EUR-Lex consultate non hanno
  restituito testo. I richiami normativi riprendono i capitoli del repository e ne conservano gli
  `[NV]` già dichiarati sulla numerazione puntuale.
- **L'art. 15-quinquies del d.lgs. 502/1992**, che determina se e come una figura della dirigenza
  sanitaria in rapporto esclusivo sia ingaggiabile. È la lacuna che pesa di più su `F3`.
- **Se un documento MDCG abbia sostituito il § 6.4 di MEDDEV 2.7/1 revisione 4** per il regime MDR.
  Il § 3 dichiara il limite di regime della fonte.
- **Il numero di società scientifiche iscritte all'elenco ministeriale**: la pagina del Ministero
  non è stata leggibile nella consultazione.
- **Se le controparti di `F2`, `F3` e `F5` accettino come committente una persona fisica** priva di
  soggetto giuridico. È la domanda che decide che cosa si può davvero avviare subito, e non ho modo
  di rispondervi se non chiedendo.
- **L'accesso istituzionale alle banche dati bibliografiche** attribuito nel § 4 a `F3` e `F5` è una
  **deduzione**, non un dato letto, ed è segnalata come tale nel punto in cui compare.
