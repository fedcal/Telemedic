# log-FUNZ — Area funzionale

> Registro del lavoro dell'agente `FUNZ`. Contiene: file prodotti con conteggi, voci di bacheca
> risolte e aperte, vincoli posti, dichiarazioni `[NV]`, e le verifiche di non contraddizione
> rispetto ai vincoli altrui.

## 1. File prodotti

### 1.1 `docs/03_functional/` — area funzionale

| File | Righe non vuote | Parole (stima) | Contenuto |
|---|---|---|---|
| `00-indice.md` | 87 | ~1.100 | mappa dell'area, percorsi di lettura per profilo, regole redazionali, rapporto con il catalogo congelato in fase di ricerca |
| `01-attori-e-ruoli.md` | 381 | ~4.800 | 26 attori con obiettivo, veste, attività, dati necessari, vincolo di autorizzazione e **vincoli reali** di tempo, competenza digitale, dispositivo e rete; relazioni abilitanti; matrice attore × capacità; anti-pattern |
| `02-catalogo-dei-requisiti.md` | 1.011 | ~11.000 | otto blocchi nuovi di requisiti funzionali con criterio di accettazione verificabile, requisiti non funzionali con metrica e metodo, tracciabilità, **mappatura delle 58 conseguenze progettuali**, scenari d'uso pericolosi con il rischio introdotto dalla mitigazione, governo degli identificativi |
| `03-casi-d-uso.md` | 854 | ~10.000 | 24 casi d'uso con precondizioni, flusso principale, flussi alternativi, **flussi di errore**, postcondizioni; famiglia di esiti `EX-TM-*`; tabella responsabilità/effetti amministrativi |
| `04-regole-di-business.md` | 188 | ~6.000 | 86 regole con enunciato, razionale, **fonte** (`NORM`/`CTX`/`PROG`) e **conseguenza della violazione** su tre livelli; tabella di ciò che un tenant non può configurare; metodo di verifica per prova negativa |
| `05-gestione-degli-allarmi.md` | 399 | ~5.200 | quattro componenti obbligatorie, soglie come configurazione per assistito, anatomia e ciclo di vita dell'allarme, tecnico/clinico, consegna e conferma, presa in carico e mancato riscontro, escalation con fallimento dichiarato, riduzione del rumore, silenzio, guasto sistemico, copertura oraria, indicatori di sicurezza |
| `06-accessibilita-e-usabilita.md` | 295 | ~3.800 | criterio di accettazione operativo con due prove obbligatorie, sei profili di utente reali, requisiti con metodo di verifica, mobile first come metodo, ingegneria dell'usabilità, gerarchia dei controlli, messaggi di errore, non conformità dichiarata, obblighi del componente incorporabile |
| `07-fuori-perimetro.md` | 148 | ~3.000 | 24 esclusioni con categoria, motivazione e **verifica**; che cosa non è escluso ma viene creduto tale; procedura di ampliamento; collegamento alla destinazione d'uso |
| **Totale area** | **3.363** | **~45.000** | requisito di mandato: ≥ 25.000 parole — **soddisfatto** |

### 1.2 `docs/10_fondamenti/` — guida dei fondamenti

| File | Righe non vuote | Parole (stima) | Contenuto |
|---|---|---|---|
| `14-flussi-funzionali.md` | 981 | ~9.000 (≈ 8.000 escluso il codice dei diagrammi) | percorsi end-to-end con **17 diagrammi Mermaid**; frontmatter `sidebar_position: 15` |

**Metodo di conteggio.** I conteggi di riga sono esatti (righe non vuote). I conteggi di parola sono
**stime** ricavate dalle righe non vuote e dalla densità media del testo: nell'ambiente di redazione
non è disponibile uno strumento di conteggio. Sono dichiarati come stime e non come misure.

**Diagrammi del modulo 14**: due macchine a stati separate; ciclo completo della prestazione
sincrona; prenotazione e verifica tecnica; identificazione; teleconsulto asincrono; teleconsulto
sincrono; arruolamento; rilevazione-valutazione-segnalazione-escalation-esito; silenzio e guasto
sistemico; ciclo del consenso; ciclo del documento con rettifica; caduta e riconnessione; ripiego in
presenza; emergenza clinica; allarme che non raggiunge nessuno; fuori copertura; disdetta e
riprogrammazione; ciclo di vita di una misura; pubblicazione degli eventi.

