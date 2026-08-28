# P5 - Configurazione di riferimento del prodotto di federazione, con i tre difetti chiusi

**Artefatto** `P5` del piano [`.telemedic/piani/T-04-verifiche-empiriche.md`](../.telemedic/piani/T-04-verifiche-empiriche.md), §3
**Criterio attuato** `T-04/3` - i tre difetti dichiarati da `D37` chiusi in configurazione **e**
sorvegliati da una prova che fallisce se la configurazione regredisce
**File di configurazione** [`P5-configurazione-di-riferimento-federazione.yml`](./P5-configurazione-di-riferimento-federazione.yml), accanto a questo
**Prodotto prima** della finestra del 26 settembre - 3 ottobre 2026
**Stato** configurazione redatta, non ancora applicata ad alcuna istanza

> **Che cosa sono questi due file.** Il profilo di configurazione con cui si monta l'istanza
> effimera della verifica 3, e il documento che dichiara perché ogni scelta è quella e non
> un'altra. Il piano li colloca prima del cancello per una ragione operativa esplicita: «se la
> configurazione non esiste prima, la finestra si consuma a scriverla».
>
> **Che cosa non sono.** Non sono codice. Non sono la suite di prova: descrivono che cosa la suite
> dovrà accertare e contro quale configurazione regredita dovrà dimostrare di saper fallire. Non
> sono un profilo di produzione: si applicano a un'istanza effimera e a null'altro.

---

## 1. La domanda a cui il criterio 3 risponde, e la metà che si dimentica

Il criterio è composto da due affermazioni, e la seconda è quella che gli dà valore.

La prima è che i tre difetti siano **chiusi in configurazione**. È la parte che si fa in un
pomeriggio e che chiunque abbia amministrato il prodotto sa fare: si disattivano le superfici che
consentono all'utente di toccare i propri attributi, si tolgono i percorsi di autenticazione
locale, si impone la riscrittura degli attributi dalla fonte federata.

La seconda è che siano **sorvegliati da una prova che fallisce se la configurazione regredisce**.
È la parte che si dimentica, e la si dimentica perché al momento in cui la si scrive sembra
ridondante: la configurazione è appena stata chiusa, la si è appena vista funzionare, che senso ha
scrivere una prova per qualcosa che si è appena verificato a mano?

Il senso è che **una configurazione di sicurezza senza una prova che la sorvegli tornerà insicura
al primo aggiornamento**, e nessuno se ne accorgerà. Non per negligenza: perché un aggiornamento
di versione minore che reintroduce un valore predefinito, o che rinomina un'impostazione facendone
decadere il valore impostato, non produce alcun segnale. Il sistema continua a funzionare. Gli
utenti federati continuano ad accedere. L'unica differenza è che da quel giorno uno di loro può
riscriversi il nome che comparirà come firmatario di un documento clinico.

È il rischio `R-13` del programma, e il piano di `T-04` è esplicito su come vada trattato: la
prova di regressione **è** il criterio 3, non un suo complemento. Senza di essa il criterio non è
soddisfatto, per quanto pulita sia la configurazione.

**La conseguenza per questo artefatto.** Il §5 non è un'appendice del §4: è metà del prodotto. Una
configurazione chiusa e non sorvegliata non è metà del lavoro fatto, è il lavoro fatto in una forma
che si disferà da sola.

---

## 2. I tre difetti, e perché in questo dominio non sono veniali

Sono dichiarati dalla decisione `D37` e descritti per esteso in
[`docs/06_security/02-identita-e-accessi.md`](../docs/06_security/02-identita-e-accessi.md) §7, che
li tratta come **rischi di prodotto ai sensi della norma sulla gestione del rischio dei dispositivi
medici**, con controlli di rischio obbligatori e verifica dell'efficacia, non come note di
configurazione. Non appartengono ai connettori nazionali: appartengono al prodotto di federazione
stesso.

