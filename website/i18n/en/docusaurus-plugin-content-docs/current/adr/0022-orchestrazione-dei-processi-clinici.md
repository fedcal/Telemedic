---
title: "ADR-0022 - Explicit Orchestration of Critical Clinical Processes"
sidebar_position: 22
description: "Why processes spanning multiple non-transactional systems are orchestrated and not choreographed, with the partition criterion and constraints on the orchestrator."
---

# ADR-0022 - Explicit Orchestration of Critical Clinical Processes

**Status**: accepted · **Date**: 25 August 2026 · **Area**: ARCH
**Origin**: question deferred to an ADR by the IT foundational module

## Context

Some clinical facts trigger sequences spanning contexts and non-transactional systems: an external signing service, a documentary infrastructure, an identity provider, the system of origin. No transaction encompasses them: a sequence of steps exists, each of which can fail, and for some the failure requires compensating the preceding ones.

The canonical case is service closure with signing and transmission. If the documentary input fails definitively, you cannot «cancel the signature»: you compensate with a **documentary correction**, which is an act of domain and not a technical cancellation.

The IT foundational module has already taught the reader that critical clinical flows are orchestrated, referring to this register for confirmation and constraints.

## Alternatives Evaluated

### Alternative 1 - Choreography

Each context reacts to others' events; none knows the process in its entirety.

*Advantages*: minimal coupling; no central component; the process extends by adding a consumer.

*Trade-offs*:

- **The process does not exist anywhere.** You cannot ask the system where it is, because there is no place to ask.
- Partial failure is diagnosable only by manually reconstructing the sequence of events.
- Adding a step with compensation requires modifying multiple contexts, and compensation logic is scattered.
- The question «was the signed report yesterday at eleven transmitted?» has no immediate answer.

### Alternative 2 - Orchestration

One component knows the sequence, invokes the steps, manages compensations and conserves the state.

*Advantages*: the state of the process is **queryable**; partial failure is visible; the process is a documentable and provable artefact in its entirety.

*Trade-offs*: one additional component; the real risk that the orchestrator accumulates domain logic and becomes a second model.

### Alternative 3 - Choreography With an Observer That Reconstructs the State

*Advantages*: minimal coupling; state is nonetheless queryable.

*Trade-offs*: the observer must know the sequence to reconstruct it-that is, the cost of orchestration is paid without its control, and it cannot compensate. **Rejected.**

## Decision

**Explicit orchestration for critical clinical processes; choreography for simple propagations.**

The decisive motivation is **demonstrability, not elegance**. In this domain it must be possible to answer the question of a process's state without reconstructing a sequence of events, because that question comes from those who verify, those who support a customer and those who respond for an incident.

### Partition Criterion

| Orchestrated if | Choreographed if |
|---|---|
| Has more than two steps that can fail independently | Is a propagation to a single consumer |
| Requires compensation in case of partial failure | Failure of the consumer requires no cancellation |
| Its state must be queryable by an operator | No one will ever ask «where is it» |
| Crosses an external non-transactional system | Remains internal |

**Orchestrated processes identified**: closure, reporting and transmission; enrolment in a monitoring plan with consent acquisition; dismissal of a tenant with export and deletion; correction of an already transmitted document.

### Constraints on the Orchestrator

1. **Contains no domain invariants.** Knows the order of steps and compensations, not the rules. An orchestrator that decides whether a document can be signed has absorbed the domain, and it is the typical way this choice degenerates.
2. **The state is persisted and queryable**, with the outcome of each step and the reason for each failure.
3. **Each step is idempotent**, because the process can be resumed.
4. **Compensations are acts of domain**, not technical cancellations.
5. **The process has a term.** After the declared duration it enters a monitored queue: a process that remains indefinitely at an intermediate step is a silent failure.

## Consequences

**Positive**

- The state of every critical process is queryable.
- Compensations are in a single place, therefore provable in their entirety.
- Adding a step is a localised modification.

**Negative, Accepted**

- One additional component, with the permanent risk of accumulation of logic: must be overseen with explicit review, because degeneration is gradual and produces no immediate symptoms.
- Four orchestrated processes are few: the fixed cost of orchestration amortises little.
- The **mechanism** of realisation-dedicated engine, persistent state machine in table, application component-**must be decided by the architecture area** with stated criteria `[NV]`. Strategy is decided because it constrains other areas; mechanism is not.

## References

[06 - Events and Internal Integration](../02_architecture/06-eventi-e-integrazione-interna.md#6-multi-step-processes) ·
[09 - Deferred Decisions](../02_architecture/09-decisioni-rinviate.md#a-1---orchestration-realisation-mechanism)
