---
title: "ADR-0017 - Tax Code System Identifier and Boundary Translation"
sidebar_position: 17
description: "Which of the two URIs in use in the Italian guides is adopted, why, and how the divergence towards consumers aligned to the other is managed."
---

# ADR-0017 - Tax Code System Identifier and Boundary Translation

**Status**: accepted · **Date**: 25 August 2026 · **Area**: ARCH
**Origin**: question raised by the foundational module to this area and the technical area

## Context

There exists a **verified divergence on primary source** among the Italian implementation guides on the tax code system identifier. Two distinct values appear in different published artefacts:

| Guide | Value |
|---|---|
| National Base Profile | `http://hl7.it/sid/codiceFiscale` |
| Televisita Family | `http://hl7.it/sid/codiceFiscale` |
| National Core Profile | `http://hl7.it/fhir/itcore/CodeSystem/cs-codicefiscale` |

It is not a transcription error. A consumer aligned to the core profile **does not recognise** the identifier issued according to the televisita family, and vice versa. Since the tax code identifier is the key by which most Italian healthcare systems recognise a person, the divergence is not marginal.

## Alternatives Evaluated

### Alternative 1 - Adopt the Value of the National Core Profile

*Advantages*: the core profile is the cross-cutting reference, potentially more enduring.

*Trade-off*: the project declares conformity to the televisita family, which uses the other value. Emitting a value different from that of the declared profile is non-conformity to the profile on which conformity is declared. **Rejected.**

### Alternative 2 - Adopt the Value of the Televisita Family

*Advantages*: consistency with the declared profile; it is also the value of the national base profile, so it covers two of the three artefacts.

*Trade-off*: consumers aligned to the core profile do not recognise the identifier.

### Alternative 3 - Always Emit Both in the Same Resource

*Advantages*: each consumer recognises at least one of the two without configuration.

*Decisive trade-off*: **it worsens deduplication downstream instead of improving it.** A consumer that finds two identifiers with different systems may read them as two distinct identities, and the defect that results-duplicate demographics at the destination-is more serious than non-recognition, because it is silent and accumulates. **Rejected**, consistently with the motivated recommendation of the protocols area.

### Alternative 4 - One Canonical Internal Value, With **Single** Emission Projected Per Destination

All known forms are accepted on input; **only one is emitted on output**, and which one is configuration per tenant and per destination.

*Advantages*: a single seat of truth internally; the consumer receives exactly the identifier it knows how to read; no ambiguity of identity.

*Trade-off*: introduces configuration per destination and a register of system identifiers to be maintained.

## Decision

**Alternative 4 is adopted.**

1. The canonical internal value is **`http://hl7.it/sid/codiceFiscale`**, consistent with the family of profiles on which the project declares conformity and identical in the national base guide.
2. **On input all known forms are accepted** and normalised to the canonical value.
3. **On output one is emitted only.** Projection to the other URI occurs **at the boundary with the consumer**, by configuration of tenant and destination, without touching the internal model. **Never both in the same resource.**
4. **A versioned register of system identifiers exists** that declares, for each identifier recognised, whether it is accepted on input, whether it is emitted on output and with what precedence. It lives in the anti-corruption layer of the frontier context and **never in the domain** (constraint V-142 of the domain area). With this form the choice is a configuration value and not a migration.
5. The external identifier **is never a column of the main table**: it lives in a table of identifiers with system, value, use and temporal validity.
6. The same register manages other national identifiers with multiple representations.
7. **The divergence is declared openly in integration documentation**, and translation is an operation of conformity registered, not a silent rewrite. The divergence is also to be reported to the standards body.

The general rule remains firm that **no external identifier is a primary key**: the tax code is an attribute qualified by its own attribution domain, not the internal identity. It is not universal-temporary codes exist, newborns not yet coded, homocodies-may change by demographic correction, and is not secret: using it as a key encourages using it as an authentication factor, which is a security defect.

## Consequences

**Positive**

- Conformity to the declared profile.
- Consumers of the other profile continue to function, where configuration provides for it.
- The divergence is confined to a single versioned artefact.

**Negative, Accepted**

- Configuration per destination and a register to maintain.
- An undeclared destination receives the default value and may not recognise it: onboarding must explicitly ask which profile the destination adopts, and this is integration friction.
- If the guides converge one day, the register must be updated: it is a small and localised piece of work.

**Connected point that this decision does not resolve**: the identifier type code in the demographic segment of the legacy channel remains **contractual with the integrator**. The form conformant to the table formation rule is that with the country suffix; the abbreviated form without suffix **does not exist** as an enumerated concept.
- `[NV]` - the position of the national standards body on the divergence is not known. The question is to be raised by the conformity area, which already has in hand the dialogue for documentary types.

## References

[04 - Data Model](../02_architecture/04-modello-dati.md#52-the-verified-divergence-of-tax-code-uris) ·
ADR-0002
