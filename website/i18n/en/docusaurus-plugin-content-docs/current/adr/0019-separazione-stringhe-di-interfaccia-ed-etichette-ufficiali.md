---
title: "ADR-0019 - Separation Between Interface Strings and Official Terminology Labels"
sidebar_position: 19
description: "Why translations of the product are not written in the official label field, how the separation is concretely implemented and which verifications make it effective."
---

# ADR-0019 - Separation Between Interface Strings and Official Terminology Labels

**Status**: accepted · **Date**: 25 August 2026 · **Area**: ARCH
**Reference decision**: D34 · **Origin**: question raised by the foundational module

## Context

A coded concept carries a **label**: the readable string that accompanies the code. The natural temptation is to use that field for the text the interface shows the user, translating it in the product's language when the source does not already provide it translated.

This temptation carries a licence consequence, not merely one of order. The translations of labels of at least one relevant terminology are **derivative works whose rights are assigned to the owner of the terminology**. If the project conserved its own translations in the official label field, and that field were emitted outbound, the project would produce and distribute a derivative of that terminology.

There is also an independent functional reason: the product's interface strings need to be adapted to the context of use, to available length and to user profile-an elderly patient and a professional under time pressure do not read the same label with the same efficacy. The official label is not adaptable: it is what the owner has established.

## Alternatives Evaluated

### Alternative 1 - Single Field, Translated by the Project

*Advantages*: trivial; no additional searching; the interface shows what it finds.

*Trade-offs*: produces a derivative of third-party content; emits outbound a string that is not the official one, which is a defect of interoperability besides licence; makes it impossible to adapt the text to the interface without altering the data.

**Rejected.**

### Alternative 2 - Single Field, With the Official Label, Shown Directly

*Advantages*: no derivative; no divergence between what is shown and what is emitted.

*Trade-offs*: the interface shows unadapted strings, often in a language different from the user's, often too long, often incomprehensible to a patient. It contradicts the cross-cutting requirement of accessibility and design for real users. **Rejected.**

### Alternative 3 - Two Stores Separated by Construction

*Advantages*: no derivative; interface adaptable; emission conformant.

*Trade-offs*: two stores to maintain; one additional search path; the risk that the product string is missing for a rare code.

## Decision

**Alternative 3 is adopted.**

| Store | Content | Owner | Where It Lives |
|---|---|---|---|
| **Official label** | The string provided by the source, in the language in which the source provides it | The owner of the terminology | The label field of the coded concept, populated **only** by the terminology gateway |
| **Interface string** | The text the product shows the user | The project | The product's internationalisation store, indexed by the system plus code pair |

Three rules, all automatically verifiable:

1. **No code path writes to the official label field except the terminology gateway.**
2. **The interface never shows the official label field directly.** It asks for the string from the internationalisation store by the system plus code pair; if missing, it falls back to the official label **declaring** that it is the original form, and the absence is reported as a translation gap to be filled.
3. **On output towards a third-party system the official label is emitted, never the interface string.**

The key of the internationalisation store is **the system plus code pair**, not the label alone: two terminologies may use the same code with different meanings, and indexing by label would produce silent collisions.

## Consequences

**Positive**

- The project does not produce derivatives of third-party content.
- Interface strings are adaptable to context and user profile, which is a requirement and not a convenience.
- Emission outbound is conformant.
- The translation gap is detectable instead of being masked by some string or other.

**Negative, Accepted**

- Two stores; one additional search at each presentation.
- Translation gaps must be filled, and their number grows with the breadth of terminologies used: a process is needed, not occasional activity.
- For a rare code the user may see a string in the original language: it is declared in the interface and preferable to an unauthorised translation.

## References

[04 - Data Model](../02_architecture/04-modello-dati.md#62-the-separation-between-official-label-and-interface-string) ·
ADR-0016
