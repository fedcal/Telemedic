---
title: "ADR-0023 - The Billing Context: Proposal for Deviation from the Architectural Base"
sidebar_position: 23
description: "Why this area proposes a fourteenth bounded context for formation of the billable event, what the alternatives are and why the decision is not made unilaterally."
---

# ADR-0023 - The Billing Context: Proposal for Deviation from the Architectural Base

**Status**: **proposed - awaiting stakeholder decision** · **Date**: 25 August 2026 · **Area**: ARCH
**Interested constraint**: [V-166](../11_registri/01-vincoli-in-vigore.md#v-166) set by the integration area, confirmed by `FUNC` in [Q-163](../11_registri/02-questioni-aperte.md#q-163) with `BR-170` and `BR-171`

## Context

The binding architectural base fixes **thirteen** bounded contexts. Among these a context dedicated to the formation of billable events and aggregations towards the administrative system does not appear. The domain research had instead identified one.

Two facts make the question not ornamental.

**The first is one of domain.** The service delivered remotely is billed with the code of the corresponding service in person, with the channel attribute that qualifies its mode. Confusing the axis «what was delivered» with the axis «how it was delivered» makes a telemedicine system non-billable, and correction afterwards requires recoding the history.

**The second is a constraint set by another area.** The payer integration profile is **administrative by construction**: service identifier, administrative outcome, amount, never references to clinical documents. No authorisation scope, no event type, no substitutable module and no configuration can constitute a path-direct or mediated by a professional-through which a payer obtains clinical content. That constraint presupposes a place where the administrative event is formed and where it is guaranteed to carry nothing else.

## Alternatives Evaluated

### Alternative 1 - Fourteenth Dedicated Support Context

*Advantages*: the boundary between clinical plane and administrative plane becomes **structural**. The constraint on the payer profile becomes automatically verifiable-no type of the billing context can reference a type of the documentation context-instead of being a code convention.

*Trade-offs*: one additional context to govern, document and test; a deviation from the binding architectural base, which exceeds an area's mandate.

### Alternative 2 - Distributed Responsibility Between Clinical Service and Frontier

*Advantages*: no new context; no deviation.

*Trade-offs*: the administrative event is formed **inside** the clinical context, which has access to clinical content. The guarantee becomes a convention: nothing structurally prevents a subsequent version of the event from acquiring a reference to a document. The defect produces no symptoms until someone exploits it.

### Alternative 3 - Responsibility Entirely in the Frontier Context

*Advantages*: consistent with the idea that everything going out passes through the frontier.

*Trade-offs*: loads the anti-corruption level with a responsibility **of domain**-which event is billable, with which code, with which channel attribute-that does not belong to it and that would require the translation level to know clinical and administrative rules.

## Proposed Decision

**This area proposes alternative 1** and **does not adopt it unilaterally**.

The reason for the proposal is verifiability: with an autonomous context, the constraint on the payer profile is a **boundary**; without it, a convention. In a system that must demonstrate its properties to those who verify, the difference between the two is not stylistic.

The reason the decision is not made is one of protocol: modifying the list of contexts of the binding architectural base exceeds an area's mandate, and the base itself prescribes that deviation be declared and decided downstream. **The question is raised to the orchestrator.**

## Interim Status, Awaiting the Decision

Responsibility remains where the base leaves it implicitly: determination of the billable fact in the clinical service context, delivery in the frontier context. **With two explicit caveats**:

1. In this placement the constraint on the payer profile is a **convention and not a boundary**.
2. A **dedicated test** is to be introduced that ascertains that the event destined for settlement carries only service identifier, administrative outcome and amount. The test substitutes, imperfectly, for the structural guarantee.

## Consequences of the Decision, Whatever It May Be

**If adopted**: one additional context; the constraint becomes verifiable by construction; the correspondence with the decomposition of domain research is completed.

**If rejected**: the system works equally. The residual risk is that an event destined for settlement acquires, in a later version, a reference to a clinical document without anything structurally preventing it. The risk is then to be inscribed in the risk management material, not left implicit.

## References

[02 - Bounded Contexts](../02_architecture/02-contesti-delimitati.md#5-a-stated-departure-billing) ·
[09 - Deferred Decisions](../02_architecture/09-decisioni-rinviate.md#c-1---the-billing-context)
