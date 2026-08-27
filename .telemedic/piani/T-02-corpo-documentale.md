# Piano di lavoro - `T-02`, corpo documentale al minimo prerequisito

> **Traguardo** `T-02` · **Classe** `D`, con una componente `A` · `[IMPEGNO]` · **10 ottobre 2026**
> **Innesco** - chiusura di `T-01`, che fornisce il controllo dei documenti sotto cui il residuo nasce.
> **Titolare** - contributore unico.
> **Fonte dei criteri** - `docs/09_roadmap/02-traguardi.md`, sezione `T-02`. Questo piano non li
> riscrive e non li interpreta più largamente di come sono scritti: dove una lettura è necessaria,
> la dichiara come lettura e ne indica la conseguenza sull'alternativa.
> **Data di misura dello stato** - 27 agosto 2026, sul ramo `main`, su un commit successivo a
> `b3498b7` (hash non verificato in questa misura: nessun accesso a un interprete di comandi
> nell'ambiente di misura). Il corpo del piano che segue descrive ancora la fotografia del 26
> agosto e resta la previsione da cui si impara: la sezione seguente la confronta con l'esito
> misurato il giorno dopo, senza sostituirla.

## Misura dello stato al 27 agosto 2026

Misura eseguita su richiesta del coordinatore, in sola lettura sul repository. **Limite dichiarato
della misura**: l'ambiente di misura non dava accesso a un interprete di comandi, quindi dove la
verifica avrebbe richiesto un'esecuzione - `npm run build`, `wc -w`, uno script di `scripts/` - non
è stata eseguita di persona: la conclusione si fonda sulla lettura diretta dei file di
configurazione e sulla documentazione datata del 26 e del 27 agosto, incrociata fra più fonti, e
questo è detto ovunque conti invece di presentare una deduzione come un'esecuzione.

| Criterio | Stato che questo piano registrava (26 agosto) | Stato misurato il 27 agosto | La misura |
|---|---|---|---|
| 1 - glossario bilingue | Soddisfatto | **Soddisfatto, invariato** | I due file esistono in posizione speculare; `V-07-ter` registra la revisione incrociata del glossario |
| 2 - zero collegamenti rotti | Non soddisfatto | **Soddisfatto in gran parte, con riserva** | `website/docusaurus.config.mjs` porta oggi `onBrokenLinks`, `onBrokenAnchors` e `onBrokenMarkdownLinks` a `throw`; la riga `G9` di `pipeline/collocazione-dei-controlli.tsv` registra la bonifica di ottantotto collegamenti e quarantaquattro ancore il 26 agosto. Costruzione non rieseguita da chi misura |
| 3 - `[NV]` con destinatario | Non soddisfatto | **Non soddisfatto, invariato** | Quattrocentonovantotto occorrenze su novantasei file (erano quattrocentosettanta su novantuno); nessun controllo in `scripts/` |
| 4 - bacheca senza `APERTA` orfane | Non misurato in forma binaria | **Non soddisfatto, invariato nella sostanza** | Centoventitré righe `Q-*`; le voci in stato `APERTA` si contano fra settantatré e ottantasette a seconda della forma della riga, il che è già il sintomo di un criterio verificato a vista. Nessun controllo esiste |
| 5 - conteggio delle parole | Soddisfatto | **Soddisfatto, ma disallineato** | Il conteggio registrato (centoquarantaquattro file in `docs/`) è ora superato: `docs/**/*.md` ne conta oggi centocinquantaquattro |
| 6 - lista dei termini vietati (`R0`) | Non soddisfatto, componente `A` | **In parte** | Lo strato strutturale del controllo `G11` è bloccante dal 27 agosto, con zero rilievi fuori da `.telemedic/`; lo strato specifico - l'elenco vero e proprio - resta spento, in attesa di una decisione del committente |
| 7 - rinvii conformità in collegamenti | Parzialmente misurato | **Non soddisfatto, invariato** | Letto per intero lo script: nessun controllo sui rinvii testuali esiste ancora |

**Criterio 2, la riserva che resta aperta.** Il controllo blocca davvero - lo dice la configurazione
del sito letta direttamente, non una dichiarazione altrove - e la bonifica di collegamenti e
ancore è registrata con data nella riga `G9` della tabella di collocazione. Manca però il caso
automatico nel banco `scripts/prove/esegui-prove.sh`: la prova negativa - collegamento rotto
introdotto, costruzione che fallisce, collegamento tolto, costruzione che torna a passare - è
stata eseguita a mano una sola volta e non è ripetibile da chi non la rifà a mano. È la terza
istanza del problema già registrato in `Q-288`. Il lavoro residuo è di poche ore: scrivere il caso
nel banco, non riprogettare il controllo.

**Criterio 3, che cosa manca esattamente.** Mancano tutti e tre gli elementi che questo piano
elencava il 26 agosto: una forma dichiarata del destinatario - le occorrenze, cresciute nel
frattempo, portano il destinatario in prosa non uniforme -, il controllo che ne accerti l'assenza
e la sua prova negativa e simmetrica, e il rapporto pubblicato. Nessuno dei tre esiste in
`scripts/`. Il lavoro residuo è, in ordine: la decisione sulla forma, il controllo, poi la
bonifica della partizione priva di destinatario, la cui dimensione resta ignota finché il
controllo non gira una prima volta. Complessivamente, fra due e quattro giornate di lavoro.

**Criterio 4, che cosa manca esattamente.** Nessun controllo legge la bacheca a colonne, e la
misura stessa lo dimostra: due criteri di ricerca diversi sulle stesse centoventitré righe `Q-*`
restituiscono conteggi diversi di voci `APERTA`, a seconda che si accetti o no una forma marcata
dello stato - è esattamente il sintomo di un criterio verificato a vista. Manca inoltre la
definizione operativa di «area chiusa», da cui dipende se la nota obbligatoria vada scritta su
tutte le voci `APERTA` o su un sottoinsieme: è una decisione di `ORCH`, con un tempo di
attraversamento proprio, e va posta prima di scrivere il controllo. Il lavoro residuo è, in
ordine: la decisione, il controllo con la sua prova negativa su tenuta sintetica, e infine la
bonifica delle righe prive di nota, non parallelizzabile per la regola sui file di contesto
condivisi. Complessivamente, fra due e quattro giornate, in gran parte condizionate dalla
decisione preliminare.

**Criterio 5, il disallineamento da riconciliare.** Il criterio come scritto chiede che il
conteggio sia eseguito e registrato, non che resti aggiornato in permanenza, e sotto quella
lettura resta soddisfatto. Ma il numero di file su cui poggia è già superato di dieci unità: il
corpus è cresciuto in un solo giorno, verosimilmente per il lavoro di `T-14`. Non è lavoro
residuo di `T-02` in senso proprio, ma un secondo conteggio prima della chiusura del traguardo è
opportuno, perché quel numero determina il piano di `T-06`.

**Criterio 6, il residuo dopo il progresso del 27 agosto.** Lo strato strutturale del controllo
`G11` esiste, è versionato in `pipeline/termini-ammessi.tsv` come elenco di ammissione ed è
bloccante da oggi, con zero rilievi fuori dal contesto di lavoro interno escluso per decisione del
committente. Ciò che il criterio chiede alla lettera - una lista dei termini vietati, definita e
versionata - non esiste ancora nella forma propria: lo strato specifico a impronte resta spento, e
la decisione se attivarlo, e come distribuire l'elenco e il sale fuori dal repository, è del
committente. Anche i messaggi di commit, che `R0` nomina esplicitamente, non sono ancora
esaminati. Il lavoro di scrittura è già fatto; il residuo è quasi interamente la decisione, poi
poche ore per collegarla.

**Criterio 7, che cosa manca esattamente.** Lo script `scripts/verifica-conformita-redazionale.sh`
è stato letto per intero: implementa tre controlli - frontmatter non quotato, rinvii relativi che
escono da `docs/`, segnaposto di segreti - e nessuno riguarda i rinvii testuali all'area di
conformità. Le sessantuno occorrenze restano da partizionare fra collegamento e testo nudo, e la
partizione non è nota. È il lavoro più piccolo dei quattro ancora aperti: mezza giornata per
l'estensione dello script con la sua prova negativa, poi la conversione dei riscontri, con
l'attenzione già nota a non introdurre percorsi relativi che escano da `docs/` verso i documenti
di radice.

## Avanzamento della sera del 27 agosto 2026

La misura riportata sopra è stata redatta al mattino, in sola lettura e **senza accesso a un
interprete di comandi**. Quattro dei sette criteri si sono mossi nel corso della stessa giornata, e
riscrivere la misura del mattino ne cancellerebbe il ragionamento: questa sezione la aggiorna senza
toccarla, come si è già fatto per `T-07`.

| Criterio | Stato al mattino | Stato la sera | Che cosa è cambiato |
|---|---|---|---|
| 3 - `[NV]` con destinatario | Non soddisfatto, mancano tutti e tre gli elementi | **Non soddisfatto, ma i tre elementi esistono** | La forma dichiarata, il controllo `NV-C1`, il rapporto pubblicato. Le marcature prive di destinatario riconoscibile scendono da **372 a 47** |
| 4 - bacheca senza `APERTA` orfane | Non soddisfatto, manca anche la decisione preliminare | **Prima metà soddisfatta e presidiata, seconda metà presidiata con data** | La decisione su «area chiusa» è presa e versionata; `BAC-C1` verifica ora entrambe le metà |
| 6 - lista dei termini vietati | In parte, strato specifico spento | **Invariato** | Resta una decisione del committente |
| 7 - rinvii in collegamenti | Non soddisfatto, nessun controllo esiste | **Soddisfatto** | 182 rinvii convertiti in due lingue, presidiati da `RT-C1` |

### Criterio 3 - i tre elementi mancanti ora ci sono, e il residuo ha cambiato natura

**La forma dichiarata.** Era il primo dei tre elementi e il più trascurato, perché senza di essa
«privo di destinatario» non è accertabile e il criterio non è binario. È ora in
`CONTRIBUTING.md`, sezione «Come si marca un'affermazione non verificata», con tre forme ammesse e
nessun'altra: sigla d'area fra apici inversi, identificativo `Q-nnn` di una questione **esistente**,
soggetto esterno nominato con formula esplicita. La sezione dice anche la cosa che conta più delle
tre forme: **se nessuna area può chiuderla e nessuna questione la copre, si apre una questione, non
si sceglie un destinatario perché il controllo diventi verde.** Il rinvio è in `09_roadmap/00-indice.md`
§11, in entrambe le lingue.

**Il controllo e il rapporto.** `NV-C1` esiste, è in sola misura fino al 10 ottobre - la scadenza
del criterio stesso - ed **è** il rapporto pubblicato che la seconda metà del criterio chiede: la
fascia completa lo conserva come artefatto con novanta giorni di ritenzione.

**Che cosa la bonifica ha insegnato, e non era previsto dal piano.** Il piano dichiarava che il
costo dipende da quanto grande sia la minoranza priva di destinatario, e che quel numero **non è
noto finché il controllo non gira**. Ha girato, e il numero era 372 su 503. La serata ne ha chiuse
oltre trecento in entrambe le lingue. Ma il residuo non è il resto della stessa cosa: sono le
marcature che tre passate successive hanno lasciato indietro, cioè quelle per cui **il destinatario
ovvio non esiste**. Ciascuna di esse è una decisione di attribuzione, e per alcune l'esito onesto
sarà una voce di bacheca invece di una riga bonificata - esattamente come il piano prevedeva, ma per
una frazione del corpus molto più piccola di quanto il numero 372 lasciasse temere.

**Un difetto di metodo, registrato perché non si ripeta.** Due passate su sette hanno attribuito
un'intera area alla stessa sigla con la stessa formula - ventisei volte «da verificare da `COMP`» in
un capitolo della guida dei fondamenti. Un'attribuzione uniforme non è una decisione di
attribuzione: è un timbro, e ha l'aspetto di una responsabilità assegnata senza esserlo. È stato
corretto rimandando indietro il lavoro, e il mandato porta ora l'avvertenza in testa.

**Un limite del controllo, trovato e corretto.** Quattordici occorrenze su cinquecento non sono
marcature poste ma marcature **nominate**: «chiude il `[NV]` che quest'area portava» parla *di* una
marcatura e non ne pone una. Non potranno mai ricevere un destinatario, quindi sarebbero rimaste
rilievi per sempre e il criterio non si sarebbe chiuso nemmeno con il corpus interamente bonificato.
La distinzione è di forma - una marcatura posta non è mai preceduta da un articolo - ed è ora
presidiata, con due casi di banco: quello che la riconosce e quello che verifica che una marcatura
posta **accanto** a una citazione resti visibile.

### Criterio 4 - la decisione preliminare è presa, e ha reso il criterio più oneroso

Il piano aveva individuato correttamente il punto: la seconda metà del criterio presuppone che sia
definito **che cosa sia un'area chiusa**, e da quella definizione dipende se la nota vada su tutte
le voci aperte o su un sottoinsieme. La decisione è presa il 27 agosto ed è versionata nel
protocollo della bacheca. **Si adotta la lettura letterale**: `09_roadmap/00-indice.md` §4 dichiara
complete o scritte tutte e dodici le aree, quindi ogni voce `APERTA` è indirizzata a un'area chiusa
e la nota riguarda tutte e ottantacinque.

La ragione per cui si è scelta la lettura onerosa va scritta, perché la scelta opposta era
disponibile e comoda: una definizione più stretta di «area chiusa» **non esiste in nessuna fonte
versionata del repository**, e inventarla adesso avrebbe ridotto il lavoro ridefinendo il criterio
invece di soddisfarlo.

La **forma della nota** è dichiarata insieme alla decisione: nella colonna dello stato, la formula
`**Resta aperta perché**:` seguita da una ragione di uno di tre tipi - attende una decisione, e di
chi; attende un lavoro datato, e quale traguardo; attende un fatto esterno, e chi lo produce. Il
controllo verifica che la formula ci sia e che dietro non ci sia il vuoto, e **dichiara di non poter
verificare che la ragione sia vera**: una nota che dica «attende una decisione» quando nessuno ha
chiesto nulla a nessuno supera il controllo. È per questo che i tre tipi sono fissati invece di
lasciare il campo libero.

Oggi le voci annotate sono **zero su ottantacinque**. È il caso opposto a quello della prima metà:
un presidio che arriva **prima** della disciplina, quindi con un debito, quindi con una data - il 10
ottobre, come impone il criterio 4 di `T-03` a ogni controllo in sola segnalazione.

### Che cosa resta, in ordine

1. **La bonifica delle ottantacinque note di bacheca.** Non parallelizzabile: la bacheca è un file
   di contesto condiviso e il runbook di traduzione §9.1 vieta di darla in scrittura a più agenti.
2. **Il residuo del criterio 3**, e per ciascuna marcatura residua la scelta fra un destinatario
   onesto e una voce di bacheca.
3. **Il criterio 6**, che attende una decisione del committente e non un lavoro.
4. **Il caso di banco del criterio 2**, la riserva già dichiarata: collegamento rotto introdotto,
   costruzione che fallisce, collegamento tolto, costruzione che torna a passare. È la terza istanza
   di `Q-288`.

---

## 0. Che cos'è questo piano, e che cosa non è

È l'esecuzione di `T-02`, non la sua rinegoziazione. I criteri sono binari e restano quelli. Ciò
che questo piano aggiunge è di tre tipi soltanto: **lo stato misurato** di ciascun criterio sul
repository invece che dedotto dai documenti; **la prova osservabile** con cui ciascun criterio si
dichiara soddisfatto, perché un criterio senza una procedura che possa dare esito negativo non è
binario ma soltanto scritto in forma binaria; e **la sequenza**, che è l'unica variabile che il
piano governa davvero.

Le date restano ciò che sono nella roadmap: **allocazioni del calendario residuo**, non stime. Il
diagramma di `02-traguardi.md` §7 alloca a `T-02` la finestra **26 settembre - 10 ottobre 2026**.
Questa finestra **non è esclusiva**: nello stesso periodo il diagramma alloca `T-04` (26 settembre
- 3 ottobre), `T-05` (fino al 3 ottobre) e l'avvio di `T-08` (dal 3 ottobre), tutti al medesimo
contributore unico. Chi legge la finestra come se fosse dedicata a `T-02` legge male, e il piano lo
dice qui perché è la prima causa per cui un traguardo di classe `D` scivola senza che nessuno se ne
accorga: non è stato compresso, è stato sovrapposto.

## 1. La componente di classe `A`, e perché si tratta per prima

Il titolo del traguardo dichiara *«classe `D`, con una componente `A`»*, ma **non dice quale dei
sette criteri la porti**. È una lacuna del documento di origine e va segnalata: `[NV]` sulla
attribuzione, che questo piano deduce dalle definizioni date dalla roadmap stessa e non da una
riga che la contenga.

La classe `A` designa, per `01 §2` e per il preambolo di `T-01`, ciò il cui **costo di omissione
non si paga in ritardo ma in impossibilità**. Applicando quella definizione ai sette criteri, i
candidati sono due e uno solo resta aperto.

**Candidato primo - il criterio 1, il glossario.** La roadmap ne argomenta essa stessa la natura:
*«è lo strumento che tiene ferma la terminologia della traduzione, e tradurre venti moduli senza di
esso significa produrre venti traduzioni terminologicamente indipendenti»*. È la forma esatta
dell'irrecuperabilità: il costo non è il ritardo del glossario, è la ritraduzione di ciò che è già
stato tradotto senza. **Misurato, questo criterio è però già soddisfatto** (§2.1), e la finestra di
esposizione è chiusa: la traduzione delle quattro aree è avvenuta con il glossario in essere.

**Candidato secondo - il criterio 6, la lista dei termini vietati che alimenta il controllo della
regola `R0`.** `R0` è un **divieto pubblico**: vieta che un nome di azienda, marchio, prodotto
commerciale o dominio di un potenziale partner compaia in un documento, in un commit, in una issue,
in una proposta di modifica o in un file prodotto (`.telemedic/context/00_PROJECT_BRIEF.md` §6 e
§8). Il criterio di appartenenza al sottoinsieme bloccante enunciato in `T-03` - *«blocca da subito
ogni controllo che presidi una proprietà irrecuperabile o un divieto pubblico»* - colloca quindi il
criterio 6 nella stessa famiglia. La ragione dell'irrecuperabilità è la medesima di `R-19` e di
`Q-185`: **un periodo di pubblicazione non si annulla**. Un nome pubblicato in un repository
pubblico è stato clonato, indicizzato e archiviato prima che qualcuno lo tolga, e la storia di git
lo conserva anche dopo la rimozione dal ramo.

**Conclusione operativa.** La componente `A` ancora aperta al 26 agosto 2026 è il **criterio 6**, e
va per prima. Il criterio 1 è chiuso e non si ripianifica.

### 1.1 La difficoltà propria del criterio 6, che il testo del criterio non mostra

Il criterio chiede una **lista dei termini vietati definita e versionata**. Versionarla in chiaro
in questo repository significa **scrivere nel repository pubblico esattamente i nomi che `R0`
vieta di scrivervi**: il controllo commetterebbe, per esistere, la violazione che esiste per
impedire. Non è un cavillo. `.gitignore` esclude `node_modules/`, gli artefatti di costruzione del
sito, i file di sistema e i registri locali: **non esclude `.telemedic/`**, quindi non esiste in
questo repository un luogo versionato e non pubblico dove la lista possa stare in chiaro.

Le forme praticabili sono tre e nessuna è gratuita. Vanno poste al committente **prima** di
scrivere il controllo, perché determinano che cosa il controllo è.

**Forma per impronte.** Si versiona l'impronta di ciascun termine normalizzato, non il termine. Il
controllo normalizza i candidati trovati nel corpus e confronta le impronte. *Costo dichiarato*: il
controllo non può più cercare stringhe note, deve **enumerare candidati** - parole con iniziale
maiuscola in posizione di fornitore, nomi di dominio, marcatori di marchio - e i falsi positivi
sono certi, quindi serve una lista di ammissione dei nomi propri leciti, che invece è versionabile
in chiaro perché contiene solo ciò che è permesso. *Debolezza da dichiarare, non da nascondere*:
l'impronta di un nome commerciale breve si ricostruisce per tentativi in tempo trascurabile. Un
sale renderebbe l'impronta opaca ma andrebbe tenuto fuori dal repository, e allora il controllo non
è più eseguibile da chi non ha il sale.

**Forma strutturale, senza lista di termini.** Il controllo non cerca nomi: cerca la **forma** di
una violazione - nomi di dominio fuori da una lista di ammissione, i marcatori `®` e `™`, sigle
commerciali in posizione di fornitore - e non contiene alcun nome vietato. *Vantaggio*: nessun
segreto, versionabile in chiaro, eseguibile da chiunque, coerente con la disposizione che il
progetto ha già preso altrove (`verifica-dichiarazione-non-marcatura.sh` è deliberatamente fondato
su elementi strutturali e non su una frase). *Debolezza da dichiarare*: non intercetta un nome
commerciale che abbia la forma di una parola comune, e questa classe di violazione resta scoperta.
*Osservazione*: questa forma **non soddisfa il criterio come è scritto**, perché il criterio esige
una lista di termini. O si adotta insieme alla forma per impronte, o il criterio va emendato con la
procedura ordinaria - e un emendamento di criterio è una riduzione di ambito, quindi si registra.

**Forma con lista fuori dal repository.** La lista vive in un segreto di ambiente e il controllo la
riceve in esecuzione. *Debolezza da dichiarare*: il controllo non è più riproducibile da chi
installa né da un contributore esterno, e il progetto ha una disposizione contraria esplicita
(`T-03` criterio 8, «eseguibile da chiunque», riferito ad altra procedura ma indicativo della
direzione).

**Che cosa questo piano fa, e che cosa non fa.** Pone la questione; **non la decide** e **non le
assegna un identificativo**, perché gli intervalli di numerazione della bacheca sono riservati per
area (`05_BACHECA_INTERAGENTI.md`, regole di scrittura) e un numero assegnato qui collide con
quello che l'area competente assegnerà. La voce va aperta dall'area che la pone, indirizzata a
`ORCH`, con punto di decisione **non oltre il 26 settembre 2026**: è la data in cui il lavoro sul
criterio 6 comincia, e una decisione che arriva dopo l'inizio costringe a riscrivere il controllo
invece che a scriverlo.

## 2. I sette criteri, uno per uno

Per ciascuno: **che cosa esiste** al 26 agosto 2026, misurato sul repository; **che cosa manca**;
**come si dimostra** che il criterio è soddisfatto, in forma binaria e osservabile da chiunque
riesegua la procedura.

### 2.1 Criterio 1 - modulo di glossario, bilingue, con i rinvii incrociati · **SODDISFATTO**

**Che cosa esiste.** `docs/10_fondamenti/19-glossario.md` esiste ed è il modulo di glossario della
guida dei fondamenti. La sua traduzione esiste in posizione speculare:
`website/i18n/en/docusaurus-plugin-content-docs/current/10_fondamenti/19-glossario.md`. Il modulo
dichiara nella propria descrizione di raccogliere i termini «in italiano e in inglese» e dichiara al
§1 la regola dei rinvii: *«Il glossario rinvia, non ripete»*, con puntatore al modulo o all'area in
cui il concetto è trattato per esteso, e con rinvio esplicito al glossario del dominio
(`../05_domain/09-glossario-del-dominio.md`) per la parte di modellazione. La revisione incrociata
del glossario è stata eseguita e registrata come vincolo `V-07-ter` nella bacheca inter-agenti, con
dodici segnalazioni di cui nove reali e corrette e tre registrate come non-problemi perché non
vengano riaperte; fra i tre, la constatazione che *«i rinvii interni del glossario sono tutti
risolti, verificato automaticamente»*.

**Che cosa manca.** Nulla che il criterio chieda.

**Come si dimostra.** Tre accertamenti, tutti a esito binario:

1. i due file esistono e nessuno dei due contiene il marcatore di continuazione
   (`grep -rn "CONT-->" website/i18n/en/` non li nomina, secondo il §7.1 del runbook di traduzione);
2. il rapporto di ampiezza fra la resa inglese e l'originale è entro il ±15 % (`wc -w` sui due
   file), che è la soglia con cui il progetto intercetta un riassunto spacciato per traduzione
   (`RUNBOOK-TRADUZIONE-EN.md` §7.2);
