---
title: Integrazione per eventi
sidebar_position: 5
description: Catalogo degli eventi pubblici, sottoscrizione, firma asimmetrica, ritentativi, ordine, deduplicazione e prova di consegna. Con le non-garanzie dichiarate esplicitamente.
---

# Integrazione per eventi

Il ritorno dell'informazione verso il vostro sistema è la parte dell'integrazione che decide se
il progetto è utile o è un'isola. Una stanza di consulto che si apre è vistosa; un referto che
arriva nella cartella clinica giusta, riconciliato con l'assistito giusto, senza duplicati, è
ciò che rende il sistema adottabile.

## 1. Che cosa è garantito e che cosa non lo è

La sezione viene prima del catalogo perché sono le garanzie a determinare come dovete scrivere
il vostro ricevitore.

### 1.1 Garanzie

| # | Garanzia | Come si verifica |
|---|---|---|
| G1 | **Autenticità** - potete provare che il messaggio viene dal progetto | Firma asimmetrica verificabile con materiale pubblico. §5 |
| G2 | **Integrità** - il contenuto non è stato alterato | Impronta del corpo, coperta dalla firma. §5 |
| G3 | **Freschezza** - non è la riproduzione di un messaggio vecchio | Istante di creazione dentro la firma, finestra di cinque minuti. §5 |
| G4 | **Consegna almeno una volta** - nessun evento va perso | Registro delle consegne ispezionabile, coda degli scarti con recupero. §6, §9 |
| G5 | **Non blocco** - un ricevitore lento non degrada il progetto | Interruttore di protezione per destinazione, isolamento fra tenant. §6.3 |
| G6 | **Osservabilità** - potete vedere che cosa è stato consegnato e che cosa no | Interfaccia di consultazione delle consegne. §9 |
| G7 | **Nessun contenuto clinico in transito** | Ispezione del corpo: contiene riferimenti, non contenuto. §3.2 |

### 1.2 Non-garanzie, dichiarate

Sono altrettanto importanti, e vengono dette qui invece di essere scoperte in produzione.

| # | Non-garanzia | Che cosa dovete fare voi |
|---|---|---|
| N1 | **Non è consegna esattamente una volta** | Deduplicare. §8 |
| N2 | **Non esiste un ordine globale** | Non dipendere dall'ordine di arrivo. §7 |
| N3 | **La consegna non è immediata** | Non usare l'assenza di un evento come informazione entro pochi secondi |
| N4 | **Un evento non è una transazione** | Ricevere l'evento non significa che il vostro lavoro sia atomico con il nostro |
| N5 | **L'assenza di eventi non prova che non sia successo nulla** | Il canale può essere degradato. Sorvegliate il **volume atteso**: il silenzio non è mai normalità (vincolo [V-09](../11_registri/01-vincoli-in-vigore.md#v-09)) |

La riga N5 è quella che sfugge più spesso. Un canale di notifiche che smette di funzionare
produce esattamente lo stesso segnale di un periodo senza attività: nessuna richiesta in
arrivo. Se il vostro sistema tratta il silenzio come «va tutto bene», un guasto resta invisibile
finché qualcuno non si accorge che mancano i referti di due settimane. Il progetto emette un
segnale periodico proprio per questo (§6.5).

## 2. Il catalogo degli eventi pubblici

I tipi sono gerarchici e **portano la versione nel nome**: `it.telemedic.<dominio>.<fatto>.v<N>`.
La versione fa parte del tipo, così che possiate ignorare una versione che non conoscete invece
di fallire su un campo inatteso.

L'elenco è *proposta di progetto* nella sua composizione; la forma della busta e le regole di
consegna sono descritte nei paragrafi successivi.

### 2.1 Dominio «prestazione»

