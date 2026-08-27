---
title: Obligations of whoever integrates
sidebar_position: 10
description: "What whoever integrates assumes on regulatory, data protection, security and terminology matters. With the responsibility allocation table and the pre-launch checklist."
---

# Obligations of whoever integrates

> **It is the most important document in this area.** It must be read **before** signing a contract, not after. Other pages describe how to make things work; this describes what you answer for when they work.

## 0. How to read this chapter

The chapter is not legal advice and does not replace it. It does a different and useful thing: **lists the obligations that arise from technical facts** described in other pages, citing the source, and says **to whom** they fall. What follows from that for your organisation must be evaluated with your consultants.

Every regulatory claim cites the act. Where the source is not verified, it is marked **`[NV]`** and says whom to ask. Where the project has made its own decision, it is stated as such.

## 1. The starting point: what you are integrating

### 1.1 The repository is source code, not a medical device

> **The public repository is source code distributed under Apache-2.0 licence. It is not a medical device placed on the market, and states so.**

They are two distinct artefacts, with different names, version numbers and lifecycles:

| Artefact | What it is | Who answers |
|---|---|---|
| **Repository** | Source code under open licence | No one, within the limits of the licence |
| **Identified distribution** | Produced by reproducible build, subject to quality control, with a specific manufacturer, a compliance officer and a registration | **The manufacturer** |

The distinction is not formal: it is what protects both the community writing the code and the person receiving the service. And it concerns you directly, because **whoever transforms the first artefact into the second is you**, if you do it.

### 1.2 The project does not place the marking, today

> **Today the project produces and publishes regulatory material, does not constitute a manufacturer subject, does not engage conformity assessment bodies, does not conduct clinical evaluation and does not place CE marking.** With decision D63, the project intends to assume the role of manufacturer (entity still to be constituted): the path is underway and marking is a product requirement. Whoever integrates and places on the market today assumes the manufacturer role, unless the client decides otherwise on a distribution certified by the project.

And the operational consequence that holds **today**, without exception:

> Until a marking exists, the software **is not usable for delivering healthcare services to real patients**. Every distributed artefact states this, and no document, page or message can suggest otherwise.

If your commercial plan presupposes otherwise, the plan must be corrected - not the documentation.

### 1.3 The licence's disclaimer does not apply towards the patient

It is the point that generates the costliest misunderstanding, and it is good to address it openly.

The Apache-2.0 licence contains warranty disclaimers and limitation of liability clauses. **They apply between the parties to the licence relationship. They do not apply towards the injured party.**

- Directive (EU) 2024/2853 on liability for defective products, in **art. 15**, **prohibits contractual exclusion or limitation of liability towards the injured party**.
- **Article 10** of the same directive **presumes defectiveness** of the product in case of non-compliance with mandatory safety requirements provided by Union law.

Translated into one sentence: **a licence that says "without warranties" does not protect you from a claim by a person who suffered damage**. It protects you, within the limits it itself sets, in relationships with whoever provided you the code.

## 2. Regulatory: medical devices

### 2.1 Who is the manufacturer

The manufacturer is whoever **places on the market or puts into service** the device in their own name. If you take the code, produce a distribution and use it to deliver healthcare services - even only to your customers, even without selling the software - **you are**.

Everything in the rest of this section follows from this. It is not avoidable with a contractual clause towards the project, because the project is not your supplier in the sense the discipline intends: it is the code source.

### 2.2 The classification and its consequences

The project's functional scope **includes remote monitoring** and **automatic threshold evaluation**, and it is the element that constitutes interpretation. The project declares its own medical purpose and assumes the corresponding classification, with binding consequences:

| Consequence | Effect for you |
|---|---|
| Requires a **notified body** | Not self-certifiable |
| The quality management system must be **certified**, not just implemented | Cost and timing of its own |
| Requires a **clinical evaluation** pursuant to art. 61 and Annex XIV | Independent documentary path |
| Conformity assessment procedure of Annex IX (or X + XI) | - |

