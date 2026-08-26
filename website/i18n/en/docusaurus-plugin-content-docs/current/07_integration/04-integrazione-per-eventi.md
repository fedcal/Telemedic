---
title: Integration for events
sidebar_position: 5
description: Catalogue of public events, subscription, asymmetric signing, retries, ordering, deduplication and proof of delivery. With the non-guarantees explicitly declared.
---

# Integration for events

The return of information to your system is the part of integration that decides whether the
project is useful or is an island. A consultation room that opens is noticeable; a report that
arrives in the correct clinical record, reconciled with the correct patient, without duplicates,
is what makes the system adoptable.

## 1. What is guaranteed and what is not

The section comes before the catalogue because it is the guarantees that determine how you must
write your receiver.

### 1.1 Guarantees

| # | Guarantee | How to verify |
|---|---|---|
| G1 | **Authenticity** - you can prove the message comes from the project | Asymmetric signature verifiable with public material. §5 |
| G2 | **Integrity** - the content has not been altered | Body digest, covered by the signature. §5 |
| G3 | **Freshness** - it is not the replay of an old message | Creation instant inside the signature, five-minute window. §5 |
| G4 | **At-least-once delivery** - no event is lost | Inspectable delivery register, dead-letter queue with recovery. §6, §9 |
| G5 | **Non-blocking** - a slow receiver does not degrade the project | Circuit breaker per destination, isolation between tenants. §6.3 |
| G6 | **Observability** - you can see what was delivered and what was not | Delivery consultation interface. §9 |
| G7 | **No clinical content in transit** | Body inspection: contains references, not content. §3.2 |

### 1.2 Non-guarantees, declared

They are equally important, and are stated here instead of being discovered in production.

| # | Non-guarantee | What you must do |
|---|---|---|
| N1 | **It is not exactly-once delivery** | Deduplicate. §8 |
| N2 | **There is no global ordering** | Do not depend on arrival order. §7 |
| N3 | **Delivery is not immediate** | Do not use the absence of an event as information within a few seconds |
| N4 | **An event is not a transaction** | Receiving the event does not mean your work is atomic with ours |
| N5 | **Absence of events does not prove nothing happened** | The channel may be degraded. Watch the **expected volume**: silence is never normality (constraint V-09) |

The N5 row escapes most often. A notification channel that stops working produces exactly the
same signal as a period with no activity: no incoming request. If your system treats silence as
"everything is fine", a defect stays invisible until someone notices that reports from two weeks
are missing. The project emits a periodic signal for exactly this reason (§6.5).

## 2. The public events catalogue

Types are hierarchical and **carry the version in the name**: `it.telemedic.<domain>.<fact>.v<N>`.
The version is part of the type, so you can ignore a version you do not know instead of failing
on an unexpected field.

The list is *project proposal* in its composition; the form of the envelope and the delivery
rules are described in the sections that follow.

### 2.1 "Service" domain

| Type | When | Subject | Data content |
|---|---|---|---|
| `it.telemedic.session.scheduled.v1` | The service was created from an appointment | service | references, scheduled instants, service type |
| `it.telemedic.session.invitation.sent.v1` | An invitation was delivered | service | recipient in indirect form, channel, delivery outcome |
| `it.telemedic.session.started.v1` | The media session was started | service | instant, mode (with or without recording) |
| `it.telemedic.session.participant.joined.v1` | A participant entered | service | role of participant, instant |
| `it.telemedic.session.quality.degraded.v1` | Quality dropped below the tenant's stated threshold | service | degradation class, automatic action taken |
| `it.telemedic.session.recording.started.v1` | Recording was activated | service | reference to the consent that legitimises it |
| `it.telemedic.session.recording.stopped.v1` | Recording was stopped | service | cause |
| `it.telemedic.session.completed.v1` | The service concluded | service | outcome, instants, references to produced documents |
| `it.telemedic.session.failed.v1` | The service could not take place due to technical cause | service | fault class, not the diagnostic detail |
| `it.telemedic.session.cancelled.v1` | Cancelled before taking place | service | who cancelled, in role form |
| `it.telemedic.session.no-show.v1` | No one showed up within the declared window | service | wait window applied |

