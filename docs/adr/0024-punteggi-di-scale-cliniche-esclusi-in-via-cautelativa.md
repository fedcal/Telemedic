---
title: "ADR-0024 - Punteggi di scale e questionari clinici esclusi dal modello in via cautelativa"
sidebar_position: 24
description: Perché il sistema conserva le risposte ai questionari strutturati ma non ne calcola i punteggi finché la questione delle licenze delle scale validate non è chiusa.
---

# ADR-0024 - Punteggi di scale e questionari clinici esclusi dal modello in via cautelativa

**Stato**: accettata, provvisoria · **Data**: 25 agosto 2026 · **Area**: ARCH
**Origine**: questione posta dal modulo dei fondamenti all'`COMP` e a quest'area

## Contesto

Il perimetro del telemonitoraggio comprende i **questionari strutturati** compilati dall'assistito o
dal caregiver. Molti di questi strumenti sono **scale cliniche validate**, e le scale validate hanno
**licenze proprie**, distinte da quelle delle terminologie: alcune richiedono un'autorizzazione
d'uso, altre vietano la modifica o la traduzione, altre ancora sono a pagamento per uso in
prodotti commerciali.

La politica terminologica del progetto, che assegna ogni terminologia a un regime di licenza
verificato sulla fonte primaria, **non copre formalmente le scale e i punteggi**. La questione è
stata posta con una tempistica precisa: va chiusa **prima** che venga scritto il primo motore di
calcolo.

## Alternative valutate

### Alternativa 1 - Realizzare il calcolo dei punteggi e verificare le licenze dopo

*Vantaggi*: la funzione è disponibile subito; il valore per l'utente è immediato.

*Compromesso*: se la verifica successiva accertasse che uno strumento non è utilizzabile, si
tratterebbe di **rimuovere una funzione già promessa** e già usata, con dati storici calcolati con
un algoritmo che non si può più eseguire. È il tipo di errore che costa di più correggere.
**Scartata.**

### Alternativa 2 - Escludere del tutto i questionari strutturati

*Compromesso*: sarebbe una riduzione del perimetro funzionale approvato, che li comprende
esplicitamente. Sproporzionata rispetto al problema, che riguarda il calcolo del punteggio e non la
raccolta della risposta. **Scartata.**

### Alternativa 3 - Rappresentare e conservare le risposte, non calcolare i punteggi

*Vantaggi*: la funzione di raccolta è disponibile; nessun rischio di licenza, perché conservare la
risposta di una persona a una domanda non è riprodurre lo strumento né eseguirne l'algoritmo; la
decisione è reversibile, perché il calcolo si aggiunge senza migrare i dati raccolti.

*Compromessi*: il professionista che si aspetta un punteggio deve calcolarlo altrove; la funzione è
percepita come incompleta.

## Decisione

**Si adotta l'alternativa 3, in via cautelativa e provvisoria.**

1. Il modello di dominio **rappresenta e conserva la risposta a un questionario strutturato**, con
   il riferimento a una **versione immutabile dello strumento**, l'istante e il soggetto compilante.
2. Il modello **non rappresenta punteggi di scale cliniche** e il contesto del telemonitoraggio
   **non li calcola**.
3. Il **contenuto dello strumento** - testo delle domande, opzioni di risposta, algoritmo di calcolo
   - **non è incluso nella distribuzione**: è dato di configurazione per tenant, caricato da chi
   installa, che è il soggetto che ha o può ottenere la licenza d'uso. È la stessa scelta adottata
   per i cataloghi di dati di riferimento.
4. La decisione è **provvisoria** e cade quando l'`COMP` chiude la questione,
   estendendo formalmente la politica di licenza a scale e punteggi.

**Criterio suggerito per la chiusura**: la stessa tassonomia a regimi già adottata per le
terminologie - coesistenza piena, collocazione separata con licenza propria, acquisizione a carico
di chi installa, esclusione totale - applicata **strumento per strumento**, verificando la licenza
primaria e non la dichiarazione del contenitore che lo ricomprende. Il principio è già acquisito in
altra sede: una dichiarazione di libera riutilizzabilità apposta su un contenitore **non dispone dei
diritti di terzi** sul contenuto ricompreso.

## Conseguenze

**Positive**

- Nessun rischio di licenza assunto prima della verifica.
- La raccolta delle risposte è disponibile, che è la parte del valore che non dipende dallo
  strumento.
- La decisione è reversibile senza migrazione: aggiungere il calcolo su risposte già conservate è
  possibile, il contrario no.

**Negative, accettate**

- La funzione è percepita come incompleta da chi si aspetta il punteggio.
- Il caricamento dello strumento è un passaggio in più a carico di chi installa, e va documentato
  nella lista di ciò che il cliente deve fornire.
- Se il calcolo verrà introdotto, andrà anche affrontata la questione del confine fra registrazione
  e interpretazione: un punteggio calcolato dal sistema e presentato al professionista è più vicino
  a quel confine di una risposta conservata. La valutazione andrà fatta allora, non presunta ora.

## Riferimenti

[03 - Modello di dominio](../02_architecture/03-modello-di-dominio.md#10-che-cosa-il-modello-non-rappresenta) ·
[09 - Decisioni rinviate](../02_architecture/09-decisioni-rinviate.md#b-3---estensione-della-politica-terminologica-alle-scale-e-ai-questionari-clinici-validati) ·
ADR-0016 · ADR-0018