And the fact that weighs most on your planning:

> **The limiting factor is not development: it is the availability of notified bodies.** Industry surveys place the majority of paths between 13 and 18 months from agreement signature to certificate, with a significant share between 19 and 24 months; the gap between applications submitted and certificates issued is wide and notified body staffing is contracting. **A new, small manufacturer at first certification is not a priority customer**, and must be factored into negotiation.

### 2.3 Intended purpose is the most expensive document to get wrong

A single sentence shifts the classification and with it the times and costs.

| Formulation | Classification | Software safety class |
|---|---|---|
| "**real-time** monitoring of vital parameters" | Superior | Superior |
| "**deferred** collection of parameters for periodic professional review" | That assumed by the project | That assumed by the project |

The difference is worth, in industry estimates, **twelve-eighteen months and an order of magnitude of cost**.

**What you must do, concretely:**

1. **Freeze your intended purpose before engaging any body.** Changing it afterwards requires re-evaluation.
2. **Submit it for external review** before freezing.
3. **Verify that your commercial material does not contradict it.** A brochure that promises real-time monitoring is a statement of intended purpose, even if not called that.

### 2.4 What the project delivers to you, and what it does not

**It delivers** - it is the package for the certification path:

- technical file;
- software lifecycle documentation pursuant to IEC 62304;
- risk management pursuant to ISO 14971;
- usability engineering file pursuant to IEC 62366-1;
- third-party component inventory and bill of materials, generated from first pipeline;
- traceability requirement → design → code → test, with **frozen** identifiers;
- the operational manual of the certification path.

**It does not deliver**: the marking, the declaration of conformity, the registration, the relationship with the body, the compliance officer. With decision D63, the project **intends** to conduct clinical evaluation as part of its manufacturer path (entity still to be constituted): this does not change the obligations of whoever integrates today a distribution not yet marked.

The last row of the first list merits attention: **requirement identifiers are never renumbered**. If your process remaps them to your numbering, traceability breaks, and traceability **cannot be reconstructed afterwards**.

### 2.5 The functionalities one step from superior classification

Three functionalities are **a single user story** from superior classification, and must be controlled with change management:

1. **Alert on threshold** - if the notice moved from "the measurement exceeded the threshold you set" to an interpretive judgment, it changes nature.
2. **Reproduction with enhancement** - processing that "improves" an image or audio for clinical evaluation purposes is something else.
3. **Assisted reporting** - a system that proposes clinical content is no longer persistence of content written by the professional.

If your replacement module ([08](08-moduli-sostituibili.md)) introduces one of these capabilities, **you have changed the nature of the product**, and the conformity evaluation must be redone on your perimeter.

### 2.6 The recognised conflict between endpoint protection and certification

There is a point where two disciplines conflict, and the authority recognises it expressly: installing protections on a medical device's endpoint "could invalidate its certification". The derogation exists **but requires documented compensatory measures, which must be provided by the supplier**.

The project produces those measures as part of the package, instead of leaving them to you. **But you will be asked for them**, so they must be incorporated in your file and not archived.

## 3. Data protection

### 3.1 The roles

The role is not chosen: **it is determined based on who decides purposes and means**.

| Scenario | Controller | Processor |
|---|---|---|
| You deliver services with your software, which includes Telemedic | **You** | Possible your infrastructure suppliers |
| You provide the service to healthcare facilities that deliver services | **The healthcare facility** | **You** |
| Multiple controllers together determine purposes and means | **Joint controllership**, with the agreement provided for by art. 26 GDPR | - |

**The project is not controller or processor**: it does not process data, provides code. In the moment an installation exists that processes data, roles are between you, your customers and your suppliers.

### 3.2 What you cannot avoid doing

