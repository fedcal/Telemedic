---
title: "ADR-0027 - Operating Mode With No Retention of Clinical Content"
sidebar_position: 27
description: "How the system operates when the installation must not retain the data and documents generated, what nonetheless remains, and where the alarm history lives in that mode."
---

# ADR-0027 - Operating Mode With No Retention of Clinical Content

**Status**: accepted · **Date**: 25 August 2026 · **Area**: ARCH
**Origin**: questions raised by the domain area and the `FUNZ` area

## Context

There exists a normative arrangement where the infrastructure **does not retain** the data and documents generated: documents are submitted to the record by healthcare structures, authentication and access data lasts twelve months and auditability logs twenty-four.

The domain area envisages this as an **operating mode**: after submission remain identifier, minimal metadata and proof of receipt, and reading always goes through an assertion towards the external archive.

The `FUNZ` area however poses a question that the mode does not resolve by itself: **where does the alarm history live**? The register of alarms-current threshold, rule applied, data that produced it, deliveries, receipts, forwards, outcomes-is **documentation of an act**. Without it, it is not reconstructible why an alarm did not fire, and safety indicators are not calculable.

## Alternatives Evaluated

### Alternative 1 - Mode as Configuration That Disables Persistence

A switch that, when active, deletes after submission.

*Advantages*: simple; a single code base.

*Trade-offs*: indiscriminate deletion sweeps away also what is **not** clinical content submitted-alarm history, evidence of consent, proof of receipt-and makes the system non-reconstructible. **Rejected in the indiscriminate form.**

### Alternative 2 - Separate Product Branch

*Trade-offs*: two code bases, therefore two behaviours and defects that manifest in one only. Contradicts the principle that modes are configurations of the same code. **Rejected.**

### Alternative 3 - Mode of Configuration With Explicit Data Classification

The mode acts **per data category**, not globally, and every category declares whether it is submitted, whether it is retained and for how long.

*Advantages*: deletion concerns what has been submitted and not what documents the act; the classification is explicit and verifiable.

*Trade-offs*: requires that every data category be classified, without exceptions, and that the classification be maintained as the model grows.

## Decision

**Alternative 3 is adopted.**

### The Taxonomy

| Category | Behaviour in the Mode |
|---|---|
| **Clinical document submitted** | Submitted; remain identifier, minimal metadata and **proof of receipt**; reading passes through an assertion towards the external archive |
| **Non-submittable clinical content** (drafts, annotations not destined for the record) | Retained for the duration declared by the holder, then removed |
| **Alarm history** | **Retained.** It is documentation of an act, not submitted clinical content |
| **Evidence of consent and revocation** | **Retained.** Serve to demonstrate the legality of what happened and survive the data to which they refer |
| **Register of accesses and operations** | Retained for the prescribed duration, separately |
| **Access and authentication data** | Retained for the prescribed duration |
| **Series of clinical parameters** | Submitted or retained according to the holder's configuration, never both implicitly |
| **Channel metrics** | Brief retention, unchanged |

### The Alarm History

**Remains in the system even in this mode.** The motivation is that it answers a question that no external archive can answer: *why did an alarm not fire*. Conserves current threshold, version of rule applied, reference to measurements that produced it, deliveries, receipts, forwards and outcomes.

Constraint that follows, and which is the non-obvious part of the decision: **alarm history contains no measurement values**, but their references. If measurements have been submitted and removed, the history conserves the fact that a rule was evaluated on a measurement identified, with what outcome, not the value. It is what allows conserving reconstructibility of the act without retaining clinical content.

### Three Cross-Cutting Rules

1. **No data without classification.** Absence of classification for a category is an automatically detectable defect by comparing the list of categories with that of configured policies, and causes startup failure.
2. **Deletion leaves a trace of deletion**, with the scope, the instant and the policy applied.
3. **Proof of receipt is not deletable with the document**: it is the only element that proves the submission happened.

## Consequences

**Positive**

- The non-retention arrangement is realisable without rendering the system non-reconstructible.
- Safety indicators remain calculable.
- Explicit classification makes conformity verifiable instead of argued.

**Negative, Accepted**

- Every new data category requires a classification decision: it is an additional step at every extension of the model, and must be overseen.
- Reading a submitted document requires a call towards the external archive, with its latency and its failure mode: the behaviour in case of unavailability must be declared.
- The alarm history without the values of measurements is less readable for whoever consults it: must be explained, otherwise read as data loss.

**Deferred to the `COMP` area**: confirmation of the taxonomy against applicable obligations, and determination of durations for categories not already fixed.

## References

[04 - Data Model](../02_architecture/04-modello-dati.md#8-conservation-and-deletion) ·
ADR-0013 · ADR-0020
<!--TRAD-VERIFICATA: 418d0d9f489a072e8f8ceacaa3cddaebbab96faf-->
