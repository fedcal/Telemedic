---
title: Stack tecnologico e motivazioni
sidebar_position: 2
description: Ogni tecnologia dello stack — che problema risolve, quali alternative sono state scartate e per quale ragione, quale versione minima si richiede e perché, come è classificata come componente di terze parti e che cosa accade se un giorno va sostituita.
---

# Stack tecnologico e motivazioni

Questo capitolo non elenca tecnologie: le giustifica. Per ciascun componente si dichiara il
problema che risolve, le alternative valutate e la ragione dello scarto, la versione minima
richiesta con il motivo tecnico che la fissa, la classificazione come componente di terze
parti e la strategia di sostituzione. Un elenco senza motivazioni è inutile in un progetto che
deve produrre un fascicolo tecnico: la norma non chiede *cosa* si usa, chiede *perché* e con
quale sorveglianza.

I fondamenti dei concetti citati — che cos'è un broker di eventi, che cos'è l'outbox
transazionale, che cos'è un dominio delimitato — non si ripetono qui: stanno in
[`docs/10_fondamenti/11-fondamenti-informatici.md`](../10_fondamenti/11-fondamenti-informatici.md).
Le conseguenze architetturali delle scelte stanno in `docs/02_architecture/`. Qui si sta sul
piano tecnico: versioni, vincoli, trappole, sostituibilità.

---

## 1. Che cosa è vincolante e che cosa è scelta

Tre livelli, da tenere distinti per tutta la lettura.

**Vincolante per decisione del committente.** Lo stack dichiarato in
`00_PROJECT_BRIEF.md` §2: Spring Boot 3.4 su Java 21, Angular 21 con componenti autonomi,
WebRTC con DTLS-SRTP, coturn come server di relay, FHIR R4 come modello di interoperabilità,
Keycloak come prodotto di federazione delle identità, TimescaleDB per le serie temporali,
versionamento delle entità per l'audit applicativo, Docker Compose per il confezionamento,
Docusaurus per la documentazione. Non si discute *se* usarli: si discute *come*, con quale
versione e con quale ripiego.

**Vincolante per base architetturale.** `04_BASELINE_ARCHITETTURALE.md` aggiunge decisioni
che questo capitolo recepisce senza rinegoziare: outbox transazionale su PostgreSQL come unica
sorgente degli eventi in uscita (§5), registro immutabile a catena di impronte separato dal sistema
che genera gli eventi (§6), uno schema per tenant con sicurezza a livello di riga come difesa
in profondità (§4), gateway unico verso le terminologie (§7), server di relay in versione
minima 4.17.2 (§9).

**Scelta tecnica di questa area.** Tutto il resto: la versione minore di ciascun componente,
lo strumento di migrazione dello schema, il costruttore del progetto, la libreria di
validazione, il meccanismo con cui l'outbox alimenta il broker, il formato dei log. Queste
scelte sono motivate qui e sono contestabili in bacheca, non altrove.

---

## 2. I criteri di scelta, dichiarati prima delle scelte

Un criterio dichiarato dopo la scelta è una giustificazione, non un criterio. Questi sono stati
fissati prima e applicati a tutti i componenti allo stesso modo.

| # | Criterio | Perché è un criterio e non una preferenza |
|---|---|---|
| C1 | **Sostituibilità sotto vincolo di sovranità** | Il vincolo V1 impone che nessun componente obbligatorio del percorso principale dipenda da un servizio non sostituibile o stabilito fuori dall'Unione. Un componente si sceglie anche in base a quanto costa toglierlo. |
| C2 | **Compatibilità di licenza con Apache-2.0** | D1 ha scartato un copyleft forte proprio per consentire l'integrazione in prodotti proprietari di terzi. Un componente con licenza incompatibile trasferisce quel problema a valle, sull'integratore, che è esattamente ciò che D1 voleva evitare. |
| C3 | **Sorvegliabilità come componente di terze parti** | IEC 62304 §8.1.2 richiede, per ogni componente non sviluppato dal progetto, un piano di sorveglianza delle vulnerabilità. Un progetto senza canale di advisory pubblico, senza cadenza di rilascio e senza cronologia di correzioni non è sorvegliabile, quindi non è adottabile in un dispositivo medico, per quanto ne siano buone le prestazioni. |
| C4 | **Omogeneità delle competenze** | Ogni linguaggio in più nello stack moltiplica la catena di costruzione, la superficie di dipendenze, gli strumenti di analisi statica, la distinta dei materiali e il numero di persone necessarie a mantenere il sistema. Un secondo linguaggio si paga per anni. |
| C5 | **Sostenibilità dell'installazione presso il cliente** | D8 impone il doppio modello: servizio gestito multi-tenant e installazione a tenant unico. Un componente che richiede un cluster di cinque nodi per esistere rende il secondo modello impraticabile per uno studio associato. |
| C6 | **Osservabilità nativa** | Un componente che non espone metriche e non produce log strutturati va strumentato dall'esterno, con codice che poi va mantenuto. |
| C7 | **Nessun dato reale, nessun servizio esterno obbligatorio in sviluppo** | Il vincolo trasversale §11.2 della base architetturale vale anche per la catena di sviluppo: un componente che per funzionare in locale richiede un servizio remoto è un componente che impone dati di prova su un sistema di terzi. |

Dove un componente viola un criterio, la violazione è dichiarata insieme alla mitigazione. Non
esistono scelte perfette: esistono scelte con il conto in chiaro.

---

## 3. Quadro riassuntivo

Versione minima significa: sotto quella versione il sistema non è supportato, e la ragione è
tecnica, non estetica. Il **regime di terze parti** è la classificazione ai fini della gestione
dei componenti non sviluppati dal progetto, dettagliata al §14.