| Tipo | Quando | Soggetto | Contenuto del dato |
|---|---|---|---|
| `it.telemedic.session.scheduled.v1` | La prestazione è stata creata da un appuntamento | prestazione | riferimenti, istanti programmati, tipo di prestazione |
| `it.telemedic.session.invitation.sent.v1` | Un invito è stato recapitato | prestazione | destinatario in forma indiretta, canale, esito del recapito |
| `it.telemedic.session.started.v1` | La sessione media è stata avviata | prestazione | istante, modalità (con o senza registrazione) |
| `it.telemedic.session.participant.joined.v1` | Un partecipante è entrato | prestazione | ruolo del partecipante, istante |
| `it.telemedic.session.quality.degraded.v1` | La qualità è scesa sotto la soglia dichiarata dal tenant | prestazione | classe di degradazione, azione automatica applicata |
| `it.telemedic.session.recording.started.v1` | La registrazione è stata attivata | prestazione | riferimento al consenso che la legittima |
| `it.telemedic.session.recording.stopped.v1` | La registrazione è stata interrotta | prestazione | causa |
| `it.telemedic.session.completed.v1` | La prestazione si è conclusa | prestazione | esito, istanti, riferimenti ai documenti prodotti |
| `it.telemedic.session.failed.v1` | La prestazione non si è potuta svolgere per causa tecnica | prestazione | classe di guasto, non il dettaglio diagnostico |
| `it.telemedic.session.cancelled.v1` | Annullata prima dello svolgimento | prestazione | chi ha annullato, in forma di ruolo |
| `it.telemedic.session.no-show.v1` | Nessuno si è presentato entro la finestra dichiarata | prestazione | finestra di attesa applicata |

Le ultime due righe meritano una nota. `cancelled` e `no-show` **non sono la stessa cosa** e non
vanno collassate: la prima è una decisione, la seconda è un'assenza. Molti sistemi le
registrano allo stesso modo e perdono l'informazione che serve a distinguere un problema
organizzativo da un problema di accesso al servizio.

### 2.2 Dominio «documentazione clinica»

| Tipo | Quando | Note |
|---|---|---|
| `it.telemedic.document.drafted.v1` | Un documento è in redazione | Non è un documento valido: non archiviatelo come tale |
| `it.telemedic.document.signed.v1` | Un documento è stato firmato | **È l'evento su cui agire** per l'archiviazione nella vostra cartella |
| `it.telemedic.document.superseded.v1` | Una versione successiva sostituisce o rettifica la precedente | Il documento firmato è immutabile: non si modifica, si sostituisce mantenendo la catena. Il vostro sistema deve saper rappresentare una sostituzione, non sovrascrivere |

### 2.3 Dominio «consenso»

| Tipo | Quando |
|---|---|
| `it.telemedic.consent.granted.v1` | Un consenso è stato acquisito, con la sua validità temporale |
| `it.telemedic.consent.revoked.v1` | Un consenso è stato revocato |

Il consenso è **un fatto con validità temporale**, non un valore booleano. Se il vostro sistema
lo rappresenta come una casella spuntata, non potrà rispondere alla domanda «era valido in quel
momento?», che è l'unica domanda che conta quando c'è una contestazione.

### 2.4 Dominio «telemonitoraggio e allerte»

| Tipo | Quando | Note |
|---|---|---|
| `it.telemedic.monitoring.plan.activated.v1` | Un piano di rilevazione è attivo | Il piano è versionato: l'evento porta la versione |
| `it.telemedic.monitoring.measurement.received.v1` | È arrivata una misura | Riferimento, **mai il valore** |
| `it.telemedic.monitoring.adherence.missed.v1` | Una rilevazione attesa **non** è arrivata entro la finestra | È l'applicazione diretta del vincolo [V-09](../11_registri/01-vincoli-in-vigore.md#v-09) |
| `it.telemedic.alert.raised.v1` | Una soglia configurata dal professionista è stata superata | **La soglia è configurazione per assistito, mai dedotta dal sistema** |
| `it.telemedic.alert.acknowledged.v1` | L'allerta è stata presa in carico | Con l'identificativo di chi l'ha presa in carico, in forma indiretta |
| `it.telemedic.alert.escalated.v1` | L'allerta è passata al livello successivo per mancato riscontro | |
| `it.telemedic.alert.unattended.v1` | L'escalation si è esaurita **senza** che nessuno abbia risposto | È l'evento più importante del dominio, ed è quello che i sistemi dimenticano di modellare |

### 2.5 Dominio amministrativo

| Tipo | Quando | **Limite invalicabile** |
|---|---|---|
| `it.telemedic.billing.encounter.billable.v1` | La prestazione è liquidabile | **Contiene esclusivamente**: identificativo della prestazione, tipo di prestazione, istanti, esito amministrativo, importo, riferimenti al vostro dominio. **Nessun riferimento a documenti clinici, nessuna diagnosi, nessun motivo del contatto** |

