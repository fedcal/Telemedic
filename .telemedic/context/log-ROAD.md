# log-ROAD - Area roadmap

> Registro del lavoro dell'agente `ROAD`. Contiene: file prodotti con conteggi, voci di bacheca
> risolte e aperte, vincoli posti, dichiarazioni `[NV]`, e le verifiche di non contraddizione
> rispetto ai vincoli altrui.
>
> **Nota di continuità.** L'area è stata prodotta in **due sessioni**. La prima ha consegnato i
> file `00`-`03` e si è interrotta per esaurimento di sessione senza scrivere questo registro. La
> seconda ha consegnato `04` e `05`, ha registrato in bacheca l'intero blocco di voci dell'area
> (`V-180`…`V-189`, `Q-180`…`Q-189`) e ha scritto questo registro **per entrambe**. I file
> `00`-`03` non sono stati modificati dalla seconda sessione.

## 1. File prodotti

| File | Righe non vuote | Parole (stima) | Contenuto |
|---|---|---|---|
| `docs/09_roadmap/00-indice.md` | 292 | ~3.500 | orientamento; **tre classi di enunciato** (`[IMPEGNO]` / `[INTENZIONE]` / `[IPOTESI]`); distinzione fra impegno del progetto, di chi installa e di chi certifica; stato di fatto misurato al 25 agosto 2026; procedura di aggiornamento con inneschi di revisione fuori cadenza; risoluzione di `Q-09`; sette vincoli e sette questioni |
| `docs/09_roadmap/01-principi-e-metodo.md` | 394 | ~4.700 | quattro classi di attività (`A` irrecuperabile, `B` tempo di terzi, `C` percorso critico altrui, `D` comprimibile); criteri di priorità in **ordine lessicografico** senza pesi; il costo che non si vede; le cinque attività di classe `A` una per una; come si dice di no; **debito tecnico** e **debito regolatorio** con il debito già in essere dichiarato; capacità netta; le tre ipotesi `H1`/`H2`/`H3`; definizione di «fatto» |
| `docs/09_roadmap/02-traguardi.md` | 516 | ~6.200 | `T-01`…`T-08` fino al 30 novembre 2026 con criteri **binari**, dipendenze, esclusioni e rischi; l'aritmetica del 30 novembre e le **tre opzioni** di riformulazione; `T-10`…`T-13` oltre la data; **traguardi di terzi** riportati con la fonte e mai come impegno; otto punti di decisione irreversibili; diagramma di Gantt; ciò che non è datato e perché |
| `docs/09_roadmap/03-primo-rilascio-utilizzabile.md` | 379 | ~4.500 | perimetro esatto di `RU-1`; il limite non rimovibile per configurazione; criterio del **percorso verticale più stretto**; contenuto per contesto delimitato; **quattro categorie di esclusione** con conseguenze diverse; presupposti di installazione; quattordici limiti dichiarati; **diciotto criteri di rilascio bloccanti**; procedura di verifica lato deployer; impegno del progetto contro impegno di chi installa, riga per riga |
| `docs/09_roadmap/04-oltre-il-primo-rilascio.md` | 612 | ~7.000 | partizione **pianificato / desiderabile** con la regola che la governa (`V-187`); criteri di ordinamento della coda e le tre regole aggiuntive; regola del sorpasso; **quattordici voci pianificate `OL-01`…`OL-14`** con motivo dell'esclusione da `RU-1`, criteri di completamento binari, innesco e titolare; **sette voci desiderabili `DS-01`…`DS-07`** con che cosa manca perché diventino pianificate; rinvio alle esclusioni definitive; transizioni di categoria; che cosa il capitolo non promette |
| `docs/09_roadmap/05-rischi-e-dipendenze.md` | 667 | ~7.600 | confine con la gestione del rischio clinico; scale di **probabilità** (cinque classi operative, nessuna percentuale) e di **impatto sul calendario** (`I1`…`I5`); quattro risposte ammesse con il limite sul trasferimento; **registro di ventisette rischi `R-01`…`R-27`** in sei gruppi, ciascuno con probabilità, impatto, indicatore anticipatore, risposta e titolare; **sette famiglie di dipendenze esterne** con la regola comune del punto di estensione e della modalità degradata provata; **rischio di dipendenza da un solo integratore** descritto strutturalmente in cinque passi con sei contromisure verificabili; procedura di sorveglianza; che cosa non è nel registro; bacheca |
| **Totale area** | **2.860** | **~33.500** | - |
| **Sottototale seconda sessione** (`04` + `05`) | **1.279** | **~14.600** | requisito di mandato per i due file: ≥ 7.000 parole - **soddisfatto con ampio margine** |

