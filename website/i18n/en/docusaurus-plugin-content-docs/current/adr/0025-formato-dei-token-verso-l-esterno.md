---
title: "ADR-0025 - Format of Tokens to the Outside"
sidebar_position: 25
description: "Why tokens delivered to the outside are opaque and translated into self-contained tokens by the gateway, what cost it entails and why the revocation window is the decisive criterion in this domain."
---

# ADR-0025 - Format of Tokens to the Outside

**Status**: accepted · **Date**: 25 August 2026 · **Area**: ARCH
**Origin**: question raised by the protocols area

## Context

An access token can be **self-contained**-contains its own claims, signed, and whoever receives it verifies without querying anyone-or **opaque**, that is, a reference devoid of meaning that the recipient resolves by querying who issued it.

The choice has a consequence that in this domain weighs more than all others: **the revocation window**. A self-contained token remains valid until it expires, because verification asks nothing of anyone. If a professional loses the device, if an integrator is suspended, if a consent is revoked, the effect of revocation arrives **at the earliest at the expiry of the already-issued token**.

## Alternatives Evaluated

### Alternative 1 - Self-Contained Tokens to the Outside

*Advantages*: local verification, therefore no additional call on the critical path and no single point of failure; scales horizontally without shared state; it is the model every integrator expects.

*Trade-offs*:

- **Revocation window equal to the token's remaining life.** Mitigable with brief durations, but brief durations shift the cost to renewal, and frequent renewal on a clinical path is itself a risk of interruption.
- **The claims are readable by whoever intercepts the token**, and in this domain the claims describe who the professional is, for which organisation they operate and on which tenant. It is not clinical content, but information that has no reason to be exposed.
- The header dimension grows with claims and becomes variable, with effects on the limits of intermediate components.

### Alternative 2 - Opaque Tokens to the Outside, Self-Contained Inside

The gateway receives the opaque reference, resolves it and translates it into a self-contained token that circulates **only** inside the perimeter.

*Advantages*: **immediate and effective revocation**; no claims exposed to whoever intercepts; headers of constant dimension; the perimeter internal preserves the advantages of local verification.

*Trade-offs*: the gateway becomes a critical component to be made redundant; one additional resolution on the path of every request, with its latency; the integrator must accept a format it cannot inspect.

### Alternative 3 - Self-Contained, With Introspection on All Operations

*Trade-off*: pays the cost of resolution without its advantages on claims confidentiality, and on every operation rather than only those justifying it. **Rejected.**

## Decision

**Alternative 2 is adopted: opaque tokens to the outside, translated into self-contained tokens by the gateway; self-contained tokens never leave the perimeter.**

The decisive motivation is **effective revocation**. In a system handling healthcare data, the question «from when could it no longer access?» must have as answer an instant, not an interval. The three situations that pose it-device lost, integrator suspended, consent revoked-are not remote hypotheses: they are ordinary events of the lifecycle.

Four operational consequences:

1. **The gateway is a critical component** and must be made redundant, with its unavailability treated as system unavailability. The cost is declared, not hidden.
2. **Resolution is cached for a very brief duration**, sufficient to absorb sequences of calls from the same interaction but not to nullify revocation. The duration is declared and configurable with an imposed maximum.
3. **Revocation invalidates the cache**, not awaiting its expiry.
4. **Introspection on high-impact operations remains mandatory** even with opaque tokens: it is a second-level verification of the state of the mandate, not a substitute for revocation.

## Consequences

**Positive**

- Revocation has immediate effect.
- No claim on who the professional is and which tenant they operate on is exposed to whoever intercepts.
- Headers have constant dimension.
- The internal perimeter preserves local verification and its scalability.

**Negative, Accepted**

- One additional critical component to make redundant and monitor.
- One additional resolution per request, which enters the latency budget of operations.
- Integrators used to the inspectable format must adapt: it is integration friction to document with motivation, otherwise read as an arbitrary limitation.
- The gateway becomes a point where every authenticated request transits: its compromise has proportionate consequences, and must be treated as critical security code.

## References

ADR-0015 · ADR-0021 · ADR-0029
