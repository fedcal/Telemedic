# Piano - `T-06`, traduzione delle aree prerequisito con controllo di divergenza in esercizio

> **Traguardo**: `T-06` · classe `D`, volume-dipendente · `[IMPEGNO]` · **21 novembre 2026**
> (finestra allocata nel diagramma di `docs/09_roadmap/02-traguardi.md` §7: 7 → 21 novembre 2026).
> **Innesco**: chiusura del criterio 5 di `T-02`, il conteggio esatto delle parole. **Eseguito il 26 agosto 2026.**
> **Titolare**: contributore unico, con la modalità assistita di `D56`.
> **Fonti**: `docs/09_roadmap/02-traguardi.md` §3, `docs/09_roadmap/00-indice.md` §4 e §8.4 compresa la
> rettifica di giornata, `.telemedic/context/RUNBOOK-TRADUZIONE-EN.md`,
> `.telemedic/context/REGISTRO-DIFETTI-TRADUZIONE.md`, `.telemedic/context/GLOSSARIO-TRADUZIONE-EN.md`,
> `scripts/verifica-divergenza-traduzioni.sh`, `.github/workflows/verifiche.yml`.
> **Data di redazione**: 26 agosto 2026.

Questo è un piano. **Non traduce nulla** e non modifica `docs/`, `website/`, `scripts/` né i file di
contesto in `.telemedic/context/`. Dove un dato è stato misurato, il piano dice come; dove non è
verificabile con gli strumenti usati, lo marca `[NV]` e lo dichiara.

---

## 0. La cosa che questo piano deve dire prima di ogni altra

**`T-06` non contiene più lavoro di traduzione di area.** La rettifica del 26 agosto 2026 in
`00 §8.4` ha cambiato lo stato del **criterio 1**, e con esso la natura del traguardo: la guida dei
fondamenti, l'area di conformità e l'area di sicurezza sono complete in inglese, e le avvertenze
pubbliche **esistono già in inglese** - sono bilingui in un file solo, con blocco italiano,
separatore, blocco inglese e rimando «*English version below*» in testa. La motivazione precedente
(«le avvertenze pubbliche non esistono in inglese») era falsa, e l'errore era di metodo: il controllo
di divergenza era stato esteso assumendo file `.en.md` separati, una convenzione che il repository non
usa.

Ne discende, e va scritto qui perché nessuno lo ripianifichi: **il criterio 1 non si ripianifica.**
Ciò che resta di `T-06` è il **meccanismo**, non il testo - che il controllo blocchi davvero, che le
divergenze residue sulle aree prerequisito siano chiuse, che il criterio 5 acquisti una prova che possa
fallire e che la procedura di allineamento diventi un documento controllato.

La lezione che la rettifica stessa enuncia governa tutto il resto di questo piano:

> Un controllo tarato su una convenzione sbagliata **non tace: afferma il falso** - e lo afferma con
> l'autorevolezza di una verifica automatica, che è peggio di non averla.

---

## 1. I criteri, uno per uno

Lo stato è **binario**. Dove il registro delle revisioni e lo stato di fatto misurato divergono, il
piano lo dichiara al §9 e **non corregge il registro**: non è lavoro di questo piano.

### Criterio 1 - le aree prerequisito esistono in inglese, integrali e in posizione speculare

**Esiste già.** Misurato il 26 agosto 2026 contando i file `.md` in `docs/<area>/` e in
`website/i18n/en/docusaurus-plugin-content-docs/current/<area>/`:

| Area | File IT | File EN | Parità |
|---|---:|---:|:-:|
| `10_fondamenti` | 21 | 21 | sì |
| `08_compliance` | 11 | 11 | sì |
| `06_security` | 11 | 11 | sì |
| `04_protocols` (tradotta, non prerequisito) | 11 | 11 | sì |

Nessun marcatore di continuazione residuo: `CONT-->` non compare in alcun file sotto
`website/i18n/en/`. Le avvertenze pubbliche alla radice - `NOT-A-MEDICAL-DEVICE.md`,
`DISTRIBUTION-POLICY.md`, `README.md`, e con la stessa convenzione `CONTRIBUTING.md` - sono bilingui in
un file solo, e i blocchi inglesi sono già allineati a `D58`.

**Manca**: nulla. **Come si dimostra soddisfatto**: `scripts/verifica-divergenza-traduzioni.sh` riporta
`Assenti ed esigiti: 0` e non segnala avvertenze pubbliche non allineate; il conteggio dei file per area
coincide; `grep -rn "CONT-->" website/i18n/en/` è vuoto.

> **Non si ripianifica.** Qualsiasi attività che riapra il criterio 1 è ambito aggiunto, non ambito di
> `T-06`.

### Criterio 2 - il controllo **blocca** su quelle aree e **non produce rilievi** su di esse

**Non soddisfatto**, per due ragioni distinte, da chiudere entrambe.

**Prima ragione - il controllo non può far fallire nulla.** In `.github/workflows/verifiche.yml` il
lavoro `divergenza-traduzioni` porta `continue-on-error: true`. Il commento accanto dichiara la
condizione di uscita da quel regime: «Non bloccante finché le tre aree esigite da `D56` - guida dei
fondamenti, sicurezza, conformità - non sono tradotte per intero. **Diventa bloccante nello stesso
commit in cui l'ultima di quelle aree viene completata**.» Quel commit è passato. Le tre aree sono
complete e l'inversione non è avvenuta. **È un debito già contratto, con la sua data**: 26 agosto 2026.
Lo script esce `1`, ma il lavoro di verifica lo assorbe: il criterio 2 non è soddisfatto **al livello
che conta**, che è la costruzione, non lo script.

