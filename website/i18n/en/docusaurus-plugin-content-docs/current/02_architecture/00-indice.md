---
title: Architecture - area index
sidebar_position: 1
description: Map of Telemedic's architectural area, reading order by profile, relationship with the fundamentals guide and decision registers, reading conventions and precedence rules between documents.
---

# Architecture - area index

This area describes **how Telemedic is built**: which are its internal boundaries, which invariants it upholds, which data it holds and in what form, how it propagates tenant context, how its parts exchange messages, how it demonstrates what has occurred and in which configurations it is installed.

It does not describe *what* the system does - that is the functional area - nor *how code is written* - that is the technical area. It describes the structure that makes both possible, and the reasons why that structure is as it is rather than another way.

## 1. Why this area comes before the others

The six remaining areas rest on what is written here. The bounded context in which a function lives determines who can call it and with what contract; the aggregate to which an entity belongs determines what can be modified in a single transaction; the tenancy model determines the form of every query and every migration; the event model determines what an integrator can observe. An error in this area propagates by construction to all the others and cannot be corrected with a local modification.

This gives rise to a precedence rule that holds for the entire documentation of the project:

> In case of divergence between a document in this area and a document in another area on an architectural fact, **this area prevails**; whoever identifies the divergence does not resolve it on their own, but brings it to the inter-agent noticeboard.

