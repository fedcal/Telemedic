---
title: Oltre il primo rilascio
sidebar_position: 5
description: Che cosa viene dopo il primo rilascio installabile, in ordine di priorità motivata — la coda pianificata voce per voce con criteri di completamento binari e innesco dichiarato, ciò che è soltanto desiderabile e che cosa manca perché diventi pianificato, e ciò che non torna in nessun rilascio.
---

# Oltre il primo rilascio

Il capitolo [03](./03-primo-rilascio-utilizzabile.md) ha dichiarato che cosa `RU-1` contiene e
che cosa non contiene. Questo capitolo risponde alla domanda successiva, che è quella che un
integratore pone appena finito di leggere l'elenco delle esclusioni: **e poi?**

> **La risposta utile non è un elenco di cose che si faranno.** È la distinzione fra ciò che è
> **pianificato** — con una posizione in coda, un criterio di completamento e un innesco
> dichiarato — e ciò che è **soltanto desiderabile**, cioè privo di tutte e tre queste cose. Un
> documento che presenta le due categorie con la stessa grafica ha già ingannato chi lo legge,
> anche se ogni singola frase è vera.

---

## 1. Le due categorie, e la regola che le separa

Le tre classi di enunciato del progetto — `[IMPEGNO]`, `[INTENZIONE]`, `[IPOTESI]` — restano
quelle definite in [00 §2](./00-indice.md) e non vengono ridefinite qui. Questo capitolo
introduce una partizione **ortogonale**, che serve a un lettore diverso: non a chi valuta
l'affidabilità di una data, ma a chi deve decidere se aspettare una funzione o procurarsela
altrove.

| Categoria | Marcatore | Che cosa ha | Che cosa autorizza a dire |
|---|---|---|---|
| **Pianificato** | `OL-nn` | Una posizione in coda motivata, uno o più **criteri di completamento binari**, un **innesco** dichiarato, un **titolare** | «È in coda, in questa posizione, e si sblocca quando accade questo» |
| **Desiderabile** | `DS-nn` | Una motivazione e **nulla di più**. Nessuna posizione, nessun criterio, nessun innesco | «Ci piacerebbe, e oggi manca **questo** perché diventi pianificato» |

**La regola, posta come vincolo `V-187`**: una voce che non abbia insieme criterio di
completamento binario, innesco dichiarato e titolare **non è pianificata**, e nessun materiale
del progetto può presentarla come tale. Non è pedanteria redazionale: è ciò che impedisce a
una risposta a un capitolato di trasformare un desiderio in un impegno contrattuale per il
tramite di una tabella ben formattata.

### 1.1 Che cosa sono le sigle `OL-nn` e `DS-nn`

Sono **designazioni di pianificazione**, non identificativi di requisito. Non appartengono agli
intervalli congelati da `V-120` (`RF-*`, `RNF-*`, `BR-*`, `ATT-*`, `UC-*`, `OUT-*`), non entrano
nella matrice di tracciabilità e non possono comparire in una prova. Valgono esattamente quanto
la sigla `RU-1` del capitolo [03](./03-primo-rilascio-utilizzabile.md): un modo per riferirsi a
una riga di questo documento senza doverla ricopiare.

Quando una voce `OL-nn` entra in lavorazione, i requisiti che la realizzano ricevono
identificativi propri secondo la regola di [`docs/03_functional/07-fuori-perimetro.md`](../03_functional/07-fuori-perimetro.md) §7:
**identificativo nuovo, mai la modifica silenziosa di uno esistente**.

### 1.2 Che cosa non è in questo capitolo

- **Le esclusioni definitive.** Vivono in
  [`docs/03_functional/07-fuori-perimetro.md`](../03_functional/07-fuori-perimetro.md) con
  identificativo `OUT-nn` e categoria di riapribilità, e il §7 di questo capitolo vi rinvia
  senza riscriverle. Un'esclusione scritta in due posti diverge in due posti diversi.
- **Le date.** Nessuna voce di questo capitolo ha una data, e la ragione è la stessa che vale
  per il traguardo `T-10` in [02 §5](./02-traguardi.md): la capacità netta non è dichiarata
  (`Q-181`) e il primo rilascio, da cui tutte queste voci discendono, non è datato. Dichiarare
  qui un trimestre significherebbe inventarlo.
- **I rischi.** Ogni voce cita i rischi che la riguardano; la loro descrizione, con probabilità,
  impatto sul calendario, indicatore anticipatore, risposta e titolare, è in
  [05 — Rischi e dipendenze](./05-rischi-e-dipendenze.md).

---

## 2. Come è ordinata la coda

### 2.1 I criteri, e come si applicano dopo il primo rilascio

I criteri di priorità sono quelli di [01 §3](./01-principi-e-metodo.md), in ordine
lessicografico: sicurezza dell'assistito, irrecuperabilità, legittimità dell'uso, sblocco,
valore clinico per unità di costo, desiderabilità. Dopo il primo rilascio la loro applicazione
cambia forma, e la differenza va dichiarata perché altrimenti l'ordine che segue appare
arbitrario.

**I criteri 1, 2 e 3 non ordinano la coda: la filtrano.** Nulla entra in questa coda se degrada
la sicurezza dell'assistito senza un controllo di rischio, se il suo rinvio produce una perdita
irrecuperabile, o se la sua assenza rende illecito l'uso del prodotto. Una voce che violasse uno
di questi tre criteri non sarebbe una voce di coda: sarebbe un difetto del primo rilascio, e
andrebbe corretta lì.

**Ordinano la coda i criteri 4 e 5**, nell'ordine: quante altre cose una voce sblocca, e quanto
beneficio clinico produce per unità di lavoro. Il criterio 6 — desiderabilità — non ordina
niente: **è la definizione della seconda categoria**.

### 2.2 Le tre regole aggiuntive

Sono specifiche di questa coda e non discendono dai criteri generali.

**Prima — il debito regolatorio si estingue prima di aggiungere.** Se al momento di aprire una
voce esiste una lacuna dichiarata ai sensi di [01 §8](./01-principi-e-metodo.md) — un requisito
senza prova, un controllo di rischio senza verifica di efficacia, un `[NV]` aperto su un
componente rilasciato, una divergenza fra le due lingue — quella lacuna si chiude prima. La
ragione è aritmetica: il debito regolatorio non si rifinanzia, e ogni funzione aggiunta sopra
una lacuna ne aumenta la superficie invece di lasciarla costante.

