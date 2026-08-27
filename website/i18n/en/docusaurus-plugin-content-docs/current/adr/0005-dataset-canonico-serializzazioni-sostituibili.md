---
title: "ADR-0005 - Canonical dataset of documents and replaceable serialisations"
sidebar_position: 5
description: "Why the informational content of health documents is modelled as canonical dataset independent of form, and why no structured document model is hardcoded."
---

# ADR-0005 - Canonical dataset of documents and replaceable serialisations

**Status**: accepted · **Date**: 25 August 2026 · **Area**: ARCH
**Reference constraints**: [V-07](../11_registri/01-vincoli-in-vigore.md#v-07) of noticeboard; D30

## Context

Health documents destined for the national documentary infrastructure have an **information set defined by regulatory source**. Their technical representations - structured document models, document codes, indexing metadata - **are not publicly available** as of this decision's date, and their acquisition is an open question.

The project must be able to model document content **now**, without waiting for that material and without binding itself to a form that may change.

## Alternatives evaluated

### Alternative 1 - Wait for technical material and model on form

*Advantages*: no work wasted; the model corresponds exactly to what needs to be transmitted.

*Trade-offs*: blocks modelling of the documentary context for an undetermined time and dependent on third parties; and would anyway produce a model bound to a technical form, with the same problem at the first update. **Discarded.**

### Alternative 2 - Model directly on clinical exchange format

Document content is the composition, and the dataset is what the composition contains.

*Advantages*: a single artefact; no conversion.

*Trade-offs*: informational content is defined by health regulation, whilst composition structure is defined by a profile. The two change for different reasons and with different rhythms. Binding them means that a profile revision becomes an informational content revision, and that a new regulatory obligation requires waiting for a profile to represent it. Moreover it does not resolve the second form: the paginated representation for human reading would have to be constructed separately, with the risk of divergence between what the professional signs and what the system transmits. **Discarded.**

### Alternative 3 - Canonical dataset independent, serialisations as mappers

*Advantages*: content is defined once, from the regulatory source; each form is a mapper; the paginated and structured representations derive from the same source.

*Trade-offs*: one more artefact to define and version; one more conversion.

## Decision

**Alternative 3 is adopted.**

1. The **canonical dataset is a versioned project artefact**: for each element, definition, obligation, type, terminological constraint and **regulatory source requiring it**. It is the only place where informational content is defined.
2. **Each serialisation is a mapper** with tests starting from the dataset, producing the form, validating it and reading it back verifying semantic equivalence.
3. **No structured document model is hardcoded.** Adding a form is adding a mapper.
4. **The paginated representation is a serialisation like any other**, not a special case.
5. **Indexing metadata derive from the dataset**, not compiled separately.

## Consequences

**Positive**

- Modelling of the documentary context proceeds without waiting for third-party material.
- The arrival of technical models will be writing a mapper, not a migration of the model and already-produced data.
- Divergence between the form readable by a person and the one readable by a machine is eliminated at root: they derive from the same source.
- Each element of content carries its own regulatory source, which makes completeness with respect to the obligation verifiable.

**Negative, accepted**

- One more artefact, to be kept aligned with regulation.
- One more conversion at every issuance.
- The dataset is a synchronisation point between the conformity area, which determines its content, and this area, which determines its form: requires explicit coordination.

**Who else is constrained**: conformity areas, integration, domain, protocols. It is constraint [V-07](../11_registri/01-vincoli-in-vigore.md#v-07) of noticeboard.

## References

[04 - Data model](../02_architecture/04-modello-dati.md#3-the-canonical-dataset-of-documents) ·
ADR-0004