| Componente | Versione minima | Motivo della soglia | Regime | Sostituibile? |
|---|---|---|---|---|
| Java (piattaforma) | **21** (LTS) | Thread virtuali finalizzati; pattern di record e pattern matching su `switch` finalizzati; collezioni ordinate. Sotto la 21 le prime due sono in anteprima e non sono utilizzabili in produzione. | Runtime | No (è la piattaforma) |
| Spring Boot | **3.4.x** | Base Spring Framework 6.2; supporto ai thread virtuali sui contenitori web; `RestClient` e `@HttpExchange` stabilizzati; supporto di prima classe a Micrometer con tracciamento. | Libreria | No in v1.0 |
| Angular | **21** | Componenti autonomi come impostazione predefinita, segnali stabilizzati, `@if`/`@for` nel modello, idratazione incrementale. | Libreria | No in v1.0 |
| PostgreSQL | **16** | `SET LOCAL` con `pg_settings` per il contesto di tenant; miglioramenti su partizionamento dichiarativo e replica logica; `SKIP LOCKED` maturo per il relay dell'outbox. La 17 è preferibile ma non necessaria. | Servizio | Difficile (è il perno) |
| TimescaleDB | **2.x** | Serie temporali sui parametri e sulle metriche di sessione. **Vedi §7: la licenza impone una verifica e un ripiego progettato.** | Estensione | **Sì, per progetto** |
| Keycloak | **26.x** | Modello di realm broker, provider SAML2 e OIDC, mappatori di attributi, politica di sessione. | Servizio | Difficile |
| Apache Kafka | **3.7+ in modalità KRaft** | Nodo singolo senza coordinatore esterno: è ciò che rende sostenibile l'installazione presso il cliente (C5). | Servizio | Sì, dietro interfaccia |
| coturn | **4.17.2** | Sotto questa versione restano aperte vulnerabilità note di esaurimento del pool di porte e di aggiramento delle quote. Vedi §9. | Servizio | Sì (è uno standard) |
| Docker / Compose | **Compose spec v2** | Confezionamento del profilo a tenant unico. | Strumento | Sì (Helm in parallelo) |
| Docusaurus | **3.x** | Internazionalizzazione con struttura speculare, richiesta da D50. | Strumento | Sì |

---

## 4. Java 21

### 4.1 Il problema che risolve

Il sistema è, nella sostanza, un coordinatore di attese: attende la base dati, attende il
prodotto di federazione, attende il sistema dell'integratore, attende il fascicolo, attende il
peer. Il modello di concorrenza è quindi la scelta più consequenziale della piattaforma, più
del linguaggio.

### 4.2 Perché la 21 e non la 17

La 17 è ancora una versione a supporto esteso e sarebbe difendibile. La differenza operativa è
concentrata in tre punti.

**I thread virtuali sono finalizzati nella 21.** Nella 17 non esistono; nella 19 e nella 20
sono in anteprima e richiedono `--enable-preview`, che è inaccettabile in un artefatto
distribuito perché la piattaforma non garantisce compatibilità binaria fra versioni per il
codice compilato in anteprima. Con la 21 si può scrivere codice di dominio bloccante e leggibile
— che è precisamente ciò che serve in un sistema dove la maggior parte della complessità è
clinica e non tecnica — senza pagare il costo di un pool di thread di piattaforma dimensionato
sul caso peggiore. Il modello reattivo resta disponibile ma non è imposto: si veda
[`02-backend.md`](./02-backend.md) §6 per la regola di applicazione, che è restrittiva.

**I pattern di record e il pattern matching su `switch` sono finalizzati nella 21.** Non è
zucchero sintattico: il dominio clinico è pieno di gerarchie chiuse — lo stato di una
prestazione, l'esito di una sessione media, il tipo di misura, il regime di consenso — e una
`sealed interface` con `switch` esaustivo trasforma in errore di compilazione l'aggiunta di un
caso non gestito. In un sistema in cui l'omissione di un caso può significare un allarme non
inoltrato, l'esaustività verificata dal compilatore è un controllo di rischio a costo zero.

**Le collezioni ordinate** eliminano una classe intera di codice difensivo su «il primo
elemento» e «l'ultimo elemento» di sequenze temporali.

### 4.3 E la versione successiva a supporto esteso

Esiste una versione a supporto esteso più recente della 21. Il progetto **non** la adotta nella
v1.0 per due ragioni: la catena di strumenti regolatoria — analisi statica, generatore di
distinta dei materiali, agenti di strumentazione — si stabilizza sulle versioni a supporto
esteso con ritardo, e cambiare piattaforma a metà di un percorso di tracciabilità significa
rieseguire la verifica su una base diversa. La migrazione è una voce di roadmap, non una scelta
di v1.0. `[NV]` — la data esatta di fine supporto pubblico degli aggiornamenti gratuiti per la
21 dipende dal distributore della piattaforma scelto dal deployer e va verificata sulla fonte
del distributore, non assunta.

**Conseguenza vincolante**: la versione della piattaforma è fissata nella catena di costruzione
(`maven.compiler.release=21`, immagine di base con la stessa versione maggiore) e non è un
dettaglio dell'ambiente. Una compilazione che accetti una piattaforma diversa da quella
dichiarata rende la costruzione non riproducibile, e la costruzione riproducibile è un requisito
di D17.

### 4.4 Alternative scartate

