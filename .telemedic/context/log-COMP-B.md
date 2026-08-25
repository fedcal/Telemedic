# log-COMP-B — Area conformità, seconda metà

**Agente**: COMP-B. Ripresa dopo interruzione per limite di sessione. La sessione precedente aveva
già completato la ricerca `B9` (sezioni 0–15) e il capitolo `05-gestione-del-rischio.md`; **nulla
di ciò che era su disco è stato rifatto**.

**Data**: 25 agosto 2026 · **Percorso**: `docs/08_compliance/` · **Quattro file**

**Perimetro assegnato**: capitoli 06, 07, 08, 09. I capitoli 00–04 sono di `COMP-A` e non sono
stati toccati. Il capitolo 05 era già scritto da questo agente e vi si rimanda senza ripeterlo.

---

## 1. Deliverable prodotti

| File | `sidebar_position` | Parole | Contenuto |
|---|---:|---:|---|
| `06-usabilita-e-accessibilita.md` | 7 | 4.529 | I due obblighi distinti sulla stessa interfaccia con la tabella dei fondamenti; l'**errore d'uso come modo di guasto** e il suo posto esatto nella catena ISO 14971; gli otto prodotti della clausola 5 con la ripartizione progetto / chi certifica; **gruppi di utilizzatori e coorti**, con l'errore che raddoppia il costo (la disabilità non è un quinto gruppo); dove i due obblighi si incontrano e dove no, con cinque esempi presi da questo dominio; il vincolo `V-175`; la **non conformità dichiarata verificata contro la regola**, con la dipendenza da `Q-111`; il dispositivo mobile come **elemento della specifica d'uso** e le tre popolazioni reali; la sommativa come vincolo di calendario con le tre modalità di fallimento |
| `07-valutazione-clinica.md` | 8 | 4.029 | Definizioni esatte e distinzione fra dati, evidenza e beneficio clinico; **perché «efficienza» e «gradimento» non sono benefici clinici**; il collo di bottiglia non comprimibile con risorse e le tre ragioni della sottostima; la **dipendenza bloccante da `Q-144`** e il fatto che cambiare formulazione cambia il *corpus*, non il testo; le tre componenti di MDCG 2020-1 con la buona e la cattiva notizia; il vincolo `V-176` sull'evidenza citabile; **tabella di chi può fare che cosa**, con il dossier dello stato dell'arte come unico contributo strategico del progetto; l'art. 61(10) e le tre ragioni per non invocarlo; l'equivalenza e il limite che la rende inutilizzabile per un software, **compreso il vincolo `R0` che la rende non producibile qui**; il seguito clinico come requisito di progettazione del dato, vincolo `V-177` |
| `08-sorveglianza-post-commercializzazione.md` | 9 | 4.710 | I due processi con logiche opposte; il piano dell'Allegato III tradotto voce per voce in conseguenze tecniche; **indicatori e soglie derivati dalle righe del registro dei rischi**; il rapporto periodico e il problema strutturale del volume di vendite nel modello aperto; incidenti gravi, termini e **perché il nesso è particolarmente difficile per un prodotto a conseguenze indirette**; rapporti di andamento contro rapporti riassuntivi, con il vincolo `V-178`; azioni correttive sul campo e la riga con l'orologio più corto; il modello a due velocità delle modifiche; **`§ 8` — chi è titolare degli obblighi quando il software è aperto**, in cinque punti compreso il caso che nessuna misura copre; il raccordo con la risposta agli incidenti **senza riformularla** |
| `09-percorso-e-calendario.md` | 10 | 5.100 | Avvertenza che governa il capitolo: **il calendario è di chi certifica**; che cosa esattamente si deve ottenere, in diagramma; il calcolo all'indietro dai tempi reali dell'organismo notificato con la lettura onesta dei numeri; i tre scenari, il diagramma di Gantt del piano di riferimento e i **cinque punti di decisione irreversibili**; versione 1.0 e marcatura come due traguardi distinti; le **quattro attività retroattivamente irrecuperabili** con l'ammissione che la terza è già stata violata; la **sequenza minima** con la motivazione di ogni passo; **`§ 7` — ripartizione di responsabilità** (richiamato da `05 §6.3`), con `V-179` e i rischi trasferiti a chi integra; tempi non comprimibili, tripartizione del costo, cinque regole per i preventivi; figure e responsabile del rispetto della normativa |
| **Totale** | | **18.368** | Contro un minimo richiesto di 16.000 |

---

## 2. Vincoli posti — intervallo riservato `COMP` 175–179

Tutti scritti in `.telemedic/context/05_BACHECA_INTERAGENTI.md`. Nessuna voce altrui è stata
rinumerata; le righe `V-170`…`V-174` di `COMP-A`, inserite in parallelo, sono state solo
riordinate in sequenza numerica senza modificarne il testo.

