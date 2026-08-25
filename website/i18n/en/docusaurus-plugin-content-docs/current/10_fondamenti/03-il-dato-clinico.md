---
title: The clinical datum
sidebar_position: 4
description: What data concerning health is, why art. 9 GDPR makes it a special category, legal basis versus informed consent, data protection roles, pseudonymisation, organisational health record/clinical record/national health record, reports and signatures, retention, data suppression, DPIA, breaches and the absolute rule on synthetic data.
---

# The clinical datum

An ordinary information system processes data which, if exposed, causes economic or
reputational harm. A healthcare system processes data which, if exposed, may cost a person
their job, their insurance cover, custody of a child, a relationship, their social standing,
and in some cases their physical safety.

This is not a moral consideration added on to the design: it is the reason why European law
places this data in a category subject to a prohibition in principle, and why a great many
architectural choices that would be legitimate elsewhere are not legitimate here.

This module explains what data concerning health is, what obligations follow from it, and how
those obligations translate into decisions in code. It presupposes no notions of law: every
legal institution is explained from scratch. It does, however, presuppose module
[01](01-sistema-sanitario-italiano.md), because some examples use the vocabulary of the
Italian healthcare system.

---

## 1. Data concerning health

### 1.1 The definition

**Regulation (EU) 2016/679**, commonly the **GDPR** (*General Data Protection Regulation*),
defines at **art. 4(15)**:

> «*data concerning health*» means personal data related to the physical or mental health of
> a natural person, including the provision of health care services, **which reveal
> information about his or her health status**.

**Recital 35** broadens this decisively:

> Personal data concerning health should include all data pertaining to the health status of a
> data subject which reveal information relating to the past, current or future physical or
> mental health status of the data subject. This includes information about the natural person
> collected **in the course of the registration for, or the provision of, health care
> services** […]; **a number, symbol or particular assigned to a natural person to uniquely
> identify the natural person for health purposes**; information derived from the testing or
> examination of a body part or bodily substance […]; and any information on, for example, a
> disease, disability, disease risk, medical history, clinical treatment or the physiological
> or biomedical state of the data subject, **independent of its source**.

The two emphasised expressions blow up the common intuition. It is not only the report that is
health data: **the very fact of having registered in order to receive care** is health data.

### 1.2 Why almost everything in this system is health data

Let us apply the definition to the project's domain. Data concerning health — with all the
consequences — also includes:

- **the existence of an appointment with a particular clinical specialty.** An appointment in
  oncology reveals a suspected or confirmed cancer diagnosis. An appointment at an addiction
  service reveals an addiction;
- **the exemption code by condition**, which *is* the condition in coded form (module
  [01](01-sistema-sanitario-italiano.md), § 7.4);
- **the delivery address of a remote monitoring device**, which reveals that that person is on
  a home monitoring pathway;
- **the frequency and duration of sessions** with a psychotherapist;
- **the name of the professional** one has an encounter with, if their specialty is public;
- **the type of service** in a reminder sent by SMS;
- **the device card** with the model and manufacturer of an assigned medical apparatus.

Hence a design rule that the project adopts as a constraint: **«administrative» objects are not
neutral**. There is no «registry and diary» schema to which attenuated safeguards can be
applied because «it contains no clinical data». It contains health data by inference, and
inference is exactly what recital 35 means by «reveal».

An immediate and non-negotiable operational consequence: **an appointment reminder may not
contain any clinical datum**. Date, time, organisation, link. No service, no specialty, no ward
name.

### 1.3 The special category: prohibition in principle, exhaustive derogations

**Art. 9(1)** of the GDPR establishes a **prohibition**:

> Processing of personal data revealing racial or ethnic origin, political opinions, religious
> or philosophical beliefs, or trade union membership, and the processing of genetic data,
> biometric data for the purpose of uniquely identifying a natural person, **data concerning
> health** or data concerning a natural person's sex life or sexual orientation shall be
> prohibited.

This is the structural difference from all other personal data. For ordinary data the rule is:
you may process, provided a legal basis exists among those of art. 6. For special categories
the rule is: **it is prohibited**, unless one of the exhaustive derogations of art. 9(2)
applies — **and in addition** a legal basis under art. 6.

Two **cumulative conditions** are required, not one. It is the commonest mistake in compliance
self-assessments: identifying the art. 9 derogation and stopping there.

The derogations relevant to this domain:

| Letter of art. 9(2) | Content | Typical use here |
|---|---|---|
| **h)** | Purposes of preventive or occupational medicine, diagnosis, **health or social care or treatment**, the management of health systems and services, on the basis of Union or Member State law | **The ordinary basis for care** |
| **i)** | Reasons of public interest in the area of public health | Epidemiological surveillance, emergencies |
| **j)** | Purposes of scientific or statistical research or archiving in the public interest | Research, including in IRCCS |
| **a)** | Explicit consent of the data subject | Residual cases: session recording, further purposes |
| **c)** | Vital interests, where the data subject is incapable of giving consent | Emergency, *break-glass* access |
| **f)** | Establishment, exercise or defence of legal claims | Litigation |

**Art. 9(3)** adds a condition essential to letter h): the data must be processed «*by or under
the responsibility of a professional subject to the obligation of professional secrecy*» or by
another person also subject to an obligation of secrecy. **The care derogation is not available
to anyone**: it presupposes the care relationship and the duty of secrecy.

### 1.4 The completing Italian legislation

The GDPR leaves the Member States room to act, and Italy has exercised it with **D.lgs. 30
giugno 2003, n. 196** (the Personal Data Protection Code), extensively amended by **D.lgs. 10
agosto 2018, n. 101**. Two articles matter here:

- **art. 2-*septies*** — the Garante per la protezione dei dati personali (the Italian data
  protection authority) adopts **safeguard measures** for the processing of genetic, biometric
  and health data. These are further binding prescriptions, updated periodically. `[NV]` on the
  list of measures in force as at today's date: they must be checked on the authority's website
  before deriving requirements from them;
