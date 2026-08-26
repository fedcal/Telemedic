# Piano di `T-12` - Pacchetto regolatorio consegnabile

> **Che cos'è questo documento.** È il piano di lavoro di un traguardo marcato `[INTENZIONE]`,
> collocato oltre il primo rilascio installabile. Non è una procedura del sistema di gestione
> della qualità, **non è un fascicolo tecnico e non è un documento del fascicolo**: è il vincolo
> `V-174`, e vale su ogni riga che segue.
>
> **Stato di fatto.** Oggi il prodotto **non reca marcatura CE**, non è coperto da alcuna
> dichiarazione di conformità e chi lo installa, integra o mette in servizio **assume per intero
> gli obblighi che ne derivano**. Il progetto **intende** assumere il ruolo di fabbricante
> (`D58`), e **il soggetto giuridico che lo eserciterebbe è ancora da costituire**. L'intenzione
> **non trasferisce alcun obbligo** e non rende utilizzabile una versione non certificata.
>
> **Nessuna data di marcatura compare in questo documento, in alcuna forma** - né esplicita, né
> come stima, né come «entro il», né deducibile dall'accostamento con una scadenza normativa.
> Lo vietano `V-171` e `V-280`.

---

## 0. Come si legge questo piano

Gli identificativi `T-12/L-nn` sono **designazioni interne di questo piano**: non appartengono
agli spazi congelati da `V-120`, non appartengono allo spazio dei documenti regolatori di `V-172`,
non entrano nella matrice di tracciabilità e non possono comparire in una prova.

**Dichiarazione di metodo.** Il § 5 di [`09/02`](../../docs/09_roadmap/02-traguardi.md) descrive
`T-12` con un obiettivo, un elenco di contenuti e una novità - l'elenco delle lacune datate - **ma
non con criteri di completamento binari numerati**, che è la forma prescritta dal § 0 dello stesso
capitolo e resa obbligatoria da `V-181`. I criteri del § 2 sono quindi **derivati e proposti**, e
**non sono in vigore finché la roadmap non li adotta** con la procedura di
[`09/00 §8.2`](../../docs/09_roadmap/00-indice.md).

---

## 1. La marcatura, verificata

| Voce | Valore accertato | Dove |
|---|---|---|
| Classe di attività | **`D` con componenti `A` già chiuse** | [`09/02 §5`](../../docs/09_roadmap/02-traguardi.md) |
| Classe di enunciato | **`[INTENZIONE]`** | *ibidem*, confermato in [`09/02 §7.1`](../../docs/09_roadmap/02-traguardi.md) |
| Data | **«2027»** - un anno, non un giorno | *ibidem* |
| Innesco | **Chiusura di `Q-183`** verso l'area di conformità | *ibidem* |
| Titolare | **Progetto** | *ibidem* |

**Che cosa discende dalla marcatura.** «2027» è un'allocazione di anno su un enunciato di
intenzione: **non è una scadenza, e questo piano non la converte in una**. In particolare non
produce un calendario interno per trimestri, perché un calendario per trimestri su un anno
dichiarato produrrebbe esattamente la lettura che `[INTENZIONE]` esclude.

Le «componenti `A` già chiuse» sono le attività retroattivamente irrecuperabili di `D45` che
`T-01` ha portato in esercizio: il registro degli identificativi, i due controlli di costruzione,
le dichiarazioni pubbliche. Il § 3 misura che cosa di quelle componenti esiste davvero.

---

## 2. I criteri, uno per uno

### C-1 - L'inventario del pacchetto esiste, è versionato, e ogni voce porta uno stato

**Che cosa serve.** L'atto che chiude `Q-183`: quali evidenze del pacchetto regolatorio sono
consegnabili e quali no.

**Che cosa esiste già.** La mappa del fascicolo in
[`08/04`](../../docs/08_compliance/04-fascicolo-tecnico.md) §§ 4–10 con la colonna «Stato»
(`☑` `◐` `☐`); l'inventario delle assenze in `08/04 §11` (quattordici righe); l'elenco chiuso
degli atti riservati in `08/04 §12` (quindici voci); l'elenco di ciò che il progetto consegna in
[`06_security/09 §12`](../../docs/06_security/09-ripartizione-delle-responsabilita.md) (dodici
voci). **Non esiste un inventario unico**, e le tre fonti non hanno la stessa granularità.

**Come si dimostra soddisfatto.** Esiste **un solo** documento versionato che elenca ogni
elemento del pacchetto con: stato (esiste / parziale / manca), file che lo alimenta, titolare, e
- per gli elementi parziali o mancanti - la ragione. Ogni elemento ha esattamente uno stato:
**non è ammessa una percentuale**.

### C-2 - L'elenco delle lacune datate esiste, e nessuna voce è priva di data

**Che cosa serve.** È la novità che `09/02 §5` attribuisce a `T-12`: «le registrazioni non
producibili sotto `D54`, ciascuna con il periodo cui si riferisce e la ragione. È la parte che chi
verifica si aspetta di trovare, e la sua assenza sarebbe peggiore della lacuna stessa».