**Metodo di conteggio.** I conteggi di riga sono esatti (righe non vuote, misurate con ricerca su
espressione regolare). I conteggi di parola sono **stime** ricavate dalle righe non vuote e dalla
densità media del testo: nell'ambiente di redazione non è disponibile uno strumento di conteggio.
Sono dichiarati come stime e non come misure - coerentemente con l'`[NV]` che l'area stessa pone
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
| `Q-181` | → **ORCH** | **Dichiarazione della capacità** - la variabile senza la quale nessuna data è calcolabile | 15 settembre 2026 |
| `Q-182` | → **ORCH** | Modello di produzione della versione inglese integrale | 30 settembre 2026 |
| `Q-183` | `COMP` | Evidenze del pacchetto regolatorio consegnabili al 30 novembre 2026 | - |
| `Q-184` | `SEC`, `ARCH` | Capacità di misura come requisito del primo rilascio; valori prima del primo esercizio | Prima dell'esercizio |
| `Q-185` | `PROD`, → **ORCH** | Materiale pubblico non allineato a `D19` e `D29`; l'impatto è **irrecuperabile** | 31 ottobre 2026 |
| `Q-186` | `COMP`, `TECH` | Periodo di supporto dichiarato; prerequisito della prima distribuzione | Prima della prima distribuzione |
| `Q-187` | → **ORCH** | Concentrazione ammessa su un solo integratore e momento della seconda controparte di prova | Prima del secondo integratore |
| `Q-188` | `COMP`, → **ORCH** | Riserva dichiarata per le voci non stimabili; chi la mette a bilancio | - |
| `Q-189` | → **ORCH** | Continuità dei contributori e registrazioni a **ruoli distinti** non producibili internamente | Prima del primo audit interno |

**`Q-180`, `Q-181` e `Q-182` non sono separabili**: sono una sola decisione in tre parti, perché
la risposta alla prima dipende dalle altre due.

## 5. Questioni altrui evase o contribuite

| # | Da | Stato dopo l'intervento di `ROAD` | Dove |
|---|---|---|---|
| `Q-09` | `ORCH` → `ROAD` | **RISOLTA.** Non si parametrizza una data: si smette di dichiarare date e si dichiara la **disponibilità delle evidenze**. Tre elementi verificabili; formulazione ammessa che sostituisce ogni data. Posta come `V-186` | `00` §9.1 |
| `Q-113` | `TECH` → `COMP`, `ROAD` | **Parte `ROAD` evasa, resta aperta verso `COMP`.** Confermata la forma (giorni per gravità, misurata), **non fissati i numeri**, che appartengono al piano di sorveglianza post-commercializzazione. Aggiunta la conseguenza di pianificazione: è **capacità ricorrente**, da sottrarre prima di calcolare qualunque data. Posta come `V-185`; quantificazione in `05` §2, rischio `R-12` | `00` §9.2 |
| `Q-152` / `B-6` | `SEC` → `ARCH`, `ROAD` | **Parte `ROAD` dichiarata.** Nessun valore proposto - sarebbe il difetto che `V-12` vieta. Dichiarati: **quando** serve la soglia (prima del primo esercizio con un tenant reale, non prima del primo rilascio), che cosa la roadmap chiede in cambio (**capacità di misura** come requisito di `RU-1`), e che cosa resta a `SEC` e ad `ARCH`. Coordinamento temporale aperto come `Q-184` | `00` §9.3; `03` §3.1 |
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
| Nessun dato reale, nessun segreto, nessun nome commerciale (`R0`) | Nessun nome di azienda, marchio, prodotto o dominio in tutta l'area. Il rischio di dipendenza da un solo integratore (`R-10`, `05` §4) è descritto **strutturalmente** - cinque passi, tre effetti, sei contromisure - e la regola redazionale è ribadita nel testo al §4.4 |
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

