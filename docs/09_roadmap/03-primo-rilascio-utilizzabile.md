---
title: Primo rilascio utilizzabile
sidebar_position: 4
description: Che cosa contiene esattamente il primo rilascio che una struttura può installare, che cosa resta fuori e per quale ragione, quali presupposti dà per acquisiti da chi installa, quali limiti dichiara e quali criteri bloccanti deve superare per essere pubblicato.
---

# Primo rilascio utilizzabile

Nel resto della roadmap questo rilascio è il traguardo `T-10`. In questo capitolo è designato
**`RU-1`**.

> **`[NV]` — la denominazione della distribuzione non è decisa.** `D17` impone che il repository
> e la distribuzione abbiano **nomi, numeri di versione e cicli di vita distinti**. La sigla
> `RU-1` è una designazione di pianificazione, non il nome dell'artefatto: il nome della
> distribuzione è una decisione del soggetto che la produce e va presa prima della prima
> pubblicazione. Fino ad allora nessun documento del progetto deve usare `RU-1` come se fosse un
> nome di prodotto.

---

## 1. Che cosa significa «utilizzabile», e il limite che nessuna configurazione rimuove

### 1.1 Il limite

**`RU-1` non è utilizzabile per l'erogazione di prestazioni sanitarie su pazienti reali.** Non è
una cautela redazionale: è la condizione dichiarata da `D16` e ribadita dal vincolo `V-06`, e
resta vera per ogni artefatto distribuito finché non esiste una marcatura apposta da un soggetto
fabbricante che se ne assume la responsabilità. Il progetto non appone marcatura, non costituisce
un fabbricante, non ingaggia organismi di valutazione e non conduce la valutazione clinica
(`D28`, `D49`, `OUT-20`).

Il limite ha tre proprietà che vanno enunciate perché sono quelle che chi valuta il prodotto
tende a sottovalutare:

1. **Non è rimovibile per configurazione.** Nessun parametro, nessun profilo, nessuna licenza,
   nessun accordo contrattuale con il progetto lo modifica.
2. **È verificabile.** Ogni artefatto reca la dichiarazione di non marcatura, e la sua assenza
   impedisce la pubblicazione (controllo di pipeline, criterio 7 del traguardo `T-01`).
3. **Non si trasferisce con la licenza.** Chi integra il software in un prodotto commerciale e lo
   immette sul mercato **è fabbricante per legge**, indipendentemente da quanto scritto nella
   licenza. È scritto nell'area di integrazione e va ripetuto qui, perché è la domanda che ogni
   integratore pone.

### 1.2 Che cosa allora si può fare con `RU-1`

Quattro impieghi, tutti legittimi e tutti reali.

| Impiego | Perché ha valore |
|---|---|
| **Integrazione e sviluppo presso un integratore** | È l'impiego per cui il prodotto è disegnato: consente di costruire e provare l'integrazione mentre il percorso regolatorio procede in parallelo, invece che dopo |
| **Formazione e addestramento del personale** | Con dati sintetici, su percorsi reali. È tempo che non si recupera se si comincia dopo la marcatura |
| **Valutazione tecnica e di conformità** | È l'artefatto su cui un responsabile della sicurezza, un responsabile della protezione dei dati o una commissione di gara verificano le affermazioni invece di crederle |
| **Base per chi intende certificare** | È la distribuzione su cui si costruisce un fascicolo tecnico, prodotta da costruzione riproducibile e verificabile byte per byte contro il sorgente pubblicato |

**Quello che non è**: un prodotto in commercio, una dimostrazione, o un prototipo. Ha manuale di
installazione, artefatti firmati, distinta dei materiali, procedura di ripristino e criteri di
rilascio bloccanti. La differenza fra un prototipo e `RU-1` è che il primo si mostra e il secondo
si installa.

---

## 2. Il criterio di composizione: un percorso verticale, non un insieme di funzioni

Il criterio è enunciato in [01 §4.2](./01-principi-e-metodo.md) e qui si applica:

> Si consegna il **percorso verticale completo più stretto possibile**, non l'insieme più ampio
> possibile di funzioni.

### 2.1 Quale percorso, e perché quello

Il percorso scelto per `RU-1` è la **televisita programmata, dall'appuntamento ricevuto per
riferimento fino al documento clinico validato e restituito al sistema di origine**.

La scelta non è di comodità. È il percorso che, fra tutti quelli catalogati, **attraversa il
maggior numero di vincoli trasversali con il minor numero di dipendenze da terzi**:

| Vincolo trasversale | Il percorso lo attraversa? | Dove |
|---|---|---|
| Separazione fra prestazione e sessione media (`V-01`) | **Sì**, ed è il percorso che la rende visibile: una caduta di rete non chiude l'atto clinico | Sessione media distinta dalla prestazione |
| Tenant risolto e applicato dal motore (`V-04`, `V-112`) | **Sì**, in ogni interrogazione | Tutti i contesti coinvolti |
| Registro immutabile a catena di impronte (`V-04`, `V-150`) | **Sì**: ogni accesso a dato sanitario del percorso è tracciato | Contesto di tracciamento |
| Consenso come fatto con validità temporale (`V-146`) | **Sì**, con almeno tre dei cinque oggetti di consenso distinti | Contesto del consenso |
| Verifica delle chiavi obbligatoria per impostazione predefinita (`D22`) | **Sì**, ed è uno stato bloccante della macchina a stati della sessione | Interfaccia e sessione media |
| Documento immutabile con catena di rettifica | **Sì** | Documentazione clinica |
| Accessibilità e *mobile first* come criteri di accettazione (`D25`, `V-06` di base) | **Sì**, su entrambi i lati: assistito su smartphone in rete mobile, professionista con sola tastiera e lettore di schermo | Interfaccia |
| Nessuna funzionalità raggiungibile solo dall'interfaccia (`V3`, `V-164`) | **Sì**: l'interfaccia consuma le stesse interfacce applicative offerte agli integratori | Piani di esposizione |
| Eventi con soli riferimenti, mai contenuto clinico (`V-135`, `V-161`) | **Sì**, sull'evento di conclusione della prestazione | Outbox ed eventi |
| Esito distinto dallo stato, con effetti amministrativi opposti (`V-141`) | **Sì**: mancata presentazione e fallimento tecnico attribuibile all'assistito condividono lo stato terminale e hanno effetti opposti | Prestazione clinica |
| Assenza di dato come informazione (`V-09`) | **Parzialmente**: il percorso la esercita sull'appuntamento non onorato, non sul telemonitoraggio | — |
| Sistema pienamente funzionale senza le terminologie a licenza vincolata (`V-03`) | **Sì**, ed è la configurazione predefinita delle prove | Gateway terminologico |

Un percorso che attraversa tutti questi vincoli **li prova**. Un insieme largo di funzioni
incomplete non ne prova nessuno, e in più non consente di dire che cosa è fatto.

### 2.2 La seconda ragione, che è di conformità

Un percorso verticale completo è **tracciabile per intero**: dal requisito alla progettazione, al
codice, alla prova, al controllo di rischio. Un insieme di funzioni parziali produce una matrice
di tracciabilità con molte righe e molte lacune, che è precisamente la forma che chi verifica
considera peggiore dell'assenza.

---

## 3. Che cosa `RU-1` contiene

L'elenco è per contesto delimitato, perché è la struttura con cui il sistema è costruito e quella
con cui va verificato. I rinvii ai blocchi di requisiti servono a chi deve controllare la
copertura; il catalogo completo è in
[`docs/03_functional/02-catalogo-dei-requisiti.md`](../03_functional/02-catalogo-dei-requisiti.md).

### 3.1 Piattaforma e proprietà trasversali

| Capacità | Contenuto |
|---|---|
| **Multi-tenancy attiva** | Schema per tenant su base dati condivisa, con sicurezza a livello di riga come difesa in profondità e negazione predefinita in assenza di contesto. L'installazione a tenant unico è il **caso degenere dello stesso codice**, non una variante |
| **Confine di autorizzazione unico** | Validazione integrale del token in ingresso, emissione del token interno, **delega sempre rappresentata con il claim dell'attore, mai impersonificazione** (`V-132`) |
| **Livello di garanzia qualificato** | Distinzione fra autenticazione **eseguita** e **riferita** da un integratore, propagata fino al punto di decisione (`V-154`, `V-165`) |
| **Registro immutabile** | Struttura in sola aggiunta con catena di impronte, archiviazione a privilegi disgiunti, verifica dell'integrità su richiesta e programmata, esportazione in formato aperto con impronta |
| **Outbox transazionale** | Unica sorgente degli eventi in uscita; buste con **soli riferimenti**; consegna almeno una volta; consumatori idempotenti per costruzione |
| **Gateway terminologico** | Punto unico di accesso, disattivabile per sistema di codifica, **senza cache persistita su disco**, senza identificativi dell'assistito nelle interrogazioni, con modalità degradata che è la configurazione predefinita delle prove |
| **Due sole rappresentazioni dell'errore** | Rappresentazione del problema sul piano applicativo, esito dell'operazione sul piano di interoperabilità, con catalogo **generato** e divieto di emettere un errore non catalogato (`V-110`, `V-130`) |
| **Mediatore unico di uscita** | Nessun componente applicativo apre connessioni verso destinazioni derivate da un dato in ingresso; l'uscita è negata a livello di rete a tutti tranne che al mediatore (`V-157`) |
| **Misura della disponibilità per tenant e per servizio** | Storicizzata con granularità sufficiente a riconoscere il superamento di una soglia dell'ordine del punto percentuale su base giornaliera. **La soglia la sceglie chi installa; il prodotto fornisce la misura** |

### 3.2 Identità e accessi

- Federazione con realm distinti per il contesto clinico e per quello dell'assistito, con un
  **realm di intermediazione unico** verso la federazione nazionale.