3. nessun rinvio interno del glossario è rotto - accertamento che **non si esegue a vista** ma
   ricade nel criterio 2 e nel controllo bloccante sui collegamenti.

**Conseguenza sulla pianificazione.** Il criterio è chiuso; **non entra nella sequenza** e non
consuma allocazione. L'unica cosa che resta è **non farlo regredire**: ogni ondata di traduzione
successiva attinge al glossario e vi riversa le nuove rese (`RUNBOOK-TRADUZIONE-EN.md` §7.5), e una
resa aggiunta in `GLOSSARIO-TRADUZIONE-EN.md` e non riversata nel modulo 19 è la forma in cui questo
criterio si riapre in silenzio.

### 2.2 Criterio 2 - zero collegamenti interni rotti in tutto il corpus · **SODDISFATTO IN GRAN PARTE il 27 agosto, con riserva** (era: NON SODDISFATTO)

**Che cosa esiste.** La costruzione del sito passa con uscita 0 e riporta **tre ancore rotte** e
**quarantasei collegamenti rotti**, dei quali **quarantadue nella locale inglese**. I quarantadue
sono pagine tradotte che rinviano ad aree non ancora tradotte e si chiudono traducendo quelle aree.
La costruzione passa perché `website/docusaurus.config.mjs` dichiara `onBrokenLinks: 'warn'`,
`onBrokenAnchors: 'warn'`, `onBrokenMarkdownLinks: 'warn'` e `onDuplicateRoutes: 'warn'`, con il
commento che spiega la scelta: *«Un collegamento rotto va visto, non deve fermare la pubblicazione:
il controllo si irrigidisce quando le aree sono complete.»*