**Che cosa esiste già.** Il contenuto, disperso in almeno quattro luoghi: i tagli irreversibili di
[`09/03 §5`](../../docs/09_roadmap/03-primo-rilascio-utilizzabile.md); il vincolo `V-281` e il
§ 8 di [`09/01`](../../docs/09_roadmap/01-principi-e-metodo.md); la lacuna redattore/approvatore
del § 9 di [`08/10`](../../docs/08_compliance/10-controllo-dei-documenti.md); il criterio 3 di
`T-10`, che impone di dichiarare in entrambe le lingue che nessuna verifica è stata eseguita da
un secondo soggetto. **L'artefatto unico non esiste.**

**Come si dimostra soddisfatto.** Esiste l'elenco, e **ogni riga porta**: data di nascita della
lacuna, periodo cui si riferisce, ragione, titolare della decisione che l'ha prodotta, e la
distinzione fra lacune **chiudibili dal rilascio N in avanti** e lacune **datate a un periodo e
non chiudibili** - che è la stessa distinzione del criterio 4 di `OL-22`. Una riga priva di data
fa fallire il criterio.

### C-3 - Ogni artefatto del pacchetto porta versione, data e impronta risolvibile

**Che cosa serve.** È il vincolo `V-179` di
[`08/09 §7.2`](../../docs/08_compliance/09-percorso-e-calendario.md): un artefatto acquisito senza
queste tre proprietà è un artefatto che il fabbricante **non può giustificare** in sede di audit.

**Che cosa esiste già.** La regola. Il meccanismo di versione documentale del § 3 di
[`08/10`](../../docs/08_compliance/10-controllo-dei-documenti.md) (impronta di commit come
versione). **Nessun pacchetto esiste**, quindi nessuna impronta è oggi risolvibile «a partire dal
materiale pubblico del progetto» nel senso richiesto dal vincolo.

**Come si dimostra soddisfatto.** Esiste il controllo che rifiuta l'ingresso nel pacchetto di un
artefatto privo di una delle tre proprietà, ed è stato **visto fallire** su un artefatto
deliberatamente privo. È la stessa regola di prova del criterio 2 di `T-03`.

### C-4 - Nessuna formula vietata e nessuna data di marcatura nel pacchetto

**Che cosa serve.** `V-171` con la tabella delle formule vietate di
[`08/01 §11`](../../docs/08_compliance/01-inquadramento-normativo.md), e le quattro regole di
forma sull'espressione dell'intenzione - verbo «intende», assenza del soggetto nella stessa
frase.

**Che cosa esiste già.** `scripts/verifica-conformita-redazionale.sh`, attivo e bloccante nel
flusso `.github/workflows/verifiche.yml` (job «Conformità redazionale»);
`scripts/verifica-dichiarazione-non-marcatura.sh`, provato su artefatto deliberatamente privo e
attivo come job «Dichiarazione di non marcatura nell'artefatto pubblicato (`T-01` criterio 7)».
**Nessuno dei due copre un pacchetto regolatorio**, che oggi non esiste.

**Come si dimostra soddisfatto.** Il controllo gira sull'intero pacchetto, non produce rilievi, ed
è stato visto fallire su un testo deliberatamente non conforme. La voce 8 della lista di
autocontrollo di `08/04 §16` è verificata meccanicamente e non a vista.

### C-5 - Il pacchetto dichiara sulla copertina che cosa non è

**Che cosa serve.** L'errore che questo traguardo può produrre è **un pacchetto letto come
fascicolo**. `08/04 §1` lo previene: una documentazione tecnica eccellente **non è** un fascicolo
tecnico e non lo diventa per accumulo, perché mancano tre proprietà formali - controllo,
navigabilità con revisione esatta, attribuzione a un soggetto.

**Come si dimostra soddisfatto.** La copertina del pacchetto dichiara, in italiano e in inglese e
in posizione **sopra** e non sotto: che nessun elemento è un documento del fascicolo (`V-174`);
che gli elementi entrano nel sistema di gestione della qualità di chi li acquisisce come
**ingressi identificati** da riemettere (`V-179`); che il prodotto non reca marcatura CE; e che
il progetto intende costituire il soggetto fabbricante, **che oggi non è costituito**.

### C-6 - La matrice dei requisiti generali esiste fino alla penultima colonna

**Che cosa serve.** `MDR-GSPR-001`: elenco dei requisiti generali dell'Allegato I con
applicabilità motivata, metodo di dimostrazione, norme applicate. È «la spina dorsale del
fascicolo» e «il documento che l'organismo notificato legge per primo» (`08/04 §7`).

**Che cosa esiste già.** **Nulla**: `08/04 §11` riga 3 dichiara che non è mai stata compilata e la
qualifica come «il lotto di lavoro più sottovalutato».

**Come si dimostra soddisfatto.** Esiste la tabella con **una riga per ciascun requisito
generale**, comprese le voci **non applicabili con la loro motivazione** (voce 3 della lista di
autocontrollo di `08/04 §16`: un fascicolo che salta le voci non applicabili è incompleto, non
snello), con metodo di dimostrazione, norma applicata e rinvio all'analisi. **L'ultima colonna -
identificazione precisa dei documenti controllati - è presente e vuota**, con la dichiarazione
che la compila il fabbricante. Le occorrenze `[NV]` sulla numerazione puntuale dell'Allegato I
sono ammesse **con destinatario dichiarato** e non fanno fallire il criterio: `08/04 §17` le
registra già come aperte.

