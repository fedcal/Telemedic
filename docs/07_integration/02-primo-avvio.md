---
title: Primo avvio
sidebar_position: 3
description: Dal nulla a una prima integrazione funzionante. Prerequisiti espliciti, sette passi verificabili uno per uno, e i punti in cui ci si blocca di solito - con sintomo, causa e rimedio.
---

# Primo avvio

Questo capitolo porta da **zero** a una prima integrazione che funziona davvero: una prestazione
creata dal vostro sistema, una stanza di consulto che si apre, una notifica che arriva e viene
verificata, un documento clinico che torna indietro.

Non è un tutorial ottimista. Ogni passo dichiara **come si verifica di averlo superato**, e il
§6 elenca in anticipo i sette punti in cui gli integratori si bloccano, con il sintomo esatto
che vedrete.

## 0. L'obiettivo, in forma verificabile

Al termine di questo capitolo avrete un ambiente in cui questa sequenza si chiude senza
intervento manuale:

```mermaid
sequenceDiagram
    autonumber
    participant BE as Vostro back-end
    participant AS as Emittente dei token
    participant API as Interfaccia applicativa
    participant UI as Vostra interfaccia
    participant WH as Vostro ricevitore di notifiche

    BE->>AS: asserzione firmata con la vostra chiave privata
    AS-->>BE: token di accesso, validità 300 s
    BE->>API: crea la prestazione dall'appuntamento APT-9931
    API-->>BE: 201, identificativo della prestazione
    BE->>API: chiedi un gettone di ingresso monouso
    API-->>BE: gettone, validità 45 s
    BE-->>UI: indirizzo del componente + gettone
    UI->>UI: monta il componente, consegna il gettone a mano
    Note over UI: il consulto si svolge
    API->>WH: notifica «prestazione conclusa», firmata
    WH-->>API: 202 preso in carico
    WH->>API: recupera il documento clinico
    API-->>WH: documento firmato in forma canonica
```

Se questa sequenza gira in ambiente di prova, il resto dell'integrazione è lavoro di volume, non
di scoperta.

## 1. Prerequisiti

Sono espliciti perché la metà dei ritardi nasce dall'accorgersi al terzo giorno che manca una di
queste cose.

### 1.1 Ambiente

| # | Prerequisito | Come si verifica |
|---|---|---|
| A1 | Un'istanza di Telemedic raggiungibile, in ambiente di prova | Il documento di capacità risponde: `GET https://api.telemedic.example/fhir/metadata` |
| A2 | Un identificativo di tenant assegnato | Ve lo comunica chi ha installato il sistema. Compare in ogni token, in ogni evento e in ogni riga del registro degli accessi |
| A3 | **Connessione sicura su tutto il percorso**, anche in prova | Un componente che accede a fotocamera e microfono **non funziona** su connessione non sicura. Non è configurabile |
| A4 | Il vostro back-end raggiunge in uscita l'emittente dei token e l'interfaccia applicativa | Un proxy aziendale che intercetta e ricifra il traffico rompe la verifica delle asserzioni: va inserito il certificato del proxy nella catena di fiducia del vostro processo, oppure va esclusa la destinazione |
| A5 | Se volete ricevere notifiche a spinta: un indirizzo raggiungibile da Internet, su connessione sicura | Se non potete, non è un problema: si usa il sondaggio ([04 §9](04-integrazione-per-eventi.md)). Ma decidetelo ora, non dopo |

### 1.2 Competenze

| # | Competenza | Dove serve |
|---|---|---|
| B1 | Generare una coppia di chiavi asimmetriche e custodire quella privata fuori dal codice sorgente | Passo 1 |
| B2 | Costruire e firmare un'asserzione con quella chiave | Passo 2 |
| B3 | Pubblicare un documento di chiavi pubbliche su connessione sicura | Passo 1 |
| B4 | Leggere il **corpo grezzo** di una richiesta HTTP prima di qualunque deserializzazione | Passo 4. Se il vostro strato web deserializza e riserializza il JSON, la verifica della firma **non tornerà mai** |
| B5 | Incorporare un documento in una cornice, controllando le intestazioni della pagina ospitante | Passo 5 |