> **Nota di provenienza dei numeri.** Le tre ancore e i quarantasei collegamenti sono presi dal
> mandato di questo piano e dal contesto di lavoro; **non sono stati riprodotti da un'esecuzione
> compiuta nella stesura di questo piano**. Si riproducono con `cd website && npm ci && npm run
> build`, leggendo il rapporto di costruzione. Chi esegue il criterio riproduce i numeri prima di
> lavorarci: un residuo si misura, non si eredita.

**Che cosa manca, e la lettura che va fissata prima di cominciare.** Il criterio dice *«zero
collegamenti interni rotti in tutto il corpus»*. **Che cosa sia «il corpus» è determinante** e la
roadmap lo definisce altrove in modo non ambiguo: `00-indice.md` §4 misura il corpus in 875.748
parole, di cui **860.718 in `docs/`** su dodici aree e più 15.030 nei nove documenti alla radice del
repository. Il corpus è quindi **l'italiano più i documenti di radice**; la locale inglese non è il
corpus, è la sua traduzione, e la sua completezza è materia di `T-06` e `T-09` - cosa che `T-02`
dichiara esplicitamente fra ciò che non comprende.

Sotto questa lettura il residuo di `T-02` sono i **quattro collegamenti non inglesi** e le **tre
ancore**, ed è chiudibile entro il 10 ottobre. Sotto la lettura opposta - «corpus» come tutto ciò
che il sito pubblica, entrambe le locali - `T-02` diventa **dipendente da `T-06`**, che è allocato
al 21 novembre, e **la sua data cade per costruzione**. La lettura va quindi fissata dal committente
**adesso**, non a ottobre: la regola 2 del §6.1 di `03-primo-rilascio-utilizzabile.md` vieta di
decidere sotto pressione di calendario, e questa è esattamente una decisione che diventerebbe
obbligata sotto pressione.

