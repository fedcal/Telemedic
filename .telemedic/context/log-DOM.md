# Log DOM - Area 05 «Il dominio sanitario»

**Agente**: `DOM`
**Mandato**: modellazione del dominio sanitario - come il dominio reale diventa modello.
**Deliverable**: `docs/05_domain/`, dieci file.
**Data**: 25 agosto 2026
**Stato**: completato.

---

## 1. File prodotti e conteggi

| File | Righe non vuote | Diagrammi Mermaid | `DM-*` | `[NV]` |
|---|---:|---:|---:|---:|
| `docs/05_domain/00-indice.md` | 103 | 0 | 0 | 1 |
| `docs/05_domain/01-linguaggio-ubiquo.md` | 365 | 0 | 6 | 1 |
| `docs/05_domain/02-le-prestazioni-modellate.md` | 772 | 8 | 19 | 1 |
| `docs/05_domain/03-assistito-professionista-organizzazione.md` | 431 | 2 | 13 | 2 |
| `docs/05_domain/04-documenti-clinici.md` | 491 | 3 | 9 | 2 |
| `docs/05_domain/05-parametri-e-osservazioni.md` | 440 | 1 | 17 | 1 |
| `docs/05_domain/06-consenso-e-riservatezza.md` | 418 | 4 | 8 | 4 |
| `docs/05_domain/07-terminologie-nel-dominio.md` | 321 | 1 | 12 | 5 |
| `docs/05_domain/08-percorsi-e-piani-di-cura.md` | 315 | 2 | 11 | 1 |
| `docs/05_domain/09-glossario-del-dominio.md` | 399 | 0 | 1 | 1 |
| **Totale** | **4.055** | **21** | **96 occorrenze** | **19** |

### Stima delle parole

| Grandezza | Valore |
|---|---|
| Righe non vuote | 4.055 |
| **Parole (stima)** | **≈ 45.000–50.000** |
| Requisito di mandato | ≥ 25.000 parole - **soddisfatto con ampio margine** |

> **Nota sul conteggio.** La shell non è disponibile in questa sessione e `Grep` in modalità
> `count` restituisce righe con corrispondenza, non parole. La stima è ricavata da righe non
> vuote per densità media differenziata (prosa a capo intorno ai 95 caratteri, righe di tabella
> più dense, righe Mermaid più rade). **Da verificare con `wc -w` alla prima occasione utile.**
> Anche assumendo la densità più conservativa (8 parole per riga) il totale supera 32.000 parole.

### Struttura per capitolo

| # | Capitolo | Contenuto decisionale |
|---|---|---|
| 00 | Indice | Marcature `[NORM]`/`[BASE]`/`[MOD]`/`[NV]`, sette vincoli trasversali, **dodici errori di modellazione** che l'area esiste per impedire, percorsi di lettura |
| 01 | Linguaggio ubiquo | Regola di precedenza a quattro livelli, tre incarnazioni del linguaggio, termini normativi, termini operativi dichiarati, **quattordici coppie di falsi sinonimi**, **dodici collisioni**, cinque prove eseguibili |
| 02 | Le prestazioni modellate | Famiglia di macchine a stati, quadro sinottico, televisita, teleconsulto nelle due forme, teleconsulenza, teleassistenza, telemonitoraggio con **tre macchine a stati**, nozioni di confine, sessione media, sala d'attesa, emergenza, mappatura sullo standard, catalogo |
| 03 | Soggetti | Il ruolo come relazione, anagrafica per riferimento, professionista, organizzazioni, **forma canonica della relazione**, relazione di cura materializzata, bitemporalità, deleghe e rappresentanza, esclusioni strutturali, sei eventi anagrafici |
| 04 | Documenti clinici | Contenuto contro documento, dieci tipologie nazionali, **quattro soggetti distinti**, ciclo di vita, immutabilità e catena di rettifica, **dataset canonico a tre livelli**, set informativo del referto, il campo che manca, oscuramento, **non conservazione**, matrice di visibilità |
| 05 | Parametri e osservazioni | Contesto obbligatorio a quindici attributi, identità e correzione, unità, provenienza, **tre tempi**, **il dato mancante come entità**, serie temporali, valutazione delle soglie, questionari e punteggi, **contratto di ingestione** |
| 06 | Consenso e riservatezza | **Cinque oggetti distinti**, forma canonica dell'evidenza, informativa versionata, ciclo di vita e revoca, consenso per conto di terzi, **sei canali di inferenza dell'oscuramento**, registrazione, accesso d'emergenza, minimizzazione, composizione delle regole di accesso |
| 07 | Terminologie | Mappa concetto → sistema → regime, anatomia del concetto codificato, **tre stringhe distinte**, codice non risolvibile, gateway, SNOMED CT, **comportamento senza terminology server con costo dichiarato**, casi particolari, glossario nazionale, scale |
| 08 | Percorsi e piani | Modello contro istanza, cinque contenitori distinti, sette proprietà della definizione, **confine del motore**, presa in carico, team, copertura oraria, aderenza, esiti, **verifica procedurale della configurabilità** |
| 09 | Glossario | ~150 voci italiano/inglese con natura della definizione e rinvii, indice inverso, diciotto sigle, **undici termini da non usare**, collisioni presidiate, regole di manutenzione |