## 2. Identificativi congelati da quest'area

Dichiarati in bacheca come **V-120**. Non rinumerabili, non riusabili (`BR-178`).

| Serie | Intervallo | Oggetto |
|---|---|---|
| `RF-230` … `RF-248` | blocco 5.Q | percorso di cura, arruolamento, piano di telemonitoraggio |
| `RF-251` … `RF-266` | blocco 5.R | acquisizione e qualità delle misure |
| `RF-269` … `RF-290` | blocco 5.S | valutazione, allarmi, escalation |
| `RF-293` … `RF-306` | blocco 5.T | silenzio, aderenza, sorveglianza del volume atteso |
| `RF-309` … `RF-320` | blocco 5.U | copertura del servizio e instradamento |
| `RF-323` … `RF-332` | blocco 5.V | punteggi e scale |
| `RF-335` … `RF-340` | blocco 5.W | segnalazione, quasi eventi, sorveglianza |
| `RF-343` … `RF-352` | blocco 5.X | eseguibilità della prestazione e ripiego in presenza |
| `RNF-090` … `RNF-110` | — | tempestività della catena di sicurezza, qualità della sorveglianza, integrità del calcolo, accessibilità delle funzioni di sicurezza |
| `BR-100` … `BR-185` | — | percorsi e piani, misure, punteggi, soglie e allarmi, silenzio, copertura e instradamento, documenti e pagatore, ammissibilità e *setting* |
| `ATT-20` … `ATT-26` | — | responsabile del piano, case manager, centro servizi, centro erogatore, gateway di misure, redattore del percorso, formatore |
| `UC-01` … `UC-24` | — | casi d'uso |
| `OUT-01` … `OUT-24` | — | esclusioni di perimetro |
| `EX-TM-*` | 17 codici | esiti tipizzati del telemonitoraggio |

**Restano liberi** e vanno richiesti in bacheca prima dell'uso: `RF-353`+, `RNF-111`+, `BR-186`+.

## 3. Bacheca — voci risolte

| # | Da → a | Esito |
|---|---|---|
| **Q-12** | `GUIDA` → `FUNZ` | **RISOLTA.** Tutte le 58 conseguenze progettuali del modulo 10 hanno un identificativo; mappatura una per una in `02-catalogo-dei-requisiti.md` §13. Le sei aree dichiarate scoperte sono coperte per intero: piano versionato, finestra di attesa, escalation con fallimento dichiarato, sorveglianza del volume atteso, copertura oraria, tracciabilità del calcolo. I dieci scenari d'uso pericolosi sono mappati **con il rischio introdotto dalla mitigazione** (§13.5), pronti per il file di rischio |
| **Q-14** | `GUIDA` → `PROD`, `FUNZ` | **Parte `FUNZ` risolta.** La copertura è dato di runtime versionato, condizione di attivabilità del piano, visibile in modo persistente con lo stato corrente, condizionante la validità del destinatario nella catena di escalation, con evento marcato fuori copertura e riduzione come evento di sicurezza. Resta a `PROD` la comunicazione pubblica: aperta come **Q-121** |
| **Q-141** | `DOM` → `FUNZ` | **RISOLTA.** Le sei entità di dominio hanno identificativi: attesa di rilevazione, copertura oraria, valutazione di eseguibilità a tre esiti, ambito di consulto, esito distinto dallo stato, livello di provenienza della misura. Nessuna ha richiesto di riaprire identificativi esistenti |
| **Q-147** | `DOM` → `FUNZ`, `PROD` | **Parte `FUNZ` confermata.** Il catalogo porta entrambi gli attributi tassonomici; il vincolo professionale si applica all'attività e non al servizio minimo (`BR-011`, non configurabile). Resta a `PROD` l'allineamento del materiale pubblico |
| **Q-163** | `INTEG` → `FUNZ`, `PROD` | **Confermata.** `BR-170`, `BR-171` e `OUT-18` chiudono ogni percorso, diretto o mediato, con cui un pagatore ottenga contenuto clinico. Nessun esito tipizzato espone contenuto clinico. Coerente con **V-166** |
| **Q-157** | `SEC` → `FUNZ`, `COMP` | **Parte `FUNZ` confermata.** L'oscuramento selettivo del contenuto audio-video non è nel perimetro della v1.0, categoria `SCOPE`. La misura intermedia proposta è funzionalmente compatibile. Resta a `COMP` la valutazione di conformità |
| **Q-115** | `TECH` → `PROD`, `FUNZ` | **Nota aggiunta, resta aperta.** La scelta del dispositivo di riferimento è di `PROD`; quest'area vincola l'uso della scelta (due prove obbligatorie su dieci percorsi critici) e segnala che **`RNF-106` non è verificabile finché il dispositivo non è dichiarato** |