| Fulfilment | Note |
|---|---|
| **Legal basis** for each processing | Consent is almost never the right basis for care: art. 9, par. 2, lett. h) exists for this. Using consent where it is not needed creates a right of revocation that makes processing unsustainable |
| **Notices** distinct and comprehensible | For patient, professional, caregiver |
| **Processing register** | With data categories, purposes, recipients, retention terms |
| **Impact assessment** | Processing on large scale of health data with new technologies: the art. 35 prerequisites are amply met |
| **Agreements with processors** pursuant to art. 28 | With each supplier processing on your behalf |
| **Security measures** pursuant to art. 32 | Documented, not just implemented |
| **Violation procedure** | §3.5 |

**Retention terms that are not negotiable.** Some categories have terms fixed by sector discipline, and must be configured accordingly: **twenty-four months** for audit trail logs and **twelve months** for access and authentication data (DM 19 November 2025, Annex 4). They are not default values to leave as they are: they are values to verify against your case and justify if they diverge.

### 3.3 Recording, and its effect on the notice

It is the point where a technical choice becomes an information obligation.

> **When recording is active, encryption is terminated on the server and the session is no longer encrypted end-to-end.** It is an inescapable consequence of the architecture, not a defect.

From which, for you:

1. **The consent notice must declare it explicitly.** Consent to recording that does not say the session ceases to be protected end-to-end is consent based on incomplete information.
2. **The interface must signal recording status persistently and not hidably** for the entire duration. No personalisation can hide it ([05 §7.2](05-componente-incorporabile.md)).
3. **The transition between the two modes is traced.**
4. **The file is encrypted at rest** with keys per tenant and preservation is configurable - you must configure it, not inherit it.

### 3.4 Sovereignty and colocation

The project is built so **no mandatory component of the main path depends on non-replaceable services or established outside the European Union**, and supports three colocation profiles: European Union, Italian territory, qualified cloud.

**What remains to you**: your choices. If you add a transcription service, an error monitoring system or a terminology service established elsewhere, the constraint is yours and the transfer evaluation is yours.

The point that changes the nature of the question: data sovereignty **is no longer just a commercial argument**. Network security discipline requires the subject to **declare their relevant suppliers nominatively to the authority**, with name, tax identification number, **country of headquarters** and relevance criterion. A component established outside the Union is a datum your customer must communicate to an authority.

### 3.5 Breaches

| Obligation | Who | Deadline |
|---|---|---|
| Notification to the supervisory authority | The controller | 72 hours from becoming aware (art. 33 GDPR) |
| Communication to interested parties, if risk is elevated | The controller | Without undue delay (art. 34 GDPR) |
| Information to the controller | The processor | Without undue delay (art. 33, par. 2) |
| Notification pursuant to network security discipline | The NIS subject | Own terms, distinct from GDPR |
| Notification pursuant to device vigilance discipline | The manufacturer | Own terms |

**Three disciplines, three deadlines, three recipients.** A breach procedure that considers only one is incomplete. And responsibility for coordinating them is with whoever puts into service, not the project.

## 4. Security

### 4.1 The deadline is not a single date

> **The deadline for adaptation to security measures is subjective**, not a single date for everyone: the rule is **eighteen months from receipt of the notification of inclusion**.
> Each customer therefore has their own deadline.

Consequence for your product: **conformity must be parameterised on the individual user's deadline**, not hardcoded on a date in your roadmap. If you wrote a date in your plan, it is your estimate and not a legal deadline.

The measure catalogue, from authority source, distinguishes important operators from essential ones with different numbers of measures and requirements. Whether you or your customers are which - you do not decide.

### 4.2 You are a relevant supplier

In managed service mode you fall under both relevance criteria; **in deployment at the customer you fall anyway under the non-fungibility criterion**. Your customer will be required to declare you nominatively to the authority.

**What is worth doing**: prepare in advance the sheet with the data the customer is required to declare. The project provides it for itself as a deliverable; you must produce yours.

### 4.3 The immutable log is not entity versioning

It is the most expensive technical error of this section, and must be stated clearly.

> **An entity versioning mechanism versions, does not render immutable.** Whoever has write access to the database can alter the versioning tables as well.

