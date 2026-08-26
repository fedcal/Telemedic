---
title: Actors and roles
sidebar_position: 2
description: "Catalogue of Telemedic actors with objective, legal capacity, activities, necessary data and real constraints of time, digital literacy, device and network; enabling relationships, separation between technical and clinical role, non-human actors and actor × capability matrix."
---

# Actors and roles

An actor, in this catalogue, is not "a system user". It is **a subject pursuing a determined objective, in a determined capacity, with determined constraints**, and from which permissions flow that do not exist unless demanded by an activity. The criterion is necessity: a permission without an activity to justify it is a design defect, not a convenience.

The description of each actor comprises four elements that are missing from the majority of specifications, and whose absence is the reason remote healthcare systems fail in real use rather than in testing:

- **the time they actually have available** - a doctor between two video consultations has ninety seconds, not "the time necessary";
- **the digital literacy that can be presumed** - which for the reference population of remote monitoring is low, and must be designed as the normal state rather than the limiting case;
- **the device they actually operate on** - mid-range smartphone from four years ago, not the development workstation;
- **the network they actually have** - mobile, intermittent, with varying bandwidth within the same session.

These four constraints are not context: they are **requirements**, and project decision D25 makes them an acceptance criterion for every screen. A functional requirement that cannot be completed by an elderly patient on a smartphone with mobile network, and by a professional with only a keyboard and a screen reader, is not satisfied.

## 1. How to read the catalogue

Each entry reports: frozen identifier, capacity, primary objective, activities, strictly necessary data, authorisation constraint that follows from it, and real exercise constraints. The identifiers `ATT-01` … `ATT-19` come from the research phase and cannot be renumbered; `ATT-20` … `ATT-26` are introduced here and from this point are themselves frozen.

A linguistic clarification that applies throughout the document. **Actor, role and person are three different things.** The person is the physical subject. The role is a **relationship between a person and an organisation, with temporal validity**, not a permanent attribute of the person: the same doctor has distinct roles in distinct organisations, with distinct permissions and distinct schedules. The actor is the functional figure that this catalogue describes, and a person can embody more than one on the same day. Modelling the specialty or profession as a user attribute is the mistake that breaks multi-tenancy at the first customer with two sites.

## 2. Actors who receive the service

### ATT-01 - Patient

**Capacity**: recipient of the healthcare act; holder of data; in the majority of cases also the subject providing consent.

**Primary objective**: receive the service without technology becoming a barrier. Not "use the platform": the patient has no interest in the software, and every requirement formulated assuming the contrary is wrong from the start.

**Activities**: preventive technical check; reading of information notice and manifestation of consent; entry into virtual waiting room; participation in session; upload of documents; manual entry of measurements and responses to questionnaires if enrolled in remote monitoring; consultation and download of own documents; cancellation and rescheduling; consultation of access register to own data.

**Necessary data**: their own, and nothing else. No capacity to search on other subjects, no access to the internal clinical diary of the facility.

**Authorisation constraint**: access limited to their own `Patient` resource and to resources that reference it, with the level of identity guarantee required by the tenant for the document category (`BR-018`).

**Real constraints.** This is the actor on whom all the risk of service failure concentrates. It must be designed assuming: mid-range mobile device, often shared; mobile network with varying bandwidth; no familiarity with the distinction between browser and search engine; no ability to interpret a technical error message; only one chance of success before giving up and telephoning the facility; possible undisclosed visual, hearing, motor or cognitive impairment. From this flow, as requirements and not as recommendations: single pathway without initial choices, technical test within the pathway and not as an option, instructions specific to the detected browser and operating system, telephone fallback declared in advance, no installation required, large text and commands by default.

### ATT-02 - Carer

**Capacity**: person who provides ongoing assistance to the patient. **Assisting is not representing**: a carer does not provide consent on behalf of a capable patient, in any configuration (`BR-062`).

**Primary objective**: enable the patient to receive the service, and understand what must be done next.

**Activities**: technical assistance to the patient before and during the session; presence in session if permitted; receipt and understanding of instructions; entry of measurements on behalf of the patient when the plan provides for it; management of home devices.

**Necessary data**: the subset of patient data **explicitly delegated**, with scope and expiry.

**Authorisation constraint**: derived access, with mandatory expiry and revocable at any time by the patient; no capacity to provide consent as substitute.

**Real constraints.** The carer is often an adult child who works, contactable in restricted time windows, who assists **more than one person**. From this flow two requirements that are not obvious: the context of the assisted subject must be permanently visible and unambiguous, and changing the subject requires explicit confirmation (`RF-264`) - entering a measurement on the wrong patient is a documented dangerous use scenario, not a theoretical hypothesis. The carer also needs their own access link and written instructions for whoever assists, different from those intended for the patient.