**Seconda ragione - il controllo produce rilievi su aree prerequisito.** Lo stato in esercizio è
`Allineati 52 · Divergenti 2 · Assenti ed esigiti 0`, e i due divergenti stanno su aree prerequisito.
Il registro dei difetti li dichiara al §19.5 come **divergenze apparenti**, non di contenuto:

| File | Perché è segnalato | Che cosa manca in inglese |
|---|---|---|
| `06_security/02-identita-e-accessi.md` | correzione italiana ortografica (`sul obiettivo` → `sull'obiettivo`) | nulla |
| `06_security/10-risposta-agli-incidenti.md` | `deployer` → `chi installa` in italiano; in inglese `deployer` è la resa corretta | nulla |
| `08_compliance/03-sistema-di-gestione-della-qualita.md` | idem | nulla |

Il controllo confronta **le date di commit registrate in git, non il contenuto** - è scritto nel
cappello dello script e non è un difetto: è ciò che lo rende economico e affidabile. La chiusura è
quella che lo script stesso prescrive nella nota che stampa: *si tocca comunque il file tradotto nello
stesso commit, così la relazione fra i due resta vera e il controllo non impara a mentire.*

**Come si dimostra soddisfatto.** (a) `verifica-divergenza-traduzioni.sh` esce `0` sulle aree
prerequisito; (b) il lavoro `divergenza-traduzioni` **non porta più** `continue-on-error`; (c) la
bloccanza è **provata al contrario**, degradando deliberatamente un file inglese di un'area
prerequisito e verificando che la costruzione fallisca - è la regola del criterio 2 di `T-03` («un
controllo che non è stato visto fallire non è un controllo») ed è il metodo con cui la rettifica del
26 agosto è stata a sua volta verificata.

### Criterio 3 - il controllo **segnala** sul resto del corpus, con rapporto pubblicato a ogni costruzione

**Esiste in parte.** Il comportamento differenziato esiste ed è versionato, non cablato:
`AREE_ESIGITE="10_fondamenti 06_security 08_compliance"` nello script, e per ogni file non tradotto di
un'area non esigita viene stampata la riga `· traduzione assente (pianificata): <percorso>`. Le
avvertenze pubbliche sono verificate in sola segnalazione con la **data dichiarata** in cui diventano
bloccanti (`AVVERTENZE_BLOCCANTI_DAL="2026-09-12"`, scadenza di `T-01`), come impone il criterio 4 di
`T-03`.

**Manca** la parte che il criterio chiama «rapporto pubblicato a ogni costruzione». Oggi l'esito esiste
come registro del lavoro di verifica; non è un artefatto conservato e confrontabile fra due
costruzioni. È esattamente il dato che `R-03` indica come **indicatore anticipatore** - «la distanza
fra corpus italiano e corpus inglese, misurata e non stimata… se cresce fra due revisioni consecutive,
la traduzione assistita non tiene il passo». Un indicatore che esiste solo nel registro di un lavoro
che scade non è confrontabile. Se «pubblicato» significhi «artefatto conservato» o «riga nel registro
del lavoro» **non è deciso in nessuna fonte del repository**: `[NV]`, e va posto al committente prima
che il criterio si dichiari soddisfatto, perché è la differenza fra un criterio verificabile e un
criterio interpretabile.

**Come si dimostra soddisfatto.** Due costruzioni successive producono due rapporti confrontabili, e la
differenza fra i due è leggibile senza rileggere i registri di esecuzione.

### Criterio 4 - i riferimenti normativi italiani restano nella forma originale, con la spiegazione in inglese

**Soddisfatto**, verificato a campione e registrato in `00 §8.4`. La regola operativa è nel runbook §3,
«Estremi normativi italiani»: non si traducono mai; alla **prima occorrenza per documento** segue una
glossa inglese fra parentesi, nelle forme fissate in `log-TRAD-1.md §3.4`; chi riprende un file a metà
valuta la prima occorrenza **sull'intero documento**.

**Non si ripianifica.** Va però mantenuto: ogni area che `T-09` tradurrà lo riesercita, e il campione
di verifica va rifatto lì, non qui.

### Criterio 5 - le stringhe di internazionalizzazione restano separate dalle etichette ufficiali dei sistemi di codifica, in entrambe le lingue

**Non soddisfatto.** Il registro delle revisioni lo elenca fra i criteri non soddisfatti e non ne dà
altro. La separazione è una decisione architetturale già presa -
`docs/adr/0019-separazione-stringhe-di-interfaccia-ed-etichette-ufficiali.md` - ma **non esiste un
controllo che possa fallire** se la separazione viene violata, e non esiste codice applicativo in cui
violarla (`V-182` lo vieta prima di `T-03`).

È la stessa forma di difetto che il registro registra come `W-2`: *un criterio impegnato senza prova
che possa fallire*. La chiusura non è quindi «verificare che sia così»: è **scrivere la prova**, sul
perimetro che oggi esiste - i cataloghi di stringhe del sito (`code.json`, `current.json`,
`navbar.json`, `footer.json`, nelle due lingue) e le etichette ufficiali citate nel corpus. Il
controllo deve fallire su un caso deliberatamente costruito in cui un'etichetta ufficiale di un sistema
di codifica compare come stringa di interfaccia tradotta.

**Come si dimostra soddisfatto.** Esiste il controllo, è in `verifiche.yml`, ed è stato **visto
fallire** su un caso costruito apposta.

### Criterio 6 - è dichiarata e versionata la procedura di allineamento

