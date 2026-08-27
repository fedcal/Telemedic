---
title: Primo rilascio utilizzabile
sidebar_position: 4
description: Il perimetro del primo rilascio installabile del 30 novembre 2026 sotto la capacità dichiarata da D54 - che cosa contiene, che cosa è stato tagliato per rispettare la data con l'indicazione di quali tagli sono irreversibili, l'ordine in cui si taglierebbe ancora, i presupposti di installazione, i limiti dichiarati e i criteri bloccanti di rilascio.
---

# Primo rilascio utilizzabile

Nel resto della roadmap questo rilascio è il traguardo `T-10`, datato **30 novembre 2026** da
`D53`. In questo capitolo è designato **`RU-1`**.

> **`[NV]` - la denominazione della distribuzione non è decisa.** `D17` impone che il repository
> e la distribuzione abbiano **nomi, numeri di versione e cicli di vita distinti**. La sigla
> `RU-1` è una designazione di pianificazione, non il nome dell'artefatto: il nome della
> distribuzione **va deciso dal committente** - è una scelta di prodotto e non un lavoro di
> quest'area - prima della prima pubblicazione, e la decisione è segnalata all'orchestrazione, `ORCH`, che la porta alla persona. Fino ad allora nessun documento del
> progetto deve usare `RU-1` come se fosse un nome di prodotto.

> **Come è cambiato questo capitolo, e perché.** `D53` conferma il 30 novembre 2026 come primo
> rilascio installabile; `D54` dichiara la capacità: **un contributore unico a tempo parziale**.
> Con data e capacità fissate, **l'unica variabile libera è l'ambito**
> ([01 §1](./01-principi-e-metodo.md)). Il perimetro dei §§3 e 4 è quindi **ridotto**, e il §5 -
> *che cosa è stato tagliato per rispettare la data* - è la sezione più importante del documento
> per chi deve decidere se adottare il prodotto. Contiene, per ogni voce uscita, **se il taglio è
> recuperabile o no**. I tagli non recuperabili sono quattro, sono marcati come tali, e sono
> l'informazione che questo capitolo esiste per dare.

---

## 1. Che cosa significa «utilizzabile», e il limite che nessuna configurazione rimuove

### 1.1 Il limite

**`RU-1` non è utilizzabile per l'erogazione di prestazioni sanitarie su pazienti reali.** Non è
una cautela redazionale: è la condizione dichiarata da `D16`, e resta vera per ogni artefatto
distribuito finché non esiste una marcatura apposta al termine di una procedura di valutazione
della conformità conclusa. **Oggi il prodotto non reca marcatura CE e non è coperto da alcuna
dichiarazione di conformità.**

`D58` stabilisce che il ruolo di fabbricante **sarà assunto dal progetto** e che il soggetto
giuridico **va costituito**: è pianificazione interna, ha un proprio calendario in
[02 §5](./02-traguardi.md), e **non cambia nulla di ciò che precede**. Le due affermazioni
convivono e vanno lette insieme:

| Che cosa è vero oggi | Che cosa `D58` aggiunge |
|---|---|
| Il prodotto **non reca marcatura CE**, non è coperto da alcuna dichiarazione di conformità, non è utilizzabile su pazienti reali | Il progetto **intende** assumere il ruolo di fabbricante, e il soggetto è **ancora da costituire** |
| Chi installa, integra o mette in servizio **assume gli obblighi che ne derivano** | **Nulla.** L'intenzione di certificare in futuro non trasferisce alcun obbligo e non copre alcuna installazione presente |