### ATT-03 - Legal representative

**Capacity**: guardian, administrator of support, exerciser of parental responsibility. These are three figures with different powers and must be kept distinct: the guardian substitutes the will of the represented person, the administrator of support has powers **delimited by the appointment decree** that may or may not include healthcare decisions, the parental responsibility exerciser decides for the minor taking account of their opinion on grounds of age and maturity.

**Primary objective**: decide for the represented person, within the limits of the title.

**Authorisation constraint**: the scope of powers is a registered attribute and **verified by act**, not a generic qualification (`RF-117`). Attainment of majority by the patient automatically suspends access by the representative and imposes new delegation configuration (`RF-118`). Treating the administrator of support as a guardian is the most frequent mistake in the domain and produces invalid consent.

## 3. Clinical actors

### ATT-04 - Specialist provider physician

**Primary objective**: deliver the act and produce a report safely, within the time available.

**Activities**: executability and appropriateness assessment of the channel; admission from waiting room; patient identification; session conduct; sharing of documents; decision to degrade, interrupt or refer to in-person care; closure with typed outcome; production and signing of report; activation of emergency procedure.

**Authorisation constraint**: access subordinate to an **active or recent care relationship**; access outside the relationship exists but is exceptional, motivated, time-limited and notified (`RF-019`).

**Real constraints.** Delivers twelve video consultations in one morning. Has requirements **opposite** to those of the patient: information density, keyboard shortcuts, no courtesy screens, no unsolicited modal windows during the act. Clinical information must already be present at the time of admission, not after. Every additional mandatory field must be justified: in the real domain unnecessary mandatory fields are filled with false values, degrading data quality more than their absence would improve it. Must be assumed to operate also from a shared workstation and sometimes from a mobile device between consulting rooms.

### ATT-05 - General practitioner, freelance paediatrician

**Particular capacity**: holder of the continuous relationship of trust with the patient. Is the **natural recipient of clinical communication** even when not the provider, and must be modelled as recipient, not just as user.

**Specific functional relevance**: the *setting* of delivery changes the rules. The video consultation scheduled and delivered directly by the primary care physician or freelance paediatrician **does not require a prescription** and is concluded with digital annotation in place of a report (DM 30 September 2022, Annex B, section "Modalities of delivery"). The model must represent the *setting* as a discriminant of rules (`RF-349`), not as a descriptive label.

### ATT-06 - Consulting physician

**Primary objective**: respond to a clinical question on transmitted material, without entering into the taking of the case.

**Authorisation constraint**: access **punctual and limited to the act**, circumscribed to only the documents attached to the question and with expiry after the response (`BR-014`). This is the substantial difference from normal clinical access and must be implemented as an ephemeral scope, not as a hand-managed exception.

### ATT-07 - Nurse

**Primary objective**: deliver remote care, prepare the session, conduct remote monitoring operatively.

**Activities**: verification of prerequisites; therapeutic education; collection and validation of parameters; remote care; taking charge of clinical alarms according to plan; proactive contact with silent patient.

**Authorisation constraint**: no write access to medical reporting; authority to sign limited to own professional acts. The documentary visibility matrix of Annex 3, § 5.2 of DM 19 November 2025 is finer than presumed: the **report of specialist services for the video consultation is not accessible in consultation to nurse and midwife**, whereas the collaborative report of the teleconsultation and the clinical-care concluding report of the remote care are. This is an authorisation rule to implement and test, not an organisational convention.

### ATT-08 - Psychologist, psychotherapist

**Non-overridable domain constraint**: if the type of service is marked non-recordable, the recording function is **absent**, and its enablement is refused even to an administrator (`BR-075`). Session notes carry the maximum confidentiality level and are excluded from aggregated summaries of the facility.

### ATT-09 - Rehabilitation professional

**Functional constraint**: services live within an **individual rehabilitation plan**; there are no isolated sessions (State-Regions Agreement 18 November 2021, rep. acts no. 231/CSR). Modelling telerehabilitation as a single contact loses the cycle and makes it impossible to measure programme adherence.

### ATT-20 - Professional responsible for the remote monitoring plan

> **Identifier introduced by this area. Frozen.**

**Capacity**: qualified professional who, within the scope of an existing case being taken, decides enrolment, drafts the plan, **sets individual thresholds** and is clinically answerable for them.

**Primary objective**: keep the patient in compensation by detecting deterioration in the useful window, without generating an alarm load that the service is unable to sustain.