| Alternativa | Perché scartata |
|---|---|
| **Kotlin sulla stessa piattaforma** | Ergonomia superiore, ma introduce una seconda catena di compilazione, un secondo insieme di regole di analisi statica e un secondo dizionario di competenze richieste ai contributori. In un progetto che dichiara di voler essere contribuibile da chi parte da zero (D35), è un costo di ingresso non giustificato. |
| **Un ambiente di esecuzione a eventi su un altro linguaggio** | Violerebbe C4 senza risolvere nulla che i thread virtuali non risolvano già, e sposterebbe fuori dall'ecosistema della piattaforma tutte le librerie sanitarie di riferimento, che sono in gran parte scritte per essa. |
| **Un linguaggio compilato a binario nativo** | Tempi di avvio e impronta di memoria migliori, ma nessuna delle librerie di interoperabilità sanitaria di riferimento è disponibile, e andrebbero riscritte. Riscrivere un motore di validazione di profili clinici è esattamente il tipo di attività che un progetto sanitario non deve fare. |

### 4.5 Compilazione a immagine nativa

La compilazione anticipata a immagine nativa è **supportata come profilo opzionale, non come
modalità predefinita**. Motivo: la riflessione, i proxy dinamici e il caricamento dinamico di
risorse usati dal livello di persistenza e dal motore di validazione dei profili richiedono
metadati di configurazione che vanno mantenuti, e ogni dipendenza aggiunta è un potenziale
guasto in fase di costruzione nativa e non in fase di esecuzione. Su un dispositivo medico,
una modalità di esecuzione che si comporta diversamente da quella su cui si è eseguita la
verifica è una modalità che va verificata di nuovo per intero. Il profilo nativo esiste, è
costruito in integrazione continua ed è provato dalla stessa suite, ma **la distribuzione di
riferimento è quella su macchina virtuale**. `[NV]` — i guadagni di memoria e di tempo di avvio
non sono stati misurati sul progetto: qualunque cifra pubblicata prima della misura sarebbe
inventata.

---

## 5. Spring Boot 3.4

### 5.1 Il problema che risolve

Non «fare le API»: qualunque cosa fa le API. Il problema è avere, in un unico insieme coerente e
mantenuto, la federazione delle identità con OpenID Connect e SAML 2.0, la gestione dichiarativa
delle transazioni, il collegamento tipizzato della configurazione, la strumentazione con
metriche e tracce, la validazione ai confini e il collaudo con contenitori effimeri. Metterli
insieme a mano significa scrivere e mantenere codice di integrazione che non ha valore clinico.

### 5.2 Perché la 3.4 come minima

- **Base Spring Framework 6.2.** Sotto di essa mancano gli affinamenti sull'astrazione delle
  attese e sulla propagazione del contesto di osservabilità attraverso i confini asincroni, che
  è ciò che rende utilizzabile il tracciamento distribuito senza scrivere propagatori a mano.
- **Attivazione dei thread virtuali sul contenitore web con una proprietà.** Senza di essa la
  scelta del §4.2 non si traduce in comportamento del server HTTP.
- **Client HTTP dichiarativo e sincrono stabilizzato.** Il codice che chiama il sistema
  dell'integratore, il fascicolo o il prodotto di federazione è codice bloccante che diventa
  leggibile e provabile senza reattività.
- **Attuatore con endpoint di prontezza e di vivacità distinti**, requisito diretto del
  confezionamento su orchestratore di contenitori.

`[NV]` — le date esatte di fine del supporto pubblico gratuito delle versioni minori vanno
verificate sulla pagina di supporto del progetto a monte al momento del rilascio, e vanno
registrate nel registro dei componenti di terze parti come data di riesame. Non si citano qui
perché cambierebbero prima della pubblicazione.

### 5.3 Alternative scartate

| Alternativa | Motivo dello scarto |
|---|---|
| **Un contenitore a compilazione anticipata orientato al nativo** | Tempo di avvio e memoria migliori. Ma l'ecosistema di sicurezza — provider SAML2 per la federazione nazionale, integrazione con il prodotto di identità scelto, filtri di autorizzazione basati su attributi — è significativamente più maturo sull'alternativa scelta, e la sicurezza dell'accesso a dati sanitari non è il posto dove risparmiare maturità. |
| **Un contenitore a compilazione anticipata basato su elaborazione delle annotazioni** | Stesso ragionamento, con in più una base di utenti minore, quindi meno occhi sulle vulnerabilità. Il criterio C3 penalizza esplicitamente la minore diffusione: un componente molto usato riceve segnalazioni di sicurezza prima. |
| **La specifica enterprise pura su un server applicativo** | Coerente e standardizzata, ma richiede il server applicativo come artefatto separato, il che complica il confezionamento a tenant unico (C5) e sposta parte della configurazione fuori dal repository, cioè fuori dal controllo di configurazione richiesto da D45. |
| **Nessun contenitore: solo librerie assemblate a mano** | Massimo controllo, minima velocità. In un progetto con una data di consegna fissa e un obbligo di tracciabilità, il tempo speso a costruire l'infrastruttura è tempo sottratto alla verifica del dominio. |

### 5.4 Che cosa si usa e che cosa si esclude deliberatamente

Si usa: iniezione delle dipendenze per costruttore, transazioni dichiarative, collegamento
tipizzato della configurazione, validazione con annotazioni ai confini, sicurezza con server
delle risorse OpenID Connect, attuatore, Micrometer, collaudo con contenitori effimeri.

**Non** si usa: il caricamento pigro delle proprietà da sorgenti remote a runtime senza
contratto (violerebbe C7 e renderebbe non riproducibile la configurazione di una sessione
registrata a fini di audit); la scoperta automatica di servizi su registri esterni nella v1.0
(l'installazione a tenant unico ha un numero fisso e piccolo di servizi: un registro sarebbe
un componente in più da mantenere e da mettere in sicurezza per nessun beneficio); l'iniezione
per campo (rende non collaudabile la classe senza contenitore e nasconde le dipendenze).

---

## 6. Angular 21

