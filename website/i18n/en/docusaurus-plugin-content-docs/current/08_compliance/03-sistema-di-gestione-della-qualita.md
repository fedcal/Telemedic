---
title: Quality management system
sidebar_position: 4
description: "What a quality management system means when contributors are not employees. ISO 13485 and IEC 62304 applied to an open project, the procedures genuinely required, the records to be produced at every release, traceability in both directions, the management of third-party components and why 'latest' is prohibited. The system the project operates on itself and the system the manufacturer entity, to be constituted, will have to institute and operate."
---

# Quality management system

> **Reading premise.** What a technical standard, a harmonised standard, a quality management
> system, the software lifecycle and traceability are is explained from scratch in
> [10 §15 - The regulatory framework from scratch, §§5–6](/10_fondamenti/15-regolatorio-da-zero.md).
> **Here it is not repeated: it is applied to an open project**, which is the case neither of the
> two standards was written for.
>
> **Scope warning.** **The product bears no CE marking**, the project **is not today a
> manufacturer** and **no quality management system is certified or in operation** (`D49`, as
> amended by `D58`). This is the state of fact from which the chapter starts, and no line of what
> follows softens it.
>
> The project **intends** to assume the manufacturer role, and **the legal entity that would
> exercise it is still to be constituted**.
>
> What this chapter describes is: (a) the system the project **operates on itself**, because
> without it the material it produces would not be usable in any certification path, **ours
> included**; (b) the system that **the manufacturer entity, to be constituted, will have to
> institute, have certified and operate**, and which this chapter documents as an operating manual.
> The two largely overlap but do not coincide, and every section states which of the two it is
> talking about.
>
> **What `D58` changes here, and what it does not.** It changes the **addressee** of the manual:
> (b) is no longer the plan of an indefinite external party but **our plan**, and this makes it
> enforceable rather than illustrative. **It does not change the technical allocation**: instituting
> the system, having it certified by an accredited body and operating it remain acts that
> presuppose the **formal manufacturer role**, and they do not become capable of being brought
> forward because that role will be ours. **Nor does it change** the limit set by `D54`: some
> records - internal audit, release review, configuration verification carried out by someone who
> did not write the code - **require distinct persons**, and no quantity of individual work makes
> them producible internally (§ 4.1, first warning).
>
> **And the gap this warning could open, closed here.** Whoever reads that the project intends to
> institute a quality management system and concludes that the software is already usable in a real
> clinical setting draws a **wrong** conclusion. A system that is not in operation produces no
> record, covers no release and transfers no obligation: whoever deploys or puts the software into
> service today assumes those obligations in full, and the intention stated on this page **takes
> none of them away from them**.

## 1. The question neither standard asks itself

ISO 13485 and IEC 62304 presuppose, without ever stating it, an organisation with employees. They
speak of "personnel", of "responsibility and authority", of documented "competence", of
"infrastructure", of "management review". They presuppose that whoever writes the code is a person
over whom the organisation has a power of direction and an obligation of training.

In an open project **none of this is true** for most of those who touch the code. A contributor is
not employed, cannot be trained, cannot be assessed in advance, signs no job description and may
disappear between one change proposal and the next. The question is not rhetorical: *who answers
for the design of code written by people one does not control?*

**The answer is not legal, it is procedural, and there is only one:** design control **does not lie
in the writing, it lies in the acceptance**.

> A change proposal is a **proposal**. Acceptance is an **act of design**, performed by an
> identified, competent and responsible person. The contributor proposes; whoever merges designs.

This moves the whole problem from recruitment to **incoming control**, which is familiar ground for
the standards: ISO 13485 § 7.4 governs purchasing and supplier control, and Article 10(9)(d) of the
MDR expressly names "resource management, including selection and control of suppliers and
sub-contractors". An external contributor is not formally a supplier, but **the code they propose is
incoming material**, and is treated as such.

### 1.1 The mechanisms, and the clause each one satisfies

None of these mechanisms was invented for compliance: they already exist in a well-run open
project. What is missing, and what has to be added, is **the procedure that explains to an auditor
why they satisfy the clause**.

| Mechanism | Regulatory function | Clause |
|---|---|---|
| **Mandatory attestation of origin** on every contribution, verified automatically | Chain of provenance of rights and **traceability of the author by name** inside the configuration item | IEC 62304 § 8; ISO 13485 § 7.5.8 |
| **Declared code owners** and mandatory review by them | Design control remains with whoever releases. It is **the act of acceptance**, and it has a name and a date | ISO 13485 §§ 7.3.4, 7.3.9 |
| **Branch protection, signing of changes, merging only through a proposal** | Integrity and non-repudiation of the lifecycle; impossibility of introducing code outside the process | ISO 13485 § 4.2.5; IEC 62304 § 8.2 |
| **Named list of reviewers qualified by area**, with each one's competence dossier | It is the **competence record** required by the standard. It concerns **whoever approves**, not whoever proposes: it is the correct translation of the clause in this context | ISO 13485 § 6.2 |
| **Mandatory traceability on every proposal** touching product code | Requirement → change → test link, built while the work is being done | IEC 62304 § 5.1.1; § 7 of this chapter |
| **Blocking automated checks** in continuous integration | Repeatable, dated evidence of verification, with identification of the version on which it was run | IEC 62304 §§ 5.5–5.7 |
| **Bill of materials generated at every build** | Unique identification of third-party components | IEC 62304 § 8.1.2 |

