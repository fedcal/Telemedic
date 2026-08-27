---
title: "ADR-0023 - Il contesto della rendicontazione: proposta di scostamento dalla base architetturale"
sidebar_position: 23
description: Perché quest'area propone un quattordicesimo contesto delimitato per la formazione dell'evento rendicontabile, quali sono le alternative e perché la decisione non viene presa d'ufficio.
---

# ADR-0023 - Il contesto della rendicontazione: proposta di scostamento dalla base architetturale

**Stato**: **proposta - in attesa di decisione del committente** · **Data**: 25 agosto 2026 · **Area**: ARCH
**Vincolo interessato**: [V-166](../11_registri/01-vincoli-in-vigore.md#v-166) posto dall'`INTEG`, confermato da `FUNZ` in [Q-163](../11_registri/02-questioni-aperte.md#q-163) con `BR-170` e `BR-171`

## Contesto

La base architetturale vincolante fissa **tredici** contesti delimitati. Fra questi non compare un
contesto dedicato alla formazione degli eventi rendicontabili e delle aggregazioni verso il sistema
amministrativo. La ricerca di dominio ne aveva invece individuato uno.

Due fatti rendono la questione non ornamentale.

**Il primo è di dominio.** La prestazione erogata a distanza si rendiconta con il codice della
corrispondente prestazione in presenza, con l'attributo di canale che ne qualifica la modalità.
Confondere l'asse «che cosa è stato erogato» con l'asse «come è stato erogato» rende un sistema di
telemedicina non rendicontabile, e la correzione a posteriori richiede di ricodificare lo storico.

**Il secondo è un vincolo posto da un'altra area.** Il profilo di integrazione del pagatore è
**amministrativo per costruzione**: identificativo della prestazione, esito amministrativo, importo,
mai riferimenti a documenti clinici. Nessun ambito di autorizzazione, nessun tipo di evento, nessun
modulo sostituibile e nessuna configurazione può costituire un percorso - diretto o mediato da un
professionista - con cui un pagatore ottiene contenuto clinico. Quel vincolo presuppone un luogo in
cui l'evento amministrativo è formato e in cui si garantisce che non trasporti altro.

## Alternative valutate

### Alternativa 1 - Quattordicesimo contesto di supporto dedicato

*Vantaggi*: il confine fra piano clinico e piano amministrativo diventa **strutturale**. Il vincolo
sul profilo del pagatore diventa verificabile automaticamente - nessun tipo del contesto della
rendicontazione può referenziare un tipo del contesto della documentazione - invece di essere una
convenzione di codice.

*Compromessi*: un contesto in più da governare, documentare e provare; uno scostamento dalla base
architetturale vincolante, che eccede il mandato di un'area.

### Alternativa 2 - Responsabilità distribuita fra prestazione clinica e frontiera

*Vantaggi*: nessun contesto nuovo; nessuno scostamento.

*Compromessi*: l'evento amministrativo si forma **dentro** il contesto clinico, che ha accesso al
contenuto clinico. La garanzia diventa una convenzione: nulla impedisce strutturalmente che una
versione successiva dell'evento acquisisca un riferimento a un documento. Il difetto non produce
sintomi finché qualcuno non ne approfitta.

### Alternativa 3 - Responsabilità interamente nel contesto di frontiera

*Vantaggi*: coerente con l'idea che tutto ciò che esce passi dalla frontiera.

*Compromessi*: carica il livello anticorruzione di una responsabilità **di dominio** - quale evento
è rendicontabile, con quale codice, con quale attributo di canale - che non gli appartiene e che
richiederebbe al livello di traduzione di conoscere regole cliniche e amministrative.

## Decisione proposta

**Quest'area propone l'alternativa 1** e **non la adotta d'ufficio**.

La ragione della proposta è di verificabilità: con un contesto autonomo, il vincolo sul profilo del
pagatore è un **confine**; senza, è una convenzione. In un sistema che deve dimostrare le proprie
proprietà a chi verifica, la differenza fra le due non è di stile.

La ragione per cui la decisione non viene presa è di protocollo: modificare l'elenco dei contesti
della base architetturale vincolante eccede il mandato di un'area, e la base stessa prescrive che
lo scostamento sia dichiarato e deciso a valle. **La questione è portata all'orchestratore.**

## Stato provvisorio, in attesa della decisione

La responsabilità resta dove la base la lascia implicitamente: la determinazione del fatto
rendicontabile nel contesto della prestazione clinica, il recapito nel contesto di frontiera.
**Con due avvertenze esplicite**:

1. In questa collocazione il vincolo sul profilo del pagatore è una **convenzione e non un
   confine**.
2. Va introdotta una **prova dedicata** che accerti che l'evento destinato alla liquidazione
   trasporti soltanto identificativo della prestazione, esito amministrativo e importo. La prova
   sostituisce, in modo imperfetto, la garanzia strutturale.

## Conseguenze della decisione, quale che sia

**Se accolta**: un contesto in più; il vincolo diventa verificabile per costruzione; la
corrispondenza con la decomposizione della ricerca di dominio si completa.

**Se respinta**: il sistema funziona ugualmente. Il rischio residuo è che un evento destinato alla
liquidazione acquisisca, in una versione successiva, un riferimento a un documento clinico senza
che nulla lo impedisca strutturalmente. Il rischio va allora iscritto nel materiale di gestione del
rischio, non lasciato implicito.

## Riferimenti

[02 - Contesti delimitati](../02_architecture/02-contesti-delimitati.md#5-uno-scostamento-dichiarato-la-rendicontazione) ·
[09 - Decisioni rinviate](../02_architecture/09-decisioni-rinviate.md#c-1---il-contesto-della-rendicontazione)