Above this area stands only the binding architectural baseline ([`.telemedic/context/04_BASELINE_ARCHITETTURALE.md`](https://github.com/fedcal/Telemedic/blob/main/.telemedic/context/04_BASELINE_ARCHITETTURALE.md)) and decisions approved by the client (D1-D52). Where a document in this area departs from the baseline, it declares this explicitly and refers to the ADR that justifies the departure: there are no silent departures.

## 2. The documents of the area

| # | Document | What it resolves | Who must read it |
|---|---|---|---|
| 01 | [Architectural vision](01-visione-architetturale.md) | The drivers that shape the system, quality scenarios with which the architecture is verified, accepted and **rejected** trade-offs | Everyone, before everything else |
| 02 | [Bounded contexts](02-contesti-delimitati.md) | The thirteen internal boundaries: responsibilities, language, invariants, what each one **does not** do, mutual relationships | Whoever designs or reviews a module |
| 03 | [Domain model](03-modello-di-dominio.md) | Aggregates, entities, value objects, invariants, events; the separation between clinical performance and media session argued through completely | Whoever writes domain code |
| 04 | [Data model](04-modello-dati.md) | Canonical model, relationship with FHIR R4 and Italian guides, canonical dataset of documents, time series, identifiers | Whoever touches persistence or interoperability |
| 05 | [Multi-tenancy](05-multi-tenancy.md) | Isolation, context propagation, migrations, selective restore, the single-tenant case | Whoever writes a query, a migration or a job |
| 06 | [Events and internal integration](06-eventi-e-integrazione-interna.md) | Transactional outbox, envelopes, delivery, idempotence, ordering, retries, unprocessable messages | Whoever publishes or consumes an event |
| 07 | [Tracing and immutable register](07-tracciamento-e-registro-immutabile.md) | Hash chain, separate storage, what is registered and what is not, demonstrability of integrity | Whoever touches a path that accesses health data |
| 08 | [Deployment views](08-viste-di-deployment.md) | Installation at customer site and managed service, components, networks, relay isolation, dependencies | Whoever installs, whoever evaluates, whoever sizes |
| 09 | [Deferred decisions](09-decisioni-rinviate.md) | What is **not** decided, with criteria for deciding it and indication of who decides | Whoever seeks an answer and does not find it |

The register of architectural decisions stands in [`docs/adr/`](../adr/README.md). Every structural choice declared in this area has an ADR that reconstructs its motivation, discarded alternatives and consequences. **An architectural statement without an ADR is a documentation defect**, not an admitted shortcut.

## 3. Reading paths

### 3.1 Coming new to the project

1. The fundamentals guide, IT module: [module 11](../10_fondamenti/11-fondamenti-informatici.md).
   This area **presupposes** that module and does not repeat its concepts: consistency, saga, outbox,
   idempotence, aggregate, bounded context, row-level security, percentiles are already
   explained there.
2. [01 - Architectural vision](01-visione-architetturale.md).
3. [02 - Bounded contexts](02-contesti-delimitati.md), at least the map and summary table.
4. The document in the area that concerns your work.

### 3.2 Implementing a feature

01 → 02 (only the context of interest and its neighbours) → 03 → the specific document
(04, 05, 06, 07 as appropriate) → the ADRs cited in the text. Before opening a pull request:
[09 - Deferred decisions](09-decisioni-rinviate.md), to verify you are not deciding on your own something that is deliberately open.

### 3.3 Evaluating the project for an installation

01 → [08 - Deployment views](08-viste-di-deployment.md) → [05 - Multi-tenancy](05-multi-tenancy.md)
→ [07 - Tracing](07-tracciamento-e-registro-immutabile.md). These are the four documents that determine what the installing party must guarantee for its own account, and what it inherits from the project.

### 3.4 Verifying conformance

[07](07-tracciamento-e-registro-immutabile.md) and [05](05-multi-tenancy.md) for evidence of traceability and isolation; [03](03-modello-di-dominio.md) for the boundary between registration of content drafted by the professional and autonomous production of clinical information; the conformance area (`docs/08_compliance/`) for the rest. This area **does not** contain the determination of qualification and classification: it presupposes them and describes their structural consequences.

## 4. Relationship with the fundamentals guide

The guide in [`docs/10_fondamenti/`](../10_fondamenti/00-come-usare-questa-guida.md) teaches the theory; this area applies it. The criterion for division is clear and must be respected in every revision:

| The guide explains | This area establishes |
|---|---|
| What an aggregate is and why transactional boundaries matter | Which aggregates belong to Telemedic and where boundaries pass |
| What transactional outbox is and which defect it eliminates | Which events pass through the outbox, which do not and why |
| What row-level security is and what disables it | Which isolation model is adopted and how it is verified |
| What FHIR is and how a resource is structured | What role FHIR has in the data model and where it does not reach |
| Why entity versioning is not an immutable register | How Telemedic's immutable register is built |
| What are NAT, ICE, relay and media encryption | Where the boundary between media session and clinical performance lives |

If a document in this area begins to explain the theory, it is duplicating the guide and should be redirected to a reference.

## 5. Reading conventions

- **`[NV]`** marks a statement **not verified** against primary sources. Each marking indicates who must close it. No `[NV]` can survive the transition to production of the component that depends on it.
- **"the standard establishes"** introduces an obligation with cited source; **"it is practice"** a widespread use without obligation; **"it is a choice of the project"** a Telemedic decision, which as such has an ADR and can be changed.
- FHIR resource and element names remain in their original form (`Encounter`, `Composition`, `Patient.identifier`). Domain concept names are in Italian. Where the two languages collide, the name from the ubiquitous language defined in
[03 - Domain model](03-modello-di-dominio.md) prevails.
- Diagrams are in Mermaid. A diagram does not replace the text: if a constraint exists only in the diagram, it does not exist.
- All data in examples are **synthetic**. No real data appears, nor any company name, trade mark or commercial product of potential partners (rule R0). It always says "the integrator", "a third-party healthcare management system", "a third-party EHR system".

## 6. What this area deliberately does not contain

| Matter | Where it stands |
|---|---|
| Catalogue of functional and non-functional requirements | Functional area (`docs/03_functional/`) |
| Specification of signalling protocol and message formats | Protocols area (`docs/04_protocols/`) |
| Threat model, cryptographic measures, relay configuration | Security area (`docs/06_security/`) |
| Contracts towards third-party systems, SDKs, embeddable component | Integration area (`docs/07_integration/`) |
| Technical file, risk management, usability engineering | Conformance area (`docs/08_compliance/`) |
| Library choices, structure of build modules, code conventions | Technical area (`docs/01_technical/`) |
| Sequence and dates of realisation | Roadmap (`docs/09_roadmap/`) |

When this area names one of those topics, it does so to fix the **architectural constraint** that the competent area must respect, not to anticipate its content.