**The row on competence is the one that needs explaining, because it is the only interpretative
one.** The standard requires personnel performing activities affecting product quality to be
competent, and the competence to be documented. In an open project the correct translation is not
"document the competence of all contributors" - which is impossible and meaningless - but
**document the competence of whoever has the authority to accept**. Whoever proposes has no
authority; whoever accepts does, and that is a small, stable, documentable set.

**The point at which this construction is fragile, and it must be said:** it works as long as the
set of those who accept is small and stable. A project that, to go faster, widens the set of
reviewers without updating the competence dossiers **loses the property at the exact moment it does
so**, and loses it in a way that cannot be reconstructed after the fact - because the missing
evidence is the qualification of whoever approved a change on a past date.

### 1.2 The question the notified body will ask first

It is known in advance, and it is as well to have the answer written before it is asked:

> *How is it guaranteed that the certified artefact corresponds exactly to a controlled source,
> given that the repository accepts external contributions?*

The documentary answer has five elements, and none is substitutable by the others: **reproducible
build**, **artefact signing**, **list of the changes included in the release**, **mandatory review
by named and qualified reviewers**, **attestation of origin**. Together they demonstrate that
between the controlled source and the distributed binary there is no space in which something could
have entered without trace.

## 2. ISO 13485 is not the MDR, and the confusion is costly

**A conceptual error to be removed at the outset.** The ISO 13485 certificate **does not count** as
a certificate under the medical devices regulation. The notified body assesses the quality
management system **against the requirements of Article 10(9) and of Annex IX**, not against ISO
13485. The certificate reduces friction and shortens the audit; it does not replace it.

**What Article 10(9) requires.** A system ensuring compliance "in the most effective manner and in
a manner proportionate to the risk class and the type of device", and addressing at least: the
regulatory compliance strategy including the procedures for conformity assessment and for the
management of modifications; identification of the applicable general safety and performance
requirements; responsibility of the management; resource management, including selection and
control of suppliers; risk management; clinical evaluation and its post-market follow-up; product
realisation; verification of the assignment of the unique device identifier; post-market
surveillance; communication with authorities and notified bodies; reporting of serious incidents
and field safety corrective actions; management of corrective and preventive actions and
monitoring of their effectiveness; the monitoring and measurement processes, data analysis and
improvement.

**What ISO 13485 does not cover.** It is a **harmonised** standard under the MDR - the reference is
published in the annex of a Commission implementing decision, amended several times - and its
application confers a **presumption of conformity** for the requirements covered (Article 8 MDR).
**But the coverage is not total**: ISO 13485 does not of itself cover the clinical evaluation of
Article 61, post-market surveillance in the form of Articles 83–86, or the vigilance obligations of
Articles 87–92. Additional procedures are needed, and that is block B of § 4.

**`[NV]`** - the harmonisation status must be verified against the consolidated list published by
the Commission **at the date of use**, not from memory: the list is amended frequently, and a
presumption of conformity invoked on a version no longer cited is a presumption that does not
operate.

## 3. The quality management system as code

The typical risk of a small operation is not an insufficient system: it is a system **too large to
be complied with**. Audit non-conformities almost always arise from the gap between the written
procedure and actual practice, not from missing procedures. Hence the practical rule, worth more
than any template: **if a procedure describes an activity one does not intend actually to perform
every time, it must be rewritten, not worked around.**

### 3.1 Why the repository is the right place

A quality management system kept as versioned documentation in the repository - procedures under
version control, approval through a change proposal with named reviewers, immutability guaranteed
by branch protection and by the signing of changes - satisfies clauses 4.2.4 (control of documents)
and 4.2.5 (control of records) **more robustly than a document archive on a shared drive**, for a
simple reason: the history cannot be altered without trace and approval is a verifiable fact, not a
signature on a sheet of paper.

For this to hold up in front of an auditor, however, two things are needed that do not come free:

1. **a procedure explaining the correspondence.** The auditor is looking for "who approved, when,
   and what was the revision approved". It must be written, in a procedure, that approval is the
   favourable review of a designated code owner, that the date is the date of the merge, and that
   the revision approved is identified by the hash of the change. Without that document, the
   auditor has no way of knowing what they are looking at;
