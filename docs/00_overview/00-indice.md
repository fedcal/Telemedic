---
title: Panoramica — indice e orientamento
sidebar_position: 1
description: "La porta d'ingresso alla documentazione di Telemedic: come è organizzata, i percorsi di lettura per profilo, la mappa delle undici aree con ciò che ciascuna copre e ciò che non copre, le convenzioni comuni e le regole di precedenza."
---

# Panoramica — indice e orientamento

Questa è la porta d'ingresso alla documentazione di Telemedic. **Non riassume le altre aree:
instrada.** Se una risposta esiste altrove, qui trovi il collegamento e la ragione per cui sta lì
e non altrove.

La documentazione è ampia — undici aree, più il registro delle decisioni architetturali —
e **nessuno la legge per intero**. Il §3 contiene i percorsi che coprono i casi reali.

## 1. Le quattro pagine di questa area

| # | Pagina | A quale domanda risponde |
|---|---|---|
| 01 | [Visione e obiettivi](./01-visione-e-obiettivi.md) | Che cos'è Telemedic, quale problema reale affronta, e **che cosa ha deciso di non essere** |
| 02 | [Le quattro prestazioni](./02-le-quattro-prestazioni.md) | Che cosa distingue davvero televisita, teleconsulto, teleassistenza e telemonitoraggio, quali obblighi distinti portano, quali nozioni di confine vengono confuse con esse |
| 03 | [A chi si rivolge](./03-a-chi-si-rivolge.md) | Per struttura, professionista, assistito, integratore ed ente: che cosa ottiene, che cosa deve mettere di suo, **che cosa il progetto non gli dà** |
| 04 | [Stato e limiti](./04-stato-e-limiti.md) | Che cosa esiste oggi, che cosa non esiste, i limiti dichiarati e le tensioni accettate consapevolmente |

## 2. Se hai cinque minuti

Tre affermazioni, ciascuna verificabile, che determinano se il resto ti interessa.

