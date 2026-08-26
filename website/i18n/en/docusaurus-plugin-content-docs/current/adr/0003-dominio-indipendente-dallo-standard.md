---
title: "ADR-0003 - The domain model does not know the interoperability standard"
sidebar_position: 3
description: "Why standard resources are projections built by mappers and not persisted entities, which alternatives have been discarded and which automated checks make the rule effective."
---

# ADR-0003 - The domain model does not know the interoperability standard

**Status**: accepted · **Date**: 25 August 2026 · **Area**: ARCH

## Context

Having adopted an exchange standard (ADR-0002), there remains the question of **where it lives**. Available libraries offer types that represent standard resources and tools that persist them directly: it is a shortcut available and visible.

The question has a different answer depending on what one optimises: the time to write the first code, or the cost of surviving a revision of the specification.

## Alternatives evaluated

### Alternative 1 - Persist standard resources as documents

Resources are retained in their native form in a document field.

*Advantages*: no mapper to write; no migration when the specification adds a field; exchange interfaces are immediate.

*Trade-offs*, all structural:

- **Invariants end up on a JSON tree.** Standard resources have almost every element optional, by construction: they are designed to represent partial data from different systems. A rule like «a signed document is immutable» becomes verification on a structure in which almost everything can be missing.
- **Specification version migration becomes data migration.** If the persisted data is the resource, changing version means transforming the archive.
- **The domain is bound to a revision of a preliminary guide.** It is exactly the risk that ADR-0002 was meant to contain.
- **Queries become document queries**, with indexing to build case by case.

### Alternative 2 - Use types of the standard as domain types, with relational persistence

*Advantages*: a single set of types; no conversion between domain and exchange.

*Trade-offs*: standard types have no behaviour and do not hold invariants; they are data structures. The domain would lose its ability to make a violation impossible, and coupling to specification revision would remain total, shifted from persistence to code. **Discarded.**

### Alternative 3 - Autonomous domain model, resources as projections

*Advantages*: invariants live in types designed to hold them; specification revision touches mappers; persistence is relational and queryable.

*Accepted trade-offs*: bidirectional mappers to write and test for each exposed resource; the cost of conversion at every exchange; discipline not to let library types leak into the domain.

## Decision

**Alternative 3 is adopted.**

1. **No domain type imports types of the standard.** Automated blocking check.
2. **Resources are constructed by mappers** located in the anticorruption layer of the frontier context.
3. **Mappers are bidirectional and tested with reference files**: one starts from a domain entity, produces the resource, validates it against the profile with the official validator, reads it back and verifies semantic equivalence.
4. **The domain model does not import types of the persistence level or the application container either.** If the invariant depends on infrastructure, infrastructure can violate it.
5. **External identifiers are first-class in the domain**, not an artefact of mapping.

## Consequences

**Positive**

- Quality scenario SQ-06 becomes achievable: the objective is zero files modified outside mapper and profiling packages facing a profile revision.
- The domain is testable without infrastructure.
- Coexistence between two versions of profile during a migration is possible: two mappers.

**Negative, accepted**

- Cost of writing and maintaining mappers, proportional to the number of exposed resources.
- Every new profile element requires an explicit mapping decision: it does not appear by itself. It is a cost and together a property, because it prevents an element entering the model without someone deciding what it means.
- Explicit discipline is needed on shared types: a domain type that resembles a standard type must not become its alias.

**Automated checks**

- No domain package imports types of the standard, persistence level or application container.
- Every exposed resource has a round-trip test with validation against the profile.

## References

[04 - Data model](../02_architecture/04-modello-dati.md#1-four-models-not-one) · ADR-0002