Questo evento è il canale del **pagatore** - fondo, mutua, polizza - e la sua composizione non è
una scelta di prodotto: discende dal fatto che il pagatore non è un consultatore. La trattazione
completa è in [09 §5](09-obblighi-di-chi-integra.md). Nessuna configurazione di tenant, nessun
filtro e nessun modulo sostitutivo può arricchire questo evento con contenuto clinico.

### 2.6 Dominio «canale»

| Tipo | Quando |
|---|---|
| `it.telemedic.endpoint.verification.v1` | Verifica di proprietà della destinazione, prima dell'attivazione |
| `it.telemedic.endpoint.heartbeat.v1` | Segnale periodico, per distinguere «nessun evento» da «canale rotto» |
| `it.telemedic.webhook.endpoint.degraded.v1` | La vostra destinazione sta fallendo in modo persistente. Recapitato agli **amministratori del tenant**, non alla destinazione che sta fallendo |

## 3. Anatomia della consegna

### 3.1 La busta

Le buste seguono una specifica di settore per gli attributi di contesto, in **modalità con
attributi nelle intestazioni**: gli attributi vanno in intestazioni con prefisso `ce-`, il dato
applicativo nel corpo.

```http
POST /webhooks/telemedic HTTP/1.1
Host: gestionale.integratore.example
ce-specversion: 1.0
ce-type: it.telemedic.document.signed.v1
ce-source: /tenants/t0001/documents
ce-subject: cmp-4410
ce-id: 8f3c1e02-77a1-4f77-9d1a-6a2b3c4d5e6f
ce-time: 2026-09-01T08:47:12.004Z
ce-dataschema: https://docs.telemedic.example/schemas/document-signed-v1.json
ce-sequence: 412
Content-Type: application/json
Content-Digest: sha-256=:X48E9qOokqqrvdts8nOJRJN3OWDUoyWxBf7kbu9DBPE=:
Signature-Input: sig1=("@method" "@target-uri" "content-digest" "ce-id" "ce-type" "ce-time");\
  created=1787654832;keyid="tm-2026-08";alg="ecdsa-p384-sha384";expires=1787655132
Signature: sig1=:MEUCIQDf1sK9x0Rz…:
Idempotency-Key: 8f3c1e02-77a1-4f77-9d1a-6a2b3c4d5e6f
Telemedic-Delivery-Attempt: 1

{
  "tenant": "t0001",
  "document": { "reference": "Composition/cmp-4410", "version": "1" },
  "kind": "referto-televisita",
  "encounter": { "reference": "Encounter/enc-77213" },
  "session": { "id": "ses-01J9ZC5P" },
  "appointment": {
    "system": "https://gestionale.integratore.example/sid/appuntamento",
    "value": "APT-9931"
  },
  "signedAt": "2026-09-01T08:47:09.000Z",
  "supersedes": null,
  "links": {
    "fetch": "/fhir/Composition/cmp-4410",
    "bundle": "/fhir/Composition/cmp-4410/$document"
  }
}
```

> **Trappola verificata da codificare nei vostri collaudi.** Un'intestazione `ce-datacontenttype`
> **non deve essere presente**: la specifica lo vieta esplicitamente, e il tipo di contenuto
> dell'evento va scritto **solo** nell'intestazione standard del tipo di contenuto. Se il vostro
> analizzatore la cerca, non la troverà mai - ed è corretto così.

### 3.2 Perché il corpo non contiene il referto

Il corpo trasporta **riferimenti**, non contenuto. Tre motivazioni convergenti, e nessuna delle
tre è aggirabile per configurazione:

1. **Minimizzazione.** Un dato particolare che non viene trasmesso non può essere trattato in
   modo eccessivo.
2. **Riduzione del danno.** Una destinazione mal configurata - un indirizzo di prova rimasto in
   produzione, un registro che memorizza i corpi - diventa una fuga di dati sanitari. Con i
   riferimenti diventa una fuga di identificativi, che è grave ma non è la stessa cosa.
3. **Autorizzazione del ricevente.** Recuperando il contenuto, siete **voi** a presentare
   un'autorizzazione, e l'accesso finisce nel registro con il vostro nome. Con il contenuto
   spinto, l'accesso non esisterebbe come evento tracciabile.

