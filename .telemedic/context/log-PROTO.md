# log-PROTO - Area protocolli

> **Agente**: `PROTO` (documentazione dell'area protocolli)
> **Data**: 25 agosto 2026
> **Mandato**: `docs/04_protocols/` - come Telemedic parla ciascun protocollo.
> **Regola R0 applicata**: nessun nome di azienda, marchio, prodotto commerciale o dominio di
> potenziale partner. Dove uno standard contiene identificativi di codice coincidenti con marchi
> commerciali di piattaforme di videoconferenza, il fatto è riportato e gli identificativi non
> sono trascritti. Verifica automatica eseguita sull'intera area.

## 1. File prodotti e conteggi

| File | Parole | Contenuto |
|---|---|---|
| `docs/04_protocols/00-indice.md` | 865 | Indice, percorsi di lettura, convenzioni, le tre affermazioni che reggono l'area |
| `docs/04_protocols/01-principi-di-interoperabilita.md` | 4.417 | Sette criteri di scelta, tabella normativa delle versioni fissate, perimetro dichiarato, divergenze note, le dieci proposte `P-01`…`P-10`, politica di evoluzione e deprecazione, garanzie e non garanzie |
| `docs/04_protocols/02-fhir.md` | 6.472 | Dichiarazione di conformità 4.0.1, guide fissate, profili e risorse esposte, servizio virtuale in R4, ricerche, operazioni, documento di capacità, validazione a tre livelli, errori, concorrenza, transazioni, problemi noti delle guide italiane, coesistenza fra versioni |
| `docs/04_protocols/03-documenti-clinici.md` | 4.635 | Dataset canonico e serializzazioni sostituibili, dieci tipologie documentali, set informativo del referto per gruppi, metadati, firma, versionamento e rettifica, teleconsulto, tesserino dei dispositivi, piano di rilevazione, conservazione |
| `docs/04_protocols/04-hl7-v2.md` | 3.453 | Modulo separato, versioni, quindici messaggi, struttura verificata della schedulazione, trasporto protetto, riconoscimenti, segmento di errore, traduzione a salto singolo, tabella di copertura |
| `docs/04_protocols/05-ihe.md` | 2.985 | Otto profili con revisione fissata, attori implementati, tracciamento e autenticazione di nodo, tempo coerente, correlazione, interrogazione demografica, pubblicazione documentale, i due profili esclusi, dichiarazione di integrazione |
| `docs/04_protocols/06-api-di-progetto.md` | 4.724 | Criterio di partizione fra i due piani, sedici risorse, ventidue codici di stato, idempotenza, concorrenza, errori, versionamento e deprecazione, limitazione del traffico, paginazione, condivisione fra origini, descrittore e quattro cancelli |
| `docs/04_protocols/07-eventi-e-webhook.md` | 3.784 | Tre canali su una sorgente, busta e divieto verificato, diciannove tipi di evento, firma simmetrica e asimmetrica, ritentativi, coda di scarto, ordine e deduplicazione, canale clinico a topic, contratto |
| `docs/04_protocols/08-identita-e-autorizzazione.md` | 4.976 | Postura di base, nove profili, ambiti, delega fra organizzazioni, livello di garanzia e sua qualificazione, avvio applicativo, ciclo di vita del componente incorporato, token, scoperta, corrispondenza IHE, registrazione dei client |
| `docs/04_protocols/09-tempo-reale.md` | 2.899 | Protocollo di segnalazione, quindici tipi di messaggio, macchina a stati, verifica della sessione, due modalità, credenziali temporanee del relay, degradazione, canale dati |
| `docs/04_protocols/10-conformita-e-prove.md` | 3.203 | Tre significati di conformità, formule vietate, dieci artefatti pubblicati, quattordici suite, diciassette prove negative, cancelli, dati sintetici, criteri di accettazione per chi integra, ricontrollo, punti aperti |
| **Totale** | **42.413** | Requisito minimo: 25.000 |

**Altri elementi**: 11 diagrammi Mermaid · 14 marcatori `[NV]`, ciascuno con destinatario
dichiarato · 0 dati reali (verifica automatica su formato di codice fiscale: nessuna occorrenza).

## 2. Correzioni della bacheca recepite

Tutte le dieci correzioni verificate `C-01`…`C-10` sono state applicate. Dove la correzione
riguarda un'affermazione ricorrente, è stata trasformata in **vincolo** o in **prova negativa**
invece che in una nota isolata.

| # | Dove è recepita |
|---|---|
| C-01 `Deprecation` è RFC 9745 | `01` tabella delle versioni · `06` §7.2 con la forma del valore e la relazione con la data di dismissione |
| C-02 `Idempotency-Key` è bozza scaduta | `01` tabella e §2 · `06` §4.1 · `10` §2 fra le formule vietate · **V-133** |
| C-03 Forma a tre intestazioni superata e mai standard | `01` §2 · `06` §8.1 con la forma corrente a due campi · **V-133** |
| C-04 `Problem Details` è RFC 9457 | `06` §6.1 con la tabella dei cinque membri e le sezioni |
| C-05 TCP è RFC 9293, HTTP/1.1 è RFC 9112 | `01` §4.6 come regola redazionale dell'area |
| C-06 RFC 9421 non definisce il digest del corpo | `01` §4.6 · `07` §4.2 con la distinzione esplicita fra i due documenti |
| C-07 In R4 non esiste la risorsa di stato né l'estensione dell'argomento | `01` §4.5 · `07` §8.1 con la forma verificata: canonico nel criterio, stato come risorsa di parametri, nomi in *kebab-case* |
| C-08 Bulk Data è 3.0.0 | `01` §2 e §4.3 · `02` §6.2 con l'avvertenza esplicita sulla costruzione continua |
| C-09 Eventi dal server e OpenAPI non sono RFC | `01` §4.6 · `06` §11.1 |
| C-10 Divieto dell'intestazione dedicata al tipo di contenuto | `07` §2.2 verbatim · `10` §5 come **prova negativa** · **V-134** |

## 3. Vincoli posti (bacheca)

| # | A | Vincolo |
|---|---|---|
| **V-130** | tutte | Catalogo unico dei codici di errore, generato e condiviso fra i due piani. Un codice non catalogato non può essere emesso |
| **V-131** | `ARCH`, `TECH` | RFC 8838 §9: consegna dei candidati esattamente una volta e nello stesso ordine. Vincola la distribuzione dello stato di sessione fra nodi |
| **V-132** | tutte | Sempre delega, mai impersonificazione, quando l'identità viene da un emittente esterno. Criterio di rilascio bloccante insieme all'isolamento fra tenant |
| **V-133** | tutte | Elenco delle formule di conformità vietate, con le formule ammesse in alternativa |
| **V-134** | `ARCH`, `TECH`, `INTEG` | Divieto dell'intestazione dedicata al tipo di contenuto nella busta binaria degli eventi |
| **V-135** | `INTEG`, `FUNZ`, `SEC` | Il carico degli eventi trasporta riferimenti, mai contenuto clinico. Vale anche sul canale clinico |
| **V-136** | `ARCH`, `TECH`, `COMP` | Nessun template documentale è cablato: applicazione letterale di V-07 finché i template non sono disponibili |
| **V-137** | `ARCH`, `SEC` | Chiave di sessione e indirizzo della stanza sono credenziali, non metadati: mai persistiti in risorse interrogabili né in campi di messaggi verso terzi |

## 4. Questioni aperte

| # | A | Oggetto |
|---|---|---|
| **Q-130** | `ARCH` | Come si distribuisce lo stato di sessione fra nodi rispettando V-131: affinità di connessione o coda ordinata per chiave |
| **Q-131** | `DOM`, `COMP` | Dove si colloca l'attestazione della qualità del collegamento in un tracciato che non le riserva un campo. Proposta motivata + vincolo di quest'area sulla conferma del professionista |
| **Q-132** | `COMP`, `DOM` | Verifica di copertura campo per campo fra set informativo normativo e profilo clinico: non eseguita |
| **Q-133** | `TECH` | Strumenti concreti di validazione e di pubblicazione: nomi e versioni non verificati, con i cinque requisiti che devono soddisfare |
| **Q-134** | `COMP`, `SEC` | Formati di busta di firma, requisiti del certificato e della marca temporale, firma di conferimento |
| **Q-135** | `ARCH` | Formato dei token verso l'esterno: opachi con traduzione al gateway, oppure autoportanti con finestra di revoca |

## 5. Concorso su questioni altrui

**Q-06 - divergenza dell'URI del codice fiscale (`ARCH`, `TECH`).** Rimasta **APERTA**. Quest'area
ha aggiunto in bacheca il concorso richiesto **senza decidere e senza cablare**: gli esempi
normativi dell'intera area **non contengono l'identificatore del codice fiscale**, verificato
automaticamente. Sono documentate le quattro conseguenze accertate della divergenza e una
raccomandazione motivata in cinque punti, coerente con la forma tecnica già fissata da `TECH`
(registro degli identificatori di sistema, traduzione al confine, tutte le forme accettate in
ingresso e una sola emessa in uscita). Segnalato inoltre che il **punto collegato ma distinto** del
codice di tipo dell'identificatore nel segmento del canale legacy resta contrattuale con
l'integratore e **non è risolto** da Q-06: `NNITA` è la raccomandazione motivata, `NN` da solo non
è un codice della tabella.

**Q-15 - le dieci scelte che meritano un ADR (`ARCH`, `PROTO`).** La parte di quest'area è
**evasa**: le dieci scelte sono formulate come `P-01`…`P-10` in `01` §5, ciascuna con motivazione,
costo dichiarato e rinvio al capitolo che la dettaglia; nessuna è presentata come conformità a uno
standard. La questione **resta aperta verso `ARCH`** per la decisione formale.

**Q-16 (`SEC`, `TECH`) e Q-161 (`ARCH`, `SEC`)** - quest'area le **sostiene** e ne dichiara la
motivazione in `07` §7 e `06` §10: quattro implementazioni della stessa protezione producono
quattro comportamenti diversi, di cui conta il più debole; registri separati di origini e
destinazioni fidate divergono sempre.

**Q-163 (`FUNZ`, `PROD`)** - **recepita come vincolo di catalogo** in `07` §3: la variante
dell'evento di completamento destinata alla liquidazione porta solo identificativo della
prestazione, esito amministrativo e importo.

**Q-07 (`COMP`)** - è la questione che **blocca** la serializzazione strutturata per il fascicolo e
i metadati di indicizzazione. Quest'area ne dichiara l'effetto senza aggirarlo (`03` §4.2 e §5).

**Q-160 (`ARCH`, `TECH`)** - richiamata in `08` §6.4 come verifica da mettere sul percorso critico
prima di dichiarare pubblicamente come si propaga il livello di garanzia.

## 6. Vincoli altrui rispettati

Nessun vincolo in vigore è stato contraddetto. Applicazioni puntuali:

- **V-01** - `Encounter` e sessione media restano aggregati distinti: piani diversi, macchine a
  stati diverse, dichiarato in `02` §3.4, `06` §2 e `09` §4.
- **V-02** - soglie come dato del piano di rilevazione, mai costanti: `03` §8.4.
- **V-03** - il costo del funzionamento senza la terminologia a licenza è **quantificato** invece
  che taciuto: `02` §8.1.
- **V-04** - dichiarato tre volte che le serializzazioni del tracciamento **non sono** il registro
  immutabile: `02` §3.1, `05` §4.5.
- **V-05** - nessuna affermazione di accreditamento: `08` §1 e `10` §2.
- **V-06** - nessuna affermazione di marcatura; il materiale di conformità è prodotto con
  tracciabilità obbligo-prova per chi certifica: `10` §7.
- **V-07** - è il principio che apre il capitolo `03` e genera **V-136**.
- **V-08** - ripreso in `03` §10 e come vincolo di catalogo in `07` §3.
- **V-09** - l'assenza di rilevazione attesa **è un evento** del catalogo pubblico, e un campo
  obbligatorio mancante produce rifiuto motivato invece di un valore predefinito: `07` §3, `04` §8.4.
- **V-10**, **V-11**, **V-12** - richiamati in `09` §7.5, `09` §6 e `02` §10.3, `09` §8.

## 7. Punti `[NV]`, con destinatario

| # | Punto | Capitolo | Destinatario |
|---|---|---|---|
| 1 | Forma esatta della sotto-estensione dell'indirizzo nel servizio virtuale | `02` §4 | Chi implementa l'adattatore clinico, con validazione contro il pacchetto fissato |
| 2 | Strumenti concreti di validazione e di pubblicazione | `02` §8.1, `10` §6 | `TECH` - **Q-133** |
| 3 | Template, codici documentali e metadati delle dieci tipologie | `03` §4.2 | `COMP` - **Q-07** |
| 4 | Insiemi di valori dei metadati di indicizzazione | `03` §5 | `COMP` - **Q-07** |
| 5 | Profilo del formato per la conservazione a lungo termine | `03` §4.3 | `COMP` |
| 6 | Copertura campo per campo fra set informativo e profilo | `03` §4.1 | `DOM`, `COMP` - **Q-132** |
| 7 | Formati di busta di firma, certificato, marca temporale | `03` §6.2 | `COMP`, `SEC` - **Q-134** |
| 8 | Lettura diretta della specifica del protocollo di incapsulamento legacy | `04` §5.1 | Chi implementa il modulo |
| 9 | Lunghezze, obbligatorietà e ripetibilità del segmento di errore legacy | `04` §7 | Chi implementa il modulo. **Tre estrazioni indipendenti hanno prodotto valori incompatibili: non pubblicati** |
| 10 | Numero della tabella dell'undicesimo campo del segmento di errore | `04` §7 | Dedotto per esclusione, non verificato |
| 11 | Valori di contesto accettati dal fornitore dell'identità su documento | `08` §6.1 | `INTEG` - vanno letti dai metadati a runtime, non cablati |
| 12 | Inoltro del livello richiesto attraverso il realm di intermediazione | `08` §6.4 | `ARCH`, `TECH` - **Q-160** |
| 13 | Disponibilità dello scambio da emittente esterno a interno nella versione adottata | `08` §5.4 | `ARCH`, `TECH` - con **cancello di rilascio** dichiarato |
| 14 | Algoritmo di hash delle credenziali temporanee del relay | `09` §7.4 | Chi implementa il servizio, **con collaudo di integrazione** invece che con una citazione |

## 8. Note finali

Tre scelte redazionali che vale la pena registrare, perché sono state prese e non subite.

**Le deviazioni sono un artefatto pubblico.** Quest'area devia consapevolmente dalla
raccomandazione di una specifica in tre punti - gestione stretta dei parametri di ricerca,
obbligatorietà del validatore di precondizione sulle scritture cliniche, risposta di risorsa
inesistente al posto di quella di accesso negato - e ciascuna deviazione è registrata con
motivazione e costo. Una deviazione non dichiarata è un difetto; una deviazione dichiarata e
motivata è una decisione.

**Le trappole sono prove, non note.** Diciassette errori realmente accaduti in progetti sanitari,
o obblighi negativi espliciti di specifiche, sono codificati in `10` §5 come prove che devono
fallire se il comportamento sbagliato compare. Una nota in un documento si dimentica; una prova
che fallisce no.

**Il capitolo sulle prove dichiara anche ciò che non si può dire.** La tabella delle formule di
conformità vietate (`10` §2) è stata scritta prima delle suite, perché le affermazioni di
conformità sbagliate sono il difetto di documentazione più costoso: si propagano nei materiali
commerciali e nelle risposte alle gare, e correggerle dopo è più difficile che non commetterle.
