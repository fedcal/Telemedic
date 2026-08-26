---
title: The ubiquitous language
sidebar_position: 2
description: The vocabulary shared between clinicians and developers - normative definition where it exists, operative where it does not, rule of precedence between sources, false synonyms and terminological collisions to be managed.
---

# The ubiquitous language

Ubiquitous language is not a glossary. A glossary is consulted; an ubiquitous language is
**used**, and it is used in three places that must coincide: the conversation between clinician
and developer, the name of classes and columns, the text that the user reads on screen. When the
three places diverge the cost is not aesthetic. It is the cost of meetings where two people say
"session" meaning different things and find out after release.

In this domain the divergence has an aggravating circumstance that does not exist elsewhere:
**part of the vocabulary is not ours.** "Televisita", "teleconsulto", "report", "suppression"
have a definition established by a regulatory act. They are not names of features that the
product can choose. Those who use them in a sense different from the normative one are not
original: they are mistaken, and the error propagates to the document that ends up in the
electronic health record.

## 1. The four sources of definition and the rule of precedence

A term in this domain can have definition from four sources, which do not have equal authority.

| Level | Source | Example term | What it entails |
|---|---|---|---|
| **1** | **Italian regulation or administrative act** | *televisita*, *teleconsulto*, *data with greater anonymity protection*, *suppression* | The definition is binding. The project cannot narrow it, extend it or rename it |
| **2** | **National implementation guide** | *`EncounterTelemedicina`*, *`CompositionRefertoTelevisita`* | Prevails over the generic model in case of divergence **[BASE]**, `04_BASELINE_ARCHITETTURALE.md` § 3 |
| **3** | **Adopted international standard** | *`Encounter`*, *`Observation`*, *`Consent`*, *`Provenance`* | Defines structure, not clinical meaning. Adopted unless it diverges from levels 1 and 2 |
| **4** | **Operative definition of the project** | *media session*, *pre-technical verification*, *consultation scope*, *reporting window* | Permitted **only** where the three higher levels are silent, and always declared as such |

> **`DM-01` [MOD] - Precedence rule.** In case of conflict between two definitions the lower
> number level applies. A level 4 definition that conflicts with a level 1 one is not an
> extension: it is a defect, and must be corrected in the code, not negotiated.

The practical consequence is that **not all terms in the system have the same degree of
freedom.** On "televisita" the project has zero freedom. On "virtual waiting room" it has much,
because no higher source defines it. Confusing the two regimes leads to two symmetric errors:
stiffening what is free, and rewriting what is bound.

### 1.1 Why normative definitions are cited verbatim

In the chapters of this area the level 1 definitions are reported **textually**, with the act,
article and annex. Not paraphrased. The reason is technical: the paraphrase of a normative
definition systematically introduces a nuance that the model then inherits. Module
[02 of the foundations](../10_fondamenti/02-prestazioni-di-telemedicina.md) contains the full
texts; this area cites them only to the extent that they determine a modelling choice, and
refers for the rest.

### 1.2 The national glossary

AGENAS has published a **National Glossary of Telemedicine, v. 1.0.0 of 29 January 2026** (source:
`B1-verifiche-documentali-italiane.md`, § 14). The **Business Glossary** is moreover a declared
module of the National Telemedicine Infrastructure (DM 19 November 2025, art. 2).

> **`DM-02` [MOD]** - The project glossary ([chapter 09](09-glossario-del-dominio.md)) declares for
> each entry whether it coincides with the national glossary, whether it specialises it or
> whether it is the project's own. An undeclared divergence is a documentary defect.
>
> **[NV]** The detailed content of the national glossary v. 1.0.0 has not been read in this area:
> entry-by-entry alignment is to be performed before chapter 09 is frozen. To be asked of the
> `COMP` area, which has the documentary channel towards national sources.

## 2. The language has three incarnations and they must coincide

The project is bilingual by decision `D3` and `D50`: Italian primary language, complete English.
Code, however, is neither Italian nor English: it is **aligned to the adopted standard.** From
this follows a rule in three lines that applies to the entire system.

