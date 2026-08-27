# `G11` - la regola di riservatezza `R0` tradotta in controllo

**Stato**: progettazione conclusa, attuazione consegnata. **Data**: 26 agosto 2026.
**Questione di riferimento**: `Q-286` in `.telemedic/context/05_BACHECA_INTERAGENTI.md`.
**Lavoro di riferimento**: `L-09` di `.telemedic/piani/T-03-catena-di-costruzione.md`; criterio 6 di
`.telemedic/piani/T-02-corpo-documentale.md`.
**Consegnato**: `scripts/verifica-termini-vietati.sh`, `pipeline/termini-ammessi.tsv`,
`pipeline/termini-vietati.esempio.tsv`.
**Non consegnato, e non era del progettista**: i casi del banco in `scripts/prove/`, la riga di
`pipeline/collocazione-dei-controlli.tsv`, il passo nei flussi di lavoro. Sono proposti alle
sezioni 8 e 9 e vanno commissionati.

---

## 1. Il paradosso, detto per intero

Il §3 di `docs/01_technical/09-integrazione-continua-e-rilascio.md` definisce `G11` come *«la
traduzione automatizzata della regola `R0`: una lista di termini vietati, versionata, con
procedura di aggiornamento»*. La lista non esiste, e la ragione per cui non esiste non è la
pigrizia di nessuno.

`R0` vieta che compaia, in qualunque artefatto del progetto, il nome di un'azienda, di un
marchio, di un prodotto commerciale o il dominio di un potenziale partner. La ragione dichiarata
in `docs/10_fondamenti/17` §9.2 è che *«esistono ragioni di riservatezza che non sono tue da
valutare»*: la riservatezza protetta non è del progetto, è di un terzo, e il progetto la
custodisce per conto suo.

Una lista di termini vietati versionata in un repository pubblico **è** l'elenco di quei termini.
E non è la stessa cosa della menzione che doveva impedire: è peggio. Una menzione sparsa in un
documento è un accidente, ambiguo, che chi legge può interpretare in cento modi. Un file
intitolato «termini vietati» è un **registro curato dei rapporti del progetto**, pubblicato con
intenzione, con l'etichetta che ne certifica il significato. Chi lo trova non deve dedurre nulla:
gli è stato detto. Il controllo commetterebbe, per esistere, la violazione che esiste per
impedire, e la commetterebbe in forma aggravata.

C'è una seconda faccia, che `T-02` §1.1 aveva già individuato e che va tenuta ferma perché
determina tutto il resto: **la storia di git non dimentica**. Il danno di `R0` è irreversibile per
sua natura - `T-02` §1 lo scrive così: *«un periodo di pubblicazione non si annulla»* - e in un
repository pubblico ciò che è stato spinto è stato clonato, indicizzato e archiviato prima che
qualcuno lo tolga. Ne segue una conseguenza che non è negoziabile e da cui discende la scelta:
**nessuna rappresentazione dei termini protetti può entrare nella storia versionata, in nessuna
forma, per quanto offuscata.** Non in chiaro, non per impronta, non cifrata.

---

## 2. Le vie valutate, ciascuna con ciò che smette di intercettare

### 2.1 Lista in chiaro nel repository

È la lettura letterale del criterio. Si scarta subito, e non per prudenza generica: è
esattamente la violazione. Va registrata perché è la via che il testo del criterio suggerisce, e
perché chiunque riapra la questione fra un anno ci ripenserà per primo.

*Che cosa intercetterebbe*: tutto ciò che è in lista, in ogni forma, con ricerca per sottostringa
e per variante. È la via con la copertura più alta in assoluto. *Che cosa costa*: la
pubblicazione dell'insieme protetto. Il rapporto fra i due non si discute.

### 2.2 Impronte non salate, versionate nel repository

Si versiona l'impronta crittografica di ciascun termine normalizzato invece del termine. Sembra
la soluzione ovvia. Non lo è, per due ragioni distinte.

La prima è che **un'impronta non salata è un impegno, non un segreto**. Lo spazio dei candidati
non è lo spazio delle stringhe: è l'elenco dei nomi di azienda plausibili in un dominio ristretto,
che si conta in ordine di grandezza `[NV]` a milioni e si costruisce da registri pubblici di
imprese e da elenchi di domini. Calcolare l'impronta di ciascuno e confrontarla con una lista di
poche decine di voci è lavoro di minuti su una macchina qualunque. Quantificare esattamente il
costo dell'attacco richiederebbe misurarlo, e qui non è stato misurato: resta `[NV]` la cifra, non
la conclusione, che regge anche se la stima sbaglia di due ordini di grandezza. La lista salterebbe
inoltre agli occhi proprio per quello che è, come nel caso 2.1: un elenco di impronte in un file
che si chiama così dichiara di essere un bersaglio.

La seconda è che **il troncamento non aiuta**. Accorciare l'impronta - o costruire un filtro
probabilistico - introduce collisioni deliberate e quindi negabilità: un riscontro non
identificherebbe più un termine unico. Ma in un alfabeto di candidati piccolo, restringere a
duecento nomi compatibili è già una divulgazione, e il prezzo sono falsi positivi diffusi su un
corpus di trecento documenti. Si compra negabilità e si vende usabilità, che è il cambio
sbagliato: un controllo che segnala a caso viene spento entro la settimana.

