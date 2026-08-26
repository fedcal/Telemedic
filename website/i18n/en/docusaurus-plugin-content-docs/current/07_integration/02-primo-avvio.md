---
title: First startup
sidebar_position: 3
description: From zero to a first working integration. Explicit prerequisites, seven verifiable steps one by one, and the points where you get stuck usually - with symptom, cause and remedy.
---

# First startup

This chapter takes you from **zero** to a first integration that actually works: a service
created by your system, a consultation room that opens, a notification that arrives and is
verified, a clinical document that comes back.

It is not an optimistic tutorial. Each step states **how to verify you have passed it**, and
§6 lists in advance the seven points where integrators get stuck, with the exact symptom
you will see.

## 0. The objective, in verifiable form

At the end of this chapter you will have an environment in which this sequence closes without
manual intervention:

```mermaid
sequenceDiagram
    autonumber
    participant BE as Your back-end
    participant AS as Token issuer
    participant API as Application interface
    participant UI as Your interface
    participant WH as Your notification receiver

    BE->>AS: assertion signed with your private key
    AS-->>BE: access token, validity 300 s
    BE->>API: create the service from appointment APT-9931
    API-->>BE: 201, service identifier
    BE->>API: request a single-use entry token
    API-->>BE: token, validity 45 s
    BE-->>UI: component address + token
    UI->>UI: mount the component, deliver the token manually
    Note over UI: the consultation takes place
    API->>WH: notification "service concluded", signed
    WH-->>API: 202 taken into account
    WH->>API: retrieve the clinical document
    API-->>WH: signed document in canonical form
```

If this sequence runs in the test environment, the rest of the integration is volume of work, not
discovery.

## 1. Prerequisites

They are explicit because half the delays come from realising on day three that one of these
things is missing.

### 1.1 Environment

| # | Prerequisite | How to verify |
|---|---|---|
| A1 | An instance of Telemedic reachable, in a test environment | The capability statement responds: `GET https://api.telemedic.example/fhir/metadata` |
| A2 | A tenant identifier assigned | It is communicated to you by whoever installed the system. It appears in every token, every event and every row of the access register |
| A3 | **Secure connection on every path**, even in testing | A component that accesses camera and microphone **does not work** on non-secure connection. It is not configurable |
| A4 | Your back-end reaches in outbound the token issuer and the application interface | An enterprise proxy that intercepts and re-encrypts traffic breaks assertion verification: the proxy certificate must be inserted into the trust chain of your process, or the destination must be excluded |
| A5 | If you want push notifications: an address reachable from the Internet, on secure connection | If you cannot, it is not a problem: polling is used ([04 §9](04-integrazione-per-eventi.md)). But decide now, not after |

### 1.2 Skills

| # | Skill | Where it is used |
|---|---|---|
| B1 | Generate an asymmetric key pair and hold the private one outside the source code | Step 1 |
| B2 | Build and sign an assertion with that key | Step 2 |
| B3 | Publish a document of public keys on secure connection | Step 1 |
| B4 | Read the **raw body** of an HTTP request before any deserialisation | Step 4. If your web layer deserialises and re-serialises JSON, signature verification **will never work out** |
| B5 | Embed a document in a frame, controlling the headers of the hosting page | Step 5 |

### 1.3 Organisational decisions to take beforehand

They are not technical decisions and cannot be made by a developer. If they are not made,
technical integration will work and the service will remain unusable anyway.

| # | Decision | Why it blocks |
|---|---|---|
| C1 | Who is the **data controller** of the clinical data produced | Determines information notices, legal bases, retention and the content of agreements between parties |
| C2 | Who **signs** the clinical documents and with what tool | Determines the reporting flow and whether you need a substitutable module |
| C3 | What is the **declared service availability** | A poorly declared service is more dangerous than the absence of service, because it produces false reassurance |
| C4 | If the clinical document must flow to the record, **who** conveys it | The project produces the content; sending to the infrastructure is a flow with its own obligations and timeframes |
| C5 | If and under what conditions the session can be **recorded** | Recording changes the security properties of the session and requires explicit consent with an information notice that declares it |

Chapter [09](09-obblighi-di-chi-integra.md) explains each of these entries with the responsibility
allocation.

### 1.4 Artefacts you must produce

| # | Artefact | Format |
|---|---|---|
| D1 | Key pair for authentication between systems | Asymmetric key on elliptic curve or RSA. Private key **never** in the repository, never in a container image |
| D2 | Document of public keys | Served on secure connection, with stable key identifier, so you can rotate without coordinating with us |
| D3 | Domain of attribution of your identifiers | A unique identifier of *your* namespace, for patients, professionals and appointments. See [07 §2](07-dati-e-sincronizzazione.md) |
| D4 | List of origins that will host the component | Secure connection only, no domain wildcards |
| D5 | Address of the notification receiver, if applicable | Secure connection only |