**Esiste ma non nella forma richiesta.** Il registro delle revisioni lo dice esattamente: «la procedura
di allineamento è scritta ma non ancora versionata come documento controllato». La procedura **è**
`.telemedic/context/RUNBOOK-TRADUZIONE-EN.md`, che contiene per intero le tre cose che il criterio
esige:

| Che cosa il criterio 6 esige | Dove sta oggi |
|---|---|
| che cosa rende completa una proposta di modifica | runbook §7, Definition of Done, sei voci |
| che cosa si fa quando la traduzione ritarda | runbook §2, protocollo di continuazione, e §1 sulla misura autoritativa dello stato |
| come si distingue un'area prerequisito da un'area a segnalazione | `AREE_ESIGITE` nello script, versionato e non cablato, più la nota nel cappello |

**Manca** che sia un **documento controllato** ai sensi di
`docs/08_compliance/10-controllo-dei-documenti.md`: identificazione, versione, revisore nominato per
categoria, forma dell'approvazione, regola di ritiro. `.telemedic/` è contesto di lavoro interno, non
corpo documentale sotto controllo, e un criterio di traguardo non può poggiare su un file che la
procedura di controllo dei documenti non conosce.

**Come si dimostra soddisfatto.** La procedura è elencata fra i documenti sottoposti a controllo, porta
identificativo e versione, ed è raggiungibile dal corpus. **Con l'avvertenza che `T-01` criterio 1
porta con sé**: sotto `D54` redattore e approvatore coincidono, ed è **lacuna dichiarata e non
conformità** (`Q-189`). La procedura di allineamento eredita quella lacuna e non la nasconde.

### Quadro di sintesi

| Criterio | Stato | Che cosa resta |
|:-:|---|---|
| 1 | **Soddisfatto** - rettifica del 26 agosto 2026 | nulla. **Non si ripianifica** |
| 2 | **Non soddisfatto** | rimuovere `continue-on-error`; chiudere le divergenze apparenti; provare la bloccanza al contrario |
| 3 | **In parte** | forma del rapporto pubblicato, oggi `[NV]` |
| 4 | **Soddisfatto** | nulla in `T-06`; si riesercita in `T-09` |
| 5 | **Non soddisfatto** | scrivere il controllo e vederlo fallire |
| 6 | **In parte** | portare la procedura sotto controllo dei documenti |

---

## 2. L'ordine del lavoro, ricavato e motivato

Il mandato chiede di pesare tre criteri: **volume**, **pagine già tradotte che puntano a un'area**,
**dipendenze di ancora**. Applicati a `T-06` danno un esito che va detto senza ammorbidirlo: **due dei
tre sono nulli per costruzione**, perché il criterio 1 è soddisfatto.

- **Volume**: le aree prerequisito sono tradotte. Il volume residuo di `T-06` è **zero parole di
  traduzione**. Il costo residuo non è in parole (§6).
- **Pagine che puntano**: misurato sui 54 file inglesi esistenti, **nessun collegamento delle aree
  prerequisito punta a un'area prerequisito non tradotta**, perché non ne esistono.
- **Dipendenze di ancora**: misurate a zero in uscita dalle aree tradotte verso aree non tradotte. Le
  tre ancore rotte residue nella costruzione inglese **non appartengono a `T-06`**: stanno in
  `02_architecture`, area di `T-09`.

L'ordine di `T-06` è quindi governato da un quarto criterio, che qui è dominante e va dichiarato: **il
costo di ritardare**. Il lavoro si ordina per irrecuperabilità, non per volume.

1. **Rimuovere `continue-on-error` dal lavoro `divergenza-traduzioni`**, insieme alla chiusura delle
   divergenze apparenti e alla prova al contrario. **Primo perché è già in ritardo**: la condizione di
   uscita dichiarata nel file si è avverata il 26 agosto 2026. Ogni giorno in cui il controllo esiste e
   non può far fallire nulla è un giorno in cui il progetto ha una verifica che *sembra* presidiare un
   criterio impegnato. È la stessa classe di danno della rettifica del §8.4, in forma speculare: là il
   controllo affermava il falso, qui non afferma niente pur essendo presentato come attivo.
2. **Scrivere il controllo del criterio 5 e vederlo fallire.** Secondo perché è l'unico criterio di
   `T-06` che oggi **non ha alcuna prova**, e un criterio senza prova non è distinguibile da
   un'intenzione (`W-2`, e la regola del criterio 2 di `T-03`).
3. **Portare la procedura di allineamento sotto controllo dei documenti.** Terzo perché dipende da
   `T-01` criterio 1, che alla data di questo piano è «in parte» - la procedura di controllo esiste,
   l'approvazione è la lacuna di `Q-189`. Anticiparlo non compra nulla: si otterrebbe un documento
   controllato da una procedura non ancora approvata.
4. **Fissare la forma del rapporto del criterio 3.** Ultimo perché è l'unica voce che richiede una
   decisione e non un lavoro, e perché la decisione va posta con i primi tre esiti davanti.

**Le aree prerequisito, nell'ordine in cui `T-06` le tocca.** Non è un ordine di traduzione ma di
chiusura dei rilievi, ed è determinato da dove i rilievi stanno: `06_security` (due file),
`08_compliance` (un file), `10_fondamenti` (nessun rilievo), avvertenze pubbliche alla radice (nessun
rilievo di contenuto; resta la data di bloccanza del 12 settembre 2026, che è di `T-01`).