| # | Difetto | Perché è grave qui |
|---|---|---|
| `R-IAM-01` | L'utente federato può modificare i propri attributi. Bloccare la superficie di autoservizio non basta: le interfacce di amministrazione restano invocabili | Un'identità autenticata dalla federazione nazionale potrebbe presentare attributi anagrafici **alterati dall'utente stesso**. In un sistema che produce documentazione clinica e un registro non ripudiabile, significa che l'identità del firmatario di un documento potrebbe non essere quella verificata |
| `R-IAM-02` | Le modifiche del recapito di posta non sono verificate: l'utente può cambiarlo senza alcuna prova del possesso | Il recapito è canale di notifica e, in molte configurazioni, di recupero della credenziale. Un cambio non verificato è un percorso di appropriazione dell'account |
| `R-IAM-03` | L'utente federato è **anche** utente locale: può impostarsi una credenziale locale e accedere con quella conservando gli attributi ottenuti dalla federazione | Il canale più debole determina la sicurezza dell'account. Chi accede oggi con il livello 2 della federazione può accedere domani con una parola d'accesso che si è scelto da sé, **e il registro continuerebbe a dire «identità federata»** |

L'ultima colonna della terza riga è la ragione per cui i tre non si possono trattare come
inconvenienti amministrativi. Il valore del registro immutabile del progetto sta nella sua capacità
di rispondere alla domanda «chi ha garantito l'identità di questa persona». Ciascuno dei tre
difetti produce un registro che risponde a quella domanda **con un'affermazione falsa**, e lo fa
senza alcuna anomalia visibile.

### 2.1 Una asimmetria fra i tre che va vista prima di scrivere la suite

`R-IAM-01` e `R-IAM-02` si chiudono **soltanto** con la configurazione del prodotto di federazione.
Se quella configurazione regredisce, non resta niente: nessun secondo strato, nessuna politica del
prodotto di progetto che possa accorgersene, perché l'alterazione avviene interamente dentro il
prodotto di federazione e ciò che arriva a valle è un attributo dall'aspetto perfettamente
regolare.

`R-IAM-03` ha invece un secondo strato, ed è il controllo 4 dell'area di sicurezza: il **marcatore
di provenienza** propagato come claim e la **politica di autorizzazione che rifiuta le sessioni
prive di fornitore federato**. Quel controllo vive nel prodotto di progetto, non nella
configurazione del prodotto di federazione, e sopravvive quindi a un aggiornamento che riporti le
impostazioni ai valori predefiniti.

**Ne discendono due conseguenze operative, e vanno scritte perché non sono simmetriche.**

La prima: per `R-IAM-01` e `R-IAM-02` la prova di regressione è **l'unica difesa esistente**. Non è
una rete di sicurezza sopra una difesa: è la difesa. Trattarla come facoltativa significa non avere
alcuna protezione contro il ritorno del difetto.

La seconda: per `R-IAM-03` la prova deve verificare **entrambi** gli strati separatamente. Una
prova che accerti solo che l'autenticazione locale fallisce sta misurando il primo strato, e resterà
verde anche il giorno in cui il secondo strato viene disattivato. È la ragione per cui il profilo
prevede la mutazione `MR-4` da eseguire **da sola**, senza `MR-3`: se la prova resta verde in quella
condizione, il secondo strato non è sorvegliato, e il secondo strato è precisamente quello che deve
reggere dopo un aggiornamento.

---

## 3. Perché questa configurazione non nomina le impostazioni del prodotto

È la scelta più discutibile di questo artefatto e va difesa apertamente, perché ha un costo reale.

**Il vincolo.** La regola `R0` del progetto dice che nessun nome di azienda, marchio, prodotto
commerciale o dominio compare in alcun artefatto, e che si scrive sempre la categoria generica.
Qui la regola morde in un punto scomodo: alcune impostazioni di un prodotto **portano nel proprio
nome, o nel proprio percorso, elementi che identificano il prodotto**. Scriverle in chiaro
significherebbe pubblicare, in un file intitolato «configurazione di riferimento», l'indicazione
puntuale di quale prodotto il progetto adotta e di come lo configura.

**Il secondo vincolo, che da solo basterebbe.** La regola del progetto sulle affermazioni non
verificabili dice che non si inventa mai un numero di versione, di articolo o di impostazione.
Scrivere qui i nomi delle impostazioni a memoria significherebbe inventarli: nessuno, in questo
artefatto, li ha letti sulla documentazione della versione che sarà effettivamente installata. Un
nome sbagliato in una configurazione di sicurezza non è un refuso: è un'impostazione che non viene
applicata e che nessuno cerca, perché il file dice che c'è.

**La via scelta.** Ogni chiusura è espressa come **proprietà osservabile** più una **chiave di
progetto**, e il legame fra la chiave di progetto e l'impostazione effettiva del prodotto è
marcato `[NV]`, da completare da `TECH` sulla documentazione della versione installata. La
proprietà osservabile è ciò su cui la prova asserisce; la chiave di progetto è il nome con cui il
profilo, il documento e la suite parlano della stessa cosa.