2. **tool validation**, § 3.2.

### 3.2 The trap: the tools that manage quality are software to be validated

Clause 4.1.6 of ISO 13485 requires the **validation of software applications used in the quality
management system**, with an approach proportionate to the risk associated with their use. It is
the clause technical projects most often underestimate, and in the case of a system kept as code it
has a broad and precise perimeter:

| Tool | Why it falls under the clause |
|---|---|
| The build and release chain | It produces the artefact that will be the device, and attests to its reproducibility |
| The automated check system that blocks the merge | It is the mechanism by which one demonstrates that a check was performed |
| The traceability matrix generator | It produces an artefact of the technical file |
| The bill of materials generator | It produces the evidence for clause 8.1.2 of IEC 62304 |
| The tracker of issues and change proposals | It contains the records of design review and problem resolution |
| The documentation site generator | It produces the instructions for use, if they are published in that form |

**What validating means in practice.** Not "demonstrating that the tool is correct", which is
impossible. It means: defining the tool's intended use within the system, identifying what would
happen if the tool got it wrong, defining and **running** tests demonstrating that in the intended
use the tool does what it must - for example, that a change lacking traceability **is actually
rejected**, and not merely flagged - and recording the outcome with the exact version of the tool.
The negative test is worth more than the positive one: a block is validated by demonstrating that
it blocks.

### 3.3 The exclusions, and why each must be justified individually

A software manufacturer without physical production typically excludes from scope the clauses on
contamination control, product cleanliness, particular requirements for sterile devices, validation
of sterilisation processes and control of measuring devices.

**Every exclusion must be justified in writing**, and a generic justification is challenged. "Not
applicable because we are software" is not a justification: "the product has no physical
representation, is not packaged, is not transported and does not come into contact with the patient
or with biological material; there is therefore no cleaning process to control" is one.

One of the customary exclusions **must instead be reconsidered**, and it is the reason this section
exists: the control of measuring devices. Should the position on the **measuring function**
(question `Q-173`, [02 §12](./02-qualificazione-e-classificazione.md)) conclude that the
presentation of parameters constitutes a measuring function, the exclusion falls and with it falls
the justification already written. It is an example of how an apparently marginal open question has
effects at a distance on the perimeter of the system.

## 4. The procedures genuinely required

Three blocks. The first is imposed by ISO 13485, the second by the MDR and is not covered by the
first, the third by the software lifecycle standards.

**Block A - required by ISO 13485:2016.** Control of documents (4.2.4) · Control of records (4.2.5)
· Management review (5.6.1) · Human resources, competence, training (6.2) · Infrastructure and work
environment (6.3, 6.4.1) · Risk management in product realisation (7.1) · Review of product
requirements and communication with the customer (7.2) · Design and development (7.3.1–7.3.8) ·
Control of design changes (7.3.9) · Purchasing and supplier control (7.4) · Production and service
provision, identification and traceability (7.5.1, 7.5.8, 7.5.9) · Validation of processes (7.5.6)
· Installation and servicing (7.5.3, 7.5.4) · Feedback from the field (8.2.1) · Complaint handling
(8.2.2) · Reporting to authorities (8.2.3) · Internal audit (8.2.4) · Control of nonconforming
product (8.3) · Analysis of data (8.4) · Corrective and preventive actions (8.5.2, 8.5.3) ·
Validation of software used in the system (4.1.6).

**Block B - imposed by the MDR and not covered by ISO 13485.** Regulatory compliance strategy and
management of modifications (Article 10(9)(a)) · Identification and maintenance of the applicable
general requirements (Annex I) · Management of the technical file (Article 10(4), Annexes II and
III) · Clinical evaluation and its follow-up (Article 61, Annex XIV) · Post-market surveillance and
periodic report (Articles 83–86, Annex III) · Vigilance, serious incidents and field safety
corrective actions (Articles 87–92) · Assignment and management of the unique device identifier and
registrations (Articles 27, 29, 31) · Communication with the notified body and with the authorities
(Article 10(9)(l)) · Device release and declaration of conformity (Articles 19, 20) · Role, tasks
and independence of the person responsible for regulatory compliance (Article 15).

**Block C - software-specific.** Lifecycle and safety classification (IEC 62304 §§ 4.3, 5) ·
Management of third-party components (IEC 62304 §§ 5.3.3, 5.3.4, 7.1.2–7.1.3, 8.1.2) ·
Configuration management and reproducible build (IEC 62304 § 8) · Software problem resolution
(IEC 62304 § 9) · Usability engineering (IEC 62366-1 § 5) · Cybersecurity in the lifecycle and
coordinated vulnerability disclosure (ISO/IEC 81001-5-1; MDCG 2019-16 Rev.1).