## 2. Step 1 - register the client and publish the keys

Onboarding **is not automatic**: an open registration point on a multi-tenant healthcare platform
is a vector for abuse without counterpart. Registration happens administratively, and serves to bind
indissolubly three things: **your client, your tenant and your identity issuer**.

What you communicate:

| Item | Synthetic example | Notes |
|---|---|---|
| Client name | `gestionale-integratore-prod` | One per environment. Never the same client between test and production |
| Address of public key document | `https://gestionale.integratore.example/.well-known/jwks.json` | **Recommended mode.** Delivering keys once is discouraged: it makes rotation a coordinated event |
| Maximum requested scopes | see §3.2 | The tenant cannot grant you more than its own configuration allows |
| Hosting origins | `https://gestionale.integratore.example` | A single registry feeds the permitted origins for embedding, cross-origin sharing and messaging |
| Address of notification receiver | `https://gestionale.integratore.example/webhooks/telemedic` | Verified before activation, see [04 §7](04-integrazione-per-eventi.md) |
| Issuer of your user identity | `https://idp.integratore.example` | Needed only if you will use identity delivery in step 5 |

Your public key document, in brief form:

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

> **Verification of the step.** Your key document responds with JSON content type, on secure
> connection, without authentication, and contains at least one key with `kid` and `use: "sig"`.
> If you serve it behind authentication, the project will not be able to read it.

### 2.1 The rotation rule, worth applying from day one

Publish **two** keys during every rotation: the old one and the new one, with different `kid`.
Sign with the new one; the old one stays published until you are certain no in-flight assertion
uses it. Then remove it.

Whoever designs rotation after putting a single key into production, designs during an incident.

## 3. Step 2 - obtain the first token

### 3.1 The assertion

Build an assertion signed with your private key. The values are illustrative.

```json
// header
{
  "alg": "ES384",
  "kid": "int-2026-08",
  "typ": "JWT"
}
// payload
{
  "iss": "gestionale-integratore-prod",
  "sub": "gestionale-integratore-prod",
  "aud": "https://telemedic.example/realms/clinic/protocol/openid-connect/token",
  "exp": 1787654621,
  "jti": "8f3c1e02-77a1-4f77-9d1a-6a2b3c4d5e6f"
}
```

Four rules that are almost always got wrong:

1. **`iss` and `sub` are both your client identifier.** Not your organisation's issuer, not a user.
2. **`aud` is the address of the token endpoint**, not your system and not the application interface.
3. **`exp` is no more than five minutes in the future.** A long-expiry assertion is a long-lived credential.
4. **`jti` is unique for every assertion.** It serves to prevent reuse: if you reuse one, the
   request is refused and the symptom is confusing because the signature is valid.

### 3.2 The request

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

> **Pay attention to the last field.** The scope returned **may be narrower** than what was
> requested. It is the most recurring integration error: you assume they coincide, you call an
> endpoint you have no scope for and you get an incomprehensible refusal.
> **Read `scope` in the response, always.**

> **Verification of the step.** Obtain a token and, by decoding it, recognise `aud`, `scope`,
> the tenant identifier and a 300-second expiry.

### 3.3 What not to do with this token

- **Do not store it to disk.** It lives five minutes: remake it, it costs a call between back-ends.
- **Do not share it between processes** acting for different organisations.
- **Do not ask for a longer token.** The answer is no, and the motivation is in
  [01 §2.4](01-modalita-di-integrazione.md).
- **Do not log it.** This goes for temporary diagnostic logs too, which are the ones that stay active longest.

## 4. Step 3 - create the first service

The appointment originates in **your** schedule. Telemedic is invoked with an appointment that
already exists.

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

Four substantial observations on this exchange.

**The identifiers are yours, not ours.** You have not created a patient or a professional: you
have pointed out *who* they are, in your domain of attribution. If that reference is new, the
project creates a minimal projection and links it to your identifier; if it exists, it reuses it.
It does not become the reference data. See [07](07-dati-e-sincronizzazione.md).

**The idempotency key is mandatory and you choose it.** It must identify the *logical attempt*,
not the resource: `apt-9931-2026-09-01T10-00` is a good key because retrying the same creation
reproduces it identically. A random value generated on every attempt **is not an idempotency key**:
it is noise, and produces duplicates exactly when you need not to produce them.

**The `metadata` field is opaque.** The project preserves and returns it without ever interpreting it.
It is the right place for your management references. **It is not the place for health data, fiscal
code or date of birth**: it is not field-encrypted, appears in notifications and can appear in
diagnostics. The prohibition is verified with heuristics and produces a refusal or a warning.

**The `ETag` must be preserved.** It is needed for every subsequent modification
([03 §6](03-integrazione-per-api.md)).