| # | A | Sintesi |
|---|---|---|
| `V-175` | `FUNZ`, `PROD`, `INTEG`, `TECH` | **Collegamento bidirezionale usabilità ↔ accessibilità.** Un criterio di accessibilità che copre una funzione legata alla sicurezza **non è una non conformità dichiarabile**: è un rischio d'uso non controllato. Verifica meccanica: intersezione vuota fra l'elenco delle caratteristiche legate alla sicurezza e l'elenco delle non conformità dichiarate |
| `V-176` | `TECH`, `ARCH`, tutte le aree con prove in CI | **Evidenza citabile.** Un rapporto rigenerabile ma non conservato **non è evidenza**. Versione, ambiente, data, esecutore, esito, impronta — conservati come artefatto immutabile. Requisito distinto e più stringente della ricostruibilità di IEC 62304, perché il destinatario è esterno |
| `V-177` | `ARCH`, `FUNZ`, `DOM`, `TECH` | **Le grandezze del seguito clinico si progettano prima del piano che le promette.** Definizione stabile e versionata; cambiarla senza cambiarne il nome vanifica il seguito senza che nessuno se ne accorga. Nessuna contiene contenuto clinico, ed è una condizione, non una coincidenza |
| `V-178` | `TECH`, `SEC`, `ARCH`, `FUNZ` | **(a) Tassonomia stabile degli eventi contati** — una categoria rinominata fa *sparire* l'aumento significativo dell'art. 88 invece di rilevarlo. **(b) Conservazione della diagnostica pari almeno alla finestra di vigilanza**, determinata dagli obblighi di vigilanza e non dal fabbisogno operativo. **Chiude `Q-116`** |
| `V-179` | tutte | **Gli artefatti del progetto sono ingressi identificati, mai documenti controllati.** Versione, data e impronta verificabile sono la condizione perché chi certifica possa riemetterli sotto il proprio controllo. Complemento operativo di `V-174` |

---

## 3. Questioni aperte — intervallo riservato `COMP` 175–179

| # | A | Sintesi |
|---|---|---|
| `Q-175` | `PROD`, `TECH` | Il dispositivo e l'ambiente di riferimento sono **parte della specifica d'uso**. Rilancia `Q-115` con la conseguenza che quella questione non registrava: non è un ritardo di misura, è una **lacuna del fascicolo tecnico** |
| `Q-176` | → **ORCH** | Se il progetto produca e pubblichi il **dossier dello stato dell'arte**. Unica parte sostanziale della valutazione clinica che non dipende dal fabbricante e si presta alla forma aperta; richiede competenza clinica che il progetto non ha internamente |
| `Q-177` | → **ORCH** | Se la **distribuzione identificata** sia disponibile solo attraverso un canale che identifica il destinatario. Non tocca l'apertura del repository. Da essa dipendono due voci obbligatorie del rapporto periodico e la tracciabilità delle versioni |
| `Q-178` | `SEC`, → **ORCH** | **Come il progetto viene a sapere** di un incidente in un'installazione derivata di cui ignora l'esistenza. Non esiste canale in ingresso, e un difetto che il progetto non conosce resta nel codice di chiunque lo usi |
| `Q-179` | → **ORCH** | Se e come pubblicare il calendario di certificazione, che contiene date riferite a un percorso di terzi. Pubblicarle senza avvertenza **sopra** produce esattamente l'affermazione vietata da `V-171` |

---

## 4. Questioni altrui riscontrate

| # | Da | Esito |
|---|---|---|
| `Q-116` | `TECH` → `COMP` | **CHIUSA.** Conservazione della diagnostica determinata dagli obblighi di vigilanza; termine ricavato **per composizione, non per scelta**; proposta di dodici mesi configurabili con determinazione finale del fabbricante; `[NV]` sul valore perché **nessuna fonte fissa un termine per la diagnostica**. Aggiunta la capacità gemella che la questione non individuava: la tassonomia stabile degli eventi. Posta come `V-178` |
| `Q-113` | `TECH` → `COMP`, `ROAD` | **PARZIALMENTE EVASA.** Collocazione formale accertata (piano di sorveglianza più periodo di supporto dichiarato); struttura dell'impegno fissata in tre punti; **valore numerico rinviato al fabbricante** e a `Q-155`, che resta al committente. Aggiunta l'avvertenza sulla valutazione unica a due uscite |
| `Q-25` | `COMP` → `ORCH` | Già risolta da `COMP-A` in parallelo. Nessun intervento |

**Questioni indirizzate a `COMP` non evase da questo agente**, perché appartengono ai capitoli di
`COMP-A` o a materia già trattata nel capitolo 05: `Q-01`, `Q-07`, `Q-10`, `Q-11`, `Q-13`, `Q-24`,
`Q-26`, `Q-112`, `Q-114`, `Q-120`, `Q-123`, `Q-124`, `Q-126`, `Q-131`, `Q-132`, `Q-134`, `Q-142`,
`Q-146`, `Q-151`, `Q-157`, `Q-162`, `Q-194`.

---

## 5. Vincoli altrui recepiti

