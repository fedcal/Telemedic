# log-TECH - Area tecnica

- **Agente**: `TECH`
- **Data**: 25 agosto 2026
- **Output**: `docs/01_technical/` - dieci file
- **Mandato**: come il sistema è realizzato, non cosa fa. Minimo 25.000 parole.
- **Letture obbligatorie eseguite**: `00_PROJECT_BRIEF.md` (D1–D52, regola R0),
  `04_BASELINE_ARCHITETTURALE.md`, `05_BACHECA_INTERAGENTI.md` (rilettura a fine lavoro per la
  verifica di non contraddizione), `R4-webrtc-media.md`, `B3-verifica-coturn-webrtc.md`,
  `R5-pattern-integrazione.md`, `docs/10_fondamenti/08-webrtc-da-zero.md` (indice e sezioni di
  raccordo, per evitare la ripetizione dei fondamenti).

---

## 1. File prodotti e conteggi

| File | Parole | `[NV]` | Contenuto |
|---|---:|---:|---|
| `00-indice.md` | 1.225 | 1 | Indice, percorsi di lettura per profilo, confini con le altre aree, riepilogo dei vincoli posti e delle questioni non decise |
| `01-stack-e-motivazioni.md` | 6.727 | 4 | Sette criteri di scelta dichiarati prima delle scelte; ogni tecnologia con alternative scartate e motivo; versioni minime con la ragione tecnica; registro dei componenti di terze parti; ciò che il progetto **non** adotta e perché |
| `02-backend.md` | 4.072 | 0 | Moduli per contesto delimitato con cinque regole di dipendenza verificate in CI; anatomia di un contesto; confine di autorizzazione; cinque regole transazionali; thread virtuali con le trappole reali; validazione ai quattro confini; errori; configurazione tipizzata; profili ortogonali |
| `03-persistenza.md` | 4.276 | 3 | Schema per coppia tenant × contesto; ruoli e privilegi; sicurezza a livello di riga con le due trappole che la vanificano; migrazioni espandi-e-contrai su N tenant; modello del tempo a due assi; serie temporali con le due famiglie distinte; indici e loro costo; outbox; registro immutabile; salvataggio e ripristino; limiti dichiarati |
| `04-frontend.md` | 3.775 | 1 | Struttura per funzionalità; componente incorporabile come elemento personalizzato; tre categorie di stato; macchina a stati della sessione; resilienza di rete; **otto criteri mobile first e dieci di accessibilità, ciascuno con il modo di provarne la violazione**; internazionalizzazione e separazione dalle etichette di codifica |
| `05-media-e-tempo-reale.md` | 5.444 | 3 | Che cosa il progetto realizza davvero e che cosa appartiene al protocollo e al navigatore; segnalazione con il requisito d'ordine; negoziazione; relay con i tre fatti verificati di configurazione; sicurezza del flusso verificata a runtime; qualità e indice proprietario; leve realmente disponibili con lo stato normativo di ciascuna; registrazione a due modalità con contenitore negoziato; prove in rete degradata; limiti dichiarati |
| `06-osservabilita.md` | 3.112 | 0 | **Otto categorie che non entrano mai in un segnale**; pseudonimizzazione per tenant; redazione a due livelli; diagnostica dettagliata come procedura e non come livello; registri strutturati; quattro livelli di severità con criteri operativi; metriche e cardinalità; tracce e campionamento in coda; correlazione; registro applicativo contro registro immutabile; allertamento; indagine post-incidente |
| `07-prestazioni-e-capacita.md` | 3.090 | 3 | Distinzione fra obiettivo di servizio, limite dichiarato e misura; le quattro letture della latenza e la formulazione adottata; bilancio per stadio; percentili; unità di dimensionamento; contropressione a quattro livelli con ordine di degrado; **dodici limiti dichiarati**; campagne di prova |
| `08-qualita-e-test.md` | 3.002 | 0 | Piramide con proporzioni e tempi; sei regole di scrittura; prove a contratto nelle due direzioni; dati sintetici e vincolo terminologico; prove media; accessibilità a tre livelli; prove di sicurezza con l'isolamento fra tenant al primo posto; copertura differenziata e per mutazione; tracciabilità generata |
| `09-integrazione-continua-e-rilascio.md` | 3.056 | 1 | I due cicli di vita; pipeline a quattro fasce; **tredici controlli obbligatori**; controllo sulle terminologie in dettaglio; versionamento; costruzione riproducibile; artefatti firmati e attestazioni; distinta dei materiali; ambienti; rilascio; periodo di supporto |
| **Totale** | **37.779** | **16** | Minimo richiesto: 25.000. Superato del 51% |