- Accettazione di un'identità già autenticata dal sistema dell'integratore, **senza secondo
  accesso**, con delega esplicita.
- Autorizzazione fondata sulla **relazione di cura**, non sul solo ruolo; ruolo come relazione fra
  persona e organizzazione con validità temporale, non come attributo della persona.
- **Accesso d'emergenza come requisito funzionale** (`V-153`): motivazione libera obbligatoria,
  finestra e perimetro limitati, notifica, riesame con esito registrato.
- **Separazione fra ruolo tecnico e ruolo clinico** applicata dal motore di autorizzazione: la
  composizione di un ruolo che la violi è rifiutata con errore di validazione (`V-125`).

Blocchi di riferimento: `RF-001`…`RF-019`, `RNF-110`, `BR-166`.

### 3.3 Anagrafiche per riferimento

- Assistiti, professionisti, organizzazioni e sedi trattati **per riferimento** sugli
  identificativi del sistema di origine. Il prodotto **non è** il dato di riferimento e non
  esegue riconciliazione delle identità (`OUT-15`).
- Normalizzazione degli identificatori **al confine, mai nel dominio** (`V-142`); registro degli
  identificatori di sistema versionato, con configurazione per tenant su che cosa si accetta in
  ingresso e che cosa si emette in uscita.
- **Nessun identificatore esterno è chiave primaria.**

Blocchi di riferimento: `RF-020`…`RF-032`.

### 3.4 Prestazione clinica e sessione media

- **Televisita programmata** come tipo di prestazione, con la propria macchina a stati selezionata
  dal catalogo (`V-140`).
- Invito recapitato con i canali di chi installa; **verifica tecnica preventiva** prima della
  sessione; sala d'attesa; ammissione; abbandono.
- Sessione media punto a punto **cifrata fino agli estremi come modalità predefinita**, con
  instradamento diretto quando la rete lo consente e relay quando non lo consente.
- **Verifica delle chiavi obbligatoria per impostazione predefinita** (`D22`), come **stato
  bloccante** della macchina a stati, con i requisiti di accessibilità che la rendono
  utilizzabile da un assistito anziano: leggibile carattere per carattere da lettore di schermo,
  mai veicolata dal solo colore, alfabeto privo di caratteri ambigui, **procedura definita in caso
  di mancata corrispondenza** con la stessa evidenza del caso positivo.
- **Degrado dichiarato**: riduzione della risoluzione, poi della fluidità secondo la preferenza
  impostata, poi sospensione del video con **audio mantenuto**, poi avviso di inidoneità con
  proposta di rinvio o di canale alternativo. Ogni transizione è annunciata in modo percepibile
  anche senza vista e senza udito.
- **Misura della qualità per sessione**, con indice proprietario dichiarato tale, costruito sul
  **minimo** fra le dimensioni e non sulla media, e con i contatori cumulativi **differenziati fra
  campioni consecutivi** (`V-113`, `V-114`).
- **Avviso di qualità inadeguata al professionista** come controllo di rischio registrato, con
  l'esito della decisione del professionista conservato.
- **Chiusura con esito tipizzato**, con lo stato distinto dall'esito e con gli effetti
  amministrativi opposti mantenuti separati (`V-141`).
- **Ripiego telefonico** come esito tipizzato obbligatorio: il cambio di canale è registrato e
  riportato nel documento.

Blocchi di riferimento: `RF-035`…`RF-086`, `RF-161`…`RF-172`.

### 3.5 Consenso

- **Cinque oggetti di consenso distinti** con cicli di vita indipendenti — atto sanitario,
  trattamento dei dati ove applicabile, registrazione, presenza di terzi, trasmissione a sistemi
  esterni — e nessun «consenso alla piattaforma» (`V-146`).
- Consenso riferito alla **versione del testo** dell'informativa; revoca con effetto; nessun
  consenso booleano.
- **Oscuramento applicato dal motore di autorizzazione**, non dai consumatori, con i sei canali di
  inferenza chiusi e con dati sintetici di collaudo che comprendono documenti oscurati (`V-149`).

Blocchi di riferimento: `RF-110`…`RF-121`.

### 3.6 Documentazione clinica

- Bozza, validazione, **firma**, immodificabilità del documento firmato, rettifica come nuova
  versione con catena mantenuta.
- Contenuto modellato come **dataset canonico** sul set informativo della tipologia documentale
  propria della televisita; le serializzazioni sono **sostituibili e non cablate** (`V-07`,
  `V-136`, `V-143`).
- **Nessuna precompilazione di contenuto clinico interpretativo**: si precompilano dati
  anagrafici, amministrativi e temporali (`OUT-07`).
- **Attestazione della qualità del collegamento e conferma di idoneità** prodotta in forma
  strutturata, **misurata dal sistema e confermata dal professionista**, mai generata
  autonomamente e inserita nel documento.
- **Annotazione digitale in luogo del referto** dove il setting di erogazione lo prevede: l'obbligo
  di referto non è incondizionato e non è cablato (`V-145`).
