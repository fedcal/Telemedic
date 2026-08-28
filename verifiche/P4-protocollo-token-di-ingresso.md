# P4 - Protocollo della verifica 2: il token d'ingresso alla sessione

**Artefatto** `P4` del piano [`.telemedic/piani/T-04-verifiche-empiriche.md`](../.telemedic/piani/T-04-verifiche-empiriche.md), §3
**Criterio attuato** `T-04/2` - token d'ingresso a uso singolo, scadenza brevissima, emesso su
canale posteriore, mai transitante per l'indirizzo
**Prodotto prima** della finestra del 26 settembre - 3 ottobre 2026, e non dentro di essa
**Stato** protocollo scritto, verifica non eseguita

> **Che cosa è questo documento.** Il protocollo della seconda verifica di `T-04`: che cosa si
> osserva, in quale ordine, con quale asserzione, e che cosa si conclude. È scritto perché la
> finestra di sette giorni non si consumi a decidere che cosa provare.
>
> **Che cosa non è.** Non è codice, né applicativo né usa-e-getta. Non contiene nemmeno frammenti
> eseguibili: il codice della verifica nasce nella finestra, in area separata, dichiarato
> usa-e-getta, ed è escluso da ogni artefatto distribuito. Non è nemmeno la progettazione
> dell'emettitore: una verifica riuscita autorizza a progettare, non è progettazione.

---

## 1. Perché questa verifica sale di rango

Nella versione precedente del traguardo il token d'ingresso a uso singolo era descritto come
**ripiego indipendente** della decisione `D18`: la via che resta se il componente incorporabile
non è disponibile. Con il taglio `TG-03` il componente incorporabile non è più disponibile per
scelta, e il ripiego è diventato l'unica strada. L'enunciato del primo rilascio utilizzabile lo
dice senza attenuazioni: l'avvio della sessione da parte dell'integratore avviene **con token
d'ingresso a uso singolo emesso su canale posteriore**, e «nel perimetro ridotto non è un ripiego
ma la modalità principale».

Ne discende la conseguenza che va scritta accanto all'esito e che cambia il modo in cui questa
verifica va letta: **un esito «fallita» qui non riduce una comodità.** Non toglie un'ergonomia,
non rinvia una funzione di secondo piano, non degrada un'esperienza: toglie al primo rilascio
utilizzabile **l'unica via di integrazione**. Un integratore che non possa avviare una sessione
non ha modo alcuno di usare il prodotto, e ciò che resta è un sistema che funziona solo per chi
entra dalle sue interfacce, cioè non il sistema che il perimetro ridotto dichiara di rilasciare.

Questo ha due effetti pratici sul protocollo, ed è la ragione per cui il documento è più lungo di
quanto la sola frase del criterio farebbe pensare.

Il primo è che **un esito «riuscita con condizioni» va formulato come vincolo di progettazione**,
non come nota. Se la verifica riesce soltanto a patto che il riscatto avvenga entro una finestra
più stretta di quella dichiarata, oppure soltanto su una delle configurazioni supportate, quella
condizione è un requisito di `T-08` e va scritta in forma imperativa nel registro degli esiti.

Il secondo è che **la prova negativa non è un complemento ornamentale**. Le tre proprietà
positive - uso singolo, scadenza, canale posteriore - si dimostrano facendo accadere qualcosa. La
quarta - il token non compare in alcun indirizzo - si dimostra facendo **non** accadere qualcosa,
e una prova di assenza vale esattamente quanto vale l'insieme su cui si conclude. Il §6 esiste
per questo.

---

## 2. L'oggetto della verifica, e il vocabolario

Tre termini vanno fissati prima, perché il protocollo li usa in senso stretto e ciascuno di essi,
usato in senso lato, renderebbe una delle quattro asserzioni vera per equivoco.

**Token d'ingresso alla sessione.** È la credenziale, distinta dal token di accesso
dell'interfaccia applicativa, che autorizza **l'apertura di una singola sessione media** da parte
di uno specifico partecipante. È l'oggetto descritto dalla riga «Token d'ingresso alla sessione»
di [`docs/06_security/06-sicurezza-applicativa.md`](../docs/06_security/06-sicurezza-applicativa.md)
§3, ed è quello che l'integratore ottiene fra back-end nel flusso di
[`docs/07_integration/06-identita-e-delega.md`](../docs/07_integration/06-identita-e-delega.md)
§3.2. Non è il token di accesso ottenuto per scambio, che ha durata, ambito e ciclo di vita
propri e che il criterio 1 verifica separatamente.

**Canale posteriore e percorso anteriore.** Il canale posteriore è la chiamata che il back-end
dell'integratore rivolge al servizio, autenticata con un'asserzione firmata da chiave privata,
senza alcun passaggio attraverso un programma di navigazione. Il percorso anteriore è tutto ciò
che passa per il programma di navigazione della persona: documenti serviti, richieste emesse
dallo script della pagina, redirezioni, frammenti. La distinzione non è di trasporto ma di
**controllo**: sul percorso anteriore il servizio non controlla chi legge, mentre sul canale
posteriore la controparte è autenticata e nota.

