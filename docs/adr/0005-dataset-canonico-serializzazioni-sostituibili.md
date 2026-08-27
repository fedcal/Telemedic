---
title: "ADR-0005 - Dataset canonico dei documenti e serializzazioni sostituibili"
sidebar_position: 5
description: Perché il contenuto informativo dei documenti sanitari si modella come dataset canonico indipendente dalla forma, e perché nessun modello di documento strutturato è cablato.
---

# ADR-0005 - Dataset canonico dei documenti e serializzazioni sostituibili

**Stato**: accettata · **Data**: 25 agosto 2026 · **Area**: ARCH
**Vincoli di riferimento**: [V-07](../11_registri/01-vincoli-in-vigore.md#v-07) di bacheca; D30

## Contesto

I documenti sanitari destinati all'infrastruttura documentale nazionale hanno un **set informativo
definito da fonte normativa**. Le loro rappresentazioni tecniche - modelli di documento
strutturato, codici documentali, metadati di indicizzazione - **non sono pubblicamente disponibili**
alla data di questa decisione, e la loro acquisizione è una questione aperta.

Il progetto deve poter modellare il contenuto dei documenti **adesso**, senza attendere quel
materiale e senza legarsi a una forma che può cambiare.

## Alternative valutate

### Alternativa 1 - Attendere il materiale tecnico e modellare sulla forma

*Vantaggi*: nessun lavoro sprecato; il modello corrisponde esattamente a ciò che serve trasmettere.

*Compromessi*: blocca la modellazione del contesto documentale per un tempo non determinato e
dipendente da terzi; e comunque produrrebbe un modello legato a una forma tecnica, con lo stesso
problema al primo aggiornamento. **Scartata.**

### Alternativa 2 - Modellare direttamente sul formato di scambio clinico

Il contenuto del documento è la composizione, e il dataset è ciò che la composizione contiene.

*Vantaggi*: un solo artefatto; nessuna conversione.

*Compromessi*: il contenuto informativo è definito dalla normativa sanitaria, mentre la struttura
della composizione è definita da un profilo. I due cambiano per ragioni diverse e con ritmi
diversi. Legarli significa che una revisione di profilo diventa una revisione del contenuto
informativo, e che un obbligo normativo nuovo richiede di attendere un profilo che lo rappresenti.
Inoltre non risolve la seconda forma: la rappresentazione impaginata per la lettura umana andrebbe
costruita a parte, con il rischio di divergenza fra ciò che il professionista firma e ciò che il
sistema trasmette. **Scartata.**

### Alternativa 3 - Dataset canonico indipendente, serializzazioni come mappature

*Vantaggi*: il contenuto è definito una volta, dalla fonte normativa; ogni forma è un mappatore;
la rappresentazione impaginata e quella strutturata derivano dalla stessa sorgente.

*Compromessi*: un artefatto in più da definire e versionare; una conversione in più.

## Decisione

**Si adotta l'alternativa 3.**

1. Il **dataset canonico è un artefatto versionato del progetto**: per ogni elemento, definizione,
   obbligatorietà, tipo, vincolo terminologico e **fonte normativa che lo richiede**. È l'unico
   luogo in cui il contenuto informativo è definito.
2. **Ogni serializzazione è un mappatore** con prove che partono dal dataset, producono la forma, la
   validano e la rileggono verificando l'equivalenza semantica.
3. **Nessun modello di documento strutturato è cablato.** L'aggiunta di una forma è l'aggiunta di un
   mappatore.
4. **La rappresentazione impaginata è una serializzazione come le altre**, non un caso speciale.
5. **I metadati di indicizzazione derivano dal dataset**, non sono compilati a parte.

## Conseguenze

**Positive**

- La modellazione del contesto documentale procede senza attendere materiale di terzi.
- L'arrivo dei modelli tecnici sarà la scrittura di un mappatore, non una migrazione del modello e
  dei dati già prodotti.
- La divergenza fra la forma leggibile da una persona e quella leggibile da una macchina è
  eliminata alla radice: derivano dalla stessa sorgente.
- Ogni elemento del contenuto porta la propria fonte normativa, il che rende verificabile la
  completezza rispetto all'obbligo.

**Negative, accettate**

- Un artefatto in più, che va mantenuto allineato alla normativa.
- Una conversione in più a ogni emissione.
- Il dataset è un punto di sincronizzazione fra `COMP`, che ne determina il contenuto, e
  quest'area, che ne determina la forma: richiede coordinamento esplicito.

**Chi altro è vincolato**: aree di conformità, integrazione, dominio, protocolli. È il vincolo
[V-07](../11_registri/01-vincoli-in-vigore.md#v-07) di bacheca.

## Riferimenti

[04 - Modello dati](../02_architecture/04-modello-dati.md#3-il-dataset-canonico-dei-documenti) ·
ADR-0004