*Che cosa intercetterebbe*: i termini in lista, ma solo dove il controllo sa dove guardare, perché
un'impronta non si cerca per sottostringa - va calcolata su candidati enumerati. Si perdono la
ricerca per sottostringa e per variante non prevista dalla normalizzazione. *Che cosa costa*: la
divulgazione differita dell'insieme protetto, e nella storia per sempre.

### 2.3 Impronte salate, versionate nel repository, con il sale nel deposito dei segreti

È la variante sofisticata della 2.2, e la più insidiosa perché sembra risolvere tutto. Il sale
sconfigge l'enumerazione, l'elenco resta versionato, il criterio è soddisfatto alla lettera.

Si scarta per tre ragioni che si sommano.

La prima è la **retroattività**. Il giorno in cui il sale trapela - e un segreto che deve reggere
per l'orizzonte di conservazione di un fascicolo tecnico è un segreto che deve reggere per anni
dopo l'ultimo esemplare immesso sul mercato - non trapela l'elenco di oggi: trapela **l'intera
storia dell'elenco**, comprese le voci tolte perché il rapporto era finito e non doveva più
esistere da nessuna parte. Una protezione che può fallire all'indietro, su tutto, in un colpo, non
è della forma giusta per un divieto irreversibile.

La seconda è che **il sale è un onere ricorrente di custodia**, ed è la stessa specie di onere che
il committente ha già rifiutato con la decisione su `Q-287` del 26 agosto 2026: là si trattava
della chiave di firma, e la ragione decisiva fu che *«un onere ricorrente che nessuno ha il tempo
di esercitare non è una misura di sicurezza: è una chiave abbandonata, che è peggio di nessuna
chiave»*. La capacità dichiarata sotto `D54` non è cambiata in due settimane.

La terza è che **non comprerebbe nulla per chi clona**. Senza il sale, l'elenco versionato è un
file che il contributore esterno non può usare: lo strato specifico non girerebbe comunque a casa
sua. Si pagherebbe l'irreversibilità per l'apparenza di una lista versionata. È l'argomento che
chiude la questione da solo.

*Che cosa intercetterebbe*: come la 2.2. *Che cosa costa*: la storia, e un segreto perpetuo.

### 2.4 Lista fuori dal repository, riferita per configurazione

L'elenco vive fuori, il controllo lo riceve per variabile d'ambiente. È la via che `T-02` §1.1
elencava per terza, con il costo dichiarato: *«il controllo non è più riproducibile da chi installa
né da un contributore esterno»*.

Il costo va misurato con precisione, perché detto così è più grande di quello che è. Non è il
controllo a smettere di funzionare: è **uno dei suoi due strati**. E va guardato chi perde che
cosa. Il contributore esterno che scrive per sbaglio il nome di un partner non ha bisogno di
conoscere la lista - **è precisamente la persona a cui la lista non deve essere mostrata**. Gli
serve un verdetto, e il verdetto glielo dà la catena del progetto sulla sua proposta di modifica.
La non riproducibilità cade quindi sul soggetto giusto.

*Che cosa smette di intercettare*: nella copia di chi clona, i nomi specifici. Resta attivo tutto
lo strato strutturale. *Che cosa costa in più, e va detto*: sulle proposte che arrivano da una
diramazione, la piattaforma non consegna i propri segreti al flusso di lavoro `[NV] - comportamento
della piattaforma, da verificare alla fonte prima di scriverlo in un documento pubblico`. Se è
così, lo strato specifico **non gira proprio sull'evento in cui servirebbe di più**, e diventa una
scansione che il manutentore esegue sulle proprie esecuzioni. Per un progetto con un contributore
unico a tempo parziale quello è comunque il caso dominante, ma la limitazione non va nascosta
dietro la media.

### 2.5 Criteri strutturali senza alcuna lista

Il controllo non cerca nomi: cerca le **forme** in cui un nome commerciale si manifesta - un nome
di host, un indirizzo di posta, un marcatore di marchio registrato, una sigla di forma societaria,
una coordinata a dominio inverso. Non contiene alcun termine vietato, si versiona in chiaro, gira
per chiunque.

Ha però un problema che l'analisi precedente non aveva messo a fuoco: **senza un elenco di
ammissione produce quasi solo falsi positivi**. Il corpus cita centosettantotto nomi di host
distinti, e sono quasi tutti citazioni legittime di organismi di normazione, di gazzette ufficiali
e di autorità. Segnalarli tutti equivale a non avere un controllo.

Il rovesciamento che rende praticabile questa via è il cuore della soluzione, e va enunciato per
esteso: **si pubblica il complemento, mai l'insieme protetto**. Un elenco di ciò che è *ammesso* in
quelle posizioni non ha il difetto della 2.1, perché contiene soltanto nomi già presenti in chiaro
nel corpus - un organismo di normazione, un'autorità, un dominio riservato dalle RFC,
l'infrastruttura tecnica su cui il progetto è ospitato - e non dice **nulla** su alcun rapporto
commerciale. La sua pubblicazione non aggiunge un solo bit di informazione a chi legge il
repository.

Detto in un altro modo: questa via è un **vocabolario chiuso applicato dove il vocabolario è
piccolo**. Applicare un vocabolario chiuso a tutta la prosa - segnalare ogni parola con iniziale
maiuscola che non sia in elenco - sarebbe la via con la copertura massima in assoluto, e
richiederebbe un elenco di ammissione di circa tremilacinquecento voci per il solo italiano, che
sotto `D54` non si mantiene e che produrrebbe un rilievo per ogni parola nuova. Ristretto alle
posizioni commerciali, lo stesso principio richiede un elenco di poche decine di voci.