**Che cosa `T-06` consegna a `T-09`, ed è l'unico rapporto d'ordine fra i due.** Il controllo bloccante
è **il meccanismo con cui `T-09` registra le proprie transizioni**: senza la rimozione di
`continue-on-error`, aggiungere un'area a `AREE_ESIGITE` non produce alcun effetto, e il criterio di
completamento di `T-09` - «la transizione da segnalazione a bloccanza è registrata con la data, e da
quel momento non è reversibile» - diventa una scrittura senza conseguenza. **`T-09` non può cominciare
a chiudere aree finché il punto 1 di questo elenco non è chiuso.** L'ordine delle otto aree residue è
ricavato e motivato nel piano di `T-09` §2, e non si duplica qui.

---

## 3. La partizione del lavoro fra agenti

La sezione 9 del runbook è stata scritta dopo la tornata del 26 agosto 2026, in cui cinque agenti hanno
chiuso una cinquantina di voci del registro dei difetti. La regola che ne è uscita è netta:

> **Si partiziona per file, mai per famiglia di difetto.** Sembra naturale dare a un agente «tutti i
> rinvii sbagliati» e a un altro «tutte le enumerazioni». È l'errore da non fare: due agenti finiscono
> sullo stesso documento e si sovrascrivono a vicenda, e **la collisione non produce un errore -
> produce una modifica persa, che nessuno vede**.

### 3.1 Come si applica a `T-06`, che non è una passata di traduzione

`T-06` residuo è lavoro su **quattro artefatti non documentali** - un file di flusso di verifica, uno
script nuovo, un documento di procedura, una decisione - più **i file inglesi da toccare** per chiudere
le divergenze apparenti. La regola resta la stessa e si applica per artefatto: nessuno appartiene a due
mandati.

| Mandato | Perimetro esclusivo | Non tocca |
|---|---|---|
| A | `.github/workflows/verifiche.yml`, lavoro `divergenza-traduzioni`; prova al contrario su un file inglese scelto e ripristinato | lo script; gli altri lavori del flusso |
| B | i file inglesi delle divergenze apparenti, toccati **nello stesso commit** che chiude ciascuna | il flusso di verifica; `docs/` |
| C | il controllo nuovo del criterio 5 e i suoi casi di prova sotto `scripts/prove/` | `verifiche.yml`, che lo riceve solo quando è provato |
| D | la procedura di allineamento come documento controllato | il runbook in `.telemedic/context/`, che resta contesto di lavoro |

I mandati A e C convergono entrambi su `verifiche.yml`. **È una collisione, e va risolta in sequenza,
non in parallelo**: A chiude prima, C aggiunge il proprio lavoro dopo. Due agenti sullo stesso file di
flusso producono lo stesso danno silenzioso che la regola descrive.

### 3.2 Dove sta il limite, in generale

Il limite è **il file**, e va enunciato in due direzioni perché entrambe contano.

**In parallelo, mai sotto il file.** Due agenti non lavorano mai sullo stesso documento nello stesso
passaggio. Se un file è troppo grande per un solo mandato, non si divide: **si mette in sequenza** con
il protocollo di continuazione del runbook §2 - ci si ferma solo a un confine di sezione `##`, si
scrive `<!--TRADn-CONT-->` in coda, si dichiara nel rapporto l'ultima sezione tradotta e la prima non
tradotta per numero e titolo, e chi riprende legge la parte già fatta prima di scrivere una riga.

**In sequenza, mai senza dichiarazione.** Un file consegnato completo non contiene marcatori. Un
marcatore che sopravvive alla passata è un file che qualcuno crederà finito.

**Il secondo limite, che non è tecnico.** Il numero di agenti in parallelo è limitato non dai file ma
dai **file di contesto condivisi**, che sono una risorsa seriale (§5). Aumentare gli agenti aumenta la
dimensione della passata di consolidamento, non la riduce.

---

## 4. Il protocollo di continuazione e i cancelli

### 4.1 Continuazione

Per `T-06` il protocollo del runbook §2 si applica in un solo caso: se un mandato tocca un file inglese
di un'area prerequisito e non lo chiude. Nella pratica del residuo di `T-06`, che è di file già
completi, **non dovrebbe applicarsi mai**. Se si applica, si applica alla lettera, marcatore compreso.

Ciò che invece si applica sempre è la regola d'ingresso: **chi riprende legge la parte già tradotta**,
e deve proseguire in modo indistinguibile per registro, lessico e ampiezza. Vale anche per chi tocca un
file inglese per un motivo diverso dalla traduzione: la coerenza di un file bilingue si rompe
altrettanto bene con una correzione fuori registro.

### 4.2 I cancelli, e in quale ordine si attraversano

Nessuna voce di `T-06` si dichiara chiusa prima di tutti i cancelli. L'ordine non è arbitrario: ogni
cancello costa più del precedente, e fallire tardi è la ragione per cui una passata si rifà.

