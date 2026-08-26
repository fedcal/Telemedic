---
title: "ADR-0030 - Le due proiezioni del piano di telemonitoraggio derivano da un'unica fonte"
sidebar_position: 30
description: Perché la forma eseguibile del piano e la forma documentale destinata al fascicolo sono generate dallo stesso artefatto, e perché la loro divergenza sarebbe un difetto di sicurezza del paziente.
---

# ADR-0030 - Le due proiezioni del piano di telemonitoraggio derivano da un'unica fonte

**Stato**: accettata · **Data**: 25 agosto 2026 · **Area**: ARCH
**Origine**: questione posta dall'area di dominio a quest'area e all'area di integrazione

## Contesto

Il piano di telemonitoraggio deve esistere in due forme.

La **forma eseguibile** è quella che il motore di valutazione usa per confrontare le misure con le
regole. È strutturata, precisa, priva di ambiguità.

La **forma documentale** è quella che va al fascicolo come tipologia dedicata, e il tracciato
richiesto la vuole in **forma testuale descrittiva** - le regole di comportamento in caso di
superamento delle soglie, espresse in linguaggio naturale.

Se le due sono redatte separatamente, divergono. E la divergenza fra **ciò che il piano dichiara e
ciò che il sistema fa** non è un difetto di documentazione: è un difetto di sicurezza del paziente,
perché il professionista che legge il documento crede di sapere quando sarà avvisato.

## Alternative valutate

### Alternativa 1 - Redazione separata delle due forme

Il professionista configura le regole e scrive il testo descrittivo.

*Vantaggi*: il testo è nel linguaggio del professionista, adatto al lettore.

*Compromesso decisivo*: **divergono, e la divergenza è invisibile.** Nessun controllo può accorgersi
che il testo dice «avviso oltre un certo valore» mentre la regola configurata usa una finestra di
persistenza. Il difetto emerge quando un allarme non scatta e qualcuno rilegge il documento.
**Scartata.**

### Alternativa 2 - Solo la forma eseguibile, documento generato come dump strutturato

*Vantaggi*: nessuna divergenza possibile.

*Compromesso*: il tracciato richiede forma testuale descrittiva, e un elenco di costrutti
strutturati non la soddisfa. Inoltre il documento sarebbe illeggibile per il destinatario umano.
**Scartata.**

### Alternativa 3 - Fonte unica, due proiezioni generate

L'artefatto autoritativo è il piano nella sua forma dichiarativa; **entrambe** le proiezioni sono
generate da esso.

*Vantaggi*: divergenza impossibile per costruzione; il testo resta leggibile perché la generazione
usa formulazioni redatte e verificate per ciascun costrutto.

*Compromessi*: il testo generato è meno adattabile di uno scritto a mano; serve una formulazione
approvata per ciascun costrutto, in ciascuna lingua.

## Decisione

**Si adotta l'alternativa 3.** La generazione vive **nel contesto del telemonitoraggio**, che è il
proprietario del piano, non nel contesto documentale e non nel livello anticorruzione: la forma
documentale è una **serializzazione del dataset canonico** del piano, coerente con la regola
generale sulle serializzazioni sostituibili.

1. **L'artefatto autoritativo è il piano dichiarativo**, versionato con validità temporale.
2. **Entrambe le proiezioni sono generate** e nessuna delle due è scrivibile direttamente.
3. **Ciascun costrutto del linguaggio ha una formulazione testuale approvata**, versionata insieme
   al costrutto e tradotta. La formulazione è materiale rivolto a un lettore clinico e va verificata
   per leggibilità come tale.
4. **Il documento porta la versione del piano da cui è stato generato.** È ciò che consente, a
   distanza, di verificare che il documento conferito corrisponda alla versione allora vigente.
5. **Un'annotazione libera del professionista è ammessa e resta distinta**: si aggiunge al testo
   generato, non lo sostituisce, ed è marcata come annotazione. Senza questa possibilità il
   professionista perderebbe la capacità di spiegare il perché clinico, che il costrutto non
   esprime.

## Conseguenze

**Positive**

- La divergenza fra ciò che il piano dichiara e ciò che il sistema fa è impossibile per costruzione.
- Il documento conferito è tracciabile alla versione del piano.
- L'aggiunta di un costrutto porta con sé la propria formulazione: non si può aggiungere un
  costrutto senza saper dire che cosa fa.

**Negative, accettate**

- Il testo generato è meno naturale di uno scritto a mano, e la sua qualità dipende interamente
  dalla cura delle formulazioni.
- Ogni costrutto richiede una formulazione approvata in ciascuna lingua: è lavoro che cresce con il
  linguaggio e va messo in conto a ogni ampliamento.
- L'annotazione libera è un canale attraverso cui può rientrare del contenuto non generato: va
  marcata visibilmente come tale, altrimenti il lettore non distingue ciò che il sistema garantisce
  da ciò che il professionista ha aggiunto.

## Riferimenti

ADR-0026 · ADR-0005 ·
[04 - Modello dati](../02_architecture/04-modello-dati.md#3-il-dataset-canonico-dei-documenti)