### 1.3 Decisioni organizzative da prendere prima

Non sono decisioni tecniche e non le può prendere uno sviluppatore. Se non sono prese,
l'integrazione tecnica funzionerà e il servizio resterà comunque inutilizzabile.

| # | Decisione | Perché blocca |
|---|---|---|
| C1 | Chi è il **titolare del trattamento** dei dati clinici prodotti | Determina informative, basi giuridiche, conservazione e il contenuto degli accordi fra le parti |
| C2 | Chi **firma** i documenti clinici e con quale strumento | Determina il flusso di refertazione e se serve o no un modulo sostitutivo |
| C3 | Qual è la **copertura oraria dichiarata** del servizio | Un servizio mal dichiarato è più pericoloso dell'assenza di servizio, perché produce falsa rassicurazione |
| C4 | Se il documento clinico deve confluire verso il fascicolo, **chi** lo conferisce | Il progetto produce il contenuto; l'invio all'infrastruttura è un flusso con obblighi e termini propri |
| C5 | Se e a quali condizioni la sessione può essere **registrata** | La registrazione cambia le proprietà di sicurezza della sessione e richiede un consenso esplicito con un'informativa che lo dichiari |

Il capitolo [09](09-obblighi-di-chi-integra.md) spiega ciascuna di queste voci con la
ripartizione delle responsabilità.

### 1.4 Artefatti che dovete produrre

| # | Artefatto | Formato |
|---|---|---|
| D1 | Coppia di chiavi per l'autenticazione fra sistemi | Chiave asimmetrica su curva ellittica o RSA. Chiave privata **mai** nel repository, mai in un'immagine di contenitore |
| D2 | Documento di chiavi pubbliche | Servito su connessione sicura, con identificativo di chiave stabile, in modo che possiate ruotare senza coordinarvi con noi |
| D3 | Dominio di attribuzione dei vostri identificativi | Un identificatore univoco del *vostro* spazio dei nomi, per assistiti, professionisti e appuntamenti. Vedi [07 §2](07-dati-e-sincronizzazione.md) |
| D4 | Elenco delle origini che ospiteranno il componente | Solo connessione sicura, nessun carattere jolly di dominio |
| D5 | Indirizzo del ricevitore di notifiche, se applicabile | Solo connessione sicura |

## 2. Passo 1 - registrare il client e pubblicare le chiavi

L'onboarding **non è automatico**: un punto di registrazione aperto su una piattaforma sanitaria
multi-tenant è un vettore di abuso senza contropartita. La registrazione avviene per via
amministrativa, e serve a legare in modo indissolubile tre cose: **il vostro client, il vostro
tenant e il vostro emittente di identità**.

Che cosa comunicate:

| Voce | Esempio sintetico | Note |
|---|---|---|
| Nome del client | `gestionale-integratore-prod` | Uno per ambiente. Mai lo stesso client fra prova e produzione |
| Indirizzo del documento di chiavi pubbliche | `https://gestionale.integratore.example/.well-known/jwks.json` | **Modalità raccomandata.** Consegnare le chiavi una volta sola è sconsigliato: rende la rotazione un evento coordinato |
| Ambiti massimi richiesti | vedi §3.2 | Il tenant non può concedervi più di quanto la propria configurazione ammetta |
| Origini ospitanti | `https://gestionale.integratore.example` | Un unico registro alimenta le origini ammesse per l'incorporamento, per la condivisione fra origini e per la messaggistica |
| Indirizzo del ricevitore di notifiche | `https://gestionale.integratore.example/webhooks/telemedic` | Verificato prima dell'attivazione, vedi [04 §7](04-integrazione-per-eventi.md) |
| Emittente della vostra identità utente | `https://idp.integratore.example` | Serve solo se userete la consegna dell'identità del passo 5 |