## 4. Bacheca — vincoli posti da quest'area

| # | A | Vincolo |
|---|---|---|
| **V-120** | tutte | Intervalli di identificativi congelati da `FUNZ`; intervalli liberi da richiedere prima dell'uso |
| **V-121** | `ARCH`, `TECH` | L'allarme è una sequenza di eventi immutabili; lo stato è una proiezione. Nessuna colonna di stato aggiornata sul posto, né per l'allarme né per la misura né per il piano |
| **V-122** | `ARCH`, `TECH`, `SEC`, `PROD` | La copertura oraria è dato di runtime versionato e condiziona la validità del destinatario nella catena di escalation |
| **V-123** | `TECH`, `PROD`, `GUIDA` | Il campo soglia parte vuoto e obbligatorio: nessuna precompilazione, nemmeno con i valori del percorso |
| **V-124** | `ARCH`, `INTEG`, `TECH` | Istante di misura e istante di ricezione distinti e obbligatori; identità della misura per l'idempotenza dichiarata; le regole operano sull'istante di misura |
| **V-125** | `SEC`, `ARCH`, `INTEG` | La separazione centro servizi / centro erogatore è vincolo di autorizzazione, non convenzione organizzativa |
| **V-126** | `PROTO`, `TECH`, `INTEG` | Gli esiti tipizzati `EX-*` ed `EX-TM-*` sono valori di dominio, **non** codici di errore: non confluiscono nei cataloghi dei tipi di problema (V-110, V-260) |

## 5. Bacheca — questioni aperte da quest'area

| # | A | Questione |
|---|---|---|
| **Q-120** | `ARCH`, `COMP` | Rappresentazione ed esecuzione delle regole del piano: linguaggio espressivo quanto basta e ristretto quanto serve per essere validabile ai fini regolatori. Si salda con Q-142 e Q-11 |
| **Q-121** | `PROD` | Residuo di Q-14: formulazione approvata della dichiarazione di copertura e divieto di presentarla come livello di servizio commerciale |
| **Q-122** | `INTEG`, `ARCH` | Contratto minimo del gateway di misure: segnale di presenza e telemetria di stato del dispositivo. `[NV]` sulla disponibilità effettiva. Conseguenza di sicurezza, non di integrazione |
| **Q-123** | `COMP` | La conversione dell'allarme tecnico in allarme clinico di assenza di sorveglianza rientra nella destinazione d'uso congelata? |
| **Q-124** | `ARCH`, `COMP` | Dove vive la storia degli allarmi nella modalità senza conservazione del contenuto clinico. Si salda con Q-140 e Q-150 |
| **Q-125** | `DOM`, `ARCH` | Codifica dei parametri di telemonitoraggio e delle unità; comportamento con il sistema terminologico esterno disattivato |
| **Q-126** | `PROD`, `COMP` | Formulazione approvata delle dichiarazioni «non è un canale di emergenza» per canale asincrono, ripiego telefonico e inserimento manuale |

## 6. Dichiarazioni `[NV]`

Elenco completo di ciò che quest'area **non ha verificato su fonte primaria** e ha marcato come tale.