**Seconda — ciò che sblocca chi integra precede ciò che aggiunge una prestazione.** Una
prestazione nuova produce valore per un tenant; una capacità di integrazione mancante blocca
**tutti** gli integratori contemporaneamente e li obbliga a costruire un aggiramento che poi
manterranno per anni. A parità sui criteri 1–3, il criterio 4 spinge quasi sempre verso
l'integrazione.

**Terza — nulla si aggiunge finché il percorso verticale di `RU-1` non è stato esercitato da
qualcuno che non l'ha scritto.** È l'applicazione del criterio di composizione di
[01 §4.2](./01-principi-e-metodo.md): un secondo percorso verticale costruito su un primo mai
messo alla prova moltiplica per due un difetto invece di scoprirlo.

### 2.3 La coda è per priorità, non per sequenza obbligata

Va detto con chiarezza perché è la cosa che più spesso viene fraintesa: **la posizione in coda
esprime la priorità, non l'ordine di consegna.** Una voce piccola e sbloccata non attende una
voce grande e bloccata da una decisione del committente. La regola che governa il sorpasso è
una sola, ed è verificabile:

> Una voce può superare quelle che la precedono **solo se il suo innesco si è verificato e
> quello delle voci precedenti no**, e il sorpasso è registrato nella revisione mensile di
> [00 §8.1](./00-indice.md) con la causa. Un sorpasso non registrato è un cambio di priorità
> non deciso.

---

## 3. La coda pianificata — quadro d'insieme

| # | Voce | Enunciato | Perché non è in `RU-1` | Innesco | Titolare |
|---|---|:-:|---|---|---|
| `OL-01` | Telemonitoraggio, percorso completo | `[INTENZIONE]` | Contesto più esteso del catalogo; dipende dal congelamento della destinazione d'uso | Chiusura di `Q-144` **e** di `Q-120` | Progetto, dopo decisione del committente |
| `OL-02` | Terzo partecipante alla sessione | `[INTENZIONE]` | Decisione sulla topologia dichiarata rinviata | Chiusura di `C-2` e misura di `Q-115` | Committente, poi progetto |
| `OL-03` | Registrazione della sessione lato server | `[INTENZIONE]` | È una **seconda modalità di sicurezza**, non una funzione opzionale | Esito di `T-04` criterio 4 e chiusura di `C-3` | Progetto |
| `OL-04` | Teleconsulto, teleconsulenza e second opinion | `[INTENZIONE]` | Ciascuna è una macchina a stati propria con attori ammessi diversi | Chiusura di `OL-01` o capacità dedicata | Progetto |
| `OL-05` | Teleassistenza | `[INTENZIONE]` | Attori e artefatti diversi; il vincolo professionale si applica all'attività | Successiva a `OL-04` | Progetto |
| `OL-06` | Canale asincrono e condivisione di documenti in sessione | `[INTENZIONE]` | Non attraversata dal percorso verticale scelto per `RU-1` | Nessuno esterno: capacità | Progetto |
| `OL-07` | Conferimento alle infrastrutture documentali | `[IPOTESI]` | I modelli documentali non sono pubblicamente disponibili | Disponibilità del materiale (`Q-07`, `B-7`) | Terzo; il progetto attende |
| `OL-08` | Conformità verificata sull'identità digitale nazionale | `[IPOTESI]` | Richiede ambienti di pre-produzione e credenziali non sotto il controllo del progetto | Accesso agli ambienti | Chi installa fornisce l'accesso |
| `OL-09` | Messaggistica ospedaliera, profili documentali, avvio applicativo in contesto clinico | `[IPOTESI]` | Richiedono una controparte con un ambiente di prova | Disponibilità di una controparte | Integratore o ente |
| `OL-10` | Kit di sviluppo in due linguaggi | `[INTENZIONE]` | L'interfaccia applicativa versionata è sufficiente alla prima integrazione | Nessuno esterno: capacità | Progetto |
| `OL-11` | Moduli propri di agenda, fatturazione e rendicontazione | `[INTENZIONE]` | `RU-1` riceve l'appuntamento per riferimento, che è il caso d'uso di riferimento | Un adottante privo di agenda propria | Progetto |
| `OL-12` | Contesto autonomo della rendicontazione | `[INTENZIONE]` | Decisione dichiarata rinviata al committente | Chiusura di `C-1` | Committente, poi progetto |
| `OL-13` | Punteggi di scale e questionari validati | `[IPOTESI]` | Regime di licenza non verificato; misura cautelativa in vigore | Chiusura di `B-3` e `Q-11` con esito favorevole | `COMP` |
| `OL-14` | Oscuramento selettivo del contenuto audio-video | `[INTENZIONE]` | Dichiarata non presente nella prima versione | Chiusura di `Q-157` verso `COMP` | `COMP`, poi progetto |

**Che cosa non è in questa tabella e va detto qui.** Il **periodo di supporto dichiarato** e il
**piano di dismissione delle versioni** (`C-4`, `Q-186`) non sono voci di coda: sono
**prerequisiti della prima distribuzione**, elencati fra i criteri del traguardo `T-05` in
[02 §3](./02-traguardi.md). Metterli in coda significherebbe ammettere che si possa distribuire
senza dichiarare per quanto tempo si sostiene ciò che si è distribuito.

---

## 4. Le voci una per una

Ogni voce ha la stessa forma. **I criteri di completamento sono binari**: si soddisfano o non si
soddisfano, e la verifica non richiede una discussione.

### `OL-01` — Telemonitoraggio, percorso completo
*`[INTENZIONE]` · prima posizione*

**Che cosa comprende.** Arruolamento in un percorso, piano individuale versionato, acquisizione
delle misure da un gateway di terze parti, inserimento manuale da parte dell'assistito o del
caregiver, questionari strutturati, valutazione delle misure contro le regole del piano vigente
all'istante di misura, allarmi, catena di escalation, attesa di rilevazione, aderenza e
sorveglianza del volume atteso.

**Perché non è in `RU-1`.** Tre ragioni, in ordine di peso. **Prima**: dipende dal congelamento
formale della destinazione d'uso (`Q-144`, `D46`), e finché quella decisione è aperta ogni riga
scritta nel contesto di telemonitoraggio è lavoro a rischio di riscrittura integrale — non di
correzione, di riscrittura, perché la differenza fra le due formulazioni sposta la classe di
rischio e la classe di sicurezza del software. **Seconda**: è il contesto più esteso del
catalogo dei requisiti, e il criterio di composizione di `RU-1` impone il percorso verticale più
stretto possibile, non il più ampio. **Terza**: la sua rappresentazione delle regole è una
decisione architetturale aperta (`Q-120`), e realizzare un motore prima di aver deciso quanto
debba essere espressivo produce esattamente l'esito che quella questione vuole evitare — un
linguaggio di programmazione arbitrario eseguito in produzione, che è insieme superficie di
attacco e oggetto non validabile ai fini regolatori.

