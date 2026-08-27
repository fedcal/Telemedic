---
title: Beyond the first release
sidebar_position: 5
description: "What comes after the first installable release, in order of motivated priority - the planned queue item by item with binary completion criteria, trigger and owner, including items exited from RU-1 by effect of D53; what is only desirable and what is missing for it to become planned; what returns in no release."
---

# Beyond the first release

Chapter [03](./03-primo-rilascio-utilizzabile.md) has declared what `RU-1` contains, what it does not contain and - at §5 - **what has been cut to respect the date of 30 November 2026**. This chapter answers the next question, which is the one an integrator asks as soon as they finish reading the list of cuts: **and then?**

> **The useful answer is not a list of things to be done.** It is the distinction between what is **planned** - with a position in the queue, a completion criterion and a declared trigger - and what is **only desirable**, that is lacking all three of these things. A document that presents the two categories with the same graphics has already misled whoever reads it, even if every single sentence is true.

---

## 1. The two categories, and the rule that separates them

The three classes of project statement - `[COMMITMENT]`, `[INTENTION]`, `[CONDITIONAL]` - remain those defined in [00 §2](./00-indice.md). This chapter introduces a partition **orthogonal** to them, serving a different reader: not one evaluating the reliability of a date, but one who must decide whether to wait for a function or obtain it elsewhere.

| Category | Marker | What it has | What authorises one to say |
|---|---|---|---|
| **Planned** | `OL-nn` | A position in the queue motivated, one or more **binary completion criteria**, a **trigger** declared, an **owner** | "It is in the queue, in this position, and unblocks when this happens" |
| **Desirable** | `DS-nn` | A motivation and **nothing more**. No position, no criterion, no trigger | "We would like it, and today this is missing for it to become planned" |

