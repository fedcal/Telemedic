# log-COMP-A — Area conformità, primo blocco

**Agente**: COMP-A. Il lavoro si è svolto in **due sessioni**: la prima ha prodotto i capitoli
01, 02 e 03 e si è interrotta per limite di sessione senza scrivere né la bacheca né questo log;
la seconda ha prodotto i capitoli **04** e **00**, ha registrato in bacheca i vincoli e le
questioni che i capitoli già scritti citavano ma che non erano ancora dichiarati, e ha scritto
questo registro. Il capitolo 05 è di `COMP-B`, così come i capitoli 06–09.

**Data**: 25 agosto 2026 · **Percorso**: `docs/08_compliance/`

---

## 1. Deliverable prodotti

| File | Sessione | Contenuto |
|---|:-:|---|
| `01-inquadramento-normativo.md` | 1ª | Mappa delle fonti per **attribuzione** e non per elenco: per ciascuna, soggetto obbligato, decorrenza e ricaduta sul progetto o su chi installa. Dispositivi medici, protezione dei dati, sicurezza delle reti nei due regimi nazionali, resilienza dei prodotti con la **tabella artefatto → regime** (chiude `Q-10`), responsabilità da prodotto difettoso, spazio europeo dei dati sanitari, accessibilità, quadro italiano della telemedicina, riscontro sulla ripartizione dei ruoli di `SEC`, **formule vietate** (`V-171`), tre soglie che cambierebbero il quadro, calendario delle date esigibili |
| `02-qualificazione-e-classificazione.md` | 1ª | La catena qualificazione → classe → procedura → tempi; perché non esiste una Classe I per questo software; Regola 11 applicata con **le due leve che tengono la IIa e non la IIb**; struttura della traccia di destinazione d'uso con la tensione dichiarata fra `D46` e `D49`; **dodici richieste ragionevoli che spostano la qualificazione**; condizioni di validità e fatti che obbligano a riesaminare; perimetro dichiarato; controllo delle modifiche come misura di conformità (`V-170`); la classe di sicurezza del software come **conseguenza** delle stesse esclusioni |
| `03-sistema-di-gestione-della-qualita.md` | 1ª | La domanda che né ISO 13485 né IEC 62304 si pongono — **chi risponde del codice scritto da chi non si controlla** — e la risposta di processo: il controllo sta nell'accettazione, non nella scrittura. Sistema di gestione della qualità come codice, esclusioni motivate, **le circa trentasei procedure** e il limite realistico di accorpamento, spazio degli identificativi regolatori (`V-172`), determinazione item per item della classe di sicurezza, tracciabilità nelle due direzioni, **dieci record obbligatori a ogni rilascio**, componenti di terze parti con finestre di rimedio in giorni (chiude `Q-113`), regime di licenza per artefatto, scale e questionari (accoglie `Q-11`), il progetto come componente di terze parti altrui |
| `04-fascicolo-tecnico.md` | **2ª** | Che cos'è il fascicolo e le **tre proprietà formali** che la documentazione pubblicata non possiede; struttura in quattro insiemi; mappatura voce per voce dell'**Allegato II sezioni 1–6** e dell'**Allegato III** sui percorsi reali di questo repository, con attribuzione P / P/F / F e stato; **quattordici assenze dichiarate** con l'indicazione di quali non sono recuperabili; **quindici elementi che solo chi certifica può aggiungere**; che cosa fa e che cosa non fa l'organismo notificato; perché è il fattore limitante del calendario; manutenzione del fascicolo e conflitto fra ritmo del software e ritmo regolatorio; lista di autocontrollo in dieci punti |
| `00-indice.md` | **2ª** | Orientamento dell'area, i tre fatti che nessun capitolo può contraddire, i nove capitoli, **percorsi di lettura per chi certifica, per chi installa e per chi contribuisce**, confini rispetto alla guida dei fondamenti e all'area di sicurezza con la regola che disambigua i casi dubbi, vincoli recepiti e vincoli imposti, **otto cose che quest'area deliberatamente non dice**, questioni aperte, regole di manutenzione |