Il vostro documento di chiavi pubbliche, in forma sintetica:

```json
{
  "keys": [
    {
      "kty": "EC",
      "crv": "P-384",
      "kid": "int-2026-08",
      "use": "sig",
      "alg": "ES384",
      "x": "3BQ0…",
      "y": "9pTn…"
    }
  ]
}
```

> **Verifica del passo.** Il vostro documento di chiavi risponde con tipo di contenuto JSON, su
> connessione sicura, senza autenticazione, e contiene almeno una chiave con `kid` e `use: "sig"`.
> Se lo servite dietro autenticazione, il progetto non potrà leggerlo.

### 2.1 La regola sulla rotazione, che conviene applicare dal primo giorno

Pubblicate **due** chiavi durante ogni rotazione: la vecchia e la nuova, con `kid` diversi.
Firmate con la nuova; la vecchia resta pubblicata finché non siete certi che nessuna asserzione
in volo la usi. Poi la togliete.

Chi progetta la rotazione dopo aver messo in produzione una sola chiave, la progetta durante un
incidente.

## 3. Passo 2 - ottenere il primo token

### 3.1 L'asserzione

Costruite un'asserzione firmata con la vostra chiave privata. I valori sono illustrativi.

```json
// intestazione
{
  "alg": "ES384",
  "kid": "int-2026-08",
  "typ": "JWT"
}
// contenuto
{
  "iss": "gestionale-integratore-prod",
  "sub": "gestionale-integratore-prod",
  "aud": "https://telemedic.example/realms/clinic/protocol/openid-connect/token",
  "exp": 1787654621,
  "jti": "8f3c1e02-77a1-4f77-9d1a-6a2b3c4d5e6f"
}
```

Quattro regole che si sbagliano quasi sempre:

1. **`iss` e `sub` sono entrambi il vostro identificativo di client.** Non l'emittente della
   vostra organizzazione, non un utente.
2. **`aud` è l'indirizzo dell'endpoint di token**, non il vostro sistema e non l'interfaccia
   applicativa.
3. **`exp` non è più di cinque minuti nel futuro.** Un'asserzione a lunga scadenza è una
   credenziale a lunga scadenza.
4. **`jti` è unico per ogni asserzione.** Serve a impedire il riuso: se ne riutilizzate uno, la
   richiesta viene rifiutata e il sintomo è confondente perché la firma è valida.

### 3.2 La richiesta

```http
POST /realms/clinic/protocol/openid-connect/token HTTP/1.1
Host: telemedic.example
Content-Type: application/x-www-form-urlencoded
Accept: application/json

grant_type=client_credentials
&scope=system%2FEncounter.cu%20https%3A%2F%2Ftelemedic.example%2Fscopes%2Fsession.start
&client_assertion_type=urn%3Aietf%3Aparams%3Aoauth%3Aclient-assertion-type%3Ajwt-bearer
&client_assertion=eyJhbGciOiJFUzM4NCIsImtpZCI6ImludC0yMDI2LTA4IiwidHlwIjoiSldUIn0…
```

```json
{
  "access_token": "eyJraWQiOiJ0bS0yMDI2LTA4Iiwi…",
  "token_type": "bearer",
  "expires_in": 300,
  "scope": "system/Encounter.cu https://telemedic.example/scopes/session.start"
}
```

> **Attenzione all'ultimo campo.** L'ambito restituito **può essere più ristretto** di quello
> richiesto. È l'errore di integrazione più ricorrente: si assume che coincida, si chiama un
> endpoint per cui l'ambito non è stato concesso e si riceve un rifiuto incomprensibile.
> **Leggete `scope` nella risposta, sempre.**

> **Verifica del passo.** Ottenete un token e, decodificandolo, riconoscete `aud`, `scope`,
> l'identificativo del tenant e una scadenza di 300 secondi.

### 3.3 Che cosa non fare con questo token

