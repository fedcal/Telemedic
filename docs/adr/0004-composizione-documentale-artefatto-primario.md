---
title: "ADR-0004 — Composizione documentale come artefatto primario del referto"
sidebar_position: 4
description: Perché il referto di una prestazione a distanza è una composizione dentro un contenitore documentale e non un referto diagnostico, e perché quest'ultimo resta come proiezione in sola lettura.
---

# ADR-0004 — Composizione documentale come artefatto primario del referto

**Stato**: accettata · **Data**: 25 agosto 2026 · **Area**: ARCH
**Decisioni di riferimento**: D13; vincolo V2

## Contesto

Il contenuto pubblico originario del progetto annunciava la produzione di un **referto
diagnostico** al termine della sessione. Le guide di implementazione nazionali modellano invece il
referto di televisita come **composizione dentro un contenitore documentale**, con codificazione del
tipo di documento, attestazione legale obbligatoria e sezioni vincolate.

C'è inoltre un vincolo di perimetro: il referto deve essere **persistenza di contenuto redatto dal
professionista**, non generazione autonoma di informazione clinica. La scelta della risorsa
influisce su questo confine più di quanto sembri.

## Alternative valutate

### Alternativa 1 — Referto diagnostico come artefatto primario

*Vantaggi*: coerenza con il contenuto pubblico già diffuso; molti sistemi terzi sanno consumarlo;
struttura più semplice.

*Compromessi*:

- **Non è allineato al realm nazionale.** Le guide modellano il referto come composizione; emettere
  un referto diagnostico significa non essere conformi al profilo di riferimento.
- **La risorsa è progettata per un caso diverso.** La sua stessa specifica indica che è adatta a
  referti di laboratorio, anatomia patologica e imaging — con risultati atomici e interpretazione —
  mentre per referti prevalentemente narrativi e con minore struttura di flusso di lavoro «la
  risorsa composizione sarebbe più appropriata».
- **Contiene elementi che invitano a superare il confine.** Ha un campo di conclusione e un campo
  di codificazione della conclusione: la loro presenza rende naturale popolarli con contenuto
  prodotto dal sistema. La composizione, che è narrativa e per sezioni, non offre lo stesso invito.
- **Non porta il paradigma documentale**: immutabilità dopo l'assemblaggio, identificativo mai
  riusato, firma applicata al contenitore. Sono precisamente le proprietà richieste da un documento
  sanitario.

### Alternativa 2 — Composizione come artefatto primario, referto diagnostico rimosso

*Vantaggi*: allineamento pieno; un solo artefatto; nessuna ambiguità sulla sede della verità.

*Compromessi*: rompe l'integrazione con i sistemi che sanno consumare solo il referto diagnostico —
categoria non trascurabile — e contraddice il contenuto pubblico senza offrire un percorso di
migrazione.

### Alternativa 3 — Composizione primaria, referto diagnostico come proiezione in sola lettura

*Vantaggi*: allineamento pieno con una sola sede della verità; compatibilità preservata per i
consumatori esistenti.

*Compromessi*: due rappresentazioni da mantenere coerenti; il rischio che un integratore scriva
sulla proiezione credendola primaria.

## Decisione

**Si adotta l'alternativa 3.**

Il pattern è: **composizione con sezioni codificate → serializzata in un contenitore documentale →
firmata → indicizzata da un riferimento documentale → esposta al sistema di origine**.

Il **referto diagnostico è una proiezione in sola lettura**, con due vincoli:

1. Il campo di conclusione porta il **testo redatto dal professionista**, mai testo prodotto dal
   sistema; il campo di codificazione della conclusione **non è popolato** se non con codici
   inseriti dal professionista.
2. La forma allegata porta il documento firmato. **La proiezione non è mai scrivibile**: un
   tentativo di scrittura è rifiutato con un esito che dichiara quale sia l'artefatto primario.

Il contenuto pubblico del progetto va allineato di conseguenza: la comunicazione che annunciava il
referto diagnostico come artefatto prodotto è **imprecisa** e la sua rettifica è materia dell'area
di prodotto.

## Conseguenze

**Positive**

- Conformità al profilo nazionale del referto di televisita.
- L'immutabilità del documento firmato è una proprietà del formato di scambio, non solo
  un'invariante applicativa.
- Il confine fra registrazione e interpretazione è più difficile da attraversare per distrazione.
- I consumatori esistenti continuano a funzionare.

**Negative, accettate**

- Due rappresentazioni; il rischio di divergenza è contenuto dal fatto che la seconda è generata
  dalla prima e non è scrivibile.
- La comunicazione pubblica va rettificata.
- La struttura per sezioni della composizione è più rigida: l'aggiunta di una sezione non prevista
  dal profilo richiede un'estensione, non un campo libero. È un costo e insieme una garanzia.

**Chi altro è vincolato**: aree di integrazione, prodotto, protocolli, conformità.

## Riferimenti

[04 — Modello dati](../02_architecture/04-modello-dati.md#23-il-documento-sanitario-composizione-non-referto-diagnostico) ·
ADR-0002 · ADR-0005