| Place | Language | Rule |
|---|---|---|
| **Code identifiers** (classes, fields, events, columns, endpoints) | English, aligned to FHIR R4 and national guides | `Encounter`, `MediaSession`, `ConsentRecord`. Never the Italian translation, never a convenience synonym |
| **Text of interface and documentation** | Italian primary, complete English | "contatto", "sessione", "consenso alla registrazione" (contact, session, recording consent). Strings live in the internationalisation catalogue, never in the code |
| **Names of domain events** | Italian, as already fixed in `R6` § 8.2 | `ContattoConcluso`, `RefertoFirmato`, `ConsensoRevocato` (EncounterConcluded, ReportSigned, ConsentRevoked) |

The asymmetry between the second and third lines is deliberate and must be explained, because at
first glance it seems incoherent. Structural identifiers follow the standard because they must
correspond one-to-one to resources and elements crossing the interoperability boundary: a field
called `dataInizioErogazione` mapping to `Encounter.period.start` forces a mental translation
on every reading. **Domain events**, instead, do not cross any standard: they are the internal
vocabulary of the domain, and they are the only technical artefact that a clinician can read and
verify. `ContattoConcluso` is verifiable by those who know the domain; `EncounterFinishedEvent`
is not.

> **`DM-03` [MOD]** - A domain event whose name is not comprehensible to a healthcare professional
> who does not know the code is poorly named. The acceptance criterion is literal: the name of
> the event is read to a healthcare professional and asked what happened. If they cannot answer,
> the name changes.

### 2.1 The translation trap of displays

There is a case in which translation is forbidden for licensing reasons, not style. The
`Coding.display` strings of a third-party terminology belong to the terminology owner; a
translation of them is a **derivative work** which, in LOINC's case, is assigned to Regenstrief
(decision `D34`).

> **[BASE]** The project's internationalisation strings are **architecturally separate** from
> `Coding.display` (`04_BASELINE_ARCHITETTURALE.md` § 7). The label that the user reads is
> never the official translated display: it is a project string, linked to the code, with its
> own lifecycle.

Chapter [07](07-terminologie-nel-dominio.md) describes its data structure. Here it is enough the
linguistic rule: **the official display and the interface label are two different terms of the
ubiquitous language**, and calling them both "description" is the beginning of the problem.

## 3. Terms with normative definition

They are the terms on which the project has zero degree of freedom. The table reports the exact
source and - the decisive column - **what the model is obliged to represent** so as not to
betray the definition. Full texts are in module
[02 of the foundations](../10_fondamenti/02-prestazioni-di-telemedicina.md) § 4.

| Term | Normative source | Modelling constraint that derives from it |
|---|---|---|
| **Televisita** | State-Regions Agreement 17 December 2020, rep. acts no. 215/CSR, Annex A; DM 21 September 2022, Annex A, Appendix | Medical **act**, in **real time**, with the patient. It is "limited to control activities of patients whose diagnosis has already been formulated in the course of an in-person visit". The model must represent the admissibility condition and the justified waiver, not presume them |
| **Medical teleconsulto** | Agreement 215/CSR 2020, Annex A | Between **two or more doctors**; the patient may be absent; **asynchrony is permitted**; "contributes to the definition of the report […] but does not give rise to a report of its own". The model cannot generate an autonomous specialist-to-specialist consultation report |
| **Teleconsulenza medico-sanitaria** | Agreement 215/CSR 2020, Annex A | Between healthcare professionals with **different responsibilities**, not necessarily doctors; **always scheduled**; **explicit prohibition** of use as a substitute for rescue services |
| **Teleassistenza** | Agreement 215/CSR 2020, Annex A; DM 21 September 2022, Annex A | Act **within the remit of non-medical healthcare profession**; with patient or carer; predominantly scheduled and repeatable. The DM imposes that the service also make available the functionalities of remote consultation and remote monitoring |
| **Telerefertazione** | Agreement 215/CSR 2020, Annex A | **Asynchronous** act on an already-acquired examination; "digitally signed signature of the responsible doctor"; does not generate contact with the patient |
| **Telemonitoraggio** | Agreement 215/CSR 2020, Annex A; DM 21 September 2022, Annex A | Detection and remote transmission of parameters; "does not come under ambulatory specialist care, unless accompanied by medical telecontrol, a remote consultation or also an in-person visit" |
| **Telecontrollo medico** | Agreement 215/CSR 2020, Annex A | **Medical** service at scheduled contacts, with videocall and data sharing. It is at the nomenclature; remote monitoring alone is not |
| **Minimum services** | DM 21 September 2022, Annex A, Section 1 | They are **four**: televisita; teleconsulto/teleconsulenza; telemonitoraggio; teleassistenza. They do not coincide with the five activities of the 2020 Agreement |
| **Service centre** / **Delivering centre** | DM 21 September 2022, Annex A | Two distinct subjects: **purely technical** tasks the first, **purely healthcare** the second. They manage different alarm classes. The roles model must be able to separate them |
| **Report** | DM 7 September 2023, art. 3, c. 1, lett. b); DM 19 November 2025, art. 7 | Documentary typology of the record. For remote consultation there exists from DM 19 November 2025 its own typology: "specialist report for remote consultation", lett. p) |
| **Suppression** | DM 7 September 2023, art. 9 | Right exercisable before, during or after feeding; must take place "in such a way as to ensure that all subjects authorised to access cannot automatically come to know that the beneficiary has made such a choice" (c. 6) |
| **Data with greater anonymity protection** | DM 7 September 2023, art. 6 | Closed and named category; visible to third parties only with explicit, informed and specific consent given to the delivering subject |
| **Feeding the record** | DM 7 September 2023, arts. 12–13 | Obligation within **five days** of delivery, with liability for missing, untimely or inaccurate feeding |
| **Data controller for care purposes** | DM 7 September 2023, art. 12, c. 2 | Is the subject **at which data and documents are drafted**. It is not the platform |