- **art. 2-*sexies*** — it identifies the reasons of substantial public interest that allow
  public bodies to process special categories, requiring that they be provided for by law or
  regulation.

---

## 2. Legal basis and informed consent: two different things

### 2.1 The most costly confusion in the domain

Those arriving from computing carry a single mental model: «consent». There is a banner, the
user clicks, the processing becomes lawful. In healthcare this model is **doubly wrong**, and
it produces architectural errors that are discovered late and cost a lot.

There are two institutions with similar names and wholly different natures.

**Informed consent to a health act.** This is an institution of **health law**, governed in
Italy by **legge 22 dicembre 2017, n. 219** («Rules on informed consent and advance
directives»). It concerns a person's will to **undergo a health treatment**. Its foundation is
art. 32 of the Constitution: no one may be obliged to undergo a health treatment except by
provision of law. If it is missing, the medical act is unlawful regardless of any consideration
about data.

**The legal basis for processing the data.** This is an institution of **data protection law**.
It answers the question: why is it lawful to process this data? Consent is **one of the possible
answers**, and in the context of care **it is not the normal one**.

### 2.2 Why consent is not the legal basis for care

Consent, within the meaning of art. 4(11) and art. 7 of the GDPR, must be **freely given,
specific, informed, unambiguous** and **withdrawable at any time as easily as it was given**.

Now consider what would happen if the processing of data for the purpose of care rested on
consent:

- the patient could **withdraw it halfway through a course of treatment**, obliging the
  organisation to cease processing their data — that is, to stop being able to treat them
  safely;
- consent would not be **freely given**, because refusal would entail the impossibility of
  receiving the service: there is no genuine possibility of choice;
- the organisation would be unable to discharge the **legal obligations** (health
  documentation, feeding the health record, reimbursement reporting flows) that exist
  independently of the patient's will.

For this reason the ordinary legal basis for care is the combination of **art. 6(1)(c) or
6(1)(e)** (legal obligation, or public interest or exercise of official authority) **plus art.
9(2)(h)** (purposes of health or social care or treatment) **plus art. 9(3)** (professional
subject to secrecy). **Asking for consent where it is not needed is not an extra precaution: it
is a defect**, because it creates a revocability that the law does not provide for and that, if
honoured, blocks care; and if not honoured, makes the system inconsistent with what it has
declared.

### 2.3 The four objects to be kept apart

The project codifies as a domain rule the separation of at least four distinct expressions of
will, each collected, withdrawn and retained separately:

| Object | Nature | Basis or foundation | Effect of withdrawal |
|---|---|---|---|
| **Informed consent to the health act** | Clinical act | L. 219/2017; art. 32 of the Constitution | The act may not be performed, or must be interrupted |
| **Informed acceptance of the telemedicine service** | Clinical and organisational act | Accordo 215/CSR 2020 | The remote channel may not be used; the in-person service remains |
| **Legal basis for processing the data** | Data protection | Art. 6 + art. 9(2) GDPR | If the basis is consent, future processing ceases; if it is not, there is no withdrawal |
| **Consent to the recording of the session** | Data protection, explicit consent under art. 9(2)(a) | Consent | Immediate interruption of the recording in progress |
| **Consent to the presence of third parties** (interpreter, student, observer) | Data protection and the care relationship | Consent | The third party leaves the session |
| **Consent to consultation of the health record by third parties** | Data protection | Explicit consent under DM 7 settembre 2023, art. 8 | Third parties do not consult; whoever produced the document continues to see it |

Two further rules that the project treats as invariants:

- **every consent records the exact version of the privacy notice or of the text presented**,
  the instant, the channel, the identity of the declarant and — if different — that of the data
  subject. A consent not referred to a versioned text is **impossible to demonstrate**: in
  litigation one cannot prove *what* the person consented to;
- **a carer does not give consent in substitution for a patient with capacity**, in any
  configuration. Assisting is not representing. For a person without capacity, titles of
  representation are needed, and the **support administrator** has powers **delimited by the
  appointing decree**, which may or may not include healthcare decisions: the system must record
  the **scope** of the powers and check it against the act requested, not treat them as a
  guardian.

### 2.4 Consent in the health record: a case apart

The electronic health record has its own regime which must be known because it contradicts
intuition. **DM 7 settembre 2023, art. 8**:

- **feeding** the health record **does not require consent**: it is a legal obligation on
  providers (art. 12);
- **consultation by third parties** is, by contrast, subject to **freely given, specific,
  informed, unambiguous and explicit consent**, separate for the purposes of care, of prevention
  and of international prophylaxis;
- the purposes of **governance** and of **research** operate on pseudonymised data and do not
  require that consent;
- «*the data and documents present in the health record **are always consultable, in addition
  to by the patient, by the parties who produced them***» (art. 8, para. 7).

One may therefore feed without being able to consult what came before. **These are two distinct
permissions**, and a model that unifies them in a single flag is not implementable.

---

## 3. Controller, processor, joint controller: who is what

### 3.1 The definitions

- **Data controller** (art. 4(7)) — the party that **determines the purposes and means** of the
  processing. It is the party answerable to the data subject and to the authority.
- **Data processor** (art. 4(8)) — the party that processes **on behalf of the controller**, on
  the basis of a contract or other legal act complying with the contents of **art. 28**. It does
  not decide the purposes; it carries out documented instructions.
- **Joint controllers** (art. 26) — two or more controllers that **jointly determine** the
  purposes and means. They must define their respective responsibilities in a transparent
  arrangement, and the data subject may exercise their rights against each of them.
- **Sub-processor** (art. 28(2) and (4)) — the processor may engage other processors only with
  the controller's authorisation, and remains fully liable for their performance.