- **Non memorizzarlo su disco.** Vive cinque minuti: rifarlo costa una chiamata fra back-end.
- **Non condividerlo fra processi** che agiscono per organizzazioni diverse.
- **Non chiedere un token più lungo.** La risposta è no, e la motivazione è in
  [01 §2.4](01-modalita-di-integrazione.md).
- **Non registrarlo nei log.** Vale anche per i log di diagnostica temporanei, che sono quelli
  che restano attivi più a lungo.

## 4. Passo 3 - creare la prima prestazione

L'appuntamento nasce nella **vostra** agenda. Telemedic viene invocato con un appuntamento che
esiste già.

```http
POST /v1/sessions HTTP/1.1
Host: api.telemedic.example
Authorization: Bearer eyJraWQiOiJ0bS0yMDI2LTA4Iiwi…
Content-Type: application/json
Idempotency-Key: apt-9931-2026-09-01T10-00

{
  "tenant": "asl-nord-01",
  "serviceType": "televisita",
  "appointment": {
    "system": "https://gestionale.integratore.example/sid/appuntamento",
    "value": "APT-9931"
  },
  "patient": {
    "system": "https://gestionale.integratore.example/sid/assistito",
    "value": "PZ-889231"
  },
  "practitioner": {
    "system": "https://gestionale.integratore.example/sid/professionista",
    "value": "PR-77"
  },
  "scheduledStart": "2026-09-01T10:00:00+02:00",
  "scheduledEnd": "2026-09-01T10:30:00+02:00",
  "metadata": {
    "codiceBranca": "08",
    "idPrenotazioneEsterna": "PR-2026-8877123"
  }
}
```

```http
HTTP/1.1 201 Created
Location: /v1/sessions/ses-01J9ZC5P
ETag: W/"1"
Content-Type: application/json
```

```json
{
  "id": "ses-01J9ZC5P",
  "tenant": "asl-nord-01",
  "status": "scheduled",
  "serviceType": "televisita",
  "encounter": { "reference": "Encounter/enc-77213" },
  "scheduledStart": "2026-09-01T08:00:00.000Z",
  "invitations": [
    {
      "role": "patient",
      "url": "https://embed.telemedic.example/j/8Wq2-K7pd-4Nx1",
      "expiresAt": "2026-09-01T09:00:00.000Z"
    }
  ],
  "metadata": {
    "codiceBranca": "08",
    "idPrenotazioneEsterna": "PR-2026-8877123"
  },
  "links": {
    "self": "/v1/sessions/ses-01J9ZC5P",
    "encounter": "/fhir/Encounter/enc-77213"
  }
}
```

Quattro osservazioni sostanziali su questo scambio.

**Gli identificativi sono i vostri, non nostri.** Non avete creato un assistito né un
professionista: avete indicato *quali* sono, nel vostro dominio di attribuzione. Se quel
riferimento è nuovo, il progetto crea una proiezione minima e la lega al vostro identificativo;
se esiste, la riusa. Non diventa il dato di riferimento. Vedi
[07](07-dati-e-sincronizzazione.md).

**La chiave di idempotenza è obbligatoria e la scegliete voi.** Deve identificare il *tentativo
logico*, non la risorsa: `apt-9931-2026-09-01T10-00` è una buona chiave perché ritentare
la stessa creazione la riproduce identica. Un valore casuale generato a ogni tentativo **non è
una chiave di idempotenza**: è rumore, e produce duplicati esattamente quando serve non
produrne.

**Il campo `metadata` è opaco.** Il progetto lo conserva e ve lo restituisce senza mai
interpretarlo. È il posto giusto per i vostri riferimenti gestionali. **Non è il posto per dati
sanitari, per il codice fiscale o per una data di nascita**: non è cifrato campo per campo,
compare nelle notifiche e può comparire in diagnostica. Il divieto è verificato con euristiche e
produce un rifiuto o un avviso.

**L'`ETag` va conservato.** Serve per ogni modifica successiva
([03 §6](03-integrazione-per-api.md)).

