---
title: The four services
sidebar_position: 3
description: "*remote consultation (televisita)*, *specialist-to-specialist consultation (teleconsulto)*, *remote assistance (teleassistenza)*, *remote monitoring (telemonitoraggio)*: what they are according to Italian sources, how they truly differ, what distinct obligations each carries and what notions of boundary are commonly confused with them."
---

# The four services

This chapter serves a single purpose: to make clear **why telemedicine services are not variants of the same thing**, and what concrete consequences flow from their differences.

It is not the complete treatment. The verbatim definitions, the regulatory chain and the per-service records are in the module
[`docs/10_fondamenti/02-prestazioni-di-telemedicina.md`](../10_fondamenti/02-prestazioni-di-telemedicina.md);
the state machines, the allowed actors, the typed outcomes and the modelling invariants are
in [`docs/05_domain/02-le-prestazioni-modellate.md`](../05_domain/02-le-prestazioni-modellate.md).
Here the explanation is **what changes from one to the other and why it matters**.

## 1. The first fact: telemedicine is a channel, not a specialty

Telemedicine is a **modality of delivery** of healthcare services at a distance. It is not a clinical discipline, not a department, not a type of service: it is the channel through which a service is delivered that, in the great majority of cases, already exists also in person.

The Agreement between the State and Regions of 17 December 2020, rep. acts no. 215/CSR, Annex A, states this verbatim:

> «for all healthcare services delivered at a distance, the national/regional regulatory framework that regulates access to the different Essential Levels of Care apply, the reimbursement/tariffication regime in force for the delivery of the same services in "traditional" modality, including the rules for any patient contribution.»

Translated: **there is no special legal regime for telemedicine**. There is the regime of the service, which applies also at a distance, with the addition of some specific obligations. This is why the project's catalogue of services carries **two native codings** - the code of the tenant's catalogue and the national code - and the remote modality is a **channel modifier**, not a different service.

## 2. The second fact: two taxonomies that do not coincide

It is the reef that a data model must clear first, and which almost nobody represents.

The **Agreement 215/CSR 2020** lists **five outpatient activities** - televisita, teleconsulto, teleconsulenza, teleassistenza, telerefering - plus **telecontrollo** and **telemonitoraggio**
as «operative modalities».

The **Decree of 21 September 2022**, Annex A, instead identifies **four «minimum services»** that the regional infrastructure must deliver: «televisita; teleconsulto/teleconsulenza;
telemonitoraggio; teleassistenza».

| Agreement 215/CSR 2020 | Decree 21 September 2022 | What changes |
|---|---|---|
| televisita | televisita | They coincide |
| teleconsulto | teleconsulto/teleconsulenza | **Unified** in a single minimum service |
| teleconsulenza | teleconsulto/teleconsulenza | **Unified** in a single minimum service |
| teleassistenza | teleassistenza | They coincide |
| telerefertazione | *(absent)* | **Disappears as autonomous service**: becomes the cross-cutting micro-service «reporting and digital signature» |
| telemonitoraggio (operative modality) | telemonitoraggio | **Promoted to minimum service** |
| telecontrollo (operative modality) | *(not listed among the minima)* | Remains operative modality, but is **billable service** |

**It is not possible to choose one.** The first taxonomy determines the legitimacy of the act and the report; the second determines admissibility in tender and the structure of micro-services. The project's catalogue of services therefore carries **two taxonomic attributes, not one**, and neither is derivable from the other.

From this descends the operational consequence easiest to get wrong, and it is stated as a rule because it is coded as a non-configurable domain constraint:

> **The professional constraint applies to the activity, not to the minimum service.**

*specialist-to-specialist consultation (teleconsulto)* and teleconsulenza stand in the same minimum service and have **different allowed actors**: the *specialist-to-specialist consultation* is amongst doctors, teleconsulenza is also allowed among non-medical healthcare professions. Authorising on the minimum service means authorising too much.

## 3. Synoptic framework

