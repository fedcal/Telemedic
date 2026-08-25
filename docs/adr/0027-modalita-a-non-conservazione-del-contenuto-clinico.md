---
title: "ADR-0027 — Modalità di esercizio a non conservazione del contenuto clinico"
sidebar_position: 27
description: Come il sistema opera quando l'installazione non deve conservare i dati e i documenti generati, che cosa resta comunque, e dove vive la storia degli allarmi in quella modalità.
---

# ADR-0027 — Modalità di esercizio a non conservazione del contenuto clinico

**Stato**: accettata · **Data**: 25 agosto 2026 · **Area**: ARCH
**Origine**: questioni poste dall'area di dominio e dall'area funzionale

## Contesto

Esiste un assetto normativo in cui l'infrastruttura **non conserva** i dati e i documenti generati:
i documenti sono conferiti al fascicolo dalle strutture sanitarie, i dati di autenticazione e
accesso durano dodici mesi e i registri di tracciabilità ventiquattro.

L'area di dominio prevede questo come **modalità di esercizio**: dopo il conferimento restano
identificativo, metadati minimi e prova della presa in carico, e la lettura passa sempre da
un'asserzione verso l'archivio esterno.

L'area funzionale pone però una domanda che la modalità non risolve da sé: **dove vive la storia
degli allarmi**? Il registro degli allarmi — soglia vigente, regola applicata, dati che l'hanno
prodotto, consegne, prese in carico, inoltri, esiti — è **documentazione di un atto**. Senza di
esso non è ricostruibile perché un allarme non è scattato, e gli indicatori di sicurezza non sono
calcolabili.

## Alternative valutate

### Alternativa 1 — Modalità come configurazione che disattiva la persistenza

Un interruttore che, quando attivo, cancella dopo il conferimento.

*Vantaggi*: semplice; una sola base di codice.

*Compromessi*: la cancellazione indiscriminata travolge anche ciò che **non è** contenuto clinico
conferito — la storia degli allarmi, le evidenze di consenso, la prova della presa in carico — e
rende il sistema non ricostruibile. **Scartata nella forma indiscriminata.**

### Alternativa 2 — Ramo di prodotto separato

*Compromessi*: due basi di codice, quindi due comportamenti e difetti che si manifestano in una
sola. Contraddice il principio per cui gli assetti sono configurazioni dello stesso codice.
**Scartata.**

### Alternativa 3 — Modalità di configurazione con classificazione esplicita del dato

La modalità agisce **per categoria di dato**, non globalmente, e ogni categoria dichiara se è
conferita, se è conservata e per quanto.

*Vantaggi*: la cancellazione riguarda ciò che è stato conferito e non ciò che documenta l'atto;
la classificazione è esplicita e verificabile.

*Compromessi*: richiede che ogni categoria di dato sia classificata, senza eccezioni, e che la
classificazione sia mantenuta al crescere del modello.

## Decisione

**Si adotta l'alternativa 3.**

### La tassonomia

| Categoria | Comportamento nella modalità |
|---|---|
| **Documento clinico conferito** | Conferito; restano identificativo, metadati minimi e **prova della presa in carico**; la lettura passa da un'asserzione verso l'archivio esterno |
| **Contenuto clinico non conferibile** (bozze, annotazioni non destinate al fascicolo) | Conservato per la durata dichiarata dal titolare, poi rimosso |
| **Storia degli allarmi** | **Conservata.** È documentazione di un atto, non contenuto clinico conferito |
| **Evidenze di consenso e di revoca** | **Conservate.** Servono a dimostrare la liceità di ciò che è avvenuto e sopravvivono al dato a cui si riferiscono |
| **Registro degli accessi e delle operazioni** | Conservato per la durata prescritta, separatamente |
| **Dati di accesso e autenticazione** | Conservati per la durata prescritta |
| **Serie di parametri clinici** | Conferite o conservate secondo la configurazione del titolare, mai entrambe implicitamente |
| **Metriche di canale** | Conservazione breve, invariata |

### La storia degli allarmi

**Resta nel sistema anche in questa modalità.** La motivazione è che risponde a una domanda che
nessun archivio esterno può rispondere: *perché un allarme non è scattato*. Conserva soglia
vigente, versione della regola applicata, riferimento alle misure che l'hanno prodotto, consegne,
prese in carico, inoltri ed esiti.

Vincolo che ne discende, e che è la parte non ovvia della decisione: **la storia degli allarmi non
contiene i valori delle misure**, ma i loro riferimenti. Se le misure sono state conferite e
rimosse, la storia conserva il fatto che una regola è stata valutata su una misura identificata,
con quale esito, non il valore. È ciò che consente di conservare la ricostruibilità dell'atto senza
conservare contenuto clinico.

### Tre regole trasversali

1. **Nessun dato senza classificazione.** L'assenza di classificazione per una categoria è un
   difetto rilevabile automaticamente confrontando l'elenco delle categorie con quello delle
   politiche configurate, e fa fallire l'avvio.
2. **La cancellazione lascia traccia della cancellazione**, con il perimetro, l'istante e la
   politica applicata.
3. **La prova della presa in carico non è cancellabile con il documento**: è l'unico elemento che
   dimostra che il conferimento è avvenuto.

## Conseguenze

**Positive**

- L'assetto a non conservazione è realizzabile senza rendere il sistema non ricostruibile.
- Gli indicatori di sicurezza restano calcolabili.
- La classificazione esplicita rende la conformità verificabile invece che argomentata.

**Negative, accettate**

- Ogni nuova categoria di dato richiede una decisione di classificazione: è un passaggio in più a
  ogni estensione del modello, e va presidiato.
- La lettura di un documento conferito richiede una chiamata verso l'archivio esterno, con la sua
  latenza e la sua modalità di guasto: il comportamento in caso di indisponibilità va dichiarato.
- La storia degli allarmi senza i valori delle misure è meno leggibile per chi la consulta: va
  spiegato, altrimenti viene letto come una perdita di dati.

**Rinviato all'area di conformità**: la conferma della tassonomia rispetto agli obblighi
applicabili, e la determinazione delle durate per le categorie non già fissate.

## Riferimenti

[04 — Modello dati](../02_architecture/04-modello-dati.md#8-conservazione-e-cancellazione) ·
ADR-0013 · ADR-0020