- Consegna del documento **al sistema di origine**, in forma canonica, tramite chiamata
  autenticata: la notifica dice che è successo qualcosa e dove trovarlo, il contenuto si rilegge.

Blocchi di riferimento: `RF-124`…`RF-136`.

### 3.7 Interfacce verso terzi

- **Interfaccia applicativa di progetto** descritta e versionata, con prove a contratto in
  entrambe le direzioni.
- **Facciata di interoperabilità** con documento di capacità e profili fissati per versione come
  artefatto di costruzione.
- **Eventi in uscita firmati con firma asimmetrica** e identificativo di chiave risolvibile dal
  materiale pubblico del progetto; il segreto condiviso **non è offerto come modalità
  predefinita** (`V-162`).
- **Componente incorporabile** come elemento personalizzato conforme allo standard dei componenti
  web, con insieme chiuso e versionato di proprietà di tema, validate lato server con verifica del
  contrasto, e con gli **elementi non tematizzabili né occultabili** (`V-163`).
- **Profilo di integrazione del pagatore amministrativo per costruzione**: identificativo della
  prestazione, esito amministrativo, importo. Nessun percorso, diretto o mediato, verso contenuto
  clinico (`V-166`, `OUT-18`).

Blocchi di riferimento: `RF-208`…`RF-223`.

### 3.8 Interfaccia utente

- Percorso dell'assistito e percorso del professionista, entrambi conformi ai criteri *mobile
  first* e di accessibilità come **criteri di accettazione**, non come rifinitura.
- **Indicatore di registrazione persistente e non occultabile** quando la registrazione è attiva —
  anche se la modalità con registrazione **non è in `RU-1`**, l'indicatore e i suoi divieti
  esistono già, perché una funzione che compare dopo con i propri divieti non li ha mai provati.
- **Nessun contenuto clinico in archiviazione persistente del navigatore**, nessun token
  nell'archiviazione persistente, pulizia esplicita alla chiusura della sessione.
- **Nessuna decisione clinica nel client**: nessuna valutazione avviene nell'interfaccia.

### 3.9 Esercizio

- Verifiche di configurazione **bloccanti all'avvio**: politiche di riga attive e non superabili
  dal ruolo applicativo, archivio del registro non raggiungibile con le credenziali applicative,
  relay non raggiungibile dalle reti interne, versione minima del relay, nessun segreto ai valori
  predefiniti, politica di conservazione presente per ogni categoria, migrazioni applicate su
  tutti gli schemi attivi.
- **Il servizio terminologico irraggiungibile non impedisce l'avvio**, con la politica di degrado
  dichiarata. È la traduzione operativa di `V-03`.
- Tre cruscotti versionati nel repository: salute del servizio, qualità del media, integrità e
  sicurezza.

---

## 4. Che cosa `RU-1` **non** contiene, e perché

Le esclusioni si dividono in quattro categorie con conseguenze diverse. **Confonderle è l'errore
che porta a chiedere per il rilascio successivo qualcosa che non arriverà mai.**

### 4.1 Categoria I — Fuori perimetro in modo definitivo

Non sono esclusioni di rilascio: sono esclusioni di prodotto, elencate con identificativo e
categoria di riapribilità in
[`docs/03_functional/07-fuori-perimetro.md`](../03_functional/07-fuori-perimetro.md). Comprendono
l'interpretazione clinica in ogni sua forma, la deduzione delle soglie, il triage calcolato, la
verifica delle interazioni fra farmaci, il dialogo diretto con i dispositivi medici domiciliari,
il canale di emergenza, il riconoscimento biometrico, l'indice di riconciliazione delle identità,
la mediazione dell'accesso di un pagatore al fascicolo, la conservazione a norma.

**Non torneranno in un rilascio successivo.** Alcune sono riapribili solo con una valutazione di
impatto regolatorio registrata; una — la mediazione dell'accesso di un pagatore — non è riapribile
finché la fonte è in vigore.

### 4.2 Categoria II — Rinviate per sequenza

Sono nel perimetro del prodotto, sono pianificate, e non sono in `RU-1` perché il criterio di
composizione impone un percorso verticale stretto.

