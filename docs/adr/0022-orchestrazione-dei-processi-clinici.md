---
title: "ADR-0022 - Orchestrazione esplicita dei processi clinici critici"
sidebar_position: 22
description: Perché i processi a più passi che attraversano sistemi non transazionabili sono orchestrati e non coreografati, con il criterio di ripartizione e i vincoli sull'orchestratore.
---

# ADR-0022 - Orchestrazione esplicita dei processi clinici critici

**Stato**: accettata · **Data**: 25 agosto 2026 · **Area**: ARCH
**Origine**: questione rinviata a un ADR dal modulo dei fondamenti informatici

## Contesto

Alcuni fatti clinici innescano sequenze che attraversano contesti e sistemi non transazionabili: un
servizio di firma esterno, un'infrastruttura documentale, un fornitore di identità, il sistema di
origine. Non esiste una transazione che li comprenda: esiste una sequenza di passi, ciascuno dei
quali può fallire, e per alcuni dei quali il fallimento richiede di compensare i precedenti.

Il caso canonico è la chiusura della prestazione con firma e trasmissione. Se l'alimentazione
documentale fallisce definitivamente, non si può «annullare la firma»: si compensa con una
**rettifica documentale**, che è un atto di dominio e non un annullamento tecnico.

Il modulo dei fondamenti informatici ha già insegnato al lettore che i flussi clinici critici sono
orchestrati, rinviando a questo registro la conferma e i vincoli.

## Alternative valutate

### Alternativa 1 - Coreografia

Ogni contesto reagisce agli eventi altrui; nessuno conosce il processo nel suo insieme.

*Vantaggi*: accoppiamento minimo; nessun componente centrale; il processo si estende aggiungendo un
consumatore.

*Compromessi*:

- **Il processo non esiste da nessuna parte.** Non si può chiedere al sistema a che punto è, perché
  non c'è un luogo dove porre la domanda.
- Il fallimento parziale è diagnosticabile solo ricostruendo a mano la sequenza degli eventi.
- L'aggiunta di un passo con compensazione richiede di modificare più contesti, e la logica di
  compensazione si sparpaglia.
- La domanda «il referto firmato ieri alle undici è stato trasmesso?» non ha risposta immediata.

### Alternativa 2 - Orchestrazione

Un componente conosce la sequenza, invoca i passi, gestisce le compensazioni e conserva lo stato.

*Vantaggi*: lo stato del processo è **interrogabile**; il fallimento parziale è visibile; il
processo è un artefatto documentabile e provabile nel suo insieme.

*Compromessi*: un componente in più; il rischio reale che l'orchestratore accumuli logica di
dominio e diventi un secondo modello.

### Alternativa 3 - Coreografia con un osservatore che ricostruisce lo stato

*Vantaggi*: accoppiamento minimo; lo stato è comunque interrogabile.

*Compromessi*: l'osservatore deve conoscere la sequenza per ricostruirla - cioè si paga il costo
dell'orchestrazione senza averne il controllo, e non può compensare. **Scartata.**

## Decisione

**Orchestrazione esplicita per i processi clinici critici; coreografia per le propagazioni
semplici.**

La motivazione decisiva è **di dimostrabilità, non di eleganza**. In questo dominio deve essere
possibile rispondere alla domanda sullo stato di un processo senza ricostruire una sequenza di
eventi, perché quella domanda arriva da chi verifica, da chi assiste un cliente e da chi risponde di
un incidente.

### Criterio di ripartizione

| Orchestrato se | Coreografato se |
|---|---|
| Ha più di due passi che possono fallire indipendentemente | È una propagazione a un solo consumatore |
| Richiede compensazione in caso di fallimento parziale | Il fallimento del consumatore non richiede di annullare nulla |
| Il suo stato deve essere interrogabile da un operatore | Nessuno chiederà mai «a che punto è» |
| Attraversa un sistema esterno non transazionabile | Resta interno |

**Processi orchestrati individuati**: chiusura, refertazione e trasmissione; arruolamento in un
piano di monitoraggio con acquisizione dei consensi; dismissione di un tenant con esportazione e
cancellazione; rettifica di un documento già trasmesso.

### Vincoli sull'orchestratore

1. **Non contiene invarianti di dominio.** Conosce l'ordine dei passi e le compensazioni, non le
   regole. Un orchestratore che decide se un documento può essere firmato ha assorbito il dominio,
   ed è il modo tipico in cui questa scelta degenera.
2. **Lo stato è persistito e interrogabile**, con l'esito di ogni passo e il motivo di ogni
   fallimento.
3. **Ogni passo è idempotente**, perché il processo può essere ripreso.
4. **Le compensazioni sono atti di dominio**, non annullamenti tecnici.
5. **Il processo ha un termine.** Dopo la durata dichiarata entra in una coda presidiata: un
   processo che resta indefinitamente in un passo intermedio è un fallimento silenzioso.

## Conseguenze

**Positive**

- Lo stato di ogni processo critico è interrogabile.
- Le compensazioni sono in un solo luogo, quindi provabili nel loro insieme.
- L'aggiunta di un passo è una modifica localizzata.

**Negative, accettate**

- Un componente in più, con il rischio permanente di accumulo di logica: va presidiato con revisione
  esplicita, perché la degenerazione è graduale e non produce sintomi immediati.
- Quattro processi orchestrati sono pochi: il costo fisso dell'orchestrazione si ammortizza poco.
- Il **meccanismo** di realizzazione - motore dedicato, macchina a stati persistita in
  tabella, componente applicativo - **va deciso da `ARCH`** con i criteri dichiarati `[NV]`. La strategia è decisa perché vincola le altre aree; il meccanismo no.

## Riferimenti

[06 - Eventi e integrazione interna](../02_architecture/06-eventi-e-integrazione-interna.md#6-processi-a-più-passi) ·
[09 - Decisioni rinviate](../02_architecture/09-decisioni-rinviate.md#a-1---meccanismo-di-realizzazione-dellorchestrazione)
