---
title: "ADR-0018 - Il catalogo delle prestazioni: struttura nel prodotto, contenuto per tenant"
sidebar_position: 18
description: Perché il progetto definisce la forma di una voce di catalogo ma non ne distribuisce il contenuto, e perché la doppia codificazione e la validità temporale non sono opzionali.
---

# ADR-0018 - Il catalogo delle prestazioni: struttura nel prodotto, contenuto per tenant

**Stato**: accettata · **Data**: 25 agosto 2026 · **Area**: ARCH
**Origine**: questione posta dal modulo dei fondamenti a quest'area

## Contesto

Il catalogo delle prestazioni erogabili è un dato di riferimento con tre proprietà scomode: è
definito da fonte normativa esterna al progetto; è **territorialmente differenziato**, perché
ciascuna amministrazione regionale mantiene un proprio catalogo che estende e rinomina quello
nazionale; e ha **cicli di aggiornamento indipendenti** fra loro.

La domanda posta è se sia dato di riferimento **incluso** nel prodotto oppure **esclusivamente
riferito** dal tenant.

Un fatto verificato del dominio condiziona la risposta: **non esiste un codice di prestazione
distinto per l'erogazione a distanza**. Le prestazioni già presenti nel catalogo, se erogate a
distanza, mantengono la stessa codificazione e la stessa tariffa della corrispondente prestazione in
presenza. La modalità a distanza è un **modificatore del canale**, non una prestazione a sé.

## Alternative valutate

### Alternativa 1 - Catalogo incluso nella distribuzione

*Vantaggi*: il sistema funziona subito; nessun caricamento a carico di chi installa; validazione e
ricerca disponibili immediatamente.

*Compromessi*:

- **Ogni aggiornamento regionale diventa un rilascio del prodotto.** Con cicli indipendenti e
  numerosi, la cadenza di rilascio del progetto sarebbe determinata da atti amministrativi altrui.
- Il progetto assumerebbe una **responsabilità editoriale su contenuto normativo di terzi**: un
  errore di trascrizione in un catalogo distribuito diventa un errore di rendicontazione presso
  ogni installazione.
- La distribuzione conterrebbe dati che il progetto non ha titolo per curare.

**Scartata.**

### Alternativa 2 - Esclusivamente riferito, nessuna struttura nel prodotto

*Vantaggi*: nessuna responsabilità sul contenuto; nessuna manutenzione.

*Compromessi*: il prodotto non potrebbe validare un codice, non potrebbe ricercare, non potrebbe
rendere selezionabile una prestazione, non potrebbe verificare che la prestazione sia abilitata a un
canale. Ogni tenant reimplementerebbe la stessa struttura, con esiti diversi. **Scartata.**

### Alternativa 3 - Struttura nel prodotto, contenuto per tenant

*Vantaggi*: il prodotto offre la funzione senza assumere la responsabilità del contenuto; ogni
tenant carica ciò che gli compete con il proprio ciclo.

*Compromessi*: un'installazione nuova non è utilizzabile finché il catalogo non è caricato; il
caricamento è un passaggio di attivazione in più.

## Decisione

**Si adotta l'alternativa 3.**

Il prodotto definisce la **struttura** di una voce di catalogo - codice, dominio di attribuzione del
catalogo, descrizione, branca, canali abilitati, validità temporale, riferimento al codice nazionale
corrispondente - e le operazioni di caricamento, validazione, ricerca e disattivazione. **Il
contenuto è dato di tenant**, caricato per interfaccia applicativa documentata e versionato con
validità temporale, mai incluso nella distribuzione.

Tre conseguenze obbligatorie:

1. **La doppia codificazione è nativa.** Una voce porta insieme il codice del catalogo del tenant e
   il codice nazionale corrispondente, perché la rendicontazione li richiede entrambi.
2. **La validità temporale non è opzionale.** Un catalogo senza validità rende irriproducibile la
   rendicontazione storica: la prestazione erogata l'anno scorso va rendicontata con la codificazione
   vigente allora.
3. **Il progetto non distribuisce alcun catalogo**, nemmeno a titolo di esempio con dati reali. Il
   materiale di dimostrazione usa un catalogo sintetico, esplicitamente marcato come tale.

**Estensione per analogia**: la stessa regola vale per ogni dato di riferimento con ciclo di vita
esterno e territorialmente differenziato.

## Conseguenze

**Positive**

- Il progetto non è vincolato ai cicli di aggiornamento di terzi.
- Nessuna responsabilità editoriale su contenuto normativo altrui.
- I due assi «che cosa è stato erogato» e «come è stato erogato» restano ortogonali, che è la
  condizione perché il sistema sia rendicontabile.

**Negative, accettate**

- Un'installazione nuova richiede il caricamento del catalogo prima di essere operativa: va
  documentato nella lista di ciò che chi installa deve fornire.
- Il progetto deve fornire strumenti di caricamento e di validazione robusti, perché il caricamento
  è a carico di chi non conosce il sistema.
- La documentazione deve spiegare la doppia codificazione a integratori che spesso ne conoscono solo
  un lato.

## Riferimenti

[04 - Modello dati](../02_architecture/04-modello-dati.md#63-il-catalogo-delle-prestazioni) ·
[02 - Contesti delimitati](../02_architecture/02-contesti-delimitati.md#ctx-13---amministrazione-tenant)