**Total: about thirty-six procedures.** For a small operation it is realistic to merge some - human
resources with infrastructure, production with process validation and servicing, data analysis with
corrective actions - coming down to **twenty-five or twenty-eight documents**. **It is not
realistic to go below twenty**, and a system that manages it has usually simply omitted block B.

### 4.1 Three warnings about form

**First.** The internal audit **cannot be carried out by whoever performed the activity audited**
(clause 8.2.4). In a small operation where the management representative is the same person as the
person responsible for regulatory compliance, the practical consequence is a single one: **the
internal audit must be commissioned externally.** It is not a quality option, it is a condition of
validity.

**Second.** The system must **run for at least one full cycle before the certification audit**: real
design and development records, at least one design review, at least one corrective action, at
least one controlled release, an internal audit covering all processes and a management review.
Without these, stage two of the audit cannot be passed - not because the auditor is severe, but
because **there is nothing to audit**. It follows that the date on which operation starts
determines, with a lag of around six months, the earliest date at which certification is possible.
**From `D58` it follows that this start date is a decision of ours, not a wait**: it is a delay the
project inflicts on itself if it does not start operating. This does not authorise writing a
marking date anywhere - `V-171` prohibits it without exception, and internal planning does not
become a promise because it is ours - but it moves the cost of postponement from a third party's
account to ours.

**Third - and it concerns this area directly.** The procedures are **controlled documents**; the
documentation published on these pages **is not**. This is constraint `V-174`: no chapter of this
documentation is a quality management system procedure, and no area may present one of its chapters
as such. The chapters are **inputs**: they contain the analysis from which a procedure is written,
not the procedure.

## 5. The identifiers of the regulatory documents

The project adopts an identifier space for regulatory documents, distinct from that of the
requirements (`RF-*`, `RNF-*`, `BR-*`, frozen by `V-120`) and from that of the architecture
decision records. **This space is declared here and counts as constraint `V-172`:** no area may coin
an identifier in these prefixes without declaring it on the noticeboard.

| Prefix | Scope |
|---|---|
| `MDR-*` | Product regulatory documents: intended purpose, classification, assessment procedure, technical file, general requirements matrix, labelling, instructions for use, operating environment requirements, configurations and variants, sites and suppliers, unique device identifier |
| `QMS-*` | Manual, procedures and records of the quality management system |
| `SW-*` | Software lifecycle documentation under IEC 62304 |
| `RM-*` | Risk management under ISO 14971: plan, file, report |
| `UE-*`, `UEF-*` | Usability engineering under IEC 62366-1 |
| `CE-*`, `PMCF-*` | Clinical evaluation and its post-market follow-up |
| `PMS-*`, `PSUR-*`, `VIG-*` | Post-market surveillance and vigilance |
| `ON-*` | Relations with the notified body: screening, requests for information, selection |

**One collision must be resolved now, because it would cause damage in a traceability matrix.** The
security requirements catalogue produced during the research phase uses identifiers of the form
`SEC-nnn`. The lifecycle security documents instead use forms such as `SEC-LC-*`, `SEC-TM-*`,
`SEC-RMF-*`, `SEC-PT-*`. **Rule: security regulatory documents always carry an alphabetic
sub-prefix; the form `SEC-` followed by digits only is reserved for requirements and must never be
used for a document.**

## 6. IEC 62304: the safety class and what follows from it

### 6.1 The determination

The class depends on the possible harm **after** the application of risk control measures
**external to the software system**. The reasoning and the conclusion are already summarised in
[02 §11](./02-qualificazione-e-classificazione.md); here is the item-by-item determination, which
is what goes into the document.

| Software item | Class | Rationale |
|---|:-:|---|
| Acquisition, transmission, persistence and presentation of parameters; highlighting of values outside the configured threshold | **B** | The external measures - restricted intended purpose, scheduled periodic review, organisational presence of the *Centro erogatore* (delivering centre), instruction to the patient about emergencies - reduce the possible harm to **non-serious**. **If even one of them were not documentable and verifiable, the item moves to C** |
| Association between the patient's identity, the session, the data and the clinical document | **B**, treated as a priority risk | Person-to-data mis-association is the worst hazardous situation in the architecture. It remains B **only** because the professional verifies identity at the opening of the session: the verification must be **enforced by the interface**, not left to habit |
| Media transport, signalling, network traversal, quality indicators | **B** | A failure produces interruption or degradation; the professional stops and reschedules. The outcome is an encounter not completed, not a false datum |
| Drafting, signing and transmission of clinical content | **B** | The loss or alteration of a document delays decisions; the signature and the explicit confirmation are controls |
| Identity, authorisations, tenant isolation, immutable audit trail | **B** | Unauthorised disclosure: harm to the person possible, not serious in physical terms |
| Quality metrics, dashboards, technical telemetry | **A** | No contribution to a clinical hazardous situation, **subject to documented segregation** |
| Informational interface, documentation, internationalisation, public portal | **A** | - |

