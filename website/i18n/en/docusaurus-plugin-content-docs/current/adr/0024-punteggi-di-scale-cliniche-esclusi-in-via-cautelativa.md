---
title: "ADR-0024 - Scores of Clinical Scales and Questionnaires Excluded From the Model as a Precaution"
sidebar_position: 24
description: "Why the system conserves responses to structured questionnaires but does not calculate their scores until the question of licences for validated scales is closed."
---

# ADR-0024 - Scores of Clinical Scales and Questionnaires Excluded From the Model as a Precaution

**Status**: accepted, provisional · **Date**: 25 August 2026 · **Area**: ARCH
**Origin**: question raised by the foundational module to the conformity area and this area

## Context

The scope of telemonitoring comprises **structured questionnaires** completed by the patient or carer. Many of these instruments are **validated clinical scales**, and validated scales have **their own licences**, distinct from those of terminologies: some require authorisation for use, others prohibit modification or translation, still others are payable for use in commercial products.

The project's terminology policy, which assigns each terminology to a verified licensing regime from the primary source, **does not formally cover scales and scores**. The question was posed with precise timing: it must be closed **before** the first calculation engine is written.

## Alternatives Evaluated

### Alternative 1 - Realise Score Calculation and Verify Licences Afterwards

*Advantages*: the function is available immediately; the value for the user is immediate.

*Trade-off*: if subsequent verification established that an instrument is not usable, this would mean **removing an already-promised function** and already-used, with historical data calculated with an algorithm that can no longer be run. It is the type of error that costs most to correct. **Rejected.**

### Alternative 2 - Exclude Structured Questionnaires Entirely

*Trade-off*: would be a reduction of the approved functional scope, which explicitly comprises them. Disproportionate to the problem, which concerns score calculation and not response collection. **Rejected.**

### Alternative 3 - Represent and Conserve Responses, Not Calculate Scores

*Advantages*: the collection function is available; no licence risk, because conserving a person's response to a question is not reproducing the instrument or executing its algorithm; the decision is reversible, because calculation is added without migrating collected data.

*Trade-offs*: the professional who expects a score must calculate it elsewhere; the function is perceived as incomplete.

## Decision

**Alternative 3 is adopted, as a precaution and provisionally.**

1. The domain model **represents and conserves the response to a structured questionnaire**, with reference to an **immutable version of the instrument**, the instant and the completing subject.
2. The model **does not represent clinical scale scores** and the telemonitoring context **does not calculate** them.
3. **The content of the instrument**-text of questions, response options, calculation algorithm-**is not included in the distribution**: it is configuration data per tenant, loaded by whoever instals, who is the subject who has or can obtain the licence for use. It is the same choice adopted for catalogues of reference data.
4. The decision is **provisional** and lapses when the conformity area closes the question, formally extending the licensing policy to scales and scores.

**Suggested criterion for closure**: the same taxonomy of regimes already adopted for terminologies-full coexistence, separate placement with own licence, acquisition by whoever instals, total exclusion-applied **instrument by instrument**, verifying the primary licence and not the declaration of the container that comprehends it. The principle is already acquired elsewhere: a declaration of free reusability appended to a container **does not dispose of third-party rights** on the content comprehended.

## Consequences

**Positive**

- No licence risk assumed before verification.
- Collection of responses is available, which is the part of value that does not depend on the instrument.
- The decision is reversible without migration: adding calculation on already-conserved responses is possible, the opposite is not.

**Negative, Accepted**

- The function is perceived as incomplete by those expecting the score.
- Loading the instrument is an additional step borne by whoever instals, and must be documented in the list of what the customer must provide.
- If calculation is introduced later, the question of the boundary between registration and interpretation must also be addressed: a score calculated by the system and presented to the professional is closer to that boundary than a conserved response. The evaluation will be done then, not presumed now.

## References

[03 - Domain Model](../02_architecture/03-modello-di-dominio.md#10-what-the-model-does-not-represent) ·
[09 - Deferred Decisions](../02_architecture/09-decisioni-rinviate.md#b-3---extension-of-terminological-policy-to-validated-clinical-scales-and-questionnaires) ·
ADR-0016 · ADR-0018