### 3.1 The two taxonomies that do not coincide

It is the point at which Italian normative language is internally misaligned, and hence the point
at which a naive model breaks.

- The **Agreement 215/CSR 2020** lists **five outpatient activities** - televisita, teleconsulto,
  teleconsulenza, teleassistenza, telerefertazione - plus telecontrol and telemonitoraggio as
  "operating modes".
- The **DM 21 September 2022** lists **four minimum services** - televisita,
  teleconsulto/teleconsulenza, telemonitoraggio, teleassistenza - unifying teleconsulto and
  teleconsulenza, promoting telemonitoraggio to service and demoting telerefertazione to
  transversal micro-service ("reporting and digital signature").

> **`DM-04` [MOD]** - The model represents **both taxonomies and their mapping**, and chooses
> neither one. Concretely: the service type bears two distinct attributes -
> `attivitaAccordo2020` and `servizioMinimoDM2022` - because they serve different purposes. The
> first determines permitted actors, documentary obligations and tariff regime; the second
> determines linkage to a regional infrastructure and the scope of expected micro-services.
>
> A single `enum` with seven values seems simpler and produces, at the first regional tender, a
> mapping implicit in code written somewhere by hand.

### 3.2 The mapping, made explicit

| Activity of Agreement 215/CSR 2020 | Minimum service of DM 21 September 2022 | Observation |
|---|---|---|
| Televisita | Televisita | full correspondence |
| Medical teleconsulto | Teleconsulto/teleconsulenza | **two activities in one service**: permitted actors remain different |
| Teleconsulenza medico-sanitaria | Teleconsulto/teleconsulenza | ditto |
| Teleassistenza | Teleassistenza | the decree adds the hybrid functional constraint |
| Telerefertazione | *(none)* | demoted to transversal micro-service "reporting and digital signature" |
| Telemonitoraggio *(operating mode)* | Telemonitoraggio | **promoted** to minimum service |
| Telecontrollo medico *(operating mode)* | *(none)* | remains operating mode; but is a nomenclature service |

Three practical consequences flow from this table and must be kept in mind in every subsequent
chapter.

1. **The professional constraint applies to the activity, not the service.** A single minimum
   service covers specialist-to-specialist consultation and teleconsulenza, which have different permitted actors: doctors
   the first, healthcare professions with different responsibilities the second. Authorising at
   the service level means authorising too much.
2. **Telerefertazione exists as an act and not as a service.** It must be represented, because
   the Agreement defines it and fixes its signature obligations, but it does not contribute to
   the perimeter of minimum services.