What is needed - and what applicable requirements require - is a **hash chain** with **preservation separate from the system generating the events**. The project implements it; if you replace the audit trail destination ([08 §4](08-moduli-sostituibili.md)), **the immutability property becomes your responsibility**, and must be demonstrated, not stated.

What the log contains: who, what, when, on which subject, with which outcome and with which authentication assurance level. **It does not contain clinical content.** If your event correlation system enriches it with clinical content, you have created a second health archive with its own obligations.

### 4.4 The applicable regime is per artefact, not per project

The digital resilience discipline for products with digital elements **excludes products covered by medical device discipline**. It follows that the marked product is outside, **but the other artefacts are not**: client tools, embedded component, images and distribution packages not covered by marking fall under it.

The project adopts the entire framework without invoking exemptions, and maintains a table artefact → applicable regime. **You must produce yours**, because your artefacts are not ours.

> The exact composition of your table depends on what you distribute and how, to be built with your consultants according to the procedure that `INTEG` must verify `[NV]`; the project provides its own as model, not as answer.

## 5. The payer is not a consultant

This section is brief and admits no interpretation.

> **Article 15, paragraph 4, of DM 7 September 2023 always excludes insurance companies from access to the electronic health record, together with expert witnesses and employers.**

The use case where a telemedicine service is **paid** by a fund, mutual or insurance is entirely valid. What is not valid:

| Not permitted | Even if… |
|---|---|
| An insurer accesses the record | …the patient signed a release |
| An insurer receives the report of the service they paid for | …the report was produced thanks to the policy |
| A professional accesses the record **on behalf of** an insurer | …the professional is enabled for access for care purposes |
| A replacement billing module enriches the administrative event with the diagnosis | …the payer's tariff depends on the delivered service |
| An authorisation scope permits a payer's client to read clinical documentation | …it was requested by contract |

**The third row is where good faith error occurs.** A professional's enablement for access is functional to care: using it to feed an insurance evaluation is a different purpose, and the difference in purpose is not remedied by the identity of who accesses.

**What the payer can legitimately obtain**: service identifier, service type, instants, administrative outcome, amount, references to the integrator's domain. It is exactly the administrative event content described in [04 §2.5](04-integrazione-per-eventi.md), and **the payer's integration profile is administrative by construction**: no configuration enriches it.

And a consequence for your communication: **if your commercial material presents the insurance use case as "access to the clinical documentation of one's insured", it must be corrected.** The payer is not a consultant.

## 6. Terminologies and licences

It is the section with the most underestimated economic consequences.

### 6.1 The four regimes

Every clinical terminology is in one of four regimes, verified on the primary licence:

| Regime | What it means | Who pays |
|---|---|---|
| **A - full coexistence** | Usable in sources under open licence, with attribution | No one |
| **B - dedicated folder with its own licence** | Redistributable on its own terms | No one, but the licence must be respected |
| **C - acquisition or querying at runtime by whoever installs** | The project **never downloads it** | **You** |
| **D - total exclusion** | Only identifier and code, never content | - |

### 6.2 The three traps of regime C

**Trap 1 - the external service does not exempt you.** Relying on a terminology service from a third party **does not eliminate your licence**: whoever creates or analyses records containing those concepts is, according to the licence's definition, a data processing system subject to licence. Tariffs are **per site** and apply **also in non-production environments**.

**Trap 2 - you distribute a product under licence even without containing a concept.** Whoever distributes software designed to work with that content distributes a product subject to the licence, even if the package contains not a single concept.

**Trap 3 - cache is a derivative.** A disk-persisted memory of terminology service responses constitutes a subset, and a subset is a derivative. The project therefore uses **non-disk-persisted memory** for systems whose licence does not permit derivatives. If you replace the terminology access point, **the rule remains and becomes yours**.

### 6.3 The system works without them

> **With costly licensed coding systems disabled, the system remains fully operational**, relying on those that cost nothing. No main path requires them.

The cost of disabling them is declared: some code validations do not execute. It is a choice you can make knowingly, and in many cases it is the right choice.