**The rule, posed as constraint [`V-187`](../11_registri/01-vincoli-in-vigore.md#v-187)**: an item that does not have together binary completion criterion, declared trigger and named owner **is not planned**, and no project material can present it as such. It is not redactional pedantry: it is what prevents an answer to a specification from transforming a desire into a contractual commitment for the project through the medium of a well-formatted table.

### 1.1 What the designations are, and what they are not

`OL-nn`, `DS-nn` and `TG-nn` are **planning designations**, not requirement identifiers. They do not belong to the intervals frozen by [`V-120`](../11_registri/01-vincoli-in-vigore.md#v-120) (`RF-*`, `RNF-*`, `BR-*`, `ATT-*`, `UC-*`, `OUT-*`), do not enter the traceability matrix and cannot appear in a test. They are worth exactly what the designation `RU-1` is: a way to refer to a line of a document without having to retype it.

**The number of an `OL-nn` item is not its position in the queue.** It is the order in which the item was introduced. The position is declared in the table of §3 and changes; the number no, because renumbering would cause every existing reference to diverge. Items `OL-15`…`OL-22` are the latest introduced and are in some of them at the head of the queue: **it is normal and must be read that way.**

When an `OL-nn` item enters work, the requirements implementing it receive their own identifiers according to the rule of [`docs/03_functional/07-fuori-perimetro.md`](../03_functional/07-fuori-perimetro.md) §7:
**new identifier, never the silent modification of an existing one**.

### 1.2 What is not in this chapter

- **The definitive exclusions.** They live in [`docs/03_functional/07-fuori-perimetro.md`](../03_functional/07-fuori-perimetro.md) with identifier `OUT-nn` and reopenability category, and §7 refers to them without rewriting them.
- **The dates.** No item in this chapter has a date. The reason has changed from the earlier version of this document and must be stated with precision: **it is no longer that capacity is unknown** - `D54` declares it - **it is that the declared capacity is wholly committed through 30 November 2026** by the plan of chapter [02](./02-traguardi.md), which has no margin. Beyond that date capacity remains that of a single contributor on a part-time basis, and the queue that follows contains **twenty-two items**. Declaring a quarter here would mean inventing it.
- **The risks.** Each item cites the risks that concern it; their description is in [05 - Risks and dependencies](./05-rischi-e-dipendenze.md).

---

## 2. How the queue is ordered

### 2.1 The criteria, and how they apply after the first release

The priority criteria are those of [01 §3](./01-principi-e-metodo.md), in lexicographic order: safety of the care recipient, irretrievability, legality of use, unblocking, clinical value per unit cost, desirability.

**Criteria 1 and 3 do not order the queue: they filter it.** Nothing enters this queue if it degrades care recipient safety without a risk control, or if its absence renders use of the product unlawful. An item violating one of the two would not be a backlog item: it would be a defect in the first release, and must be corrected there.

**Criterion 2 - irretrievability - after `D53` orders, and before it did not.** It is the novelty of this revision and must be motivated. Until the third round of decisions, what was irretrievable had been placed in milestones of class `A` and therefore did not appear in the queue. After `D53` and `D54` there are items whose **absence produces a new loss at each release**, not a single time: they are functions with distinct roles (`OL-22`) and register anchoring (`OL-21`). For them the distinction between filter and ordering does not hold, because there is no single release to correct: there are a series of releases each of which repeats the omission. **They therefore stand at the head of the queue, ahead of items of greater functional value**, and it is a choice this document declares rather than leaving it to be inferred.

**The rest of the queue is ordered by criteria 4 and 5**, in that order: how many other things an item unblocks, and how much clinical benefit it produces per unit of work. Criterion 6 - desirability - orders nothing: **it is the definition of the second category**.

### 2.2 The three additional rules

**First - regulatory debt is extinguished before adding.** If at the moment of opening an item there is a declared gap in the sense of [01 §8](./01-principi-e-metodo.md), that gap is closed first. The reason is arithmetic: regulatory debt is not refinanced, and each function added on top of a gap increases its surface instead of leaving it constant. **Under `D54` this rule has a precise audience**: the declared gaps of §5.3 of chapter [03](./03-primo-rilascio-utilizzabile.md), which is why `OL-22` is in first position.

**Second - what unblocks integrators precedes what adds a service.** A new service produces value for a tenant; a missing integration capability blocks **every** integrator at the same time and forces them to build a workaround they will then maintain for years.

**Third - nothing is added until the vertical path of `RU-1` has been exercised by someone who did not write it.** It is the application of the composition criterion of [01 §4.2](./01-principi-e-metodo.md), and under `D54` is **the sole form of independent verification that `RU-1` will have**: it is performed by whoever installs, with the procedure of [03 §10](./03-primo-rilascio-utilizzabile.md). A second vertical path built on a first never tested multiplies a defect by two instead of discovering it.

### 2.3 The queue is for priority, not for mandatory sequence

**The position in the queue expresses priority, not delivery order.** A small and unblocked item does not await a large item blocked by a decision of the contracting party. The rule that governs a bypass is only one, and is verifiable:

> An item may overtake those preceding it **only if its trigger has occurred and those of the preceding items have not**, and the bypass is recorded in the review of [00 §8](./00-indice.md) with the reason. An unrecorded bypass is an undecided change of priority.

---

## 3. The planned queue - overview

| Pos. | Item | Statement | Why not in `RU-1` | Trigger | Owner |
|:-:|---|:-:|---|---|---|
| 1 | `OL-22` Functions with distinct roles acquired externally | `[INTENTION]` | **Irreversible cut `TG-20`, `TG-21`, `TG-22`**: require distinct subjects, not hours | Decision on [`Q-189`](../11_registri/02-questioni-aperte.md#q-189) | Contracting party |
| 2 | `OL-15` Clinical documentation and reporting | `[INTENTION]` | Cut `TG-01`, `TG-06`, `TG-07`: breadth | None external: capacity | Project |
| 3 | `OL-21` Periodic signed anchoring of the register | `[INTENTION]` | **Cut `TG-23`**, irreversible for the period | None external: capacity | Project |
| 4 | `OL-02` Third participant to the session | `[INTENTION]` | Topology decision declared deferred | Closure of `C-2` and measurement of [`Q-115`](../11_registri/02-questioni-aperte.md#q-115) | Contracting party, then project |
| 5 | `OL-16` Interoperability facade | `[INTENTION]` | Cut `TG-02`: second contractual surface | None external: capacity | Project |
| 6 | `OL-01` Telemonitoring, complete path | `[INTENTION]` | Broadest context in the catalogue | Closure of [`Q-120`](../11_registri/02-questioni-aperte.md#q-120) | Project |
| 7 | `OL-17` White-label embeddable component | `[INTENTION]` | Cut `TG-03` | None external: capacity | Project |
| 8 | `OL-03` Server-side session recording | `[INTENTION]` | It is a **second security mode**, not an optional function | Verification on container and closure of `C-3` | Project |
| 9 | `OL-19` Operations: administration, second profile, non-blocking migrations | `[INTENTION]` | Cuts `TG-08`, `TG-10`, `TG-11` | None external: capacity | Project |
| 10 | `OL-20` Extension of verification | `[INTENTION]` | Cuts `TG-05`, `TG-12`, `TG-13`, `TG-14` | None external: capacity | Project |
| 11 | `OL-04` teleconsulto, teleconsulenza and second opinion | `[INTENTION]` | Each is its own state machine with distinct permitted actors | Closure of `OL-15` | Project |
| 12 | `OL-05` teleassistenza | `[INTENTION]` | Actors and artefacts are different | Subsequent to `OL-04` | Project |
| 13 | `OL-18` Event broker and multiple consumers | `[INTENTION]` | Cut `TG-04`: one more component to install and monitor | Second consumer requested by a real tenant | Project |
| 14 | `OL-06` Asynchronous channel and document sharing in session | `[INTENTION]` | Not crossed by the chosen vertical path | None external: capacity | Project |
| 15 | `OL-07` Submission to national and regional documentary infrastructures | `[CONDITIONAL]` | Documentary models are not publicly available | Material availability ([`Q-07`](../11_registri/02-questioni-aperte.md#q-07), `B-7`) | Third party; project awaits |
| 16 | `OL-08` Conformity verified on national digital identity | `[CONDITIONAL]` | Requires pre-production environments and credentials | Access to environments | Whoever installs provides access |
| 17 | `OL-09` Hospital messaging, documentary interoperability profiles, application launch in clinical context | `[CONDITIONAL]` | All three require a counterparty with a test environment | Availability of a counterparty | Integrator or entity |
| 18 | `OL-10` Development kit in two languages | `[INTENTION]` | Versioned interface is sufficient for first integration | None external: capacity | Project |
| 19 | `OL-11` Own modules for agenda, invoicing and invoicing | `[INTENTION]` | `RU-1` receives the appointment by reference | An adopter without their own agenda | Project |
| 20 | `OL-12` Autonomous invoicing context | `[INTENTION]` | Decision declared deferred to the contracting party | Closure of `C-1` | Contracting party, then project |
| 21 | `OL-13` Scores of validated scales and questionnaires | `[CONDITIONAL]` | Licensing regime not verified | Closure of `B-3` and [`Q-11`](../11_registri/02-questioni-aperte.md#q-11) with favourable outcome | `COMP` |
| 22 | `OL-14` Selective concealment of audio-video content | `[INTENTION]` | Declared not present in the first version | Closure of [`Q-157`](../11_registri/02-questioni-aperte.md#q-157) | `COMP`, then project |

**What is not in this table and must be said here.** The **declared support period** and the **version dismissal plan** (`C-4`, [`Q-186`](../11_registri/02-questioni-aperte.md#q-186)) are not queue items: they are **prerequisites of the first distribution**, criteria of milestone `T-05` and blocking criterion 18 of [03 §8](./03-primo-rilascio-utilizzabile.md). Putting them in the queue would mean admitting that one could distribute without declaring for how long one sustains what one has distributed.

---

## 4. The items one by one

Each item has the same form. **Completion criteria are binary**: they are satisfied or not, and verification requires no discussion.

### `OL-22` - Functions with distinct roles acquired externally
*`[INTENTION]` · first position · owner: **contracting party***

**What it comprises.** Acquisition externally of functions requiring a subject different from whoever performs the activity: **internal audit** of the quality management system, **release review**, **configuration verification performed by someone who did not write the code**, **independent external review of critical security code** prescribed by `D18`.

**Why it is not in `RU-1`.** Because `D54` declares a single contributor and these functions **by definition presuppose distinct subjects**. It is not a matter of hours: it is the irreversible cut `TG-20` - with `TG-21` for the external review - described in [03 §5.3](./03-primo-rilascio-utilizzabile.md).

**Why it is in first position, ahead of every function.** For a reason that §2.1 states and is applied to the letter here: **the loss is not a single one, it repeats at each release.** A release without review produces a gap dated to that release; the subsequent release, if conditions do not change, produces another. Each month in which the decision is not taken **adds a line to the list of gaps** instead of leaving it constant, and no other queue item has this property.

**What this item does not do, and is the part that must be read twice.** **It does not remedy the `RU-1` period.** A review acquired in 2027 reviews the 2027 releases: that of `RU-1` remains without, forever. The item restores the property **from subsequent releases onwards**, and its position in the queue serves to make that "subsequent" as close as possible.

**Completion criteria.**

1. There exists a subject, external to whoever performs the activity, **named and registered**, for each of the functions which [`Q-189`](../11_registri/02-questioni-aperte.md#q-189) has decided its acquisition.
2. For each function **not** acquired externally, there exists the **formal recording of acceptance of the gap**, with the reason, the owner of the decision and the date: accepted gap is a registered decision, not a silence.
3. The **first release subsequent** to acquisition carries the corresponding recording actually produced, not just the availability of the subject.
4. The list of declared gaps distinguishes, line by line, those **closed from release N onwards** from those **dated to a period and not closeable**.

**Depends on.** Entirely on [`Q-189`](../11_registri/02-questioni-aperte.md#q-189), which is a contracting party decision with decision point on 30 September 2026, and on a spending decision.

**Risks.** `R-02`, `R-22` (specialist figures are a scarce resource), `R-29`.

### `OL-15` - Clinical documentation and reporting
*`[INTENTION]` · second position · owner: **project***

**What it comprises.** Draft, validation, **signature**, immutability of the signed document, rectification as a new version with chain maintained, content modelled as a **canonical dataset** on the information set of the typology proper to the remote consultation (televisita), digital notation in place of the report where the service setting provides for it ([`V-145`](../11_registri/01-vincoli-in-vigore.md#v-145)), delivery of the document to the system of origin in canonical form.

**It comprises moreover, and not for completeness but out of necessity**, the two safeguards that persistent clinical content requires and which exited `RU-1` with it: the **concealment applied by the authorisation engine** with the six inference channels closed (`TG-07`, [`V-149`](../11_registri/01-vincoli-in-vigore.md#v-149)) and the **emergency access** with mandatory reason, limited window, notification and review (`TG-06`, [`V-153`](../11_registri/01-vincoli-in-vigore.md#v-153)). **Delivering clinical content without its safeguards would be a defect, not a partial delivery**, and is the reason the three items are a single queue item.

**Why it is not in `RU-1`.** Cut `TG-01`, for breadth: it is the second context of the path, and brings with it electronic signature, timestamp, rectification chain and information set modelling.

**Why it is in second position.** Because it is what makes the vertical path **complete in the sense of [01 §4.2](./01-principi-e-metodo.md)**: the project's reference use case is return of clinical content to the system of origin, and while the path stops at the structured outcome the benefit to the clinician is halved. It is also the item that most changes what whoever installs can test.

**Completion criteria.**

1. The signed document is **immutable**, and rectification produces a new version with chain maintained: a test attempts modification on every exposed path and fails on all.
2. The content is modelled as a **canonical dataset**, and a test verifies that substitution of the serialisation **requires no domain modifications** ([`V-07`](../11_registri/01-vincoli-in-vigore.md#v-07), [`V-136`](../11_registri/01-vincoli-in-vigore.md#v-136), [`V-143`](../11_registri/01-vincoli-in-vigore.md#v-143)).
3. **No pre-fill of clinical interpretive content**: demographic, administrative and temporal data are pre-filled, and the corresponding negative test passes (`OUT-07`).
4. The **attestation of connection quality** enters the document in structured form, **measured by the system and confirmed by the professional**, never autonomously generated.
5. The **concealment is applied by the authorisation engine and not by consumers**, with the six inference channels closed and with synthetic test data comprising concealed documents.
6. The **emergency access** has free mandatory reason, limited window and perimeter, notification and review with outcome recorded; a test verifies that access without reason fails.
7. Delivery to the system of origin occurs **via the sole outbound mediator** ([`V-157`](../11_registri/01-vincoli-in-vigore.md#v-157)).

**Risks.** `R-23` (drift towards interpretation: assisted reporting is one of the three features a single story from class elevation), `R-24`.

### `OL-21` - Periodic signed anchoring of the register chain
*`[INTENTION]` · third position · owner: **project***

**What it comprises.** The missing layer of the immutable register: periodic signed anchoring of the chain head at an external point outside the system generating events, with the custody procedure and corresponding verification.

**Why it is not in `RU-1`.** Cut `TG-23`. It is the layer requiring an external trust point and its own procedure, in a component already declared as the single highest-effort element of the entire security catalogue.

**Why it is in third position.** Because the loss is **recurring**: every day of operation without anchoring is a day for which non-alterability **will never be demonstrable to a third party who does not trust the system operator**. Activating it antedates nothing. It is the same property that puts `OL-22` in first position, applied to a component instead of a role.

**Completion criteria.**

1. The chain head is anchored **with declared cadence** at an external point outside the system generating events, and the anchoring is signed.
2. Integrity verification **uses the anchoring** and distinguishes in its outcome the anchored period from the non-anchored: a chain verified over a period prior to activation reports explicitly **"not anchored"** and not "verified".
3. Anchoring failure is a **monitored event**, not a silence: a test suspends the external point and verifies that the system signals.
4. The custody procedure of the anchoring signature material is documented and **does not reside in the system producing the recordings**.

**Risks.** `R-20`.

### `OL-02` - Third participant to the session
*`[INTENTION]` · fourth position · owner: **contracting party**, then project*

**What it comprises.** The presence in session of a third subject: interpreter, carer assisting the care recipient, second professional, healthcare operator at the home.

**Why it is not in `RU-1`.** Because the topology of the session beyond two participants is a declared deferred decision (`C-2`, with the measurement part recorded as `A-5` in [`docs/02_architecture/09-decisioni-rinviate.md`](../02_architecture/09-decisioni-rinviate.md)), and is not a technical decision: the mesh topology without central component is the sole one preserving encryption to the endpoints, and exceeding its limit means introducing a component that **terminates encryption**, that is a third operating mode with different security properties. The maximum number, moreover, depends on the transmission budget of the worst-connected participant, which is measured on a device and a network of reference **not yet declared** ([`Q-115`](../11_registri/02-questioni-aperte.md#q-115), [`Q-175`](../11_registri/02-questioni-aperte.md#q-175)).

**Why it is high in the queue, ahead of more requested items.** Because the interpreter is the **declared alternative measure** for the sole accessibility non-conformity the project admits, that on real-time subtitles (`D24`). Until the third participant exists, the alternative measure does not exist, and a declared non-conformity with a non-existent alternative measure is a non-conformity without alternative measure. **Criterion 3 - legality of use - applies directly to it**, and supersedes the unblocking and value criteria.

**Completion criteria.**

1. The participant limit is **declared in the documentation and applied by the code**, with an understandable error to the exceeding participant explaining the reason and indicating the alternative; it is configuration with an imposed maximum, and a tenant can lower it but never raise it.
2. The number has been **measured** on the declared device and network of reference, not estimated, and the measurement is conserved as an artefact.
3. The presence of a third is a **distinct consent object**, with its own lifecycle, whose withdrawal does not touch the others ([`V-146`](../11_registri/01-vincoli-in-vigore.md#v-146)). It is the fourth of five objects in the model, and the first that `RU-1` does not exercise.
4. Key verification remains mandatory by default and remains a blocking state of the state machine even with three participants.
5. The third party's presence is reported in the outcome and, when `OL-15` is available, in the clinical document in the field provided by the record layout, in structured form.

**If measurement excludes the third participant.** It is the outcome that must be declared beforehand and not discovered afterwards: in that case the alternative measure for the accessibility non-conformity **must be re-examined**, and the re-examination is the responsibility of whoever declared the non-conformity.

**Risks.** `R-17`, `R-19`.

### `OL-16` - Interoperability facade
*`[INTENTION]` · fifth position · owner: **project***

**What it comprises.** The interoperability facade with capacity document, profiles fixed for version as a build artefact, and corresponding contract tests.

**Why it is not in `RU-1`.** Cut `TG-02`: it is a **second public contractual surface** to maintain for the entire support period, with its own dismissal cadence, above an interface no integrator has yet exercised.

**Why it is fifth.** For the second rule of §2.2: **what unblocks integrators precedes what adds a service**. Its absence forces every integrator to map for their own account, and the mapping done now will need to be redone when the facade exists - a cost that multiplies by the number of integrators and none of them recovers.

**Completion criteria.**

1. The facade is a **projection of the canonical dataset**, not a second modelling: a test verifies that adding a canonical field requires no domain modifications.
2. Profiles are **fixed for version as a build artefact**, not downloaded at the moment: an upstream change cannot change the outcome of a validation already performed.
3. The capacity document is **generated**, not written by hand, and a divergence between it and actual behaviour causes build to fail.
4. No forbidden conformity formula appears in the produced material ([`V-133`](../11_registri/01-vincoli-in-vigore.md#v-133)).

### `OL-01` - Telemonitoring, complete path
*`[INTENTION]` · sixth position · owner: **project***

**What it comprises.** Enrolment in a pathway, versioned individual plan, measurement acquisition from a third-party gateway, manual entry by care recipient or carer, structured questionnaires, evaluation of measurements against the rules of the active plan at the instant of measurement, alarms, escalation chain, measurement expectation, adherence and monitoring of expected volume.

**Why it is not in `RU-1`, and what has changed.** The reason for the intended use **has fallen**: `D55` has frozen the formulation on "deferred collection of parameters for the professional's periodic review", maintains Class IIa and software safety class B, and excludes the real-time formulation. The domain model was already written that way: **the work is no longer at risk of rewrite.** Two reasons remain. **The first**: it is the broadest context in the requirements catalogue, and under `D54` breadth is deciding. **The second**: the representation of the rules is an open architectural decision ([`Q-120`](../11_registri/02-questioni-aperte.md#q-120)), and building an engine before deciding how expressive it must be produces exactly the outcome that decision seeks to avoid - an arbitrary programming language executed in production, which is both an attack surface and an object not validatable for regulatory purposes.

**The permanent prohibition that `D55` brings with it.** No function in this item can be written in a way that shifts the system towards **clinical real-time**, and **the assessment must be made before the function is written, not after**. It is not a recommendation: it is the condition under which the assumed classification remains valid.

**Why it is nonetheless high in the queue.** Because it is the function on which the qualification the project has assumed is founded (`D26`): automatic evaluation of thresholds is the element that constitutes interpretation. A product that accepts the cost of Class IIa and does not deliver the function that cost justifies has paid the price and bought nothing. With `D58` the observation weighs more: the cost of certification is now **ours**.

**Completion criteria.**

1. An individual versioned plan is activatable **only** if there exists a declared service hours coverage for the tenant and for the pathway, and the attempt to activate without coverage fails in every supported configuration ([`V-122`](../11_registri/01-vincoli-in-vigore.md#v-122)).
2. The threshold field presents **empty and mandatory** in every authoring path, and a negative test verifies that no pre-fill occurs, not even with pathway or plan values ([`V-123`](../11_registri/01-vincoli-in-vigore.md#v-123), `OUT-08`).
3. Measurement instant and reception instant are two distinct mandatory fields, and rules operate on the measurement instant; a test with measurements delivered out of order produces the same outcome as a test with measurements in order ([`V-124`](../11_registri/01-vincoli-in-vigore.md#v-124)).
4. The absence of a measurement is represented as an **entity**, with expected window, deadline instant and reason when known; a test verifies that absence produces a row and not the absence of a row ([`V-148`](../11_registri/01-vincoli-in-vigore.md#v-148)).
5. An alarm is a **sequence of immutable events** and current state is a projection; no state column is updated in place ([`V-121`](../11_registri/01-vincoli-in-vigore.md#v-121)).
6. A recipient outside coverage is not a valid recipient in the escalation chain: they are skipped with reason recorded, and the alarm **remains open** when escalation fails.
7. Evaluation is **deterministic and reproducible** on versioned test vectors, with the rule version recorded on the alarm.
8. The system **does not infer** thresholds from population or from history, does not interpolate series, does not calculate scores: the negative tests of the corresponding exclusions pass.
9. **Impact assessment on the intended use frozen by `D55` is performed and recorded before the engine is written**, not after.

**Depends on the date.** On [`Q-120`](../11_registri/02-questioni-aperte.md#q-120) for the representation of rules; on [`Q-122`](../11_registri/02-questioni-aperte.md#q-122) and `B-9` for the minimum contract of the measurement gateway, which is `[NV]` on the actual availability of two signals; on [`Q-125`](../11_registri/02-questioni-aperte.md#q-125) for the encoding of parameters, with the constraint that the system remains operational with the external terminology service disabled ([`V-03`](../11_registri/01-vincoli-in-vigore.md#v-03)); on [`Q-124`](../11_registri/02-questioni-aperte.md#q-124) for the location of the alarm register in the mode of operation without retention of clinical content.

**Risks.** `R-17`, `R-23` (the item with the greatest pressure to expand towards interpretation), `R-11`.

### `OL-17` - White-label embeddable component
*`[INTENTION]` · seventh position · owner: **project***

**What it comprises.** The personalised element conforming to the web components standard, with a closed and versioned set of theme properties validated server-side with contrast verification, and with elements neither themeable nor hideable ([`V-163`](../11_registri/01-vincoli-in-vigore.md#v-163)).

**Why it is not in `RU-1`.** Cut `TG-03`. Session initiation occurs by referral with single-use input token, which is a complete integration path but **does not permit the integrator's visual identity**.

**Completion criteria.**

1. The set of theme properties is **closed and versioned**, and a configuration that degrades contrast is **rejected on save**, not accepted with a warning: negative test.
2. Non-themeable and non-hideable elements remain such in every supported configuration, and amongst them the recording indicator: negative test that attempts to hide it with every means.
3. Respect of system preferences - reduced motion, high contrast, character size - **is not disableable** by personalisation.
4. The component consumes **the same application interfaces** offered to integrators: no capability is reserved for it ([`V-164`](../11_registri/01-vincoli-in-vigore.md#v-164)).

### `OL-03` - Server-side session recording
*`[INTENTION]` · eighth position · owner: **project***

**What it comprises.** The second session mode provided for by `D23`: media passes through a recording component, encryption is terminated on the server, material is encrypted at rest with per-tenant keys and always has a declared expiration.

**Why it is not in `RU-1`.** Because **it is not an optional function: it is a second security mode.** It involves a distinct component with its own perimeter, a dedicated consent flow, a key hierarchy, a retention policy, a traced reproduction procedure and - above all - an informative that explicitly states to the care recipient that **the session is no longer encrypted to the endpoints**.

**What `RU-1` has already done for it, and why it is the right choice.** The persistent and non-hideable recording indicator **already exists** in `RU-1`, with its prohibitions and negative tests, although the mode does not exist, and has been **deliberately excluded from the cuts** of [03 §5](./03-primo-rilascio-utilizzabile.md). The reason is stated in [03 §3.8](./03-primo-rilascio-utilizzabile.md): a safeguard that arrives together with the risk it must safeguard is never put to the test. When `OL-03` arrives, the most delicate safeguard will already have been in operation for a release.

**Completion criteria.**

1. The mode is a **state of the session aggregate**, not a boolean attribute of the recorded material, and the transition between the two modes is logged with instant and attribution.
2. No recorded material exists **without current consent and without valued expiration**: both conditions are invariants verified by test.
3. **Withdrawal of consent has immediate effect** on recording in progress, verified by a test that withdraws at an open session.
4. The container is **negotiated at runtime** based on effectively negotiated codecs, without transcoding, and effective container and codecs are recorded in metadata ([`V-11`](../11_registri/01-vincoli-in-vigore.md#v-11), [`V-115`](../11_registri/01-vincoli-in-vigore.md#v-115)). **No single format is declared in any material**, and the rule remains in force even now that the corresponding verification has been deferred with the function.
5. The recording indicator is not hideable: the test that attempts to hide it with every configured means fails in all.
6. Recorded material **is not clinical documentation** and enters the documentary context only on explicit acquisition decided by the professional and recorded.
7. The consent informative explicitly states the loss of the end-to-end encryption property, in both languages, with versioned text and consent referred to the text version.

**Risks.** `R-19`, `R-25` (exposed component in more).

### `OL-19` - Operations: administration, second profile, non-blocking migrations
*`[INTENTION]` · ninth position · owner: **project***

**What it comprises.** The three items `RU-1` has shifted to whoever installs: the **administration interface** for tenant, identifier register and trust register (`TG-10`); the **second deployment profile**, on orchestrator (`TG-08`); **non-blocking migrations per tenant**, with observable progress and isolated failure per tenant (`TG-11`). With them the **three versioned dashboards** (`TG-09`), which are presentation of the same data.

**Why it is not in `RU-1`.** Because each shifts cost from the project to whoever installs **without removing any security property**, and is therefore the type of cut that §5.2 of chapter [03](./03-primo-rilascio-utilizzabile.md) qualifies as reversible with operational consequence. The consequence is though real and must be recalled: `RU-1` **requires technical expertise for administration** and a **maintenance window** for updates.

**Completion criteria.**

1. The administration interface satisfies the accessibility criteria **as acceptance criteria**, like the care recipient and professional paths: it is not an internal panel exempt.
2. No capability is reachable **only** from the administration interface ([`V-164`](../11_registri/01-vincoli-in-vigore.md#v-164)): the declared configuration remains a complete and tested path.
3. The second deployment profile uses **the same code and structure** as the first, and the complete functional suite runs on both.
4. Non-blocking migrations have **observable progress** and failure on one tenant **does not block the others**: a test causes failure on a tenant and verifies that the others complete.

### `OL-20` - Extension of verification
*`[INTENTION]` · tenth position · owner: **project***

**What it comprises.** Recovery of the verification depth reduced to respect the date: full scale of network profiles in the media suite (`TG-12`), automatic measurement of latency from objective to screen with regression test (`TG-13`), reproducibility verification extended to **all** artefacts (`TG-14`), and **non-degenerate verification** of functioning without terminology with constrained licences (`TG-05`), which requires the existence of encoded content and therefore follows `OL-15`.

**Why it is not in `RU-1`, and why it is a queue item and not a defect.** Because what has been reduced is the **depth** of verification, not its existence: each blocking property of [03 §8](./03-primo-rilascio-utilizzabile.md) is verified, and what is missing is coverage of intermediate states and secondary artefacts. The distinction must be held firm because it is what separates a declared reduction from a gap: **reduced verification is verification**, absent verification is not.

**Completion criteria.**

1. The scale of network profiles covers the intermediate states of the declared degradation, and each declared transition has at least one test that exercises it.
2. Latency from objective to screen is measured in continuous integration, and a deterioration beyond the declared threshold **causes build to fail**.
3. Reproducibility verification is performed **on all distributed artefacts**, with outcome conserved for each.
4. The complete functional suite runs with licenced terminology disabled **on a path containing encoded content**, and passes: it is the verification `RU-1` could satisfy only in degenerate form.

### `OL-04` - teleconsulto, teleconsulenza and second opinion
*`[INTENTION]` · eleventh position · owner: **project***

**What it comprises.** The services amongst professionals: specialist-to-specialist consultation (teleconsulto) between physicians, teleconsulenza between different healthcare professions, and further opinion requested on an already-documented case, which is an asynchronous variant of specialist-to-specialist consultation and not a standalone function.

**Why it is not in `RU-1`.** Because each is **its own state machine** with distinct permitted actors, distinct mandatory artefacts, distinct obligation of care recipient presence and distinct set of outcomes ([`V-140`](../11_registri/01-vincoli-in-vigore.md#v-140)). They are not variants of configuration of the remote consultation: the project's taxonomy bears two distinct attributes - the activity and the minimum service - which **do not coincide**, and the professional constraint applies to the **activity**, not to the service ([`V-147`](../11_registri/01-vincoli-in-vigore.md#v-147), [`Q-147`](../11_registri/02-questioni-aperte.md#q-147)).

**Why it follows `OL-15`.** Because the already-documented case presupposes a document: without reporting, further opinion has nothing on which to exercise itself.

**Completion criteria.**

1. Each service added is **one catalogue row plus one state machine**, and no condition is scattered in the code: a test verifies that adding does not require modifications outside the two designated places.
2. Admissibility of the channel and actors is verified **at booking**, not at delivery, and the attempt to book with a non-admitted actor for that activity fails.
3. The consultation scope is an aggregate **with expiration**, and automatic withdrawal at expiration is tested as an error flow, not as accessory behaviour.
4. The professional constraint is coded as a domain rule **not configurable by the tenant**, and a configuration that attempts to relax it is rejected with a validation error.

**Risks.** `R-23`, `R-24`.

### `OL-05` - teleassistenza
*`[INTENTION]` · twelfth position · owner: **project***

**What it comprises.** The services delivered by non-medical health professions, with their own artefacts and outcomes.

**Why it follows `OL-04`.** The same structural reason - it is its own state machine - with an additional sequencing consideration: much of the work of `OL-04` is the generalisation of the services catalogue and selection of the state machine by type. Once done, `OL-05` is largely catalogue content. Delivering them in the reverse order would mean doing the generalisation twice.

**Completion criteria.** The four of `OL-04`, plus the verification that the **delivery setting discriminates the rules**: where the source provides for digital notation in place of the report, the system produces the notation and does not demand a report ([`V-145`](../11_registri/01-vincoli-in-vigore.md#v-145)).

### `OL-18` - Event broker and multiple consumers
*`[INTENTION]` · thirteenth position · owner: **project***

**What it comprises.** The event broker with single-node configuration for deployment at the customer, behind the publication abstraction already proper to the project, and with it multiple consumers per tenant and replay of event history.

**Why it is not in `RU-1`.** Cut `TG-04`. The transactional outbox remains the source of truth and delivers per authenticated call: the missing capability is **fan-out** to multiple consumers, which with a single integrator per tenant is not yet necessary.

**Why it is thirteenth and not higher.** Because it is the sole cut that **eases whoever installs**: one fewer component to configure, update and monitor. Reintroducing it before a real tenant has a second consumer would mean returning operational weight in exchange for nothing. **The trigger is therefore external and precise**: the first tenant that requests a second consumer.

**Completion criteria.**

1. The publication abstraction **does not change**: a test verifies that the domain does not know the broker, and substitution of the publisher does not touch domain code (`D15`).
2. The outbox remains the **sole source** of outgoing events, and loss of the broker produces **delay in delivery, not loss of events**: a test suspends the broker and verifies resumption.
3. The guarantees actually available in the single-node configuration are **established and declared**, and no functional requirement depends on guarantees not available in that configuration: it is the empirical verification deferred with this item.
4. Consumers remain **idempotent by construction**, and no envelope contains clinical content.

### `OL-06` - Asynchronous channel and document sharing in session
*`[INTENTION]` · fourteenth position · owner: **project***

**What it comprises.** The asynchronous messaging channel between care recipient and structure, and document sharing during the session.

**Why it is not in `RU-1`.** Because the chosen vertical path does not cross it. It is one of the few queue items whose exclusion does not depend on a decision, a third party or a dependency: it depends only on the composition criterion.

**Completion criteria.**

1. The channel declares **persistently and non-closably** the expected response times and its unsuitability for emergency, with the approved formulation and tested with representative users.
2. A document shared in session **does not become clinical documentation** by virtue of having been shared: acquisition is an explicit and recorded act.
3. No clinical content is conveyed in the outgoing events generated by the channel: the reference is transmitted, the content is re-read with an authenticated call ([`V-135`](../11_registri/01-vincoli-in-vigore.md#v-135), [`V-161`](../11_registri/01-vincoli-in-vigore.md#v-161)).
4. The channel is reachable by a third-party system via documented and versioned interface ([`V-164`](../11_registri/01-vincoli-in-vigore.md#v-164)).

### `OL-07` - Submission to national and regional documentary infrastructures
*`[CONDITIONAL]` · fifteenth position, not datable by the project*

**Why it is not in `RU-1` and why it remains `[CONDITIONAL]`.** Because **the content is missing, not the project**. Documentary models, typology codes and indexing metadata for telemedicine typologies are not publicly available ([`Q-07`](../11_registri/02-questioni-aperte.md#q-07), `B-7`), and the structural response is already in force: the informational content is modelled as a **canonical dataset** and every serialisation is substitutable ([`V-07`](../11_registri/01-vincoli-in-vigore.md#v-07), [`V-136`](../11_registri/01-vincoli-in-vigore.md#v-136), [`V-143`](../11_registri/01-vincoli-in-vigore.md#v-143)).

**What the project has already done because waiting costs nothing.** The canonical dataset is modelled field by field on the information set of the binding source, not on the representation profile. When the material arrives, the work will be **writing a mapper**, not a migration of the domain model.

**Depends moreover on `OL-15`**: without clinical documentation there is nothing to submit.

**Completion criteria.**

1. Field-by-field coverage verification between canonical dataset and representation profile is performed, with gap analysis documented; where the profile has no place for a field from the binding source there exists a declared extension or motivated placement ([`Q-132`](../11_registri/02-questioni-aperte.md#q-132)).
2. Submission occurs **via the sole outbound mediator** ([`V-157`](../11_registri/01-vincoli-in-vigore.md#v-157)).
3. No template is hardcoded: the mapper is versioned configuration, and a test verifies that mapper substitution requires no domain modifications.

**Who is responsible.** Engagement for material acquisition is the conformity area ([`Q-07`](../11_registri/02-questioni-aperte.md#q-07)); realisation is the project. **The date depends on a third party** and the project does not declare it.

### `OL-08` - Conformity verified on national digital identity, on all channels
*`[CONDITIONAL]` · sixteenth position, not datable by the project*

**What `RU-1` already contains.** Distinct realms for clinical context and care recipient context, and acceptance of an identity already authenticated by the integrator's system with explicit delegation.

**What is missing, and why it does not depend on the project.** The **conformity verified** on the full set of providers requires pre-production environments, test credentials and - for one channel - **two provider instances per provider**, because the required authentication context is statically configured on the single instance ([`Q-05`](../11_registri/02-questioni-aperte.md#q-05), `D38`). The workstream multiplier acts on a set whose cardinality is read from a national register and not hardcoded. Each variation of instances entails a new submission of the metadata document to the authority: it is procedural cost, not code cost, and is not compressible.

**The limit that no release removes.** The project is **conformity-verifiable, not accredited** ([`V-05`](../11_registri/01-vincoli-in-vigore.md#v-05), `D36`, `OUT-22`). The provider of services towards the federation is whoever installs. **This does not change with `D58`**: the role of manufacturer and the role of service provider are different things, and assuming the first does not bring the second closer. The times of accreditation **are not stated by any primary source**: they do not appear in this roadmap because they do not exist, not because they were not sought.

**Completion criteria.**

1. The compliance suite of the channel that provides for it is passed **in its entirety**, including tests of signed assertion tampering, and is executed in continuous integration at every build, not once.
2. The level of assurance propagated is the **required** one and not the asserted one, and is always qualified to distinguish authentication **performed** from that **asserted** by an integrator ([`V-154`](../11_registri/01-vincoli-in-vigore.md#v-154), [`V-165`](../11_registri/01-vincoli-in-vigore.md#v-165)). The corresponding marker already exists in `RU-1`.
3. The three known defects of the federation product are closed in configuration **and** monitored by a test that fails if the configuration regresses. **Already satisfied** in `RU-1` (`T-04` criterion 3).
4. The outcome of verification on forwarding of the required authentication context through intermediation is **recorded**, and until then the public documentation **does not describe the mechanism** ([`Q-160`](../11_registri/02-questioni-aperte.md#q-160), `B-8`).
5. The channel with no external dependencies is completable and completed without awaiting the other two: it is the sole one on which the project depends on no one.

**Risks.** `R-13`, `R-14`, `R-15`, `R-11`.

### `OL-09` - Hospital messaging, documentary interoperability profiles and application launch in clinical context
*`[CONDITIONAL]` · seventeenth position, not datable by the project*

**Why it is not in `RU-1`.** Because all three require a **counterparty with a test environment**. A hospital messaging adapter written without a real integration engine to test against is an adapter that works on examples; a documentary interoperability profile declared without a connectivity test is a statement; application launch in clinical context without a counterparty server is self-simulation.

**What the project can do alone, and what it cannot.** It can publish the contract, contract tests in both directions and synthetic data. **It cannot** declare conformity: the informational loss in the translation between formats **must be measured, not presumed**, and measurement requires real messages from a real counterparty.

**Completion criteria.**

1. There exists at least one counterparty with which connectivity has been tested end-to-end, with outcome recorded and the informational loss in the translation **measured and declared**.
2. No forbidden conformity formula appears in the produced material ([`V-133`](../11_registri/01-vincoli-in-vigore.md#v-133)).
3. The identifier type code in the legacy channel is **contractual with the integrator** and documented as such, not presented as conformity to a table.

### `OL-10` - Development kit in two languages
*`[INTENTION]` · eighteenth position · owner: **project***

**Why it is not in `RU-1`.** Because it is **convenience, not capability**: the versioned application interface and contract tests are sufficient to complete a first integration, and a kit preceding interface stabilisation would be rewritten.

**Why it is so far down.** Because a development kit is a **third public contract** to maintain for the support period - after the project's own interface and the facade of `OL-16` - with its own dismissal cadence and its own notice period. Under `D54` every additional public contract is recurring capacity subtracted forever from development ([01 §9](./01-principi-e-metodo.md)).

**Completion criteria.**

1. The kit is **generated** from the versioned interface descriptor, not written by hand: a divergence between kit and interface is impossible by construction, not avoided by discipline.
2. Every example in the kit is **verified in continuous integration**; an example that does not compile or does not run causes build to fail.
3. The kit contains no domain logic: if a rule lives in the kit, the same rule is not applied by the server and constraint [`V-164`](../11_registri/01-vincoli-in-vigore.md#v-164) is violated.

### `OL-11` - Own modules for agenda, invoicing and invoicing
*`[INTENTION]` · nineteenth position · owner: **project***

**Why it is not in `RU-1`.** Because the project's reference use case is integration with a system that **already** has an agenda: `RU-1` receives the appointment by reference and does not become the reference data.

**The constraint that governs this item.** `D14` is explicit: own modules exist but are **disableable and replaceable by configuration**, and when a module exists from the region or the integrator the system **integrates instead of duplicating**. A module of its own that cannot be switched off is not a module of its own: it is imposed duplication.

**Completion criteria.**

1. Each own module is **switchable off per configuration** and, switched off, the path functions integrally through the interface of the replaceable corresponding module.
2. The complete functional suite runs **twice**: once with own modules active, once with all replaced by test implementations. Both pass.
3. No capability is available **only** with the own module active: the matrix of capabilities in the two configurations is identical, and verification is automatic.

### `OL-12` - Autonomous invoicing context
*`[INTENTION]` · twentieth position · owner: **contracting party**, then project*

**Why it is not in `RU-1`.** Because it is a declared deferred decision to the contracting party (`C-1`) and **a deferred decision is not taken in a change proposal**.

**Why it is in the queue and not amongst the desirable.** Because its absence has a declared and non-zero cost: while invoicing is not an autonomous context, the prohibition that the payer profile is administrative by construction ([`V-166`](../11_registri/01-vincoli-in-vigore.md#v-166), `OUT-18`) is a **code convention**, verifiable only with a dedicated test and subject to erosion, instead of being a **boundary** verifiable automatically. The risk is not that the system today does the wrong thing: it is that in a future version an event destined for settlement acquires a reference to a clinical document without anything preventing it structurally.

**Completion criteria.**

1. The prohibition is verified by a **dependency rule** that causes build to fail, not by a test that can be forgotten to update.
2. The event destined for settlement carries service identifier, administrative outcome and amount, **and nothing else**: a negative test attempts to add a clinical reference and fails.

### `OL-13` - Scores of validated scales and questionnaires
*`[CONDITIONAL]` · twenty-first position · owner: **`COMP`***

**Why it is not in `RU-1`.** For a precautionary measure in force and motivated: the licensing regime of the instruments is not verified (`B-3`, [`Q-11`](../11_registri/02-questioni-aperte.md#q-11)), validated scales and questionnaires have their own distinct licences from those of the terminologies, and verification must be done **instrument by instrument on the primary licence**, not on the declaration of the container that comprises them.

**Why the precautionary measure is in the right direction.** Because it is **reversible without migration**: the system conserves the questionnaire response, with reference to an immutable version of the instrument; adding the calculation later on already-conserved responses is possible. The reverse order is not.

**The two caveats this item carries with it.** The first: if the calculation will be introduced, the boundary with interpretive purpose must be evaluated, because **a score calculated by the system is closer to that boundary than a conserved response** - and is one of the three features a single story from class elevation. The second: the content of the instruments is not in the distribution and is configuration data per tenant, loaded by whoever installs.

**Completion criteria.** The first is conformity and precedes all the others: **there exists a regime determination for each admitted instrument**, verified on the primary licence and recorded. Without that, the technical criteria are not examined.

### `OL-14` - Selective concealment of audio-video content
*`[INTENTION]` · twenty-second position · owner: **`COMP`**, then project*

**Why it is not in `RU-1`.** Because it is declared not present in the first version and is registered as a reopenable exclusion with normal product governance ([`Q-157`](../11_registri/02-questioni-aperte.md#q-157)). **It depends moreover on `OL-03`**: without session recording there is no audio-video content to conceal.

**Why the problem is structurally rare.** Two elements of the project reduce its frequency at the root: recording is **an exception and not a rule**, disabled by default at every level and with specific consent per session; and for service types marked non-recordable the function is **absent and not disableable even by an administrator**.

**What remains to be decided before building it.** Whether partial release - audio of the requesting party alone - satisfies the person's instance, or whether case-by-case assessment must anyway be documented. It is a conformity determination, not a product one.

---

## 5. What is only desirable

None of the items that follow is planned. None has a position, a criterion or a trigger. Each declares **what is missing for it to become planned**, which is the sole useful information to whoever reads.

### `DS-01` - Real-time subtitles

**Why it would be desirable.** It would remove the sole accessibility non-conformity the project declares, and would render unnecessary the alternative measure of `OL-02`.

**What is missing.** A transcription engine, which is a component with three unresolved implications: **sovereignty** - no mandatory dependency outside the Union is admitted ([`V-01`](../11_registri/01-vincoli-in-vigore.md#v-01)), and engines with the required quality are predominantly remote services; **licence** - a model must be placed in the regimes of the policy on third-party content like any other content; **qualification** - a subtitle is a vehicle of communication, but a transcription that summarised, corrected or normalised clinical content would not be, and `D55` renders the boundary tighter, not wider.

**What the project has done anyway.** The subtitles data channel is **defined and versioned in the protocol**, as `D24` requires. Inserting an engine in future requires no redesign of the session.

### `DS-02` - Languages beyond Italian and English

**Why it would be desirable.** The decree on regional infrastructures requires multilingual, and the internationalisation architecture is planned from the start.

**What is missing.** Who translates and who **maintains alignment**. With two languages the integrity obligation of `D50` already doubles the marginal cost of every documentary modification; with three it triples, **forever**, and under `D54` that cost rests on one person. Before adding a language it must be demonstrated that the divergence control between the two existing does not produce findings stably **on the entire corpus and not only on prerequisite areas**: it is the condition that `T-09` closes, and until it is closed this item cannot even be evaluated.

### `DS-03` - Native application for mobile devices

**Why it would be desirable.** Access to device capabilities not available to the browser, and more reliable notifications.

**What is missing, and why it is not a technical decision.** An artefact distributed through an application distribution channel has **its own regime**: two distribution chains, two update cycles, two surfaces to monitor, and an intermediary that decides whether and when a security update reaches the user - which is in direct tension with a remedy service level expressed in days ([`V-185`](../11_registri/01-vincoli-in-vigore.md#v-185)). The project's requirement is **mobile first on the web**, not a native application.

### `DS-04` - Graphometric signature and reading of the health card from a local reader

**Why they would be desirable.** They are recurring capabilities in the integrator profile the project is designed for.

**What is missing, and why probably it will not arrive.** They are precisely the capabilities that **the integrator already has**, and `D14` is explicit: where a module of the integrator exists, the system integrates instead of duplicating. Building them would mean building a second time something that the destination system possesses, with its own hardware, device drivers and support surface. They would become plannable only for an adopter without a system of origin, that is for the use case on which the project is **not** designed.

### `DS-05` - Aggregated clinical dashboards and population indicators

**Why they would be desirable.** A structure delivering services at a distance wants to measure its own service.

**What is missing, and what the boundary is.** The **service** indicators - volumes, administrative outcomes, availability, connection quality - are already measured and are not this item; their presentation is `OL-19`. What is missing, and is desirable and together dangerous, is **clinical** aggregation: it verges on secondary use of data, which has its own legal bases and paths, and verges on the production of new clinical information. For it to become plannable, a boundary determination is needed first, not a dashboard specification.

### `DS-06` - Federation among distinct installations

**Why it would be desirable.** It would permit a specialist-to-specialist consultation between two structures using two separate installations without either having to host the other.

**What is missing.** A **trust model between installations**, which today does not exist: the project's trust register is per tenant, not between installations, and its extension would bring with it a hierarchy of attestations, withdrawal among different administrative domains and an allocation of responsibility today not even formulated. It is the item farthest in this list.

### `DS-07` - Offline mode for clinical content

**Why it would be desirable.** Operational continuity in conditions of absent network.

**Why it is not planned, and the reason is declared as a limit.** Limit 17 of [03 §9](./03-primo-rilascio-utilizzabile.md) is a **choice**, not a lack: clinical content on a device the data controller does not control is a risk the project does not assume. The sole variant that could become plannable is temporary local storage of a **measurement entered without connectivity**, which is data produced by the care recipient and not clinical content from elsewhere, and is already a requirement in the context of `OL-01`.

---

## 6. Why this queue has this form, in three observations

**First - and the conclusion has inverted from the earlier version of this chapter.** Before `D53`, nine items out of fourteen did not depend on project capacity but on decisions of others, and the declared consequence was that **increasing capacity would not shorten the queue**. After the cuts, the queue contains **twenty-two items, and twelve depend solely on capacity**: they are the items exited from `RU-1` by effect of `D53` and `D54`, which by definition have no other obstacle but one person's time. **The conclusion is therefore opposite and must be stated with the same clarity: today increasing capacity shortens the queue, and before it did not.** It is the most significant programme effect of scope reduction, and is an argument that belongs to the contracting party, not the planner.

**Second - the first three positions are not functions.** `OL-22`, `OL-15` and `OL-21`: the first is the acquisition of roles, the third is a layer of assurance of an already-present component. They stand there because their absence produces a **loss that repeats at each release**, and no other function has this property. A queue ordered by visible functional value would have placed them at the bottom, and that is precisely the error that criterion 2 of [01 §3](./01-principi-e-metodo.md) exists to avoid.

**Third - no item in this queue removes the limit of use.** Not even all together. **Today the product bears no CE marking**, is covered by no conformity declaration, and is not usable for the delivery of healthcare services to actual patients. That the project intends to assume the role of manufacturer (`D58`) is internal planning with its own calendar in [02 §5](./02-traguardi.md), **it is not a marking date and must not be cited as such** ([`V-171`](../11_registri/01-vincoli-in-vigore.md#v-171), [`V-280`](../11_registri/01-vincoli-in-vigore.md#v-280)). A queue of functions is not a conformity path, and presenting it as such would be the costliest error in the entire document.

---

## 7. What returns in no release

It is not a part of this chapter: it is a reference, and must be read as such.

The definitive exclusions live in [`docs/03_functional/07-fuori-perimetro.md`](../03_functional/07-fuori-perimetro.md), each with identifier `OUT-nn`, reopenability category and **how it is verified**. They include clinical interpretation in every form, threshold inference, calculated triage, verification of drug interactions, direct dialogue with home medical devices, emergency channel, biometric recognition, identity reconciliation index, mediation of payer access to the dossier and retention in accordance with regulation.

Four clarifications regarding this queue and not that chapter:

1. **An exclusion of category `NORM` is not reopenable while the source is in force.** It does not enter this queue, does not enter the desirable, and a request to do so is not a function proposal: it is a request to violate a source.
2. **An exclusion of category `QUAL` requires a documented regulatory impact assessment, and the assessment precedes the effort estimate.** The order is binding, because estimating first makes an apparently economical modification one involving a conformity re-assessment. **With `D58` the re-assessment is ours**, and the order weighs more.
3. **Three features are a single story from class elevation** - alarm on threshold, image processing, assisted reporting - and are under change control. A proposal touching them is not a function proposal: it is a proposal to modify the device.
4. **`D55` adds a permanent prohibition**: no function may be added if it shifts the system towards **clinical real-time**, and the assessment must be made **before** writing the function. It applies to every item in this queue, and in particular to `OL-01`.

---

## 8. How an item changes category

The transitions admitted are four, and each has a verifiable condition.

| From | To | Condition | Who ascertains it |
|---|---|---|---|
| Desirable | Planned | There exist together: binary completion criterion, declared trigger, named owner ([`V-187`](../11_registri/01-vincoli-in-vigore.md#v-187)) | Review of [00 §8](./00-indice.md) |
| Planned | Desirable | The trigger has lapsed and is not replaceable | Review, with reason recorded |
| Planned | Out of scope | A conformity determination or a decision by the contracting party excludes it | `COMP` or contracting party, with new `OUT-nn` item |
| Out of scope | Planned | The procedure of [`docs/03_functional/07-fuori-perimetro.md`](../03_functional/07-fuori-perimetro.md) §7, with cost proportionate to category | According to category |

To these is added, after `D53`, a fifth transition that did not exist before and must be declared because it generated six of the twenty-two items - `OL-15`…`OL-20`:

| From | To | Condition | Who ascertains it |
|---|---|---|---|
| **Scope of first release** | **Planned** | A **reversible** cut registered in [03 §5.2](./03-primo-rilascio-utilizzabile.md), with its `TG-nn` item, its consequence for whoever installs and its position in this queue | The document itself: the transition is complete and registered, not pending |

The other two new items - `OL-21` and `OL-22` - **do not follow this transition**, and the difference is the one §9 repeats: they follow from **irreversible** cuts, do not restore the lost period, and what they render available counts **from subsequent releases onwards**.

**What is not admitted, and is the part that counts.** An item does not pass from desirable to planned because someone has requested it insistently, because it appears in a specification or because it was cited in a presentation. It passes when it has the three elements of [`V-187`](../11_registri/01-vincoli-in-vigore.md#v-187). And **an irreversible cut does not become a queue item**: `OL-22` and `OL-21` do not restore the lost period, and their texts say so explicitly.

---

## 9. What this chapter does not promise

- **It does not promise that the order will not change.** It promises that every variation passes through the review with reason recorded, and that a bypass without verified trigger is a declared violation and not a silent reorganisation.
- **It does not promise a date for any item.** None. The `[CONDITIONAL]` items depend on third parties; the `[INTENTION]` items depend on a declared capacity that until 30 November 2026 is **wholly committed** by the plan of chapter [02](./02-traguardi.md).
- **It does not promise that every item arrives.** A queue in which every item arrives is a queue in which none has been evaluated. §8 describes exactly how an item exits.
- **It does not promise that everything cut returns in full.** The reversible cuts of [03 §5.2](./03-primo-rilascio-utilizzabile.md) return as items in this queue; the four irreversible cuts of §5.3 **do not return**, and what items `OL-22` and `OL-21` restore counts from subsequent releases onwards, never for the `RU-1` period.
- **It does not promise that the sum of items renders the product usable on actual patients.** It does not, and no configuration renders it so.

---

**Continues in**: [05 - Risks and dependencies](./05-rischi-e-dipendenze.md), where the risks cited in this chapter - and the external dependencies on which ten items out of twenty-two depend - are described with probability, impact on calendar, anticipatory indicator, response and owner.

