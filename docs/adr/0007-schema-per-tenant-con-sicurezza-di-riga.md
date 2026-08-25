---
title: "ADR-0007 — Uno schema per tenant con sicurezza a livello di riga come difesa in profondità"
sidebar_position: 7
description: Perché l'isolamento fra titolari autonomi si realizza con schemi separati e non con righe condivise, e perché la sicurezza a livello di riga è mantenuta comunque come seconda barriera.
---

# ADR-0007 — Uno schema per tenant con sicurezza a livello di riga come difesa in profondità

**Stato**: accettata · **Data**: 25 agosto 2026 · **Area**: ARCH
**Decisioni di riferimento**: D8; vincolo V4; base architetturale §4

## Contesto

Il problema non è servire più clienti con la stessa installazione: è **tenere separati dati che
appartengono a titolari del trattamento giuridicamente autonomi**, su infrastruttura condivisa, in
modo dimostrabile. Una fuga fra tenant non è un difetto spiacevole: è una comunicazione di dati
relativi alla salute fra soggetti distinti.

Si aggiunge una proprietà del dominio: **non esiste una categoria di dati neutri**. Il fatto che
una persona abbia un appuntamento con una certa branca specialistica è dato relativo alla salute.

La decisione approvata dal committente ammette esplicitamente due realizzazioni — sicurezza a
livello di riga oppure schema per tenant — senza sceglierne una. La scelta va fatta prima del primo
schema, perché la tenancy non è retrofittabile.

## Alternative valutate

### Alternativa 1 — Righe condivise con colonna discriminante e sicurezza a livello di riga

*Vantaggi*: realizzazione più economica; una sola migrazione per modifica; numero di oggetti nella
base dati indipendente dal numero di clienti; pool di connessioni banale.

*Compromessi accertati*:

- **Il ripristino selettivo diventa difficile.** Riportare i dati di un solo cliente a un istante
  precedente richiede estrazione e reinserimento selettivo di righe da tabelle che contengono anche
  i dati altrui: lungo, rischioso, difficile da provare. È un requisito, non un desiderio.
- **La dimostrazione della separazione diventa argomentativa.** Alla domanda «come sapete che A non
  vede i dati di B?» la risposta sarebbe «perché ogni interrogazione filtra»: una risposta sulla
  disciplina del codice, non sulla struttura.
- **La dismissione diventa una cancellazione selettiva** su decine di tabelle, con la possibilità
  di dimenticarne una.
- La sicurezza a livello di riga può essere **silenziosamente inefficace**: se il ruolo applicativo
  possiede l'attributo che consente di superare le politiche, o se le politiche non sono imposte
  anche al proprietario delle tabelle, il meccanismo risulta configurato e inattivo.

### Alternativa 2 — Una base dati per tenant

*Vantaggi*: separazione massima; ripristino e dismissione banali.

*Compromessi*: costo operativo sproporzionato per il profilo di utenza atteso; connessioni e
risorse moltiplicate; non aggiunge garanzie sostanziali rispetto alla separazione per schema
correttamente imposta. **Scartata.**

### Alternativa 3 — Uno schema per tenant su base dati condivisa, con sicurezza a livello di riga
come difesa in profondità

*Vantaggi*: la separazione è strutturale e dimostrabile con i privilegi; ripristino e dismissione
sono operazioni su uno spazio di nomi; la seconda barriera regge quando la prima è stata aggirata
da un errore.

*Compromessi accettati*: le migrazioni sono N; il numero di oggetti cresce con i clienti; il pool
richiede impostazione e azzeramento del contesto a ogni prestito; le operazioni che attraversano i
tenant richiedono un percorso dedicato.

## Decisione

**Si adotta l'alternativa 3.**

- Uno schema per tenant su base dati condivisa.
- Le tabelle portano comunque l'identificativo di tenant e sono protette da politiche di riga:
  ridondanza **deliberata**, non residuo.
- Le politiche sono imposte anche al proprietario delle tabelle, e il ruolo applicativo è privo
  dell'attributo che consente di superarle. Entrambe le condizioni sono **verificate all'avvio** e
  fanno fallire l'avvio se non soddisfatte.
- La verifica automatica non accerta che le politiche esistano, ma che **producano l'effetto**: un
  tentativo di accesso a una riga di un altro tenant deve fallire nella prova, non essere
  semplicemente evitato dal codice.
- Il contesto di tenant è **risolto dall'asserzione di identità, mai dalla richiesta**, ed è
  azzerato alla restituzione della connessione al pool, con prova dedicata.
- L'installazione presso il cliente è il **caso degenere con un solo tenant**: stesso codice,
  nessun ramo separato, nessuna configurazione che disattivi la tenancy.

## Conseguenze

**Positive**

- Il ripristino selettivo di un tenant è realizzabile senza indisponibilità per gli altri: scenario
  di qualità SQ-08.
- La separazione è dimostrabile con i privilegi, non con la disciplina.
- La dismissione è la rimozione di uno spazio di nomi.

**Negative, accettate**

- Migrazioni automatizzate, idempotenti, reversibili, con esito registrato per schema, e metodo in
  due fasi obbligatorio per le modifiche non retrocompatibili, perché durante la finestra
  l'applicazione deve funzionare con entrambe le forme.
- Iterazione esplicita sui tenant per ogni processo che non nasce da una richiesta: costa più cicli
  e rende impossibile la classe di difetti in cui un'operazione pensata per un tenant tocca gli
  altri.
- `[NV]` — il limite pratico di schemi gestibili prima che il costo dei metadati diventi
  significativo va misurato dall'area tecnica prima della prima installazione a molti tenant.

**Chi altro è vincolato**: tutte le aree, per il vincolo V4.

## Riferimenti

[05 — Multi-tenancy](../02_architecture/05-multi-tenancy.md)
