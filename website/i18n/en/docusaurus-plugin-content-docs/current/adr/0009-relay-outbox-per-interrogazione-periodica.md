---
title: "ADR-0009 - The outbox relay reads by periodic polling"
sidebar_position: 9
description: "Why the relay polls the table instead of reading from the archive change log, what the cost of the alternative is for customer installation, and under which conditions the alternative remains available."
---

# ADR-0009 - The outbox relay reads by periodic polling

**Status**: accepted · **Date**: 25 August 2026 · **Area**: ARCH
**Origin**: question deferred to an ADR from the module on IT foundations

## Context

Having established that the outbox is the sole source of events (ADR-0008), there remains to decide **how the relay reads the table**. The two available modes produce the same contract towards consumers but have very different costs on exercise and on third-party component inventory.

The module on IT foundations has already taught the reader the existence of the two modes and has proposed periodic polling as the default, deferring the decision to this record.

## Alternatives evaluated

### Alternative 1 - Periodic polling

The relay polls the table at brief intervals, takes a batch with a lock that skips already-taken rows, publishes, marks.

*Advantages*: no additional component; no special archive privileges; understandable, reproducible and testable everywhere, including development environment; works identically in both deployment configurations.

*Trade-offs*: additional latency equal to the interval; constant load on archive even with no events; with high volumes the interval must be reduced and load grows.

### Alternative 2 - Capture changes from archive change log

A component reads the archive's change log and publishes.

*Advantages*: minimal latency; no polling load; no contention on table.

*Trade-offs*:

- **Introduces a third-party component** to inventory, update, secure and monitor for the entire product life. In a path where third-party component inventory is a formal obligation and not good practice, every entry has recurring cost.
- **Requires replication privileges** on archive, which the customer might not want to grant.
- **Complicates customer installation**, which is a project constraint: every added component must be installed and configured by an organisation that is not an IT service provider, and one more component also costs the probability it is misconfigured.
- **Read progress state** becomes another element to monitor, with its own failure mode.

## Decision

**Periodic polling is adopted as default mode, in both deployment configurations.**

The decisive motivation **is not technical but scope**: customer installation must remain lightweight and installable without special privileges, and the latency advantages of the second alternative are required by no requirement. The path that has strict latency requirement - media session signalling - **does not pass through the outbox anyway** (ADR-0012), which removes much of the weight from the latency argument.

Change capture remains **an option declared** for high-volume configurations, under two joint conditions:

1. the component is **inventoried before adoption**;
2. periodic polling **remains functional as fallback**, and switching between the two modes requires no consumer changes.

The volume threshold beyond which the option becomes recommended **is not fixed** and is a deferred decision, to be taken case-by-case and not in anticipation.

## Consequences

**Positive**

- No additional component in inventory.
- Identical behaviour between development environment, customer installation and managed service: what is tested is what is run.
- No special privileges required from customer.

**Negative, accepted**

- Additional latency equal to polling interval, declared in the public contract.
- Constant load on archive, dimensioned.
- At very high volumes the interval must be reduced and cost grows: this is the condition that will trigger reconsideration.

**Property that makes the decision reversible**: the event contract is identical between the two modes. It is what allows changing mind without touching a single consumer.

## References

[06 - Events and internal integration](../02_architecture/06-eventi-e-integrazione-interna.md#24-how-the-relay-reads) ·
[09 - Deferred decisions](../02_architecture/09-decisioni-rinviate.md#a-2---outbox-read-mode-in-high-volume-configurations) ·
ADR-0008