The columns of this table are the dimensions that truly change from one service to the other.
Every row in which two services diverge is a row which, if collapsed, produces a defect.

| | **televisita** | **teleconsulto** | **teleconsulenza** | **teleassistenza** | **telemonitoraggio** |
|---|---|---|---|---|---|
| **Act reserved to** | doctor | two or more doctors | healthcare professions with different responsibilities | non-medical healthcare profession | measurement; evaluation is the professional's |
| **Patient present** | always | optional | optional | always (or caregiver) | not applicable |
| **Asynchrony** | no | **yes** | yes, deferred, but always scheduled | no | by construction |
| **Container** | single contact | single contact or asynchronous exchange | single contact | **multi-session cycle** | **plan with horizon** |
| **Average session** | mandatory | optional | mandatory if synchronous | mandatory | absent |
| **Produces** | report, with setting exceptions | **no autonomous report**; collaborative relationship attached | documentation of the requesting act | clinical-assistive relationship **conclusive** | record, plan, report, final relationship |
| **Billable** | yes, with the code of the service delivered | **no** | **no** | according to the profession's regime | **not by itself** |
| **Allowed in urgency** | **no** | yes | yes, but **never in place of rescue** | - | - |

Sources: Agreement between State and Regions 17 December 2020, rep. acts no. 215/CSR, Annex A; Decree of 21 September 2022,
Annex A; Decree of 30 September 2022, Annex B; Decree of 19 November 2025, art. 7 and Annex 1.

## 4. televisita (medical act between healthcare professional and patient in real time)

### 4.1 What it is

> «It is a medical act in which the professional interacts remotely in real time with the
> patient, also with the support of a carer.» (Agreement 215/CSR 2020, Annex A)

A *remote consultation (televisita)* is the healthcare interaction in which the doctor is present in real time with the patient.

The same source adds two limits that are not background: the *remote consultation* cannot be the
means to conduct the doctor-patient relationship **exclusively** at a distance, nor can it be
automatically considered a substitute for the first in-person visit.

### 4.2 What truly distinguishes it

**It is the only service in which the act is reserved to the doctor and the patient must be present in real time.** From this double condition descends everything else: there is an act of patient identification, which is an act of the professional and not the outcome of an algorithm; the average session is mandatory; and there is a waiting room with **always explicit admission**,
because automatic entry into a room where another act is already taking place is a privacy violation.

It is also the only service with **conditions of deliverability** set by the source: services that do not require completeness of physical examination, and presence of at least one of five clinical conditions indicated by Agreement 215/CSR 2020. The system **does not decide appropriateness**: it records it.

### 4.3 The distinct obligations it carries

**The mandatory report - but conditioned to the setting.** «The televisita delivered in outpatient specialist setting must always conclude with a report» (Agreement 215/CSR 2020, Annex A). The Decree of 30 September 2022, Annex B, corrections establish however that the *remote consultation* scheduled and delivered directly by general practitioner or paediatrician of free choice **does not require prescription** and provides for **digital annotation in place of the report**.
Hardcoding the report obligation as unconditional is an error that manifests at the first customer who is a group practice (constraint `V-145`).

**Compulsory contents of the report.** Agreement 215/CSR 2020 requires that the *remote consultation (televisita)* report state any **collaborating participants** - carer, other doctor - and the **quality of the connection with confirmation of suitability for service delivery**. The ministerial template of the *remote consultation* report (Decree of 19 November 2025, Annex 1, § 2.20) **does not provide a dedicated field** for the latter: the project proposes its placement among the «descriptive parameters of the procedure», with the constraint that **the value is measured by the system and confirmed by the professional**, never generated independently and inserted in the document. Verification of conformity of this choice is still an open question (`Q-131`).

**Dedicated document typology.** The *remote consultation* (televisita) report has a dedicated Electronic Health Record typology (Decree of 19 November 2025, art. 7, letter p, and Annex 1 § 2.20). The hypothesis «outpatient specialist report» is **wrong** and must not be used in any document, example, profile or public material (constraint `V-143`).