**Come si dimostra.** Il criterio dice *«verificato dal controllo bloccante di `T-03`, e non a
vista»*, e questa clausola è vincolante: la dimostrazione non è la lettura del rapporto di
costruzione ma il fatto che **una costruzione con un collegamento rotto fallisca**. Ne discende che
il criterio 2 di `T-02` **non si chiude senza** che il controllo sui collegamenti sia bloccante, il
che è criterio 2 di `T-03` ed è il medesimo oggetto del criterio 1 di `T-07`. Tre traguardi
insistono sullo stesso interruttore. La prova è quindi doppia:

1. **prova positiva** - la costruzione del corpus passa con l'irrigidimento attivo;
2. **prova negativa** - si introduce deliberatamente un collegamento verso un documento inesistente
   e **la costruzione deve fallire**. Se passa, l'irrigidimento non è attivo dove si crede.

Il precedente per la forma della prova negativa è `scripts/prove/esegui-prove.sh`: ogni caso
«deve fallire» fa fallire la prova se il controllo passa. Il caso va aggiunto lì, non altrove: un
banco di prova secondo si diverge dal primo.

### 2.3 Criterio 3 - zero occorrenze di `[NV]` prive di destinatario dichiarato · **NON SODDISFATTO**

**Che cosa esiste, misurato.** `[NV]` compare **470 volte su 91 file** sotto `docs/`. Le
concentrazioni più alte sono in `08_compliance/01-inquadramento-normativo.md` (20),
`10_fondamenti/01-sistema-sanitario-italiano.md` (20), `10_fondamenti/08-webrtc-da-zero.md` (18),
`10_fondamenti/17-ambiente-di-sviluppo.md` (17), `10_fondamenti/10-percorsi-di-cura-e-sicurezza.md`
(16), `10_fondamenti/09-fondamenti-clinici.md` (15), `10_fondamenti/11-fondamenti-informatici.md`
(15), `08_compliance/04-fascicolo-tecnico.md` (12), `10_fondamenti/13-protocolli.md` (12),
`10_fondamenti/04-identita-e-anagrafiche.md` (12).

