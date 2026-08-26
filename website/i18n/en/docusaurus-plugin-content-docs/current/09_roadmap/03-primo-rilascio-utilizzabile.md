---
title: Usable first release
sidebar_position: 4
description: "The scope of the first installable release of 30 November 2026 under the capacity declared by D54 - what it contains, what has been cut to respect the date with an indication of which cuts are irreversible, the order in which it would be cut further, the assumptions for installation, the declared limits and the blocking criteria for release."
---

# Usable first release

Throughout the rest of the roadmap this release is the milestone `T-10`, dated **30 November 2026** from `D53`. In this chapter it is designated **`RU-1`**.

> **`[NV]` - the name of the distribution is not decided.** `D17` requires that the repository and the distribution have **distinct names, version numbers and lifecycles**. The designation `RU-1` is a planning designation, not the name of the artefact: the distribution name must be decided before the first publication. Until then, no project document should use `RU-1` as if it were a product name.

> **How this chapter has changed, and why.** `D53` confirms 30 November 2026 as the first installable release; `D54` declares the capacity: **a single contributor on a part-time basis**. With date and capacity fixed, **the only variable left is the scope** ([01 §1](./01-principi-e-metodo.md)). The perimeter of §§3 and 4 is therefore **reduced**, and §5 - *what has been cut to respect the date* - is the most important section of the document for anyone who must decide whether to adopt the product. It contains, for each item removed, **whether the cut is recoverable or not**. The non-recoverable cuts are four, they are marked as such, and they are the information this chapter exists to give.

---

## 1. What "usable" means, and the limit that no configuration removes

### 1.1 The limit

**`RU-1` is not usable for the delivery of healthcare services to actual patients.** This is not a precautionary statement: it is the condition declared by `D16`, and remains true for every artefact distributed until a marking is appended at the end of a completed conformity assessment procedure. **Today the product bears no CE marking and is covered by no conformity declaration.**

`D58` establishes that the role of manufacturer **will be assumed by the project** and that the legal entity **is yet to be established**: this is internal planning, has its own calendar in [02 §5](./02-traguardi.md), and **changes nothing of what precedes**. The two statements coexist and must be read together:

| What is true today | What `D58` adds |
|---|---|
| The product **bears no CE marking**, is covered by no conformity declaration, is not usable on actual patients | The project **intends** to assume the role of manufacturer, and the entity is **still to be established** |
| Whoever installs, integrates or places into service **assumes the obligations that follow** | **Nothing.** The intention to certify in future transfers no obligation and covers no current installation |

> **In no place in this document, and in no project material, is it written that the product will be marked by a date** (`V-171`, `V-280`). The intention to certify and the promise of a dated outcome are different things, and the latter produces a regulatory effect that the former does not. Suggesting otherwise would be **more damaging than silence**.

The limit has three properties that those evaluating the product tend to undervalue:

1. **It is not removable by configuration.** No parameter, no profile, no licence, no contractual agreement with the project modifies it.
2. **It is verifiable.** Each artefact carries the declaration of non-marking, and its absence prevents publication (criterion 7 of milestone `T-01`).
3. **It does not transfer with the licence.** Whoever integrates the software into a product and places it on the market **is a manufacturer by law**, regardless of what is written in the licence and regardless of the project's intentions. This must be stated here because it is the question every integrator asks, and because `D58` renders it **more** insidious: knowing that the project intends to certify leads one to believe oneself covered, and one is not.

A fourth property must be added, arising from the liability for defective products: **liability towards the injured party is not excludable by contract**. The exclusion clauses in the licence apply between the parties, not towards the care recipient, and this applies with greater force since the project's intention to certify exists.

### 1.2 What then can be done with `RU-1`

Four uses, all legitimate and all real.

| Use | Why it has value |
|---|---|
| **Integration and development at an integrator's site** | It is the use for which the product is designed: it enables the integration to be built and tested while the regulatory pathway proceeds in parallel, rather than afterwards |
| **Personnel training and instruction** | With synthetic data, on realistic pathways. This is time that cannot be recovered if started afterwards |
| **Technical and conformity evaluation** | It is the artefact on which a security officer, a data protection officer or a procurement committee verifies the statements rather than believing them. **§5 is part of what must be evaluated**, not an appendix |
| **Foundation of the technical dossier** | It is the distribution from which the dossier is built (`D58`), produced by build verification against the published source |

**What it is not**: a commercial product, a demonstration, or a prototype. It has an installation manual, signed artefacts, a bill of materials, a recovery procedure and blocking release criteria. The difference between a prototype and `RU-1` is that the first is shown and the second is installed.

---

## 2. The composition criterion: a vertical path, not a set of functions

The criterion is stated in [01 §4.2](./01-principi-e-metodo.md) and is applied here:

> The **most complete and narrowest possible vertical path** is delivered, not the broadest possible set of functions.

Under `D53` and `D54` the criterion does not change: **what changes is how narrow "narrowest possible" is**, and §5 declares by how much.

### 2.1 Which path, and why that one

The path in `RU-1` is the **remote consultation (televisita) with two participants, from appointment received by reference through to closure with a typed outcome and return of the outcome to the system of origin.**

Compared to the earlier formulation - which reached the **validated clinical document and returned** - the path stops **before documentation**. It is the cut `TG-01` of §5, it is reversible, and its consequence is declared there.

The choice of path is not one of convenience. It is the one that, amongst all those catalogued, **crosses the greatest number of cross-cutting constraints with the smallest number of dependencies on third parties**:

| Cross-cutting constraint | Does the path cross it? | Where |
|---|---|---|
| Separation between service and media session (`V-01`) | **Yes**, and it is the path that renders it visible: a network failure does not close the clinical act | Media session distinct from the service |
| Tenant resolved and applied by the engine (`V-04`, `V-112`) | **Yes**, in every query | All contexts involved |
| Immutable register with hash chain (`V-04`, `V-150`) | **Yes**: every access to health data in the path is logged. **Without periodic signed anchoring**: cut `TG-23`, irreversible for the period | Tracing context |
| Consent as an act with temporal validity (`V-146`) | **Yes**, with three distinct consent objects on five in the model: the other two concern functions not present | Consent context |
| Mandatory key verification by default (`D22`) | **Yes**, and it is a blocking state of the media session state machine. **Not cuttable** (§5.4) | Interface and media session |
| Accessibility and *mobile first* as acceptance criteria (`D25`) | **Yes**, on both sides: care recipient on smartphone on mobile network, professional with keyboard only and screen reader | Interface |
| No functionality reachable only from the interface (`V3`, `V-164`) | **Yes**: the interface consumes the same application interfaces offered to integrators | Exposure planes |
| Events with references only, never clinical content (`V-135`, `V-161`) | **Yes**, on the event concluding the service. **Not cuttable** (§5.4) | Outbox and events |
| Outcome distinct from state, with opposite administrative effects (`V-141`) | **Yes**: non-attendance and technically attributable failure share the terminal state and have opposite effects | Clinical service |
| Immutable document with rectification chain | **No**: exits with `TG-01` | - |
| System fully functional without the terminologies with constrained licences (`V-03`) | **Yes**, but **in degenerate form**: in the reduced perimeter there is no encoded content to resolve. The verification must be redone when there is content (`TG-05`) | Terminology gateway disabled |

