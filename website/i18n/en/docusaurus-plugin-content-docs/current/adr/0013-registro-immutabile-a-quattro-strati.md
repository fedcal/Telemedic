---
title: "ADR-0013 - Immutable register with four layers"
sidebar_position: 13
description: "Why the access register combines hash chain, write-only archive, retention with disjoint privileges and periodic signed anchoring, instead of choosing a single technique."
---

# ADR-0013 - Immutable register with four layers

**Status**: accepted · **Date**: 25 August 2026 · **Area**: ARCH
**Reference decisions**: D42; constraints [V5](../11_registri/03-vincoli-fondanti.md#v5) and [V-04](../11_registri/01-vincoli-in-vigore.md#v-04) of noticeboard
**Origin**: questions posed by security area on choice of technique and on point and periodicity of external anchoring

## Context

The requirement is that every access to health data be traced in **non-repudiable and non-alterable** fashion. The second adjective is the difficult one, because **the threat model includes the operator themself**: whoever administers the system must not be able to modify or delete an entry without the alteration being detectable.

The systematic misunderstanding from which the decision departs is that automatic versioning of entities offered by the persistence level satisfies the requirement. It does not: history tables are tables like any other. Versioning **versions, does not make immutable**.

The security area posed the question in the form of a choice between four techniques: application-level hash chain, append-only archiving, single write on object, periodic signature with timestamp.

## Alternatives evaluated

The premise of the answer is that **the four are not alternatives to choose between**: they cover different threats and none alone covers the declared threat model.

| Technique | Covers | Does not cover |
|---|---|---|
| **Application-level hash chain** | Modification or deletion of an entry, reordering, retroactive insertion | Rewriting of the entire chain by whoever controls the application |
| **Archive with single write per object** | Modification and deletion within archive retention period | Absence of writing of an entry never produced |
| **Separate conservation with disjoint privileges** | Rewriting of entire chain by administrator of application archive | Collusion between administrators of the two systems |
| **Periodic signed anchoring with timestamp** | Collusion, within the interval between two anchorings | Entries between the last anchoring and the moment of attack |

Choosing a single technique thus means accepting the corresponding «does not cover» column. With application chain only, whoever controls the application rewrites everything and verification returns positive: the guarantee reduces to trust in the operator, which is exactly what the requirement excludes.

## Decision

**All four layers are adopted.**

1. **Application-level hash chain**, per tenant. Each entry carries the hash of its own content and that of the entry before it. The chain is **per tenant and not global**: a global chain would create dependency between tenants and make it impossible to deliver to an owner evidence of their own accesses without exposing them to the existence of others.
2. **Copy to append-only archive**, asynchronous with monitored delay. Blocking write is that on the primary register archive: blocking also the replica would move the availability of the clinical system below that of the conservation system.
3. **Conservation with disjoint privileges**: whoever administers the application archive has no write privileges on the register archive, and vice versa.
4. **Periodic anchoring** of the hash of the head, signed and timestamped, kept separate from the chain.

**The residual vulnerability window is declared**: entries between two consecutive anchorings, only in the hypothesis of collusion between whoever administers the application and whoever administers the conservation. Its width is the parameter regulating the relationship between cost and guarantee, and is the measure of quality scenario SQ-01.

## Consequences

**Positive**

- The guarantee does not depend on trust in a single administrator.
- The extract for whoever verifies is **independently verifiable** by whoever produced it: the calculation method and chain structure are documented publicly, because secrecy of method adds no security and subtracts verifiability.
- Failure of verification delimits an interval of uncertainty instead of producing an indistinct failure.

**Negative, accepted**

- **Register write is blocking**: its failure causes the operation to fail. It follows that register unavailability is system unavailability for operations on clinical data. It is severe and deliberate: proceeding without trace would produce a window of undemonstrable accesses, and the window would coincide with the incident, which is when demonstrability is most needed.
- The register is on the critical path and its latency enters operation budgets.
- The chain **does not repair itself**: if broken a new generation is opened anchored to the previous, and the break is itself registered. Repair would mean rewriting.
- **In customer installation the separation of privileges is not imposable by the project**: it is a requirement the customer satisfies. The project makes separation the default configuration, detects and signals configuration where the two archives share credentials, and declares the consequence - in that configuration the guarantee reduces to application-chain only.

## Point and periodicity of anchoring

The security area deferred to this area also the determination of point and periodicity of anchoring, correctly observing that the rewritable interval is that between two anchorings. This area decides the **structure**; the numerical value of the interval remains a risk parameter.

**Double trigger, not only temporal.** Anchoring occurs at the occurrence of whichever comes first: the elapse of the declared interval, or the exceeding of an entry volume threshold. Temporal trigger only leaves heavily populated intervals during peak hours and empty anchorings at night, which concentrates risk precisely where activity is greatest.

**Anchoring also on event**, before every operation that might alter the chain or its context: application of a retention policy with removal of a segment, register migration, tenant dismissal, selective restoration. Anchoring before makes those operations non-repudiable.

**Three destinations of attestation**, in order of growing strength and cumulative:

1. **Archive of anchorings with disjoint privileges** from register archive. It is the minimum, and alone does not protect from collusion.
2. **Delivery of attestation to the data controller** together with the periodic report. It is the strongest measure at almost no cost: from that moment **a copy of the hash is in the hand of a subject the operator does not control**, and rewriting history means contradicting a document already delivered to a third party.
3. **Timestamp from a qualified service**, which adds the duality of date. It is **configurable and not mandatory**, because it introduces external dependency that customer installation might not have; when absent, the declarable guarantee is reduced and the reduction must be declared.

**Deferred to security area** (`[NV]`): the **value** of the interval and volume threshold, choice of timestamp service, conservation of anchorings, cadence of verifications, minimum form of request origin compatible with minimisation, and whether the register archive can be the same engine as the application archive with disjoint privileges.

## References

[07 - Tracking and immutable register](../02_architecture/07-tracciamento-e-registro-immutabile.md)