---

## 2. Identificativi introdotti

Quest'area introduce il prefisso **`DM-nn`** (*decisione di modellazione*), scelto per **non
collidere** con gli identificativi congelati `RF-*`, `RNF-*` e `BR-*` di `R6`, che `D45` vieta di
rinumerare o risignificare. Nessun identificativo esistente è stato riusato, spostato di
significato o rinumerato.

| Intervallo | Capitolo | Numero di decisioni |
|---|---|---|
| `DM-01` … `DM-06` | 01 - Linguaggio ubiquo | 6 |
| `DM-10` … `DM-25` | 02 - Prestazioni | 16 |
| `DM-30` … `DM-39` | 03 - Soggetti | 10 |
| `DM-40` … `DM-48` | 04 - Documenti | 9 |
| `DM-50` … `DM-66` | 05 - Parametri | 17 |
| `DM-70` … `DM-77` | 06 - Consenso | 8 |
| `DM-80` … `DM-87` | 07 - Terminologie | 8 |
| `DM-90` … `DM-100` | 08 - Percorsi | 11 |

Gli intervalli hanno lacune volute, per consentire inserimenti senza rinumerare.

---

## 3. Bacheca inter-agenti - aggiornamenti

### 3.1 Vincoli posti (`V-140` … `V-149`, intervallo assegnato a `DOM`)

| # | A | Sintesi |
|---|---|---|
| `V-140` | tutte | Ogni prestazione è la propria macchina a stati; attori, artefatti, esiti e finestre sono **attributi del catalogo**, non condizioni nel codice |
| `V-141` | tutte | **Stato ed esito del contatto sono distinti**: `EX-NOSHOW` ed `EX-TECH-PATIENT` condividono lo stato terminale e hanno effetti opposti |
| `V-142` | `ARCH`, `TECH`, `INTEG`, `PROTO` | **Normalizzazione degli identificatori solo al confine**; nessun identificatore esterno è chiave primaria |
| `V-143` | tutte | Il **referto di televisita ha una tipologia documentale propria**; l'ipotesi «referto di specialistica ambulatoriale» è errata |
| `V-144` | tutte | Il modello del telemonitoraggio è scritto su «**raccolta differita**»; vietate le formule «tempo reale» e «sorveglianza continua» |
| `V-145` | `FUNZ`, `INTEG`, `COMP`, `PROD` | **Il setting discrimina regole**: televisita del medico di assistenza primaria → annotazione, non referto; nessuna prescrizione |
| `V-146` | `SEC`, `FUNZ`, `INTEG` | **Cinque oggetti di consenso** con cicli di vita indipendenti; nessun «consenso alla piattaforma» |
| `V-147` | `ARCH`, `TECH`, `FUNZ` | **Nessun percorso di cura nel codice**: aggiungerne uno non richiede un rilascio né una migrazione |
| `V-148` | tutte | **L'attesa di rilevazione è un'entità**: l'assenza di misura è una riga che la dichiara |
| `V-149` | `ARCH`, `SEC`, `TECH` | **L'oscuramento è applicato dal motore di autorizzazione**; sei canali di inferenza da chiudere; dati sintetici con documenti oscurati |