The last two rows deserve a note. `cancelled` and `no-show` **are not the same thing** and must
not be collapsed: the first is a decision, the second is an absence. Many systems record them the
same way and lose the information needed to distinguish an organisational problem from an access
problem.

### 2.2 "Clinical documentation" domain

| Type | When | Notes |
|---|---|---|
| `it.telemedic.document.drafted.v1` | A document is being drafted | It is not a valid document: do not archive it as such |
| `it.telemedic.document.signed.v1` | A document was signed | **It is the event on which to act** for archival in your record |
| `it.telemedic.document.superseded.v1` | A later version replaces or corrects the previous one | The signed document is immutable: it is not modified, it is replaced maintaining the chain. Your system must be able to represent a replacement, not overwrite |

### 2.3 "Consent" domain

| Type | When |
|---|---|
| `it.telemedic.consent.granted.v1` | A consent was obtained, with its temporal validity |
| `it.telemedic.consent.revoked.v1` | A consent was revoked |

Consent is **a fact with temporal validity**, not a boolean value. If your system represents it as
a checkbox, you will not be able to answer the question "was it valid at that moment?", which is
the only question that matters when there is a dispute.

### 2.4 "Remote monitoring and alerts" domain

| Type | When | Notes |
|---|---|---|
| `it.telemedic.monitoring.plan.activated.v1` | A monitoring plan is active | The plan is versioned: the event carries the version |
| `it.telemedic.monitoring.measurement.received.v1` | A measurement arrived | Reference, **never the value** |
| `it.telemedic.monitoring.adherence.missed.v1` | An expected measurement **did not** arrive within the window | It is the direct application of constraint V-09 |
| `it.telemedic.alert.raised.v1` | A threshold configured by the professional was exceeded | **The threshold is configuration per patient, never deduced by the system** |
| `it.telemedic.alert.acknowledged.v1` | The alert was taken into account | With the identifier of who took it into account, in indirect form |
| `it.telemedic.alert.escalated.v1` | The alert moved to the next level due to lack of response | |
| `it.telemedic.alert.unattended.v1` | Escalation exhausted **without** anyone responding | It is the most important event in the domain, and it is the one systems forget to model |

### 2.5 Administrative domain

| Type | When | **Invaluable limit** |
|---|---|---|
| `it.telemedic.billing.encounter.billable.v1` | The service is billable | **Contains exclusively**: service identifier, service type, instants, administrative outcome, amount, references to your domain. **No reference to clinical documents, no diagnosis, no reason for contact** |

This event is the channel of the **payer** - fund, mutual, policy - and its composition is not
a product choice: it follows from the fact that the payer is not a consulting party. The full
treatment, with the permitted authorisation profile, is in [09 §5](09-obblighi-di-chi-integra.md).
No configuration of tenant, no filter and no substitutable module can enrich this event with
clinical content.

### 2.6 "Channel" domain

| Type | When |
|---|---|
| `it.telemedic.endpoint.verification.v1` | Verification of destination ownership, before activation |
| `it.telemedic.endpoint.heartbeat.v1` | Periodic signal, to distinguish "no events" from "channel broken" |
| `it.telemedic.webhook.endpoint.degraded.v1` | Your destination is failing persistently. Delivered to **administrators of the tenant**, not to the destination that is failing |

## 3. Anatomy of delivery

### 3.1 The envelope

Envelopes follow a sector specification for context attributes, in **headers-attributes mode**:
attributes go in headers with `ce-` prefix, application data in the body.

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