**Exclusion from urgency.** The Decree of 30 September 2022, Annex B, excludes *remote consultation (televisita)* from urgency-emergency contexts, because «it must not be a reason for delaying in-person intervention».

**Obligation to complete in person.** «Where the telemedicine tool does not allow the substantial content of the service to be delivered to remain unchanged, the healthcare facilities and private providers are required to complete the service in traditional modality without further charges to the national health service and/or user» (Agreement 215/CSR 2020, Annex A). On the model level this means that the outcomes of technical failure, inadequate quality and referral **generate a subsequent fact** - a new request linked to the previous one - and do not merely close the contact. The in-person rescheduling is part of the state machine, not error handling.

### 4.4 The difference that nobody sees until it causes harm

The **state** says where the contact is; the **outcome** says what happened. They are distinct attributes, and the second determines administrative effects.

Two outcomes share the same terminal state - the patient was not seen - and have **opposite** economic effects: non-attendance, detectable by absence of any connection attempt, and technical failure attributable to the patient, detectable by telemetry, which **is not** non-attendance and entails rescheduling without charge.
Charging non-attendance to someone who tried and failed to connect is a domain defect, not an edge case (constraint `V-141`).

## 5. *Specialist-to-specialist consultation (teleconsulto)* and *teleconsulenza*

### 5.1 What they are

***Specialist-to-specialist consultation (teleconsulto)*** is «a medical act in which the professional interacts remotely with one or
more doctors to discuss […] the patient's clinical situation, based primarily on the sharing of all
clinical data, reports, images, audio-video regarding the specific case. […] **can also take place in asynchronous mode**, when the patient's situation permits it safely. **When the patient is present at the specialist-to-specialist consultation (teleconsulto), then it takes place in real time […] and is configured as a multidisciplinary visit.**»

**teleconsulenza** is «a healthcare activity, **not necessarily medical but nevertheless specific to healthcare professions**, that takes place remotely and is executed by two or
more people who have **different responsibilities** regarding the specific case. […] It is an activity on request but **always scheduled** and **cannot be used to replace emergency assistance**.» (both: Agreement 215/CSR 2020, Annex A)

### 5.2 The four differences between the two

They are subtle and must be kept in mind, because a decree unifies them while the agreement distinguishes them:

1. **the actors** - in *specialist-to-specialist consultation* they are doctors; in *teleconsulenza* they are healthcare professionals with different responsibilities on the case;
2. **the prominent element** - in *specialist-to-specialist consultation* it is documentary sharing; in *teleconsulenza* it is the video call, with sharing guaranteed as needed;
3. **the scheduling** - *specialist-to-specialist consultation* can be extemporaneous, *teleconsulenza* is always scheduled;
4. **the expressed prohibition** - only teleconsulenza carries the prohibition to replace rescue.

The two prohibitions on urgency **do not coincide and do not overlap**: *specialist-to-specialist consultation* and *teleconsulenza* are executable also in urgency according to the same source that excludes *remote consultation*, but *teleconsulenza* cannot substitute rescue. A single boolean attribute «use in urgency» cannot represent both rules, and this is why in the model they are two distinct attributes of the service type.

### 5.3 What truly distinguishes them from televisita

**The axis of the relationship is not professional-patient but professional-professional.** It follows
that the patient may not be present, that asynchrony is allowed, and that the consultant **does not
receive access to the patient's record**: receives access only to the material that the requester has selected, for the time necessary for the response.

That material is modelled as an **aggregate with its own lifecycle**: it is born with the request,
contains a closed list of documentary references, has a mandatory expiry and lapses in three
ways - signed response, refusal, expiry. The revocation is a recorded fact, not the absence of a
renewal. It has a consequence often overlooked: years later, the question «on what did the consultant opine»
has an answer only if the set was recorded as such, and not reconstructed from the access register.