### C-7 - La distinta dei materiali del pacchetto è firmata e conservata fuori dalla piattaforma di costruzione

**Che cosa serve.** Distinta generata a ogni costruzione, per ogni artefatto, firmata con
materiale che non risiede nella pipeline, con attestazione di provenienza (criteri 5, 6 e 7 di
`T-03`), e **conservata con la disciplina del fascicolo** e non fino alla scadenza
dell'archiviazione degli artefatti di una piattaforma di integrazione continua - che `08/04 §15`
qualifica come «un errore ricorrente» con «una forma banale».

**Che cosa esiste già.** Misurato sul repository: il flusso `.github/workflows/verifiche.yml`
contiene il job «Distinta dei materiali del sito», che installa le dipendenze del sito con
`npm ci`, genera `sbom-website.json` con CycloneDX e lo carica come artefatto di costruzione con
nome `distinta-dei-materiali`. **Copre le sole dipendenze npm del sito**, **non è firmata**, e la
sua conservazione è quella degli artefatti della piattaforma. Nessun artefatto applicativo esiste,
quindi nessuna distinta applicativa esiste.

**Come si dimostra soddisfatto.** Esiste la distinta per ogni artefatto distribuito, è firmata, e
il pacchetto **non rinvia ad alcun artefatto la cui conservazione dipenda dalla ritenzione della
piattaforma di integrazione continua**. La verifica è meccanica: ogni rinvio del pacchetto si
risolve, e la risoluzione non passa da un'URL di artefatto temporaneo.

### C-8 - La ripartizione delle responsabilità è completata

**Che cosa serve.** `09/02 §5` elenca fra i contenuti di `T-12` la «ripartizione delle
responsabilità **completata**».

**Che cosa esiste già.** [`06_security/09`](../../docs/06_security/09-ripartizione-delle-responsabilita.md)
esiste, con le tabelle per misura e la colonna «contributo del progetto». La tabella dei
trentasette ruoli è **confermata** dall'area di conformità in
[`08/01 §10`](../../docs/08_compliance/01-inquadramento-normativo.md), che vi aggiunge **cinque
precisazioni** - operatore economico come quinto ruolo, fabbricante ai sensi della resilienza,
fabbricante ai sensi dello spazio dei dati sanitari come sesto ruolo, rafforzamento della
contitolarità, livello di garanzia riferito. **Le cinque precisazioni non risultano recepite nel
testo di `06_security/09`**, e `Q-151` - completamento con il testo dei requisiti dopo la lettura
degli allegati di dettaglio - è dichiarata aperta in `06_security/09 §13`. **«Completata» oggi
non è vero**, ed è un elemento parziale e non un elemento presente.

**Come si dimostra soddisfatto.** Le cinque precisazioni sono recepite nel testo, `Q-151` è chiusa
o esplicitamente confermata aperta con la conseguenza dichiarata, e ogni riga condivisa è
**assegnata nominativamente** nella forma contrattuale prevista da `08/09 §7.3` - perché «una
responsabilità condivisa e non presidiata è una responsabilità di nessuno».

### C-9 - La dichiarazione tecnica di deroga sulla protezione degli endpoint esiste

**Che cosa serve.** `06_security/09 §12` voce 3: dichiarazione tecnica di deroga con le misure
compensative native e la configurazione supportata. Il fondamento è in
[`07_integration/09 §2.6`](../../docs/07_integration/09-obblighi-di-chi-integra.md): installare
protezioni sugli endpoint di un dispositivo medico «ne potrebbe invalidare la certificazione», la
deroga esiste **ma richiede misure compensative documentate, che deve fornire il fornitore**.

**Che cosa esiste già.** La prescrizione, in due luoghi. Il documento **non esiste**.

**Come si dimostra soddisfatto.** Esiste il documento, elenca le misure compensative native e la
configurazione supportata, ed è redatto in forma **recepibile nel fascicolo di chi installa** -
perché `07_integration/09 §2.6` avverte che «è a voi che verranno chieste», e un documento non
recepibile è un documento archiviato.

### C-10 - Il pacchetto è generato, non redatto, dove il contenuto è generabile

**Che cosa serve.** La regola strutturale dell'area: la matrice di tracciabilità è **generata** e
non compilata a mano (`08/03 §7.3`), il documento di capacità è generato (`OL-16` criterio 3),
la matrice dei requisiti generali va costruita a partire dagli stessi identificativi del file di
rischio (`08/04 §8`, terzo fatto).

**Come si dimostra soddisfatto.** Per ogni elemento del pacchetto è dichiarato se è **generato**
o **redatto**, e per ogni elemento generato una divergenza fra la fonte e l'elemento **fa fallire
la costruzione**. Il criterio non chiede che tutto sia generato: chiede che sia dichiarato quale
lo è, perché due documenti costruiti separatamente divergono al secondo aggiornamento.

---

## 3. L'inventario del pacchetto, misurato sul repository

