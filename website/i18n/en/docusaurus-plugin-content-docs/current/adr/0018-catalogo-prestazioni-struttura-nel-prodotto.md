---
title: "ADR-0018 - Service Catalogue: Structure in the Product, Content Per Tenant"
sidebar_position: 18
description: "Why the project defines the form of a catalogue entry but does not distribute the content, and why double coding and temporal validity are not optional."
---

# ADR-0018 - Service Catalogue: Structure in the Product, Content Per Tenant

**Status**: accepted · **Date**: 25 August 2026 · **Area**: ARCH
**Origin**: question raised by the foundational module to this area

## Context

The catalogue of services to be provided is a reference data with three awkward properties: it is defined by an external normative source; it is **territorially differentiated**, because each regional administration maintains its own catalogue that extends and renames the national one; and it has **independent update cycles**.

The question posed is whether it is reference data **included** in the product or **exclusively referenced** by the tenant.

A verified fact of the domain determines the answer: **no distinct code for remote service provision exists**. Services already present in the catalogue, if delivered remotely, maintain the same coding and the same tariff as the corresponding service in person. Remote mode is a **channel modifier**, not a service in itself.

## Alternatives Evaluated

### Alternative 1 - Catalogue Included in the Distribution

*Advantages*: the system works immediately; no loading burden on whoever instals; validation and search available straight away.

*Trade-offs*:

- **Every regional update becomes a product release.** With independent and numerous cycles, the release cadence of the project would be determined by third-party administrative acts.
- The project would assume **editorial responsibility for normative content of third parties**: a transcription error in a distributed catalogue becomes a billing error at every installation.
- Distribution would contain data that the project has no title to curate.

**Rejected.**

### Alternative 2 - Exclusively Referenced, No Structure in Product

*Advantages*: no responsibility for content; no maintenance.

*Trade-offs*: the product could not validate a code, could not search, could not make a service selectable, could not verify that the service is enabled on a channel. Every tenant would re-implement the same structure, with different outcomes. **Rejected.**

### Alternative 3 - Structure in Product, Content Per Tenant

*Advantages*: the product offers the function without assuming responsibility for content; each tenant loads what is its responsibility with its own cycle.

*Trade-offs*: a new installation is not usable until the catalogue is loaded; loading is an additional activation step.

## Decision

**Alternative 3 is adopted.**

The product defines the **structure** of a catalogue entry-code, domain of catalogue attribution, description, specialty, enabled channels, temporal validity, reference to the corresponding national code-and the operations of loading, validation, search and disablement. **The content is tenant data**, loaded by documented application interface and versioned with temporal validity, never included in the distribution.

Three mandatory consequences:

1. **Double coding is native.** An entry carries together the code of the tenant's catalogue and the corresponding national code, because billing requires both.
2. **Temporal validity is not optional.** A catalogue without validity makes historical billing non-reproducible: the service provided a year ago is to be billed with the coding in force then.
3. **The project distributes no catalogue**, not even as an example with real data. Demonstration material uses a synthetic catalogue, explicitly marked as such.

**Extension by analogy**: the same rule applies to every reference data with external lifecycle and territorially differentiated.

## Consequences

**Positive**

- The project is not bound by the update cycles of third parties.
- No editorial responsibility for normative content of others.
- The two axes-«what was delivered» and «how it was delivered»-remain orthogonal, which is the condition for the system to be billable.

**Negative, Accepted**

- A new installation requires catalogue loading before it is operational: it must be documented in the list of what whoever instals must provide.
- The project must provide robust loading and validation tools, because loading is the responsibility of whoever does not know the system.
- Documentation must explain double coding to integrators who often know only one side.

## References

[04 - Data Model](../02_architecture/04-modello-dati.md#63-the-catalogue-of-performances) ·
[02 - Bounded Contexts](../02_architecture/02-contesti-delimitati.md#ctx-13---tenant-administration)
