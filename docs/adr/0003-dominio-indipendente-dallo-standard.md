---
title: "ADR-0003 — Il modello di dominio non conosce lo standard di interoperabilità"
sidebar_position: 3
description: Perché le risorse dello standard sono proiezioni costruite da mappatori e non entità persistite, quali alternative sono state scartate e quali verifiche automatiche rendono la regola effettiva.
---

# ADR-0003 — Il modello di dominio non conosce lo standard di interoperabilità

**Stato**: accettata · **Data**: 25 agosto 2026 · **Area**: ARCH

## Contesto

Adottato uno standard di scambio (ADR-0002), resta la domanda su **dove viva**. Le librerie
disponibili offrono tipi che rappresentano le risorse dello standard e strumenti che li persistono
direttamente: è una scorciatoia disponibile e visibile.

La domanda ha una risposta diversa a seconda di che cosa si ottimizza: il tempo di scrittura del
primo codice, oppure il costo di sopravvivere a una revisione della specifica.

## Alternative valutate

### Alternativa 1 — Persistere le risorse dello standard come documenti

Le risorse sono conservate nella loro forma nativa in un campo documentale.

*Vantaggi*: nessun mappatore da scrivere; nessuna migrazione quando la specifica aggiunge un
campo; le interfacce di scambio sono immediate.

*Compromessi*, tutti strutturali:

- **Le invarianti finiscono su un albero JSON.** Le risorse dello standard hanno quasi ogni
  elemento facoltativo, per costruzione: sono progettate per rappresentare dati parziali provenienti
  da sistemi diversi. Una regola come «un documento firmato è immutabile» diventa una verifica su
  una struttura in cui quasi tutto può mancare.
- **La migrazione di versione della specifica diventa migrazione di dati.** Se il dato persistito è
  la risorsa, cambiare versione significa trasformare l'archivio.
- **Il dominio si lega a una revisione di una guida preliminare.** È esattamente il rischio che
  l'ADR-0002 doveva contenere.
- **Le interrogazioni diventano interrogazioni su documenti**, con indicizzazione da costruire caso
  per caso.

### Alternativa 2 — Usare i tipi dello standard come tipi del dominio, con persistenza relazionale

*Vantaggi*: un solo insieme di tipi; nessuna conversione fra dominio e scambio.

*Compromessi*: i tipi dello standard non hanno comportamento e non custodiscono invarianti; sono
strutture dati. Il dominio perderebbe la propria capacità di rendere impossibile una violazione, e
l'accoppiamento alla revisione della specifica resterebbe totale, spostato dalla persistenza al
codice. **Scartata.**

### Alternativa 3 — Modello di dominio autonomo, risorse come proiezioni

*Vantaggi*: le invarianti vivono in tipi progettati per custodirle; la revisione della specifica
tocca i mappatori; la persistenza è relazionale e interrogabile.

*Compromessi accettati*: mappatori bidirezionali da scrivere e da provare per ogni risorsa
esposta; il costo di una conversione a ogni scambio; la disciplina di non far filtrare i tipi della
libreria nel dominio.

## Decisione

**Si adotta l'alternativa 3.**

1. **Nessun tipo del dominio importa tipi dello standard.** Verifica automatica bloccante.
2. **Le risorse sono costruite da mappatori** collocati nel livello anticorruzione del contesto di
   frontiera.
3. **I mappatori sono bidirezionali e provati con file di riferimento**: si parte da un'entità di
   dominio, si produce la risorsa, la si valida contro il profilo con il validatore ufficiale, la
   si rilegge e si verifica l'equivalenza semantica.
4. **Il modello di dominio non importa nemmeno i tipi del livello di persistenza né del contenitore
   applicativo.** Se l'invariante dipende dall'infrastruttura, l'infrastruttura può violarla.
5. **Gli identificatori esterni sono di prima classe nel dominio**, non un artefatto della
   mappatura.

## Conseguenze

**Positive**

- Lo scenario di qualità SQ-06 diventa raggiungibile: l'obiettivo è zero file modificati fuori dai
  pacchetti di mappatura e di profilazione a fronte di una revisione del profilo.
- Il dominio è provabile senza infrastruttura.
- La convivenza fra due versioni di profilo durante una migrazione è possibile: due mappatori.

**Negative, accettate**

- Costo di scrittura e di manutenzione dei mappatori, proporzionale al numero di risorse esposte.
- Ogni nuovo elemento di profilo richiede una decisione esplicita di mappatura: non compare da solo.
  È un costo e insieme una proprietà, perché impedisce che un elemento entri nel modello senza che
  qualcuno abbia deciso che cosa significhi.
- Serve una disciplina esplicita sui tipi condivisi: un tipo di dominio che assomiglia a un tipo
  dello standard non deve diventarne un alias.

**Verifiche automatiche**

- Nessun pacchetto di dominio importa i tipi dello standard, del livello di persistenza o del
  contenitore applicativo.
- Ogni risorsa esposta ha una prova di andata e ritorno con validazione contro il profilo.

## Riferimenti

[04 — Modello dati](../02_architecture/04-modello-dati.md#1-quattro-modelli-non-uno) · ADR-0002