*Che cosa smette di intercettare, e va dichiarato senza attenuazioni*: **un nome commerciale che
abbia la forma di una parola qualunque**, scritto senza dominio, senza marcatore e senza sigla
societaria. Se un potenziale partner si chiama con una parola comune, questa via non lo vede, mai,
in nessuna circostanza. È la classe di violazione più probabile in un documento di prosa, e non è
una lacuna marginale.

*Osservazione già registrata da `T-02` §1.1, che resta vera*: questa via **non soddisfa il criterio
6 come è scritto**, perché il criterio esige una lista di termini. Adottata da sola andrebbe
accompagnata da un emendamento del criterio, cioè da una riduzione di ambito registrata.

---

## 3. La scelta, e perché è questa

**Due strati, con regimi opposti di pubblicità.**

**Strato uno - criteri strutturali con elenco di ammissione, in chiaro, sempre attivo.** È la via
2.5. Vive in `pipeline/termini-ammessi.tsv`, si versiona qui, gira per chiunque cloni, non
richiede segreti, non richiede rete e non richiede nulla oltre a `find`, `awk` e una shell.
Riconosce cinque forme: nomi di host in quattro contesti, indirizzi di posta, il marcatore di
marchio registrato accostato a un nome, le sigle di forma societaria accostate a un nome, e le
coordinate a dominio inverso. In ciascuna di quelle posizioni vale il vocabolario chiuso.

**Strato due - elenco specifico per impronta, fuori dal repository, spento per difetto.** È la via
2.4, applicata al solo residuo che lo strato uno non può vedere: il nome che ha la forma di una
parola qualunque. Il controllo riceve il percorso dell'elenco in `${TERMINI_VIETATI_ELENCO}`;
senza quella variabile lo strato non gira.

**Perché l'elenco specifico è per impronta e non in chiaro, visto che il file è già riservato.**
Non per proteggere il file - il sale sta nel file stesso, quindi chi ottiene il file ottiene
anche il sale, e questo va detto senza attenuazioni. Per due ragioni più ristrette e vere.
La prima: il file viene montato dentro un esecutore, aperto in un editor, copiato, e prima o poi
aggiunto per sbaglio a un commit; con i termini in chiaro l'incidente è istantaneo e definitivo,
con le impronte resta il tempo di accorgersene e di cambiare il sale. È un **ritardo**, non
riservatezza, e va chiamato così.
La seconda, che pesa di più: **il controllo non può rivelare ciò che non conosce**. Con l'elenco in
chiaro, lo script terrebbe in memoria i termini protetti, e qualunque tracciamento della shell,
qualunque diagnostica aggiunta in futuro da chi non ha letto questo documento, qualunque messaggio
di errore verboso li riverserebbe in un registro di costruzione **pubblico**. Con le impronte, la
cosa peggiore che un errore di programmazione può stampare è una stringa esadecimale.

**Perché non c'è, e non ci sarà, un'opzione «mostra in chiaro».** Una variabile d'ambiente che
disattiva l'oscuramento è una variabile che qualcuno, prima o poi, imposta in un flusso di lavoro
pubblico. La decisione di non ristampare mai il valore trovato è presa da
`scripts/verifica-dati-sintetici.sh` con questa motivazione: *«un controllo che riversa il dato nel
registro della costruzione lo pubblica una seconda volta, in un archivio che sopravvive alla
correzione del file»*. Qui vale con più forza, perché il valore trovato **è** il nome che `R0`
protegge. La perdita di utilità è apparente: chi ha scritto quella riga sa che cosa ci ha scritto,
e il rilievo gli dà percorso e numero di riga. A perderci è solo chi legge il registro
dall'esterno, che è l'obiettivo.

**Perché non c'è un marcatore da riga, a differenza di `G10`.** Il controllo gemello ammette
`dato-reale-consentito:` sulla riga stessa. Qui l'eccezione si scrive in
`pipeline/termini-ammessi.tsv` e da nessun'altra parte. La ragione è che un'eccezione a una
riservatezza altrui non è una decisione da prendere in una riga: va vista, e un marcatore sparso
in trecento documenti è invisibile a chi rivede, mentre una riga aggiunta a un file di
configurazione compare nella modifica e si legge tutta insieme.

**Il canarino, e perché un elenco di impronte non può esistere senza.** Un elenco di impronte non è
ispezionabile: non lo si può guardare e dire se è giusto. Il modo naturale in cui si guasta è il
peggiore possibile - sale cambiato senza ricalcolare, file troncato, percorso sbagliato - e
l'effetto è che **lo strato gira, non trova mai nulla ed esce verde per sempre**. L'elenco deve
quindi portare la propria prova di coerenza: la prima impronta è quella di una stringa pubblica e
fissa, `CANARIO-G11`, calcolata con il sale dichiarato nel file. Il controllo la ricalcola e la
cerca; se non la trova esce con errore di configurazione, non con un verde privo di significato.

**Il controllo dichiara sempre quale metà di sé stesso ha eseguito.** A ogni esecuzione, verde o
rossa, stampa lo stato dei due strati, se ha esaminato i messaggi di commit, e l'elenco di ciò che
non copre in nessun caso. Un controllo che non dice quale metà ha eseguito trasforma un verde
parziale in una rassicurazione intera, ed è il modo in cui un controllo comincia a mentire senza
che nessuno lo abbia toccato.

