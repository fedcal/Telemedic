---
title: "ADR-0021 - Conventions of Public Interfaces"
sidebar_position: 21
description: "Cumulative register of the ten conventions of interfaces exposed to third parties-version placement, outcomes, idempotency, traffic limitation, dismissal, outbound message content, retries, event versioning, introspection-with the motivation of each."
---

# ADR-0021 - Conventions of Public Interfaces

**Status**: accepted · **Date**: 25 August 2026 · **Area**: ARCH
**Origin**: question raised to this area and the protocols area
**Corrections adopted**: C-01, C-02, C-03, C-04, C-06, C-10 from noticeboard

## Context

Ten choices had been enunciated as motivated proposals in the protocols material, awaiting a decision. They are surface conventions: none is, taken individually, architecturally decisive; **all together they determine the experience of whoever integrates** and, once published, become contract for the period of dismissal notice.

A cumulative ADR is preferable to ten separate ADRs because the conventions condition each other and must be read together.

## The Ten Decisions

### 1. Version Placement

**Decision**: major version **in the path** for the application plane; for the clinical plane the version is that of the exchange format, declared in the capabilities document and in content type, with no number of its own.

*Rejected alternatives*: dedicated header-invisible, lost in logs and caches, hard to prove by hand; supplier-specific content type-formally correct, hostile to developers and mishandled by many intermediaries.

*Motivation*: visibility in logs and traces outweighs formal purity. An integration problem is diagnosed by reading a path.

### 2. Outcome for the Precondition Required on Clinical Resources

**Decision**: modifications to clinical resources require a concurrency validator; its absence produces an outcome of **precondition required**, not optimistic acceptance.

*Rejected alternative*: accept without validator, with last writer wins.

*Motivation*: on clinical data the silent overwriting of another's change is a loss of healthcare information. Deviation from the most permissive behaviour is deliberate and must be documented as a safety choice.

### 3. Outcome That Does Not Reveal Existence

**Decision**: when a subject is not authorised to access a resource and its very existence is information, respond **not found** instead of **forbidden**.

*Rejected alternative*: always distinguish the two outcomes, which is more informative for developers.

*Motivation*: in this domain the existence of a resource is often itself health data. Distinguishing the two outcomes would allow enumeration. The rule applies **only** where existence is information, not everywhere: elsewhere diagnosticability outweighs.

### 4. Retention of Idempotency Keys

**Decision**: keys are retained for a time **exceeding the maximum retry window**, with the duration declared in the contract.

*Motivation*: a key expired before the last possible retry makes deduplication fail precisely when it was needed.

*Correction adopted*: the idempotency mechanism at protocol level is the object of a **draft that expired and is archived**, not a standard. It must be documented as a project convention and **not presented as standard**.

### 5. Traffic Limitation Headers

**Decision**: headers are emitted in the current form.

*Correction adopted*: the three-separate-headers form **was never a standard and is superseded**. It is not to be emitted or documented as such. The dual emission for compatibility, which had been proposed, **is not adopted**: emitting a never-standardised form legitimises it and then makes its removal costly.

### 6. Duration of Dismissal Notice

**Decision**: **twelve months** of notice for the dismissal of a major version, with at least two major versions active simultaneously.

*Rejected alternative*: six months, more economical for the project.

*Motivation*: the expected integrator profile is a small organisation, with long release cycles and limited development resources. Brief notice does not produce migrations: it produces integrators blocked on a dismissed version.

*Correction adopted*: the dismissal header **is the object of a standard**, and must be cited with the correct identifier.

### 7. Content of Outbound Messages

**Decision**: lean content, no clinical content. Treated entirely in ADR-0011.

### 8. Retry Policy

**Decision**: exponential backoff with **mandatory random variation**; parameters configurable with default values **declared in the public contract**.

*Motivation of random variation*: without it, an outage of a few minutes on recovery produces a synchronised burst of all accumulated events-an involuntary denial-of-service attack against one's own integrator.

*Motivation of declaration*: the integrator dimensions its maintenance window on that data.

### 9. Versioning of Event Type

**Decision**: version **in the type name**. Treated in ADR-0010.

### 10. Introspection on High-Impact Operations

**Decision**: high-impact operations-exports, conservation-based deletions, migrations, dismissals-expose **queryable progress state** and not only a final outcome.

*Rejected alternative*: synchronous response with outcome, which for long operations produces timeout deadlines and no way to know whether the operation is proceeding.

*Motivation*: an operation without introspection is indistinguishable from a blocked operation, and the typical reaction is to re-launch it-which on a deletion or dismissal is precisely what must not be done.

## Corrections Verified Adopted in Bulk

| # | Correction |
|---|---|
| C-01 | The dismissal header is the object of a published standard: cite it correctly |
| C-02 | The idempotency mechanism at protocol level is a **draft that expired and is archived**: it is not standard |
| C-03 | The form of three traffic limitation headers was never a standard and is superseded |
| C-04 | Problem details are the object of an updated standard: cite the current identifier |
| C-06 | Message signing and body digest are **two distinct specifications**: do not attribute the second to the first |
| C-10 | The event envelope **does not provide a dedicated header** for the content type attribute |

## Consequences

**Positive**

- The conventions are decided and citable, so that the protocols area and integration area can document them as choices and not proposals.
- Verified corrections are adopted in a single place.

**Negative, Accepted**

- Two of the conventions-the precondition-required outcome and the outcome that does not reveal existence-**deviate from the most common behaviour** and must be explained to every integrator, otherwise they are mistaken for defects.
- Twelve months' notice with two active major versions is a commitment to permanent maintenance, whose cost grows with the number of versions released.

## References

[09 - Deferred Decisions](../02_architecture/09-decisioni-rinviate.md#b-5---public-interface-conventions) ·
ADR-0006 · ADR-0010 · ADR-0011