**Activities**: eligibility assessment on four dimensions (clinical, technological, autonomy and literacy, context); drafting and signing of remote monitoring plan; definition of parameters, cadences, time windows, thresholds, rules of behaviour in case of violation and exit items from the channel; periodic revision of plan; conclusion of pathway with typed motivation.

**Necessary data**: clinical picture of the patient within the scope of the case being taken; time series of parameters; outcomes of alarms generated on own plan; adherence indicators.

**Authorisation constraint**: is the only role that can set or modify an individual threshold. Modification produces a **new version of the plan**, with author, motivation, effective date and state of the previous; no plan value is modifiable in place.

**Real constraints.** Drafts the plan following a consultation, under time pressure, and is exactly the moment when a preset value would be confirmed by inertia. This is the reason the threshold field starts **empty and mandatory** and pathway references appear attributed and read-only, with an explicit copy action (`RF-240`, `RNF-104`). The difference between "showing an attributed reference" and "pre-filling a field" is invisible to the code writer and decisive for whoever is answerable.

### ATT-21 - Case manager

> **Identifier introduced by this area. Frozen.**

**Capacity**: figure of ongoing coordination of the case being taken, frequently a nurse. Is listed among the essential micro-services of remote monitoring by DM 19 November 2025, Annex 3, § 4.1.

**Primary objective**: be the patient's stable point of contact and first line of response to clinical alarms.

**Activities**: monitoring of progress; taking charge of alarms within deadline; scheduled contacts; proactive contact in case of unexplained silence; activation of responsible professional when the case exits own competence; therapeutic education and reinforcement of adherence.

**Authorisation constraint**: access to clinical content limited to patients of the plans for which they are case manager; **cannot modify thresholds**; can record own assessment and close the alarm with typed outcome within plan provisions.

**Real constraints.** Manages dozens of patients simultaneously and is the recipient on whom alarm fatigue descends. From this the requirement, far from decorative, of a **configurable ceiling of alarms per recipient and per shift** and the measurement of alarm outcomes (`RF-290`): an alarm load that cannot be acted upon reduces the capacity to respond to the alarm that matters, and this is a documented mechanism of harm production, not a comfort issue.

### ATT-22 - Service centre operator

> **Identifier introduced by this area. Frozen.**

**Capacity**: **technical** role. DM 21 September 2022 expressly separates the service centre from the delivery centre and attributes to each a category of alarms: to the service centre the tasks of maintenance, account management, help desk for all users, distribution and sanitisation of home devices, and management of **technical alerts**.

**Primary objective**: keep the measurement chain functioning, so that residual silence is informative.

**Activities**: taking charge of technical alarms; replacement and calibration of devices; assistance to patient on use; connectivity verification; reporting of systemic failures.

**Authorisation constraint**: **no access to clinical content**, in any form. The separation is not an organisational convention: it is an authorisation constraint to implement and test (`BR-166`). The attempt to compose a technical role that includes clinical read permissions is refused with a validation error, as already provided for administrative roles (`BR-012`).

**Real constraints.** Operates on shifts, often in extended coverage, and receives alarms from many tenants if the platform is delivered as a managed service. Needs to know **which patient**, but not **why they are in care**: the technical view shows the device status, not the clinical condition.

### ATT-23 - Delivery centre operator

> **Identifier introduced by this area. Frozen.**

**Capacity**: **healthcare** role. Manages **clinical alerts** and service delivery. In the authorisation model is the clinical counterpart to `ATT-22` and the two do not overlap.

**Authorisation constraint**: clinical access within the limits of the care relationship; **does not depend on technical shift to be reached**. An escalation chain that, outside service centre hours, can no longer reach a clinical role is a broken chain, and must be detected as such (`RF-281`).

### ATT-25 - Care pathway drafter and approver

> **Identifier introduced by this area. Frozen.**

**Capacity**: multidisciplinary working group and body formally adopting the diagnostic-therapeutic care pathway with an act - regional resolution, company resolution, health director decree.

**Primary objective**: make the adopted pathway executable in the system without this requiring a new software version.

**Activities**: drafting of pathway as structured data; publication with version, scope and effective date; withdrawal and replacement with a later version; consultation of process and outcome indicators calculated on instances.

**Authorisation constraint**: can publish pathways only within the scope of own responsibility; **in no case can set individual thresholds**, which belong to the individual plan. The pathway proposes and attributes its own references; the individual plan directs.

**Real constraints.** Is not a technical figure. The language for describing the pathway must be sufficiently expressive to represent activities, cadences, decision points, responsibilities and criteria, and sufficiently restricted to not become an arbitrary programming language executed in production. An incoherent pathway - unreachable node, cadence without unit, threshold without parameter - is refused **at publication**, with a message comprehensible to whoever drafted it, not when a patient passes through it (`RF-231`).