**Indirizzo.** In questo protocollo «indirizzo» comprende, senza eccezioni, il percorso, la
stringa di interrogazione e il frammento di ogni forma di localizzatore che il servizio produce,
riceve, registra o fa produrre a un programma di navigazione. Comprende quindi il valore
dell'intestazione di posizione di una risposta di redirezione, il valore dell'intestazione di
provenienza inviata verso un terzo e la riga di richiesta scritta nei registri di accesso. La
ragione per cui la definizione è così larga è enunciata dalla documentazione di integrazione e non
va riscritta più debole: «un token in un indirizzo è un token trapelato: gli indirizzi finiscono
nella cronologia, nei registri del proxy, nell'intestazione di provenienza verso terzi e negli
strumenti di monitoraggio».

### 2.1 L'oggetto che questa verifica non copre, e che le somiglia

Il corpus descrive un secondo oggetto che è anch'esso una credenziale monouso legata a una
sessione, e che **viaggia deliberatamente dentro un indirizzo**: il collegamento di accesso
recapitato all'assistito.
[`docs/05_domain/06-consenso-e-riservatezza.md`](../docs/05_domain/06-consenso-e-riservatezza.md)
§11.2 lo qualifica come credenziale a tutti gli effetti, «monouso rispetto alla creazione della
sessione, con scadenza non superiore alla finestra della sala d'attesa e non indovinabile»
(`BR-052`, `RF-052`), e
[`docs/10_fondamenti/14-flussi-funzionali.md`](../docs/10_fondamenti/14-flussi-funzionali.md) §2
ne descrive la generazione, uno per partecipante.

**Sono due oggetti distinti, con due insiemi di proprietà distinti, e confonderli guasta la
verifica in uno dei due versi.** Se chi scrive la prova li tratta come lo stesso oggetto, o la
prova negativa fallisce su un percorso legittimo - il collegamento dell'assistito contiene per
costruzione una credenziale nell'indirizzo - oppure, ed è l'esito più probabile sotto pressione di
calendario, il collegamento dell'assistito viene riclassificato sul momento come «non un token
d'ingresso» e la prova negativa diventa tautologica: si conclude l'assenza su un insieme da cui
si è appena tolto il caso che l'avrebbe smentita.

Il protocollo risolve la cosa nell'unico modo onesto: **l'enumerazione del §6 dichiara, percorso
per percorso, quale dei due oggetti vi transita**, e la conclusione della prova negativa è
formulata sul solo token d'ingresso. Quel che resta scoperto va detto: **il criterio 2 non
verifica alcuna proprietà del collegamento di accesso dell'assistito.** Le sue tre proprietà -
non indovinabile, monouso rispetto alla creazione della sessione, scadenza legata alla finestra
della sala d'attesa - non hanno oggi una verifica assegnata in `T-04`. Non è una lacuna di questo
documento e non va colmata inventandone una qui: `[NV]` su quale traguardo la assuma, e la
domanda spetta a `SEC`, che possiede `BR-052`, insieme a chi tiene la roadmap.

---

## 3. Le quattro proprietà, in forma binaria

Il criterio ne enuncia quattro. Il protocollo ne aggiunge una quinta, che non è un'estensione del
perimetro ma la condizione senza la quale la seconda non dimostra ciò che sembra dimostrare: il
§4 spiega perché.

| # | Proprietà | Forma binaria dell'asserzione | Prova |
|---|---|---|---|
| 1 | **Uso singolo** | Il secondo riscatto dello stesso token è **rifiutato**, con esito strutturato del catalogo | `VP2-1` |
| 2 | **Scadenza brevissima, letta dalla configurazione** | Con la configurazione breve il riscatto oltre la scadenza è rifiutato; con la configurazione lunga, **a parità di ogni altra condizione e di attesa**, lo stesso riscatto riesce | `VP2-2` |
| 3 | **Mai nell'indirizzo** | Su ciascun percorso dell'insieme dichiarato al §6, nessuno dei punti di osservazione del §6.2 contiene il valore del token | `VP2-3` |
| 4 | **Emissione su canale posteriore** | Nessun percorso anteriore restituisce il token, in nessuna delle forme di risposta osservate | `VP2-4` |
| 5 | **La configurazione non altera il comportamento di sicurezza** | Non esiste valore ammesso di alcun parametro configurabile che renda il token riusabile o non scadente | `VP2-5` |

«Rifiutato» ha qui un senso preciso e non negoziabile, ed è la ragione per cui il criterio dice
«non sconsigliato». Un rifiuto è: nessuna sessione aperta, nessun materiale di sessione
consegnato, nessuna registrazione di accesso riuscito, **e** un esito strutturato che il chiamante
riceve e che il tracciamento registra come tentativo respinto. Un secondo riscatto che apra la
sessione e scriva un avviso nel registro non è un rifiuto: è un uso multiplo con un commento.