- **Data protection officer (DPO)** (arts. 37-39) — a supervisory figure and point of contact.
  **Mandatory** where the processing concerns special categories of data on a large scale.

### 3.2 Who is what in an installation of this project

The answer depends on the distribution model, and it is not the same in the two cases provided
for.

**Installation at the provider (*on-premise*, single tenant).**

| Party | Role |
|---|---|
| Care provider organisation (ASL, hospital trust, practice, polyclinic) | **Controller** for the purpose of care |
| Healthcare professional operating autonomously | **Controller** for their own acts |
| Supplier that runs the installation, where there is one | **Processor**, under an art. 28 contract |
| Supplier of the TURN service, of the email or SMS gateway, of the preservation service | **Sub-processors**, to be recorded in the register and in the contractual chain |
| The project as such | **No role**: it distributes source code, it does not process data |

**Multi-tenant installation run by an operator.**

| Party | Role |
|---|---|
| Each tenant (organisation or professional) | **Autonomous controller** for its own data |
| Platform operator | **Processor** for each controller |
| Platform operator, for its own technical logs, security and billing | **Controller** for those distinct purposes |

The second case gives rise to a precise architectural requirement: **the data model must be able
to represent different controllers on the same installation**, with different privacy notices,
different registers, different retention periods and different data protection officers. This is
not a reporting function: it is the tenant-awareness constraint, whereby every row of data,
every domain event and every audit entry carries the tenant identifier, and **a write without a
tenant is an error, not a tolerated null value**.

### 3.3 The roles in the national ecosystem

In the Italian public architecture, controllership is distributed by law, not by contract:

- the parties that have the patient in their care, «*at which the health data and documents that
  feed the health record are drawn up, **are controllers for the purpose of care***» (DM 7
  settembre 2023, art. 12, para. 2);
- **AGENAS** is controller only for the processing operations of the national telemedicine
  infrastructure;
- **the Regions and the Autonomous Provinces** are controllers for the regional
  infrastructures;
- **the Regions** are controllers for the formal and semantic verification of documents (art.
  13);
- digital identity providers are controllers for identification; the Region of delivery for the
  authentication of professionals; the Region of entitlement for that of patients (DM 19
  novembre 2025, Annex 3, § 5).

### 3.4 The system administrator

Whoever holds elevated technical privileges over a system that processes health data is, in the
lexicon of the Italian authority, a **system administrator**, and their position is subject to
specific prescriptions: individual designation, an up-to-date list, periodic review of their
activity, recording of accesses with characteristics of completeness, unalterability and
minimum retention. The historical source is the authority's general measure of 27 November 2008
and subsequent amendments. `[NV]` on the wording and on the full post-GDPR validity of the
individual prescriptions: this must be checked before deriving specific requirements from them.

Regardless of that check, the project adopts a stricter and architecturally explicit posture:
**the system administrator is designed as a role without clear-text access to clinical
content**, with actions always traced and, for critical operations, dual control. Likewise, the
tenant administrator **must not be able to read the clinical data of their own tenant merely by
virtue of administering it**, and every self-assignment of a clinical role generates a
high-severity audit event.

The data protection officer, for their part, **is not a system administrator**: they must be
able to read audit trails and logs **without** being able to access clinical content, and each
of their reads is itself traced. Whoever controls is controlled.

---

## 4. Pseudonymisation and anonymisation

### 4.1 The two notions

**Pseudonymisation** (art. 4(5) GDPR): processing of data in such a manner that it can no longer
be attributed to a specific data subject **without the use of additional information**, provided
that such information is kept separately and is subject to technical and organisational
measures.

The decisive point: **pseudonymised data remains personal data**. It is a security measure, not
an exit from the scope of the Regulation. Encrypting, replacing the tax code with an opaque
identifier, replacing names with labels: all these operations reduce risk, none makes the GDPR
inapplicable.

**Anonymisation**: recital 26 defines it by exclusion. The Regulation does not apply to
anonymous information, that is, information «*which does not relate to an identified or
identifiable natural person*» or rendered anonymous «*in such a manner that the data subject is
not or no longer identifiable*». To establish identifiability «*account should be taken of all
the means […] reasonably likely to be used by the controller or by another person*».

### 4.2 Why almost no clinical datum is truly anonymous

Removing first name, surname and tax code is trivial and almost always insufficient. The
reasons:

- **quasi-identifiers.** The combination of date of birth, sex and municipality of residence is
  known to uniquely identify a high fraction of the population. Adding the date of a service and
  the providing organisation makes uniqueness almost certain;
- **clinical rarity.** A rare diagnosis in a small province identifies the person with nothing
  else needed. It is exactly why aggregation thresholds exist;
- **longitudinality.** A time series of measurements — blood pressure, blood glucose, weight —
  is a signature. Two remote monitoring time series are not confusable;
- **intrinsically identifying data.** Genetic data is so by construction. Images showing the
  face are so. Audio-video recordings are so totally: voice, face, home environment, other
  people present;
- **re-identification by difference.** Successive aggregate queries with slightly different
  filters make it possible to isolate an individual by subtraction, even if each individual
  answer respects the minimum threshold.

**The operational consequence** is that the project does not use the word «anonymous» lightly.
What the system produces is, almost always, **pseudonymised**, and as such remains subject to
all the safeguards.

### 4.3 The quantitative rules that do exist

In the national context there are two quantitative prescriptions to be known, both from DM 19
novembre 2025, Annex 4:

- **pseudonymisation is carried out by the health data ecosystem**, not by the national
  telemedicine infrastructure, and it is performed «*in sequence, automatically, **without human
  intervention and once every 24 hours***», normally at night;
- there is a requirement for «*specific verification of compliance with the clustering rules, in
  order to ensure that no result […] may be traced back to a single individual (**cardinality
  one**), irrespective of the level or dimension of analysis*».