> **In nessun luogo di questo documento, e in nessun materiale del progetto, si scrive che il
> prodotto sarà marcato entro una data** ([`V-171`](../11_registri/01-vincoli-in-vigore.md#v-171), [`V-280`](../11_registri/01-vincoli-in-vigore.md#v-280)). L'intenzione di certificare e la
> promessa di un esito datato sono cose diverse, e la seconda produce un effetto regolatorio che
> la prima non produce. Lasciare intendere il contrario sarebbe **più dannoso del silenzio**.

Il limite ha tre proprietà che chi valuta il prodotto tende a sottovalutare:

1. **Non è rimovibile per configurazione.** Nessun parametro, nessun profilo, nessuna licenza,
   nessun accordo contrattuale con il progetto lo modifica.
2. **È verificabile.** Ogni artefatto reca la dichiarazione di non marcatura, e la sua assenza
   impedisce la pubblicazione (criterio 7 del traguardo `T-01`).
3. **Non si trasferisce con la licenza.** Chi integra il software in un prodotto e lo immette sul
   mercato **è fabbricante per legge**, indipendentemente da quanto scritto nella licenza e
   indipendentemente dalle intenzioni del progetto. Va ripetuto qui perché è la domanda che ogni
   integratore pone, e perché `D58` la rende **più** insidiosa: sapere che il progetto intende
   certificare porta a credersi coperti, e non lo si è.

Va aggiunta una quarta proprietà, che discende dalla responsabilità da prodotto difettoso: **la
responsabilità verso il danneggiato non è escludibile per contratto**. Le clausole di esclusione
della licenza valgono fra le parti, non verso la persona assistita, e questo vale con più forza da
quando l'intenzione di certificare è del progetto.

### 1.2 Che cosa allora si può fare con `RU-1`

Quattro impieghi, tutti legittimi e tutti reali.

| Impiego | Perché ha valore |
|---|---|
| **Integrazione e sviluppo presso un integratore** | È l'impiego per cui il prodotto è disegnato: consente di costruire e provare l'integrazione mentre il percorso regolatorio procede in parallelo, invece che dopo |
| **Formazione e addestramento del personale** | Con dati sintetici, su percorsi reali. È tempo che non si recupera se si comincia dopo |
| **Valutazione tecnica e di conformità** | È l'artefatto su cui un responsabile della sicurezza, un responsabile della protezione dei dati o una commissione di gara verificano le affermazioni invece di crederle. **Il §5 fa parte di ciò che va valutato**, non è un'appendice |
| **Base del fascicolo tecnico** | È la distribuzione su cui il fascicolo si costruisce (`D58`), prodotta da costruzione verificabile contro il sorgente pubblicato |

**Quello che non è**: un prodotto in commercio, una dimostrazione, o un prototipo. Ha manuale di
installazione, artefatti firmati, distinta dei materiali, procedura di ripristino e criteri di
rilascio bloccanti. La differenza fra un prototipo e `RU-1` è che il primo si mostra e il secondo
si installa.

---

## 2. Il criterio di composizione: un percorso verticale, non un insieme di funzioni

Il criterio è enunciato in [01 §4.2](./01-principi-e-metodo.md) e qui si applica:

> Si consegna il **percorso verticale completo più stretto possibile**, non l'insieme più ampio
> possibile di funzioni.

Sotto `D53` e `D54` il criterio non cambia: **cambia quanto stretto sia «più stretto possibile»**,
e il §5 dichiara di quanto.

### 2.1 Quale percorso, e perché quello

Il percorso di `RU-1` è la **televisita programmata a due partecipanti, dall'appuntamento ricevuto
per riferimento fino alla chiusura con esito tipizzato e alla restituzione dell'esito al sistema di
origine.**

Rispetto alla formulazione precedente - che arrivava al **documento clinico validato e restituito**
- il percorso si ferma **prima della refertazione**. È il taglio `TG-01` del §5, è reversibile, e
la sua conseguenza è dichiarata lì.

La scelta del percorso non è di comodità. È quello che, fra tutti quelli catalogati, **attraversa
il maggior numero di vincoli trasversali con il minor numero di dipendenze da terzi**:

| Vincolo trasversale | Il percorso lo attraversa? | Dove |
|---|---|---|
| Separazione fra prestazione e sessione media ([`V-01`](../11_registri/01-vincoli-in-vigore.md#v-01)) | **Sì**, ed è il percorso che la rende visibile: una caduta di rete non chiude l'atto clinico | Sessione media distinta dalla prestazione |
| Tenant risolto e applicato dal motore ([`V-04`](../11_registri/01-vincoli-in-vigore.md#v-04), [`V-112`](../11_registri/01-vincoli-in-vigore.md#v-112)) | **Sì**, in ogni interrogazione | Tutti i contesti coinvolti |
| Registro immutabile a catena di impronte ([`V-04`](../11_registri/01-vincoli-in-vigore.md#v-04), [`V-150`](../11_registri/01-vincoli-in-vigore.md#v-150)) | **Sì**: ogni accesso a dato sanitario del percorso è tracciato. **Senza ancoraggio periodico firmato**: taglio `TG-23`, irreversibile per il periodo | Contesto di tracciamento |
| Consenso come fatto con validità temporale ([`V-146`](../11_registri/01-vincoli-in-vigore.md#v-146)) | **Sì**, con tre oggetti di consenso distinti sui cinque del modello: gli altri due riguardano funzioni non presenti | Contesto del consenso |
| Verifica delle chiavi obbligatoria per impostazione predefinita (`D22`) | **Sì**, ed è uno stato bloccante della macchina a stati della sessione. **Non tagliabile** (§5.4) | Interfaccia e sessione media |
| Accessibilità e *mobile first* come criteri di accettazione (`D25`) | **Sì**, su entrambi i lati: assistito su smartphone in rete mobile, professionista con sola tastiera e lettore di schermo | Interfaccia |
| Nessuna funzionalità raggiungibile solo dall'interfaccia ([`V3`](../11_registri/03-vincoli-fondanti.md#v3), [`V-164`](../11_registri/01-vincoli-in-vigore.md#v-164)) | **Sì**: l'interfaccia consuma le stesse interfacce applicative offerte agli integratori | Piani di esposizione |
| Eventi con soli riferimenti, mai contenuto clinico ([`V-135`](../11_registri/01-vincoli-in-vigore.md#v-135), [`V-161`](../11_registri/01-vincoli-in-vigore.md#v-161)) | **Sì**, sull'evento di conclusione della prestazione. **Non tagliabile** (§5.4) | Outbox ed eventi |
| Esito distinto dallo stato, con effetti amministrativi opposti ([`V-141`](../11_registri/01-vincoli-in-vigore.md#v-141)) | **Sì**: mancata presentazione e fallimento tecnico attribuibile all'assistito condividono lo stato terminale e hanno effetti opposti | Prestazione clinica |
| Documento immutabile con catena di rettifica | **No**: esce con `TG-01` | - |
| Sistema pienamente funzionale senza le terminologie a licenza vincolata ([`V-03`](../11_registri/01-vincoli-in-vigore.md#v-03)) | **Sì**, ma **in forma degenere**: nel perimetro ridotto non esiste contenuto codificato da risolvere. La verifica va rifatta quando esiste (`TG-05`) | Gateway terminologico disattivato |

Un percorso che attraversa questi vincoli **li prova**. Un insieme largo di funzioni incomplete non
ne prova nessuno, e in più non consente di dire che cosa è fatto.

### 2.2 La seconda ragione, che è di conformità

Un percorso verticale completo è **tracciabile per intero**: dal requisito alla progettazione, al
codice, alla prova, al controllo di rischio. Un insieme di funzioni parziali produce una matrice di
tracciabilità con molte righe e molte lacune, che è la forma che chi verifica considera peggiore
dell'assenza. **Sotto `D54` la proprietà vale doppio**: una matrice con poche righe tutte coperte è
l'unico modo in cui un contributore unico può consegnare qualcosa di dimostrabile.

---

## 3. Che cosa `RU-1` contiene

L'elenco è per contesto delimitato, perché è la struttura con cui il sistema è costruito e quella
con cui va verificato. Il catalogo completo dei requisiti è in
[`docs/03_functional/02-catalogo-dei-requisiti.md`](../03_functional/02-catalogo-dei-requisiti.md).

### 3.1 Piattaforma e proprietà trasversali

| Capacità | Contenuto |
|---|---|
| **Multi-tenancy attiva** | Isolamento applicato dal motore con negazione predefinita in assenza di contesto. L'installazione a tenant unico è il **caso degenere dello stesso codice**, non una variante |
| **Confine di autorizzazione unico** | Validazione integrale del token in ingresso, emissione del token interno, **delega sempre rappresentata con il claim dell'attore, mai impersonificazione** ([`V-132`](../11_registri/01-vincoli-in-vigore.md#v-132)) |
| **Livello di garanzia qualificato** | Distinzione fra autenticazione **eseguita** e **riferita** da un integratore, propagata fino al punto di decisione ([`V-154`](../11_registri/01-vincoli-in-vigore.md#v-154), [`V-165`](../11_registri/01-vincoli-in-vigore.md#v-165)). Resta nel perimetro benché la federazione nazionale non vi sia: è il marcatore che impedisce di scambiare le due cose quando arriverà |
| **Registro immutabile** | Struttura in sola aggiunta con catena di impronte e archiviazione a privilegi disgiunti, verifica dell'integrità su richiesta e programmata, esportazione in formato aperto con impronta. **Copertura integrale degli accessi**; **senza ancoraggio periodico firmato** (`TG-23`) |
| **Outbox transazionale** | Unica sorgente degli eventi in uscita; buste con **soli riferimenti**; consegna almeno una volta per **chiamata autenticata** verso il sistema di origine; consumatori idempotenti per costruzione. **Senza broker** (`TG-04`) |
| **Due sole rappresentazioni dell'errore** | Rappresentazione del problema sul piano applicativo, esito dell'operazione sul piano di interoperabilità, con catalogo **generato** e divieto di emettere un errore non catalogato ([`V-110`](../11_registri/01-vincoli-in-vigore.md#v-110), [`V-130`](../11_registri/01-vincoli-in-vigore.md#v-130)) |
| **Mediatore unico di uscita** | Nessun componente applicativo apre connessioni verso destinazioni derivate da un dato in ingresso; l'uscita è negata a livello di rete a tutti tranne che al mediatore ([`V-157`](../11_registri/01-vincoli-in-vigore.md#v-157)) |
| **Misura della disponibilità per tenant e per servizio** | Storicizzata con granularità sufficiente a riconoscere il superamento di una soglia dell'ordine del punto percentuale su base giornaliera. **La soglia la sceglie chi installa; il prodotto fornisce la misura** ([`Q-184`](../11_registri/02-questioni-aperte.md#q-184)) |

### 3.2 Identità e accessi

- Federazione con realm distinti per il contesto clinico e per quello dell'assistito.
- Accettazione di un'identità già autenticata dal sistema dell'integratore, **senza secondo
  accesso**, con delega esplicita, e **avvio della sessione con token d'ingresso a uso singolo
  emesso su canale posteriore** - che nel perimetro ridotto non è un ripiego ma la modalità
  principale, perché il componente incorporabile è tagliato (`TG-03`).
- Autorizzazione fondata sulla **relazione di cura**, non sul solo ruolo; ruolo come relazione fra
  persona e organizzazione con validità temporale, non come attributo della persona.
- **Separazione fra ruolo tecnico e ruolo clinico** applicata dal motore di autorizzazione: la
  composizione di un ruolo che la violi è rifiutata con errore di validazione ([`V-125`](../11_registri/01-vincoli-in-vigore.md#v-125)).

### 3.3 Anagrafiche per riferimento

- Assistiti, professionisti, organizzazioni e sedi trattati **per riferimento** sugli
  identificativi del sistema di origine. Il prodotto **non è** il dato di riferimento e non esegue
  riconciliazione delle identità (`OUT-15`).
- Normalizzazione degli identificatori **al confine, mai nel dominio** ([`V-142`](../11_registri/01-vincoli-in-vigore.md#v-142)); registro degli
  identificatori di sistema versionato come **file di configurazione**, senza interfaccia di
  amministrazione (`TG-10`).
- **Nessun identificatore esterno è chiave primaria.**

### 3.4 Prestazione clinica e sessione media

- **Televisita programmata** come unico tipo di prestazione, con la propria macchina a stati
  selezionata dal catalogo ([`V-140`](../11_registri/01-vincoli-in-vigore.md#v-140)).
- Invito recapitato con i canali di chi installa; **verifica tecnica preventiva** prima della
  sessione; sala d'attesa; ammissione; abbandono.
- Sessione media punto a punto **cifrata fino agli estremi come modalità predefinita**, con
  instradamento diretto quando la rete lo consente e relay quando non lo consente.
- **Verifica delle chiavi obbligatoria per impostazione predefinita** (`D22`), come **stato
  bloccante** della macchina a stati, con i requisiti di accessibilità che la rendono utilizzabile
  da un assistito anziano: leggibile carattere per carattere da lettore di schermo, mai veicolata
  dal solo colore, alfabeto privo di caratteri ambigui, **procedura definita in caso di mancata
  corrispondenza** con la stessa evidenza del caso positivo.
- **Degrado dichiarato**: riduzione della risoluzione, poi della fluidità secondo la preferenza
  impostata, poi sospensione del video con **audio mantenuto**, poi avviso di inidoneità con
  proposta di rinvio o di canale alternativo. Ogni transizione è annunciata in modo percepibile
  anche senza vista e senza udito.
- **Misura della qualità per sessione**, con indice proprietario dichiarato tale, costruito sul
  **minimo** fra le dimensioni e non sulla media, e con i contatori cumulativi **differenziati fra
  campioni consecutivi** ([`V-113`](../11_registri/01-vincoli-in-vigore.md#v-113), [`V-114`](../11_registri/01-vincoli-in-vigore.md#v-114)).
- **Avviso di qualità inadeguata al professionista** come controllo di rischio registrato, con
  l'esito della decisione del professionista conservato. **Non tagliabile** (§5.4).
- **Chiusura con esito tipizzato**, con lo stato distinto dall'esito e con gli effetti
  amministrativi opposti mantenuti separati ([`V-141`](../11_registri/01-vincoli-in-vigore.md#v-141)).
- **Ripiego telefonico** come esito tipizzato: il cambio di canale è registrato e riportato
  nell'esito restituito.

### 3.5 Consenso

- **Tre oggetti di consenso distinti** con cicli di vita indipendenti - atto sanitario, trattamento
  dei dati ove applicabile, trasmissione dell'esito al sistema esterno - e nessun «consenso alla
  piattaforma» ([`V-146`](../11_registri/01-vincoli-in-vigore.md#v-146)). Gli altri due oggetti del modello, registrazione e presenza di terzi,
  riguardano funzioni non presenti in `RU-1`: **il modello li prevede, il rilascio non li
  esercita**, e la differenza è dichiarata.
- Consenso riferito alla **versione del testo** dell'informativa; revoca con effetto; nessun
  consenso booleano.

### 3.6 Restituzione dell'esito al sistema di origine

Sostituisce la sezione sulla documentazione clinica, che esce con `TG-01`.

- Al termine della prestazione il sistema restituisce al sistema di origine un **esito strutturato**
  in forma canonica, tramite chiamata autenticata: identificativo della prestazione, stato, esito
  tipizzato, istanti, partecipanti per riferimento, canale effettivamente usato.
- L'esito comprende l'**attestazione della qualità del collegamento e la conferma di idoneità**,
  **misurata dal sistema e confermata dal professionista**, mai generata autonomamente.
- **Nessun contenuto clinico interpretativo è prodotto, precompilato o trasmesso** (`OUT-07`).
- La notifica dice che è successo qualcosa e dove trovarlo; il contenuto si rilegge con chiamata
  autenticata.

### 3.7 Interfacce verso terzi

- **Interfaccia applicativa di progetto** descritta e versionata, con prove a contratto in entrambe
  le direzioni. È l'**unica** superficie di integrazione di `RU-1`.
- **Eventi in uscita firmati con firma asimmetrica** e identificativo di chiave risolvibile dal
  materiale pubblico del progetto; il segreto condiviso **non è offerto come modalità
  predefinita** ([`V-162`](../11_registri/01-vincoli-in-vigore.md#v-162)).
- **Nessun percorso, diretto o mediato, verso contenuto clinico** per il profilo del pagatore
  amministrativo ([`V-166`](../11_registri/01-vincoli-in-vigore.md#v-166), `OUT-18`). Nel perimetro ridotto il divieto è **una convenzione
  verificata da prova e non un confine strutturale**, perché il contesto autonomo della
  rendicontazione è decisione rinviata (`C-1`): la differenza è dichiarata e non attenuata.

### 3.8 Interfaccia utente

- Percorso dell'assistito e percorso del professionista, entrambi conformi ai criteri *mobile
  first* e di accessibilità come **criteri di accettazione**, non come rifinitura.
- **Indicatore di registrazione persistente e non occultabile** quando la registrazione è attiva -
  benché la modalità con registrazione **non sia in `RU-1`**. **È stato deliberatamente escluso
  dai tagli**, e la ragione va detta perché mostra come i tagli sono stati scelti: un presidio che
  arriva insieme alla funzione che deve presidiare non è mai stato messo alla prova. Costa un
  elemento di interfaccia e una prova negativa; il suo rinvio costerebbe la prima verifica reale
  del presidio nello stesso rilascio in cui arriva il rischio.
- **Nessun contenuto clinico in archiviazione persistente del navigatore**, nessun token
  nell'archiviazione persistente, pulizia esplicita alla chiusura della sessione.
- **Nessuna decisione clinica nel client**: nessuna valutazione avviene nell'interfaccia.

### 3.9 Esercizio

- Verifiche di configurazione **bloccanti all'avvio**: isolamento fra tenant attivo e non superabile
  dal ruolo applicativo, archivio del registro non raggiungibile con le credenziali applicative,
  relay non raggiungibile dalle reti interne, versione minima del relay, nessun segreto ai valori
  predefiniti, politica di conservazione presente per ogni categoria, migrazioni applicate.
- **Esportazione delle metriche** in formato aperto, con i nomi delle serie documentati. I cruscotti
  versionati escono con `TG-09`.
- **Un solo profilo di dispiegamento**, a tenant unico, con definizioni riproducibili. Il profilo su
  orchestratore esce con `TG-08`.

---

## 4. Che cosa `RU-1` **non** contiene per ragioni indipendenti dalla data

Questa sezione elenca ciò che era **già fuori** dal perimetro prima di `D53`. Ciò che è uscito
**per effetto** di `D53` è al §5, e la distinzione è il motivo per cui le due sezioni sono
separate: **confonderle farebbe apparire come conseguenza della fretta ciò che è una scelta di
prodotto, e viceversa.**

### 4.1 Categoria I - Fuori perimetro in modo definitivo

Non sono esclusioni di rilascio: sono esclusioni di prodotto, elencate con identificativo e
categoria di riapribilità in
[`docs/03_functional/07-fuori-perimetro.md`](../03_functional/07-fuori-perimetro.md). Comprendono
l'interpretazione clinica in ogni sua forma, la deduzione delle soglie, il triage calcolato, la
verifica delle interazioni fra farmaci, il dialogo diretto con i dispositivi medici domiciliari, il
canale di emergenza, il riconoscimento biometrico, l'indice di riconciliazione delle identità, la
mediazione dell'accesso di un pagatore al fascicolo, la conservazione a norma.

**Non torneranno in un rilascio successivo.** Alcune sono riapribili solo con una valutazione di
impatto regolatorio registrata; una - la mediazione dell'accesso di un pagatore - non è riapribile
finché la fonte è in vigore.

`D55` aggiunge a questo elenco un **divieto permanente**: nessuna funzione può essere aggiunta se
sposta il sistema verso il **tempo reale clinico**, e la valutazione va fatta prima di scrivere la
funzione, non dopo.

### 4.2 Categoria II - Rinviate per sequenza

Sono nel perimetro del prodotto, sono pianificate, e non erano in `RU-1` già prima di `D53` perché
il criterio di composizione impone un percorso verticale stretto.

| Esclusa da `RU-1` | Perché non ora | Dove torna |
|---|---|---|
| **Telemonitoraggio** in tutte le sue componenti | È il contesto più esteso del catalogo. `D55` ne ha congelato la destinazione d'uso, quindi il lavoro non è più a rischio di riscrittura: resta però la ragione di ampiezza, che sotto `D54` è dirimente | [04 §3](./04-oltre-il-primo-rilascio.md), prima posizione |
| **Teleconsulto, teleconsulenza, teleassistenza** | Ciascuna è una macchina a stati propria con attori ammessi diversi; il vincolo professionale si applica all'**attività**, non al servizio minimo ([`V-147`](../11_registri/01-vincoli-in-vigore.md#v-147)) | [04 §3](./04-oltre-il-primo-rilascio.md) |
| **Registrazione della sessione lato server** | È una **seconda modalità di sicurezza**, non una funzione opzionale: comporta la terminazione della cifratura sul server, un componente distinto con perimetro proprio, un flusso di consenso dedicato e la cifratura a riposo con chiavi per tenant | [04 §3](./04-oltre-il-primo-rilascio.md) |
| **Terzo partecipante** alla sessione | La decisione sulla topologia oltre due partecipanti è dichiarata rinviata (`C-2`), e non è marginale: l'interprete è la misura alternativa dichiarata per la non conformità di accessibilità nota | Dopo la chiusura di `C-2` |
| **Moduli di agenda e fatturazione propri** | Il percorso di `RU-1` riceve l'appuntamento **per riferimento** dal sistema di origine, che è il caso d'uso di riferimento | [04 §3](./04-oltre-il-primo-rilascio.md) |
| **Kit di sviluppo** in linguaggio di programmazione | L'interfaccia applicativa versionata è sufficiente alla prima integrazione; il kit è comodità, non capacità | [04 §3](./04-oltre-il-primo-rilascio.md) |
| **Messaggistica ospedaliera e profili di interoperabilità documentale** | Richiedono una controparte con un ambiente di prova | [04 §3](./04-oltre-il-primo-rilascio.md) |

### 4.3 Categoria III - Rinviate per dipendenza esterna non disponibile

Sono nel perimetro, sono pianificate, e **la loro data non dipende dal lavoro del progetto**.

| Esclusa da `RU-1` | Da che cosa dipende |
|---|---|
| **Conferimento dei documenti alle infrastrutture documentali nazionali e regionali** | I modelli documentali, i codici di tipologia e i metadati di indicizzazione delle tipologie di telemedicina **non sono pubblicamente disponibili** ([`Q-07`](../11_registri/02-questioni-aperte.md#q-07)). Il progetto ha già la risposta strutturale - dataset canonico e serializzazione sostituibile: **manca il contenuto, non il progetto** |
| **Conformità verificata sull'identità digitale nazionale** in tutti e tre i canali | Richiede ambienti di pre-produzione, credenziali di prova e, per uno dei canali, **due istanze di fornitore di identità per ciascun fornitore** (`D38`): è il lotto sistematicamente sottovalutato |
| **Soglie di prestazione dell'interfaccia dichiarate** | Il **dispositivo di riferimento non è dichiarato** ([`Q-115`](../11_registri/02-questioni-aperte.md#q-115), [`Q-175`](../11_registri/02-questioni-aperte.md#q-175)), e senza dispositivo il requisito corrispondente non è verificabile. `RU-1` misura e pubblica le condizioni; non dichiara una soglia non misurata |
| **Valori di riferimento dei livelli di servizio attesi** | La soglia la sceglie il cliente ([`Q-152`](../11_registri/02-questioni-aperte.md#q-152), [`Q-184`](../11_registri/02-questioni-aperte.md#q-184)). `RU-1` fornisce la **capacità di misura**, che è il requisito |

### 4.4 Categoria IV - Rinviate per decisione non presa

Non sono escluse per scelta: sono escluse perché **una decisione dichiarata rinviata non si prende
in una proposta di modifica**.

| Voce | Decisione pendente |
|---|---|
| Calcolo di punteggi di scale e questionari clinici validati | `B-3` - regime di licenza degli strumenti. La conseguenza già assunta in via cautelativa è che il dominio **non rappresenta punteggi** |
| Contesto autonomo della rendicontazione | `C-1` - con l'avvertenza dichiarata al §3.7 |
| Piano di dismissione delle versioni pubblicato | `C-4`, [`Q-186`](../11_registri/02-questioni-aperte.md#q-186) - è **prerequisito di `T-10`** e non voce di coda: senza il periodo di supporto non è determinabile quante versioni maggiori vanno mantenute |
| Oscuramento selettivo del contenuto audio-video ai fini del diritto di accesso | Resta a `COMP` stabilire se il rilascio parziale soddisfi l'istanza dell'interessato ([`Q-157`](../11_registri/02-questioni-aperte.md#q-157)) |

---

## 5. Che cosa è stato tagliato per rispettare la data

**Questa è la sezione centrale del capitolo.** Elenca ciò che è uscito dal perimetro **per effetto
di `D53` e `D54`**, e non per una scelta di prodotto: voci che questa stessa roadmap dichiarava
comprese in `RU-1` prima della terza tornata di decisioni.

### 5.1 Come si legge

`D53` conferma la data. `D54` dichiara la capacità. Con entrambe fissate, **l'ambito è l'unica
variabile libera** e la riduzione non è un'opzione: è aritmetica. Ciò che la rende accettabile non
è la sua entità, è la sua **leggibilità**.

Ogni voce porta quattro informazioni, e la terza è quella che conta:

| Campo | Che cosa risponde |
|---|---|
| **Che cos'era** | Che cosa `RU-1` avrebbe contenuto |
| **Perché è uscita** | Il motivo, che non è mai «non c'era tempo» in astratto ma sempre una proprietà: ampiezza, dipendenza da un secondo soggetto, o superficie contrattuale |
| **Reversibile?** | Se il taglio si recupera in un rilascio successivo **allo stesso costo**, o se qualcosa è perduto per sempre |
| **Che cosa comporta per chi installa** | La conseguenza operativa, non la sua descrizione tecnica |

Le sigle `TG-nn` sono **designazioni di pianificazione**, come `RU-1`, `OL-nn` e `DS-nn`: non sono
identificativi di requisito, non entrano nella matrice di tracciabilità e non possono comparire in
una prova.

> **La regola che separa le due categorie.** Un taglio è **reversibile** se aggiungerlo in seguito
> costa quanto sarebbe costato ora, e non produce alcuna perdita nel frattempo. È **irreversibile**
> se qualcosa che sarebbe esistito **non esisterà mai**: tipicamente una **registrazione datata a
> un periodo**, che dopo quel periodo non si produce più. La distinzione non è di gravità: è di
> natura. Un taglio reversibile è una decisione di sequenza; un taglio irreversibile è **una
> proprietà che il rilascio non avrà mai**.

### 5.2 I tagli reversibili

| # | Che cos'era | Perché è uscita | Che cosa comporta per chi installa |
|---|---|---|---|
| `TG-01` | **Documentazione clinica e refertazione**: bozza, validazione, firma, immodificabilità del documento firmato, rettifica come nuova versione, consegna del documento al sistema di origine | È il secondo contesto per ampiezza del percorso, e porta con sé la firma elettronica, la marca temporale, la catena di rettifica e la modellazione del set informativo della tipologia documentale | **È il taglio più visibile.** `RU-1` **non produce un referto**: restituisce un **esito strutturato** (§3.6). Chi installa non può provare il percorso documentale, la firma, la rettifica né la restituzione del contenuto clinico. Chi valuta il prodotto per la refertazione **non deve installare `RU-1`**: non ne troverebbe traccia |
| `TG-02` | **Facciata di interoperabilità** con documento di capacità e profili fissati per versione | È una **seconda superficie contrattuale pubblica** da mantenere per tutto il periodo di supporto, sopra un'interfaccia che nessun integratore ha ancora esercitato | L'integrazione avviene con l'**interfaccia applicativa propria del progetto**, versionata. Chi attende risorse standardizzate deve mappare, e **la mappatura fatta ora andrà rifatta** quando la facciata esiste: è un costo per l'integratore, ed è dichiarato prima e non dopo |
| `TG-03` | **Componente incorporabile white-label** come elemento personalizzato, con proprietà di tema validate lato server | Porta con sé la validazione del contrasto lato server, l'insieme chiuso di proprietà, gli elementi non tematizzabili e le prove negative corrispondenti | L'integratore avvia la sessione **per rinvio, con token d'ingresso a uso singolo** (§3.2), non incorporando l'interfaccia. **Il tema personalizzato non è disponibile**, e l'utente vede l'interfaccia del prodotto: chi ha requisiti di identità visiva deve saperlo prima |
| `TG-04` | **Broker di eventi** e il suo assetto a nodo singolo | Un componente in più da installare, configurare, aggiornare e sorvegliare, per una capacità che con un solo consumatore non è ancora necessaria | **Un componente in meno da installare**: è l'unico taglio che alleggerisce chi installa. L'outbox resta la sorgente di verità e consegna per **chiamata autenticata**. Conseguenza: **un solo consumatore configurato per tenant**, nessuna sottoscrizione multipla, nessuna riproduzione della cronologia degli eventi |
| `TG-05` | **Gateway terminologico attivo** con lista di ammissione e modalità degradata esercitata | Nel perimetro ridotto **non esiste contenuto codificato** da risolvere: il punto di estensione esiste, disattivato per impostazione predefinita | Il criterio di rilascio sul funzionamento senza terminologie a licenza vincolata è **soddisfatto in forma degenere**, e questo documento lo dichiara invece di contarlo come verifica. **Va rifatto quando il contenuto codificato entra**, ed è annotato come tale |
| `TG-06` | **Accesso d'emergenza** con motivazione obbligatoria, finestra limitata, notifica e riesame ([`V-153`](../11_registri/01-vincoli-in-vigore.md#v-153)) | È un percorso di deroga con un proprio ciclo di riesame, e senza contenuto clinico persistente ha poco da derogare | **Non esiste un percorso di accesso in deroga.** Chi installa non può provarlo, e nessuna procedura organizzativa può appoggiarvisi. L'assenza è **più sicura**, non meno: ciò che manca è la funzione, non un controllo |
| `TG-07` | **Oscuramento applicato dal motore di autorizzazione**, con i sei canali di inferenza chiusi | Applica a contenuto clinico persistente, che con `TG-01` non esiste | Nessuna conseguenza operativa in `RU-1`. Conseguenza di verifica sì, e va detta: **i sei canali di inferenza non sono stati esercitati**, e la loro chiusura resta una proprietà di progettazione non ancora provata |
| `TG-08` | **Profilo di dispiegamento su orchestratore** | Un secondo profilo è una seconda matrice di prova e una seconda superficie di supporto | `RU-1` si installa **solo** nel profilo a tenant unico con definizioni a contenitori. Chi vuole l'orchestratore costruisce i propri manifesti, **e il progetto non li supporta**: è una dichiarazione, non una cortesia |
| `TG-09` | **Tre cruscotti versionati** nel repository: salute del servizio, qualità del media, integrità e sicurezza | Sono presentazione di dati che il prodotto già espone | Chi installa **costruisce i propri cruscotti** sull'esportazione delle metriche, di cui il progetto documenta i nomi delle serie. Il tempo di attivazione della sorveglianza si sposta sul cliente |
| `TG-10` | **Interfaccia di amministrazione** per tenant, registro degli identificatori, registro di fiducia | È un terzo percorso di interfaccia, con i propri obblighi di accessibilità come criterio di accettazione | Ogni operazione di amministrazione avviene per **configurazione dichiarativa versionata** e procedure a riga di comando, quindi **richiede accesso all'installazione** e non è delegabile a un amministratore non tecnico. È il taglio che pesa di più sull'esercizio quotidiano |
| `TG-11` | **Migrazioni per tenant non bloccanti**, con avanzamento osservabile e fallimento isolato per tenant | La proprietà di non bloccare è una modalità di esecuzione in più da progettare e provare | L'aggiornamento richiede una **finestra di manutenzione dichiarata**. Resta invece **non tagliabile** la proprietà per cui due versioni consecutive convivono sulla stessa base dati (§5.4) |
| `TG-12` | **Suite di prove media su scala completa di profili di rete** | Ogni profilo è uno scenario da costruire e mantenere | Il degrado dichiarato è **verificato agli estremi - nominale e degradato limite - e non lungo la scala**. Le condizioni di rete intermedie non sono coperte da prova, ed è un limite dichiarato (§9) |
| `TG-13` | **Misura automatica della latenza da obiettivo a schermo** in integrazione continua | È un banco di misura, non una funzione | La latenza è **misurata in sessione e registrata**, ma **non esiste una prova automatica di regressione**: un peggioramento fra due versioni non viene intercettato dalla pipeline |
| `TG-14` | **Verifica di riproducibilità su tutti gli artefatti**, su esecutori indipendenti | Il controllo di ogni sorgente di non determinismo su ogni artefatto è lavoro proporzionale al numero di artefatti | La verifica di riproducibilità è eseguita **sull'artefatto principale del servizio**, con esito conservato, e **non sugli altri artefatti**. Chi vuole verificare la corrispondenza fra distribuzione e sorgente può farlo per quell'artefatto e non per gli altri: è dichiarato nel fascicolo di rilascio |
| `TG-15` | **Tutti i controlli obbligatori della pipeline bloccanti dal primo giorno** | Ogni controllo va provato con un caso deliberatamente non conforme prima di poter bloccare | Blocca da subito ogni controllo che presidia una **proprietà irrecuperabile o un divieto pubblico** ([02, `T-03`](./02-traguardi.md)); gli altri esistono **in sola segnalazione, ciascuno con la data dichiarata in cui diventa bloccante**. Un controllo in segnalazione senza quella data non è ammesso |
| `TG-16` | **Modulo delle fonti primarie** della guida dei fondamenti | È una bibliografia ragionata, e il glossario ha priorità perché tiene ferma la terminologia della traduzione | Ogni rinvio normativo resta **citato per esteso nel testo in cui compare**, e non esiste un indice unico da cui partire |
| `TG-17` | **Traduzione integrale del corpus** prima del codice | `D56` emenda `D52`: la traduzione procede **in parallelo** e non è più prerequisito di ogni riga di codice | Esistono in inglese **le avvertenze pubbliche, la guida dei fondamenti, l'`COMP` e l'area di sicurezza**, dove il controllo di divergenza **blocca**. Sul resto del corpus il controllo **segnala**, e il rapporto è pubblicato: la parte non tradotta è **visibile e misurata** |
| `TG-18` | **Riemissione sotto controllo dei documenti prodotti prima di `T-01`** | Il volume del corpus rende la riemissione un lavoro dell'ordine della sua produzione | È dichiarata come **lacuna** nel fascicolo di rilascio, con la data in cui è nata. **È l'unico taglio reversibile il cui costo cresce ogni giorno**, ed è la ragione per cui `T-01` è il primo traguardo |
| `TG-19` | **Manuale di installazione ed esercizio in inglese** | È il documento più lungo del rilascio e il meno rischioso da avere in una sola lingua | Il manuale è **in italiano**. **Le avvertenze e i limiti d'uso sono in entrambe le lingue** e non sono tagliabili: è la parte il cui fraintendimento produce danno |

### 5.3 I tagli irreversibili

> **Questa è l'informazione più importante dell'intero documento.**
> Le quattro voci che seguono **non si recuperano in un rilascio successivo**. Ciò che manca non è
> una funzione da aggiungere: è una **registrazione datata al periodo di `RU-1`**, e un periodo
> passato non si registra dopo. Tre di esse discendono direttamente da `D54`, e nessuna dipende
> dal numero di ore disponibili.

#### `TG-20` - Registrazioni che richiedono due soggetti distinti · **IRREVERSIBILE**

**Che cos'erano.** Tre registrazioni previste dal sistema di gestione della qualità:

- **il riesame documentale del rilascio** - criterio 18 dei criteri bloccanti nella versione
  precedente di questo capitolo;
- **l'audit interno** del sistema di gestione della qualità sul periodo;
- **la verifica di configurazione eseguita da chi non ha scritto il codice**, compresa
  l'esecuzione della procedura di verifica a cura di chi installa da parte di un secondo soggetto.

**Perché sono uscite.** Perché `D54` dichiara **un contributore unico**, e ciascuna di esse
**presuppone soggetti distinti per definizione**: un auditor non audita la propria attività, un
riesame non accerta chi lo conduce, una verifica indipendente non è indipendente se la esegue
l'autore. **Non è un problema di ore disponibili**, e nessuna quantità di lavoro individuale lo
risolve ([01 §9-bis](./01-principi-e-metodo.md), vincolo [`V-281`](../11_registri/01-vincoli-in-vigore.md#v-281)).

**Perché il taglio è irreversibile.** Perché una registrazione di riesame **di un rilascio già
avvenuto** non è un riesame: è una ricostruzione a posteriori, e chi verifica la riconosce come
tale. Lo stesso vale per un audit riferito a un periodo concluso. Ciò che si può fare dopo è
riesaminare **il rilascio successivo**, non quello passato. **La lacuna resta datata a `RU-1` per
sempre.**

**Che cosa comporta per chi installa.** Il fascicolo che accompagna `RU-1` **dichiara
esplicitamente, e in entrambe le lingue, che nessuna verifica è stata eseguita da un secondo
soggetto** (criterio 3 di `T-10`). Chi intende costruire su `RU-1` un percorso di conformità deve
sapere che quel periodo ha una lacuna dichiarata, **prima di installare e non dopo**. Chi valuta il
prodotto in una commissione tecnica trova la dichiarazione nel fascicolo e non deve dedurla.

**Che cosa il progetto fa comunque.** Tutti i criteri di `RU-1` restano **verificabili da
chiunque**, con la procedura descritta: è la proprietà producibile con un contributore unico, ed è
non negoziabile ([01 §12.1](./01-principi-e-metodo.md)). Le due affermazioni - «tutti i criteri
sono verificabili da chiunque» e «nessuna verifica è stata eseguita da un secondo soggetto» - sono
entrambe vere ed entrambe scritte.

**Che cosa resta da decidere.** La **ripartizione**: quale sottoinsieme si accetta come lacuna
dichiarata e quale si copre acquisendo la funzione all'esterno. È decisione del committente ed è la
questione [`Q-189`](../11_registri/02-questioni-aperte.md#q-189), con punto di decisione al **30 settembre 2026**. In assenza di decisione l'esito
predefinito è la lacuna dichiarata, ed è dichiarato in anticipo proprio per non farlo apparire come
una scelta presa dopo.

#### `TG-21` - Revisione esterna indipendente del codice di sicurezza critico · **IRREVERSIBILE PER IL PERIODO**

**Che cos'era.** `D18` prescrive che lo scambio di token nel gateway, essendo codice di sicurezza
critico, sia **sottoposto a revisione esterna indipendente** e a test di abuso dedicati.

**Perché è uscita.** Perché richiede un revisore esterno e indipendente, che sotto `D54` non esiste
internamente per definizione, e la cui acquisizione è una decisione di spesa del committente.

**Perché il taglio è irreversibile per il periodo, e non del tutto.** La revisione **è eseguibile in
seguito**: il codice non scade. Ciò che non si annulla è il **periodo in cui l'artefatto è stato
distribuito senza di essa**, e la prescrizione di `D18` è di eseguirla **prima**. La classificazione
è quindi precisa e non va arrotondata in nessuna delle due direzioni: **recuperabile come attività,
irrecuperabile come stato del rilascio `RU-1`**.

**Che cosa comporta per chi installa.** Il confine di autorizzazione - validazione del token
dell'integratore, emissione del token interno, claim dell'attore - **non è stato rivisto da un
terzo** al momento di `RU-1`. Va scritto nelle note di rilascio, ed è un elemento che un
responsabile della sicurezza deve poter pesare nella propria valutazione.

**Che cosa il progetto fa comunque.** La verifica empirica di `T-04`, criteri 1 e 2, con **prova
negativa su tutte le configurazioni supportate**, e il criterio di rilascio bloccante corrispondente
(§8, criterio 2). Sono verifiche **del comportamento**, e non sostituiscono una revisione del
codice: la differenza è dichiarata e non attenuata.

#### `TG-22` - Valutazione formativa di usabilità durante lo sviluppo · **IRREVERSIBILE**

**Che cos'era.** L'ingegneria dell'usabilità ai sensi della norma applicabile, obbligatoria per
effetto di `D12` e `D25`, prevede **valutazioni formative durante lo sviluppo** con utenti
rappresentativi - che comprendono assistiti anziani e persone con disabilità, popolazione di
riferimento e non caso limite - e una **validazione sommativa** prima del rilascio.

**Perché è uscita.** Perché richiede reclutamento di utenti rappresentativi, un protocollo approvato
prima dell'esecuzione, e competenza di fattori umani che il progetto **non possiede internamente**.
È di classe `B`: la sua durata non dipende dalla velocità del progetto.

**Perché il taglio è irreversibile.** Perché la valutazione formativa è **contemporanea per
definizione** alle decisioni di progettazione che valuta. Eseguirla dopo non è una valutazione
formativa: è una sommativa su un'interfaccia già decisa, e serve a un'altra cosa. **Le decisioni di
interfaccia prese nel periodo di `RU-1` non saranno mai state valutate formativamente**, e il
fascicolo di ingegneria dell'usabilità porterà quella lacuna con la sua data.

**Che cosa comporta per chi installa.** L'interfaccia di `RU-1` è stata progettata secondo i criteri
di accessibilità dichiarati e **verificata rispetto a essi**, non **validata con gli utenti a cui è
destinata**. Sono due garanzie diverse, e il fascicolo dichiara quale delle due è stata prodotta.

**Che cosa il progetto fa comunque, e come va chiamato.** `T-08` criterio 7 richiede **almeno una
verifica manuale con tecnologia assistiva reale, con esito registrato**, e le decisioni di
interfaccia sono motivate per iscritto. **Non è una valutazione formativa e non va presentata come
tale.** Chiamarla così sarebbe la forma di debito regolatorio più costosa: una registrazione
formalmente presente e sostanzialmente vuota, che è peggiore dell'assenza perché è falsamente
rassicurante.

#### `TG-23` - Ancoraggio periodico firmato della catena del registro immutabile · **IRREVERSIBILE PER IL PERIODO**

**Che cos'era.** Il requisito di non alterabilità del registro degli accessi poggia su strati che
coprono minacce diverse: catena di impronte applicativa, archivio in sola aggiunta, conservazione a
privilegi disgiunti, e **ancoraggio periodico firmato** della testa della catena presso un punto
esterno al sistema che genera gli eventi.

**Perché è uscito.** Perché è lo strato che richiede un punto di fiducia esterno, una procedura di
custodia e una verifica propria, ed è dichiarato dall'area di sicurezza come parte del **singolo
elemento di maggiore sforzo dell'intero catalogo**.

**Perché il taglio è irreversibile per il periodo.** L'ancoraggio **si può attivare in qualunque
momento futuro**, e da quel momento la catena è ancorata. Ma **le registrazioni scritte prima non
acquistano un ancoraggio retroattivo**: per il periodo di `RU-1` la garanzia di non alterabilità
resta quella della catena applicativa e della separazione dei privilegi, e **non è dimostrabile
verso un terzo che non si fidi dell'operatore del sistema**. Attivarlo dopo non retrodata nulla.

**Che cosa comporta per chi installa.** La **copertura** del registro è integrale - ogni accesso a
dato sanitario del percorso è registrato, e su questo non è ammessa alcuna riduzione
([01 §7.3](./01-principi-e-metodo.md)) - ma **la garanzia di non alterabilità è ridotta di uno
strato**, e la riduzione va dichiarata a chi installa, perché determina che cosa può affermare nei
propri adempimenti. La **separazione dei privilegi fra archivio applicativo e archivio del
registro** resta un **presupposto di installazione e non una raccomandazione** (§7.1): in sua
assenza la garanzia scende ulteriormente, e sotto `TG-23` non c'è più uno strato che compensi.

### 5.4 Che cosa non si è potuto tagliare, e perché

Un elenco di tagli senza il suo complemento è metà informazione. Le voci seguenti **non sono entrate
in nessuna riduzione, non entrano nell'ordine di sacrificio del §6, e non vi entreranno**: il loro
debito non è pagato dal progetto ma da una persona assistita ([01 §7.3](./01-principi-e-metodo.md)).

| Voce | Perché non è tagliabile |
|---|---|
| **Copertura integrale del registro degli accessi** | Un accesso non registrato non si registra dopo. Ciò che si è potuto ridurre è uno strato di garanzia (`TG-23`), **mai la copertura** |
| **Verifica delle chiavi della sessione** | È un controllo di rischio, non una funzione. Senza di essa la proprietà di cifratura fino agli estremi non è dimostrabile all'interlocutore, e la dichiarazione pubblica corrispondente non sarebbe sostenibile |
| **Avviso di qualità inadeguata al professionista** | È un controllo di rischio, con l'esito della decisione conservato |
| **Raccolta e verifica del consenso** | Con la revoca che ha effetto e il riferimento alla versione del testo |
| **Isolamento fra tenant** | Con le prove che tentano attivamente l'accesso illegittimo in condizioni avverse |
| **Assenza di contenuto clinico** in registri, metriche, tracce e buste degli eventi | Con le prove che tentano di far passare dati sensibili e falliscono se ci riescono |
| **Convivenza di due versioni consecutive sulla stessa base dati** | Una migrazione insieme distruttiva e funzionale rende impossibile il ritorno alla versione precedente: è un rischio di continuità per chi installa |
| **I criteri di rilascio bloccanti del §8** | In blocco. Nessuno è derogabile, nessuno entra nell'ordine di sacrificio |

E una voce che è stata **deliberatamente esclusa dai tagli** benché lo sarebbe stata per costo:
l'**indicatore di registrazione persistente e non occultabile** (§3.8), che presidia una funzione
non ancora presente. La ragione è al §3.8 e vale come criterio generale: **un presidio che arriva
insieme al rischio che deve presidiare non è mai stato messo alla prova.**

---

## 6. Se la data è ancora a rischio: l'ordine di sacrificio

Il piano del capitolo [02](./02-traguardi.md) **non ha margine di tempo**: nove traguardi occupano
il calendario residuo. Il margine sta nell'ambito, ed è questo.

### 6.1 Le tre regole

**Prima - l'ordine si esegue dall'alto, per intero, e ogni esecuzione è registrata** nella revisione
di [00 §8](./00-indice.md), con la data e la causa. Una riduzione non registrata è un taglio non
deciso, e fa perdere alla scelta la sola proprietà che `D53` obbliga a garantirle: **essere
leggibile**.

**Seconda - nell'ordine entrano soltanto tagli reversibili.** È parte del vincolo [`V-282`](../11_registri/01-vincoli-in-vigore.md#v-282). Un taglio
irreversibile non si decide sotto pressione di calendario: si decide con la procedura ordinaria,
sapendo che cosa costa, oppure non si decide.

**Terza - i criteri di rilascio bloccanti del §8 e l'elenco del §5.4 non entrano mai in questo
ordine.** Se l'ambito non è più riducibile senza toccarli, **la data si dichiara mancata** con la
causa registrata ([01 §10](./01-principi-e-metodo.md)). Non è un fallimento del metodo: è il metodo
che funziona.

### 6.2 L'ordine

| # | Che cosa si sacrifica | Che cosa si perde | Che cosa resta |
|---|---|---|---|
| `S-1` | **Esportazione delle metriche** in formato aperto | Chi installa non può alimentare la propria sorveglianza dal primo giorno | La misura resta interna e storicizzata: nulla è perduto, il dato è disponibile in seguito |
| `S-2` | **Attestazione strutturata della qualità del collegamento** nell'esito restituito | Il sistema di origine non riceve l'attestazione in forma strutturata | L'attestazione resta **misurata e registrata**, e l'avviso di qualità inadeguata al professionista **resta intero**: si perde la restituzione, non il controllo di rischio |
| `S-3` | **Sala d'attesa e ammissione come stati distinti** | Il professionista perde la visibilità dell'assistito in attesa | La verifica tecnica preventiva **resta**: è ciò che protegge l'assistito da una sessione che non funzionerà |
| `S-4` | **Elenco delle prestazioni del giorno** nell'interfaccia del professionista | Si entra in sessione dal rinvio dell'integratore, non da un elenco proprio | Il percorso di sessione resta integro, e il caso d'uso di riferimento è proprio l'ingresso dal sistema di origine |
| `S-5` | **Ripiego telefonico come esito tipizzato** | Il cambio di canale non è un valore del catalogo degli esiti | Resta registrabile come esito generico con nota: si perde la tipizzazione, non la tracciabilità |
| `S-6` | **Firma asimmetrica degli eventi in uscita** con identificativo di chiave risolvibile | Gli eventi sono autenticati dal solo canale | **Non è ammesso il segreto condiviso come sostituto** ([`V-162`](../11_registri/01-vincoli-in-vigore.md#v-162)): o la firma asimmetrica, o l'evento non esce verso terzi e resta il recupero per chiamata autenticata |
| `S-7` | **Conteggio esatto delle parole** del corpus (`T-02` criterio 5) | Il piano di traduzione resta su stime, e l'`[NV]` sul volume resta aperto | La traduzione delle aree prerequisito **non dipende dal conteggio**: si esegue comunque |
| `S-8` | **Teleconsulto e telemonitoraggio dal percorso verticale dimostrabile** | `RU-1` **non implementa le tre prestazioni del modello di dominio**: implementa la sola televisita programmata a due partecipanti. Chi valuta il progetto vede un solo caso d'uso esercitato, e i modelli delle altre due prestazioni restano progettati nel dominio e nei requisiti senza esercizio nel codice. È il taglio che morde sul criterio 6 di `T-08`, il percorso verticale, portandolo da "completo" a "completo per una sola prestazione" | Teleconsulto e telemonitoraggio restano **integralmente progettati**: modello di dominio, requisiti funzionali (`RF-*`), regole di business (`BR-*`), scenari di test (`ATT-*`), protocollazione. La loro implementazione è rinviata e non annullata. Nel criterio 6 di `T-08` e nella coda di [04](./04-oltre-il-primo-rilascio.md) il rinvio è dichiarato con la conseguenza che due percorsi verticali restano da costruire in rilasci successivi |

**Che cosa non c'è in questa tabella, ed è la sua parte più importante.** Non c'è nessuna voce che
riduca la copertura del registro degli accessi, la verifica delle chiavi, l'isolamento fra tenant,
il consenso, l'assenza di contenuto clinico nelle uscite o un criterio di rilascio bloccante. **Se
l'ordine si esaurisce, si dichiara la data mancata.** L'ordine finisce a `S-8` per costruzione, e la
sua fine è essa stessa un'informazione.

---

## 7. I presupposti di installazione

`RU-1` **dà per acquisite** le condizioni seguenti. Non sono raccomandazioni: sono la lista che
determina se un'installazione è possibile. Chi non può soddisfarle non può installare `RU-1`, e
saperlo prima vale più di scoprirlo dopo.

### 7.1 Che cosa deve fornire chi installa

| Elemento | Perché è un presupposto e non un'opzione |
|---|---|
| **Nome di dominio e certificati**, con rinnovo automatico | Il prodotto non gestisce il proprio ciclo di vita dei certificati |
| **Indirizzi raggiungibili dall'esterno per il nodo di relay** | È l'unico componente che lo richiede insieme alla frontiera |
| **Isolamento di rete in uscita del nodo di relay**, applicato dall'infrastruttura | È la **difesa primaria**, e non dipende dalla correttezza del codice. Le liste di indirizzi vietati sono difesa in profondità ([`V-10`](../11_registri/01-vincoli-in-vigore.md#v-10)) |
| **Negazione di rotta in uscita ai componenti applicativi**, con la sola eccezione del mediatore | Requisito architetturale ([`V-157`](../11_registri/01-vincoli-in-vigore.md#v-157)), non regola di codifica |
| **Separazione dei privilegi fra archivio applicativo e archivio del registro** | **Requisito, non raccomandazione**, e con `TG-23` il suo peso aumenta: senza ancoraggio periodico firmato, la separazione dei privilegi è **lo strato che resta**. In sua assenza la garanzia di non alterabilità si riduce a quella della sola catena applicativa, e la riduzione va dichiarata negli adempimenti di chi installa |
| **Custodia della chiave radice** della gerarchia di cifratura | La chiave che protegge le copie non può risiedere nel sistema che le produce |
| **Copie di sicurezza, con prova periodica di ripristino** | Una copia mai ripristinata ha probabilità sconosciuta di funzionare |
| **Fornitore di identità proprio, o federazione con il sistema dell'integratore** | `RU-1` accetta un'identità già autenticata dall'integratore; **non** contiene la conformità verificata sull'identità digitale nazionale (§4.3) |
| **Canale di recapito dei messaggi**, con il proprio contratto | Il prodotto invia, non è l'operatore del canale |
| **Sorveglianza, correlazione degli eventi e gestione degli incidenti** | Il prodotto esporta gli eventi; il sistema di correlazione è del cliente. **Con `TG-09` anche i cruscotti sono suoi** |
| **Costruzione dei propri cruscotti** sull'esportazione delle metriche | Conseguenza diretta di `TG-09`, elencata qui perché è un presupposto e non una preferenza |
| **Determinazione dei termini di conservazione** della documentazione sanitaria | Il prodotto li rende configurabili, **non li decide**: la determinazione è del titolare del trattamento |
| **Definizione dei livelli di servizio attesi** | Il prodotto li misura, non li fissa |
| **Finestra di manutenzione per gli aggiornamenti** | Conseguenza diretta di `TG-11`: le migrazioni non sono non bloccanti |
| **Competenza tecnica per l'amministrazione** | Conseguenza diretta di `TG-10`: l'amministrazione avviene per configurazione versionata e riga di comando, non da interfaccia |
| **Cadenza di aggiornamento dei componenti esposti**, in particolare del relay | Per un componente esposto, l'aggiornamento è un obbligo e non una buona pratica |

### 7.2 Che cosa deve fornire chi installa sul piano degli adempimenti

Nessuno degli adempimenti verso le autorità è del fornitore, e nessuna clausola contrattuale li
sposta - **e questo non cambia con `D58`**. L'elenco completo è in
[`docs/06_security/09-ripartizione-delle-responsabilita.md`](../06_security/09-ripartizione-delle-responsabilita.md) §11.
Quest'area ne richiama i tre che si scoprono più spesso troppo tardi:

1. **La valutazione d'impatto sulla protezione dei dati**, che è del titolare e precede il
   trattamento. Il progetto fornisce il materiale strutturale.
2. **La notifica degli incidenti** verso le autorità, con i propri orologi. Il progetto notifica
   **al cliente** sotto le ventiquattro ore e fornisce l'evidenza; non notifica alle autorità al
   posto suo.
3. **L'approvazione dei piani da parte degli organi di amministrazione**, che nessun fornitore può
   surrogare.

### 7.3 Che cosa fornisce il progetto

| Artefatto | Contenuto |
|---|---|
| Definizioni di dispiegamento riproducibili | Per il **solo** profilo a tenant unico (`TG-08`) |
| Migrazioni automatiche | Applicate su tutti gli schemi attivi, con esito registrato, **in finestra di manutenzione** (`TG-11`) |
| Verifiche di configurazione bloccanti all'avvio | §3.9 |
| Distinta dei materiali firmata, per ogni artefatto | Compresi i componenti delle immagini di base |
| Attestazioni di rilascio | Provenienza, distinta, esito delle prove, tracciabilità, **riproducibilità dell'artefatto principale** (`TG-14`), conformità del profilo di produzione |
| Procedura eseguibile di verifica a cura di chi installa | Con i comandi. **Eseguibile da chiunque**; non eseguita da un secondo soggetto (`TG-20`) |
| Procedura di copia e ripristino, materiale di chiave compreso | Con obiettivi dichiarati e almeno un'esecuzione documentata |
| Procedura di verifica dell'integrità del registro | Su richiesta e programmata, con esito registrato. **Senza ancoraggio esterno** (`TG-23`) |
| Esportazione delle metriche in formato aperto | Con i nomi delle serie documentati (`TG-09`) |
| Scheda dei dati per la dichiarazione dei fornitori rilevanti | Denominazione, identificativo fiscale, Paese della sede legale, codici della nomenclatura degli appalti, criterio di rilevanza |
| Politica di divulgazione coordinata e canale funzionante | Con tempi dichiarati |
| Manuale di installazione ed esercizio | **In italiano**, con i presupposti del §7.1 in testa; avvertenze e limiti d'uso **in entrambe le lingue** (`TG-19`) |
| **Elenco delle lacune dichiarate** | Con la data in cui ciascuna è nata, e con i quattro tagli irreversibili del §5.3 in testa |

---

## 8. I criteri di rilascio bloccanti

`RU-1` **non si pubblica** se anche uno solo di questi criteri non è soddisfatto. Non esiste deroga,
non esiste approvazione che li superi, **nessuno di essi entra nell'ordine di sacrificio del §6**, e
la verifica è automatica dove può esserlo.

| # | Criterio | Come si verifica |
|---|---|---|
| 1 | **Isolamento fra tenant**: nessun percorso, per nessuna interfaccia, consente di leggere o scrivere dati di un altro tenant | Prove che tentano attivamente l'accesso illegittimo, in condizioni avverse: pool esaurito, contesto non risolto, richiesta senza tenant, tenant sostituito a metà percorso |
| 2 | **Nessuna configurazione supportata emette un token privo del claim dell'attore** ([`V-132`](../11_registri/01-vincoli-in-vigore.md#v-132)) | Prova negativa su tutte le configurazioni supportate |
| 3 | **La catena del registro immutabile è verificabile**, e l'alterazione indotta viene rilevata | Esecuzione della verifica su un caso alterato deliberatamente |
| 4 | **Nessun contenuto clinico** in registri, metriche, tracce, buste degli eventi, messaggi di errore | Prove che tentano di far passare dati sensibili e falliscono se ci riescono |
| 5 | **I controlli di pipeline dichiarati bloccanti hanno superato la prova di fallimento**, e i controlli in sola segnalazione hanno ciascuno la data dichiarata in cui diventano bloccanti | Ciascuno provato con un caso deliberatamente non conforme; file di configurazione versionato per le date |
| 6 | **Riproducibilità dell'artefatto principale verificata**: ricostruzione su esecutore diverso, impronte identiche, esito conservato | Lavoro pianificato con esito conservato. Il perimetro ridotto è dichiarato (`TG-14`) |
| 7 | **Distinta dei materiali completa**: nessun componente presente nella distinta e assente dalle annotazioni | Controllo di pipeline |
| 8 | **Nessuna migrazione insieme distruttiva e funzionale**: due versioni consecutive convivono sulla stessa base dati ([`V-111`](../11_registri/01-vincoli-in-vigore.md#v-111)) | Prova di convivenza e prova di ritorno alla versione precedente |
| 9 | **Accessibilità**: nessuna violazione delle regole automatizzabili su alcuna schermata e alcuno stato significativo; almeno una verifica manuale con tecnologia assistiva reale eseguita e registrata | Controllo di pipeline più lista di controllo manuale versionata. **Non è una valutazione formativa** (`TG-22`) |
| 10 | **L'indicatore di registrazione non è occultabile**: la prova che tenta di nasconderlo con ogni mezzo previsto dalla configurazione fallisce in tutti | Prova negativa |
| 11 | **Le prove negative delle esclusioni di perimetro passano**: nessuna interfaccia accetta il calcolo di una priorità, la deduzione di una soglia, la generazione di contenuto interpretativo | Prove negative per ciascuna esclusione con verifica dichiarata |
| 12 | **La verifica delle chiavi è stato bloccante della macchina a stati**, e la procedura in caso di mancata corrispondenza è provata con la stessa evidenza del caso positivo | Prova di percorso, comprensiva del caso negativo |
| 13 | **Il nodo di relay non instrada verso l'anello di richiamo locale, verso indirizzi privati e verso i servizi di metadati** | Prova che fa fallire la costruzione se una qualunque richiesta riesce |
| 14 | **Il rapporto di tracciabilità è prodotto** e la vista «requisiti senza prove» è vuota o è una lista di lacune dichiarate con motivazione | Artefatto di rilascio |
| 15 | **Ogni artefatto reca la dichiarazione di non marcatura**, nel testo riallineato a `D58`, e **nessun materiale del rilascio contiene una data di marcatura** | Controllo di pubblicazione più verifica testuale |
| 16 | **Nessun `[NV]` aperto su un componente rilasciato** | Rapporto degli `[NV]` con destinatario |
| 17 | **Il fascicolo di rilascio contiene l'elenco delle lacune dichiarate**, con i quattro tagli irreversibili del §5.3 in testa e la dichiarazione che nessuna verifica è stata eseguita da un secondo soggetto, **in entrambe le lingue** | Artefatto di rilascio, verificato testualmente |
| 18 | **Il periodo di supporto è dichiarato** e il piano di dismissione delle versioni è pubblicato | Documento pubblicato. Dipende da `C-4` / [`Q-186`](../11_registri/02-questioni-aperte.md#q-186) |

**Il criterio 17 è quello che sostituisce il riesame del rilascio, e non lo sostituisce
davvero.** Nella versione precedente di questo capitolo il criterio 18 chiedeva un **riesame
documentale del rilascio con responsabile e data**: sotto `D54` non è producibile (`TG-20`). Ciò che
resta producibile - e che quindi è criterio bloccante - è **la dichiarazione esplicita che il
riesame non c'è stato**. Non è la stessa cosa e non va presentata come tale: è il minimo che
consente a chi riceve l'artefatto di sapere che cosa ha in mano.

---

## 9. I limiti dichiarati di `RU-1`

Un limite dichiarato è una funzionalità del prodotto; un limite scoperto in produzione è un
incidente. Questi sono i limiti di `RU-1`, in aggiunta a quelli permanenti del prodotto già elencati
in [`docs/01_technical/07-prestazioni-e-capacita.md`](../01_technical/07-prestazioni-e-capacita.md) §7.

| # | Limite | Natura |
|---|---|---|
| 1 | **Non utilizzabile su pazienti reali**; nessuna marcatura CE, nessuna dichiarazione di conformità | Condizione dichiarata, non rimovibile per configurazione (§1.1) |
| 2 | **Nessuna verifica eseguita da un secondo soggetto** | Taglio irreversibile `TG-20` |
| 3 | **Un solo tipo di prestazione**: televisita programmata | Perimetro (§4.2) |
| 4 | **Due partecipanti** alla sessione | Decisione sulla topologia dichiarata rinviata (`C-2`) |
| 5 | **Nessun referto**: il percorso restituisce un esito strutturato, non un documento firmato | Taglio `TG-01`, reversibile |
| 6 | **Nessuna facciata di interoperabilità**: una sola superficie di integrazione, quella propria del progetto | Taglio `TG-02`, reversibile |
| 7 | **Nessun componente incorporabile**: avvio per rinvio con token a uso singolo, nessun tema personalizzato | Taglio `TG-03`, reversibile |
| 8 | **Un solo consumatore di eventi per tenant**, senza broker, senza riproduzione della cronologia | Taglio `TG-04`, reversibile |
| 9 | **Un solo profilo di dispiegamento**, a tenant unico | Taglio `TG-08`, reversibile |
| 10 | **Nessuna interfaccia di amministrazione**: configurazione versionata e riga di comando | Taglio `TG-10`, reversibile |
| 11 | **Aggiornamenti in finestra di manutenzione** | Taglio `TG-11`, reversibile |
| 12 | **Registro immutabile senza ancoraggio esterno**: garanzia ridotta di uno strato per il periodo | Taglio `TG-23`, **irreversibile per il periodo** |
| 13 | **Nessuna registrazione della sessione** | Perimetro. L'indicatore e i suoi divieti esistono già |
| 14 | **Nessun conferimento alle infrastrutture documentali** | Dipendenza esterna non disponibile ([`Q-07`](../11_registri/02-questioni-aperte.md#q-07)) |
| 15 | **Latenza da obiettivo a schermo non garantibile e non sorvegliata da prova di regressione** | Dipende da telecamera, calcolo, schermo, rete e buffer. Il sistema la **misura** in sessione e la registra (`TG-13`) |
| 16 | **Degrado provato agli estremi, non lungo la scala** | Taglio `TG-12`, reversibile |
| 17 | **Nessuna modalità fuori linea per il contenuto clinico** | Scelta dichiarata, motivata dal rischio di contenuto clinico su un dispositivo che il titolare non controlla |
| 18 | **Nessuna rotazione delle chiavi durante la sessione** | **Non esiste nella tecnologia.** Non si rivendica |
| 19 | **Sottotitoli in tempo reale assenti** | Non conformità dichiarata su un criterio di accessibilità, con l'interprete come misura alternativa e il canale dati comunque definito nel protocollo |
| 20 | **Consegna degli eventi almeno una volta** | I consumatori sono idempotenti per costruzione |
| 21 | **Numero di tenant per installazione** | `[NV]` - non misurato. Ordine di grandezza dichiarato: centinaia. La misura spetta a `TECH` su un'installazione rappresentativa ed è un'attività di rilascio, non una stima |
| 22 | **Riproducibilità verificata sul solo artefatto principale** | Taglio `TG-14`, reversibile |
| 23 | **Interfaccia verificata rispetto ai criteri di accessibilità, non validata con gli utenti destinatari** | Taglio irreversibile `TG-22` |
| 24 | **Confine di autorizzazione non rivisto da un terzo indipendente** | Taglio `TG-21`, irreversibile per il periodo |

---

## 10. Come si verifica di aver ricevuto ciò che è dichiarato

La domanda è di chi installa e la risposta è una procedura, non una dichiarazione. Sotto `TG-20`
questa procedura acquista un peso che prima non aveva: **è l'unica verifica indipendente che
esisterà su `RU-1`**, e la esegue chi installa.

1. **Verificare la firma e la provenienza** dell'artefatto, con i comandi del manuale. Un artefatto
   firmato che nessuno verifica aggiunge una dichiarazione, non sicurezza.
2. **Confrontare la distinta dei materiali** con il proprio inventario, e conservarla: è la parte
   che il cliente non può ricostruire e che serve ai suoi adempimenti.
3. **Ricostruire l'artefatto principale dal sorgente pubblicato** e confrontare le impronte. È la
   sola verifica che accerti che la distribuzione corrisponde al sorgente. Sugli altri artefatti la
   verifica non è disponibile (`TG-14`).
4. **Eseguire le verifiche di configurazione all'avvio** in un ambiente pulito e osservare che il
   sistema **si rifiuti di avviarsi** nelle configurazioni insicure. Un sistema che si avvia
   comunque non ha i controlli che dichiara.
5. **Eseguire la procedura di ripristino** su un ambiente separato, e verificare che la catena del
   registro immutabile risulti verificabile dopo il ripristino. Un ripristino che produce una catena
   non verificabile è un ripristino **fallito**, non riuscito con avviso.
6. **Leggere il rapporto di tracciabilità**, in particolare la vista dei requisiti senza prove.
7. **Leggere l'elenco delle lacune dichiarate**, e in particolare i quattro tagli irreversibili del
   §5.3. È l'elenco che determina che cosa `RU-1` **non** potrà mai dimostrare del proprio periodo,
   ed è l'informazione che nessun'altra parte del fascicolo contiene.

---

## 11. Impegno del progetto e impegno di chi installa, riga per riga

| Ambito | Il progetto si impegna a | Chi installa si impegna a |
|---|---|---|
| **Cifratura in transito** | Fornirla su tutti i canali, impedire il declassamento, **misurare e registrare** ciò che viene negoziato invece di dichiararlo | Verificare che la configurazione distribuita non l'abbia alterata, e conservarne l'evidenza |
| **Cifratura a riposo** | Fornire il meccanismo con chiavi per tenant separabili dal dato e la cancellazione crittografica | **Custodire la chiave radice**, fuori dal sistema che produce le copie |
| **Registro non alterabile** | Fornirlo con catena di impronte, esportazione firmata in formato aperto, verifica di integrità. **Senza ancoraggio esterno in `RU-1`** (`TG-23`) | Garantire la **separazione dei privilegi** fra archivio applicativo e archivio del registro, che con `TG-23` è lo strato che resta |
| **Aggiornamenti di sicurezza** | Rilasciarli su canale autenticato, con avviso pubblicato, entro il livello di servizio dichiarato in **giorni per gravità** ([`V-185`](../11_registri/01-vincoli-in-vigore.md#v-185)) | **Applicarli**, secondo la propria politica, in finestra di manutenzione (`TG-11`) |
| **Isolamento di rete** | Documentare la configurazione di riferimento e verificarla all'avvio dove possibile | **Applicare le regole di rete**: negazione di rotta in uscita ai componenti applicativi, isolamento del relay |
| **Copie di sicurezza** | Fornire procedura, obiettivi dichiarati e capacità di cifratura | **Eseguirle**, tenerne una non raggiungibile in permanenza dal sistema, **provare il ripristino** |
| **Incidenti** | Notificare al cliente **sotto le ventiquattro ore**, immediatamente per gravità elevata; fornire il rapporto entro il giorno successivo con la sequenza temporale; consegnare i registri in formato aperto | **Notificare alle autorità**, entro i propri termini, secondo i propri orologi |
| **Sorveglianza** | Esportare le metriche in formato aperto con i nomi delle serie documentati | **Costruire i cruscotti** e la correlazione degli eventi (`TG-09`) |
| **Conservazione** | Rendere i termini configurabili, tracciare l'esecuzione, rendere verificabile l'esito | **Determinare i termini**, che sono del titolare del trattamento |
| **Livelli di servizio** | **Misurarli** e storicizzarli per tenant e per servizio, con allarme al superamento | **Definirli**, perché la soglia determina che cosa è un incidente significativo |
| **Verifica indipendente** | Fornire una procedura di verifica **eseguibile da chiunque**, e dichiarare che **nessuna verifica è stata eseguita da un secondo soggetto** (`TG-20`) | **Eseguirla.** In `RU-1` è l'unica verifica indipendente che esiste |
| **Marcatura** | **Nulla, oggi.** Il prodotto non reca marcatura CE e non è coperto da alcuna dichiarazione di conformità. Il progetto **intende assumere il ruolo di fabbricante** (`D58`), con il soggetto ancora da costituire, e ne pubblica la pianificazione interna - **mai una data di marcatura** | Assumere il ruolo di fabbricante se immette sul mercato, con tutti gli obblighi che ne derivano. **L'intenzione del progetto non trasferisce nulla** |

> **La riga che va letta due volte è l'ultima**, e più attentamente di prima. Che il progetto
> intenda certificare in futuro **non copre alcuna installazione presente**, non toglie alcun
> obbligo a chi integra e non anticipa alcun esito. Nessuna clausola della licenza, nessun accordo
> e nessuna dichiarazione del progetto trasferisce a chi integra una protezione che non esiste, né
> gli toglie un obbligo che la norma gli attribuisce - e **la responsabilità verso il danneggiato
> non è escludibile per contratto**.

---

**Prosegue in**: [04 - Oltre il primo rilascio](./04-oltre-il-primo-rilascio.md), dove le voci del
§4 e i tagli reversibili del §5 trovano il loro ordine di priorità.