Il costo è una chiamata in più. È un costo che il progetto accetta consapevolmente.

## 4. Sottoscrizione e configurazione della destinazione

### 4.1 Registrare una destinazione

```http
POST /v1/webhook-endpoints HTTP/1.1
Host: api.telemedic.example
Authorization: Bearer …
Content-Type: application/json
Idempotency-Key: wh-gestionale-prod-01

{
  "tenant": "asl-nord-01",
  "url": "https://gestionale.integratore.example/webhooks/telemedic",
  "description": "Ricevitore di produzione del gestionale",
  "eventTypes": [
    "it.telemedic.session.completed.v1",
    "it.telemedic.session.cancelled.v1",
    "it.telemedic.session.no-show.v1",
    "it.telemedic.document.signed.v1",
    "it.telemedic.document.superseded.v1"
  ],
  "delivery": {
    "mode": "at-least-once",
    "ordering": "none",
    "heartbeatSeconds": 300
  }
}
```

Quattro regole di igiene che vi risparmiano incidenti:

1. **Sottoscrivete solo i tipi che gestite.** Ricevere tutto «per sicurezza» significa
   processare eventi che non sapete interpretare, e il vostro registro si riempirà di rumore che
   nasconde i problemi veri.
2. **Una destinazione per ambiente.** Una destinazione di prova che punta a produzione è
   l'incidente più banale e più frequente di questa famiglia.
3. **Solo connessione sicura.** Il progetto rifiuta qualunque altro schema. Non è configurabile,
   nemmeno in prova.
4. **La destinazione dev'essere raggiungibile da Internet**, non solo dalla vostra rete. Se non
   può esserlo, il modello giusto è il sondaggio (§10), non un'apertura di rete concessa con
   riluttanza.

### 4.2 Verifica di proprietà, prima dell'attivazione

Prima che una destinazione riceva un solo evento reale, il progetto invia una verifica con una
sfida che dovete firmare o restituire. Serve a impedire che qualcuno registri come destinazione
un sistema di cui non ha il controllo, il che sarebbe un attacco di negazione del servizio
riflesso a spese di un terzo.

Finché la verifica non è superata, la destinazione resta **inattiva** e gli eventi si accumulano
nella coda di partenza, non vanno persi.

### 4.3 Che cosa il progetto fa con l'indirizzo che gli date

Un indirizzo fornito da un integratore è, dal punto di vista di chi lo chiama, una richiesta in
uscita verso una destinazione arbitraria. È il rischio più sottovalutato dei sistemi di
notifica. Le contromisure applicate, dichiarate perché spiegano rifiuti che altrimenti
sembrerebbero arbitrari:

| # | Contromisura | Effetto visibile per voi |
|---|---|---|
| 1 | Solo connessione sicura | Uno schema diverso viene rifiutato alla registrazione |
| 2 | Blocco delle reti non instradabili e degli indirizzi di servizio dell'infrastruttura | Un indirizzo che risolve a una rete privata viene rifiutato |
| 3 | Risoluzione del nome e verifica **dell'indirizzo risolto**, non solo del nome | Un nome pubblico che risolve a un indirizzo interno viene rifiutato |
| 4 | Connessione all'indirizzo risolto, con nome originale nell'intestazione e nella negoziazione | Immune al cambio di risoluzione fra verifica e connessione |
| 5 | **Rinvii non seguiti** | Un rinvio dal vostro endpoint viene trattato come fallimento, non seguito |
| 6 | Isolamento di rete in uscita del componente che consegna | - |
| 7 | **Nessun eco del corpo della vostra risposta** nell'interfaccia di consultazione, oltre a un estratto ripulito | Vedete stato, latenza e i primi byte, non l'intera risposta |
| 8 | Scadenze strette e limite di dimensione della risposta | Una risposta lenta o enorme conta come fallimento |
| 9 | Lista di destinazioni consentite, per i tenant che la richiedono | La registrazione in autonomia è disattivata su quei tenant |

Il punto 6 è la difesa vera: le contromisure applicative sono difesa in profondità, non difesa
principale.

## 5. Firma

### 5.1 Il metodo, e i due riferimenti da tenere distinti