`V-06` (il progetto non appone marcatura CE) governa tutti e quattro i capitoli e ne determina la
struttura: ogni tabella di ripartizione ha due colonne e nessuna delle due è ambigua.
Recepiti inoltre: `V-09`, `V-113`, `V-114`, `V-122`, `V-123`, `V-125`, `V-126`, `V-141`, `V-144`,
`V-148`, `V-150`, `V-152`, `V-163`, `V-165` (indirettamente), `V-171`, `V-172`, `V-174`.

**Nessun vincolo altrui è stato contraddetto.** In particolare: `03_functional/06` non è stato
riscritto né contraddetto — il criterio di accettazione operativo, le due prove obbligatorie, i
dieci percorsi critici e i sei profili sono **richiamati e riletti in chiave regolatoria**, mai
riformulati; `06_security/10` non è stato duplicato — il § 9 del capitolo 08 vi rimanda e vi
aggiunge la sola prospettiva del fabbricante, che quel capitolo non poteva assumere.

---

## 6. Scelte redazionali degne di nota

1. **`09 § 7` è stato costruito per rispondere al rinvio già scritto in `05 §6.3`** («la questione
   della ripartizione di responsabilità è trattata al capitolo 09, § 7»). La numerazione del
   capitolo 09 è stata quindi vincolata da un rinvio preesistente, non scelta liberamente.
2. **L'ammissione al `09 §5`** che la terza attività irrecuperabile di `D45` — il controllo dei
   documenti prima di produrre altri documenti — sia **già stata violata**: questa documentazione
   è stata prodotta prima che il controllo esistesse. La conseguenza era già governata da `V-174`
   di `COMP-A`, e `V-179` ne aggiunge il complemento operativo. Tacerlo sarebbe stato prosa
   consolatoria.
3. **Nessun numero inventato.** Le cifre dell'organismo notificato sono marcate
   `[FONTI SECONDARIE]` con l'avvertenza esplicita di non citarle come dati ufficiali; le tariffe
   non sono stimate ma rinviate all'obbligo di pubblicazione dell'Allegato VII sez. 1.2.8; la
   cifra di quindici partecipanti alla sommativa è dichiarata **di provenienza extraeuropea e non
   citabile come obbligo**; il termine di conservazione della diagnostica è dichiarato proposta e
   non obbligo.
4. **`R0` rispettata**, e in un punto è diventata contenuto: il `07 §6.1` dichiara che l'analisi di
   equivalenza **non è producibile in questa documentazione** perché nomina necessariamente un
   dispositivo di confronto. È un limite di perimetro, non un'omissione.
5. **Tre diagrammi Mermaid** aggiunti: intersezione dei due obblighi (06), catena seriale della
   valutazione clinica con le due dipendenze laterali (07), percorso completo e Gantt del piano di
   riferimento (09). Nessuno duplica il diagramma di processo già presente in `03_functional/06`.

---

## 7. Verifiche eseguite prima della chiusura

- Frontmatter YAML valido su tutti e quattro i file; `sidebar_position` 7, 8, 9, 10 senza
  collisioni con 00–05 (1–6); descrizioni contenenti due punti seguiti da spazio **racchiuse fra
  virgolette doppie**, come richiesto per non far fallire la costruzione del sito.
- Tutti i collegamenti relativi risolvono su file esistenti, compresi quelli verso
  `03_functional`, `06_security`, `07_integration` e `10_fondamenti`. Nessun rinvio a file alla
  radice del repository, quindi nessun indirizzo assoluto necessario.
- Delimitatori di blocco bilanciati; sintassi Gantt priva di accenti e apostrofi nelle etichette.
- Tutti gli identificativi citati (`RM-*`, `RNF-*`, `RF-*`, `V-*`, `Q-*`, `D*`) verificati come
  esistenti nelle rispettive fonti prima della citazione.

---

## 8. Che cosa resta all'area di conformità dopo questo lavoro

L'area è completa nei suoi dieci capitoli. Restano tre categorie di lavoro, tutte fuori dal
perimetro di questo agente:

1. **Le decisioni del committente**: `Q-144` (destinazione d'uso del telemonitoraggio), `Q-176`,
   `Q-177`, `Q-178`, `Q-179`, più `Q-155` e `Q-170`…`Q-174` di `COMP-A`. `Q-144` è quella che
   blocca di più: senza congelamento la valutazione clinica non può partire.
2. **Le verifiche documentali `[NV]`**, tutte a costo quasi nullo e tutte da fare prima di
   compilare la matrice dei requisiti generali di sicurezza e prestazione: stato di armonizzazione
   di EN 62366-1 e di EN ISO 14971, versione efficace di EN 301 549, numerazione puntuale di
   Allegato I, artt. 2, 15, 61, 86 e 87, revisione corrente di MDCG 2020-1 e 2020-3.
3. **La traduzione inglese integrale** (`D50`), con la regola che una modifica al contenuto
   italiano non è completa finché non aggiorna l'inglese.