**Il vantaggio, che non è solo di conformità a una regola.** Una prova scritta contro una proprietà
osservabile sopravvive a un cambio di versione del prodotto; una prova scritta contro il nome di
un'impostazione si rompe, o peggio resta verde perché l'impostazione rinominata non esiste più e il
valore letto è vuoto. Dato che l'intero criterio 3 esiste per resistere agli aggiornamenti,
scrivere la sorveglianza contro i nomi delle impostazioni sarebbe stato contraddittorio.

**Il costo, dichiarato senza attenuazioni.** Finché la colonna del legame è vuota, **il profilo non
è applicabile**: chi monta l'istanza effimera deve completarla, e quel completamento è lavoro che
cade dentro la finestra invece che prima. È esattamente ciò che questo artefatto esiste per
evitare, e lo evita solo in parte. La riduzione ottenuta è comunque sostanziale, e va misurata per
quello che è: nella finestra resta da compilare **una colonna** su un profilo già deciso, invece
che decidere quali chiusure servono, in quale ambito, con quale prova e contro quale regressione.

**Che cosa fare se una impostazione non è nominabile.** Il caso va detto invece di essere aggirato,
ed è la ragione per cui il legame è una colonna e non una nota a piè di pagina. Se, completando la
colonna, `TECH` trova un'impostazione il cui nome non è scrivibile senza rivelare il prodotto, la
regola è: **non la si scrive, non la si camuffa con un sinonimo, e non la si omette in silenzio.**
Si registra che quella riga resta legata fuori dal repository, nel materiale operativo di chi
installa, e si dichiara qui che il profilo versionato è incompleto su quella riga. Un profilo
dichiarato incompleto è utilizzabile; un profilo completo per finta non lo è.

---

## 4. Le tre chiusure

Il dettaglio esecutivo sta nel file di configurazione. Qui si dichiara, per ciascuna, che cosa
chiude davvero e che cosa no, perché è la distinzione che il file da solo non può portare.

### 4.1 `R-IAM-01` - gli attributi non sono modificabili dall'utente

**La chiusura vera è una sola**: gli attributi anagrafici del profilo utente in **sola lettura per
l'utente**, sfruttando i permessi per attributo della dichiarazione di profilo. È l'unica delle
quattro impostazioni che regge quando le interfacce di amministrazione vengono invocate
direttamente con il token dell'utente, e quel caso non è un'ipotesi di scuola: è precisamente ciò
che il difetto dichiara, ed è il punto che l'area di sicurezza indica come «se non provato, resta
silenziosamente rotto».

La console di autoservizio disabilitata e la modifica del nome utente disattivata **riducono la
superficie** e vanno applicate, ma non chiudono nulla da sole: chi ha un token può parlare con le
interfacce senza passare da alcuna superficie.

**La sincronizzazione forzata è una misura compensativa, non la chiusura**, e questo è il punto in
cui la lettura frettolosa del corpus produce un errore. La sincronizzazione riscrive gli attributi
dalla fonte autoritativa **al prossimo accesso**, non nel frattempo: fra l'alterazione riuscita e
l'accesso successivo, l'attributo alterato è quello in uso, e se in quella finestra viene prodotto
un documento clinico, il documento porta l'attributo alterato. Va applicata; non va contata.

**Che cosa non si chiude.** L'elenco chiuso degli attributi che devono essere in sola lettura non
esiste oggi: il corpus dice «gli attributi anagrafici» e non li enumera. `[NV]`, e spetta a `SEC`
enumerarli, perché una dichiarazione di profilo che ne lasci fuori uno lascia aperta esattamente
quella riga.

### 4.2 `R-IAM-02` - il recapito di posta si chiude per divieto, non per verifica

Qui la configurazione non ha una scelta: **il prodotto non offre una verifica del possesso del
nuovo recapito**, ed è il difetto stesso. Non esiste quindi una configurazione che ammetta il
cambio e lo verifichi. L'unica chiusura disponibile è il **divieto**: il recapito è un attributo di
provenienza federata, in sola lettura per l'utente, riscritto dalla fonte a ogni accesso.