### 6.4 Two clarifications that prevent widespread errors

- **Translations of some coding systems are derivatives assigned to the licence holder.** It follows an architectural rule: **the strings of your product's interface must be kept separate from the official coding system labels**. Mixing them means producing a derivative without noticing.
- **A licence declaration placed on an implementation guide does not dispose of third-party rights on the content included.** A guide published under permissive licence can contain material whose rights belong to others. **Verification must be done artefact by artefact**, not guide by guide.

## 7. Digital identity

The picture is in [06 §6](06-identita-e-delega.md). Here the summary of responsibility:

> **The service provider towards the national federation is whoever operates the service on the network, i.e. you.** The project is compliant and verifiable, **not accredited**, and cannot be.

Remaining to you: the convention with the authority; the list of active services with the security level expected for each; justification of level choices and requested attributes; retention of logs for the prescribed period; clock synchronisation within the prescribed tolerance; support to users; notification of violations within the prescribed term; certificate renewal and redeposit of the metadata document.

And a planning datum: **the timescales of the procedure are not declared in any primary source**, except some deadlines after signature. You do not plan against a deadline that does not exist.

## 8. Accessibility

It is not a final compliance: it is a **functional requirement** of the system, and applies to every screen, including the embedded component and the documentation.

| Obligation | Who |
|---|---|
| The product meets the declared criteria, with the sole non-conformity declared | The project |
| **Personalisation does not degrade accessibility** | The project prevents it technically ([05 §7.2](05-componente-incorporabile.md)); you do not circumvent the mechanism |
| **Accessibility declaration** of the delivered service | **You** |
| Verification with real assistive technologies, beyond automated | **You**, on your perimeter. Automation intercepts only a minority of defects |
| Conformity to design guidelines for digital public administration services, where applicable | **You** |

The sole non-conformity declared by the project concerns real-time captions, with the interpreter as alternative measure. **If your organisation has an obligation that measure does not satisfy, it is your problem to solve before going live**, not after.

## 9. Responsibility allocation table

Legend: **P** project · **I** integrator or whoever puts into service · **C** end customer (healthcare facility) · **-** not applicable.

| # | Domain | Activity | P | I | C |
|---|---|---|:--:|:--:|:--:|
| 1 | Regulatory | Produce technical file, lifecycle documentation, risk management, usability file | **P** | | |
| 2 | Regulatory | Freeze requirement identifiers and maintain traceability | **P** | I | |
| 3 | Regulatory | Constitute yourself manufacturer, name the compliance officer | | **I** | |
| 4 | Regulatory | Declare the intended purpose and limits of use of **your** product | | **I** | |
| 5 | Regulatory | Engage the body, conduct clinical evaluation, place marking, register | | **I** | |
| 6 | Regulatory | Post-market surveillance and vigilance on incidents | | **I** | C |
| 7 | Regulatory | Control changes on functionalities one step from superior classification | **P** | **I** | |
| 8 | Data | Determine purposes and means, thus the role | | I | **C** |
| 9 | Data | Notices, legal bases, record of processing activities | | I | **C** |
| 10 | Data | Impact assessment | | I | **C** |
| 11 | Data | Agreements between controller and processor | | **I** | **C** |
| 12 | Data | Configure retention terms | | **I** | C |
| 13 | Data | Respond to data subject requests | | I | **C** |
| 14 | Data | Notify breaches to the authority and interested parties | | I | **C** |
| 15 | Data | Provide technical functions that make rights exercisable | **P** | | |
| 16 | Security | Immutable log with hash chain and separate preservation | **P** | I if replaced | |
| 17 | Security | Determine your own adaptation deadline | | I | **C** |
| 18 | Security | Declare relevant suppliers to the authority | | | **C** |
| 19 | Security | Provide data the customer must declare | **P** | **I** | |
| 20 | Security | Compensatory measures for endpoint conflict | **P** | I | |
| 21 | Security | Vulnerability management on **your** artefacts | **P** | **I** | |
| 22 | Security | Custody of private keys for integration | | **I** | |
| 23 | Security | Countermeasures against internal resources on provided addresses | **P** | **I** on your side | |
| 24 | Identity | Be service provider towards the federation | | I | **C** |
| 25 | Identity | Verifiable compliance of the product | **P** | | |
| 26 | Identity | Justify levels and attributes requested | | I | **C** |
| 27 | Terminologies | Locate each terminology in a regime, verified on licence | **P** | | |
| 28 | Terminologies | Acquire licences of enabled systems | | **I** | **C** |
| 29 | Terminologies | Do not persist to disk what the licence does not permit | **P** | **I** if replaced | |
| 30 | Accessibility | Product compliant, personalisation non-degrading | **P** | | |
| 31 | Accessibility | Accessibility declaration of the service | | I | **C** |
| 32 | Accessibility | Verification with real assistive technologies on your perimeter | **P** | **I** | C |
| 33 | Clinical | Define monitoring thresholds | | | **C** (the professional) |
| 34 | Clinical | Declare service hours | | I | **C** |
| 35 | Clinical | Sign clinical documents | | | **C** (the professional) |
| 36 | Clinical | Deposit documents to national infrastructures | | I | **C** |
| 37 | Payer | Guarantee no path brings clinical content to the payer | **P** | **I** | |