> **Verifica del passo.** Rieseguite la stessa richiesta con la **stessa** chiave di idempotenza
> e lo **stesso** corpo: ottenete la stessa risposta, non una seconda prestazione. Poi
> rieseguitela con la stessa chiave e un corpo diverso: ottenete un rifiuto esplicito, non una
> sostituzione silenziosa.

## 5. Passo 4 - ricevere e verificare la prima notifica

### 5.1 Che cosa arriva

Le notifiche sono buste standardizzate, in modalità con attributi nelle intestazioni, firmate in
modo asimmetrico.

```http
POST /webhooks/telemedic HTTP/1.1
Host: gestionale.integratore.example
ce-specversion: 1.0
ce-type: it.telemedic.session.completed.v1
ce-source: /tenants/t0001/sessions
ce-subject: ses-01J9ZC5P
ce-id: 8f3c1e02-77a1-4f77-9d1a-6a2b3c4d5e6f
ce-time: 2026-09-01T08:41:22.481Z
Content-Type: application/json
Content-Digest: sha-256=:X48E9qOokqqrvdts8nOJRJN3OWDUoyWxBf7kbu9DBPE=:
Signature-Input: sig1=("@method" "@target-uri" "content-digest" "ce-id" "ce-type");\
  created=1787654321;keyid="tm-2026-08";alg="ecdsa-p384-sha384";expires=1787654621
Signature: sig1=:MEUCIQDf1sK9x0Rz…:
Idempotency-Key: 8f3c1e02-77a1-4f77-9d1a-6a2b3c4d5e6f

{
  "tenant": "t0001",
  "sessionId": "ses-01J9ZC5P",
  "encounter": { "reference": "Encounter/enc-77213" },
  "appointment": {
    "system": "https://gestionale.integratore.example/sid/appuntamento",
    "value": "APT-9931"
  },
  "outcome": "completed",
  "startedAt": "2026-09-01T08:12:04.000Z",
  "endedAt": "2026-09-01T08:41:19.000Z",
  "recorded": false,
  "documents": [
    { "kind": "referto", "reference": "Composition/cmp-4410", "status": "final" }
  ]
}
```

**Non c'è contenuto clinico.** C'è un riferimento a un documento. Il contenuto si recupera con
una chiamata autenticata, e questo non è un'omissione: è il modo in cui una notifica verso un
indirizzo che non controlliamo smette di essere un canale di fuga di dati sanitari.

### 5.2 Le quattro cose da fare, nell'ordine

1. **Leggere il corpo grezzo.** Prima di ogni deserializzazione. Se il vostro strato web
   riserializza il JSON - riordinando le chiavi, cambiando gli spazi - l'impronta non
   corrisponderà **mai** e passerete un giorno a cercare l'errore altrove.
2. **Verificare l'impronta del corpo**, poi la firma, ricostruendo la stringa canonica dai
   componenti elencati nell'intestazione dei metadati di firma. La chiave pubblica si risolve
   dal materiale pubblico del progetto tramite l'identificativo di chiave.
3. **Controllare la finestra temporale.** Fuori da cinque minuti si rifiuta.
4. **Rispondere `202` subito** e lavorare in modo asincrono. Un gestore lento innesca i
   ritentativi e moltiplica il carico che stava già faticando a reggere.

E una quinta regola, che non riguarda questo evento ma tutti i futuri: **ignorate i tipi di
evento che non conoscete**, restituendo comunque un esito positivo. L'aggiunta di un tipo di
evento è una modifica compatibile: un ricevitore che risponde con errore sui tipi sconosciuti si
rompe da solo alla prima aggiunta.

> **Verifica del passo.** Chiedete l'invio di un evento di prova
> (`POST /v1/webhook-endpoints/{id}/test`), verificate la firma, rispondete `202`. Poi
> **alterate un byte del corpo** in un test e verificate che la vostra verifica fallisca: se non
> fallisce, non state verificando nulla.

## 6. Passo 5 - incorporare la stanza del consulto

Il gettone di ingresso si ottiene **fra back-end** e non compare mai in un indirizzo.

