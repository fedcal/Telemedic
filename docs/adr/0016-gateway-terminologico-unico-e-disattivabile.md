---
title: "ADR-0016 - Gateway terminologico unico, disattivabile, senza cache persistita e senza identificativi"
sidebar_position: 16
description: Come il sistema accede alle terminologie cliniche, perché resta pienamente funzionale senza quelle a licenza onerosa, e perché la sovranità di questa dipendenza si soddisfa per assenza di dato.
---

# ADR-0016 - Gateway terminologico unico, disattivabile, senza cache persistita e senza identificativi

**Stato**: accettata · **Data**: 25 agosto 2026 · **Area**: ARCH
**Decisioni di riferimento**: D31, D32, D33; vincolo [V-03](../11_registri/01-vincoli-in-vigore.md#v-03) di bacheca; [V-151](../11_registri/01-vincoli-in-vigore.md#v-151) e [V-157](../11_registri/01-vincoli-in-vigore.md#v-157) posti dall'area di sicurezza
**Origine**: questione posta dal modulo dei fondamenti, parte residua assegnata a quest'area

## Contesto

Le terminologie cliniche hanno regimi di licenza radicalmente diversi. Alcune convivono nei
sorgenti del progetto con la sola attribuzione; altre richiedono una collocazione separata con
licenza propria; altre ancora richiedono l'acquisizione o l'interrogazione a esercizio a cura di chi
installa; alcune sono escluse del tutto e ne restano utilizzabili solo l'identificativo del sistema
e il codice.

Il caso più severo comporta che il vincolo di licenza si perfezioni **scaricando o accedendo** al
contenuto, che una cache persistita di risposte costituisca un derivato, e che la fee sia dovuta
per sito anche in ambienti non di produzione. Un altro caso comporta che le traduzioni delle
etichette siano derivati i cui diritti sono assegnati al proprietario della terminologia.

L'area di sicurezza ha già stabilito che il servizio terminologico esterno è **componente di terze
parti a esercizio**, che non riceve identificativi dell'assistito, e che non ammette cache
persistita. Restava a quest'area la scelta del **punto di risoluzione** e del **contratto del
gateway**.

## Alternative valutate

### Alternativa 1 - Ogni contesto interroga la propria fonte

*Vantaggi*: nessun componente intermedio; ogni contesto ottimizza il proprio accesso.

*Compromessi*: la politica di licenza andrebbe applicata in N punti; la disattivazione di un
sistema di codifica richiederebbe N modifiche; il divieto di cache persistita sarebbe verificabile
solo ispezionando ogni contesto; il divieto di trasmettere identificativi andrebbe imposto N volte.
**Scartata.**

### Alternativa 2 - Contenuto terminologico incluso nella distribuzione

*Vantaggi*: nessuna dipendenza a esercizio; nessuna latenza.

*Compromessi*: incompatibile con i regimi di licenza di più terminologie; renderebbe il progetto
distributore di contenuto altrui; per almeno un caso la condizione che il contenuto non sia
accessibile se non a utenti autorizzati è **incompatibile con un repository pubblico**.
**Scartata.**

### Alternativa 3 - Gateway unico, con politica per sistema di codifica

*Vantaggi*: un solo punto in cui la politica è applicata, verificata e modificata; disattivazione
per sistema; contratto stabile che nasconde la diversità delle fonti.

*Compromessi*: un componente in più sul percorso di validazione; un punto singolo di guasto da
progettare con un degrado dichiarato.

## Decisione

**Si adotta l'alternativa 3**, con sei vincoli.

1. **Punto unico di accesso.** Nessun contesto interroga direttamente una fonte terminologica.
   Verifica automatica bloccante.
2. **Nessuna cache persistita su disco** per i sistemi la cui licenza non consente derivati. La
   cache in memoria con durata breve è ammessa; il persistere su disco no.
3. **Nessun identificativo dell'assistito** e nessun contesto clinico lascia il perimetro verso una
   fonte esterna. **La sovranità di questa dipendenza si soddisfa per assenza di dato, non per
   collocazione**: se l'interrogazione non trasporta dati riferibili a una persona, la collocazione
   della fonte cessa di essere il criterio determinante.
4. **Disattivazione per sistema di codifica**, non globale, come configurazione di installazione.
5. **Il sistema è pienamente funzionale con i sistemi a licenza onerosa disattivati.** Nessun
   percorso principale li richiede. È lo scenario di qualità SQ-07, verificato eseguendo la suite
   funzionale completa con la disattivazione attiva. Il costo è dichiarato apertamente: i codici
   appartenenti a quel sistema non si validano.
6. **La versione della fonte usata per una validazione è registrata insieme all'esito.** Una
   validazione non ripetibile non è un'evidenza.

**Degrado dichiarato**: se il gateway è irraggiungibile, il sistema **si avvia comunque** e i
percorsi che dipendono dalla validazione applicano la politica di degrado configurata - accettare
con marcatura di non validato, oppure rifiutare - mai fallire in modo indistinto.

## Conseguenze

**Positive**

- La politica di licenza è applicata e verificabile in un solo punto.
- L'installazione non richiede alcun contratto di licenza terminologica per essere pienamente
  operativa.
- Il vincolo di sovranità è soddisfatto senza imporre la collocazione della fonte.

**Negative, accettate**

- Un componente in più sul percorso di validazione, con la propria latenza.
- L'assenza di cache persistita comporta interrogazioni ripetute e quindi latenza e carico
  maggiori: è il prezzo del rispetto della licenza.
- Il gateway è un punto singolo di guasto, mitigato dal degrado dichiarato.
- Il servizio terminologico esterno è un **fornitore rilevante di secondo livello** che il cliente
  può essere tenuto a dichiarare nominativamente a un'autorità: il progetto fornisce la scheda con
  i dati necessari.
- Va documentato senza attenuanti che l'uso di una fonte esterna **non esonera** chi installa dagli
  obblighi di licenza che gli derivano dal creare o analizzare dati con quella terminologia.

## Riferimenti

[02 - Contesti delimitati](../02_architecture/02-contesti-delimitati.md#ctx-10---terminologie) ·
[04 - Modello dati](../02_architecture/04-modello-dati.md#6-terminologie-nel-modello-dati) ·
ADR-0019
