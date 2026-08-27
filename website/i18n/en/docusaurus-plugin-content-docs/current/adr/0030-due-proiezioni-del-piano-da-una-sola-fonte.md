---
title: "ADR-0030 - The Two Projections of the Telemonitoring Plan Derive From a Single Source"
sidebar_position: 30
description: "Why the executable form of the plan and the documentary form destined for the record are generated from the same artefact, and why their divergence would be a patient safety defect."
---

# ADR-0030 - The Two Projections of the Telemonitoring Plan Derive From a Single Source

**Status**: accepted · **Date**: 25 August 2026 · **Area**: ARCH
**Origin**: question raised by the domain area to this area and the `INTEG` area

## Context

The telemonitoring plan must exist in two forms.

The **executable form** is what the evaluation engine uses to compare measurements against rules. It is structured, precise, free of ambiguity.

The **documentary form** is what goes to the record as a dedicated type, and the required record layout wants it in **narrative form**-the rules of behaviour in case of threshold breach, expressed in natural language.

If the two are drafted separately, they diverge. And divergence between **what the plan declares and what the system does** is not a documentation defect: it is a patient safety defect, because the professional who reads the document believes they know when they will be alerted.

## Alternatives Evaluated

### Alternative 1 - Separate Drafting of the Two Forms

The professional configures the rules and writes the narrative text.

*Advantages*: the text is in the professional's language, suited to the reader.

*Decisive trade-off*: **they diverge, and the divergence is invisible.** No check can notice that the text says «alert above a certain value» while the configured rule uses a persistence window. The defect emerges when an alarm does not fire and someone re-reads the document. **Rejected.**

### Alternative 2 - Only the Executable Form, Document Generated as Structured Dump

*Advantages*: divergence impossible.

*Trade-off*: the required layout wants narrative form, and a list of structured constructs does not satisfy it. Moreover the document would be illegible to the human recipient. **Rejected.**

### Alternative 3 - Single Source, Two Generated Projections

The authoritative artefact is the plan in its declarative form; **both** projections are generated from it.

*Advantages*: divergence impossible by construction; the text remains readable because generation uses formulae drafted and verified for each construct.

*Trade-offs*: generated text is less adaptable than handwritten; an approved formulation is needed for each construct, in each language.

## Decision

**Alternative 3 is adopted.** The generation lives **in the telemonitoring context**, which owns the plan, not in the documentary context and not in the anti-corruption layer: the documentary form is a **serialisation of the plan's canonical dataset**, consistent with the general rule on interchangeable serialisations.

1. **The authoritative artefact is the declarative plan**, versioned with temporal validity.
2. **Both projections are generated** and neither is writable directly.
3. **Each construct of the language has an approved narrative formulation**, versioned together with the construct and translated. The formulation is material addressed to a clinical reader and must be verified for readability as such.
4. **The document carries the version of the plan from which it was generated.** It is what allows, at distance, verifying that the submitted document corresponds to the version then current.
5. **Free annotation by the professional is permitted and remains distinct**: it is added to the generated text, not replaced, and is marked as annotation. Without this possibility the professional would lose the ability to explain the clinical why, which the construct does not express.

## Consequences

**Positive**

- Divergence between what the plan declares and what the system does is impossible by construction.
- The submitted document is traceable to the plan version.
- Adding a construct brings its own formulation: a construct cannot be added without knowing what it does.

**Negative, Accepted**

- Generated text is less natural than handwritten, and its quality depends entirely on the care of formulations.
- Each construct requires an approved formulation in each language: it is work that grows with the language and must be accounted for at every extension.
- Free annotation is a channel through which non-generated content can re-enter: must be visibly marked as such, otherwise the reader does not distinguish what the system guarantees from what the professional has added.

## References

ADR-0026 · ADR-0005 ·
[04 - Data Model](../02_architecture/04-modello-dati.md#3-the-canonical-dataset-of-documents)
<!--TRAD-VERIFICATA: 418d0d9f489a072e8f8ceacaa3cddaebbab96faf-->