La firma è **asimmetrica** e usa il metodo normato per la firma dei messaggi HTTP, che copre un
insieme dichiarato di componenti del messaggio: metodo, indirizzo di destinazione, impronta del
corpo e le intestazioni scelte, con parametri espliciti di identificativo di chiave, algoritmo,
istante di creazione e scadenza.

> **Attenzione a un punto che genera confusione.** La specifica della firma dei messaggi HTTP
> **non definisce l'impronta del corpo**: dichiara espressamente di non coprire il contenuto e di
> appoggiarsi a un documento separato. La firma è **RFC 9421**, *HTTP Message Signatures*,
> Standards Track, febbraio 2024; l'impronta del corpo è **RFC 9530**, *Digest Fields*.
> Chi firma un corpo deve implementare **entrambe**.

### 5.2 Perché non un segreto condiviso

È la scelta che sorprende gli integratori abituati ad altri prodotti, e ha una ragione precisa:

| | Segreto condiviso | Firma asimmetrica |
|---|---|---|
| Non ripudio | **No.** Il ricevente possiede il segreto e può quindi **fabbricare** notifiche indistinguibili dalle vere | **Sì.** Solo il progetto possiede la chiave privata |
| Rotazione | Coordinamento con ciascun integratore, con finestra di doppia validità | **Unilaterale**: nuova chiave, nuovo identificativo, materiale pubblico aggiornato |
| Copertura di metodo e indirizzo | Va aggiunta a mano | Nativa |
| Scadenza della firma | Va aggiunta a mano | Nativa |

In un contesto in cui la notifica trasporta l'esito di un atto sanitario e alimenta un registro
di accessi, la differenza non è teorica: con il segreto condiviso, davanti a una contestazione,
**voi non potete provare a un terzo** che quella notifica veniva da noi.

Un segreto condiviso resta disponibile come modalità di transizione per gli integratori che non
sono in grado di verificare una firma asimmetrica, ed è documentato come tale - con il limite
dichiarato, non nascosto.

### 5.3 Verifica passo a passo

1. **Leggere i byte grezzi del corpo.** Prima di qualunque deserializzazione.
2. **Ricalcolare l'impronta** del corpo e confrontarla con l'intestazione. Se non torna, il
   problema è nella lettura del corpo, non nella firma.
3. **Risolvere la chiave pubblica** dall'identificativo di chiave, sul materiale pubblico del
   progetto, con memorizzazione locale e recupero forzato solo su identificativo sconosciuto.
4. **Ricostruire la stringa canonica** dai componenti elencati nei metadati di firma, **nello
   stesso ordine**.
5. **Verificare la firma.**
6. **Verificare la finestra temporale**: fuori da cinque minuti si rifiuta, anche se la firma è
   valida.
7. **Deduplicare** sull'identificativo dell'evento (§8).

```java
// Riferimento per un ricevitore in Java - i dettagli di libreria sono omessi di proposito
public boolean accetta(byte[] corpoGrezzo, HttpHeaders intestazioni) {
    if (!impronta.corrisponde(corpoGrezzo, intestazioni.getFirst("Content-Digest"))) {
        return false;                       // problema di lettura del corpo, non di firma
    }
    var metadati = MetadatiDiFirma.parse(intestazioni.getFirst("Signature-Input"));
    if (Math.abs(Instant.now().getEpochSecond() - metadati.created()) > 300) {
        return false;                       // fuori finestra: riproduzione o orologio sfasato
    }
    var chiave = chiavi.risolvi(metadati.keyId())      // memorizzata, con recupero su kid ignoto
                       .orElseThrow(ChiaveSconosciuta::new);
    var canonica = Canonicalizzatore.costruisci(metadati.componenti(), intestazioni, corpoGrezzo);
    return Firma.verifica(chiave, canonica, intestazioni.getFirst("Signature"));
}
```

### 5.4 I quattro errori che vediamo

1. **Verificare su un corpo riserializzato.** Il framework ha riordinato le chiavi o normalizzato
   gli spazi: l'impronta non tornerà mai. È la causa nove volte su dieci.
2. **Confrontare le firme con un confronto di stringhe ordinario**, non a tempo costante.
3. **Firmare o verificare solo il corpo.** Senza metodo e indirizzo nella firma, la stessa
   notifica firmata può essere ripresentata a un'altra destinazione.
4. **Orologio non sincronizzato.** La finestra è di cinque minuti: uno sfasamento di dieci
   minuti fa fallire tutto e il sintomo assomiglia a un difetto di firma.