`01-principi-e-metodo.md` §8 registra già la condizione come nota: *«Numerosi `[NV]` aperti nelle
aree già scritte, ciascuno con destinatario dichiarato»*, con risposta «le aree destinatarie». La
convenzione è enunciata in `00-indice.md` §11: *«`[NV]` marca un'affermazione non verificata, con
l'indicazione di chi deve chiuderla»*.

**Che cosa manca.** Tre cose distinte, e confonderle è il modo di sottostimare il criterio.

1. **Una forma dichiarata del destinatario.** Le occorrenze lette a campione portano il destinatario
   in prosa, in forme non uniformi - talvolta un'area (`→ COMP`), talvolta una questione (`Q-185`),
   talvolta una frase che nomina chi deve chiudere, talvolta nulla di riconoscibile a macchina. Senza
   una forma dichiarata, «privo di destinatario» non è accertabile e il criterio non è binario.
2. **Il controllo che accerta l'assenza del destinatario**, che non esiste.
3. **Il rapporto pubblicato** delle occorrenze con destinatario, che il criterio esige
   esplicitamente e che oggi non esiste in alcuna forma.

**Come si dimostra.** Si fissa una forma - la scelta va registrata, e l'ipotesi più economica è che
il destinatario segua l'occorrenza entro la stessa frase in una delle forme già in uso nel corpus,
riconoscibili come sigla d'area o come identificativo di questione. Poi:

1. il controllo enumera tutte le occorrenze e le partiziona in *con destinatario* / *senza*;
2. **il controllo fallisce se la seconda partizione non è vuota**;
3. il controllo emette il rapporto della prima partizione, e il rapporto è un artefatto della
   costruzione;
4. **prova negativa**: si introduce un `[NV]` deliberatamente privo di destinatario e il controllo
   deve fallire; e - caso simmetrico che si dimentica sempre - si introduce un `[NV]` con
   destinatario e il controllo **non** deve fallire, perché un controllo che rifiuta tutto è
   indistinguibile da un controllo che funziona finché qualcuno non prova a lavorare.

**Costo, dichiarato per ciò da cui dipende.** Il costo non è proporzionale a 470. La stragrande
maggioranza delle occorrenze porta già il destinatario e si chiude con una lettura. La minoranza che
non lo porta **non è lavoro redazionale**: stabilire chi deve chiudere un `[NV]` è una decisione di
attribuzione, e in alcuni casi la risposta onesta è che nessuna area esistente può chiuderlo, il che
apre una voce in bacheca invece di chiudere una riga. Il costo dipende quindi da **quanto grande è
quella minoranza**, e quel numero **non è oggi noto**: si conosce dopo il primo passaggio del
controllo, non prima. È la ragione per cui il controllo si scrive **prima** della bonifica e non
dopo - altrimenti si bonifica alla cieca.

### 2.4 Criterio 4 - bacheca senza voci `APERTA` prive di destinatario · **NON MISURATO IN FORMA BINARIA**

**Che cosa esiste.** `.telemedic/context/05_BACHECA_INTERAGENTI.md` contiene **79 occorrenze** dello
stato `APERTA`. Il formato è tabellare, con una colonna `Da`, una colonna `A` e uno stato fra
`APERTA`, `RISOLTA`, `VINCOLO`, `CONTESTATA`. Le voci lette a campione - `Q-195`, `Q-197`, `Q-198`,
`Q-199` - portano tutte un destinatario nella colonna `A`, in forma di area o di `→ ORCH`.

**Che cosa manca.** Il criterio chiede due proprietà distinte, e la seconda è la costosa:

- nessuna voce `APERTA` **priva di destinatario** - apparentemente già vero, ma non accertato su
  tutte e 79 e non accertabile a vista senza errore;
- **ogni voce `APERTA` indirizzata a un'area chiusa ha almeno una nota che dichiara perché resta
  aperta.** Questa non è verificata affatto, e presuppone che sia definito **che cosa sia un'area
  chiusa**: la roadmap `00-indice.md` §4 dichiara complete o scritte tutte e dodici le aree, quindi
  sotto la lettura letterale **ogni** voce `APERTA` è indirizzata a un'area chiusa e **ognuna delle
  79 richiede la nota**. È una lettura onerosa, ed è quella che il testo sostiene. Va dichiarata
  adesso, perché è la differenza fra un criterio di poche righe e un criterio che tocca l'intero
  file.

**Come si dimostra.** Il controllo legge le righe di tabella con stato `APERTA`, verifica che la
colonna del destinatario non sia vuota e che la voce contenga una nota, ed **esce diverso da zero se
una riga manca dell'una o dell'altra**. Prova negativa: una riga `APERTA` con destinatario vuoto e
una riga `APERTA` senza nota, entrambe in una tenuta sintetica sotto `scripts/prove/tenute/`, devono
far fallire il controllo. La tenuta non è la bacheca reale: si prova il controllo, non il contenuto.