**Declared class of the software system: B**, with isolated class A items and **documented
segregation** under clause 5.3.5. The standard requires the architecture to **demonstrate the
effectiveness of the segregation**, not to assert it: an assertion of segregation unaccompanied by
the mechanism that achieves it - process boundary, network boundary, absence of a data path - is a
guaranteed finding.

**A warning to be put in writing in the determination document, and not in a footnote.** Class B is
**conditional** on the intended purpose exclusions. Introducing an alarm function, a computed
score, a threshold defined by the system or the extension to unstable patients **takes the
determination back to C**, with the obligation of detailed design at unit level (clause 5.4) and of
verification of every unit. **It is an architectural decision, not a product choice**, and it is why
constraint `V-170` exists.

### 6.2 What changes in class B, and what it really costs

Compared with class A, the following become mandatory: **architectural design** (5.3), **unit
implementation and verification** (5.5), **integration and integration testing** (5.6), **software
system testing** (5.7), and the full version of the maintenance (6), software risk management (7)
and problem resolution (9) processes. Only detailed design at unit level (5.4), mandatory in class
C, remains excluded.

**The incremental cost is not technical: it is documentary.** The project already provides for high
and enforced test coverage, integration tests, end-to-end tests, media quality tests, static and
dynamic security analysis and traceability (`D10`). What is missing is of a different nature:

| Missing | Why what exists cannot substitute for it |
|---|---|
| Software development plan approved **beforehand** | A plan written afterwards describes what happened, not what was planned. The standard asks for the latter |
| **Unit acceptance criteria defined beforehand** | "Coverage ≥ 80%" is a threshold, not an acceptance criterion. The criterion states what must be true for the unit to be accepted |
| Minutes of **architectural review** | An architectural decision discussed and not minuted has not, for the standard, been reviewed |
| Verification reports **signed and dated**, with who performed them and **on which version** | An automated check outcome without the version of the object checked cannot be traced to a release |
| **Traceability matrix as a release artefact** | A matrix reconstructible on request is not a matrix: § 7 |

## 7. Traceability

It is the only thing in this chapter that **is lost for ever** if it is not built while the work is
being done, and that is why `D45` places it among the retroactively unrecoverable activities.

### 7.1 What it must link

The chain required is not "requirement → test". It is longer and has one link that is always
forgotten:

```
requirement → architectural element → unit → test → outcome
   ↑                                                    ↓
risk  →  control measure  →  verification of the measure's effectiveness
```

The forgotten link is the last: **verification that the risk control measure is effective**, not
that it has been implemented. These are different things. "The threshold field is mandatory" is
implementation; "a test demonstrates that a plan does not activate with the threshold field empty"
is verification of effectiveness. Clause 7.3.3 of IEC 62304 requires the second.

### 7.2 Why in both directions

Forwards, to demonstrate that **every requirement has been verified**. Backwards, to demonstrate
that **every line of code answers a requirement**. The backward direction is the surprising one: it
serves to demonstrate the absence of unrequested functionality, which in a medical device is not
useless code - it is **functionality not assessed in the risk file, not described in the intended
purpose and not verified**. It is, literally, the mechanism by which one of the functions in § 6.1
of the preceding chapter would enter the product without anyone declaring it.

### 7.3 Why it is lost and not recovered

If the requirement identifiers change, the matrix has to be reconstructed by hand. If the change
proposals do not cite the requirement, the link between a change and its reason has to be
reconstructed by reading the code, which is an **interpretative** operation: whoever performs it is
declaring after the fact what somebody intended to do, and the notified body has no reason to
believe it.

Hence the two guards, both already in force:

1. **the identifiers are frozen** and are never renumbered (`V-120`);
2. **the matrix is generated**, not drafted. A hand-maintained matrix diverges from the code by the
   third release; a matrix generated from the references in the changes and in the tests is true by
   construction, and its generation **fails** when a reference is missing.

## 8. The records to be produced at every release

It is the most concrete question a development team asks, and the answer is a closed list. A
release of the distribution intended for certification **is not complete** if one of these elements
is missing, and the criterion is not stylistic: each one is required by a clause.