## 6. Ritentativi

### 6.1 Politica

```text
ritardo(n) = min( base × 2^(n-1), tetto ) × (0,5 + casuale(0 ; 0,5))
base = 5 s · tetto = 6 h · tentativi = 12  →  copertura ≈ 72 h
```

Il **fattore casuale non è ornamentale**. Senza, un'indisponibilità di cinque minuti del vostro
sistema produce, alla riattivazione, una raffica sincronizzata di tutti gli eventi accumulati:
un attacco di negazione del servizio involontario contro di voi, proprio nel momento in cui vi
state rialzando.

### 6.2 Quali risposte innescano un ritentativo

| Risposta vostra | Effetto |
|---|---|
| Successo | Consegna conclusa |
| Errore di rete, scadenza, timeout della richiesta | Ritentativo |
| Troppe richieste, servizio non disponibile, errore interno | Ritentativo, rispettando l'eventuale indicazione di quando ritentare |
| **Non più disponibile** | **Nessun ritentativo, e disattivazione automatica della destinazione.** È il modo pulito per dismettere un endpoint |
| Altri errori del ricevente | Errore permanente: nessun ritentativo per quell'evento |

L'ultima riga ha una conseguenza che va compresa bene: **se il vostro ricevitore risponde con
errore su un tipo di evento che non conosce**, quell'evento è perso senza ritentativo. Da cui la
regola: **ignorate i tipi sconosciuti e rispondete comunque con successo.**

### 6.3 Interruttore di protezione e isolamento

Dopo un certo numero di fallimenti consecutivi la destinazione passa in stato **degradato**: la
frequenza di consegna si riduce e viene notificato l'amministratore del tenant. Dopo un periodo
di fallimento totale passa in stato **disattivato** e gli eventi vanno nella coda degli scarti.

Serve a impedire che un tenant guasto consumi la capacità di consegna di tutti gli altri. È
l'isolamento del rumore fra tenant, corollario diretto del vincolo di consapevolezza del tenant.

### 6.4 Coda degli scarti e recupero

Gli eventi non consegnati dopo l'esaurimento dei tentativi finiscono in una coda **per tenant**,
conservata per una durata configurabile (*proposta*: 30 giorni), con:

```http
GET  /v1/webhook-endpoints/{id}/dead-letters?since=2026-09-01T00:00:00Z
POST /v1/webhook-endpoints/{id}/dead-letters/{eventId}/replay
```

**Il recupero riusa lo stesso identificativo di evento.** È deliberato: la vostra deduplicazione
continua a funzionare e un recupero non produce doppioni. Se generassimo un identificativo
nuovo, ogni recupero sarebbe un duplicato dal vostro punto di vista.

### 6.5 Segnale periodico

La destinazione riceve un segnale periodico configurabile. Serve a distinguere «nessun evento da
notificare» da «canale rotto», che sono indistinguibili senza. **Sorvegliatelo**: se smette di
arrivare, il canale è guasto anche se non state vedendo errori.

## 7. Ordine

### 7.1 La regola

**Non esiste ordine globale.** Con ritentativi e consegna concorrente, la conclusione di una
prestazione può arrivarvi prima del suo avvio. Non è un difetto: è una proprietà inevitabile di
un canale inaffidabile fra due sistemi indipendenti.

Anche dove esiste un ordine, è garantito **solo all'interno della partizione scelta per una
chiave**: nessun requisito funzionale può dipendere da un ordine fra aggregati diversi.

### 7.2 Come si ricostruisce l'ordine senza code ordinate

Ogni evento porta:

- l'**istante** in cui il fatto è avvenuto, che è l'orologio del progetto e non il vostro;
- un **numero di sequenza monotono crescente per aggregato**, nell'intestazione `ce-sequence`.

La regola per il vostro ricevitore, che è semplice e risolve il problema per intero:

> Per ciascun aggregato, memorizzate l'ultimo numero di sequenza applicato. **Scartate gli eventi
> con numero inferiore o uguale.** Applicate quelli superiori.

Questo rende l'ordine di arrivo irrilevante senza costringere nessuno a code ordinate. Se
arriva prima la conclusione e poi l'avvio, l'avvio viene scartato perché ha sequenza minore, e
lo stato finale è corretto.

