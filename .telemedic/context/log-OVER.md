# Registro di lavoro - `OVER` (panoramica, `docs/00_overview/`)

Area: **`PROD` - prodotto e comunicazione**, intervallo di bacheca `V-200`…`V-209` / `Q-200`…`Q-209`.
Directory di destinazione: `docs/00_overview/`, vuota all'inizio del lavoro.

## 1. Che cosa è stato prodotto

| File | `sidebar_position` | Contenuto |
|---|---|---|
| `00-indice.md` | 1 | Orientamento generale: le quattro pagine dell'area, le tre affermazioni che decidono se il resto interessa, sei percorsi di lettura per profilo, mappa delle undici aree con ciò che ciascuna copre e ciò che non copre, i documenti alla radice del repository, tabella di instradamento rapido, sei regole di precedenza, convenzioni comuni, avvertenze permanenti, come segnalare un difetto |
| `01-visione-e-obiettivi.md` | 2 | Che cos'è Telemedic in una definizione che non promette; il problema reale in quattro fatti con fonte; le cinque scelte che generano tutte le altre; chi ne beneficia; **dieci non obiettivi** con la ragione di ciascuno; che cosa il progetto si vieta di dire; perché la documentazione è venuta prima del codice |
| `02-le-quattro-prestazioni.md` | 3 | Il canale non è una specialità; **le due tassonomie che non coincidono**; quadro sinottico; una sezione per prestazione con «che cosa la distingue davvero» e «gli obblighi distinti che porta»; sei nozioni di confine; cinque errori che il capitolo esiste per impedire |
| `03-a-chi-si-rivolge.md` | 4 | Cinque destinatari - struttura sanitaria, professionista, assistito e caregiver, integratore, ente regionale - ciascuno con *che cosa ottiene* / *che cosa deve mettere di suo* / ***che cosa il progetto non gli dà***; più due lettori adiacenti instradati altrove |
| `04-stato-e-limiti.md` | 5 | Il limite che precede tutti gli altri; la fotografia verificata sul repository; che cosa non esiste ancora; i limiti dichiarati del primo rilascio; **undici tensioni accettate consapevolmente**; le questioni aperte che pesano di più; otto punti da sapere prima di decidere; come il capitolo resta vero |

Ordine di stesura: 01, 02, 03, 04, 00 - l'indice per ultimo, quando il contenuto effettivo era noto.
Ogni file è stato salvato prima di passare al successivo.

## 2. Il fatto che ha cambiato il lavoro a metà percorso

Le decisioni **`D53`-`D58`** (terza tornata del committente, 25 agosto 2026) sono state depositate
nel brief **dopo** la mia lettura iniziale e **durante** la stesura. Le ho recepite riscrivendo le
parti già prodotte. Le più incisive:

- **`D58`** - *il ruolo di fabbricante sarà assunto dal progetto; il soggetto va costituito.* Emenda
  `D28`, `D45`, `D49` e `V-06` nella parte attributiva. Ha imposto la riscrittura integrale del non
  obiettivo 5.1 di `01`, della tensione 5.3 di `04`, del §6 di `03` e del §3.5 di `00`.
- **`D57`** - *la roadmap è pianificazione interna del progetto.* Ha imposto di non presentare più
  la marcatura come «traguardo di terzi» e di riformulare il motivo per cui la data resta comunque
  non dichiarata.
- **`D53`** e **`D54`** - primo rilascio installabile confermato al 30 novembre 2026, capacità
  dichiarata di **un contributore unico a tempo parziale**. Recepiti in `04` §2.1, §5.5 e §5.11, e
  in `01` §7.
- **`D55`** - destinazione d'uso del telemonitoraggio congelata. Chiude `Q-144`, che avevo elencato
  fra le questioni aperte: rimossa e sostituita con il **divieto permanente** che ne discende.
