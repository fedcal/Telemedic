---
title: "ADR-0017 — Identificatore del sistema del codice fiscale e traduzione al confine"
sidebar_position: 17
description: Quale dei due URI in uso nelle guide italiane si adotta, perché, e come si gestisce la divergenza verso i consumatori allineati all'altro.
---

# ADR-0017 — Identificatore del sistema del codice fiscale e traduzione al confine

**Stato**: accettata · **Data**: 25 agosto 2026 · **Area**: ARCH
**Origine**: questione posta dal modulo dei fondamenti a quest'area e all'area tecnica

## Contesto

Esiste una divergenza **verificata su fonte primaria** fra le guide di implementazione italiane
sull'identificatore del sistema del codice fiscale. Due valori distinti compaiono in artefatti
pubblicati diversi:

| Guida | Valore |
|---|---|
| Profilo nazionale di base | `http://hl7.it/sid/codiceFiscale` |
| Famiglia televisita | `http://hl7.it/sid/codiceFiscale` |
| Profilo nazionale core | `http://hl7.it/fhir/itcore/CodeSystem/cs-codicefiscale` |

Non è un errore di trascrizione. Un consumatore allineato al profilo core **non riconosce**
l'identificatore emesso secondo la famiglia televisita, e viceversa. Poiché l'identificatore del
codice fiscale è la chiave con cui gran parte dei sistemi sanitari italiani riconosce una persona,
la divergenza non è marginale.

## Alternative valutate

### Alternativa 1 — Adottare il valore del profilo nazionale core

*Vantaggi*: il profilo core è il riferimento trasversale, potenzialmente più longevo.

*Compromesso*: il progetto dichiara conformità alla famiglia televisita, che usa l'altro valore.
Emettere un valore diverso da quello del profilo dichiarato è una non conformità al profilo su cui
si dichiara conformità. **Scartata.**

### Alternativa 2 — Adottare il valore della famiglia televisita

*Vantaggi*: coerenza con il profilo dichiarato; è anche il valore del profilo nazionale di base,
quindi copre due dei tre artefatti.

*Compromesso*: i consumatori allineati al profilo core non riconoscono l'identificatore.

### Alternativa 3 — Emettere sempre entrambi nella stessa risorsa

*Vantaggi*: ogni consumatore riconosce almeno uno dei due senza configurazione.

*Compromesso decisivo*: **peggiora la deduplicazione a valle invece di migliorarla.** Un
consumatore che trova due identificatori con sistemi diversi può leggerli come due identità
distinte, e il difetto che ne deriva — anagrafiche duplicate presso il destinatario — è più grave
del mancato riconoscimento, perché è silenzioso e si accumula. **Scartata**, coerentemente con la
raccomandazione motivata dell'area dei protocolli.

### Alternativa 4 — Un valore canonico interno, con emissione **singola** proiettata per
destinazione

Tutte le forme note sono accettate in ingresso; **una sola è emessa in uscita**, e quale sia è
configurazione per tenant e per destinazione.

*Vantaggi*: una sola sede della verità internamente; il consumatore riceve esattamente
l'identificatore che sa leggere; nessuna ambiguità di identità.

*Compromesso*: introduce una configurazione per destinazione e un registro degli identificatori di
sistema da mantenere.

## Decisione

**Si adotta l'alternativa 4.**

1. Il valore canonico interno è **`http://hl7.it/sid/codiceFiscale`**, coerente con la famiglia di
   profili su cui il progetto dichiara conformità e identico nella guida nazionale di base.
2. **In ingresso tutte le forme note sono accettate** e normalizzate sul valore canonico.
3. **In uscita se ne emette una sola.** La proiezione verso l'altro URI avviene **al confine con il
   consumatore**, per configurazione di tenant e di destinazione, senza toccare il modello interno.
   **Mai entrambi nella stessa risorsa.**
4. **Esiste un registro degli identificatori di sistema versionato** che dichiara, per ciascun
   identificatore riconosciuto, se è accettato in ingresso, se è emesso in uscita e con quale
   precedenza. Sta nel livello anticorruzione del contesto di frontiera e **mai nel dominio**
   (vincolo V-142 dell'area di dominio). Con questa forma la scelta è un valore di configurazione
   e non una migrazione.
5. L'identificatore esterno **non è mai una colonna della tabella principale**: vive in una tabella
   di identificatori con sistema, valore, uso e validità temporale.
6. Lo stesso registro gestisce gli altri identificatori nazionali con rappresentazioni multiple.
7. **La divergenza è dichiarata apertamente nella documentazione di integrazione**, e la traduzione
   è un'operazione di conformità registrata, non una riscrittura silenziosa. La divergenza va
   inoltre segnalata all'ente di normazione.

Resta ferma la regola generale per cui **nessun identificatore esterno è chiave primaria**: il
codice fiscale è un attributo qualificato dal proprio dominio di attribuzione, non l'identità
interna. Non è universale — esistono codici temporanei, neonati non ancora codificati, omocodie —
può cambiare per rettifica anagrafica, e non è un segreto: usarlo come chiave incoraggia a usarlo
come fattore di autenticazione, che è un difetto di sicurezza.

## Conseguenze

**Positive**

- Conformità al profilo dichiarato.
- I consumatori dell'altro profilo continuano a funzionare, dove la configurazione lo prevede.
- La divergenza è confinata in un solo artefatto versionato.

**Negative, accettate**

- Una configurazione per destinazione e un registro da mantenere.
- Un destinatario non dichiarato riceve il valore predefinito e può non riconoscerlo: l'onboarding
  deve chiedere esplicitamente quale profilo il destinatario adotta, ed è attrito di integrazione.
- Se un giorno le guide convergono, il registro va aggiornato: è un lavoro piccolo e localizzato.

**Punto collegato che questa decisione non risolve**: il codice di tipo dell'identificatore nel
segmento anagrafico del canale legacy resta **contrattuale con l'integratore**. La forma conforme
alla regola di formazione della tabella di riferimento è quella con il suffisso di Paese; la forma
abbreviata senza suffisso **non esiste** come concetto enumerato.
- `[NV]` — la posizione dell'ente di normazione nazionale sulla divergenza non è nota. La questione
  va sollevata dall'area di conformità, che ha già in carico l'interlocuzione per le tipologie
  documentali.

## Riferimenti

[04 — Modello dati](../02_architecture/04-modello-dati.md#52-la-divergenza-verificata-degli-uri-del-codice-fiscale) ·
ADR-0002
