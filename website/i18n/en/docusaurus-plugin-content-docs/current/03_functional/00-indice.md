---
title: "Functional area - index"
sidebar_position: 1
description: "Map of Telemedic's functional area: actors and roles, requirements catalogue with frozen identifiers, use cases with alternative and error flows, business rules, alarm management, verifiable accessibility and usability, excluded scope."
---

# Functional area

This area describes **what the system does**, for whom, under what conditions and with what consequences when things go differently than they should. It does not describe how it is constructed: that is the task of `docs/02_architecture/`. It does not repeat the clinical, normative and organisational foundations: those are in the guide in `docs/10_fondamenti/` and are referenced here, not summarised.

## 1. Who it is for and how to read it

| If you are… | Read in this order | Why |
|---|---|---|
| Developer who must implement a story | [02 - Requirements catalogue](02-catalogo-dei-requisiti.md) → [03 - Use cases](03-casi-d-uso.md) → [04 - Business rules](04-regole-di-business.md) | the requirement says *what*, the use case says *in what order*, the rule says *what is never lawful* |
| Analyst or product owner | [01 - Actors and roles](01-attori-e-ruoli.md) → [03](03-casi-d-uso.md) → [07 - Out of scope](07-fuori-perimetro.md) | before adding anything, know who will use it and why something has been deliberately excluded |
| Quality manager or conformity assessor | [02](02-catalogo-dei-requisiti.md) §§ 12–13 (traceability and mapping) → [04](04-regole-di-business.md) → [05 - Alarms](05-gestione-degli-allarmi.md) → [06 - Accessibility and usability](06-accessibilita-e-usabilita.md) | this is the chain requirement → rule → acceptance criterion → evidence |
| Integrator | [01](01-attori-e-ruoli.md) § 6 (non-human actors) → [02](02-catalogo-dei-requisiti.md) § 12 → [07](07-fuori-perimetro.md) | which capabilities are exposed, which limits cannot be circumvented by configuration |
| Clinician or health service management | [05](05-gestione-degli-allarmi.md) → [04](04-regole-di-business.md) → [07](07-fuori-perimetro.md) | the boundary of what the system decides and what remains professional act |

Those with no prior experience in digital healthcare must first read modules [02 - Telemedical services](../10_fondamenti/02-prestazioni-di-telemedicina.md) and [10 - Care pathways and patient safety](../10_fondamenti/10-percorsi-di-cura-e-sicurezza.md) from the foundations guide. Without those two modules, half the choices documented here appear arbitrary: in particular everything concerning thresholds, alarms, patient silence and service coverage hours. The end-to-end path of processes, with diagrams of main and fallback flows, is in module [14 - Functional flows](../10_fondamenti/14-flussi-funzionali.md).

## 2. The documents

| File | Content | Identifiers introduced |
|---|---|---|
| [01 - Actors and roles](01-attori-e-ruoli.md) | who uses the system, with which objective, in which capacity, with which real constraints of time, digital literacy, device and network; actor × capability matrix | `ATT-20` … `ATT-26` |
| [02 - Requirements catalogue](02-catalogo-dei-requisiti.md) | functional and non-functional requirements with verifiable acceptance criteria, MoSCoW priority, traceability to use cases and rules; mapping of the 58 design consequences from module 10 | `RF-230` … `RF-352`, `RNF-090` … `RNF-110` |
| [03 - Use cases](03-casi-d-uso.md) | use cases with preconditions, main flow, alternative flows, error flows, postconditions, typed outcomes | `UC-01` … `UC-24`, `EX-TM-*` |
| [04 - Business rules](04-regole-di-business.md) | rules with normative source where it exists and consequence of violation | `BR-100` … `BR-185` |
| [05 - Alarm management](05-gestione-degli-allarmi.md) | thresholds as per-patient configuration, alarm lifecycle, taking charge, failure to respond, escalation, patient silence, systemic failure | refers to `RF-269` … `RF-306` |
| [06 - Accessibility and usability](06-accessibilita-e-usabilita.md) | verifiable requirements with verification method and operational acceptance criterion; real user profiles | refers to `RNF-044` … `RNF-054`, `RNF-105` … `RNF-107` |
| [07 - Out of scope](07-fuori-perimetro.md) | what the system does not do, why, and the link to intended purpose | `OUT-01` … `OUT-24` |

## 3. What continues to hold from the research phase

The catalogue in this area **does not start from scratch**. The identifiers `RF-001` … `RF-223`, `RNF-001` … `RNF-083`, `BR-001` … `BR-096`, `ATT-01` … `ATT-19`, `PRM-*`, `BC-01` … `BC-13` and `KPI-01` … `KPI-18` were assigned in the research phase and **are frozen**: they are not renumbered, they are not reassigned, they do not change meaning. Decision D45 of the project qualifies them as retroactively unrecoverable activity: the traceability required by IEC 62304 §5.1.1 cannot be reconstructed after the fact, and an identifier reused for a different requirement renders the entire matrix unusable.

This area **extends** that catalogue on six areas that were declared uncovered and that concern the most sensitive part of the domain - remote monitoring and patient safety:

1. the **versioned remote monitoring plan** and its relationship with the population pathway;
2. the **measurement expectation window** and the treatment of its expiry;
3. **escalation that terminates in a declared failure** rather than a silent closure;
4. **surveillance of the expected volume** of measurements, which is the only way to notice a failure that silences all patients simultaneously;
5. the **declared service coverage hours**, treated as a safety requirement and not as a commercial parameter;
6. the **traceability of the calculation** of any score derived from clinical data.

The new numbering ranges start from `RF-230`, `RNF-090`, `BR-100` and `ATT-20` precisely to avoid affecting the reserved ranges from the research phase, which remain available for insertions in already covered areas.

## 4. The editorial rules that this area imposes on itself

**A requirement you do not know how to verify is not a requirement.** Every entry in the catalogue has an acceptance criterion in the form *given / when / then*, and every non-functional requirement has metric, threshold, measurement condition and verification method. Formulations such as "the system must be reliable" have been excluded by construction: not because they are false, but because they do not produce a test that can fail.

**No clinical threshold appears in these documents.** Not for editorial caution: because the threshold is the content of an individual health document, drafted and signed by a professional (constraint V-02 and decision D21). A clinical numerical value written in a technical document eventually ends up in a constant. Where an example is needed, a letter or symbol is used.

**Every normative assertion cites the source** with the act, article or annex. What has not been verified on primary source is marked `[NV]` with an indication of who to ask. What is a project modelling proposal is declared as such and distinguished from what the rule requires.

**Synthetic data only.** No example contains data traceable to real people, no plausible tax identification numbers, no names of existing facilities. No document names companies, brands, commercial products or domains of potential partners: always generic formulas are used (rule R0).

## 5. What this documentation is not

It is not a user interface specification: it describes functional obligations and constraints, not layout. It is not a user manual: that is written on the finished product and has its own language and content obligations under MDR Annex I. It is not the intended purpose: the formal declaration of intended purpose and limits of use is an autonomous artefact in the regulatory package (`MDR-IU-001`), and is the document from which this area **derives**, not the other way round. Chapter [07 - Out of scope](07-fuori-perimetro.md) is the link between the two.

> **Warning that applies throughout the area.** The repository is not a medical device and today the project does not affix the CE marking (decisions D28, D49, constraint V-06). With decision D63 of 26 August 2026, the project intends to assume the role of manufacturer, still to be constituted as a legal entity: the path is underway and marking is a product requirement. No requirement in this catalogue can be read as attestation of conformity: these are product specifications, verifiable, produced for the entire development and certification path.