**Metodo.** Ogni riga dichiara: che cosa serve, che cosa esiste **misurato sul repository** e non
dedotto dalla mappa, e lo stato. Gli stati sono tre e non ammettono sfumature: **esiste**,
**parziale**, **manca**. «Esiste» significa che il contenuto è presente in forma verificabile,
**non** che esista un documento controllato: nessun documento del fascicolo esiste oggi come
documento controllato, per la ragione dichiarata in `08/04 §3`.

| # | Elemento | Che cosa esiste, misurato | Stato |
|---|---|---|---|
| 1 | **Fascicolo tecnico** (Allegato II e III) | `docs/08_compliance/04-fascicolo-tecnico.md` esiste ed è la **mappa** voce per voce, non il fascicolo. Nessun file nello spazio `MDR-*` è presente nel repository. Il § 11 dello stesso capitolo elenca **quattordici** assenze; il § 12 elenca **quindici** atti riservati | **manca** (la mappa esiste, il fascicolo no) |
| 2 | **Documentazione di ciclo di vita del software** (`SW-*`) | Gli **ingressi** esistono: `docs/01_technical/08-qualita-e-test.md`, `docs/01_technical/09-integrazione-continua-e-rilascio.md`, `docs/02_architecture/`, `docs/08_compliance/03-sistema-di-gestione-della-qualita.md` §§ 6–8. Nessun file `SW-*`. **E nessun codice applicativo esiste**: [`09/00 §4`](../../docs/09_roadmap/00-indice.md) accerta «Codice applicativo: **assente**», e `V-182` vieta ogni riga prima di `T-03` | **parziale**: gli ingressi ci sono, i documenti no, e una parte non ha ancora oggetto |
| 3 | **Gestione del rischio** (`RM-*`) | `docs/08_compliance/05-gestione-del-rischio.md` esiste; le **voci** del registro sono identificate e citate per identificativo in più aree (`RM-01`…`RM-17` ricorrono in `08/06`, `08/08`, `08/09`). Manca il **piano con i criteri di accettabilità**, che `08/04 §11` riga 4 attribuisce al fabbricante | **parziale** |
| 4 | **Fascicolo di ingegneria dell'usabilità** (`UEF-001`) | `docs/08_compliance/06-usabilita-e-accessibilita.md` e `docs/03_functional/06-accessibilita-e-usabilita.md` esistono. Nessun file `UE-*` o `UEF-*`. `08/06 §4` dichiara il progetto avanti sugli artefatti 2, 3, 4 e 6 e **indietro sull'artefatto 8**: nessuna valutazione formativa condotta con utenti reali, nessuna sommativa. `08/04 §11` riga 5 marca la parte formativa **non recuperabile** | **parziale, con una componente irreversibilmente mancante** |
| 5 | **Matrice di tracciabilità** | Il **registro** esiste: `registro/identificativi-requisiti.tsv`, **614 identificativi** su otto famiglie, in sola aggiunta, con formato dichiarato in `registro/README.md`; `scripts/verifica-identificativi-requisiti.sh` è in esercizio e provato su registro malformato, identificativo assente, identificativo ritirato e riuso dopo ritiro. **La generazione della matrice non è in esercizio**: è il criterio 6 di `T-08`, e `08/04 §11` riga 10 la marca **non recuperabile** | **parziale**: il prerequisito irrecuperabile è salvo, l'artefatto no |
| 6 | **Distinta dei materiali firmata** | `.github/workflows/verifiche.yml`, job «Distinta dei materiali del sito»: genera `sbom-website.json` con CycloneDX sulle dipendenze npm del **sito**, `--omit dev`, e la carica come artefatto di costruzione. **Non è firmata**, non copre alcun artefatto applicativo, e la sua conservazione è quella della piattaforma | **parziale, e sul perimetro sbagliato** |
| 7 | **Dichiarazione tecnica di deroga sulla protezione degli endpoint** | Prescritta in `docs/06_security/09-ripartizione-delle-responsabilita.md` § 12 voce 3 e § 5 riga `ID.RA-06`; fondata in `docs/07_integration/09-obblighi-di-chi-integra.md` § 2.6. **Il documento non esiste** | **manca** |
| 8 | **Ripartizione delle responsabilità completata** | `docs/06_security/09-ripartizione-delle-responsabilita.md` esiste; `08/01 §10` conferma la tabella dei trentasette ruoli e vi aggiunge **cinque precisazioni non recepite**; `Q-151` aperta | **parziale**: «completata» non è vero |
| 9 | **Elenco delle lacune datate** - la novità di `T-12` | Il contenuto esiste disperso in `09/03 §5`, `09/01 §8`, `08/10 §9`, criterio 3 di `T-10`. **L'artefatto unico non esiste** | **manca** |
| 10 | **Dichiarazioni pubbliche** | `NOT-A-MEDICAL-DEVICE.md` e `DISTRIBUTION-POLICY.md` esistono alla radice, **bilingui in un file solo** (blocco italiano, separatore, blocco inglese), allineati a `D58`. Il criterio 6 di `T-01` è dichiarato soddisfatto, e il criterio 8 lo è per rettifica del 26 agosto 2026 | **esiste** |
| 11 | **Controlli di costruzione a presidio del pacchetto** | Esistono e sono provati: `verifica-terminologie.sh`, `verifica-conformita-redazionale.sh`, ricerca di segreti, `verifica-divergenza-traduzioni.sh`, `verifica-identificativi-requisiti.sh`, `verifica-dichiarazione-non-marcatura.sh`, più il banco `scripts/prove/esegui-prove.sh` con **22 casi**, sottoposto a prova di mutazione | **esiste** |
| 12 | **Schermata «Informazioni sul dispositivo»** | `08/04 §5` la chiede come **spazio predisposto**, a costo quasi nullo ora e caro dopo, perché una modifica tardiva dell'interfaccia riapre la valutazione dell'usabilità. Nessuna interfaccia esiste | **manca**, e il costo di ometterla cresce |
| 13 | **Dossier dello stato dell'arte** | `08/07 §4.1` lo qualifica come «l'unico contributo davvero strategico del progetto alla valutazione clinica», integralmente producibile perché costruito su fonti pubbliche. Richiede però competenza clinica documentabile che il progetto **non ha internamente**: è `Q-176`, aperta verso il committente. **Non esiste** | **manca**, e la decisione di produrlo non è presa |
| 14 | **Piano di sorveglianza post-commercializzazione** (`PMS-PLAN-001`) | `docs/08_compliance/08-sorveglianza-post-commercializzazione.md` esiste con gli indicatori e le righe di rischio sorvegliate. Il piano non è redatto, e alcuni indicatori richiedono capacità di prodotto non dichiarate (`Q-116`) | **parziale** |