**Il costo va dichiarato a chi installa e non va addolcito.** Un cambio legittimo di recapito - una
persona che cambia gestore di posta, un professionista che passa da un recapito personale a uno
istituzionale - richiede un percorso amministrativo oppure il cambio alla fonte federata. Un
servizio che non preveda né l'uno né l'altro produrrà utenti irraggiungibili dalle notifiche, e
l'irraggiungibilità di un assistito dalle notifiche di una televisita non è un fastidio
amministrativo: è una prestazione mancata.

Il profilo elenca a parte la disabilitazione del **percorso di recupero della credenziale per
posta**. Discende dalla chiusura di `R-IAM-03` - senza credenziale locale non c'è credenziale da
recuperare - ed è elencata separatamente perché è il percorso che trasforma `R-IAM-02` da problema
anagrafico in via di appropriazione dell'account. Se un giorno le due chiusure venissero
disaccoppiate, questa riga deve restare.

**Che cosa non si chiude.** Se i realm applicativi conservassero un proprio recapito, distinto da
quello del realm broker, la chiusura sul broker non lo coprirebbe. Che lo conservino o no è `[NV]`
e va confermato da `ARCH`.

### 4.3 `R-IAM-03` - nessuna credenziale locale, e un secondo strato che sopravvive

La chiusura di primo strato è l'assenza di ogni via di autenticazione locale nel realm broker:
nessun flusso di concessione diretta, nessun flusso di navigazione con modulo di nome utente e
parola d'accesso, nessuna registrazione autonoma, insieme vuoto dei tipi di credenziale locale
ammessi. L'unico modo di autenticarsi resta un fornitore di identità federato oppure
l'autenticatore a certificato.

La chiusura di secondo strato è il **marcatore di provenienza propagato come claim** e la
**politica di autorizzazione che rifiuta le sessioni prive di fornitore federato**. Vive nel
prodotto di progetto e neutralizza `R-IAM-03` anche se il primo strato viene aggirato.

**Perché il secondo strato cambia la natura della sorveglianza.** Delle tre chiusure, questa è
l'unica che possa sopravvivere a un aggiornamento del prodotto di federazione. Ne discende che la
prova deve saper distinguere i due strati, e che la mutazione `MR-4` va eseguita **isolata**: se
la prova resta verde con il solo secondo strato disattivato, sta misurando il primo e dichiara una
protezione che non sorveglia.

**Che cosa non si chiude.** L'autenticatore a certificato è l'altro canale ammesso e porta una
verifica propria, dichiarata dal corpus e non assegnata: che le **intestazioni del certificato
client iniettate dall'esterno non vengano onorate**. È il punto (c) dei controlli di rischio
dell'area di sicurezza, ed è quello che, se l'applicazione si fida di un'intestazione impostabile
da chiunque la raggiunga scavalcando il punto di terminazione, rende l'intera autenticazione a
certificato falsificabile con una richiesta. Non è nel criterio 3 e questo artefatto non se ne
appropria: `[NV]` su quale traguardo la assuma, da chiedere a `SEC`.

---

## 5. La configurazione deliberatamente regredita

### 5.1 Che cosa distingue una configurazione chiusa da una sorvegliata

Una configurazione chiusa è una configurazione in cui il tentativo fallisce. Una configurazione
**sorvegliata** è una configurazione in cui esiste una prova che, applicata a una versione
deliberatamente regredita della stessa configurazione, **lascia passare il tentativo e fa fallire
la suite**.

La differenza non è teorica ed è misurabile in un modo solo: guastando la configurazione e
guardando che cosa succede. Una prova che nessuno ha visto fallire non ha dimostrato di saper
fallire, e la sua luce verde è indistinguibile da quella di una prova che non asserisce nulla. È la
regola generale del progetto sui controlli, ed è la stessa disciplina di mutazione con cui il banco
`scripts/prove/esegui-prove.sh` collauda i controlli della pipeline: si guasta la regola, si
verifica che **solo** il caso corrispondente cada, si ripristina, si confronta l'impronta SHA-256
prima e dopo.

### 5.2 Come si costruisce, e la precauzione che la governa

**Non si scrive: si deriva.** La configurazione regredita non esiste come file. Esiste come
**mutazione dichiarata** - quale chiave, da quale valore, a quale valore - applicata a runtime
dalla suite sull'istanza effimera, e ripristinata subito dopo. Il profilo versionato contiene le
mutazioni in forma descrittiva, nella sezione `mutazioni_di_regressione`, e non contiene alcun
profilo regredito applicabile.