A path that crosses these constraints **proves them**. A broad set of incomplete functions proves none of them, and moreover it does not permit one to say what is done.

### 2.2 The second reason, which is conformity

A complete vertical path is **traceable in its entirety**: from requirement to design, to code, to test, to risk control. A set of partial functions produces a traceability matrix with many rows and many gaps, which is the form that verification considers worst of all. **Under `D54` the property is worth double**: a matrix with few rows all covered is the only way a single contributor can deliver something demonstrable.

---

## 3. What `RU-1` contains

The list is by bounded context, because that is the structure by which the system is built and by which it must be verified. The complete catalogue of requirements is in [`docs/03_functional/02-catalogo-dei-requisiti.md`](../03_functional/02-catalogo-dei-requisiti.md).

### 3.1 Platform and cross-cutting properties

| Capability | Content |
|---|---|
| **Active multi-tenancy** | Isolation applied by the engine with default denial in the absence of context. Single-tenant installation is the **degenerate case of the same code**, not a variant |
| **Single authorisation boundary** | Complete token validation on ingress, internal token emission, **delegation always represented with the claim of the actor, never impersonation** (`V-132`) |
| **Qualified assurance level** | Distinction between authentication **performed** and **asserted** by an integrator, propagated to the point of decision (`V-154`, `V-165`). Remains in scope even though national federation is not: it is the marker that prevents confusing the two when it arrives |
| **Immutable register** | Append-only structure with hash chain and archiving with separated privileges, integrity verification on demand and scheduled, export in open format with digest. **Complete coverage of all access**; **without periodic signed anchoring** (`TG-23`) |
| **Transactional outbox** | Single source of outgoing events; envelopes with **references only**; delivery at least once per **authenticated call** to the system of origin; consumers idempotent by construction. **Without broker** (`TG-04`) |
| **Two alone representations of error** | Problem representation on the application plane, operation outcome on the interoperability plane, with catalogue **generated** and prohibition of emitting an error not catalogued (`V-110`, `V-130`) |
| **Single outbound mediator** | No application component opens connections to destinations derived from incoming data; outbound access is denied at network level to all except the mediator (`V-157`) |
| **Availability measurement by tenant and by service** | Historicised with granularity sufficient to recognise the breach of a threshold on the order of one percentage point on a daily basis. **Whoever installs chooses the threshold; the product provides the measurement** (`Q-184`) |

### 3.2 Identity and access

- Federation with distinct realms for the clinical context and the care recipient context.
- Acceptance of an identity already authenticated by the integrator's system, **without second access**, with explicit delegation, and **session start with single-use input token issued over a back channel** - in the reduced perimeter this is not a fallback but the primary mode, because the embeddable component is cut (`TG-03`).
- Authorisation founded on the **relationship of care**, not on role alone; role as a relationship between person and organisation with temporal validity, not as an attribute of the person.
- **Separation between technical role and clinical role** applied by the authorisation engine: composition of a role that violates it is rejected with a validation error (`V-125`).

### 3.3 Demographics by reference

- Care recipients, professionals, organisations and sites treated **by reference** on the identifiers of the system of origin. The product **is not** the reference data and does not perform identity reconciliation (`OUT-15`).
- Normalisation of identifiers **at the boundary, never in the domain** (`V-142`); registry of system identifiers versioned as a **configuration file**, with no administration interface (`TG-10`).
- **No external identifier is a primary key.**

### 3.4 Clinical service and media session

- **remote consultation** as the sole service type, with its selected state machine from the catalogue (`V-140`).
- Invitation delivered through the inviter's channels; **technical verification beforehand** before the session; waiting room; admission; abandonment.
- Point-to-point media session **encrypted to the endpoints as the default mode**, with direct routing where the network permits and relay where it does not.
- **Mandatory key verification by default** (`D22`), as a **blocking state** of the state machine, with the accessibility requirements that render it usable by an elderly care recipient: legible character by character to a screen reader, never conveyed by colour alone, alphabet free of ambiguous characters, **procedure defined in case of mismatch** with the same prominence as the positive case.
- **Declared degradation**: reduction in resolution, then fluidity according to the set preference, then video suspension with **audio maintained**, then unsuitability notice with proposal of deferral or alternative channel. Each transition is announced in a way perceptible even without sight and without hearing.
- **Quality measurement per session**, with proprietary index declared as such, built on the **minimum** across dimensions and not on the mean, and with cumulative counters **differentiated between consecutive samples** (`V-113`, `V-114`).
- **Notice of inadequate quality to the professional** as a logged risk control, with the outcome of the professional's decision preserved. **Not cuttable** (§5.4).
- **Closure with typed outcome**, with state distinct from outcome and opposite administrative effects kept separate (`V-141`).
- **Telephone fallback** as a typed outcome: the channel change is logged and reported in the returned outcome.

### 3.5 Consent

- **Three distinct consent objects** with independent lifecycles - healthcare act, data processing where applicable, transmission of outcome to the external system - and no "consent to the platform" (`V-146`). The other two objects in the model, recording and presence of third parties, concern functions not present in `RU-1`: **the model provides for them, the release does not exercise them**, and the difference is declared.
- Consent referring to the **version of the text** of the informative material; withdrawal with effect; no boolean consent.

### 3.6 Return of outcome to the system of origin

Replaces the section on clinical documentation, which exits with `TG-01`.

- At the end of the service the system returns to the system of origin a **structured outcome** in canonical form, via an authenticated call: service identifier, state, typed outcome, instants, participants by reference, channel actually used.
- The outcome includes the **attestation of connection quality and confirmation of suitability**, **measured by the system and confirmed by the professional**, never generated autonomously.
- **No clinical interpretive content is produced, pre-filled or transmitted** (`OUT-07`).
- The notification says that something happened and where to find it; the content is re-read with an authenticated call.

### 3.7 Interfaces towards third parties