**Tre letture di questa tabella.**

**La prima.** Nessun elemento è nello stato «esiste» per la parte che conta di più - il fascicolo,
la matrice generata, la distinta firmata, l'elenco delle lacune - e i due elementi pienamente
esistenti sono le **dichiarazioni pubbliche** e i **controlli di costruzione**, cioè
precisamente le componenti `A` che `T-01` ha portato in esercizio. La marcatura «`D` con
componenti `A` già chiuse» è quindi accurata.

**La seconda.** Le righe 4, 5 e 6 sono di natura diversa dalle altre e vanno lette insieme: sono
le tre voci in cui il tempo **non è recuperabile con denaro** (`08/04 §11`, righe 5, 9 e 10). Da
`D58` il costo dell'omissione è **interamente nostro**.

**La terza.** Le righe 12 e 13 sono le due in cui il costo di attendere cresce e non è visibile:
la schermata di informazioni costa quasi nulla ora e riapre la valutazione dell'usabilità se
introdotta tardi; il dossier dello stato dell'arte è a monte della ricerca sistematica ed è
lavoro **nostro** dal momento in cui `D58` ha cambiato il destinatario.

---

## 4. L'innesco, reso osservabile

`T-12` ha una data d'anno e un innesco: la **chiusura di `Q-183`** verso l'area di conformità.
`Q-183`, nella formulazione della bacheca, chiede «quali evidenze del pacchetto regolatorio sono
consegnabili e quali no» e «determina il perimetro del traguardo `T-12`». **Non ha punto di
decisione irreversibile** ([`09/00 §10`](../../docs/09_roadmap/00-indice.md), colonna «Punto di
decisione»: «-»).

**Forma osservabile della chiusura.** `Q-183` si considera chiusa quando esiste, versionato, un
atto che per **ciascuna** delle quattordici righe del § 3 dichiara: consegnabile / non
consegnabile / consegnabile in forma dichiaratamente parziale, con la ragione e il titolare. Un
atto che chiudesse `Q-183` senza coprire tutte le righe non chiuderebbe la questione: ne
sposterebbe una parte senza dirlo.

**Che cosa questo piano fa e che cosa non fa.** Il § 3 è la **bozza dell'atto** che chiude
`Q-183`. **La chiusura è di `COMP`**, non di questo piano: un piano che dichiarasse chiusa una
questione altrui avrebbe deciso al posto di chi decide.

---

## 5. I lavori

### 5.1 Eseguibili ora, senza il soggetto fabbricante