**Conteggio parole**: non misurato in questa sessione — l'agente non disponeva di una shell.
Stima per costruzione: `04` ampiamente oltre le 5.000 parole richieste (511 righe non vuote, con
dodici tabelle di mappatura a righe lunghe), `00` oltre le 1.500 richieste (196 righe non vuote).
La verifica con `wc -w` resta da eseguire in sede di controllo finale.

---

## 2. Vincoli posti (intervallo riservato `COMP` 170–179)

Tutti e cinque erano **citati dai capitoli 01, 02 e 03** ma non erano stati registrati in bacheca
prima dell'interruzione della prima sessione. Questa sessione li ha dichiarati nella forma in cui
i capitoli li usano, senza estenderne la portata.

| # | A | Sintesi |
|---|---|---|
| V-170 | tutte | **Controllo delle modifiche come misura di conformità**: una proposta che introduca una funzione dell'elenco chiuso fuori perimetro si rifiuta **per politica di perimetro**, con motivazione regolatoria scritta. Le stesse esclusioni tengono insieme la classe di rischio a IIa e la classe di sicurezza del software a B |
| V-171 | tutte, in particolare `PROD`, `GUIDA` | **Formule vietate in ogni artefatto pubblico.** Il divieto di dichiarazioni fuorvianti non presuppone la marcatura: il materiale promozionale è materiale regolatorio |
| V-172 | tutte | **Spazio riservato degli identificativi dei documenti regolatori**, con la regola di disambiguazione fra requisiti di sicurezza e documenti di sicurezza |
| V-173 | `TECH`, `ARCH`, `ROAD` | **Nessuna etichetta di versione mobile.** È violazione diretta della clausola 8.1.2, non preferenza operativa; l'aggiornamento è un atto con data, motivazione e valutazione |
| V-174 | tutte | **La documentazione pubblicata non è documentazione controllata.** I capitoli sono ingressi; la colonna «documenti controllati» della matrice dei requisiti generali non è compilabile dal progetto |

Nessun vincolo altrui è stato contraddetto. Recepiti esplicitamente e citati nei capitoli: `V-05`,
`V-06`, `V-07`, `V-08`, `V-12`, `V-120`, `V-144`, `V-146`, `V-147`, `V-152`, `V-154`, `V-163`,
`V-165`.

---

## 3. Questioni aperte (intervallo riservato `COMP` 170–179)

| # | A | Sintesi |
|---|---|---|
| Q-170 | → ORCH | Forma di pubblicazione della traccia di destinazione d'uso: **decisione sul rischio di essere citati come autori di una destinazione d'uso** |
| Q-171 | → ORCH | Se produrre anche il pacchetto documentale del capo III del regolamento sullo spazio europeo dei dati sanitari |
| Q-172 *(aperta in 2ª sessione)* | → ORCH, `ARCH` | **Struttura di versionamento della distribuzione identificata** e suo rapporto con l'identificativo unico di base: da decidere **prima** del primo rilascio della distribuzione, perché una rinumerazione successiva è una discontinuità di identificazione |
| Q-173 | `DOM`, `FUNZ` | Se la presentazione di parametri costituisca **funzione di misura**: da essa dipendono righe intere della matrice dei requisiti generali |
| Q-174 | `PROD`, `GUIDA` | **Revisione regolatoria dei testi pubblici prima della pubblicazione**: unico presidio dell'area che nessuna verifica automatica intercetta |

## 4. Questioni altrui evase o aggiornate