- **Project application interface** described and versioned, with contract tests in both directions. It is the **sole** integration surface of `RU-1`.
- **Outgoing events signed with asymmetric signature** and key identifier resolvable by project public material; shared secret **is not offered as the default mode** (`V-162`).
- **No path, direct or mediated, towards clinical content** for the profile of the administrative payer (`V-166`, `OUT-18`). In the reduced perimeter the prohibition is **a convention verified by test and not a structural boundary**, because the autonomous context of invoicing is a deferred decision (`C-1`): the difference is declared and not softened.

### 3.8 User interface

- Care recipient pathway and professional pathway, both conforming to *mobile first* and accessibility as **acceptance criteria**, not as refinement.
- **Persistent and non-hideable recording indicator** when recording is active - although the mode with recording **is not in `RU-1`**. **It has been deliberately excluded from the cuts**, and the reason must be stated because it shows how the cuts have been chosen: a safeguard that arrives together with the function it must safeguard is never put to the test. It costs one interface element and one negative test; its deferral would cost the first real verification of the safeguard in the same release in which the risk arrives.
- **No clinical content in persistent storage of the browser**, no token in persistent storage, explicit cleanup on session closure.
- **No clinical decision in the client**: no evaluation occurs in the interface.

### 3.9 Operations

- Configuration checks **blocking on startup**: tenant isolation active and not bypassable by application role, register archive not reachable with application credentials, relay not reachable from internal networks, relay minimum version, no secret at default values, retention policy present for each category, migrations applied.
- **Metrics export** in open format, with series names documented. Versioned dashboards exit with `TG-09`.
- **A single deployment profile**, single-tenant, with reproducible definitions. The profile on orchestrator exits with `TG-08`.

---

## 4. What `RU-1` **does not** contain for reasons independent of the date

This section lists what was **already out** of scope before `D53`. What has exited **as a result** of `D53` is in §5, and the distinction is the reason the two sections are separate: **confusing them would make haste appear as the consequence of what is a product choice, and vice versa.**

### 4.1 Category I - Excluded definitively from the product

These are not release exclusions: they are product exclusions, listed with identifier and reopenability category in [`docs/03_functional/07-fuori-perimetro.md`](../03_functional/07-fuori-perimetro.md). They include clinical interpretation in every form, threshold inference, calculated triage, verification of drug interactions, direct dialogue with home medical devices, emergency channel, biometric recognition, identity reconciliation index, mediation of payer access to the dossier, and retention in accordance with regulation.

**They will not return in a subsequent release.** Some are reopenable only with a documented regulatory impact assessment; one - payer access mediation - is not reopenable while the source is in force.

`D55` adds to this list a **permanent prohibition**: no function may be added if it shifts the system towards **clinical real-time**, and the assessment must be made before the function is written, not after.

### 4.2 Category II - Deferred for sequence

They are within the product scope, they are planned, and they were not in `RU-1` already before `D53` because the composition criterion requires a narrow vertical path.

| Excluded from `RU-1` | Why not now | Where it returns |
|---|---|---|
| **telemonitoraggio (telemonitoring)** in all its components | It is the broadest context in the catalogue. `D55` has frozen its intended use, so the work is no longer at risk of rewrite: the reason of breadth remains, and under `D54` it is deciding | [04 §3](./04-oltre-il-primo-rilascio.md), first position |
| **teleconsulto (teleconsultation), teleconsulenza (teleconsultancy), teleassistenza (teleassistance)** | Each is its own state machine with different permitted actors; the professional constraint applies to the **activity**, not to the minimum service (`V-147`) | [04 §3](./04-oltre-il-primo-rilascio.md) |
| **Server-side session recording** | It is a **second security mode**, not an optional function: it involves termination of encryption on the server, a distinct component with its own scope, a dedicated consent flow and encryption at rest with per-tenant keys | [04 §3](./04-oltre-il-primo-rilascio.md) |
| **Third participant** to the session | The decision on topology beyond two participants is declared deferred (`C-2`), and it is not marginal: the interpreter is the declared alternative measure for the known accessibility non-conformity | After closure of `C-2` |
| **Own agenda and invoicing modules** | The `RU-1` path receives the appointment **by reference** from the system of origin, which is the reference use case | [04 §3](./04-oltre-il-primo-rilascio.md) |
| **Development kit** in programming language | The versioned application interface is sufficient for the first integration; the kit is convenience, not capability | [04 §3](./04-oltre-il-primo-rilascio.md) |
| **Hospital messaging and documentary interoperability profiles** | They require a counterparty with a test environment | [04 §3](./04-oltre-il-primo-rilascio.md) |

### 4.3 Category III - Deferred for unavailable external dependency

They are within scope, they are planned, and **their date does not depend on project work**.

| Excluded from `RU-1` | Depends on |
|---|---|
| **Submission of documents to national and regional documentary infrastructures** | The documentary models, typology codes and indexing metadata for telemedicine typologies **are not publicly available** (`Q-07`). The project already has the structural response - canonical dataset and substitutable serialisation: **the content is missing, not the project** |
| **Conformity verified on national digital identity** on all three channels | Requires pre-production environments, test credentials and, for one channel, **two provider instances for each provider** (`D38`): this is the systematically underestimated workstream |
| **Interface performance thresholds declared** | The **reference device is not declared** (`Q-115`, `Q-175`), and without a device the corresponding requirement is not verifiable. `RU-1` measures and publishes the conditions; does not declare an unmeasured threshold |
| **Reference values of expected service levels** | The customer chooses the threshold (`Q-152`, `Q-184`). `RU-1` provides the **measurement capability**, which is the requirement |

### 4.4 Category IV - Deferred for a decision not taken

They are not excluded by choice: they are excluded because **a declared deferred decision is not taken in a change proposal**.

| Item | Pending decision |
|---|---|
| Scoring of validated scales and questionnaires | `B-3` - licensing regime of the tools. The consequence already adopted cautiously is that the domain **does not represent scores** |
| Autonomous invoicing context | `C-1` - with the caveat declared in §3.7 |
| Version dismissal plan published | `C-4`, `Q-186` - it is a **prerequisite of `T-10`** and not a backlog item: without the support period the number of major versions to maintain is not determinable |
| Selective concealment of audio-video content for the purpose of the right of access | Remains for `COMP` to establish whether partial release satisfies the person's instance (`Q-157`) |

---

## 5. What has been cut to respect the date

**This is the central section of the chapter.** It lists what has exited the scope **as a result of `D53` and `D54`**, and not as a product choice: items that this same roadmap declared included in `RU-1` before the third round of decisions.

### 5.1 How to read it

`D53` confirms the date. `D54` declares the capacity. With both fixed, **scope is the only variable left** and the reduction is not an option: it is arithmetic. What makes it acceptable is not its extent, it is its **legibility**.

Each item carries four pieces of information, and the third is the one that counts:

| Field | What it answers |
|---|---|
| **What was it** | What `RU-1` would have contained |
| **Why did it leave** | The reason, which is never "there was no time" in the abstract but always a property: breadth, dependency on a second party, or contractual surface |
| **Reversible?** | Whether the cut is recovered in a subsequent release **at the same cost**, or whether something is lost forever |
| **What it means for whoever installs** | The operational consequence, not its technical description |

The designations `TG-nn` are **planning designations**, like `RU-1`, `OL-nn` and `DS-nn`: they are not requirement identifiers, they do not enter the traceability matrix and cannot appear in a test.

> **The rule that separates the two categories.** A cut is **reversible** if adding it later costs the same as it would have cost now, and produces no loss in the meantime. It is **irreversible** if something that would have existed **will never exist**: typically a **recording dated to a period**, which after that period is not produced again. The distinction is not one of severity: it is one of nature. A reversible cut is a sequencing decision; an irreversible cut is **a property that the release will never have**.

### 5.2 The reversible cuts

| # | What was it | Why did it leave | What it means for whoever installs |
|---|---|---|---|
| `TG-01` | **Clinical documentation and reporting**: draft, validation, signature, immutability of the signed document, rectification as a new version, delivery of the document to the system of origin | It is the second-broadest context of the path, and brings with it electronic signature, timestamp, rectification chain and modelling of the information set of the typology | **It is the most visible cut.** `RU-1` **does not produce a report**: it returns a **structured outcome** (§3.6). Whoever installs cannot test the documentary path, signature, rectification or return of clinical content. Whoever evaluates the product for reporting **should not install `RU-1`**: they would find no trace of it |
| `TG-02` | **Interoperability facade** with capacity document and profiles fixed for version | It is a **second public contractual surface** to maintain for the entire support period, above an interface no integrator has yet exercised | Integration happens with the **project's own application interface**, versioned. Whoever awaits standardised resources must map, and **the mapping done now will need to be redone** when the facade exists: it is a cost to the integrator, and is declared beforehand not afterwards |
| `TG-03` | **Embeddable white-label component** as a customisable element, with theme properties validated server-side | It brings with it the server-side contrast validation, the closed set of properties, the non-themeable elements and the corresponding negative tests | The integrator initiates the session **by referral, with single-use input token** (§3.2), not by embedding the interface. **The personalised theme is not available**, and the user sees the product's interface: whoever has visual identity requirements must know this beforehand |
| `TG-04` | **Event broker** and its single-node configuration | One more component to install, configure, update and monitor, for a capability that with a single consumer is not yet necessary | **One component fewer to install**: it is the only cut that eases whoever installs. The outbox remains the source of truth and delivers per **authenticated call**. Consequence: **a single consumer configured per tenant**, no multiple subscriptions, no replay of event history |
| `TG-05` | **Active terminology gateway** with allow list and exercised fallback mode | In the reduced perimeter **no encoded content exists** to resolve: the extension point exists, disabled by default | The release criterion for functioning without terminology with constrained licences is **satisfied in degenerate form**, and this document declares it rather than counting it as verification. **It must be redone when encoded content enters**, and is annotated as such |
| `TG-06` | **Emergency access** with mandatory reason, limited window, notification and review (`V-153`) | It is a deviation path with its own review cycle, and without persistent clinical content it has little to deviate | **No deviation access path exists.** Whoever installs cannot test it, and no organisational procedure can rely on it. The absence is **safer**, not less so: what is missing is the function, not a control |
| `TG-07` | **Concealment applied by the authorisation engine**, with the six inference channels closed | It applies to persistent clinical content, which with `TG-01` does not exist | No operational consequence in `RU-1`. A verification consequence yes, and must be stated: **the six inference channels have not been exercised**, and their closure remains a design property not yet proven |
| `TG-08` | **Deployment profile on orchestrator** | A second profile is a second test matrix and a second support surface | `RU-1` installs **only** in the single-tenant profile with container definitions. Whoever wants the orchestrator builds their own manifests, **and the project does not support them**: it is a declaration, not a courtesy |
| `TG-09` | **Three versioned dashboards** in the repository: service health, media quality, integrity and security | They are presentation of data the product already exposes | Whoever installs **builds their own dashboards** on the metrics export, of which the project documents the series names. The time to activate monitoring transfers to the customer |
| `TG-10` | **Administration interface** for tenant, identifier register, trust register | It is a third interface path, with its own accessibility obligations as an acceptance criterion | Every administrative operation happens per **declared configuration** and command line, so **requires access to the installation** and cannot be delegated to a non-technical administrator. It is the cut that weighs most on daily operations |
| `TG-11` | **Non-blocking migrations per tenant**, with observable progress and isolated failure per tenant | The property of not blocking is an execution mode to design and test | The update requires a **declared maintenance window**. There remains the non-cuttable property that two consecutive versions coexist on the same database (§5.4) |
| `TG-12` | **Media test suite at full scale of network profiles** | Each profile is a scenario to build and maintain | Degradation declared is **tested at the extremes - nominal and worst-case degraded - and not along the scale**. Intermediate network conditions are not covered by test, and it is a declared limit (§9) |
| `TG-13` | **Automatic latency measurement from objective to screen** in continuous integration | It is a measurement bench, not a function | Latency is **measured in session and logged**, but **no automatic regression test exists**: a deterioration between two versions is not intercepted by the pipeline |
| `TG-14` | **Reproducibility verification on all artefacts**, on independent executors | Checking every source of non-determinism on every artefact is effort proportional to the number of artefacts | Reproducibility verification is performed **on the main service artefact**, with outcome conserved, and **not on other artefacts**. Whoever wants to verify correspondence between distribution and source can do so for that artefact and not for the others: it is declared in the release dossier |
| `TG-15` | **All mandatory pipeline controls blocking from day one** | Each control must be tested with a deliberately non-conforming case before it can block | It blocks from the start every control that safeguards an **irretrievable property or a public prohibition** ([02, `T-03`](./02-traguardi.md)); the others exist **in reporting only, each with the date declared on which it becomes blocking**. A control in reporting without that date is not admitted |
| `TG-16` | **Primary sources module** of the foundations guide | It is a reasoned bibliography, and the glossary has priority because it holds the translation terminology fixed | Every normative reference remains **cited in full in the text in which it appears**, and there is no single index from which to start |
| `TG-17` | **Complete translation of the corpus** before code | `D56` amends `D52`: translation proceeds **in parallel** and is no longer a prerequisite to every line of code | There exist in English **the public notices, the foundations guide, the conformity area and the security area**, where the divergence control **blocks**. On the rest of the corpus the control **reports**, and the report is published: the untranslated part is **visible and measured** |
| `TG-18` | **Reissue under control of documents produced before `T-01`** | The volume of the corpus makes reissue a task of the order of its production | It is declared a **gap** in the release dossier, with the date it was born. **It is the only reversible cut whose cost grows each day**, and is the reason why `T-01` is the first milestone |
| `TG-19` | **Installation and operations manual in English** | It is the longest document in the release and the least risky to have in one language only | The manual is **in Italian**. **The notices and limits of use are in both languages** and are not cuttable: it is the part whose misunderstanding produces harm |

