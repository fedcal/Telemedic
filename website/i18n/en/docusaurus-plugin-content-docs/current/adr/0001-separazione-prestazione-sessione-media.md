---
title: "ADR-0001 - Separation between clinical service and media session"
sidebar_position: 1
description: "Why the remote clinical act and the real-time connection are two distinct aggregates in two distinct contexts, which alternatives have been discarded and at what cost."
---

# ADR-0001 - Separation between clinical service and media session

**Status**: accepted · **Date**: 25 August 2026 · **Area**: ARCH
**Reference constraints**: V-01 of noticeboard; architectural foundation §2

## Context

From the user's perspective, a remote service is a single event: the professional and the patient connect, communicate, the act concludes. A model that represents that event with a single object is the simplest to write and explain, and is what one arrives at spontaneously. In the happy case the single object has the same duration, the same participants and the same logical identifier as the clinical act.

The happy case assumes, however, that the network works. In a telemedicine system the case where the network does not work is not an exception: it is a consistent portion of the volume, and it is the case on which the system is judged.

It was therefore necessary to decide whether the clinical act and the connection were the same entity.

## Alternatives evaluated

### Alternative 1 - A single aggregate, with connection attributes

The entity of the act carries the state of the connection, the type of network path, the instant of flow initiation. The end of the connection closes the act.

*Advantages*: minimal code; no synchronisation; no reference to resolve; the model corresponds to the user's perception.

*Verified trade-offs*, each confirmed as a real defect and not hypothetical:

1. **Phantom service.** A drop and reconnection produce two connections, thus two acts where there was one. The count of services delivered - which feeds reporting - becomes the count of successful connections, which is a different magnitude. The information that the two connections were the same act never existed and cannot be reconstructed afterwards.
2. **Non-existent clinical act.** The technical verification preceding the appointment is a connection without an act. Either one creates a fictional act, which ends up in counts, or one introduces a special branch that creates a connection without an act - that is, one admits that the two things are separate, doing so covertly.
3. **Service delivered that appears failed.** Video fails, the professional continues by voice, concludes and produces a report. The video connection failed; the act was delivered. The unified model records a failure.
4. **Service with multiple legitimate sessions.** The entry of an interpreter halfway through, resumption after a pause, handover between two professionals produce multiple connections by design, not by defect.
5. **Contamination of retention regime.** Technical metadata has short retention; act documentation has long retention. United, either metadata is retained for years, building an archive of health traffic data that no one asked for, or documentation is deleted.
6. **Coupling of release cycles.** Transport changes with browser engines and network protocols; act documentation changes with health regulation. United, every update of one touches the other.

### Alternative 2 - Two entities in the same aggregate

Two types, a single root, a single transactional boundary.

*Advantages*: conceptual separation with immediate consistency between the two.

*Trade-offs*: immediate consistency is **exactly what one does not want**. If the two are in the same transactional boundary, every change of state of the connection - dozens in a service - is a write on the act aggregate, with contention and permanent risk that someone links the two states «because they are there». The retention regime remains common. Does not resolve points 1, 5 and 6.

### Alternative 3 - Two aggregates in two contexts, linked by identifier

*Advantages*: resolves all six trade-offs.

*Accepted trade-offs*: two identifiers to correlate; explicit synchronisation to design; the impossibility of guaranteeing in a single transaction an invariant involving both - which is correct, because no clinical invariant should involve them both.

## Decision

**Alternative 3 is adopted.** The clinical service and the media session are two distinct aggregates, roots of two distinct bounded contexts, linked **only by identifier**.

Operational rule that follows, and which is the substance of the decision:

> **No fact of the media session produces a change of state of the clinical act.** The session may inform, never decide. The reverse direction is command: the act requests opening, closing, authorisation for recording.

## Consequences

**Positive**

- A network drop does not alter the clinical state: it is quality scenario SQ-04, whose measure is that the number of services created per service delivered is always one.
- Technical verifications exist without producing clinical acts.
- A service concluded by voice after video failure results as delivered.
- The two retention regimes are independent.
- The media plane is replaceable without touching the clinical domain.

**Negative, accepted**

- The model does not correspond to naive perception and must be explained to every new contributor.
- Correlation between the two requires resolution through the interface of the owning context, not a join.
- Windows exist in which the connection is terminated and the act is still open: it is correct, but requires that the interface represents it intelligibly to the professional.

**Automated checks that follow**

- No foreign keys between tables of the two contexts.
- No path in which an event of the media session invokes a state transition of the act.
- Proof that, after drop and reconnection, a single service exists.

**Who else is constrained**: all areas. It is constraint V-01 of noticeboard and no area can unite them.

## References

[03 - Domain model](../02_architecture/03-modello-di-dominio.md#3-the-separation-between-clinical-performance-and-media-session) ·
[02 - Bounded contexts](../02_architecture/02-contesti-delimitati.md)