---

## 4. Che cosa il controllo fa, in concreto

Cinque regole strutturali, più lo strato specifico.

**Nomi di host.** Estratti da quattro contesti: dopo uno schema di protocollo, dopo `www.`, dopo la
chiocciola di un indirizzo di posta, e nudi nel testo quando la marca di primo livello appartiene a
un elenco breve e dichiarato. L'elenco delle marche è volutamente corto - diciotto voci - e la
copertura che perde è dichiarata: un dominio nudo sotto una marca non elencata non viene visto.
La copertura che guadagna è non segnalare `d.lgs`, `file.md` e i numeri di versione, che è la
differenza fra un controllo attivo e un controllo spento entro tre giorni. La marca di primo
livello di un indirizzo di posta deve inoltre essere alfabetica, altrimenti ogni specifica di
versione di un pacchetto verrebbe letta come un indirizzo: è la stessa trappola già costata un
falso positivo a `G10`, ed è annotata anche là.

**Sigle di forma societaria** accostate a un nome con iniziale maiuscola. Sono la firma più limpida
di una ragione sociale, perché nessuna prosa italiana le produce per caso. Sono **escluse quelle
ambigue** - le sigle di due lettere che collidono con parole e sigle comuni - e l'assenza è
dichiarata qui: un controllo che segnala la congiunzione «se» viene spento prima di aver trovato
qualcosa.

**Marcatore di marchio registrato** accostato a un nome. Il rilievo scatta sul nome che lo precede,
non sul marcatore: un marcatore isolato non nomina nessuno. È anche la ragione per cui lo script
non fa fallire sé stesso pur contenendo i tre caratteri nella propria espressione. L'ammissione
funziona a scala: se `dicom` è ammesso, lo è anche quando la parola che precede è entrata nella
cattura, così che l'elenco non debba elencare le combinazioni.

**Coordinate a dominio inverso.** Il segmento di fornitore va ammesso esplicitamente, e la regola
per ammetterlo è che il componente corrispondente sia **già annotato** in
`pipeline/annotazioni-componenti.tsv`, cioè già valutato. Oggi la regola non ha quasi oggetto,
perché non esiste codice applicativo: è scritta adesso perché `T-08` la trovi in esercizio invece
di doverla introdurre su un corpus già cresciuto.

**File di blocco delle dipendenze.** Sono generati da uno strumento, non scritti: i domini che
contengono sono dichiarati dagli autori dei componenti a monte - pagine di finanziamento, siti
personali - e non dicono nulla sui rapporti di questo progetto. Segnalarli produceva
duecentonovanta rilievi che nessuno poteva correggere. Restano però esaminate le righe di
**risoluzione**, dove compare il registro da cui il pacchetto viene preso: un registro privato in
un file di blocco è una divulgazione vera, ed è proprio la forma che questa eccezione deve
continuare a vedere.

**Messaggi di commit.** `R0` li nomina esplicitamente. Il controllo esamina l'intervallo indicato
in `${TERMINI_VIETATI_COMMIT}` e non tutta la cronologia, perché riscrivere un messaggio già spinto
non è una correzione e un controllo che fallisse per sempre su un commit vecchio verrebbe spento
entro la settimana. L'intervallo utile è quello della proposta di modifica in corso.

**Strato specifico.** In prosa raccoglie le sequenze di parole con iniziale maiuscola e i loro
gruppi da una a tre parole; fuori dalla prosa raccoglie i segmenti degli identificativi, in
minuscolo, di almeno quattro caratteri. Le forme sono deduplicate sulla normalizzazione, ne
calcola l'impronta in un solo processo e la confronta con l'elenco. Sul corpus reale sono
ventunomilaottocento forme distinte e l'esecuzione completa costa due secondi e mezzo; senza lo
strato specifico, un secondo e tre decimi.

**Normalizzazione.** Si scartano i byte non ASCII, si passa a minuscole, ogni sequenza che non sia
lettera o cifra diventa un solo spazio, si tolgono gli spazi ai bordi. È tollerante alle varianti -
maiuscole, punteggiatura interna, trattini, accenti - e questa tolleranza è il motivo per cui una
sola voce in elenco copre più scritture dello stesso nome. Il costo è che due nomi che differiscono
solo per un accento collidono. La stessa funzione serve i candidati e il modo `--impronta`: se le
due strade divergessero, l'elenco non troverebbe mai nulla.

---

## 5. Che cosa il controllo **non** intercetta

Questa è la sezione da leggere per prima quando il controllo esce verde. Ogni voce è una
decisione, non una dimenticanza.

**Un nome commerciale che sia una parola qualunque, in minuscolo, dentro la prosa.** Lo strato
strutturale non lo vede per costruzione. Lo strato specifico lo vede **solo se** il termine è in
elenco **e solo se** compare con iniziale maiuscola o come segmento di un identificativo. Un nome
proprio scritto in minuscolo in mezzo a una frase non viene raccolto. La ragione della restrizione
è di precisione, non di prestazione: raccogliere ogni parola significherebbe che un termine comune
finito in elenco segnalerebbe ogni suo uso legittimo. Il fenomeno è stato osservato in prova - un
segnaposto di collaudo scelto fra le parole comuni ha prodotto un riscontro su un documento reale
che non nominava nessuno - e sarebbe la via più rapida per far spegnere il controllo.