The project adopts a consistent and more conservative rule: aggregate statistics are not
returned if the resulting group has a cardinality below a configured threshold (proposed default
value: five), **neither directly nor deducibly by difference between successive queries**. The
second part is the one that requires real work: preventing re-identification by difference means
tracking the queries or applying noise, not merely filtering the individual answer.

### 4.4 The rule on logs

From all the above follows a rule that counts as a constraint, and which § 10 takes up again:
**application logs contain no clinical content and no direct identifiers of the patient**.
Identification is done via a pseudonym, resolvable only through an authorised audit which is
itself traced. Logs are the commonest and most underestimated route of exfiltration, because
they end up in aggregation systems, in support tickets, in shared screens and in pastes into
chats.

---

## 5. Where the data sits: four different containers

This section resolves a confusion that produces wrong access rules. **The organisational health
record, the clinical record, the electronic health record and the provider's archive are four
different things**, with different scope, controllership, access rules and retention periods.

| | **Clinical record** | **Organisational health record** | **Provider's archive** | **National health record** |
|---|---|---|---|---|
| **Scope** | A single **admission episode** or pathway, at one organisation | All the data of a patient at **a single organisation** | Everything the provider holds under its own obligations | **National/regional**, the patient's whole life |
| **Who forms it** | The professionals taking part in the episode | The organisation, aggregating its own encounters | The organisation | All the providers that feed it |
| **Under whose control** | The organisation, which is its custodian | The organisation | The organisation | **The patient**, who consents, suppresses and withdraws |
| **Third-party access** | On a reasoned request, under the rules for health documentation | Internal to the organisation, with profiling | Internal | Subject to the patient's **explicit consent**, according to regulated access profiles |
| **Basis of formation** | Legal obligation tied to the health act | Processing for internal care purposes | Documentary, tax and preservation obligations | D.L. 179/2012, art. 12; DM 7 settembre 2023 |
| **Retention** | Unlimited according to settled practice `[NV]` | According to the declared purposes | According to the relevant obligation | Index and documents deleted **thirty years after death**, except the clinical record |

Some clarifications deserve to be made explicit.

**The clinical record** is the body of documentation formed during an admission episode. Case
law recognises it as having the nature of a public act when drawn up by staff of a public
organisation, with the consequence that subsequent alteration constitutes a criminal offence and
not a mere administrative error. `[NV]` on the exact qualification and on the leading judgments,
not verified in the sources consulted by the project. The practical consequence that the project
adopts in any case: **a correction is not an overwrite**. Every modification subsequent to
closure is a tracked addition, with author, instant and reason, while the previous version
remains readable.

**The organisational health record** is the set of a patient's data held at a single
organisation, built to guarantee continuity of care within it. The authority has regulated its
formation, consent and access profiling with dedicated guidelines. `[NV]` on the particulars and
the current validity of the measure.

**The provider's archive** is the most prosaic and most neglected notion: it is everything an
organisation retains because it is obliged to by non-health rules — tax, accounting, contractual
and document preservation obligations. It is the reason why the «right to erasure» has robust
limits in this sector (§ 7.3).

**The electronic health record** is not the organisation's clinical record: it is national or
regional, under the patient's control, with its own rules of feeding, consultation and
suppression. Module [07](07-fse-e-infrastrutture-nazionali.md) deals with it in full.

**Where this project sits.** In the integration model adopted, the clinical record **stays with
the originating system**: the project is not its *master*. It produces documents, returns them to
the system that has the patient in its care, and in the context of the regional infrastructures
it **does not retain** the clinical content generated (module
[02](02-prestazioni-di-telemedicina.md), § 8).

---

## 6. The documents: report, clinical letter, emergency department record, discharge letter

### 6.1 Report

A **signed** health document that sets out the outcome and conclusions of a health act,
addressed to the patient and to the requesting doctor. It is the certifying document par
excellence: it attests that a test or a visit was performed and what came out of it.

Formal requirements the project must guarantee:

- unique identification of the patient, of the **reporting doctor** and — a
  counter-intuitive datum, but one imposed by the ministerial record layout — of the **signing
  doctor**, who may be a different person;
- identification of the organisation on three levels: authority, site, operating unit;
- references to the act that gave rise to it: prescription number, CUP code, date and time of
  start and end of delivery;
- clinical content: coded diagnostic question, service performed, reporting, diagnosis,
  conclusions;
- **digital signature** and date of signature.

**An unsigned draft state is not a report**: it is a working document. Modelling the `draft`
state as distinct and non-deliverable is mandatory, and the transition to `signed` is the point
at which the document acquires legal effect and becomes unmodifiable by overwriting.

### 6.2 Clinical letter

A discursive communication between professionals about a case — typically from the consultant to
the treating clinician. **It is not a report**: it does not certify the performance of a test, it
is not necessarily addressed to the patient, and it does not have the same delivery regime.

In the telemedicine domain the category has taken on a precise regulatory form: the
**collaborative report for the teleconsulto/teleconsulenza** and the **concluding clinical and
care report for the teleassistenza** are autonomous health record document types, with a
published information set (module [02](02-prestazioni-di-telemedicina.md), § 7.1). The first
moreover has a structural rule: it is conferred on the health record **as an attachment** to the
report of the principal event.

### 6.3 Emergency department record

A document attesting attendance at the emergency department, the triage assigned, the
investigations performed, the diagnosis and the outcome (discharge, admission, transfer, refusal
of care). It is one of the historical health record document types (DM 7 settembre 2023, art. 3,
letter c). Outside the project's perimeter, but it must be known because it is the document that
precedes and justifies many subsequent pathways.

### 6.4 Hospital discharge letter

A document drawn up at the conclusion of an admission, addressed to the treating clinician,
setting out the reason for admission, the course, the investigations, the discharge diagnosis,
the therapy at discharge and the follow-up instructions. It is one of the five historical types
of natively digital health record document, together with the laboratory report, the radiology
report, the outpatient specialist report and the pathology report.

