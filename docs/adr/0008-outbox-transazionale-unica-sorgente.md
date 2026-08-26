---
title: "ADR-0008 - Outbox transazionale come unica sorgente degli eventi"
sidebar_position: 8
description: Perché ogni evento nasce da una scrittura nella stessa transazione del dato, quali difetti elimina, quali alternative sono state scartate e che cosa deliberatamente non passa dall'outbox.
---

# ADR-0008 - Outbox transazionale come unica sorgente degli eventi

**Stato**: accettata · **Data**: 25 agosto 2026 · **Area**: ARCH
**Decisioni di riferimento**: D15; base architetturale §5

## Contesto

Ogni fatto rilevante ha conseguenze in più contesti e verso l'esterno. La firma di un documento ne
ha almeno sei: il documento diventa immutabile, l'assistito va avvisato, il sistema di origine va
alimentato, l'infrastruttura documentale va alimentata quando previsto, il fatto rendicontabile va
emesso, il registro va scritto. Nessuna può essere rinunciata; nessuna può far fallire la firma;
nessuna può bloccare il professionista in attesa.

Il problema è che il dato sta in una base dati transazionale e le conseguenze si propagano
attraverso un canale che non partecipa alla stessa transazione.

## Alternative valutate

### Alternativa 1 - Pubblicare sul broker dopo il consolidamento

*Vantaggi*: banale; nessuna tabella aggiuntiva; latenza minima.

*Compromesso*: **l'evento perso.** La transazione si consolida, il processo termina prima della
pubblicazione. Il documento è firmato ma il sistema di origine non lo saprà mai, l'assistito non
riceve la notifica, il fatto rendicontabile non è emesso. **Nessuno se ne accorge**, perché non c'è
nulla che segnali l'assenza di un evento mai esistito. **Scartata.**

### Alternativa 2 - Pubblicare prima di consolidare

*Compromesso*: **l'evento fantasma.** L'evento è consegnato, la transazione fallisce. Il sistema di
origine riceve la notifica di un documento firmato che non esiste. È il peggiore dei due, perché
produce dati errati in un sistema di terzi. **Scartata.**

### Alternativa 3 - Transazione distribuita fra base dati e broker

*Vantaggi*: atomicità formale.

*Compromessi*: richiede il supporto del coordinatore su entrambi i lati; produce blocchi in caso di
esito incerto; peggiora la disponibilità del percorso clinico legandola a quella del broker;
complica l'installazione presso il cliente. **Scartata.**

### Alternativa 4 - Outbox transazionale

L'evento è scritto in una tabella **nella stessa transazione del dato**; un relay legge la tabella e
pubblica.

*Vantaggi*: elimina per costruzione entrambi i difetti; la pubblicazione è ritentabile
indefinitamente perché la sorgente è persistita; nessun coordinatore distribuito.

*Compromessi accettati*: una tabella e un processo in più; latenza aggiuntiva pari all'intervallo
di lettura; la tabella va sfoltita.

## Decisione

**Si adotta l'alternativa 4, come unica sorgente.** Nessun percorso applicativo scrive direttamente
sul broker: verifica automatica bloccante.

1. **La tabella sta nello schema del contesto che produce l'evento**, quindi nella stessa base dati
   e nello stesso ambito transazionale del dato. Con il modello a uno schema per tenant, ne discende
   che **l'outbox è per tenant**: il relay itera esplicitamente, un tenant con molti eventi non
   allunga la coda degli altri, e la dismissione porta con sé la propria outbox.
2. **Il relay marca come pubblicato dopo la conferma del broker.** In caso di dubbio ripubblica: la
   semantica è almeno una volta e i consumatori sono idempotenti per costruzione (ADR-0010).

## Che cosa non passa dall'outbox

| Non passa | Perché |
|---|---|
| Il segnalamento della sessione media | ADR-0012: latenza e requisito di ordinamento |
| Le interrogazioni sincrone fra contesti | Non sono eventi |
| Le voci del registro immutabile | Hanno garanzie più forti: il fallimento della scrittura fa fallire l'operazione applicativa, mentre il fallimento di un consumatore no |
| Le metriche di esercizio | Percorso proprio |

## Conseguenze

**Positive**

- Scenario di qualità SQ-03 soddisfatto per costruzione: interrompendo il processo fra la scrittura
  e la pubblicazione, l'evento viene pubblicato al ripristino.
- La disponibilità del percorso clinico non dipende da quella del broker.
- Il ritardo del relay è una grandezza sorvegliabile, quindi il guasto è visibile.

**Negative, accettate**

- Latenza aggiuntiva sul percorso degli eventi, dichiarata.
- Una tabella per contesto per tenant, da sfoltire con una politica dichiarata.
- Il ritardo del relay diventa una grandezza da sorvegliare: la sua assenza dalla sorveglianza
  renderebbe invisibile un guasto silenzioso.

## Riferimenti

[06 - Eventi e integrazione interna](../02_architecture/06-eventi-e-integrazione-interna.md#2-loutbox-transazionale) ·
ADR-0009 · ADR-0010 · ADR-0012