| # | Esito |
|---|---|
| `Q-10` | **Chiusa** dalla tabella artefatto → regime di `01 §5.1`. Resta `Q-24`, che è l'atto formale di adozione e non il contenuto |
| `Q-11` | **Accolta** in `03 §9.6`: scale, questionari e algoritmi di punteggio ricadono nei quattro regimi di `D31`. Resta aperto l'accertamento **scala per scala** |
| `Q-13`, `Q-114` | **Registrate** in `03 §10` come ingressi identificati al file di rischio; gravità e probabilità restano determinabili solo dopo il piano |
| `Q-112` | **Delimitata** in `03 §9.5`: la restrizione non grava sul progetto, ma ne discende un obbligo documentale verso chi installa. La lettura della licenza resta `[NV]` |
| `Q-113` | **Chiusa** in `03 §9.4` con le finestre di rimedio in giorni e l'orologio che decorre dalla pubblicazione dell'avviso |
| `Q-25` | **Chiusa** in questa sessione: il documento di ricerca sul percorso di certificazione è completo, e §8 è la fonte del capitolo 04. I suoi `[NV]` sono stati propagati, non sanati per inferenza |
| `Q-26` | Aggiunta la **nota di conformità**: i capitoli 00 e 04 adottano l'indirizzo assoluto verso il repository; la duplicazione dentro `docs/` è esclusa perché due copie divergenti di un materiale regolatorio sono una dichiarazione fuorviante, non un difetto di manutenzione |
| `Q-115`, `Q-116`, `Q-07`, `Q-155`, `Q-151` | **Riportate come dipendenze bloccanti** nei capitoli in cui producono un effetto, senza essere chiuse |

---

## 5. Regole rispettate e scelte redazionali

1. **`R0`** — nessuna azienda, marchio, prodotto commerciale o dominio di potenziale partner è
   nominato. Nel capitolo 02 la regola converge con la **trappola dell'accessorio**: dichiarare la
   compatibilità con un apparecchio nominato importerebbe la classe di quell'apparecchio.
2. **Distinzione costante fra obbligo del progetto e obbligo di chi installa**, resa colonna nelle
   tabelle di mappatura del capitolo 04 (`P` / `P/F` / `F`) e percorso di lettura autonomo nel
   capitolo 00.
3. **Nessuna prosa consolatoria.** Le sezioni «Che cosa manca oggi» e «Che cosa solo chi certifica
   può aggiungere» sono scritte come inventari di assenze, e la sezione 6 del capitolo 00 elenca
   ciò che l'area **non** dice, perché in materia regolatoria un'assenza viene letta come risposta.
4. **Nessun articolo, data o termine inventato.** Dove la verifica sul testo primario non è stata
   compiuta la voce è marcata `[NV]` con l'indicazione di che cosa verificare: numerazione di
   sezioni degli Allegati I, IX e XI; codici di designazione; durata dell'obbligo di conservazione;
   stato di armonizzazione delle norme sulle informazioni fornite dal fabbricante e sui simboli;
   articolo del decreto nazionale sull'obbligo di lingua italiana.
5. **Le date stanno solo nel capitolo 09.** Il capitolo 04 rinvia e non ripete, per non produrre due
   calendari destinati a divergere.
6. **Rinvii ai file alla radice** scritti come indirizzi assoluti verso il repository, mai come
   percorsi relativi che escono da `docs/`.
7. **Frontmatter** con `title`, `sidebar_position`, `description`; le descrizioni che contengono
   due punti seguiti da spazio sono racchiuse fra virgolette doppie.

---

## 6. Che cosa resta da fare su quest'area

| # | Attività | A chi |
|---|---|---|
| 1 | Verifica con `wc -w` dei conteggi dichiarati al § 1 | Controllo finale |
| 2 | Collegamenti a `06`, `07`, `08`, `09`: presenti nei capitoli 00, 04 e 05, **bloccanti prima del primo deploy** ai sensi di `D52` | `COMP-B`, poi orchestrazione |
| 3 | Traduzione inglese integrale (`D50`), con la struttura speculare e il controllo di divergenza | Sito e internazionalizzazione |
| 4 | Riverifica dei `[NV]` sui testi consolidati **prima** che una qualunque di queste righe entri in un documento controllato | Chi certifica |