Rows **7, 16, 19, 20, 23, 29, 32 and 37** are those where responsibility is **shared**: they are the most insidious, because an unmanaged shared responsibility is no one's responsibility. Must be assigned nominatively in your contract.

## 10. Pre-launch checklist

| # | Verification | ✓ |
|---|---|---|
| 1 | The intended purpose of **our** product is written, frozen and coherent with commercial material | ☐ |
| 2 | The role in processing is determined and written, with corresponding agreements signed | ☐ |
| 3 | The impact assessment is concluded | ☐ |
| 4 | Retention terms are **configured**, not inherited from defaults | ☐ |
| 5 | The recording notice declares the session **is no longer encrypted end-to-end** | ☐ |
| 6 | The breach procedure covers **all three** disciplines, with their respective deadlines | ☐ |
| 7 | The audit log has hash chain and separate preservation, even if we replaced its destination | ☐ |
| 8 | Licences of enabled terminologies are acquired, **also for non-production environments** | ☐ |
| 9 | No scope, event or module permits a payer to obtain clinical content | ☐ |
| 10 | The service accessibility declaration is published | ☐ |
| 11 | The declared service hours are realistic and monitored | ☐ |
| 12 | Integration private keys are in a secrets manager, never in repository or images | ☐ |
| 13 | Our commercial material does not promise functions that shift classification | ☐ |
| 14 | Table §9 has been assigned nominatively, row by row | ☐ |
| 15 | If there is no marking yet, **no real patient is involved** | ☐ |

## 11. What to ask by contract

If you are negotiating with a supplier integrating Telemedic on your behalf, these are the questions worth asking. If **you are** the supplier, these are the questions you will be asked.

1. **Who is the manufacturer of the distribution you are putting into service, and what is the exact version number?**
2. **What is the declared intended purpose, in writing?**
3. **Does the marking exist? If not, on what basis are you delivering services?**
4. **Who is controller and who is processor, and where is the agreement?**
5. **Where is data collocated, and which suppliers are in the chain?**
6. **Is the audit log immutable in the proper sense, or is it entity versioning?**
7. **Which terminologies are enabled, and who acquired their licence?**
8. **What is the declared service hours, and who answers outside that window?**
9. **What is the procedure in case of breach, and who notifies whom within how long?**
10. **Who answers if a replacement module introduces generated clinical content?**

An absent answer to one of these questions is not a detail to clarify after signature: it is exactly the point on which, in case of challenge, it will be established who answers.
<!--TRAD-VERIFICATA: 418d0d9f489a072e8f8ceacaa3cddaebbab96faf-->