| # | Cancello | Comando o verifica | Che cosa impedisce di passare |
|:-:|---|---|---|
| 1 | Nessun marcatore residuo | `grep -rn "CONT-->" website/i18n/en/` vuoto, o marcatori dichiarati e attesi | un file creduto finito |
| 2 | **Parità strutturale fra le due lingue** | stesso numero di `.md` per area, stessi nomi, stesse posizioni; `git diff` sul frontmatter **non** mostra `sidebar_position` | una traduzione che sposta la navigazione |
| 3 | Ampiezza | `wc -w` inglese entro il ±15% dell'italiano su ogni file toccato | un agente che riassume invece di tradurre e non lo dichiara |
| 4 | **Costruzione del sito** | `cd website && npm ci && npm run build`, entrambe le lingue | frontmatter con due punti non quotato, etichette Mermaid riscritte, **ancore rotte**: il gate le elenca tutte |
| 5 | **Controllo di divergenza** | `./scripts/verifica-divergenza-traduzioni.sh` esce `0`; `Assenti ed esigiti: 0`; nessun divergente su area prerequisito | la divergenza silenziosa, che è la sola cosa che `T-06` esiste per impedire |
| 6 | **Bloccanza provata al contrario** | degradare deliberatamente un file inglese prerequisito e verificare che la costruzione **fallisca**; ripristinare | un controllo che non è stato visto fallire |
| 7 | Conformità redazionale e terminologie | `./scripts/verifica-conformita-redazionale.sh`, `./scripts/verifica-terminologie.sh` | regola `R0` e terminologie a licenza vincolata, **in entrambe le lingue** |
| 8 | Non marcatura nell'artefatto pubblicato | `./scripts/verifica-dichiarazione-non-marcatura.sh website/build` e `… website/build/en` | una pagina inglese pubblicata senza l'avvertenza |
| 9 | **Consolidamento dei file di contesto** | passaggio unico di chi orchestra (§5) | glossario e registro che divergono dai fatti |

**Il cancello 6 è quello che `T-06` aggiunge rispetto a ogni passata precedente**, ed è quello che
distingue il criterio 2 soddisfatto da un criterio 2 dichiarato. Va eseguito **dopo** il cancello 5,
mai prima: si prova che il controllo fallisce quando deve solo dopo aver visto che passa quando deve.

---

## 5. I file di contesto condivisi, e perché il consolidamento è lavoro

Il corollario della regola di partizione, nel runbook §9.1, è esplicito:

> I file di contesto condivisi - `REGISTRO-DIFETTI-TRADUZIONE.md`, `GLOSSARIO-TRADUZIONE-EN.md`,
> `05_BACHECA_INTERAGENTI.md` - **non si danno in scrittura a un agente di una passata parallela**. Li
> consolida chi orchestra, in un passaggio unico, quando tutti sono rientrati. **Nel mandato va scritto
> esplicitamente.**

Non è cautela teorica: è già successo. Il difetto `W-1` registra **due sezioni numerate `## 9`** nel
glossario, più un terzo blocco che ha preso il `## 10` e un quarto il `## 18`, per scrittura
concorrente di più agenti. La collisione è stata risolta cambiando convenzione - i blocchi si
intitolano `Modulo NN - …` e **si identificano dalla fonte, non dalla posizione** - ma la convenzione
non toglie la regola: riduce il danno quando la regola viene violata.

**Il consolidamento è un passo del piano, non un residuo.** Ha un titolare - chi orchestra, mai un
agente della passata - e ha ingressi e uscite dichiarati.

**Ingressi**, dai rapporti degli agenti rientrati:

1. le **rese terminologiche nuove**, con l'alternativa scartata dove la scelta era contesa - serve a
   impedire che un agente successivo la reintroduca credendo di migliorare;
2. i **difetti trovati** nel testo bersaglio, con file, punto preciso e bersaglio corretto;
3. gli **errori trovati nel registro stesso** - il runbook §9.2 lo chiede esplicitamente, perché nella
   tornata del 26 agosto **nove voci su circa cinquanta erano sbagliate**: una poggiava su una premessa
   falsa e applicarla avrebbe *introdotto* l'incoerenza che dichiarava di correggere, sette avevano
   perimetro incompleto, due davano riferimenti di sezione in cui il termine non compariva;
4. le **voci risultate corrette dopo verifica**, che si riferiscono anch'esse, perché confermano il
   metodo;
5. le **conseguenze aperte fuori dal perimetro**, che nessun agente può chiudere da solo (runbook §9.4)
   e che alimentano la passata di coda;
6. le **perdite di traduzione dichiarate**, che non sono difetti e vanno registrate perché un revisore
   che le incontri non le riapra (runbook §9.5).

**Uscite**: glossario rinumerato secondo la convenzione dichiarata; registro dei difetti con le voci
chiuse marcate con il riferimento del commit e con la sezione degli errori del registro aggiornata;
bacheca senza voci `APERTA` orfane; e - regola standing di progetto - **il runbook aggiornato** dopo il
lavoro.

**Per `T-06` il consolidamento ha una voce propria e non ovvia**: il registro dei difetti dichiara al
§19.5 **tre** file come divergenze apparenti su aree prerequisito, mentre il controllo in esercizio ne
segnala **due**. La differenza va accertata e registrata nel consolidamento, non lasciata a chi la
troverà.

---

## 6. Il costo dichiarato

**Non ore. Volume, e ciò da cui dipende.**

**Volume di traduzione residuo di `T-06`: zero parole.** Il criterio 1 è soddisfatto. Questo è il fatto
che la rettifica del §8.4 ha prodotto, ed è la ragione per cui `T-06` non è più il traguardo
volume-dipendente che la sua intestazione dichiara. **La classe dichiarata - `D`, volume-dipendente -
resta corretta per come il traguardo fu concepito, e descrive male ciò che ne resta.** È una tensione
fra il documento e lo stato di fatto, e si dichiara invece di smussarla: non è di questo piano
cambiarla.

**Volume di riferimento**, misurato il 26 agosto 2026 con il metodo del piano di `T-09` §6:

| Insieme | Parole (misura calibrata) | File |
|---|---:|---:|
| Aree già tradotte (`10_fondamenti`, `08_compliance`, `06_security`, `04_protocols`) | ≈ 551.000 | 54 |
| Otto aree residue, ambito di `T-09` | ≈ 317.000 | 91 |
| Documenti alla radice, bilingui in un file solo | 15.030 secondo `00 §4`, non rimisurati qui | 9 |