3. **Telecontrol is the only charged service in the monitoring area.** Remote monitoring alone
   "does not come under ambulatory specialist care": the distinction decides whether or not a
   billable event exists.

## 4. Terms with operative definition of the project

They are level 4 terms: no higher source defines them, the project defines them and
**declares it**. Each is here accompanied by the reason it exists - an operative term without
necessity is noise in the vocabulary.

| Project term | Operative definition | Why a specific term is needed |
|---|---|---|
| **Media session** | Instance of real-time connection between act participants, with own negotiation, quality and lifecycle | "Session" alone is ambiguous between clinical act, connection and billable unit (`R6` § 8.1). The compound term makes the `V-01` boundary visible in the language |
| **Pre-technical verification** | Checking of device, permissions, bandwidth and relay reachability performed **before** entry into the waiting area, with recorded outcome | The regulation does not name it, but Agreement 215/CSR 2020 imposes on the doctor the attestation of connection adequacy: the attestation needs a registered fact to refer to |
| **Digital compliance of the beneficiary** | Ascertainment of the person's ability to interact with digital systems, distinct from technical verification of the device | Introduced by the AGENAS *Orientative Model of remote consultation delivery*, v. 1.0.25 of 16 April 2026, as a phase of "executability verification" **[RECOMMENDED, not binding]**. It is a **property of the person**, not the device: confusing them produces a green pre-check on a patient who does not know how to use the system |
| **Consultation scope** | Closed and ephemeral set of documents to which a consultant accesses by force of a specialist-to-specialist consultation request, with expiry | The consultant has no title to the record: an object is needed that represents *what* was shown to them and *for how long* (`BR-014`) |
| **Reporting window** | Interval between contact conclusion and deadline by which the document must be signed | Reporting time is a measurable fact with organisational consequences (`BR-042`); without a domain term it remains a number in a report |
| **Contact outcome** | Structured code that declares how the act concluded, distinct from contact state | State says *where* the contact is; outcome says *what happened*. `EX-NOSHOW` and `EX-TECH-PATIENT` are two outcomes of the same terminal state, with opposite administrative effects (`BR-024`) |
| **Channel fallback** | Declared passage from one channel to another during the act, with recorded motivation | "Fallback" is a technical term; here it is a clinical-administrative fact that can affect the nature of the act (`BR-006`) and must be named as such |
| **Declared service hours** | Time band and days on which the service guarantees picking up alarms and response, made explicit to the beneficiary | It is a **safety requirement**, not a commercial parameter: a poorly declared service produces false reassurance (module [10 of the
foundations](../10_fondamenti/10-percorsi-di-cura-e-sicurezza.md) § 4.5; question `Q-14` on the board) |
| **Canonical dataset** | Representation of the information content of a document, independent of serialisation format | Imposed by `V-07`. Without its own term the tendency is to say "the CDA" and in three months the model depends on the template |
| **Access register** | Append-only chain with hashes, conserved separately, that records who did what to which subject | "Audit" in current Italian also means accounting review and compliance verification. The compound term prevents `V-04` from being satisfied with entity versioning (`D42`) |

## 5. False synonyms

They are pairs of terms that everyday language swaps and that the model cannot swap. Each is an
aggregate boundary, an authorisation constraint or a billing rule. The final column indicates
the defect produced by merging the two concepts.

### 5.1 Beneficiary and patient

**Beneficiary** is an administrative qualification: entitlement to assistance from a healthcare
service or body. **Patient** is a clinical qualification: recipient of a healthcare act. The same
person is a beneficiary without being a patient for years.

The model feels it at one precise point: the rules of access to administrative data (exemptions,
contact details, choice of doctor) and those of access to clinical data have different domains.
A front-office operator works on the beneficiary; must not be able to work on the patient. If
the model has a single entity with a single set of permissions, the separation must be
reconstructed by hand on every field - and sooner or later someone forgets a field.

### 5.2 Requested service, executed service, billed service

Three concepts that Italian calls with one word. They are three entities with **distinct
lifecycles, authors and states**: the request is born from the prescriber and may never be
executed; execution is born from the delivering party and can happen without request; billing
is born from administration and may not follow execution (exempt service, non-tariffed service
like specialist-to-specialist consultation).