| Esclusa da `RU-1` | Perché non ora | Dove torna |
|---|---|---|
| **Telemonitoraggio** in tutte le sue componenti | È il contesto più esteso del catalogo e dipende dal congelamento formale della destinazione d'uso (`Q-144`). Finché quella decisione è aperta, il lavoro è a rischio di riscrittura integrale (`D46`) | [04 §3](./04-oltre-il-primo-rilascio.md), prima posizione |
| **Teleconsulto, teleconsulenza, teleassistenza** | Ciascuna è una macchina a stati propria con attori ammessi diversi; il vincolo professionale si applica all'**attività**, non al servizio minimo (`V-147`) | [04 §3](./04-oltre-il-primo-rilascio.md) |
| **Registrazione della sessione lato server** | È una **seconda modalità di sicurezza**, non una funzione opzionale: comporta la terminazione della cifratura sul server, un componente distinto con perimetro proprio, un flusso di consenso dedicato e la cifratura a riposo con chiavi per tenant | [04 §3](./04-oltre-il-primo-rilascio.md) |
| **Terzo partecipante** alla sessione | La decisione sulla topologia oltre due partecipanti è dichiarata rinviata al committente (`C-2`), e non è marginale: l'interprete è la misura alternativa dichiarata per la non conformità di accessibilità nota | Dopo la chiusura di `C-2` |
| **Moduli di agenda e fatturazione propri** | Il percorso di `RU-1` riceve l'appuntamento **per riferimento** dal sistema di origine, che è il caso d'uso di riferimento. I moduli propri servono a chi non ha già un'agenda | [04 §3](./04-oltre-il-primo-rilascio.md) |
| **Kit di sviluppo** in linguaggio di programmazione | L'interfaccia applicativa versionata è sufficiente alla prima integrazione; il kit è comodità, non capacità | [04 §3](./04-oltre-il-primo-rilascio.md) |
| **Messaggistica ospedaliera e profili di interoperabilità documentale** | Richiedono una controparte con un ambiente di prova | [04 §3](./04-oltre-il-primo-rilascio.md) |

### 4.3 Categoria III — Rinviate per dipendenza esterna non disponibile

Sono nel perimetro, sono pianificate, e **la loro data non dipende dal progetto**.

| Esclusa da `RU-1` | Da che cosa dipende |
|---|---|
| **Conferimento dei documenti alle infrastrutture documentali nazionali e regionali** | I modelli documentali, i codici di tipologia e i metadati di indicizzazione delle tipologie di telemedicina **non sono pubblicamente disponibili** (`Q-07`). Il progetto ha già la risposta strutturale — dataset canonico e serializzazione sostituibile — e l'adattatore esiste come punto di estensione con contratto dichiarato: **manca il contenuto, non il progetto** |
| **Conformità verificata sull'identità digitale nazionale** in tutti e tre i canali | Richiede ambienti di pre-produzione, credenziali di prova e, per uno dei canali, **due istanze di fornitore di identità per ciascun fornitore** (`D38`): è il lotto sistematicamente sottovalutato. `RU-1` contiene l'architettura di federazione e il realm di intermediazione, non la conformità verificata sull'intero insieme dei fornitori |
| **Soglie di prestazione dell'interfaccia dichiarate** | Il **dispositivo di riferimento non è dichiarato** (`Q-115`), e senza dispositivo il requisito corrispondente non è verificabile. `RU-1` misura e pubblica le condizioni; non dichiara una soglia che non è stata misurata |
| **Valori di riferimento dei livelli di servizio attesi** | La soglia la sceglie il cliente (`Q-152`, `Q-184`). `RU-1` fornisce la **capacità di misura**, che è il requisito |

### 4.4 Categoria IV — Rinviate per decisione non presa

Non sono escluse per scelta: sono escluse perché **una decisione dichiarata rinviata non si prende
in una proposta di modifica**.

| Voce | Decisione pendente |
|---|---|
| Calcolo di punteggi di scale e questionari clinici validati | `B-3` — regime di licenza degli strumenti, da verificare sulla licenza primaria. La conseguenza già assunta in via cautelativa è che il dominio **non rappresenta punteggi** |
| Contesto autonomo della rendicontazione | `C-1` — con l'avvertenza dichiarata che, finché non è deciso, il divieto sul profilo del pagatore è una convenzione e non un confine verificabile automaticamente |
| Piano di dismissione delle versioni pubblicato | `C-4`, `Q-186` — senza il periodo di supporto dichiarato non è determinabile quante versioni maggiori vanno mantenute |
| Oscuramento selettivo del contenuto audio-video ai fini del diritto di accesso | Dichiarato non presente nella prima versione; resta a `COMP` stabilire se il rilascio parziale soddisfi l'istanza dell'interessato (`Q-157`) |

---

## 5. I presupposti di installazione

`RU-1` **dà per acquisite** le condizioni seguenti. Non sono raccomandazioni: sono la lista che
determina se un'installazione è possibile. Chi non può soddisfarle non può installare `RU-1`, e
saperlo prima vale più di scoprirlo dopo.

### 5.1 Che cosa deve fornire chi installa