**Qualunque nome dentro un'immagine.** Una schermata con il marchio di un fornitore è una
violazione di `R0` perfetta e completamente invisibile a un controllo che legge testo. È la lacuna
più grave dell'intero impianto e **non ha rimedio automatico** con gli strumenti di questa catena.
Resta presidiata solo dalla revisione umana, che il §3 dichiara insufficiente proprio per i casi
distratti.

**Tutto ciò che vive sulla piattaforma e non nel repository**: titoli e corpi delle segnalazioni,
titoli delle proposte di modifica, commenti di discussione, descrizioni di rilascio, nomi dei rami.
`R0` li nomina; il controllo non ci arriva. Chiuderlo richiederebbe un controllo che interroga
l'interfaccia della piattaforma, il che è un lavoro diverso e ha una dipendenza di rete.

**I nomi di persona.** `R0` nomina aziende, marchi, prodotti e domini. Il nome del referente di un
partner è altrettanto disvelante e non ha forma riconoscibile: nessuna delle cinque regole lo vede,
e lo strato specifico lo vedrebbe solo se qualcuno lo mettesse in elenco.

**Gli ambiti dei pacchetti e i nomi delle dipendenze** nella forma `@fornitore/pacchetto`. Sono
governati da `G2` e da `G5`, che li nominano per mestiere, e includerli qui produrrebbe decine di
rilievi sugli ambiti legittimi della catena di costruzione. Un partner consegnato come dipendenza è
un problema di `R0` che lo strato strutturale non presidia. Lo strato specifico lo vede, perché
raccoglie i segmenti degli identificativi anche nei file di blocco.

**Un dominio nudo sotto una marca di primo livello non elencata.** Le marche riconosciute sono
diciotto. Un dominio scritto senza schema e senza `www` sotto una marca fuori elenco passa.

**Le sigle societarie di due lettere e quelle ambigue.** Escluse deliberatamente, vedi §4.

**I file binari.** Esclusi dalla scansione per estensione. È la stessa esclusione di `G10` e ha lo
stesso limite dichiarato.

**La cronologia dei commit anteriore all'intervallo indicato.** Per difetto, nessun messaggio di
commit viene esaminato.

**Le violazioni che passano attraverso una modifica dell'elenco di ammissione.** Chiunque può
aggiungere una riga a `pipeline/termini-ammessi.tsv` e far passare un dominio. È voluto: è il
punto in cui la decisione diventa visibile e passa in revisione. Se la revisione non guarda quel
file, l'elenco di ammissione è una porta aperta - e questa è una dipendenza dal processo, non dal
programma.

---

## 6. La lista: chi la compila, dove vive, come si aggiorna

**Chi la compila: il committente, e nessun altro.** Non è una gerarchia, è l'unico criterio
possibile. Una voce entra in lista perché esiste un rapporto - in corso, concluso o in
trattativa - e la conoscenza di quel rapporto non appartiene a chi contribuisce. Un contributore
che proponesse una voce starebbe dichiarando pubblicamente di sapere qualcosa che `R0` esiste per
non far sapere. Ne segue che **la lista non si discute in una proposta di modifica, in una
segnalazione o in un canale pubblico**, e che una richiesta di aggiunta non si motiva per iscritto
in un luogo condiviso.

**Dove vive: fuori da questo repository e fuori da qualunque repository pubblico.** Un solo file,
con il sale nell'intestazione e le impronte sotto. Un solo artefatto da custodire, per la ragione
di `D54` già invocata da `Q-287`: due segreti da ruotare insieme sono un onere ricorrente, e un
onere ricorrente che nessuno esercita non è una misura. Se il committente lo versiona, lo versiona
in un deposito privato: la versionatura richiesta dal criterio 6 è soddisfatta **là**, e in quella
sede la sua storia non è pubblica.

**Come si aggiunge una voce.** Si calcola l'impronta con il modo dedicato del controllo, che legge
il termine dallo standard input - non dagli argomenti, che finirebbero nella storia della shell e
nella tabella dei processi - e stampa la sola impronta:

    printf '%s' 'il termine' | TERMINI_VIETATI_ELENCO=<percorso> scripts/verifica-termini-vietati.sh --impronta

Si aggiunge la riga con la data e la classe. **Non si calcola l'impronta a mano e non si incolla il
termine in un servizio in rete**: sarebbe la divulgazione compiuta con lo strumento costruito per
evitarla. **Nessuna nota libera**, mai: una nota libera su un termine vietato è il termine vietato
scritto in un altro modo. Le classi ammesse sono cinque - azienda, marchio, prodotto, dominio,
persona - e servono a chi tiene la lista, non al controllo.

**Quando si aggiunge.** Nel momento in cui il rapporto nasce, non quando si teme che qualcuno lo
nomini. Una voce aggiunta dopo che il nome è già stato scritto arriva a danno compiuto: la storia
lo conserva, e il controllo non lo toglie.

**Come si toglie una voce, che è la parte che si sbaglia.** Togliere la riga e basta **non
funziona**: l'impronta resta in tutte le copie precedenti del file, e chi ne ha una vecchia
continua a poterla usare. Togliere una voce significa **cambiare il sale e ricalcolare tutte le
altre impronte**, cioè riscrivere il file da capo, dai termini in chiaro che solo il committente
possiede. È un'operazione rara e va fatta interamente in un ambiente non condiviso.

