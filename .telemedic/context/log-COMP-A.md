# log-COMP-A - Area conformità, primo blocco

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
| `03-sistema-di-gestione-della-qualita.md` | 1ª | La domanda che né ISO 13485 né IEC 62304 si pongono - **chi risponde del codice scritto da chi non si controlla** - e la risposta di processo: il controllo sta nell'accettazione, non nella scrittura. Sistema di gestione della qualità come codice, esclusioni motivate, **le circa trentasei procedure** e il limite realistico di accorpamento, spazio degli identificativi regolatori (`V-172`), determinazione item per item della classe di sicurezza, tracciabilità nelle due direzioni, **dieci record obbligatori a ogni rilascio**, componenti di terze parti con finestre di rimedio in giorni (chiude `Q-113`), regime di licenza per artefatto, scale e questionari (accoglie `Q-11`), il progetto come componente di terze parti altrui |
| `04-fascicolo-tecnico.md` | **2ª** | Che cos'è il fascicolo e le **tre proprietà formali** che la documentazione pubblicata non possiede; struttura in quattro insiemi; mappatura voce per voce dell'**Allegato II sezioni 1–6** e dell'**Allegato III** sui percorsi reali di questo repository, con attribuzione P / P/F / F e stato; **quattordici assenze dichiarate** con l'indicazione di quali non sono recuperabili; **quindici elementi che solo chi certifica può aggiungere**; che cosa fa e che cosa non fa l'organismo notificato; perché è il fattore limitante del calendario; manutenzione del fascicolo e conflitto fra ritmo del software e ritmo regolatorio; lista di autocontrollo in dieci punti |
| `00-indice.md` | **2ª** | Orientamento dell'area, i tre fatti che nessun capitolo può contraddire, i nove capitoli, **percorsi di lettura per chi certifica, per chi installa e per chi contribuisce**, confini rispetto alla guida dei fondamenti e all'area di sicurezza con la regola che disambigua i casi dubbi, vincoli recepiti e vincoli imposti, **otto cose che quest'area deliberatamente non dice**, questioni aperte, regole di manutenzione |

**Conteggio parole**: non misurato in questa sessione - l'agente non disponeva di una shell.
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

1. **`R0`** - nessuna azienda, marchio, prodotto commerciale o dominio di potenziale partner è
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

---

# Appendice - sessione COMP-R, riformulazione imposta da `D57` e `D58`

**Agente**: `COMP-R`. **Data**: 25 agosto 2026. **Natura del lavoro**: **riformulazione**, non
riscrittura. Nessun capitolo è stato rifatto; sono stati riformulati i luoghi costruiti sulla
figura del **soggetto terzo indefinito** che il committente ha eliminato con `D58`.

## R.1 Che cosa impongono le due decisioni

- **`D57`** - la roadmap e le date sono **pianificazione interna del progetto**, mai il percorso
  di un soggetto esterno.
- **`D58`** - il ruolo di fabbricante **sarà assunto dal progetto**; il soggetto giuridico
  **va costituito**. Emenda `D28`, `D45`, `D49` e `V-06` **nel destinatario, non nella sostanza
  tecnica**.

Il capitolo `09` era già stato riformulato ed è stato usato come riferimento del registro.

## R.2 File toccati, in ordine di lavorazione