### 5.3 The irreversible cuts

> **This is the most important information in the entire document.**
> The four items that follow **are not recovered in a subsequent release**. What is missing is not a function to add: it is a **recording dated to the period of `RU-1`**, and a period that has passed is not recorded afterwards. Three of them follow directly from `D54`, and none depends on the number of hours available.

#### `TG-20` - Recordings requiring two distinct subjects · **IRREVERSIBLE**

**What they were.** Three recordings provided for by the quality management system:

- the **documentary review of the release** - criterion 18 of the blocking criteria in the earlier version of this chapter;
- the **internal audit** of the quality management system on the period;
- the **configuration verification performed by someone who did not write the code**, including execution of the verification procedure by whoever installs by a second subject.

**Why they have left.** Because `D54` declares **a single contributor**, and each of them **by definition presupposes distinct subjects**: an auditor does not audit their own activity, a review does not verify who conducts it, an independent verification is not independent if the author performs it. **It is not a matter of available hours**, and no amount of individual work resolves it ([01 §9-bis](./01-principi-e-metodo.md), constraint `V-281`).

**Why the cut is irreversible.** Because a review recording **of an already-occurred release** is not a review: it is a post-hoc reconstruction, and verification recognises it as such. The same holds for an audit referring to a concluded period. What can be done afterwards is to review **the subsequent release**, not that one. **The gap remains dated to `RU-1` forever.**

**What it means for whoever installs.** The dossier accompanying `RU-1` **explicitly states, in both languages, that no verification has been performed by a second subject** (criterion 3 of `T-10`). Whoever intends to build a conformity path on `RU-1` must know that period has a declared gap, **before installing and not after**. Whoever evaluates the product in a technical commission finds the declaration in the dossier and does not have to infer it.

**What the project does anyway.** All criteria of `RU-1` remain **verifiable by anyone**, with the procedure described: it is the property producible with a single contributor, and is non-negotiable ([01 §12.1](./01-principi-e-metodo.md)). The two statements - "all criteria are verifiable by anyone" and "no verification has been performed by a second subject" - are both true and both written.

**What remains to be decided.** The **allocation**: which subset is accepted as a declared gap and which is covered by acquiring the function externally. It is a decision of the contracting party and is the question `Q-189`, with a decision point on **30 September 2026**. In the absence of a decision the default outcome is the declared gap, and it is declared in advance precisely so as not to make it appear as a choice taken afterwards.

#### `TG-21` - Independent external review of critical security code · **IRREVERSIBLE FOR THE PERIOD**

**What it was.** `D18` requires that token exchange at the gateway, being critical security code, be **subject to independent external review** and to dedicated abuse tests.

**Why it has left.** Because it requires an external, independent reviewer, who under `D54` does not exist internally by definition, and whose acquisition is a spending decision of the contracting party.

**Why the cut is irreversible for the period, not entirely.** The review **can be performed later**: the code does not expire. What cannot be annulled is the **period during which the artefact was distributed without it**, and `D18` prescribes performing it **before**. The classification is therefore precise and must not be rounded in either direction: **recoverable as an activity, irrecoverable as a state of the `RU-1` release**.

**What it means for whoever installs.** The authorisation boundary - validation of the integrator's token, emission of the internal token, claim of the actor - **has not been reviewed by a third party** at the time of `RU-1`. It must be written in the release notes, and is an element a security officer must be able to weigh in their evaluation.

**What the project does anyway.** The empirical verification of `T-04`, criteria 1 and 2, with **negative test on all supported configurations**, and the corresponding blocking release criterion (§8, criterion 2). These are **behaviour** verifications, and do not substitute a code review: the difference is declared and not softened.

#### `TG-22` - Formative usability evaluation during development · **IRREVERSIBLE**

**What it was.** Usability engineering under the applicable standard, mandatory by effect of `D12` and `D25`, provides for **formative evaluations during development** with representative users - who include elderly care recipients and persons with disabilities, target population and not a boundary case - and **summative validation** before release.

**Why it has left.** Because it requires recruitment of representative users, an approved protocol before execution, and human factors expertise that the project **does not possess internally**. It is class `B`: its duration does not depend on project speed.

**Why the cut is irreversible.** Because formative evaluation is **contemporaneous by definition** with the design decisions it evaluates. Performing it afterwards is not a formative evaluation: it is a summative one on an interface already decided, and serves a different purpose. **The interface decisions made during the `RU-1` period will never have been formatively evaluated**, and the usability engineering dossier will carry that gap with its date.

**What it means for whoever installs.** The `RU-1` interface has been designed according to the declared accessibility criteria and **verified against them**, not **validated with the users it is intended for**. These are two different assurances, and the dossier declares which of the two has been produced.

**What the project does anyway, and how it must be named.** `T-08` criterion 7 requires **at least one verification with actual assistive technology, with outcome recorded**, and interface decisions are documented in writing. **This is not a formative evaluation and must not be presented as such.** Calling it so would be the most costly form of regulatory debt: a recording formally present and substantively empty, which is worse than its absence because it is falsely reassuring.

#### `TG-23` - Periodic signed anchoring of the immutable register chain · **IRREVERSIBLE FOR THE PERIOD**

**What it was.** The requirement for non-alterability of the access register rests on layers covering different threats: application-level hash chain, append-only archive, storage with separated privileges, and **periodic signed anchoring** of the chain head at an external point outside the system generating events.

**Why it has left.** Because it is the layer requiring an external trust point, a custody procedure and its own verification, and is declared by the security area as part of the **single highest-effort element of the entire security catalogue**.

**Why the cut is irreversible for the period.** Anchoring **can be activated at any future moment**, and from that moment the chain is anchored. But **recordings written before do not gain retroactive anchoring**: for the `RU-1` period the non-alterability assurance rests on the application chain and privilege separation, and **is not demonstrable to a third party who does not trust the system operator**. Activating it afterwards antedates nothing.

**What it means for whoever installs.** The **coverage** of the register is complete - every access to health data in the path is logged, and on this no reduction is admitted ([01 §7.3](./01-principi-e-metodo.md)) - but **the non-alterability assurance is reduced by one layer**, and the reduction must be declared to whoever installs, because it determines what they can state in their obligations. The **separation of privileges between application archive and register archive** remains a **prerequisite of installation and not a recommendation** (§7.1): in its absence the assurance drops further, and under `TG-23` there is no longer a layer to compensate.