**Da che cosa dipende il costo residuo di `T-06`.** Non dal volume, ma da quattro grandezze:

1. **Il numero di divergenze apparenti da chiudere** - due secondo il controllo, tre secondo il
   registro. Ciascuna costa un commit che tocca il file inglese con la ragione scritta. La grandezza
   **cresce da sola**: ogni correzione italiana su un'area prerequisito ne aggiunge una, finché il
   controllo confronta le date e non il contenuto.
2. **Il perimetro del controllo del criterio 5**, che non è deciso: senza codice applicativo (`V-182`)
   il perimetro sono i cataloghi di stringhe del sito e le etichette ufficiali citate nel corpus.
   Deciso il perimetro, il costo è quello di uno script più i suoi casi di prova; non deciso, è
   indeterminato.
3. **Lo stato di `T-01` criterio 1**, da cui dipende il criterio 6: una procedura di controllo dei
   documenti *approvata*. Sotto `D54` redattore e approvatore coincidono ed è `Q-189`, con punto di
   decisione al **30 settembre 2026**.
4. **La decisione sulla forma del rapporto** del criterio 3, oggi `[NV]`.

**Le date sono allocazioni di calendario, non stime.** Il 21 novembre 2026 è l'allocazione che `02 §3`
assegna a `T-06` sotto la capacità di `D54`, quantificata da `D62` in dieci-venti ore settimanali; la
finestra del diagramma è 7 → 21 novembre 2026. **Il piano non la sposta**, ma dichiara ciò che la
finestra non dice: il punto 1 del §2 ha una **condizione di uscita già avverata il 26 agosto 2026**,
scritta nel file di flusso. Attenderne la finestra di novembre significa mantenere per undici settimane
un controllo presentato come attivo e incapace di far fallire alcunché. Questo piano lo colloca **prima
della finestra**, e la ragione non è di stima: è la stessa per cui `T-01` sta in testa alla roadmap,
cioè che il costo di ometterlo non si paga in ritardo.

---

## 7. Il rapporto fra `T-06` e `T-09`

