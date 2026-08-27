---
title: Registers - index and orientation
sidebar_position: 1
description: "What the registers of constraints and open questions contain, what they do not contain, and how to read a sigla cited elsewhere in the documentation."
---

# Registers - index and orientation

> **A reference without a target is not a reference.**
> This area exists because this project's documentation cites, in prose and as being in force,
> more than two hundred constraint and question siglas. Until 27 August 2026 those siglas lived in
> an internal working file that was never published: a reader found the reference and had no way
> whatsoever to reach what it referred to.

## 1. What this area is and what it is not

This area answers one question only: **what does the sigla I have just read say**. It holds no
requirements - those are in [`docs/03_functional/`](../03_functional/00-indice.md) - no
architectural decisions - those are in the [ADRs](../adr/README.md) - and no milestones or
programme risks, which belong to the [roadmap](../09_roadmap/00-indice.md).

| # | Page | Which question it answers |
|---|---|---|
| 01 | [Constraints in force](./01-vincoli-in-vigore.md) | What the `V-` sigla I read imposes, who issued it, which areas it binds |
| 02 | [Open questions](./02-questioni-aperte.md) | What is still unresolved under the `Q-` sigla I read, who raised it, where it stands |
| 03 | [Founding constraints](./03-vincoli-fondanti.md) | What the six hyphenless constraints - `V1`…`V6` - cited throughout the documentation actually say |

## 2. How to read a sigla

The siglas belong to **two distinct families**, and the distinction is not typographic.

The **founding constraints** are written without a hyphen - `V1`, `V2`, `V3`, `V4`, `V5`, `V6` -
and are the six commitments that define the project: data sovereignty, separation from the medical
device perimeter, full integrability, tenant awareness, immutable auditability, usability and
accessibility. They are stated in
[Founding constraints](./03-vincoli-fondanti.md), are closed in number and do not change.

The **inter-area constraints and questions** are written with a hyphen and a number - `V-160`,
`Q-135` - and are the product of the work between the project's areas: one area issues a
constraint the others must respect, or raises a question another area must decide. These are the
ones registered in this area.

## 3. The numbering, and why it has gaps

The numbers are **not consecutive**, and the gaps are not omissions: they are the structure.
Numbers 1 to 12 belong to the constraints issued at the outset by orchestration and by the guide;
from 110 upwards the space is divided into **blocks of ten, one per area** - security in
`V-150`…`V-157`, integration in `V-160`…`V-166`, and so on - so that two areas working at the same
time cannot mint the same number.

The range from 13 to 109 is **empty for a historical reason worth knowing**, because it explains a
defect this documentation carried for months. At the start each area numbered independently from
13, and the same sigla designated different things depending on who wrote it. When the numbering
was globalised into blocks, the table was rewritten and **the corpus was not**: seventy-six
citations went on naming the old numbers. They were corrected on 27 August 2026, and since then a
build control verifies that every sigla cited in the documentation resolves in these registers, in
both languages.

## 4. What this area does not guarantee

The register says **what an entry imposes and where it stands**, not whether it has been
implemented. A constraint in force is a binding commitment on the areas, not an attestation that
the system already satisfies it: the project is in design and no application code exists yet.
For what exists and what does not, see [State and limits](../00_overview/04-stato-e-limiti.md).
