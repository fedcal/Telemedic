# log-ROAD — Area roadmap

> Registro del lavoro dell'agente `ROAD`. Contiene: file prodotti con conteggi, voci di bacheca
> risolte e aperte, vincoli posti, dichiarazioni `[NV]`, e le verifiche di non contraddizione
> rispetto ai vincoli altrui.
>
> **Nota di continuità.** L'area è stata prodotta in **due sessioni**. La prima ha consegnato i
> file `00`–`03` e si è interrotta per esaurimento di sessione senza scrivere questo registro. La
> seconda ha consegnato `04` e `05`, ha registrato in bacheca l'intero blocco di voci dell'area
> (`V-180`…`V-189`, `Q-180`…`Q-189`) e ha scritto questo registro **per entrambe**. I file
> `00`–`03` non sono stati modificati dalla seconda sessione.

## 1. File prodotti

| File | Righe non vuote | Parole (stima) | Contenuto |
|---|---|---|---|
| `docs/09_roadmap/00-indice.md` | 292 | ~3.500 | orientamento; **tre classi di enunciato** (`[IMPEGNO]` / `[INTENZIONE]` / `[IPOTESI]`); distinzione fra impegno del progetto, di chi installa e di chi certifica; stato di fatto misurato al 25 agosto 2026; procedura di aggiornamento con inneschi di revisione fuori cadenza; risoluzione di `Q-09`; sette vincoli e sette questioni |
| `docs/09_roadmap/01-principi-e-metodo.md` | 394 | ~4.700 | quattro classi di attività (`A` irrecuperabile, `B` tempo di terzi, `C` percorso critico altrui, `D` comprimibile); criteri di priorità in **ordine lessicografico** senza pesi; il costo che non si vede; le cinque attività di classe `A` una per una; come si dice di no; **debito tecnico** e **debito regolatorio** con il debito già in essere dichiarato; capacità netta; le tre ipotesi `H1`/`H2`/`H3`; definizione di «fatto» |
| `docs/09_roadmap/02-traguardi.md` | 516 | ~6.200 | `T-01`…`T-08` fino al 30 novembre 2026 con criteri **binari**, dipendenze, esclusioni e rischi; l'aritmetica del 30 novembre e le **tre opzioni** di riformulazione; `T-10`…`T-13` oltre la data; **traguardi di terzi** riportati con la fonte e mai come impegno; otto punti di decisione irreversibili; diagramma di Gantt; ciò che non è datato e perché |
| `docs/09_roadmap/03-primo-rilascio-utilizzabile.md` | 379 | ~4.500 | perimetro esatto di `RU-1`; il limite non rimovibile per configurazione; criterio del **percorso verticale più stretto**; contenuto per contesto delimitato; **quattro categorie di esclusione** con conseguenze diverse; presupposti di installazione; quattordici limiti dichiarati; **diciotto criteri di rilascio bloccanti**; procedura di verifica lato deployer; impegno del progetto contro impegno di chi installa, riga per riga |
| `docs/09_roadmap/04-oltre-il-primo-rilascio.md` | 612 | ~7.000 | partizione **pianificato / desiderabile** con la regola che la governa (`V-187`); criteri di ordinamento della coda e le tre regole aggiuntive; regola del sorpasso; **quattordici voci pianificate `OL-01`…`OL-14`** con motivo dell'esclusione da `RU-1`, criteri di completamento binari, innesco e titolare; **sette voci desiderabili `DS-01`…`DS-07`** con che cosa manca perché diventino pianificate; rinvio alle esclusioni definitive; transizioni di categoria; che cosa il capitolo non promette |
| `docs/09_roadmap/05-rischi-e-dipendenze.md` | 667 | ~7.600 | confine con la gestione del rischio clinico; scale di **probabilità** (cinque classi operative, nessuna percentuale) e di **impatto sul calendario** (`I1`…`I5`); quattro risposte ammesse con il limite sul trasferimento; **registro di ventisette rischi `R-01`…`R-27`** in sei gruppi, ciascuno con probabilità, impatto, indicatore anticipatore, risposta e titolare; **sette famiglie di dipendenze esterne** con la regola comune del punto di estensione e della modalità degradata provata; **rischio di dipendenza da un solo integratore** descritto strutturalmente in cinque passi con sei contromisure verificabili; procedura di sorveglianza; che cosa non è nel registro; bacheca |
| **Totale area** | **2.860** | **~33.500** | — |
| **Sottototale seconda sessione** (`04` + `05`) | **1.279** | **~14.600** | requisito di mandato per i due file: ≥ 7.000 parole — **soddisfatto con ampio margine** |