Il dettaglio architetturale è in [`04-frontend.md`](./04-frontend.md); qui si sta sulla scelta.

**Perché un quadro di lavoro completo e non una libreria di sola vista.** L'interfaccia non è
una vetrina: contiene un motore di negoziazione media con macchina a stati, un modulo di
raccolta del consenso con valore giuridico, un modulo di refertazione, pannelli di
amministrazione e un componente incorporabile da terzi. Un quadro di lavoro con instradamento,
formulari, internazionalizzazione, iniezione delle dipendenze e strumenti di collaudo già
integrati riduce il numero di componenti di terze parti da censire e sorvegliare (C3): dieci
librerie assemblate a mano sono dieci voci nel registro dei componenti, un quadro di lavoro
completo è una.

**Perché la 21.** I componenti autonomi come impostazione predefinita eliminano il livello dei
moduli, che era la principale fonte di accoppiamento accidentale; i segnali danno un modello di
reattività sincrono e verificabile che si presta a essere provato senza orologi finti;
l'idratazione incrementale è ciò che rende sostenibile il primo caricamento su rete mobile, che
è il caso d'uso di riferimento imposto da D25.

**Alternative scartate.** Una libreria di sola vista con ecosistema assemblato: più leggera, ma
ogni scelta (instradamento, formulari, internazionalizzazione, stato) diventa una decisione di
progetto e un componente da sorvegliare, e nessuna di quelle scelte ha valore clinico. Un
quadro di lavoro a compilazione con reattività fine: interessante tecnicamente, base di utenti
e strumenti di accessibilità meno maturi — e l'accessibilità qui è un requisito funzionale
(D25), non una rifinitura. Il rendering lato server con generazione statica: il prodotto è
un'applicazione autenticata con sessioni lunghe, non un sito di contenuti; il rendering lato
server serve solo per il primo caricamento e si adotta in quella forma, non come architettura.

**Il componente incorporabile non è Angular.** L'artefatto che l'integratore incorpora nella
propria interfaccia è un elemento personalizzato conforme allo standard dei componenti web,
non un'applicazione Angular montata dentro un'altra applicazione. La ragione è di contratto:
imporre un quadro di lavoro all'integratore violerebbe l'implicazione progettuale n. 1 del
profilo dell'integratore archetipo. Il dettaglio è in `docs/07_integration/`.

---

## 7. PostgreSQL e TimescaleDB

### 7.1 PostgreSQL come perno

Tre proprietà lo rendono non negoziabile in questo progetto, e nessuna riguarda le prestazioni.

1. **La sicurezza a livello di riga esiste ed è applicata dal motore.** L'isolamento fra tenant
   non può poggiare soltanto sul fatto che gli sviluppatori ricordino di filtrare: la base
   architetturale (§4) impone la difesa in profondità, e questa è l'unica difesa che sopravvive
   a un errore applicativo.
2. **L'outbox transazionale funziona perché la transazione è vera.** Scrivere il dato e
   l'evento nella stessa transazione è ciò che elimina l'intera classe di guasti «evento perso /
   evento fantasma». Senza transazioni serie non esiste outbox, ed è la base architetturale §5 a
   imporlo.
3. **`SELECT ... FOR UPDATE SKIP LOCKED`** rende possibile un relay dell'outbox a più istanze
   senza coordinatore esterno — il che, a sua volta, rende sostenibile l'installazione a tenant
   unico (C5).

Le alternative sono state escluse per costruzione: una base dati documentale non offre le
transazioni multi-documento con l'isolamento richiesto senza rinunce, e soprattutto non offre la
sicurezza a livello di riga; una base dati proprietaria violerebbe C1 e C2 insieme.

### 7.2 TimescaleDB: la scelta, e il problema che nessuno deve scoprire dopo

Il problema tecnico è reale: i parametri di telemonitoraggio e le metriche di sessione media
sono serie temporali ad alto tasso di inserimento, quasi mai aggiornate, quasi sempre
interrogate per intervallo e per soggetto, e con un ciclo di vita governato da politiche di
conservazione. Le tabelle relazionali generiche gestiscono male questo profilo: gli indici
crescono, le cancellazioni per conservazione producono frammentazione, le aggregazioni per
finestra si riscrivono a mano ogni volta.

TimescaleDB risolve il problema restando **dentro** PostgreSQL: stesse transazioni, stesse
credenziali, stessa sicurezza a livello di riga, stesso strumento di migrazione, stesso
salvataggio. È esattamente il tipo di componente che soddisfa C4 e C5, perché non aggiunge un
servizio: aggiunge un'estensione.

**Il problema è la licenza, e va detto ora.** Il progetto è distribuito sotto Apache-2.0 (D1) e
deve poter essere integrato in prodotti proprietari di terzi. Risulta che le funzionalità
avanzate dell'estensione — in particolare la compressione e le aggregazioni continue — non
siano distribuite sotto una licenza open source approvata ma sotto una licenza propria di tipo
sorgente disponibile, con restrizioni sull'offerta del componente come servizio gestito a terzi.
**`[NV]` — questa affermazione va verificata sul testo della licenza primaria, artefatto per
artefatto, prima di qualunque pubblicazione.** È esattamente il caso previsto da D34: una
dichiarazione permissiva apposta su un contenitore non dispone dei diritti sul contenuto
ricompreso, e la verifica va fatta sulla licenza primaria.

Conseguenze operative, che valgono a prescindere dall'esito della verifica:

- **Telemedic non ridistribuisce l'estensione.** È una dipendenza di runtime che il deployer
  installa nella propria base dati. La licenza di Telemedic non ne è toccata; l'obbligo di
  verifica ricade su chi distribuisce l'installazione completa, ed è materiale che il progetto
  deve fornirgli, non nascondergli (D28).
