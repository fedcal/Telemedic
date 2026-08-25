---
title: Architettura — indice dell'area
sidebar_position: 1
description: Mappa dell'area architetturale di Telemedic, ordine di lettura per profilo, rapporto con la guida dei fondamenti e con i registri delle decisioni, convenzioni di lettura e regole di precedenza fra i documenti.
---

# Architettura — indice dell'area

Quest'area descrive **come è fatto Telemedic**: quali sono i suoi confini interni, quali
invarianti regge, quali dati custodisce e in che forma, come propaga il contesto di tenant, come
si scambiano messaggi le sue parti, come si dimostra ciò che è accaduto e in quali assetti si
installa.

Non descrive *cosa fa* il sistema — quello è l'area funzionale — né *come si scrive il codice* —
quello è l'area tecnica. Descrive la struttura che rende possibili l'una e l'altra, e le ragioni
per cui quella struttura è com'è invece che in un altro modo.

## 1. Perché quest'area viene prima delle altre

Le sei aree restanti si appoggiano a ciò che è scritto qui. Il contesto delimitato in cui una
funzione vive determina chi la può chiamare e con quale contratto; l'aggregato a cui appartiene
un'entità determina che cosa può essere modificato in una sola transazione; il modello di
tenancy determina la forma di ogni interrogazione e di ogni migrazione; il modello degli eventi
determina che cosa un integratore può osservare. Un errore in quest'area si propaga per
costruzione in tutte le altre e non è correggibile con una modifica locale.

Ne discende una regola di precedenza che vale per l'intera documentazione del progetto:

> In caso di divergenza fra un documento di quest'area e un documento di un'altra area su un
> fatto architetturale, **prevale quest'area**; chi rileva la divergenza non la risolve
> d'ufficio, ma la porta sulla bacheca inter-agenti.

Sopra quest'area sta soltanto la base architetturale vincolante
(`.telemedic/context/04_BASELINE_ARCHITETTURALE.md`) e le decisioni approvate dal committente
(D1–D52). Dove un documento di quest'area si discosta dalla base, lo dichiara esplicitamente e
rinvia all'ADR che motiva lo scostamento: non esistono scostamenti taciti.

## 2. I documenti dell'area

| # | Documento | Che cosa risolve | Chi lo deve leggere |
|---|---|---|---|
| 01 | [Visione architetturale](01-visione-architetturale.md) | I driver che modellano il sistema, gli scenari di qualità con cui si verifica, i compromessi accettati e **quelli rifiutati** | Chiunque, prima di tutto il resto |
| 02 | [Contesti delimitati](02-contesti-delimitati.md) | I tredici confini interni: responsabilità, linguaggio, invarianti, ciò che ciascuno **non** fa, relazioni reciproche | Chi progetta o rivede un modulo |
| 03 | [Modello di dominio](03-modello-di-dominio.md) | Aggregati, entità, oggetti valore, invarianti, eventi; la separazione fra prestazione e sessione media argomentata fino in fondo | Chi scrive codice di dominio |
| 04 | [Modello dati](04-modello-dati.md) | Modello canonico, rapporto con FHIR R4 e con le guide italiane, dataset canonico dei documenti, serie temporali, identificatori | Chi tocca la persistenza o l'interoperabilità |
| 05 | [Multi-tenancy](05-multi-tenancy.md) | Isolamento, propagazione del contesto, migrazioni, ripristino selettivo, il caso a tenant unico | Chi scrive una query, una migrazione o un job |
| 06 | [Eventi e integrazione interna](06-eventi-e-integrazione-interna.md) | Outbox transazionale, buste, consegna, idempotenza, ordinamento, ritentativi, messaggi non elaborabili | Chi pubblica o consuma un evento |
| 07 | [Tracciamento e registro immutabile](07-tracciamento-e-registro-immutabile.md) | Catena di hash, conservazione separata, cosa si registra e cosa no, dimostrabilità dell'integrità | Chi tocca un percorso che accede a dato sanitario |
| 08 | [Viste di deployment](08-viste-di-deployment.md) | Installazione presso il cliente e servizio gestito, componenti, reti, isolamento del relay, dipendenze | Chi installa, chi valuta, chi dimensiona |
| 09 | [Decisioni rinviate](09-decisioni-rinviate.md) | Ciò che **non** è deciso, con i criteri per deciderlo e l'indicazione di chi decide | Chi cerca una risposta e non la trova |

Il registro delle decisioni architetturali sta in [`docs/adr/`](../adr/README.md). Ogni scelta
strutturale enunciata in quest'area ha un ADR che ne ricostruisce la motivazione, le alternative
scartate e le conseguenze. **Un'affermazione architetturale senza ADR è un difetto di
documentazione**, non una scorciatoia ammessa.

## 3. Percorsi di lettura

### 3.1 Chi arriva da zero sul progetto

1. La guida dei fondamenti, blocco informatico: [modulo 11](../10_fondamenti/11-fondamenti-informatici.md).
   Quest'area **presuppone** quel modulo e non ne ripete i concetti: consistenza, saga, outbox,
   idempotenza, aggregato, contesto delimitato, sicurezza a livello di riga, percentili sono già
   spiegati lì.
