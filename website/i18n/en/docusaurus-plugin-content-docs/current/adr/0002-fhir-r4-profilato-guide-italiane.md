---
title: "ADR-0002 - FHIR R4 profiled according to Italian implementation guides as canonical exchange model"
sidebar_position: 2
description: "Why the canonical exchange model is FHIR R4 4.0.1 profiled according to Italian implementation guides, which alternatives have been discarded and how their preliminary state is governed."
---

# ADR-0002 - FHIR R4 profiled according to Italian implementation guides as canonical exchange model

**Status**: accepted · **Date**: 25 August 2026 · **Area**: ARCH
**Reference decisions**: D13; architectural foundation §3

## Context

Telemedic must exchange clinical facts with systems that do not know it: healthcare management systems, documentary infrastructures, health authorities. It was necessary to choose the grammar of that exchange.

The Italian context has a determining fact: a **complete family of national implementation guides for telemedicine already exists** - remote consultation, teleconsultation, teleassistance, telemonitoring - plus a national base profile, all on FHIR in version 4.0.1. The guides define profiles, value sets, coding systems and the report structure. As of the date of this decision, they are in **preliminary state**.

## Alternatives evaluated

### Alternative 1 - Proprietary model, with exports to required formats

*Advantages*: total freedom of modelling; no dependency on others' specifications; no versioning problem.

*Trade-offs*: the system would not be interoperable in its own market of reference - that is, it would have exactly the defect that the project exists to avoid. Every integrator would have to write their own adapter. The project would assume the burden of maintaining N exports instead of a canonical model. **Discarded.**

### Alternative 2 - Generic FHIR R4, with a package of optional national profiles

*Advantages*: stable model; preliminary guides do not condition the core; installations outside Italy simpler.

*Trade-offs*: produces two configurations with different behaviours, thus two sets of tests and a high probability that the national configuration is the least tested. Above all: the divergences between the generic model and the national one **are not cosmetic** - they concern report structure, identifiers of persons, constrained value sets. A system that treats the national profile as optional treats its own market as optional. **Discarded.**

### Alternative 3 - Adopt the subsequent revision of the standard

*Advantages*: closes some gaps of the current version, in particular on representing virtual mode.

*Trade-offs*: **no national guide is published on that revision**, so national conformity would be lost to gain elements that no Italian counterpart requires. **Discarded**, with coexistence deferred.

### Alternative 4 - FHIR R4 4.0.1 profiled according to national guides as sole canonical model

*Advantages*: alignment to the realm in which the system operates; profiles, value sets and documentary structure already defined by others; a single configuration to test.

*Trade-offs*: dependency on specifications in preliminary state, with revisions possibly not backwards-compatible; validators and tools that must be pinned to precise versions.

## Decision

**Alternative 4 is adopted.** The canonical exchange model is **FHIR R4 version 4.0.1**,
profiled according to Italian implementation guides, which **take precedence** over the generic model in case of divergence.

The preliminary state is governed with three obligations, not attenuated:

1. **Explicit pinning of versions** of profiling packages. The build fails if the resolved package does not match the one declared. No references to moving versions or continuous construction.
2. **Periodic re-check scheduled**, with outcome recorded. The guides change with infra-annual frequency.
3. **Isolation of impact**: a revision must be absorbable by modifying mappers and packages, without touching domain invariants. It is quality scenario SQ-06 and depends on ADR-0003.

## Consequences

**Positive**

- The system is interoperable by construction with systems aligned to the national realm.
- Report structure, identifiers and value sets do not need to be invented.
- Conformity is verifiable with the official validator against published profiles.

**Negative, accepted**

- The project is exposed to revisions of others' specifications in preliminary state.
- Some elements of the guides are not completely determined and must be marked as unverified rather than assumed. Among these: the profile of the remote consultation act **does not fix the class value** whilst having an extensible constraint, and divergence on the identifier of the tax code system between different guides is real and verified (ADR-0017).
- An installation outside the Italian context will require a different profiling package: it is a declared consequence and not in the current scope.

**Who else is constrained**: integration areas, protocols, domain, conformity.

## References

[04 - Data model](../02_architecture/04-modello-dati.md#2-the-canonical-exchange-model) ·
ADR-0003 · ADR-0004 · ADR-0017