**It must not be confused with the scheda di dimissione ospedaliera (SDO, hospital discharge
record)**, which is instead an administrative record layout for reimbursement reporting, not a
clinical document addressed to the patient.

### 6.5 Progress notes

Chronological notes on the course of care, drawn up by doctors and nurses during an episode.
**They are not the report** and must not be automatically delivered to the patient: they have a
different recipient, format, signature and access regime. Confusing them with the report in a
single «clinical note» model produces undue disclosures.

---

## 7. Signature, validation, timestamp token, preservation

### 7.1 Signatures are not all the same

**Regulation (EU) No 910/2014** (**eIDAS**, *electronic IDentification, Authentication and trust
Services*), as amended by **Regulation (EU) 2024/1183**, distinguishes three levels:

| Level | Abbreviation | Characteristics | Evidential value |
|---|---|---|---|
| **Simple electronic signature** | FES | Any data in electronic form attached to other data and used to sign | It may not be rejected merely because of its electronic form, but its value is freely assessable |
| **Advanced electronic signature** | FEA | Uniquely linked to the signatory, capable of identifying them, created using means under their sole control, linked to the data such that any change is detectable | Reinforced value, but not equivalent by law to a handwritten signature |
| **Qualified electronic signature** | FEQ | An advanced signature created by a qualified device and based on a **qualified certificate** | **Legal effect equivalent to that of a handwritten signature** (art. 25(2) eIDAS) |

In the Italian legal system the **Codice dell'Amministrazione Digitale** (the Italian Digital
Administration Code, D.lgs. 82/2005) completes the picture: art. 20 governs the evidential value
of the electronic document and art. 21 the effects of signatures. A document subscribed with a
qualified or digital signature has the effect provided for by art. 2702 of the Civil Code.

**What level is needed for a report?** Agreement 215/CSR 2020 requires «digital subscription»
and, for tele-reporting, the «validated digital signature of the responsible doctor». `[NV]` on
the precise identification of the level required by law for each type of health document: this
was not verified in the sources consulted, and the choice must be documented as a decision with
its reasoning, not assumed implicitly.

**Formats.** Signatures are applied to the document in standardised formats: **PAdES** for PDF
documents, **CAdES** for generic files (extension `.p7m`), **XAdES** for XML. The national
document standard of the health record is **HL7 CDA Rel. 2**, carried inside a digitally signed
PDF — an arrangement confirmed by the national interoperability specifications.

### 7.2 Signature, validation and timestamp token are three things

- **Clinical validation** is the act by which the professional declares that the content is the
  definitive one and assumes responsibility for it. It is a domain event.
- **Signature** is the cryptographic operation that binds that content to that identity.
- **Timestamp token** (*time-stamp*) is the attestation, issued by a trust service provider,
  that that document existed in that form at that instant.

**The system date is not a timestamp token.** A `created_at` written by the application is a
datum that the operator of the application can alter: it is not enforceable against third
parties. The timestamp token serves, among other things, to extend the validity of the signature
beyond the expiry of the certificate: without it, on expiry of the certificate the verification
of the signature becomes problematic.

### 7.3 Compliant digital preservation

**Backup and preservation are not the same thing.** Backup protects against loss of the data;
**compliant digital preservation** protects against challenge, guaranteeing over time the
authenticity, integrity, reliability, legibility and retrievability of the electronic document.
It is a process, with a preservation manager, a manual, submission, archival and dissemination
information packages, and — in the public context — precise technical rules. The AgID guidelines
on the formation, management and preservation of the electronic document are the reference
technical source. `[NV]` on the version and date of last update of the guidelines in force.

**Retention periods.** The picture is fragmented and must be known in its fragmentation:

| Object | Term | Source |
|---|---|---|
| Index and documents of the health record | **Thirty years from the date of death**, with deletion on an annual cycle; **except the clinical record and related documents** | DM 7 settembre 2023, art. 10 |
| Authentication and access data for the minimum telemedicine services | **Twelve months** | DM 19 novembre 2025, art. 12 |
| Operation logs | **Twenty-four months**, with deletion on expiry | DM 19 novembre 2025, Annex 4, § 6 |
| Documents and data generated by the regional infrastructures | **Not retained** by the IRT | DM 19 novembre 2025, arts. 4, para. 4 and 12 |
| Hospital clinical record | Unlimited according to settled practice | `[NV]` — the commonly cited source is a 1986 ministerial circular, whose validity and scope have not been verified |
| Reports and diagnostic documentation | Multi-year terms, differentiated by type | `[NV]` — not verified in the sources consulted |

From the fragmentation follows a requirement that admits no shortcuts: **every category of data
has a declared retention period, applied by a verifiable automatic process, with evidence that
deletion has taken place**. A retention policy declared and not applied is equivalent, on
inspection, to the absence of a retention policy.

And a clarification on the **right to erasure** (art. 17 GDPR): **it is not absolute**. Paragraph
3 excludes it, among other cases, where processing is necessary for compliance with a legal
obligation or for public health purposes within the meaning of art. 9(2)(h) and (i). **A signed
health document is not erasable at the data subject's request where the retention obligation
prevails.** Withdrawal of a consent has effect on future processing; the effects on data already
collected follow the retention rules and not the operator's discretion.

---

## 8. Data suppression, and suppression of the suppression

### 8.1 What it is

**Data suppression** (oscuramento) is the patient's right to make particular documents invisible
to particular parties in the electronic health record. It is governed by **DM 7 settembre 2023,
art. 9**, and it may be exercised at three moments: at the time of delivery, before feeding, or
subsequently.

The decree requires that «*immediate suppression*» be guaranteed through online functionality,
and it establishes a cascade rule: **suppression of the prescription determines the automatic
suppression of the delivery documents and of the related reports** (art. 9, para. 7).