> **Trap verified to be coded in your tests.** A `ce-datacontenttype` header
> **must not be present**: the specification explicitly forbids it, and the event's content type must
> be written **only** in the standard header. If your parser looks for it, it will never find it -
> and that is correct.

### 3.2 Why the body does not contain the report

The body carries **references**, not content. Three converging motivations, and none of the three
is circumventable by configuration:

1. **Minimisation.** Particular data that is not transmitted cannot be mishandled.
2. **Harm reduction.** A mis-configured destination - a test address left in production, a log that
   stores bodies - becomes a health data leak. With references it becomes an identifier leak, which
   is serious but is not the same thing.
3. **Recipient authorisation.** By retrieving the content, you **present** an authorisation, and the
   access ends up in the log with your name. With pushed content, the access would not exist as a
   traceable event.

The cost is one more call. It is a cost the project accepts consciously.

## 4. Subscription and destination configuration

### 4.1 Register a destination

```http
POST /v1/webhook-endpoints HTTP/1.1
Host: api.telemedic.example
Authorization: Bearer …
Content-Type: application/json
Idempotency-Key: wh-gestionale-prod-01

{
  "tenant": "asl-nord-01",
  "url": "https://gestionale.integratore.example/webhooks/telemedic",
  "description": "Production receiver of the management system",
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

Four hygiene rules that spare you incidents:

1. **Subscribe only to types you handle.** Receiving everything "for safety" means processing
   events you do not know how to interpret, and your log fills with noise that hides real problems.
2. **One destination per environment.** A test destination pointing to production is the most banal
   and most frequent incident of this family.
3. **Secure connection only.** The project refuses any other scheme. It is not configurable, not
   even in testing.
4. **The destination must be reachable from the Internet**, not just from your network. If it
   cannot be, the right model is polling (§11), not a network opening granted reluctantly.

### 4.2 Ownership verification, before activation

Before a destination receives a single real event, the project sends a verification with a
challenge you must sign or return. It serves to prevent someone registering as a destination a
system they do not control, which would be a reflected denial of service attack at a third party's
expense.

Until verification is passed, the destination stays **inactive** and events accumulate in the
outbound queue, they are not lost.

### 4.3 What the project does with the address you give it

An address provided by an integrator is, from the perspective of whoever calls it, a request
outbound towards an arbitrary destination. It is the most underestimated risk in notification
systems. The countermeasures applied, stated because they explain refusals that otherwise seem
arbitrary:

| # | Countermeasure | Visible effect for you |
|---|---|---|
| 1 | Secure connection only | A different scheme is refused at registration |
| 2 | Blocking of non-routable networks and infrastructure service addresses | An address that resolves to a private network is refused |
| 3 | Name resolution and verification **of the resolved address**, not just the name | A public name that resolves to an internal address is refused |
| 4 | Connection to the resolved address, with original name in the header and negotiation | Immune to resolution change between verification and connection |
| 5 | **Redirects not followed** | A redirect from your endpoint is treated as failure, not followed |
| 6 | Egress network isolation of the delivery component | - |
| 7 | **No echo of your response body** in the consultation interface, beyond a cleaned excerpt | You see status, latency and first bytes, not the whole response |
| 8 | Tight timeouts and response size limit | A slow or huge response counts as failure |
| 9 | List of permitted destinations, for tenants who request it | Autonomous registration is disabled on those tenants |

Point 6 is the real defence: the application countermeasures are defence in depth, not primary
defence.

## 5. Signing

### 5.1 The method, and the two references to keep distinct

The signature is **asymmetric** and uses the normalised method for HTTP message signing, which
covers a declared set of message components: method, destination address, body digest and the
chosen headers, with explicit parameters of key identifier, algorithm, creation instant and expiry.

> **Caution on a point that generates confusion.** The HTTP message signing specification
> **does not define the body digest**: it explicitly states it does not cover content and relies on
> a separate document. Signing is **RFC 9421**, *HTTP Message Signatures*, Standards Track,
> February 2024; body digest is **RFC 9530**, *Digest Fields*. Whoever signs a body must
> implement **both**.

### 5.2 Why not a shared secret

It is the choice that surprises integrators used to other products, and has a precise reason:

| | Shared secret | Asymmetric signature |
|---|---|---|
| Non-repudiation | **No.** The recipient holds the secret and can therefore **fabricate** notifications indistinguishable from real ones | **Yes.** Only the project holds the private key |
| Rotation | Coordination with each integrator, with window of dual validity | **Unilateral**: new key, new identifier, public material updated |
| Coverage of method and address | Must be added manually | Native |
| Signature expiry | Must be added manually | Native |

In a context where the notification carries the outcome of a health act and feeds an access
register, the difference is not theoretical: with the shared secret, faced with a dispute,
**you cannot prove to a third party** that that notification came from us.

A shared secret remains available as a transition mode for integrators unable to verify an
asymmetric signature, and is documented as such - with the stated limit, not hidden.

### 5.3 Verification step by step

1. **Read the raw body bytes.** Before any deserialisation.
2. **Recalculate the digest** of the body and compare it with the header. If it does not match,
   the problem is in reading the body, not in the signature.
3. **Resolve the public key** from the key identifier, against the project's public material, with
   local caching and forced refresh only on unknown identifier.
4. **Rebuild the canonical string** from the components listed in the signing metadata, **in the
   same order**.
5. **Verify the signature.**
6. **Verify the time window**: outside five minutes it is refused, even if the signature is valid.
7. **Deduplicate** on the event identifier (§8).

```java
// Reference for a Java receiver - library details are deliberately omitted
public boolean accept(byte[] rawBody, HttpHeaders headers) {
    if (!digest.matches(rawBody, headers.getFirst("Content-Digest"))) {
        return false;                       // problem of reading the body, not signature
    }
    var metadata = SigningMetadata.parse(headers.getFirst("Signature-Input"));
    if (Math.abs(Instant.now().getEpochSecond() - metadata.created()) > 300) {
        return false;                       // outside window: replay or clock skew
    }
    var key = keys.resolve(metadata.keyId())      // cached, with refresh on unknown kid
                  .orElseThrow(UnknownKey::new);
    var canonical = Canonicaliser.build(metadata.components(), headers, rawBody);
    return Signature.verify(key, canonical, headers.getFirst("Signature"));
}
```

### 5.4 The four errors we see

1. **Verify on a re-serialised body.** The framework reordered keys or normalised spaces: the
   digest will never match. It is the cause nine times out of ten.
2. **Compare signatures with ordinary string comparison**, not constant-time.
3. **Sign or verify only the body.** Without method and address in the signature, the same signed
   notification can be re-presented to a different destination.
4. **Out of sync clock.** The window is five minutes: a ten-minute skew makes everything fail and
   the symptom looks like a signature defect.

## 6. Retries

### 6.1 Policy

```text
delay(n) = min( base × 2^(n-1), ceiling ) × (0.5 + random(0 ; 0.5))
base = 5 s · ceiling = 6 h · retries = 12  →  coverage ≈ 72 h
```

The **random factor is not ornamental.** Without it, a five-minute outage of your system produces,
on restart, a synchronised burst of all accumulated events: an involuntary denial of service attack
against you, right when you are getting back up.

### 6.2 Which responses trigger a retry

| Your response | Effect |
|---|---|
| Success | Delivery concluded |
| Network error, timeout, request timeout | Retry |
| Too many requests, service unavailable, internal error | Retry, respecting any indication of when to retry |
| **No longer available** | **No retry, and automatic destination deactivation.** It is the clean way to dismiss an endpoint |
| Other recipient errors | Permanent error: no retry for that event |

The last row has a consequence to understand well: **if your receiver replies with error on an
event type it does not know**, that event is lost without retry. From which the rule: **ignore
unknown types and respond with success anyway.**

### 6.3 Circuit breaker and isolation

After a certain number of consecutive failures the destination moves to **degraded** state: the
delivery frequency is reduced and the tenant's administrator is notified. After a period of total
failure it moves to **disabled** state and events go to the dead-letter queue.

It serves to prevent a broken tenant from consuming the delivery capacity of everyone else. It is
the noise isolation between tenants, a corollary of the tenant-awareness constraint.

### 6.4 Dead-letter queue and recovery

Events not delivered after exhausting retries end up in a queue **per tenant**,
retained for a configurable duration (*proposal*: 30 days), with:

```http
GET  /v1/webhook-endpoints/{id}/dead-letters?since=2026-09-01T00:00:00Z
POST /v1/webhook-endpoints/{id}/dead-letters/{eventId}/replay
```

**Recovery reuses the same event identifier.** It is deliberate: your deduplication continues to
work and a recovery does not produce duplicates. If we generated a new identifier, every recovery
would be a duplicate from your perspective.

### 6.5 Periodic signal

The destination receives a periodic signal that can be configured. It serves to distinguish "no
event to notify" from "channel broken", which are indistinguishable otherwise. **Watch it**: if it
stops arriving, the channel is broken even if you are not seeing errors.

## 7. Ordering

### 7.1 The rule

**There is no global ordering.** With retries and concurrent delivery, the conclusion of a service
can reach you before its start. It is not a defect: it is an inevitable property of an unreliable
channel between two independent systems.

Also where ordering exists, it is guaranteed **only within the partition chosen for a key**: no
functional requirement can depend on ordering between different aggregates.

### 7.2 How to reconstruct order without ordered queues

Every event carries:

- the **instant** in which the fact occurred, which is the project's clock and not yours;
- a **monotone increasing sequence number per aggregate**, in the `ce-sequence` header.

The rule for your receiver, which is simple and solves the problem entirely:

> For each aggregate, store the last sequence number applied. **Discard events with number
> lower or equal.** Apply those with higher number.

This makes arrival order irrelevant without forcing anyone to ordered queues. If conclusion arrives
before start, start is discarded because it has a lower sequence number, and the final state is correct.

### 7.3 The ordered mode, and its cost

There is an `ordering: "by-subject"` mode per destination, in which events with the same subject
are delivered in sequence, blocking the queue of that subject on failure.

**Choose it only if your system cannot implement §7.2**, because it has a real cost: an
event blocked blocks everything concerning that subject, and an event in the dead-letter queue blocks
the sequence until you intervene. It is not the default mode for this reason.

## 8. Deduplication

| Aspect | Rule |
|---|---|
| What to deduplicate on | **The event identifier**, reported both in the envelope header and as idempotency key |
| Minimum window | At least equal to the retry coverage: **72 hours** with the policy of §6.1 |
| Where to store | In a structure with automatic expiry. You do not need to keep it forever |
| What to do on duplicate | Reply with success **without re-executing the work**. Do not reply with error: it would trigger other retries |
| What **not** to use as key | The event instant (not unique), the subject (repeated), the arrival order (not stable) |

A receiver that does not deduplicate publishes two reports, sends two notifications to the patient
and generates two rows of billing. It is not a rare case: it is the **expected** behaviour on a
channel with at-least-once delivery.

## 9. Proof of delivery

It is the function that reduces support load the most, because it enables your autonomous debugging.

```http
GET /v1/webhook-deliveries?endpointId=whe-01&status=failed&since=2026-09-01T00:00:00Z
```

```json
{
  "data": [
    {
      "deliveryId": "dlv-01J9ZC80B2",
      "eventId": "8f3c1e02-…",
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

What you see and what you do not:

- **You see**: status, latency, attempt, next attempt, cleaned excerpt of your response, headers
  the project sent.
- **You do not see**: your response body in full. Returning it would turn the diagnostics function
  into a data exfiltration channel.

### 9.1 The proof that counts in a dispute

The delivery consultation is an operational tool. When **proof** is needed - a clinical dispute, an
authority verification - the source is the **immutable register**, which is hash-chained and
retained separately from the system that generates events. Entity versioning is not an immutable
register and does not substitute it.

What the register contains is who, what, when, on which subject, with which outcome and with which
authentication assurance level. **It does not contain clinical content.**
Export to your trace repository is described in [09 §7](09-obblighi-di-chi-integra.md).

## 10. The native clinical channel

For integrators who natively speak the clinical model there is a second channel, based on
**topic** subscription published by the server, with filtering on the parameters the topic declares
filterable.

> **Version to cite: 1.1.0**, in trial use, 11 January 2023. And two verified corrections that
> circulate incorrectly almost everywhere:
>
> - **there is no extension for the topic**: the canonical reference to the topic is written
>   **directly in the search criteria field**, and the filter query goes in the extension dedicated
>   to filtering;
> - **in the R4 version of the standard there is no subscription status resource**: the status travels
>   as a set of parameters conformant to a profile, with the names **in hyphenated form**
>   (`event-number`, not `eventNumber`). The compound form belongs to later versions of the standard.

Levels of content allowed: empty, **identifiers only**, full resource.

> **Project rule: identifiers only as default, and full resource disabled on channels to the
> Internet.** It is the same motivation as §3.2, expressed in standard formalism.

Of the three operations provided, **status** is mandatory for a conformant server; **retrieval of
events for interval** and **token for persistent-connection channel** are optional. The count of
events from subscription start and the progressive number solve the problem of detecting gaps: you
know if you missed a notification and can recover it.

**The previous subscription model, based on an arbitrary search criterion, is not implemented.** It
has ambiguous semantics - an update that makes a resource *exit* the criterion does not generate a
notification, so an integrator expecting to know when a service is cancelled would be silent - does
not scale on a multi-tenant system and does not provide signing or destination verification.

### 10.1 Correspondence between the two channels

A published topic corresponds to a **subset** of the event types of the proprietary channel. The
correspondence is published in a table, because without it would be impossible to understand what
you lose by choosing one or the other.

What is **not** expressible on the clinical channel, and therefore requires the proprietary channel:
network quality degradation, consent to recording revocation, technical session failure, alert
non-response, missed expected measurement. They are all events that **do not** correspond to a
change of state of a clinical resource, and no standard subscription model styles them.

## 11. If you cannot expose an address

It is not a series B stopgap: it is a documented modality with the same completeness guarantees.

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

Rules of use:

1. **Resume from a cursor**, not from an instant, within a synchronisation session; use the instant
   only to restart after a long interruption.
2. **Confirm advancement explicitly** (`POST /v1/events:ack`) or conserve the position yourself:
   the project supports both models, but they must be chosen, not mixed.
3. **Reasonable frequency.** Polling every second consumes quota and does not reduce latency in a
   perceptible way: event generation is not instantaneous.
4. **The same deduplication and ordering rules** of §7 and §8 apply identically. Polling does not
   eliminate duplicates: it only makes them less frequent.

## 12. When not to use push notifications

| Situation | Why | Alternative |
|---|---|---|
| You need to update an interface in real time | The latency of a notification is not that of an interface; and the notification arrives at your back-end, not the browser | Real-time channel of the embedded component |
| You need high-frequency metrics | One request per sample saturates receiver and sender | Aggregation and periodic read |
| You would need content inside the notification | It will not happen, for the reason of §3.2 | Reference and authenticated retrieval |
| You need strict ordering between different subjects | It is not guaranteed and will not be | Sequence number and reconciliation |
| Tens of events per day and no receiver to maintain | Building and maintaining a signed receiver is disproportionate | Polling, or periodic summary |
| You want a payer to receive clinical outcome | **It is not provided and not configurable** | Administrative event of §2.5 |
