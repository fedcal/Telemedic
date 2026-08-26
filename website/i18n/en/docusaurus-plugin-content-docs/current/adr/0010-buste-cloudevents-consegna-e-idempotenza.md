---
title: "ADR-0010 - CloudEvents envelopes, at-least-once delivery, idempotency by construction"
sidebar_position: 10
description: "The format of the event envelope, the declared delivery semantics, the partitioning key, the sequence number per aggregate and the reason why global order is not guaranteed."
---

# ADR-0010 - CloudEvents envelopes, at-least-once delivery, idempotency by construction

**Status**: accepted · **Date**: 25 August 2026 · **Area**: ARCH
**Architectural foundation**: §5 · **Received correction**: C-10 of noticeboard

## Context

Having established that events are born from the outbox, three decisions remain: which envelope format, which delivery semantics to declare, and how one reconstructs order when it is not guaranteed.

The third is most important because it is the one integrators get wrong: a contract that is silent on ordering produces integrators that assume order and fail intermittently.

## Alternatives evaluated

### Envelope format

| Option | Trade-off |
|---|---|
| Proprietary envelope | No external constraint; no tool knows it; every integrator learns a new format |
| Standard envelope in structured mode | Recognised format; tools available; entire event in a single body, thus easy to record, sign, replay and inspect |
| Standard envelope in binary mode | Attributes in transport headers, data in body: more efficient, but binds envelope to transport protocol and complicates replay and archival |
| Documentary container of clinical format as envelope | Suitable only for clinical plane notifications; wrapping it in another envelope adds a pointless layer |

### Delivery semantics

| Option | Trade-off |
|---|---|
| At most once | Simple; loses events; inadmissible |
| At least once | Does not lose events; produces duplicates; requires idempotent consumers |
| Exactly once | **Cannot be guaranteed across the boundary of an external system.** Promising it produces integrators that do not deduplicate, which is the defect one wanted to avoid |

### Ordering

| Option | Trade-off |
|---|---|
| Global order | Requires a single partition: does not scale and does not survive retries |
| Ordered queues per key, blocking | Order guaranteed; a blocked event blocks the entire key |
| Sequence number per aggregate, order not guaranteed | Makes arrival order irrelevant without blocking queues; requires consumer to use it |

## Decision

**Standard envelope in structured mode; at-least-once delivery; order by partitioning key, with sequence number per aggregate.**

### Rules on the envelope

- Time-orderable identifier; source plus identifier pair is unique by construction and is the foundation of deduplication.
- **Version explicit in type name**, not in a separate attribute: a consumer filters by type, and with version in the type can subscribe to the version it knows how to handle, ignoring others. With version in an attribute it would receive it anyway.
- Reference to the data schema, versioned: makes the envelope self-describing and validatable.
- **Tenant identifier mandatory**, without exception. An event without tenant ends in the unprocessable message queue, not processed with a default value.
- **Sequence number monotonic per aggregate**, not global.
- Correlation identifier, to reconstruct the path of events originating from the same action.
- **Received correction**: the content type attribute **is not transmitted as a dedicated header with its own prefix**. In structured mode the message content type is that of the envelope; in binary mode the attribute maps to the message content type. An implementation emitting a dedicated header is not compliant.

### The partitioning key is the aggregate, not the tenant

Partitioning per tenant seems natural and produces two defects: partitions grossly unbalanced, because tenants have vastly different sizes; and no useful guarantee, because the order that matters is that of facts relating to the **same aggregate**, not the same client.

### Idempotency by construction

Every consumer is idempotent, verified by a test that delivers the same event twice and verifies identity of the resulting state. Three forms, in order of preference: naturally idempotent operation; persisted deduplication key, with retention **exceeding the maximum retry window**; state verification before effect, mandatory for the two non-revertible effects - delivery of a message to a person and deposit of a document in external infrastructure.

## Consequences

**Positive**

- The contract is explicit on what it **does not** guarantee: it is the information that avoids the most frequent integration error.
- Deduplication works even in case of manual re-execution, because re-execution reuses the same identifier.
- Content reduction in transport reduces exposure surface (ADR-0011).

**Negative, accepted**

- Every consumer, internal and external, must deduplicate.
- Sequence number per aggregate requires a monotonic source per aggregate, thus a serialisation point in write.
- `[NV]` - increase in number of partitions in exercise can break per-aggregate order during rebalancing: verification the responsibility of the technical area **before** any resizing.
- `[NV]` - the retention window of deduplication keys must be fixed by the technical area and cannot be less than the maximum retry window.

## References

[06 - Events and internal integration](../02_architecture/06-eventi-e-integrazione-interna.md#3-the-envelope) ·
ADR-0008 · ADR-0011