**Avvertenza.** La bacheca è un file di contesto condiviso e il runbook di traduzione §9.1 stabilisce
che i file di contesto condivisi **non si danno in scrittura a un agente di una passata parallela**:
li consolida chi orchestra, in un passaggio unico. Questa regola vale qui alla lettera. La bonifica
delle 79 voci **non si parallelizza**.

### 2.5 Criterio 5 - conteggio esatto delle parole, eseguito e registrato · **SODDISFATTO**

**Che cosa esiste.** Il conteggio è stato eseguito il **26 agosto 2026** ed è registrato in due
punti di `docs/09_roadmap/00-indice.md`: al §4, con il totale di **875.748 parole** - 860.718 in
`docs/` su dodici aree e centoquarantaquattro file, più 15.030 nei nove documenti di radice, con
`10_fondamenti` a 397.315 parole, il 46 % del totale - e nel registro delle revisioni §8.4, dove è
dichiarato che il conteggio *«chiude il criterio 5 di `T-02` e il `[NV]` del §4»*.

**Che cosa manca.** Nulla ai fini del criterio. **Non si ripianifica.**

**Un residuo da riconciliare, non un lavoro da rifare.** Il conteggio dichiara centoquarantaquattro
file in `docs/`; il repository al 26 agosto ne espone **centoquarantacinque** al modello
`docs/*/*.md`. La differenza è di un file ed è verosimilmente
`docs/08_compliance/10-controllo-dei-documenti.md`, prodotto lo stesso giorno per il criterio 1 di
`T-01`. Non invalida il conteggio delle parole; va riconciliato nel prossimo aggiornamento del §4
perché un numero di file che non torna è il primo indizio che qualcuno cerca quando dubita di un
conteggio.

**Perché conta comunque.** Il criterio 5 è l'**innesco di `T-06`**: la roadmap lo dichiara
esplicitamente, *«il conteggio esatto delle parole, che è il moltiplicatore del lavoro»*. Essendo
chiuso, `T-06` è innescato dal 26 agosto e non attende `T-02`. Ne discende che **la traduzione delle
aree prerequisito può cominciare adesso**, in parallelo a tutto il resto di questo piano, e che
attenderne la chiusura sarebbe una perdita netta.

### 2.6 Criterio 6 - lista dei termini vietati e controllo `R0` · **IN PARTE dal 27 agosto** (era: NON SODDISFATTO) · componente `A`

**Che cosa esiste.** La regola `R0` è enunciata in due punti di
`.telemedic/context/00_PROJECT_BRIEF.md` - §6, come regola di riservatezza vincolante per ogni
agente, e §8, fra i criteri redazionali, con la clausola *«Questa regola prevale su ogni altra»* - ed
è ripetuta in `docs/09_roadmap/00-indice.md` §11 fra le convenzioni dell'area. **Non esiste alcuna
lista versionata di termini vietati** e **non esiste alcun controllo** che la faccia valere:
`scripts/` contiene `verifica-terminologie.sh`, `verifica-conformita-redazionale.sh`,
`verifica-dichiarazione-non-marcatura.sh`, `verifica-divergenza-traduzioni.sh`,
`verifica-identificativi-requisiti.sh` e il banco `prove/esegui-prove.sh`, e nessuno di essi
presidia `R0`. Oggi `R0` è **una regola che vive nella disciplina di chi scrive**, che è
esattamente la condizione che il progetto ha già dichiarato insufficiente: *«Una regola senza un
controllo si erode nel giro di pochi mesi: non perché qualcuno la violi deliberatamente, ma perché
nessuno la ricorda mentre scrive»* (`verifica-conformita-redazionale.sh`, commento in testa).

**Che cosa manca.** Tutto: la decisione sulla forma (§1.1), la lista o il suo sostituto, il
controllo, il banco di prova negativo, l'inserimento in `verifiche.yml`.

**Come si dimostra.** Quattro accertamenti in sequenza, tutti binari:

1. la lista - o la sua forma sostitutiva decisa dal committente - **esiste ed è versionata**;
2. il controllo gira **su tutto il corpus** - `docs/`, i documenti di radice, `website/i18n/en/`,
   `.telemedic/` e i messaggi di commit, perché `R0` nomina esplicitamente i commit - **senza
   rilievi**;
3. **prova negativa**: una tenuta sintetica contenente un termine trattato come vietato fa fallire
   il controllo. La tenuta non contiene un nome reale di potenziale partner - sarebbe la violazione -
   ma un termine segnaposto inserito nella lista di prova, come già si fa per gli identificativi di
   requisito, dove l'intervallo 9000-9999 è riservato al collaudo per non collidere mai con il
   registro reale;
4. il controllo è un lavoro di `verifiche.yml` e **non è `continue-on-error`**, perché presidia un
   divieto pubblico.

**Perché va per prima, in una riga.** Ogni giorno in cui il controllo non esiste è un giorno in cui
una violazione può entrare senza che nulla la fermi, e una violazione entrata non si toglie dalla
storia di git rimuovendola dal ramo.

### 2.7 Criterio 7 - rinvii testuali all'area di conformità trasformati in collegamenti · **PARZIALMENTE MISURATO**

**Che cosa esiste.** Le forme testuali che nominano l'area di conformità ricorrono **61 volte su 34
file** sotto `docs/`. La grande maggioranza è verosimilmente già in forma di collegamento - l'area
esiste da tempo e più passate l'hanno toccata - ma **quanti dei 61 siano testo nudo non è noto**, e
il criterio riguarda esattamente quelli.

**Che cosa manca.** La partizione fra rinvio-collegamento e rinvio-testo, e la conversione della
seconda partizione.

**Come si dimostra.** Un controllo che cerchi le forme testuali **fuori** da un collegamento
Markdown e fallisca se ne trova. Prova negativa: un rinvio testuale deliberatamente non collegato in
una tenuta sintetica deve far fallire. Il controllo si aggiunge a
`verifica-conformita-redazionale.sh`, che già ospita la famiglia dei controlli redazionali e già
presidia i rinvii relativi che escono da `docs/`: **non si crea uno script nuovo**, perché quattro
script che fanno controlli redazionali divergono su quattro convenzioni.

**Attenzione a una trappola già pagata.** Il controllo esistente `verifica-conformita-redazionale.sh`
punto 2 vieta i **rinvii relativi che escono da `docs/`** perché funzionano su GitHub e producono un
404 silenzioso sul sito. Convertire un rinvio testuale in collegamento **verso un documento di
radice** riintroduce quel difetto se il collegamento è relativo: verso la radice del repository si
usano **URL assoluti verso GitHub**. Questa trappola è già scritta in `CLAUDE.md` e nel runbook di
traduzione §8, e va riletta prima di aprire il primo file, non dopo il primo rilievo.

## 3. La sequenza

### 3.1 Che cosa è già chiuso e non entra nella sequenza

**Criterio 1** (glossario bilingue) e **criterio 5** (conteggio delle parole). Restano soggetti alla
sola sorveglianza di non regressione descritta in §2.1 e §2.5.

### 3.2 Ciò che non dipende da nulla e comincia subito