### ATT-26 - Patient and carer trainer

> **Identifier introduced by this area. Frozen.**

**Capacity**: professional who delivers training on device and interface use, provided as an essential micro-service of remote monitoring by DM 19 November 2025, Annex 3, § 4.1.

**Functional relevance**: the outcome of training is an **activation precondition** registered, not an administrative compliance. A patient activated without completed training and without technical verification of device functioning generates a stream of false absence alarms from day one itself (`RF-242`, `RF-243`).

## 4. Administrative and governance actors

### ATT-10 - Front-office operator

Is the actor who **absorbs all the failures of others** and is the best early indicator of system problems. Their principal tool is not an appointment list but a **view of the day's risks**: technical test not executed or failed, preliminary activities incomplete, missing consents, unverified contacts.

**Authorisation constraint**: no access to clinical content. Sees *that* there is an appointment, not *why*. Is the actor most exposed to authorisation errors, because the temptation to show them "just a bit of clinical context" to help them work better is constant and must be refused by construction.

### ATT-11 - Structure administrator

Configures users, roles, schedules, catalogues, customisation, local policies. **Does not access clinical content by virtue of role**, and assignment to themselves of a clinical role generates an audit event of critical severity with notification to the data protection officer (`BR-013`).

### ATT-12 - System administrator

Manages the installation. Is designed as a role **structurally lacking access in clear to clinical content**, with operations always traced and, for critical ones, dual control. No impersonation function exists that enables operation as a clinical user (`RF-015`): it is not disabled, it does not exist.

### ATT-13 - Data protection officer

Reads **audit and metadata, not content**. Every read by them is itself recorded (`BR-094`). Receives notifications of access in derogation and reviews the queue.

### ATT-14 - Health service management and service manager

Governs quality and volumes on **aggregated and pseudonymised statistics**, with minimum cardinality threshold and protection from deduction by difference between successive queries (`BR-090`, `RF-201`). Receives two indicators that in this area are qualified as **safety indicators** and not as technical metrics: the rate of failure to respond to alarms and the outcome of alarms generated (`RNF-095`, `RNF-096`).

### ATT-16 - Auditor, inspection body

Read-only, at time window, with signed and pseudonymised export when sufficient.

## 5. Third parties admitted to the session

### ATT-17 - Learner, observer

Admitted with **specific prior consent** of the patient, revocable at any time without consequences on delivery (`BR-067`). No access to documents, no persistence, presence visible to all participants. The patient must not suffer the teaching.

### ATT-18 - Interpreter, cultural mediator

As above, with active audio channel. Is a third party who accesses healthcare data: require legal basis, documented confidentiality constraint and registration of entry and exit times (`BR-066`). For hearing disabilities the sign language interpreter is a **full participant**, not an interface accessory.

## 6. Non-human actors

They are actors in every respect: they have objectives, capabilities and limits, and their omission from the catalogue is the most common cause of excessively broad authorisations.

### ATT-15 - Technical integrator

**Application principal**, not user. Has own keys, own webhooks, own frequency limits and own customisation configuration. Application credentials **do not alone confer access to clinical data**: every clinical operation requires a verifiable delegating user context, represented by the delegation and never by impersonation (`BR-017`, decision D18). A compromised key must not become indiscriminate access.

### ATT-24 - Measurement acquisition gateway

> **Identifier introduced by this area. Frozen.**

**Capacity**: third-party system that collects measurements from home devices and transmits them to Telemedic. The scope of the project is **ingestion from a third-party gateway**, plus manual entry by patient or carer, plus structured questionnaires: **the project does not communicate directly with medical devices** and does not assume responsibility for accuracy of the hardware measurement chain (decision D21).

**Functional objective**: deliver measurements that are attributable, dated twice (measurement instant and reception instant), with provenance, units and device status.

**Authorisation constraint**: application principal with scope limited to ingestion on own tenant; no capacity to read clinical content; no capacity to generate, take charge of or close alarms.

**Real constraints, and the reason this actor is delicate.** The gateway is the point at which the system loses control of data quality. Can deliver late, out of order, in duplicate, with different units than expected, or stop delivering without reporting it. From this flow four requirements that are not negotiable with the gateway supplier but are **defences of the receiving system**: idempotence on a declared identity criterion (`RF-260`), mandatory separation of the two instants (`RF-254`), measurement unit verification at the boundary (`RF-256`) and detection of absence independent from gateway declaration (`RF-293`). The periodic presence signal and the device status telemetry are requested from the gateway, but their absence cannot disable surveillance: `[NV]` on the actual capacity of market gateways to expose an independent presence signal from measurement - open question toward the integration area.