In the synchronous form with patient present four problems emerge that *remote consultation* does not have:
who is the provider, who documents, who conducts the session, and whether the patient knows who is there. The model solves them with a single contact with multiple participants, an explicit conductor role, documents with distinct authors which the system **does not merge**, and a list of present participants visible for the entire duration **without possibility of concealment**. The side room between professionals - confidential colloquy that temporarily excludes the patient - is represented as a **declared period**
with start, end and announcement: no silent modality exists.

### 5.4 The distinct obligations

**No autonomous report, but an autonomous document.** «The *specialist-to-specialist consultation (teleconsulto)* contributes to the definition of the report that is drawn up at the end of the visit delivered to the patient, but does not give rise to a separate report» (Agreement 215/CSR 2020, Annex A). For years this passage has been read as «the *specialist-to-specialist consultation* produces nothing»: **it is a misreading**. The Decree of 19 November 2025
creates an autonomous Electronic Health Record typology - the collaborative relationship for *specialist-to-specialist consultation (teleconsulto) / teleconsulenza*, letter q) - with an explicit structural rule (Annex 1, § 2.21): «The collaborative relationship is conferred to the EHR as an attachment of the report document relating to the service or main event […] written by the doctor requesting the consultation».

In the model these are therefore two distinct things: the prohibition concerns the generation of a specialist report; the obligation concerns the production of the relationship and its correlation with the main document. Treating it as a section of the requester's report erases the author;
treating it as an independent document violates the conferment rule.

**It is not reimbursed.** *Specialist-to-specialist consultation (teleconsulto)* has no nomenclator entry, provides for no prescription at the expense of the national health service nor patient contribution, and falls within the ordinary work activity of the professional. It generates however activity recordable for work load purposes, which is a different thing and must be kept separate.

**The mode of execution is on three axes, not an enumeration.** The ministerial template (Decree of 19 November 2025, Annex 1, § 2.21) requires indicating **extemporaneous or scheduled** × **synchronous or asynchronous** × **with or without presence of the patient**. They are three independent binary axes.

## 6. teleassistenza (multi-session clinical-assistive programme)

### 6.1 What it is