**Metodo di conteggio.** I conteggi di riga sono esatti (righe non vuote, misurate con ricerca su
espressione regolare). I conteggi di parola sono **stime** ricavate dalle righe non vuote e dalla
densità media del testo: nell'ambiente di redazione non è disponibile uno strumento di conteggio.
Sono dichiarati come stime e non come misure — coerentemente con l'`[NV]` che l'area stessa pone
in `00-indice.md` §4 sul volume complessivo del corpus e con il criterio 6 di `T-02`, che fa del
**conteggio esatto** un criterio di completamento e non un'attività opzionale.

## 2. Designazioni introdotte da quest'area

**Nessun identificativo di requisito.** Le sigle seguenti sono **designazioni di pianificazione**:
non appartengono agli intervalli congelati da `V-120`, non entrano nella matrice di tracciabilità
e non possono comparire in una prova. È dichiarato esplicitamente in `04` §1.1 e, per `RU-1`, in
`03` in testa al capitolo.

| Serie | Intervallo usato | Oggetto | Dichiarata in |
|---|---|---|---|
| `T-nn` | `T-01`…`T-13` (`T-09` non usato) | Traguardi | `02` |
| `RU-n` | `RU-1` | Primo rilascio installabile. **Non è un nome di prodotto**: la denominazione della distribuzione è decisione del soggetto che la produce (`D17`) | `03` |
| `OL-nn` | `OL-01`…`OL-14` | Voci **pianificate** della coda successiva al primo rilascio | `04` |
| `DS-nn` | `DS-01`…`DS-07` | Voci **desiderabili**, prive di criterio, innesco e titolare | `04` |
| `R-nn` | `R-01`…`R-27` | Rischi di **programma**. Non sono rischi clinici e non hanno la scala di quelli | `05` |
| `H-n` | `H1`, `H2`, `H3` | Ipotesi di capacità. Il piano di riferimento è su `H2` | `01` |
| `I-n` | `I1`…`I5` | Classi di impatto **sul calendario** | `05` |

## 3. Vincoli posti in bacheca

Registrati nella tabella «Vincoli in vigore» di `05_BACHECA_INTERAGENTI.md`.

| # | A | Sintesi |
|---|---|---|
| `V-180` | tutte | Nessun documento dichiara una data per un traguardo che non è del progetto |
| `V-181` | tutte | Ogni traguardo ha un criterio binario verificabile da un terzo; una percentuale non è un criterio |
| `V-182` | `TECH`, `COMP` | Nessuna riga di codice applicativo precede la catena di costruzione con distinta e registro degli identificativi |
| `V-183` | tutte | Rilascio del corpo documentale per **area completa e in due lingue**, mai per file |
| `V-184` | `PROD`, `COMP`, `INTEG` | Nessun materiale può presentare `[INTENZIONE]` o `[IPOTESI]` come `[IMPEGNO]` |
| `V-185` | `TECH`, `SEC`, `COMP` | Livello di servizio di aggiornamento in **giorni** dall'avviso, per gravità, misurato; la capacità che lo onora è ricorrente e va sottratta prima di ogni data |
| `V-186` | tutte | La conformità alle misure nazionali di sicurezza **non ha una data di prodotto**: si dichiarano le evidenze e la data di disponibilità di ciascuna |
| `V-187` | tutte | **Pianificato contro desiderabile**: senza criterio binario, innesco e titolare la voce è desiderabile e va marcata tale |
| `V-188` | `TECH`, `INTEG`, `ARCH` | La suite di prove esercita **sempre due tenant e due integratori** con configurazioni divergenti |
| `V-189` | tutte | Ogni rischio ha **indicatore anticipatore osservabile** e **titolare nominato** |