| Ordine | File | Che cosa è stato riformulato |
|:-:|---|---|
| 1 | `02-qualificazione-e-classificazione.md` | Avvertenza di testa; apertura del § 5 e la «tensione», che **si stringe** e non si allenta; le tre qualificazioni della traccia; il paragrafo «Il limite resta»; **nuovo § 5.2**, sostanziale; riga `V-270` nel § 12; descrizione |
| 2 | `03-sistema-di-gestione-della-qualita.md` | Avvertenza di perimetro, riscritta con lo stato di fatto in prima posizione e il varco chiuso; § 4.1 seconda avvertenza (la data di avvio dell'esercizio è **una decisione nostra**); § 9.7, che acquista un **secondo destinatario**; descrizione |
| 3 | `04-fascicolo-tecnico.md` | Avvertenza di perimetro; § 2 insieme D; § 3 precisazione sullo stato e legenda `P`; § 5 schermata di informazioni; § 7 ultima colonna della matrice dei requisiti generali; § 11 chiusura sulle attività irrecuperabili; **§ 12 rititolato e con premessa nuova**; **nuovo § 12.1** sulla ricostruzione dei sorgenti; descrizione |
| 4 | `00-indice.md` | Primo dei tre fatti; **nuovo § 1.1** con la dichiarazione del cambiamento e di ciò che non cambia; tabella dei capitoli; § 3.1 percorso di lettura; § 5 `V-06`; § 6 punti 4 e 6; § 7 spazio di numerazione; descrizione |
| 5 | `01-inquadramento-normativo.md` (**aggiunto in corso d'opera dall'orchestrazione**) | § 11: formula ammessa nella tabella di `V-171`, **quattro regole di forma** del registro e chiusura esplicita del varco; § 13: **la motivazione dell'omissione della data di marcatura CE, riscritta senza toccare l'omissione** |

Volumi dopo l'intervento: `00` 3.826 · `01` 8.341 · `02` 7.340 · `03` 7.387 · `04` 8.769 parole.

## R.3 Il criterio di sostituzione, che è tutto il lavoro

L'espressione «chi certifica» non è stata sostituita meccanicamente. Per ciascuna occorrenza:

| Soggetto scelto | Quando |
|---|---|
| **il progetto nel ruolo di fabbricante** | Si parla di chi intende intraprendere il percorso |
| **il fabbricante** | Si parla di un **atto che la norma riserva a quel ruolo formale** - apporre la marcatura, firmare la dichiarazione, comporre il fascicolo, compilare e sottoscrivere la destinazione d'uso, approvare l'ultima colonna della matrice dei requisiti generali. **Riservati anche quando il ruolo sarà nostro**, e la distinzione è stata conservata perché è ciò che rende leggibile perché quelle attività non si possono anticipare |
| **il soggetto fabbricante, da costituire** | Il passo presuppone l'esistenza giuridica che oggi manca: produrre la distribuzione identificata, istituire e far certificare il sistema di gestione della qualità |
| **chi installa** / **chi integra** | Il testo si riferiva a loro. Verificato caso per caso; in `04` § 5 e in `04` § 12.1 l'attribuzione precedente era impropria |

## R.4 Che cosa non è stato attenuato - verificato riga per riga

1. **La ripartizione tecnica è intatta.** Le quindici voci del § 12 di `04` restano quindici; la
   premessa nuova spiega **perché non poteva accorciarsi**. La legenda `P` / `P/F` / `F` è
   invariata nella sostanza.
2. **Lo stato di fatto è dichiarato con la stessa evidenza, e in più luoghi di prima.** «Il
   prodotto non reca marcatura CE» apre ora il § 5.2 di `02`, l'avvertenza di perimetro di `03`,
   l'avvertenza di `04` e il § 1.1 di `00`.
3. **`V-171` è intero.** Nessuna data, nessuna finestra, nessun «entro» è stato introdotto.
   Verificato con ricerca testuale: le uniche occorrenze di «entro» nei testi riformulati sono
   **dentro l'enunciato del divieto**.
4. **Il varco «stanno certificando, allora posso usarlo» è nominato ed escluso** in `00` § 1.1,
   `01` § 11, `02` § 5.2, `03` avvertenza di perimetro, `04` avvertenza di perimetro e § 12.
5. **Le attività retroattivamente irrecuperabili sono dichiarate più urgenti**, in `03` § 9.7 e
   in `04` § 11, con la ragione: il costo dell'omissione era di un terzo, ora è nostro.

## R.5 Il punto sostanziale del lavoro: `02` § 5.2

Richiesto esplicitamente e non riducibile a un aggiustamento lessicale. La ragione per cui la
traccia di destinazione d'uso **non è** una dichiarazione è cambiata di natura:

- **prima**: mancava il **soggetto** che potesse dichiarare. `D58` ha smentito questa
  formulazione, che oggi sarebbe falsa;
- **ora**: manca il **sistema di controllo documentale che rende una dichiarazione tale**. Senza
  gli attributi della clausola 4.2.4 di ISO 13485:2016 - approvazione prima dell'emissione,
  riesame e riapprovazione alle modifiche, identificazione dello stato di revisione, disponibilità
  della versione applicabile, protezione dalle versioni superate - ciò che si firma è una firma su
  un testo, non una dichiarazione, perché **non è dimostrabile a quale revisione si riferisca**.

La condizione nuova è **verificabile e a nostro carico**: rende il documento **più** oneroso, non
meno. È registrata come `V-272`.

## R.6 Bacheca

**Aggiornate perché `D57` e `D58` le rendono superate nel destinatario** - non nella sostanza:
`Q-176` (il dossier dello stato dell'arte non è più un servizio a un terzo ma un anticipo sul
nostro cammino critico), `Q-177` (i due obblighi dell'art. 86 e dell'Allegato III gravano su di
noi, quindi la decisione sul canale va presa **prima** della prima distribuzione identificata),
`Q-179` (parzialmente chiusa da `D57` quanto all'attribuzione; resta aperta la forma
dell'avvertenza). Emendati nel destinatario `V-179` e `V-174`.

**Aperte**: `V-270` registro obbligatorio con le quattro regole di forma · `V-271` chiusura
obbligatoria del varco, con il corollario che **ricompilare i sorgenti non riproduce il
dispositivo** · `V-272` la traccia non è una dichiarazione per assenza di sistema, non di soggetto
· `Q-270` residui di «chi certifica» nei capitoli **06, 07 e 08**, fuori dal perimetro assegnato ·
`Q-271` residui e un **refuso** nel capitolo 09, già riformulato ma non pulito del tutto ·
`Q-272` nessuna area è titolare della **costituzione del soggetto fabbricante**, che è atto
societario e non attività di documentazione.

## R.7 Che cosa resta da fare, e da chi dipende

| # | Attività | A chi |
|---|---|---|
| 1 | Riformulare `06`, `07`, `08` con il registro di `V-270` (`Q-270`). **L'area è internamente incoerente finché non è fatto** | `COMP-B` o assegnazione dell'orchestrazione |
| 2 | Correggere i residui e il refuso di `09` § 7.2 (`Q-271`) | `ROAD` / orchestrazione |
| 3 | Dichiarare chi conduce la costituzione del soggetto fabbricante e con quali risorse (`Q-272`) | → Committente |
| 4 | Rigenerare la traduzione inglese delle sezioni riformulate: `00` § 1.1, `01` §§ 11 e 13, `02` § 5.2, `04` § 12.1 sono **nuove** e la versione inglese diverge | Sito e internazionalizzazione |
| 5 | Riverifica dei `[NV]` sui testi consolidati prima che una riga entri in un documento controllato. La riga «a chi» dell'appendice precedente diceva «chi certifica»: **si legge il fabbricante**, e il fabbricante intendiamo essere noi | Conformità |

---

# Appendice - sessione COMP-R2, chiusura di `Q-270` sui capitoli 06, 07 e 08

**Agente**: COMP-R2. **Data**: 25 agosto 2026. **Perimetro**: i tre capitoli che l'appendice
precedente aveva lasciato fuori - `06-usabilita-e-accessibilita.md`,
`07-valutazione-clinica.md`, `08-sorveglianza-post-commercializzazione.md`. Nessun altro file
dell'area è stato toccato: `00`, `01`, `02`, `03`, `04` e `09` erano già allineati e sono stati
usati come riferimento del registro, non modificati.

## R2.1 Il criterio, ripreso e non reinventato

Il registro applicato è quello di `V-270`, letto nella forma in cui `00` §1.1 lo dichiara e in
cui `02` §5.2 lo esercita. Le quattro forme di sostituzione sono state assegnate contesto per
contesto e **non meccanicamente**:

| Forma | Dove | Esempi dai tre capitoli |
|---|---|---|
| **«il fabbricante»** | Atto che la norma riserva al ruolo formale | Approvare il protocollo di validazione e condurre la sommativa (`06` §§4, 9); firmare `CE-REP-001` e assumere il piano di seguito clinico (`07` §4); essere titolare degli obblighi di sorveglianza e vigilanza (`08` §8) |
| **«il soggetto fabbricante, da costituire»** | Passo che presuppone l'esistenza giuridica | Ingaggiare l'organismo notificato per concordare le coorti (`06` §10); porre le domande di offerta (`06` §5); ingaggiare l'organismo dopo la revisione esterna della destinazione d'uso (`07` §2.2) |
| **«il progetto nel ruolo di fabbricante»** | Chi intende intraprendere il percorso | Avvertenze di apertura dei tre capitoli |
| **«chi installa» / «chi integra»** | Dove il testo si riferiva a loro | Dichiarazione di accessibilità del servizio (`06` §§1, 9); verifica sulla configurazione installata e ripetizione sulle personalizzazioni (`06` §9); termine di segnalazione di ventiquattro ore (`08` §8.4) |

**Due attribuzioni precedenti erano improprie**, e la verifica caso per caso le ha fatte emergere.
`06` §6.2 attribuiva al fabbricante l'inadempimento che discende dall'omessa verifica di
accessibilità: grava invece su **chi installa** per la dichiarazione del servizio in rete e sul
**progetto** per le proprietà di prodotto, e il fabbricante risponde di tutt'altro - del requisito
generale di sicurezza non dimostrato. `06` §9 mescolava in un'unica colonna «chi certifica» atti
del fabbricante e atti di chi installa: la colonna è stata rifatta riga per riga.

## R2.2 Che cosa non è stato attenuato, e come l'ho verificato

Il criterio di riuscita dichiarato dal committente è negativo: se al termine un lettore ricava che
il prodotto è più vicino all'uso clinico di quanto fosse prima, il lavoro è sbagliato. Ho perciò
**aggiunto avvertenza dove non ce n'era**, invece di limitarmi a spostare soggetti.

1. **Ciascuno dei tre capitoli apre ora con lo stato di fatto negativo in prima posizione**, in
   grassetto, prima di qualunque menzione del percorso: nessuna marcatura CE, nessuna
   dichiarazione di conformità, non utilizzabile su pazienti reali. `06` vi aggiunge che nessuna
   formativa è stata condotta con utenti reali e nessuna sommativa esiste; `07` che nessun piano
   di valutazione clinica è approvato e **nessun beneficio clinico è ad oggi dimostrato**; `08`
   che non esiste alcuna distribuzione marcata e quindi **nessun sistema di sorveglianza in
   esercizio**.
2. **Il varco di `V-271` è chiuso in ciascun capitolo con parole proprie al suo oggetto**, perché
   una formula ripetuta tre volte si legge come boilerplate e smette di essere letta:
   - `06` - «**un'interfaccia accessibile non è un'interfaccia validata**»: la conformità ai
     criteri di accessibilità non dimostra nemmeno una parte del requisito generale di sicurezza;
   - `07` - «**l'evidenza tecnica non è evidenza clinica**»: l'abbondanza della seconda componente
     di MDCG 2020-1 non compensa il vuoto della terza, ed è l'inferenza che il § 3.2 esclude
     espressamente;
   - `08` - «**nessuno sorveglia le installazioni odierne**»: nessun canale verso l'autorità,
     nessun rapporto periodico, nessuna notifica di sicurezza sul campo che qualcuno stia
     adempiendo. È il capitolo in cui il malinteso è più insidioso, perché la sorveglianza è
     esattamente il presidio che si suppone attivo quando non lo è.
3. **Le quattro regole di forma sono rispettate**: l'intenzione è sempre resa con «intende», mai
   con un futuro indicativo - l'unica occorrenza contraria era un titolo di `08` §8.4 («sarà
   fabbricante domani») ed è stata corretta; l'assenza del soggetto giuridico è ripetuta nella
   stessa frase dell'intenzione, mai in nota; lo stato di fatto negativo precede sempre il
   percorso; **nessuna data e nessuna finestra**.
4. **Sulla parola «entro».** In `06` e `07` l'unica occorrenza è dentro l'enunciato del divieto. In
   `08` restano i termini del regime di vigilanza - due giorni, ventiquattro ore, settantadue ore -
   che sono **obblighi normativi altrui e non date del progetto**: l'avvertenza di apertura lo
   dichiara espressamente, e il capitolo `09` già riformulato usa la stessa distinzione (§ 7.3).
   Le due occorrenze non normative che avevo trovato («allarmi non riscontrati entro la finestra
   dichiarata», in `07` §7.1 e in `08` §3) sono state riformulate in «nella finestra dichiarata».

## R2.3 I due punti che il committente aveva segnalato come delicati

**`07` §6.1 - il limite di perimetro dell'analisi di equivalenza.** Il limite **resta**, ma la sua
motivazione era caduta insieme al terzo: dire «è documento di un terzo, non del progetto» dopo
`D58` è scrivere una cosa falsa. La ragione vera è di **perimetro della documentazione pubblica** e
regge da sola: un'analisi di equivalenza nomina necessariamente un dispositivo di confronto,
quindi viola `R0` per costruzione, e appartiene al fascicolo tecnico sotto il controllo dei
documenti del fabbricante - **non al repository, nemmeno quando quel fabbricante saremo noi**.
`D58` sposta chi redige quel documento, non dove il documento vive. Posto come `V-274`.

**`08` §8.4 - la colonna che cambia natura.** Non è più «obbligo del progetto verso chi certifica»
ma **«obbligo che il progetto assume»**, e lo assume due volte: come fornitore a monte di chi
integra e come futuro fabbricante di sé stesso. La conseguenza è quella che il committente aveva
indicato ed è il vero contenuto del paragrafo: **nessuna di quelle righe è soddisfatta
scrivendola**. Sono capacità di prodotto da costruire, e la loro assenza si scopre nel momento in
cui servono, quando è tardi per costruirle. Ho aggiunto alla tabella una sesta riga - le due
capacità di `V-178` - e ne ho tratto `Q-276`.

## R2.4 Il disallineamento che non era stato segnalato: `Q-144`

`07` §2.2 si intitolava «La dipendenza che oggi è aperta e blocca tutto» e dichiarava la
destinazione d'uso del telemonitoraggio non congelata. **`D55` l'ha congelata** sulla formulazione
«raccolta differita di parametri per la revisione periodica del professionista», chiudendo `Q-144`.
La sezione è stata riscritta: il congelamento sblocca la parte metodologica - protocollo della
ricerca, criteri di inclusione, dossier dello stato dell'arte - e **non rende anticipabile** nulla
di ciò che il § 4 riserva al ruolo; resta invece non condotta la **revisione esterna** che `D46` e
`D55` impongono prima di ingaggiare qualunque organismo notificato, ed è `Q-275`.

`Q-144` risulta però ancora elencata come aperta in `02` §12 e in `09` §10, che non sono nel mio
perimetro. Segnalato come `Q-274` senza toccare quei file.

## R2.5 Altri difetti corretti nel perimetro

| Dove | Difetto | Correzione |
|---|---|---|
| `06` §1 | Rinvio «la ripartizione puntuale è al § 8»: il § 8 è la validazione sommativa | Corretto in § 9 |
| `06` §4 | «È la sequenza che determina **la data** del capitolo 09 §4» | «Governa la **pianificazione interna** del capitolo 09 §3; qui non se ne ricava alcuna data» (`D57`, `V-171`) |
| `06` §5 | Rinvio al riesame preliminare su `09 §6`: sta in `09` §8.3 | Corretto, e aggiunta la nota che porre quella domanda presuppone il ruolo di fabbricante |
| `08`, avvertenza | «Il § 7 dice chi ne è titolare»: è il § 8 | Corretto |
| `08` §8.3 | «La tutela sostanziale del progetto è il fatto di **non essere fabbricante**» - vero ieri, fuorviante da `D58` | Riscritto: il fatto è **temporaneo per scelta nostra**, e quando il soggetto sarà costituito la disciplina della responsabilità per danno da prodotti difettosi si applicherà a esso per intero, senza che alcuna clausola di licenza possa escluderla verso il danneggiato |

## R2.6 Bacheca

**Chiusa `Q-270`** con la nota di chiusura per esteso: forme applicate, attribuzioni improprie
corrette, verifica testuale che «chi certifica» non compare più in alcun capitolo dell'area.

**Posti**: `V-273` - la dichiarazione di accessibilità del servizio **non è mai del progetto** e
non lo diventa per effetto di `D58`, perché il fabbricante di un dispositivo non è per ciò solo il
fornitore del servizio in rete · `V-274` - l'analisi di equivalenza non entra nella documentazione
pubblica in nessuna forma e in nessuna fase.

**Aperte**: `Q-273` - le formative sono ora nostre e non differibili, ma **richiedono persone
diverse** e ricadono nel limite di `D54` · `Q-274` - `Q-144` ancora aperta in `02` e `09` · `Q-275`
- la revisione esterna della destinazione d'uso non è stata condotta ed è la sola condizione di
`D46` soddisfacibile **senza** il soggetto costituito · `Q-276` - le due capacità di `V-178` sono
retroattivamente irrecuperabili quanto le quattro attività di `D45` e non figurano in
quell'elenco.

## R2.7 Che cosa resta da fare

| # | Attività | A chi |
|---|---|---|
| 1 | Correggere `Q-144` in `02` §12 e `09` §10 (`Q-274`) | `ROAD` / orchestrazione |
| 2 | Valutare l'aggiunta delle due capacità di `V-178` all'elenco delle attività irrecuperabili di `09` §5 (`Q-276`) | `ROAD`, `TECH`, → **ORCH** |
| 3 | Decidere se acquisire all'esterno la funzione di osservatore per le valutazioni formative (`Q-273`) | → Committente |
| 4 | Commissionare la revisione esterna della destinazione d'uso congelata (`Q-275`) | → Committente |
| 5 | Rigenerare la traduzione inglese: le avvertenze di apertura di `06`, `07` e `08`, `06` §§4, 6.2, 8, 9, `07` §§2.2, 3.2, 4, 6.1 e `08` §§8, 8.3, 8.4, 8.5 sono **nuove** e la versione inglese diverge | Sito e internazionalizzazione |
| 6 | Riverifica dei `[NV]` invariata rispetto all'appendice precedente: nessuno è stato aggiunto né risolto in questa sessione | Conformità |