---

# Terza sessione - rilavorazione dopo `D53`…`D58` (25 agosto 2026)

> **Il committente ha deciso.** L'area non è stata riscritta da zero: è stata **rilavorata** sulle
> decisioni prese. Le questioni `Q-180`, `Q-181`, `Q-182` e `Q-144` sono chiuse e **non sono state
> riaperte**; l'alternativa che l'orchestrazione aveva raccomandato su `Q-180` **non è stata
> riproposta in alcuna forma**, e nessun testo dell'area contiene avvertenze che rimettano in
> discussione `D53`.

## 10. Le decisioni recepite

| # | Decisione | Effetto sull'area |
|---|---|---|
| `D53` | Il 30 novembre 2026 resta il **primo rilascio installabile** | `T-10` datato e `[IMPEGNO]`; ambito ridotto; nuova sezione `03` §5 sui tagli e `03` §6 sull'ordine di sacrificio |
| `D54` | **Contributore unico, a tempo parziale** | `H1`/`H2`/`H3` decadute; `R-01` **chiuso**; nuovi `R-28` e `R-29`; nuovo `V-281`; nuovo §9-bis di `01` |
| `D55` | Destinazione d'uso del telemonitoraggio congelata sulla **raccolta differita** | Attività di classe `A` n. 5 di `01` §5.1 marcata **soddisfatta**; `OL-01` non è più lavoro a rischio di riscrittura; divieto permanente propagato in `03` §4.1 e `04` §§4 e 7 |
| `D56` | Traduzione **assistita area per area** con controllo di divergenza; **emenda `D52`** | `T-06` ridotto alle aree prerequisito, resto in `T-09`; `T-03` criterio 3 differenzia il controllo fra bloccante e segnalante; `R-03` da `I4` a `I3`; `V-183` emendato in bacheca |
| `D57` | La roadmap è **pianificazione interna del progetto** | Eliminata ogni attribuzione a «terzi» e a «chi certifica»; `T-13` rientra nella roadmap interna; `V-180` riformulato da `V-280` |
| `D58` | Il **ruolo di fabbricante sarà assunto dal progetto**, soggetto da costituire | Nuovo traguardo `T-14` (classe `B`, 19 settembre 2026); nuovo rischio `R-30`; `R-06` e `R-07` diventano rischi del progetto con impatto ricalcolato; nuova questione `Q-280`; `01` §5.2 riscritto da «attività che il progetto non assume» ad «attività che il progetto assume» |

**Che cosa non è stato attenuato, ed è verificabile sul testo.** In ogni capitolo compare, con la
stessa evidenza di prima, che **oggi il prodotto non reca marcatura CE**, non è coperto da alcuna
dichiarazione di conformità, non è utilizzabile su pazienti reali, e che **chi installa, integra o
mette in servizio assume comunque gli obblighi che ne derivano**. **In nessun punto dell'area si
scrive che il prodotto sarà marcato entro una data** (`V-171`): la verifica è testuale ed è stata
eseguita su tutti e sei i file.

## 11. La riduzione di ambito, e come è stata resa leggibile

Il nucleo del lavoro è `03` §5, che non esisteva. Contiene **ventitré tagli** con designazione
`TG-nn`, ciascuno con: che cos'era, perché è uscito, **se è reversibile**, che cosa comporta per chi
installa.

