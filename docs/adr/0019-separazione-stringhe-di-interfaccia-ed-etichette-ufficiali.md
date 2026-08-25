---
title: "ADR-0019 — Separazione fra stringhe di interfaccia del progetto ed etichette ufficiali delle terminologie"
sidebar_position: 19
description: Perché le traduzioni del prodotto non si scrivono nel campo dell'etichetta ufficiale, come si realizza concretamente la separazione e quali verifiche la rendono effettiva.
---

# ADR-0019 — Separazione fra stringhe di interfaccia del progetto ed etichette ufficiali delle terminologie

**Stato**: accettata · **Data**: 25 agosto 2026 · **Area**: ARCH
**Decisione di riferimento**: D34 · **Origine**: questione posta dal modulo dei fondamenti

## Contesto

Un concetto codificato porta un'**etichetta**: la stringa leggibile che accompagna il codice. La
tentazione naturale è usare quel campo per il testo che l'interfaccia mostra all'utente,
traducendolo nella lingua del prodotto quando la fonte non lo fornisce già tradotto.

Questa tentazione ha una conseguenza di licenza, non solo di ordine. Le traduzioni delle etichette
di almeno una terminologia rilevante sono **opere derivate i cui diritti sono assegnati al
proprietario della terminologia**. Se il progetto conservasse le proprie traduzioni nel campo
dell'etichetta ufficiale, e quel campo fosse emesso verso l'esterno, il progetto produrrebbe e
distribuirebbe un derivato di quella terminologia.

C'è anche una ragione funzionale indipendente: le stringhe di interfaccia del prodotto hanno bisogno
di essere adattate al contesto d'uso, alla lunghezza disponibile e al profilo dell'utente — un
assistito anziano e un professionista sotto pressione di tempo non leggono la stessa etichetta con
la stessa efficacia. L'etichetta ufficiale non è adattabile: è ciò che il proprietario ha stabilito.

## Alternative valutate

### Alternativa 1 — Un solo campo, tradotto dal progetto

*Vantaggi*: banale; nessuna ricerca aggiuntiva; l'interfaccia mostra ciò che trova.

*Compromessi*: produce un derivato di contenuto altrui; emette verso l'esterno una stringa che non
è quella ufficiale, il che è un difetto di interoperabilità oltre che di licenza; rende impossibile
adattare il testo all'interfaccia senza alterare il dato.

**Scartata.**

### Alternativa 2 — Un solo campo, con l'etichetta ufficiale, mostrata direttamente

*Vantaggi*: nessun derivato; nessuna divergenza fra ciò che si mostra e ciò che si emette.

*Compromessi*: l'interfaccia mostra stringhe non adattate, spesso in lingua diversa da quella
dell'utente, spesso troppo lunghe, spesso incomprensibili a un assistito. Contraddice il requisito
trasversale di accessibilità e di progettazione per l'utente reale. **Scartata.**

### Alternativa 3 — Due archivi separati per costruzione

*Vantaggi*: nessun derivato; interfaccia adattabile; emissione conforme.

*Compromessi*: due archivi da mantenere; un percorso di ricerca in più; il rischio che manchi la
stringa del prodotto per un codice raro.

## Decisione

**Si adotta l'alternativa 3.**

| Archivio | Contenuto | Proprietario | Dove vive |
|---|---|---|---|
| **Etichetta ufficiale** | La stringa fornita dalla fonte, nella lingua in cui la fonte la fornisce | Il proprietario della terminologia | Il campo di etichetta del concetto codificato, popolato **solo** dal gateway terminologico |
| **Stringa di interfaccia** | Il testo che il prodotto mostra all'utente | Il progetto | L'archivio di internazionalizzazione del prodotto, indicizzato per la coppia sistema più codice |

Tre regole, tutte verificabili automaticamente:

1. **Nessun percorso di codice scrive nel campo di etichetta ufficiale se non il gateway
   terminologico.**
2. **L'interfaccia non mostra mai il campo di etichetta ufficiale direttamente.** Chiede la stringa
   all'archivio di internazionalizzazione per la coppia sistema più codice; se manca, ricade
   sull'etichetta ufficiale **dichiarando** che si tratta della forma originale, e la mancanza è
   segnalata come lacuna di traduzione da colmare.
3. **In uscita verso un sistema terzo si emette l'etichetta ufficiale, mai la stringa di
   interfaccia.**

La chiave dell'archivio di internazionalizzazione è **la coppia sistema più codice**, non la sola
etichetta: due terminologie possono usare lo stesso codice con significati diversi, e indicizzare
per etichetta produrrebbe collisioni silenziose.

## Conseguenze

**Positive**

- Il progetto non produce derivati di contenuto altrui.
- Le stringhe dell'interfaccia sono adattabili al contesto e al profilo dell'utente, che è un
  requisito e non una comodità.
- L'emissione verso l'esterno è conforme.
- La lacuna di traduzione è rilevabile invece di essere mascherata da una stringa qualsiasi.

**Negative, accettate**

- Due archivi; una ricerca in più a ogni presentazione.
- Le lacune di traduzione vanno colmate, e il loro numero cresce con l'ampiezza delle terminologie
  usate: serve un processo, non un'attività occasionale.
- L'utente può vedere, per un codice raro, una stringa nella lingua originale: è dichiarato
  nell'interfaccia e preferibile a una traduzione non autorizzata.

## Riferimenti

[04 — Modello dati](../02_architecture/04-modello-dati.md#62-la-separazione-fra-etichetta-ufficiale-e-stringa-di-interfaccia) ·
ADR-0016
