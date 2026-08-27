---
title: "ADR-0015 - Explicit delegation, never impersonation"
sidebar_position: 15
description: "Why an operation carried out by a system on behalf of a person records both identities, and why impersonation is forbidden even when it would simplify code."
---

# ADR-0015 - Explicit delegation, never impersonation

**Status**: accepted · **Date**: 25 August 2026 · **Area**: ARCH
**Reference decisions**: D18; constraints [V-165](../11_registri/01-vincoli-in-vigore.md#v-165) of integration area and [V-154](../11_registri/01-vincoli-in-vigore.md#v-154) of security area

## Context

A professional is authenticated in the integrator's management system. They press a button and the service room must appear, inside the management system interface, **without a second access**.
Telemedic must nonetheless know who they are, in which tenant they operate, what they can do, and that the claim «this is professional X» comes from a trusted sender and not from the browser.

The last condition excludes any solution where the browser transports the claim: it would be manipulable. Propagation occurs backend to backend.

There remains the question of how to represent, in the internal authorisation context, the fact that a system is acting on behalf of a person.

## Alternatives evaluated

### Alternative 1 - Impersonation

The issued token represents the professional only. The system that carried out the exchange becomes indistinguishable from the person.

*Advantages*: authorisation code treats a single subject; no additional notion; the register has simpler structure.

*Decisive compromise*: **erases the information «which system acted on behalf of which person»**. It is precisely the question the register must be able to answer. In case of contention - anomalous access, disputed operation - the answer does not exist and is not reconstructible, because it was never recorded. The defect is discovered when it is needed.

### Alternative 2 - Record the calling system and not the person

*Compromise*: the register would know that «the management system read a report», without knowing on behalf of whom. Unusable for health data access surveillance. **Discarded.**

### Alternative 3 - Explicit delegation: both identities in the authorisation context

The token carries the subject on whose behalf one is acting **and** the actor acting, in a structure that keeps them distinct and that supports nesting when the chain has multiple links.

*Advantages*: the register answers the question; the chain of nested delegations is preserved; the distinction between delegation and impersonation is explicit in the data, not in convention.

*Trade-offs*: authorisation logic treats two subjects; the register has two fields; every integration must be configured with a trust anchor.

## Decision

**Alternative 3 is adopted, without exception.**

1. **Delegation is always represented explicitly.** Impersonation is not allowed in any path.
2. **Trust is per tenant.** At activation, for each tenant: allowed issuer, address of public keys in allow list, allowed algorithms, expected recipient, claim mapping. The link between the principal caller, the tenant and the trust anchor is **the only way**: an assertion is not accepted if its issuer is not the tenant's anchor. Without this check, integrator A could present an assertion issued by integrator B's identity provider.
3. **Internal identity is derived deterministically** from the pair issuer plus subject of the original assertion, not invented. It respects the principle that the system is not the holder of the registry and guarantees that two namesakes from different integrators do not collide.
4. **Assurance level is qualified by provenance**: executed by the system or reported by the integrator. The level **does not travel in the delegation structure**, which expresses who acts on behalf of whom and not with what strength identity was verified. A **reported** level does not satisfy strong authentication requirement.
5. **No clinical operation without delegation context**: an application principal acting without indicating on whose behalf cannot perform clinical operations.

## Consequences

**Positive**

- The register answers the question «which system acted on behalf of which person».
- Nested delegation chains are representable without loss.
- Revocation of an integrator does not require reconstructing which people it represented: it is written in every entry.

**Negative, accepted**

- Authorisation logic treats two subjects and every rule must declare which it applies to.
- Every activation requires configuration of a trust anchor: it is integration friction, and is the counterpart of security.
- The code realising the exchange is **critical security code**: must be subjected to independent external review and to dedicated abuse tests, not treated as an adapter.

## References

[02 - Bounded contexts](../02_architecture/02-contesti-delimitati.md#ctx-01---identity-and-access) ·
[07 - Tracking](../02_architecture/07-tracciamento-e-registro-immutabile.md#31-entry-content)
