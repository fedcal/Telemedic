---
title: "ADR-0008 - Transactional outbox as sole source of events"
sidebar_position: 8
description: "Why every event is born from a write in the same transaction as the data, which defects it eliminates, which alternatives have been discarded and what deliberately does not pass through the outbox."
---

# ADR-0008 - Transactional outbox as sole source of events

**Status**: accepted · **Date**: 25 August 2026 · **Area**: ARCH
**Reference decisions**: D15; architectural foundation §5

## Context

Every relevant fact has consequences in multiple contexts and outward. Signing a document has at least six: the document becomes immutable, the patient must be notified, the system of origin must be fed, the documentary infrastructure when applicable, the reportable fact must be emitted, the register must be written. None can be foregone; none can cause the signature to fail; none can block the professional waiting.

The problem is that the data is in a transactional database and the consequences propagate through a channel that does not participate in the same transaction.

## Alternatives evaluated

### Alternative 1 - Publish on broker after consolidation

*Advantages*: trivial; no additional table; minimal latency.

*Trade-off*: **event lost.** The transaction consolidates, the process terminates before publication. The document is signed but the system of origin will never know, the patient does not receive notification, the reportable fact is not emitted. **No one notices**, because there is nothing signalling the absence of an event that never existed. **Discarded.**

### Alternative 2 - Publish before consolidating

*Trade-off*: **phantom event.** The event is delivered, the transaction fails. The system of origin receives notification of a signed document that does not exist. It is the worse of the two, because it produces wrong data in a third party's system. **Discarded.**

### Alternative 3 - Distributed transaction between database and broker

*Advantages*: formal atomicity.

*Trade-offs*: requires coordinator support on both sides; produces blocks in case of uncertain outcome; worsens availability of the clinical path by tying it to broker availability; complicates customer installation. **Discarded.**

### Alternative 4 - Transactional outbox

The event is written to a table **in the same transaction as the data**; a relay reads the table and publishes.

*Advantages*: eliminates both defects by construction; publication is indefinitely retryable because the source is persisted; no distributed coordinator.

*Accepted trade-offs*: one more table and process; additional latency equal to read interval; the table must be pruned.

## Decision

**Alternative 4 is adopted, as sole source.** No application path writes directly to the broker: automated blocking check.

1. **The table is in the schema of the context that produces the event**, thus in the same database and same transactional scope as the data. With the one-schema-per-tenant model, it follows that **the outbox is per tenant**: the relay iterates explicitly, a tenant with many events does not lengthen others' queue, and dismissal carries its own outbox with it.
2. **The relay marks published after broker confirmation.** In case of doubt it republishes: the semantics are at-least-once and consumers are idempotent by construction (ADR-0010).

## What does not pass through the outbox

| Does not pass | Why |
|---|---|
| Media session signalling | ADR-0012: latency and ordering requirement |
| Synchronous queries between contexts | They are not events |
| Entries of immutable register | They have stronger guarantees: write failure fails the operation, consumer failure does not |
| Exercise metrics | Own path |

## Consequences

**Positive**

- Quality scenario SQ-03 is satisfied by construction: interrupting the process between write and publication, the event is published on restoration.
- Availability of the clinical path does not depend on broker availability.
- Relay delay is an observable magnitude, so the defect is visible.

**Negative, accepted**

- Additional latency on event path, declared.
- One table per context per tenant, to be pruned with declared policy.
- Relay delay becomes a magnitude to be monitored: its absence from monitoring would make a silent defect invisible.

## References

[06 - Events and internal integration](../02_architecture/06-eventi-e-integrazione-interna.md#2-the-transactional-outbox) ·
ADR-0009 · ADR-0010 · ADR-0012
