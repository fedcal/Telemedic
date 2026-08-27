---
title: "ADR-0007 - One schema per tenant with row-level security as defence in depth"
sidebar_position: 7
description: "Why isolation between autonomous data controllers is realised with separate schemas and not shared rows, and why row-level security is maintained anyway as a second barrier."
---

# ADR-0007 - One schema per tenant with row-level security as defence in depth

**Status**: accepted · **Date**: 25 August 2026 · **Area**: ARCH
**Reference decisions**: D8; constraint [V4](../11_registri/03-vincoli-fondanti.md#v4); architectural foundation §4

## Context

The problem is not serving multiple clients with the same installation: it is **keeping data belonging to legally autonomous data controllers separate**, on shared infrastructure, in demonstrable fashion. A leak between tenants is not an unpleasant defect: it is transmission of data relating to health between distinct subjects.

An additional domain property is added: **no category of neutral data exists**. The fact that a person has an appointment with a certain specialty is data relating to health.

The decision approved by the client explicitly allows two realisations - row-level security or schema per tenant - without choosing one. The choice must be made before the first schema, because multi-tenancy is not retrofittable.

## Alternatives evaluated

### Alternative 1 - Shared rows with discriminant column and row-level security

*Advantages*: more economical realisation; a single migration per modification; number of objects in the database independent of client count; simple connection pool.

*Verified trade-offs*:

- **Selective restoration becomes difficult.** Restoring one client's data to a previous instant requires extraction and selective reinsertion of rows from tables containing others' data too: long, risky, hard to prove. It is a requirement, not a wish.
- **Demonstration of separation becomes argumentative.** To the question «how do you know A does not see B's data?» the answer would be «because each query filters»: an answer about code discipline, not structure.
- **Dismissal becomes selective deletion** on dozens of tables, with the possibility of forgetting one.
- Row-level security can be **silently ineffective**: if the application role possesses the attribute allowing the policies to be bypassed, or if policies are not enforced even on the table owner, the mechanism results configured and inactive.

### Alternative 2 - One database per tenant

*Advantages*: maximum separation; restoration and dismissal trivial.

*Trade-offs*: disproportionate operational cost for the expected user profile; connections and resources multiplied; adds no substantial guarantees compared to properly imposed schema separation. **Discarded.**

### Alternative 3 - One schema per tenant on shared database, with row-level security as defence in depth

*Advantages*: separation is structural and demonstrable with privileges; restoration and dismissal are operations on a namespace; the second barrier holds when the first has been bypassed by error.

*Accepted trade-offs*: migrations are N; number of objects grows with clients; the pool requires context setting and reset at every loan; operations spanning tenants require a dedicated path.

## Decision

**Alternative 3 is adopted.**

- One schema per tenant on shared database.
- Tables nonetheless carry the tenant identifier and are protected by row policies: redundancy **deliberate**, not residue.
- Policies are enforced even on the table owner, and the application role lacks the attribute allowing them to be bypassed. Both conditions are **verified on startup** and cause startup to fail if not satisfied.
- Automated verification does not ascertain that policies exist, but that **they produce the effect**: an attempt to access a row from another tenant must fail in the test, not merely be avoided by code.
- Tenant context is **resolved from identity assertion, never from request**, and is reset when the connection returns to the pool, with dedicated test.
- The installation at the client is the **degenerate case with a single tenant**: same code, no separate branch, no configuration disabling multi-tenancy.

## Consequences

**Positive**

- Selective restoration of a tenant is achievable without downtime for others: quality scenario SQ-08.
- Separation is demonstrable with privileges, not discipline.
- Dismissal is removal of a namespace.

**Negative, accepted**

- Automated, idempotent, reversible migrations with outcome recorded per schema, and two-phase method mandatory for non-backwards-compatible changes, because during the window the application must work with both forms.
- Explicit iteration over tenants for every process not born from a request: costs more cycles and makes impossible the class of defects where an operation intended for one tenant touches others.
- `[NV]` - the practical limit of manageable schemas before metadata cost becomes significant must be measured by the technical area before the first multi-tenant installation.

**Who else is constrained**: all areas, for constraint [V4](../11_registri/03-vincoli-fondanti.md#v4).

## References

[05 - Multi-tenancy](../02_architecture/05-multi-tenancy.md)