## 4. Questioni aperte da quest'area

| # | A | Oggetto | Punto di decisione irreversibile |
|---|---|---|---|
| `Q-180` | → **ORCH** | Riformulazione del traguardo del 30 novembre 2026, tre opzioni argomentate | 15 ottobre 2026 |
| `Q-181` | → **ORCH** | **Dichiarazione della capacità** — la variabile senza la quale nessuna data è calcolabile | 15 settembre 2026 |
| `Q-182` | → **ORCH** | Modello di produzione della versione inglese integrale | 30 settembre 2026 |
| `Q-183` | `COMP` | Evidenze del pacchetto regolatorio consegnabili al 30 novembre 2026 | — |
| `Q-184` | `SEC`, `ARCH` | Capacità di misura come requisito del primo rilascio; valori prima del primo esercizio | Prima dell'esercizio |
| `Q-185` | `PROD`, → **ORCH** | Materiale pubblico non allineato a `D19` e `D29`; l'impatto è **irrecuperabile** | 31 ottobre 2026 |
| `Q-186` | `COMP`, `TECH` | Periodo di supporto dichiarato; prerequisito della prima distribuzione | Prima della prima distribuzione |
| `Q-187` | → **ORCH** | Concentrazione ammessa su un solo integratore e momento della seconda controparte di prova | Prima del secondo integratore |
| `Q-188` | `COMP`, → **ORCH** | Riserva dichiarata per le voci non stimabili; chi la mette a bilancio | — |
| `Q-189` | → **ORCH** | Continuità dei contributori e registrazioni a **ruoli distinti** non producibili internamente | Prima del primo audit interno |

**`Q-180`, `Q-181` e `Q-182` non sono separabili**: sono una sola decisione in tre parti, perché
la risposta alla prima dipende dalle altre due.

## 5. Questioni altrui evase o contribuite

| # | Da | Stato dopo l'intervento di `ROAD` | Dove |
|---|---|---|---|
| `Q-09` | `ORCH` → `ROAD` | **RISOLTA.** Non si parametrizza una data: si smette di dichiarare date e si dichiara la **disponibilità delle evidenze**. Tre elementi verificabili; formulazione ammessa che sostituisce ogni data. Posta come `V-186` | `00` §9.1 |
| `Q-113` | `TECH` → `COMP`, `ROAD` | **Parte `ROAD` evasa, resta aperta verso `COMP`.** Confermata la forma (giorni per gravità, misurata), **non fissati i numeri**, che appartengono al piano di sorveglianza post-commercializzazione. Aggiunta la conseguenza di pianificazione: è **capacità ricorrente**, da sottrarre prima di calcolare qualunque data. Posta come `V-185`; quantificazione in `05` §2, rischio `R-12` | `00` §9.2 |
| `Q-152` / `B-6` | `SEC` → `ARCH`, `ROAD` | **Parte `ROAD` dichiarata.** Nessun valore proposto — sarebbe il difetto che `V-12` vieta. Dichiarati: **quando** serve la soglia (prima del primo esercizio con un tenant reale, non prima del primo rilascio), che cosa la roadmap chiede in cambio (**capacità di misura** come requisito di `RU-1`), e che cosa resta a `SEC` e ad `ARCH`. Coordinamento temporale aperto come `Q-184` | `00` §9.3; `03` §3.1 |
| `Q-191` | `GUIDA` → `TECH`, `ROAD` | **Parte `ROAD` evasa, resta aperta verso `TECH`.** L'area non produce la misura e non sceglie la macchina di riferimento; dichiara la **collocazione**: profilo minimo praticabile come criterio della catena di costruzione (`T-03`), non attività successiva. Motivo di programma: senza di esso la dipendenza «contributori» non ha condizione verificabile e il rischio `R-02` resta privo di indicatore anticipatore, in violazione di `V-189` | `05` §7.3 |

## 6. Dichiarazioni `[NV]` di quest'area