La distinzione fra **tentativo respinto** e **accesso registrato** è la stessa che il criterio 1
di `T-04` porta al punto 3, ed è essa stessa oggetto di asserzione: la prova non si accontenta di
osservare che non è nata una sessione, ma verifica che nel tracciamento compaia un tentativo
respinto e **non** compaia una registrazione di accesso. Le due mancanze sono diverse, e un
registro che le confonda non risponde più alla domanda a cui esiste per rispondere.

---

## 4. La regola sul valore, e il suo complemento

### 4.1 La scadenza brevissima è configurazione, con un valore predefinito dichiarato

**Non è una costante.** È la regola generale del progetto sui valori, la stessa per cui nessuna
soglia clinica sta nel codice, e vale qui benché il valore non sia clinico: un numero scritto nel
codice è una decisione presa da chi non conosce l'installazione in cui il numero avrà effetto. Il
piano di `T-04` registra il rischio corrispondente in forma esplicita - «un valore comodo scritto
nel codice dello spike sopravvive nel prodotto» - e assegna proprio a questo artefatto la
contromisura.

Il valore predefinito **è dichiarato, non lasciato implicito**, ed è già dichiarato dal corpus in
due punti concordi: la sequenza del primo avvio in
[`docs/07_integration/02-primo-avvio.md`](../docs/07_integration/02-primo-avvio.md) §0 mostra un
gettone con validità **45 secondi**, e le domande frequenti in
[`docs/07_integration/10-domande-frequenti-e-antipattern.md`](../docs/07_integration/10-domande-frequenti-e-antipattern.md)
§5 dichiarano una vita di **quaranta-sessanta secondi**, con l'istruzione operativa che ne
discende: il token va chiesto al momento del montaggio, non al caricamento della schermata
precedente. Il protocollo adotta questi valori come **predefinito dichiarato del banco** e non ne
conia di nuovi.

| Parametro | Valore predefinito dichiarato | Fonte del valore |
|---|---|---|
| Durata di validità del token d'ingresso | 45 secondi | Corpus di integrazione, §0 del primo avvio |
| Intervallo entro cui il valore configurato è ammesso | `[NV]` | Nessun documento del corpus dichiara un massimo ammesso: spetta a `SEC` fissarlo, ed è dovuto prima della finestra, perché senza un massimo la proprietà «brevissima» non è verificabile - solo il valore predefinito lo sarebbe |
| Tolleranza sullo scarto degli orologi applicata al confronto di scadenza | `[NV]` | Il corpus dichiara una «finestra temporale con tolleranza dichiarata» fra i cinque controlli del criterio 1, ma non ne fissa il valore per il token d'ingresso: da chiedere a `SEC`, e finché non è fissato la prova `VP2-2` va condotta con margini che la rendano insensibile al valore, come prescrive il §7.2 |

La seconda riga di questa tabella non è una formalità. «Scadenza brevissima» è un aggettivo, e un
aggettivo non è verificabile: ciò che è verificabile è che il valore configurato cada dentro un
intervallo dichiarato. Finché l'intervallo non esiste, la verifica può accertare che la scadenza
**dipende dalla configurazione**, che è ciò che il criterio chiede, ma **non** che sia brevissima
per qualunque configurazione ammessa. La differenza va scritta nell'esito e non attenuata.

### 4.2 Il complemento, che è la parte che si sbaglia

**La configurazione non può cambiare il comportamento di sicurezza.** Il valore non si cabla, ma
la proprietà non si configura: non deve esistere alcun valore ammesso, di alcun parametro, che
renda il token **riusabile** o **non scadente**.

È la metà della regola che si perde per prima, e si perde in modo comprensibile. Chi realizza
legge «la scadenza è configurazione», introduce un parametro, e poi - per il collaudo, per un
ambiente di dimostrazione, per un integratore che si lamenta di quarantacinque secondi - ammette
il valore zero, oppure il valore vuoto, oppure un valore molto grande, con il significato
convenzionale di «nessuna scadenza». Nello stesso modo nasce il parametro che consente più
riscatti «per gestire il ricaricamento della pagina». Nessuno dei due è un abuso: sono entrambi
soluzioni ragionevoli a un problema reale, e sono entrambi la fine della proprietà.

Ne discendono due insiemi che questo protocollo dichiara chiusi, e che `VP2-5` verifica.

**Insieme dei parametri configurabili.** Contiene la durata di validità e nient'altro che
riguardi il ciclo di vita del token. Ogni altro parametro che il realizzatore introduca su questo
oggetto è una modifica del perimetro e va discussa, non aggiunta.

**Insieme delle proprietà non configurabili, per nessun valore.** L'uso singolo; il fatto che la
scadenza esista; il fatto che il valore configurato sia finito; il fatto che l'emissione avvenga
sul canale posteriore; il fatto che il token non sia mai posto in un indirizzo dal servizio. Una
configurazione che tenti di alterare una di queste è **rifiutata al caricamento**, non accolta con
un avviso. È la stessa disciplina già adottata dal progetto sul tema personalizzato
dell'integratore, dove una configurazione che degrada l'accessibilità «viene rifiutata al
salvataggio, non segnalata come avviso»: qui la ragione è identica e l'oggetto è più grave.