| Elemento | Perché è un presupposto e non un'opzione |
|---|---|
| **Nome di dominio e certificati**, con rinnovo automatico | Il prodotto non gestisce il proprio ciclo di vita dei certificati |
| **Indirizzi raggiungibili dall'esterno per il nodo di relay** | È l'unico componente che lo richiede insieme alla frontiera |
| **Isolamento di rete in uscita del nodo di relay**, applicato dall'infrastruttura | È la **difesa primaria**, e non dipende dalla correttezza del codice. Le liste di indirizzi vietati sono difesa in profondità (`V-10`) |
| **Negazione di rotta in uscita ai componenti applicativi**, con la sola eccezione del mediatore | Requisito architetturale (`V-157`), non regola di codifica |
| **Separazione dei privilegi fra archivio applicativo e archivio del registro** | **Requisito, non raccomandazione.** In sua assenza la garanzia di non alterabilità si riduce a quella della sola catena applicativa, e la riduzione va dichiarata |
| **Custodia della chiave radice** della gerarchia di cifratura | La chiave che protegge le copie non può risiedere nel sistema che le produce |
| **Copie di sicurezza, con prova periodica di ripristino** | Una copia mai ripristinata ha probabilità sconosciuta di funzionare |
| **Fornitore di identità o adesione alla federazione** | Il fornitore di servizi verso la federazione nazionale **è chi installa**, non il progetto (`V-05`, `OUT-22`) |
| **Canale di recapito dei messaggi**, con il proprio contratto | Il prodotto invia, non è l'operatore del canale |
| **Servizio di firma e marca temporale**, se la refertazione è abilitata | È dietro un'interfaccia sostituibile, ma non è fornito dal progetto |
| **Sorveglianza, correlazione degli eventi e gestione degli incidenti** | Il prodotto esporta gli eventi; il sistema di correlazione è del cliente |
| **Determinazione dei termini di conservazione** della documentazione sanitaria | Il prodotto li rende configurabili, **non li decide**: la determinazione è del titolare del trattamento |
| **Definizione dei livelli di servizio attesi** | Il prodotto li misura, non li fissa |
| **Cadenza di aggiornamento dei componenti esposti**, in particolare del relay | Per un componente esposto, l'aggiornamento è un obbligo e non una buona pratica |

### 5.2 Che cosa deve fornire chi installa sul piano degli adempimenti

Nessuno degli adempimenti verso le autorità è del fornitore, e nessuna clausola contrattuale li
sposta. L'elenco completo è in
[`docs/06_security/09-ripartizione-delle-responsabilita.md`](../06_security/09-ripartizione-delle-responsabilita.md) §11.
Quest'area ne richiama i tre che si scoprono più spesso troppo tardi:

1. **La valutazione d'impatto sulla protezione dei dati**, che è del titolare e precede il
   trattamento. Il progetto fornisce il materiale strutturale.
2. **La notifica degli incidenti** verso le autorità, con i propri orologi. Il progetto notifica
   **al cliente** sotto le ventiquattro ore e fornisce l'evidenza; non notifica alle autorità al
   posto suo.
3. **L'approvazione dei piani da parte degli organi di amministrazione**, che nessun fornitore può
   surrogare.

### 5.3 Che cosa fornisce il progetto

| Artefatto | Contenuto |
|---|---|
| Definizioni di dispiegamento riproducibili | Per il profilo a tenant unico e per quello su orchestratore, **stesso codice e stessa struttura** |
| Migrazioni automatiche, non bloccanti, per tenant | Con avanzamento osservabile e con il fallimento su un tenant che non blocca gli altri |
| Verifiche di configurazione bloccanti all'avvio | §3.9 |
| Distinta dei materiali firmata, per ogni artefatto | Compresi i componenti delle immagini di base |
| Attestazioni di rilascio | Provenienza, distinta, esito delle prove, tracciabilità, riproducibilità, conformità del profilo di produzione |
| Procedura eseguibile di verifica lato deployer | Con i comandi. Un artefatto firmato che nessuno verifica non aggiunge sicurezza |
| Procedura di copia e ripristino, materiale di chiave compreso | Con obiettivi dichiarati e almeno un'esecuzione documentata |
| Procedura di verifica dell'integrità del registro | Su richiesta e programmata, con esito registrato |
| Scheda dei dati per la dichiarazione dei fornitori rilevanti | Denominazione, identificativo fiscale, Paese della sede legale, codici della nomenclatura degli appalti, criterio di rilevanza |
| Politica di divulgazione coordinata e canale funzionante | Con tempi dichiarati |
| Manuale di installazione ed esercizio | Con i presupposti del §5.1 in testa |

---

## 6. I limiti dichiarati di `RU-1`

Un limite dichiarato è una funzionalità del prodotto; un limite scoperto in produzione è un
incidente. Questi sono i limiti di `RU-1`, in aggiunta a quelli permanenti del prodotto già
elencati in
[`docs/01_technical/07-prestazioni-e-capacita.md`](../01_technical/07-prestazioni-e-capacita.md) §7.