**Perché è comunque in prima posizione.** Perché è la funzione su cui si fonda la
qualificazione che il progetto ha assunto (`D26`): la valutazione automatica delle soglie è
l'elemento che costituisce interpretazione. Un prodotto che accetta il costo della Classe IIa e
non eroga la funzione che quel costo giustifica ha pagato il prezzo e non ha comprato niente.

**Criteri di completamento.**

1. Un piano individuale versionato è attivabile **solo** se esiste una copertura oraria
   dichiarata per il tenant e per il percorso, e il tentativo di attivarlo senza copertura
   fallisce in ogni configurazione supportata (`V-122`).
2. Il campo della soglia si presenta **vuoto e obbligatorio** in ogni percorso di redazione, e
   una prova negativa verifica che nessuna precompilazione avvenga, nemmeno con i valori del
   percorso o dell'ultimo piano (`V-123`, `OUT-08`).
3. Istante di misura e istante di ricezione sono due campi distinti obbligatori, e le regole
   operano sull'istante di misura; una prova con misure recapitate fuori ordine produce lo
   stesso esito di una prova con misure in ordine (`V-124`).
4. L'assenza di misura è rappresentata come **entità**, con finestra attesa, istante di scadenza
   e causa quando nota; una prova verifica che l'assenza produca una riga e non l'assenza di una
   riga (`V-148`).
5. L'allarme è una **sequenza di eventi immutabili** e lo stato corrente è una proiezione;
   nessuna colonna di stato è aggiornata sul posto, verificato da una prova che ricostruisce lo
   stato dalla sequenza e lo confronta con la proiezione (`V-121`).
6. Un destinatario fuori copertura non è un destinatario valido nella catena di escalation:
   viene saltato con motivo registrato, e l'allarme **resta aperto** quando l'escalation
   fallisce.
7. La valutazione è **deterministica e riproducibile** su vettori di prova versionati, con la
   versione della regola registrata sull'allarme.
8. Il sistema **non deduce** soglie da popolazione o da storico, non interpola le serie, non
   calcola punteggi: le prove negative delle esclusioni corrispondenti passano.

**Da che cosa dipende la data.** Da `Q-144` e `Q-120` per la parte che il progetto non decide;
da `Q-122` e `B-9` per il contratto minimo del gateway di misure, che è `[NV]` sulla
disponibilità effettiva di due segnali; da `Q-125` per la codifica dei parametri, con il vincolo
che il sistema resti operativo con il servizio terminologico esterno disattivato (`V-03`); da
`Q-124` per la collocazione del registro degli allarmi nella modalità di esercizio senza
conservazione del contenuto clinico. **Nessuna di queste dipendenze è del progetto soltanto**, e
questa è la ragione per cui la voce è `[INTENZIONE]` e non `[IMPEGNO]`.

**Rischi.** `R-17` (decisioni non prese), `R-23` (deriva del perimetro: è la voce con la
maggiore pressione ad ampliarsi verso l'interpretazione), `R-11` (contratto del gateway non
verificato).

### `OL-02` — Terzo partecipante alla sessione
*`[INTENZIONE]` · seconda posizione*

**Che cosa comprende.** La presenza in sessione di un terzo soggetto: interprete, caregiver che
assiste l'assistito, secondo professionista, operatore sanitario presso il domicilio.

**Perché non è in `RU-1`.** Perché la topologia della sessione oltre due partecipanti è una
decisione dichiarata rinviata (`C-2`, con la parte di misura registrata come `A-5` in
[`docs/02_architecture/09-decisioni-rinviate.md`](../02_architecture/09-decisioni-rinviate.md)),
e non è una decisione tecnica: la topologia a maglia senza componente centrale è l'unica che
preserva la cifratura fino agli estremi, e superarne il limite significa introdurre un
componente che **termina la cifratura**, cioè una terza modalità operativa con proprietà di
sicurezza diverse. Il numero massimo, inoltre, dipende dal budget di trasmissione del
partecipante peggio connesso, che si misura su un dispositivo e una rete di riferimento **non
ancora dichiarati** (`Q-115`).

**Perché è in seconda posizione, davanti a voci più richieste.** Perché l'interprete è la
**misura alternativa dichiarata** per l'unica non conformità di accessibilità che il progetto
ammette, quella sui sottotitoli in tempo reale (`D24`). Finché il terzo partecipante non esiste,
la misura alternativa non esiste, e una non conformità dichiarata con una misura alternativa
inesistente è una non conformità senza misura alternativa. Il criterio 3 di
[01 §3](./01-principi-e-metodo.md) — legittimità dell'uso — vi si applica direttamente. È
inoltre una voce di sforzo modesto rispetto a tutte le altre della coda, e la seconda regola del
§2.3 le consente il sorpasso se il suo innesco si verifica prima.

**Criteri di completamento.**

1. Il limite di partecipanti è **dichiarato nella documentazione e applicato dal codice**, con
   un errore comprensibile al partecipante eccedente che ne spiega la ragione e indica
   l'alternativa; è configurazione con un massimo imposto, e un tenant può abbassarlo ma mai
   alzarlo.
2. Il numero è stato **misurato** sul dispositivo e sulla rete di riferimento dichiarati, non
   stimato, e la misura è conservata come artefatto.
3. La presenza di un terzo è un **oggetto di consenso distinto**, con ciclo di vita proprio, la
   cui revoca non tocca gli altri quattro (`V-146`).
4. La verifica delle chiavi resta obbligatoria per impostazione predefinita e resta uno stato
   bloccante della macchina a stati anche con tre partecipanti.
5. La presenza del terzo è riportata nel documento clinico nel campo previsto dal tracciato, in
   forma strutturata.

**Se la misura esclude il terzo partecipante.** È l'esito che va dichiarato prima e non scoperto
dopo: in quel caso la misura alternativa per la non conformità di accessibilità **va
riesaminata**, e il riesame è a carico di chi ha dichiarato la non conformità. Non è un dettaglio
tecnico: è una dipendenza fra una decisione di ingegneria e una dichiarazione pubblica di
accessibilità.