```http
POST /v1/sessions/ses-01J9ZC5P/entry-tokens HTTP/1.1
Host: api.telemedic.example
Authorization: Bearer eyJraWQiOiJ0bS0yMDI2LTA4Iiwi…
Content-Type: application/json

{
  "actor": { "role": "practitioner",
             "system": "https://gestionale.integratore.example/sid/professionista",
             "value": "PR-77" },
  "hostOrigin": "https://gestionale.integratore.example"
}
```

```json
{
  "token": "ott_3f7b9a20-3e01-4c9d-8c1b-2e4f5a6b7c8d",
  "expiresIn": 45,
  "singleUse": true,
  "embedUrl": "https://embed.telemedic.example/room?s=ses-01J9ZC5P"
}
```

Sulla pagina che ospita, servite l'intestazione di politica dei permessi e montate la cornice:

```http
Permissions-Policy: camera=(self "https://embed.telemedic.example"),
                    microphone=(self "https://embed.telemedic.example"),
                    display-capture=(self "https://embed.telemedic.example"),
                    fullscreen=(self "https://embed.telemedic.example")
```

```html
<iframe
  id="telemedic-frame"
  src="https://embed.telemedic.example/room?s=ses-01J9ZC5P"
  title="Televisita"
  allow="camera 'src'; microphone 'src'; display-capture 'src'; fullscreen 'src'; autoplay 'src'"
  sandbox="allow-scripts allow-same-origin allow-forms allow-popups-to-escape-sandbox allow-storage-access-by-user-activation"
  referrerpolicy="strict-origin-when-cross-origin"></iframe>
```

E consegnate il gettone quando il componente dichiara di essere pronto:

```js
const TELEMEDIC_ORIGIN = 'https://embed.telemedic.example';
const frame = document.getElementById('telemedic-frame');

window.addEventListener('message', (event) => {
  if (event.origin !== TELEMEDIC_ORIGIN) return;          // confronto esatto, mai parziale
  if (event.source !== frame.contentWindow) return;
  const msg = event.data;
  if (!msg || typeof msg !== 'object') return;
  if (msg.protocol !== 'telemedic.embed.v1') return;

  if (msg.type === 'embed.ready') {
    frame.contentWindow.postMessage({
      protocol: 'telemedic.embed.v1',
      id: crypto.randomUUID(),
      replyTo: msg.id,
      type: 'session.auth',
      payload: { entryToken: window.__telemedicEntryToken }
    }, TELEMEDIC_ORIGIN);                                  // mai '*'
    delete window.__telemedicEntryToken;
  }

  if (msg.type === 'session.ended') {
    onConsultoConcluso(msg.payload);
  }
});
```

> **Verifica del passo.** La stanza si apre, la fotocamera si accende, la condivisione dello
> schermo funziona. Se video e audio funzionano ma la condivisione no, il permesso di cattura
> dello schermo non è stato elencato: è una voce separata.

## 7. Passo 6 - recuperare il documento clinico

```http
GET /fhir/Composition/cmp-4410 HTTP/1.1
Host: api.telemedic.example
Authorization: Bearer eyJraWQiOiJ0bS0yMDI2LTA4Iiwi…
Accept: application/fhir+json
```

Il documento è una **composizione dentro una busta**, non un referto diagnostico generico: è la
forma prescritta dalle guide italiane per il referto di televisita (decisione D13). La forma
`DiagnosticReport` è mantenuta come **proiezione in sola lettura** per gli integratori che se
l'aspettano, mai come artefatto primario:

```http
GET /fhir/DiagnosticReport?based-on=Encounter/enc-77213 HTTP/1.1
```

> **Verifica del passo.** Recuperate il documento, ne leggete lo stato, verificate che sia
> associato all'appuntamento del **vostro** dominio e lo archiviate nella vostra cartella
> clinica.

## 8. I sette punti in cui ci si blocca

Sono in ordine di frequenza attesa. Per ciascuno: il sintomo esatto, la causa e il rimedio.

