---
title: "ADR-0012 - Session signalling does not transit the outbox or the broker"
sidebar_position: 12
description: "Why the real-time plane has its own mechanism, what crosses the boundary anyway, and which constraint follows for load distribution."
---

# ADR-0012 - Session signalling does not transit the outbox or the broker

**Status**: accepted · **Date**: 25 August 2026 · **Area**: ARCH
**Origin**: question raised by module on IT foundations; also answers questions posed by technical area on signal topology across multiple instances and by protocols area on session state distribution
**Reference constraint**: [V-131](../11_registri/01-vincoli-in-vigore.md#v-131) placed by protocols area

## Context

Having established that the outbox is the sole source of events (ADR-0008), the apparent consequence is that everything passes there. It is an attractive simplification: one mechanism, one surveillance, one set of guarantees.

Media session signalling - the exchange of descriptions and network candidates between participants - does not tolerate that path, for two independent reasons each sufficient by itself.

## Alternatives evaluated

### Alternative 1 - Everything passes through outbox and broker

*Advantages*: one mechanism to understand, monitor and test; no second system.

*Trade-offs*:

- **Latency.** The outbox adds the relay polling interval plus broker latency. The negotiation path has a budget of fractions of seconds measured: adding the long path means missing the requirement **by construction**, not by load.
- **Ordering and delivery.** The specification governing incremental collection of candidates requires that the transport protocol deliver them **exactly once and in the same order** as produced. A generic publication channel does not guarantee it: a candidate duplicated or out of order produces negotiation failures **intermittent and not diagnosticable** - the most expensive class of defects to fix, because the session establishes nine times out of ten and the defect does not reproduce on demand.

**Discarded.**

### Alternative 2 - Simple publication channel as backbone between signalling nodes

*Advantages*: allows routing participants to different nodes.

*Trade-offs*: a publication channel without persistence guarantees neither delivery nor order; adds a hop on the critical path; moves the problem without solving it. **Discarded.**

### Alternative 3 - Connection affinity to the load balancer

The load balancer keeps the participant on the same node for the duration of the connection.

*Advantages*: simplest to realise; no routing logic in the application.

*Trade-offs*: **the two participants in the same session can end up on different nodes**, so the shared state problem remains complete; a release truncates all sessions hosted on the node being updated; resizing does not redistribute existing load. Admitted **only as declared technical debt** with strategy for exit written.

### Alternative 4 - Own mechanism with deterministic distribution

The state machine of a session lives in a single process, determined deterministically from the session identifier. The two participants in the same session reach the same process. No backbone on the critical path.

*Advantages*: minimal latency; ordering guaranteed because state is in one place; no additional component.

*Trade-offs*: load distribution on this path is not random; drop of a node terminates the sessions it hosted.

## Decision

**Alternative 4 is adopted**: deterministic routing of session to the node that owns it, by consistent dispersion function on session identifier. Signalling does not transit outbox or broker: automated blocking check.

Two requirements that any realisation must satisfy, and which are the binding part of the decision:

1. **Exactly-once delivery and in order, per session.**
2. **Sufficient graceful drainage to not truncate a session in progress**: a node being updated stops accepting new sessions and waits for active ones to conclude within a declared window, before terminating.

### The boundary separates traffic from facts

| Crosses the boundary | Does not cross |
|---|---|
| «The session has been started» | Negotiation descriptions |
| «The session has ended, with this technical outcome» | Network candidates |
| «Quality dropped below configured threshold» | Measurement samples, which go to time-series archive |
| «Operating mode has changed» | Instantaneous connection state |
| «Recording started» or «ended» | Audio and video flows, in no form |

**Facts** enter the persistent plane as ordinary events, with the outbox and all its guarantees. **Traffic** that produced them remains internal.

## Consequences

**Positive**

- The latency budget of signalling is respectable.
- The required ordering is guaranteed because state is in a single process.
- No additional component.

**Negative, accepted and declared**

- **Drop of a node terminates the sessions it hosted**, which re-establish with renegotiation. It is declared behaviour, not a defect: the alternative would be migrating state, which is more costly than renegotiation.
- Load distribution on this path is by session identifier, not random.
- Two mechanisms to understand, test and monitor instead of one.
- Routing with session affinity at the load balancer is admitted **only as declared technical debt**, with exit strategy written: moves the problem to affinity without solving ordering.

## References

[06 - Events and internal integration](../02_architecture/06-eventi-e-integrazione-interna.md#8-the-boundary-with-the-real-time-plane) ·
[02 - Bounded contexts](../02_architecture/02-contesti-delimitati.md#6-rules-for-crossing-boundaries) ·
ADR-0008
