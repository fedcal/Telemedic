---
title: State and limits
sidebar_position: 5
description: "The actual state of the project without softening: what exists today, what does not yet exist, the declared limits, the consciously accepted tensions and what whoever adopts it must know before deciding."
---

# State and limits

This is the chapter to read first if you are evaluating an adoption, and last if you are seeking a reason to be enthusiastic. It contains no softening.

> **A declared limit is a feature of the product; a limit discovered in production is an
> incident.** It is the criterion with which this chapter is written, and the same with which all
> the documentation is written.

## 1. The limit that precedes all others

**The software is not usable for the delivery of healthcare services on real patients.**

It is not editorial caution: it is the condition declared by `D16`, and remains true for every
distributed artefact as long as a marking does not exist appended by a manufacturing subject
who assumes responsibility for it. **Today the product bears no CE marking** and is not covered
by any declaration of conformity.

The project **has decided to assume in its own right the role of manufacturer** (`D58`), which amends
the previous decisions in the part that attributed the path to an undefined external subject.
It must be read for what it is and not for what it appears: **the legal entity is still to be established and formalised**, the establishment is an internal prerequisite with its own timeline, and the intention does not change the state of fact of the product. **In no project document is written a date by which the product will be marked**, and it will not be: internal planning does not become a promise just because it is ours, and the promise of a dated regulatory outcome produces an effect that the intention does not (constraint [`V-171`](../11_registri/01-vincoli-in-vigore.md#v-171)).

The limit has three properties that whoever evaluates the product tends to underestimate:

1. **It is not removable for configuration.** No parameter, no profile, no licence,
   no contractual agreement with the project changes it.
2. **It is verifiable.** Every artefact bears the declaration of non-marking, and its absence
   prevents publication.
3. **It does not transfer with the licence.** Whoever integrates the software in a commercial
   product and places it on the market **is manufacturer by law**, independently of what is
   written in the licence - and independently of whether the project intends to certify its own
   distribution.

The complete declaration of intended purpose and limits of use is in
[`NOT-A-MEDICAL-DEVICE.md`](https://github.com/fedcal/Telemedic/blob/main/NOT-A-MEDICAL-DEVICE.md);
the distinction between what the project publishes and what someone puts into operation is in
[`DISTRIBUTION-POLICY.md`](https://github.com/fedcal/Telemedic/blob/main/DISTRIBUTION-POLICY.md).

## 2. The picture

Every row is verifiable by opening the repository. The state is that ascertained at the time
this chapter was written.

| Area | State |
|---|---|
| **Mandatory public declarations** (`D51`) | **Present**: [`NOT-A-MEDICAL-DEVICE.md`](https://github.com/fedcal/Telemedic/blob/main/NOT-A-MEDICAL-DEVICE.md), [`DISTRIBUTION-POLICY.md`](https://github.com/fedcal/Telemedic/blob/main/DISTRIBUTION-POLICY.md), [`THIRD-PARTY-TERMINOLOGY.md`](https://github.com/fedcal/Telemedic/blob/main/THIRD-PARTY-TERMINOLOGY.md), `LICENSE`, `NOTICE`, [`CONTRIBUTING.md`](https://github.com/fedcal/Telemedic/blob/main/CONTRIBUTING.md), [`GOVERNANCE.md`](https://github.com/fedcal/Telemedic/blob/main/GOVERNANCE.md), [`SECURITY.md`](https://github.com/fedcal/Telemedic/blob/main/SECURITY.md), [`CODE_OF_CONDUCT.md`](https://github.com/fedcal/Telemedic/blob/main/CODE_OF_CONDUCT.md) |
| **Guide to fundamentals** (`D35`, twenty-one modules) | **Seventeen modules present**. Missing are modules `16` (project architecture), `18` (area → required knowledge matrix), `19` (glossary), `20` (primary sources) |
| **Overview** (`docs/00_overview/`) | This area |
| **Technical area** (`docs/01_technical/`) | **Complete**: ten chapters |
| **Architecture area** (`docs/02_architecture/`) | **Complete**: ten chapters |
| **Functional area** (`docs/03_functional/`) | **Complete**: eight chapters |
| **Protocols area** (`docs/04_protocols/`) | **Complete**: eleven chapters |
| **Domain area** (`docs/05_domain/`) | **Complete**: ten chapters |
| **Security area** (`docs/06_security/`) | **Complete**: eleven chapters |
| **Integration area** (`docs/07_integration/`) | **Complete**: eleven chapters |
| **Compliance area** (`docs/08_compliance/`) | **Complete**: ten chapters |
| **Roadmap** (`docs/09_roadmap/`) | **Complete**: six chapters |
| **Register of architectural decisions** | **Thirty entries** plus index |
| **Documentation website** | **Scaffolding present**: generator configuration, sidebar definition, verification workflows and publication, internationalisation files for **interface strings only**. **No documentary content translated** |
| **Complete English version** (`D3`, `D50`) | **Absent**. No chapter of `docs/` exists in English |
| **Application code** | **Absent.** No source file of the service or the interface |
| **Software build chain** | **Absent** for application software. Workflows exist that verify the documentary body - editorial controls, guard against licensed terminologies, secret scanning, bill of materials for the website, divergence between Italian and English - and generate the bill of materials for the website only |
| **Development capacity** (`D54`) | **A single contributor, on part time.** It is no longer a hypothesis: it is the datum on which all estimates are built |
| **Manufacturing subject** (`D58`) | **To be established.** The decision to assume the role is taken; the legal entity does not exist |

> **Reading note.** The table of the state of fact in
> [`docs/09_roadmap/00-indice.md`](../09_roadmap/00-indice.md) §4 photographs a moment prior
> to this area's writing and reports the overview and compliance area as absent, and the register
> of decisions as twenty-four entries. The two pictures do not contradict each other: they are
> dated differently. But **an undated picture grows old in silence**, and it is the form of
> error that this area has imposed on itself not to produce: the sole seat and its automatic
> generation are open as question [`Q-202`](../11_registri/02-questioni-aperte.md#q-202).

### 2.1 The two readings that matter

**The first.** The project has an extensive body of documentation and **no software**. The area registers declare counts ranging from about twenty-one thousand to about fifty thousand words per area, for a total on the order of hundreds of thousands of words.
The exact count has not been executed, and the values declared in the registers are estimates from line density; verification by the overview area is needed `[NV]`. The exact count is itself an activity to be put to plan, because it is the multiplier of the obligation of complete translation imposed by `D50`.

**The second.** The original sequence (`D52`) required completing **all** documentation, building the bilingual website and publishing it before any line of software. It has been **amended**:
`D53` confirms the **first usable release on 30 November 2026**, and `D56` establishes that complete English translation **is no longer a prerequisite to every line of code** and proceeds in parallel, with an automatic control of divergence between Italian and English. The prerequisites remain non-negotiable, because their cost of omission is unrecoverable: the mandatory public warnings, the guide to fundamentals and the compliance and security areas.

The amendment **does not soften** constraint [`V-183`](../11_registri/01-vincoli-in-vigore.md#v-183) for the areas that remain prerequisite, and does not eliminate the consequence that matters: **with the capacity declared by `D54` - a single contributor on part time - the scope of the first release reduces to what that capacity can build and verify in the available time.** No third way exists, and a scope not reduced under this decision simply produces a missed date in public.

### 2.2 What can legitimately be done today

Four uses, all real and all compatible with the limit in §1:

| Use | Why it has value |
|---|---|
| **Technical, security and compliance evaluation** | The documentation is the artefact on which a security officer, a data protection officer or a procurement committee verify the statements instead of believing them |
| **Planning an integration** | The contracts, the modalities, the integrator obligations and the known traps are written before the code exists, which is the useful order for whoever must plan |
| **Basis for whoever intends to certify** | The regulatory package is written as an operational manual for the manufacturer, and the retroactively unrecoverable activities are already set up |
| **Contribution** | The guide to fundamentals exists because contribution does not presuppose a healthcare nor IT background |

What it **is not**: a commercial product, a demonstration, an installable prototype.

## 3. What does not yet exist, in order of impact

**The application code.** It does not exist, and its absence is the reason why every statement of this documentation about services, capabilities and behaviour is **specific and verifiable** and not attestation. The distinction is declared in every area.

**The build chain.** It must **precede** the first line of application code, not accompany it (constraint [`V-182`](../11_registri/01-vincoli-in-vigore.md#v-182)): it is what generates the bill of materials and the register of requirement identifiers, and without it the traceability required by IEC 62304 cannot be reconstructed afterwards (`D45`). The sole admitted exception is the disposable code of empirical verifications, declared as such, in a separate area, that enters no distributed artefact.

**The English version.** `D50` imposes Italian and English **in full**, not summaries, and `D56` sets the way: assisted translation, **one area at a time**, with automatic divergence control. The real risk is not the missing translation: it is the **divergence between the two versions**,
which in regulatory matters produces two documents saying different things about the same obligation. The divergence control exists already in the verification workflows and is **deliberately not blocking**
as long as the three areas required by `D56` are not completely translated: it becomes blocking at the moment the last one is completed, because a control that cannot fail is theatre and letting it permanently indulgent is the fastest way to become accustomed to ignoring it.

**Four modules of the guide to fundamentals** - the `16` on project architecture, the `18`
on the matrix area of code → required knowledge, the `19` glossary, the `20` on primary sources. It is not a gap like the others: the guide is **a declared prerequisite of
[`CONTRIBUTING.md`](https://github.com/fedcal/Telemedic/blob/main/CONTRIBUTING.md)** and `D56` places it among the three non-negotiable prerequisites of translation,
so the four modules stand on the critical path of two distinct commitments. Two weigh more than the others: the **glossary**, because it is cited by multiple areas and because its alignment to the national glossary of telemedicine must be accomplished **before** translation - a divergence discovered after propagates on two languages (question [`Q-146`](../11_registri/02-questioni-aperte.md#q-146)) -; and the **18**, because it is the document that tells a contributor what they must know before touching an area. Question [`Q-201`](../11_registri/02-questioni-aperte.md#q-201).

## 4. The declared limits of the first release

The exact scope is in
[`docs/09_roadmap/03-primo-rilascio-utilizzabile.md`](../09_roadmap/03-primo-rilascio-utilizzabile.md).
The composition criterion is declared: the **narrowest possible complete vertical path** is delivered, not the broadest possible set of functions. The chosen path is **scheduled remote consultation (televisita)**, from the appointment received by reference until the clinical document validated and returned to the system of origin, because it crosses the greatest number of cross-cutting constraints with the fewest third-party dependencies.

From this descends a list of limits that is well to read as such and not as a list of functions arriving:

| Limit | Nature |
|---|---|
| Only one service type: **scheduled televisita** | Release scope. telemonitoraggio, teleconsulto, teleconsulenza and teleassistenza are in the product scope but not in the first release scope |
| **Two participants** to the session | Topology beyond two participants is a declared deferred decision, and is not marginal: the interpreter is the declared alternative measure for the known accessibility non-conformity |
| **No session recording** | Release scope. The indicator and its prohibitions already exist in the model |
| **No conferment to documentary infrastructures** | External dependency not available: document models are missing, not the project ([`Q-07`](../11_registri/02-questioni-aperte.md#q-07)) |
| **Latency from objective to screen not guaranteed** | Depends on camera, processing, screen, network and buffer state. The system **measures** it, records it and informs: does not promise it |
| **No offline modality for clinical content** | Declared choice, motivated by the risk of clinical content on a device the data controller does not control |
| **No key rotation during the session** | **Does not exist in the technology.** Is not claimed |
| **Real-time captions absent** | Declared non-conformity on an accessibility criterion, with alternative measure and data channel nonetheless defined in the protocol |
| **Event ordering guaranteed only within partition** | No functional requirement can depend on global ordering |
| **Event delivery at least once** | Consumers are idempotent by construction, with explicit deduplication key |
| **Number of tenants per installation** | Not measured, declared order of magnitude: hundreds. Measurement, to be verified by the technical area `[NV]`, is a release activity, not an estimate |
| **No broker redundancy** in the single-node arrangement | Loss of the broker means **delivery delay, not loss of events**: the source of truth is the transactional outbox |

Two entries deserve a note, because that is where misunderstandings concentrate.

**Interface performance thresholds are not declared.** Not from reticence: because the
**reference device has not yet been declared** (question [`Q-115`](../11_registri/02-questioni-aperte.md#q-115)), and without device the requirement is not verifiable. The device is not that of whoever develops: it is a mid-range apparatus some years old, which is what the reference population has in hand.
Publishing a threshold not measured would be writing it by preference.

**No technical threshold of the project is conformity.** No Italian source imposes technical thresholds: the project's values are product specification and declared limits (constraint [`V-12`](../11_registri/01-vincoli-in-vigore.md#v-12)).
Whoever reads a number in this documentation must not read it as a requirement of law satisfied.

## 5. The tensions consciously accepted

They are the points where the project renounced a desirable property for another, and where the
cost was declared instead of hidden. They are listed here because **a hidden tension becomes a surprise**.

### 5.1 Session recording against end-to-end encryption

They are **incompatible**, and the incompatibility is not technically resolvable: a component that
records must be able to decrypt, and a flow decrypted at an intermediate point is not encrypted end-to-end.

The choice was to **declare it** instead of claiming the property anyway, which would have been
false and would have been the type of defect that destroys the credibility of the entire system. From this descends an architecture with two modes: default mode **without recording**, with media encrypted end-to-end, routed directly when the network permits, and voice key verification; mode **with recording**, activatable only with explicit consent for the single session, in which media transits through the recording component.

The obligations that ensue are non-negotiable: the consent informative **explicitly declares**
that the session is no longer end-to-end encrypted; the interface signals the recording state
**persistently and non-hidably** for the entire duration; the transition between the two modes
is traced; the material is encrypted at rest with keys per tenant and has **expiry always valued**.

The residual cost, declared: recording is **exception and not rule**, disabled by default at every level, and for service types marked as non-recordable the function is **absent and not disactivatable even by an administrator**.

### 5.2 Class IIa accepted instead of avoided

The project could have remained outside medical device qualification by renouncing automatic
threshold evaluation. **It did not**, because that function is what makes remote monitoring a
healthcare service instead of an archive of numbers.

The cost is declared in full: a notified body is needed; the quality management system must be
**certified**, not merely implemented; a clinical evaluation with its own documentary path is needed. And the limiting factor is not development: it is the availability of notified bodies, with documented queues and contracting staff in decline.

The counterpart, equally declared: **the scope exclusions hold together the risk classification at
IIa and the software safety class at B. They fall together, and the cost sums.** (constraint [`V-170`](../11_registri/01-vincoli-in-vigore.md#v-170)). This is why a function on the out-of-scope list is not evaluated on technical merits.

### 5.3 Intention to certify against state of fact of product

It is the most delicate tension to communicate, because the two terms easily blur and the blur
always favours whoever reads hastily.

The project produces technical file, lifecycle documentation, risk management and usability
engineering, and **has decided to assume in its own right the role of manufacturer** (`D58`).
This means the activities previously attributed to a third party - establishment of the subject, nomination of the person responsible for regulatory compliance, contacts with notified bodies, start of the clinical evaluation plan - are of the project and have their own calendar time.

**It means nothing more.** The legal entity does not exist yet; the product today bears no marking; whoever installs an uncertified version assumes in any case the obligations that ensue, and **the fact that the project intends to certify in future transfers none to them**.
Letting it be understood would be more harmful than silence.

The tension accepted is therefore this: **the project declares an intention without declaring a date**, and accepts that this be less reassuring than a calendar. The reason is that a public calendar on a regulatory outcome is, itself, a regulatory statement: the prohibition on misleading statements **does not presuppose marking**, and a missed date on this ground is not a delay, it is a statement that turned out false.

A clarification must be added that the project had already put in writing and that `D58` makes even more relevant: the qualification of the repository as simple source code is **factual, not perpetual**. It depends on the fact that the project does not make available a ready-to-use product in the framework of a commercial activity. At the moment this changes, the qualification also changes, and the documents must be rewritten **before** the change, not after.

### 5.4 Apache-2.0 does not protect from the injured party

Sections 7 and 8 of the licence exclude warranties and liability **between the parties to the licence**.
This **does not extend to the injured person**: art. 15 of Directive (EU) 2024/2853 prohibits the
contractual exclusion or limitation of liability to the injured party, and art. 10 provides a
presumption of defectiveness in case of non-conformity to mandatory safety requirements laid down
by Union law.

Whoever puts this software into operation in a clinical context assumes the consequences toward
patients. No licence clause changes this fact.

### 5.5 Documentation before code, and the date that was confirmed

The initial sequence is motivated - retroactively unrecoverable activities are not recovered, and
in healthcare undocumented software is not installable - but the cost is real and must be stated:
**more than halfway through the declared horizon no software exists**.

The tension was brought to the sponsor with three argued options, and the recommendation of the
orchestration was to move the first usable release to an independent milestone of the following year.
**The sponsor decided otherwise** (`D53`): the 30 November 2026 milestone remains the first usable release, and the decision is not relitigated.

This is a tension accepted with open eyes, and the way it is managed is declared instead of hoped:
**scope is reduced, not optimism increased**. With the capacity of `D54` - a single contributor on part time - the roadmap area is required to explicitly declare what enters, what is cut and which cuts are reversible. Whoever evaluates the project should read that document **before** reading the list of capabilities: a scope not reduced under this decision simply produces a missed date in public, and it is the most concrete programme risk in existence today.

### 5.6 The immutable register costs availability

Writing to the register's primary archive is **blocking**: its failure causes the application operation
to fail. The accepted and declared consequence is that **register unavailability is system unavailability for clinical operations**. The alternative - recording in non-blocking mode - would mean that access to healthcare data can occur without trace, which is precisely what the requirement excludes.

A residual declared vulnerability window remains: the entries between two anchorings of cumulative
hash, only in the hypothesis of collusion between the two administrators with separated privileges.

### 5.7 Deterministic routing against node resilience

The signalling session is routed deterministically to the node that owns it, because delivery of
the candidates requires «exactly once and in the same order» and a dissemination mechanism without
persistence does not guarantee it. Mode of failure **declared and not hidden**:
the fall of a node terminates the hosted sessions, which are re-established with renegotiation.
Migrating the state would cost more than renegotiation, and gradual draining is placed as a
requirement for planned updating.

### 5.8 Opaque tokens against latency and criticality of the gateway

Tokens to the outside are opaque because revocation must have an instant as answer, not an interval.
The cost is that the gateway becomes a **critical component to make redundant**, that latency changes, and that integrators accustomed to an inspectable format find friction. It is documented friction **with motivation**, otherwise it is read as arbitrary limitation.

### 5.9 Full functionality without SNOMED CT, with the cost written

The system is fully functional with the costly terminology system disabled, and no main pathway
can require it (constraint [`V-03`](../11_registri/01-vincoli-in-vigore.md#v-03)). The cost is declared: some thousands of codes on the value constraint for the reason of contact **are not validated**. The verification is not a declaration: the complete functional suite runs with the disactivation active.

It must also be said that the project cannot do more: the licence clause that requires the
content not be accessible except to authorised users is **incompatible with a public repository**, and the sub-licence chain is incompatible by construction with the project's licence.
Two warnings remain on whoever installs, and are in
[`THIRD-PARTY-TERMINOLOGY.md`](https://github.com/fedcal/Telemedic/blob/main/THIRD-PARTY-TERMINOLOGY.md):
querying an external terminology service **does not excuse the licence obligation**, and whoever distributes a product incorporating Telemedic distributes a product subject to that licence even without containing a single concept.

### 5.10 Own replaceable modules against product consistency

Reporting, agenda and billing exist as own modules **and** are disactivatable and replaceable for
configuration, because the decree prohibits realising a dedicated module where the regional module
exists. The tension is evident: a product whose parts can be replaced has more contract surface,
more combinations to test and less control over the final result. The answer is the test suite that
always exercises **at least two tenants and two distinct integrators** with deliberately divergent configurations, including sets of replaced modules that differ (constraint [`V-188`](../11_registri/01-vincoli-in-vigore.md#v-188)).

### 5.11 A single contributor against registrations requiring distinct subjects

It is the tension declared by `D54`, and it is the one that **no amount of individual work resolves**, because it is not a problem of hours but of different people.

Some registrations required by a quality management system - internal audit, release review, configuration verification performed by someone who did not write the code - **presuppose distinct subjects and are not producible internally** by a single contributor. The consequence must be accepted formally and not worked around: it must be established which subset is accepted as declared risk and which is covered by acquiring the function from outside. It is question [`Q-189`](../11_registri/02-questioni-aperte.md#q-189), open to the sponsor.

It must be stated in this place and not only in the compliance area, because it is information
that changes the evaluation of whoever adopts: a project that declares it intends to certify with
a single contributor is also declaring together an intention and a structural constraint to its
fulfilment.

## 6. The most weighty open questions

A declared open question is worth more than an invented answer. The complete register is in
[`.telemedic/context/05_BACHECA_INTERAGENTI.md`](https://github.com/fedcal/Telemedic/blob/main/.telemedic/context/05_BACHECA_INTERAGENTI.md); these are the ones whose outcome changes something for whoever is evaluating.

**Four questions that weighted heavily were closed by the sponsor on 25 August 2026** and no longer figure among the open ones: [`Q-180`](../11_registri/02-questioni-aperte.md#q-180) (milestone of 30 November 2026, closed by `D53`), [`Q-181`](../11_registri/02-questioni-aperte.md#q-181)
(declared capacity, closed by `D54`), [`Q-144`](../11_registri/02-questioni-aperte.md#q-144) (freezing of the intended purpose of remote monitoring, closed by `D55`), [`Q-182`](../11_registri/02-questioni-aperte.md#q-182) (model of production of the English version, closed by `D56`). The consequences of each are taken in the paragraphs above.

| Question | Why it weighs |
|---|---|
| [`Q-189`](../11_registri/02-questioni-aperte.md#q-189) - continuity of contributors and registrations in distinct roles | Determines which part of the quality system is producible internally and which must be acquired from outside (§5.11) |
| [`Q-185`](../11_registri/02-questioni-aperte.md#q-185) - alignment of the public page to the approved reformulations | Every day of exposure is a day of an unsustainable statement, and **a period of publication is not cancelled**: the impact is unrecoverable, not delayable |
| [`Q-07`](../11_registri/02-questioni-aperte.md#q-07) - document models of the record typologies | Not publicly available. Blocks conferment, not design |
| [`Q-115`](../11_registri/02-questioni-aperte.md#q-115) - device and viewport of reference | Without it no interface performance threshold is verifiable |
| [`Q-170`](../11_registri/02-questioni-aperte.md#q-170) - form of publication of the trace of intended purpose | A document titled «intended purpose» published under the project's name is precisely the material from which a third party can derive it |
| [`Q-172`](../11_registri/02-questioni-aperte.md#q-172) - versioning of the identified distribution | Must be decided **before** the first release: a subsequent renumbering is a discontinuity of identification, and in a registered device it is not remedied with a release note. With `D58` it becomes a project decision, not a third party's |
| [`Q-186`](../11_registri/02-questioni-aperte.md#q-186) - declared support period | Without the duration, the version dismissal plan is not publishable and is **prerequisite of the first distribution**, not a queue item |
| [`Q-187`](../11_registri/02-questioni-aperte.md#q-187) - admitted concentration on a single integrator | The test constraint guards the **form**, not the **drift of priorities**, which occurs in steps each locally reasonable and is observable only in review |
| [`Q-11`](../11_registri/02-questioni-aperte.md#q-11) - licences of validated clinical scales and questionnaires | While it remains open, the system preserves the responses and **does not calculate scores**, precautionarily and reversibly |
| [`Q-200`](../11_registri/02-questioni-aperte.md#q-200) - adoption of `D57` and `D58` in the constraints and areas | Two constraints in force and various areas still carry the previous attribution. A partial rewrite would produce **two coexisting attributions**, which is worse than one that is superseded |
| [`Q-201`](../11_registri/02-questioni-aperte.md#q-201) - the four missing modules of the guide to fundamentals | Stand on the critical path of two distinct commitments: the prerequisite to contribution and the prerequisites to translation of `D56` |
| [`Q-202`](../11_registri/02-questioni-aperte.md#q-202) - sole seat of the picture of the state of fact | A picture written by hand in two locations diverges, and these two have already begun |

## 7. What whoever adopts must know before deciding

Eight points. If even one of them is incompatible with the context of whoever reads, it is better to know now.

1. **It is not usable on real patients** until a manufacturer apposes a marking. The
   project intends to assume that role (`D58`) but the subject does not exist yet and **no date is declared**. If the manufacturer must be whoever adopts, the path is long and the limiting factor is not development.
2. **No code exists yet**, and the declared capacity is **a single contributor on part time** (`D54`). What is evaluated today is documented design, not
   implementation, and the scope of the first release is constrained by that capacity.
3. **The first release will contain only one service.** Whoever needs remote monitoring right away
   must know it, and it is the first item in the subsequent queue.
4. **Some capabilities will never arrive**, and not for priority: they are product exclusions with
   declared reopenability category. A payer's access to the record is not reopenable as long as the
   source is in force.
5. **A list of installation assumptions must be satisfied**, and includes infrastructure
   requirements - egress network isolation, privilege separation between archives, custody of the
   root key - that are not options.
6. **Some obligations remain entirely the responsibility of whoever adopts**, and no contractual
   clause shifts them: impact assessment, notification to authorities, plan approval, role of service provider to the identity federation.
7. **No date is declared for a regulatory outcome.** Whoever seeks a date for CE marking, accreditation with the identity federation or conformity to national security measures will not find it, and its absence is deliberate: for the last two because the milestone
   **is not the project's** (constraint [`V-180`](../11_registri/01-vincoli-in-vigore.md#v-180)); for marking because internal planning does not
   become a promise just because it is ours (`D57`, `D58`).
8. **This documentation is not controlled documentation.** No chapter is a procedure of a
   quality management system or a document of a technical file: the chapters are
   **inputs** (constraint [`V-174`](../11_registri/01-vincoli-in-vigore.md#v-174)).

## 8. How this chapter remains true

Three rules, each with a practical consequence.

**The picture is updated, not embellished.** A missed date remains in the chronology with its cause: it is the only basis on which the next estimate can be better than the previous one. A date is not moved without moving the criterion or declaring the cause; «ninety per cent complete» is not declared, because completion criteria are binary by construction (constraint [`V-181`](../11_registri/01-vincoli-in-vigore.md#v-181)).

**What is not verified remains marked.** `[NV]` indicates a statement not verified on primary source, with the indication of who must close it. No `[NV]` survives the milestone it depends on, and in no case is a gap filled by inference.

**A public text can change the intended purpose of a product without touching a line of code.** It is the risk that no automatic verification intercepts: a modification to a public page does not pass code review, does not appear in a distribution bill of materials and does not cause any control to fail. This is why regulatory review of public texts before publication is provided for, with the table of prohibited formulas as a checklist (question [`Q-174`](../11_registri/02-questioni-aperte.md#q-174), constraint [`V-171`](../11_registri/01-vincoli-in-vigore.md#v-171)).

## Where to continue

- [`docs/09_roadmap/00-indice.md`](../09_roadmap/00-indice.md): the three classes of statement -
  commitment, intention, hypothesis - and the procedure by which the plan is updated.
- [`docs/09_roadmap/05-rischi-e-dipendenze.md`](../09_roadmap/05-rischi-e-dipendenze.md): the
  register of programme risks, each with early indicator and named owner.
- [`docs/03_functional/07-fuori-perimetro.md`](../03_functional/07-fuori-perimetro.md): the
  exclusions with identifier, reopenability category and verification.
- [`docs/08_compliance/09-percorso-e-calendario.md`](../08_compliance/09-percorso-e-calendario.md):
  the achievements to pursue for whoever certifies, in what order and with what prerequisites. **It is the sole seat of
  the dates** of the compliance area.
- [`docs/02_architecture/09-decisioni-rinviate.md`](../02_architecture/09-decisioni-rinviate.md):
  what is **not** decided, with the criteria for deciding it and the indication of who decides.