**Come si ruota il sale.** Stessa operazione. Va fatta se il file è finito dove non doveva -
un commit ritirato, un messaggio, una schermata condivisa - e va fatta **prima** di rimuovere il
file dal posto sbagliato, non dopo, per la ragione di sempre: la copia è già stata presa.

**Che cosa succede se la lista non esiste.** Il controllo gira lo strato strutturale e lo dichiara.
Non è un difetto: è la condizione normale del primo giorno e la condizione permanente di chi clona.

---

## 7. Che cosa il controllo trova oggi, misurato sul corpus reale

Misura del 26 agosto 2026, con l'elenco di ammissione consegnato e senza strato specifico:
centodiciannove rilievi in tutto, uno solo dei quali fuori da `.telemedic/`.

| Dove | Rilievi | Che cosa sono |
|---|---|---|
| `docs/`, `website/`, radice, `pipeline/`, `scripts/`, `registro/` | **1** | Un esempio che usa una marca di primo livello inesistente al posto di una riservata dalla RFC 2606 |
| `.telemedic/research/` e `.telemedic/context/` | **116** | Fonti citate negli appunti di ricerca: studi legali, società di consulenza regolatoria, testate specializzate, consulenti di organismi notificati |
| `.telemedic/` - forma societaria | **2** | Una ragione sociale accostata a una sigla, negli appunti di ricerca |

Tre osservazioni che valgono più della tabella.

**Il corpus pubblicato è pulito.** Un solo rilievo su `docs/` e sul sito, e non è nemmeno una
violazione di `R0`: è un esempio scritto con un dominio non riservato. Le tre aree in cui il
controllo è nato per operare non hanno debito.

**Il debito è tutto negli appunti di ricerca, ed è una decisione, non una correzione.** Gli appunti
sotto `.telemedic/research/` citano per esteso i domini delle proprie fonti, e alcune di quelle
fonti sono studi legali, società di consulenza regolatoria e testate commerciali - cioè
precisamente la classe di soggetti di cui `R0` si occupa. Il criterio 6 di `T-02` chiede che il
controllo giri anche su `.telemedic/`, e `.telemedic/` è pubblicato. Le vie sono tre e nessuna è
gratuita: ammettere le fonti citate nell'elenco di ammissione, il che significa dichiarare che una
citazione bibliografica non è un rapporto; togliere le URL lasciando la citazione in forma testuale
- autore, titolo, data - il che conserva la verificabilità e costa una passata su una dozzina di
file; oppure dichiarare `.telemedic/research/` fuori dal perimetro di `R0`, il che è la via più
comoda ed è anche quella che il §11 di `docs/09_roadmap/00-indice.md` contraddice. **La scelta è
del committente**, ed è la ragione per cui il controllo entra in tabella come segnalazione con
una data e non come bloccante immediato.

**Alcuni esempi della documentazione usano domini che non sono riservati.** Sono stati incontrati
lungo la messa a punto e vanno segnalati anche se non sono violazioni di `R0`: forme sotto una
marca nazionale reale e una marca di primo livello inventata, usate come se fossero riservate. Un
dominio sotto una marca reale **è registrabile da chiunque**, e un esempio che lo usa può un giorno
puntare a qualcosa. La correzione è meccanica - si usano le forme riservate dalla RFC 2606 - e
appartiene a chi possiede quei documenti, non a questo lavoro.

---

## 8. Casi di prova proposti al banco

Il banco non appartiene a questo lavoro. Qui si propongono i casi e si descrivono le tenute che
servono; tutte sono sintetiche e nessuna contiene un nome reale. Le tenute stanno sotto
`scripts/prove/tenute/termini/`, che il controllo esclude dalla scansione ordinaria come già fa
con le altre.

I nomi dei casi sono pensati per essere citati **per porzione stabile** in
`pipeline/collocazione-dei-controlli.tsv`, secondo la regola del `README` di quella cartella.

Le tenute sono descritte per **forma** e non per contenuto letterale, e la ragione è una piccola
dimostrazione di quanto il §1 sostiene: la prima stesura di questa tabella scriveva per esteso i
nomi di host fittizi delle tenute, e **il controllo ha fatto fallire questo stesso documento**. Le
tenute sotto `scripts/prove/` sono escluse dalla scansione ordinaria e possono contenerli; un
documento di progettazione, che sta nel corpus, no. Chi commissiona i casi li sceglie liberamente,
purché siano fittizi e riconoscibili come tali.

