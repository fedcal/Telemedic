# `ARCH-C` - tenuta dell'impianto architetturale

Revisione critica dell'impianto nel suo insieme, redatta il 26 agosto 2026. Non entra nel merito
delle due analisi parallele su contenitori e messaggistica: dove le tocca, lo fa dal solo lato che
quelle due non possono coprire, cioè se l'impianto ha un posto dove metterle.

La domanda a cui questo documento risponde non è «l'architettura è buona». Ã: **regge la
richiesta, e dove si incrina per primo**.

---

## 1. Che cosa ho letto, e che cosa no

**Letto per intero**: `CLAUDE.md`; i dieci file di `docs/02_architecture/`; i trenta ADR di
`docs/adr/` più `docs/adr/README.md`; `docs/01_technical/00-indice.md` e
`01-stack-e-motivazioni.md`; `docs/03_functional/00-indice.md` e `07-fuori-perimetro.md` (le prime
sessanta righe più la tabella `OUT-18`…`OUT-24`); `docs/09_roadmap/00-indice.md`,
`02-traguardi.md`, e le sezioni 4, 5 e 8 di `03-primo-rilascio-utilizzabile.md`;
`.telemedic/piani/D63-recepimento-del-ruolo-di-fabbricante.md`; la sezione «Vincoli in vigore»
della bacheca (righe 44-149) per intero; `pipeline/README.md` e
`pipeline/collocazione-dei-controlli.tsv`.

**Letto in modo mirato, non integrale, e lo dichiaro perché incide sull'affidabilità di alcune
conclusioni**: la sezione «Questioni aperte» della bacheca (righe 150-272) è stata letta in forma
troncata a 230 caratteri per riga, più la lettura integrale delle sole voci `Q-06`, `Q-15`,
`Q-110`, `Q-120`, `Q-122`, `Q-124`, `Q-130`, `Q-135`, `Q-140`, `Q-143`, `Q-156`, `Q-161`, `Q-172`,
`Q-184`, `Q-192`, `Q-270`, `Q-276`. Le voci non lette per esteso possono contenere risposte che
smentiscono qualche mia osservazione: dove il rischio è concreto lo segnalo in loco.
`docs/08_compliance/` è stato letto solo nelle sezioni 6 di `03-sistema-di-gestione-della-qualita.md`
e in alcune righe di `02-qualificazione-e-classificazione.md`. `docs/04_protocols/`,
`docs/05_domain/`, `docs/06_security/`, `docs/07_integration/` e `docs/10_fondamenti/` **non** sono
stati letti: dove un ritrovamento dipendesse da essi, non l'ho formulato.

**Una precisazione sul mandato, prima di tutto il resto.** La consegna presuppone che «gli ADR sono
stati scritti in tempi diversi». **Non è così.** Tutti e trenta portano la stessa data:

```
27 accettata | 25 agosto 2026
 1 accettata, provvisoria | 25 agosto 2026
 1 proposta - in attesa di decisione del committente | 25 agosto 2026
 1 parzialmente accettata - il numero resta rinviato a una misura | 25 agosto 2026
```

Il registro delle decisioni non è un sedimento: è un atto unico. Questo cambia il profilo di
rischio in due direzioni opposte, e vanno dette entrambe. In positivo, gli ADR sono coerenti fra
loro per costruzione, e infatti non ho trovato contraddizioni **fra** ADR. In negativo, **nessuna
di quelle trenta decisioni è mai stata messa alla prova da un fatto successivo**, e trenta
decisioni prese in un giorno hanno lo stesso aspetto di trenta decisioni maturate in sei mesi
mentre non lo sono. La regola `P8` di `docs/02_architecture/01-visione-architetturale.md` §5
- «nessuna decisione strutturale senza registro» - è stata onorata; la sua controparte, che una
decisione registrata sia stata anche esercitata, no. Ã un fatto, non una colpa: il progetto è in
progettazione. Ma significa che il registro degli ADR **non è una fonte di evidenza sulla tenuta**,
e va letto come un'ipotesi ben argomentata.

---

## 2. Le contraddizioni trovate

### 2.1 Le due serie temporali: «non insieme» in un capitolo, insieme nell'altro

- `docs/02_architecture/04-modello-dati.md:238` (§4.1): parametri clinici e metriche di canale sono
  «due famiglie di dati a serie temporale, con **regimi giuridici opposti** che **non ammettono di
  essere conservate insieme**».
- `docs/02_architecture/08-viste-di-deployment.md:36` (§2.1): una sola riga di componente,
  «**Archivio a serie temporali** | Parametri clinici e metriche di canale | Sì | Sì».

Il diagramma dei componenti alla riga 78 dello stesso file conferma: un solo nodo `TS`. E
`docs/adr/0020-serie-temporali-in-archivio-dedicato.md`, fra le conseguenze negative accettate,
scrive «**un** archivio in più da installare», al singolare.

Non è un refuso. Le due formulazioni descrivono due sistemi diversi. §4.1 può essere letta come
separazione di **regime** e non di **archivio**, ed è probabilmente ciò che l'autore intendeva;
ma «non ammettono di essere conservate insieme» non è una frase che sopporti quella lettura, e chi
implementa leggerà il capitolo del modello dati prima della vista di dispiegamento, perché è
l'ordine di lettura prescritto in `00-indice.md` §3.2. La divergenza va chiusa scegliendo, non
armonizzando le parole.

Ha una seconda faccia, più seria, ed è al §3.1.

### 2.2 `B-4` è dichiarata non decisa da un capitolo che rinvia a un ADR che la decide

- `docs/02_architecture/09-decisioni-rinviate.md:175-177` (§3, `B-4`): «**Non deciso**: se il
  registro delle configurazioni di fiducia verso un integratore [...] sia **uno solo** o siano più
  registri separati. **Chi decide**: area di integrazione, con area di sicurezza.»
- `docs/adr/0029-registro-di-fiducia-unico-per-tenant.md`: «**Stato**: accettata · **Data**: 25
  agosto 2026 · **Area**: ARCH», decisione «**Si adotta l'alternativa 3**», cioè registro unico
  per tenant con capacità esplicite per voce.

E `docs/adr/README.md`, nella mappa «fra decisioni e questioni di bacheca», elenca «Registro di
fiducia unico per tenant | 0029». La riga di riepilogo `B-4` in `09-decisioni-rinviate.md:369`
riporta ancora l'urgenza «Prima del secondo integratore» senza dire che la decisione è presa,
mentre la riga `B-5` accanto porta correttamente «**Stato**: decise». Il capitolo è quindi
incoerente **con se stesso** nella stessa tabella.

Conseguenza operativa non trascurabile: `09-decisioni-rinviate.md` §1 stabilisce che «una decisione
elencata qui **non può essere presa d'ufficio in una pull request**». Finché `B-4` resta elencata,
chi implementa il registro di fiducia secondo `ADR-0029` sta violando, formalmente, la regola del
capitolo.

### 2.3 Sette questioni di bacheca risultano `APERTA` verso `ARCH` mentre un ADR le chiude

La bacheca si dichiara «Canale di comunicazione fra agenti. **Vincolante.**»
(`.telemedic/context/05_BACHECA_INTERAGENTI.md:3-4`), e il protocollo §3 impone a ogni agente di
chiudere le voci che è in grado di chiudere. Sette voci indirizzate ad `ARCH` sono ferme ad
`APERTA` mentre `docs/adr/README.md` le mappa a un ADR accettato:

| Questione, riga in bacheca | Stato in bacheca | ADR che la chiude, per `docs/adr/README.md` |
|---|---|---|
| `Q-06`, URI del codice fiscale | `APERTA` | `0017` |
| `Q-15`, dieci convenzioni delle interfacce | `APERTA` verso `ARCH` | `0021` |
| `Q-120`, regole del piano di telemonitoraggio | `APERTA` | `0026` |
| `Q-124`, storia degli allarmi senza conservazione | `APERTA` | `0027` |
| `Q-140`, modalità a non conservazione | `APERTA` | `0027` |
| `Q-143`, due proiezioni del piano | `APERTA` | `0030` |
| `Q-161`, modello di fiducia per tenant | `APERTA` | `0029` |