Una precisazione che evita un fraintendimento prevedibile: il rifiuto al caricamento **non è**
esso stesso una proprietà di sicurezza sufficiente. Se un valore che disabilita la scadenza non è
ammissibile, la difesa primaria è che il percorso di riscatto non sappia comportarsi diversamente,
non che la configurazione lo vieti. `VP2-5` va quindi condotta, quando è tecnicamente possibile,
**scavalcando la validazione della configurazione** e imponendo il valore proibito direttamente
allo stato da cui il percorso di riscatto legge. Se ciò non è possibile senza modificare il codice
usa-e-getta - ed è probabile che non lo sia - la verifica si limita al rifiuto al caricamento, e
**l'esito lo dichiara**: si è accertato che la configurazione proibita non si carica, non che il
comportamento reggerebbe se si caricasse.

---

## 5. Gli esiti strutturati del rifiuto

Il criterio chiede un rifiuto «con esito strutturato», e il protocollo deve definirlo, altrimenti
l'asserzione «è rifiutato» si riduce a «non è successo niente di buono», che è vera anche quando
il servizio è caduto.

La forma è quella già adottata dal progetto per gli errori sul piano applicativo: la
rappresentazione del problema di RFC 9457, con un identificativo di tipo stabile nella forma
`https://telemedic.example/problems/<codice>`. La regola che governa il catalogo è già in vigore
e questo protocollo la eredita senza sconti: **il catalogo è generato, ed è vietato emettere un
errore non catalogato**. I quattro codici qui sotto sono quindi **proposte di questo artefatto**,
non voci esistenti: prima della finestra devono entrare nella sorgente da cui il catalogo è
generato, altrimenti la prova asserisce su identificativi che il prodotto non conosce.

| Situazione osservata | Codice proposto | Stato HTTP atteso | Note |
|---|---|---|---|
| Secondo riscatto dello stesso token | `ingresso-gia-riscattato` | 409 | Distinto dalla scadenza: sono due cause diverse e vanno diagnosticabili separatamente |
| Riscatto oltre la scadenza | `ingresso-scaduto` | 410 | Il chiamante deve sapere che la via di rimedio è chiedere un nuovo token, non riprovare |
| Token non riconosciuto o alterato | `ingresso-non-valido` | 401 | Non distingue «mai esistito» da «alterato»: la distinzione aiuterebbe chi attacca |
| Token valido ma presentato per una sessione diversa | `ingresso-non-pertinente` | 403 | Serve a impedire che l'asserzione di uso singolo sia soddisfatta da un token universale |

Tre regole d'uso, che valgono per il protocollo e sopravvivono alla verifica.

**Il codice è la chiave, il messaggio non lo è.** La prova asserisce sull'identificativo di tipo,
mai sul testo: il testo cambia con la lingua e con la revisione redazionale, e una prova che vi si
appoggi è una prova che fallirà per una traduzione.

**Il rifiuto non è diagnostico verso l'esterno.** L'esito rivolto all'integratore dice che cosa è
successo e non dice perché il servizio lo sappia: nessun riferimento interno, nessun istante
assoluto di emissione, nessun conteggio di riscatti. È la regola generale sui messaggi d'errore
dell'area di sicurezza applicativa.

**La distinzione fra i primi due codici è deliberata e ha un costo.** Dire a chi presenta un token
se è già stato usato oppure se è scaduto è un'informazione che, in astratto, aiuta anche chi
sonda. Si accetta, perché l'alternativa - un unico codice indistinto - rende indiagnosticabile il
difetto di integrazione più comune, che è chiedere il token troppo presto, e produrrebbe traffico
di supporto su un percorso che deve essere autonomo. La scelta è dichiarata qui perché sia
riesaminabile, non perché sia ovvia.

---

## 6. L'insieme dei percorsi su cui si conclude la prova negativa

### 6.1 Perché l'insieme viene prima della prova

La terza proprietà è una **prova negativa**, e una prova negativa dimostra esattamente quanto vale
l'insieme su cui si conclude. Se l'insieme dei percorsi si compila mentre la prova gira, si prova
sui casi che si conoscono e si conclude su tutti: è il rischio che il piano di `T-04` dichiara
per il criterio 1 e che vale identico qui.

L'insieme va quindi **enumerato, chiuso e versionato prima della finestra**, e questo paragrafo lo
enumera. Va detto subito che cosa lo rende chiuso: non l'esaustività immaginata da chi scrive, ma
il fatto che ogni riga discenda da una modalità di avvio dichiarata dal corpus per il perimetro
ridotto. Un percorso che il prodotto sappia fare e che non compaia qui è un difetto di questo
elenco, e la conclusione della prova va riformulata di conseguenza.