| Categoria | Voci | Nota |
|---|---|---|
| **Reversibili** | `TG-01`…`TG-19` | Diciannove. Rientrano in coda in `04` come `OL-15`…`OL-20` |
| **Irreversibili** | `TG-20`…`TG-23` | Quattro, trattate una per una in prosa distesa e marcate in modo non equivocabile |

I quattro irreversibili, che sono l'informazione centrale dell'intero documento:

1. **`TG-20` - registrazioni a ruoli distinti** (riesame del rilascio, audit interno, verifica di
   configurazione indipendente). Irreversibile perché una registrazione datata a un periodo non si
   produce dopo. Discende direttamente da `D54`. → `R-29`, `Q-189`, `OL-22`.
2. **`TG-21` - revisione esterna indipendente del codice di sicurezza critico** (`D18`).
   **Irreversibile per il periodo**: recuperabile come attività, non come stato del rilascio.
3. **`TG-22` - valutazione formativa di usabilità** durante lo sviluppo. Irreversibile perché è
   contemporanea per definizione alle decisioni che valuta. Nota redazionale applicata: la verifica
   manuale con tecnologia assistiva che `T-08` criterio 7 richiede **non va chiamata valutazione
   formativa**, e il testo lo dice tre volte in tre file.
4. **`TG-23` - ancoraggio periodico firmato del registro immutabile**. **Irreversibile per il
   periodo**. La **copertura** del registro non è stata toccata: è nell'elenco del debito vietato.

**Che cosa non si è potuto tagliare** è al §5.4 di `03`, ed è la metà mancante dell'informazione:
copertura del registro degli accessi, verifica delle chiavi, avviso di qualità, consenso, isolamento
fra tenant, assenza di contenuto clinico nelle uscite, convivenza di due versioni sulla stessa base
dati, e i diciotto criteri di rilascio bloccanti in blocco.

**L'ordine di sacrificio** (`03` §6) è la novità di metodo: sette righe `S-1`…`S-7`, eseguibili
dall'alto, **solo tagli reversibili**, ogni esecuzione registrata. È il margine del piano, dato che
il piano non ha margine di tempo, ed è la contromisura primaria di `R-28`.

## 12. I traguardi ricostruiti

Nove traguardi fino al 30 novembre 2026, ciascuno con **criterio binario, innesco e titolare**.

| # | Traguardo | Classe | Data | Titolare |
|---|---|:-:|---|---|
| `T-01` | Artefatti retroattivamente irrecuperabili in esercizio | `A` | 12 set. 2026 | Contributore unico |
| `T-14` | **Percorso di fabbricante avviato** (nuovo, `D58`) | `B` | 19 set. 2026 | Committente |
| `T-03` | Catena di costruzione **minima bloccante** | `A` | 26 set. 2026 | Contributore unico |
| `T-07` | Sito: controlli bloccanti attivi e verifica registrata | `D` | 26 set. 2026 | Contributore unico |
| `T-04` | Verifiche empiriche **ridotte al perimetro effettivo** | `C` | 3 ott. 2026 | Contributore unico |
| `T-05` | Decisioni con scadenza anteriore al codice | `C` | 3 ott. 2026 | Committente |
| `T-02` | Corpo documentale **al minimo prerequisito** | `D` | 10 ott. 2026 | Contributore unico |
| `T-08` | Scheletro e percorso verticale **ridotto** | `D` | 14 nov. 2026 | Contributore unico |
| `T-06` | Traduzione delle **sole aree prerequisito** | `D` | 21 nov. 2026 | Contributore unico |
| `T-10` | **`RU-1`, primo rilascio installabile** | `D` | **30 nov. 2026** | Contributore unico; **riesame senza titolare interno** |

`T-09` è nuovo (traduzione integrale residua, 2027). `T-11`, `T-12` e `T-13` restano, con `T-13`
riportato **dentro** la roadmap interna ai sensi di `D57`.

