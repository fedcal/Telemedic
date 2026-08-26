---
title: "ADR-0016 - Single Terminology Gateway, Disableable, Without Persistent Cache and Without Identifiers"
sidebar_position: 16
description: "How the system accesses clinical terminologies, why it remains fully functional without those with costly licences, and why sovereignty of this dependency is satisfied by absence of data."
---

# ADR-0016 - Single Terminology Gateway, Disableable, Without Persistent Cache and Without Identifiers

**Status**: accepted · **Date**: 25 August 2026 · **Area**: ARCH
**Reference decisions**: D31, D32, D33; noticeboard constraint V-03; V-151 and V-157 set by the security area
**Origin**: question raised by the foundational module, residual part assigned to this area

## Context

Clinical terminologies have radically different licensing regimes. Some coexist in the project's sources with attribution only; others require separate placement with their own licence; others still require acquisition or interrogation at runtime by whoever instals; some are excluded entirely and only the system identifier and code remain usable.

The most severe case entails that the licence constraint is perfected **by downloading or accessing** the content, that a persistent cache of responses constitutes a derivative, and that the fee is due per site even in non-production environments. Another case entails that translations of labels are derivatives whose rights are assigned to the owner of the terminology.

The security area has already established that the external terminology service is a **third-party component at runtime**, that it does not receive patient identifiers, and that it does not allow persistent cache. What remained for this area was the choice of the **resolution point** and the **gateway contract**.

## Alternatives Evaluated

### Alternative 1 - Each Context Queries Its Own Source

*Advantages*: no intermediate component; each context optimises its own access.

*Trade-offs*: the licensing policy would have to be applied at N points; disabling a code system would require N changes; the prohibition on persistent cache would be verifiable only by inspecting each context; the prohibition on transmitting identifiers would have to be enforced N times. **Rejected.**

### Alternative 2 - Terminology Content Included in the Distribution

*Advantages*: no runtime dependency; no latency.

*Trade-offs*: incompatible with the licensing regimes of multiple terminologies; would make the project a distributor of third-party content; for at least one case the condition that the content is inaccessible except to authorised users is **incompatible with a public repository**. **Rejected.**

### Alternative 3 - Single Gateway, With Policy Per Code System

*Advantages*: a single point where the policy is applied, verified and changed; disabling per system; stable contract that hides the diversity of sources.

*Trade-offs*: an additional component on the validation path; a single point of failure to design with a declared degradation.

## Decision

**Alternative 3 is adopted**, with six constraints.

1. **Single point of access.** No context interrogates a terminology source directly. Automatic blocking check.
2. **No persistent cache on disk** for systems whose licence does not permit derivatives. In-memory cache with brief duration is permitted; persistence on disk is not.
3. **No patient identifier** and no clinical context leaves the perimeter towards an external source. **The sovereignty of this dependency is satisfied by absence of data, not by placement**: if the interrogation does not carry data attributable to a person, the placement of the source ceases to be the determinant criterion.
4. **Disabling per code system**, not global, as installation configuration.
5. **The system is fully functional with costly-licence systems disabled.** No main path requires them. It is the scenario of quality SQ-07, verified by running the complete functional suite with disabling active. The cost is declared openly: codes belonging to that system are not validated.
6. **The version of the source used for a validation is registered together with the outcome.** A non-repeatable validation is not evidence.

**Declared degradation**: if the gateway is unreachable, the system **starts anyway** and paths dependent on validation apply the configured degradation policy-accept with non-validated marking, or reject-never fail indiscriminately.

## Consequences

**Positive**

- The licensing policy is applied and verifiable in a single point.
- Installation does not require any terminology licence contract to be fully operational.
- The sovereignty constraint is satisfied without imposing the placement of the source.

**Negative, Accepted**

- An additional component on the validation path, with its own latency.
- The absence of persistent cache entails repeated interrogations and thus higher latency and load: it is the price of licence compliance.
- The gateway is a single point of failure, mitigated by declared degradation.
- The external terminology service is a **relevant second-level supplier** that the customer may be required to declare nominally to an authority: the project provides the sheet with necessary data.
- It must be documented without mitigation that use of an external source **does not exempt** whoever instals from the licence obligations that derive from creating or analysing data with that terminology.

## References

[02 - Bounded Contexts](../02_architecture/02-contesti-delimitati.md#ctx-10---terminologies) ·
[04 - Data Model](../02_architecture/04-modello-dati.md#6-terminologies-in-the-data-model) ·
ADR-0019