**Rapporto con `P1`, da non dare per scontato.** `P1` enumera le configurazioni supportate del
**confine di autorizzazione**, che è l'oggetto del criterio 1. L'insieme qui sotto enumera i
**percorsi di avvio della sessione**, che è l'oggetto del criterio 2. Sono due insiemi diversi e
nessuno dei due è sottoinsieme dell'altro. Vanno però **riconciliati** prima della finestra su un
punto solo: se una configurazione supportata del confine di autorizzazione abilita un percorso di
avvio che qui non compare, l'insieme qui sotto è incompleto e la prova negativa perde la sua
conclusione. La riconciliazione non è compito di questo artefatto e non se ne appropria: va
eseguita da chi tiene `P1` e da chi tiene questo documento, insieme, e il suo esito è una
precondizione dichiarata di `VP2-3`.

### 6.2 I percorsi

| # | Percorso di avvio | Oggetto che vi transita | Fonte |
|---|---|---|---|
| `PA-1` | Avvio dal sistema dell'integratore con apertura in **nuova scheda in contesto di prima parte** | Token d'ingresso | Unica variante che sopravvive al taglio `TG-03`; le altre due varianti dichiarate dalle modalità di integrazione presuppongono il componente incorporabile |
| `PA-2` | Avvio dal sistema dell'integratore con **navigazione nella stessa scheda** | Token d'ingresso | Stessa consegna di `PA-1`, contenitore diverso: va enumerato a parte perché il comportamento delle redirezioni non è lo stesso |
| `PA-3` | Ingresso dell'assistito da **invito recapitato con i canali di chi installa** | **Collegamento di accesso**, non token d'ingresso | Modalità dichiarata dal perimetro ridotto; l'oggetto è quello del §2.1 e la conclusione della prova negativa **non** lo riguarda |
| `PA-4` | **Verifica tecnica preventiva** eseguita prima della sessione | `[NV]` - non è accertato se questo percorso riscatti un token d'ingresso o operi senza; va confermato da `INTEG`, che possiede le modalità di integrazione, prima della finestra |
| `PA-5` | **Rientro dopo caduta della connessione** | Token d'ingresso **nuovo**, mai il precedente | Discende dalla proprietà 1: se il rientro riusasse il token, l'uso singolo sarebbe falso per costruzione e `VP2-1` misurerebbe un percorso diverso da quello reale |

La riga `PA-4` è marcata e non risolta di proposito. Sceglierne il comportamento qui significherebbe
inventare una decisione che appartiene a un'altra area, e la prova negativa che ne discendesse
concluderebbe su un percorso immaginato. Se la risposta non arriva prima della finestra, la
conclusione di `VP2-3` va scritta **escludendo esplicitamente `PA-4`**, che è un esito peggiore ma
onesto.

### 6.3 I punti di osservazione

Per ciascun percorso, l'assenza del valore del token si verifica in **tutti** i punti seguenti, e
l'elenco è chiuso allo stesso titolo del precedente.

| # | Punto di osservazione | Perché non è ridondante |
|---|---|---|
| `PO-1` | Riga di richiesta - percorso, stringa di interrogazione e frammento - di ogni richiesta emessa dal programma di navigazione | È il caso ovvio, ed è il solo che una prova frettolosa guarda |
| `PO-2` | Intestazione di posizione di **ogni** risposta di redirezione, lungo l'intera catena e non al primo salto | Un token che compare al secondo salto è trapelato quanto uno che compare al primo, e la catena è il punto in cui il difetto si nasconde |
| `PO-3` | Indirizzo finale caricato, **frammento compreso** | Il frammento non viaggia verso il servizio e per questo si è tentati di considerarlo sicuro: resta nella cronologia e resta leggibile da ogni script della pagina |
| `PO-4` | Registri di accesso del punto di terminazione | È il luogo in cui un token trapelato sopravvive alla sessione, e sopravvive alla correzione del difetto |
| `PO-5` | Intestazione di provenienza inviata verso qualunque destinazione esterna | È il canale per cui un indirizzo esce dal perimetro senza che nessuno l'abbia mandato |
| `PO-6` | Memorizzazione persistente del programma di navigazione | Non è un indirizzo, ed è enumerato lo stesso: il corpus vieta già il contenuto clinico nella memoria persistente, e un token che vi sopravviva alla sessione è la stessa classe di difetto |

`PO-6` eccede la lettera del criterio, che parla di indirizzi. È incluso perché la sua verifica ha
costo nullo una volta montato il banco e perché la sua assenza sarebbe la prima domanda di
chiunque legga l'esito. Se il tempo della finestra non basta, si esegue e si dichiara come
osservazione aggiuntiva, mai al posto di uno dei cinque.

---

## 7. Le prove

Ogni prova dichiara le precondizioni, la procedura, l'asserzione in forma binaria e - la voce che
di solito manca - **che cosa non dimostra**.

### 7.1 `VP2-1` - il secondo uso è rifiutato

**Precondizioni.** Istanza effimera montata secondo il §8. Un tenant sintetico, un integratore
sintetico, una sessione sintetica. Configurazione di durata al valore predefinito dichiarato.