| # | Caso | Atteso | Tenuta |
|---|---|---|---|
| 1 | `termini vietati: dominio non ammesso in un documento` | fallisce | un `.md` con un collegamento a un nome di host fittizio sotto una marca nazionale |
| 2 | `termini vietati: dominio non ammesso in un file di configurazione di esempio` | fallisce | un `.yml` con una chiave di estremo il cui valore è una URL su host fittizio |
| 3 | `termini vietati: dominio ammesso dall'elenco, deve passare` | passa | un `.md` che cita due domini presenti nell'elenco di ammissione |
| 4 | `termini vietati: forma societaria accostata a un nome` | fallisce | un `.md` con un nome fittizio seguito da una sigla societaria |
| 5 | `termini vietati: marcatore di marchio su nome non ammesso` | fallisce | un `.md` con un nome di prodotto fittizio seguito dal marcatore |
| 6 | `termini vietati: attribuzione di marchio ammessa, deve passare` | passa | un `.md` con le attribuzioni obbligatorie degli organismi di normazione |
| 7 | `termini vietati: coordinata a dominio inverso con fornitore non ammesso` | fallisce | un `.java` la cui dichiarazione di pacchetto porta un segmento di fornitore fittizio |
| 8 | `termini vietati: tenuta pulita, deve passare` | passa | un `.md` che usa solo categorie generiche e domini ammessi |
| 9 | `termini vietati: termine dell'elenco specifico nella prosa` | fallisce | tenuta 9 + `TERMINI_VIETATI_ELENCO` sull'elenco di esempio |
| 10 | `termini vietati: termine dell'elenco specifico in un commento` | fallisce | uno `.sh` con un segnaposto in un commento, elenco di esempio |
| 11 | `termini vietati: termine dell'elenco specifico in un file di configurazione di esempio` | fallisce | un `.yml` con un segnaposto come valore, elenco di esempio |
| 12 | `termini vietati: strato specifico spento, lo stesso termine passa` | **passa** | la tenuta 9 **senza** `TERMINI_VIETATI_ELENCO` |
| 13 | `termini vietati: parola comune non in elenco, deve passare` | passa | un `.md` di prosa senza nomi propri, elenco di esempio |
| 14 | `termini vietati: elenco senza sale, errore di configurazione` | fallisce | copia dell'elenco di esempio senza la riga del sale |
| 15 | `termini vietati: elenco con sale cambiato e canarino assente` | fallisce | copia dell'elenco di esempio con il sale sostituito |
| 16 | `termini vietati: elenco privo di impronte` | fallisce | copia dell'elenco di esempio con le sole righe di commento |
| 17 | `termini vietati: dominio non ammesso in un messaggio di commit` | fallisce | deposito git sintetico temporaneo, `TERMINI_VIETATI_COMMIT` su un intervallo |
| 18 | `termini vietati: radice da esaminare inesistente` | fallisce | nessuna tenuta, `RADICE_SORGENTI` su un percorso assente |

I casi 12 e 13 sono i più importanti del gruppo e vanno commissionati insieme agli altri, non
dopo. Il 12 **dimostra la lacuna dichiarata**: lo stesso file che con l'elenco fa fallire il
controllo, senza elenco passa. Un banco che non contenesse quel caso lascerebbe credere che il
verde significhi sempre la stessa cosa. Il 13 dimostra che lo strato specifico non segnala a caso,
che è la condizione perché resti acceso.

I casi 14, 15 e 16 provano che il controllo **si rifiuta di girare a vuoto**. Sono la prova
negativa del canarino, e senza di essi il meccanismo di coerenza è una dichiarazione.

Tutti i casi sono stati eseguiti a mano su tenute equivalenti durante la messa a punto e si
comportano come atteso; il banco li deve rendere ripetibili, non scoprirli.

---

## 9. La riga per `pipeline/collocazione-dei-controlli.tsv`

Campo per campo, da inserire da chi possiede quel file.

| Colonna | Valore |
|---|---|
| `controllo` | `G11` |
| `nome` | `Regola di riservatezza R0 - termini vietati` |
| `fascia` | `rapida` |
| `stato` | `segnalazione` |
| `bloccante_dal` | vuoto: **`G11` è bloccante dal 27 agosto 2026**, anticipato di trenta giorni. Vedi il paragrafo in calce a questa sezione |
| `criterio` | `T-03/2` |
| `eseguibile` | `scripts/verifica-termini-vietati.sh` |
| `prova_negativa` | `termini vietati: dominio non ammesso in un documento` \| `termini vietati: dominio non ammesso in un file di configurazione di esempio` \| `termini vietati: forma societaria accostata a un nome` \| `termini vietati: marcatore di marchio su nome non ammesso` \| `termini vietati: coordinata a dominio inverso con fornitore non ammesso` \| `termini vietati: termine dell'elenco specifico nella prosa` \| `termini vietati: termine dell'elenco specifico in un commento` \| `termini vietati: elenco con sale cambiato e canarino assente` \| `termini vietati: dominio non ammesso in un messaggio di commit` |
| `motivo_collocazione` | Obbligatorio del §3 di `01_technical/09` e del §9.2 di `10_fondamenti/17`. Sta nella **fascia rapida** per la stessa ragione di `G1` e di `G10` e non per il costo, che pure è di un secondo e tre decimi: la proprietà che presidia è **irrecuperabile** - un nome pubblicato in un repository pubblico è stato clonato, indicizzato e archiviato prima che qualcuno lo tolga, e la storia lo conserva anche dopo la rimozione dal ramo. Entra in **segnalazione con data** e non subito bloccante perché al 26 agosto 2026 gli appunti di ricerca sotto `.telemedic/` producono centodiciotto rilievi che **nessun contributore può correggere**: sono una decisione del committente (§7), non un difetto. Renderlo bloccante prima di quella decisione produrrebbe un cancello sempre rosso, che è la forma in cui un cancello smette di essere letto - lo stesso rischio già registrato in `Q-288`. La data del 26 settembre 2026 non era arbitraria: era il termine del criterio 2 di `T-03`, e quindi anche il termine entro cui la decisione del §7 andava presa. **La decisione è arrivata prima**, ed è quella del §7: `R0` non si applica a `.telemedic/`, che è contesto di lavoro interno e non artefatto pubblicato. |

