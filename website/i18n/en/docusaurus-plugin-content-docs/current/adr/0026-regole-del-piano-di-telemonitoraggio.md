---
title: "ADR-0026 - Representation and Execution of Telemonitoring Plan Rules"
sidebar_position: 26
description: "Why plan rules are a restricted and versioned declarative language, evaluated deterministically against the version current at the instant of measurement, and why they are neither code nor a generic rule engine."
---

# ADR-0026 - Representation and Execution of Telemonitoring Plan Rules

**Status**: accepted · **Date**: 25 August 2026 · **Area**: ARCH
**Origin**: question raised by the functional area to this area and the conformity area
**Reference constraints**: V2; V-02, V-144 and V-147 from noticeboard; V-121, V-123, V-124 of the functional area

## Context

The individual telemonitoring plan contains the rules by which measurements are evaluated. The functional requirements impose that measurements be evaluated against the rules of the **plan current at the instant of measurement**, that the version of the rule be registered on the alarm, and that determinism be verifiable with test vectors.

The language must be expressive enough to cover threshold, trend, persistence, hysteresis, window and applicability conditions; and sufficiently **restricted** to not become a way to introduce arbitrary clinical logic-which is precisely what the project's scope excludes.

## Alternatives Evaluated

### Alternative 1 - Rules as Code

Each rule is a class, and adding a rule is a release.

*Advantages*: maximum expressivity; no interpreter to write; ordinary tests.

*Trade-offs*: **contradicts the constraint that no care pathway is coded in software**; makes adding a plan a product modification; and above all **makes the rule non-versionable with the plan**, because code has the version of the release and not that of the plan. With code, «which rule was in effect at that measurement instant» has no answer. **Rejected.**

### Alternative 2 - Generic Rule Engine or Clinical Expression Language

*Advantages*: high expressivity; existing standards; the national platform foresees consumption of protocols with logic expressed in a clinical expression language.

*Decisive trade-offs*: **a generic clinical logic executor is exactly the component that the scope excludes**. The project distinguishes the two capabilities-consume terminologies and consume executable logic-and designs so that the executor **is absent by construction, not disabled by configuration**. A general engine, even if used for simple thresholds, is an executor present. **Rejected.**

### Alternative 3 - Restricted, Closed and Versioned Declarative Language

A **closed** set of constructs-threshold, range of normality, trend over window, persistence beyond duration, return hysteresis, applicability condition-combinable but not user-extensible.

*Advantages*: covers the required cases; is versionable with the plan; is deterministic and verifiable with test vectors; **is not an executor of arbitrary logic**, because the set of constructs is closed and each has declared semantics.

*Trade-offs*: an unforeseen case requires adding a construct, therefore a release; an interpreter is needed to write and test.

## Decision

**Alternative 3 is adopted.**

1. **Closed set of constructs**, each with declared semantics and its own tests. The set extends with a release and an explicit decision, never by configuration.
2. **The rule is part of the plan and is versioned with it.** The plan is a versioned artefact with temporal validity.
3. **Evaluation uses the version current at the instant of measurement**, not the current version, and operates **on the measurement instant** and not on the reception one.
4. **The version of the rule applied is registered on the alarm**, together with the measurements that produced it and the current threshold: the calculation must be reconstructible at distance of years.
5. **Verifiable determinism**: for equal input vector the outcome is always the same, and it is proved with test vectors versioned together with the constructs.
6. **No preset threshold, no precompletion.** The field starts empty and mandatory, even with respect to path values or the last plan; references are shown attributed, in read-only, with explicit copy action.
7. **No inference**: the language contains no constructs that derive thresholds from population or history, nor that interpolate or fill the gaps of series.

## Consequences

**Positive**

- Adding a plan is configuration, not a release.
- Reconstruction of the calculation that produced an alarm is possible and complete.
- The closed set of constructs is the structural guarantee that the system does not execute arbitrary clinical logic: it is verifiable by reading the list, not by inspecting loaded plans.

**Negative, Accepted**

- An interpreter to write, test and maintain.
- An unforeseen clinical case requires a release: it is real friction for whoever configures, and is the counterpart of the boundary.
- The set of constructs will become subject to pressure to be expanded: every expansion is a decision with scope implications and must be treated as such, not as a feature request.

**Deferred to the conformity area**: confirmation that the set of adopted constructs remains within the congealed intended purpose.

## References

[03 - Domain Model](../02_architecture/03-modello-di-dominio.md#47-remote-monitoring-context) ·
ADR-0024 · ADR-0030
