---
title: The healthcare domain
sidebar_position: 1
description: How the real domain of Italian telemedicine becomes an executable model - ubiquitous language, modelled services and state machines, subjects and roles, clinical documents, parameters, consent, terminologies, care pathways and glossary.
---

# The healthcare domain

This area answers a single question: **how the real healthcare domain transforms into an
executable model without betraying it.**

It is not a repetition of the foundations. The modules in
[`docs/10_fondamenti/`](../10_fondamenti/00-come-usare-questa-guida.md) explain *what exists*
in the world - what a remote consultation (televisita) is, what a report is, what arterial pressure is, what a care plan is. This area establishes *how it is represented*: which aggregates, which states, which permitted
transitions, which invariants, which mandatory attributes, which boundaries between concepts that
everyday language confuses.

The criterion that governs every choice contained here is single, and must be stated before
everything else: **the model must be able to tell the truth about what happened.** A model that
cannot distinguish a patient who did not attend from one who attempted and failed to connect is
not imprecise: it is false, and produces unjust charges. A model that cannot distinguish a draft
from a signed report is not incomplete: it is dangerous, because an unvalidated document can
acquire value that it lacks. A model that treats consent as a boolean does not simplify: it
renders indemonstrable what the data controller is required to demonstrate.

## What is binding and what is proposed

Every statement in this area is explicitly classified:

| Marker | Meaning |
|---|---|
| **[NORM]** | The regulation or administrative act establishes it. The exact source always follows: act, article, section, annex, paragraph |
| **[BASE]** | It derives from `04_BASELINE_ARCHITETTURALE.md` or from a decision `D1`-`D52` of the brief. It is not negotiable in this area |
| **[MOD]** | It is a **modelling decision of this area**, identified with `DM-nn`. Adoptable or rejectable, but declared as a proposal and not as an obligation |
| **[NV]** | Not verified. It always indicates who the verification should be asked from and what changes if the answer is different |

The domain rules already catalogued in `R6` (identifiers `BR-nnn`), functional requirements
(`RF-nnn`) and non-functional (`RNF-nnn`) are **not renumbered or rewritten**: this area cites
them and derives the data structure from them, as `D45` requires on the freezing of requirement
identifiers.

## The chapters

| # | Chapter | What is decided in it |
|---|---|---|
| 01 | [The ubiquitous language](01-linguaggio-ubiquo.md) | The vocabulary shared between clinicians and developers: normative definition where it exists, operative where it does not, and the terms that seem synonymous and are not |
| 02 | [Services modelled](02-le-prestazioni-modellate.md) | Remote consultation (televisita), specialist-to-specialist consultation (teleconsulto), teleconsulenza (telephone consultation inquiry), remote assistance (teleassistenza), remote monitoring (telemonitoraggio): actors, lifecycle, states, permitted transitions, outcomes, what each produces and what each cancels |
| 03 | [Beneficiary, professional, organisation](03-assistito-professionista-organizzazione.md) | Persons, roles with temporal validity, relationships, delegations, representation. Why role is not an attribute |
| 04 | [Clinical documents](04-documenti-clinici.md) | Typologies, drafting, validation, signature, version, correction, suppression. The canonical dataset and the ten national document typologies |
| 05 | [Parameters and observations](05-parametri-e-osservazioni.md) | The measurement and its mandatory context, units, provenance, reliability, missing data, time series |
| 06 | [Consent and confidentiality](06-consenso-e-riservatezza.md) | Consent as a fact with temporal validity, revocation, suppression, traced emergency access |
| 07 | [Terminologies in the domain](07-terminologie-nel-dominio.md) | Which codings for which concepts, the licensing regime and its consequences on the model, behaviour without a terminology server |
| 08 | [Care pathways and plans](08-percorsi-e-piani-di-cura.md) | Care assumption, plan, adherence, outcomes. How to support multiple pathways without hardcoding any |
| 09 | [Domain glossary](09-glossario-del-dominio.md) | Extended Italian/English glossary with cross-references and managed terminological collisions |

## The seven constraints that traverse the whole area

They are in force by decision of the orchestration and are not waivable by this area.

1. **`V-01` - `Encounter` and `MediaSession` are distinct aggregates.** The clinical service and
   the media session have independent lifecycles. Chapter 02 makes it the backbone.