### 3.2 Questioni evase

| # | Da | Esito |
|---|---|---|
| `Q-131` | `PROTO` → `DOM`, `COMP` | **Parte `DOM` evasa.** Proposta di `PROTO` **accolta integralmente** e recepita in `DM-44` con mappatura a quattro righe: parametri descrittivi della procedura (sede primaria), modalità di esecuzione, strumentazione utilizzata, altra figura tecnica. Vincolo di `PROTO` accolto e rafforzato: valore **misurato dal sistema e confermato dal professionista**, in forma strutturata e ripetibile. **Resta a `COMP`** l'ADR e la verifica di conformità |
| `Q-132` | `PROTO` → `COMP`, `DOM` | **Nota `DOM`, resta aperta.** Non eseguibile in quest'area (il profilo non è stato letto). `DOM` fornisce il lato di riferimento: il **dataset canonico** modellato campo per campo sul set informativo. La verifica va condotta **fra dataset canonico e profilo**, non fra dominio e profilo - applicazione letterale di `V-07`. Segnalati i due campi che il tracciato non prevede |

### 3.3 Questioni aperte (`Q-140` … `Q-147`)

| # | A | Sintesi |
|---|---|---|
| `Q-140` | `ARCH` | **Modalità a non conservazione** del contenuto clinico e **tassonomia a sei regimi** di conservazione: serve un ADR |
| `Q-141` | `FUNZ` | **Sei entità di dominio** attendono identificativi di requisito da congelare; si salda con `Q-12` |
| `Q-142` | `COMP` | Confermare che l'**esecuzione locale di logica clinica** è fuori perimetro; si salda con `Q-01` |
| `Q-143` | `ARCH`, `INTEG` | Le **due proiezioni del piano di telemonitoraggio** vanno generate dalla stessa fonte: dove vive la generazione e come si verifica la corrispondenza |
| `Q-144` | **→ ORCH** | **Congelamento della destinazione d'uso del telemonitoraggio** su «raccolta differita» (`D46`): decisione del committente |
| `Q-145` | **→ ORCH** | **Sei rinunce deliberate** a capacità tecniche disponibili: conferma come scelta di prodotto e recepimento nella destinazione d'uso |
| `Q-146` | `COMP` | **Allineamento al glossario nazionale** v. 1.0.0 del 29 gennaio 2026, prima del congelamento e della traduzione |
| `Q-147` | `FUNZ`, `PROD` | Il catalogo porta **due attributi tassonomici**; il vincolo professionale si applica all'attività, non al servizio minimo |

### 3.4 Contributi a questioni di altre aree, senza chiuderle

| # | Titolare | Contributo di `DOM` |
|---|---|---|
| `Q-02` | `ARCH` | `DM-24`: proposta a tre livelli - nomenclatore nazionale incluso in regime `B`, cataloghi regionali **riferiti dal tenant**, attributi di dominio applicati per sovrapposizione. Il tracciato ministeriale conferma la coesistenza dei due livelli di codice |
| `Q-03` | `ARCH` | `DM-81`: **tre stringhe distinte** - display ufficiale, testo originale, etichetta di interfaccia - con la ragione di licenza. `DOM` stabilisce *che cosa* separare, non *come* |
| `Q-06` | `ARCH`, `TECH` | `DM-31` e `V-142`: la normalizzazione avviene al confine; il dominio non conosce URI concorrenti. Compatibile con la forma tecnica già fissata da `TECH` e con la raccomandazione di `PROTO` |
| `Q-11` | `COMP`, `ARCH` | `DM-65`, `DM-87`: motore separato dalle definizioni; i quattro regimi si applicano **identicamente** a scale e questionari; sistema pienamente funzionale senza alcuna scala di terzi |
| `Q-12` | `FUNZ` | Quattro delle sei aree scoperte trovano forma modellata: piano versionato (`DM-21`), finestra di attesa (`DM-57`), sorveglianza del volume atteso (`DM-59`), tracciabilità del calcolo (`DM-63`). Escalation con fallimento dichiarato e copertura oraria modellate in `DM-96` e nella macchina a stati dell'allarme |
| `Q-14` | `PROD`, `FUNZ` | `DM-96`: la copertura è **entità del servizio**, il motore degli allarmi la conosce, la sua modifica è evento comunicato |
| `Q-01` | `COMP` | Perimetro reso operativo: § 8.4 del capitolo 05 (tre esclusioni), `DM-92` (il motore pianifica, non decide), `DM-99` (nessun esito clinico calcolato), § 13 del capitolo 04 (nessun campo di valutazione generato) |
| `Q-07` | `COMP` | Il capitolo 04 è costruito perché l'indisponibilità dei template **non blocchi la modellazione**: `V-07` reso operativo con la struttura a tre livelli di `DM-43` |