### 8.2 The rule that makes implementation hard

**Art. 9, subsection 6**: suppression takes place «*in such a way as to ensure that all parties
authorised to access **cannot automatically become aware of the fact that the patient has made
that choice***».

This is the **suppression of the suppression**, and it is the requirement that distinguishes a
correct implementation from one that looks correct. An inferable suppression is not a
suppression: if a professional can deduce that *something* has been hidden, they know there is
something to hide, and in a narrow clinical context that is often enough to know what.

The routes of inference to be closed off, in practice:

- **gaps in the numbering** or in visible sequential identifiers;
- **counts**: «12 documents» when 11 are visible;
- **pagination**: pages of results with irregular cardinality;
- **notifications**: a «new document available» alert that then does not appear;
- **filters and facets**: a per-type counter that does not add up;
- **response times** measurably different between searches with and without suppressed
  documents;
- **error messages** distinguishing «does not exist» from «not authorised».

The last line is the classic case: the system must respond in the same way for a non-existent
document and for a suppressed one.

### 8.3 Highly protected health data

**DM 7 settembre 2023, art. 6** identifies a reinforced category: HIV-positive status, voluntary
termination of pregnancy, sexual violence and paedophilia, the use of narcotic and psychotropic
substances and of alcohol, anonymous childbirth, services of family advice centres.

Specific rules: they are visible to third parties **only with explicit, informed and specific
consent given to the delivering party**; in the absence of consent, «*the provider of the service
is responsible for any failure to suppress the datum or document*»; and where services are
delivered anonymously **feeding the health record is not permitted at all**.

**Effect on the data model.** Every clinical document carries a **sensitivity label**. Documents
with reinforced sensitivity are excluded by default from automatic sharing and from
notifications, and require an explicit action for transmission. Encrypting is not enough: a
sensitivity attribute is needed that governs visibility and notifications all along the datum's
path.

---

## 9. DPIA, breaches and notification obligations

### 9.1 The impact assessment

The **data protection impact assessment** (DPIA) is governed by **art. 35 GDPR**: where a
processing operation «*is likely to result in a high risk to the rights and freedoms of natural
persons*», the controller shall, **prior to the processing**, carry out an assessment of the
impact.

Paragraph 3 lists cases where it is **required in particular**, and two concern this project
directly:

- letter **a)** — a systematic and extensive evaluation of personal aspects based on automated
  processing, on which decisions are based that produce legal effects or similarly significantly
  affect the person;
- letter **b)** — **processing on a large scale of special categories of data** referred to in
  art. 9(1).

A multi-tenant telemedicine platform falls under letter b) beyond any doubt. And **DM 19
novembre 2025, Annex 4, § 3**, makes the matter explicit, invoking recitals 84, 89, 90 and 91 of
the GDPR «*in the part that calls for a data protection impact assessment to be carried out
**before the processing begins***», and requiring a «*recurring risk analysis process aimed also
at the **revision of the DPIA***».

The Italian authority has moreover adopted the list of types of processing subject to the impact
assessment requirement under art. 35(4). `[NV]` on the particulars and on any update of the
measure.

**What it means for the person writing code.** The DPIA is a project artefact, not a runtime
document. But **some of its measures become requirements** and must be traced as such: if the
DPIA identifies encryption at rest with per-tenant keys as a mitigation measure, that is a
binding implementation specification, not an optional good practice. Traceability between DPIA
measures and non-functional requirements must be maintained.

### 9.2 Personal data breach

The GDPR defines a **personal data breach** (art. 4(12)) as «*a breach of security leading to
the accidental or unlawful destruction, loss, alteration, unauthorised disclosure of, or access
to, personal data transmitted, stored or otherwise processed*».

Note: **it is not only data leakage**. Irreversible loss and alteration are breaches too. A
corrupted backup without a recoverable copy is a breach.

The obligations:

- **art. 33** — notification to the supervisory authority **without undue delay and, where
  feasible, within 72 hours** of the controller becoming aware of it, unless the breach is
  unlikely to result in a risk to rights and freedoms. If notification exceeds 72 hours, the
  delay must be reasoned. **The processor informs the controller without undue delay**;
- **art. 34** — communication **to the data subject** without undue delay where the breach is
  likely to result in a **high risk**;
- **art. 33(5)** — the controller **documents any breach**, including the circumstances, the
  consequences and the measures taken, even where it does not notify it. This is the **breach
  register**, and it is verifiable by the authority.

DM 19 novembre 2025, art. 15, adds that in the event of an incident the controller provides
«*promptly*» all information useful for discharging the obligations under arts. 33-34.

### 9.3 Three notification regimes with different windows

Here lies a recurring mistake: assuming that «72 hours» is the answer to everything. In the
context of an Italian healthcare provider at least three regimes coexist:

| Regime | Source | First alert | Notification | Final report |
|---|---|---|---|---|
| **Data protection** | GDPR arts. 33-34 | — | **72 hours** to the authority | — |
| **NIS2** | D.lgs. 4 settembre 2024, n. 138 | Early warning **24 hours** to CSIRT Italia | **72 hours** | **1 month** |
| **L. 90/2024** (public administrations, including ASLs) | L. 28 giugno 2024, n. 90 | Alert **24 hours** to ACN | **72 hours** | — |
| **National cybersecurity perimeter** | D.L. 105/2019 conv. L. 133/2019 | **From 1 to 6 hours** for serious incidents | 72 hours | — |

On the last row, what the project's research ascertained must be stated precisely: **healthcare
does not figure among the sectors of the national cybersecurity perimeter** according to the list
published by the National Cybersecurity Agency. The designation of the entities is, however,
individual and **not public**: it is not excluded that a particular healthcare body is included
in it. The correct operational presumption is: **NIS2 and L. 90/2024 apply; the perimeter is
possible but must be checked case by case with the customer**.

