---
title: "ADR-0013 — Registro immutabile a quattro strati"
sidebar_position: 13
description: Perché il registro degli accessi combina catena di impronte, archivio a sola scrittura, conservazione con privilegi disgiunti e ancoraggio periodico firmato, invece di scegliere una sola tecnica.
---

# ADR-0013 — Registro immutabile a quattro strati

**Stato**: accettata · **Data**: 25 agosto 2026 · **Area**: ARCH
**Decisioni di riferimento**: D42; vincoli V5 e V-04 di bacheca
**Origine**: questioni poste dall'area di sicurezza sulla scelta della tecnica e sul punto e la
periodicità dell'ancoraggio esterno

## Contesto

Il requisito è che ogni accesso a dato sanitario sia tracciato in modo **non ripudiabile e non
alterabile**. Il secondo aggettivo è quello difficile, perché **il modello di minaccia comprende
l'operatore stesso**: chi amministra il sistema non deve poter modificare o cancellare una voce
senza che l'alterazione sia rilevabile.

Il fraintendimento sistematico da cui la decisione parte è che il versionamento automatico delle
entità offerto dal livello di persistenza soddisfi il requisito. Non lo soddisfa: le tabelle di
storico sono tabelle come le altre. Il versionamento **versiona, non rende immutabile**.

L'area di sicurezza ha posto la domanda nella forma di una scelta fra quattro tecniche: catena di
impronte applicativa, archiviazione a sola aggiunta, scrittura singola sull'oggetto, firma periodica
con marca temporale.

## Alternative valutate

La premessa della risposta è che **le quattro non sono alternative fra cui scegliere**: coprono
minacce diverse e nessuna, da sola, copre il modello di minaccia dichiarato.

| Tecnica | Copre | Non copre |
|---|---|---|
| **Catena di impronte applicativa** | Modifica o cancellazione di una voce, riordino, inserimento retroattivo | La riscrittura dell'intera catena da parte di chi controlla l'applicazione |
| **Archivio con scrittura singola sull'oggetto** | Modifica e cancellazione entro il periodo di ritenzione imposto dall'archivio | La mancata scrittura di una voce che non è mai stata prodotta |
| **Conservazione separata con privilegi disgiunti** | La riscrittura dell'intera catena da parte dell'amministratore dell'archivio applicativo | La collusione fra amministratori dei due sistemi |
| **Ancoraggio periodico firmato e marcato temporalmente** | La collusione, entro l'intervallo fra due ancoraggi | Le voci comprese fra l'ultimo ancoraggio e il momento dell'attacco |

Scegliere una sola tecnica significa quindi accettare la colonna «non copre» corrispondente. Con la
sola catena applicativa, chi controlla l'applicazione riscrive tutto e la verifica torna positiva:
la garanzia si riduce alla fiducia nell'operatore, che è precisamente ciò che il requisito esclude.

## Decisione

**Si adottano tutti e quattro gli strati.**

1. **Catena di impronte applicativa**, per tenant. Ogni voce porta l'impronta del proprio contenuto
   e quella della voce precedente. La catena è **per tenant e non globale**: una catena globale
   creerebbe una dipendenza fra tenant e renderebbe impossibile consegnare a un titolare l'evidenza
   dei propri accessi senza esporgli l'esistenza degli altri.
2. **Copia su archivio a sola scrittura**, asincrona con ritardo sorvegliato. La scrittura
   bloccante è quella sull'archivio primario del registro: bloccare anche la replica sposterebbe la
   disponibilità del sistema clinico sotto quella del sistema di conservazione.
3. **Conservazione con privilegi disgiunti**: chi amministra l'archivio applicativo non ha
   privilegi di scrittura sull'archivio del registro, e viceversa.
4. **Ancoraggio periodico** dell'impronta della testa, firmato e marcato temporalmente, conservato
   separatamente dalla catena.

**La finestra di vulnerabilità residua è dichiarata**: le voci comprese fra due ancoraggi
consecutivi, nella sola ipotesi di collusione fra chi amministra l'applicazione e chi amministra la
conservazione. La sua ampiezza è il parametro con cui si regola il rapporto fra costo e garanzia,
ed è la misura dello scenario di qualità SQ-01.