### 5.4 What could not be cut, and why

A list of cuts without its complement is half-information. The following items **have not entered any reduction, do not enter the sacrifice order of §6, and will not enter it**: their debt is paid not by the project but by a care recipient ([01 §7.3](./01-principi-e-metodo.md)).

| Item | Why it is not cuttable |
|---|---|
| **Complete coverage of the register of accesses** | An unrecorded access is not recorded later. What could be reduced is one layer of assurance (`TG-23`), **never the coverage** |
| **Verification of session keys** | It is a risk control, not a function. Without it the property of encryption to the endpoints is not demonstrable to the interlocutor, and the corresponding public statement would not be sustainable |
| **Notice of inadequate quality to the professional** | It is a risk control, with the outcome of the professional's decision recorded |
| **Collection and verification of consent** | With withdrawal that has effect and reference to the text version |
| **Isolation between tenants** | With tests that actively attempt unauthorised access in adverse conditions |
| **Absence of clinical content** in logs, metrics, traces and event envelopes | With tests that attempt to pass sensitive data and fail if they succeed |
| **Coexistence of two consecutive versions on the same database** | A migration both destructive and functional renders return to the previous version impossible: it is a continuity risk for whoever installs |
| **The blocking release criteria of §8** | In full. None is waivable, none enters the sacrifice order |

And one item that has been **deliberately excluded from the cuts** despite its cost:
the **persistent and non-hideable recording indicator** (§3.8), which safeguards a function not yet present. The reason is in §3.8 and stands as a general criterion: **a safeguard that arrives together with the risk it must safeguard is never put to the test.**

---

## 6. If the date is still at risk: the order of sacrifice

The plan of chapter [02](./02-traguardi.md) **has no time margin**: nine milestones occupy the remaining calendar. The margin is in scope, and is this.

### 6.1 The three rules

**First - the order is executed from the top, in its entirety, and each execution is recorded** in the review of [00 §8](./00-indice.md), with the date and reason. An unrecorded reduction is an undeemed cut, and causes the choice to lose the sole property that `D53` requires to guarantee: **legibility**.

**Second - only reversible cuts enter the order.** It is part of constraint `V-282`. An irreversible cut is not decided under calendar pressure: it is decided with the ordinary procedure, knowing what it costs, or it is not decided.

**Third - the blocking release criteria of §8 and the list of §5.4 never enter this order.** If scope cannot be reduced further without touching them, **the date is declared missed** with the cause recorded ([01 §10](./01-principi-e-metodo.md)). It is not a failure of the method: the method is working.

### 6.2 The order

| # | What is sacrificed | What is lost | What remains |
|---|---|---|---|
| `S-1` | **Metrics export** in open format | Whoever installs cannot feed their own monitoring from day one | The measurement remains internal and historicised: nothing is lost, the data is available later |
| `S-2` | **Structured attestation of connection quality** in the returned outcome | The system of origin does not receive the attestation in structured form | The attestation remains **measured and logged**, and the notice of inadequate quality to the professional **remains whole**: the return is lost, not the risk control |
| `S-3` | **Waiting room and admission as distinct states** | The professional loses visibility of the care recipient waiting | Technical verification beforehand **remains**: it is what protects the care recipient from a session that will not work |
| `S-4` | **List of today's services** in the professional's interface | One enters the session from the integrator's referral, not from a personal list | The session path remains whole, and the reference use case is entry from the system of origin |
| `S-5` | **Telephone fallback as typed outcome** | The channel change is not a value in the outcome catalogue | It remains recordable as generic outcome with note: the typing is lost, not the traceability |
| `S-6` | **Asymmetric signature of outgoing events** with resolvable key identifier | Events are authenticated by channel alone | **Shared secret is not admitted as a substitute** (`V-162`): either asymmetric signature, or the event does not exit towards third parties and recovery remains via authenticated call |
| `S-7` | **Exact word count** of the corpus (`T-02` criterion 5) | The translation plan remains on estimates, and the `[NV]` on volume remains open | Translation of prerequisite areas **does not depend on the count**: it happens anyway |
| `S-8` | **teleconsulto and telemonitoraggio from the demonstrable vertical path** | `RU-1` **does not implement the three services of the domain model**: it implements the sole televisita with two participants. Whoever evaluates the project sees a single use case exercised, and the models of the other two services remain designed in the domain and requirements without exercise in the code. It is the cut that bites on criterion 6 of `T-08`, the vertical path, taking it from "complete" to "complete for a single service" | teleconsulto and telemonitoraggio remain **wholly designed**: domain model, functional requirements (`RF-*`), business rules (`BR-*`), test scenarios (`ATT-*`), protocolisation. Their implementation is deferred and not cancelled. In criterion 6 of `T-08` and in the backlog of [04](./04-oltre-il-primo-rilascio.md) the deferral is declared with the consequence that two vertical paths remain to be built in subsequent releases |

**What is not in this table, and is its most important part.** There is no item reducing coverage of the access register, key verification, tenant isolation, consent, absence of clinical content in outbound messages or a blocking release criterion. **If the order is exhausted, the date is declared missed.** The order ends at `S-8` by design, and its end is itself information.

---

## 7. The assumptions for installation

`RU-1` **takes for granted** the following conditions. They are not recommendations: they are the list that determines whether installation is possible. Whoever cannot satisfy them cannot install `RU-1`, and knowing this beforehand is worth more than finding it out afterwards.

### 7.1 What whoever installs must provide

| Element | Why it is a prerequisite and not an option |
|---|---|
| **Domain name and certificates**, with automatic renewal | The product does not manage its own certificate lifecycle |
| **Reachable addresses from outside for the relay node** | It is the only component that requires it together with the frontier |
| **Egress network isolation of the relay node**, applied by the infrastructure | It is the **primary defence**, and does not depend on code correctness. Forbidden address lists are defence in depth (`V-10`) |
| **Outbound route denial to application components**, with the sole exception of the mediator | Architectural requirement (`V-157`), not a coding rule |
| **Separation of privileges between application archive and register archive** | **Requirement, not recommendation**, and with `TG-23` its weight increases: without periodic signed anchoring, privilege separation is **the layer that remains**. In its absence the non-alterability assurance drops to that of the application chain alone, and the drop must be declared in whoever installs's obligations |
| **Custody of the key root** of the encryption hierarchy | The key protecting the copies cannot reside in the system that produces them |
| **Backups, with periodic restoration testing** | A backup never restored has unknown probability of functioning |
| **Own identity provider, or federation with the integrator's system** | `RU-1` accepts an identity already authenticated by the integrator; **not** contains conformity verified on national digital identity (§4.3) |
| **Message delivery channel**, with its own contract | The product sends, it is not the channel operator |
| **Monitoring, event correlation and incident management** | The product exports events; the correlation system is the customer's. **With `TG-09` the dashboards are theirs too** |
| **Building their own dashboards** on the metrics export | Direct consequence of `TG-09`, listed here because it is a prerequisite and not a preference |
| **Determination of retention periods** for healthcare documentation | The product makes them configurable, **does not decide them**: the determination is the data controller's |
| **Definition of expected service levels** | The product measures them, does not set them |
| **Maintenance window for updates** | Direct consequence of `TG-11`: migrations are not non-blocking |
| **Technical expertise for administration** | Direct consequence of `TG-10`: administration happens per declared configuration and command line, not from interface |
| **Update cadence of exposed components**, in particular the relay | For an exposed component, the update is an obligation and not a good practice |