Tutti i file hanno frontmatter YAML con `title`, `sidebar_position`, `description`. Tutti i
blocchi di codice dichiarano il linguaggio e sono marcati come illustrativi. Diagrammi Mermaid in
`03`, `04`, `05`, `06`, `07`, `09`.

---

## 2. Questioni risolte

| # | Da | Esito |
|---|---|---|
| **Q-16** | `GUIDA` → `SEC`, `TECH` | **Risolta per la parte di realizzazione.** Componente unico in `platform` attraversato da ogni chiamata uscente, con rivalutazione **dopo ogni redirezione** e divieto verificato di costruire client HTTP autonomi. Aggiunta la lezione dal nodo di relay: sei vulnerabilità distinte in otto anni sullo stesso schema di aggiramento ⇒ **il filtro applicativo è difesa in profondità, l'isolamento di rete in uscita è la difesa primaria**. Restano a `SEC` gli intervalli vietati e la loro manutenzione |
| **Q-17** | `GUIDA` → `TECH`, `COMP` | **Risolta.** Accolta come base, con la precisazione di metodo che ne cambia l'uso: la tabella dei protocolli inventaria **specifiche**, il registro richiesto da IEC 62304 §8.1.2 inventaria **realizzazioni in versione esatta**. Il registro si popola per **generazione** dalla distinta dei materiali, arricchita da annotazioni versionate; la tabella dei protocolli entra come sorgente della funzione nel sistema e della mappatura specifica → realizzazione. Controllo G5 della pipeline: componente nella distinta e assente dalle annotazioni ⇒ costruzione fallita |
| **Q-06** | `GUIDA` → `ARCH`, `TECH` | **Lasciata `APERTA` con nota di realizzazione.** La scelta dell'identificatore canonico è di `ARCH` e `DOM` e **non è stata anticipata**. Fissata la sola forma tecnica che rende la scelta reversibile: identificatori esterni mai chiave primaria, registro degli identificatori di sistema versionato e **per tenant**, traduzione al confine una sola volta, tutte le forme accettate in ingresso e una sola emessa in uscita per configurazione. Con questa struttura la decisione di `ARCH` diventa un valore di configurazione, non una migrazione |
| **Q-04** | `GUIDA` → `SEC`, `ARCH` | Già risolta da `SEC` prima dell'intervento di quest'area. **Recepita integralmente**: `03-persistenza.md` §5, `02-backend.md` §6.3 (modalità degradata per sistema di codifica, nessuna cache su disco, nessun identificativo dell'assistito verso il gateway), `08-qualita-e-test.md` §4.3 (la suite gira nella configurazione senza sistemi a licenza vincolata, il che rende la modalità degradata realmente funzionante) |

---

## 3. Vincoli posti - `TECH` 110–119

| # | A | Sintesi |
|---|---|---|
| **V-110** | tutte | Due sole rappresentazioni dell'errore su interfaccia pubblica; nessun contenuto clinico né identificativo diretto nel campo descrittivo; catalogo dei tipi di problema **generato**, un errore non catalogato non può essere emesso |
| **V-111** | `ARCH`, `FUNZ`, `ROAD`, `COMP` | **Espandi e contrai su ogni migrazione**: due versioni consecutive devono poter convivere sulla stessa base dati. Condizione dell'aggiornamento senza interruzione e del ritorno a una versione precedente |
| **V-112** | `SEC`, `ARCH`, `FUNZ` | Contesto di tenant impostato **dentro la transazione** con `SET LOCAL`; negazione predefinita in sua assenza; applicazione forzata della politica anche per il proprietario; il ruolo applicativo non è proprietario degli oggetti |
| **V-113** | tutte | Nessun contatore cumulativo grezzo può essere citato come indicatore di qualità: si differenzia fra campioni consecutivi |
| **V-114** | `PROD`, `FUNZ`, `COMP` | L'indice di qualità della sessione è **proprietario** e va dichiarato tale; usa il minimo e non la media; **non è un punteggio di opinione media** secondo alcuna raccomandazione internazionale |
| **V-115** | `FUNZ`, `PROD`, `INTEG` | Applicazione di V-11 anche alla **registrazione lato server**: contenitore scelto a runtime sui codec effettivamente negoziati e registrato nei metadati; **nessun formato unico dichiarabile** in alcun materiale |

---

## 4. Questioni aperte - `TECH` 110–119

| # | A | Sintesi |
|---|---|---|
| **Q-110** | `ARCH` | Topologia del segnale su più istanze: affinità di sessione, diffusore fra istanze (da escludere nella forma senza persistenza) o instradamento deterministico al nodo proprietario. Decisione strutturale con ADR. Vincolo che qualunque scelta deve soddisfare: consegna esattamente una volta e nell'ordine, per sessione, più drenaggio graduale |
| **Q-111** | `ARCH` | Limite dichiarato di partecipanti alla sessione media. Un limite esplicito è preferibile a un degrado silenzioso |
| **Q-112** | `COMP` | Regime di licenza dell'estensione per serie temporali, **`[NV]` da verificare sul testo primario**, e sua collocazione nei regimi di D31. Ripiego già progettato e provato in CI |
| **Q-113** | `COMP`, `ROAD` | Livello di servizio di aggiornamento dei componenti di terze parti in **giorni per gravità**: quattordici rilasci del nodo di relay in poco più di sette mesi rendono privo di significato un impegno espresso in mesi. Si collega a Q-155 di `SEC` |
| **Q-114** | `COMP` | Tre compromessi tecnici con conseguenza clinica per il file di gestione del rischio: soglie di qualità e avviso al professionista; obiettivo del buffer di jitter (latenza contro perdita udibile); preferenza di degrado (formulazione difendibile ai sensi di V2) |
| **Q-115** | `PROD`, `FUNZ` | Dispositivo e viewport di riferimento per i criteri mobile first: senza, i criteri M1–M8 e le soglie di peso e tempo non sono verificabili. `[NV]` nessuna soglia numerica dichiarata perché nessuna misurata |
| **Q-116** | `COMP` | Conservazione dei segnali di osservabilità **almeno pari alla finestra entro cui una segnalazione può arrivare**, altrimenti l'obbligo di vigilanza non è soddisfacibile. Distinto dai termini di V-152 di `SEC` |

---

## 5. Elementi `[NV]` - sedici occorrenze

| Dove | Che cosa non è verificato | A chi va chiesto |
|---|---|---|
| `01` §4.3 | Data di fine supporto pubblico gratuito della piattaforma: dipende dal distributore scelto dal deployer | Fonte del distributore, non assumibile |
| `01` §4.5 | Guadagni di memoria e tempo di avvio della compilazione a immagine nativa: **non misurati dal progetto** | Misura propria |
| `01` §5.2 | Date esatte di fine supporto delle versioni minori del quadro di lavoro: cambierebbero prima della pubblicazione | Fonte a monte, al rilascio; campo «data di riesame» del registro |
| `01` §7.2 | Regime di licenza dell'estensione per serie temporali | `COMP` - **Q-112** |
| `03` §2.4 | Soglia di tenant per installazione nel modello a schema: **non misurata, non inventata** | Prova di capacità propria |
| `03` §5.3 | Intervallo di partizionamento delle serie temporali | Prova di capacità propria |
| `03` §9.1 | Obiettivi di punto e tempo di ripristino: sono del titolare del trattamento, non del prodotto | Deployer |
| `04` §5 | Valori numerici delle soglie di prestazione dell'interfaccia | `PROD` - **Q-115** |
| `05` §4.5 | Quota di sessioni instradate dal relay: **da misurare sul traffico proprio, mai citata da stime altrui** | Misura propria |
| `05` §6.3 | Standardizzazione dei fattori di compromissione per la codifica audio moderna nei modelli classici | Fonte normativa; motiva V-114 |
| `05` §5.1 | Versione del protocollo di handshake effettivamente negoziata: **non si dichiara, si misura** | Statistiche della connessione, per sessione |
| `07` §2.1 | Valori numerici di ciascuno stadio del bilancio di latenza: **deliberatamente non riportati** per non mettere in circolazione cifre altrui | Prova automatica propria |
| `07` §5.2 | Bitrate medio, quota instradata e picco di sessioni concorrenti | Misura propria |
| `09` §5.2 | Stato normativo di una delle due intestazioni di dismissione | `PROTO` - vedi correzione C-01 in bacheca |
| `00` | Riepilogo degli elementi non verificati | - |
| `03` §9.4 | Determinazione delle basi giuridiche e dei perimetri di cancellazione | Titolare del trattamento e `COMP` |

**Regola applicata senza eccezioni**: dove una cifra non era verificata, **non è stata scritta**.
Il bilancio di latenza del §2.1 di `07` è l'esempio più evidente: la tabella degli stadi c'è, i
numeri no, e il motivo è dichiarato nel testo.

---

## 6. Verifica di non contraddizione dei vincoli altrui

Rilettura della bacheca a fine lavoro. Nessun vincolo contraddetto. Recepimenti espliciti:

| Vincolo | Dove è recepito |
|---|---|
| V-01 `Encounter` / `MediaSession` distinti | `03-persistenza.md` §1, contesti separati in `02-backend.md` §1 |
| V-02 nessuna soglia clinica cablata | `02-backend.md` §10, `03-persistenza.md` §5.4 |
| V-03 pienamente funzionale senza terminologia a licenza vincolata | `02-backend.md` §6.3, `08-qualita-e-test.md` §4.3, `09` §4 |
| V-04 registro immutabile a catena di impronte | `03-persistenza.md` §8, con la distinzione esplicita dal versionamento delle entità |
| V-06 nessuna marcatura | `09` §1, come **controllo di pipeline**, non come nota |
| V-09 l'assenza di dato è informazione | `03-persistenza.md` §5.2 (stato «attesa non pervenuta» come riga), `06-osservabilita.md` §3.1, `02-backend.md` §7.2 punto 5 |
| V-10 relay 4.17.2 e isolamento di rete primario | `01` §9.1, `05` §§4.3–4.4 |
| V-11 contenitore negoziato a runtime | `05` §8.2, **esteso alla registrazione lato server** con V-115 |
| V-12 nessuna soglia è conformità | `07` §0 come avvertenza di apertura di capitolo, `05` §6.4 |
| V-20 perimetro del contratto pubblico | `08-qualita-e-test.md` §3.1, `09` §5 |
| V-21 nessun contenuto clinico nei messaggi in uscita | `03-persistenza.md` §7 a livello di schema, `08` §3.3 come prova |
| V-22 firma asimmetrica dei messaggi in uscita | `08` §3.3 |
| V-23 limiti alla personalizzazione del componente incorporabile | `04-frontend.md` §2.3 e §7.4, `08` §6.3 come prova che verifica un divieto |
| V-24 capacità e contratto nascono insieme | `04-frontend.md` §10, `00-indice.md` |
| V-25 livello di garanzia richiesto e qualificato | `02-backend.md` §3 punto 3 |
| V-150 nessun contenuto clinico nei registri | `06-osservabilita.md` §1.1, esteso al **canale degli errori**, che è il punto in cui la fuga avviene più spesso |
| V-151 nessun identificativo verso il gateway delle terminologie, nessuna cache su disco | `02-backend.md` §6.3 |
| V-152 conservazione 24 / 12 mesi | `03-persistenza.md` §5.4 e `06-osservabilita.md` §2.3, **recepiti senza reinterpretazione** |
| V-153 accesso d'emergenza come requisito | `06-osservabilita.md` §8.2, come meccanismo dell'indagine sul contenuto |
| V-155 nessuna metrica del relay etichettata con l'identificativo di sessione | `06-osservabilita.md` §3.2, regola generale di cardinalità |
| C-02 la chiave di idempotenza non è uno standard | `04-frontend.md` §4.2, dichiarato esplicitamente |
| C-04 la rappresentazione del problema è RFC 9457 | `02-backend.md` §7.1 |
| R0 riservatezza | Nessuna azienda, marchio, prodotto commerciale o dominio nominato in alcun file. Verificato anche sui frammenti di codice, sui nomi di configurazione e sui dati di esempio |

**Tensione dichiarata e non risolta d'ufficio.** D23 stabilisce la registrazione lato server;
`R4-webrtc-media.md` §10.4 raccomandava quella lato client. **Prevale D23**, che è decisione del
committente, e `05` §8 ne dichiara la conseguenza senza attenuazioni - la sessione registrata non
è cifrata fino agli estremi. La questione **Q-08** verso `ARCH` resta aperta e **non è stata
anticipata**: quest'area descrive le conseguenze tecniche della decisione presa, non il modello
dati che ne discende.

---

## 7. Tre punti che meritano attenzione a valle

1. **Il moltiplicatore dei tenant è il limite meno studiato dell'architettura.** Lo schema per
   coppia tenant × contesto dà l'isolamento migliore e il ripristino per singolo tenant, ma fa
   crescere il catalogo della base dati con il prodotto tenant × contesti × tabelle, e con esso la
   durata delle migrazioni e le serie di metriche. È `[NV]` e va misurato **prima** di promettere
   una scala a un cliente. La struttura scelta - registro dei tenant come unico punto di
   risoluzione - consente la ripartizione su più basi dati **senza toccare il dominio**, ed è
   l'unica mitigazione progettata.
2. **La cadenza di rilascio del nodo di relay cambia la natura dell'impegno di supporto.**
   Quattordici versioni in poco più di sette mesi, con una vulnerabilità critica corretta a metà
   percorso, rendono il livello di servizio in giorni un requisito e non una raffinatezza. È
   **Q-113** e si collega a **Q-155** di `SEC` sul periodo di supporto dichiarato.
3. **Le prove di isolamento fra tenant sono la parte della suite che va scritta per prima.** Una
   fuga fra tenant in ambito sanitario non è un difetto: è una violazione notificabile. Le prove
   non verificano che l'accesso legittimo funzioni - **tentano attivamente quello illegittimo**,
   per ogni contesto, per ogni interfaccia, e in condizioni avverse: pool esaurito, contesto non
   risolto, richiesta senza tenant, tenant sostituito a metà percorso.