**Nota di metodo sulle date.** Non sono stime e il documento lo dichiara: `[NV]` - «a tempo
parziale» non è quantificato, e nessuna cifra è stata inventata. Sono **allocazioni del calendario
residuo** a una sequenza vincolata, e ciò che protegge la data è l'ordine di sacrificio, non una
previsione di sforzo (`01` §4.1, `V-282`).

## 13. Il registro dei rischi

Da ventisette a **trenta voci**, con una chiusa.

| Voce | Variazione |
|---|---|
| `R-01` | **CHIUSO** da `D54`, con dichiarazione di ciò che **non** si chiude con esso |
| `R-02` | Riformulato: da `Alta` ad **`Accertato`**, e ridotto alla sola **continuità**; la parte sui ruoli distinti è estratta in `R-29` |
| `R-28` | **NUOVO - rischio dominante.** Data pubblica ravvicinata con capacità dichiarata bassa. `Alta` / `I4`. Indicatore anticipatore misurabile ogni settimana: **righe residue dell'ordine di sacrificio** |
| `R-29` | **NUOVO.** Registrazioni a ruoli distinti non producibili, con perdita **che si ripete a ogni rilascio**. `Accertato` / `I5` |
| `R-30` | **NUOVO.** Ruolo di fabbricante non ancora costituito. `Accertato` / `I3 crescente`, di classe `B` |
| `R-03` | Da `I4` sul traguardo 2026 a `I3` sul piano 2027, per effetto di `D56` |
| `R-06`, `R-07` | Titolare da «chi certifica» a **progetto**; impatto da `I0`/indiretto a `I3` sul nostro piano |
| `R-22` | Esteso alla persona responsabile del rispetto della normativa; **non è più ammesso trasferire con dichiarazione** |
| `R-17` | Quattro decisioni su sette chiuse; due nuove entrate (`Q-280`, `Q-281`) |
| `R-19`, `R-23`, `R-25`, `R-27`, `R-20`, `R-15` | Riformulati sull'effetto della riduzione di ambito, dichiarando dove il rischio **è già materializzato** in un taglio |
| `R-24`, `R-10` | Riformulati: sotto `D53` una deviazione **non ritarda, riduce**; sotto `D54` l'indicatore di `R-10` non può più dipendere dalla revisione fra pari e diventa automatico |

**Nuova famiglia di dipendenze** in `05` §3: *funzioni che richiedono un soggetto distinto*, ed è
**l'unica famiglia senza modalità degradata**. Il §3.1 lo dichiara senza attenuazioni: non esiste una
versione degradata di un riesame.

## 14. Voci di bacheca aperte da questa sessione

L'intervallo `V-180`…`V-189` e `Q-180`…`Q-189` era esaurito: si è proseguito a `V-280`/`Q-280` come
previsto. **Nessuna voce altrui è stata rinumerata o riscritta.**

| # | A | Oggetto | Punto di decisione |
|---|---|---|---|
| `V-280` | tutte | La roadmap è pianificazione interna (`D57`, `D58`); una data interna **non è una promessa di esito** | - |
| `V-281` | tutte, `COMP` | Nessun traguardo entra nel piano se richiede due soggetti distinti e il secondo non esiste | - |
| `V-282` | tutte | L'ambito è l'unica variabile libera; ordine di sacrificio di soli tagli reversibili; se si esaurisce, data dichiarata mancata | - |
| `Q-280` | → **ORCH** | Costituzione del soggetto fabbricante e persona responsabile del rispetto della normativa | **19 set. 2026** |
| `Q-281` | `PROD`, → **ORCH** | Differenza fra ciò che il materiale pubblico dichiara e ciò che `RU-1` consegna | 31 ott. 2026 |
| `Q-282` | `COMP` | **Forma** della dichiarazione delle lacune datate nel fascicolo (`Q-189` decide la ripartizione) | Prima di `T-10` |