### 7.2 What whoever installs must provide on the obligations plane

No obligation towards the authorities is the supplier's, and no contractual clause shifts them - **and this does not change with `D58`**. The complete list is in [`docs/06_security/09-ripartizione-delle-responsabilita.md`](../06_security/09-ripartizione-delle-responsabilita.md) §11.
This area recalls the three discovered most often too late:

1. **Data protection impact assessment**, which is the data controller's and precedes processing. The project provides the structural material.
2. **Notification of incidents** to the authorities, with their own clocks. The project notifies **the customer** within twenty-four hours and provides the evidence; does not notify the authorities on their behalf.
3. **Approval of plans by governing bodies**, which no supplier can substitute.

### 7.3 What the project provides

| Artefact | Content |
|---|---|
| Reproducible deployment definitions | For the **sole** single-tenant profile (`TG-08`) |
| Automatic migrations | Applied to all active schemas, with outcome recorded, **in maintenance window** (`TG-11`) |
| Configuration checks blocking on startup | §3.9 |
| Signed bill of materials, for every artefact | Includes components in base images |
| Release attestations | Provenance, bill of materials, test outcomes, traceability, **reproducibility of the main artefact** (`TG-14`), production profile conformity |
| Executable verification procedure for whoever installs | With the commands. **Executable by anyone**; not performed by a second subject (`TG-20`) |
| Backup and restore procedure, including key material | With declared objectives and at least one documented execution |
| Register integrity verification procedure | On demand and scheduled, with outcome recorded. **Without external anchoring** (`TG-23`) |
| Metrics export in open format | With series names documented (`TG-09`) |
| Data sheet for relevant suppliers declaration | Denomination, tax identifier, Country of registered office, procurement nomenclature codes, relevance criterion |
| Coordinated disclosure policy and functioning channel | With declared timelines |
| Installation and operations manual | **In Italian**, with the prerequisites of §7.1 at the head; notices and limits of use **in both languages** (`TG-19`) |
| **List of declared gaps** | With the date each was born, and with the four irreversible cuts of §5.3 at the head |

---

## 8. The blocking release criteria

`RU-1` **is not published** if even one of these criteria is not satisfied. No waiver exists, no approval can exceed them, **none of them enters the sacrifice order of §6**, and verification is automatic where it can be.

| # | Criterion | How it is verified |
|---|---|---|
| 1 | **Tenant isolation**: no path, for any interface, permits reading or writing data of another tenant | Tests that actively attempt unauthorised access, in adverse conditions: pool exhausted, context unresolved, request without tenant, tenant substituted mid-path |
| 2 | **No supported configuration emits a token lacking the claim of the actor** (`V-132`) | Negative test on all supported configurations |
| 3 | **The immutable register chain is verifiable**, and deliberately induced alteration is detected | Execution of verification on a deliberately altered case |
| 4 | **No clinical content** in logs, metrics, traces, event envelopes, error messages | Tests that attempt to pass sensitive data and fail if they succeed |
| 5 | **The pipeline controls declared blocking have passed the failure test**, and controls in reporting only each have the date declared on which they become blocking | Each tested with a deliberately non-conforming case; version-controlled configuration file for the dates |
| 6 | **Reproducibility of the main artefact verified**: rebuild on different executor, identical digests, outcome conserved | Work scheduled with outcome conserved. The reduced perimeter is declared (`TG-14`) |
| 7 | **Complete bill of materials**: no component present in the bill and absent from annotations | Pipeline control |
| 8 | **No migration both destructive and functional**: two consecutive versions coexist on the same database (`V-111`) | Test of coexistence and test of return to the previous version |
| 9 | **Accessibility**: no violation of automatable rules on any screen and any significant state; at least one verification with actual assistive technology executed and recorded | Pipeline control plus manually versioned checklist. **Not a formative evaluation** (`TG-22`) |
| 10 | **The recording indicator is not hideable**: the test that attempts to hide it with every configured means fails in all | Negative test |
| 11 | **The tests negative of the scope exclusions pass**: no interface accepts calculation of a priority, inference of a threshold, generation of interpretive content | Negative tests for each exclusion with declared verification |
| 12 | **Key verification is a blocking state of the state machine**, and the procedure in case of mismatch is tested with the same evidence as the positive case | Test of path, inclusive of the negative case |
| 13 | **The relay node does not route to the local loop, to private addresses and to metadata services** | Test that causes build to fail if any request succeeds |
| 14 | **The traceability report is produced** and the view "requirements without tests" is empty or is a list of declared gaps with reason | Release artefact |
| 15 | **Each artefact carries the declaration of non-marking**, in text realigned to `D58`, and **no release material contains a marking date** | Publication control plus textual verification |
| 16 | **No `[NV]` open on a released component** | Report of `[NV]` with addressee |
| 17 | **The release dossier contains the list of declared gaps**, with the four irreversible cuts of §5.3 at the head and the declaration that no verification has been performed by a second subject, **in both languages** | Release artefact, textually verified |
| 18 | **The support period is declared** and the version dismissal plan is published | Published document. Depends on `C-4` / `Q-186` |

**Criterion 17 is the one that substitutes the release review, and does not really substitute it.** In the earlier version of this chapter criterion 18 requested a **documentary release review with responsible and date**: under `D54` it is not producible (`TG-20`). What remains producible - and is therefore a blocking criterion - is the **explicit declaration that the review has not occurred**. It is not the same thing and must not be presented as such: it is the minimum that permits whoever receives the artefact to know what they have in hand.

---

## 9. The declared limits of `RU-1`

A declared limit is a functionality of the product; a limit discovered in production is an incident. These are the limits of `RU-1`, in addition to those permanent from the product already listed in [`docs/01_technical/07-prestazioni-e-capacita.md`](../01_technical/07-prestazioni-e-capacita.md) §7.