> **Verification of the step.** Re-run the same request with the **same** idempotency key
> and the **same** body: you get the same response, not a second service. Then re-run it with the same key
> and a different body: you get an explicit refusal, not a silent substitution.

## 5. Step 4 - receive and verify the first notification

### 5.1 What arrives

Notifications are standardised envelopes, in headers-attributes mode, signed asymmetrically.

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

**There is no clinical content.** There is a reference to a document. The content is retrieved with
an authenticated call, and this is not an omission: it is how a notification towards an address you
do not control stops being a channel for health data leakage.

### 5.2 The four things to do, in order

1. **Read the raw body.** Before any deserialisation. If your web layer re-serialises the JSON
   - reordering keys, changing spaces - the digest will **never** match and you will spend a day
   looking for the error elsewhere.
2. **Verify the body digest**, then the signature, rebuilding the canonical string from the
   components listed in the signature metadata header. The public key is resolved from the key
   identifier from the project's public material via the key identifier.
3. **Check the time window.** Outside five minutes it is refused.
4. **Reply `202` immediately** and work asynchronously. A slow handler triggers retries and
   multiplies the load that was already struggling.

And a fifth rule, which does not concern this event but all future ones: **ignore event types you
do not know**, still returning a positive outcome. Adding an event type is a compatible change: a
receiver that replies with errors on unknown types breaks itself at the first addition.

> **Verification of the step.** Ask for a test event to be sent
> (`POST /v1/webhook-endpoints/{id}/test`), verify the signature, reply `202`. Then
> **alter one byte of the body** in a test and verify that your verification fails: if it does not,
> you are not verifying anything.

## 6. Step 5 - embed the consultation room

The entry token is obtained **between back-ends** and never appears in an address.

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

On the page that hosts, serve the permission policy header and mount the frame:

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
  title="Video consultation"
  allow="camera 'src'; microphone 'src'; display-capture 'src'; fullscreen 'src'; autoplay 'src'"
  sandbox="allow-scripts allow-same-origin allow-forms allow-popups-to-escape-sandbox allow-storage-access-by-user-activation"
  referrerpolicy="strict-origin-when-cross-origin"></iframe>
```

And deliver the token when the component declares it is ready:

```js
const TELEMEDIC_ORIGIN = 'https://embed.telemedic.example';
const frame = document.getElementById('telemedic-frame');

