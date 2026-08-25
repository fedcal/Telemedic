---
title: "ADR-0012 — Il segnalamento della sessione non transita per l'outbox né per il broker"
sidebar_position: 12
description: Perché il piano del tempo reale ha un meccanismo proprio, che cosa attraversa comunque il confine, e quale vincolo ne discende sulla distribuzione del carico.
---

# ADR-0012 — Il segnalamento della sessione non transita per l'outbox né per il broker

**Stato**: accettata · **Data**: 25 agosto 2026 · **Area**: ARCH
**Origine**: questione sollevata dal modulo dei fondamenti informatici; risponde inoltre alle
questioni poste dall'area tecnica sulla topologia del segnale su più istanze e dall'area dei
protocolli sulla distribuzione dello stato di sessione
**Vincolo di riferimento**: V-131 posto dall'area dei protocolli

## Contesto

Stabilito che l'outbox è l'unica sorgente degli eventi (ADR-0008), la conseguenza apparente è che
tutto passi di lì. È una semplificazione attraente: un solo meccanismo, una sola sorveglianza, un
solo insieme di garanzie.

Il segnalamento della sessione media — lo scambio delle descrizioni e dei candidati di rete fra i
partecipanti — non tollera quel percorso, per due ragioni indipendenti e ciascuna sufficiente.

## Alternative valutate

### Alternativa 1 — Tutto passa dall'outbox e dal broker

*Vantaggi*: un solo meccanismo da capire, sorvegliare e provare; nessun secondo sistema.

*Compromessi*:

- **Latenza.** L'outbox aggiunge l'intervallo di interrogazione del relay più la latenza del broker.
  Il percorso di negoziazione ha un budget di frazioni di secondo misurate: aggiungere il percorso
  lungo significa mancare il requisito **per costruzione**, non per carico.
- **Ordinamento e consegna.** La specifica che governa la raccolta incrementale dei candidati
  richiede che il protocollo di trasporto li consegni **esattamente una volta e nello stesso
  ordine** in cui sono stati prodotti. Un canale di pubblicazione generico non lo garantisce: un
  candidato duplicato o fuori ordine produce fallimenti di negoziazione **intermittenti e non
  diagnosticabili** — la categoria di difetti più costosa da correggere, perché la sessione si
  stabilisce nove volte su dieci e il difetto non si riproduce su richiesta.

**Scartata.**

### Alternativa 2 — Canale di pubblicazione semplice come dorsale fra i nodi di segnalamento

*Vantaggi*: consente di instradare i partecipanti su nodi diversi.

*Compromessi*: un canale di pubblicazione senza persistenza non garantisce né la consegna né
l'ordine; aggiunge un salto sul percorso critico; sposta il problema senza risolverlo. **Scartata.**

### Alternativa 3 — Affinità di connessione al bilanciatore

Il bilanciatore mantiene il partecipante sullo stesso nodo per la durata della connessione.

*Vantaggi*: il più semplice da realizzare; nessuna logica di instradamento nell'applicazione.

*Compromessi*: **i due partecipanti alla stessa sessione possono finire su nodi diversi**, quindi
il problema dello stato condiviso resta intero; un rilascio tronca tutte le sessioni ospitate dal
nodo che si aggiorna; il ridimensionamento non ridistribuisce il carico esistente. Ammessa **solo
come debito tecnico dichiarato** con strategia di uscita scritta.

### Alternativa 4 — Meccanismo proprio con distribuzione deterministica

La macchina a stati di una sessione vive in un solo processo, determinato in modo deterministico
dall'identificativo della sessione. I due partecipanti alla stessa sessione raggiungono lo stesso
processo. Nessuna dorsale sul percorso critico.

*Vantaggi*: latenza minima; ordinamento garantito perché lo stato è in un solo luogo; nessun
componente aggiuntivo.

*Compromessi*: la distribuzione del carico su questo percorso non è casuale; la caduta di un nodo
termina le sessioni che ospitava.

## Decisione

**Si adotta l'alternativa 4**: instradamento deterministico della sessione al nodo che la possiede,
per funzione di dispersione consistente sull'identificativo di sessione. Il segnalamento non
transita per l'outbox né per il broker: verifica automatica bloccante.

Due requisiti che qualunque realizzazione deve soddisfare, e che sono la parte vincolante della
decisione:

1. **Consegna esattamente una volta e nell'ordine, per sessione.**
2. **Drenaggio graduale sufficiente a non troncare una sessione in corso**: un nodo che si aggiorna
   smette di accettare sessioni nuove e attende la conclusione di quelle attive entro una finestra
   dichiarata, prima di terminare.

### Il confine separa il traffico dai fatti

| Attraversa il confine | Non attraversa |
|---|---|
| «La sessione è stata avviata» | Le descrizioni di negoziazione |
| «La sessione è terminata, con questo esito tecnico» | I candidati di rete |
| «La qualità è scesa sotto la soglia configurata» | I campioni di misura, che vanno nell'archivio di serie temporali |
| «La modalità operativa è cambiata» | Lo stato istantaneo della connessione |
| «La registrazione è iniziata» o «è terminata» | I flussi audio e video, in nessuna forma |

I **fatti** entrano nel piano persistente come eventi ordinari, con l'outbox e tutte le sue
garanzie. Il **traffico** che li ha prodotti resta interno.

## Conseguenze

**Positive**

- Il budget di latenza del segnalamento è rispettabile.
- L'ordinamento richiesto è garantito perché lo stato è in un solo processo.
- Nessun componente aggiuntivo.

**Negative, accettate e dichiarate**

- **La caduta di un nodo termina le sessioni che ospitava**, che si ristabiliscono con una
  rinegoziazione. È un comportamento dichiarato, non un difetto: l'alternativa sarebbe migrare lo
  stato, che è più costoso della rinegoziazione.
- La distribuzione del carico su questo percorso è per identificativo di sessione, non casuale.
- Esistono due meccanismi da capire, provare e sorvegliare invece di uno.
- L'instradamento con affinità di sessione presso il bilanciatore è ammesso **solo come debito
  tecnico dichiarato**, con una strategia di uscita scritta: sposta il problema sull'affinità senza
  risolvere l'ordinamento.

## Riferimenti

[06 — Eventi e integrazione interna](../02_architecture/06-eventi-e-integrazione-interna.md#8-il-confine-con-il-piano-del-tempo-reale) ·
[02 — Contesti delimitati](../02_architecture/02-contesti-delimitati.md#6-regole-di-attraversamento-dei-confini) ·
ADR-0008
