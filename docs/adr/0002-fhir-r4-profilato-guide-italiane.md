---
title: "ADR-0002 - FHIR R4 profilato sulle guide italiane come modello canonico di scambio"
sidebar_position: 2
description: Perché il modello canonico di scambio è FHIR R4 4.0.1 profilato secondo le guide di implementazione italiane, quali alternative sono state scartate e come si governa il loro stato preliminare.
---

# ADR-0002 - FHIR R4 profilato sulle guide italiane come modello canonico di scambio

**Stato**: accettata · **Data**: 25 agosto 2026 · **Area**: ARCH
**Decisioni di riferimento**: D13; base architetturale §3

## Contesto

Telemedic deve scambiare fatti clinici con sistemi che non lo conoscono: gestionali sanitari,
infrastrutture documentali, autorità sanitarie. Serviva scegliere la grammatica di quello scambio.

Il contesto italiano ha un fatto determinante: esiste già una **famiglia completa di guide di
implementazione nazionali per la telemedicina** - televisita, teleconsulto, teleassistenza,
telemonitoraggio - più un profilo nazionale di base, tutte su FHIR nella versione 4.0.1. Le guide
definiscono profili, insiemi di valori, sistemi di codifica e la struttura del referto. Sono, alla
data di questa decisione, in **stato preliminare**.

## Alternative valutate

### Alternativa 1 - Modello proprietario, con esportazioni verso i formati richiesti

*Vantaggi*: libertà di modellazione totale; nessuna dipendenza da specifiche altrui; nessun
problema di versione.

*Compromessi*: il sistema non sarebbe interoperabile nel proprio mercato di riferimento - cioè
avrebbe esattamente il difetto che il progetto esiste per non avere. Ogni integratore dovrebbe
scrivere un adattatore proprio. Il progetto assumerebbe l'onere di mantenere N esportazioni invece
di un modello canonico. **Scartata.**

### Alternativa 2 - FHIR R4 generico, con un pacchetto di profili nazionali facoltativo

*Vantaggi*: modello stabile; le guide preliminari non condizionano il nucleo; installazioni fuori
dall'Italia più semplici.

*Compromessi*: produce due configurazioni con comportamenti diversi, quindi due insiemi di prove e
una probabilità alta che la configurazione nazionale sia la meno provata. Soprattutto: le
divergenze fra il modello generico e quello nazionale **non sono cosmetiche** - riguardano la
struttura del referto, gli identificatori delle persone, gli insiemi di valori vincolati. Un
sistema che tratta il profilo nazionale come opzione tratta come opzionale il proprio mercato.
**Scartata.**

### Alternativa 3 - Adottare la revisione successiva dello standard

*Vantaggi*: colma alcune lacune della versione corrente, in particolare sulla rappresentazione
della modalità virtuale.

*Compromessi*: **nessuna guida nazionale è pubblicata su quella revisione**, quindi si perderebbe
la conformità nazionale per guadagnare elementi che nessun interlocutore italiano richiede.
**Scartata**, con la convivenza rinviata.

### Alternativa 4 - FHIR R4 4.0.1 profilato sulle guide nazionali come modello canonico unico

*Vantaggi*: allineamento al realm in cui il sistema opera; profili, insiemi di valori e struttura
documentale già definiti da altri; una sola configurazione da provare.

*Compromessi*: dipendenza da specifiche in stato preliminare, con revisioni possibilmente non
retrocompatibili; validatori e strumenti che devono essere fissati a versioni precise.

## Decisione

**Si adotta l'alternativa 4.** Il modello canonico di scambio è **FHIR R4 versione 4.0.1**,
profilato secondo le guide di implementazione italiane, che **prevalgono** sul modello generico in
caso di divergenza.

Lo stato preliminare è governato con tre obblighi, non attenuato:

1. **Fissaggio esplicito delle versioni** dei pacchetti di profilazione. La costruzione fallisce se
   il pacchetto risolto non coincide con quello dichiarato. Nessun riferimento a versioni mobili
   né alla costruzione continua.
2. **Ricontrollo periodico pianificato**, con esito registrato. Le guide cambiano con cadenza
   infra-annuale.
3. **Isolamento dell'impatto**: una revisione deve poter essere assorbita modificando mappatori e
   pacchetti, senza toccare le invarianti di dominio. È lo scenario di qualità SQ-06 e dipende
   dall'ADR-0003.

## Conseguenze

**Positive**

- Il sistema è interoperabile per costruzione con i sistemi allineati al realm nazionale.
- La struttura del referto, gli identificatori e gli insiemi di valori non vanno inventati.
- La conformità è verificabile con il validatore ufficiale contro i profili pubblicati.

**Negative, accettate**

- Il progetto è esposto alle revisioni di specifiche altrui in stato preliminare.
- Alcuni elementi delle guide non sono completamente determinati e vanno marcati come non
  verificati anziché assunti. Fra questi: il profilo dell'atto di televisita **non fissa il valore
  di classe** pur avendo un vincolo estensibile, e la divergenza sull'identificatore del sistema del
  codice fiscale fra guide diverse è reale e verificata (ADR-0017).
- Un'installazione fuori dal contesto italiano richiederà un pacchetto di profilazione diverso: è
  una conseguenza dichiarata e non è nel perimetro corrente.

**Chi altro è vincolato**: aree di integrazione, protocolli, dominio, conformità.

## Riferimenti

[04 - Modello dati](../02_architecture/04-modello-dati.md#2-il-modello-canonico-di-scambio) ·
ADR-0003 · ADR-0004 · ADR-0017
