---
title: Founding constraints
sidebar_position: 4
description: "The six architectural constraints that define Telemedic: data sovereignty, separation from the medical device perimeter, full integrability, tenant awareness, immutable auditability, usability and accessibility."
---

# Founding constraints

> **Six constraints, and none of them is negotiable.**
> They are cited two hundred times across this documentation, in every area, as the ultimate
> reason for a technical choice. Until 27 August 2026 they were stated **only in the project's
> internal working context**, which is not published: a reader who found "by constraint `V1`" had
> no way whatsoever of learning what `V1` said. This chapter closes that gap.

## 1. How they differ from the inter-area constraints

They are written **without a hyphen**: `V1`, `V2`, and so on, never in the hyphenated form that
distinguishes the siglas of the inter-area register. The difference is not orthographic.

The inter-area constraints, registered in [Constraints in force](./01-vincoli-in-vigore.md), arise
from the work: an area issues one because it has discovered something the others must respect, and
their number grows. The six founding constraints are **prior to that work**: they derive from the
project's steering decisions, are closed in number, and are not added to. An inter-area constraint
may be amended by the area that issued it; these may not.

Many inter-area constraints are **corollaries** of one of these six, and say so: `V-164` is the
operational corollary of `V3`, `V-166` is that of `V-08`. Where a corollary and a founding
constraint appear to say different things, the founding constraint prevails.

## 2. The six constraints

### V1

**Data sovereignty.** No mandatory component of the main path is hosted outside the European
Union, and no runtime dependency on services established outside the Union may prevent the most
restrictive deployment profile. Media flows peer to peer; the traversal server is hosted by the
project and not by a third party.

This is not a political preference: it is the property that makes the system deployable in the
three documented profiles - European Union, Italian territory, national qualified cloud - without
rewriting it. The operational consequence is set out in
[Vision and objectives](../00_overview/01-visione-e-obiettivi.md).

### V2

**Separation from the medical device perimeter.** The boundary between a **communication vehicle**,
which lies outside the diagnostic perimeter, and **clinical decision support**, which lies inside
it, must be explicit in the architecture and not left to the reader's interpretation.

The reason is precise and carries a cost: **rule 11** of Annex VIII to Regulation (EU) 2017/745
would classify as **class IIa**, with the involvement of a notified body, software that provides
information used for diagnostic or therapeutic decisions. The production of a `DiagnosticReport` is
therefore designed as **persistence of content drafted by the clinician**, never as autonomous
generation of clinical information. A single component that generated clinical information would
move the entire system into another class.

### V3

**Full integrability.** Every capability of the system must be reachable by a third party system
through a documented interface. **No functionality is accessible only from the user interface.**

The operational corollary is [`V-164`](./01-vincoli-in-vigore.md#v-164): the area that introduces a
capability also introduces its contract, and until the contract exists the capability is not
complete. The project's own user interface is a consumer of the same interfaces offered to
integrators, not a privileged path.

### V4

**Tenant awareness.** Every domain entity, every event and every row of the access log carries the
tenant identifier.

The constraint is on the **structure of the data**, not on access control: a missing identifier
cannot be reconstructed after the fact, and an event published without one is attributable to
nobody.

### V5

**Immutable auditability.** Every access to health data is traced in a manner that is
**non-repudiable and non-alterable**.

"Non-alterable" rules out entity versioning as a sufficient means: whoever has write access to the
database can alter the version tables too. The project uses a hash chain with separate retention,
as established by [ADR-0013](../adr/0013-registro-immutabile-a-quattro-strati.md).

### V6

**Usability, accessibility, mobile first.** This is a requirement that cuts across the whole
system, not a final phase.

It has three distinct components and all three are mandatory: WCAG 2.1 AA and standard EN 301 549
as **functional requirements**, therefore verifiable and not a matter of opinion; mobile first as a
**design method**; usability engineering under IEC 62366-1 as a **regulatory obligation**, because a
use error in a health system is a clinical risk and not an annoyance.

## 3. Where this text comes from

The wording of the six constraints is transcribed from the project's steering document,
`.telemedic/context/00_PROJECT_BRIEF.md` §7, which remains the source. This chapter **publishes**
it, together with the rationale already present in the corpus, and does not modify it: where the
steering document uses an abbreviated form, the full form adopted by the rest of the documentation
is used here, without changing what the constraint imposes.