- **Il progetto documenta il vincolo per il deployer** nella scheda dei componenti di terze
  parti, con il campo «regime di licenza» compilato e non lasciato in bianco.
- **L'architettura prevede il ripiego per progetto, non per emergenza.** Vedi §7.3.

Questione aperta in bacheca a `COMP` (vedi §15): la verifica legale del testo di licenza e la
sua collocazione nei quattro regimi terminologici di D31 — che sono stati definiti per le
terminologie ma la cui logica si applica identicamente a qualunque componente incorporato.

### 7.3 Il ripiego progettato: partizionamento dichiarativo nativo

Il livello di persistenza delle serie temporali sta **dietro un'interfaccia di progetto**
(`TimeSeriesRepository`), con due realizzazioni:

- realizzazione a **iperbabelle** dell'estensione, predefinita quando l'estensione è presente e
  il deployer ne ha accettato il regime di licenza;
- realizzazione a **partizionamento dichiarativo nativo** di PostgreSQL, per intervallo
  temporale, con creazione delle partizioni programmata e conservazione realizzata staccando e
  scartando la partizione — operazione che, a differenza della cancellazione riga per riga, è
  costante nel tempo e non frammenta.

Il ripiego **non è degradato sul piano funzionale**: perde la compressione e le aggregazioni
continue, che vanno sostituite con tabelle di sintesi aggiornate dall'applicazione. Perde
prestazioni e comodità, non capacità. La suite di prove di persistenza gira **su entrambe le
realizzazioni** in integrazione continua, altrimenti il ripiego è una dichiarazione e non un
fatto.

Il dettaglio dello schema e delle politiche di conservazione è in
[`03-persistenza.md`](./03-persistenza.md).

### 7.4 Perché non un archivio di serie temporali dedicato

| Alternativa | Motivo dello scarto |
|---|---|
| **Archivio di metriche a scarto per campionamento** | È progettato per metriche operative con conservazione breve, campionamento con perdita e nessuna garanzia transazionale. Un parametro clinico rilevato dal paziente **non è una metrica**: è un dato sanitario, immutabile, con contesto di rilevazione, soggetto a conservazione normata e a diritto di accesso. Confondere i due è l'errore di modellazione più comune in questo dominio. Le metriche operative del sistema, quelle sì, ci vanno: vedi [`06-osservabilita.md`](./06-osservabilita.md). |
| **Archivio di serie temporali autonomo** | Aggiunge un servizio, un modello di sicurezza, un salvataggio, una politica di conservazione e una catena di credenziali separati da quelli della base dati clinica — e rende impossibile una transazione che comprenda il dato e la sua registrazione di accesso. Viola C4 e C5. |
| **Archivio a colonne per analisi** | Ottimo per l'analisi, inadatto all'inserimento singolo a bassa latenza e alla lettura per singolo soggetto che è il profilo di accesso reale del telemonitoraggio. |

---

## 8. Keycloak

### 8.1 Il problema che risolve

Non «il login». Il problema è: essere un fornitore di servizi verso la federazione nazionale
delle identità in SAML 2.0 e in OpenID Connect, mantenere realm distinti per il contesto
clinico e per quello dell'assistito con un realm broker unico verso la federazione (base
architetturale §8), accettare identità già autenticate dal sistema dell'integratore senza un
secondo accesso, e propagare un livello di garanzia dell'autenticazione fino alla decisione di
autorizzazione. Scrivere tutto questo è un progetto a sé.

### 8.2 Tre difetti noti da trattare come rischi, non come note di configurazione

D37 li dichiara e questa area li recepisce come requisiti di configurazione verificati in prova
automatica, non come raccomandazioni:

1. l'utente federato può alterare i propri attributi;
2. l'utente federato può cambiare l'indirizzo di posta senza verifica;
3. l'utente federato può impostarsi una credenziale locale, aggirando la federazione.

Ciascuno è, in un contesto sanitario, una via di scalata di privilegio o di impersonificazione.
Vanno chiusi in configurazione **e** verificati da una prova che fallisce se la configurazione
regredisce. Una configurazione di sicurezza senza una prova che la sorvegli è una configurazione
che tornerà a essere insicura al primo aggiornamento. Il dettaglio delle contromisure è di
competenza di `docs/06_security/`; qui si registra il vincolo tecnico: **le prove di
configurazione del prodotto di federazione fanno parte della suite obbligatoria**, e girano
contro un'istanza effimera, non contro un ambiente condiviso.

### 8.3 Lo scambio di token è nostro, non suo

D18 è netta: la funzione di scambio di token del prodotto è in stato di anteprima e non ci si
dipende. Lo scambio è realizzato **nel gateway di Telemedic**, con delega sempre rappresentata
dal claim previsto da RFC 8693 §4.1 e mai impersonificazione. Sul piano tecnico questo
significa che il gateway è un componente di sicurezza scritto in proprio, e ne discendono
obblighi che il resto del codice non ha: revisione esterna indipendente, prove di abuso
dedicate, copertura di prova sostanzialmente totale sul percorso di validazione. Vedi
[`02-backend.md`](./02-backend.md) §3 e `docs/06_security/`.

### 8.4 Alternative scartate

| Alternativa | Motivo dello scarto |
|---|---|
| **Prodotti di identità open source più recenti e più leggeri** | Ergonomia migliore, ma il supporto SAML 2.0 come fornitore di servizi verso una federazione nazionale con requisiti di conformità stringenti, e l'esistenza di realizzazioni pubbliche del profilo italiano sotto licenza permissiva, sono il fattore decisivo. Riscrivere un fornitore di servizi SAML2 conforme a un profilo nazionale è il tipo di lavoro che si sottovaluta esattamente di un ordine di grandezza (vedi D38 sul lotto delle istanze multiple per fornitore di identità). |
| **Servizio di identità gestito** | Violazione diretta di V1. Non è discutibile. |
| **Identità gestita nell'applicazione** | Sposta dentro il perimetro del dispositivo medico la gestione delle credenziali, il che aumenta la superficie di rischio e il perimetro di verifica senza alcun beneficio. |