| Dove | Che cosa non è verificato | A chi va chiesto |
|---|---|---|
| `01-attori-e-ruoli.md` § 6 (`ATT-24`) | capacità effettiva dei gateway di misure di mercato di esporre un segnale di presenza indipendente dalla misura | `INTEG` — aperta come Q-122 |
| `02-catalogo-dei-requisiti.md` (`RF-350`) | campo del tracciato ministeriale in cui confluisce l'attestazione di qualità del collegamento: la collocazione è oggetto di decisione architetturale | `COMP` — si salda con Q-261 e con `REQ-46` di `B1` |
| `02-catalogo-dei-requisiti.md` (`RF-344`) | il modello orientativo che introduce la verifica di eseguibilità su tre dimensioni è documento **metodologico**, non normativo: marcato `[RACCOMANDATO]` | `COMP` |
| `04-regole-di-business.md` (`BR-106`) | atto puntuale da cui discende il divieto di auto-attivazione del telemonitoraggio: la regola è motivata anche come proposta di progetto, ma la fonte normativa specifica non è stata verificata | `COMP` |
| `04-regole-di-business.md` (`BR-172`) | template documentali, codici di tipologia e metadati di indicizzazione delle dieci tipologie della telemedicina non sono pubblicamente disponibili | `COMP` — si salda con Q-07 |
| `04-regole-di-business.md` (`BR-179`) | riferimento puntuale di clausola della norma sulla gestione del rischio per la gerarchia delle misure di controllo | `COMP` |
| `03-casi-d-uso.md`, `05-gestione-degli-allarmi.md` | **nessuna soglia clinica, nessun intervallo, nessuna cadenza** compare in questi documenti: non sono `[NV]`, sono **configurazione** per costruzione (V-02, V-123) | — |

**Nota di metodo.** Dove il progetto ha già accertato in senso negativo — l'assenza di soglie
tecniche quantitative vincolanti nelle fonti nazionali — quest'area non riapre la verifica e si
limita a trattare le soglie tecniche come specifica di prodotto (V-12), collocandole nella
destinazione d'uso e negli ingressi della gestione del rischio.

## 7. Verifica di non contraddizione con i vincoli altrui

