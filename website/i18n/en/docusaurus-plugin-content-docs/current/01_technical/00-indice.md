---
title: "Technical area - index"
sidebar_position: 1
description: "How the system is realised. Index of the technical area, reading paths by profile, boundaries with other areas, constraints imposed and questions left open."
---

# Technical area

This area describes **how the system is realised**: which technologies, with what structure, with which execution constraints, with which measured or declared limits. It does not describe **what the system does** - that is `docs/03_functional/` - nor **why the boundaries are where they are** - that is `docs/02_architecture/`.

The editorial criterion is a single one: **every choice is motivated and every limit is declared**. Where information has not been verified, it is marked `[NV]` and it is said to whom to ask. Where a decision does not belong to this area, it is opened on the noticeboard instead of being invented.

---

## The ten chapters

| # | Chapter | What it resolves |
|---|---|---|
| 1 | [Technology stack and motivations](./01-stack-e-motivazioni.md) | Every technology: which problem it solves, which alternatives have been discarded and why, minimum version and its reason, classification as a third-party component, substitution strategy |
| 2 | [Backend](./02-backend.md) | Structure of modules and verified dependency rules, transactional boundaries, concurrency on virtual threads with its real traps, validation at four boundaries, form of errors, typed configuration, profiles |
| 3 | [Persistence](./03-persistenza.md) | Schema per tenant and per context, isolation applied by the engine, versioned non-blocking migrations on N tenants, time series, indices and their cost, immutable register as hash chain, backup and restore |
| 4 | [Frontend](./04-frontend.md) | Architecture of autonomous components, three categories of state, session state machine, network resilience, **mobile first and accessibility as verifiable acceptance criteria**, internationalisation and separation from coding labels |
| 5 | [Media and real time](./05-media-e-tempo-reale.md) | Signalling, negotiation, relay and its securing, flow security verified at runtime, quality measurement, really available levers, recording with container negotiated at runtime, tests on degraded network |
| 6 | [Observability](./06-osservabilita.md) | **What cannot be logged when data is healthcare**, structured logs, metrics, traces, correlation, severity levels with operational criteria, post-incident investigation |
| 7 | [Performance and capacity](./07-prestazioni-e-capacita.md) | Latency balance by stage, percentiles instead of averages, sizing unit, backpressure at four levels, **declared limits**. No threshold is presented as compliance |
| 8 | [Quality and testing](./08-qualita-e-test.md) | Test pyramid, contract tests, synthetic data, automated and manual accessibility, load tests, minimum and differentiated coverage, requirement → test traceability |
| 9 | [Continuous integration and release](./09-integrazione-continua-e-rilascio.md) | Pipeline at four tiers, thirteen mandatory checks, versioning at two lifetimes, reproducible build, signed artefacts, bill of materials, support period |
| 10 | [Verifying the documentation site](./10-verifica-sito-di-documentazione.md) | Criterion 6 of `T-07`: the executable and repeatable procedure that establishes navigation, search and the translation-in-progress notice of the published site, and the dated register of its executions |

---

## Reading paths

**Those who need to contribute to the service code.** Chapters 1, 2, 3, then 8. Chapter 2 §1 and Chapter 3 §2 contain the rules that a modification cannot violate without causing the build to fail.

**Those who need to contribute to the interface.** Chapters 1 §6, 4, then 8 §6. Criteria M1-M8 and A1-A10 of Chapter 4 are acceptance criteria, not recommendations.

**Those who need to touch the media plane.** First [`docs/10_fondamenti/08-webrtc-da-zero.md`](../10_fondamenti/08-webrtc-da-zero.md) in full, then Chapter 5, then Chapter 7 §2. Chapter 5 §1 is the first thing to read: it distinguishes what the project realises from what belongs to the protocol and to the browser.

**Those who need to install or deploy to live.** Chapters 1 §14, 3 §9, 6, 7, 9 §§7–11.

**Those who verify or certify.** Chapters 1 §14, 8 §9, 9. The traceability report and attestations are release artefacts, not documents produced on request.

**Those who integrate from outside.** This area is not the entry point: that is `docs/07_integration/`. Here what matters is Chapter 2 §7 (form of errors), Chapter 8 §3 (contract tests) and Chapter 9 §5 (versioning and dismissal).

---

## Boundaries with other areas

| Question | Competent area |
|---|---|
| Why the contexts are these and not others | `docs/02_architecture/` and the architectural baseline §1 |
| What a feature does, for whom, with which clinical rules | `docs/03_functional/` |
| How to write a message to a third-party system | `docs/04_protocols/` and `docs/07_integration/` |
| What a datum means clinically | `docs/05_domain/` |
| Threat model, policies, key management | `docs/06_security/` |
| What the standard requires and who answers | `docs/08_compliance/` |
| When what happens | `docs/09_roadmap/` |
| What is an aggregate, an outbox, a percentile | `docs/10_fondamenti/` |

The references are explicit in the text. No foundation is repeated: if a concept is needed and is not explained, the reference takes you to the module that explains it from zero.

---

## Constraints that this area imposes on others

They are written on the noticeboard and summarised here because they condition the work of others.

1. **Two sole representations of error** on the public interface: representation of the problem on the application plane, outcome of the operation on the interoperability plane. No third form. No clinical content nor direct identifier in the message.
2. **Expand and contract on every migration**: two consecutive versions must be able to coexist on the same database. It is the condition of update without interruption and of rollback to a previous version.
3. **Tenant context set inside the transaction**, before any query, with denial by default in its absence.
4. **No raw cumulative counter** can be cited as a quality indicator: they are differentiated between consecutive samples.
5. **The session quality index is proprietary** and must be declared as such: it is not an average opinion score according to any international recommendation.
6. **The recording container is negotiated at runtime and recorded in metadata**, even in server-side recording, where it depends on the codecs actually negotiated.

---

## Questions that this area does not decide

| Question | Responsibility |
|---|---|
| Topology of the signal at multiple instances: deterministic routing or session affinity | `ARCH`, with architectural decision recorded |
| Declared limit of participants in the media session | `ARCH` |
| Licensing regime of the time-series extension, verified on the primary text | `COMP` |
| Service level of third-party component updates and support period duration | `COMP` and `ROAD` |
| Quality thresholds as risk control in the risk management file | `COMP` |
| Degradation preference and jitter buffer objective as clinical trade-offs | `COMP` |
| Which system identifier to adopt for divergent demographic identifiers | `ARCH` and `DOM` |
| Reference device for interface performance thresholds | `PROD`, with measurement the responsibility of this area |

The complete register, with updated status, is in `.telemedic/context/05_BACHECA_INTERAGENTI.md`; the summary of this area's work is in `.telemedic/context/log-TECH.md`.

---

## Permanent warnings

- **The repository is source code, not a medical device**, and it declares this. Distribution is a separate artefact, with its own name, version and lifetime cycle (D17, Chapter 9 §1).
- **No artefact is marked CE**, and every distributed artefact declares this explicitly (D16, D49).
- **No technical threshold in this area is compliance.** They are product specifications and declared limits (constraint V-12, Chapter 7 §0).
- **No real data** appears in code, tests, examples, logs or documentation. All code and configuration fragments are **illustrative**, with declared language, only placeholders for secrets and only synthetic data.