**Procedura.** Si ottiene un token d'ingresso sul canale posteriore. Si riscatta una prima volta e
si osserva che la sessione si apre. Si riscatta una seconda volta lo stesso valore, dalla stessa
provenienza, entro la finestra di validità residua.

**Asserzione.** Il secondo riscatto produce l'esito `ingresso-gia-riscattato`; nessuna seconda
sessione risulta aperta; il tracciamento porta **un** accesso riuscito e **un** tentativo
respinto, distinti.

**Variante obbligatoria, e non è un di più.** Il secondo riscatto va ripetuto una seconda volta
**da una provenienza diversa** e una terza volta **in concorrenza con il primo**, cioè emesso
prima che il primo abbia concluso. La seconda variante è quella che smaschera l'implementazione
che marca il token come consumato **dopo** aver aperto la sessione invece che prima, e che
concede due sessioni a due riscatti simultanei. È un difetto che non si manifesta mai in una prova
sequenziale, e nel caso in esame significherebbe due partecipanti nella sessione di una terza
persona.

**Che cosa non dimostra.** Non dimostra che il consumo sia atomico rispetto a un guasto: un token
consumato e una sessione non aperta, per caduta del processo fra i due atti, resta un caso non
osservato. Va dichiarato nell'esito e non risolto qui.

### 7.2 `VP2-2` - la scadenza è rifiutata, e dipende dalla configurazione

**Il punto di questa prova non è che il token scaduto sia rifiutato.** È che il rifiuto **dipenda
dalla scadenza e non da altro**. Una prova a impostazione unica non lo dimostra: se si configura
una durata di quarantacinque secondi, si attendono sessanta secondi e si osserva un rifiuto, si è
osservato che qualcosa rifiuta dopo un minuto. Può essere la scadenza, e può essere una durata
massima cablata, una pulizia periodica dello stato, un limite del percorso di riscatto, un valore
predefinito di un componente sottostante che nessuno ha configurato. Sono tutte cause che
producono la stessa osservazione e nessuna delle quali soddisfa il criterio, perché in nessuna di
esse la scadenza è letta dalla configurazione.

**Il protocollo prescrive quindi la doppia impostazione**, ed è questa prescrizione che rende la
prova capace di dimostrare ciò che dichiara.

| | Impostazione **A** | Impostazione **B** |
|---|---|---|
| Durata configurata | Valore predefinito dichiarato, 45 secondi | Valore lungo, dell'ordine dei dieci minuti |
| Attesa fra emissione e riscatto | La stessa in entrambi i casi: superiore alla durata di A e inferiore a quella di B | Identica ad A, **senza alcuna differenza** |
| Esito atteso | Rifiuto con `ingresso-scaduto` | **Riscatto riuscito**, sessione aperta |

Tre condizioni rendono la coppia probante, e vanno rispettate alla lettera.

**L'attesa è identica nei due casi.** Se si attende di più nel caso A, la differenza osservata può
essere prodotta dall'attesa e non dalla configurazione, e la doppia impostazione non aggiunge
nulla a quella singola.

**Cambia un solo parametro.** Stessa istanza effimera, stesso tenant sintetico, stesso percorso di
emissione, stesso percorso di riscatto, stesso orologio. Se per cambiare la durata occorre
riavviare l'istanza, il riavvio va eseguito **anche** nel caso che non ne avrebbe bisogno, così
che il riavvio non sia una variabile.

**I margini assorbono la tolleranza sugli orologi.** Finché il valore di tolleranza resta `[NV]`
al §4.1 - e va chiesto a `SEC` - l'attesa si sceglie in modo che il suo scarto dalle due durate
sia molto maggiore di qualunque tolleranza plausibile. Una prova che passi per un secondo di
margine non distingue la scadenza dallo scarto degli orologi.

**Dove si legge il valore, e perché la domanda conta.** La scadenza può essere impressa nel token
all'emissione oppure valutata al riscatto contro uno stato conservato dal servizio. Le due scelte
hanno conseguenze diverse e questo protocollo **non le decide**: è materia di architettura.
Prescrive però la proprietà che entrambe devono soddisfare, ed è la proprietà che la prova
asserisce: **la decisione al momento del riscatto non è influenzabile da chi riscatta.** Se la
scadenza viaggia dentro il token, la prova include un riscatto con il valore di scadenza alterato
e ne asserisce il rifiuto con `ingresso-non-valido`. Senza questa asserzione, un'implementazione
che si fidi della scadenza dichiarata dal chiamante supererebbe l'intera `VP2-2`.

**Che cosa non dimostra.** Non dimostra che il valore configurato sia «brevissimo»: dimostra che
il rifiuto ne dipende. La proprietà «brevissima» resta non verificabile finché l'intervallo
ammesso è `[NV]` (§4.1, a carico di `SEC`), e l'esito lo deve dire con queste parole.

### 7.3 `VP2-3` - il token non compare in alcun indirizzo