## Conseguenze

**Positive**

- La garanzia non dipende dalla fiducia in un singolo amministratore.
- L'estratto per chi verifica è **verificabile in modo indipendente** da chi lo ha prodotto: il
  metodo di calcolo e la struttura della catena sono documentati pubblicamente, perché la
  segretezza del metodo non aggiunge sicurezza e sottrae verificabilità.
- Il fallimento della verifica delimita un intervallo di incertezza invece di produrre un
  fallimento indistinto.

**Negative, accettate**

- **La scrittura del registro è bloccante**: il suo fallimento fa fallire l'operazione applicativa.
  Ne discende che l'indisponibilità del registro è indisponibilità del sistema per le operazioni su
  dato clinico. È severo e deliberato: proseguire senza traccia produrrebbe una finestra di accessi
  non dimostrabili, e la finestra coinciderebbe con l'incidente, cioè con il momento in cui la
  dimostrabilità serve di più.
- Il registro è sul percorso critico e la sua latenza entra nel budget delle operazioni.
- La catena **non si ripara**: in caso di rottura si apre una nuova generazione ancorata alla
  precedente, e la rottura è essa stessa registrata. Riparare significherebbe riscrivere.
- **Nell'installazione presso il cliente la separazione dei privilegi non è imponibile dal
  progetto**: è un requisito che il cliente soddisfa. Il progetto rende la separazione la
  configurazione predefinita, rileva e segnala la configurazione in cui i due archivi condividono
  le credenziali, e dichiara la conseguenza — in quella configurazione la garanzia si riduce a
  quella della sola catena applicativa.

## Punto e periodicità dell'ancoraggio

L'area di sicurezza ha rinviato a quest'area anche la determinazione del punto e della periodicità
dell'ancoraggio, osservando correttamente che l'intervallo riscrivibile è quello fra due ancoraggi.
Quest'area decide la **struttura**; il valore numerico dell'intervallo resta un parametro di
rischio.

**Innesco doppio, non solo temporale.** L'ancoraggio avviene al verificarsi del primo fra due
eventi: il decorso dell'intervallo dichiarato, oppure il superamento di una soglia di volume di
voci. Il solo innesco temporale lascia intervalli molto popolati nelle ore di punta e ancoraggi
vuoti di notte, cioè concentra il rischio proprio dove l'attività è maggiore.

**Ancoraggio anche su evento**, prima di ogni operazione che possa alterare la catena o il suo
contesto: applicazione di una politica di conservazione con rimozione di un segmento, migrazione
del registro, dismissione di un tenant, ripristino selettivo. Ancorare prima rende quelle
operazioni non ripudiabili.

**Tre destinazioni dell'attestazione**, in ordine di forza crescente e cumulative:

1. **Archivio degli ancoraggi con privilegi disgiunti** da quello del registro. È il minimo, e da
   solo non protegge dalla collusione.
2. **Consegna dell'attestazione al titolare del trattamento** insieme al rapporto periodico. È la
   misura più forte a costo quasi nullo: da quel momento **una copia dell'impronta è in mano a un
   soggetto che l'operatore non controlla**, e riscrivere la storia significa contraddire un
   documento già consegnato a un terzo.
3. **Marcatura temporale da un servizio qualificato**, che aggiunge l'opponibilità della data.
   È **configurabile e non obbligatoria**, perché introduce una dipendenza esterna che
   l'installazione presso il cliente potrebbe non avere; quando è assente, la garanzia dichiarabile
   si riduce e la riduzione va dichiarata.

**Rinviato all'area di sicurezza** (`[NV]`): il **valore** dell'intervallo e della soglia di
volume, la scelta del servizio di marcatura temporale, la conservazione degli ancoraggi, la cadenza
delle verifiche, la forma minima dell'origine della richiesta compatibile con la minimizzazione, e
se l'archivio del registro possa essere lo stesso motore dell'archivio applicativo con privilegi
disgiunti.

## Riferimenti

[07 — Tracciamento e registro immutabile](../02_architecture/07-tracciamento-e-registro-immutabile.md)
