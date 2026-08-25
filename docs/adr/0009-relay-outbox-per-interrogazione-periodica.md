---
title: "ADR-0009 — Il relay dell'outbox legge per interrogazione periodica"
sidebar_position: 9
description: Perché il relay interroga la tabella invece di leggere il registro di replica dell'archivio, quale sia il peso dell'alternativa sull'installazione presso il cliente e a quali condizioni l'alternativa resta disponibile.
---

# ADR-0009 — Il relay dell'outbox legge per interrogazione periodica

**Stato**: accettata · **Data**: 25 agosto 2026 · **Area**: ARCH
**Origine**: questione rinviata a un ADR dal modulo dei fondamenti informatici

## Contesto

Stabilito che l'outbox è l'unica sorgente degli eventi (ADR-0008), resta da decidere **come il
relay legge la tabella**. Le due modalità disponibili producono lo stesso contratto verso i
consumatori ma hanno costi molto diversi sull'esercizio e sull'inventario dei componenti.

Il modulo dei fondamenti informatici ha già insegnato al lettore l'esistenza delle due modalità e
ha proposto l'interrogazione periodica come predefinita, rinviando la decisione a questo registro.

## Alternative valutate

### Alternativa 1 — Interrogazione periodica

Il relay interroga la tabella a intervalli brevi, prende un lotto con un blocco che salta le righe
già prese da altri, pubblica, marca.

*Vantaggi*: nessun componente aggiuntivo; nessun privilegio speciale sull'archivio; comprensibile,
riproducibile e provabile ovunque, incluso l'ambiente di sviluppo; funziona identicamente nei due
assetti di distribuzione.

*Compromessi*: latenza aggiuntiva pari all'intervallo; carico costante sull'archivio anche in
assenza di eventi; con volumi alti l'intervallo va ridotto e il carico cresce.

### Alternativa 2 — Cattura delle modifiche dal registro di replica

Un componente legge il registro delle modifiche dell'archivio e pubblica.

*Vantaggi*: latenza minima; nessun carico di interrogazione; nessuna contesa sulla tabella.

*Compromessi*:

- **Introduce un componente di terze parti** da censire nell'inventario, aggiornare, mettere in
  sicurezza e sorvegliare per l'intera vita del prodotto. In un percorso in cui l'inventario dei
  componenti di terze parti è un obbligo formale e non una buona pratica, ogni voce ha un costo
  ricorrente.
- **Richiede privilegi di replica** sull'archivio, che il cliente potrebbe non voler concedere.
- **Complica l'installazione presso il cliente**, che è un vincolo di progetto: ogni componente
  aggiunto va installato e configurato da un'organizzazione che non è un fornitore di servizi
  informatici, e un componente in più costa anche la probabilità che venga configurato male.
- Lo **stato di avanzamento della lettura** diventa un ulteriore elemento da sorvegliare, con una
  propria modalità di guasto.

## Decisione

**Si adotta l'interrogazione periodica come modalità predefinita, in entrambi gli assetti di
distribuzione.**

La motivazione decisiva **non è tecnica ma di perimetro**: l'installazione presso il cliente deve
restare leggera e installabile senza privilegi particolari, e i vantaggi di latenza della seconda
alternativa non sono richiesti da alcun requisito. Il percorso che ha un requisito di latenza
stringente — il segnalamento della sessione — **non passa comunque dall'outbox** (ADR-0012), il che
toglie all'argomento della latenza gran parte del suo peso.

La cattura delle modifiche resta **un'opzione dichiarata** per assetti ad alto volume, a due
condizioni congiunte:

1. il componente è **censito nell'inventario prima dell'adozione**;
2. l'interrogazione periodica **resta funzionante come ripiego**, e la commutazione fra le due
   modalità non richiede modifiche ai consumatori.

La soglia di volume oltre cui l'opzione diventa raccomandata **non è fissata** ed è una decisione
rinviata, da prendere su misura e non per anticipazione.

## Conseguenze

**Positive**

- Nessun componente aggiuntivo nell'inventario.
- Comportamento identico fra ambiente di sviluppo, installazione presso il cliente e servizio
  gestito: ciò che si prova è ciò che si esegue.
- Nessun privilegio speciale richiesto al cliente.

**Negative, accettate**

- Latenza aggiuntiva pari all'intervallo di interrogazione, dichiarata nel contratto pubblico.
- Carico costante sull'archivio, dimensionato.
- A volumi molto alti l'intervallo va ridotto e il costo cresce: è la condizione che farà scattare
  la rivalutazione.

**Proprietà che rende reversibile la decisione**: il contratto degli eventi è identico fra le due
modalità. È ciò che consente di cambiare idea senza toccare un solo consumatore.

## Riferimenti

[06 — Eventi e integrazione interna](../02_architecture/06-eventi-e-integrazione-interna.md#24-come-il-relay-legge) ·
[09 — Decisioni rinviate](../02_architecture/09-decisioni-rinviate.md#a-2--modalità-di-lettura-delloutbox-in-assetti-ad-alto-volume) ·
ADR-0008
