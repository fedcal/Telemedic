---
title: "ADR-0014 - Two media session modes and their effects on the model"
sidebar_position: 14
description: "Why server-side recording and end-to-end encryption are incompatible, how the incompatibility is represented in the model and which obligations follow."
---

# ADR-0014 - Two media session modes and their effects on the model

**Status**: accepted · **Date**: 25 August 2026 · **Area**: ARCH
**Reference decisions**: D22, D23; constraint V-11 of noticeboard

## Context

Two project requirements are in direct conflict and the conflict is not resolvable with a technical solution.

The first: media is **encrypted end-to-end**, and brief verification of keys by the two interlocutors makes the property demonstrable rather than asserted.

The second: **session recording occurs server-side**, to guarantee its reliability independently of patient device and its processing load.

They are incompatible by construction: a component that records the flow must be able to decrypt it, and a flow decrypted at an intermediate point is not encrypted end-to-end. No configuration satisfies both.

The question posed to this area is to confirm the two-mode solution and to determine its effects on the data model.

## Alternatives evaluated

### Alternative 1 - Client-side recording

The participant's device records and encrypts locally, then uploads.

*Advantages*: preserves end-to-end encryption; reduces treatment perimeter.

*Trade-offs*: depends on processing capacity of patient device, which is the least controllable variable of the system; composing and encoding flows in parallel to the session **risks causing precisely the quality degradation the system must avoid**; subsequent upload can fail on mobile network and requires a resilient queue in browser; available container depends on browser engine. **Discarded by client**, who chose recording reliability.

### Alternative 2 - Server-side recording, declaring end-to-end encryption anyway

*Trade-off*: would be **false**. Discarded without discussion: an untruthful security claim is the kind of defect that destroys the credibility of the entire system.

### Alternative 3 - Server-side recording, with two distinct and declared modes

*Advantages*: recording is reliable; the security property is correctly declared for each mode; the patient knows what they are accepting.

*Trade-offs*: the system has two security profiles instead of one, and this is harder to explain than a uniform promise.

## Decision

**Alternative 3 is confirmed.**

- **Default mode**: encrypted end-to-end, routed directly when network allows, with brief key verification **mandatory by default**.
- **Recording mode**: activatable only with explicit and specific manifestation of will by the patient. The flow crosses the recording component and **the session is not encrypted end-to-end**.

### Effects on data model

1. **The mode is a state of the media session aggregate**, not a boolean attribute of recorded material. The two states are mutually exclusive and transition between them is an event with time and attribution.
2. **Recorded material is an autonomous aggregate**, with: reference to the manifestation of will that legitimates it, reference to the key, retention expiry **always valued**, conservation state. Recorded material does not exist without vigent consent and without expiry.
3. **Encryption keys at rest are per tenant**, never shared.
4. **Revocation of consent has immediate effect** on recording in progress: it is a partnership relation between the consent context and the session context, not a client-supplier relation that can be skipped.
5. **Consent to recording is granular per session** and not inheritable from general consent to the platform.
6. **Recorded material is not clinical documentation**: it is its own artefact, with its own access regime, and enters the documentation context only through explicit acquisition decided by the professional and recorded as such.
7. **Playback of material is an operation traced** with its own severity.

### Resulting obligations

- The **consent notice explicitly states** that the session is no longer encrypted end-to-end. It is not a technical detail to omit: it is the very object of consent.
- The interface signals recording state **persistently and not concealable** for the entire duration. The indicator **is not themeable or concealable** by any integrator.
- Transition between the two modes is traced.
- The **container is negotiated at runtime, never assumed**: no project document can declare a container as guaranteed before verification on supported browsers.

## Consequences

**Positive**

- The security claim is truthful in both modes.
- The patient can give truly informed consent, because they know the consequence.
- The default mode remains the one with the stronger security property.

**Negative, accepted**

- Two security profiles to document, test and explain.
- Public communication must give up the simple and uniform formula.
- The recording component is a further point where health content transits in clear, with consequences for the record of processing activities and for impact assessment.

## References

[03 - Domain model](../02_architecture/03-modello-di-dominio.md#45-media-session-context) ·
[02 - Bounded contexts](../02_architecture/02-contesti-delimitati.md#ctx-05---media-session) ·
ADR-0001