**Precondizioni.** L'insieme dei percorsi del §6.2 chiuso e versionato; la riconciliazione con
`P1` eseguita; la riga `PA-4` risolta oppure esplicitamente esclusa.

**Procedura.** Per **ciascun** percorso dell'insieme in cui transita un token d'ingresso, si
esegue l'avvio completo di una sessione sintetica e si raccolgono i sei punti di osservazione del
§6.3. La ricerca del valore del token si fa **sul valore esatto e su ogni sua trasformazione
prevedibile**: codifica per indirizzi, codifica in base 64, forma troncata. Un token che compaia
codificato è comparso.

**Asserzione.** L'insieme delle occorrenze è vuoto, su ciascun percorso e su ciascun punto di
osservazione.

**Forma della conclusione, ed è la parte che va scritta con cura.** La conclusione **non** è «il
token non compare in alcun indirizzo». È: *«su ciascuno dei percorsi `PA-1`, `PA-2` e `PA-5`,
enumerati e versionati alla data della verifica, e su ciascuno dei punti di osservazione da `PO-1`
a `PO-6`, il valore del token d'ingresso non compare in alcuna forma. `PA-3` non trasporta un
token d'ingresso e non concorre alla conclusione. `PA-4` è escluso perché il suo comportamento non
è accertato.»* Una conclusione più corta è una conclusione più falsa, e la sua falsità sarebbe
scoperta dal primo che aggiunge un percorso.

**La prova va vista fallire.** Prima di dichiararla superata si costruisce un percorso
deliberatamente guasto, in cui il token è posto nella stringa di interrogazione, e si verifica che
la prova lo trovi. Una prova di assenza che nessuno ha visto trovare qualcosa non ha dimostrato di
saper trovare. È l'applicazione diretta della regola del progetto sui controlli, e qui vale con
peso maggiore perché la prova è negativa.

**Che cosa non dimostra.** Non dimostra nulla sui percorsi che il prodotto acquisterà dopo la
verifica. La conclusione è datata e legata alla versione dell'insieme: un percorso aggiunto dopo
richiede una nuova esecuzione, e questo va scritto come vincolo di progettazione per `T-08`, non
come raccomandazione.

### 7.4 `VP2-4` - l'emissione avviene su canale posteriore

**Precondizioni.** Le stesse di `VP2-3`.

**Procedura.** Si esercita ciascun percorso **anteriore** che, per il ruolo che ha, potrebbe
plausibilmente restituire un token d'ingresso: l'avvio dalla pagina, la ripresa, l'aggiornamento
dello stato di sessione. Si osservano i corpi delle risposte, le intestazioni, gli eventi
consegnati sul canale di segnalazione e ogni istruzione di redirezione.

**Asserzione.** Nessuna risposta a una richiesta emessa da un programma di navigazione contiene un
token d'ingresso, in alcun campo, in alcuna codifica. Simmetricamente, si asserisce che il
percorso posteriore lo restituisce: se nessuno dei due canali lo restituisse, l'asserzione
negativa sarebbe vera per un motivo che invalida la verifica.

**Il caso che va cercato di proposito.** L'emissione «su canale posteriore» si perde nel modo più
banale: un percorso anteriore che, per comodità di sviluppo, restituisce il token insieme ai dati
di sessione, e che nessuno rimuove perché nessuno lo cerca. La prova va scritta come ricerca
attiva di questo caso, non come conferma dell'attesa.

**Che cosa non dimostra.** Non dimostra che il back-end dell'integratore custodisca il token
correttamente dopo averlo ricevuto. Quella è responsabilità di chi integra, ed è materia degli
obblighi di chi integra, non di questa verifica: l'esito lo dichiara, perché è la prima
attribuzione che un lettore frettoloso sbaglia.

### 7.5 `VP2-5` - nessun valore ammesso disabilita la proprietà

**Procedura.** Per ciascun parametro dell'insieme configurabile del §4.2, e per i valori limite -
zero, valore vuoto, valore negativo, valore molto grande, parametro assente - si tenta il
caricamento della configurazione e, dove tecnicamente possibile, si esercita il riscatto.

**Asserzione.** Ogni valore che disabiliterebbe la scadenza o l'uso singolo è **rifiutato al
caricamento**; nessuna configurazione caricabile produce un token riusabile o non scadente.

**Il limite, dichiarato in anticipo.** Come detto al §4.2, questa prova accerta il rifiuto della
configurazione, non la tenuta del comportamento a configurazione proibita imposta con la forza. La
distinzione va nell'esito. Non è una debolezza da nascondere: è la differenza fra una difesa
verificata e una difesa presunta, ed è precisamente il genere di distinzione che il registro degli
esiti esiste per conservare.

---

## 8. Il banco

**Istanza effimera, sempre.** Le prove girano contro un'istanza creata per l'esecuzione e
distrutta al termine, mai contro un ambiente condiviso. È il vincolo che il piano pone al criterio
3 e che vale identico qui per una ragione propria: `VP2-2` cambia una configurazione di sicurezza
e `VP2-5` tenta di caricarne di proibite, e nessuna delle due cose si fa su un ambiente che
qualcun altro sta usando.