**Prima.** Il repository è **codice sorgente e documentazione**, non un dispositivo medico immesso
sul mercato. **Oggi non reca marcatura CE** e non è coperto da alcuna dichiarazione di conformità.
Finché una marcatura non esiste, **il software non è utilizzabile per l'erogazione di prestazioni
sanitarie su persone reali**. Il progetto ha deciso di assumere in proprio il ruolo di fabbricante
(`D58`), ma il soggetto giuridico è **ancora da costituire** e **nessun documento dichiara una data
entro cui il prodotto sarà marcato**. Fonte diretta:
[`NOT-A-MEDICAL-DEVICE.md`](https://github.com/fedcal/Telemedic/blob/main/NOT-A-MEDICAL-DEVICE.md).

**Seconda.** Al momento della stesura di quest'area **non esiste codice applicativo**. Esiste un
corpo documentale esteso e nessuna riga di software del servizio o dell'interfaccia. La fotografia
completa è in [04 — Stato e limiti](./04-stato-e-limiti.md) §2.

**Terza.** Il progetto è costruito attorno alle definizioni normative italiane delle prestazioni di
telemedicina, non attorno a una piattaforma di videochiamata. Se le distinzioni fra televisita,
teleconsulto, teleassistenza e telemonitoraggio non contano per il tuo caso d'uso, quasi tutte le
scelte documentate qui sembreranno inutilmente complicate — e la spiegazione del perché non lo sono
è in [02 — Le quattro prestazioni](./02-le-quattro-prestazioni.md).

## 3. Percorsi di lettura

### 3.1 Chi valuta il progetto e deve decidere se adottarlo

L'ordine è studiato: prima i limiti, poi il perimetro, poi ciò che l'adozione comporta.

1. [04 — Stato e limiti](./04-stato-e-limiti.md), **per intero**. Il §7 è la lista degli otto punti
   che vanno saputi prima di decidere.
2. [`docs/09_roadmap/03-primo-rilascio-utilizzabile.md`](../09_roadmap/03-primo-rilascio-utilizzabile.md)
   — perimetro esatto del primo rilascio, presupposti di installazione, limiti dichiarati.
3. [`docs/06_security/09-ripartizione-delle-responsabilita.md`](../06_security/09-ripartizione-delle-responsabilita.md)
   — la tabella da mettere accanto a un capitolato. Esiste specificamente perché nessuno creda di
   essere coperto dove non lo è.
4. [`docs/03_functional/07-fuori-perimetro.md`](../03_functional/07-fuori-perimetro.md) — che cosa
   il sistema non fa, con la categoria di riapribilità di ciascuna esclusione.
5. [`docs/09_roadmap/00-indice.md`](../09_roadmap/00-indice.md) §§2–3 — per non attribuire al
   progetto impegni che non ha assunto.

### 3.2 Chi deve installare e mandare in esercizio

1. [`docs/02_architecture/08-viste-di-deployment.md`](../02_architecture/08-viste-di-deployment.md)
   — componenti, reti, isolamento del relay, dipendenze.
2. [`docs/09_roadmap/03-primo-rilascio-utilizzabile.md`](../09_roadmap/03-primo-rilascio-utilizzabile.md)
   §5 — i presupposti. **Chi non può soddisfarli non può installare.**
3. [`docs/02_architecture/05-multi-tenancy.md`](../02_architecture/05-multi-tenancy.md) e
   [`docs/02_architecture/07-tracciamento-e-registro-immutabile.md`](../02_architecture/07-tracciamento-e-registro-immutabile.md).
4. [`docs/01_technical/06-osservabilita.md`](../01_technical/06-osservabilita.md),
   [`docs/01_technical/07-prestazioni-e-capacita.md`](../01_technical/07-prestazioni-e-capacita.md)
   e [`docs/01_technical/09-integrazione-continua-e-rilascio.md`](../01_technical/09-integrazione-continua-e-rilascio.md).
5. [`docs/06_security/08-quadro-normativo-e-misure.md`](../06_security/08-quadro-normativo-e-misure.md)
   e [`docs/06_security/10-risposta-agli-incidenti.md`](../06_security/10-risposta-agli-incidenti.md)
   — i quattro orologi distinti, che non vanno confusi.

### 3.3 Chi deve integrare un sistema esistente

Il punto d'ingresso è [`docs/07_integration/00-indice.md`](../07_integration/00-indice.md), che
contiene un albero decisionale per scegliere la modalità: la prima domanda è **chi autentica la
persona davanti allo schermo**, e non è una domanda tecnica.

Se non hai familiarità con il dominio, prima:
[`docs/10_fondamenti/02-prestazioni-di-telemedicina.md`](../10_fondamenti/02-prestazioni-di-telemedicina.md),
[`docs/10_fondamenti/04-identita-e-anagrafiche.md`](../10_fondamenti/04-identita-e-anagrafiche.md),
[`docs/10_fondamenti/06-fhir-da-zero.md`](../10_fondamenti/06-fhir-da-zero.md).

Poi, in ordine di conseguenze irreversibili:
[01 — Le quattro modalità](../07_integration/01-modalita-di-integrazione.md), comprese le sezioni
«quando è la scelta sbagliata»; [06 — Identità e delega](../07_integration/06-identita-e-delega.md),
che è il capitolo con più conseguenze irreversibili;
[09 — Obblighi di chi integra](../07_integration/09-obblighi-di-chi-integra.md), da leggere **prima**
della firma di un contratto, non dopo.

### 3.4 Chi vuole contribuire al codice

La guida dei fondamenti in
[`docs/10_fondamenti/`](../10_fondamenti/00-come-usare-questa-guida.md) è **prerequisito dichiarato**
di [`CONTRIBUTING.md`](https://github.com/fedcal/Telemedic/blob/main/CONTRIBUTING.md). Ventuno
moduli che non danno per scontato nulla, né del mondo sanitario né di quello informatico, con
percorsi di lettura distinti per profilo. **Quattro dei ventuno non sono ancora scritti** — fra cui
il glossario e la matrice area del codice → conoscenze richieste: vedi
[04 — Stato e limiti](./04-stato-e-limiti.md) §3.

Dopo la guida: l'indice dell'area che si intende toccare, e tre pagine che possono far respingere
una proposta indipendentemente dalla qualità del codice —
[`docs/08_compliance/02-qualificazione-e-classificazione.md`](../08_compliance/02-qualificazione-e-classificazione.md)
§6 sulle richieste che spostano la qualificazione,
[`docs/08_compliance/03-sistema-di-gestione-della-qualita.md`](../08_compliance/03-sistema-di-gestione-della-qualita.md)
§§7 e 9 su tracciabilità e componenti di terze parti,
[`docs/08_compliance/01-inquadramento-normativo.md`](../08_compliance/01-inquadramento-normativo.md)
§11 sulle formule vietate.

### 3.5 Chi percorre la strada della certificazione

Sono due soggetti diversi e la distinzione va tenuta: **il progetto**, che ha deciso di assumere in
proprio il ruolo di fabbricante per la propria distribuzione identificata (`D58`, con il soggetto
giuridico ancora da costituire); e **chi immette sul mercato un prodotto derivato**, che assume per
ciò stesso il ruolo di fabbricante per quel prodotto, indipendentemente da quanto scritto nella
licenza. I due percorsi non si sovrappongono e non si sostituiscono.

Per entrambi l'area di conformità è un **manuale operativo**, non un'informativa. Il percorso è
dichiarato in [`docs/08_compliance/00-indice.md`](../08_compliance/00-indice.md) §3.1 e comincia da
qualificazione e classificazione, perché leggere qualunque altra cosa prima significa leggerla
senza sapere quale regime si applichi.

Due avvertenze che risparmiano mesi: le attività dei primi trenta giorni non sono delegabili allo
sviluppo e non si recuperano a valle; la destinazione d'uso è il documento più costoso da
sbagliare, perché una singola formulazione sposta insieme classe di rischio e classe di sicurezza
del software.

> **Nota di allineamento.** I capitoli dell'area di conformità e le avvertenze alla radice del
> repository sono in parte costruiti sulla figura del fabbricante come **soggetto terzo**, e la
> loro riscrittura è prevista da `D58`. Dove divergono da questa panoramica sul punto, prevale il
> testo di `D58`: cambia **chi** è il destinatario del percorso, non **quanto** il prodotto è
> pronto oggi.

### 3.6 Chi arriva dal mondo clinico

[02 — Le quattro prestazioni](./02-le-quattro-prestazioni.md), poi
[`docs/03_functional/05-gestione-degli-allarmi.md`](../03_functional/05-gestione-degli-allarmi.md)
e [`docs/03_functional/07-fuori-perimetro.md`](../03_functional/07-fuori-perimetro.md): sono i
documenti che delimitano ciò che il sistema decide e ciò che resta atto professionale. Il
contributo più prezioso di un clinico è segnalare un'imprecisione nei moduli 02 e 03 della guida
dei fondamenti: vale più di dieci righe di codice.

## 4. La mappa delle aree

Per ciascuna: che cosa copre, che cosa **non** copre, e la domanda tipica che vi si risolve.

### 4.1 Le sette aree di prodotto

| Area | Copre | Non copre |
|---|---|---|
| [**01 Tecnica**](../01_technical/00-indice.md) | Come il sistema è **realizzato**: stack e motivazioni, backend, persistenza, frontend, media e tempo reale, osservabilità, prestazioni e capacità, qualità e test, integrazione continua e rilascio | *Che cosa fa* (funzionale), *perché i confini sono quelli* (architettura), *come si scrive un messaggio verso un terzo* (protocolli) |
| [**02 Architettura**](../02_architecture/00-indice.md) | I **confini interni** e le ragioni che li reggono: tredici contesti delimitati, aggregati e invarianti, modello dati canonico, multi-tenancy, eventi, registro immutabile, viste di dispiegamento, decisioni rinviate | Requisiti, protocolli, minacce e misure, contratti verso terzi, scelte di libreria, date |
| [**03 Funzionale**](../03_functional/00-indice.md) | **Che cosa il sistema fa**, per chi, a quali condizioni: attori e ruoli, catalogo dei requisiti con identificativi congelati, casi d'uso con flussi di errore, regole di business, allarmi, accessibilità verificabile, **fuori perimetro** | Come è costruito; specifiche di interfaccia utente; il manuale d'uso; la dichiarazione di destinazione d'uso, da cui l'area **discende** |
| [**04 Protocolli**](../04_protocols/00-indice.md) | Come il progetto **usa** ciascun protocollo: versioni fissate con stato di maturità, profili, FHIR, documenti clinici, messaggistica ospedaliera, profili di interoperabilità, interfaccia di progetto, eventi e webhook, identità, tempo reale, prove di conformità | Che cosa sono i protocolli — quello è la guida dei fondamenti; le decisioni architetturali, che apre come questioni invece di prenderle |
| [**05 Dominio**](../05_domain/00-indice.md) | Come il dominio reale **diventa modello**: linguaggio ubiquo, prestazioni come macchine a stati, soggetti e ruoli nel tempo, documenti clinici, parametri e osservazioni, consenso, terminologie, percorsi di cura, glossario del dominio | Che cosa esiste nel mondo — quello è la guida dei fondamenti; l'implementazione |
| [**06 Sicurezza**](../06_security/00-indice.md) | Il bene protetto, l'avversario e la **conseguenza clinica** del fallimento: modello di minaccia, identità e accessi, protezione dei dati, tracciamento, tempo reale, sicurezza applicativa, catena di fornitura, quadro normativo, **ripartizione delle responsabilità**, risposta agli incidenti | Il percorso di certificazione; il contratto delle interfacce; le scelte architetturali; la pianificazione |
| [**07 Integrazione**](../07_integration/00-indice.md) | Come collegare Telemedic a un sistema esistente: quattro modalità con albero decisionale, primo avvio, interfacce applicative, eventi, componente incorporabile, identità e delega, dati e sincronizzazione, moduli sostituibili, **obblighi di chi integra**, antipattern | I fondamenti; l'implementazione interna |

### 4.2 Le tre aree trasversali

| Area | Copre | Non copre |
|---|---|---|
| [**08 Conformità**](../08_compliance/00-indice.md) | *Quale fonte, su chi grava, da quando*: inquadramento normativo, qualificazione e classificazione, sistema di gestione della qualità, fascicolo tecnico, gestione del rischio, usabilità e accessibilità come obblighi, valutazione clinica, sorveglianza post-commercializzazione, percorso e calendario | **Non dichiara che il progetto è conforme a qualcosa.** Non è consulenza legale, non contiene il fascicolo tecnico né le procedure di qualità, non stima tariffe, non fissa la data della marcatura |
| [**09 Roadmap**](../09_roadmap/00-indice.md) | **Quando accade che cosa**: metodo di decisione, traguardi con criteri di completamento binari, perimetro del primo rilascio, coda successiva, registro dei rischi di programma. È **pianificazione interna del progetto** (`D57`) | Requisiti, architettura, analisi normativa. E **nessuna data per un esito regolatorio**: né per traguardi che non sono del progetto, né — pur essendo pianificazione nostra — per la marcatura |
| [**10 Fondamenti**](../10_fondamenti/00-come-usare-questa-guida.md) | La **teoria**, da zero, per chiunque: sistema sanitario italiano, prestazioni, dato clinico, identità, standard, FHIR, fascicolo, WebRTC, fondamenti clinici, percorsi di cura, fondamenti informatici, crittografia, protocolli, flussi, quadro regolatorio, ambiente di sviluppo | Le scelte di Telemedic. Se un modulo comincia a decidere invece di spiegare, sta invadendo un'area |

### 4.3 Il registro delle decisioni architetturali

[`docs/adr/`](../adr/README.md) contiene, per ogni scelta strutturale, la motivazione, le
alternative scartate e le conseguenze. **Un'affermazione architetturale senza registro di decisione
è un difetto di documentazione**, non una scorciatoia ammessa.

### 4.4 I documenti alla radice del repository

Non stanno in `docs/` e non vanno duplicati lì: due copie di un documento che dichiara destinazione
d'uso e limiti d'uso sono due documenti che divergeranno, e in materia regolatoria una divergenza
documentale è un difetto, non una svista di manutenzione.

| Documento | Che cosa stabilisce |
|---|---|
| [`NOT-A-MEDICAL-DEVICE.md`](https://github.com/fedcal/Telemedic/blob/main/NOT-A-MEDICAL-DEVICE.md) | Destinazione d'uso e limiti d'uso dichiarati; che cosa deve fare chi mette in servizio; perché l'esclusione di responsabilità della licenza non si estende al danneggiato |
| [`DISTRIBUTION-POLICY.md`](https://github.com/fedcal/Telemedic/blob/main/DISTRIBUTION-POLICY.md) | Che cosa il progetto pubblica e che cosa **non** è; identificazione delle versioni; che cosa il progetto chiede a chi ridistribuisce |
| [`THIRD-PARTY-TERMINOLOGY.md`](https://github.com/fedcal/Telemedic/blob/main/THIRD-PARTY-TERMINOLOGY.md) | Quali terminologie il progetto non distribuisce, in che modo vi fa riferimento, e quali obblighi restano a chi installa |
| [`CONTRIBUTING.md`](https://github.com/fedcal/Telemedic/blob/main/CONTRIBUTING.md) | Le regole di contributo, con la guida dei fondamenti come prerequisito dichiarato |
| [`SECURITY.md`](https://github.com/fedcal/Telemedic/blob/main/SECURITY.md) | La politica di divulgazione coordinata delle vulnerabilità |
| [`GOVERNANCE.md`](https://github.com/fedcal/Telemedic/blob/main/GOVERNANCE.md) · [`CODE_OF_CONDUCT.md`](https://github.com/fedcal/Telemedic/blob/main/CODE_OF_CONDUCT.md) · [`LICENSE`](https://github.com/fedcal/Telemedic/blob/main/LICENSE) · [`NOTICE`](https://github.com/fedcal/Telemedic/blob/main/NOTICE) | Governo del progetto, codice di condotta, licenza Apache-2.0 e attribuzioni |

## 5. Dove sta ciascuna cosa: tabella di instradamento rapido

| Domanda | Area competente |
|---|---|
| Che cosa distingue una televisita da un teleconsulto | [10 Fondamenti §02](../10_fondamenti/02-prestazioni-di-telemedicina.md), poi [05 Dominio §02](../05_domain/02-le-prestazioni-modellate.md) |
| Quali sono i requisiti e come si verificano | [03 Funzionale §02](../03_functional/02-catalogo-dei-requisiti.md) |
| Perché i contesti interni sono quelli e non altri | [02 Architettura §02](../02_architecture/02-contesti-delimitati.md) |
| Quale versione di quale specifica è adottata | [04 Protocolli §01](../04_protocols/01-principi-di-interoperabilita.md) |
| Come si riceve una notifica e come si verifica la firma | [07 Integrazione §04](../07_integration/04-integrazione-per-eventi.md) |
| Che cosa significa clinicamente un dato e come è modellato | [05 Dominio](../05_domain/00-indice.md) |
| Da chi ci si difende e con quale conseguenza clinica | [06 Sicurezza §01](../06_security/01-modello-di-minaccia.md) |
| Chi risponde, verso chi, in base a quale fonte | [08 Conformità §01](../08_compliance/01-inquadramento-normativo.md) |
| Come si protegge una cosa | [06 Sicurezza](../06_security/00-indice.md) |
| Quando accade che cosa | [09 Roadmap §02](../09_roadmap/02-traguardi.md) |
| Che cosa il sistema **non** fa e perché | [03 Funzionale §07](../03_functional/07-fuori-perimetro.md) |
| Che cosa **non** è ancora deciso | [02 Architettura §09](../02_architecture/09-decisioni-rinviate.md) |
| Che cos'è un aggregato, un outbox, un percentile, un organismo notificato | [10 Fondamenti](../10_fondamenti/00-come-usare-questa-guida.md) |

**La regola che disambigua i casi dubbi fra sicurezza e conformità**: se la domanda è «come lo si
protegge», è sicurezza; se è «chi risponde, verso chi, in base a quale fonte», è conformità.

## 6. Le regole di precedenza

Servono a un caso solo, ma è un caso che si verifica: due documenti che dicono cose diverse.

1. Su un **fatto architetturale**, prevale
   [`docs/02_architecture/`](../02_architecture/00-indice.md). Chi rileva la divergenza non la
   risolve d'ufficio.
2. Le **date del percorso regolatorio** stanno soltanto in
   [`docs/08_compliance/09-percorso-e-calendario.md`](../08_compliance/09-percorso-e-calendario.md);
   le **date di progetto** soltanto in [`docs/09_roadmap/`](../09_roadmap/00-indice.md). Due
   calendari in due luoghi divergono al primo aggiornamento.
3. Le **esclusioni di perimetro** vivono soltanto in
   [`docs/03_functional/07-fuori-perimetro.md`](../03_functional/07-fuori-perimetro.md), con
   identificativo `OUT-nn`. Un'esclusione scritta in due posti diverge in due posti.
4. La **ripartizione delle responsabilità** operativa sta in
   [`docs/06_security/09-ripartizione-delle-responsabilita.md`](../06_security/09-ripartizione-delle-responsabilita.md);
   l'attribuzione del soggetto obbligato sta in
   [`docs/08_compliance/01-inquadramento-normativo.md`](../08_compliance/01-inquadramento-normativo.md).
5. La **guida dei fondamenti spiega**, le aree **applicano**. Se un'area comincia a spiegare la
   teoria sta duplicando la guida; se un modulo della guida comincia a decidere, sta invadendo
   un'area.
6. Sopra a tutto stanno la base architetturale vincolante e le decisioni approvate dal committente,
   in `.telemedic/context/`. Uno scostamento dalla base è sempre dichiarato e motivato da un
   registro di decisione: **non esistono scostamenti taciti**.

## 7. Convenzioni comuni a tutta la documentazione

**Marcatori di attendibilità.** `[NV]` segnala un'affermazione **non verificata su fonte
primaria**, con l'indicazione di chi deve chiuderla. **Non si inventa nulla**: non esistono numeri
di RFC, articoli, date, identificativi di transazione o valori di codice inventati per completare
una tabella. Dove manca il dato, c'è il marcatore.

**Tre stati distinti, mai confusi.** «La norma stabilisce» introduce un obbligo con fonte citata;
«è prassi» un uso diffuso senza obbligo; «è una scelta del progetto» una decisione che in quanto
tale ha un registro di decisione e può essere cambiata. L'area di dominio usa la forma esplicita
`[NORM]`, `[BASE]`, `[MOD]`, `[NV]`.

**Identificativi congelati.** `RF-*` requisiti funzionali, `RNF-*` non funzionali, `BR-*` regole di
business, `ATT-*` attori, `UC-*` casi d'uso, `OUT-*` esclusioni, `EX-*` esiti tipizzati, `DM-*`
decisioni di modellazione del dominio. **Non vengono rinumerati, riassegnati o cambiati di
significato**: la tracciabilità richiesta da IEC 62304 non si ricostruisce a posteriori, e un
identificativo riusato per un requisito diverso rende inservibile l'intera matrice (`D45`).

**Solo dati sintetici.** Nessun esempio contiene dati riferibili a persone reali, nessun codice
fiscale plausibile, nessun nome di struttura esistente, nessun segreto in chiaro. I domini negli
esempi sono segnaposto riservati a scopo documentale.

**Riservatezza.** Nessun documento nomina aziende, marchi, prodotti commerciali o domini di
potenziali partner. Si usano formule generiche: «un gestionale sanitario cloud», «un sistema EHR di
terze parti», «l'integratore», «il vendor partner». Il progetto è progettato per una molteplicità
di integratori, non per uno solo.

**Forma.** Diagrammi in Mermaid; blocchi di codice con linguaggio dichiarato; riferimenti incrociati
con collegamenti relativi. Un diagramma non sostituisce il testo: **se un vincolo esiste solo nel
diagramma, non esiste**.

**Lingua.** Italiano lingua primaria, inglese traduzione **integrale** e non sintesi (`D50`). I
riferimenti normativi italiani restano citati nella forma originale, con la spiegazione in lingua.
Al momento della stesura di quest'area la versione inglese dei contenuti **non esiste ancora**:
vedi [04 — Stato e limiti](./04-stato-e-limiti.md) §3.

## 8. Avvertenze permanenti

Valgono su ogni pagina di questa documentazione e non sono formule di stile.

- **Il repository è codice sorgente, non un dispositivo medico**, e lo dichiara. La distribuzione è
  un artefatto distinto, con nome, versione e ciclo di vita propri.
- **Oggi il prodotto non reca marcatura CE.** Finché una marcatura non esiste, nessun artefatto
  distribuito è utilizzabile per l'erogazione di prestazioni sanitarie su persone reali. Il
  progetto intende assumere il ruolo di fabbricante (`D58`); l'intenzione non modifica lo stato di
  fatto, e **in nessun luogo si scrive che il prodotto sarà marcato entro una data**.
- **Il progetto è conforme e verificabile sull'identità digitale nazionale, non accreditato**: il
  fornitore di servizi verso la federazione è chi installa.
- **Nessuna soglia tecnica di questa documentazione è conformità.** Sono specifiche di prodotto e
  limiti dichiarati: nessuna fonte italiana impone soglie tecniche.
- **Questa documentazione non è documentazione controllata.** Nessun capitolo è una procedura di un
  sistema di gestione della qualità né un documento di un fascicolo tecnico: i capitoli sono
  **ingressi**, contengono l'analisi da cui un documento controllato si scrive.
- **Non è consulenza legale né regolatoria.** La qualificazione giuridica di un soggetto e di un
  prodotto dipende da elementi di fatto che vanno accertati caso per caso da un professionista
  abilitato.

## 9. Come segnalare un difetto in questa documentazione

Se una pagina ti ha fatto perdere tempo, è un difetto della pagina, non tuo. Le tre cose più utili
da riportare, in ordine:

1. **L'esempio che non funziona.** Un esempio che non si esegue è peggio di nessun esempio.
2. **Il punto in cui ti sei bloccato e per quanto tempo.**
3. **La cosa che hai assunto e che si è rivelata falsa.** È l'informazione più preziosa, perché
   indica dove la documentazione dice qualcosa di **ambiguo** invece di dire qualcosa di sbagliato
   — che è molto più difficile da trovare.

Un caso ha un canale proprio e non va aperto come segnalazione pubblica: una **vulnerabilità di
sicurezza** si comunica secondo
[`SECURITY.md`](https://github.com/fedcal/Telemedic/blob/main/SECURITY.md).

## Dove continuare

Se sei arrivato fin qui e non sai ancora dove andare, il percorso predefinito è questo:
[01 — Visione e obiettivi](./01-visione-e-obiettivi.md) →
[02 — Le quattro prestazioni](./02-le-quattro-prestazioni.md) →
[03 — A chi si rivolge](./03-a-chi-si-rivolge.md) →
[04 — Stato e limiti](./04-stato-e-limiti.md), poi l'indice dell'area che ti riguarda.