2. **`V-02` - no clinical threshold hardcoded.** Thresholds are configuration per beneficiary,
   never code constants. Chapters 05 and 08 make it operative.
3. **`V-03` - the system is fully functional without SNOMED CT.** No main pathway can require it.
   Chapter 07 declares the exact cost of this choice.
4. **`V-04` - the immutable register is a hash chain with separate conservation.** Versioning of
   entities does not replace it. It affects chapters 04 and 06.
5. **`V-07` - the content of documents for the record is modelled as a canonical dataset**;
   serialisations are replaceable. It is the linchpin of chapter 04.
6. **`V-09` - the absence of data is clinical information.** Silence is never treated as
   normality. It is the linchpin of chapter 05, the section on missing data.
7. **`R0` - confidentiality.** No company name, brand, commercial product or domain of a
   potential partner appears in this area. Only generic formulas are used: "a cloud healthcare
   management system", "a third-party EHR system", "the integrator", "the national or regional
   document repository".

## The twelve modelling errors that this area exists to prevent

Each has been observed in real systems in this domain and is the reason why the corresponding
chapter is written as it is.

| # | Error | Concrete consequence | Where it is resolved |
|---|---|---|---|
| 1 | A single type of "service" that covers request, execution and billing | Null fields, fragile conditional rules, impossible reporting | [01](01-linguaggio-ubiquo.md), [02](02-le-prestazioni-modellate.md) |
| 2 | `Encounter` and media session merged | Every disconnection creates a phantom contact; network failure closes the clinical act | [02](02-le-prestazioni-modellate.md) |
| 3 | Role as an attribute of the person | The same professional cannot operate in two organisations; history of roles is lost | [03](03-assistito-professionista-organizzazione.md) |
| 4 | Carer and legal representative treated as the same figure | Consents gathered from those without authority to give them | [03](03-assistito-professionista-organizzazione.md), [06](06-consenso-e-riservatezza.md) |
| 5 | Report draft treated as report | An unvalidated document acquires evidentiary value that it lacks | [04](04-documenti-clinici.md) |
| 6 | Signed document modified in place | Loss of integrity, correction chain irrecoverable | [04](04-documenti-clinici.md) |
| 7 | Serialisation template hardcoded in data model | A revision of national specifications imposes rewriting the domain | [04](04-documenti-clinici.md) |
| 8 | Measurement reduced to value plus instant | No way to know who measured, with what instrument, under which conditions | [05](05-parametri-e-osservazioni.md) |
| 9 | Remote monitoring silence interpreted as stability | Clinical deterioration that prevents measurement remains invisible | [05](05-parametri-e-osservazioni.md), [08](08-percorsi-e-piani-di-cura.md) |
| 10 | Consent as boolean | Revocation without effect, consent not attributable to a text, suppression inferrable | [06](06-consenso-e-riservatezza.md) |
| 11 | Interface strings confused with `Coding.display` | Translations that become derivatives of third parties and contaminate the licence | [07](07-terminologie-nel-dominio.md) |
| 12 | Care pathway hardcoded in code | Twenty-one independent regional cycles become twenty-one code branches | [08](08-percorsi-e-piani-di-cura.md) |

## How to read this area

- **Those designing the data model** read in order 01 → 03 → 02 → 04 → 05 → 06, which is the
  actual dependency order: first the vocabulary, then the subjects, then the acts, then what the
  acts produce.
- **Those implementing a bounded context** read the chapter that is theirs and chapter 01, which
  contains the naming rules applicable to every context.
- **Those integrating a third-party system** read 01, 03 and 04: the vocabulary, the model for
  reference of demographics and the canonical dataset of documents are what crosses the boundary.
- **Those working on compliance** read 04, 06 and 07: they are the three chapters in which the
  model encounters punctual regulatory obligations and bears their trace.

## Warning on product state

Consistently with `D16` and `D51`, nothing described in this area implies that the software is
CE marked. The domain model is designed **so that it can be certified by those who intend to
certify it**, not because it is certified. No chapter of this area can be read as a declaration
of compliance with a regulation on medical devices.

## Data in examples

All examples, identifiers, codes and values reported in this area are **synthetic**. No real
data, even partial, even pseudonymised, appears in any chapter, in any diagram and in any code
block. It is the absolute rule stated by module [03 of the
foundations](../10_fondamenti/03-il-dato-clinico.md), § 10, and applies here without exceptions.
