---
title: "ADR-0029 - Single Trust Register Per Tenant"
sidebar_position: 29
description: "Why admitted issuers, origins for embedding, origins for cross-origin sharing, outbound destinations and the mediator's allowlist are in a single register, and why separate registers always diverge in the attacker's favour."
---

# ADR-0029 - Single Trust Register Per Tenant

**Status**: accepted · **Date**: 25 August 2026 · **Area**: ARCH
**Origin**: converging questions raised by the integration area and the security area
**Reference constraints**: V-157 of the security area; V-160 of the integration area

## Context

An integrator appears in five different system lists:

1. **admitted identity issuers**, with address of public key material, permitted algorithms, expected recipient and claims mapping;
2. **admitted origins for embedding** of the embeddable component;
3. **admitted origins for sharing resources cross-origin**;
4. **admitted destinations for outbound messages**;
5. **allowlist of the single outbound mediator**.

They are five decisions on the same subject: **whom we trust, to do what, in which tenant**. The form in which they are retained determines whether they remain consistent.

## Alternatives Evaluated

### Alternative 1 - Five Independent Lists

*Advantages*: each component owns its own list and does not depend on the others; each one's model is optimised for its use.

*Decisive trade-off*: **they always diverge, and the divergence is systematically in the attacker's favour.** An origin removed from one list and not from another **remains valid on the second**. There is no revocation that is atomic across five separately-maintained lists, and verification of consistency is a check that someone must remember to do. **Rejected.**

### Alternative 2 - One Undifferentiated List

A single list of trusted subjects, without distinction of capability.

*Trade-off*: trusting a subject as an identity issuer is not the same as trusting them as a destination for outbound messages, and the two trusts have different consequences. An undifferentiated list forces granting the maximum common. **Rejected.**

### Alternative 3 - One Register Per Tenant, With Explicit Capabilities Per Entry

A single source of truth; each entry declares **which capabilities** are granted to that subject.

*Advantages*: atomic revocation; no divergence possible; the question «which of this subject can we trust» has one complete answer.

*Trade-offs*: the register becomes a critical component; its reads are on the path of every verification; its model must accommodate heterogeneous capabilities.

## Decision

**Alternative 3 is adopted.**

1. **A single source of truth per tenant.** Not necessarily a single table: a single **source**, from which the operational lists of individual components are **derived**, never drafted by hand. A derived list that diverges from the source is a detectable defect.
2. **Each entry declares the capabilities granted**, from the five families above, with temporal validity.
3. **Revocation is atomic on the source** and propagates to all derived lists; propagation has a declared and monitored delay, and revocation invalidates cached entries rather than awaiting their expiry.
4. **The primary link caller → tenant → trust anchor is the sole validation path.** An assertion is not accepted whose issuer is not the anchor of the caller's tenant: without this check, integrator A can present an assertion issued by integrator B's identity provider.
5. **The address of public key material is never followed blindly.** An address present in an assertion header must be **compared with that registered** for that subject, and if it does not match the request is refused. Retrieval nonetheless goes through the single outbound mediator.
6. **The register is per tenant**, and no entry is valid for all tenants.

## Consequences

**Positive**

- Revocation is effective and complete.
- The question posed by those who verify-«who can do what on this tenant»-has an answer in a single place.
- The allowlist of the outbound mediator is not a separate list that someone forgets to update.

**Negative, Accepted**

- The register is a critical component: its unavailability blocks verification, and must be made redundant with very-brief-duration caching.
- The model must accommodate heterogeneous capabilities, therefore is more abstract than five specialised lists and less immediately readable.
- Propagation to derived lists has a delay, which must be declared and monitored: an unmonitored delay is a window of residual validity invisible.

## References

ADR-0015 · ADR-0025 ·
[02 - Bounded Contexts](../02_architecture/02-contesti-delimitati.md#ctx-11---interoperability-outbound)