### 7.3 La modalità ordinata, e il suo costo

Esiste una modalità `ordering: "by-subject"` per destinazione, in cui gli eventi con lo stesso
soggetto vengono consegnati in sequenza, bloccando la coda di quel soggetto in caso di
fallimento.

**Va scelta solo se il vostro sistema non può implementare il §7.2**, perché ha un costo reale:
un evento bloccato blocca tutto ciò che riguarda quel soggetto, e un evento che finisce nella
coda degli scarti blocca la sequenza finché non intervenite. Non è la modalità predefinita per
questa ragione.

## 8. Deduplicazione

| Aspetto | Regola |
|---|---|
| Su che cosa deduplicare | **L'identificativo dell'evento**, riportato sia nell'intestazione della busta sia come chiave di idempotenza |
| Finestra minima | Almeno pari alla copertura dei ritentativi: **72 ore** con la politica del §6.1 |
| Dove memorizzare | In una struttura con scadenza automatica. Non serve conservarlo per sempre |
| Che cosa fare su duplicato | Rispondere con successo **senza rieseguire il lavoro**. Non rispondere con errore: innescherebbe altri ritentativi |
| Che cosa **non** usare come chiave | L'istante dell'evento (non è unico), il soggetto (si ripete), l'ordine di arrivo (non è stabile) |

Un ricevitore che non deduplica pubblica due referti, invia due notifiche all'assistito e genera
due righe di fatturazione. Non è un caso raro: è il comportamento **atteso** su un canale con
consegna almeno una volta.

## 9. Prova di consegna

È la funzione che riduce di più il carico di assistenza, perché consente il vostro debug
autonomo.

```http
GET /v1/webhook-deliveries?endpointId=whe-01&status=failed&since=2026-09-01T00:00:00Z
```

```json
{
  "data": [
    {
      "deliveryId": "dlv-01J9ZC80B2",
      "eventId": "8f3c1e02-77a1-4f77-9d1a-6a2b3c4d5e6f",
      "eventType": "it.telemedic.document.signed.v1",
      "subject": "cmp-4410",
      "attempt": 3,
      "attemptedAt": "2026-09-01T09:02:11.402Z",
      "responseStatus": 500,
      "responseLatencyMs": 4821,
      "responseExcerpt": "Internal Server Error",
      "nextAttemptAt": "2026-09-01T09:22:40.000Z",
      "outcome": "retrying"
    }
  ],
  "meta": { "limit": 50, "hasMore": false }
}
```

Che cosa vedete e che cosa no:

- **Vedete**: stato, latenza, tentativo, prossimo tentativo, estratto ripulito della vostra
  risposta, intestazioni che il progetto ha inviato.
- **Non vedete**: il corpo integrale della vostra risposta. Restituirlo trasformerebbe la
  funzione di diagnostica in un canale di esfiltrazione.

### 9.1 La prova che vale in una contestazione

La consultazione delle consegne è uno strumento operativo. Quando serve **prova** - una
contestazione clinica, una verifica di un'autorità - la fonte è il **registro immutabile**, che
è a catena di impronte e conservato separatamente dal sistema che genera gli eventi. Il
versionamento delle entità non è un registro immutabile e non lo sostituisce.

Ciò che il registro contiene è chi, che cosa, quando, su quale soggetto, con quale esito e con
quale livello di garanzia dell'autenticazione. **Non contiene contenuto clinico.**
L'esportazione verso il vostro repository di tracce è descritta in
[09 §7](09-obblighi-di-chi-integra.md).

## 10. Il canale clinico nativo

Per gli integratori che parlano nativamente il modello clinico esiste un secondo canale, basato
sul meccanismo di sottoscrizione a **argomenti** pubblicati dal server, con filtro sui parametri
che l'argomento dichiara filtrabili.

> **Versione da citare: 1.1.0**, in uso di prova, 11 gennaio 2023. E due correzioni verificate
> che circolano sbagliate quasi ovunque:
>
> - **non esiste alcuna estensione per l'argomento**: il riferimento canonico all'argomento si
>   scrive **direttamente nel campo dei criteri**, e la query di filtro va nell'estensione
>   dedicata al filtro;
> - **nella versione R4 dello standard non esiste la risorsa di stato della sottoscrizione**: lo
>   stato viaggia come insieme di parametri conforme a un profilo, con i nomi **in forma
>   trattinata** (`event-number`, non `eventNumber`). Il nome in forma composta appartiene a
>   versioni successive dello standard.

