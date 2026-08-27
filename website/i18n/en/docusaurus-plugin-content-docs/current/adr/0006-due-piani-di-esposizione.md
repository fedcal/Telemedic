---
title: "ADR-0006 - Two exposure planes above a single domain model"
sidebar_position: 6
description: "Why Telemedic exposes a clinical facade in exchange format and an application plane described in its own contract, with a partitioning rule that admits no exceptions."
---

# ADR-0006 - Two exposure planes above a single domain model

**Status**: accepted · **Date**: 25 August 2026 · **Area**: ARCH
**Reference constraints**: [V3](../11_registri/03-vincoli-fondanti.md#v3); [V-160](../11_registri/01-vincoli-in-vigore.md#v-160) and [V-164](../11_registri/01-vincoli-in-vigore.md#v-164) of noticeboard

## Context

Telemedic has two audiences with incompatible needs.

The **clinical audience** - third-party health systems, integration engines, authorities - needs a grammar it already knows and that was not invented by the project.

The **application audience** - whoever realises integration in the management system - needs to express actions: start a session, issue an access reference, rotate a key, configure a destination for outgoing messages, read metrics of a session.

The clinical exchange format models **persistent clinical states**, not actions. Its resources are wide, with dozens of optional elements; its search semantics are powerful and a constant source of misunderstandings; its form of invoking operations is penalising for application integration. A well-designed application interface is ergonomic but no third-party health system knows it.

## Alternatives evaluated

### Alternative 1 - Only the clinical facade

Everything is modelled as a resource of the exchange format, including product capabilities.

*Advantages*: a single surface, a single contract, a single authorisation model.

*Trade-offs*: would force modelling the virtual room, channel metrics and configuration as clinical resources. A channel metric modelled as observation **ends up in a person's clinical record**: it is a data quality problem and, given the boundary between recording and interpretation, potentially a qualification issue. **Discarded.**

### Alternative 2 - Only the application plane

*Advantages*: maximum ergonomics; a single contract.

*Trade-offs*: no third-party health system knows it; every integration would require an adapter written by the integrator. Contradicts the very reason the project exists. **Discarded.**

### Alternative 3 - Two planes above a single domain model

*Advantages*: each audience receives the appropriate grammar; no semantic forcing.

*Trade-offs*: two contracts, two sets of tests, the risk of semantic divergence between the two representations of the same concept.

## Decision

**Alternative 3 is adopted**, with a partitioning rule that admits no exceptions:

> If the concept has a recognised clinical equivalent and must be consumable by a third-party health system that does not know Telemedic → **clinical plane**.
> If the concept is a product capability → **application plane**.

| | Clinical plane | Application plane |
|---|---|---|
| Contract | Profiles and capacity document | Application interface document |
| Versioning | It is the exchange format version, declared; not versioned with its own number | Major version in the path |
| Error outcomes | In the form prescribed by clinical format | In the form of problem details |
| Audience | Third-party health systems, authorities | Integration developers |

Additional constraints:

1. **A single domain model beneath both.** No domain logic in exposure planes: they are thin adapters.
2. **No capability exists on a single plane if it belongs to both audiences.** Where a concept interests both, it exists on both with proofs of semantic equivalence.
3. **No capability reachable only from the user interface**, corollary of the total integrability constraint: the area that introduces a capability introduces also the contract.
4. **Channel metrics are not clinical observations** and live only on the application plane.

## Consequences

**Positive**

- The clinical record is not contaminated by technical artefacts.
- The integrator uses the grammar suited to their task without paying the complexity of the other.
- The clinical surface remains small and compliant, thus validatable against profiles.

**Negative, accepted**

- Two contracts to maintain and document.
- Two authorisation models to keep coherent: clinical plane scopes follow the exchange format form, application plane scopes are their own. Application capabilities **must not be masked** as clinical scopes: it would be semantic abuse and would make revoking one without the other impossible.
- A partitioning rule applied with discipline is needed, because every edge case invites duplication.

**Edge cases already resolved**

| Concept | Plane |
|---|---|
| The clinical act | Clinical |
| The media session and its states | Application |
| The report | Clinical |
| Consent as state | Clinical; the collection flow is application |
| Channel metrics | Application |
| Configuration, appearance, quotas, keys | Application |
| Recorded material | Application, with possible documentary indexing on the clinical plane |

## References

[04 - Data model](../02_architecture/04-modello-dati.md#22-what-passes-through-fhir-and-what-does-not) ·
ADR-0003 · ADR-0021