Va notato che la regola 3 del `README` di quella cartella rende la prova negativa **esigibile dal
giorno di `bloccante_dal`**: qui la colonna è compilata subito, quindi la regola è soddisfatta in
anticipo e non ci sono debiti nascosti dietro la data.

**27 agosto 2026 - `G11` diventa bloccante, trenta giorni prima della data dichiarata.** Non è un
irrigidimento della regola: è la conseguenza aritmetica della decisione del §7. Escluso
`.telemedic/` dal perimetro, i rilievi sono passati da centoventiquattro a **sei**, su tre file, e
letti uno per uno erano **tutti e sei legittimi**: `rekor.sigstore.dev` e `fulcio.sigstore.dev`,
che la procedura di verifica dell'artefatto deve nominare per essere eseguibile da chi installa, e
`slsa.dev`, il sito della specifica citata dallo script di firma. Nessuno dei tre è un rapporto
commerciale, e tutti e tre sono ora in `pipeline/termini-ammessi.tsv` con il motivo scritto riga
per riga - che è il luogo dove le eccezioni passano in revisione invece di sparire.

Il settimo rilievo non era un'ammissione da concedere ma un errore da correggere:
`docs/02_architecture/06-eventi-e-integrazione-interna.md` usava `esempio.invalido` in un esempio
JSON. **`.invalido` non è un dominio riservato**; `.invalid` lo è, per la RFC 2606, e il gemello
inglese usava già la forma corretta. Ammetterlo avrebbe reso permanente un difetto di un carattere.

**Perché anticipare invece di aspettare.** A zero rilievi la sola segnalazione non compra nulla e
costa la certezza. Un controllo che segnala e non blocca accumula rilievi fino al giorno in cui
diventa bloccante, e quel giorno arriva sempre mentre l'attenzione è altrove - è il rischio
registrato in `Q-288`, letto nella direzione opposta. La proprietà che `G11` presidia resta
irrecuperabile: un nome pubblicato è stato clonato, indicizzato e archiviato prima che qualcuno lo
tolga.

**Che cosa questo non chiude.** Lo strato **specifico** resta spento, perché la lista dei termini
per impronta vive fuori dal repository e nessuno ha ancora dichiarato se esista. Il controllo lo
dichiara da sé a ogni esecuzione, verde o rosso che sia, e un verde dello strato strutturale non
dice che non ci siano nomi privi di forma commerciale riconoscibile. Restano fuori anche i
**messaggi di commit**, che `R0` nomina esplicitamente.

**Riga da aggiungere a `.gitignore`**, come rete contro l'incidente più probabile - il file
dell'elenco copiato dentro l'albero di lavoro e aggiunto senza guardare:

    # Elenco dei termini vietati di G11: non entra mai nel repository (vedi .telemedic/piani/G11-regola-di-riservatezza.md)
    termini-vietati.tsv

Il file di esempio si chiama `termini-vietati.esempio.tsv` e non corrisponde a quel modello, quindi
resta versionato.

**Passo nel flusso di lavoro**: il controllo va invocato senza argomenti nella fascia rapida. Lo
strato specifico si accende impostando `TERMINI_VIETATI_ELENCO` su un file materializzato da un
segreto della piattaforma; `TERMINI_VIETATI_COMMIT` va impostata sull'intervallo della proposta di
modifica. Entrambe sono facoltative e la loro assenza è dichiarata dal controllo stesso.

---

## 10. La questione che resta al committente

Ne restano tre, e la prima è quella che `Q-286` chiedeva.

**Prima - chi compila la lista, e la lista esiste?** Il §6 stabilisce che possa compilarla solo il
committente, perché il criterio di inserimento è la conoscenza di un rapporto che non appartiene a
chi contribuisce. Resta da sapere se **oggi ci sia qualcosa da metterci**. Se la risposta è no, va
detto e datato: lo strato specifico resterebbe spento non per difetto tecnico ma perché non ha
oggetto, e il controllo continuerebbe a dichiararlo a ogni esecuzione. Se la risposta è sì, va
deciso **dove vive il file** e come arriva alla catena, e questo determina se lo strato specifico
possa girare sulle proposte che arrivano da una diramazione - vedi il punto `[NV]` del §2.4.

**Seconda - gli appunti di ricerca.** Centodiciotto rilievi, tutti citazioni di fonti, alcune
delle quali sono studi legali e società di consulenza regolatoria. Tre vie, nel §7, con costi
diversi e nessuna preferibile a priori. È la decisione che sblocca la data del 26 settembre.

**Terza - la sezione 5 dell'elenco di ammissione.** Contiene la piattaforma su cui il repository è
ospitato, il registro pubblico da cui si scaricano le dipendenze, le fonti tecniche dei fornitori
di navigatore e le piattaforme di finanziamento citate fra le opzioni di sostegno. Sono tutti
soggetti commerciali. Chi ha scritto questo controllo li ha ammessi in via provvisoria, motivandoli
uno per uno, e ha marcato la sezione come **proposta**: la decisione se `R0` li riguardi non spetta
a chi scrive un controllo. Se la risposta è che li riguarda, quelle righe si tolgono e le citazioni
si riformulano - e va messo in conto che senza di esse il `README`, il `publiccode.yml` e il
capitolo sulla catena di costruzione vanno riscritti in forma generica.