### 8.1 «La fotocamera non si accende dentro la cornice»

**Sintomo.** La stanza si carica, l'interfaccia risponde, la richiesta di accesso al media
fallisce con un errore di permesso negato. Talvolta l'audio funziona e il video no, o la
condivisione dello schermo no.

**Causa.** Perché una cornice su origine diversa possa usare fotocamera o microfono servono
**due** condizioni: la funzione deve essere consentita nella politica dei permessi del documento
**di livello superiore** - cioè la vostra pagina - **e** nell'attributo della cornice.
L'attributo **restringe**, non concede: non può dare ciò che il livello superiore nega. Se non
servite l'intestazione, il comportamento ricade sul valore predefinito del browser, che per
fotocamera, microfono e cattura dello schermo è restrittivo.

**Rimedio.** Servite l'intestazione sulla pagina ospitante. La cattura dello schermo va elencata
**a parte**. Se non potete servire intestazioni, passate alla variante «nuova scheda».

### 8.2 «La verifica della firma della notifica non torna mai»

**Sintomo.** La firma è sempre non valida, anche su un evento di prova appena ricevuto.

**Causa.** Nove volte su dieci: il framework ha deserializzato e riserializzato il corpo prima
che voi lo leggeste. Una volta su dieci: state confrontando l'impronta calcolata su una stringa
ricostruita invece che sui byte ricevuti; oppure l'orologio del vostro server è fuori sincronia.

**Rimedio.** Leggete i byte grezzi. Verificate poi l'impronta del corpo **prima** della firma:
se l'impronta non torna, il problema è la lettura del corpo; se torna e la firma no, il problema
è la costruzione della stringa canonica o la risoluzione della chiave. E sincronizzate
l'orologio: la finestra di accettazione è di cinque minuti, non di ore.

### 8.3 «Ricevo due volte lo stesso evento»

**Sintomo.** Due referti pubblicati, due notifiche all'assistito, due righe in fatturazione.

**Causa.** La consegna è **almeno una volta**. Non è un difetto: è l'unica garanzia onesta su un
canale inaffidabile fra due sistemi indipendenti. «Esattamente una volta» esiste solo come
effetto congiunto di *almeno una volta* più deduplicazione dal vostro lato.

**Rimedio.** Deduplicate sull'identificativo dell'evento, con una finestra almeno pari a quella
di replay. Il progetto riusa lo stesso valore come chiave di idempotenza, così potete usare il
meccanismo che avete già.

### 8.4 «Il token viene rifiutato e non capisco perché»

**Sintomo.** Rifiuto sull'endpoint di token, oppure token ottenuto ma rifiutato sull'interfaccia.

**Causa, in ordine di probabilità.** L'audience dell'asserzione punta all'interfaccia
applicativa invece che all'endpoint di token. L'identificativo di chiave dell'intestazione non
corrisponde a nessuna chiave del vostro documento pubblicato. L'identificativo univoco
dell'asserzione è stato già usato. La scadenza è troppo lontana. Oppure: il token è valido ma
l'ambito concesso è più ristretto di quello richiesto, e state chiamando un endpoint fuori
ambito.

**Rimedio.** Decodificate l'asserzione e il token e confrontate i campi uno per uno. E leggete
`scope` nella risposta di token: se è più corto di quello che avete chiesto, la causa è lì.

### 8.5 «La prestazione risulta creata due volte»

**Sintomo.** Due prestazioni per lo stesso appuntamento, due inviti diversi recapitati
all'assistito.

**Causa.** Chiave di idempotenza generata casualmente a ogni tentativo, oppure omessa nel
ritentativo automatico della vostra libreria HTTP - che è esattamente il punto in cui serviva.

**Rimedio.** Derivate la chiave dal **tentativo logico**: identificativo dell'appuntamento più
istante programmato. E assicuratevi che il ritentativo automatico riusi la **stessa** chiave: se
la rigenera, sta creando duplicati per costruzione.

