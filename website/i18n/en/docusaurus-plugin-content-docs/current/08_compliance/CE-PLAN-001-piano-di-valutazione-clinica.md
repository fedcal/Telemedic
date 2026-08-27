---
title: "CE-PLAN-001 - Clinical evaluation plan (draft)"
sidebar_position: 13
description: "Technical draft of the clinical evaluation plan. It carries every content item that chapter 07 §4 lists for CE-PLAN-001, each one either filled in or present as a section declared empty with the reason for the absence. It fills in the technical validation strategy, declares empty the items that require documentable clinical competence or the manufacturer role, names the need for clinical competence and the forms in which the project intends to acquire it, and records the two upstream conditions that are not satisfied."
---

# `CE-PLAN-001` - Clinical evaluation plan (draft)

> **State of fact, before any other line.** The product **does not bear CE marking**, **is not
> covered by any declaration of conformity** and **is not usable for the delivery of healthcare
> services to real patients**. **No clinical evaluation has been carried out**: there is no
> approved plan, no systematic search under way, no report, and **no clinical benefit is
> demonstrated to date**. This document is a **technical draft** and does not soften a single one
> of these lines.
>
> The project **intends** to take on the manufacturer role (`D58`), and **the legal entity that
> would exercise it is still to be constituted**. Approving and assuming this plan are acts the
> regulation reserves to that role ([07 §4](./07-valutazione-clinica.md)) and they **do not belong
> to this draft**.
>
> **Whoever reads that the project intends to certify and concludes "then I can use it" draws a
> wrong conclusion.** The intention covers nobody, transfers no obligation and does not make an
> uncertified version usable: whoever installs, integrates or puts the software into service today
> assumes in full the obligations that follow.
>
> **No date appears in this document.** No marking date, no window, no deadline, in any form and
> for any item: it is constraint [`V-171`](../11_registri/01-vincoli-in-vigore.md#v-171) as read by
> [01 §11](./01-inquadramento-normativo.md), rule 4. The durations that appear are cited from
> chapter [07 §2](./07-valutazione-clinica.md) as properties of the activities, and **a duration is
> not a deadline**.

---

## 1. Plan control sheet

| Item | Value |
|---|---|
| **Regulatory document identifier** | `CE-PLAN-001`, in the space reserved by constraint [`V-172`](../11_registri/01-vincoli-in-vigore.md#v-172) and assigned by [07 §4](./07-valutazione-clinica.md) |
| **Identifier in the repository** | The absolute path: [`docs/08_compliance/CE-PLAN-001-piano-di-valutazione-clinica.md`](CE-PLAN-001-piano-di-valutazione-clinica.md), per the identification rule of the [document control procedure](/08_compliance/PROCEDURA-controllo-dei-documenti.md) |
| **English twin** | [`website/i18n/en/docusaurus-plugin-content-docs/current/08_compliance/CE-PLAN-001-piano-di-valutazione-clinica.md`](https://github.com/fedcal/Telemedic/blob/main/website/i18n/en/docusaurus-plugin-content-docs/current/08_compliance/CE-PLAN-001-piano-di-valutazione-clinica.md). The two versions are **the same document in two languages**, not two documents |
| **Version** | The hash of the commit that last modified the file, readable with `git log -1 --format=%H -- docs/08_compliance/CE-PLAN-001-piano-di-valutazione-clinica.md`. **It is not transcribed here**: a hash written into this field would be false from the next commit onwards |
| **Status** | **Technical draft. Not approved, not assumed, not signed.** It is not a document of the technical file and does not become one by being published |
| **Who drafts it** | The **single contributor** of the project, who is also the nominated reviewer for the `/docs/08_compliance/` line of [`.github/CODEOWNERS`](https://github.com/fedcal/Telemedic/blob/main/.github/CODEOWNERS). The coincidence between author and reviewer is the gap declared as the first entry of [`Q-189`](../11_registri/02-questioni-aperte.md#q-189), and here it is declared instead of being left unsaid |
| **Who should approve it** | **The manufacturer**, that is the formal role the project **intends** to take on and whose **legal entity is still to be constituted**. [07 §4](./07-valutazione-clinica.md) assigns the technical draft to the project and approval and assumption to the manufacturer |
| **Date of approval** | **None.** The document is not approved, and the reason is at § 2 |
| **Review** | Mandatory if the formulation of the intended purpose changes, if the external review of [`Q-275`](../11_registri/02-questioni-aperte.md#q-275) raises a finding on that formulation, or if the Sponsor's decision on [`Q-176`](../11_registri/02-questioni-aperte.md#q-176) makes the clinical competence of § 10 available |

**How the "Status" field is read.** "Draft" does not mean "provisional text written in haste": it
means the text is the one the project proposes and that the missing act is **approval**, not
drafting. The distinction matters because it is the same one
[the document control procedure](/08_compliance/PROCEDURA-controllo-dei-documenti.md) applies to its
own status field, and it is verifiable: whoever finds this field changed without the existence of an
entity able to approve has found a defect, not an update.

---

## 2. What this document is, and why it cannot be approved today

This document **is not a chapter**. The chapters of this area are explanatory inputs and none of
them is a procedure or a document of the quality management system: that is constraint
[`V-174`](../11_registri/01-vincoli-in-vigore.md#v-174), which this draft does not scratch because
it does not present itself as a chapter. It is instead the **technical draft of a regulatory
document** that [07 §4](./07-valutazione-clinica.md) assigns to the project, and which the
manufacturer will have to approve and assume in full before it is worth anything.

**Why it cannot be approved today, in three conditions that must be read together.**

The first is that **the entity is missing**. The project **intends** to take on the manufacturer
role and **the legal entity that would exercise it is not constituted**: there is nobody who can
affix a signature that is a declaration rather than a signature on a text.

The second is that **the apparatus that makes a signature a declaration is missing**. Even with the
entity constituted, a clinical evaluation plan approved outside an operating document control cannot
be anchored to an exact revision, and a document that does not state which revision it refers to is
precisely the object a notified body cannot accept
([02 §5.2](./02-qualificazione-e-classificazione.md)). A cost follows that must be stated and not
smoothed away: **a document born outside document control must be re-issued, not simply approved
afterwards** ([03 §4.1](./03-sistema-di-gestione-della-qualita.md); [09 §5](./09-percorso-e-calendario.md), irrecoverable activity no. 3). This draft is therefore
preparatory material that saves drafting time, **not** issuing time.

The third is that **the person is missing**. Determining that the evidence is sufficient
presupposes a qualified evaluator with a declaration of no conflict of interest, a figure the
project does not have internally. It is the same reason why `CE-REP-001`, the clinical evaluation
report, **is not producible by the project in any form, not even in draft**, and why this document
stops where that report begins.

**A drafting consequence that holds for everything that follows.** Where an item is not fillable,
this plan writes a section **declared empty with the reason for the absence**, and does not omit the
section. A missing section and a section declared empty are not the same thing: only the second is
verifiable by the reader, and only the second prevents the gap from being discovered when it costs
most. It is the same discipline constraint
[`V-281`](../11_registri/01-vincoli-in-vigore.md#v-281) imposes on planning - what is not producible
is declared as a gap and not planned as an activity - applied here to drafting.

---

## 3. The content items of `07 §4`, and the status of each

[07 §4](./07-valutazione-clinica.md) lists the content of `CE-PLAN-001` in six items. They are
reproduced here **in the order and in the terms of the source**, because it is against that list
that the completeness of this draft is measured, and not against a plausible list derived from the
general scheme of the regulation.

| # | Content item, from `07 §4` | Section of this plan | Status |
|:-:|---|---|---|
| 1 | Intended purpose and **claims to be demonstrated** | § 4 | **Filled in**, with a residue declared and reasoned at § 4.3 |
| 2 | **State of the art** | § 5 | **Declared empty**, with the reason |
| 3 | **Clinical parameters and acceptability criteria** | § 6 | **Filled in as to method and form**; **declared empty as to values**, with the reason |
| 4 | **Evidence strategy** for each of the three components | § 7 | **One component filled in** (§ 7.2), **two declared empty** with the reason (§§ 7.1 and 7.3) |
| 5 | **Search protocol** | § 8 | **Filled in as to method**; **declared empty as to the queries**, with the reason |
| 6 | **Follow-up plan** | § 9 | **Filled in as to instrumentation**; **declared empty as to the commitment**, with the reason |
| - | *Need for clinical competence and form of acquisition* - not an item of `07 §4`: it is a requirement of criterion 4 of `T-14` in its own right | § 10 | **Filled in** |

**What this table states, and what it does not.** It states that no item of the list is absent from
this document. It does **not** state that the plan is complete: four items out of six have an empty
part, and the sum of those parts is the majority of the clinical evaluation work. Reading the first
column as progress would be the error [07 §2.1](./07-valutazione-clinica.md) describes at length -
mistaking for documentary work a methodological activity that does not compress with resources.

---

## 4. Intended purpose and claims to be demonstrated

### 4.1 The formulation from which everything follows

The formulation of the intended purpose of telemonitoring **is frozen** by decision `D55` and is
**"deferred collection of parameters for the professional's periodic review"**. It is the
formulation on which the whole domain model is written, and it is binding on every artefact of the
project under [`V-144`](../11_registri/01-vincoli-in-vigore.md#v-144): no document, no interface, no
class name or event name may use "real-time monitoring", "continuous surveillance" or equivalent
formulations. The alternative formulation is **excluded**, and with it the body of literature that
would correspond to it.

**Why the freeze matters more here than elsewhere.** For clinical evaluation the difference between
the two formulations was not one of class: it was one **of corpus**. The query strings, the
inclusion criteria and the reference state of the art are literally different in the two cases, and
changing the formulation after the search has begun would not amend a paragraph: it would **wipe out
the work** ([07 §2.2](./07-valutazione-clinica.md)).

### 4.2 The claims to be demonstrated, one by one

The declared clinical benefit belongs to the **second branch** of the definition in Article 2 of
Regulation (EU) 2017/745 - the positive impact on the **management of the patient** - and not to the
branch of diagnostic outcomes. The formulation the project proposes as a draft, reported by
[07 §1.1](./07-valutazione-clinica.md), is: *to allow access to scheduled services for people for
whom access in person is burdensome or not timely, while maintaining the completeness and the
traceability of clinical information*.

From that formulation follow **three positive claims**, and no others. The list is closed: every
word added to the intended purpose is further evidence to produce, and every claim added reopens the
inclusion criteria of the search of § 8.

| Local tag | Claim to be demonstrated | Evidence component that covers it | Where the evidence sits in this plan |
|:-:|---|---|---|
| `AF-1` | Use of the device **allows access** to scheduled services for people for whom access in person is burdensome or not timely | Third component, predominantly; second instrumentally | § 7.3, **declared void**; the clinical follow-up of § 9 is what must fill it |
| `AF-2` | Use of the device **maintains the completeness** of clinical information | Second component for transmission and retention; third for the effect on management | § 7.2 for the technical part; § 7.3 **declared void** for the effect |
| `AF-3` | Use of the device **maintains the traceability** of clinical information | Second component, predominantly | § 7.2 |

**The `AF-` tags are local to this document** and belong to no family of project identifiers: they
do not enter the traceability matrix and cannot appear in any test. They serve to make a line
citable inside this text, and nothing else.

**The asymmetry that escapes notice, and which this plan records because it is the reason for half
the work of § 8.** "While maintaining the completeness of clinical information" is not a defensive
clause: it is a **claim to be demonstrated**, and as such it determines part of the inclusion
criteria of the search and at least one quantity to be measured in the clinical follow-up. There are
no neutral words in an intended purpose.

**The negative claims, which cost as much as the positive ones.** The four exclusions of
[02 §4.3](./02-qualificazione-e-classificazione.md) - no real-time monitoring of vital parameters in
critical or unstable patients, no generation of alarms for emergency or rescue purposes, no use as
the sole or primary means of surveillance, no autonomous generation of clinical information not
authored by the professional - **are not a border around the perimeter: they are conditions of
validity of the classification**, and this plan takes them as such. If a single one of them fails in
the product, the classification determination falls, the corpus of the search changes and this plan
must be rewritten from the present section onwards.

### 4.3 What of this item remains unfillable, and why

Three parts, declared here instead of being left to inference.

**The first.** Section 10 of the intended-purpose outline - **limits of use and requirements of the
operating environment**, that is the thresholds below which the system signals degradation and
advises against continuing - **cannot be filled in**, because those thresholds have not been
measured ([`Q-115`](../11_registri/02-questioni-aperte.md#q-115), as recalled by
[02 §5.1](./02-qualificazione-e-classificazione.md)). One does not write a value in order to
complete a table: from the moment a threshold is declared in the intended purpose it becomes a
**declared performance**, and declaring a threshold the product does not meet is worse than
declaring none. No Italian threshold is imposed by regulation
([`V-12`](../11_registri/01-vincoli-in-vigore.md#v-12)): they are product specification, and until
they are measured this item stays empty.

**The second.** The formulation of the clinical benefit reported at § 4.2 is **a proposal of the
project** and must be checked by a qualified clinical writer before being frozen: it is the explicit
recommendation of [07 §1.1](./07-valutazione-clinica.md), and this plan does not depart from it. The
need that follows is at § 10.

**The third** is not of this item but conditions it entirely, and is at § 12: the external review of
the frozen intended purpose **has not been carried out**.

---

## 5. State of the art

> **Section declared empty.** It contains no content, and the absence is declared here with its
> reason instead of being left to the reader's inference.

**What it should contain.** The state-of-the-art dossier describes **what the reference clinical
practice is today** for the services within the declared perimeter: what is done, with what results,
with what acknowledged limits. It is built on public sources - national instruments on telemedicine,
agreements reached in the standing conference, guidelines of scientific societies, peer-reviewed
literature - and contains nothing specific to a manufacturer
([07 §4.1](./07-valutazione-clinica.md)).

**Who would be needed.** A **clinical writer with documentable qualification**: verifiable
credentials and career, experience in the subject matter, and - since the product of their work
enters a file submitted to a notified body - a curriculum vitae and a declaration of no conflict of
interest that can be presented. The structure of the evaluator's qualification is itself subject to
verification by the body ([07 §2.1](./07-valutazione-clinica.md)).

**What they would produce.** The dossier, with the identification of the sources, their hierarchy,
the description of the reference practice and the declared limits of that practice; and, as a not
secondary side effect, the basis on which § 8 builds the inclusion criteria of the systematic
search.

**Why it is not available today.** Because **the project does not have that competence internally**
and does not acquire it quickly ([07 §2.1](./07-valutazione-clinica.md), third reason). Producing
the dossier is a **commitment of external resources**, not an extension of the documentation, and it
is question [`Q-176`](../11_registri/02-questioni-aperte.md#q-176), open towards the Sponsor and
unanswered. The question it poses is not rhetorical and cannot be postponed at zero cost: the
dossier sits upstream of the systematic search, on a serial chain that does not compress with
resources, and postponing it transfers in full to the end of that chain.

**What this empty section does not authorise.** It does not authorise treating the state of the art
as an optional item, nor replacing it with an informal review of the literature: an informal review
presented as a state of the art produces a nonconformity cycle, and the rewriting starts again from
the protocol.

---

## 6. Clinical parameters and acceptability criteria

### 6.1 What this section fixes: method and form, never values

This item is the one in which a clinical evaluation plan written by a technical group makes the
gravest and least visible mistake: **writing a number**. This plan does not write one, and the
reason is a product rule before it is a drafting rule.

> **No clinical threshold is set in this plan, and none can be.** The thresholds that qualify a
> parameter as within or outside range are **per-patient configuration**, defined by the
> professional for that person, never constants and never proposed by the system. A threshold
> written here would be a clinical decision taken by someone who has not seen the patient, and it
> would at the same time contradict exclusion `E4` of
> [02 §4.3](./02-qualificazione-e-classificazione.md), which is one of the conditions of validity of
> the classification.

It follows that the **clinical parameters** this item speaks of are not values: they are the
**observable quantities** on which the clinical evaluation measures its own claims, and the
**acceptability criteria** are the rules that say when the evidence gathered on each quantity is
sufficient. The distinction is the same one [05 §3.2](./05-gestione-del-rischio.md) states for risk
management - the standard supplies no threshold, the criteria are set by the manufacturer and the
plan must contain **the justification for where they are placed**, not just the thresholds - and
this plan adopts it without copying it.

### 6.2 The rules of form the quantities must satisfy

There are five, and they hold for every quantity this plan or the follow-up plan of § 9 might adopt.

1. **The definition is versioned.** A quantity whose meaning changes without its name changing makes
   the historical series incomparable and voids the measurement without anyone noticing.
2. **The denominator is explicit.** A fraction without its denominator in view is not a
   measurement: it is a claim.
3. **The quantity is comparable across installations and over time**, otherwise it aggregates data
   that do not speak about the same thing.
4. **The quantity carries no clinical content.** This is a condition, not a coincidence: clinical
   follow-up must be feedable from third-party installations without identifiable data leaving those
   installations.
5. **The quantity is a measured fact, not a judgement.** A count with its own explicit definition is
   admissible; a merit band, a weighted score or a synthetic index is new clinical information, and
   is outside the perimeter ([02 §6.1](./02-qualificazione-e-classificazione.md)).

### 6.3 Absence of data is an outcome, and the criteria must say so

An acceptability criterion that treats silence as normality is a defective criterion, and in this
domain it is defective in a dangerous way. **The absence of an expected measurement is clinical
information**: it says that something did not happen, and that is precisely the kind of fact a
periodic review must be able to see.

The operative consequence is already a constraint of the project and this plan anchors itself to it:
[`V-148`](../11_registri/01-vincoli-in-vigore.md#v-148) establishes that **the expectation of a
measurement is an entity** - the absence of a measurement is a row that declares the absence, with
expected window, deadline instant and cause where known, not the absence of a row. Two rules for the
acceptability criteria of this plan follow:

- **no criterion is defined over a set of received data without stating what has been done with the
  data expected and not received**;
- **a missed measurement is not a missing datum to be excluded from the computation**: it is an
  outcome to be counted, and the criterion says in which direction it counts.

### 6.4 What of this item remains empty, and why

> **Declared empty:** the **values** of the acceptability criteria, that is the thresholds beyond
> which the evidence gathered on each claim of § 4.2 is considered sufficient.

**Who would be needed.** The qualified clinical writer of § 5, and - for the final determination -
the qualified evaluator with a declaration of no conflict of interest, which is an act reserved to
the manufacturer role.

**What they would produce.** The reasoned placement of each criterion, with the clinical argument
that sustains it: which is the part the notified body reads first, because a criterion without a
justification is a number, and a number without a justification cannot be defended under questions.

**Why it is not available today.** Because placing a clinical acceptability criterion is a
**reasoned clinical value judgement**, not an objective datum, and the project does not have
internally the competence that formulates it
([`Q-176`](../11_registri/02-questioni-aperte.md#q-176)). Writing it anyway would produce the worst
artefact available: a table of numbers that looks like a criterion and is not one.

---

## 7. Evidence strategy for each of the three components

**MDCG 2020-1** articulates the clinical evidence of medical device software into three distinct
components, **all necessary**: valid clinical association, technical validation, clinical validation
([07 §3](./07-valutazione-clinica.md)).
The current revision of that document `[NV]` to be verified by `Compliance` at the time of use: the
coordination group's documents are revised, and this draft does not fix a revision that might by then
no longer be the one in force.

This section treats the three components in the order of the source. **Only one is filled in**, and
it is the one chapter 07 declares already producible by the project.

### 7.1 First component - valid clinical association

> **Section declared empty.**

**What it should contain.** The demonstration that a recognised association exists between the
software's output and the clinical condition or physiological state it refers to, grounded on
literature, guidelines, clinical standards and existing data.

**Why it is not available today.** It is the component **least** dependent on the product - it is
domain, and in principle it can be prepared - but it rests entirely on the state-of-the-art dossier
of § 5, which does not exist, and on the clinical competence the project does not have internally
([`Q-176`](../11_registri/02-questioni-aperte.md#q-176)). What the project can prepare without that
competence is the documentary infrastructure and the method of § 8, not the judgement this component
requires.

### 7.2 Second component - technical validation

> **Section filled in.** It is the item [07 §4](./07-valutazione-clinica.md) declares producible by
> the project, and it is the most substantial contribution this draft carries.

**The question the component answers.** Does the software generate the expected output from the
inputs, in an **accurate, reliable and repeatable** way?

**The classes of evidence the plan adopts, and which claim each answers.**

| Class of evidence | What it demonstrates | Claim served |
|---|---|---|
| Unit tests and declared coverage on safety-related functions | That the specified behaviour is the one implemented, on the portions where a defect has clinical consequence | `AF-2`, `AF-3` |
| Integration tests and end-to-end tests on the main paths | That the complete path - from acquisition to presentation to the professional - behaves as specified | `AF-1`, `AF-2` |
| Tests on channel quality with simulation of packet loss and of jitter | That the declared performance holds under degraded conditions, and that degradation is **signalled** rather than endured | `AF-1` |
| Tests on transmission to the originating system, with explicit state and acknowledgement of receipt from the receiver | That clinical information arrives **intact**, and that no intermediate state is ambiguous | `AF-2` |
| Tests on the handling of an unsatisfied expectation of measurement | That the absence of an expected measurement is recorded as an outcome and not as silence ([`V-148`](../11_registri/01-vincoli-in-vigore.md#v-148)) | `AF-2` |
| Tests on the immutable recording of acts | That reconstructing after the fact who saw what and when is possible | `AF-3` |
| Traceability from requirements to tests, **generated and not compiled by hand** | That the declared coverage matches the real coverage, and that the match does not depend on a manual update | All |

**The condition without which none of these tests is citable evidence.** It is constraint
[`V-176`](../11_registri/01-vincoli-in-vigore.md#v-176), and this plan adopts it as an admissibility
requirement and not as good practice: every test outcome intended to be cited must be produced in
**citable form** and retained as an **immutable artefact**, with the exact version of the software,
the declared environment, date and time, who ran it, the outcome and an integrity hash. **A report
that can be regenerated but is not retained is not evidence**: by the time it is cited the
environment has changed, the result is no longer the same, and an evaluator who asks to see the
cited outcome receives a different one. The reason is **citability**, and it is more demanding than
the reconstructability required by the software life cycle, because the recipient is external.

**The state of fact of this component, without attenuation.** The strategy above is filled in; **the
outcomes it should cite do not exist**. The project is in the design phase: there is no application
code, and there cannot be any before the build chain that generates the bill of materials and the
register of requirement identifiers
([`V-182`](../11_registri/01-vincoli-in-vigore.md#v-182)). It follows that this section is **filled
in as to the plan and empty as to its matter**, and that the first citable outcome will come into
existence only when the build chain retains reports in the form of
[`V-176`](../11_registri/01-vincoli-in-vigore.md#v-176). Whoever reads this section and infers that
technical evidence is already gathered makes an inference this line excludes.

> **Contradiction encountered and not corrected, because correction belongs to the owner of the
> area.** [07 §3.1 and §4](./07-valutazione-clinica.md) describe technical validation evidence in a
> form a reader takes as existing - high test coverage, integration tests, end-to-end tests,
> generated traceability - and the column "The project, today" qualifies it as "in full". On disk,
> today, there is no application code and no test report. The two readings reconcile if those lines
> are understood as an **adopted strategy** and not as an **inventory**, but the text does not say
> so, and this draft does not decide it on behalf of whoever maintains that chapter.

**And the gap this section could open, closed here.** **Technical evidence is not clinical
evidence.** No amount of test coverage, of end-to-end tests or of channel quality measurements
demonstrates that use of the device produces the expected effect on the management of the patient.
The abundance of the second component **does not compensate for the void of the third**, and it is
exactly in this sense that the three components are all necessary.

### 7.3 Third component - clinical validation

> **Section declared empty.** It is **the void** of the plan, and must be read as such.

**What it should contain.** The demonstration that the software's output, used in the intended
clinical context, produces the expected effect on the management of the patient: that is `AF-1` in
full and the part of `AF-2` that concerns the effect and not the transmission.

**Who would be needed and what they would produce.** The qualified clinical writer of § 5 for the
search and the critical appraisal of the sources; the **qualified evaluator with a declaration of no
conflict of interest** for the synthesis and for the determination that the evidence is sufficient.
The product of the latter is `CE-REP-001`, which **does not belong to this document in any form**.

**Why it is not available today.** Because the available literature concerns telemedicine as a
**mode of delivery**, not this specific product, and the bridge between the two levels - from "the
service delivered remotely in a given specialty is effective" to "this software enables that service
with completeness and traceability of clinical information" - **is precisely what the report must
build**. There is no shortcut: there is an argument, which must be written well, and whose weakness
is paid for in nonconformity cycles. Building that bridge requires the search of § 8, which has not
begun, and the qualified judgement of the manufacturer role, which is not constituted.

**What the plan declares in place of the evidence it does not have.** That the void exists, that it
is on the third component, and that the clinical follow-up of § 9 is the instrument with which the
project **intends** to fill it. A plan that declares the void and defines how to fill it is
defensible; a plan that hides it behind the abundance of the second component is not.

---

## 8. Systematic search protocol

### 8.1 What the freezing of the intended purpose makes writable

The freeze of `D55` makes the **methodological** part of the clinical evaluation startable, and this
section fills it in as far as it can be filled in without clinical competence.

**The search is a methodological activity, not a review.** It has a registered protocol, inclusion
and exclusion criteria stated **before** the query, double screening by two reviewers, retrieval of
full texts and critical appraisal of **each** included source. A report built on an informal review
is rejected, and the rewriting starts again from the protocol: that is why the protocol is written
before and not after.

**The protocol rules this plan fixes** and which do not depend on clinical competence:

1. **The inclusion criteria follow from the claims of § 4.2**, one by one, and not from the general
   topic "telemedicine". A criterion that serves no claim is a criterion that widens the corpus
   without serving the report.
2. **The exclusion criteria are stated together with the inclusion criteria**, and not derived by
   complement during screening.
3. **Screening is by two independent reviewers**, with the disagreement resolution rule stated
   beforehand. This requirement **the project does not satisfy internally**: it requires two distinct
   people, and it falls in the family of gaps of
   [`V-281`](../11_registri/01-vincoli-in-vigore.md#v-281) and of
   [`Q-189`](../11_registri/02-questioni-aperte.md#q-189). It is declared here, and not planned as
   though it were executable.
4. **Every query is recorded** with database, exact string, date of execution and number of results,
   in a form that lets a third party repeat it and obtain the same set.
5. **Screening produces a diagram** stating, at each step, how many records enter, how many leave
   and under which criterion.
6. **The critical appraisal of each included source is written**, not implied by its inclusion.
7. **The corpus is that of deferred collection for periodic review**, not that of continuous
   surveillance: they are distinct corpora, with different outcomes, populations and study designs,
   and mixing them is the quickest way to make the report indefensible.

**The evidence strategy is built without equivalence**, for the reasons of § 11.2: literature does
not require equivalence, and it is the normal road for this kind of product.

### 8.2 What of this item remains empty, and why

> **Declared empty:** the **list of databases** to be queried, the **query strings** and the
> **inclusion and exclusion criteria in their operative wording**.

**Who would be needed.** The qualified clinical writer of § 5, who is also the figure who knows
which sources are pertinent for the services within the perimeter and which are not.

**What they would produce.** The executable protocol: named databases, written strings, operative
criteria, disagreement resolution rule, and registration of the protocol before execution.

**Why it is not available today.** For the same reason as § 5 - the clinical competence is not
internal, and it is [`Q-176`](../11_registri/02-questioni-aperte.md#q-176) - and for a further
reason that must be stated: **a query string written without domain competence produces a corpus
that looks complete and is not**, and the defect is discovered under questions, when the search must
be redone and not supplemented.

**The list of pertinent bibliographic databases `[NV]` - to be determined by the Project owner - is not determined in this draft** and is
not guessed at. Some of the databases used in this field are commercial products with paid access:
identifying them therefore has a component of choice and a component of expenditure, both beyond the
reach of this document, and naming a few by way of example would produce a list that somebody would
use as though it were the protocol.

---

## 9. Post-market clinical follow-up plan

### 9.1 What this plan can contain: the instrumentation, and before the plan

Clinical follow-up is governed by Annex XIV, Part B, of Regulation (EU) 2017/745 as a **continuous**
process of updating the clinical evaluation, with a plan - methods, procedures, objectives,
rationale, reference to the relevant parts of the report and to the general safety and performance
requirements - and a schedule, whose outcome is a report that feeds both the clinical evaluation and
post-market surveillance ([07 §7](./07-valutazione-clinica.md),
[08](./08-sorveglianza-post-commercializzazione.md)).

**Here the follow-up is substantive and not formal**, for a reason that follows from § 7.3: the
initial clinical evaluation will rest predominantly on literature about the mode of delivery and on
technical validation, so the evidence void is on the third component and is precisely the void the
follow-up must fill.

**What this draft contributes is the condition for that plan to be writable**, and it is a data
design requirement, not a documentation chapter:

> **[`V-177`](../11_registri/01-vincoli-in-vigore.md#v-177).** The quantities the clinical follow-up
> plan commits to collecting must **exist as data** - with a stable, versioned definition,
> comparable across installations and over time - **before** the plan is written. Designing the
> instrumentation after writing the plan means discovering that the datum is not there, and **a
> datum that is not there cannot be recovered retroactively for the period elapsed**.

The plausible quantities for this product and the requirement each places on the data model are
already listed in [07 §7.1](./07-valutazione-clinica.md) and are **not copied here**: two lists of
the same thing in two places diverge at the first update. What this section adds is their
qualification for the purposes of this plan, in three lines:

- each of those quantities must satisfy the **five rules of form of § 6.2**, and in particular the
  fifth: they are counts of facts, not judgements;
- **none of them carries clinical content**, and this is a condition and not a coincidence, because
  the follow-up must be feedable from third-party installations without identifiable data leaving
  those installations;
- each must treat **absence** as an outcome, per § 6.3: a quantity that counts only what arrived
  measures its own instrumentation, not the device.

### 9.2 What of this item remains empty, and why

> **Declared empty:** the **follow-up plan** as such, that is `PMCF-PLAN-001`.

**Who would be needed.** The manufacturer role, and with it the qualified evaluator: the follow-up
plan is **the manufacturer's alone** ([07 §4](./07-valutazione-clinica.md)).

**What they would produce.** The commitment: what will be collected from the field to fill the
evidence voids, with methods, periodicity and objectives, and the precise link to the parts of the
clinical evaluation report each collection serves.

**Why it is not available today.** Because **a follow-up plan is a commitment, not an analysis**,
and a commitment presupposes an entity able to assume it. The project **intends** to take on the
manufacturer role and **the legal entity that would exercise it is still to be constituted**: nobody
can today commit to collecting anything from the field, and writing that plan would produce a
document formally present and substantively empty, which is worse than absence because it is falsely
reassuring.

---

## 10. The need for clinical competence, and the form in which the project intends to acquire it

### 10.1 What exactly is needed

The need is not generic and must be named for what it is, because a vague description produces a
vague search.

| Need | What it serves in this plan | Minimum requirement |
|---|---|---|
| **Clinical writer with documentable qualification** | State-of-the-art dossier (§ 5); inclusion and exclusion criteria and query strings (§ 8.2); check of the clinical benefit formulation (§ 4.3) | Verifiable qualification, experience in the subject matter, willingness to supply a curriculum vitae and a declaration of no conflict of interest |
| **Second reviewer for screening** | Double screening of the systematic search (§ 8.1, rule 3) | A person **distinct** from the first: it is a requirement of number of people, not of hours |
| **Qualified evaluator with declaration of no conflict** | Synthesis, judgement and determination that the evidence is sufficient | Act **reserved to the manufacturer role**: not acquirable before the entity exists |

**The project has none of the three internally**, and the third is not even acquirable today. The
first two are.

### 10.2 The possible forms of acquisition, with the cost and the consequence of each

**The cost is expressed neither in money nor in hours, and that is deliberate.** The project does
not estimate costs and fees, and does not produce effort estimates: it lacks a delivery history to
calibrate against and a unit that spans heterogeneous work. The cost is therefore stated in the
terms the project uses - **what it depends on**, **whether it compresses**, **what stays
uncovered** - and that is the information needed in order to decide.

| # | Form | What it depends on | Compressible | What is obtained | What stays uncovered |
|:-:|---|---|---|---|---|
| 1 | **Professional engagement of an external clinical writer** | Availability of the figure on the market and a spending decision by the Sponsor | No as to finding the figure; yes as to starting, which can be done at once | State of the art, criteria and strings: that is §§ 5, 6.4 and 8.2 | The second screening reviewer, if the engagement is with a single person |
| 2 | **Collaboration with a body that has the competence** - scientific society, research institution, healthcare organisation interested in the path | The outcome of a negotiation whose timing does not depend on the project | No | The same items as form 1, plus the possibility of the second reviewer | Confidentiality and ownership of the product must be settled beforehand, not afterwards |
| 3 | **Internal acquisition of the qualification** by the contributor | Time for training and documentable experience | **No, structurally**: a qualification is documentable only if it has a history, and a history does not compress | Nothing in the short term | Everything that is needed now. Under the project's declared capacity it would also take capacity away from work already scheduled |
| 4 | **Declared postponement**, acquiring nothing | No external dependency: it is a choice | Not applicable | Nothing | §§ 5, 6.4, 7.1, 7.3 and 8.2 stay empty. The cost is not the missing document: it is that the state of the art sits **upstream** of a serial chain that does not compress with resources, and every period of postponement transfers in full to the end of that chain |

**Two observations the Sponsor is entitled to have in writing, and which are not the decision.**

The first: forms 1 and 2 **do not require the manufacturing entity to be constituted**. A
professional engagement and a collaboration can be started earlier, and the product - the
state-of-the-art dossier - is not specific to a manufacturer. It is the same property for which
`T-14` places early those activities whose effective constraint is somebody else's queue:
**entering the queue earlier is the only lever the project has** over what does not depend on it.

The second: form 4 **is not the zero-cost choice**, and it is the one that looks like it. Its cost
appears in no document, this one included: it is a delay observable only downstream, when the
systematic search has not begun and the report does not exist.

### 10.3 What this section does not decide, and why it cannot

**The choice among the four forms belongs to the Sponsor and not to this document.** It is question
[`Q-176`](../11_registri/02-questioni-aperte.md#q-176), which **poses** the question and does not
resolve it, and which this draft cannot resolve on behalf of whoever must decide it: it involves a
commitment of external resources and an entrepreneurial choice, and this area does not decide in the
Sponsor's place.

What this section does, and it is what criterion 4 of `T-14` asks for literally, is **to name the
need** - three figures, with the minimum requirements of § 10.1 - and **to name the forms in which
the project intends to acquire it**, each with what it depends on and what stays uncovered. The
decision is missing, and it is declared missing.

---

## 11. Two methodological exclusions, declared rather than left unsaid

### 11.1 The exemption of Article 61(10) is considered, and set aside

**Article 61(10)** of Regulation (EU) 2017/745 provides that, where demonstration of conformity with
the general safety and performance requirements on the basis of clinical data is not deemed
appropriate, an adequate justification shall be provided based on the results of risk management and
on consideration of the specifics of the interaction between device and human body, the clinical
performance intended and the claims of the manufacturer.
`[NV]` - the numbering of the paragraph must be verified against the consolidated text before this
line appears in a document submitted to a notified body.

**This plan does not invoke it**, and documents its consideration because it is a question the
notified body asks, and it is better to have the answer already written than to improvise it under
questions. The three reasons for setting it aside are those of
[07 §5](./07-valutazione-clinica.md): the justification would have to be **accepted** by the body,
and for software that presents clinical information to a professional acceptance is unlikely,
because interaction with the clinical decision is precisely what grounds the qualification; even if
accepted it **does not exempt from clinical follow-up**; and a justification rejected at the first
round of questions **costs more** than a clinical evaluation conducted properly, because the
evaluation then has to be done anyway from scratch, with the file already under assessment.

### 11.2 The plan is built without equivalence, and the analysis does not enter here in any form

Annex XIV allows a clinical evaluation to be grounded on clinical data of a device for which
equivalence is demonstrated, provided the demonstration covers technical, biological and clinical
characteristics and provided the manufacturer has a **sufficient level of access to the data** of
the comparator device. For software this means access to the architecture and algorithms of somebody
else's product: with a third party's device a contract is needed that no competing operator has an
interest in granting, and equivalence with a device of the same manufacturer **does not exist here**,
because this is the first generation.

**This plan is therefore built without equivalence**, and equivalence is treated as a **conditional**
and not a planned activity: a plan that plans a negotiation whose outcome does not depend on
whoever conducts it is not a plan.

> **[`V-274`](../11_registri/01-vincoli-in-vigore.md#v-274)**, which this draft respects and does
> not attenuate. **The Annex XIV equivalence analysis does not enter the project's public
> documentation, in any form and at any stage**: it necessarily names a comparator device, it
> belongs to the technical file under the manufacturer's document control, and the constraint does
> not soften as an effect of taking on the role. No reference to a possible comparator device, not
> even by category, appears in this document.

---

## 12. The two upstream conditions that are not satisfied

They are not of this document and are not resolved by writing it. Both bear on it, and they are
recorded here because a plan that left them unsaid would look further ahead than it is.

**First - the external review of the frozen intended purpose has not been carried out.** Decisions
`D46` and `D55` require it **before** engaging any notified body. It is question
[`Q-275`](../11_registri/02-questioni-aperte.md#q-275), open towards the Sponsor, and it has a
property that sets it apart from everything else in this chapter: **it is the only prescription of
`D46` executable without the manufacturing entity constituted**. Engaging the body presupposes the
entity; the review does not, and it is commissioned from an independent regulatory reviewer without
any legal entity existing. Postponing it exposes the project to the worst risk available: that the
freeze holds until the first external confrontation and no further, once the present plan, the
perimeter of the search, the hazard analysis and the use specification have already been written on
top of it and must **all be redone**. Section 4 of this document is the first text that rests on it.

**Second - the manufacturer role is not constituted.** The project **intends** to take it on and
**the legal entity that would exercise it is still to be constituted**. For this document it follows
that **approval and assumption of the plan are reserved to the role** and do not belong to this
draft; that the report `CE-REP-001` and the follow-up plan `PMCF-PLAN-001` are not producible here
even in draft; and that the reservation **does not fall because the role will be ours**: it falls
when the entity exists, the person responsible for regulatory compliance is appointed and the
manufacturer's document control is in operation.

**What the two conditions do not prevent**, because declaring them must not become a reason for not
doing what can be done: they do not prevent writing this draft, preparing the method of § 8,
adopting the rules of form of § 6.2, constraining the instrumentation of § 9.1 before the follow-up
plan is writable, nor starting forms 1 and 2 of § 10.2. These are all items which, not done now, are
paid for later at the same price or at a higher one.

---

## 13. What this draft leaves open

| Reference | Item | To whom |
|---|---|---|
| [`Q-176`](../11_registri/02-questioni-aperte.md#q-176) | **Whether and how to acquire the documentable clinical competence** the project does not have internally. § 10.2 lists four forms with what each depends on and what stays uncovered; the choice involves a commitment of external resources and **is not this area's** | → Sponsor |
| [`Q-275`](../11_registri/02-questioni-aperte.md#q-275) | **The external review of the frozen intended purpose has not been carried out** (§ 12). It is the only prescription of `D46` executable without the entity constituted, and § 4 of this plan already rests on it | → Sponsor |
| [`Q-115`](../11_registri/02-questioni-aperte.md#q-115) | The thresholds of the operating environment have not been measured: until they are, the item "limits of use and requirements of the operating environment" of the intended purpose remains unfillable (§ 4.3) | Technical, product |
| [`Q-189`](../11_registri/02-questioni-aperte.md#q-189) | **Double screening of the systematic search requires two distinct people** (§ 8.1, rule 3), and falls in the same family of gaps as records at distinct roles. It is declared as a gap and not planned as an activity ([`V-281`](../11_registri/01-vincoli-in-vigore.md#v-281)) | → Sponsor |
| `[NV]` | Current revision of MDCG 2020-1 (§ 7): to be verified **at the time of use** and not once and for all | `COMP` |
| `[NV]` | Precise numbering of Article 61, paragraph 10 (§ 11.1), and of the points of Article 2 recalled at § 4.2: to be verified against the consolidated text | `COMP` |
| `[NV]` | List of pertinent bibliographic databases (§ 8.2): not determined, not guessed at, with the reason declared | `COMP`, with the competence of § 10 |
| - | **Placement of this document in the list of documents subject to control.** The [document control procedure](/08_compliance/PROCEDURA-controllo-dei-documenti.md) lists controlled documents at its § 3; this draft **does not appear there**, and adding it is a modification of an approved document, not an act of this draft | Compliance, with the nominated reviewer |
| - | **Contradiction declared at § 7.2**: [07 §§3.1 and 4](./07-valutazione-clinica.md) describe technical validation evidence as existing, while there is no application code and no test report. Not corrected here: correction belongs to the owner of the area | Compliance |
| - | **The clinical evaluation report `CE-REP-001` is not producible by the project in any form, not even in draft** (§§ 2 and 7.3), **and neither is the follow-up plan `PMCF-PLAN-001`** (§ 9.2) | **The manufacturer**, with the entity constituted and the evaluator appointed |