| # | Limite | Natura |
|---|---|---|
| 1 | **Non utilizzabile su pazienti reali** | Condizione dichiarata, non rimovibile per configurazione (§1.1) |
| 2 | **Un solo tipo di prestazione**: televisita programmata | Perimetro di rilascio (§4.2) |
| 3 | **Due partecipanti** alla sessione | Decisione sulla topologia dichiarata rinviata (`C-2`) |
| 4 | **Nessuna registrazione della sessione** | Perimetro di rilascio. L'indicatore e i suoi divieti esistono già |
| 5 | **Nessun conferimento alle infrastrutture documentali** | Dipendenza esterna non disponibile (`Q-07`) |
| 6 | **Latenza da obiettivo a schermo non garantibile** | Dipende da telecamera, calcolo, schermo, rete e stato del buffer. Il sistema la **misura**, la registra e ne informa |
| 7 | **Nessuna modalità fuori linea per il contenuto clinico** | Scelta dichiarata, motivata dal rischio di contenuto clinico su un dispositivo che il titolare non controlla |
| 8 | **Nessuna rotazione delle chiavi durante la sessione** | **Non esiste nella tecnologia.** Non si rivendica |
| 9 | **Sottotitoli in tempo reale assenti** | Non conformità dichiarata su un criterio di accessibilità, con l'interprete come misura alternativa e il canale dati comunque definito nel protocollo |
| 10 | **Ordinamento degli eventi garantito solo dentro la partizione** | Nessun requisito funzionale può dipendere da un ordine globale |
| 11 | **Consegna degli eventi almeno una volta** | I consumatori sono idempotenti per costruzione |
| 12 | **Numero di tenant per installazione** | `[NV]` — non misurato. Ordine di grandezza dichiarato: centinaia. La misura è un'attività di rilascio, non una stima |
| 13 | **Nessuna ridondanza del broker** nell'assetto a nodo singolo | La perdita del broker significa **ritardo nella consegna, non perdita di eventi**, perché la sorgente di verità è l'outbox |
| 14 | **Misura automatica della latenza da obiettivo a schermo su un solo motore di navigazione** | Vincolo della suite di prove, dichiarato invece di essere nascosto |

---

## 7. I criteri di rilascio bloccanti

`RU-1` **non si pubblica** se anche uno solo di questi criteri non è soddisfatto. Non esiste
deroga, non esiste approvazione che li superi, e la verifica è automatica dove può esserlo.

| # | Criterio | Come si verifica |
|---|---|---|
| 1 | **Isolamento fra tenant**: nessun percorso, per nessuna interfaccia, consente di leggere o scrivere dati di un altro tenant | Prove che tentano attivamente l'accesso illegittimo, in condizioni avverse: pool esaurito, contesto non risolto, richiesta senza tenant, tenant sostituito a metà percorso |
| 2 | **Nessuna configurazione supportata emette un token privo del claim dell'attore** (`V-132`) | Prova negativa su tutte le configurazioni supportate |
| 3 | **La catena del registro immutabile è verificabile**, e l'alterazione indotta viene rilevata | Esecuzione della verifica su un caso alterato deliberatamente |
| 4 | **Nessun contenuto clinico** in registri, metriche, tracce, buste degli eventi, messaggi di errore | Prove che tentano di far passare dati sensibili e falliscono se ci riescono |
| 5 | **I tredici controlli obbligatori della pipeline hanno superato la prova di fallimento** | Ciascuno provato con un caso deliberatamente non conforme |
| 6 | **Costruzione riproducibile verificata**: ricostruzione su esecutore diverso, impronte identiche | Lavoro pianificato con esito conservato |
| 7 | **Distinta dei materiali completa**: nessun componente presente nella distinta e assente dalle annotazioni | Controllo `G5` |
| 8 | **Nessuna migrazione insieme distruttiva e funzionale**: due versioni consecutive convivono sulla stessa base dati (`V-111`) | Prova di convivenza e prova di ritorno alla versione precedente |
| 9 | **Accessibilità**: nessuna violazione delle regole automatizzabili su alcuna schermata e alcuno stato significativo; almeno una verifica manuale con tecnologia assistiva reale eseguita e registrata | Controllo `G4` più lista di controllo manuale versionata |
| 10 | **L'indicatore di registrazione non è occultabile**: la prova che tenta di nasconderlo con ogni mezzo previsto dalla configurazione fallisce in tutti | Prova negativa |
| 11 | **Una configurazione di tema che degrada il contrasto è rifiutata al salvataggio**, non accettata con avviso | Prova negativa |
| 12 | **Le prove negative delle esclusioni di perimetro passano**: nessuna interfaccia accetta il calcolo di una priorità, la deduzione di una soglia, la generazione di contenuto interpretativo | Prove negative per ciascuna esclusione con verifica dichiarata |
| 13 | **Il sistema è pienamente operativo con le terminologie a licenza vincolata disattivate** | È la configurazione predefinita della suite di prove (`V-03`) |
| 14 | **Il nodo di relay non instrada verso l'anello di richiamo locale, verso indirizzi privati e verso i servizi di metadati** | Prova che fa fallire la costruzione se una qualunque richiesta riesce |
| 15 | **Il rapporto di tracciabilità è prodotto** e la vista «requisiti senza prove» è vuota o è una lista di lacune dichiarate con motivazione | Artefatto di rilascio |
| 16 | **Ogni artefatto reca la dichiarazione di non marcatura** | Controllo di pubblicazione |
| 17 | **Nessun `[NV]` aperto su un componente rilasciato** | Rapporto degli `[NV]` con destinatario |
| 18 | **Riesame documentale del rilascio eseguito e registrato**: note di rilascio, modifiche con impatto clinico o di sicurezza in testa e con evidenza, azioni richieste al deployer, limiti noti | Registrazione dell'approvazione con responsabile e data |

