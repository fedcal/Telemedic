---
title: "ADR-0020 - Time Series in Dedicated Storage; Channel Metrics Are Not Clinical Observations"
sidebar_position: 20
description: "Why clinical parameters and channel metrics are two series with opposite regimes, why they do not belong in generic relational tables and why a network metric must not enter the clinical record."
---

# ADR-0020 - Time Series in Dedicated Storage; Channel Metrics Are Not Clinical Observations

**Status**: accepted · **Date**: 25 August 2026 · **Area**: ARCH
**Reference constraints**: V2; V-155 of the security area

## Context

The system produces two families of time-series data: **clinical parameters**-telemonitoring measurements and responses to questionnaires-and **channel metrics**-delay, loss, delay variation, transmission rate, type of network path.

Superficially they resemble each other: numbers with an instant, produced at high rate, consulted by interval. They have **opposite legal regimes** and a difference in nature that admits no confusion.

## Alternatives Evaluated

### Alternative 1 - Both as Clinical Observations in Exchange Format, Persisted in Relational Tables

*Advantages*: a single mechanism; metrics become immediately exposable in the clinical plane; no additional store.

*Decisive trade-offs*:

- **A channel metric modelled as a clinical observation ends up in a person's record.** The delay in transmission of a packet is not clinical data. It is a data quality problem and, given the boundary between registration and interpretation, potentially a qualification issue.
- The retention regime of the two families is incompatible: applying the clinical regime to metrics builds **a store of healthcare traffic data that no one asked for**; applying the technical regime to parameters **loses healthcare documentation**.
- A generic relational table does not offer aggregation over sliding windows, reduction of resolution of historical data and automatic expiry, which are the typical operations on a series.
- The representation of a single measurement in exchange format is one or two orders of magnitude more voluminous than the data it carries.

**Rejected.**

### Alternative 2 - Both in Time-Series Storage, With the Same Regime

*Advantages*: a single store; operations natively suitable.

*Trade-offs*: the problem of a single regime remains. **Rejected.**

### Alternative 3 - Two Series With Distinct Regimes, Both in Structures Dedicated to Time Series, Clinical Representation as a Projection Built on Request

*Advantages*: each family has its own regime; operations are native; the clinical record is not polluted.

*Trade-offs*: one additional store compared to relational alone; a projection to build.

## Decision

**Alternative 3 is adopted.**

| Series | Nature | Regime |
|---|---|---|
| **Clinical parameters** | Health-related data | Long retention; clinical access; every read traced; **resolution reduction prohibited**, because they are documentation |
| **Channel metrics** | **Non-clinical** | Brief retention; technical access; no direct patient identifier; resolution reduction permitted |

Six invariants:

1. The measurement is **immutable**; a correction produces a new measurement that supersedes the previous one, with reference to the one superseded.
2. Each point carries **both instants**: measurement and reception.
3. Each point carries its own production context: instrument, method, inserting subject.
4. Channel samples **carry no direct patient identifiers**, and no infrastructure metric of the relay is labelled with session identifier.
5. **The absence of an expected point is representable.** A series that contains only what arrived does not allow distinguishing «all regular» from «no data», and it is the operational translation of the principle that silence is never normalcy.
6. **Representation in exchange format is a projection built on request**, for the interval requested, never the persisted form.

## Consequences

**Positive**

- The clinical record contains no network data.
- The two retention regimes are applicable without trade-offs.
- Operations typical of series are native, therefore economical.
- The distinction between measured channel quality and quality of the act remains sharp: the system measures and informs the professional, who decides. The system does not decide whether quality is sufficient.

**Negative, Accepted**

- An additional store to install, monitor and secure also at the customer site.
- A projection to build for clinical exposition of parameters, with its own equivalence proof.
- The prohibition on resolution reduction for clinical parameters entails a growing storage cost over time, declared and dimensioned.

## References

[04 - Data Model](../02_architecture/04-modello-dati.md#4-time-series) ·
[03 - Domain Model](../02_architecture/03-modello-di-dominio.md#47-remote-monitoring-context) ·
ADR-0006
