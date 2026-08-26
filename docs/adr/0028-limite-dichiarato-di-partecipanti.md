---
title: "ADR-0028 - Limite dichiarato di partecipanti alla sessione media"
sidebar_position: 28
description: Perché la sessione resta a maglia senza componente centrale, perché il limite di partecipanti è dichiarato e applicato dal codice, e perché il numero dipende da una misura e non da una preferenza.
---

# ADR-0028 - Limite dichiarato di partecipanti alla sessione media

**Stato**: **parzialmente accettata - il numero resta rinviato a una misura** · **Data**: 25 agosto 2026 · **Area**: ARCH
**Origine**: questione posta dall'area tecnica

## Contesto

La topologia a maglia senza componente centrale è **l'unica che preserva la cifratura fino agli
estremi**: ogni partecipante cifra verso ogni altro e nessun nodo intermedio possiede le chiavi.
Il suo costo cresce però con il numero di partecipanti, perché ciascuno trasmette una copia del
proprio flusso a ciascun altro, e il collo di bottiglia è la banda di trasmissione del
partecipante peggio connesso - che in questo dominio è tipicamente l'assistito su rete mobile.

Ogni alternativa alla maglia introduce un componente che **termina la cifratura**. È quindi una
decisione di sicurezza prima che di ingegneria, e ha la stessa natura della scelta sulla
registrazione lato server.

Il terzo partecipante non è un caso marginale: l'interprete è la misura alternativa dichiarata per
una non conformità di accessibilità nota, e il caregiver è parte della popolazione di riferimento.

## Alternative valutate

### Alternativa 1 - Nessun limite dichiarato, degrado naturale

Il sistema accetta partecipanti finché la rete regge.

*Compromesso decisivo*: **il degrado silenzioso è un difetto, non una funzione.** Il
partecipante eccedente non riceve un errore comprensibile: riceve una sessione che funziona male,
e il professionista non sa se il problema è la rete dell'assistito o il numero di presenti. In un
contesto clinico questo produce l'abbandono dell'atto senza che nessuno ne conosca la causa.
**Scartata.**

### Alternativa 2 - Componente centrale che ridistribuisce i flussi

*Vantaggi*: il numero di partecipanti cessa di essere un vincolo di banda.

*Compromesso decisivo*: il componente **termina la cifratura**. Il sistema avrebbe una terza
modalità operativa con proprietà di sicurezza diverse, oltre alle due già esistenti, e la
proprietà predefinita non sarebbe più quella più forte. **Scartata per la versione corrente**, con
la riapertura possibile solo come decisione di sicurezza esplicita.

### Alternativa 3 - Maglia, con limite dichiarato e applicato

*Vantaggi*: preserva la proprietà di sicurezza; il comportamento al limite è comprensibile.

*Compromessi*: il limite è un vincolo funzionale reale; il numero non è arbitrario e va misurato.

## Decisione

**Si adotta l'alternativa 3, con tre parti decise e una rinviata.**

**Decisa - la topologia.** La sessione resta a maglia senza componente centrale. Nessun componente
che termini la cifratura è introdotto nella versione corrente al solo scopo di aumentare il numero
di partecipanti. La modalità con registrazione lato server resta l'unica eccezione, ed è tale
perché è dichiarata, consentita e segnalata.

**Decisa - il limite è dichiarato e applicato.** Esiste un limite massimo di partecipanti,
**scritto nella documentazione e applicato dal codice**, con un errore comprensibile al
partecipante eccedente che ne spiega la ragione e indica l'alternativa. Un limite dichiarato è una
scelta di ingegneria; un degrado silenzioso è un difetto.

**Decisa - la forma della dichiarazione.** Il limite è **configurazione con un massimo imposto**,
non costante di codice: un tenant può abbassarlo, mai alzarlo oltre il massimo. Il massimo imposto
è quello derivato dalla misura.

**Rinviata - il numero.** `[NV]` Il valore massimo dipende dal budget di banda in trasmissione del
partecipante peggio connesso, e quel budget si misura su un dispositivo e una rete di riferimento
che non sono ancora dichiarati. Fissare il numero prima della misura significherebbe scriverlo per
preferenza. Il criterio è dichiarato: **il massimo è il numero oltre il quale il partecipante di
riferimento non regge il proprio budget di trasmissione con margine**, misurato e non stimato.

## Conseguenze

**Positive**

- La proprietà di sicurezza predefinita resta la più forte.
- Il comportamento al limite è comprensibile e diagnosticabile.
- Il terzo partecipante - interprete o caregiver - resta supportato se la misura lo consente, il
  che è condizione della misura alternativa dichiarata per l'accessibilità.

**Negative, accettate**

- Il limite è un vincolo funzionale reale, e alcuni scenari organizzativi non saranno serviti.
- Se la misura dovesse escludere il terzo partecipante, la misura alternativa per l'accessibilità
  andrebbe riesaminata: è una dipendenza da segnalare, non da scoprire.
- La decisione di introdurre un componente che termina la cifratura resta possibile in futuro, ma è
  una decisione di sicurezza e di prodotto, non un'estensione tecnica.

## Riferimenti

ADR-0014 · [09 - Decisioni rinviate](../02_architecture/09-decisioni-rinviate.md#c-2---introdurre-un-componente-che-termina-la-cifratura-per-aumentare-i-partecipanti)