| Vincolo | Area | Come è stato rispettato |
|---|---|---|
| V-01 | ORCH | `Encounter` e sessione media restano distinti: è il principio che apre il modulo 14 e regge `UC-08` |
| V-02 | ORCH | nessuna soglia clinica in nessun documento; `BR-130`, `RNF-103`, `RNF-104` la rendono verificabile |
| V-03 | ORCH | nessun percorso principale richiede il sistema terminologico esterno; il caso limite è aperto come Q-125 |
| V-04 | ORCH | `RF-271`, `RNF-098` e `BR-143` distinguono esplicitamente immutabilità e versionamento |
| V-05 | ORCH | `OUT-22` dichiara che il progetto è conforme e verificabile, non accreditato |
| V-06 | ORCH | `OUT-20` e l'avvertenza finale di `07-fuori-perimetro.md` |
| V-07 | ORCH | `BR-172`: dataset canonico, serializzazioni sostituibili, nessun template cablato |
| V-08 | ORCH | `BR-170`, `BR-171`, `OUT-18`; confermato in Q-163 |
| V-09 | ORCH | blocco 5.T per intero, `BR-150`…`BR-155`, § 9 e § 10 di `05-gestione-degli-allarmi.md`, § 7 del modulo 14 |
| V-11 | `GUIDA` | il contenitore di registrazione non è mai assunto in alcun requisito di quest'area |
| V-12 | `GUIDA` | le soglie tecniche sono trattate come specifica di prodotto, mai come conformità (`RF-350`, `RF-166`) |
| V-141 | `DOM` | stato ed esito del contatto restano attributi distinti; `EX-NOSHOW` ed `EX-TECH-PATIENT` hanno effetti amministrativi opposti nella tabella di §4 dei casi d'uso |
| V-143 | `DOM` | il referto di televisita è trattato come tipologia documentale propria (`BR-172`); l'ipotesi errata non compare |
| V-144 | `DOM` | nessun artefatto di quest'area usa «monitoraggio in tempo reale» o «sorveglianza continua» in senso affermativo; l'unica occorrenza è la citazione contrastiva in `OUT-12` e nel § 1 di `07-fuori-perimetro.md`, che serve a **escludere** la formulazione |
| V-145 | `DOM` | `RF-349` rende il *setting* discriminante di regole; l'obbligo di referto non è cablato come incondizionato |
| V-146 | `DOM` | consensi come oggetti distinti con cicli indipendenti (`RF-237`, `UC-04`, § 8 del modulo 14); nessun «consenso alla piattaforma» |
| V-147 | `DOM` | `BR-100` e `RF-230`: aggiungere un percorso non richiede rilascio del software né migrazione di schema |
| V-148 | `DOM` | l'attesa di rilevazione è un'entità: `RF-293`…`RF-295` e `BR-151` distinguono misura non attesa da non pervenuta |
| V-149 | `DOM` | l'oscuramento non è ridefinito da quest'area; `RF-119` resta in vigore |
| V-150, V-152 | `SEC` | il registro degli allarmi riferisce puntualmente le misure ma non è il registro degli accessi: la loro distinzione e collocazione è aperta come Q-124 |
| V-153 | `SEC` | l'accesso d'emergenza resta requisito funzionale (`RF-019`), non eccezione |
| V-110, V-260 | `TECH`, `PROTO` | nessun esito tipizzato è emesso come errore di protocollo: chiarito con **V-126** per evitare che i due cataloghi si mescolino |
| V-161 | `INTEG` | nessun requisito di quest'area introduce contenuto clinico nei messaggi di evento. La restituzione del documento al sistema di origine (`RF-215`, preesistente) è un trasferimento su chiamata autenticata e **non** un carico di evento: le due cose restano distinte |
| V-163 | `INTEG` | `BR-161`, `BR-168` e § 10 di `06-accessibilita-e-usabilita.md`: dichiarazioni obbligatorie non tematizzabili né occultabili, contrasto validato con **rifiuto al salvataggio** |
| V-164 | `INTEG` | `BR-175` e `OUT`-nessuna: ogni capacità introdotta da quest'area è raggiungibile da interfaccia applicativa documentata; le prove negative si eseguono anche sulle interfacce applicative |
| V-166 | `INTEG` | confermato in Q-163 |

**Nessun vincolo altrui è stato contraddetto.** Un punto di attenzione è segnalato e non nascosto:
il rapporto fra il **registro degli allarmi** (documentazione di un atto, necessaria alla
ricostruzione e al calcolo degli indicatori di sicurezza) e la **modalità senza conservazione del
contenuto clinico** imposta a talune infrastrutture. Non è una contraddizione risolvibile da
quest'area: è aperta come **Q-124** verso `ARCH` e `COMP`.

## 8. Che cosa resta da fare su quest'area

1. **Traduzione inglese integrale** dei nove file, con struttura speculare (decisione D50). I
   riferimenti normativi italiani restano nella forma originale con la spiegazione in inglese.
2. **Collegamenti interni verso moduli non ancora scritti**: quest'area rinvia a
   `docs/10_fondamenti/` e a `docs/03_functional/` con collegamenti relativi già verificati contro i
   file esistenti. I rinvii verso `docs/05_domain/`, `docs/08_compliance/` e i registri di decisione
   architetturale sono espressi in forma descrittiva e non come collegamenti, per non produrre
   collegamenti rotti prima del primo deploy (D52).
3. **Matrice di tracciabilità eseguibile**: le tabelle del § 12 di `02-catalogo-dei-requisiti.md`
   sono la specifica della matrice, non la matrice. La sua generazione e la verifica automatica di
   copertura appartengono alla catena di integrazione continua (`RF-205`, `RNF-069`).
4. **Recepimento delle risposte** alle sette questioni aperte da quest'area, in particolare Q-120
   (motore delle regole) e Q-124 (collocazione del registro degli allarmi), che sono le due che
   possono modificare requisiti già congelati — nel qual caso si emette un identificativo nuovo e si
   ritira il precedente, senza rinumerare (`BR-178`).
