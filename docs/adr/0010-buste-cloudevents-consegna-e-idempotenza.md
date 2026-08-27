---
title: "ADR-0010 - Buste CloudEvents, consegna almeno una volta, idempotenza per costruzione"
sidebar_position: 10
description: Il formato della busta degli eventi, la semantica di consegna dichiarata, la chiave di partizionamento, il numero di sequenza per aggregato e la ragione per cui l'ordine globale non è garantito.
---

# ADR-0010 - Buste CloudEvents, consegna almeno una volta, idempotenza per costruzione

**Stato**: accettata · **Data**: 25 agosto 2026 · **Area**: ARCH
**Base architetturale**: §5 · **Correzione recepita**: C-10 di bacheca

## Contesto

Stabilito che gli eventi nascono dall'outbox, restano tre decisioni: quale formato di busta, quale
semantica di consegna dichiarare, e come si ricostruisce l'ordine quando non è garantito.

La terza è la più importante perché è quella che gli integratori sbagliano: un contratto che tace
sull'ordinamento produce integratori che assumono l'ordine e falliscono in modo intermittente.

## Alternative valutate

### Formato della busta

| Opzione | Compromesso |
|---|---|
| Busta proprietaria | Nessun vincolo esterno; nessuno strumento la conosce; ogni integratore impara un formato nuovo |
| Busta standard in modalità strutturata | Formato riconosciuto; strumenti disponibili; l'intero evento in un solo corpo, quindi facile da registrare, firmare, rieseguire e ispezionare |
| Busta standard in modalità binaria | Attributi negli intestazioni del trasporto, dato nel corpo: più efficiente, ma lega la busta al protocollo di trasporto e complica la riesecuzione e l'archiviazione |
| Contenitore documentale del formato clinico come busta | Adatto solo per le notifiche del piano clinico; incapsularlo in un'altra busta aggiunge uno strato inutile |

### Semantica di consegna

| Opzione | Compromesso |
|---|---|
| Al più una volta | Semplice; perde eventi; inammissibile |
| Almeno una volta | Non perde eventi; produce duplicati; richiede consumatori idempotenti |
| Esattamente una volta | **Non garantibile attraverso il confine di un sistema esterno.** Prometterla produce integratori che non deduplicano, cioè il difetto che si voleva evitare |

### Ordinamento

| Opzione | Compromesso |
|---|---|
| Ordine globale | Richiede una sola partizione: non scala e non sopravvive ai ritentativi |
| Code ordinate per chiave, bloccanti | Ordine garantito; un evento bloccato blocca l'intera chiave |
| Numero di sequenza per aggregato, ordine non garantito | Rende l'ordine di arrivo irrilevante senza code bloccanti; richiede che il consumatore lo usi |

## Decisione

**Busta standard in modalità strutturata; consegna almeno una volta; ordine per chiave di
partizionamento, con numero di sequenza per aggregato.**

### Regole sulla busta

- Identificativo ordinabile nel tempo; la coppia sorgente più identificativo è unica per
  costruzione ed è il fondamento della deduplicazione.
- **Versione esplicita nel nome del tipo**, non in un attributo separato: un consumatore filtra per
  tipo, e con la versione nel tipo può sottoscrivere la versione che sa trattare, ignorando le
  altre. Con la versione in un attributo la riceverebbe comunque.
- Riferimento allo schema del dato, versionato: rende la busta autodescrittiva e validabile.
- **Identificativo di tenant obbligatorio**, senza eccezioni. Un evento senza tenant finisce nella
  coda dei messaggi non elaborabili, non viene processato con un valore predefinito.
- **Numero di sequenza monotono per aggregato**, non globale.
- Identificativo di correlazione, per ricostruire il percorso degli eventi originati dalla stessa
  azione.
- **Correzione recepita**: l'attributo di tipo di contenuto **non si trasmette come intestazione
  dedicata con prefisso proprio**. In modalità strutturata il tipo di contenuto del messaggio è
  quello della busta; in modalità binaria l'attributo si mappa sul tipo di contenuto del messaggio.
  Un'implementazione che emette un'intestazione dedicata non è conforme.

### La chiave di partizionamento è l'aggregato, non il tenant

Partizionare per tenant sembra naturale e produce due difetti: partizioni gravemente sbilanciate,
perché i tenant hanno dimensioni molto diverse; e nessuna garanzia utile, perché l'ordine che serve
è quello dei fatti relativi allo **stesso aggregato**, non allo stesso cliente.

### Idempotenza per costruzione

Ogni consumatore è idempotente, verificato con una prova che consegna due volte lo stesso evento e
verifica l'identità dello stato risultante. Tre forme, in ordine di preferenza: operazione
naturalmente idempotente; chiave di deduplicazione persistita, con conservazione **superiore alla
finestra massima di ritentativo**; verifica di stato prima dell'effetto, obbligatoria per i due
effetti non ritrattabili - il recapito di un messaggio a una persona e il deposito di un documento
in un'infrastruttura esterna.

## Conseguenze

**Positive**

- Il contratto è esplicito su ciò che **non** garantisce: è l'informazione che evita l'errore di
  integrazione più frequente.
- La deduplicazione funziona anche in caso di riesecuzione manuale, perché la riesecuzione riusa lo
  stesso identificativo.
- La riduzione del contenuto trasportato riduce la superficie di esposizione (ADR-0011).

**Negative, accettate**

- Ogni consumatore, interno ed esterno, deve deduplicare.
- Il numero di sequenza per aggregato richiede una sorgente monotona per aggregato, quindi un punto
  di serializzazione in scrittura.
- L'aumento del numero di partizioni in esercizio può spezzare l'ordine per aggregato
  durante il riassestamento: verifica da `TECH` **prima** di qualunque
  ridimensionamento `[NV]`.
- La finestra di conservazione delle chiavi di deduplicazione va fissata da `TECH`
  e non può essere inferiore alla finestra massima di ritentativo, criteri da verificare `[NV]`.

## Riferimenti

[06 - Eventi e integrazione interna](../02_architecture/06-eventi-e-integrazione-interna.md#3-la-busta) ·
ADR-0008 · ADR-0011