### 8.6 «L'assistito è stato creato due volte, con lo stesso codice fiscale»

**Sintomo.** Due proiezioni distinte per la stessa persona; lo storico si divide.

**Causa.** Avete inviato l'identificativo **senza** dominio di attribuzione, oppure con due
domini diversi in due chiamate. Un identificatore senza dominio è una stringa, e due stringhe
uguali in due spazi dei nomi diversi non sono lo stesso soggetto.

**Rimedio.** Fissate **un** dominio di attribuzione per i vostri assistiti e usatelo sempre. La
procedura di ricongiungimento esiste, è tracciata e non è automatica, perché una fusione errata
è un evento avverso e non un difetto di dati. Vedi [07 §5](07-dati-e-sincronizzazione.md).

### 8.7 «Funziona in prova e non in produzione»

**Sintomo.** Tutto verde in prova, tutto rosso al primo rilascio.

**Cause ricorrenti, in ordine.** Il client di prova è stato riusato in produzione, e il tenant è
diverso. Le origini ospitanti di produzione non sono state registrate. Un proxy aziendale in
uscita intercetta e ricifra il traffico, e la catena di fiducia del vostro processo non lo
riconosce. Il vostro ricevitore di notifiche è raggiungibile dalla vostra rete ma non da
Internet. La chiave di produzione è stata generata ma il documento pubblico non è stato
aggiornato.

**Rimedio.** Trattate ogni ambiente come un'installazione a sé: client distinti, chiavi
distinte, origini distinte, tenant distinti. E fate girare la sequenza del §0 in produzione
**prima** del rilascio agli utenti, non dopo.

## 9. Lista di verifica di completamento

| # | Verifica | Fatto |
|---|---|---|
| 1 | Ottengo un token e leggo l'ambito **concesso**, non quello richiesto | ☐ |
| 2 | Creo una prestazione e la ricreazione con la stessa chiave non produce duplicati | ☐ |
| 3 | La stessa chiave con corpo diverso viene **rifiutata** | ☐ |
| 4 | Ricevo un evento di prova, ne verifico impronta e firma, rispondo `202` in meno di un secondo | ☐ |
| 5 | Un corpo alterato di un byte **fa fallire** la mia verifica | ☐ |
| 6 | Un tipo di evento sconosciuto viene ignorato senza errore | ☐ |
| 7 | La stanza si apre e fotocamera, microfono e condivisione dello schermo funzionano | ☐ |
| 8 | Il gettone di ingresso **non compare** in alcun indirizzo, registro o schermata | ☐ |
| 9 | Recupero il documento clinico e lo lego all'appuntamento del mio dominio | ☐ |
| 10 | Ho ruotato una chiave almeno una volta, in prova, senza interruzione | ☐ |
| 11 | Le decisioni organizzative C1-C5 del §1.3 sono prese e scritte | ☐ |

Le voci 5, 6, 8 e 10 sono quelle che nessuno prova, e sono quelle che si presentano in
produzione.

## 10. Che cosa non fare durante il primo avvio

- **Non disabilitare la verifica dei certificati** «solo per far partire la prova». Resterà
  disabilitata.
- **Non usare un token statico incollato in una variabile** e non promuoverlo mai. È la strada
  più breve verso una credenziale a vita indefinita in produzione.
- **Non registrare corpi di richiesta e risposta per default** nel vostro strato HTTP: finireste
  per avere dati sanitari nei vostri registri applicativi, con obblighi che non avete pianificato.
- **Non provare l'integrazione con dati reali di persone reali.** Il progetto in ambiente di
  prova non ha le garanzie dell'ambiente di produzione e - in ogni caso - il software non è
  utilizzabile per l'erogazione di prestazioni sanitarie su pazienti reali finché non esiste una
  marcatura ([00 §6.1](00-indice.md)).
- **Non rinviare il passo della consegna dell'identità.** È il pezzo con più rischio: prototipatelo
  presto, anche se lo implementate dopo ([06](06-identita-e-delega.md)).