**Product consequence.** The system must make it possible to comply with **the most stringent
applicable regime**, so it must be designed for the **one-hour** window: detection,
reconstruction of the timeline of events, forensic export within compatible timescales. And, as
a corollary of documentary hygiene: **never declare that the product «complies with the
perimeter» or «falls within it»**, because that status depends on the customer and not on the
product.

---

## 10. The absolute rule: no real data

### 10.1 The statement

**In the repository, in the issues, in the pull requests, in the logs, in the screenshots, in
the test datasets, in the development and testing environments, in the documentation and in the
examples, only synthetic data appears.**

It is not a recommendation. It is a rule of the project, declared in module
[00](00-come-usare-questa-guida.md), and it is the only rule in this guide formulated in
absolute terms.

### 10.2 Why it is absolute

Because every attenuated form has been tried and fails:

- «*it is only one patient*» — a single item of health data exposed is a notifiable breach;
- «*I took the name out*» — date of birth, municipality, date of the service, organisation and
  diagnosis remain. That is pseudonymisation, not anonymisation (§ 4.2);
- «*it is a test environment*» — copying the production database into a testing environment is
  one of the most frequent modes of breach of all, because testing typically has weaker access
  controls, less logging and more people with privileges;
- «*I only pasted it into the issue to explain the bug*» — the issues of a public repository are
  indexed by search engines and archived by third parties permanently. Deletion does not remove
  the copies;
- «*it is a screenshot, not structured data*» — it is legible to a person, which is exactly the
  risk;
- «*I passed it to an assistant to help me diagnose it*» — transferring health data to a
  third-party service, often outside the EU, without a legal basis and without an art. 28
  contract, is a completed breach, and it moreover has consequences for the data sovereignty
  constraint adopted by the project.

### 10.3 Where mistakes happen most often

A concrete list of the points at which real data enters the repository without anyone having
decided to let it in:

1. **Application logs** that serialise the whole object instead of its identifier. A single
   `toString()` on an aggregate is enough to pour the registry data into a text file.
2. **Exception messages** that include the request body.
3. **Distributed traces** with attributes carrying the tax code.
4. **Database dumps** attached to an issue in order to reproduce a defect.
5. **Video recordings** of testing sessions with real users.
6. **Configuration files** with credentials and references to a real installation.
7. **Regression tests** built from a real case «because that was the one that broke».
8. **Screenshots** in a user guide or in a presentation.
9. **Emails** and attachments forwarded to a development list.
10. **Copies of the production database** in non-production environments.

### 10.4 How realistic synthetic data is generated

The recurring objection is that synthetic data is not realistic and therefore the tests do not
catch the real defects. It is a serious objection, and the answer is not to abandon the rule but
to invest in the generator. A good generator for this domain has these properties.

**Deterministic.** Given the same seed it produces the same dataset. This is needed to reproduce
defects and to make tests stable.

**Referentially consistent.** If an encounter references a patient, that patient exists; if a
report references a booking, the booking exists, its date precedes that of the report, and the
signing professional holds the role that allows them to sign. Referential inconsistencies are the
quickest way to generate false positives in tests.

**Clinically plausible.** Distributions matter. Ages are not uniform, services are not
equiprobable by age band, blood pressure values are not random between 0 and 300, remote
monitoring series have autocorrelation. A generator that produces white noise does not bring out
the defects in the charts, the thresholds and the aggregates.

**Localised.** First names, surnames, addresses and municipalities must be Italian, with the
distribution of lengths and accented characters that the system will really encounter. A dataset
with Anglo-Saxon names does not bring out problems of collation, sorting and typographic
rendering.

**Non-attributable.** This is the delicate point. A **syntactically valid** tax code may belong
to a real person: the algorithm is deterministic and derived from first name, surname, date and
place of birth. Generating «valid» tax codes from plausible names means, with non-negligible
probability, generating somebody's tax code.

The techniques for avoiding this, in order of robustness:

- use **unassigned municipality codes** in the position of the cadastral code, so that the code
  is formally well structured but corresponds to no real place;
- use **dates of birth that are impossible** for a registered living person (for example, future
  ones), where the system under test allows it;
- use the range of identifiers reserved for **temporary registries** (STP for foreign nationals
  temporarily present, ENI for non-registered Europeans), which have their own formats and which
  the system must in any case be able to handle — indeed it is an opportunity to test a real case
  that is often neglected;
- mark every generated record with an **explicit synthetic flag** persisted in the datum itself,
  so that it is always possible to verify, with a single query, that an environment contains no
  real data.

**Verifiable in continuous integration.** An automatic check in the *pipeline* that rejects the
commit when it detects suspicious patterns — sequences conforming to the tax code format,
electronic prescription numbers, email addresses at real domains, precise geographic coordinates
— closes the channel before the data enters the repository's history. Once it has entered a
commit, the datum is in practice permanent: rewriting the history of a public repository does not
eliminate the copies already distributed.

**Documented.** The generator is part of the project and is described in module
[17 — The development environment](17-ambiente-di-sviluppo.md), together with the instructions
for populating a complete environment.

### 10.5 And if real data gets in anyway

The procedure, in order:

1. **stop.** Do not open a «clean-up» pull request that describes the problem in clear text:
   that would multiply the exposure;
2. **report through a confidential channel** to the maintainer, in accordance with the project's
   security policy;
3. **assess whether it is a notifiable breach** within the meaning of art. 33 GDPR: if the datum
   comes from a real installation it almost certainly is, and the controller is the organisation
   that exposed it, not the project;
4. **remove the content** and, if it has entered the repository's history, consider rewriting it
   in the knowledge that this does not eliminate the copies already distributed;
5. **rotate every credential** possibly exposed;
6. **document what happened** in the controller's breach register and **fix the cause**, not just
   the symptom: almost always the cause is a missing automatic check.

