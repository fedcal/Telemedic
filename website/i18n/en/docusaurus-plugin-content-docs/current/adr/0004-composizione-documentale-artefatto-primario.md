---
title: "ADR-0004 - Documentary composition as primary artefact of the report"
sidebar_position: 4
description: "Why the report of a remote service is a composition within a documentary container and not a diagnostic report, and why the latter remains as a read-only projection."
---

# ADR-0004 - Documentary composition as primary artefact of the report

**Status**: accepted · **Date**: 25 August 2026 · **Area**: ARCH
**Reference decisions**: D13; constraint V2

## Context

The original public content of the project announced the production of a **diagnostic report** at the end of the session. National implementation guides instead model the remote consultation report as **composition within a documentary container**, with mandatory document type coding, legal attestation and constrained sections.

There is also a scope constraint: the report must be **persistence of content drafted by the professional**, not autonomous generation of clinical information. The choice of resource influences this boundary more than it seems.

## Alternatives evaluated

### Alternative 1 - Diagnostic report as primary artefact

*Advantages*: coherence with already diffused public content; many third-party systems know how to consume it; simpler structure.

*Trade-offs*:

- **It is not aligned to the national realm.** The guides model the report as composition; emitting a diagnostic report means not conforming to the reference profile.
- **The resource is designed for a different case.** Its own specification indicates it is suitable for laboratory, anatomical pathology and imaging reports - with atomic results and interpretation - whereas for predominantly narrative reports with less structured workflow «the composition resource would be more appropriate».
- **It contains elements that invite crossing the boundary.** It has a conclusion field and a field for coding the conclusion: their presence makes populating them with system-produced content natural. Composition, which is narrative and sectioned, does not offer the same invitation.
- **It does not carry the documentary paradigm**: immutability after assembly, identifier never reused, signature applied to the container. These are precisely the properties required of a health document.

### Alternative 2 - Composition as primary artefact, diagnostic report removed

*Advantages*: full alignment; a single artefact; no ambiguity on the seat of truth.

*Trade-offs*: breaks integration with systems that can consume only diagnostic report - not a negligible category - and contradicts the public content without offering a migration path.

### Alternative 3 - Composition as primary, diagnostic report as read-only projection

*Advantages*: full alignment with a single seat of truth; compatibility preserved for existing consumers.

*Trade-offs*: two representations to keep coherent; risk that an integrator writes on the projection believing it primary.

## Decision

**Alternative 3 is adopted.**

The pattern is: **composition with coded sections → serialised in a documentary container → signed → indexed by a documentary reference → exposed to the system of origin**.

The **diagnostic report is a read-only projection**, with two constraints:

1. The conclusion field carries **text drafted by the professional**, never text produced by the system; the conclusion coding field **is not populated** except with codes inserted by the professional.
2. The attached form carries the signed document. **The projection is never writable**: an attempt to write is rejected with an outcome stating which is the primary artefact.

The public content of the project must be aligned accordingly: the communication that announced the diagnostic report as produced artefact is **imprecise** and its correction is a matter for the product area.

## Consequences

**Positive**

- Conformity with the national profile of the remote consultation report.
- Immutability of the signed document is a property of the exchange format, not only an application invariant.
- The boundary between recording and interpretation is harder to cross by distraction.
- Existing consumers continue to function.

**Negative, accepted**

- Two representations; the risk of divergence is contained by the fact that the second is generated from the first and is not writable.
- Public communication must be corrected.
- The sectioned structure of composition is more rigid: adding an unforeseen section requires an extension, not a free field. It is a cost and together a guarantee.

**Who else is constrained**: integration areas, product, protocols, conformity.

## References

[04 - Data model](../02_architecture/04-modello-dati.md#23-the-health-document-composition-not-diagnostic-report) ·
ADR-0002 · ADR-0005