Livelli di contenuto ammessi: vuoto, **solo identificativi**, risorsa integrale.

> **Regola di progetto: solo identificativi come impostazione predefinita, e risorsa integrale
> disattivata sui canali verso Internet.** È la stessa motivazione del §3.2, espressa nel
> formalismo dello standard.

Delle tre operazioni previste, quella di **stato** è obbligatoria per un server conforme; quelle
di **recupero degli eventi per intervallo** e di **gettone per il canale a connessione persistente**
sono facoltative. Il conteggio degli eventi dall'inizio della sottoscrizione e il numero
progressivo risolvono il problema del rilevamento dei buchi: sapete se avete perso una notifica
e potete recuperarla.

**Il modello di sottoscrizione precedente, basato su un criterio di ricerca arbitrario, non è
implementato.** Ha una semantica ambigua - un aggiornamento che fa *uscire* una risorsa dal
criterio non genera notifica, quindi un integratore che si aspetta di sapere quando una
prestazione viene annullata resterebbe sordo - non scala su un sistema multi-tenant e non
prevede firma né verifica della destinazione.

### 10.1 Corrispondenza fra i due canali

Un argomento pubblicato corrisponde a un **sottoinsieme** dei tipi di evento del canale
proprietario. La corrispondenza è pubblicata in una tabella, perché senza sarebbe impossibile
capire che cosa si perde scegliendo l'uno o l'altro.

Che cosa **non** è esprimibile sul canale clinico, e quindi richiede il canale proprietario:
degradazione della qualità di rete, revoca del consenso alla registrazione, guasto tecnico della
sessione, mancato riscontro a un'allerta, mancata rilevazione attesa. Sono tutti eventi che
**non** corrispondono a un cambiamento di stato di una risorsa clinica, e nessuno standard di
sottoscrizione clinica li modella.

## 11. Se non potete esporre un indirizzo

Non è un ripiego di serie B: è una modalità documentata con le stesse garanzie di completezza.

```http
GET /v1/events?since=2026-09-01T00:00:00Z&limit=200 HTTP/1.1
Authorization: Bearer …
```

```json
{
  "data": [ { "id": "8f3c1e02-…", "type": "it.telemedic.document.signed.v1", "sequence": 412, "…": "…" } ],
  "meta": { "limit": 200, "hasMore": true, "nextCursor": "eyJ…" }
}
```

Regole d'uso:

1. **Riprendete da un cursore**, non da un istante, all'interno di una sessione di
   sincronizzazione; usate l'istante solo per ripartire dopo un'interruzione lunga.
2. **Confermate esplicitamente** l'avanzamento (`POST /v1/events:ack`) oppure conservate voi la
   posizione: il progetto supporta entrambi i modelli, ma vanno scelti, non mescolati.
3. **Frequenza ragionevole.** Sondare ogni secondo consuma quota e non riduce la latenza in modo
   percepibile: la generazione dell'evento non è istantanea.
4. **Le stesse regole di deduplicazione e ordine** del §7 e §8 valgono identiche. Il sondaggio
   non elimina i duplicati: li rende soltanto meno frequenti.

## 12. Quando non usare le notifiche a spinta

| Situazione | Perché | Alternativa |
|---|---|---|
| Vi serve aggiornare un'interfaccia in tempo reale | La latenza di una notifica non è quella di un'interfaccia; e la notifica arriva al vostro back-end, non al browser | Canale in tempo reale del componente incorporato |
| Vi servono metriche ad alta frequenza | Una richiesta per campione satura ricevente e mittente | Aggregazione e lettura periodica |
| Il contenuto vi servirebbe dentro la notifica | Non succederà, per la ragione del §3.2 | Riferimento e recupero autenticato |
| Vi serve ordinamento stretto fra soggetti diversi | Non è garantito e non lo sarà | Numero di sequenza e riconciliazione |
| Poche decine di eventi al giorno e nessun ricevitore da manutenere | Costruire e mantenere un ricevitore firmato è sproporzionato | Sondaggio, o riepilogo periodico |
| Volete che un pagatore riceva l'esito clinico | **Non è previsto e non è configurabile** | Evento amministrativo del §2.5 |