| # | Record | Source | Generated or drafted |
|---|---|---|---|
| 1 | **Configuration status record**: exact list of the items and their versions that make up the release | IEC 62304 § 8.3 | Generated |
| 2 | **List of the changes included**, with a reference to the requirement or the issue each one satisfies | IEC 62304 §§ 8.2, 9 | Generated |
| 3 | **Traceability matrix** in the state corresponding to the release | IEC 62304 §§ 5.1.1, 7.3.3 | Generated |
| 4 | **Verification and validation report** with outcome, environment, version of the object verified, and **residual anomalies with their assessment** | IEC 62304 §§ 5.5–5.8 | Generated + drafted |
| 5 | **Signed bill of materials**, for each artefact built | IEC 62304 § 8.1.2; the resilience rules; DM 19 novembre 2025 (the Ministerial Decree of 19 November 2025), Annex 4 | Generated |
| 6 | **Safety impact assessment of the updates** of the third-party components included | IEC 62304 § 6; § 9.4 of this chapter | Drafted |
| 7 | **Outcome of the automated security checks** and status of the open known vulnerabilities, with a reasoned decision on each | ISO/IEC 81001-5-1; the resilience rules | Generated + drafted |
| 8 | **Attestation of build reproducibility** and **artefact signing** | Annex II, section 3, MDR; § 1.2 | Generated |
| 9 | **Update of the risk file** where the release touches a control measure | ISO 14971 | Drafted |
| 10 | **Release declaration**: verification that the planned activities are complete, residual anomalies accepted, archiving | IEC 62304 § 5.8 | Drafted |

**The two rows that get forgotten are 4 and 6**, and it is worth saying why.

Row 4: **residual anomalies are not hidden, they are assessed**. The standard does not require
release without defects - that would be an unachievable condition -: it requires **listing the
defects known at the time of release and documenting the assessment of their safety relevance**. A
release without a list of residual anomalies is not a clean release: it is an undocumented release.

Row 6: it is **the point the notified body presses hardest on in surveillance audits**. Updating a
dependency is, for a software project, a routine operation; for the standard it is a modification to
the product, and every modification must be assessed for its safety impact **before** it enters a
certified release.

## 9. Third-party components

### 9.1 Why it is the most onerous chapter

A modern application stack with back-end and front-end frameworks, an identity federation product,
a database with a time-series extension, an event broker, a relay node and container images easily
generates **over one thousand five hundred transitive dependencies**. Treating them all with the
same rigour is impossible **and is not required**. What is required is: identifying them all
uniquely (clause 8.1.2), and treating those that matter with proportionate rigour.

### 9.2 The three levels

| Level | Membership criterion | Treatment |
|---|---|---|
| **L1 - critical** | The component implements or directly supports a risk control measure, or a failure of it may contribute to a hazardous situation: cryptographic library, real-time media stack, relay node, federation product, database engine and driver, clinical interchange model library, signature library, authorisation framework, runtime | Full record: producer, **exact version**, function performed, **expected functional and performance requirements** (5.3.3), **runtime environment requirements** (5.3.4), assessment of published anomalies (7.1.2–7.1.3), advisory source monitored, update criterion and cadence, impact assessment of **every** update |
| **L2 - platform** | Infrastructure components not directly involved in control measures | Reduced record: identification, version, function, advisory source, update policy. No individual functional analysis |
| **L3 - transitive** | Everything else | **Coverage by bill of materials** generated at every build, signed, attached to the release, with a blocking automated check on known vulnerabilities. It is the implementation of clause 8.1.2 across thousands of components |

**The register is not drafted: it is generated from the bill of materials and enriched.** The bill
contains name, producer and version; it does not contain the function within the system, the known
alternative, the risk impact, the update service level and the review date. These five fields live
in a versioned annotations file, and **the build fails if a component appears in the bill and not in
the annotations**: it is the mechanism preventing the entry of an unassessed dependency, and it has
already been established by the technical area as the outcome of question `Q-17`.

### 9.3 Why `latest` is prohibited

It is not an operational preference and it is not a question of build reproducibility, although it
is that too. It is **a direct breach of a normative clause**.

Clause 8.1.2 of IEC 62304 requires each configuration item - including third-party components - to
be uniquely identified by **title, producer and version**. A reference to a floating tag:

1. **does not identify a version**: it identifies a different version at every build;
2. makes the certified artefact **non-reproducible**, and therefore makes the correspondence
   between the controlled source and the distributed binary undemonstrable (§ 1.2);
3. makes the update safety impact assessment required by clause 6 **impossible**, because the
   update happens without anybody deciding it;
4. makes the previous release's bill of materials **false**, because it describes a composition a
   new build would not reproduce.

**The practical consequence is the simplest rule in the whole chapter, and the most breached:**
every dependency, every base image, every build chain tool carries an exact version, and updating
is **an act, with a date, a rationale and an assessment**. Constraint `V-173` makes it blocking.

### 9.4 Monitoring and remediation windows

Clause 7.1.2 requires each published anomaly relevant to the component to be **assessed**, not
always fixed. **A reasoned decision not to update is admitted if documented**, and it is often the
right decision: an unassessed update introduces more risk than it removes.

**This section answers question `Q-113`**, opened by the technical area, which asked for an update
service level expressed in days from publication of the advisory and differentiated by severity.