> **`DM-05` [MOD]** - The model contains no entity called "Service". It contains `ServiceRequest`
> (request), the executed act represented by the `Encounter` and its procedures, and the
> billable event. The Italian term "prestazione" remains in spoken language and documentation,
> always qualified: requested *service*, *delivered*, *billed*.

### 5.3 Delivered, reported, dispensed, billed

Four successive states none of which automatically implies the other. A delivered service and
not reported is visible non-performance; a reported one and not dispensed may be a legitimate
clinical choice (deferred dispensing, `BR-047`); a dispensed one and not billed is an
administrative problem, not clinical.

The typical defect is a single `state` field with a value `completata` (completed) that means
one of the four things depending on who looks at it. Chapter [02](02-le-prestazioni-modellate.md)
separates the four moments into distinct states precisely for this reason.

### 5.4 Authentication and identification

**Authentication** ascertains that the person who logged in possesses a credential.
**Identification** ascertains that the person in front of the camera is the expected patient.
They are two checks, at two moments, with two evidences and two responsible parties: the first
is the system's, the second is **an act of the professional** (`BR-031`).

A system that treats authentication as identification does not have an abstract security defect:
it has a defect that manifests the day a family member logs in with the patient's credentials
and the session is duly identified.

### 5.5 Consent to healthcare act and consent to data processing

Two manifestations of will with different legal nature, effects and revocability. Module
[03 of the foundations](../10_fondamenti/03-il-dato-clinico.md) § 2 explains why, for care
purposes, consent is not typically the legal basis for processing. Here what matters is the
consequence for the model: **merging them into a single object makes revocation ungovernable**,
because revocation of consent to the act interrupts care while revocation of consent to an
accessory processing must not. Chapter [06](06-consenso-e-riservatezza.md) keeps four objects
distinct, not two.

### 5.6 Carer and legal representative

**Assisting is not representing.** The carer accompanies, helps, can be present in session;
cannot give consent on behalf of a capable patient, in any configuration (`BR-062`). The legal
representative substitutes or integrates will, **within the limits of the title**.

Additional, subtler error: treating the administrator of a support order as a guardian. The
administrator's powers are delimited by the appointment decree and may not include healthcare
decisions: they must be registered as **scope** and verified **per act** (`BR-063`).

### 5.7 Draft and report

An unsigned draft **is not a report**: it is not visible to the patient, is not transmissible,
is not conserved as a healthcare document (`BR-041`). Everyday language says "the report is in
draft", and the model following language creates a `Report` with `state = draft` - from which,
sooner or later, someone extracts a list without filtering the state.

Chapter [04](04-documenti-clinici.md) keeps the document in drafting state as an object of the
documentary context, not as a healthcare document, and derives visibility rules from it.

### 5.8 Suppression and deletion

Suppression makes a document invisible to certain subjects; **does not delete it** and does not
remove it from those who produced it, who continue to see it (DM 7 September 2023, art. 8, c.
7 and art. 15, c. 5). Deletion is another thing, and in the healthcare sector it encounters
limits deriving from conservation obligations (`BR-081`).

### 5.9 Record, record, record

Three containers at three scales, with three different access regimes: the **electronic health
record** is national-regional and under the beneficiary's control; the **healthcare record** is
the set of data at a single structure; the **local electronic health record** is the repository
of the single delivering party. In the integration model the record remains with the partner
system (`00_PROJECT_BRIEF.md` § 6.2.5).

### 5.10 Slot and appointment

An occupied slot is not an appointment: it is its **projection on the agenda**. Merging them
makes impossible to represent controlled overbooking (`BR-023`) and produces, under concurrency,
double booking (`BR-020`).

### 5.11 Technical threshold and clinical threshold

A **technical threshold** concerns the channel (packet loss, delay, bandwidth) and is a
product specification configurable per tenant. A **clinical threshold** concerns a patient
parameter and is configuration **per beneficiary**, decided by the professional (`V-02`).

Neither is imposed by Italian regulation: the constraint `V-12` on the board declares it as a
fact verified in `B1`, § "Minimum technical requirements". Calling them both "threshold" in a
single configuration module is the error that leads to exposing to a tenant administrator a
field that is individual clinical decision.