---

## 9. coturn

### 9.1 Versione minima 4.17.2, e perché non è un'opinione

La base architetturale §9 la fissa, il vincolo V-10 la ribadisce, e la verifica su fonte
primaria che l'ha prodotta è documentata in `.telemedic/research/B3-verifica-coturn-webrtc.md`.
Il fatto rilevante per questa area è la **forma della cronologia**: quattordici rilasci in poco
più di sette mesi nel 2026, di cui cinque nel solo mese di agosto, e una famiglia di sei
vulnerabilità distinte, in otto anni, tutte riconducibili allo stesso schema — l'aggiramento
delle liste di indirizzi peer vietati per canonicalizzazione o confronto errato degli indirizzi
IPv6, quattro delle quali negli ultimi otto mesi.

Ne discende una conclusione tecnica che va scritta esplicitamente e che è il vincolo V-10:
**la lista di indirizzi vietati è difesa in profondità, non difesa primaria. La difesa primaria
è l'isolamento di rete in uscita del nodo di relay**, applicato fuori dal processo — regole di
rete dell'infrastruttura, non direttive del file di configurazione. È l'unica difesa che ha
retto a tutte e sei le vulnerabilità della famiglia.

Conseguenza operativa sul canale di aggiornamento: con quella cadenza di rilascio, un obbligo
di aggiornamento espresso in mesi è privo di significato. Il livello di servizio va espresso in
**giorni dalla pubblicazione dell'avviso, differenziato per gravità**, e va misurato. La
proposta tecnica di questa area è in [`09-integrazione-continua-e-rilascio.md`](./09-integrazione-continua-e-rilascio.md)
§7; la decisione formale spetta alla sorveglianza post-commercializzazione e quindi a `COMP`.

### 9.2 Perché coturn e non altro

È l'implementazione di riferimento, è quella su cui sono verificati i comportamenti dei
navigatori, espone metriche native, ha un canale di avvisi di sicurezza pubblico e una cronologia
di correzioni verificabile — cioè soddisfa C3 meglio di qualunque alternativa. Le alternative
gestite violano V1 senza eccezioni; le alternative in altri linguaggi violano C4 e hanno una
base di utenti minore, quindi meno segnalazioni di sicurezza.

### 9.3 Che cosa il progetto **non** implementa

Va detto perché tocca la comunicazione pubblica. Il ripiego sul relay quando il collegamento
diretto fallisce **non è codice di Telemedic**: è il comportamento nativo della negoziazione di
connettività, che assegna al candidato di relay la preferenza di tipo più bassa e lo usa solo se
nient'altro funziona. Il bitrate adattivo **non è codice di Telemedic**: è il controllore di
congestione dentro il navigatore. Ciò che il progetto realizza è emettere credenziali di relay
valide, a vita breve, per un soggetto opaco, e **misurare** che cosa è successo. Rivendicare
l'implementazione di meccanismi che appartengono al protocollo o al navigatore è un difetto di
onestà tecnica che si paga in sede di verifica. Il dettaglio è in
[`05-media-e-tempo-reale.md`](./05-media-e-tempo-reale.md).

---

## 10. Apache Kafka e l'outbox

### 10.1 La divisione dei ruoli

La base architetturale §5 è vincolante: l'outbox transazionale su PostgreSQL è l'**unica**
sorgente degli eventi in uscita, il broker è alimentato dall'outbox e mai da una seconda
scrittura applicativa. Quindi il broker non è la sorgente di verità: è il mezzo di
distribuzione. Questa distinzione cambia il criterio di scelta, perché ciò che serve al mezzo di
distribuzione è la conservazione, la rilettura e il partizionamento per chiave — non la
garanzia transazionale, che sta a monte.

### 10.2 Perché un registro e non una coda

| Alternativa | Motivo dello scarto |
|---|---|
| **Coda di messaggi tradizionale** | Il messaggio consumato sparisce. Un nuovo consumatore — un nuovo integratore, una nuova proiezione, una ricostruzione dopo un guasto — non può rileggere la storia. In un sistema che deve poter dimostrare che cosa ha inviato e a chi, e che deve poter aggiungere integratori senza rigiocare a mano, la rilettura non è una comodità: è un requisito. |
| **Flussi su archivio chiave-valore in memoria** | Adeguato alla scala di un'installazione piccola, ma la conservazione dipende dalla memoria e la persistenza è una configurazione delicata. Per il registro immutabile e per la consegna verso terzi è un rischio non giustificato. |
| **Registro distribuito alternativo con livello di archiviazione a più strati** | Tecnicamente valido, base di utenti e strumenti operativi minori, e un modello di distribuzione più pesante per l'installazione a tenant unico (C5). |
| **Nessun broker: solo chiamate sincrone** | Accoppia la disponibilità di Telemedic a quella dell'integratore. Un consulto non può fallire perché il sistema di destinazione del referto è in manutenzione. |

### 10.3 Modalità a coordinatore integrato e nodo singolo

Per l'installazione a tenant unico, il broker gira in modalità a coordinatore integrato su un
nodo singolo. È il compromesso che rende il modello di D8 praticabile: nessun servizio di
coordinamento aggiuntivo da installare, mettere in sicurezza e sorvegliare in uno studio
associato. Il conto è dichiarato: **con un nodo singolo non c'è ridondanza del broker**. Poiché
la sorgente di verità è l'outbox nella base dati, la perdita del broker significa ritardo nella
consegna, non perdita di eventi — il relay riprende dal punto in cui era. Va scritto nel
manuale di installazione, perché è la differenza fra un guasto tollerabile e un incidente.

