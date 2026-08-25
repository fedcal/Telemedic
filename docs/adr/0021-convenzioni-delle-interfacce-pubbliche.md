---
title: "ADR-0021 — Convenzioni delle interfacce pubbliche"
sidebar_position: 21
description: Registro cumulativo delle dieci convenzioni delle interfacce esposte a terzi — collocazione della versione, esiti, idempotenza, limitazione del traffico, dismissione, contenuto dei messaggi in uscita, ritentativi, versionamento degli eventi, introspezione — con la motivazione di ciascuna.
---

# ADR-0021 — Convenzioni delle interfacce pubbliche

**Stato**: accettata · **Data**: 25 agosto 2026 · **Area**: ARCH
**Origine**: questione posta a quest'area e all'area dei protocolli
**Correzioni recepite**: C-01, C-02, C-03, C-04, C-06, C-10 di bacheca

## Contesto

Dieci scelte erano state enunciate come proposte motivate nel materiale sui protocolli, in attesa di
una decisione. Sono convenzioni di superficie: nessuna è, presa singolarmente, architetturalmente
decisiva; **tutte insieme determinano l'esperienza di chi integra** e, una volta pubblicate,
diventano contratto per il periodo di preavviso di dismissione.

Un ADR cumulativo è preferibile a dieci ADR separati perché le convenzioni si condizionano a
vicenda e vanno lette insieme.

## Le dieci decisioni

### 1. Collocazione della versione

**Decisione**: versione maggiore **nel percorso** per il piano applicativo; per il piano clinico la
versione è quella del formato di scambio, dichiarata nel documento di capacità e nel tipo di
contenuto, senza un numero proprio.

*Alternative scartate*: intestazione dedicata — invisibile, si perde nei registri e nelle cache,
difficile da provare a mano; tipo di contenuto specifico del fornitore — formalmente corretto,
ostile agli sviluppatori e mal gestito da molti intermediari.

*Motivazione*: la visibilità nei registri e nelle tracce vale più della purezza formale. Un
problema di integrazione si diagnostica leggendo un percorso.

### 2. Esito per la precondizione richiesta sulle risorse cliniche

**Decisione**: le modifiche alle risorse cliniche richiedono un validatore di concorrenza; la sua
assenza produce un esito di **precondizione richiesta**, non un'accettazione ottimistica.

*Alternativa scartata*: accettare senza validatore, con ultimo scrittore vincente.

*Motivazione*: su dati clinici la sovrascrittura silenziosa di una modifica altrui è una perdita di
informazione sanitaria. La deviazione dal comportamento più permissivo è deliberata e va
documentata come scelta di sicurezza.

### 3. Esito che non rivela l'esistenza

**Decisione**: quando un soggetto non è autorizzato ad accedere a una risorsa e la sua stessa
esistenza è informazione, si risponde **non trovato** invece di **vietato**.

*Alternativa scartata*: distinguere sempre i due esiti, che è più informativo per chi sviluppa.

*Motivazione*: in questo dominio l'esistenza di una risorsa è spesso essa stessa dato sulla salute.
La distinzione fra i due esiti consentirebbe di enumerare. La regola si applica **solo** dove
l'esistenza è informazione, non ovunque: altrove la diagnosticabilità vale di più.

### 4. Conservazione delle chiavi di idempotenza

**Decisione**: le chiavi sono conservate per un tempo **superiore alla finestra massima di
ritentativo**, con la durata dichiarata nel contratto.

*Motivazione*: una chiave scaduta prima dell'ultimo ritentativo possibile fa fallire la
deduplicazione proprio nel caso che la richiedeva.

*Correzione recepita*: il meccanismo di idempotenza a livello di protocollo è oggetto di una
**bozza scaduta e archiviata**, non di uno standard. Va documentato come convenzione del progetto e
**non presentato come standard**.

### 5. Intestazioni di limitazione del traffico

**Decisione**: si emettono le intestazioni nella forma corrente.