window.addEventListener('message', (event) => {
  if (event.origin !== TELEMEDIC_ORIGIN) return;          // exact comparison, never partial
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
    }, TELEMEDIC_ORIGIN);                                  // never '*'
    delete window.__telemedicEntryToken;
  }

  if (msg.type === 'session.ended') {
    onConsultoConcluso(msg.payload);
  }
});
```

> **Verification of the step.** The room opens, the camera turns on, screen sharing works. If
> video and audio work but screen sharing does not, the screen capture permission was not listed:
> it is a separate item.

## 7. Step 6 - retrieve the clinical document

```http
GET /fhir/Composition/cmp-4410 HTTP/1.1
Host: api.telemedic.example
Authorization: Bearer eyJraWQiOiJ0bS0yMDI2LTA4Iiwi…
Accept: application/fhir+json
```

The document is a **composition inside an envelope**, not a generic diagnostic report: it is the
form prescribed by the Italian guides for the video consultation report (decision D13). The
`DiagnosticReport` form is maintained as a **read-only projection** for integrators who expect it,
never as a primary artefact:

```http
GET /fhir/DiagnosticReport?based-on=Encounter/enc-77213 HTTP/1.1
```

> **Verification of the step.** Retrieve the document, read its status, verify that it is
> associated with the appointment in **your** domain and archive it in your electronic medical record.

## 8. The seven points where you get stuck

They are in order of expected frequency. For each one: the exact symptom, the cause and the remedy.

### 8.1 "The camera does not turn on inside the frame"

**Symptom.** The room loads, the interface responds, the media access request fails with a
permission denied error. Sometimes audio works and video does not, or screen sharing does not.

**Cause.** For a frame on a different origin to use camera or microphone, **two** conditions must
hold: the function must be permitted in the permission policy of the **upper-level** document -
that is, your page - **and** in the frame attribute. The attribute **restricts**, it does not grant:
it cannot give what the upper level denies. If you do not serve the header, the behaviour falls
back to the browser's default, which for camera, microphone and screen capture is restrictive.

**Remedy.** Serve the header on the hosting page. Screen capture must be listed **separately**.
If you cannot serve headers, switch to the "new tab" variant.

### 8.2 "Notification signature verification never works out"

**Symptom.** The signature is always invalid, even on a test event just received.

**Cause.** Nine times out of ten: the framework deserialised and re-serialised the body before
you read it. One time out of ten: you are comparing the computed digest against a string
reconstructed instead of the bytes received; or your server clock is out of sync.

**Remedy.** Read the raw bytes. Verify the body digest **before** the signature: if the digest
does not match, the problem is reading the body; if it matches and the signature does not, the
problem is canonical string construction or key resolution. And synchronise your clock: the
acceptance window is five minutes, not hours.

### 8.3 "I receive the same event twice"

**Symptom.** Two reports published, two notifications to the patient, two rows in billing.

**Cause.** Delivery is **at least once**. It is not a defect: it is the only honest guarantee over
an unreliable channel between two independent systems. "Exactly once" exists only as a joint effect of
*at least once* plus deduplication on your side.

**Remedy.** Deduplicate on the event identifier, with a window at least equal to the replay
window. The project reuses the same value as the idempotency key, so you can use the mechanism
you already have.

### 8.4 "The token is refused and I do not understand why"

**Symptom.** Refusal on the token endpoint, or token obtained but refused on the interface.

**Cause, in order of probability.** The assertion's audience points to the application interface
instead of the token endpoint. The key identifier in the header does not match any key in your
published document. The assertion's unique identifier has already been used. The expiry is too far
away. Or: the token is valid but the granted scope is narrower than requested, and you are calling
an endpoint out of scope.

**Remedy.** Decode the assertion and token and compare the fields one by one. And read `scope`
in the token response: if it is narrower than what you asked, the cause is there.

### 8.5 "The service appears created twice"

**Symptom.** Two services for the same appointment, two different invitations sent to the patient.

**Cause.** Idempotency key generated randomly on every attempt, or omitted on the automatic retry
of your HTTP library - which is exactly the point it was needed for.

**Remedy.** Derive the key from the **logical attempt**: appointment identifier plus scheduled
instant. And make sure the automatic retry reuses the **same** key: if it regenerates it, it is
creating duplicates by design.

### 8.6 "The patient was created twice, with the same fiscal code"

**Symptom.** Two distinct projections for the same person; the history splits.

**Cause.** You sent the identifier **without** a domain of attribution, or with two different
domains in two calls. An identifier without domain is a string, and two identical strings in two
different namespaces are not the same subject.

**Remedy.** Fix **one** domain of attribution for your patients and use it always. The
rejoining procedure exists, is traced and is not automatic, because a wrong merger is an adverse
event and not a data defect. See [07 §5](07-dati-e-sincronizzazione.md).

### 8.7 "It works in testing and not in production"

**Symptom.** All green in testing, all red at first release.

**Recurring causes, in order.** The test client was reused in production, and the tenant is
different. The production hosting origins were not registered. An outbound corporate proxy
intercepts and re-encrypts traffic, and your process's trust chain does not recognise it. Your
notification receiver is reachable from your network but not from the Internet. The production
key was generated but the public document was not updated.

**Remedy.** Treat every environment as its own installation: distinct clients, distinct keys,
distinct origins, distinct tenants. And run the sequence of §0 in production **before** release
to users, not after.

## 9. Completion checklist

| # | Verification | Done |
|---|---|---|
| 1 | I obtain a token and read the **granted** scope, not the requested one | ☐ |
| 2 | I create a service and re-creation with the same key does not produce duplicates | ☐ |
| 3 | The same key with a different body is **refused** | ☐ |
| 4 | I receive a test event, verify its digest and signature, reply `202` in under a second | ☐ |
| 5 | A body altered by one byte **makes** my verification fail | ☐ |
| 6 | An unknown event type is ignored without error | ☐ |
| 7 | The room opens and camera, microphone and screen sharing work | ☐ |
| 8 | The entry token **does not appear** in any address, log or screenshot | ☐ |
| 9 | I retrieve the clinical document and link it to the appointment in my domain | ☐ |
| 10 | I rotated a key at least once, in testing, without disruption | ☐ |
| 11 | Organisational decisions C1-C5 from §1.3 are made and written | ☐ |

Items 5, 6, 8 and 10 are the ones nobody tests, and they are the ones that show up in production.

## 10. What not to do during first startup

- **Do not disable certificate verification** "just to get testing started". It will stay disabled.
- **Do not use a static token hardcoded in a variable** and never promote it. It is the shortest
  path to an indefinite-lifetime credential in production.
- **Do not log request and response bodies by default** in your HTTP layer: you would end up with
  health data in your application logs, with obligations you have not planned for.
- **Do not test integration with real data from real people.** The project in a test environment
  does not have the guarantees of the production environment and - in any case - the software is
  not usable for the provision of healthcare services on real patients until a marking exists ([00 §6.1](00-indice.md)).
- **Do not defer identity delivery.** It is the piece with the most risk: prototype it
  early, even if you implement it later ([06](06-identita-e-delega.md)).