### ATT-19 - External monitoring system

Observes the health status of the platform on a separate endpoint, with non-identifying technical metrics and no access to patient identifiers.

## 7. The authorisation model, briefly

The system adopts **roles for capabilities, attributes for scope**. The fact that a user is a "doctor" says nothing about *which* patient they can see: a vigent enabling relationship is needed. The decision is made by a point of evaluation with default *deny*, and access to clinical data is allowed **if and only if** four conditions simultaneously occur (`BR-010`):

1. the atomic permission is included in the subject's roles;
2. there exists a **vigent enabling relationship** between subject and patient;
3. no manifestation of will of negative type covers the resource (suppression, revocation);
4. the tenant context of the subject coincides with that of the resource.

The recognised enabling relationships, with the duration governing their vigency, are: appointment of care, contact delivered, active care episode, consultation scope, primary care, voluntary delegation, legal representation, access in derogation. This area adds two, proper to remote monitoring, and freezes them:

| Relationship | Condition of existence | Duration | Effect |
|---|---|---|---|
| `MONITORING_PLAN` | the professional is author or clinical referent of an active remote monitoring plan | whilst the plan is active, plus the pathway retention period | access to the plan's series, thresholds and generated alarms |
| `CASE_MANAGEMENT` | the professional is the designated case manager in the plan | whilst the designation lasts | taking charge of alarms, proactive contact, reading series; **no modification of thresholds** |

Neither confers access to the patient's entire dossier: the scope is the plan, not the person.

## 8. Actor × capability matrix

Summary of distinctive capabilities introduced by this area. `●` full capability, `◐` capability limited to the indicated scope, `-` capability absent by domain constraint, not by configuration.

| Capability | ATT-01 Patient | ATT-02 Carer | ATT-20 Plan resp. | ATT-21 Case manager | ATT-22 Service centre | ATT-23 Delivery centre | ATT-25 Pathways | ATT-24 Gateway |
|---|---|---|---|---|---|---|---|---|
| Propose enrolment | - | - | ● | ◐ proposal | - | ◐ | - | - |
| Set or modify individual threshold | - | - | ● | - | - | - | - | - |
| Publish population pathway | - | - | - | - | - | - | ● | - |
| Activate plan | - | - | ● | ◐ on plan delegation | - | ◐ | - | - |
| Enter measurement | ● own | ◐ by delegation | ◐ | ◐ | - | ◐ | - | ● by ingestion |
| Declare measurement invalid | ● own | ◐ by delegation | ● | ● | - | ● | - | - |
| Declare scheduled unavailability | ● | ◐ by delegation | ● | ● | - | ● | - | - |
| Take charge of clinical alarm | - | - | ● | ● | - | ● | - | - |
| Take charge of technical alarm | - | - | - | ◐ visibility | ● | ◐ visibility | - | - |
| Read clinical content | ● own | ◐ by delegation | ● plan scope | ● plan scope | - | ● care scope | - | - |
| Close pathway with motivation | - | - | ● | ◐ proposal | - | ◐ | - | - |
| Modify declared coverage hours | - | - | - | - | - | ◐ proposal | - | - |
| See current coverage status | ● | ● | ● | ● | ● | ● | ● | - |

The last row is deliberate: **coverage status is visible to all**, including patient, at all times and not only at enrolment. This is the safeguard against false reassurance, and is treated as a safety requirement in [05 - Alarm management](05-gestione-degli-allarmi.md).

## 9. Actor modelling mistakes that this catalogue excludes

1. **A single type of "user" with a `role` field.** Produces authorisations that are evaluated with a chain of conditions, impossible to verify and to prove.
2. **Profession as person attribute.** Breaks multi-tenancy and makes unrepresentable the doctor with roles in two organisations, which is the normal case and not the exception.
3. **The carer modelled as "patient with reduced permissions".** Loses the distinction between assistance and representation, and eventually produces invalid consent.
4. **Service centre and delivery centre merged into an "operator" role.** Violates a separation that is imposed and not organisational, and opens clinical access to a technical shift.
5. **Measurement gateway treated as part of the system.** Shifts to the project a responsibility for accuracy of the measurement chain that the project has explicitly excluded, and breaks the intended purpose delimitation.
6. **The integrator treated as a user.** Produces clinical calls without verifiable delegating user context, that is, access to healthcare data without an identifiable responsible subject.
7. **The absence of the "whoever responds to the alarm" actor.** Is the costliest omission: an alarm without an identifiable recipient *at that moment* is not an alarm, it is a register.