**Rischi.** `R-17`, `R-19` (dichiarazione pubblica non sostenuta dal prodotto).

### `OL-03` — Registrazione della sessione lato server
*`[INTENZIONE]` · terza posizione*

**Che cosa comprende.** La seconda modalità di sessione prevista da `D23`: il media transita per
un componente di registrazione, la cifratura è terminata sul server, il materiale è cifrato a
riposo con chiavi per tenant e ha una scadenza sempre valorizzata.

**Perché non è in `RU-1`.** Perché **non è una funzione opzionale: è una seconda modalità di
sicurezza.** Comporta un componente distinto con un proprio perimetro, un flusso di consenso
dedicato, una gerarchia di chiavi, una politica di conservazione, una procedura di riproduzione
tracciata e — soprattutto — un'informativa che dichiara esplicitamente all'assistito che **la
sessione non è più cifrata fino agli estremi**. Consegnarla insieme al primo rilascio avrebbe
significato consegnare due modalità di sicurezza nessuna delle quali provata a fondo.

**Che cosa `RU-1` ha già fatto per lei, e perché è la scelta giusta.** L'indicatore di
registrazione persistente e non occultabile **esiste già** in `RU-1`, con i suoi divieti e le
sue prove negative, benché la modalità non esista. La ragione è dichiarata in
[03 §3.8](./03-primo-rilascio-utilizzabile.md): una funzione che compare dopo con i propri
divieti non li ha mai provati. Quando `OL-03` arriverà, il presidio più delicato sarà già in
esercizio da un rilascio.

**Criteri di completamento.**

1. La modalità è uno **stato dell'aggregato della sessione**, non un attributo booleano del
   materiale registrato, e la transizione fra le due modalità è tracciata con ora e attribuzione.
2. Non esiste materiale registrato **senza consenso vigente e senza scadenza valorizzata**:
   entrambe le condizioni sono invarianti verificate da prova.
3. La **revoca del consenso ha effetto immediato** sulla registrazione in corso, verificato da
   una prova che revoca a sessione aperta.
4. Il contenitore è **negoziato a runtime** in funzione dei codec effettivamente negoziati,
   senza ricodifica, e contenitore e codec effettivi sono registrati nei metadati (`V-11`,
   `V-115`). **Nessun formato unico è dichiarato in alcun materiale.**
5. L'indicatore di registrazione non è occultabile: la prova che tenta di nasconderlo con ogni
   mezzo previsto dalla configurazione fallisce in tutti.
6. Il materiale registrato **non è documentazione clinica** ed entra nel contesto documentale
   solo per acquisizione esplicita decisa dal professionista e registrata.
7. L'informativa di consenso dichiara esplicitamente la perdita della proprietà di cifratura
   fino agli estremi, in entrambe le lingue, con testo versionato e consenso riferito alla
   versione del testo.

**Da che cosa dipende la data.** Dall'esito della verifica sul contenitore (`T-04`, criterio 4)
e dalla chiusura di `C-3`, che per la parte di comunicazione pubblica è del committente.

**Rischi.** `R-19` (una dichiarazione pubblica su un formato non verificato), `R-25`
(componente esposto in più).

### `OL-04` — Teleconsulto, teleconsulenza e second opinion
*`[INTENZIONE]` · quarta posizione*

**Che cosa comprende.** Le prestazioni fra professionisti: il teleconsulto fra medici, la
teleconsulenza fra professioni sanitarie diverse, e il parere ulteriore richiesto su un caso
già documentato, che è una variante asincrona del teleconsulto e non una funzione a sé.

**Perché non è in `RU-1`.** Perché ciascuna è **una macchina a stati propria** con attori
ammessi diversi, artefatti obbligatori diversi, obbligo di presenza dell'assistito diverso e
insieme di esiti diverso (`V-140`). Non sono varianti di configurazione della televisita: la
tassonomia del progetto porta due attributi distinti — l'attività e il servizio minimo — che
**non coincidono**, e il vincolo professionale si applica all'**attività**, non al servizio
(`V-147`, `Q-147`). Autorizzare sul servizio minimo autorizzerebbe troppo: teleconsulto e
teleconsulenza stanno nello stesso servizio e hanno attori ammessi diversi.

**Criteri di completamento.**

1. Ogni prestazione aggiunta è **una riga di catalogo più una macchina a stati**, e nessuna
   condizione è sparsa nel codice: una prova verifica che l'aggiunta non richieda modifiche fuori
   dai due luoghi previsti.
2. L'ammissibilità del canale e degli attori è verificata **in prenotazione**, non in
   erogazione, e il tentativo di prenotare con un attore non ammesso per quell'attività fallisce.
3. L'ambito di consulto è un aggregato **con scadenza**, e la revoca automatica alla scadenza è
   provata come flusso di errore, non come comportamento accessorio.
4. Il vincolo professionale è codificato come regola di dominio **non configurabile dal tenant**,
   e una configurazione che tenti di rilassarlo è rifiutata con errore di validazione.

**Rischi.** `R-23`, `R-24`.

### `OL-05` — Teleassistenza
*`[INTENZIONE]` · quinta posizione*

**Che cosa comprende.** Le prestazioni erogate dalle professioni sanitarie non mediche, con i
propri artefatti e i propri esiti.

**Perché non è in `RU-1` e perché segue `OL-04`.** Stessa ragione strutturale di `OL-04` — è una
macchina a stati propria — con in più una considerazione di sequenza: buona parte del lavoro
di `OL-04` è la generalizzazione del catalogo delle prestazioni e della selezione della macchina
a stati dal tipo. Fatta quella, `OL-05` è prevalentemente contenuto di catalogo. Consegnarle
nell'ordine inverso significherebbe fare due volte la generalizzazione.

**Criteri di completamento.** I quattro di `OL-04`, più la verifica che il **setting di
erogazione discrimini le regole**: dove la fonte prevede l'annotazione digitale in luogo del
referto, il sistema produce l'annotazione e non pretende un referto (`V-145`).

### `OL-06` — Canale asincrono e condivisione di documenti in sessione
*`[INTENZIONE]` · sesta posizione*

**Che cosa comprende.** Il canale di messaggistica asincrona fra assistito e struttura, e la
condivisione di documenti durante la sessione.