### 10.4 Come l'outbox alimenta il broker

Due meccanismi possibili, e la scelta ha conseguenze operative rilevanti.

**Cattura delle modifiche dal registro delle transazioni.** Legge il registro di scrittura
anticipata della base dati e produce gli eventi senza interrogare le tabelle. È il meccanismo a
minore latenza e a minore impatto sulla base dati, ma richiede un connettore, quindi un
processo di connessione, quindi un servizio in più con la propria configurazione, il proprio
salvataggio dello stato e la propria sorveglianza. Su un'installazione a tenant unico è un peso
sproporzionato.

**Relay a interrogazione periodica con blocco saltato.** Un componente dell'applicazione
interroga la tabella di outbox con `FOR UPDATE SKIP LOCKED`, pubblica in blocco, marca come
pubblicato nella stessa transazione. Nessun servizio aggiuntivo, funziona a più istanze senza
coordinamento, latenza pari all'intervallo di interrogazione.

**Proposta di progetto**: il relay a interrogazione periodica è la realizzazione predefinita e
l'unica richiesta per la v1.0; la cattura dalle modifiche è un profilo alternativo, dietro la
stessa interfaccia di pubblicazione, per installazioni con volumi che la giustifichino. La
latenza di consegna che ne risulta è dichiarata come limite in
[`07-prestazioni-e-capacita.md`](./07-prestazioni-e-capacita.md) §6, non nascosta.

L'astrazione di pubblicazione resta dietro un'interfaccia di progetto, come impone D15: il
codice di dominio non conosce il broker. Questo non è purismo — è ciò che consente a un
deployer di sostituire il broker senza toccare il dominio, che è un requisito di sovranità
sostanziale (C1).

---

## 11. Confezionamento e distribuzione

**Docker Compose** per il profilo a tenant unico: è il minimo comune denominatore che uno studio
associato o un poliambulatorio può gestire. **Chart Helm** per il profilo su orchestratore,
richiesto dal modello a servizio gestito. I due non sono alternativi: sono i due modelli di D8,
e la base architetturale impone che siano **lo stesso codice e la stessa struttura**, con il
tenant unico come caso degenere del multi-tenant. Nessun ramo separato, nessuna variante di
compilazione: la differenza sta nella configurazione, e la configurazione è provata.

Il dettaglio delle immagini, delle firme e degli artefatti è in
[`09-integrazione-continua-e-rilascio.md`](./09-integrazione-continua-e-rilascio.md).

---

## 12. Il costruttore del progetto

**Proposta di progetto: costruttore dichiarativo a modello di progetto, non a script.** La
motivazione non è di gusto ma di verificabilità: D17 richiede una costruzione riproducibile e
D45 richiede il controllo di configurazione. Un modello di costruzione dichiarativo, con
risoluzione delle versioni deterministica e con la proprietà di marcatura temporale che rende
riproducibili gli archivi prodotti, si audita leggendolo. Un costruttore a script è un programma,
e un programma nella catena di costruzione è codice che va verificato come tutto il resto.

Il costruttore alternativo, basato su script e cache incrementale, è più veloce e non è escluso
in assoluto: ma la velocità di costruzione non è un vincolo di questo progetto, mentre la
riproducibilità lo è. La scelta va registrata come decisione architetturale, perché cambiarla a
metà percorso costa più di quanto valga.

Sul lato dell'interfaccia, la catena è quella nativa del quadro di lavoro scelto, con il file
di blocco delle dipendenze **committato e obbligatorio**: una costruzione che risolva le
versioni al momento non è riproducibile, e senza riproducibilità non esiste distinta dei
materiali attendibile.

---

## 13. Componenti che il progetto **non** adotta, e perché

Elencare ciò che si è scartato è più informativo di elencare ciò che si è preso.

| Componente | Perché non c'è |
|---|---|
| **Unità di inoltro selettivo del media** | Il consulto è da due a tre partecipanti. Un'unità di inoltro termina la cifratura e ha il media in chiaro: distruggerebbe la proprietà su cui poggia l'intero posizionamento del progetto, per un beneficio nullo a questa scala. Se un giorno servisse, la valutazione è già impostata in `.telemedic/research/R4-webrtc-media.md` §6.3, con l'esclusione di un candidato per incompatibilità di licenza con D1 e di un altro per abbandono documentato — tre anni senza modifiche rendono un componente non sorvegliabile ai sensi di IEC 62304 §8.1.2, il che è un fatto, non un giudizio. |
| **Archivio chiave-valore in memoria come diffusore del segnale** | Il protocollo di raccolta incrementale dei candidati richiede consegna esattamente una volta e nell'ordine. Un meccanismo di pubblicazione e sottoscrizione senza persistenza non garantisce nessuna delle due cose sotto riconnessione. Se serve un diffusore, la forma corretta è a flusso persistente con gruppi di consumatori; l'architettura preferita evita del tutto il diffusore. Vedi §15, questione aperta a `ARCH`. |
| **Griglia di servizi** | Aggiunge un piano di controllo, un piano dati e un modello di certificati da gestire, per un sistema con un numero piccolo di servizi. Su installazione a tenant unico è insostenibile (C5). |
| **Registro di scoperta dei servizi** | Stesso motivo. Il numero di servizi è noto e fisso. |
| **Motore di regole cliniche di terze parti** | Le soglie sono configurazione per assistito (V-02) e la valutazione è deterministica e tracciabile. Un motore di regole generico introdurrebbe una logica non ispezionabile in un percorso che deve essere spiegabile riga per riga in caso di incidente. |
| **Servizi gestiti di qualunque tipo sul percorso principale** | V1. Senza eccezioni e senza discussione. |