| `[NV]` | Dove | Chi lo chiude |
|---|---|---|
| Volume esatto del corpus documentale: nessuno strumento di conteggio disponibile agli agenti; i valori dei registri di area sono stime da densità di riga | `00` §4; `02`, `T-06` | Criterio 6 di `T-02` |
| Denominazione della distribuzione non decisa: `RU-1` è designazione di pianificazione, non nome di prodotto | `03`, testa del capitolo | Soggetto che produce la distribuzione (`D17`) |
| Numero di tenant per installazione: ordine di grandezza dichiarato, misura non eseguita | `03` §6, limite 12 | Attività di rilascio, non stima |
| Quantificazione della capacità ricorrente di sorveglianza e di risposta alle segnalazioni | `01` §9; `05`, `R-12` | Cronologia di consegna propria |
| Disponibilità effettiva, presso i gateway di mercato, dei due segnali richiesti dal modello di sicurezza | `05`, `R-11` | `INTEG`, con verifica di mercato (`Q-122`, `B-9`) |
| Regime di licenza delle funzionalità avanzate dell'estensione per serie temporali | `05`, `R-08` | `COMP` (`Q-112`), sulla licenza primaria |

## 7. Verifica di non contraddizione rispetto ai vincoli altrui

Verifica eseguita sull'intera tabella «Vincoli in vigore» della bacheca. Nessuna contraddizione
rilevata. Le righe che l'area **applica attivamente** e non si limita a non violare:

| Vincolo altrui | Come quest'area lo applica |
|---|---|
| `V-03` (nessun percorso principale richiede la terminologia onerosa) | Criterio di rilascio bloccante 13 di `RU-1`; contromisura di `R-09`; famiglia «terminologie» del §3 di `05` |
| `V-05`, `OUT-22` (conforme e verificabile, non accreditato) | `OL-08` dichiara che nessun rilascio cambia la ripartizione; i tempi dell'accreditamento **non compaiono**, perché non esistono in fonte primaria |
| `V-06` (nessuna marcatura CE) | Avvertenza permanente in `00` e in `05`; `R-06` con impatto **I0 sul progetto**; §6 di `04`, terza osservazione |
| `V-07`, `V-136`, `V-143` (dataset canonico, serializzazioni sostituibili) | `OL-07`: l'attesa del materiale documentale costa zero **per progettazione**; `R-05` con impatto nullo sul progetto e indicatore sul cablaggio accidentale di un template |
| `V-11`, `V-115`, `V-156` (contenitore e suite negoziati a runtime, mai dichiarati) | Criterio 4 di `OL-03`; divieto esplicito di dichiarare un formato unico |
| `V-12` (nessuna soglia imposta dalla normativa) | Nessun valore di prestazione o di livello di servizio è proposto in quest'area; `Q-184` chiede il coordinamento, non i numeri |
| `V-110`, `V-126`, `V-130` (rappresentazioni dell'errore, esiti come valori di dominio) | Nessuna voce di coda introduce una terza forma di errore né confonde esito ed errore |
| `V-120` (intervalli di identificativi congelati) | Le sigle `OL-*`, `DS-*`, `R-*` sono dichiarate **designazioni di pianificazione** e non identificativi di requisito; l'apertura di una voce produce identificativi nuovi secondo la procedura di `07-fuori-perimetro.md` §7 |
| `V-121`…`V-125`, `V-146`, `V-148` (telemonitoraggio, consenso, copertura) | Criteri di completamento di `OL-01` e `OL-02` scritti direttamente su di essi |
| `V-133` (formule di conformità vietate) | Criterio 2 di `OL-09`; nessuna dichiarazione di conformità senza prova reale |
| `V-140`, `V-145`, `V-147` (macchina a stati per prestazione, setting che discrimina) | Criteri di `OL-04` e `OL-05` |
| `V-144` (formulazione della destinazione d'uso del telemonitoraggio) | Nessuna occorrenza di «monitoraggio in tempo reale» o formule equivalenti in tutta l'area; `OL-01` è condizionata a `Q-144` |
| `V-160`, `V-164` (perimetro del contratto pubblico; capacità raggiungibile da terzi) | Criteri di `OL-06` e `OL-10`; motivazione della decima posizione di `OL-10` |
| `V-161`, `V-135`, `V-166` (nessun contenuto clinico in uscita; pagatore amministrativo) | Criteri di `OL-06` e `OL-12` |
| `V-180`…`V-186` (posti dalla prima sessione) | Applicati senza eccezioni nei due file nuovi: nessuna data per voci `[IPOTESI]`, nessuna presentazione di intenzione come impegno |
| `V-190`, `V-191` (ambiente disconnesso; nessun aggiramento di un controllo) | Contromisure di `R-02` e di `R-09`; §3.2 di `05` sulla dipendenza «contributori» |

**Conflitti di numerazione**: nessuno. L'area ha usato esclusivamente `V-180`…`V-189` e
`Q-180`…`Q-189`, come da intervallo riservato. Nessuna voce altrui è stata rinumerata né
riscritta; le sole modifiche alla bacheca sono **aggiunte** in coda alle due tabelle.

## 8. Regole di mandato e loro verifica

| Regola | Verifica |
|---|---|
| Ogni voce pianificata ha un criterio che consente di dire «fatto» o «non fatto» senza discutere | `04` §4: ciascuna delle quattordici voci porta criteri binari numerati. `V-187` lo rende regola |
| Si dichiara ciò che non entra, e perché | `03` §4 (quattro categorie di esclusione); `04` §§4 e 5 (motivo dell'esclusione da `RU-1` per ogni voce, e che cosa manca per ogni desiderabile); `04` §7 (rinvio alle esclusioni definitive) |
| Niente stime inventate | Nessuna percentuale nel registro dei rischi: cinque classi con definizione operativa. Nessuna data per le voci di coda. Sei `[NV]` dichiarati al §6 con il destinatario |
| Distinzione fra impegno del progetto e impegno di chi installa | `00` §3; `03` §9 riga per riga; colonna «titolare» di ogni rischio; §1.4 di `05` sul limite del trasferimento |
| Nessun dato reale, nessun segreto, nessun nome commerciale (`R0`) | Nessun nome di azienda, marchio, prodotto o dominio in tutta l'area. Il rischio di dipendenza da un solo integratore (`R-10`, `05` §4) è descritto **strutturalmente** — cinque passi, tre effetti, sei contromisure — e la regola redazionale è ribadita nel testo al §4.4 |
| Frontmatter con valori contenenti due punti seguiti da spazio racchiusi fra virgolette | Evitato alla radice: nessuna descrizione dei due file nuovi contiene la sequenza; si usano trattini lunghi |
| Rinvii ai file alla radice del repository come URL assoluti | `05`, avvertenza finale: `NOT-A-MEDICAL-DEVICE.md` e `DISTRIBUTION-POLICY.md` citati con indirizzo assoluto verso il repository |

## 9. Note per chi riprenderà quest'area

1. **L'area è completa** nei sei file previsti dall'indice. Restano da fare, e non sono di
   quest'area: la traduzione inglese integrale (`i18n/en/docs/09_roadmap/`, obbligo `D50`), e la
   verifica dei collegamenti interni prima del primo deploy (controllo `G9`, bloccante per
   `D52`).
2. **Un collegamento è deliberatamente non attivo**: i rinvii a
   `docs/08_compliance/05-gestione-del-rischio.md` sono scritti come testo e non come
   collegamento, perché l'area di conformità era assente al momento della stesura. **Vanno
   trasformati in collegamenti quando l'area esiste**, ed è un'attività da mettere in conto nella
   chiusura di `T-02`.
3. **La revisione mensile è una procedura, non un'intenzione**: è descritta in `00` §8 e in `05`
   §5, e la prima è dovuta entro settembre 2026. Una roadmap che salta la prima revisione perde
   la sola proprietà che la rende diversa da un annuncio.
4. **Se `Q-181` viene chiusa**, l'intero capitolo `02` va ricalcolato con la regola di `01` §10 e
   non riscritto: la sequenza è la parte robusta del piano, le date sono la parte derivata.
5. **Se `Q-180` viene chiusa su un'opzione diversa dalla prima**, cambiano `02` §4 e `04` §3, e
   `05` va rivisto su `R-03` e `R-16`, che sono i rischi che l'opzione 2 aggrava.