**Dati sintetici e riconoscibili come tali.** Tenant, integratori, professionisti e assistiti
usati dalle prove sono sintetici. Nessun identificativo con cifra di controllo valida, nessun
recapito su un dominio assegnabile, nessun dato di persona reale in alcuna forma, in alcun
registro prodotto dalla verifica.

**Nessun segreto.** Ogni valore d'ambiente necessario al banco è un segnaposto
`${VARIABILE_AMBIENTE}`, risolto all'esecuzione e mai scritto in un file versionato.

**Codice usa-e-getta, e la regola che gli sopravvive.** Il codice che esegue queste prove nasce
nella finestra, vive in un'area separata dichiarata tale ed è escluso da ogni artefatto
distribuito. **Non diventa l'emettitore del token d'ingresso di `T-08`.** La regola è scritta nel
traguardo, è ripetuta dal piano, ed è ripetuta qui perché il momento in cui viene violata è
esattamente il momento in cui nessuno la sta rileggendo.

**I controlli definitivi vanno collocati.** Quando queste prove diventeranno controlli permanenti
- e devono diventarlo, altrimenti la proprietà regredisce come regredirebbe una configurazione non
sorvegliata - ciascuna acquisisce una riga in `pipeline/collocazione-dei-controlli.tsv` con la
propria fascia, il proprio stato e il proprio caso di prova negativa nel banco. Non è compito di
questo artefatto e non è compito della finestra: è il seguito, e va scritto nel registro degli
esiti come conseguenza sulla progettazione.

---

## 9. Che cosa questo protocollo non copre

- **Non copre il collegamento di accesso dell'assistito** (§2.1), che è un oggetto diverso con
  proprietà diverse e nessuna verifica assegnata.
- **Non copre la robustezza crittografica** del valore del token. L'entropia e la forma sono
  materia di architettura e di sicurezza applicativa; qui si verifica il ciclo di vita.
- **Non copre la limitazione di frequenza** sull'endpoint di emissione, che il corpus richiede per
  le credenziali temporanee del relay e che vale a maggior ragione qui. Non è nel criterio 2 e non
  se ne appropria: va assegnata, e la domanda spetta a `SEC`.
- **Non copre il comportamento dell'integratore** dopo la consegna del token.
- **Non è una revisione del codice.** Qui si verifica il comportamento. La revisione esterna
  indipendente del codice di sicurezza critico che `D18` prescrive è `TG-21`, è fra i tagli
  irreversibili per il periodo, e la differenza va dichiarata e non attenuata.

---

## 10. Come si registra l'esito

L'esito di questa verifica è uno fra **riuscita**, **fallita** e **riuscita con condizioni**, e va
accompagnato dalla **conseguenza sulla progettazione scritta**: è il criterio di completamento del
traguardo nella sua lettera, e un esito senza conseguenza scritta non chiude. La forma del registro
è l'artefatto `P8` del piano e questo documento non la definisce.

Tre cose vanno però nell'esito di questa verifica specifica, e si scrivono qui perché il momento
in cui si scriveranno è il momento peggiore per ricordarsele.

**La formulazione estesa della conclusione di `VP2-3`**, quella del §7.3, con l'elenco dei percorsi
e l'esclusione esplicita di ciò che è escluso. Non la sua forma abbreviata.

**Le due proprietà accertate per difetto**, e cioè che «brevissima» non è verificata finché
l'intervallo ammesso resta `[NV]` - che spetta a `SEC` fissare, §4.1 - e che `VP2-5` accerta il
rifiuto della configurazione e non la tenuta del comportamento sotto configurazione proibita.

**La conseguenza del rango.** Se l'esito è «fallita», la conseguenza da scrivere non è che una
verifica non è passata: è che **il primo rilascio utilizzabile non ha una via di integrazione**, e
quella frase va scritta per esteso, perché è la sola formulazione che rende la conseguenza leggibile
a chi decide.

---

## 11. Marcature non verificate aperte da questo artefatto

| Riferimento | Che cosa manca | Chi deve chiuderla |
|---|---|---|
| §4.1 | Intervallo ammesso del valore di scadenza. Senza di esso «brevissima» non è verificabile per configurazione arbitraria | `SEC`, prima della finestra |
| §4.1 | Tolleranza sullo scarto degli orologi applicata al confronto di scadenza per questo oggetto | Da chiedere a `SEC`; nel frattempo `VP2-2` opera a margini larghi |
| §6.2 riga `PA-4` | Se la verifica tecnica preventiva riscatti un token d'ingresso | Va confermato da `INTEG` prima della finestra; in mancanza, `PA-4` si esclude dalla conclusione |
| §2.1 | Quale traguardo assume la verifica delle proprietà del collegamento di accesso dell'assistito (`BR-052`, `RF-052`) | `SEC` insieme a chi tiene la roadmap |
| §9 | Assegnazione della verifica sulla limitazione di frequenza dell'endpoint di emissione | `SEC` |