Tre lavori sono indipendenti fra loro e dal resto, e si eseguono nell'ordine in cui il costo di
omissione decresce.

1. **Criterio 6 - `R0`.** Prima la questione al committente sulla forma (§1.1), che ha tempo di
   attraversamento proprio e va posta il primo giorno; poi il controllo, il banco di prova negativo,
   l'inserimento in `verifiche.yml`. **Non attende nulla.** È la componente `A`.
2. **Criterio 3 - `[NV]`.** Prima la forma del destinatario, poi il controllo con la sua prova
   negativa e la sua prova simmetrica, poi il rapporto, **poi** la bonifica della partizione senza
   destinatario. L'ordine è vincolante: bonificare prima di misurare significa bonificare alla cieca.
3. **Criterio 7 - rinvii alla conformità.** Estensione di uno script esistente. È il lavoro più
   piccolo del traguardo e **si tiene per ultimo fra i tre**, non perché sia meno importante ma
   perché è l'unico che non apre decisioni.

### 3.3 Ciò che dipende, e da che cosa

4. **Criterio 4 - bacheca.** Dipende da una definizione operativa di «area chiusa» (§2.4), che è
   materia di `ORCH` e va posta insieme alla questione di `R0` per non fare due giri. **Non si
   parallelizza** per la regola del runbook §9.1.
5. **Criterio 2 - collegamenti rotti.** Dipende dal **criterio 2 di `T-03`**, che rende bloccante il
   controllo sui collegamenti, ed è il medesimo oggetto del **criterio 1 di `T-07`**. `T-03` e `T-07`
   sono entrambi allocati al **26 settembre 2026**, cioè al giorno in cui la finestra di `T-02` si
   apre. **La dipendenza è a scarto nullo**: se `T-03` chiude il 26 settembre, il criterio 2 di
   `T-02` comincia il 26 settembre. Se `T-03` slitta di un giorno, il criterio 2 slitta con esso, e
   non esiste margine da cui prenderlo.

### 3.4 Che cosa è parallelizzabile, e che cosa no

**Parallelizzabile.** I criteri 6, 3 e 7 sono indipendenti fra loro: toccano file diversi, script
diversi, e nessuno produce un ingresso dell'altro. Il criterio 3, nella fase di bonifica, si
partiziona **per file** e mai per famiglia di difetto - è la lezione registrata nel runbook §9.1,
dove partizionare per famiglia ha prodotto sovrascritture che non generano errori ma modifiche perse.

**Non parallelizzabile.** Il criterio 4, per la regola sui file di contesto condivisi. Il criterio 2,
perché non ha un predecessore da anticipare: attende `T-03` e basta.

**Che cosa si può anticipare senza attendere `T-03`.** La **bonifica** dei tre riscontri di ancora e
dei quattro collegamenti non inglesi si può fare da subito, leggendo il rapporto di costruzione; ciò
che attende `T-03` è soltanto la **dimostrazione** del criterio, che esige il controllo bloccante.
Anticipare la bonifica è lavoro utile e non sprecato: riduce a zero il residuo che il controllo
bloccante troverà quando verrà acceso, e trovarlo a zero è la condizione perché l'accensione non
diventi essa stessa un motivo per rinviare l'accensione.

## 4. Il costo dichiarato

Il progetto non produce stime e questo piano non ne introduce (`00-indice.md` §11, `01 §4.1`). Ciò
che si dichiara è la **classe di sforzo** e **da che cosa il costo dipende**, che è l'informazione
che serve per decidere che cosa sacrificare se la finestra non tiene.

| Criterio | Classe | Il costo dipende da | Comprimibile |
|---|:-:|---|---|
| 1 - glossario | `A` | - chiuso | - |
| 5 - conteggio | `D` | - chiuso | - |
| 6 - `R0` | **`A`** | **Una decisione del committente sulla forma** (§1.1), che ha tempo proprio e non si accorcia lavorando di più. Scritto il controllo, il costo residuo è la lista o il suo sostituto | **No**: presidia un divieto pubblico |
| 3 - `[NV]` | `D`, dipendente dal volume | La dimensione della partizione **senza** destinatario, **non nota prima della prima esecuzione del controllo**. Su 470 occorrenze la parte redazionale è ampia ma meccanica; la parte che richiede di attribuire un destinatario è decisionale e non si comprime | Il rapporto sì, la bonifica no |
| 4 - bacheca | `D` | Il numero di voci `APERTA` indirizzate ad aree chiuse: sotto la lettura letterale, **tutte e 79**. Non parallelizzabile | Sì, riducendo la lettura - ma la riduzione è una modifica di criterio e si registra |
| 2 - collegamenti | `D` | **La chiusura del criterio 2 di `T-03`**, a scarto nullo. Il residuo materiale è piccolo: tre ancore e quattro collegamenti non inglesi | No sul controllo, sì sulla lettura del perimetro (§2.2) |
| 7 - rinvii conformità | `D` | Quanti dei 61 riscontri siano testo nudo. Ignoto prima della prima esecuzione | Sì |

**Sulla finestra.** L'allocazione **26 settembre - 10 ottobre** è di quattordici giorni di
calendario, condivisi con `T-04`, `T-05` e l'avvio di `T-08`, sotto la capacità di `D62` - dieci-venti
ore a settimana, contributore unico. Il piano **non dichiara che ci stanno**: dichiara che i due
criteri di classe `A` e `D` più costosi, il 6 e il 3, **non dipendono dalla finestra** e possono
cominciare il 12 settembre, alla chiusura di `T-01` che è l'innesco. Anticiparli è l'unica leva di
questo piano, e va usata.

## 5. I rischi propri, con la contromisura

La roadmap attribuisce a `T-02` i rischi `R-03`, `R-04`, `R-24` e `R-28`. Qui si aggiungono soltanto
quelli **propri di questo piano**, cioè quelli che nascono dalla sua esecuzione e non dal registro.

**Il criterio 6 si scrive prima che la sua forma sia decisa.** È il rischio più concreto, perché la
pressione a produrre qualcosa è alta e la questione al committente ha tempo di attraversamento
proprio. *Contromisura*: la questione si pone il **primo giorno di lavoro sul traguardo** e non
quando il controllo è già mezzo scritto; se al 26 settembre non è decisa, si adotta la **forma
strutturale** (§1.1) come misura provvisoria, si registra che il criterio non è soddisfatto come è
scritto, e si dichiara la data in cui lo diventerà. Un controllo strutturale attivo è meglio di
nessun controllo; un controllo strutturale spacciato per il criterio 6 è peggio di entrambi.

**Il criterio 3 si bonifica prima di essere misurato.** *Contromisura*: la sequenza di §3.2 è
vincolante, e la sua violazione è osservabile - se esiste un commit di bonifica di `[NV]` anteriore
al commit che introduce il controllo, la sequenza è stata invertita.

**Il criterio 2 si dichiara chiuso a vista.** È il rischio che il criterio stesso anticipa
scrivendo *«e non a vista»*. *Contromisura*: la prova negativa di §2.2 punto 2. Un rapporto di
costruzione senza rilievi non dimostra che il controllo blocchi: dimostra che non ha nulla da dire.