**La precauzione ha una ragione precisa.** Un profilo insicuro pronto all'uso, versionato accanto a
quello sicuro, con un nome che si distingue da quello sicuro per una parola, è un incidente che
aspetta un percorso di rilascio distratto o una variabile d'ambiente sbagliata. Il costo di
evitarlo è nullo; il costo di non evitarlo si paga una volta sola e si paga per intero.

### 5.3 Le quattro mutazioni

| # | Difetto riaperto | Chiave mutata | Da | A | Atteso |
|---|---|---|---|---|---|
| `MR-1` | `R-IAM-01` | attributi anagrafici del profilo utente | sola lettura per l'utente | modificabile dall'utente | Il tentativo riesce; **`VP3-1` fallisce**, `VP3-2` e `VP3-3` restano verdi |
| `MR-2` | `R-IAM-02` | attributo di recapito di posta | sola lettura per l'utente | modificabile dall'utente | Il tentativo riesce; **`VP3-2` fallisce**, `VP3-1` e `VP3-3` restano verdi |
| `MR-3` | `R-IAM-03`, primo strato | flusso di concessione diretta | assente | presente | L'autenticazione locale riesce; **`VP3-3` fallisce** |
| `MR-4` | `R-IAM-03`, secondo strato | politica sulle sessioni prive di fornitore federato | rifiuto | ammissione | La sessione priva di provenienza federata è accettata; **`VP3-3` fallisce** |

### 5.4 Le quattro regole di esecuzione, e che cosa dice ciascun esito anomalo

**Una mutazione per volta.** Due mutazioni applicate insieme non dicono quale prova sorveglia che
cosa: la suite fallisce, e il fallimento non è attribuibile.

**Ogni mutazione fa fallire esattamente una prova.** Da qui si leggono due difetti opposti, e
questa è la parte del protocollo che vale più della configurazione stessa.

*Zero prove che falliscono.* La chiusura corrispondente **non è sorvegliata**. La prova esiste, gira
e passa, e passerebbe anche a difetto riaperto: è una prova che non asserisce ciò che dichiara di
asserire. È l'esito peggiore, perché è quello che produce una luce verde su un sistema regredito.

*Due o più prove che falliscono.* Le prove **non sono indipendenti**: stanno misurando la stessa
proprietà con due nomi. È il caso plausibile per `MR-2`, dove `VP3-1` e `VP3-2` potrebbero entrambe
appoggiarsi alla sola lettura del profilo invece di misurare separatamente l'attributo anagrafico e
il recapito. È un difetto della suite, non della configurazione, e va corretto **prima** di
dichiarare chiuso il criterio: due prove che misurano la stessa cosa lasciano una proprietà
scoperta senza che nulla lo segnali.

**`MR-4` va eseguita anche da sola.** Se `VP3-3` resta verde con `MR-4` applicata e `MR-3` no, il
secondo strato non è sorvegliato. Vale la pena ripeterlo perché è il caso che una suite scritta di
fretta produce per default: si scrive la prova sul tentativo di autenticazione locale, che è il
gesto più naturale, e quella prova fallisce con `MR-3` e resta verde con `MR-4`. La suite sembra
completa e sorveglia metà di ciò che deve.

**Ripristino con confronto dell'impronta.** Dopo ogni mutazione il profilo si ripristina e si
confronta l'impronta SHA-256 prima e dopo. Serve a escludere che la mutazione abbia lasciato un
residuo che falsifica le esecuzioni successive: un residuo su una suite di sicurezza produce esiti
non riproducibili, e un esito non riproducibile non è un esito.

---

## 6. Il vincolo di esecuzione: istanza effimera, mai un ambiente condiviso

È scritto nel piano e si ripete qui perché ha, in questo criterio, una ragione propria e non
derivata: **la suite del criterio 3 monta deliberatamente una configurazione insicura e tenta
deliberatamente scalate di privilegio.** Farlo su un ambiente condiviso significa aprire, per la
durata dell'esecuzione, un percorso di alterazione degli attributi e di autenticazione locale su un
sistema che qualcun altro sta usando, e significa lasciare nel registro di quel sistema tentativi
indistinguibili da un attacco reale.

Ne discendono cinque condizioni, tutte nel file di configurazione e tutte esigibili:

- l'istanza è **creata per l'esecuzione e distrutta al termine**, senza eccezione per «l'ambiente di
  collaudo che c'è già»;
- i soggetti sono **sintetici e riconoscibili come tali**: nessun identificativo con cifra di
  controllo valida, nessun recapito su un dominio assegnabile, nessun dato di persona reale in
  alcuna forma, in nessun registro prodotto dalla verifica;
