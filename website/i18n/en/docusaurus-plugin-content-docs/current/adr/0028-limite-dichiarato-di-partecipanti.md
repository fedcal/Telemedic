---
title: "ADR-0028 - Declared Limit of Media Session Participants"
sidebar_position: 28
description: "Why the session remains mesh-without-central-component, why the participant limit is declared and enforced by code, and why the number depends on a measurement and not a preference."
---

# ADR-0028 - Declared Limit of Media Session Participants

**Status**: **partially accepted - the number is deferred to a measurement** · **Date**: 25 August 2026 · **Area**: ARCH
**Origin**: question raised by the technical area

## Context

The mesh topology without central component is **the only one that preserves encryption to the endpoints**: each participant encrypts to each other and no intermediate node possesses the keys. Its cost grows however with the number of participants, because each transmits a copy of its own flow to each other, and the bottleneck is the transmission bandwidth of the worst-connected participant-which in this domain is typically the patient on mobile network.

Every alternative to mesh introduces a component that **terminates encryption**. It is therefore a security decision before it is one of engineering, and has the same nature as the choice on server-side recording.

The third participant is not a marginal case: the interpreter is the declared alternative measure for a known accessibility non-conformity, and the carer is part of the reference population.

## Alternatives Evaluated

### Alternative 1 - No Declared Limit, Natural Degradation

The system accepts participants while the network holds.

*Decisive trade-off*: **silent degradation is a defect, not a function.** The excess participant does not receive a comprehensible error: receives a session that works poorly, and the professional does not know whether the problem is the patient's network or the number present. In a clinical context this produces abandonment of the act without anyone knowing the cause. **Rejected.**

### Alternative 2 - Central Component That Redistributes Flows

*Advantages*: the number of participants ceases to be a bandwidth constraint.

*Decisive trade-off*: the component **terminates encryption**. The system would have a third operating mode with different security properties, besides the two already existing, and the default property would no longer be the strongest. **Rejected for the current version**, with re-opening possible only as an explicit security decision.

### Alternative 3 - Mesh, With Declared Limit and Applied

*Advantages*: preserves the security property; behaviour at limit is comprehensible.

*Trade-offs*: the limit is a real functional constraint; the number is not arbitrary and must be measured.

## Decision

**Alternative 3 is adopted, with three parts decided and one deferred.**

**Decided - the topology.** The session remains mesh without central component. No component that terminates encryption is introduced in the current version for the sole purpose of increasing the number of participants. The mode with server-side recording remains the only exception, and it is such because it is declared, permitted and signalled.

**Decided - the limit is declared and enforced.** There exists a maximum number of participants, **written in documentation and enforced by code**, with a comprehensible error for the excess participant that explains the reason and indicates the alternative. A declared limit is a choice of engineering; silent degradation is a defect.

**Decided - the form of declaration.** The limit is **configuration with an imposed maximum**, not a code constant: a tenant can lower it, never raise it beyond the maximum. The imposed maximum is that derived from measurement.

**Deferred - the number.** The maximum value depends on the transmission bandwidth budget of the worst-connected participant, and that budget must be measured by the technical and product areas on a device and reference network that are not yet declared, `[NV]`. Fixing the number before the measurement would mean writing it by preference. The criterion is declared: **the maximum is the number beyond which the reference participant does not sustain its own transmission budget with margin**, measured and not estimated.

## Consequences

**Positive**

- The default security property remains the strongest.
- Behaviour at limit is comprehensible and diagnosticable.
- The third participant-interpreter or carer-remains supported if the measurement permits it, which is condition of the declared alternative measure for accessibility.

**Negative, Accepted**

- The limit is a real functional constraint, and some organisational scenarios will not be served.
- If the measurement should exclude the third participant, the alternative measure for accessibility would need re-examination: it is a dependency to signal, not to discover.
- The decision to introduce a component that terminates encryption remains possible in future, but is a security and product decision, not a technical extension.

## References

ADR-0014 · [09 - Deferred Decisions](../02_architecture/09-decisioni-rinviate.md#c-2---introducing-a-component-terminating-encryption-to-increase-participants)