- **`D56`** - traduzione assistita area per area; la traduzione integrale non è più prerequisito di
  ogni riga di codice. Recepito in `04` §2.1 e §3.

**Scelta redazionale conseguente, dichiarata perché è discutibile.** `V-06` e `V-180` portano
ancora la formulazione anteriore a `D58` e `D57`, e gli indici di `08_compliance`, `07_integration`
e `09_roadmap` sono costruiti sulla figura del fabbricante come soggetto terzo. Ho scritto la
panoramica su `D53`-`D58` - che sono decisioni del committente e prevalgono - e ho **dichiarato la
divergenza in due note di allineamento** (`00-indice.md` §3.5, `01-visione-e-obiettivi.md` §5.1)
invece di nasconderla o di correggere d'ufficio le aree altrui. La questione `Q-200` la porta ai
titolari.

## 3. Vincoli posti da quest'area

| # | A | Sintesi |
|---|---|---|
| `V-200` | tutte | **La panoramica non è fonte: instrada.** Nessuna affermazione sostanziale esiste soltanto in `docs/00_overview/`; una divergenza fra panoramica e area si risolve sempre a favore dell'area; la panoramica non duplica il testo dei documenti alla radice, li cita per indirizzo assoluto |
| `V-201` | tutte | **Nessun materiale pubblico usa una sola tassonomia delle prestazioni.** Entrambe compaiono insieme alla loro non coincidenza; teleconsulto e teleconsulenza non si presentano mai come un'unica prestazione. Chiude la parte `PROD` di `Q-147` |
| `V-202` | tutte | **Formulazione pubblica della copertura oraria.** Mai livello di servizio commerciale, mai opzione di listino, mai copertura più ampia di quella presidiata; la copertura è del soggetto che eroga, non del software. Chiude `Q-121` e il residuo `PROD` di `Q-14` |
| `V-203` | `COMP`, `GUIDA`, `ROAD` | **Revisione regolatoria obbligatoria dei testi pubblici**, con lista di controllo congiunta regolatoria e tecnica, e la regola operativa che **una sintesi non può essere più affermativa della fonte che sintetizza**. Accoglie la parte `PROD` di `Q-174` |

## 4. Questioni chiuse o evase

| # | Esito |
|---|---|
| `Q-121` (`FUNZ` → `PROD`) | **RISOLTA.** Posta come `V-202`, con l'aggiunta del presupposto logico non presente nella questione: la copertura non è caratteristica del prodotto ma del soggetto che eroga. Residuo dichiarato e non sanabile qui: la prova con utenti reali presuppone un'interfaccia che non esiste |
| `Q-147` (`DOM` → `FUNZ`, `PROD`) | **CHIUSA** per la parte `PROD` e posta come `V-201`. Residuo non sanabile qui: la pagina pubblica, ricompresa in `Q-185` |
| `Q-174` (`COMP` → `PROD`, `GUIDA`) | **PARTE `PROD` ACCOLTA** e posta come `V-203`, con perimetro esplicito dei testi soggetti e lista di controllo congiunta. Resta aperta la procedura - chi esegue, con quale registrazione, con quale cadenza - che è di `COMP` |
| `Q-126` (`FUNZ` → `PROD`, `COMP`) | **PARTE `PROD` EVASA.** Non ho coniato il testo, perché concorre alla destinazione d'uso e la sua validità dipende da una prova non eseguibile oggi; ho fissato il **contratto a cinque punti** che la formulazione dovrà soddisfare, così che l'assenza del testo non produca formulazioni divergenti |

Non ho chiuso `Q-115` (dispositivo di riferimento) benché sia indirizzata anche a `PROD`: richiede
una scelta con un costo di misura a carico di `TECH` e non è risolvibile scrivendo un capitolo.
Non ho chiuso `Q-185` (allineamento della pagina pubblica): richiede una data del committente.

## 5. Questioni aperte da quest'area

