---
title: "Protocols — area index"
sidebar_position: 0
description: "How Telemedic speaks each protocol: versions adopted, profiles, guarantees to integrating parties, conformance tests."
---

# Protocols area

This area describes **how Telemedic uses the protocols**, not what they are. The explanation of
the protocols, of their concepts and of their history belongs to the foundations guide and is not
repeated here: anyone arriving from outside should first read
[«Interoperability standards»](../10_fondamenti/05-standard-di-interoperabilita.md),
[«FHIR from scratch»](../10_fondamenti/06-fhir-da-zero.md),
[«The protocols, one by one»](../10_fondamenti/13-protocolli.md) and, for real time,
[«WebRTC from scratch»](../10_fondamenti/08-webrtc-da-zero.md).

What you will find here instead are the things an integrator, a reviewer or a contributor must be
able to read without inferring them from the code: **which version of which specification is
adopted**, **with what justification**, **what is guaranteed and for how long**, **what is not
guaranteed**, **how an implementation is shown to be conformant**.

## What it contains, chapter by chapter

| # | Chapter | Answers |
|---|---|---|
| 01 | [Interoperability principles](./01-principi-di-interoperabilita.md) | Why these specifications and not others; which versions are fixed; what happens when they change; what is promised to integrating parties |
| 02 | [FHIR](./02-fhir.md) | Profiles adopted, Italian guides with a fixed version, resources exposed, searches supported, operations, capability statement, validation, errors, concurrency |
| 03 | [Clinical documents](./03-documenti-clinici.md) | The canonical dataset of the report, the substitutable serialisations, the document types of the health record, metadata, signature, versioning and rectification |
| 04 | [HL7 v2](./04-hl7-v2.md) | Messages supported, protected transport, acknowledgements, errors, mapping onto the canonical model |
| 05 | [IHE](./05-ihe.md) | Profiles adopted, actors implemented, transactions, overall picture |
| 06 | [Project APIs](./06-api-di-progetto.md) | REST resources, status codes, idempotency, optimistic concurrency, rate limiting, pagination, errors, versioning and deprecation |
| 07 | [Events and webhooks](./07-eventi-e-webhook.md) | Envelopes, catalogue of public events, signature, retries, ordering, deduplication, contract towards the integrator |
| 08 | [Identity and authorisation](./08-identita-e-autorizzazione.md) | Authorisation profiles, delegation between organisations, propagation of the level of assurance, application launch in a clinical context |
| 09 | [Real time](./09-tempo-reale.md) | Project signalling, negotiation, temporary relay credentials, session verification |
| 10 | [Conformance and testing](./10-conformita-e-prove.md) | Tools, suites, acceptance criteria, what can and cannot be declared |

## The three assertions that hold up the whole area

**First.** A version that is not declared is a version that is not adopted. Every specification
cited in this area carries a version number, a maturity status and a date. Saying «FHIR R4»
without saying «4.0.1» is, in a project under configuration control, a defect: 4.0.0 and 4.0.1
differ in their invariants and in the generated conformance resources, and validators behave
accordingly.

**Second.** A standard cited is not a standard complied with. This area systematically
distinguishes three conditions: what a specification **mandates** (`SHALL`/`MUST`), what it
**recommends** (`SHOULD`), and what is a **project choice** because the specification is silent or
leaves the matter open. Project choices are marked as such and are not presented as conformance.

**Third.** A draft specification is a dependency with an expiry date. A good part of the
specifications an Italian telemedicine system needs in 2026 is at *trial implementation*, *draft*
or *active Internet-Draft* stage: the HL7 Italia guides are at 0.2.0, the IHE profiles that are
needed are Trial Implementation, the headers for rate limiting and for idempotency are not RFCs.
That does not prevent their adoption; it requires their version to be pinned, their status to be
declared and their re-checking to be scheduled.

## Reading conventions

**Markers.** `[NV]` signals information **not verified against a primary source**. Every
occurrence states who should be asked for the verification. There are no RFC numbers, transaction
identifiers, field names or code values in this area invented to complete a table: where the datum
is missing, there is the marker.

**Conformance levels.** Where keywords of a specification are reproduced (`SHALL`, `SHOULD`,
`MAY`, `MUST NOT`) they are cited in the original language, because translation loses their
normative force.

**Data.** All the examples use **synthetic data**. Names, tax codes, identifiers, addresses and
domains in the examples do not correspond to real people, organisations or systems. The domains
`telemedic.example`, `gestionale.integratore.example`, `ehr.example` are placeholders reserved for
documentation purposes.

**Confidentiality.** No chapter names companies, brands, commercial products or domains of
potential partners. Where an international specification contains code identifiers that coincide
with commercial trademarks of videoconferencing platforms, the fact is reported but the
identifiers are not transcribed.

## Relationship with the other areas

This area describes **the contracts on the wire**: what passes between Telemedic and a third-party
system, in what form and with what guarantees. It does not describe how the system is built inside
— that is the architecture area's job — nor what the system does from a clinical and
organisational standpoint, which is the job of the functional area and of the domain area. Where a
protocol imposes an architectural constraint, the constraint is declared here and taken up there;
where an architectural need has not yet been decided, this area **does not decide on behalf of
those responsible** and opens a question.

The questions this area opens towards the others are listed in chapter
[10 — Conformance and testing](./10-conformita-e-prove.md) and reported on the inter-agent
noticeboard.
