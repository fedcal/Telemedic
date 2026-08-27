---
title: Registri - indice e orientamento
sidebar_position: 1
description: "Che cosa contengono i registri dei vincoli e delle questioni, che cosa non contengono, e come si legge una sigla citata altrove nella documentazione."
---

# Registri - indice e orientamento

> **Un rinvio senza bersaglio non e' un rinvio.**
> Quest'area esiste perche' la documentazione di questo progetto cita, in prosa e come vigenti,
> oltre duecento sigle di vincolo e di questione. Fino al 27 agosto 2026 quelle sigle vivevano in
> un file del contesto di lavoro interno che non veniva pubblicato: chi leggeva la documentazione
> trovava il rinvio e non aveva alcun modo di raggiungere cio' a cui rinviava.

## 1. Che cosa e' quest'area e che cosa non e'

Quest'area risponde a una domanda sola: **che cosa dice la sigla che ho appena letto**. Non
contiene requisiti - quelli sono in [`docs/03_functional/`](../03_functional/00-indice.md) - non
contiene decisioni architetturali - quelle sono negli [ADR](../adr/README.md) - e non contiene
traguardi ne' rischi di programma, che appartengono alla
[roadmap](../09_roadmap/00-indice.md).

| # | Pagina | A quale domanda risponde |
|---|---|---|
| 01 | [Vincoli in vigore](./01-vincoli-in-vigore.md) | Che cosa impone la sigla `V-` che ho letto, chi l'ha emessa, a quali aree si applica |
| 02 | [Questioni aperte](./02-questioni-aperte.md) | Che cosa e' ancora irrisolto sotto la sigla `Q-` che ho letto, chi l'ha sollevato, a che punto e' |
| 03 | [Vincoli fondanti](./03-vincoli-fondanti.md) | Che cosa dicono i sei vincoli senza trattino - `V1`…`V6` - che tutta la documentazione cita |

## 2. Come si legge una sigla

Le sigle appartengono a **due famiglie distinte**, e la distinzione non e' tipografica.

I **vincoli fondanti** si scrivono senza trattino - `V1`, `V2`, `V3`, `V4`, `V5`, `V6` - e sono i
sei impegni che definiscono il progetto: sovranita' del dato, separazione dal perimetro del
dispositivo medico, integrabilita' totale, consapevolezza del tenant, auditabilita' immutabile,
usabilita' e accessibilita'. Sono dichiarati in
[Vincoli fondanti](./03-vincoli-fondanti.md), sono in numero chiuso e non cambiano.

I **vincoli e le questioni fra aree** si scrivono con il trattino e un numero - `V-160`, `Q-135` -
e sono il prodotto del lavoro fra le aree del progetto: un'area emette un vincolo che le altre
devono rispettare, oppure solleva una questione che un'altra area deve decidere. Sono quelli
registrati in quest'area.

## 3. La numerazione, e perche' ha dei buchi

I numeri **non sono consecutivi**, e il vuoto non e' una lacuna: e' la struttura. I numeri da 1 a
12 appartengono ai vincoli emessi all'origine dall'orchestrazione e dalla guida; dal 110 in su lo
spazio e' diviso in **blocchi da dieci, uno per area** - la sicurezza in `V-150`…`V-157`,
l'integrazione in `V-160`…`V-166`, e cosi' via - cosi' che due aree che lavorano nello stesso
momento non possano coniare lo stesso numero.

L'intervallo da 13 a 109 e' **vuoto per una ragione storica che vale la pena conoscere**, perche'
spiega un difetto che questa documentazione ha portato per mesi. All'inizio ogni area numerava per
conto proprio a partire da 13, e la stessa sigla designava cose diverse a seconda di chi la
scriveva. Quando la numerazione e' stata globalizzata in blocchi, la tabella e' stata riscritta e
**il corpus no**: settantasei citazioni hanno continuato a nominare i numeri vecchi. Sono state
corrette il 27 agosto 2026, e da allora un controllo di costruzione verifica che ogni sigla citata
nella documentazione risolva in questi registri, in entrambe le lingue.

## 4. Che cosa quest'area non garantisce

Il registro dice **che cosa una voce impone e a che punto e'**, non se sia stata realizzata. Un
vincolo in vigore e' un impegno vincolante per le aree, non l'attestazione che il sistema lo
soddisfi gia': il progetto e' in fase di progettazione e non esiste ancora codice applicativo.
Per che cosa esiste e che cosa no si veda [Stato e limiti](../00_overview/04-stato-e-limiti.md).
