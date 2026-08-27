---
title: "ADR-0029 - Registro di fiducia unico per tenant"
sidebar_position: 29
description: Perché emittenti ammessi, origini per l'incorporamento, origini per la condivisione fra origini, destinazioni in uscita ed elenco consentito del mediatore stanno in un solo registro, e perché registri separati divergono sempre a favore di chi attacca.
---

# ADR-0029 - Registro di fiducia unico per tenant

**Stato**: accettata · **Data**: 25 agosto 2026 · **Area**: ARCH
**Origine**: questioni convergenti poste dall'`INTEG` e dall'area di sicurezza
**Vincoli di riferimento**: [V-157](../11_registri/01-vincoli-in-vigore.md#v-157) dell'area di sicurezza; [V-160](../11_registri/01-vincoli-in-vigore.md#v-160) dell'`INTEG`

## Contesto

Un integratore compare in cinque elenchi diversi del sistema:

1. **emittenti di identità ammessi**, con indirizzo del materiale di chiave pubblica, algoritmi
   ammessi, destinatario atteso e mappatura dei claim;
2. **origini ammesse per l'incorporamento** del componente incorporabile;
3. **origini ammesse per la condivisione di risorse fra origini**;
4. **destinazioni ammesse per i messaggi in uscita**;
5. **elenco consentito del mediatore unico di uscita**.

Sono cinque decisioni sullo stesso soggetto: **di chi ci fidiamo, per fare che cosa, in quale
tenant**. La forma con cui sono conservate determina se restano coerenti.

## Alternative valutate

### Alternativa 1 - Cinque elenchi indipendenti

*Vantaggi*: ciascun componente possiede il proprio elenco e non dipende dagli altri; il modello di
ciascuno è ottimizzato per il proprio uso.

*Compromesso decisivo*: **divergono sempre, e la divergenza è sistematicamente a favore di chi
attacca.** Un'origine rimossa da un elenco e non dall'altro **resta valida sul secondo**. Non
esiste una revoca che sia atomica su cinque elenchi mantenuti separatamente, e la verifica della
coerenza è un controllo che qualcuno deve ricordarsi di fare. **Scartata.**

### Alternativa 2 - Un elenco unico, indifferenziato

Un solo elenco di soggetti fidati, senza distinzione di capacità.

*Compromesso*: fidarsi di un soggetto come emittente di identità non è fidarsi di lui come
destinazione di messaggi in uscita, e le due fiducie hanno conseguenze diverse. Un elenco
indifferenziato costringe a concedere il massimo comune. **Scartata.**

### Alternativa 3 - Un registro unico per tenant, con capacità esplicite per voce

Una sola fonte di verità; ogni voce dichiara **quali capacità** sono concesse a quel soggetto.

*Vantaggi*: revoca atomica; nessuna divergenza possibile; la domanda «di che cosa ci fidiamo di
questo soggetto» ha una risposta sola e completa.

*Compromessi*: il registro diventa un componente critico; le sue letture stanno sul percorso di
ogni verifica; il suo modello deve accogliere capacità eterogenee.

## Decisione

**Si adotta l'alternativa 3.**

1. **Una sola fonte di verità per tenant.** Non necessariamente una sola tabella: una sola
   **sorgente**, da cui gli elenchi operativi dei singoli componenti sono **derivati**, mai
   redatti a mano. Un elenco derivato che diverge dalla sorgente è un difetto rilevabile.
2. **Ogni voce dichiara le capacità concesse**, dalle cinque famiglie sopra, con validità
   temporale.
3. **La revoca è atomica sulla sorgente** e si propaga a tutti gli elenchi derivati; la propagazione
   ha un ritardo dichiarato e sorvegliato, e la revoca invalida le memorizzazioni anziché attenderne
   la scadenza.
4. **Il legame principale chiamante → tenant → ancoraggio di fiducia è l'unica via di
   validazione.** Non si accetta un'asserzione il cui emittente non sia l'ancoraggio del tenant del
   chiamante: senza questo controllo, l'integratore A può presentare un'asserzione emessa dal
   fornitore di identità dell'integratore B.
5. **L'indirizzo del materiale di chiave pubblica non si segue mai ciecamente.** Un indirizzo
   presente nell'intestazione di un'asserzione va **confrontato con quello registrato** per quel
   soggetto, e se non coincide la richiesta è rifiutata. Il recupero passa comunque dal mediatore
   unico di uscita.
6. **Il registro è per tenant**, e non esiste una voce valida per tutti i tenant.

## Conseguenze

**Positive**

- La revoca è effettiva e completa.
- La domanda posta da chi verifica - «chi può fare che cosa su questo tenant» - ha una risposta in
  un solo luogo.
- L'elenco consentito del mediatore di uscita non è un elenco a parte che qualcuno dimentica di
  aggiornare.

**Negative, accettate**

- Il registro è componente critico: la sua indisponibilità blocca le verifiche, e va reso ridondante
  con memorizzazione a durata brevissima.
- Il modello deve accogliere capacità eterogenee, quindi è più astratto di cinque elenchi
  specializzati e meno immediato da leggere.
- La propagazione agli elenchi derivati ha un ritardo, che va dichiarato e sorvegliato: un ritardo
  non sorvegliato è una finestra di validità residua invisibile.

## Riferimenti

ADR-0015 · ADR-0025 ·
[02 - Contesti delimitati](../02_architecture/02-contesti-delimitati.md#ctx-11---interoperabilità-in-uscita)