**Perché non è in `RU-1`.** Perché il percorso verticale scelto non lo attraversa: la televisita
programmata riceve l'appuntamento per riferimento e restituisce il documento al sistema di
origine, e il canale asincrono non è necessario a chiudere quel percorso. È l'unica voce della
coda la cui esclusione non dipende da una decisione, da un terzo o da una dipendenza: dipende
solo dal criterio di composizione.

**Criteri di completamento.**

1. Il canale dichiara in modo **persistente e non chiudibile** i tempi di risposta attesi e la
   propria non idoneità all'emergenza, con la formulazione approvata e provata con utenti
   rappresentativi.
2. Il documento condiviso in sessione **non diventa documentazione clinica** per il solo fatto di
   essere stato condiviso: l'acquisizione è un atto esplicito e registrato.
3. Nessun contenuto clinico è veicolato negli eventi in uscita generati dal canale: si trasmette
   il riferimento, il contenuto si rilegge con chiamata autenticata (`V-135`, `V-161`).
4. Il canale è raggiungibile da un sistema terzo tramite interfaccia documentata e versionata:
   nessuna capacità è accessibile solo dall'interfaccia (`V-164`).

### `OL-07` — Conferimento alle infrastrutture documentali nazionali e regionali
*`[IPOTESI]` · settima posizione, non databile dal progetto*

**Perché non è in `RU-1` e perché resta `[IPOTESI]`.** Perché **manca il contenuto, non il
progetto**. I modelli documentali, i codici di tipologia e i metadati di indicizzazione delle
tipologie documentali della telemedicina non sono pubblicamente disponibili (`Q-07`, `B-7`), e
la risposta strutturale è già in vigore: il contenuto informativo è modellato come **dataset
canonico** e ogni serializzazione è sostituibile (`V-07`, `V-136`, `V-143`). L'adattatore esiste
come punto di estensione con contratto dichiarato.

**Che cosa il progetto ha già fatto perché l'attesa non costi niente.** Il dataset canonico è
modellato campo per campo sul set informativo della fonte cogente, non sul profilo di
rappresentazione. Quando il materiale arriverà, il lavoro sarà **la scrittura di un mappatore**,
non una migrazione del modello di dominio. È la differenza fra un'attesa che costa zero e
un'attesa che costa una riscrittura, e non è un caso: è l'applicazione letterale di `V-07`.

**Criteri di completamento.**

1. La verifica di copertura campo per campo fra dataset canonico e profilo di rappresentazione è
   eseguita, con l'analisi degli scostamenti documentata; dove il profilo non ha posto per un
   campo della fonte cogente esiste un'estensione dichiarata o una collocazione motivata
   (`Q-132`).
2. Il conferimento avviene **passando dal mediatore unico di uscita** (`V-157`), come ogni altra
   chiamata verso un sistema esterno.
3. Nessun template è cablato: il mappatore è configurazione versionata, e una prova verifica che
   la sostituzione del mappatore non richieda modifiche al dominio.

**Chi se ne fa carico.** L'interlocuzione per ottenere il materiale è dell'area di conformità
(`Q-07`); la realizzazione è del progetto. **La data è di un terzo** e ricade nel vincolo
`V-180`: il progetto non la dichiara.

### `OL-08` — Conformità verificata sull'identità digitale nazionale, su tutti i canali
*`[IPOTESI]` · ottava posizione, non databile dal progetto*

**Che cosa `RU-1` contiene già.** L'architettura di federazione con i realm distinti e il realm
di intermediazione unico verso la federazione, e l'accettazione di un'identità già autenticata
dal sistema dell'integratore con delega esplicita.

**Che cosa manca, e perché non dipende dal progetto.** La **conformità verificata** sull'intero
insieme dei fornitori richiede ambienti di pre-produzione, credenziali di prova e — per uno dei
canali — **due istanze di fornitore di identità per ciascun fornitore**, perché il contesto di
autenticazione richiesto è configurato staticamente sulla singola istanza (`Q-05`, `D38`). È il
lotto di lavoro sistematicamente sottovalutato, e il moltiplicatore agisce su un insieme la cui
cardinalità **si legge da un registro nazionale e non si cabla**. Ogni variazione delle istanze
comporta un nuovo deposito del documento di metadata presso l'autorità: è costo di procedura,
non di codice, e non è comprimibile.

**Il limite che nessun rilascio rimuove.** Il progetto è **conforme e verificabile, non
accreditato** (`V-05`, `D36`, `OUT-22`). Il fornitore di servizi verso la federazione è chi
installa. Nessuna voce di questa coda cambia questa ripartizione, e i tempi
dell'accreditamento **non sono dichiarati da alcuna fonte primaria**: non compaiono in questa
roadmap perché non esistono, non perché non siano stati cercati.

**Criteri di completamento.**

1. La suite di conformità del canale che lo prevede è superata **per intero**, comprese le prove
   di manipolazione dell'asserzione firmata, ed è eseguita in integrazione continua a ogni
   costruzione, non una volta.
2. Il livello di garanzia propagato è quello **richiesto** e non quello asserito, ed è sempre
   qualificato per distinguere l'autenticazione **eseguita** da quella **riferita** da un
   integratore (`V-154`, `V-165`).
3. I tre difetti noti del prodotto di federazione sono chiusi in configurazione **e** sorvegliati
   da una prova che fallisce se la configurazione regredisce.
4. Il canale privo di dipendenze esterne è completabile e completato senza attendere gli altri
   due: è l'unico su cui il progetto non dipende da nessuno.

**Rischi.** `R-13`, `R-14`, `R-15`, `R-11`.

### `OL-09` — Messaggistica ospedaliera, profili di interoperabilità documentale e avvio applicativo in contesto clinico
*`[IPOTESI]` · nona posizione, non databile dal progetto*

**Perché non è in `RU-1`.** Perché tutte e tre richiedono una **controparte con un ambiente di
prova**. Un adattatore di messaggistica ospedaliera scritto senza un motore di integrazione
reale contro cui provarlo è un adattatore che funziona sugli esempi; un profilo di
interoperabilità documentale dichiarato senza una prova di connettività è una dichiarazione; un
avvio applicativo in contesto clinico senza un server della controparte è una simulazione di sé
stesso.

**Che cosa il progetto può fare da solo, e che cosa no.** Può pubblicare il contratto, le prove
a contratto in entrambe le direzioni e i dati sintetici. **Non può** dichiarare conformità: la
perdita informativa nella traduzione fra formati **va misurata, non presunta**, e la misura
richiede messaggi reali di una controparte reale.

**Criteri di completamento.**