2. [01 — Visione architetturale](01-visione-architetturale.md).
3. [02 — Contesti delimitati](02-contesti-delimitati.md), almeno la mappa e la tabella di sintesi.
4. Il documento dell'area che riguarda il proprio lavoro.

### 3.2 Chi deve implementare una funzione

01 → 02 (solo il contesto interessato e i suoi confinanti) → 03 → il documento specifico
(04, 05, 06, 07 secondo il caso) → gli ADR citati nel testo. Prima di aprire una pull request:
[09 — Decisioni rinviate](09-decisioni-rinviate.md), per verificare di non stare decidendo
d'ufficio qualcosa che è deliberatamente aperto.

### 3.3 Chi valuta il progetto per un'installazione

01 → [08 — Viste di deployment](08-viste-di-deployment.md) → [05 — Multi-tenancy](05-multi-tenancy.md)
→ [07 — Tracciamento](07-tracciamento-e-registro-immutabile.md). Sono i quattro documenti che
determinano che cosa il soggetto che installa deve garantire per proprio conto, e che cosa
eredita dal progetto.

### 3.4 Chi verifica la conformità

[07](07-tracciamento-e-registro-immutabile.md) e [05](05-multi-tenancy.md) per le evidenze di
tracciabilità e isolamento; [03](03-modello-di-dominio.md) per il confine fra registrazione di
contenuto redatto dal professionista e produzione autonoma di informazione clinica; l'area di
conformità (`docs/08_compliance/`) per il resto. Quest'area **non** contiene la determinazione
di qualificazione e classificazione: la presuppone e ne descrive le conseguenze strutturali.

## 4. Rapporto con la guida dei fondamenti

La guida in [`docs/10_fondamenti/`](../10_fondamenti/00-come-usare-questa-guida.md) insegna la
teoria; quest'area la applica. Il criterio di ripartizione è netto e va rispettato in ogni
revisione:

| La guida spiega | Quest'area stabilisce |
|---|---|
| Che cos'è un aggregato e perché i confini transazionali contano | Quali sono gli aggregati di Telemedic e dove passano i confini |
| Che cos'è l'outbox transazionale e quale difetto elimina | Quali eventi passano dall'outbox, quali no e perché |
| Che cos'è la sicurezza a livello di riga e che cosa la disattiva | Quale modello di isolamento si adotta e come si verifica |
| Che cos'è FHIR e come è fatta una risorsa | Quale ruolo ha FHIR nel modello dati e dove non arriva |
| Perché il versionamento delle entità non è un registro immutabile | Come è costruito il registro immutabile di Telemedic |
| Che cosa sono NAT, ICE, relay e cifratura del media | Dove vive il confine fra sessione media e prestazione clinica |

Se un documento di quest'area comincia a spiegare la teoria, sta duplicando la guida e va
riportato al rinvio.

## 5. Convenzioni di lettura

- **`[NV]`** marca un'affermazione **non verificata** su fonte primaria. Ogni marcatura indica
  chi deve chiuderla. Nessun `[NV]` può sopravvivere al passaggio in produzione del componente
  che ne dipende.
- **«la norma stabilisce»** introduce un obbligo con fonte citata; **«è prassi»** un uso diffuso
  senza obbligo; **«è una scelta del progetto»** una decisione di Telemedic, che in quanto tale
  ha un ADR e può essere cambiata.
- I nomi di risorsa e di elemento FHIR restano in forma originale (`Encounter`, `Composition`,
  `Patient.identifier`). I nomi di concetto di dominio sono in italiano. Dove le due lingue
  collidono, prevale il nome del linguaggio ubiquo definito in
  [03 — Modello di dominio](03-modello-di-dominio.md).
- I diagrammi sono in Mermaid. Un diagramma non sostituisce il testo: se un vincolo esiste solo
  nel diagramma, non esiste.
- Tutti i dati negli esempi sono **sintetici**. Non compare alcun dato reale, né alcun nome di
  azienda, marchio o prodotto commerciale di potenziali partner (regola R0). Si dice sempre
  «l'integratore», «un gestionale sanitario di terze parti», «un sistema EHR di terze parti».

## 6. Che cosa quest'area deliberatamente non contiene

| Materia | Dove sta |
|---|---|
| Catalogo dei requisiti funzionali e non funzionali | Area funzionale (`docs/03_functional/`) |
| Specifica del protocollo di segnalamento e dei formati di messaggio | Area protocolli (`docs/04_protocols/`) |
| Modello delle minacce, misure crittografiche, configurazione del relay | Area sicurezza (`docs/06_security/`) |
| Contratti verso i sistemi terzi, SDK, componente incorporabile | Area integrazione (`docs/07_integration/`) |
| Fascicolo tecnico, gestione del rischio, ingegneria dell'usabilità | Area conformità (`docs/08_compliance/`) |
| Scelte di libreria, struttura dei moduli di build, convenzioni di codice | Area tecnica (`docs/01_technical/`) |
| Sequenza e date di realizzazione | Roadmap (`docs/09_roadmap/`) |

Quando quest'area nomina uno di quei temi, lo fa per fissare il **vincolo architetturale** che
l'area competente deve rispettare, non per anticiparne il contenuto.