*Correzione recepita*: la forma a tre intestazioni separate **non è mai stata standard ed è
superata**. Non va emessa né documentata come tale. La doppia emissione per compatibilità, che era
stata proposta, **non si adotta**: emettere una forma mai standardizzata la legittima e ne rende
poi costosa la rimozione.

### 6. Durata del preavviso di dismissione

**Decisione**: **dodici mesi** di preavviso per la dismissione di una versione maggiore, con almeno
due versioni maggiori attive contemporaneamente.

*Alternativa scartata*: sei mesi, più economico per il progetto.

*Motivazione*: il profilo dell'integratore atteso è una struttura di piccole dimensioni, con cicli
di rilascio lunghi e risorse di sviluppo limitate. Un preavviso breve non produce migrazioni: produce
integratori bloccati su una versione dismessa.

*Correzione recepita*: l'intestazione di dismissione **è oggetto di uno standard**, e va citata con
l'identificativo corretto.

### 7. Contenuto dei messaggi in uscita

**Decisione**: contenuto magro, senza contenuto clinico. Trattata integralmente in ADR-0011.

### 8. Politica di ritentativo

**Decisione**: attesa esponenziale con **variazione casuale obbligatoria**; parametri configurabili
con valori predefiniti **dichiarati nel contratto pubblico**.

*Motivazione della variazione casuale*: senza, un'indisponibilità di pochi minuti produce alla
riattivazione una raffica sincronizzata di tutti gli eventi accumulati — un attacco di negazione del
servizio involontario contro il proprio integratore.

*Motivazione della dichiarazione*: l'integratore dimensiona la propria finestra di manutenzione su
quel dato.

### 9. Versionamento del tipo degli eventi

**Decisione**: versione **nel nome del tipo**. Trattata in ADR-0010.

### 10. Introspezione sulle operazioni ad alto impatto

**Decisione**: le operazioni ad alto impatto — esportazioni, cancellazioni per conservazione,
migrazioni, dismissioni — espongono lo **stato di avanzamento interrogabile** e non solo un esito
finale.

*Alternativa scartata*: risposta sincrona con esito, che per operazioni lunghe produce scadenze del
tempo di attesa e nessun modo di sapere se l'operazione stia procedendo.

*Motivazione*: un'operazione lunga senza introspezione è indistinguibile da un'operazione bloccata,
e la reazione tipica è rilanciarla — che su una cancellazione o una dismissione è esattamente ciò
che non si deve fare.

## Correzioni verificate recepite in blocco

| # | Correzione |
|---|---|
| C-01 | L'intestazione di dismissione è oggetto di uno standard pubblicato: va citata correttamente |
| C-02 | Il meccanismo di idempotenza a livello di protocollo è una **bozza scaduta e archiviata**: non è standard |
| C-03 | La forma a tre intestazioni di limitazione del traffico non è mai stata standard ed è superata |
| C-04 | I dettagli di problema sono oggetto di uno standard aggiornato: va citato l'identificativo corrente |
| C-06 | La firma dei messaggi e l'impronta del corpo sono **due specifiche distinte**: non attribuire la seconda alla prima |
| C-10 | La busta di evento **non prevede un'intestazione dedicata** per l'attributo di tipo di contenuto |

## Conseguenze

**Positive**

- Le convenzioni sono decise e citabili, così che l'area dei protocolli e quella di integrazione
  possano documentarle come scelte e non come proposte.
- Le correzioni verificate sono recepite in un solo luogo.

**Negative, accettate**

- Due delle convenzioni — l'esito di precondizione richiesta e l'esito che non rivela l'esistenza —
  **deviano dal comportamento più diffuso** e vanno spiegate a ogni integratore, altrimenti vengono
  scambiate per difetti.
- Il preavviso di dodici mesi con due versioni maggiori attive è un impegno di manutenzione
  permanente, il cui costo cresce con il numero di versioni rilasciate.

## Riferimenti

[09 — Decisioni rinviate](../02_architecture/09-decisioni-rinviate.md#b-5--convenzioni-delle-interfacce-pubbliche) ·
ADR-0006 · ADR-0010 · ADR-0011