1. Esiste almeno una controparte con cui la connettività è stata provata da estremo a estremo,
   con esito registrato e con la perdita informativa nella traduzione **misurata e dichiarata**.
2. Nessuna formula di conformità vietata compare nel materiale prodotto: le mappe fra messaggi e
   risorse sono informative e vanno citate come tali (`V-133`).
3. Il codice di tipo dell'identificatore nel canale legacy è **contrattuale con l'integratore** e
   documentato come tale, non presentato come conformità a una tabella.

### `OL-10` — Kit di sviluppo in due linguaggi
*`[INTENZIONE]` · decima posizione*

**Perché non è in `RU-1`.** Perché è **comodità, non capacità**: l'interfaccia applicativa
versionata, il documento di capacità e le prove a contratto sono sufficienti a completare una
prima integrazione, e un kit che precedesse la stabilizzazione dell'interfaccia sarebbe da
riscrivere. `D4` lo dichiara nel perimetro e questa coda lo mantiene: è pianificato, non
desiderabile.

**Perché è in decima posizione e non più su.** Perché un kit di sviluppo è un **secondo
contratto pubblico** da mantenere per il periodo di supporto dichiarato, con la propria
cadenza di dismissione e i propri dodici mesi di preavviso. Aggiungerlo prima che l'interfaccia
sia stata esercitata da un integratore reale significa raddoppiare la superficie contrattuale
prima di sapere se la prima metà è giusta.

**Criteri di completamento.**

1. Il kit è **generato** dal descrittore dell'interfaccia versionato, non scritto a mano: una
   divergenza fra kit e interfaccia è impossibile per costruzione, non evitata per disciplina.
2. Ogni esempio del kit è **verificato in integrazione continua**; un esempio che non si compila
   o non si esegue fa fallire la costruzione.
3. Il kit non contiene logica di dominio: se una regola vive nel kit, la stessa regola non è
   applicata dal server e il vincolo `V-164` è violato.

### `OL-11` — Moduli propri di agenda, fatturazione e rendicontazione
*`[INTENZIONE]` · undicesima posizione*

**Perché non è in `RU-1`.** Perché il caso d'uso di riferimento del progetto è l'integrazione
con un sistema che **ha già** un'agenda: `RU-1` riceve l'appuntamento per riferimento e non
diventa il dato di riferimento. I moduli propri servono a chi non ha già un'agenda, che è un
adottante legittimo ma non è quello su cui il primo rilascio è disegnato.

**Il vincolo che governa questa voce.** `D14` è esplicita: i moduli propri esistono ma sono
**disattivabili e sostituibili per configurazione**, e quando esiste un modulo regionale o
dell'integratore il sistema **si integra invece di duplicare**. Un modulo proprio che non si
possa spegnere non è un modulo proprio: è una duplicazione imposta.

**Criteri di completamento.**

1. Ogni modulo proprio è **spegnibile per configurazione** e, da spento, il percorso funziona
   integralmente attraverso l'interfaccia del modulo sostituibile corrispondente.
2. La suite funzionale completa gira **due volte**: una con i moduli propri attivi, una con tutti
   sostituiti da attuazioni di prova. Entrambe passano.
3. Nessuna capacità è disponibile **solo** con il modulo proprio attivo: la matrice delle
   capacità nelle due configurazioni è identica, e la verifica è automatica.

### `OL-12` — Contesto autonomo della rendicontazione
*`[INTENZIONE]` · dodicesima posizione*

**Perché non è in `RU-1`.** Perché è una decisione dichiarata rinviata al committente (`C-1`) e
**una decisione rinviata non si prende in una proposta di modifica**.

**Perché è comunque in coda e non fra i desiderabili.** Perché la sua assenza ha un costo
dichiarato e non nullo: finché la rendicontazione non è un contesto autonomo, il divieto per cui
il profilo del pagatore è amministrativo per costruzione (`V-166`, `OUT-18`) è una **convenzione
di codice**, verificabile solo con una prova dedicata e soggetta all'erosione, invece di essere
un **confine**, verificabile automaticamente. Il rischio non è che il sistema oggi faccia la cosa
sbagliata: è che in una versione futura un evento destinato alla liquidazione acquisisca un
riferimento a un documento clinico senza che nulla lo impedisca strutturalmente.

**Criteri di completamento.**

1. Il divieto è verificato da una **regola di dipendenza** che fa fallire la costruzione, non da
   una prova che si può dimenticare di aggiornare.
2. L'evento destinato alla liquidazione trasporta identificativo della prestazione, esito
   amministrativo e importo, **e nient'altro**: una prova negativa tenta di aggiungervi un
   riferimento clinico e fallisce.

### `OL-13` — Punteggi di scale e questionari clinici validati
*`[IPOTESI]` · tredicesima posizione*

**Perché non è in `RU-1`.** Per una misura cautelativa in vigore e motivata: il regime di
licenza degli strumenti non è verificato (`B-3`, `Q-11`), le scale e i questionari validati hanno
licenze proprie distinte da quelle delle terminologie, e la verifica va fatta **strumento per
strumento sulla licenza primaria**, non sulla dichiarazione del contenitore che li ricomprende.

**Perché la misura cautelativa è nella direzione giusta.** Perché è **reversibile senza
migrazione**: il sistema conserva la risposta al questionario, con riferimento a una versione
immutabile dello strumento; aggiungere in seguito il calcolo su risposte già conservate è
possibile. L'ordine inverso non lo è: realizzare il calcolo e verificare dopo significherebbe
rimuovere una funzione già promessa e già usata, con dati storici calcolati da un algoritmo non
più eseguibile.

**Le due avvertenze che questa voce si porta dietro.** La prima: se il calcolo verrà introdotto,
va valutato il confine con la finalità interpretativa, perché **un punteggio calcolato dal
sistema è più vicino a quel confine di una risposta conservata**. La seconda: il contenuto degli
strumenti — testo delle domande, opzioni, algoritmo — non è nella distribuzione ed è dato di
configurazione per tenant, caricato da chi installa, che è il soggetto che ha o può ottenere la
licenza.

**Criteri di completamento.** Il primo è di conformità e precede tutti gli altri: **esiste la
determinazione di regime per ciascuno strumento ammesso**, verificata sulla licenza primaria e
registrata. Senza quella, i criteri tecnici non si esaminano.

### `OL-14` — Oscuramento selettivo del contenuto audio-video
*`[INTENZIONE]` · quattordicesima posizione*