| # | Limit | Nature |
|---|---|---|
| 1 | **Not usable on actual patients**; no CE marking, no conformity declaration | Declared condition, not removable by configuration (§1.1) |
| 2 | **No verification performed by a second subject** | Irreversible cut `TG-20` |
| 3 | **A single service type**: televisita | Scope (§4.2) |
| 4 | **Two participants** to the session | Decision on topology declared deferred (`C-2`) |
| 5 | **No report**: the path returns a structured outcome, not a signed document | Cut `TG-01`, reversible |
| 6 | **No interoperability facade**: a sole integration surface, the project's own | Cut `TG-02`, reversible |
| 7 | **No embeddable component**: session start by referral with single-use token, no personalised theme | Cut `TG-03`, reversible |
| 8 | **A single event consumer per tenant**, without broker, without event history replay | Cut `TG-04`, reversible |
| 9 | **A single deployment profile**, single-tenant | Cut `TG-08`, reversible |
| 10 | **No administration interface**: declared configuration and command line | Cut `TG-10`, reversible |
| 11 | **Updates in maintenance window** | Cut `TG-11`, reversible |
| 12 | **Immutable register without external anchoring**: reduced assurance by one layer for the period | Cut `TG-23`, **irreversible for the period** |
| 13 | **No session recording** | Scope. The indicator and its prohibitions already exist |
| 14 | **No submission to documentary infrastructures** | Unavailable external dependency (`Q-07`) |
| 15 | **Latency from objective to screen not guaranteeable and not monitored by regression test** | Depends on camera, computation, screen, network and buffer. The system **measures** it in session and records it (`TG-13`) |
| 16 | **Degradation tested at extremes, not along the scale** | Cut `TG-12`, reversible |
| 17 | **No offline mode for clinical content** | Declared choice, motivated by risk of clinical content on a device the controller does not control |
| 18 | **No key rotation during session** | **Does not exist in the technology.** Not claimed |
| 19 | **Real-time subtitles absent** | Declared non-conformity on an accessibility criterion, with the interpreter as alternative measure and the data channel defined in the protocol anyway |
| 20 | **Event delivery at least once** | Consumers are idempotent by construction |
| 21 | **Number of tenants per installation** | `[NV]` - not measured. Order of magnitude declared: hundreds. Measurement is a release activity, not an estimate |
| 22 | **Reproducibility verified on main artefact alone** | Cut `TG-14`, reversible |
| 23 | **Interface verified against accessibility criteria, not validated with target users** | Irreversible cut `TG-22` |
| 24 | **Authorisation boundary not reviewed by an independent third party** | Cut `TG-21`, irreversible for the period |

---

## 10. How to verify that you have received what is declared

The question is from whoever installs and the answer is a procedure, not a declaration. Under `TG-20` this procedure acquires a weight it did not have before: **it is the sole independent verification that will exist on `RU-1`**, and is performed by whoever installs.

1. **Verify the signature and provenance** of the artefact, with the commands in the manual. A signed artefact that no one verifies adds a declaration, not security.
2. **Compare the bill of materials** with your own inventory, and conserve it: it is the part the customer cannot reconstruct and that serves your obligations.
3. **Rebuild the main artefact from the published source** and compare the digests. It is the sole verification that establishes that the distribution corresponds to the source. On the other artefacts verification is not available (`TG-14`).
4. **Execute the configuration checks on startup** in a clean environment and observe that the system **refuses to start** with insecure configurations. A system that starts anyway does not have the controls it declares.
5. **Execute the restore procedure** on a separate environment, and verify that the immutable register chain is verifiable after the restore. A restore producing a non-verifiable chain is a **failed** restore, not a successful one with a warning.
6. **Read the traceability report**, in particular the view of requirements without tests.
7. **Read the list of declared gaps**, and in particular the four irreversible cuts of §5.3. It is the list that determines what `RU-1` **will never** be able to demonstrate from its period, and is the information no other part of the dossier contains.

---

## 11. Project commitment and installation commitment, line by line

| Area | The project commits to | Whoever installs commits to |
|---|---|---|
| **Encryption in transit** | Provide it on all channels, prevent downgrade, **measure and record** what is negotiated instead of declaring it | Verify that the deployed configuration has not altered it, and retain the evidence |
| **Encryption at rest** | Provide the mechanism with per-tenant keys separable from data and cryptographic deletion | **Custody of the root key**, outside the system that produces the copies |
| **Non-alterable register** | Provide it with hash chain, export signed in open format, integrity verification. **Without external anchoring in `RU-1`** (`TG-23`) | Guarantee **privilege separation** between application archive and register archive, which with `TG-23` is the layer that remains |
| **Security updates** | Release them on authenticated channel, with notice published, within the declared service level in **days per severity** (`V-185`) | **Apply them**, according to your policy, in maintenance window (`TG-11`) |
| **Network isolation** | Document the reference configuration and verify it on startup where possible | **Apply the network rules**: outbound route denial to application components, relay isolation |
| **Backups** | Provide procedure, declared objectives and encryption capability | **Execute them**, keep one unreachable permanently from the system, **test the restore** |
| **Incidents** | Notify the customer **within twenty-four hours**, immediately for high severity; deliver the report within the next day with the timeline; provide the logs in open format | **Notify the authorities**, within your terms, according to your clocks |
| **Monitoring** | Export the metrics in open format with series names documented | **Build the dashboards** and event correlation (`TG-09`) |
| **Retention** | Make the periods configurable, log the execution, make the outcome verifiable | **Determine the periods**, which are the data controller's |
| **Service levels** | **Measure them** and historicise them by tenant and by service, with an alarm at the threshold breach | **Define them**, because the threshold determines what is a significant incident |
| **Independent verification** | Provide a verification procedure **executable by anyone**, and declare that **no verification has been performed by a second subject** (`TG-20`) | **Perform it.** In `RU-1` it is the sole independent verification that exists |
| **Marking** | **Nothing, today.** The product bears no CE marking and is covered by no conformity declaration. The project **intends to assume the role of manufacturer** (`D58`), with the entity still to be established, and publishes its internal planning - **never a marking date** | Assume the role of manufacturer if placed on the market, with all the obligations that follow. **The project's intention transfers nothing** |

> **The line to be read twice is the last**, and more carefully than before. That the project intends to certify in future **covers no current installation**, removes no obligation from whoever integrates and anticipates no outcome. No licence clause, no agreement and no project statement transfers to whoever integrates a protection that does not exist, nor removes an obligation that regulation attributes to them - and **the liability towards the injured party is not excludable by contract**.

---

**Continues in**: [04 - Beyond the first release](./04-oltre-il-primo-rilascio.md), where the items of §4 and the reversible cuts of §5 find their order of priority.