### 5.12 Technical alarm and clinical alarm

Follows from the preceding and has a different recipient: the technical alarm goes to the
**service centre**, the clinical one to the **delivering centre** (DM 21 September 2022, Annex A).
A single queue of notifications produces two effects, both grave: the technician receiving a
clinical alarm and the clinician habituated to technical alarms.

### 5.13 Adherence and transmission

**Adherence** is the person's behaviour with respect to the plan; **transmission** is the
arrival of the data. They are correlated and do not coincide: a missing datum can indicate a
non-adherent patient, a faulty device, an interrupted ingestion chain or clinical deterioration
that prevents measurement. Module [10 of the
foundations](../10_fondamenti/10-percorsi-di-cura-e-sicurezza.md) § 8.3 gives the taxonomy; chapter
[05](05-parametri-e-osservazioni.md) makes it model.

### 5.14 Tenant, organisation, delivering structure, integrator

Four concepts that coincide in simple cases and diverge in real ones. The **tenant** is the
isolation boundary (`V-04`); the **organisation** is a legal subject; the **delivering
structure** is who answers for delivery; the **integrator** is an application principal, not a
user. A tenant can contain multiple delivering structures; an integrator can operate on multiple
tenants.

## 6. Collisions: the same word in two domains

Different from false synonyms: here the problem is not that two terms are confused, but that
**one word has two legitimate meanings** in two contexts that coexist in the product. The
solution is not to choose: it is to qualify always.

| Word | Clinical-administrative meaning | Informatic meaning | Disambiguation used |
|---|---|---|---|
| **Session** | Clinical act; billable unit | Media connection; application session | *contact* / *media session* / *application session*. Never "session" alone |
| **Contact** | Interaction between patient and delivery system | Telephone or e-mail number | `Encounter` in the code; *contact* for the second. Never `Contact`, which collides with `Patient.contact` |
| **Ticket** | Cost sharing | Support request | *cost sharing* / *support request* |
| **Teleassistenza** | Remote healthcare professional act | Remote technical assistance to user | *teleassistenza* / *technical support*. In the code `TeleAssistanceEncounter` vs `SupportTicket` |
| **Register (log)** | Register of accesses, non-repudiable | Application diagnostics file | *access register* / *diagnostics register*. They are not the same artefact (`D42`) |
| **Signature** | Signature with evidentiary value | Cryptographic signature of a message | *document signature* / *message signature*. Levels and consequences differ |
| **Priority** | Urgency class of the requested service | Processing priority of a message | *priority code* / *delivery priority* |
| **State** | Patient's clinical state | State of a state machine | *clinical condition* / *contact state*. Never `status` without qualifier in an interface for clinicians |
| **Plan** | Care plan, therapeutic plan, monitoring plan | Execution plan, release plan | Always qualified. Chapter [08](08-percorsi-e-piani-di-cura.md) distinguishes four clinical "plans" among themselves |
| **Monitoring** | Monitoring of the patient | Technical monitoring of the platform | *telemonitoraggio* / *observability*. Two different bounded contexts |
| **Verification** | Verification of clinical executability | Technical verification of the device | *executability verification* / *pre-technical verification* |
| **Validation** | Clinical validation of a document by the doctor | Syntactic validation of a resource | *clinical validation* / *formal validation* |

> **`DM-06` [MOD]** - None of the words of the first column appear alone in a class name, column,
> endpoint, event or interface label. The check is automatable and must be inserted among the
> style verifications of the project: it is a list of twelve words, not a principle.

## 7. Language as versioned artefact

An ubiquitous language that has no owner and process degrades in six months. The rules that
follow are operative, not exhortatory.

1. **A term enters the language only with its source.** Level 1, 2 or 3 with exact citation;
   level 4 with the reason it is necessary. A term without source and without necessity is
   rejected in review.
2. **A term is not renamed, it is deprecated.** Renaming breaks the correspondence between code
   already written, data already recorded and events already published. The old term remains in
   the glossary, marked as deprecated, with reference to the new one and the date.
3. **Divergence between Italian and English is a blocking defect.** `D50` imposes completeness;
   the check in continuous integration flags documents modified in Italian without the
   corresponding English. For the glossary the rule is stricter: an Italian entry without a
   translation is not an entry.