- ogni valore d'ambiente è un **segnaposto** `${VARIABILE_AMBIENTE}`, risolto all'esecuzione: il
  piano lo prescrive per ogni configurazione di riferimento prodotta da questo traguardo, e non
  ammette eccezioni per il collaudo;
- la **credenziale amministrativa iniziale** vive quanto l'istanza e non le sopravvive. Nessuna
  credenziale predefinita è ammessa in alcun componente distribuito: è regola già in vigore, e qui
  si applica anche a un'istanza usa-e-getta, perché è il posto in cui la si viola per primo;
- **nessuna mutazione viene mai versionata** come profilo applicabile (§5.2).

---

## 7. Che cosa questa configurazione non è, e non copre

- **Non è un profilo di produzione.** Chi installa configura il proprio prodotto di federazione
  sotto la propria responsabilità; questo profilo esiste per rendere binaria una verifica del
  progetto. La ripartizione delle responsabilità è quella dell'area di sicurezza, e non cambia.
- **Non copre la conformità alla federazione nazionale delle identità.** Il progetto non è
  accreditato e non può esserlo: il fornitore di servizi è chi eroga il servizio in rete, cioè chi
  installa. Nulla in questo artefatto va letto come dichiarazione di conformità.
- **Non copre le tre verifiche rinviate** del criterio 5, e in particolare l'inoltro del contesto di
  autenticazione richiesto attraverso l'intermediazione, che resta la questione
  [`Q-160`](../docs/11_registri/02-questioni-aperte.md) e per la quale **nessuna documentazione
  pubblica ne descrive il meccanismo finché l'esito non è registrato**.
- **Non copre l'autenticatore a certificato**, per la parte detta al §4.3.
- **Non copre l'insieme dei difetti del prodotto oltre i tre dichiarati.** Sono tre perché tre ne
  ha accertati `D37`, non perché tre siano tutti. Un quarto, se emergesse, entrerebbe qui con lo
  stesso trattamento: chiusura, prova, mutazione.

---

## 8. Come si registra l'esito

L'esito è uno fra **riuscita**, **fallita** e **riuscita con condizioni**, con la **conseguenza
sulla progettazione scritta**: la forma del registro è l'artefatto `P8` e questo documento non la
definisce. Tre elementi vanno però nell'esito di questa verifica e si scrivono qui perché al
momento della compilazione saranno la prima cosa che si perde.

**L'esito per mutazione, non per criterio.** Quattro righe, non una: per ciascuna mutazione, quale
prova è fallita e quali sono rimaste verdi. Un esito aggregato «la suite sorveglia la
configurazione» non è verificabile e non conserva l'informazione che serve fra sei mesi.

**L'asimmetria del §2.1 scritta per esteso.** Che per `R-IAM-01` e `R-IAM-02` la prova di
regressione è l'unica difesa, e che per `R-IAM-03` esiste un secondo strato. È il dato che permette
a chi legge di pesare il rischio residuo, e senza di esso i tre difetti sembrano chiusi allo stesso
modo.

**Le righe che restano `[NV]`**, con il loro destinatario: l'elenco chiuso degli attributi
anagrafici (§4.1, `SEC`), il recapito conservato dai realm applicativi (§4.2, `ARCH`),
l'assegnazione della verifica sulle intestazioni del certificato client (§4.3, `SEC`), e ogni riga
della colonna del legame rimasta vuota (§3, `TECH`). Una riga `[NV]` in un esito registrato è
informazione; la stessa riga taciuta è un esito che afferma più di quanto ha accertato.

---

## 9. Il seguito, che non appartiene alla finestra

Quando le tre prove diventeranno controlli permanenti - e devono diventarlo, perché è l'unico modo
in cui la sorveglianza sopravvive alla verifica che l'ha inaugurata - ciascuna acquisisce una riga
in `pipeline/collocazione-dei-controlli.tsv` con la propria fascia, il proprio stato, la propria
data se in sola segnalazione, e il proprio caso di prova negativa nel banco. Le quattro mutazioni
del §5.3 sono già scritte nella forma che quel banco richiede, e non è un caso: sono state pensate
per diventare i suoi casi.

Non è compito della finestra e non va anticipato dentro di essa. È la **conseguenza sulla
progettazione** da scrivere accanto all'esito, ed è ciò che impedisce a questo artefatto di
esaurirsi nel giorno in cui viene eseguito.
