---
title: "ADR-0011 - Lean events: no clinical content in messages to the outside"
sidebar_position: 11
description: "Why events transport identifiers and references and not clinical content, and why content is re-read with an authenticated call under the receiver's authorisation."
---

# ADR-0011 - Lean events: no clinical content in messages to the outside

**Status**: accepted · **Date**: 25 August 2026 · **Area**: ARCH
**Reference constraints**: [V-161](../11_registri/01-vincoli-in-vigore.md#v-161) placed by integration area; [V-135](../11_registri/01-vincoli-in-vigore.md#v-135) placed by protocols area

## Context

An event notifying the signing of a report may carry the report with it, or carry only the information that it exists, leaving it to the recipient to read it. The first form saves a call; the second adds one.

The choice seems an optimisation and is instead a decision on the authorisation model.

## Alternatives evaluated

### Alternative 1 - Event with complete content

*Advantages*: recipient has everything immediately; one call less; works even if recipient is unable to call back.

*Trade-offs*:

- **Authorisation is evaluated at the moment of production**, not access. If between production and reading the subject revokes consent or obscures a document, the envelope already delivered does not know. The content went out with an authorisation that is no longer true.
- **Exposure surface multiplied.** An envelope with clinical content crosses queues, diagnostic logs, surveillance systems, retry archives and unprocessable message queues. Every transit is a copy in a place with different protection regime.
- **The contract is less stable**, because the envelope follows the evolution of content form.
- Content ends in the unprocessable message queue, which is inspectable by the tenant administrator.

### Alternative 2 - Event with only the identifier

*Advantages*: minimal surface; very stable contract.

*Trade-offs*: recipient cannot even decide if the event interests them without calling, which produces a call for every event, including irrelevant ones.

### Alternative 3 - Lean event: identifiers, references and the few attributes needed to decide if it matters

*Advantages*: recipient filters without calling and reads only what they need; contained surface; stable contract.

*Trade-offs*: recipient must know how to call back, thus must have own credentials and authorisations: it is one more integration requirement.

## Decision

**Alternative 3 is adopted for messages to third-party systems.**

- The event transports identifiers, references and discrimination attributes; **does not transport clinical content**.
- Content is re-read with an **authenticated call under the receiver's authorisation**.
- Applies to outgoing messages, to clinical plane notifications - with the lean form as default and the complete form disabled on channels to the Internet - and to every future channel.

For events **internal** between contexts the rule is more permissive but not absent: one transports what the consumer needs to decide, not the entire aggregate. An event that transports the entire aggregate state couples the consumer to the producer's internal form, which is exactly what boundaries were meant to prevent.

## Consequences

**Positive**

- Authorisation is evaluated at the moment of access, with attributes vigent then: a subsequent revocation or obscuring is respected.
- Clinical content does not transit queues, logs and retry archives.
- The unprocessable message queue is inspectable without exposing health content.
- The event contract changes less frequently.

**Negative, accepted**

- One more call for recipient that needs the content.
- Recipient must have own credentials and authorisations: it is an integration requirement to document, and for a small integrator it is real friction.
- In case of temporary unavailability of the system at re-read time, the recipient must retry: retry responsibility partly shifts to them.

**Automated verification**: no event to the outside contains clinical content, verified with a closed list of detectable forms.

## References

[06 - Events and internal integration](../02_architecture/06-eventi-e-integrazione-interna.md#33-the-content-of-data) ·
ADR-0010