4. **Every new domain event passes through the glossary.** The event name is a language term: if
   it is not in the glossary, the event does not yet exist.
5. **Clinical review of the vocabulary is not optional.** Level 1 and 2 entries must be verified
   by those who know the healthcare domain before freezing; level 4 ones must be verified by
   those who know the architecture.

### 7.1 Relationship with frozen identifiers

`D45` imposes freezing of requirement identifiers `RF-*`, `RNF-*`, `BR-*`: the traceability
required by IEC 62304 cannot be reconstructed after the fact. From this follows a linguistic
rule valid for this area and all others:

> **The text of a requirement can be clarified; its identifier never changes, and its meaning
> cannot be moved.** If the meaning changes, a new identifier is issued and the substitution is
> declared. A `BR-030` that in 2027 means something different from today is worse than a
> `BR-030` absent.

## 8. What does not enter the ubiquitous language

A vocabulary also grows by accumulation, and accumulation makes it unusable. Four categories are
excluded by construction.

- **Marketing terms.** "Clinical quality", "seamless experience", "intelligent platform" have
  no verifiable definition. `D29` imposes that clinical claims be recast into verifiable
  technical statements: the ubiquitous language is the place where this discipline applies first.
- **Names of vendors, products and brands.** `R0` is absolute. In the domain language there are
  "a third-party EHR system", "the integrator", "the national or regional document repository",
  "the digital identity provider": never a name.
- **Terms that describe implementation and not domain.** "Queue", "cache", "partition", "pool"
  belong to the technical language of the modules on
  [informatic foundations](../10_fondamenti/11-fondamenti-informatici.md), not the domain
  language. A domain event called `MessageQueued` is describing transport, not the fact.
- **Unexpanded acronyms.** `D35` imposes it on the foundations guide; this area extends it to
  vocabulary: an acronym enters the glossary with the expanded Italian form, the expanded English
  form and the source.

## 9. Verification of the language: five tests that can be run

They are not metaphors. They are verifiable checks on a working branch before merge.

| # | Test | How to execute | What defect it intercepts |
|---|---|---|---|
| 1 | **Test of reading to the clinician** | The name of every new domain event is read to a healthcare professional | Events named on implementation |
| 2 | **Test of the twelve words** | Automatic check that none of the words of § 6 appears unqualified in identifiers or labels | Terminological collisions reintroduced |
| 3 | **Test of the source** | Every new glossary entry has a level 1–3 source or a level 4 motivation | Terms invented for convenience |
| 4 | **Test of the translation** | Every Italian entry has the English translation and vice versa | Divergence `D50` |
| 5 | **Test of crossing** | For every term crossing the interoperability boundary: there is explicit correspondence with the standard element | Internal model silently moving away from national profile |

## Remember

1. **Not all vocabulary is ours.** On televisita, teleconsulto, report, suppression freedom is
   zero: the definition is normative and must be cited textually, not paraphrased.
2. **The precedence rule is four-level** and applies mechanically: Italian regulation, national
   guide, adopted standard, project definition. A conflict is resolved upward.
3. **The two national taxonomies do not coincide** and the model represents both with their
   mapping, never one alone.
4. **Code in English aligned to the standard, interface in Italian, domain events in Italian.**
   The asymmetry is deliberate: the event is the only technical artefact a clinician can verify.
5. **Interface strings are not `Coding.display`.** It is an architectural separation imposed by
   `D34`, not a style choice.
6. **Fourteen pairs of false synonyms** determine aggregate boundaries, authorisation rules and
   billing rules. They are the index of the chapters that follow.
7. **Twelve words have two legitimate meanings**: they are always qualified, and the check is
   automatable.
8. **A term is not renamed, it is deprecated.** Requirement identifiers never change, and their
   meaning never moves.

## Where to continue

- [02 - Services modelled](02-le-prestazioni-modellate.md): normative vocabulary becomes state
  machines.
- [09 - Domain glossary](09-glossario-del-dominio.md): the alphabetical bilingual list with
  cross-references.
- Module [02 of the foundations](../10_fondamenti/02-prestazioni-di-telemedicina.md): the full
  normative texts, which this area does not repeat.
