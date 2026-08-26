---
title: "Overview: index and orientation"
sidebar_position: 1
description: "The gateway to Telemedic documentation: how it is organised, reading paths by profile, the map of eleven areas with what each covers and does not cover, common conventions and precedence rules."
---

# Overview: index and orientation

This is the gateway to Telemedic documentation. **It does not summarise other areas:
it directs you to them.** If an answer exists elsewhere, here you will find the link and the reason why it stands there and not elsewhere.

The documentation is extensive - eleven areas, plus the register of architectural decisions -
and **nobody reads all of it**. §3 contains the paths that cover real cases.

## 1. The four pages of this area

| # | Page | Answers which question |
|---|---|---|
| 01 | [Vision and objectives](./01-visione-e-obiettivi.md) | What Telemedic is, what real problem it addresses, and **what it decided not to be** |
| 02 | [The four services](./02-le-quattro-prestazioni.md) | What truly distinguishes televisita, teleconsulto, teleassistenza and telemonitoraggio; what distinct obligations each carries; what notions of boundary are commonly confused with them |
| 03 | [Who it addresses](./03-a-chi-si-rivolge.md) | For healthcare facility, healthcare professional, patient, integrator and regional entity: what each obtains, what each must provide, **what the project does not give them** |
| 04 | [State and limits](./04-stato-e-limiti.md) | What exists today, what does not exist, the declared limits and the tensions accepted knowingly |

## 2. If you have five minutes

Three statements, each verifiable, that determine whether the rest interests you.