Il criterio 18 è quello che si salta quando si va di fretta, ed è quello che rende il rilascio
tracciabile. In regime di controllo dei documenti, **ciò che nasce fuori controllo va riemesso**,
il che costa più che farlo bene la prima volta.

---

## 8. Come si verifica di aver ricevuto ciò che è dichiarato

La domanda è di chi installa e la risposta è una procedura, non una dichiarazione.

1. **Verificare la firma e la provenienza** dell'artefatto, con i comandi del manuale. Un artefatto
   firmato che nessuno verifica aggiunge una dichiarazione, non sicurezza.
2. **Confrontare la distinta dei materiali** con il proprio inventario, e conservarla: è la parte
   che il cliente non può ricostruire e che serve ai suoi adempimenti.
3. **Ricostruire l'artefatto dal sorgente pubblicato** e confrontare le impronte. È la sola
   verifica che accerti che la distribuzione corrisponde al sorgente.
4. **Eseguire le verifiche di configurazione all'avvio** in un ambiente pulito e osservare che il
   sistema **si rifiuti di avviarsi** nelle configurazioni insicure. Un sistema che si avvia
   comunque non ha i controlli che dichiara.
5. **Eseguire la procedura di ripristino** su un ambiente separato, e verificare che la catena del
   registro immutabile risulti verificabile dopo il ripristino. Un ripristino che produce una
   catena non verificabile è un ripristino **fallito**, non riuscito con avviso.
6. **Leggere il rapporto di tracciabilità**, in particolare la vista dei requisiti senza prove: è
   l'elenco che conta.

---

## 9. Impegno del progetto e impegno di chi installa, riga per riga

| Ambito | Il progetto si impegna a | Chi installa si impegna a |
|---|---|---|
| **Cifratura in transito** | Fornirla su tutti i canali, impedire il declassamento, **misurare e registrare** ciò che viene negoziato invece di dichiararlo | Verificare che la configurazione distribuita non l'abbia alterata, e conservarne l'evidenza |
| **Cifratura a riposo** | Fornire il meccanismo con chiavi per tenant separabili dal dato e la cancellazione crittografica | **Custodire la chiave radice**, fuori dal sistema che produce le copie |
| **Registro non alterabile** | Fornirlo con catena di impronte, esportazione firmata in formato aperto, verifica di integrità | Garantire la **separazione dei privilegi** fra archivio applicativo e archivio del registro |
| **Aggiornamenti di sicurezza** | Rilasciarli su canale autenticato, con avviso pubblicato, entro il livello di servizio dichiarato in **giorni per gravità** (`V-185`) | **Applicarli**, secondo la propria politica |
| **Isolamento di rete** | Documentare la configurazione di riferimento e verificarla all'avvio dove possibile | **Applicare le regole di rete**: negazione di rotta in uscita ai componenti applicativi, isolamento del relay |
| **Copie di sicurezza** | Fornire procedura, obiettivi dichiarati e capacità di cifratura | **Eseguirle**, tenerne una non raggiungibile in permanenza dal sistema, **provare il ripristino** |
| **Incidenti** | Notificare al cliente **sotto le ventiquattro ore**, immediatamente per gravità elevata; fornire il rapporto entro il giorno successivo con la sequenza temporale; consegnare i registri in formato aperto | **Notificare alle autorità**, entro i propri termini, secondo i propri orologi |
| **Identità digitale nazionale** | Essere **conforme e verificabile** in integrazione continua | Essere il **fornitore di servizi**: convenzione, elenco dei servizi attivi, livello di garanzia scelto e motivato |
| **Conservazione** | Rendere i termini configurabili, tracciare l'esecuzione, rendere verificabile l'esito | **Determinare i termini**, che sono del titolare del trattamento |
| **Livelli di servizio** | **Misurarli** e storicizzarli per tenant e per servizio, con allarme al superamento | **Definirli**, perché la soglia determina che cosa è un incidente significativo |
| **Marcatura** | **Nulla.** Il progetto non appone marcatura e non sottoscrive dichiarazioni di conformità | Assumere il ruolo di fabbricante se immette sul mercato, con tutti gli obblighi che ne derivano |

> **La riga che va letta due volte è l'ultima.** Nessuna clausola della licenza, nessun accordo e
> nessuna dichiarazione del progetto trasferisce a chi integra una protezione che non esiste, né
> gli toglie un obbligo che la norma gli attribuisce.

---

**Prosegue in**: [04 — Oltre il primo rilascio](./04-oltre-il-primo-rilascio.md), dove le voci
delle categorie II, III e IV del §4 trovano il loro ordine di priorità.