---

## 14. Classificazione come componente di terze parti

Ogni componente non sviluppato dal progetto è, ai sensi di IEC 62304, un elemento software di
origine non nota di cui il progetto deve conoscere e sorvegliare le proprietà. D45 stabilisce
che l'inventario va costruito **dalla prima pipeline**, perché censirlo a posteriori costa
diverse volte tanto. Questa area ne definisce la forma tecnica; la parte regolatoria è in
`docs/08_compliance/`.

### 14.1 Schema del registro

Ogni voce del registro porta, come minimo:

| Campo | Contenuto | Perché è obbligatorio |
|---|---|---|
| `identificativo` | Coordinate del componente nel proprio ecosistema di distribuzione | È la chiave di correlazione con la distinta dei materiali e con gli avvisi di sicurezza |
| `versione` | Versione esatta, non intervallo | Un intervallo rende non riproducibile la costruzione e non determinabile l'esposizione a una vulnerabilità |
| `licenza` | Identificativo normalizzato **verificato sul testo primario** | D34: la dichiarazione sul contenitore non dispone dei diritti sul contenuto |
| `regime` | Runtime obbligatorio · runtime opzionale · costruzione · prova · documentazione | Determina se la vulnerabilità è sfruttabile in esercizio o solo in sviluppo |
| `funzione nel sistema` | A che cosa serve, in una riga | Senza questo il registro è un elenco e non un documento di analisi |
| `alternativa nota` | Componente sostitutivo e costo stimato della sostituzione | È ciò che rende reale la sostituibilità di C1 |
| `canale di avvisi` | Fonte primaria delle segnalazioni di sicurezza | Un componente senza canale non è sorvegliabile |
| `livello di servizio di aggiornamento` | Giorni dalla pubblicazione dell'avviso, per gravità | Vedi §9.1 |
| `impatto sul rischio` | Se il guasto del componente ha conseguenze cliniche | Collega il registro al file di gestione del rischio |
| `data di riesame` | Prossima verifica programmata | Un registro senza scadenze si fossilizza |

### 14.2 Come si popola

Non a mano. Il registro è **generato** dalla distinta dei materiali prodotta in integrazione
continua, arricchito con i campi che la distinta non contiene (funzione nel sistema, alternativa
nota, impatto sul rischio) tramite un file di annotazioni versionato nel repository. Le voci
presenti nella distinta ma assenti dalle annotazioni fanno **fallire la costruzione**: è il solo
modo per impedire che una dipendenza entri senza essere stata valutata. Il dettaglio del
controllo è in [`09-integrazione-continua-e-rilascio.md`](./09-integrazione-continua-e-rilascio.md) §4.

### 14.3 Le tre classi che meritano attenzione particolare

- **Componenti esposti a Internet senza autenticazione preventiva.** Il server di relay è
  l'unico di questa classe e ha il livello di servizio di aggiornamento più stringente.
- **Componenti sul percorso della decisione di autorizzazione.** Prodotto di federazione,
  librerie di validazione dei token, gateway. Un difetto qui non degrada un servizio: apre un
  accesso.
- **Componenti che trattano contenuto proveniente dall'esterno.** Analizzatori di documenti
  clinici, decodificatori di allegati, analizzatori di formati di scambio. Sono la superficie
  classica di esecuzione di codice arbitrario, e vanno eseguiti con privilegi ridotti e limiti
  di risorse dichiarati.

---

## 15. Questioni che questa area non decide

Coerentemente con il protocollo della bacheca, ciò che è strutturale non si inventa qui.

1. **Topologia del segnale a più istanze.** Instradamento deterministico della sessione al nodo
   proprietario, oppure affinità di sessione al bilanciatore. La ricerca raccomanda il primo
   come architettura di destinazione e il secondo come realizzazione di ripiego, escludendo la
   diffusione senza persistenza. È una decisione strutturale con effetti su distribuzione,
   aggiornamento senza interruzione e dimensionamento: spetta ad `ARCH`, con decisione
   architetturale registrata. Aperta in bacheca.
2. **Limite dichiarato di partecipanti alla sessione media.** La ricerca argomenta un limite di
   tre in topologia a maglia, oltre il quale serve una decisione nuova. Il limite va dichiarato:
   un limite esplicito è preferibile a un degrado silenzioso. Spetta ad `ARCH`. Aperta in
   bacheca.
3. **Regime di licenza dell'estensione per serie temporali.** Verifica sul testo primario e
   collocazione nei regimi di D31. Spetta a `COMP`. Aperta in bacheca.
4. **Livello di servizio di aggiornamento dei componenti di terze parti.** La proposta tecnica
   esiste; l'impegno formale appartiene al piano di sorveglianza post-commercializzazione.
   Spetta a `COMP` e `ROAD`. Aperta in bacheca.

---

## 16. In sintesi

Lo stack non è stato scelto per prestazioni: è stato scelto per **sostituibilità, sorvegliabilità
e sostenibilità dell'installazione presso il cliente**. Dove una scelta ha un costo — la licenza
dell'estensione per serie temporali, il nodo singolo del broker, i difetti noti del prodotto di
federazione, la cadenza di rilascio del server di relay — il costo è dichiarato qui e ha un
ripiego progettato, provato in integrazione continua. Un ripiego che non gira nella suite di
prove non è un ripiego: è una speranza.

**Prosegue in**: [`02-backend.md`](./02-backend.md) per la struttura del servizio,
[`03-persistenza.md`](./03-persistenza.md) per lo schema e le migrazioni.