| Severity | Window from publication of the advisory, for L1 components | Note |
|---|---|---|
| **Critical, with known exploitation** | **72 hours** for the corrective release | Consistent with the obligation to report actively exploited vulnerabilities, which starts on 11 September 2026 |
| **Critical** | **7 days** | |
| **High** | **15 days** | |
| **Medium** | **next scheduled release** | With the planned date stated |
| **Low** | assessment recorded, no date commitment | The assessment is due all the same: it is clause 7.1.2 |

**Two clarifications that make these numbers usable rather than decorative.**

**First - the clock starts from publication of the advisory, not from knowledge.** A commitment
running from knowledge is a commitment the supplier controls, and as such of no value to the
customer.

**Second, and it must be said because the confusion is frequent: these windows have nothing to do
with the corrective maintenance service levels of DM 21 settembre 2022** (the Ministerial Decree of
21 September 2022), which concern taking on and restoring an **incident in operation** with times
of the order of tens of minutes. They are two different clocks, with two different objects - the
defect of a component versus the unavailability of a service - and two different addressees. Merging
them produces a commitment no supplier can meet: nobody fixes a library vulnerability in sixty
minutes.

**A reality check that justifies the choice of expressing the windows in days and not in months.**
One single critical component of the architecture - the relay node - had **fourteen releases in a
little over seven months, five in the month of August 2026 alone**, with a critical vulnerability
fixed halfway through. A commitment expressed in months, on a component with this cadence,
describes no behaviour at all.

**What remains outside this section and belongs to the project owner:** the **declared support
period** for each major release, a minimum of five years under the resilience rules. It is question
`Q-155`, and while it is open **the project cannot publish an end-of-support date**, which is
however a mandatory element of the documentation required by customers and by the lifecycle
security standard.

### 9.5 A component's licence regime is not a detail of the component

**This section answers question `Q-112`**, opened by the technical area about the time-series
extension, whose advanced features are reported to be distributed not under an approved open source
licence but under a source-available licence of its own, with restrictions on offering it as a
managed service to third parties.

**What this area can establish without reading the licence.**

1. **The project does not redistribute the component**, which is acquired by the deployer as part of
   the infrastructure. It follows that **the restriction, whatever it is, does not fall on the
   project**: it falls on whoever distributes and on whoever offers the service.
2. **From this follows an obligation of the project**, which is documentary and is not optional: the
   documentation intended for deployers must state **which components of the reference
   infrastructure have a licence regime limiting the offer as a managed service**, because that is
   precisely the archetypal integrator's delivery model. An integrator discovering the restriction
   after launching the service has a problem the project could have spared them with one line.
3. **The fallback exists and is proven**: native declarative partitioning, verified in continuous
   integration. Its existence must be stated **together with** the restriction, otherwise the
   restriction reads as an insurmountable defect.
4. **The general principle governing the case** is the one already fixed by `D34`: the licence
   affixed to a container **does not dispose of third parties' rights over the content included**,
   and the verification must be done **artefact by artefact**.

**`[NV]`** - the reading of the text of the primary licence, artefact by artefact and version by
version, **has not been carried out** and this area does not substitute a reconstruction for it.
Until it is carried out, no document of the project may assert either that the component is open
source or that it is not. The question therefore remains open in its verification part.

### 9.6 Clinical scales and questionnaires have licences of their own

**This section partially answers question `Q-11`**, opened by the guide area, which asked for the
terminology policy to be formally extended to scales and scores **before** writing the first
computation engine.

**Outcome: the request is accepted, and the extension is formulated as follows.**

> **A validated clinical scale, a structured questionnaire for collecting patient-reported outcomes
> and the related scoring algorithm are, for the purposes of licence policy, objects of the same
> nature as a coding system**: they have a rights holder, a licence, a version, conditions of use
> that may differentiate clinical use from research use and from commercial use, and sometimes
> conditions on **translation**, which is a derivative work. They therefore fall within the four
> regimes already established by `D31`, and **their placement must be ascertained before
> inclusion**, not afterwards.

Three operating rules follow:

1. **No item text, no scoring table and no interpretation threshold of a scale enters the
   repository before its regime has been ascertained and declared**;
2. **the definition of the scale is data, not code**: as for care pathways (`V-147`), adding a scale
   must not require a software release. It also follows that a scale whose regime so requires may
   be **acquired at runtime by the deployer**, which is regime C;
3. **the computation of the score must be kept distinct from its interpretation.** Summing the items
   according to a declared rule is traceable arithmetic; assigning a severity band is
   **interpretation** and falls within the boundaries of chapter
   [02 §6](./02-qualificazione-e-classificazione.md).