**First.** The repository is **source code and documentation**, not a medical device placed on the market. **Today it bears no CE marking** and is not covered by any declaration of conformity.
As long as a marking does not exist, **the software is not usable for the delivery of healthcare services on real patients**. The project has decided to assume in its own right the role of manufacturer
(`D58`), but the legal entity is **still to be established** and **no document declares a date by which the product will be marked**. Direct source:
[`NOT-A-MEDICAL-DEVICE.md`](https://github.com/fedcal/Telemedic/blob/main/NOT-A-MEDICAL-DEVICE.md).

**Second.** At the time this area was written **no application code exists**. An extensive body of documentation exists and not a single line of software for the service or interface. The complete picture is in [04 - State and limits](./04-stato-e-limiti.md) §2.

**Third.** The project is built around the regulatory definitions of telemedicine services in the Italian context, not around a video call platform. If the distinctions between remote consultation, specialist-to-specialist consultation, remote assistance and remote monitoring do not matter for your use case, almost all the choices documented here will seem unnecessarily complicated - and the explanation of why they are not is in [02 - The four services](./02-le-quattro-prestazioni.md).

## 3. Reading paths

### 3.1 Who is evaluating the project and must decide whether to adopt it

The order is deliberate: first the limits, then the scope, then what adoption entails.

1. [04 - State and limits](./04-stato-e-limiti.md), **in its entirety**. §7 is the list of eight points that must be known before deciding.
2. [`docs/09_roadmap/03-primo-rilascio-utilizzabile.md`](../09_roadmap/03-primo-rilascio-utilizzabile.md)
   - exact scope of the first release, installation assumptions, declared limits.
3. [`docs/06_security/09-ripartizione-delle-responsabilita.md`](../06_security/09-ripartizione-delle-responsabilita.md)
   - the table to place alongside a specification. It exists specifically so that nobody believes they are covered where they are not.
4. [`docs/03_functional/07-fuori-perimetro.md`](../03_functional/07-fuori-perimetro.md) - what
   the system does not do, with the reopenability category of each exclusion.
5. [`docs/09_roadmap/00-indice.md`](../09_roadmap/00-indice.md) §§2–3 - so as not to attribute to
   the project commitments it has not assumed.

### 3.2 Who must install and put into operation

1. [`docs/02_architecture/08-viste-di-deployment.md`](../02_architecture/08-viste-di-deployment.md)
   - components, networks, relay isolation, dependencies.
2. [`docs/09_roadmap/03-primo-rilascio-utilizzabile.md`](../09_roadmap/03-primo-rilascio-utilizzabile.md)
   §5 - the assumptions. **Whoever cannot satisfy them cannot install.**
3. [`docs/02_architecture/05-multi-tenancy.md`](../02_architecture/05-multi-tenancy.md) and
   [`docs/02_architecture/07-tracciamento-e-registro-immutabile.md`](../02_architecture/07-tracciamento-e-registro-immutabile.md).
4. [`docs/01_technical/06-osservabilita.md`](../01_technical/06-osservabilita.md),
   [`docs/01_technical/07-prestazioni-e-capacita.md`](../01_technical/07-prestazioni-e-capacita.md)
   and [`docs/01_technical/09-integrazione-continua-e-rilascio.md`](../01_technical/09-integrazione-continua-e-rilascio.md).
5. [`docs/06_security/08-quadro-normativo-e-misure.md`](../06_security/08-quadro-normativo-e-misure.md)
   and [`docs/06_security/10-risposta-agli-incidenti.md`](../06_security/10-risposta-agli-incidenti.md)
   - the four distinct clocks, which must not be confused.

### 3.3 Who must integrate an existing system

The entry point is [`docs/07_integration/00-indice.md`](../07_integration/00-indice.md), which
contains a decision tree for choosing the modality: the first question is **who authenticates the
person in front of the screen**, and it is not a technical question.

If you are not familiar with the domain, first read:
[`docs/10_fondamenti/02-prestazioni-di-telemedicina.md`](../10_fondamenti/02-prestazioni-di-telemedicina.md),
[`docs/10_fondamenti/04-identita-e-anagrafiche.md`](../10_fondamenti/04-identita-e-anagrafiche.md),
[`docs/10_fondamenti/06-fhir-da-zero.md`](../10_fondamenti/06-fhir-da-zero.md).

Then, in order of irreversible consequences:
[01 - The four modalities](../07_integration/01-modalita-di-integrazione.md), including the sections
«when it is the wrong choice»; [06 - Identity and delegation](../07_integration/06-identita-e-delega.md),
which is the chapter with the most irreversible consequences;
[09 - Obligations of the integrator](../07_integration/09-obblighi-di-chi-integra.md), to be read **before**
signing a contract, not after.

### 3.4 Who wants to contribute to code

The guide to fundamentals in
[`docs/10_fondamenti/`](../10_fondamenti/00-come-usare-questa-guida.md) is **a declared prerequisite**
of [`CONTRIBUTING.md`](https://github.com/fedcal/Telemedic/blob/main/CONTRIBUTING.md). Twenty-one
modules that take nothing for granted, neither from the healthcare world nor from the IT world, with
distinct reading paths by profile. **Four of the twenty-one have not yet been written** - including
the glossary and the matrix area of code → required knowledge: see
[04 - State and limits](./04-stato-e-limiti.md) §3.

After the guide: the index of the area you intend to touch, and three pages that can lead to rejection of a proposal independently of code quality -
[`docs/08_compliance/02-qualificazione-e-classificazione.md`](../08_compliance/02-qualificazione-e-classificazione.md)
§6 on requests that shift qualification,
[`docs/08_compliance/03-sistema-di-gestione-della-qualita.md`](../08_compliance/03-sistema-di-gestione-della-qualita.md)
§§7 and 9 on traceability and third-party components,
[`docs/08_compliance/01-inquadramento-normativo.md`](../08_compliance/01-inquadramento-normativo.md)
§11 on prohibited formulations.

### 3.5 Who follows the path of certification

These are two distinct subjects and the distinction must be held: **the project**, which has decided to assume in its own right the role of manufacturer for its own identified distribution (`D58`, with the legal entity still to be established); and **whoever places a derived product on the market**, who by doing so assumes the role of manufacturer for that product, independently of what is written in the licence. The two paths do not overlap and do not substitute for each other.

For both the compliance area is an **operational manual**, not an informative. The path is declared in [`docs/08_compliance/00-indice.md`](../08_compliance/00-indice.md) §3.1 and begins with qualification and classification, because reading anything else first means reading it without knowing which regime applies.

Two warnings that save months: the activities of the first thirty days are not delegable to development and cannot be recovered downstream; the intended purpose is the most costly document to get wrong, because a single formulation shifts together the risk classification and the software safety class.

The public warnings at the repository root -
[`NOT-A-MEDICAL-DEVICE.md`](https://github.com/fedcal/Telemedic/blob/main/NOT-A-MEDICAL-DEVICE.md),
[`DISTRIBUTION-POLICY.md`](https://github.com/fedcal/Telemedic/blob/main/DISTRIBUTION-POLICY.md) and
[`README.md`](https://github.com/fedcal/Telemedic/blob/main/README.md) - **have not changed in the reception of
`D63`, and not because they were forgotten**. They declare a state of fact - the product bears no
CE marking, the manufacturer entity is not constituted, no date is declared - and `D63` does not
modify that state: it changes the objective, not what is true today. A public warning rewritten
on an intention would say more than the source it summarises.

### 3.6 Who comes from clinical world

[02 - The four services](./02-le-quattro-prestazioni.md), then
[`docs/03_functional/05-gestione-degli-allarmi.md`](../03_functional/05-gestione-degli-allarmi.md)
and [`docs/03_functional/07-fuori-perimetro.md`](../03_functional/07-fuori-perimetro.md): these are the
documents that delimit what the system decides and what remains professional act. The most valuable contribution from a clinician is to report an inaccuracy in modules 02 and 03 of the guide to fundamentals: it is worth more than ten lines of code.

## 4. The map of areas

For each: what it covers, what it **does not** cover, and the typical question it resolves.

### 4.1 The seven product areas

| Area | Covers | Does not cover |
|---|---|---|
| [**01 Technical**](../01_technical/00-indice.md) | How the system is **realised**: stack and motivations, backend, persistence, frontend, media and real time, observability, performance and capacity, quality and testing, continuous integration and release | *What it does* (functional), *why boundaries are as they are* (architecture), *how to write a message to a third party* (protocols) |
| [**02 Architecture**](../02_architecture/00-indice.md) | The **internal boundaries** and the reasons that sustain them: thirteen bounded contexts, aggregates and invariants, canonical data model, multi-tenancy, events, immutable register, deployment views, deferred decisions | Requirements, protocols, threats and measures, contracts to third parties, library choices, dates |
| [**03 Functional**](../03_functional/00-indice.md) | **What the system does**, for whom, on what conditions: actors and roles, catalogue of requirements with frozen identifiers, use cases with error flows, business rules, alarms, verifiable accessibility, **out of scope** | How it is built; UI specifications; the user manual; the declaration of intended purpose, from which the area **descends** |
| [**04 Protocols**](../04_protocols/00-indice.md) | How the project **uses** each protocol: versions fixed with maturity state, profiles, FHIR, clinical documents, hospital messaging, interoperability profiles, project interface, events and webhooks, identity, real time, conformity proofs | What the protocols are - that is the guide to fundamentals; the architectural decisions, which opens as issues instead of taking them |
| [**05 Domain**](../05_domain/00-indice.md) | How the real domain **becomes model**: ubiquitous language, services as state machines, subjects and roles in time, clinical documents, parameters and observations, consent, terminologies, care pathways, domain glossary | What exists in the world - that is the guide to fundamentals; the implementation |
| [**06 Security**](../06_security/00-indice.md) | The good protected, the adversary and the **clinical consequence** of failure: threat model, identity and access, data protection, tracking, real time, application security, supply chain, regulatory framework, **division of responsibilities**, incident response | The certification path; the interface contract; the architectural choices; the planning |
| [**07 Integration**](../07_integration/00-indice.md) | How to connect Telemedic to an existing system: four modalities with decision tree, first setup, application interfaces, events, embeddable component, identity and delegation, data and synchronisation, replaceable modules, **integrator obligations**, antipatterns | The fundamentals; the internal implementation |

### 4.2 The three cross-cutting areas

| Area | Covers | Does not cover |
|---|---|---|
| [**08 Compliance**](../08_compliance/00-indice.md) | *Which source, on whom it weighs, from when*: regulatory framework, qualification and classification, quality management system, technical file, risk management, usability and accessibility as obligations, clinical evaluation, post-market surveillance, path and calendar | **Does not declare that the project is conformant to anything.** Not legal advice, does not contain the technical file nor the quality procedures, does not estimate fees, does not set the date of marking |
| [**09 Roadmap**](../09_roadmap/00-indice.md) | **When what happens**: decision method, milestones with binary completion criteria, scope of the first release, subsequent queue, register of programme risks. It is **internal project planning** (`D57`) | Requirements, architecture, regulatory analysis. And **no date for a regulatory outcome**: neither for milestones that are not the project's, nor - though it is our planning - for marking |
| [**10 Fundamentals**](../10_fondamenti/00-come-usare-questa-guida.md) | The **theory**, from scratch, for anyone: Italian healthcare system, services, clinical data, identity, standards, FHIR, electronic health record, WebRTC, clinical fundamentals, care pathways, IT fundamentals, cryptography, protocols, flows, regulatory framework, development environment | Telemedic's choices. If a module begins to decide instead of explain, it is invading an area |

### 4.3 The register of architectural decisions

[`docs/adr/`](../adr/README.md) contains, for each structural choice, the motivation, the discarded alternatives and the consequences. **An architectural statement without a decision record
is a documentation defect**, not an allowed shortcut.

### 4.4 The documents at the repository root

They do not stand in `docs/` and must not be duplicated there: two copies of a document declaring intended purpose and limits of use are two documents that will diverge, and in regulatory matters a documentary divergence is a defect, not a maintenance lapse.

| Document | What it establishes |
|---|---|
| [`NOT-A-MEDICAL-DEVICE.md`](https://github.com/fedcal/Telemedic/blob/main/NOT-A-MEDICAL-DEVICE.md) | Declared intended purpose and limits of use; what whoever puts into operation must do; why the licence exclusion of liability does not extend to the injured party |
| [`DISTRIBUTION-POLICY.md`](https://github.com/fedcal/Telemedic/blob/main/DISTRIBUTION-POLICY.md) | What the project publishes and what it **is not**; identification of versions; what the project asks of whoever redistributes |
| [`THIRD-PARTY-TERMINOLOGY.md`](https://github.com/fedcal/Telemedic/blob/main/THIRD-PARTY-TERMINOLOGY.md) | Which terminologies the project does not distribute, how it refers to them, and what obligations remain on whoever installs |
| [`CONTRIBUTING.md`](https://github.com/fedcal/Telemedic/blob/main/CONTRIBUTING.md) | The rules of contribution, with the guide to fundamentals as a declared prerequisite |
| [`SECURITY.md`](https://github.com/fedcal/Telemedic/blob/main/SECURITY.md) | The policy for coordinated disclosure of vulnerabilities |
| [`GOVERNANCE.md`](https://github.com/fedcal/Telemedic/blob/main/GOVERNANCE.md) · [`CODE_OF_CONDUCT.md`](https://github.com/fedcal/Telemedic/blob/main/CODE_OF_CONDUCT.md) · [`LICENSE`](https://github.com/fedcal/Telemedic/blob/main/LICENSE) · [`NOTICE`](https://github.com/fedcal/Telemedic/blob/main/NOTICE) | Project governance, code of conduct, Apache-2.0 licence and attributions |

## 5. Where each thing stands: quick routing table

| Question | Competent area |
|---|---|
| What distinguishes a televisita from a teleconsulto | [10 Fundamentals §02](../10_fondamenti/02-prestazioni-di-telemedicina.md), then [05 Domain §02](../05_domain/02-le-prestazioni-modellate.md) |
| What are the requirements and how are they verified | [03 Functional §02](../03_functional/02-catalogo-dei-requisiti.md) |
| Why are the internal contexts as they are and not otherwise | [02 Architecture §02](../02_architecture/02-contesti-delimitati.md) |
| Which version of which specification is adopted | [04 Protocols §01](../04_protocols/01-principi-di-interoperabilita.md) |
| How is a notification received and how is the signature verified | [07 Integration §04](../07_integration/04-integrazione-per-eventi.md) |
| What a datum means clinically and how it is modelled | [05 Domain](../05_domain/00-indice.md) |
| Who we defend against and with what clinical consequence | [06 Security §01](../06_security/01-modello-di-minaccia.md) |
| Who responds, to whom, on what source | [08 Compliance §01](../08_compliance/01-inquadramento-normativo.md) |
| How a thing is protected | [06 Security](../06_security/00-indice.md) |
| When what happens | [09 Roadmap §02](../09_roadmap/02-traguardi.md) |
| What the system **does not** do and why | [03 Functional §07](../03_functional/07-fuori-perimetro.md) |
| What is **not** yet decided | [02 Architecture §09](../02_architecture/09-decisioni-rinviate.md) |
| What an aggregate, an outbox, a percentile, a notified body is | [10 Fundamentals](../10_fondamenti/00-come-usare-questa-guida.md) |

**The rule that disambiguates doubtful cases between security and compliance**: if the question is "how is it protected", it is security; if it is "who responds, to whom, on what source", it is compliance.

## 6. The precedence rules

They serve only one case, but it is a case that occurs: two documents saying different things.

1. On an **architectural fact**, [`docs/02_architecture/`](../02_architecture/00-indice.md) prevails. Whoever notices the divergence does not resolve it unilaterally.
2. The **dates of the regulatory path** stand only in [`docs/08_compliance/09-percorso-e-calendario.md`](../08_compliance/09-percorso-e-calendario.md);
   the **project dates** only in [`docs/09_roadmap/`](../09_roadmap/00-indice.md). Two calendars in two places diverge on the first update.
3. The **scope exclusions** live only in [`docs/03_functional/07-fuori-perimetro.md`](../03_functional/07-fuori-perimetro.md), with
   identifier `OUT-nn`. An exclusion written in two places diverges in two places.
4. The **division of responsibilities** operative stands in [`docs/06_security/09-ripartizione-delle-responsabilita.md`](../06_security/09-ripartizione-delle-responsabilita.md);
   the attribution of the obligated subject stands in [`docs/08_compliance/01-inquadramento-normativo.md`](../08_compliance/01-inquadramento-normativo.md).
5. The **guide to fundamentals explains**, the **areas apply**. If an area begins to explain theory it is duplicating the guide; if a module of the guide begins to decide, it is invading an area.
6. Above all stands the binding architectural basis and the decisions approved by the sponsor,
   in `.telemedic/context/`. A deviation from the basis is always declared and motivated by a decision record: **no silent deviations exist**.

## 7. Conventions common to all documentation

**Reliability markers.** `[NV]` signals a statement **not verified on primary source**,
with the indication of who must close it. **Nothing is invented**: no RFC numbers, articles, dates, transaction identifiers or code values invented to complete a table exist. Where the datum is missing, there is the marker.

**Three distinct states, never confused.** «The regulation establishes» introduces an obligation with cited source; «it is practice» a widespread use with no obligation; «it is a project choice» a decision which as such has a decision record and can be changed. The domain area uses the explicit form `[NORM]`, `[BASE]`, `[MOD]`, `[NV]`.

**Frozen identifiers.** `RF-*` functional requirements, `RNF-*` non-functional, `BR-*` business rules, `ATT-*` actors, `UC-*` use cases, `OUT-*` exclusions, `EX-*` typed outcomes, `DM-*` domain modelling decisions. **They are not renumbered, reassigned or changed in meaning**: the traceability required by IEC 62304 cannot be reconstructed afterwards, and an identifier reused for a different requirement renders the entire matrix unusable (`D45`).

**Synthetic data only.** No example contains data referring to real people, no plausible tax code, no name of an existing facility, no secret in clear. The domains in examples are placeholders reserved for documentary purposes.

**Confidentiality.** No document names companies, brands, commercial products or domains of potential partners. Generic formulas are used: «a cloud healthcare management system», «a third-party EHR system», «the integrator», «the vendor partner». The project is designed for a multiplicity of integrators, not for one only.

**Form.** Diagrams in Mermaid; code blocks with declared language; cross-references with relative links. A diagram does not substitute the text: **if a constraint exists only in the diagram, it does not exist**.

**Language.** Italian primary language, English full translation and not summary (`D50`). Italian regulatory references remain cited in their original form, with explanation in language.
At the time this area was written the English version of the content **does not yet exist**:
see [04 - State and limits](./04-stato-e-limiti.md) §3.

## 8. Permanent warnings

They hold on every page of this documentation and are not formulas of style.

- **The repository is source code, not a medical device**, and declares itself as such. The distribution is
  a distinct artefact, with its own name, version and lifecycle.
- **Today the product bears no CE marking.** As long as a marking does not exist, no distributed artefact
  is usable for the delivery of healthcare services on real patients. The project intends to assume the role of manufacturer (`D58`); the intention does not change the state of fact, and **in no place is it written that the product will be marked by a date**.
- **The project is conformant and verifiable on national digital identity, not accredited**: the
  service provider to the federation is whoever installs it.
- **No technical threshold of this documentation is conformity.** They are product specifications and
  declared limits: no Italian source imposes technical thresholds.
- **This documentation is not controlled documentation.** No chapter is a procedure of a
  quality management system or a document of a technical file: chapters are
  **inputs**, they contain the analysis from which a controlled document is written.
- **It is not legal or regulatory advice.** The legal qualification of a subject and a
  product depends on factual elements that must be ascertained case by case by an authorised professional.

## 9. How to report a defect in this documentation

If a page has made you waste time, it is a defect of the page, not yours. The three most useful things
to report, in order:

1. **The example that does not work.** An example that does not run is worse than no example.
2. **The point where you got stuck and for how long.**
3. **The thing you assumed and that turned out to be false.** It is the most valuable information, because
   it indicates where the documentation says something **ambiguous** instead of saying something **wrong**
   - which is much harder to find.

One case has its own channel and must not be opened as a public report: a **security
vulnerability** is communicated according to
[`SECURITY.md`](https://github.com/fedcal/Telemedic/blob/main/SECURITY.md).

## Where to continue

If you have reached here and still do not know where to go, the default path is:
[01 - Vision and objectives](./01-visione-e-obiettivi.md) →
[02 - The four services](./02-le-quattro-prestazioni.md) →
[03 - Who it addresses](./03-a-chi-si-rivolge.md) →
[04 - State and limits](./04-stato-e-limiti.md), then the index of the area that concerns you.