| # | Prodotto | File toccati | Dipendenze | Criterio di fatto (binario) |
|---|---|---|---|---|
| `T-12/L-01` | Inventario unico e versionato del pacchetto, che chiude `Q-183` | nuovo, in `docs/08_compliance/`; rinvii alle quattordici righe del § 3 | nessuna | Ogni riga del § 3 ha esattamente uno stato, un titolare e - se parziale o mancante - la ragione. Nessuna riga senza stato |
| `T-12/L-02` | Elenco delle lacune datate | nuovo; ingressi da `09/03 §5`, `09/01 §8`, `08/10 §9` | `Q-189` per la ripartizione | Ogni riga porta data di nascita, periodo, ragione, titolare, e la distinzione fra chiudibile in avanti e datata per sempre. Una riga senza data fa fallire il lavoro |
| `T-12/L-03` | Regola di identificazione degli artefatti secondo `V-179` e controllo che la impone | `scripts/`, `.github/workflows/verifiche.yml` | nessuna | Il controllo esiste, è bloccante, ed è stato **visto fallire** su un artefatto privo di una delle tre proprietà |
| `T-12/L-04` | Copertina del pacchetto con le quattro dichiarazioni di `C-5`, in italiano e in inglese | nuovo | `T-12/L-01` | Le quattro dichiarazioni sono presenti, in entrambe le lingue, in posizione **sopra** il contenuto; il controllo di divergenza `verifica-divergenza-traduzioni.sh` non produce rilievi |
| `T-12/L-05` | `MDR-GSPR-001` fino alla penultima colonna | nuovo | Lettura riga per riga dell'Allegato I; `[NV]` aperte in `08/04 §17` | Esiste una riga per ciascun requisito generale, comprese le non applicabili con motivazione; l'ultima colonna è presente e vuota con la dichiarazione di chi la compila |
| `T-12/L-06` | Dichiarazione tecnica di deroga sulla protezione degli endpoint | nuovo, area sicurezza | `06_security/08 §6` | Il documento esiste, elenca misure compensative native e configurazione supportata, ed è in forma recepibile nel fascicolo di chi installa |
| `T-12/L-07` | Recepimento delle cinque precisazioni di `08/01 §10` in `06_security/09` | `docs/06_security/09-ripartizione-delle-responsabilita.md` | `Q-151` | Le cinque precisazioni compaiono nel testo; `Q-151` è chiusa o confermata aperta con conseguenza dichiarata |
| `T-12/L-08` | Estensione del controllo `V-171` all'intero pacchetto, comprese le date di marcatura | `scripts/verifica-conformita-redazionale.sh` | nessuna | Il controllo gira sul pacchetto, non produce rilievi, ed è stato visto fallire su un testo deliberatamente non conforme |
| `T-12/L-09` | Lista di autocontrollo di `08/04 §16` applicata al pacchetto, con esito registrato e datato | nuovo | `T-12/L-01` | Le dieci voci hanno un esito registrato; nessuna voce senza esito |
| `T-12/L-10` | Dichiarazione, elemento per elemento, di che cosa è **generato** e che cosa è **redatto** | parte di `T-12/L-01` | nessuna | Ogni elemento porta l'indicazione; per ogni elemento generato una divergenza dalla fonte fa fallire la costruzione |
| `T-12/L-11` | Capacità di prodotto richieste dal piano di sorveglianza: verifica che gli indicatori dichiarati siano prodotti dal sistema | `docs/08_compliance/08-*`, `docs/01_technical/06-osservabilita.md` | `Q-116` | Per ciascun indicatore esiste la dichiarazione «prodotto dal sistema» o «non prodotto», e nessun indicatore resta senza. Voce 10 della lista di autocontrollo: il piano dichiara indicatori che il sistema produce davvero |

### 5.2 Eseguibili quando esistono il codice e la catena di costruzione

| # | Prodotto | Dipendenze | Criterio di fatto (binario) |
|---|---|---|---|
| `T-12/L-12` | Distinta dei materiali firmata per ogni artefatto distribuito, con attestazione di provenienza | `T-03` criteri 5, 6, 7 | Ogni artefatto ha la propria distinta, firmata con materiale che non risiede nella pipeline; nessun rinvio del pacchetto si risolve su un artefatto a conservazione temporanea |
| `T-12/L-13` | Matrice di tracciabilità **generata** come artefatto di rilascio | `T-08` criterio 6 | La matrice è generata e non redatta; una prova che cita un identificativo assente dal registro fa fallire la costruzione (già in esercizio) |
| `T-12/L-14` | Documenti `SW-*` di ciclo di vita riferiti al codice esistente | `T-03`, `T-08` | Ogni esito di verifica porta **la versione dell'oggetto verificato** e la data (voce 4 della lista di autocontrollo, e record 4 di `08/03 §8`) |
| `T-12/L-15` | Schermata «Informazioni sul dispositivo» come spazio predisposto, con campi configurabili per distribuzione | esistenza dell'interfaccia | La schermata esiste, è raggiungibile senza autenticazione e senza percorsi profondi, è accessibile, e i campi sono configurazione e non codice |

---

## 6. Le dipendenze

### 6.1 Interne

| # | Da che cosa dipende | Che cosa fornisce |
|---|---|---|
| I-1 | `T-01` criteri 3, 4, 5 | Il registro degli identificativi e il controllo che lo presidia. **Già soddisfatti** |
| I-2 | `T-03` criteri 5, 6, 7 | Distinta generata per ogni artefatto, registro dei componenti di terze parti, firma con materiale fuori pipeline |
| I-3 | `T-08` criterio 6 | La matrice di tracciabilità generata |
| I-4 | `T-11` | Il contenuto del fascicolo di usabilità. **Sovrapposizione dichiarata**: `UEF-001` compare fra i contenuti di `T-12` in `09/02 §5` **e** è l'oggetto di `T-11`. Il confine adottato da questi piani è: `T-11` produce il contenuto e la sommativa, `T-12` lo impacchetta. Il confine **non è nella roadmap** ed è segnalato al § 9 |
| I-5 | `Q-189` | La ripartizione delle registrazioni a ruoli distinti, che determina quante righe entrano in `L-02`. Punto di decisione: **30 settembre 2026**; esito predefinito: lacuna dichiarata |
| I-6 | `Q-183` | L'innesco (§ 4) |

### 6.2 Esterne, e che cosa succede se non arrivano

