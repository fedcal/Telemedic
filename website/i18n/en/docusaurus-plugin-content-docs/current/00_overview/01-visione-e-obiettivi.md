---
title: Vision and objectives
sidebar_position: 2
description: "What Telemedic is, the real problem it addresses, who benefits and the declared non-objectives: what the project decided not to be, with the reason for each renunciation."
---

# Vision and objectives

## 1. What it is, in a definition that does not promise

Telemedic is **source code and documentation** for the remote delivery of healthcare services, published under an Apache-2.0 licence in the public repository
[`github.com/fedcal/Telemedic`](https://github.com/fedcal/Telemedic).

It covers the four services that the Decree of 21 September 2022 (DM 21 settembre 2022), Annex A, identifies as **minimum services** that a regional telemedicine infrastructure must deliver - *remote consultation (televisita)*, *specialist-to-specialist consultation (teleconsulto/teleconsulenza)*, *remote monitoring (telemonitoraggio)*, *remote assistance (teleassistenza)* - in the form and with the constraints that Italian sources give to each, not in the form that would be convenient to a software product.

Three clarifications must be made before anything else, because without them the previous sentence risks being read as other than what it is.

**It is not a product placed on the market.** **Today it bears no CE marking**, is not covered by any declaration of conformity and has not been submitted for assessment by a notified body.
As long as a marking does not exist, no distributed artefact is usable for the delivery of healthcare services on real patients (`D16`). The project **has decided to assume in its own right the role of manufacturer** (`D58`), but the legal entity that will exercise it **is still to be established
and formalised**: it is an internal prerequisite with its own timeline, and while it does not exist the state of fact of the product does not change. **In no place is it written that the product will be marked by a date**: the intention to certify and the promise of a dated regulatory outcome are two different things, and the second produces a regulatory effect that the first does not. The complete declaration is in
[`NOT-A-MEDICAL-DEVICE.md`](https://github.com/fedcal/Telemedic/blob/main/NOT-A-MEDICAL-DEVICE.md).

**As of 25 August 2026 no application code exists.** An extensive body of documentation exists,
the architectural decisions that sustain it exist, and not a single line of software for the
service or the interface exists. Chapter [04 - State and limits](./04-stato-e-limiti.md) exposes the picture without softening, and it is the chapter to read first if you are evaluating an adoption.

**It is not a product designed for a single interlocutor.** It is designed for a multiplicity of
integrators, and the multi-integrator property is verified by the test suite, not declared
(constraint [`V-188`](../11_registri/01-vincoli-in-vigore.md#v-188): every integration test exercises at least two tenants and two distinct integrators, with deliberately divergent configurations).

## 2. The real problem

Italian telemedicine does not need another video call platform. It needs software that addresses seriously four facts that almost no solution addresses in their entirety.

### 2.1 Services have regulatory definitions, not commercial ones

«televisita» and «teleconsulto» are not marketing labels. The Agreement between the State and Regions of
17 December 2020, rep. acts no. 215/CSR, Annex A, defines them verbatim, and from those
definitions descend consequences that a data model must be able to represent:

- the *remote consultation (televisita)* is **a medical act**: a nurse cannot deliver it, and the constraint is not
  configurable by the customer;
- the *remote consultation* delivered in outpatient specialist setting **must always conclude with a report**, while the *specialist-to-specialist consultation (teleconsulto)* «**does not give rise to a separate report**»;
- the *remote consultation* is reimbursed according to the regime of the corresponding service in person; the *specialist-to-specialist consultation* **is not reimbursed at all**.

A system that represents the four services with a single type and a discriminating field works as long as it does not have to answer the first serious question: who can deliver it, what document does it produce, who is responsible for it, is it billable. Chapter
[02 - The four services](./02-le-quattro-prestazioni.md) shows where the differences bite.

### 2.2 There exist specific documentary obligations, and they are recent

Decree of 19 November 2025, art. 7, introduced **ten new document typologies** of the Electronic Health Record dedicated to telemedicine, with information set defined in the Official Gazette (Annex 1). They are not variants of the report of outpatient specialist care: they are their own typologies, and using the wrong one is a conformity defect, not an inaccuracy
(constraint [`V-143`](../11_registri/01-vincoli-in-vigore.md#v-143)).

The project derives from this a structural choice: the information content of documents intended for the record is modelled as a **canonical dataset**, and the concrete serialisations are
**replaceable** and not hardcoded (constraint [`V-07`](../11_registri/01-vincoli-in-vigore.md#v-07)). It is the only form that survives the fact that the document models, the typology codes and the indexing metadata of those ten
typologies **are not yet publicly available** (question [`Q-07`](../11_registri/02-questioni-aperte.md#q-07), open).

### 2.3 There exists a third way for applications not from national schemes

Decree of 19 November 2025, art. 3, paragraph 4, allows Regions and Autonomous Provinces to
deliver telemedicine with applications different from those acquired in national procedures,
provided they comply with certified standards and feed the record. This is the reason why an independent project has room: it does not have to replace the national infrastructure, it must be able to talk to it.

### 2.4 Integration comes before functionalities

A telemedicine system that does not communicate with the management system already in use will not be adopted, however good it is. Hence the architectural constraint [`V3`](../11_registri/03-vincoli-fondanti.md#v3) - **every capability of the system must be reachable by a third party system via documented interface; no functionality is accessible only from the user interface** - and its operational corollary [`V-164`](../11_registri/01-vincoli-in-vigore.md#v-164): the area that introduces a capability introduces also the contract, and as long as the contract does not exist the capability is not complete.

Three properties descend from this that the integration area treats as project conditions and not as options: Telemedic **does not impose its own interface**, **does not impose its own
authentication**, **does not become the reference data** for patients, professionals and agendas.

## 3. The five choices that explain everything else

Whoever reads the documentation for the first time finds dozens of decisions. Five generate most of them.

### 3.1 The model must be able to tell the truth about what happened

It is the criterion stated at the opening of the domain area and applies to the whole system. A model that cannot distinguish a patient who did not attend from a patient who tried and failed to connect is not imprecise: it is false, and produces unjust charges. The outcomes
`EX-NOSHOW` and `EX-TECH-PATIENT` share the same terminal state and have **opposite** administrative effects, and no area can collapse them into a single field (constraint [`V-141`](../11_registri/01-vincoli-in-vigore.md#v-141)).

The same criterion generates other apparently disconnected rules: the signed clinical document is immutable and is corrected with a subsequent version; consent is a fact with temporal validity and not a boolean value; the role is a relationship between person and organisation with temporal validity and not an attribute of the person; **the absence of data is clinical information**
and silence is never treated as normality (constraint [`V-09`](../11_registri/01-vincoli-in-vigore.md#v-09)).

### 3.2 The boundary between recording and interpreting is the line that sustains the qualification

The system **transports, structures, signs and preserves** clinical content drafted by a professional. It does not **generate** it and does not **interpret** it. The positive formulation of the boundary,
which stands as a design criterion, is in the functional area:

> routing answers the question «is this channel adequate?», evaluation answers the question «what does this person have?». The first is a property of the service, and the service can know it. The second is a reserved act.

One declared exception exists, and it is the one on which the project has assumed its own
qualification: the **comparison of a measurement against the individual threshold set by a professional** and the generation of the resulting alert are within scope. What is excluded is that the system **sets** the threshold, **deduces** it from history or from the population, or
**interprets** the result of the comparison (`OUT-08`).

### 3.3 The intended purpose of telemonitoraggio is frozen on the narrowest formulation

A single sentence shifts the risk classification. «Real-time monitoring of vital parameters» brings to Class IIb and software safety class C; «deferred collection of parameters for the professional's periodic review» remains in Class IIa and class B. The difference is worth months and an order of magnitude of cost (`D46`).

The domain model is written **entirely** on the second formulation, and no project artefact -documentation, interface, public material, class name or event name - can use «real-time monitoring», «continuous surveillance» or equivalent formulas (constraint [`V-144`](../11_registri/01-vincoli-in-vigore.md#v-144)).
It is not editorial caution: it is the choice on which the entire downstream regulatory path depends. The **formal freezing was deliberate** (`D55`, which closes question [`Q-144`](../11_registri/02-questioni-aperte.md#q-144)), and from it descends a permanent ban: **no function can be added if it shifts the system toward clinical real time**, and the evaluation must be made before writing the function, not after.

### 3.4 Data sovereignty as a verifiable property, not as a slogan

Constraint [`V1`](../11_registri/03-vincoli-fondanti.md#v1) establishes that **no mandatory component of the main pathway depends on services that are not replaceable or established outside the European Union**. Three deployment profiles are documented and supported - European Union, Italian territory, qualified national cloud - and no runtime dependency can prevent the most restrictive profile (`D24`).

The reason this has stopped being a commercial argument is precise: the determination of the National Cybersecurity Authority no. 127437/2026, art. 18, obligates the subject of the network security rules **to nominatively declare its relevant suppliers to the authority**, with business name, tax identification number, **Country of registered office**, procurement codes and relevance criterion. The Country in which a component is established is therefore a datum that the customer must communicate, not an architectural preference (`D40`). The project provides, as an artefact, the record with the data that the customer is obligated to declare.

The same logic applies in the negative: the external terminology service, if established outside the Union, is a transfer at the moment it receives data referring to a patient. The project's answer is not to place it elsewhere but **never to send it patient identifiers** - sovereignty is satisfied by absence of datum (constraint [`V-151`](../11_registri/01-vincoli-in-vigore.md#v-151)).

### 3.5 Accessibility and design starting from the small screen are functional requirements

`D25` establishes this as a cross-cutting constraint of the whole system - patient interface, clinical interface, administration panels, embeddable component, documentation, error messages, notifications - and not as final finish. The operational acceptance criterion is verifiable:

> every functional requirement must be able to be completed by an elderly patient on a smartphone in mobile network, and by a professional with keyboard only and a screen reader. If it is not possible, the requirement is not satisfied.

A limit follows that whoever embeds the component must not violate: recording indicator while recording, consent notices, result of key verification, clinical error messages and encryption status indicator **are not themeable or hidden**, and a theme configuration that degrades contrast **is rejected on save**, not signalled as warning
(constraint [`V-163`](../11_registri/01-vincoli-in-vigore.md#v-163)).

## 4. Who benefits and in what way

Chapter [03 - Who it addresses](./03-a-chi-si-rivolge.md) treats each recipient at length, with what each obtains, what each must provide and what the project does not give them. Here the summary.

| Recipient | What the project offers them |
|---|---|
| **Healthcare facility** that delivers remotely | A system installable at its location, with reproducible deployment, immutable register, division of responsibilities declared line by line |
| **Healthcare professional** | A model that respects the boundaries of the professional act: no automatic closure of a contact, no deduced threshold, no pre-filled clinical content |
| **Patient and caregiver** | Paths designed for the small screen and the worst network, phone fallback, persistent declarations about what the service is not |
| **Integrator** | Four integration modalities, versioned contracts, twelve months' notice of dismissal, no imposition of interface, identity or demographics |
| **Regional entity or public sponsor** | Verifiable documentation instead of declarations, allocation tables to place alongside a specification, scope exclusions with identifier |
| **Whoever places a derived product on the market** | The regulatory package as usable material: technical file, software lifecycle, risk management, usability engineering, and especially retroactively unrecoverable activities already set up |

## 5. The non-objectives

This section has the same rank as the previous one. In a remote healthcare system, **what the software does not do is worth as much as what it does**, and for three distinct reasons: because a capability in more can shift the product's risk classification; because a service that appears to do something it does not do produces improper reliance, and the harm does not arise from what the system does but from what a person does not do because they trust it; because the scope is the boundary between what the project is responsible for and what whoever uses it is.

The complete list, with identifier `OUT-nn`, reopenability category and - above all -
**verification column**, is in
[`docs/03_functional/07-fuori-perimetro.md`](../03_functional/07-fuori-perimetro.md).
An exclusion that cannot be verified falls back through the window at the first delivery under pressure. Here the non-objectives are reported in the form in which they matter for whoever is evaluating the project.

### 5.1 Telemedic is not, today, a medical device - and does not promise to be one by a date

This non-objective is the one that has undergone the most important change, and must be read in full because it is easy to read it as the opposite of what it says.

**What changed.** The project **has decided to assume in its own right the role of manufacturer**
(`D58`), which amends the previous decisions in the part that attributed the certification path to an undefined external subject. The activities that were attributed to «whoever intends to certify» - establishment of the manufacturer, nomination of the person responsible for compliance with regulations, requests for information to notified bodies, start of the clinical evaluation plan - **are of the project**. The legal entity that will exercise them, however, **is still to be established**, and it is an internal prerequisite with its own timeline.

**What has not changed**, and must be said every time it serves:

1. **Today the product bears no CE marking** and is not covered by any declaration of conformity. It is a state of fact, not a position, and remains true while it does not change.
2. **Whoever installs, integrates or puts the software into operation assumes in any case the obligations that ensue.** That the project intends to certify in the future transfers nothing to whoever installs an uncertified version, and letting it be understood would be more harmful than silence.
3. **It is written nowhere that the product will be marked by a date.** It applies to documentation, public communication and presentation material. An internal plan does not become a promise just because it is the project's, and the promise of a dated regulatory outcome is precisely what the prohibition on misleading statements strikes (constraint [`V-171`](../11_registri/01-vincoli-in-vigore.md#v-171)).
4. **Responsibility to the injured party is not excludable by contract** (Directive (EU)
   2024/2853, art. 15). It holds now as before, and with more force since the intention to certify is the project's.

**What remains priority regardless.** Some activities are not recoverable afterwards
(`D45`) and their absence would make it impossible to certify subsequently, by anyone: freezing of requirement identifiers, inventory of third-party components and bill of materials generated from the first build chain, document control, declared separation between repository and distribution. They were priority when the manufacturer was an undefined third party; they are all the more so now that the manufacturer will be the project.

### 5.2 Telemedic does not want to be accredited with the national identity federation

An open-source project **cannot** be. The service provider within the meaning of the Presidential Decree of 24 October 2014, art. 1, c. 1, letter i), is whoever *delivers services on the network*, and the convention commits to declaring to the authority the list of active services: the service provider is **whoever installs**, never the project (`D36`, constraint [`V-05`](../11_registri/01-vincoli-in-vigore.md#v-05), `OUT-22`).

The objective is therefore a product **conformant and verifiable in continuous integration**, not an accredited installation. The difference is not nominal: the times of accreditation are not declared in any primary source, and declaring them would be inventing them.

### 5.3 Telemedic does not want to be the reference system for demographics

Patients, professionals, locations and appointments are already managed elsewhere. The system works **by reference**, with the identifiers of the attribution domain of whoever integrates, and does not implement an identity reconciliation index or automatic merges for similarity (`OUT-15`).
No external identifier is a primary key, and normalisation happens at the boundary, never in the domain (constraint [`V-142`](../11_registri/01-vincoli-in-vigore.md#v-142)).

### 5.4 Telemedic does not want to be the clinical archive of the facility

It does not perform compliant preservation and is not the primary clinical archive (`OUT-23`). The model explicitly provides a **mode of operation with non-preservation of clinical content**,
consistent with Decree of 19 November 2025, art. 12, in which regional infrastructures do not preserve the data and documents generated and conferment to the record is the responsibility of healthcare facilities.

### 5.5 Telemedic does not want to be an emergency channel

It does not call rescue and does not automatically alert them (`OUT-13`). What it does is **logistical, not clinical**: it makes immediately available to the professional the information they do not have because the patient is not in the same room - **the address where
the person is at that moment**, contact details, declared emergency contact. Hence a requirement that surprises whoever has not thought of the case: the address of service must be asked and confirmed at the start of every session, because the registered address is useless in an emergency.

Symmetrically, the project does not offer *remote consultation (televisita)* paths in contexts qualified as urgency or emergency (`OUT-19`): the Decree of 30 September 2022, Annex B, establishes that distant delivery «must not be a reason for delaying in-person intervention».

### 5.6 Telemedic does not want to be a clinical decision support system

It does not formulate diagnostic hypotheses, does not estimate clinical probabilities, does not produce prognosis, does not grade urgency with its own algorithm, does not suggest dosages or therapies, does not verify drug interactions, does not apply to images elaborations that modify their informational content for clinical reading purposes, does not pre-fill interpretative clinical content in the document, does not deduce thresholds, does not decide not to alert based on other clinical data (`OUT-01` … `OUT-09`).

The protection is not documentary: a proposal that introduces one of these functions **is not evaluated on technical merits, it is rejected for scope policy**, with written regulatory motivation (constraint [`V-170`](../11_registri/01-vincoli-in-vigore.md#v-170)). It also applies to the introduction of an artificial intelligence component, which is a regime change under regulation and not a technical choice.

### 5.7 Telemedic does not want to mediate a payer's access to the record

Art. 15, c. 4, of Decree of 7 September 2023 **always** excludes insurance companies from access to the Electronic Health Record, together with experts and employers. The use case in which a service is **paid** by a fund, mutual or policy remains fully valid: **the payer is not a consulting party** (`D48`, constraint [`V-08`](../11_registri/01-vincoli-in-vigore.md#v-08), `OUT-18`).

No authorisation scope, no event type, no replaceable module and no tenant configuration can constitute a pathway - direct or mediated by a professional - by which a payer obtains clinical content. The payer's integration profile is
**administrative by construction**: service identifier, administrative outcome,
amount (constraint [`V-166`](../11_registri/01-vincoli-in-vigore.md#v-166)). It is the exclusion **not reopenable** as long as the source is in force.

### 5.8 Telemedic does not want to distribute third-party content it cannot distribute

The repository does not contain and does not distribute contents SNOMED CT, ATC/DDD, ICD-10, ICD-11, CPT,
nor the documents of HL7 v2.x standards, IHE Technical Framework or DICOM standard. It refers to them only through the canonical URI of the coding system, the codes entered by the user and the terminology operations directed to an external service configured by whoever installs it. The conditions and consequences for whoever installs are in
[`THIRD-PARTY-TERMINOLOGY.md`](https://github.com/fedcal/Telemedic/blob/main/THIRD-PARTY-TERMINOLOGY.md).

The obligated corollary, which is not a makeshift: **the system is fully functional without SNOMED
CT** and no main pathway can require it (constraint [`V-03`](../11_registri/01-vincoli-in-vigore.md#v-03)). The cost is declared instead of being concealed.

With the same logic the project **does not distribute any service catalogue**, not even as an example: the structure of a catalogue entry is in the product, the content is tenant data.
Twenty-one independent regional cycles inside one product would mean a release cadence determined by others' administrative acts.

### 5.9 Telemedic does not want to build a revenue model on teleconsulto volumes

It is a regulatory fact, not a choice: *specialist-to-specialist consultation (teleconsulto)* is not an autonomous specialist service,
has no nomenclator entry, provides for no prescription at the expense of the national health service or patient contribution. A business model founded on the volume of *specialist-to-specialist consultations (teleconsulti)* in the national health service **has no direct source of revenue**, and no project material
can suggest otherwise.

### 5.10 Telemedic does not want to be the controlled documentation of a manufacturer

No chapter of `docs/` is a procedure of the quality management system or a document of the technical file, and no area can present it as such: the chapters are **inputs**,
they contain the analysis from which a controlled document is written (constraint [`V-174`](../11_registri/01-vincoli-in-vigore.md#v-174)). It is the point of junction of the entire model: the project can fill almost the entire technical file, except what presupposes a document control system of a manufacturer.

## 6. What the project forbids itself to say

Two lists of prohibited formulas are in force, and apply to every public artefact -
documentation, website, README, section title, interface description, error message, release note, response to a tender.

The first is technical in nature (constraint [`V-133`](../11_registri/01-vincoli-in-vigore.md#v-133), complete list in
[`docs/04_protocols/10-conformita-e-prove.md`](../04_protocols/10-conformita-e-prove.md) §2):
nothing «conformant» on maps that the specifications themselves qualify as informative; nothing
«standard» on headers that were never standardised; nothing «conformant to the Italian guide» without the version, which today is a draft; nothing «encrypted to the endpoints» without the condition of the mode without recording.

The second is regulatory in nature (constraint [`V-171`](../11_registri/01-vincoli-in-vigore.md#v-171), table in
[`docs/08_compliance/01-inquadramento-normativo.md`](../08_compliance/01-inquadramento-normativo.md)
§11): no text can assert or let it be understood that a non-existent conformity, marking or
certification exists. The foundation is that art. 7 and art. 2, point 12, of Regulation (EU)
2017/745 make promotional material **regulatory material**, and the prohibition on misleading statements **does not presuppose marking**.

To these are added three reformulations already in force on technical statements that the project has corrected instead of inherited:

| Discarded formula | Formula adopted |
|---|---|
| «peer-to-peer» as absolute property | «encrypted to the endpoints, **routed directly when the network permits it**» |
| «latency below 200 ms» as promise | metric **measured, recorded and notified**, with thresholds declared as product specification and never as conformity |
| «key rotation per session» | «cryptographic material generated anew for every session, without reuse». **Session rotation during the session does not exist in the technology and is not claimed** |

A fourth reformulation concerns the session quality index: it is **proprietary and must be declared as such**, because no average opinion score exists applicable to real time according to any international recommendation (constraint [`V-114`](../11_registri/01-vincoli-in-vigore.md#v-114)).

## 7. Why documentation came before code

The originally approved sequence (`D52`) provided that **all** documentation be completed, the website built with internationalisation and published before any line of software. It has been **amended** (`D53`, `D56`): the first usable release remains on 30 November 2026, complete English translation is no longer a prerequisite to every line of code and proceeds in parallel. The prerequisites remain non-negotiable, because their cost of omission is unrecoverable, the mandatory public warnings, the guide to fundamentals and the compliance and security areas.

The initial inversion was not a whim: it is the consequence of two facts.

The first is regulatory. Some activities are not recoverable afterwards: the traceability required by IEC 62304 cannot be reconstructed, requirement identifiers reused for a different requirement render the entire matrix unusable, inventorying third-party components afterwards costs many times as much, and what is born outside document control must be reissued
(`D45`). Hence constraint [`V-182`](../11_registri/01-vincoli-in-vigore.md#v-182): **no row of application code precedes the build chain** that generates the bill of materials and the register of identifiers.

The second is adoption. In healthcare software that is not documented is not installable. The documentation of integration, the division of responsibilities and the excluded scope are what a security officer, a data protection officer or a procurement committee read before looking at the code.

There is a cost, and it is declared: as of 25 August 2026 the project has an extensive body of documentation and no software, and available capacity is **a single contributor on part time** (`D54`).
Hence the obligation that descends from `D53` and is not an option: **the scope of the first release reduces to what that capacity can build and verify in the available time**, declaring what enters, what is cut and which cuts are reversible. Chapter
[04 - State and limits](./04-stato-e-limiti.md) exposes the picture and the tensions that ensue from it.

## Where to continue

- [02 - The four services](./02-le-quattro-prestazioni.md): what truly distinguishes
  *remote consultation (televisita)*, *specialist-to-specialist consultation (teleconsulto)*, *remote assistance (teleassistenza)* and *remote monitoring (telemonitoraggio)*, and what distinct obligations each carries.
- [03 - Who it addresses](./03-a-chi-si-rivolge.md): for each recipient, what each obtains,
  what each must provide, what the project does not give them.
- [04 - State and limits](./04-stato-e-limiti.md): the real picture, the declared limits and the
  tensions accepted knowingly.
- [`docs/03_functional/07-fuori-perimetro.md`](../03_functional/07-fuori-perimetro.md): the
  complete list of exclusions with the reopenability category and the verification of each.
- [`NOT-A-MEDICAL-DEVICE.md`](https://github.com/fedcal/Telemedic/blob/main/NOT-A-MEDICAL-DEVICE.md)
  and [`DISTRIBUTION-POLICY.md`](https://github.com/fedcal/Telemedic/blob/main/DISTRIBUTION-POLICY.md):
  the declared intended purpose and the distinction between what the project publishes and what
  someone puts into operation.