L'ultima riga è la più netta: `Q-156` e `Q-161` hanno **lo stesso oggetto** e stati diversi, la
prima «**RISOLTA da `ARCH`**» con rinvio a `ADR-0029`, la seconda `APERTA`. Due voci sullo stesso
oggetto in due stati diversi nello stesso file vincolante.

Non è pedanteria redazionale. La bacheca è il solo luogo in cui un'area vede che cosa un'altra ha
deciso; un'area che la legga oggi conclude che sette decisioni architetturali che la riguardano non
sono state prese, e o le prende d'ufficio o si ferma. Entrambi gli esiti sono peggiori del lavoro
di allineamento.

### 2.4 Le metriche: «comuni e non riferite a tenant» contro una misura che le vuole per tenant

- `docs/02_architecture/05-multi-tenancy.md:100` (§2.3): «Metriche tecniche di infrastruttura |
  **Comuni** e non riferite a tenant, dove possibile: sono dati di esercizio».
- `docs/02_architecture/01-visione-architetturale.md:278` (scenario `SQ-05`), misura: «La latenza di
  consegna del **novantacinquesimo percentile per gli altri tenant** non varia oltre la soglia
  dichiarata».
- `.telemedic/context/05_BACHECA_INTERAGENTI.md:247` (`Q-184`, `ROAD` verso `SEC` e `ARCH`,
  `APERTA`): chiede che «la **capacità di misura** - storicizzazione della disponibilità **per
  tenant e per servizio** [...] - sia **requisito del primo rilascio**».

Il «dove possibile» di §2.3 è un'attenuazione che non regge il peso: `SQ-05` non è soddisfacibile
senza etichettatura per tenant, e `EV-12` (`06-eventi-e-integrazione-interna.md` §9) impone che
«gli interruttori automatici agiscono **per tenant e per destinazione**, non globalmente», il che
richiede la stessa etichettatura. La regola simmetrica dell'area di sicurezza, `V-155`, vieta di
etichettare le metriche del relay con l'**identificativo di sessione**, che è cosa diversa dal
tenant. Il capitolo di multi-tenancy sta quindi enunciando una restrizione più larga di quella che
i vincoli impongono, e più stretta di quella che i propri scenari di qualità richiedono.

### 2.5 `D61` è una decisione architetturale senza ADR

`docs/09_roadmap/00-indice.md:172` registra: «**`D61`** | I contesti delimitati sono **tredici**: il
gateway terminologico è un contesto | Allinea i tre alberi dei sorgenti a `16 §4.2-4.3` e a
`ADR 0016`».