| # | A | Sintesi |
|---|---|---|
| `Q-200` | ORCH, `ROAD`, `COMP`, `SEC`, `INTEG` | **`D57` e `D58` non sono recepiti nei vincoli in vigore né nelle aree.** Serve la riformulazione di `V-06` e `V-180` da parte dei titolari, la sequenza di riscrittura delle aree costruite sulla figura del terzo, e la conferma che la formula ammessa per la marcatura non ammette forme abbreviate |
| `Q-201` | `GUIDA`, `ROAD` | **Quattro moduli della guida non esistono** (`16`, `18`, `19`, `20`) e stanno sul percorso critico di due impegni: `CONTRIBUTING.md` e i prerequisiti di traduzione di `D56` |
| `Q-202` | `ROAD` | **La fotografia dello stato di fatto esiste in due sedi già divergenti.** Tre opzioni con costo diverso; raccomandazione motivata: **fonte generata dalla catena di verifica**, per la stessa ragione per cui la distinta dei materiali non si compila a mano |

## 6. Vincoli altrui recepiti senza discuterli

`V-01` · `V-02` · `V-03` · `V-04` · `V-05` · `V-07` · `V-08` · `V-09` · `V-12` · `V-110` · `V-112`
· `V-114` · `V-121` · `V-122` · `V-123` · `V-124` · `V-132` · `V-135` · `V-140` · `V-141` · `V-142`
· `V-143` · `V-144` · `V-145` · `V-146` · `V-148` · `V-150` · `V-151` · `V-153` · `V-157` · `V-160`
· `V-161` · `V-162` · `V-163` · `V-164` · `V-165` · `V-166` · `V-170` · `V-171` · `V-174` · `V-180`
· `V-181` · `V-183` · `V-184` · `V-186` · `V-187` · `V-188`.

`V-06` e `V-180` sono recepiti **nella loro sostanza tecnica** e non nella parte attributiva
emendata da `D58` e `D57`: vedi `Q-200`.

**Nessun vincolo altrui è stato contraddetto.**

## 7. Verifiche eseguite

- **Frontmatter**: tutti e cinque i file hanno `title`, `sidebar_position`, `description`; tutte le
  descrizioni contengono due punti seguiti da spazio e sono **racchiuse fra virgolette doppie**,
  come richiede il controllo 1 di `scripts/verifica-conformita-redazionale.sh`.
- **Rinvii fuori da `docs/`**: nessuno in forma relativa. I sei documenti alla radice sono citati
  con URL assoluti `https://github.com/fedcal/Telemedic/blob/main/<file>` (controllo 2).
- **Collegamenti relativi**: tutti i bersagli verificati esistenti su disco. Nessun rinvio ai
  quattro moduli mancanti della guida.
- **Guardia sulle terminologie**: nessun contenuto che attivi `scripts/verifica-terminologie.sh`.
  Le terminologie sono nominate, mai riprodotte.
- **Barra laterale**: `website/sidebars.mjs` genera automaticamente la categoria «Panoramica» da
  `00_overview`; nessuna registrazione manuale necessaria.
- **Regola `R0`**: nessun nome di azienda, marchio, prodotto commerciale o dominio di potenziale
  partner. Solo «gestionale sanitario cloud», «sistema EHR di terze parti», «integratore», «vendor
  partner».
- **Nessun dato reale, nessun segreto.**

## 8. Nota di metodo, per chi manterrà quest'area

Quest'area ha un rischio proprio che le altre non hanno, ed è la ragione di `V-203`: **è il testo
con il rapporto più alto fra visibilità e densità di affermazioni sintetiche**. Il modo concreto in
cui una panoramica cambia la destinazione d'uso di un prodotto non è affermare il falso - è togliere
una condizione perché stava stretta nella riga di una tabella. Ogni volta che una riga di sintesi
sembrava troppo lunga, la scelta applicata è stata **spezzare la riga, non la condizione**.