**Voci altrui aggiornate, non riscritte**: `V-183` (emendato da `D56`, con nota in coda alla riga);
`Q-189` (stato arricchito con punto di decisione, esito predefinito e rinvii a `R-29`, `TG-20`,
`OL-22`).

## 15. Verifiche di mandato eseguite

| Regola | Verifica |
|---|---|
| Non rilitigare `D53` | Nessuna occorrenza dell'alternativa «fondamenta e documentazione» in alcun file; nessun avvertimento che metta in discussione la data. `02` §2.2 espone la **conseguenza** - l'ambito è l'unica variabile libera - e non l'alternativa |
| Ogni traguardo ha criterio binario, innesco e titolare | Tutti e quattordici i traguardi di `02` portano i tre campi. Dove il titolare non esiste è scritto che non esiste (`T-10`, riesame) |
| Niente stime inventate | `[NV]` esplicito sulle ore settimanali; le durate sono dichiarate **allocazioni** e non stime; nessuna cifra nuova introdotta; la durata di `T-14` criterio 1 è dichiarata non stimabile |
| Tagli irreversibili marcati come tali | Quattro voci in `03` §5.3, ciascuna con intestazione **IRREVERSIBILE** o **IRREVERSIBILE PER IL PERIODO**, riquadro d'apertura del §5.3, riga in `02` §4.2, limiti 2, 12, 23 e 24 in `03` §9, criterio bloccante 17 |
| Ripartizione lasciata aperta in `Q-189` | Dichiarata aperta in `01` §9-bis, `02` §2.3, `03` §5.3, `04` `OL-22`, `05` `R-29`, `00` §10 - con l'**esito predefinito** dichiarato in anticipo |
| `R0` | Nessun nome di azienda, marchio, prodotto o dominio. `R-10` descritto strutturalmente |
| Frontmatter | Nessuna descrizione contiene la sequenza due punti più spazio: si usano trattini lunghi |
| URL assoluti per i file alla radice | `NOT-A-MEDICAL-DEVICE.md` e `DISTRIBUTION-POLICY.md` citati con indirizzo assoluto in `00` e in `05` |
| Voci `OL-nn` e `DS-nn` nella forma già adottata | `OL-01`…`OL-14` e `DS-01`…`DS-07` conservati; aggiunti `OL-15`…`OL-22`. **Nessuna rinumerazione**: `04` §1.1 dichiara esplicitamente che il numero non è la posizione in coda |

## 16. Note per chi riprenderà quest'area

1. **`03` §5 e §6 sono il cuore dell'area**: se l'ambito cambia ancora, si aggiornano quelli e poi si
   propaga. Un taglio nuovo entra come `TG-24` e va classificato **prima** di essere eseguito.
2. **Ogni esecuzione di una riga dell'ordine di sacrificio è un innesco di revisione fuori cadenza**
   (`00` §8.2) e va registrata con data e causa. È il punto in cui l'area si degrada per prima se la
   disciplina cede.
3. **Dal 19 ottobre 2026 la revisione è settimanale**, con due soli numeri: righe residue
   dell'ordine di sacrificio e criteri bloccanti soddisfatti.
4. **La conclusione di `04` §6 si è capovolta** rispetto alla versione precedente: dopo i tagli,
   dodici voci di coda su ventidue dipendono soltanto dalla capacità, quindi **aumentare la capacità
   ora accorcia la coda**. Se la capacità cambia, quella osservazione va rifatta e non copiata.
5. **`Q-280` è la voce con il rapporto più alto fra costo in ore e costo in mesi** di tutta l'area:
   se una sola decisione va sollecitata, è quella.
6. Restano da fare, e non sono di quest'area: la traduzione inglese dell'area
   (`i18n/en/docs/09_roadmap/`), e il riallineamento a `D58` delle avvertenze pubbliche e dei
   capitoli `00`, `02`, `03` e `04` dell'area di conformità, che `T-01` criterio 8 rende bloccante.