Ã una decisione sull'elenco dei contesti delimitati, cioè esattamente la materia che
`docs/adr/README.md` definisce come propria del registro («decisioni che **vincolano più di
un'area** o che **sono costose da cambiare**») e che `01-visione-architetturale.md` §5 `P8` vuole
registrata. Non esiste alcun ADR che la recepisca, e né `docs/02_architecture/02-contesti-delimitati.md`
né `docs/adr/` nominano `D61`. Verificato: `D61`, `D62` e `D63` **non compaiono in alcun file di
`docs/02_architecture/` né di `docs/adr/`**.

Nel merito non c'è danno - `CTX-10 Terminologie` figura già fra i tredici a
`02-contesti-delimitati.md:52` - ma il precedente è cattivo: una decisione strutturale è stata
presa e registrata nella roadmap, e la roadmap non è il registro delle decisioni architetturali.

### 2.6 Il piano `D63` e il repository divergono sul lavoro residuo

`.telemedic/piani/D63-recepimento-del-ruolo-di-fabbricante.md` §3, passo 2, elenca come residui da
riscrivere in un atto unico `03_functional/00-indice`, `03_functional/07-fuori-perimetro` voce
`OUT-20`, `07_integration/00-indice` §6.1 e `07_integration/09` §§1.2 e 2.4. Verificato oggi sul
testo: **tutti e quattro portano già la formulazione `D63`** - `docs/03_functional/00-indice.md`
ultime righe, `docs/03_functional/07-fuori-perimetro.md:95` (`OUT-20`),
`docs/07_integration/00-indice.md:186-190`, `docs/07_integration/09-obblighi-di-chi-integra.md:44-49`.

Il piano è quindi superato dai fatti almeno sul passo 2. Non lo segnalo per zelo: `D63` §8 è la
tabella «che cosa resta, e a chi», ed è il documento su cui l'orchestrazione deciderà `Q-292`
(«la sequenza precede o segue i traguardi a calendario»). Una tabella di lavoro residuo che elenca
lavoro già fatto porta a stimare male esattamente la decisione che `Q-292` chiede.

---

## 3. Le decisioni motivate da una premessa che `D63` ha reso falsa

Va detto subito, perché è il ritrovamento che orienta questa sezione: **nessun ADR nomina la
figura del fabbricante, la marcatura CE, l'MDR o IEC 62304.** Verificato con ricerca testuale su
tutti e trenta. Neanche `docs/02_architecture/` li nomina, salvo due occorrenze incidentali
(`01-visione-architetturale.md:368` e `:485`). Non esiste quindi, nell'area architetturale, una
frase che `D63` renda falsa.

Questo è un risultato peggiore di quello che cercavo, non migliore. **L'area architetturale non ha
mai recepito il quadro regolatorio nemmeno nella versione precedente**, e infatti la sequenza di
recepimento di `D63` attraversa sette aree - `COMP`, `ROAD`, `FUNZ`, `INTEG`, `SEC`, `PROTO`,
`TECH`, `GUIDA`, `PROD` - e **`ARCH` non è fra queste** (`D63` §§3 e 8). L'area che
`00-indice.md` §1 dichiara sovraordinata a tutte le altre sui fatti architetturali è l'unica che
la sequenza non tocca.

Ciò che `D63` falsifica non è un enunciato, è un'**allocazione implicita di costo**. Quattro casi
concreti.

### 3.1 La segregazione fra elementi di classe B e di classe A non è progettata da nessuno

`docs/08_compliance/03-sistema-di-gestione-della-qualita.md:325-327` (§6.1):

> «**Classe dichiarata del sistema software: B**, con item di classe A isolati e **segregazione
> documentata** ai sensi della clausola 5.3.5. La norma richiede che l'architettura **dimostri
> l'efficacia della segregazione**, non che la affermi: un'affermazione di segregazione non
> accompagnata dal meccanismo che la realizza - confine di processo, confine di rete, assenza di
> percorso di dati - è un rilievo garantito.»

E alla riga 335: «**Ã una decisione architetturale, non una scelta di prodotto**».

La stessa sezione classifica «Metriche di qualità, cruscotti, telemetria tecnica» come **classe A,
previa segregazione documentata**, e «Acquisizione, trasmissione, persistenza e presentazione dei
parametri» come **classe B**.

Ora si torni al §2.1 di questo documento. Le due famiglie stanno, per
`08-viste-di-deployment.md:36`, **nello stesso componente**, e per `ADR-0020` in **un** archivio
aggiuntivo con due regimi di conservazione e accesso. Un regime di conservazione non è né un
confine di processo, né un confine di rete, né l'assenza di un percorso di dati: è esattamente
la forma di segregazione che la clausola 5.3.5 non accetta.

`docs/02_architecture/00-indice.md` §6 dichiara che l'area non contiene «Fascicolo tecnico, gestione
del rischio, ingegneria dell'usabilità», che vanno a `docs/08_compliance/`. La **progettazione
architetturale della clausola 5.3** non è nessuna delle tre, e non è dichiarata fuori da nessuna
parte. Il §3.4 dello stesso indice dice che l'area «non contiene la determinazione di qualificazione
e classificazione: la **presuppone e ne descrive le conseguenze strutturali**». La conseguenza
strutturale più costosa della classificazione non è descritta.

Finché il fascicolo era di un terzo, questa lacuna era una lacuna di quel terzo. Con `D63` è
nostra, ed è sul percorso critico di un requisito di prodotto.

### 3.2 La separazione dei privilegi del registro è scaricata su chi installa

- `docs/02_architecture/07-tracciamento-e-registro-immutabile.md` §2.3: «il progetto **fornisce il
  meccanismo, non può imporre la separazione dei ruoli** in un'organizzazione che non controlla».
- `docs/02_architecture/08-viste-di-deployment.md` §3.2, riga della tabella: «Separazione dei
  privilegi fra archivio applicativo e archivio del registro | **Requisito, non raccomandazione.**
  In sua assenza la garanzia si riduce a quella della sola catena applicativa».

Il ragionamento è onesto e, sotto la premessa precedente, corretto. Sotto `D63` cambia natura. Il
registro immutabile è un item di **classe B** (`08_compliance/03` §6.1, riga «Identità,
autorizzazioni, isolamento fra tenant, registro immutabile»), quindi un elemento che realizza una
misura di controllo del rischio. Una misura di controllo del rischio che il fabbricante **delega
all'utilizzatore** è informazione per la sicurezza, cioè il livello più debole della gerarchia.
Il progetto ha già fatto esattamente questo ragionamento, in un altro punto e per un altro oggetto:
`V-202` (`.telemedic/context/05_BACHECA_INTERAGENTI.md`, area `PROD`) stabilisce che la copertura
oraria «è una misura di controllo del rischio del livello più debole della gerarchia - informativa
- e presentarla come parametro negoziabile ne autorizza la riduzione senza la valutazione che
`RF-314` impone». Lo stesso argomento si applica alla separazione dei privilegi e **non è stato
applicato**.

Il rilevatore previsto (`TR-12`: «la configurazione in cui archivio applicativo e archivio del
registro condividono le credenziali è rilevata e segnalata») e la verifica all'avvio di §8 -
«avviso bloccante con conferma esplicita nell'installazione presso il cliente» - sono la mitigazione
corretta sotto la premessa vecchia. Sotto quella nuova va deciso se la conferma esplicita sia
ancora ammissibile, o se debba diventare rifiuto di avvio anche presso il cliente, con la
conseguenza commerciale che ne discende. Non lo decido io: dico che nessuno l'ha riesaminato.

### 3.3 Il periodo di supporto è rinviato «al soggetto che distribuisce», che ora siamo noi

`docs/02_architecture/09-decisioni-rinviate.md` §4, `C-4`: «**Perché non la decide quest'area**: è
un impegno del **soggetto che distribuisce**, con conseguenze regolatorie ed economiche.»

Sotto `D58` e `D63` quel soggetto è il progetto, e il soggetto giuridico non esiste ancora
(`Q-280`, punto di decisione 19 settembre 2026). Il rinvio quindi non punta più a un terzo: punta a
noi, e la catena si chiude su un soggetto da costituire. Peggio: `docs/09_roadmap/03-primo-rilascio-utilizzabile.md`
§4.4 dichiara che il piano di dismissione delle versioni è «**prerequisito di `T-10`** e non voce
di coda», cioè ha come termine il 30 novembre 2026. Il capitolo delle decisioni rinviate lo
classifica «Prima della prima distribuzione» senza dire che quella distribuzione è `RU-1` e che la
data è fissa. Ã la stessa questione, con due urgenze diverse in due documenti.

### 3.4 Dove `D63` **rafforza** invece di indebolire, e va detto

Sarebbe disonesto presentare `D63` come una decisione che smonta l'impianto. In almeno tre punti lo
conferma, e con più forza di prima.

Il criterio `C5` di `docs/01_technical/01-stack-e-motivazioni.md` §2 e la regola di
`08-viste-di-deployment.md` §1 - «un componente in più non costa solo la sua complessità: costa la
probabilità che venga configurato male» - diventano più stringenti, non meno: sotto IEC 62304
§8.1.2 ogni componente è anche una scheda di sorveglianza a dieci campi
(`01-stack-e-motivazioni.md` §14.1) e un elemento di configurazione con versione esatta (`V-173`).
Il costo di un componente aggiuntivo è salito. Ne discende che `A-1` (motore di flusso dedicato
contro macchina a stati persistita) e `B-2` (motore separato per il registro) hanno oggi una
risposta **più** chiara di ieri, e nella stessa direzione già suggerita dal capitolo. Lo stesso
vale per il rifiuto dell'unità di inoltro selettivo e della griglia di servizi
(`01-stack-e-motivazioni.md` §13).

---

## 4. La tenuta sotto la capacità dichiarata

La capacità è un contributore unico a tempo parziale (`D54`), quantificata in dieci-venti ore
settimanali (`D62`, 26 agosto 2026). `V-282` stabilisce che l'ambito è l'unica variabile libera.
La roadmap ha già fatto da sola la parte più difficile di questa sezione, e va citata prima di
aggiungere qualsiasi cosa - `docs/09_roadmap/00-indice.md`, registro delle revisioni del 26 agosto
2026:

> «Con la capacità ora quantificata da `D62`, la finestra per il codice applicativo è di
> **quarantanove giorni** [...] cioè circa **settanta-centoquaranta ore**. In quella finestra
> `T-08` porta **due criteri che il progetto stesso classifica "mesi"** [...] **L'aritmetica non
> chiude.**»

Non ho niente da aggiungere sulla diagnosi. Ho quattro cose da aggiungere sulla **causa
architetturale**, che la roadmap non può vedere perché non è la sua materia.

### 4.1 L'impianto è progettato per due assetti e il piano ne contiene uno

`docs/02_architecture/08-viste-di-deployment.md` §1: «Telemedic esiste in due assetti di
distribuzione: **installazione presso il cliente** e **servizio gestito**. [...] due configurazioni
dello stesso codice, e questo vincolo determina **tutta** la vista di dispiegamento.»

L'espressione «servizio gestito» compare **una sola volta in tutta `docs/09_roadmap/`**, di
passaggio, dentro un rischio di licenza (`05-rischi-e-dipendenze.md:633`). Non ha un traguardo, non
ha una data, non è nell'ordine di sacrificio di `03-primo-rilascio-utilizzabile.md` §6, e **non è
dichiarato fuori perimetro** né in `docs/03_functional/07-fuori-perimetro.md` né altrove.

Ã il singolo squilibrio più grande fra impianto e piano. Ne dipendono, e con esso restano senza
un momento in cui verranno esercitati:

- `SQ-05`, il rumore di un tenant che non degrada gli altri (`01-visione-architetturale.md` §4);
- `SQ-08`, il ripristino selettivo di un tenant (idem), che è **la giustificazione decisiva** di
  `ADR-0007`;
- metà di `08-viste-di-deployment.md` (§§4, 7) e la matrice delle differenze ammesse;
- `V-188` (bacheca riga 120, `ROAD` verso `ARCH`), che impone che la suite di integrazione eserciti
  «sempre almeno **due tenant e due integratori distinti**, con configurazioni deliberatamente
  divergenti». `RU-1` ha un tenant e, per `TG-04`, «**un solo consumatore configurato per tenant**».

Non sto dicendo che il servizio gestito vada tagliato. Sto dicendo che oggi non è né pianificato
né escluso, e questa è la condizione peggiore: si continua a pagarne il costo di progettazione in
ogni capitolo senza che nessun traguardo ne ricavi il beneficio.

### 4.2 `ADR-0007` compra in `RU-1` una proprietà che `RU-1` non usa, ed è ancora reversibile

`ADR-0007` sceglie lo schema per tenant. Le tre ragioni decisive dichiarate - ripristino selettivo,
dimostrabilità strutturale della separazione fra titolari autonomi, dismissione come operazione su
uno spazio di nomi - sono **tutte e tre proprietà del servizio gestito**, che per il §4.1 non ha
data. I compromessi accettati - «le migrazioni sono N; il numero di oggetti cresce con i clienti; il
pool richiede impostazione e azzeramento del contesto a ogni prestito» - si pagano invece dal primo
giorno, e il primo si paga in **capacità ricorrente**, che è la voce che `D62` ha reso critica
(`docs/09_roadmap/01-principi-e-metodo.md` §... «Capacità netta = capacità dichiarata − capacità
ricorrente»).

L'obiezione ovvia è `R11` di `01-visione-architetturale.md` §7: «Rimandare la multi-tenancy a dopo
il primo cliente [...] non è mai recuperabile dopo: la tenancy non è uno strato che si aggiunge,
è una proprietà di ogni chiave, ogni indice, ogni migrazione, ogni evento e ogni riga di
registro». L'obiezione è giusta e va tenuta ferma. Ma **non è un argomento per lo schema per
tenant**: l'alternativa 1 di `ADR-0007`, righe condivise con colonna discriminante e sicurezza di
riga, porta anch'essa l'identificativo di tenant su ogni chiave, ogni indice, ogni evento e ogni
riga di registro. `R11` protegge la proprietà; `ADR-0007` sceglie il meccanismo. Sono due decisioni,
e l'ADR le tratta come una.

Il punto che rende questa osservazione operativa e non accademica: **il passaggio da righe condivise
a schema per tenant è meccanico finché i tenant sono uno**. La finestra di reversibilità si
chiude con il secondo tenant, non con la prima riga di codice. E il secondo tenant non esiste, non
ha data, e appartiene all'assetto del §4.1. `ADR-0007` è quindi, nella tassonomia del progetto, una
decisione **presentata come irreversibile mentre è ancora reversibile**, e il costo che impone è
ricorrente in un periodo in cui l'aritmetica non chiude.

Non propongo di rovesciarla in questo documento: `docs/adr/README.md` §«Come si propone una
modifica» prescrive un ADR nuovo. Propongo che sia riesaminata (voce 2 del §8).

### 4.3 Le verifiche bloccanti sono un impegno di esercizio perpetuo, e nessuno le ha contate

L'area architetturale prescrive, come bloccanti:

| Fonte | Verifiche |
|---|---|
| `05-multi-tenancy.md` §9 | `MT-1`…`MT-12` |
| `06-eventi-e-integrazione-interna.md` §9 | `EV-1`…`EV-12` |
| `07-tracciamento-e-registro-immutabile.md` §8 | `TR-1`…`TR-12` |
| `01-visione-architetturale.md` §8 | undici verifiche automatiche, non numerate |
| `08-viste-di-deployment.md` §8 | undici verifiche di configurazione **all'avvio**, con rifiuto di avvio |
| `08-viste-di-deployment.md` §5.2, strato 4 | una suite di abuso contro il relay |
| `08-viste-di-deployment.md` §6.1, passo 3 | la verifica di percorribilità con le dipendenze facoltative disattivate |
| `01-visione-architetturale.md` §4 | dieci scenari di qualità, ciascuno con una «Misura» |

Trentasei verifiche numerate, più ventidue non numerate, più tre suite, più dieci misure. Le
undici di `01-visione` §8 si sovrappongono in parte alle `MT`/`EV`/`TR`; anche scontando
generosamente la sovrapposizione, l'ordine di grandezza è **cinquanta controlli bloccanti**.

Ora la regola del progetto, da `CLAUDE.md`: «**Un controllo che nessuno ha visto fallire non è un
controllo.** Ogni controllo ha un caso in `scripts/prove/esegui-prove.sh` che lo vede fallire,
provato per mutazione». Lo stato attuale, misurato: `pipeline/collocazione-dei-controlli.tsv`
contiene **sedici** righe di controllo, e `scripts/prove/esegui-prove.sh` contiene **73** occorrenze
di `esegui_caso`. Il rapporto osservato è dell'ordine di quattro-cinque casi di prova per
controllo, ciascuno da mantenere vivo e da riprovare per mutazione.

Estrapolare linearmente sarebbe scorretto e non lo faccio: molti dei controlli architetturali sono
prove di integrazione, non script di pipeline, e il rapporto non si conserva. Ma la direzione non è
in dubbio, e il punto è questo: **le cinquanta verifiche bloccanti non sono un costo di
costruzione, sono un costo di esercizio**. Ogni volta che il modello dati cambia, `MT-5` va
riverificata; ogni volta che un tipo di evento nasce, `EV-7` e `EV-8`; ogni volta che si tocca un
percorso di lettura clinica, `TR-2`. Sotto dieci-venti ore settimanali questo è il tributo fisso, e
**non compare nella capacità ricorrente** di `docs/09_roadmap/01-principi-e-metodo.md`, che elenca
la sorveglianza dei componenti di terze parti (`V-185`) e non la manutenzione dei controlli.

Osservo per inciso, senza entrare nell'area tecnica, che `G11` - uno dei controlli obbligatori
`G1`…`G13` - **non compare** in `pipeline/collocazione-dei-controlli.tsv`, che ne elenca sedici da
`G1` a `G13` più i provvisori `T01-*` e `T03-*`. Esiste un piano attivo
(`.telemedic/piani/G11-regola-di-riservatezza.md`), quindi può essere lavoro in corso e non una
lacuna: `[NV-1]`.

### 4.4 Il registro immutabile è un punto di serializzazione globale nel solo assetto che `RU-1` consegna

Tre righe dell'impianto, prese insieme, dicono una cosa che nessuna delle tre dice da sola.

- `07-tracciamento-e-registro-immutabile.md` §3.2: «Lettura di dato clinico | **Sì, ogni singola
  lettura**».
- Idem §2.1: «Il numero di sequenza è assegnato in modo **strettamente crescente per tenant**, e
  una scrittura concorrente **si serializza su quel punto**. Ã un punto di contesa deliberato».
- Idem §4: «Il fallimento della scrittura di registro **fa fallire l'operazione applicativa** [...]
  Il registro è **sul percorso critico**».

Il volume di scritture del registro **coincide con il volume di letture cliniche**, ogni scrittura
si serializza su un contatore per tenant, la scrittura è bloccante, e nell'installazione presso il
cliente - il solo assetto che `RU-1` consegna, `TG-08` - i tenant sono «uno, o pochi». Quindi in
`RU-1` esiste **un contatore unico su cui si serializza ogni lettura di dato clinico del sistema**,
e il suo fallimento è indisponibilità clinica.

Il capitolo se ne accorge a metà: «la garanzia di sequenzialità vale il costo, e il volume di
scritture del registro è dominato dalle letture di dato clinico, non dalla contesa». La seconda
metà della frase è offerta come rassicurazione e in realtà è la premessa del problema. Nessun
punto non verificato di `07` §9 né di `05` §10 elenca questa misura, e `R-20`
(`docs/09_roadmap/05-rischi-e-dipendenze.md:586`) descrive il registro come costoso da
**costruire**, non da **percorrere**.

Non affermo che non regga: non è stato misurato, e `[NV-2]`. Affermo che è l'unica proprietà
prestazionale dell'impianto che sta sul percorso critico di **ogni** operazione clinica, che nessun
documento la elenca come da verificare, e che scoprirla a `T-08` chiuso significherebbe rimettere in
discussione insieme la catena per tenant (`ADR-0013`), la scrittura bloccante e la copertura
integrale, che `docs/09_roadmap/01-principi-e-metodo.md` §7.3 dichiara **non riducibile**.

### 4.5 Il conto dei componenti obbligatori

`08-viste-di-deployment.md` §2.1 marca obbligatori: applicazione, interfaccia utente, archivio
relazionale, archivio a serie temporali, archivio del registro immutabile, broker di eventi,
prodotto di federazione dell'identità, sorveglianza e raccolta delle metriche, più servizio di
segnalamento e relay «per le prestazioni sincrone» - che sono esattamente la prestazione di `RU-1`.
Dieci componenti, ciascuno con scheda di sorveglianza a dieci campi
(`01-stack-e-motivazioni.md` §14.1), livello di servizio in giorni dall'avviso (`V-185`), versione
esatta senza etichette mobili (`V-173`) e valutazione d'impatto a ogni aggiornamento.

`08-viste-di-deployment.md` §1 enuncia il principio giusto - «il peso operativo dell'installazione
presso il cliente è un vincolo di progetto» - e poi §2.1 elenca dieci componenti obbligatori senza
un budget. Il principio non ha un numero, quindi non ha morso. `TG-04` ha già tolto il broker da
`RU-1`, ed è l'unico taglio che allevia chi installa: è stato deciso dalla roadmap, non
dall'architettura, il che dice quale delle due sta davvero governando il peso operativo.

---

## 5. Dove l'impianto si incrina per primo, ordinato per costo del ritardo

Ordinato per **costo di scoprirlo tardi**, non per gravità astratta. Per ciascuno: che cosa manca,
quando si paga, quanto costa il ritardo.

### `I-1` - La segregazione fra classe B e classe A. Costo del ritardo: massimo.

**Che cosa manca.** Il meccanismo che dimostra la segregazione richiesta dalla clausola 5.3.5
(§3.1). Non un documento: un confine.

**Quando si paga.** Al criterio 1 di `T-08` (14 novembre 2026), che chiede «la struttura dei moduli
esiste e le **regole di dipendenza sono verificate automaticamente** [...] provato con una
violazione deliberata che deve far fallire la costruzione». Quel controllo cristallizza i confini
dei moduli. Se i confini non incorporano la segregazione, il controllo **renderà permanente il
confine sbagliato**, perché d'ora in poi ogni tentativo di spostarlo farà fallire la costruzione.

**Costo del ritardo.** Rifare la struttura dei moduli, più il controllo, più il suo caso di prova
negativo, in un periodo in cui l'aritmetica già non chiude. E, sotto `D63`, farlo sapendo che il
rilievo era prevedibile: `08_compliance/03` §6.1 lo scrive già oggi.

### `I-2` - Struttura di versionamento della distribuzione e periodo di supporto. Costo del ritardo: molto alto, costo della decisione: quasi nullo.

**Che cosa manca.** `Q-172` (bacheca riga 228, `COMP` verso **ORCH** e **`ARCH`**): «la sua scelta
su **come si numera e si compone una distribuzione** determina che cosa quell'identificativo
identificherà, quali modifiche sono nuove versioni dello stesso dispositivo e quali sono un
dispositivo diverso. Va decisa **prima del primo rilascio della distribuzione**: una rinumerazione
successiva è una **discontinuità di identificazione**, e la discontinuità di identificazione in
un dispositivo registrato non si sana con una nota di rilascio.» Più `C-4`/`Q-186`, il periodo di
supporto, che `03-primo-rilascio-utilizzabile.md` §4.4 dichiara **prerequisito di `T-10`**.

**Quando si paga.** Il 30 novembre 2026. Il punto di decisione dichiarato è il 15 ottobre 2026
(`02-traguardi.md` §7, milestone «Periodo di supporto dichiarato»).

**Costo del ritardo.** Asimmetrico come nessun altro punto di questo elenco: decidere costa alcune
ore, non decidere costa una discontinuità non sanabile. **`Q-172` non figura in
`docs/02_architecture/09-decisioni-rinviate.md`**, che è il capitolo che dovrebbe contenerla, e
`C-4` vi figura senza la data che la lega a `T-10`.

### `I-3` - Le grandezze che contano eventi. Costo del ritardo: irrecuperabile, e cresce ogni giorno di esercizio.

**Che cosa manca.** Tre cose che sono la stessa cosa vista da tre aree:

- `V-178` (bacheca riga 133, `COMP` verso `TECH`, `SEC`, **`ARCH`**, `FUNZ`): tassonomia stabile
  degli eventi contati e conservazione della diagnostica pari alla finestra di vigilanza.
  «Rinominare o accorpare una categoria rende la serie incomparabile e **fa sparire l'aumento
  significativo invece di rilevarlo**.»
- `V-177` (riga 132, verso **`ARCH`**, `FUNZ`, `DOM`, `TECH`): le grandezze del seguito clinico
  «devono **esistere come dato**, con definizione stabile, versionata e confrontabile [...]
  **prima** che il piano sia scritto».
- `Q-184` (riga 247) e `B-6`: storicizzazione della disponibilità per tenant e per servizio, come
  requisito del primo rilascio.

**Quando si paga.** Dal primo giorno di esercizio di `RU-1`. Non c'è un momento successivo.

**Costo del ritardo.** `Q-276` (riga 242) lo dice meglio di quanto lo direi io: sono capacità
«**retroattivamente irrecuperabili** quanto le quattro attività di `D45`, e **non figurano in
quell'elenco**». Aggiungo: non figurano neppure in
`docs/02_architecture/09-decisioni-rinviate.md`, e nessun capitolo dell'area architetturale nomina
`V-177` o `V-178`. Verificato: l'area architetturale cita vincoli da `V-01` a `V-166` e **nessuno
sopra `V-166`**.

### `I-4` - L'ancoraggio del registro. Costo del ritardo: già pagato, e non risulta a chi lo ha deciso.

**Che cosa manca.** `TG-23` toglie da `RU-1` l'ancoraggio periodico firmato, marcandolo
«**irreversibile per il periodo**» (`03-primo-rilascio-utilizzabile.md` §4.2, famiglia «Registro
immutabile»). `ADR-0013` e `07-tracciamento` §2 costruiscono la garanzia su **quattro** strati e
dichiarano che la finestra di vulnerabilità residua è «le voci comprese fra due ancoraggi
consecutivi». Senza ancoraggi, la finestra è l'intera storia del periodo.

**La contraddizione.** `09-decisioni-rinviate.md` §3 `B-1` dice: «Se non viene presa: il meccanismo
è **realizzabile lo stesso con un intervallo provvisorio**, ma la garanzia dichiarabile
pubblicamente non è determinabile.» Ma non è che la decisione non è stata presa: è che
**è stata presa altrove**, dalla roadmap, in senso opposto, ed è irreversibile. Il capitolo delle
decisioni rinviate descrive uno stato di cose che non esiste più.

**Costo del ritardo.** Non è il costo di decidere: è il costo di non aver allineato le due
formulazioni pubbliche. `SQ-01` e `07` §2 descrivono una garanzia a quattro strati; `RU-1` ne
consegna due. Chi legge l'area architetturale per valutare un'installazione (`00-indice.md` §3.3
manda proprio lì) ricava una garanzia che il rilascio non ha.

### `I-5` - Il marcatore di sinteticità non è nel modello dati. Costo del ritardo: alto, costo oggi: minimo.

`V-192` (bacheca riga 122, `GUIDA` verso **`ARCH`**, `TECH`, `FUNZ`): «Ogni record prodotto dal
generatore porta un attributo esplicito di sinteticità **conservato insieme al dato** [...] e va
recepito nel **modello dati**, non lasciato alla sola fabbrica di prova.»

`docs/02_architecture/04-modello-dati.md` non contiene alcun attributo di sinteticità. La parola
«sintetici» vi compare due volte, entrambe come nota redazionale sugli esempi (`:354`, `:449`).

**Costo del ritardo.** Una colonna aggiunta prima della prima riga di codice è una riga di schema.
Aggiunta dopo che esistono dati di collaudo in un ambiente di qualcun altro, è una migrazione su
ogni tabella più l'impossibilità di marcare con certezza ciò che è già stato scritto. La
domanda che `V-192` vuole trasformare «da un'indagine a una interrogazione» resta un'indagine.

### `I-6` - Il registro dei parametri di configurazione. Costo del ritardo: cresce linearmente.

`V-193` (riga 123) e `Q-192` (riga 218): i quattro piani di configurazione sono stabiliti, l'elenco
dei parametri non esiste in un solo luogo ed è «disperso fra `docs/02_architecture/05-multi-tenancy.md`
§2.3, `08-viste-di-deployment.md` §§3.2 e 8, l'area tecnica e l'area funzionale». `Q-192` chiede un
artefatto **generato** che faccia fallire la costruzione se un parametro esiste nel codice e non nel
registro, e che alimenti le verifiche di configurazione bloccanti all'avvio, che oggi sono «un
elenco chiuso scritto a mano» in `08-viste-di-deployment.md` §8.

Il costo del ritardo è proporzionale al numero di parametri già esistenti quando lo si crea, e
`V-193` porta una conseguenza che non è amministrativa: «**le soglie cliniche non sono
configurazione di tenant** [...] un parametro clinico che compaia nel piano "configurazione di
tenant" è un **difetto di perimetro**». Senza il registro, quel difetto non è rilevabile
automaticamente, e `V-02` resta una regola senza presidio.

### `I-7` - Il contesto della rendicontazione. Costo del ritardo: reale ma differito oltre `RU-1`.

`C-1` e `ADR-0023`. L'argomento del capitolo è corretto - con un contesto autonomo `V-166` è un
confine verificabile, senza è una convenzione - e la sua urgenza dichiarata, «prima della
realizzazione dell'evento di liquidazione», è altrettanto corretta. Ma i moduli di fatturazione
sono fuori da `RU-1` (`03-primo-rilascio-utilizzabile.md` §4.2, categoria II), quindi l'innesco non
arriva entro il 30 novembre. Lo colloco settimo, non perché sia meno grave, ma perché **è l'unica
delle voci "irrecuperabili" di `09-decisioni-rinviate.md` §5 il cui innesco cade dopo `RU-1`**. Il
capitolo lo mette in grassetto insieme a `B-3` e `B-8`; il §6 spiega perché quella terna è scelta
male.

---

## 6. Le decisioni rinviate: irrecuperabili e rinviabili davvero

La distinzione che il capitolo `09-decisioni-rinviate.md` mette in grassetto al §5 è **`B-3`,
`B-8`, `C-1`**. Sostengo che sia sbagliata in due delle tre voci, e che manchino le due che contano
di più. Caso per caso.

### Rinviabili davvero, e con l'argomento

**`A-1`, meccanismo dell'orchestrazione.** Rinviabile, e più di quanto il capitolo creda. Il
termine dichiarato è «prima della realizzazione del secondo processo orchestrato», e i quattro
processi orchestrati individuati (`06-eventi-e-integrazione-interna.md` §6.2) sono chiusura-
refertazione-trasmissione, arruolamento in un piano con consensi, dismissione di un tenant,
rettifica di un documento trasmesso. **Il primo e il quarto escono con `TG-01`** (documentazione
clinica e refertazione), **il secondo con il telemonitoraggio** (categoria II). Ne resta uno. Il
termine non può arrivare entro `RU-1`. Nota però un effetto collaterale che il capitolo non vede:
`A-1` chiede come prova «un **prototipo del processo di chiusura, refertazione e trasmissione**», ed
è esattamente il processo che `TG-01` rimuove. La condizione che il capitolo pone per decidere non
sarà producibile. Il criterio va riscritto, non la decisione.

**`A-2`, lettura dell'outbox ad alto volume.** Rinviabile senza costo, e il capitolo ha
ragione per la ragione giusta: «il contratto degli eventi non cambia fra le due modalità». Aggiungo
la conseguenza che serve all'analisi in corso sulla messaggistica: poiché `ADR-0008` fissa l'outbox
come unica sorgente, `EV-10` vieta a ogni percorso applicativo di scrivere direttamente sul broker,
e `08-viste-di-deployment.md` §2.1 dichiara il broker «Sì, dietro l'interfaccia di pubblicazione»,
**la scelta della tecnologia di messaggistica è architetturalmente a basso costo di cambiamento**,
e per giunta il broker è fuori da `RU-1` (`TG-04`). Ã oggi la meno urgente delle decisioni
tecnologiche aperte. Non entro nel merito di quale tecnologia: dico che l'impianto ha già l'anello
che rende quella scelta reversibile, e che lo stesso non vale per il segnalamento, dove `ADR-0012`,
`C5` e `V-131` (consegna dei candidati esattamente una volta e in ordine) escludono per costruzione
il transito dal piano degli eventi.

**`A-3`, revisione successiva dello standard.** Rinviabile. L'invariante che protegge il rinvio -
il dominio non conosce la versione - è già una verifica automatica (`01-visione` §8, prima riga).
Con un'avvertenza: `TG-02` toglie da `RU-1` la facciata di interoperabilità, quindi in `RU-1`
quella verifica **passerà a vuoto**, perché non esisterà alcun pacchetto di mappatura da cui
distinguere il dominio. Un controllo che non può fallire non è un controllo: va marcato come
degenere in `RU-1`, con la stessa onestà con cui `TG-05` marca degenere il criterio sulle
terminologie.

**`A-4`, endpoint di sessione in FHIR.** Rinviabile. Innesco esterno, nessun costo di attesa.

**`B-3`, licenze di scale e questionari.** Il capitolo lo mette in grassetto: «va chiusa **prima**
che venga scritto il primo motore di calcolo. Scriverlo e poi scoprire che lo strumento non è
utilizzabile significa rimuovere una funzione già promessa.» **Non regge.** `ADR-0024` ha già
assunto in via cautelativa la posizione conservativa: il dominio non rappresenta punteggi, le
risposte ai questionari strutturati sono rappresentate e conservate, il punteggio no. Con quella
decisione in vigore, il motore di calcolo **non verrà scritto** finché la questione non è chiusa,
e le risposte - che sono il dato di cui il punteggio sarebbe funzione - sono già persistite. Se un
giorno il calcolo diventa lecito, si aggiunge una funzione su dati esistenti: nessuna migrazione,
nessuna rimozione. Aggiungo che il telemonitoraggio è fuori da `RU-1` per intero. `B-3` è oggi una
delle voci **meno** urgenti dell'elenco, e la sua evidenziazione tipografica sottrae attenzione a
`B-6`.

**`B-7`, materiale documentale.** Rinviabile, e la ragione dichiarata è solida: dataset canonico
(`ADR-0005`), serializzazione sostituibile, «manca il contenuto, non il progetto». Sottoscrivo.

**`B-7-bis`, costrutti delle regole del piano.** Rinviabile. Telemonitoraggio fuori da `RU-1`, e
l'insieme dei costrutti è chiuso per costruzione (`ADR-0026`).

**`B-9`, contratto del gateway di misure.** Rinviabile per la stessa ragione. L'assunzione
cautelativa - assenza rappresentata come entità con causa «non determinabile» - preserva `V-148` e
`V-09` senza pregiudicare l'esito.

**`C-2`, componente che termina la cifratura.** Chiusa, esclusa per la versione corrente. Nulla da
aggiungere.

**`C-3`, contenitore del materiale registrato.** Rinviabile: `V-11` e `V-115` già impongono la
negoziazione a runtime, e la registrazione lato server è fuori da `RU-1` (categoria II).

### Retroattivamente irrecuperabili

**`B-6`, soglie di sorveglianza e livelli di servizio. Irrecuperabile nella misura, non nella
soglia, e il capitolo scambia le due.** Il capitolo dichiara di aver già fissato «**che cosa** va
sorvegliato» e rinvia i valori. La distinzione è giusta e la classificazione che ne fa è sbagliata,
perché fra «che cosa» e «con quale soglia» c'è un terzo termine: **con quale granularità e per
quanto tempo si conserva la serie**. `Q-184` lo dice in una riga: «Aggiungere la misura dopo
significa non avere serie storiche nel momento in cui servono». Una soglia si decide in un giorno,
in qualunque giorno; una serie storica di dodici mesi si ottiene solo avendo cominciato dodici mesi
prima. `B-6` è irrecuperabile e il riepilogo del §5 la marca «Prima dell'esercizio» senza
grassetto, cioè al livello di urgenza di `B-1` e `B-2`. Ã l'errore di classificazione più costoso
del capitolo.

**`B-1`, parametri del registro. Irrecuperabile per il periodo, e già consumata.** Vedi `I-4`.
Quello che resta genuinamente rinviabile è l'**intervallo**; quello che è già perduto è
l'**esistenza** degli ancoraggi per il periodo `RU-1`. Il capitolo tratta l'intera voce come
rinviabile.

**`B-2`, motore e archivio del registro. Due questioni in una, con esiti opposti.** La scelta del
**motore** è rinviabile e il criterio suggerito dal capitolo è corretto (la separazione dei
privilegi è il requisito, il motore separato una sua realizzazione possibile). La **separazione dei
privilegi durante il periodo `RU-1`** non è rinviabile: è una proprietà datata, e una catena
scritta sotto credenziali condivise non diventa retroattivamente una catena scritta sotto privilegi
disgiunti. `07-tracciamento` §2.3 distingue correttamente le due cose;
`09-decisioni-rinviate.md` `B-2` le fonde in una domanda sola, e chi legge il capitolo delle
decisioni rinviate conclude che tutta la voce può aspettare.

**`B-8`, propagazione del livello di garanzia. Irrecuperabile in senso proprio: no. Bloccante: sì.**
Il capitolo ha ragione sull'urgenza e sbaglia la categoria. Non è una decisione: è una **verifica
empirica**, e come tale è già collocata in `T-04` (3 ottobre 2026). Il suo costo di ritardo non è
retroattivo, è immediato: blocca la documentazione pubblica di un meccanismo di sicurezza. Va
tolta dall'elenco delle decisioni rinviate e lasciata dove appartiene, altrimenti compare due volte
con due titolari.

**`C-1`, contesto della rendicontazione. Irrecuperabile, con innesco oltre `RU-1`.** Vedi `I-7`.

**`C-4`, periodo di supporto. Irrecuperabile e sottovalutata.** Vedi `I-2` e §3.3. Ã l'unica voce
del capitolo che ha **una data ferma** - 30 novembre 2026, come prerequisito di `T-10` - e il
capitolo non la riporta.

**`A-5`, numero massimo di partecipanti. La metà irrecuperabile è altrove.** Il **numero** è
rinviabile: dipende da una misura, la misura si può fare quando serve, e `RU-1` è a due
partecipanti (categoria II). Ciò che non è rinviabile è il presupposto della misura, cioè la
**dichiarazione del dispositivo e della rete di riferimento** (`Q-115`, `Q-175`), che il capitolo
menziona come «decisione di prodotto» senza collocarla nel proprio elenco. Da quella dichiarazione
dipendono anche le soglie di prestazione dell'interfaccia, che `03-primo-rilascio-utilizzabile.md`
§4.3 rinvia per la stessa ragione. E c'è una catena che il capitolo enuncia e non chiude: se la
misura escludesse il terzo partecipante, l'interprete - «la misura alternativa dichiarata per una
non conformità di accessibilità nota» - cade; ma `V-175` impone che «l'elenco delle
caratteristiche legate alla sicurezza e l'elenco dei criteri oggetto di non conformità dichiarata
hanno **intersezione vuota**». Se l'interprete cade, quella non conformità non è più dichiarabile
e diventa un rischio d'uso non controllato. La catena va chiusa prima che il fascicolo di
ingegneria dell'usabilità sia scritto, non prima che il piano media sia progettato.

### Le due che mancano dall'elenco

`Q-172` (struttura di versionamento della distribuzione, `I-2`) e `V-178`/`Q-276` (tassonomia
stabile degli eventi contati e conservazione della diagnostica, `I-3`). Entrambe indirizzate anche
ad `ARCH`, entrambe con termine anteriore o coincidente con `RU-1`, entrambe retroattivamente
irrecuperabili, **nessuna delle due presente in `docs/02_architecture/09-decisioni-rinviate.md`**.
Un inventario delle non decisioni che omette le due non decisioni irrecuperabili più vicine è
peggio di nessun inventario, perché chi lo consulta ne ricava una copertura che non ha.

---

## 7. Le assenze

Temi che nessun capitolo copre e che nessun indice dichiara fuori perimetro. Ho verificato per
ciascuno che `docs/02_architecture/00-indice.md` §6 non lo rinvii ad altra area e che
`docs/03_functional/07-fuori-perimetro.md` non lo escluda.

**`M-1` - La progettazione architetturale ai sensi della clausola 5.3, e la segregazione della
5.3.5.** §3.1. `00-indice.md` §6 manda a `docs/08_compliance/` «fascicolo tecnico, gestione del
rischio, ingegneria dell'usabilità»; la progettazione architetturale non è nessuna delle tre.
`08_compliance/03` §6.2 la elenca fra ciò che diventa obbligatorio in classe B. Nessuna area la
possiede.

**`M-2` - Le capacità di prodotto della vigilanza.** `V-177` e `V-178`. L'impianto non ha un luogo
in cui vive la tassonomia degli eventi contati, né una politica di conservazione della diagnostica
distinta da `V-152`. `07-tracciamento` §7 tratta la conservazione del **registro**, che risponde ad
altra fonte, e lo dice `V-178` stesso. Collegata: `Q-178`, «come il progetto viene a sapere di un
incidente occorso in un'installazione derivata di cui ignora l'esistenza», indirizzata a `SEC` e
**ORCH** e non ad `ARCH`, benché la risposta - se esiste - sia una capacità di prodotto.

**`M-3` - La forma di installazione come asse dell'impianto.** `08-viste-di-deployment.md:139-140`
offre due sole modalità, «la definizione di composizione fornita dal progetto oppure il pacchetto
per orchestratore di contenitori», e `TG-08` riduce `RU-1` alla prima. La matrice delle differenze
ammesse di §7 ha righe per il broker, i nodi di relay, la replica, i pool, la conservazione del
registro, la distribuzione del segnalamento e la titolarità del trattamento: **non ha una riga per
la forma di installazione**. Non esiste quindi un posto dove una richiesta di percorso nativo possa
essere collocata come differenza ammessa, e non esiste un `OUT-*` che la escluda.

Non entro nel merito tecnico, che è di altri. Segnalo le due conseguenze architetturali che le
analisi verticali non vedono. La prima: §1 stabilisce che «nessuna funzione può dipendere da un
componente disponibile solo in uno dei due assetti» e §7 che «una richiesta di **differenza
funzionale** va portata in bacheca». Una terza forma di installazione **moltiplica** la matrice di
verifica per il numero di forme, non le si somma, perché ogni verifica di configurazione all'avvio
di §8 e ogni riga della matrice di §7 va esercitata per forma. Sotto `D62` è un moltiplicatore che
il piano non ha. La seconda: `V-173` vieta le etichette di versione mobili «su nessuna dipendenza,
immagine di base o strumento», perché la clausola 8.1.2 di IEC 62304 richiede l'identificazione per
titolo, produttore e **versione**. Un percorso di installazione nativa consuma componenti forniti dal
sistema operativo dell'ospite, la cui versione il progetto non fissa: la distinta dei materiali di
quella forma di installazione non è determinabile con lo stesso grado dell'altra. Ã un fatto
architetturale che va deciso, non aggirato, e sotto `D63` è un fatto che entra nel fascicolo.

**`M-4` - Il marcatore di sinteticità nel modello dati.** `V-192`, §`I-5`.

**`M-5` - Il registro generato dei parametri di configurazione.** `V-193` e `Q-192`, §`I-6`.

**`M-6` - Il servizio gestito nel piano.** §4.1. Non è un'assenza di architettura: è un'assenza
di piano su metà dell'architettura, ed è la stessa cosa vista dall'altro lato.

**`M-7` - Un budget prestazionale del percorso critico.** `07-tracciamento` §4 dice che «il budget
di latenza delle operazioni lo comprende esplicitamente», ma nessun documento contiene quel budget e
nessuna tabella di punti non verificati lo elenca. Vedi `I-4`/§4.4. L'unica soglia prestazionale
citata nell'area è la latenza aggiuntiva della replica sincrona sulla firma
(`05-multi-tenancy.md` §10), rinviata all'area tecnica.

**`M-8` - `V-176`, l'evidenza citabile.** Il vincolo (`COMP` verso **`ARCH`** e `TECH`) impone che
ogni esito di prova destinato a essere citato come evidenza sia prodotto in forma citabile e
conservato come artefatto immutabile, e che «un rapporto rigenerabile ma non conservato non è
evidenza». L'area architetturale prescrive una cinquantina di verifiche bloccanti e non dice per
nessuna se il suo esito vada conservato. `07-tracciamento` §5.1 lo dice per le sole verifiche di
integrità del registro. La generalizzazione manca.

---

## 8. Che cosa propongo di decidere subito

Voci numerate, in ordine di rapporto fra costo del ritardo e costo della decisione. Nessuna richiede
codice; sette su nove sono decisioni o allineamenti documentali. Tutte, per la procedura di
`docs/adr/README.md`, vanno dichiarate in bacheca prima di essere applicate.

1. **Chiudere `Q-172` e `C-4`/`Q-186` in un atto solo, entro il 15 ottobre 2026.** Struttura di
   versionamento della distribuzione e periodo di supporto dichiarato. Sono la stessa domanda vista
   da due lati: quante versioni maggiori coesistono determina che cosa una versione identifica.
   Costo della decisione: ore. Costo del ritardo: una discontinuità di identificazione non sanabile
   e un prerequisito di `T-10` non soddisfatto. **Titolare: committente**, con `ARCH` per la
   conseguenza strutturale.

2. **Aprire un ADR sulla segregazione fra elementi di classe B e di classe A**, che dichiari il
   meccanismo - confine di processo, confine di rete, assenza di percorso di dati - e che decida in
   particolare se le due famiglie di serie temporali condividono un motore. Deve precedere il
   criterio 1 di `T-08`, perché quel criterio cristallizza i confini dei moduli. Chiude
   contestualmente la divergenza fra `04-modello-dati.md:238` e `08-viste-di-deployment.md:36`.
   **Titolare: `ARCH`**, con `COMP` per la clausola 5.3.5.

3. **Aggiungere a `09-decisioni-rinviate.md` le due voci mancanti e riclassificare tre di quelle
   presenti.** Ingressi: `Q-172` e `V-178`/`Q-276`. Riclassificazioni: `B-6` da «prima
   dell'esercizio» a **irrecuperabile nella misura**; `B-3` da bloccante a rinviabile, con
   l'argomento di `ADR-0024`; `B-8` fuori dall'elenco, perché è una verifica di `T-04` e non una
   decisione. Correggere inoltre la collocazione di `A-5`, oggi sotto l'intestazione «Famiglia C».
   **Titolare: `ARCH`.**

4. **Decidere la granularità e la finestra di conservazione delle grandezze che contano eventi**,
   e portarle nel modello dati: disponibilità per tenant e per servizio (`Q-184`), tassonomia
   stabile degli eventi contati e conservazione della diagnostica (`V-178`). Contestualmente
   riformulare `05-multi-tenancy.md` §2.3, che oggi dice il contrario di `SQ-05` e di `EV-12`.
   **Titolari: `ARCH` per la collocazione, `SEC` e `COMP` per i valori.**

5. **Recepire `V-192` in `docs/02_architecture/04-modello-dati.md`**: attributo di sinteticità
   persistito, con la verifica bloccante corrispondente. Ã la voce con il miglior rapporto fra
   costo oggi e costo dopo dell'intero elenco. **Titolare: `ARCH`.**

6. **Allineare la bacheca sulle sette questioni chiuse da un ADR** (`Q-06`, `Q-15`, `Q-120`,
   `Q-124`, `Q-140`, `Q-143`, `Q-161`) e su `B-4` in `09-decisioni-rinviate.md`. Non è lavoro
   redazionale: è il canale vincolante fra aree, e oggi dice a sette aree che sette decisioni che
   le riguardano non sono state prese. **Titolare: `ARCH`**, con `ORCH` per il protocollo.

7. **Decidere se il servizio gestito è pianificato o dichiarato fuori dal perimetro della prima
   fase.** Le due risposte sono entrambe accettabili; la terza, cioè l'attuale, non lo è, perché
   fa pagare il costo di progettazione senza produrre il beneficio e lascia `SQ-05`, `SQ-08` e
   `V-188` senza un momento in cui saranno esercitati. Se la risposta è «fuori dal perimetro della
   prima fase», la conseguenza immediata è la voce 8. **Titolare: committente**, su istruttoria di
   `ROAD` e `ARCH`.

8. **Riesaminare `ADR-0007` con un ADR nuovo**, che separi la proprietà (l'identificativo di tenant
   su ogni chiave, indice, evento e riga di registro, che `R11` protegge e che non si tocca) dal
   meccanismo (schema per tenant contro righe condivise con sicurezza di riga). L'esito può essere
   la conferma: ciò che chiedo è che la conferma sia presa **sapendo** che le tre ragioni decisive
   dell'ADR sono proprietà del servizio gestito e che la finestra di reversibilità si chiude con
   il secondo tenant, non con la prima riga di codice. Se la voce 7 esclude il servizio gestito
   dalla prima fase, questa decisione libera capacità ricorrente esattamente dove il piano non ne
   ha. **Titolare: `ARCH`.**

9. **Aggiungere ai punti non verificati di `07-tracciamento-e-registro-immutabile.md` §9 la misura
   del punto di serializzazione del registro** sul percorso critico delle letture cliniche, e
   collocarla in `T-04` fra le verifiche empiriche. Ã una misura su dati sintetici e costa poco;
   scoprirla a `T-08` chiuso rimetterebbe in discussione insieme la catena per tenant, la scrittura
   bloccante e la copertura integrale, che non è riducibile. **Titolare: `ARCH`**, esecuzione
   `TECH`.

Due voci che **non** propongo, e vale la pena dire perché. Non propongo di decidere ora la
tecnologia di messaggistica: `ADR-0008`, `EV-10` e l'interfaccia di pubblicazione rendono quella
scelta reversibile a basso costo, e `TG-04` la toglie da `RU-1`; è la meno urgente delle decisioni
tecnologiche aperte. Non propongo di decidere ora il meccanismo dell'orchestrazione (`A-1`): il suo
innesco non arriva entro `RU-1`, e il prototipo che il capitolo chiede non sarà producibile.

---

## 9. I punti `[NV]`

| # | Che cosa non ho potuto verificare | A chi va chiesto |
|---|---|---|
| `NV-1` | Se l'assenza di `G11` da `pipeline/collocazione-dei-controlli.tsv` sia una lacuna o lavoro in corso. Esiste `.telemedic/piani/G11-regola-di-riservatezza.md`, modificato il 26 agosto 2026, e non l'ho letto | `TECH` |
| `NV-2` | Se il punto di serializzazione del registro (§4.4) regga il volume di letture cliniche di un'installazione a tenant unico. **Nessuna misura esiste**, e nessun documento lo elenca fra i punti da verificare | `TECH`, con misura su dati sintetici |
| `NV-3` | Se qualcuna delle voci di bacheca che ho letto solo in forma troncata contenga una risposta che chiude una delle sette questioni del §2.3 senza che lo stato sia stato aggiornato. Ho verificato per esteso `Q-06`, `Q-15`, `Q-120`, `Q-124`, `Q-140`, `Q-143`, `Q-156`, `Q-161`; non le altre | `ORCH` |
| `NV-4` | Se `docs/06_security/` o `docs/04_protocols/`, che non ho letto, contengano già la tassonomia degli eventi contati di `V-178` o la forma dell'evidenza citabile di `V-176`. In tal caso `M-2` e `M-8` andrebbero riformulate come «non recepite in `ARCH`» invece che come assenze | `SEC`, `PROTO` |
| `NV-5` | Se il piano `D63` sia stato superato dai fatti solo sul passo 2 o anche sui passi 1, 3, 4 e 5. Ho verificato per esteso i quattro punti del passo 2 e nessun altro | `COMP`, `ORCH` |
| `NV-6` | Se la classificazione a classe B degli item e le esclusioni che la reggono siano state riesaminate dopo `D63`. `08_compliance/03` §6.1 è datato prima del 26 agosto per quanto ho potuto vedere, e non l'ho verificato sulla cronologia | `COMP` |
| `NV-7` | Il rapporto fra numero di verifiche bloccanti e numero di casi di prova necessari (§4.3). Ho misurato il rapporto attuale - 16 controlli, 73 casi - e **non l'ho estrapolato**, perché i controlli architetturali sono in maggioranza prove di integrazione e non script di pipeline. L'ordine di grandezza dell'impegno ricorrente resta quindi non quantificato | `TECH`, `ROAD` |

---

**Una conclusione, breve, perché la consegna chiede severità e la severità senza una tesi è
solo malumore.**

L'impianto è di qualità alta e insolitamente onesto: dichiara i compromessi accettati, elenca le
scorciatoie rifiutate, e ha un capitolo sulle non decisioni che pochi progetti scrivono. Il suo
difetto non è di ragionamento, è di **appartenenza**: l'area architetturale è stata scritta come
se il quadro regolatorio fosse di qualcun altro, e per una premessa che `D58` prima e `D63` poi
hanno rovesciato, quel qualcun altro siamo noi. Non ha prodotto frasi false - non ne nomina
nessuna - ma ha prodotto un buco esattamente dove il fascicolo tecnico chiederà di guardare per
primo, cioè la progettazione architetturale e la segregazione delle classi di sicurezza.

Il secondo difetto è di scala. L'impianto è dimensionato per un'organizzazione con due assetti di
esercizio, cinquanta controlli bloccanti da mantenere vivi, dieci componenti obbligatori da
sorvegliare e due superfici contrattuali pubbliche. La capacità è una persona per dieci-venti ore
alla settimana. Il progetto lo sa già - «l'aritmetica non chiude» è scritto nella sua stessa
roadmap - e ha risposto riducendo l'**ambito del rilascio**. Ma l'ambito del rilascio e l'ambito
dell'architettura sono due grandezze diverse, e finora è stata ridotta solo la prima. Finché metà
dell'impianto è progettata per un assetto che non è né pianificato né escluso, ogni riduzione di
ambito taglia il rilascio e lascia intatto il costo.