| # | Dipendenza | Se non arriva |
|---|---|---|
| **E-1** | **Competenza clinica documentabile** per il dossier dello stato dell'arte (`Q-176`) | La riga 13 dell'inventario resta «manca». Il pacchetto è consegnabile lo stesso, **ma manca l'unico elemento a tempo lungo che il progetto potrebbe produrre da solo**, e il ritardo si trasferisce integralmente sulla ricerca sistematica |
| **E-2** | **Testo consolidato delle fonti primarie** per chiudere le `[NV]` di `08/04 §17` e `08/01 §14` | Le righe interessate della matrice `MDR-GSPR-001` restano `[NV]` **con destinatario dichiarato**, che è ammesso dal criterio 3 di `T-02`. Non blocca il pacchetto; blocca il documento controllato che vi si fonderà |
| **E-3** | **Modelli documentali delle tipologie del fascicolo sanitario** (`Q-07`, riga 13 di `08/04 §11`) | Elemento esterno al progetto, con dipendenza da un ente terzo. Il progetto ha già la risposta strutturale: dataset canonico e serializzazioni sostituibili. Non blocca `T-12` |
| **E-4** | **Soggetto fabbricante costituito** | Il pacchetto resta un pacchetto e **non diventa un fascicolo** (§ 7). Non blocca alcun lavoro del § 5 |
| **E-5** | **Decisione del committente su `Q-172`** (versionamento della distribuzione identificata) | `08/04 §17` avverte che va decisa **prima** del primo rilascio della distribuzione, perché una rinumerazione successiva è una discontinuità di identificazione. Se non arriva, il pacchetto documenta un versionamento che potrebbe cambiare |

---

## 7. Che cosa non è eseguibile finché il soggetto fabbricante non esiste

**L'elenco è chiuso e va letto come tale.** `08/04 §12` enumera **quindici** voci e dichiara che
nessuna è ottenibile oggi, in nessuna forma, nemmeno in bozza, nemmeno con l'aiuto di un
consulente. Il § 12 **non si è accorciato con `D58` e non poteva**: sono atti che la norma riserva
al ruolo di fabbricante, e restano riservati **anche quando il ruolo sarà il nostro**.

Le voci che incidono direttamente su `T-12` sono cinque, e vanno isolate perché sono quelle che
separano un pacchetto da un fascicolo:

1. **Esistenza del fabbricante** (voce 1): è il vincolo più a monte di tutti gli altri.
2. **Controllo dei documenti e approvazione formale** di ogni documento del fascicolo (voce 4): è
   **la proprietà che trasforma un'analisi in un documento del fascicolo**. Senza di essa nessun
   elemento del pacchetto è un documento del fascicolo, per quanto completo sia.
3. **Ultima colonna di `MDR-GSPR-001`** (`08/04 §7`): «non è compilabile dal progetto, perché
   presuppone documenti controllati, che il progetto non ha» (`V-174`).
4. **Determinazione dei criteri di accettabilità del rischio** (voce 6): non delegabile né a un
   fornitore, né a un consulente, né a una tabella.
5. **Sottoposizione all'audit in sito** (voce 15): un organismo non ispeziona un repository,
   ispeziona **un'organizzazione**, e «un'organizzazione non si improvvisa alla vigilia di un
   audit in sito».

**La conseguenza netta, e va scritta sulla copertina e non in nota.** `T-12` può produrre **il
pacchetto** e **non può produrre un fascicolo**. Chi legge il pacchetto sperando di trovarvi un
fascicolo pronto all'uso troverà invece «tutto ciò che serve per scriverne uno in mesi invece che
in anni», che è una cosa diversa e va detta com'è (`08/04 §7`).

**E il varco da chiudere subito.** Chi legge che il progetto intende certificare, o che un
pacchetto regolatorio esiste, e ne conclude che il software sia utilizzabile su pazienti reali,
trae una conclusione **sbagliata**: un fascicolo che non esiste non copre nulla, e l'intenzione di
comporlo non trasferisce alcun obbligo a chi installa oggi una versione non certificata.

---

## 8. Il costo dichiarato

| Blocco | Classe | Da che cosa dipende |
|---|---|---|
| Inventario, elenco delle lacune, copertina, controlli (`L-01`…`L-04`, `L-08`…`L-10`) | **`D` - comprimibile** | Dal numero di righe dell'inventario, che è fissato a quattordici dal § 3 |
| `MDR-GSPR-001` fino alla penultima colonna (`L-05`) | **`D`, ma è il lotto più sottovalutato dell'intero fascicolo** (`08/04 §11` riga 3) | Dal numero di requisiti generali dell'Allegato I e dalla necessità di leggerli **riga per riga**; e dal numero di `[NV]` ancora aperte al momento della compilazione, perché ogni `[NV]` è una riga che non si chiude |
| Deroga endpoint, ripartizione completata (`L-06`, `L-07`) | **`D`**, con dipendenza da `Q-151` | Dalla lettura degli allegati di dettaglio, che non è dell'area |
| Distinta firmata, matrice generata, documenti `SW-*` (`L-12`…`L-14`) | **`D`**, ma **privi di oggetto oggi** | Dall'esistenza del codice e della catena di costruzione. Non è comprimibile perché non è iniziabile |
| Dossier dello stato dell'arte (riga 13) | **`B`** - richiede una competenza esterna | Da `Q-176`, decisione del committente, e dalla disponibilità di una figura con qualifica documentabile |
| Cicli di risposta alle non conformità sul pacchetto | **Non stimabile** | `08/09 §8.2` blocco C: due cicli o quattro sono la stessa pianificazione con costi diversi di un fattore due. Con `D58` questi cicli sono **lavoro nostro** e occupano la stessa capacità che produce il software (`Q-188`) |