**Perché non è in `RU-1`.** Perché è dichiarata non presente nella prima versione ed è
registrata come esclusione di categoria `SCOPE` — quindi riapribile con il normale governo del
prodotto e non con una valutazione regolatoria (`Q-157`).

**Perché il problema è strutturalmente raro.** Due elementi del progetto ne riducono la
frequenza alla radice, e vanno detti perché cambiano la priorità: la registrazione è
**eccezione e non regola**, disabilitata per impostazione predefinita a ogni livello e con
consenso specifico per sessione; e per i tipi di prestazione marcati non registrabili la
funzione è **assente e non disattivabile neppure da un amministratore**.

**Che cosa resta da decidere prima di realizzarla.** Se il rilascio parziale — il solo audio
della parte richiedente — soddisfi l'istanza dell'interessato, o se la valutazione caso per caso
vada comunque documentata. È una determinazione di conformità, non di prodotto, e finché non
esiste la realizzazione sarebbe una risposta a una domanda non posta.

---

## 5. Ciò che è soltanto desiderabile

Nessuna delle voci seguenti è pianificata. Nessuna ha una posizione, un criterio o un innesco.
Ciascuna dichiara **che cosa manca perché diventi pianificata**, che è l'unica informazione
utile a chi legge.

### `DS-01` — Sottotitoli in tempo reale

**Perché sarebbe desiderabile.** Rimuoverebbe l'unica non conformità di accessibilità che il
progetto dichiara, e renderebbe non necessaria la misura alternativa di `OL-02`.

**Che cosa manca.** Un motore di trascrizione, che è un componente con tre implicazioni non
risolte: **sovranità** — nessuna dipendenza obbligatoria fuori dall'Unione è ammessa (`V-01`), e
i motori con la qualità richiesta sono in prevalenza servizi remoti; **licenza** — un modello va
collocato nei regimi della politica sui contenuti di terzi come qualunque altro contenuto;
**qualificazione** — un sottotitolo è veicolo di comunicazione, ma una trascrizione che
riassumesse, correggesse o normalizzasse contenuto clinico non lo sarebbe più.

**Che cosa il progetto ha comunque fatto.** Il canale dati dei sottotitoli è **definito e
versionato nel protocollo**, come impone `D24`. Innestare un motore in futuro non richiede di
riprogettare la sessione: è una scelta deliberata e ha già pagato il suo costo.

### `DS-02` — Lingue ulteriori oltre l'italiano e l'inglese

**Perché sarebbe desiderabile.** Il decreto sulle infrastrutture regionali richiede il
multilingua, e l'architettura di internazionalizzazione è predisposta fin dall'inizio.

**Che cosa manca.** Chi traduce e chi **mantiene l'allineamento**. Con due lingue l'obbligo di
integralità di `D50` già raddoppia il costo marginale di ogni modifica documentale; con tre lo
triplica, **per sempre**. Prima di aggiungere una lingua va dimostrato che il controllo di
divergenza fra le due esistenti non produce rilievi in modo stabile: aggiungere una terza lingua
a un corpus che già diverge significa moltiplicare la divergenza, non estendere la copertura.

### `DS-03` — Applicazione nativa per dispositivi mobili

**Perché sarebbe desiderabile.** Accesso a capacità del dispositivo non disponibili al
navigatore, e notifiche più affidabili.

**Che cosa manca, e perché non è una decisione tecnica.** Un artefatto distribuito attraverso un
canale di distribuzione applicativa ha **un regime proprio**: due catene di distribuzione, due
cicli di aggiornamento, due superfici da sorvegliare, e un intermediario che decide se e quando
un aggiornamento di sicurezza raggiunge l'utilizzatore — il che è in tensione diretta con un
livello di servizio di rimedio espresso in giorni (`V-185`). Il requisito del progetto è
**mobile first sul web**, non un'applicazione nativa, e le due cose non sono gradazioni della
stessa scelta.

### `DS-04` — Firma grafometrica e lettura della tessera sanitaria da lettore locale

**Perché sarebbero desiderabili.** Sono capacità ricorrenti nel profilo di integratore su cui il
progetto è disegnato.

**Che cosa manca, e perché probabilmente non arriverà.** Sono precisamente le capacità che
**l'integratore ha già**, e `D14` è esplicita: dove esiste un modulo dell'integratore, il
sistema si integra invece di duplicare. Realizzarle significherebbe costruire una seconda volta
qualcosa che il sistema di destinazione possiede, con hardware, controllori di periferica e
superficie di supporto propri. Diventerebbero pianificabili solo per un adottante che non abbia
un sistema di origine, cioè per il caso d'uso su cui il progetto **non** è disegnato.

### `DS-05` — Cruscotti clinici aggregati e indicatori di popolazione

**Perché sarebbero desiderabili.** Una struttura che eroga prestazioni a distanza vuole misurare
il proprio servizio.

**Che cosa manca, e qual è il confine.** Gli indicatori **di servizio** — volumi, esiti
amministrativi, disponibilità, qualità del collegamento — sono già misurati e non sono questa
voce. Ciò che manca, e che è desiderabile e insieme pericoloso, è l'aggregazione **clinica**:
sfiora l'uso secondario dei dati, che ha basi giuridiche e percorsi propri e non si ottiene
estendendo un'esportazione operativa, e sfiora la produzione di informazione clinica nuova. Perché
diventi pianificabile serve prima una determinazione sul confine, non una specifica di cruscotto.

### `DS-06` — Federazione fra installazioni distinte

**Perché sarebbe desiderabile.** Consentirebbe un teleconsulto fra due strutture che usano due
installazioni separate senza che nessuna delle due debba ospitare l'altra.

**Che cosa manca.** Un **modello di fiducia fra installazioni**, che oggi non esiste: il registro
di fiducia del progetto è per tenant, non fra installazioni, e la sua estensione porterebbe con
sé una gerarchia di attestazioni, una revoca fra domini amministrativi diversi e una
ripartizione di responsabilità che oggi non è nemmeno formulata. È la voce più distante di questo
elenco.

### `DS-07` — Modalità fuori linea per il contenuto clinico

**Perché sarebbe desiderabile.** Continuità operativa in condizioni di rete assente.

**Perché non è pianificata, e la ragione è dichiarata come limite.** Il limite 7 di
[03 §6](./03-primo-rilascio-utilizzabile.md) è una **scelta**, non una mancanza: contenuto
clinico su un dispositivo che il titolare del trattamento non controlla è un rischio che il
progetto non assume. La sola variante che potrebbe diventare pianificabile è la conservazione
locale temporanea di una **misura inserita senza connettività**, che è dato prodotto
dall'assistito e non contenuto clinico altrui, ed è già un requisito del contesto di `OL-01`.