**Che cosa `T-06` comprende.** Il solo sottoinsieme che `D56` qualifica come **non negoziabile**:
avvertenze pubbliche, guida dei fondamenti, area di conformità, area di sicurezza - più il
**meccanismo** che impedisce alla parte rinviata di degradare nel frattempo. Il criterio di
appartenenza non è l'importanza: è che **il costo della sua omissione è irrecuperabile**, perché sono i
testi che dichiarano obblighi regolatori e limiti d'uso, e un contenuto normativo che dice due cose
diverse in due lingue non è un problema di traduzione - è un difetto documentale in un dispositivo
medico (`R-16`, impatto `I5`, il più alto dell'intero registro).

**Che cosa `T-09` comprende e `T-06` no.** Le otto aree residue: `00_overview`, `01_technical`,
`02_architecture`, `03_functional`, `05_domain`, `07_integration`, `09_roadmap`, `adr` - ≈317.000
parole su 91 file - più la promozione di `04_protocols`, tradotta ma ancora in sola segnalazione, e la
transizione area per area del controllo da «segnala» a «blocca».

**Perché il secondo è in parallelo allo sviluppo invece che prima.** Tre ragioni, e nessuna basta da
sola.

1. **Decisione**: `D56` emenda `D52`. La traduzione integrale **non è più prerequisito di ogni riga di
   codice**. La sequenza «tutta la documentazione, poi il sito, poi il codice» decade con `D53`, che la
   rende anche non eseguibile: novantasette giorni e un contributore unico.
2. **Aritmetica**: le otto aree residue valgono circa quattro quinti dell'intera guida dei fondamenti.
   Collocarle prima del codice significa non avere codice entro il 30 novembre 2026, cioè mancare `D53`
   per proteggere `D50`.
3. **Merito, ed è la ragione che le altre due non dicono**: sei delle otto aree residue -
   `01_technical`, `02_architecture`, `03_functional`, `05_domain`, `07_integration`, `adr` -
   descrivono un sistema **che non esiste ancora in codice**. Tradurle prima che il codice esista
   garantisce di ritradurle quando il codice le muoverà. `09_roadmap` è il caso estremo: contiene un
   registro delle revisioni che cambia mensilmente e, dal 19 ottobre 2026, settimanalmente.

**Il vincolo che regge l'asimmetria** è `V-183`, emendato da `D56`: l'obbligo delle due lingue resta per
le aree prerequisito, e per il resto vale **il regime di segnalazione misurata**. Il regime è
accettabile a una condizione sola, che il criterio 3 esprime: che la parte non tradotta sia **visibile e
misurata, non implicita**. È la ragione per cui il rapporto del criterio 3 non è un dettaglio
redazionale ma la contropartita della riduzione di ambito.

---

## 8. Rischi propri, e che cosa il traguardo non comprende

### 8.1 Rischi

| # | Rischio proprio di `T-06` | Contromisura |
|---|---|---|
| 1 | **Un controllo tarato su una convenzione sbagliata afferma il falso**, con l'autorevolezza di una verifica automatica. È accaduto il 26 agosto 2026 sulle avvertenze pubbliche | Prima di estendere un controllo a una nuova classe di documenti, **verificare sul repository la convenzione che quei documenti seguono davvero**. Provare ogni controllo **al contrario** |
| 2 | **Un controllo presente e neutralizzato.** `continue-on-error: true` rende il lavoro incapace di far fallire la costruzione, mentre il criterio 2 lo dichiara bloccante | Rimuoverlo e provare la bloccanza al contrario (cancello 6). Fino ad allora **non dichiarare soddisfatto il criterio 2** |
| 3 | **L'abitudine di toccare un file per far tacere un controllo** | Il commit **dichiara la ragione**, e la divergenza apparente è registrata con la sua causa. Un file toccato senza ragione scritta è un controllo che sta imparando a mentire |
| 4 | **Un criterio impegnato senza prova che possa fallire** (criterio 5 oggi; `W-2` ieri) | Nessun criterio si dichiara soddisfatto prima che esista il controllo **e** che lo si sia visto fallire |
| 5 | **`R-16` - le due versioni linguistiche divergono.** Probabilità alta in assenza di controllo automatico, impatto `I5`: una divergenza scoperta in sede di verifica non si «corregge», obbliga a riemettere e a dimostrare da quando | È il rischio che `T-06` esiste per circoscrivere. La riduzione di ambito **non lo attenua**: lo confina alle aree in cui il controllo blocca |
| 6 | **Il controllo confronta le date, non il contenuto** | Limite dichiarato nel cappello dello script; **non si finge di risolverlo**. La contromisura è la Definition of Done, in particolare l'ampiezza al ±15%, unico modo di accorgersi di un agente che riassume |
| 7 | **La procedura di allineamento resta in `.telemedic/`**, fuori dal controllo dei documenti | Portarla sotto controllo (criterio 6), ereditando e **dichiarando** la lacuna di `Q-189` |
| 8 | **Il registro dei difetti è a sua volta fallibile**: nove voci su circa cinquanta erano sbagliate | Ogni voce si verifica sul testo bersaglio prima di applicarla; gli errori si riferiscono in una sezione dedicata e li consolida chi orchestra |

### 8.2 Che cosa `T-06` non comprende

- **Non comprende la traduzione di alcuna delle otto aree residue.** È `T-09`, ≈317.000 parole su 91 file.
- **Non comprende le tre ancore rotte** della costruzione inglese: stanno in `02_architecture`, area non
  tradotta, e si chiudono traducendola con lo slug **inglese** del bersaglio.
- **Non comprende il modulo delle fonti primarie** della guida, taglio reversibile dichiarato in
  `03 §5`. *Nota di fatto*: il modulo `20-fonti-primarie.md` esiste ed è tradotto (§9).
- **Non comprende la riemissione sotto controllo dei documenti prodotti prima di `T-01`**: lacuna
  dichiarata, il cui volume cresce ogni giorno.
- **Non comprende alcuna verifica eseguita da un secondo soggetto.** Sotto `D54` non è producibile
  (`V-281`): entra come lacuna con la data in cui nasce. Chi scrive il controllo del criterio 5 è chi lo
  prova, e questo va scritto dove il criterio si dichiara chiuso.
- **Non comprende la completezza della versione inglese del sito**, che è `T-07` per la navigazione e
  `T-09` per il contenuto.
- **Non comprende la traduzione del contesto di lavoro** (`.telemedic/`), del registro degli
  identificativi (`registro/`) né degli script.

---

## 9. Contraddizioni fra documenti trovate - non corrette

1. **Il registro delle revisioni dichiara soddisfatti i criteri 2 e 3 di `T-06`.** Il criterio 2 esige
   che il controllo **blocchi** sulle aree prerequisito e **non produca rilievi** su di esse. Alla
   stessa data il controllo riporta `Divergenti: 2`, entrambi su aree prerequisito, e il lavoro di
   verifica porta `continue-on-error: true`. **Nessuna delle due condizioni del criterio 2 è vera.**
2. **Lo stesso vale a monte per il criterio 3 di `T-03`**, dichiarato soddisfatto: il comportamento
   differenziato esiste ed è versionato, la **bloccanza** no.
3. **Il registro dei difetti §19.5 dichiara tre divergenze apparenti** su aree prerequisito; il
   controllo ne segnala **due**. La differenza non è spiegata da nessuna delle due fonti.
4. **Il conteggio del corpus non torna con sé stesso.** `00 §4` dichiara 860.718 parole in `docs/`,
   397.315 nella sola `10_fondamenti`, e **439.982 su quattro aree tradotte, il 51%**. Le tre cifre sono
   incompatibili: le sole righe con almeno dodici parole di `08_compliance`, `04_protocols` e
   `06_security` valgono già più di 83.000 parole, contro le 42.667 che resterebbero. La misura di
   questo piano dà per le quattro aree tradotte **≈551.000 parole, circa il 63% di `docs/`**, e per il
   residuo **≈317.000** invece di 420.736. Metodo, calibrazione e margine sono nel piano di `T-09` §6.
5. **I file di `docs/` sono 145**, contro i «centoquarantaquattro» di `00 §4`. La differenza è
   compatibile con l'aggiunta di `08_compliance/10-controllo-dei-documenti.md` dopo il conteggio.
6. **`T-02` dichiara di non comprendere il modulo delle fonti primarie**, mentre `00 §4` dichiara la
   guida completa «glossario e fonti primarie compresi» e il modulo esiste, in italiano e in inglese.
7. **Il runbook §3 dice che un collegamento relativo verso un bersaglio non tradotto è «il comportamento
   atteso, non un errore»**, perché Docusaurus ricade sull'italiano; il mandato di questo piano riferisce
   46 collegamenti rotti, 42 nella locale inglese, descritti come pagine tradotte che rinviano ad aree
   non tradotte. **Le due affermazioni non sono conciliabili senza l'esito della costruzione**, che
   questa sessione non ha eseguito: `[NV]`, da chiudere con `npm run build` e la lettura dell'elenco.

---

## 10. Aggiornamento del 26 agosto 2026

**I due file divergenti sono stati identificati, e non sono quelli che il registro dei difetti
dichiara.** Il controllo, eseguito dopo la correzione del difetto descritto sotto, segnala:

| File | Registro dei difetti §19.5 |
|---|---|
| `04_protocols/09-tempo-reale.md` | **non elencato** |
| `06_security/02-identita-e-accessi.md` | elencato |
| `06_security/10-risposta-agli-incidenti.md` | elencato, **ma il controllo non lo segnala** |
| `08_compliance/03-sistema-di-gestione-della-qualita.md` | elencato, **ma il controllo non lo segnala** |

La differenza va accertata nel consolidamento e non lasciata a chi la troverà. `04_protocols` non è
area prerequisito, quindi la sua divergenza non incide sul criterio 2; quella di `06_security` sì.

**Corretto un difetto del controllo stesso.** `t_src=$(git log -1 --format=%ct -- "$src" || echo 0)`
non funzionava: su un file non ancora tracciato `git log` **esce con successo restituendo una riga
vuota**, quindi il ripiego non scattava e il confronto riceveva una stringa vuota. Lo script
emetteva `[: : atteso intero` per ogni file non tracciato - cioè per tutti i file inglesi appena
prodotti. Il valore predefinito si impone ora dopo la sostituzione.

**Ne discende un lavoro dovuto e non ancora fatto**: il caso di prova negativo in
`scripts/prove/esegui-prove.sh`. Un controllo corretto e non provato resta un controllo che nessuno
ha visto fallire, e questo piano non ammette l'eccezione per sé stesso.

## 11. Aggiornamento del 26 agosto 2026 - pomeriggio

### 11.1 Il criterio 2 non è soddisfatto, e per una seconda ragione

Il §10 registrava che il criterio 2 non è soddisfatto perché il controllo non è bloccante - la riga
74 di `.github/workflows/verifiche.yml` porta `continue-on-error: true`. Va aggiunta una ragione
indipendente, trovata sul testo e non sul registro: **`10_fondamenti` non è 21 file su 21.**

`docs/10_fondamenti/16-architettura-del-progetto.md` conta diciotto sezioni `##`. La sua traduzione
inglese ne conta **nove**: si interrompe alla fine della sezione 8 e non riprende. Mancano le
sezioni 9–14 e le tre di chiusura, per circa 6.951 parole delle 24.918 dell'originale. Il file è in
questo stato nel commit `b3498b7`.

Tre cose lo rendono peggiore di un semplice lavoro incompiuto:

1. **Non porta `<!--TRAD-CONT-->`.** Il protocollo del §4 esiste esattamente per questo, ed è stato
   ignorato. Un file dichiarato incompleto si recupera; un file troncato in silenzio si scopre per
   caso, mesi dopo.
2. **La data è dalla parte giusta.** La traduzione è più recente dell'originale, quindi il controllo
   di divergenza la vedeva allineata. Il controllo non mentiva: guardava la cosa sbagliata.
3. **È in un'area prerequisito.** Non è documentazione pianificata e non bloccante: è uno dei tre
   corpi che `D56` rende condizione di rilascio.

### 11.2 Il cancello che mancava, e che ora c'è

Il §4 elencava tre cancelli: marcatori di continuazione, parità di file, ampiezza entro ±15%.
Il primo non poteva vedere questo caso perché il marcatore non c'era; il secondo perché il file
c'era; il terzo perché **nessuno lo eseguiva sul corpus** - era prescritto e non automatizzato.

`scripts/verifica-divergenza-traduzioni.sh` confronta ora il numero di titoli di secondo livello di
ogni coppia e segnala lo scarto come **divergenza strutturale**. Il cancello dell'ampiezza resta
utile ma è il secondo per efficacia: il conteggio delle sezioni è più grossolano e più difficile da
soddisfare per sbaglio. Sul corpus attuale: `Allineati: 133 · Divergenti: 3`.

Regola che ne discende, da non ripetere: **un cancello prescritto e non eseguito da uno script non
è un cancello.** I tre del §4 erano scritti nel piano e nessuno li aveva eseguiti sul corpus intero
prima di dichiarare l'area completa.

### 11.3 Un rapporto di agente si è rivelato falso

Un traduttore ha dichiarato di avere lasciato `03_functional/03-casi-d-uso.md` «con un marcatore di
continuazione», indicando l'ultima sezione tradotta e la prima non tradotta. Il file **non era mai
stato scritto su disco**. La dichiarazione era circostanziata e verosimile, ed era falsa.

Conseguenza per il §3, che regola la partizione fra agenti: **il rapporto di un agente non è una
prova.** Ogni consegna va verificata sul filesystem - esistenza del file, conteggio delle sezioni,
`wc -w` - prima di essere registrata come fatta. Ai mandati successivi è stato aggiunto l'obbligo di
scrivere il file **man mano**, non alla fine: chi rimanda la scrittura perde tutto il lavoro quando
il budget finisce, e poi lo racconta come se l'avesse salvato.

### 11.4 Stato dei due difetti apparenti del §10

I due file che il controllo segnala come divergenti - `04_protocols/09-tempo-reale.md` e
`06_security/02-identita-e-accessi.md` - restano da chiudere, e restano diversi dai tre che il
registro dei difetti dichiara al §19.5. La chiusura è nel consolidamento, non qui.