**Regola che governa questo paragrafo.** Non si stima ciò che ha una fonte pubblica primaria e non
si stima ciò che dipende da variabili non note (`08/09 §8.2`). Il blocco non stimabile si mette a
bilancio **come riserva dichiarata**, non si omette.

---

## 9. I rischi propri, con la contromisura

| Rischio | Contromisura |
|---|---|
| **Il pacchetto viene letto come fascicolo.** È il rischio dominante di questo traguardo, e non è teorico: un pacchetto completo e ben organizzato assomiglia a un fascicolo più di quanto un fascicolo assomigli a sé stesso | `C-5` e `T-12/L-04`: copertina con le quattro dichiarazioni, sopra e non sotto, in entrambe le lingue; `V-174` e `V-179` ripetuti su ogni artefatto |
| **Il pacchetto rinvia a un artefatto eliminato** dalla ritenzione della piattaforma di integrazione continua | `C-7`, `T-12/L-03` e `T-12/L-12`. `08/04 §15` lo chiama «un errore ricorrente» con «una forma banale» |
| **Un `[NV]` entra in un documento presentato come regolatorio senza destinatario** | Il criterio 3 di `T-02` - zero occorrenze di `[NV]` prive di destinatario - esteso al pacchetto, con il rapporto pubblicato delle occorrenze ammesse |
| **Il pacchetto diverge dal repository al secondo aggiornamento** | `C-10` e `T-12/L-10`: dichiarare che cosa è generato, e far fallire la costruzione su una divergenza |
| **Il confine con `T-11` resta indeciso** e `UEF-001` viene prodotto due volte o zero volte | Il confine adottato è dichiarato in I-4 ed è **segnalato alla roadmap**, non deciso qui |
| **La ripartizione dichiarata «completata» quando non lo è** | `C-8`: la parola «completata» del testo di `09/02 §5` **oggi non è vera**, e questo piano lo registra invece di ereditarla |
| `R-04` - questioni che convergono sull'area di conformità | Nessuna interna: è la conseguenza strutturale del fatto che `T-12` è il punto in cui otto aree consegnano |
| `R-24` - priorità che si spostano | Registro delle modifiche del § 11, e revisione fuori cadenza di `09/00 §8.2` |

---

## 10. Che cosa il traguardo non comprende

- **La marcatura CE, la dichiarazione di conformità e la domanda all'organismo notificato.** Sono
  atti riservati e non anticipabili (§ 7).
- **Il fascicolo tecnico.** `T-12` produce gli **ingressi**; l'atto che li trasforma in fascicolo è
  l'inserimento di ciascun rinvio dentro un sistema di controllo dei documenti, e quell'atto è del
  fabbricante.
- **La valutazione clinica.** È un percorso autonomo, il secondo a tempo lungo del calendario, e
  il rapporto **non è producibile dal progetto in nessuna forma, nemmeno in bozza**
  ([`08/07 §9`](../../docs/08_compliance/07-valutazione-clinica.md)).
- **L'analisi di equivalenza dell'Allegato XIV.** Non entra nella documentazione pubblica del
  progetto in nessuna forma e in nessuna fase: è il vincolo `V-274`, e **non si attenua per
  effetto di `D58`**, perché l'assunzione del ruolo sposta chi redige quel documento, non dove il
  documento vive.
- **La dichiarazione di accessibilità del servizio** (`V-273`).
- **L'accreditamento come fornitore di servizi** verso la federazione nazionale delle identità
  (`D36`, `V-05`, `OUT-22`): il ruolo di fabbricante e quello di fornitore di servizi sono cose
  diverse, e assumere il primo non avvicina il secondo.
- **La validazione sommativa di usabilità**, che è `T-11`.
- **Le registrazioni a ruoli distinti**, che sono `OL-22` e non entrano nel piano come attività
  (`V-281`): entrano come lacune dichiarate, ed è il lavoro `T-12/L-02`.

---

## 11. Registro delle modifiche di questo piano

| Data | Che cosa è cambiato | Perché | Effetto sulla roadmap |
|---|---|---|---|
| - | - | - | - |

**Regole di compilazione.** (a) Ogni modifica a una riga dell'inventario del § 3 produce una riga
qui, perché l'inventario è l'oggetto di `Q-183` e una sua variazione è una variazione di
perimetro del traguardo. (b) Una modifica ai criteri del § 2 richiede la revisione fuori cadenza
di [`09/00 §8.2`](../../docs/09_roadmap/00-indice.md). (c) La marcatura `[INTENZIONE]` e l'anno
dichiarato non si convertono in un impegno datato con una riga di questo registro.