**What remains open is the part that cannot be delegated to a rule:** ascertaining the regime
**scale by scale**, which requires reading the rights holder's conditions for each one. It has not
been done for any scale, and the question remains open with this clarification.

### 9.7 The project is itself a third-party component

It is a reversal of perspective worth making explicit, because it changes the economic sense of the
whole chapter.

For the integrator assuming the manufacturer role, **this project is a third-party component**, and
it falls into its L1 level. It must therefore produce the record for it: function performed,
expected functional and performance requirements, runtime environment requirements, assessment of
published anomalies, update criterion.

**Publishing the lifecycle artefacts** - development plan, requirements specification,
architecture, verification evidence, signed bill of materials, end-of-support statement -
**directly and measurably reduces the regulatory burden on the integrator**. It is not a pure cost
borne out of virtue: it is the difference between being a qualifiable component and being code of
unknown provenance, which on a manufacturer's path is a difference of months.

**`D58` adds a second addressee, and it is not a detail.** Until now the reversal of perspective
held outwards: whoever integrates, and assumes the manufacturer role over its own distribution,
must produce the record for this project as a third-party component. Since `D58`, **the same record
serves us**, because the manufacturer entity to be constituted will have to qualify as third-party
components all the dependencies of its own distribution, and the qualification **cannot be
reconstructed after the fact**: it is the second of the retroactively unrecoverable activities
([09 §5](./09-percorso-e-calendario.md)). What was a service rendered to a third party has become
**an obligation of ours with an implicit deadline**, and is to be treated as such.

## 10. The inputs to the risk file that this area records

The risk file (`RM-FILE-001`) **does not yet exist**: it is a deliverable of the path, not of this
documentation, and its production requires the risk management plan with the acceptability criteria
that precedes it. But three questions from the noticeboard have produced **identified inputs** that,
if not recorded now, would have to be reconstructed later.

**This section answers questions `Q-13` and `Q-114`** and takes up the outcome of `Q-12`.

| Origin | Input | What is to be determined in the risk file |
|---|---|---|
| `Q-13`, guide area | Two hazardous use scenarios identified in the patient safety module | Severity and probability, which this area **does not determine**: the estimate requires the acceptability criteria from the plan |
| `Q-12`, functional area | **Ten hazardous use scenarios of remote monitoring**, mapped with **the risk introduced by the mitigation** | The risk introduced by the mitigation is the element ISO 14971 expressly requires and that is almost always omitted: it must be preserved in the form in which it was produced |
| `Q-114`, technical area | **Quality thresholds and notice to the professional**: when the unsuitability threshold is breached the system informs and offers postponement | It is **a risk control measure**, not a convenience function. It follows that its effectiveness must be verified, not merely implemented (§ 7.1) |
| `Q-114`, technical area | **Jitter buffer target**: lowering it reduces latency **at the cost of an increase in audible loss** | It is a trade-off with a clinical consequence: the choice must be recorded with its rationale, not left as a configuration parameter |
| `Q-114`, technical area | **Degradation preference** between resolution and smoothness | The defensible formulation is a **rendering preference chosen by the user**, never automatic adaptation driven by clinical content: in the latter form it would be processing for clinical purposes |

**The rule this section establishes**, and which holds for all areas: **a technical trade-off with a
clinical consequence is not resolved in a configuration. It is recorded as an entry in the risk
file, with the alternative discarded and the rationale.** A configurable parameter with no trace of
the decision is, for the notified body, a decision never taken.

## 11. What this chapter leaves open

| Reference | Question | To whom |
|---|---|---|
| `Q-155` | **Declared support period**, a minimum of five years. While it is open, the project cannot publish an end-of-support date, which is however a mandatory element of the documentation for the customer (§ 9.4) | → Project owner |
| `Q-11` | Ascertainment of the licence regime **scale by scale**. The rule is established (§ 9.6); the ascertainment has not been carried out for any scale | Compliance, domain |
| `Q-112` | Reading of the text of the primary licence of the time-series component, artefact by artefact (§ 9.5) | Compliance, technical |
| `Q-173` | Whether the presentation of parameters constitutes a measuring function: the validity of an already justified exclusion depends on it (§ 3.3) | Domain, functional |
| `Q-13`, `Q-114` | Severity and probability of the inputs recorded in § 10: determinable **only after** the risk management plan with the acceptability criteria | Compliance, at the production of the risk file |
| `[NV]` | Harmonisation status of ISO 13485 and of the lifecycle security standard, to be verified against the consolidated list **at the date of use** (§ 2) | Compliance |
| `[NV]` | Precise numbering of the clauses of IEC 62304 and of ISO 13485 cited in this chapter: they derive from the project's research and must be re-verified against the text of the standards before appearing in a controlled document | Compliance |

<!--TRAD-VERIFICATA: 02b1ce0325c38f1cb79bd562bc72efd2cc41c1e8-->