---

## 6. Perché questa coda ha questa forma, in tre osservazioni

**Prima — nove voci su quattordici non dipendono dalla capacità del progetto.** Dipendono da una
decisione del committente (`OL-01` per il congelamento della destinazione d'uso, `OL-02`,
`OL-03` per la parte di comunicazione pubblica, `OL-12`), da una determinazione di conformità
(`OL-13`, `OL-14`), o da un terzo che deve rendere disponibile qualcosa (`OL-07`, `OL-08`) o
presentarsi (`OL-09`). È il dato più importante di questo capitolo e ha una conseguenza pratica:
**aumentare la capacità di sviluppo non accorcia questa coda in modo proporzionale.** Ciò che
l'accorcia è chiudere decisioni e avviare interlocuzioni, che sono attività di classe `B` e `C`
secondo [01 §2](./01-principi-e-metodo.md) e costano poco.

**Seconda — le voci più richieste non sono le prime.** La registrazione della sessione e i kit di
sviluppo sono, prevedibilmente, le due richieste più frequenti di un integratore; stanno in terza
e decima posizione. La ragione non è che siano poco importanti: è che la prima è una modalità di
sicurezza che va provata prima di essere offerta, e il secondo è un contratto pubblico in più da
mantenere per tutto il periodo di supporto. Una coda ordinata per frequenza delle richieste è una
coda ordinata da chi non ne paga la manutenzione.

**Terza — nessuna voce di questa coda rimuove il limite d'uso.** Nemmeno tutte insieme. Il
prodotto non è utilizzabile per l'erogazione di prestazioni sanitarie su pazienti reali finché
non esiste una marcatura apposta da un soggetto fabbricante che se ne assume la responsabilità, e
il progetto non appone marcatura (`D16`, `D28`, `D49`, `V-06`, `OUT-20`). Una coda di funzioni
non è un percorso di certificazione, e presentarla come tale sarebbe l'errore più costoso di
tutto il documento.

---

## 7. Ciò che non torna in nessun rilascio

Non è una parte di questo capitolo: è un rinvio, e va letto come tale.

Le esclusioni definitive vivono in
[`docs/03_functional/07-fuori-perimetro.md`](../03_functional/07-fuori-perimetro.md), ciascuna
con identificativo `OUT-nn`, categoria di riapribilità e **modo in cui è verificata**.
Comprendono l'interpretazione clinica in ogni sua forma, la deduzione delle soglie, il triage
calcolato, la verifica delle interazioni fra farmaci, il dialogo diretto con i dispositivi
medici domiciliari, il canale di emergenza, il riconoscimento biometrico, l'indice di
riconciliazione delle identità, la mediazione dell'accesso di un pagatore al fascicolo e la
conservazione a norma.

Tre precisazioni che riguardano questa coda e non quel capitolo:

1. **Un'esclusione di categoria `NORM` non è riapribile finché la fonte è in vigore.** Non entra
   in questa coda, non entra fra i desiderabili, e una richiesta in tal senso non è una proposta
   di funzione: è una richiesta di violare una fonte.
2. **Un'esclusione di categoria `QUAL` richiede una valutazione di impatto regolatorio
   registrata, e la valutazione precede la stima dello sforzo.** L'ordine è vincolante, perché
   stimare per primo fa apparire economica una modifica che comporta una rivalutazione di
   conformità.
3. **Tre funzionalità sono a una singola storia utente dall'innalzamento di classe** — allerta su
   soglia, elaborazione dell'immagine, refertazione assistita — e sono sotto controllo delle
   modifiche. Una proposta che le tocchi non è una proposta di funzione: è una proposta di
   modifica del dispositivo, e segue quel percorso.

---

## 8. Come una voce cambia categoria

Le transizioni ammesse sono quattro, e ciascuna ha una condizione verificabile.

| Da | A | Condizione | Chi la accerta |
|---|---|---|---|
| Desiderabile | Pianificata | Esistono insieme: criterio di completamento binario, innesco dichiarato, titolare nominato (`V-187`) | Revisione mensile di [00 §8.1](./00-indice.md) |
| Pianificata | Desiderabile | L'innesco è decaduto e non è sostituibile — per esempio la controparte esterna non esiste più | Revisione mensile, con la causa registrata |
| Pianificata | Fuori perimetro | Una determinazione di conformità o una decisione del committente la esclude | `COMP` o committente, con voce `OUT-nn` nuova |
| Fuori perimetro | Pianificata | La procedura di [`docs/03_functional/07-fuori-perimetro.md`](../03_functional/07-fuori-perimetro.md) §7, con il costo proporzionato alla categoria | Secondo la categoria |

**Che cosa non è ammesso, ed è la parte che conta.** Una voce non passa da desiderabile a
pianificata perché qualcuno l'ha chiesta con insistenza, perché compare in un capitolato o
perché è stata citata in una presentazione. Passa quando ha i tre elementi di `V-187`. È la
stessa disciplina che [01 §6](./01-principi-e-metodo.md) impone alle proposte di ampliamento del
perimetro, applicata alla coda invece che al confine.

---

## 9. Che cosa questo capitolo non promette

- **Non promette che l'ordine non cambi.** Promette che ogni variazione passi dalla revisione
  mensile con la causa registrata, e che un sorpasso senza innesco verificato sia una violazione
  dichiarata e non una riorganizzazione silenziosa.
- **Non promette una data per nessuna voce.** Nessuna. Le voci `[IPOTESI]` dipendono da terzi e
  ricadono in `V-180`; le voci `[INTENZIONE]` dipendono dalla capacità netta, che non è
  dichiarata (`Q-181`).
- **Non promette che tutte le voci arrivino.** Una coda in cui ogni voce arriva è una coda in cui
  nessuna è stata valutata. Il §8 descrive esattamente come una voce esce.
- **Non promette che la somma delle voci renda il prodotto utilizzabile su pazienti reali.** Non
  lo rende, e nessuna configurazione lo rende: vedi §6, terza osservazione.

---

**Prosegue in**: [05 — Rischi e dipendenze](./05-rischi-e-dipendenze.md), dove i rischi citati in
questo capitolo — e le dipendenze esterne da cui dipendono nove voci su quattordici — sono
descritti con probabilità, impatto sul calendario, indicatore anticipatore, risposta e titolare.