### 3.5 Verifica di non contraddizione dei vincoli altrui

| Vincolo | Esito |
|---|---|
| `V-01` … `V-09` (ORCH) | rispettati; `V-01`, `V-02`, `V-07`, `V-09` sono le architravi dei capitoli 02, 05 e 04 |
| `V-12` (GUIDA) | rispettato: nessuna soglia tecnica presentata come conformità; § 5.11 del capitolo 01 e § 6.4 del capitolo 04 lo enunciano espressamente |
| `V-151` (SEC) | **rispettato e recepito**: il capitolo 07 dichiara che il vincolo di sicurezza (nessuna cache persistita, nessun identificativo dell'assistito al servizio terminologico) **prevale** ed è più stringente del vincolo di licenza, di cui quest'ultimo è un sottoinsieme |
| `V-161`, `V-165` (INTEG/PROTO) | rispettati: nessun contenuto clinico nei messaggi in uscita |
| `V-163` (PROTO) | rispettato: «cifrato fino agli estremi» compare **sempre** con la condizione della modalità senza registrazione (capitoli 02 § 8.2 e 06 § 8.1) |
| `V-166` (PROTO) | rispettato e rafforzato: nessun template documentale cablato; il dataset canonico è la sede della conformità |
| `V-110` (TECH) | non toccato: l'area non definisce rappresentazioni dell'errore |

Nessun vincolo altrui risulta contraddetto.

---

## 4. Punti `[NV]` - non verificati, con destinatario

| # | Capitolo | Punto | A chi va chiesto | Che cosa cambia se la risposta è diversa |
|---|---|---|---|---|
| NV-01 | 00, 01, 09 | Contenuto puntuale del **Glossario nazionale di Telemedicina** AGENAS v. 1.0.0 del 29 gennaio 2026 | `COMP` (`Q-146`) | L'allineamento voce per voce del glossario; possibile rinomina di termini operativi che il glossario nazionale già definisce |
| NV-02 | 02 | Stato *draft* 0.2.0 delle guide di implementazione nazionali; **copertura campo per campo** fra set informativo e profili | `INTEG`, `COMP` (`Q-132`) | La proiezione verso lo standard; il modello interno resta invariato per costruzione |
| NV-03 | 03 | Divergenza degli **URI del codice fiscale** fra guide italiane | `ARCH`, `TECH` (`Q-06`) | Solo il valore di configurazione, per effetto di `V-142` |
| NV-04 | 03, 06 | Disciplina della **rappresentanza legale e del consenso per minori e incapaci** | `COMP` (`R6` § 11.1, voce Q9) | La regola di composizione delle manifestazioni di volontà; il modello ammette già più dichiaranti |
| NV-05 | 04 | **Template documentale, codici di tipologia e metadati di indicizzazione** delle dieci tipologie | `COMP` (`Q-07`) | Nulla nel dominio: la serializzazione è sostituibile per `V-07` |
| NV-06 | 04 | **Livello di firma** richiesto per il documento sanitario e **periodi di conservazione** per categoria | `COMP` (`R6` § 11.1, voci Q4 e Q6) | Solo valori di configurazione |
| NV-07 | 06 | **Ammissibilità e limiti della registrazione** e trattamento del frammento acquisito prima della revoca | `COMP` (`R6` § 11.2, voce Q15) | La regola sul frammento; il modello ammette entrambe le configurazioni |
| NV-08 | 06 | Disciplina operativa dell'**oscuramento** e categorie a tutela rafforzata nei risvolti pratici | `COMP` (`R6` § 11.1, voci Q5 e Q10) | L'insieme delle categorie e la propagazione dell'oscuramento |
| NV-09 | 05, 07, 08 | **Regime di licenza delle singole scale e questionari** clinici | `COMP` (`Q-11`) | Quali definizioni possono stare nel repository; nessuna oggi vi sta, e nessun valore soglia di alcuna scala compare in quest'area |
| NV-10 | 07 | Compatibilità del **servizio terminologico esterno** con il vincolo di sovranità | `SEC`, `ARCH` (`Q-04`, in parte già risolta da `SEC`) | Il punto di risoluzione e il contratto del gateway |
| NV-11 | 07 | Valori puntuali degli **insiemi di valori dedicati** agli identificatori delle popolazioni non iscritte | `ARCH` | La configurazione degli identificatori accettati |

**Nessun punto `[NV]` è stato usato per mascherare un'invenzione**: dove la fonte non è stata
letta, il capitolo dichiara che non lo è stata e indica a chi chiedere.

---

## 5. Conformità redazionale

- [x] Frontmatter YAML con `title`, `sidebar_position`, `description` su tutti e dieci i file
- [x] Italiano con accenti e diacritici corretti
- [x] Prosa tecnica densa, senza riempitivi né frasi di raccordo vuote
- [x] Ogni definizione normativa con **fonte esatta**: atto, articolo, comma, allegato, paragrafo
- [x] Ogni definizione operativa **dichiarata come tale** con marcatura `[MOD]` e identificativo `DM-nn`
- [x] Distinzione sistematica fra `[NORM]`, `[BASE]`, `[MOD]`, `[NV]`, dichiarata nell'indice
- [x] **Nessuna soglia, scala o punteggio inventato.** Nessun valore clinico compare in alcun capitolo. I valori temporali citati sono dichiarati come proposte di `R6` configurabili, mai come prescrizioni
- [x] **Nessun nome di scala clinica** compare in quest'area, in attesa di `Q-11`
- [x] 21 diagrammi Mermaid; nessun apostrofo nelle etichette dei diagrammi, per evitare errori di analisi
- [x] Solo dati sintetici; nessun esempio contiene dati reali, nemmeno parziali
- [x] Rinvii ai moduli di `docs/10_fondamenti/` **senza ripeterne il contenuto**: i fondamenti spiegano *che cosa esiste*, quest'area decide *come si rappresenta*
- [x] Rinvii incrociati interni con collegamenti relativi
- [x] Regola **R0** rispettata: nessun nome di azienda, marchio, prodotto commerciale o dominio di potenziale partner. Si usano soltanto «l'integratore», «un sistema EHR di terze parti», «un gestionale sanitario cloud», «il repository documentale nazionale o regionale», «il fornitore di identità digitale», «il gateway di terze parti»
- [x] Nessuna affermazione lascia intendere che il prodotto sia marcato CE (`D16`, `D51`): l'indice lo dichiara espressamente
- [x] File scritti **uno alla volta e in più passaggi** (prima stesura, poi passaggi di integrazione su capitoli 01, 02, 03, 04, 05, 07)

---

## 6. Che cosa resta da fare su quest'area

1. **Conteggio esatto delle parole** con `wc -w` (§ 1).
2. **Chiusura degli undici punti `[NV]`** (§ 4), tutti con destinatario assegnato.
3. **Assegnazione degli identificativi di requisito** alle sei entità di dominio nuove
   (`Q-141`), da congelare ai sensi di `D45`.
4. **Due ADR** che quest'area richiede e non produce: modalità a non conservazione con
   tassonomia dei dati (`Q-140`), collocazione dell'evidenza di qualità del collegamento
   (`Q-131`, parte `COMP`).
5. **Due decisioni del committente** (`Q-144`, `Q-145`), entrambe con effetti sulla destinazione
   d'uso e sulla comunicazione pubblica.
6. **Allineamento al glossario nazionale** prima del congelamento del capitolo 09 (`Q-146`).
7. **Traduzione inglese integrale** (`D3`, `D50`), da eseguire dopo il congelamento del testo
   italiano, con la struttura speculare sotto `i18n/en/`.
8. **Verifica dei collegamenti relativi** verso `docs/08_compliance/` e verso i moduli di
   `docs/10_fondamenti/` prima del primo deploy: `D52` li rende bloccanti.
