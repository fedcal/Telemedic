---
title: "ADR-0015 - Delega esplicita, mai impersonificazione"
sidebar_position: 15
description: Perché un'operazione compiuta da un sistema per conto di una persona registra entrambe le identità, e perché l'impersonificazione è vietata anche quando semplificherebbe il codice.
---

# ADR-0015 - Delega esplicita, mai impersonificazione

**Stato**: accettata · **Data**: 25 agosto 2026 · **Area**: ARCH
**Decisioni di riferimento**: D18; vincoli V-165 dell'area integrazione e V-154 dell'area sicurezza

## Contesto

Un professionista è autenticato nel gestionale dell'integratore. Preme un pulsante e deve comparire
la stanza della prestazione, dentro l'interfaccia del gestionale, **senza un secondo accesso**.
Telemedic deve però sapere chi è, in quale tenant opera, che cosa può fare, e che l'affermazione
«questo è il professionista X» proviene da un emittente fidato e non dal browser.

L'ultima condizione esclude qualunque soluzione in cui il browser trasporti l'asserzione: sarebbe
manipolabile. La propagazione avviene da backend a backend.

Resta la domanda di come rappresentare, nel contesto autorizzativo interno, il fatto che un sistema
sta agendo per conto di una persona.

## Alternative valutate

### Alternativa 1 - Impersonificazione

Il token emesso rappresenta il solo professionista. Il sistema che ha effettuato lo scambio diventa
indistinguibile dalla persona.

*Vantaggi*: il codice di autorizzazione tratta un solo soggetto; nessuna nozione aggiuntiva; il
registro ha una struttura più semplice.

*Compromesso decisivo*: **cancella l'informazione «quale sistema ha agito per conto di quale
persona»**. È precisamente la domanda a cui il registro deve poter rispondere. In caso di
contestazione - un accesso anomalo, un'operazione contestata - la risposta non esiste e non è
ricostruibile, perché non è mai stata registrata. Il difetto si scopre nel momento in cui serve.

### Alternativa 2 - Registrare il sistema chiamante e non la persona

*Compromesso*: il registro saprebbe che «il gestionale ha letto un referto», senza sapere per conto
di chi. Inutilizzabile per la sorveglianza degli accessi ai dati sanitari. **Scartata.**

### Alternativa 3 - Delega esplicita: entrambe le identità nel contesto autorizzativo

Il token porta il soggetto per conto del quale si agisce **e** l'attore che agisce, in una struttura
che li tiene distinti e che sopporta l'annidamento quando la catena ha più anelli.

*Vantaggi*: il registro risponde alla domanda; la catena di deleghe annidate è preservata; la
distinzione fra delega e impersonificazione è esplicita nel dato, non nella convenzione.

*Compromessi*: la logica di autorizzazione tratta due soggetti; il registro ha due campi; ogni
integrazione va configurata con un ancoraggio di fiducia.

## Decisione

**Si adotta l'alternativa 3, senza eccezioni.**

1. **La delega è sempre rappresentata esplicitamente.** L'impersonificazione non è ammessa in alcun
   percorso.
2. **La fiducia è per tenant.** In fase di attivazione si registra, per ciascun tenant: emittente
   ammesso, indirizzo delle chiavi pubbliche in lista consentita, algoritmi ammessi, destinatario
   atteso, mappatura dei claim. Il legame fra il principale chiamante, il tenant e l'ancoraggio di
   fiducia è **l'unica via**: non si accetta un'asserzione il cui emittente non sia l'ancoraggio del
   tenant del chiamante. Senza questo controllo, l'integratore A potrebbe presentare un'asserzione
   emessa dal fornitore di identità dell'integratore B.
3. **L'identità interna è derivata deterministicamente** dalla coppia emittente più soggetto
   dell'asserzione originale, non inventata. Rispetta il principio per cui il sistema non è il
   detentore dell'anagrafica e garantisce che due omonimi provenienti da integratori diversi non
   collidano.
4. **Il livello di garanzia è qualificato dalla provenienza**: eseguito dal sistema oppure riferito
   dall'integratore. Il livello **non viaggia nella struttura della delega**, che esprime chi agisce
   per conto di chi e non con quale forza è stata accertata l'identità. Un livello **riferito** non
   soddisfa un requisito di autenticazione forte.
5. **Nessuna operazione clinica senza contesto di delega**: un principale applicativo che agisce
   senza indicare per conto di chi non può compiere operazioni cliniche.

## Conseguenze

**Positive**

- Il registro risponde alla domanda «quale sistema ha agito per conto di quale persona».
- Le catene di delega annidate sono rappresentabili senza perdita.
- La revoca di un integratore non richiede di ricostruire quali persone abbia rappresentato: è
  scritto in ogni voce.

**Negative, accettate**

- La logica di autorizzazione tratta due soggetti e ogni regola deve dichiarare a quale si applica.
- Ogni attivazione richiede la configurazione di un ancoraggio di fiducia: è attrito di
  integrazione, ed è la contropartita della sicurezza.
- Il codice che realizza lo scambio è **codice di sicurezza critico**: va sottoposto a revisione
  esterna indipendente e a prove di abuso dedicate, non trattato come un adattatore.

## Riferimenti

[02 - Contesti delimitati](../02_architecture/02-contesti-delimitati.md#ctx-01---identità-e-accessi) ·
[07 - Tracciamento](../02_architecture/07-tracciamento-e-registro-immutabile.md#31-il-contenuto-della-voce)