---

## What you must remember

1. **Data concerning health is a category subject to a prohibition in principle.** Two
   cumulative conditions are needed: a derogation under art. 9(2) **and** a legal basis under
   art. 6.
2. **Almost everything in this domain is health data by inference**: the appointment, the
   specialty, the exemption, the delivery address of a device. There is no «administrative»
   schema with attenuated safeguards.
3. **Legal basis and informed consent to a health act are different institutions.** For care,
   consent is not the legal basis: asking for it where it is not needed is a defect, not a
   precaution.
4. **Consent is not a boolean**: there are at least four distinct objects, each referred to the
   exact version of the text presented.
5. **Pseudonymised data remains personal data.** Almost no clinical datum is truly anonymous:
   quasi-identifiers, clinical rarity, longitudinality and re-identification by difference.
6. **The clinical record, the organisational health record, the provider's archive and the
   national health record are four different containers** with different access and retention
   rules. Confusing them produces wrong authorisations.
7. **An unsigned draft is not a report**, and a correction is not an overwrite.
8. **Suppression must hide itself.** Gaps in numbering, counts, notifications and differentiated
   error messages make it inferable, and an inferable suppression is not a suppression.
9. **The DPIA is mandatory here**, and some of its measures become traceable implementation
   requirements.
10. **Design breach notification for the one-hour window**, the most stringent of those
    applicable, and never declare a compliance that depends on the customer.
11. **No real data, ever, anywhere.** The investment goes into the synthetic data generator, not
    into exceptions to the rule.

---

## Terms introduced in this module

| Term | Short definition |
|---|---|
| **Amministratore di sistema (system administrator)** | Whoever holds elevated technical privileges over systems processing personal data; subject to individual designation, tracing and periodic review |
| **Anonimizzazione (anonymisation)** | Processing that renders the data subject no longer identifiable by reasonably available means; it takes the datum out of the scope of the GDPR |
| **Archivio dell'erogatore (provider's archive)** | What an organisation retains under its own obligations (tax, accounting, documentary), distinct from the organisational health record and the national health record |
| **Base giuridica (legal basis)** | The ground of lawfulness of the processing; an attribute of the processing (purpose × category × party), not of the patient nor of the document |
| **CAdES / PAdES / XAdES** | Standardised electronic signature formats, respectively for generic files, PDFs and XML |
| **Cartella clinica (clinical record)** | Documentation formed during an admission episode at an organisation |
| **Categorie particolari di dati (special categories of personal data)** | The categories of art. 9(1) GDPR, including data concerning health; processing prohibited save for exhaustive derogations |
| **Consenso informato all'atto sanitario (informed consent to treatment)** | The patient's expression of will regarding the performance of a health treatment (L. 219/2017) |
| **Conservazione a norma (compliant digital preservation)** | A process that guarantees over time the authenticity, integrity, legibility and retrievability of the electronic document; distinct from backup |
| **Contitolarità (joint controllership)** | Joint determination of purposes and means by several controllers, with a transparent arrangement under art. 26 GDPR |
| **Dati a maggiore tutela dell'anonimato (highly protected health data)** | The reinforced health record category (HIV status, termination of pregnancy, sexual violence, substances, anonymous childbirth, family advice centres) requiring explicit consent for visibility to third parties |
| **Dato relativo alla salute (data concerning health)** | Personal data revealing information about past, current or future health status, independent of its source |
| **Diario clinico (progress notes)** | Chronological notes on the course of care; not the report, and not automatically delivered to the patient |
| **Dossier sanitario (organisational health record)** | The set of a patient's data at a single organisation, for internal continuity of care |
| **DPIA** | Data protection impact assessment, mandatory before processing where the risk is high (art. 35 GDPR) |
| **eIDAS** | Regulation (EU) 910/2014 on electronic identification and trust services, as amended by Reg. (EU) 2024/1183 |
| **FEA / FEQ / FES** | Advanced, qualified and simple electronic signature: three levels with different legal effects; only the qualified one is equivalent to a handwritten signature |
| **Lettera di dimissione ospedaliera (hospital discharge letter)** | The document concluding an admission, addressed to the treating clinician; not to be confused with the SDO |
| **Marca temporale (timestamp token)** | An attestation enforceable against third parties, issued by a trust service provider, that a document existed in that form at that instant |
| **Oscuramento (data suppression)** | The patient's right to make particular documents in the health record invisible to particular parties |
| **Oscuramento dell'oscuramento (suppression of the suppression)** | The requirement that the very existence of the suppressed document must not be inferable |
| **Pseudonimizzazione (pseudonymisation)** | Processing that prevents attribution to a data subject without additional information kept separately; the datum remains personal |
| **Referto (report)** | A signed health document with the outcome and conclusions of an act, addressed to the patient and to the requester |
| **Registro delle violazioni (breach register)** | Mandatory documentation of every breach, including those not notified (art. 33(5) GDPR) |
| **Relazione clinica (clinical letter)** | A discursive communication between professionals about a case; it does not certify a test and is not necessarily addressed to the patient |
| **Responsabile del trattamento (data processor)** | Whoever processes on behalf of the controller under an act pursuant to art. 28 GDPR |
| **RPD / DPO** | Data protection officer: supervision and point of contact; mandatory for large-scale processing of special categories |
| **Titolare del trattamento (data controller)** | Whoever determines the purposes and means of the processing and is answerable for it |
| **Validazione clinica (clinical validation)** | The act by which the professional declares the content definitive and assumes responsibility for it; distinct from the signature |
| **Verbale di pronto soccorso (emergency department record)** | The document attesting attendance at the emergency department, the triage, the investigations, the diagnosis and the outcome |
| **Violazione dei dati personali (personal data breach)** | Unauthorised destruction, loss, alteration, disclosure or access; not only data leakage |