> «(nurse/physiotherapist/speech therapist/etc): is **a professional act pertaining to the
> related healthcare profession** and is based on remote interaction between the professional and
> patient/*carer* via a video call […]. teleassistenza is **predominantly scheduled and repeatable** based on specific programmes for accompanying the patient.»
> (Agreement 215/CSR 2020, Annex A)

### 6.2 What truly distinguishes it

**It is not a contact: it is a programme.** Modelling it as a single contact loses the unit of sense. The container is an episode with programme; the single meetings are contacts linked to the episode; adherence is a property of the episode, not of individual contacts. The same applies to telerehabilitation, which the Agreement between State and Regions of 18 November 2021, rep. acts no. 231/CSR, frames in the **Individual rehabilitation plan**: isolated sessions do not exist.

**It is not a medical act** and does not produce specialist report. It has assistive purposes, not diagnostic.

### 6.3 The obligation that surprises whoever designs internal boundaries

The Decree of 21 September 2022, Annex A, imposes something that at first sight makes no sense:

> «It is indeed necessary that the Remote assistance service be able to make available also
> **all the functionalities present for remote consultation and for remote monitoring**.»

At software level remote assistance is therefore a **hybrid service that reuses the capabilities of the
other two**: it is not an autonomous module, it is a composition. Whoever designs the boundaries between bounded contexts must take this into account, because a separation too rigid between remote consultation and remote monitoring makes remote assistance impossible to compose.

### 6.4 What it produces

The Electronic Health Record typology is the clinical-assistive relationship conclusive for
remote assistance/telerehabilitation (letter r). **It is conclusive**: it is issued at closure of the programme,
not at closure of the single session. Individual sessions produce entries in the diary, which are not
healthcare documents intended for the record.

## 7. *Remote monitoring (telemonitoraggio)*

### 7.1 What it is

It is structurally the most diverse service from the others, and the reason is simple: **it has no contact**. There is no moment when two people meet. There is a plan that lasts, measurements that arrive, alarms that generate, reviews that occur.

### 7.2 The affiliation rule, which is the most useful sentence in the domain

> «*Remote monitoring (telemonitoraggio)* **does not belong to outpatient specialist care, unless accompanied by telecontrollo, a *remote consultation (televisita)* or also an in-person visit** in which the data continuously recorded are analysed, discussed and communicated to the patient. The results of *remote monitoring* must be indicated in the report of the patient's periodic check-up visit.» (Agreement 215/CSR 2020, Annex A)

In other words: **collecting data is not a service. It becomes a service when a doctor looks at it inside a clinical act.** Direct consequence on the model: there is a connection between the *remote monitoring* plan and the review contact, and the plan alone does not generate a reportable event.

### 7.3 The project scope, and why it is written thus

The scope is **ingestion of measurements from a third-party gateway**, plus **manual entry
by the patient or caregiver**, plus **structured questionnaires**. The project **does not communicate directly with medical devices** and does not assume responsibility for the accuracy of the hardware measurement chain (`D21`, `OUT-10`, `OUT-11`).

The formulation of the intended purpose is **frozen by sponsor decision** (`D55`) on
«**deferred collection of parameters for the professional's periodic review**», and not on
«real-time monitoring of vital parameters». The difference is worth a risk classification, a software safety classification, months and an order of magnitude of cost (`D46`). In the model **there does not exist** any concept of «continuous surveillance», «real-time alarm» or «active patient monitoring»: there are a measurement plan, deferred measurements, an evaluation against thresholds configured by the professional and a **clinical review queue** (constraint `V-144`).

From the freezing descends a **permanent prohibition**, which stands as the admissibility criterion of every future proposal: **no function can be added if it shifts the system toward clinical real time**, and the evaluation must be made before writing the function, not after.

### 7.4 Why *remote monitoring (telemonitoraggio)* determines the qualification of the entire product

The Decree of 21 September 2022 is explicit in requiring that «the regional telemedicine infrastructure for the minimum *remote monitoring (telemonitoraggio)* service must be certified as a medical device», and adds that for advanced *remote monitoring (telemonitoraggio)* «a risk classification higher than IIa might be required».

The element that grounds the qualification is the **automatic evaluation of thresholds**: at the moment the system compares a measurement against a threshold and generates an alert, it is *interpreting* clinical data. The project accepts this, declares it and derives its scope from it: the threshold and the alert rule are **configured by the professional, never deduced by the system** (constraint `V-02`), the threshold field **starts empty and mandatory** with no pre-filling (constraint `V-123`), and the calculation is traceable afterwards with plan version, rule version, input values and outcome.

### 7.5 The three entities that must not be merged

*Remote monitoring (telemonitoraggio)* requires three distinct lifecycles that coexist:

**The plan.** It has operational parameters imposed by the ministerial template (Decree of 19 November 2025,
Annex 1, § 2.24): typology, number of cycles, cycle duration, number of activities per cycle,
frequency, time band, planned duration **with maximum of one year**, type of measurement, alarm threshold and behaviour rules on threshold violation. The plan is **versioned, and the version is part of the identity of the measurement**: a measurement acquired under one plan version must not be compared against the thresholds of a subsequent version, otherwise every change retroactively rewrites the meaning of history.

**The measurement.** It is immutable and carries with it its own context: instrument, method, **measurement instant and receipt instant as two distinct mandatory fields**, subject who entered it, explicit unit never presumed. Rules operate on the measurement instant, not on the receipt instant (constraint `V-124`).

**The absence of measurement.** It is an entity, not the absence of a row: it is a row that declares absence,
with the expected window, the deadline instant and the cause when known (constraint `V-148`). It is the operative form of `V-09` and the condition for adherence to be a defined quantity. Without it, the clinical deterioration that prevents measurement remains invisible.

To these is added the **alarm**, which is a sequence of immutable events with the current state as projection (constraint `V-121`), and which has three properties that are decisions and not details:
«delivered» is not «acknowledged»; failure to respond is a state to be recorded and measured,
not an absence; **escalation can fail, and the failure is declared** - an escalation that exhausts itself without recipient must not end in silence.

### 7.6 Service hours is a security requirement, not a commercial parameter

It is the least intuitive consequence and the most important. **A poorly declared service is more dangerous than absence of service, because it produces false reassurance.**

In the model service hours is a versioned runtime datum, per customer and per pathway; it is
**a condition for plan activation** - a plan without declared service hours does not activate, and no configuration passes the control; it is visible persistently to the patient and carer **with the current state**, not with the theoretical schedule, and is not hideable for theme personalisation; **conditions the validity of the recipient in the escalation chain** - a recipient outside service hours is not a valid recipient (constraint `V-122`); and its reduction on an active service is a security event with motivation, list of affected plans and notification to the enrolled.

### 7.7 What *remote monitoring (telemonitoraggio)* produces

Decree of 19 November 2025, art. 7, assigns it **four distinct document typologies** among the
ten: the device record (letter s), the plan (letter t), the reports of measurements
(letters u and v) and the final relationship (letter w).

The **device record** deserves attention because it is the only point where the model meets
the unique identification of the device: it requires UDI in automated identification format and UDI-DI readable, serial number or batch, name, address and website of the manufacturer, type of connection and power supply, outcome of technical control and connectivity parameters,
configuration and calibration (Annex 1, § 2.23). It is **signed by the professional who assigns the device**: in the model it is therefore an act, not a demographic record.

## 8. The notions of boundary

They are the most common source of equivocation, both in a negotiation and in a specification. The model must
be able to represent them **even when they are out of its own scope**, because they exist and professionals use them.

### 8.1 telecontrollo (remote doctor check-up)

> «operative modality of telemedicine that allows *remote monitoring* of the patient. This
> activity is characterised by a cadenced series of contacts with the doctor […] via video call in association with the sharing of clinical data collected at the patient» (Agreement 215/CSR 2020, Annex A)

**It is the notion most confused with *remote monitoring (telemonitoraggio)*, and differs on the point that matters most:
telecontrollo is medical service at nomenclator, reported in outpatient specialist flows, and therefore reimbursed.** Pure *remote monitoring (telemonitoraggio)* is not.

In the model telecontrollo **is not a fifth state machine**: it is a *remote consultation (televisita)* with
mandatory linking to a *remote monitoring* plan, with the precondition that an active plan exists and
with the obligation to report its results in the document.

### 8.2 Telerefering

It is «a report released by the doctor who subjected a patient to a clinical or instrumental examination whose content is that typical of reports made in person and which is written and transmitted via digital and telecommunication systems».

Two clarifications against two equivocations. First: **telerefering is not sending the report by e-mail**. It is the act of reporting at distance, not the delivery channel.
Second: **it is not an autonomous service** and is not billable independently - «the report represents the activity of completing the specialist service».

In the Decree of 21 September 2022 it does not appear among the minimum services: it becomes the
cross-cutting micro-service «reporting and digital signature», on which the decree places a prohibition with direct architectural impact - «a dedicated module must not be realised […] but integration with the regional module must be provided, if already present». Hence the project's posture: own reporting, agenda and billing modules exist, but are **disactivatable and replaceable for configuration**. Where a regional or integrator module exists, the system integrates instead of duplicating (`D14`).

### 8.3 Telerehabilitation

Regulated autonomously by the Agreement between State and Regions of 18 November 2021, rep. acts no. 231/CSR. Services must be framed in the Individual rehabilitation plan; tariffication is equivalent to that in person; facilities that intend to deliver it at the expense of the national health service must be **accredited for the same activities in person**. At the model level it reuses the multi-session container of teleassistenza and produces a final relationship.

### 8.4 Second opinion

Independent evaluation requested from a professional different from the one who has the patient in care, normally asynchronous and on documentation. **It is not a *specialist-to-specialist consultation***, and the difference is structural: the requester can be **the patient themselves**, and the consultant does not enter the care relationship. Decree of 19 November 2025 lists it among the essential micro-services of teleconsulto,
which indicates that the platform must support it, but the legal category remains distinct.

### 8.5 Telecooperation

Assistance provided remotely by a doctor at distance to another operator engaged **in an act in progress**,
typically in emergency-urgency territory. Synchrony is binding and tolerable latency is much lower than in *remote consultation*: service objectives are not reusable. The legal category does not appear in the list of services of Agreement 215/CSR 2020 and is treated by the project
as a use case **out of scope** of the current version. `[NV]` on an autonomous national regulatory definition.

### 8.6 What is not telemedicine at all

Agreement 215/CSR 2020 explicitly excludes one category, and the exclusion is useful because it
draws the boundary by difference:

> «**Telephone triage**: the triage or telephone consultation carried out by doctors or
> healthcare operators to patients for the purpose of indicating the most appropriate diagnostic/therapeutic pathway […] **does not fall among the activities referable to telemedicine**.»

The discriminating element is not the medium but the **nature of the act**: directing toward the appropriate pathway is not delivering a service. On the same criterion remain out, without the regulation naming them one by one: sending the report by e-mail, which is document transport; the portal that exposes already-produced documents, which is an access function; wellness applications that collect steps, sleep or heartbeat with no responsible professional and no plan, because collecting measurements is not *remote monitoring*; administrative communication with the patient, which remains communication and has moreover the constraint of not containing clinical data.

In the model the telephone orientation contact is represented as a **organisational fact**:
it does not generate a contact with clinical state machine, does not produce healthcare document, does not generate reportable event as telemedicine service. It must nonetheless be recorded, because it is an interaction that produced a routing.

There follows a symmetric constraint that closes the circle with the project non-objectives: **if the
system calculated priority instead of recording it, it would exit the scope**. Evaluation of urgency and appropriateness of the channel is an act of the professional; the system records the outcome decided, with the identity of who decided it and the stated criterion (`OUT-03`).

## 9. The five errors that this chapter exists to prevent

| Error | What it produces |
|---|---|
| «teleconsulto and televisita are the same thing with one more participant» | A model that does not know who the provider is, who documents and who is responsible; and that attempts to produce a report where regulation forbids it |
| «telemonitoraggio is collecting data from a device» | A product without versioned plan, without measurement expectation, without declared service hours and without escalation with declared failure - that is without everything that makes it a healthcare service instead of an archive of numbers |
| «An enum with the service types is enough» | Null fields, fragile conditional rules, impossible reporting. Every service is its own state machine, and the type selects it instead of adding a field (constraint `V-140`) |
| «telecontrollo is telemonitoraggio with a video call» | A reporting error: telecontrollo is billable, telemonitoraggio alone is not |
| «A boolean attribute is enough for use in urgency» | Two different rules collapsed into one: televisita is excluded from urgency, teleconsulenza is admitted to it but cannot replace rescue |

## Where to continue

- [`docs/10_fondamenti/02-prestazioni-di-telemedicina.md`](../10_fondamenti/02-prestazioni-di-telemedicina.md):
  the verbatim definitions, the regulatory chain at four levels with different force, the ten
  document typologies of the record, the billing regime service by service.
- [`docs/05_domain/02-le-prestazioni-modellate.md`](../05_domain/02-le-prestazioni-modellate.md):
  the state machines with allowed transitions, the typed outcomes, the transitions that
  deliberately do not exist and the mapping to the standard.
- [`docs/03_functional/03-casi-d-uso.md`](../03_functional/03-casi-d-uso.md): the flows with
  preconditions, alternative flows and error flows.
- [`docs/03_functional/07-fuori-perimetro.md`](../03_functional/07-fuori-perimetro.md): the boundary
  between what the system records and what it would interpret.