**La lettura del perimetro del criterio 2 si decide sotto pressione a ottobre.** *Contromisura*:
si pone al committente entro il **12 settembre**, insieme alle altre due questioni, e la decisione
si registra. La regola 2 del §6.1 di `03-primo-rilascio-utilizzabile.md` la impone.

**Un controllo tarato su una convenzione che il repository non usa.** È già successo il 26 agosto
2026 e la rettifica è nel registro delle revisioni `00-indice.md` §8.4: il controllo di divergenza
era stato esteso alle avvertenze pubbliche assumendo file `.en.md` separati, cercava file
inesistenti e **ne concludeva che l'inglese mancasse**. La lezione registrata è che *«un controllo
tarato su una convenzione sbagliata non tace, afferma il falso - e lo afferma con l'autorevolezza di
una verifica automatica»*. Questo piano introduce **tre controlli nuovi** su tre classi di documenti
diverse. *Contromisura*: per ciascuno, prima di scriverlo, si verifica sul repository la convenzione
che quei documenti seguono davvero - la forma reale del destinatario di un `[NV]`, la forma reale di
una riga di bacheca, la forma reale di un rinvio all'area di conformità - e la convenzione accertata
si scrive nel commento in testa allo script, dove il prossimo la troverà.

**La correzione apre conseguenze fuori dal proprio perimetro.** Runbook §9.4: rinominare un titolo di
sezione ha già fatto divergere il nome di una procedura dal nome del criterio di traguardo che la
richiama. *Contromisura*: prima di cambiare un titolo di sezione, `grep` per verificare che nessun
file punti alla sua ancora; e passata di coda dedicata per gli effetti segnalati e non chiusi.

**Un difetto chiuso in una lingua sola.** È la regola che apre
`.telemedic/context/REGISTRO-DIFETTI-TRADUZIONE.md` e riguarda direttamente i criteri 3 e 7, che
toccano testi esistenti anche in inglese: *«ogni voce si chiude sull'italiano e sull'inglese nello
stesso commit»*. *Contromisura*: per ogni file toccato dal criterio 3 o dal criterio 7 che abbia una
traduzione, la traduzione si tocca nello stesso commit - anche quando la correzione italiana sparisce
in inglese, perché altrimenti il controllo di divergenza segnala per data di commit e **impara a
mentire**, che è la formulazione dello script stesso.

## 6. Che cosa `T-02` non comprende, e dove è coperto

Riprodotto dalla roadmap e integrato con la collocazione precisa, perché l'elenco è parte del
traguardo e non un'appendice.

| Non comprende | Dove è coperto | Natura del taglio |
|---|---|---|
| Il **modulo delle fonti primarie** della guida, bibliografia ragionata | Rinviato, senza traguardo assegnato. Conseguenza dichiarata: fino ad allora ogni rinvio normativo resta citato per esteso nel testo in cui compare | **Reversibile** |
| La **riemissione sotto controllo dei documenti prodotti prima di `T-01`** | Lacuna dichiarata, `01 §8.3`, con la nota che il volume da riemettere cresce ogni giorno | Reversibile con costo crescente |
| La **versione inglese** del corpus | `T-06` per le aree prerequisito, `T-09` per il resto | Reversibile per costruzione (`D56`) |
| L'**accensione** del controllo bloccante sui collegamenti | `T-03` criterio 2. `T-02` ne è utente, non produttore | - |
| La **verifica del sito** - navigazione, ricerca, cambio di lingua | `T-07` | - |

> **Contraddizione da non risolvere qui.** La riga «modulo delle fonti primarie» è **in conflitto
> con lo stato di fatto**: `docs/10_fondamenti/20-fonti-primarie.md` **esiste** ed è tradotto in
> inglese, e `00-indice.md` §4 dichiara la guida *«Completa: ventuno moduli, `00`-`20`, glossario e
> fonti primarie compresi»*. La riga di `T-02` e il §1 di `02-traguardi.md` - *«della guida dei
> fondamenti mancano due moduli su ventuno, il glossario e le fonti primarie»* - sono **residui di
> una revisione precedente**. La correzione è di `ROAD` e va fatta con la procedura ordinaria; questo
> piano la segnala e non la applica.

## 7. Le due trappole che valgono anche qui

Sono già state pagate una volta e il piano le riporta perché il lavoro di questo traguardo tocca il
frontmatter e la costruzione del sito.

**Non aggiungere `"type": "module"` a `website/package.json`.** I file generati da Docusaurus
verrebbero trattati come ESM e il caricamento differito si rompe con `require.resolveWeak is not a
function`, un errore che **non indica affatto la causa reale**. La configurazione è già in `.mjs`
per questa ragione.

**Nel frontmatter YAML, i valori che contengono due punti seguiti da spazio vanno quotati.** Una
descrizione come `description: Metriche: come si leggono` fa fallire la costruzione con un errore di
indentazione che **non ha nulla a che vedere con l'indentazione**. Il controllo esiste già -
`verifica-conformita-redazionale.sh` punto 1 - e copre `docs/`; chi tocca un frontmatter lo esegue
prima di proporre la modifica.

## 8. Definizione di fatto

`T-02` è raggiunto quando, e solo quando, tutti e sette gli enunciati seguenti sono veri e ciascuno
è stato osservato da una procedura che poteva dare esito negativo.

- [ ] **1** - `docs/10_fondamenti/19-glossario.md` e la sua traduzione esistono, senza marcatore di
      continuazione, con ampiezza entro il ±15 %, e i rinvii interni non producono rilievi al
      controllo sui collegamenti. *Già vero al 26 agosto 2026.*
- [ ] **2** - La costruzione del corpus, con il controllo sui collegamenti bloccante, passa; e una
      costruzione con un collegamento deliberatamente rotto **fallisce**.
- [ ] **3** - Il controllo sugli `[NV]` esce zero, la sua prova negativa e la sua prova simmetrica
      sono nel banco di `scripts/prove/`, e il rapporto delle occorrenze con destinatario è
      pubblicato.
- [ ] **4** - Il controllo sulla bacheca esce zero; nessuna voce `APERTA` è priva di destinatario;
      ogni voce `APERTA` verso un'area chiusa porta la nota. Prova negativa su tenuta sintetica.
- [ ] **5** - Il conteggio è registrato con la data. *Già vero al 26 agosto 2026.*
- [ ] **6** - La lista dei termini vietati, o la forma decisa in sua vece, è versionata; il
      controllo gira su tutto il corpus senza rilievi; è un lavoro di `verifiche.yml` **non**
      `continue-on-error`; la prova negativa su termine segnaposto lo fa fallire.
- [ ] **7** - Il controllo sui rinvii testuali all'area di conformità esce zero, con prova negativa,
      e nessun rinvio convertito usa un percorso relativo che esce da `docs/`.

Sette criteri, sei soddisfatti, uno mancante: **il traguardo non è raggiunto**, e il rapporto dice
quale manca. Nessuna percentuale, per `V-181`.
