---
title: Principles and method
sidebar_position: 2
description: "How we decide what enters and what leaves - the four classes of activity, priority criteria in lexicographic order, retroactively unrecoverable activities, technical debt and regulatory debt, the capacity declared by D54 and the rule by which scope reduces instead of sliding the date."
---

# Principles and method

This chapter exists for a precise reason: **a priority without a declared criterion is
a preference in disguise**, and in a project with a fixed date and small capacity the
preferences accumulate until they produce a plan that nobody can defend. The criteria that
follow have been fixed **before** the decisions of chapter [02 - Milestones](./02-traguardi.md), and are applied to all entries in the same way.

---

## 1. The problem, stated with precision

Telemedic has, as of 25 August 2026, six quantities and **all six are known**:

1. A **delivery date decided by the client**: 30 November 2026 is the **first releasable
   deliverable** (`D53`, which closes [`Q-180`](../11_registri/02-questioni-aperte.md#q-180)).
2. A **declared capacity**: **a single contributor, working part-time** (`D54`, which closes
   [`Q-181`](../11_registri/02-questioni-aperte.md#q-181)).
3. A broad functional scope and already catalogued.
4. An obligation of traceability that admits no shortcuts.
5. An obligation of full translation (`D50`), which `D56` makes **parallel to development** and no
   longer a prerequisite of every line of code.
6. An obligation of accessibility that is an acceptance criterion for every screen.

Until the third round of decisions the second quantity was missing, and this chapter produced
dates under assumptions. **Now capacity is a given**, and it follows a different and harder rule:

> **With the date fixed and capacity declared, the only free variable is scope.**
> The date is not negotiated, capacity is not invented: **scope is reduced and what has been removed
> is declared**, with indication of what is recoverable and what is not.

It is an arithmetic rule, not a judgement. Three quantities constrain a plan - date, capacity,
scope - and two are fixed by a client decision. The third is determined as a consequence. A plan
that left scope invariant would not produce more work: it would produce **a publicly missed date**,
which is the only worse outcome than reduced scope.

Whoever reads a roadmap built this way can do two things that a roadmap with bare dates does not allow: verify that the
declared perimeter is actually buildable, and **see what has been sacrificed** instead of discovering it at installation. Chapter
[03 §5](./03-primo-rilascio-utilizzabile.md) is dedicated entirely to this, and it is the part of
this area with most value for whoever must decide whether to adopt the product.

---

## 2. The four classes of activity

Every activity of the project belongs to one of these four classes. The class does not depend on
the value of the activity: it depends on **what happens if you defer it**. It is the only
property that matters in a sequencing decision.

| Class | Definition | What happens if you defer it | Compressible? |
|---|---|---|---|
| **A - Retroactively unrecoverable** | Its result is not reconstructible after the fact, or is at a qualitatively different cost | The result is **lost**, not delayed. No amount of subsequent work recovers it | No |
| **B - With traversal time determined by third parties** | Duration depends on a third party, not on work dedicated to it | The delay transfers **entirely** to the end of the chain | No |
| **C - On others' critical path** | Unblocks other activities, often at modest own cost | Blocks **n** downstream activities, and the cost of delay is **n** times the cost of the activity | No, but it is brief |
| **D - Compressible** | Produces value proportional to work dedicated, and value does not degrade with waiting | Value arrives later. Nothing else | Yes |

**The sequencing rule that follows is trite to state and hard to practise**: do A, B and C
first - in order, regardless of their apparent value - and compress D.

It is hard to practise for a psychological reason that is documented: activities in classes A, B and
C **are not visible**. A register of requirement identifiers is shown to no one;
a request for information sent to a third party produces nothing visible for weeks; an empirical
verification of two days on a security mechanism produces, at best, the confirmation that what was thought was true. Activities
in class D, by contrast, are all visible: a screen, an endpoint, a demo. **The pressure to invert the order
is constant and is the main cause of failure in regulated projects.**

---

## 3. Priority criteria, in lexicographic order

Criteria **have no weights** and do not sum. They are applied in order: the next criterion is
used only at parity on the previous one. A weighted system permits compensating a patient safety
defect with a commercial benefit, and this is precisely the property that is not wanted here.

| # | Criterion | Operational question |
|---|---|---|
| **1** | **Patient safety** | If this thing is missing or done badly, can someone be harmed? |
| **2** | **Unrecoverability** | If I defer it, is the result still obtainable, and at the same cost? |
| **3** | **Legitimacy of use** | Without this thing, is the use of the product lawful? Can the repository stay public? |
| **4** | **Unblocking** | How many other activities depend on this, and what is the cost of their halt? |
| **5** | **Clinical value per unit cost** | At parity of all else, what produces more benefit for the patient with less work? |
| **6** | **Desirability** | What would we like, if there were time? |

Three observations on this scale, because it is counterintuitive and must be defended.

**Clinical value is fifth, not first.** Not because it matters little: because it is **the only criterion that
does not degrade with time**. A clinically useful function is equally useful in six months;
an unfrozen requirement identifier is unrecoverable in six months; a question not asked to a third party today produces an answer
in six months instead of two. Putting clinical value first means, in practice, sacrificing the conditions
that make its delivery possible.

**Patient safety precedes unrecoverability, but rarely comes into conflict with it.**
In almost all cases the two push in the same direction, because what makes a healthcare
system safe - traceability, risk management, verifiability of exclusions -
is precisely what cannot be reconstructed after the fact.

**Legitimacy is third and not first** because, in the current state of the project, it is already
satisfied: mandatory declarations are published, the repository declares it is not a medical device, the separation
between repository and distribution is formalised. If a single one of these conditions were to fail, the criterion would
immediately rise to first place, because its violation is continuative: a period of publication without
disclaimer is not "recovered".

---

## 4. The relationship between clinical value and cost

### 4.1 Why estimation cannot be done, and what is done instead

An estimate of cost requires known capacity, observed productivity and a shared unit of measure.
As of 25 August 2026 the project has the first - `D54` declares **a single contributor working
part-time** - and **has not the other two**: it has no delivery history on which to calibrate, and
has no unit that spans work as diverse as writing a chapter, translating a corpus, writing a
validation engine and a session of testing with representative users.

`D62`, on 26 August 2026, quantified capacity in **ten to twenty hours per week**,
closing the `[NV]` that this area carried. **The other two conditions remain missing**: there is not yet a delivery
history on which to calibrate, and there is no shared unit of measure. It follows that the durations in chapter
[02](./02-traguardi.md) **remain allocations of the remaining calendar** to a constrained sequence, and do not become
estimates for the sole fact that hours are known. The difference is substantial and must be understood, because
it determines what protects the date:

> An estimate protects the date by predicting effort. A calendar allocation **predicts nothing**: it protects the date
> only if there exists, declared in advance, **the order in which scope is sacrificed**
> when the allocation proves insufficient.

That order exists, is declared in [03 §6](./03-primo-rilascio-utilizzabile.md), and is the mechanism that
protects the date of 30 November 2026. It is not a contingency plan: it is **the part
of the plan that is executed first when reality departs**, and is written before departing precisely because
writing it after would mean choosing under pressure.

**What is done instead of the estimate** is declare three quantities that are observable even
without a delivery history:

1. **The relative order of magnitude**, in discrete declared classes - days, weeks,
   months, quarters - never numbers.
2. **The shape of the cost curve**: linear in volume (translation), stepped (one more component to install
   and monitor), threshold-based (a check that either passes or requires a full cycle), or **not compressible**
   (waiting for a third party).
3. **The cost that is not visible**, listed explicitly in §4.3, because it is what makes
   estimates fail even when capacity is known.

### 4.2 Clinical benefit is not a property of the function

It is a property of the function **in the pathway it lives**. An excellent reporting function in a
system that does not deliver the document to the system of origin produces zero benefit, because
the document stays where the clinician does not search for it. It follows the criterion for
composing the first release, which chapter [03](./03-primo-rilascio-utilizzabile.md) applies to the letter:

> **Deliver the complete vertical path as narrow as possible, not the broadest possible set
> of functions.**

A complete vertical path produces benefit from the first day it exists, can be tested
entirely, can be shown, and - decisive property for a regulated project - **can be
traced entirely from requirement to test**. A broad set of incomplete functions has
none of these properties, and moreover does not permit saying what is done.

### 4.3 The cost that is not visible

Every item in this list is, in a regulated healthcare project, of the same order of magnitude
as the work of realisation it refers to. Estimates that ignore them are wrong by a factor
of two or more, systematically.

| Hidden cost | Why it is the same order of magnitude | Where it is documented |
|---|---|---|
| **Requirement→design→code→test traceability** | It is not a relation to record: it is an annotation on every test, a register that makes the build fail on a non-existent identifier, and a report generated at every release | [`01_technical/08-qualita-e-test.md`](../01_technical/08-qualita-e-test.md) §9 |
| **Full translation and its non-divergence** | The volume is that of the Italian corpus, and the divergence check in continuous integration makes every Italian modification a double job, forever | `D50`; check `G8` in [`01_technical/09-integrazione-continua-e-rilascio.md`](../01_technical/09-integrazione-continua-e-rilascio.md) §3 |
| **Negative tests** | Every scope exclusion has a test that attempts to violate it and must fail. They are more numerous than positive tests in the clinical perimeter | [`03_functional/07-fuori-perimetro.md`](../03_functional/07-fuori-perimetro.md), column "verification" |
| **Manual accessibility and with representative users** | Automation intercepts a minority share of defects; the rest is sessions with real assistive technologies and real people | [`01_technical/08-qualita-e-test.md`](../01_technical/08-qualita-e-test.md) §6.1 |
| **Tests on real devices** | Two *mobile first* criteria are not verifiable on emulator, and require hardware and person-hours | [`01_technical/04-frontend.md`](../01_technical/04-frontend.md) §6, criteria `M4` and `M5` |
| **Tested fallbacks** | A fallback that does not run in the test suite is not a fallback. The cost of every declared alternative is the cost of keeping it tested | [`01_technical/01-stack-e-motivazioni.md`](../01_technical/01-stack-e-motivazioni.md) §7.3 |
| **Surveillance of third-party components** | It is **recurring capacity**, not a one-time activity, and must be subtracted from capacity before calculating any date | §9 of this chapter |
| **Reissue of documents born outside control** | What is born outside document control must be reissued, and reissuing costs more than emitting well | `D45` |
| **Cycles of response to non-conformity** | It is not work of the project but occupies the same people, and its duration does not depend on them | [05 §2](./05-rischi-e-dipendenze.md), risk `R-07` |

---

## 5. Why some things must be done first even though they pay back later

It is the heart of this chapter and the reason why the sequence of chapter [02](./02-traguardi.md) has the
form that it has.

There exists a class of activity whose return is **deferred** and whose cost of omission is
**increasing and non-linear**. Deferring it is, at each instant, the locally rational choice: they
produce nothing visible today and their apparent cost is entirely immediate. The flaw in the reasoning is that the bill
does not arrive when you stop deferring: it arrives **multiplied**, at the moment when someone asks you to
prove something.

### 5.1 The five class A activities, one by one

They are listed in `D45` and here each receives its own multiplier and its own
temporal placement.

**1. Freezing of requirement identifiers** (`RF-*`, `RNF-*`, `BR-*`, `ATT-*`, `UC-*`,
`OUT-*`) **with register.**
*Why it is unrecoverable*: the traceability required by the software lifecycle for
medical devices binds a requirement to design, code and test. If identifiers change after code exists,
the matrix is not updated: it is **reconstructed by hand**, requirement by requirement, and the reconstruction
is itself not verifiable because nobody can prove that requirement `RF-142` today is the one of six months ago.
*State*: the intervals are frozen and declared (constraint [`V-120`](../11_registri/01-vincoli-in-vigore.md#v-120)); missing is the **register in
addition only** and the check that makes the build fail on a non-existent identifier.
*Cost of omitting it*: not quantifiable, because it is not a delay: it is the impossibility for
anyone to certify afterwards.

**2. Inventory of third-party components and bill of materials generated by the first
pipeline.**
*Why it is unrecoverable*: to census the dependencies of a mature project after the fact costs,
according to the source cited by `D45`, **from three to five times** the cost of censusing them as they
enter. The reason is that a dependency entered without evaluation brings its own
transitives with it, and the graph must be reconstructed when nobody remembers why a library is there.
*Operational consequence*, placed as constraint [`V-182`](../11_registri/01-vincoli-in-vigore.md#v-182): **the first pipeline precedes the first line of application code.** Not "accompanies": precedes. Check `G5` - a
component present in the bill and absent from annotations makes the build fail - is what makes the rule
effective instead of exhortatory.

**3. Document control, before producing other documents.**
*Why it is unrecoverable*: what is born outside document control must be **reissued**, and
reissuing is not a formality: it is the repetition of approval with nominated reviewers and
recording of the act.
*Observation on current state*: the project has already produced a large documentary body.
Every day that control does not exist increases the volume to be reissued. **It is the class A activity with the
fastest-growing cost of omission**, and it is the reason why it appears
in the first milestone of chapter 02 and not in a later one.
*Realistic mitigation*: the form proposed is **documents as code** - procedures versioned in the repository,
approval via pull request with nominated reviewers,
immutability guaranteed by branch protection and commit signing - which satisfies the
requirements of document and record control in a more robust way than a file archive, **provided** that it
is validated as a tool and that the procedure exists that explains to whoever verifies how the
correspondence between review, reviewer and approval constitutes the approval record.

**4. Separation between repository and distribution, with published declaration.**
*Why it is unrecoverable*: it is not the document that is unrecoverable, it is the **period of
publication without disclaimer**. An artefact made available without the non-marking warning is an implicit
statement that no subsequent correction cancels.
*State*: **satisfied**. [`NOT-A-MEDICAL-DEVICE.md`](https://github.com/fedcal/Telemedic/blob/main/NOT-A-MEDICAL-DEVICE.md) and [`DISTRIBUTION-POLICY.md`](https://github.com/fedcal/Telemedic/blob/main/DISTRIBUTION-POLICY.md) are present in the public
repository. The pipeline check remains that prevents publication of an artefact lacking the
declaration.

**5. Freezing of intended use.**
*Why it is unrecoverable in proper sense*: it is the only one of the five whose cost of omission is not
a multiplier but a **discrete jump**. The difference between "real-time monitoring of vital parameters"
and "deferred collection of parameters for periodic review by the professional" shifts the risk class,
the software safety class, the perimeter of clinical evaluation and the order of magnitude of the cost
(`D46`).
*State*: **satisfied**. `D55` freezes the formulation to "**deferred collection of parameters for
periodic review by the professional**", keeps Class IIa and software safety class B, and excludes the
real-time formulation. The domain model was already written **entirely**
on this formulation (constraint [`V-144`](../11_registri/01-vincoli-in-vigore.md#v-144)): the decision confirms it and requires no rewrites.
Closes [`Q-144`](../11_registri/02-questioni-aperte.md#q-144).
*Permanent consequence, replacing the previous one*: it is no longer a risk of rewriting,
it is a **prohibition**. No function can be added if it moves the system towards clinical real-time, and
**the evaluation must be done before writing the function, not after**. It is the case where
§6 of this chapter - how we say no - stops being a procedure and becomes a
boundary.

### 5.2 The class B activities that the project assumes with `D58`

`D58` **amends `D28`, `D45`, `D49` and constraint [`V-06`](../11_registri/01-vincoli-in-vigore.md#v-06) regarding the recipient of the
certification pathway**: the role of manufacturer will be assumed by the project, and the legal entity must
be established. The activities that `D45` attributed to "whoever intends to certify" thus become
**activities of the project**, and there are four:

1. **Establishment and formalisation of the manufacturer subject.**
2. **Appointment of the person responsible for compliance with the regulation**, with documented qualification.
3. **Requests for information to notified bodies.**
4. **Launch of the clinical evaluation plan.**

They are all four **class B**: their duration is determined by third parties - administrative proceedings,
queues of notified bodies, availability of documented clinical competence - and **does not compress by
dedicating more work to it**. It follows the most important sequencing consequence of this chapter,
and must be stated without attenuation:

> **The activities of `D58` cost few hours and many months. They must therefore be launched now, not after
> the first release.** They are the only block of work that `D54` does not penalise - a part-time contributor
> can send a request for information and wait exactly as a full-time office could -
> and every week in which they do not start is transferred **entirely** to the end of the chain, where no
> increase in capacity recovers it.

They are on the calendar in [02 §5](./02-traguardi.md), with the project as owner, and with a
warning that accompanies every date in that paragraph and is never separated from it: **they are dates of
internal planning, not promises of outcome.** The prohibition of [`V-171`](../11_registri/01-vincoli-in-vigore.md#v-171) is intact - **in no place is it
written that the product will be marked by a date** - and the state of fact is intact:
today the product **does not bear the CE marking** and whoever installs or places it in service assumes
the obligations that follow.

### 5.3 Class C activities, and why they cost little and are worth much

They are brief empirical verifications that remove an uncertainty on which costly decisions depend.
Their common feature is that **the cost of the verification is orders of magnitude lower than the cost
of having documented a non-existent behaviour**.

| Verification | What it unblocks | What it costs to have omitted | In the reduced scope |
|---|---|---|---|
| Token exchange in the gateway with explicit delegation (`D18`) | The entire federated identity mode towards the integrator | Redesign of the authorisation boundary after code exists | **Yes** - it is the entry path of `RU-1` |
| Fallback to single-use entry token, issued on back channel (`D18`) | Start of the session by the integrator **without embedded component** | The absence of every integration pathway, once embedding is cut | **Yes**, with greater weight than before: in the reduced scope it is not a fallback, it is **the** mode |
| Network isolation in egress of the relay node | The security posture of the most exposed component | An exit path to the internal networks of whoever installs | **Yes** - primary defence ([`V-10`](../11_registri/01-vincoli-in-vigore.md#v-10)) |
| Known defects of the identity federation product (`D37`) closed in configuration and monitored by test | The security posture of identity | An escalation path that returns at first update | **Yes** |
| Forwarding of authentication context required through intermediation ([`Q-160`](../11_registri/02-questioni-aperte.md#q-160), `B-8`) | Propagation of the level of assurance, and its public description | **Correction of public documentation on a security mechanism** | **No** - follows conformity on national identity, outside the reduced scope. **The rule stays**: until the outcome is recorded, public documentation does not describe the mechanism |
| Recording container negotiated at runtime ([`V-11`](../11_registri/01-vincoli-in-vigore.md#v-11), [`V-115`](../11_registri/01-vincoli-in-vigore.md#v-115), `C-3`) | Public formulation on recording | A false statement for a part of the installed base | **No** - follows session recording, cut from `RU-1` |
| Behaviour of the broker in single-node configuration | The guarantees declarable in customer installation | Functional requirements that depend on guarantees not available | **No** - the broker is cut from `RU-1` (reversible cut, [03 §5](./03-primo-rilascio-utilizzabile.md)) |

`D18` is explicit on the placement of the first: **verification spike in the first week of
development, before every other activity.** The roadmap adopts it without attenuation.

**The rule that governs the last column**, and applies every time scope reduces: an empirical
verification serves to remove an uncertainty on which a costly decision depends. If the decision has been
deferred together with the function, **the verification is deferred with it** - but **the rule it
presided over stays in force**, and the document states it line by line instead of
letting the verification disappear taking the prohibition with it.

---

## 6. How we say no

A roadmap that contains no method for refusing does not refuse: it defers, and deferral is
worse than refusal because it does not produce a decision.

The project already has the tool and builds no second:
[`docs/03_functional/07-fuori-perimetro.md`](../03_functional/07-fuori-perimetro.md) §7 defines
the procedure for expanding scope, with a cost **proportionate to the category of exclusion**.
The roadmap adds three rules of sequencing to it.

**First - the proposal starts from a use case with an actor, not from a technical capability.** "It would
be useful to calculate a score" is not a proposal. The correct formulation names who has the
problem, what decision they must make and what they lack today.

**Second - for exclusions of category `QUAL` the evaluation of regulatory impact precedes
the estimate of effort.** The order is binding: evaluation, then decision, then planning.
Estimating first produces the systematic effect of making appear economical a modification that
entails a reassessment of conformity.

**Third - three functions are one user story away from elevation of class** and are
under change control for `D26` and `OUT-21`: alert on threshold, image processing, assisted reporting.
A proposal that touches them is not a function proposal:
it is a proposal to modify the device, and follows that pathway.

---

## 7. Technical debt

### 7.1 Operational definition

Technical debt is a realisation choice that **reduces the cost today and increases it tomorrow**. It is not
a defect - a defect must be corrected - and it is not an undeclared shortcut: it is a
decision with an interest, and as such is recorded.

The project adopts the two-axis classification - deliberate or inadvertent, prudent or imprudent - and
draws a rule for each quadrant.

| | **Prudent** | **Imprudent** |
|---|---|---|
| **Deliberate** | "We know the correct form is X, we deliver Y because it is needed now, and Y has a declared cost" → **permitted, with register entry** | "We do not have time to do it right" without knowing what "right" means → **not permitted** |
| **Inadvertent** | "We now know how it should have been done" → **normal**, recorded when it emerges | "We did not know a correct way existed" → **it is a competence defect**, resolved with the foundations guide, not with a debt entry |

### 7.2 The form of the register entry

An entry without these five pieces of information is not an entry: it is a complaint.

1. **What was delivered** and what would be the correct form.
2. **Why** this choice was made, with date and person.
3. **The interest**: what costs more, and for whom, every time that area is touched.
4. **The trigger for extinction**: the event on which the debt must be paid, not a date. "At the second integrator", "before first exercise with real data", "before the volume exceeds the measured threshold".
5. **What prevents extinction today**, if something does.

### 7.3 The forbidden debt

There are areas in which debt **is not permitted in any form**, because its interest is not
paid by the project but by a patient. The list is closed and follows from the constraints in
force:

- **Recording of access in the immutable register.** No delivery can reduce its
  coverage, not even temporarily.
- **Verification of session keys.** It is a risk control, not a function.
- **Notice of inadequate quality to the professional.** Idem.
- **Issue and delivery of clinical alerts.**
- **Collection and verification of consent.**
- **Isolation between tenants.**
- **Absence of clinical content from registers, metrics, traces and event envelopes.**

The operational rule that follows is already written in the technical area and the roadmap adopts it:
if any of these properties cannot be guaranteed, **the system refuses to deliver the
service** instead of delivering it without. A device that silently degrades its own
security controls is more dangerous than an unavailable device.

---

## 8. Regulatory debt

It is a category distinct from technical debt and must be treated differently, because it has a property
that technical debt does not have: **it cannot be refinanced**.

Technical debt is paid when you want, with interest. Regulatory debt is paid
**when someone else decides**, and at that moment either it is paid or the dossier does not close. There is no
reduced version of the payment, no negotiable extension with oneself, and no possibility of declaring it acceptable: the acceptability is
decided by whoever verifies.

### 8.1 The forms it takes

| Form | How it presents | When it is paid |
|---|---|---|
| **Requirement without proof** | The traceability report lists the requirement in the "without proofs" view | On the request to demonstrate coverage |
| **Risk control without efficacy verification** | Exists the proof that the measure is there, not the one that it works | On verification of the risk management file |
| An `[NV]` marking left unclosed or without recipient on a released component | An unverified technical statement is in production with no indication of who must close it | On first challenge, or at first incident |
| **Divergence between the two languages** | A regulatory content says two different things in two languages | It is **a documentary defect in a medical device**, not a translation problem |
| **Non-verifiable scope exclusion** | In the "verification" column there is a statement, not a proof | On first delivery under pressure, when the exclusion comes back in the window |
| **Document produced outside control** | It has no reviewer, approval or recorded version | On reissue, which is entire |
| **Decision taken arbitrarily** on an entry declared deferred | A pull request has resolved a question from [`02_architecture/09-decisioni-rinviate.md`](../02_architecture/09-decisioni-rinviate.md) | When the divergence emerges between what the code does and what the documentation says |

### 8.2 The project's rule

> **Regulatory debt is not contracted. It is declared as a gap, with the date on which it is born.**

The difference between the two things is not formal. Contracted debt is invisible and is discovered
at verification; a declared gap is a row in the traceability report, with its
justification, and it is precisely the form that whoever verifies expects to find. A requirement
without proof **does not block** the build - blocking would produce the opposite effect, i.e. fake proofs
written to satisfy the check - but **appears in the report and must be justified at
release**.

### 8.3 The regulatory debt already in existence, as of 25 August 2026

Basic honesty: the project already has some. Listing it is the first instalment.

| Gap | Since when | Who can close it |
|---|---|---|
| Document control not instituted, with a large documentary body already produced | From the beginning | `COMP`, with milestone `T-01` |
| No addition-only register of requirement identifiers, although the intervals are frozen | From the beginning | `COMP` and `TECH`, with `T-01` |
| **Reissue under document control of already produced documents**: under `D54` it is not executable by 30 November 2026 and is **declared as a gap**, not planned | From `T-01` onwards | `COMP`, after the first release. The volume to be reissued **grows every day**: it is the gap with the fastest-growing cost of omission |
| English version absent for most of the corpus, with obligation of full translation (`D50`) | From the beginning | `D56`: assisted translation area by area, **parallel to development**. Non-deferrable prerequisites: public warnings, foundations guide, compliance and security areas |
| Numerous `[NV]` open in already written areas, each with declared recipient | Progressively | The recipient areas |
| Public page not aligned with approved reformulations (`D19`, `D29`) | From approval of `D19` | [`Q-185`](../11_registri/02-questioni-aperte.md#q-185) → `PROD`, `ORCH` |
| **Records in distinct roles not producible** - internal audit, release review, configuration verification performed by someone other than the code author | From `D54` | **Nobody internally.** It is not a problem of hours: [`Q-189`](../11_registri/02-questioni-aperte.md#q-189) decides which subset is accepted as a declared gap and which is covered by acquiring the function externally |
| **Manufacturer role not yet established**, while `D58` attributes it to the project and multiple calendar steps presuppose it formally | From `D58` | Client, with [`Q-280`](../11_registri/02-questioni-aperte.md#q-280). It is class `B`: its duration does not depend on working capacity |

The last two rows are not like the others, and the difference must be said. The first five are gaps that
**work closes**: someone pays them in hours and they disappear. The last two **do not close by working more**, because one
requires a different person and the other an administrative proceeding. Confusing them produces plans in which an insoluble row is put
in the queue with rows that can be solved and disappears from view.

---

## 9. Capacity is a quantity, and must be subtracted before it is spent

The calculation of dates starts from a **net** capacity, not a gross one. Under `D54` the gross capacity is
**a single contributor working part-time**, and the subtraction that follows is not a refinement: it is
the difference between a plan and an announcement. The items that follow are recurring capacity: they consume
time every month, forever, and must be subtracted before planning anything.

| Recurring item | Why it is recurring | Order of magnitude |
|---|---|---|
| Surveillance and updating of third-party components | The service level is in days from advisory ([`V-185`](../11_registri/01-vincoli-in-vigore.md#v-185)), and the release cadence of exposed components is high | Not negligible and not estimable without history: `[NV]`, and the estimate falls to `ROAD` once the project has a delivery history of its own to calibrate against |
| Maintaining alignment between the two languages | Every modification to Italian content is incomplete until it updates English (`D50`, check `G8`) | **Doubles** the marginal cost of every documentary modification |
| Maintenance of the traceability matrix | It is generated automatically, but gaps must be justified at every release | Low if automated from the start; high if recovered |
| Response to reports and coordinated disclosure | The channel must work, and a channel that does not respond is worse than one absent | Not estimable without observed volume: `[NV]`, and the estimate falls to `ROAD` after the first year of reports received |
| Monthly review of the roadmap and risks | It is the procedure of §8.1 of chapter [00](./00-indice.md) | Hours, not days |

It follows the formulation that chapter [02](./02-traguardi.md) uses for all internal dates:

> Net capacity = declared capacity − recurring capacity. **Dates are allocated on the
> net.** A plan built on gross capacity is already behind the day it is
> published.

Under `D54` there is a second subtraction, which is new and weighs more than the first: **a single contributor's
capacity is divided between writing and verifying**, and verification is not compressible
because it is what makes work demonstrable. When the same person writes and verifies, you do not gain time:
you lose a property, and it is precisely the one that §9-bis describes.

### 9-bis. What a single person cannot do, and not for lack of hours

`D54` brings with it a consequence that must be accepted formally and not circumvented. Some
records required by the quality management system **presuppose distinct subjects**,
and no amount of individual work produces them:

| Record | Why it requires two subjects | What holds if a single person produces it |
|---|---|---|
| **Internal audit** | The auditor cannot audit their own activity: it is the very definition of audit | Nothing. It is not an audit with a defect: **it is not an audit** |
| **Release review** | The review ascertains that whoever decided is not ascertaining themselves | A formally present record and substantially empty, and it is worse than absence because it is **falsely reassuring** |
| **Configuration verification performed by someone other than the code author** | Verification serves to intercept what the author does not see, by construction | Nothing, for the same reason |
| **External independent review of critical security code** (`D18`) | The prescription says **external and independent**, and it is a property of the reviewer, not of the review | Nothing |

**It is not a problem of hours.** It is the reason why this chapter places constraint [`V-281`](../11_registri/01-vincoli-in-vigore.md#v-281):

> **No milestone enters the plan if it requires two distinct subjects and the second does not exist.**
> The record that would follow is declared as a **gap, with the date on which it is born**, and
> is not planned as an activity. Planning an activity that cannot be produced is the most effective way
> to make it disappear from view.

The allocation - which subset is accepted as a declared gap and which is covered by
acquiring the function externally - is **a client decision** and remains open as [`Q-189`](../11_registri/02-questioni-aperte.md#q-189).
Chapter [03 §5](./03-primo-rilascio-utilizzabile.md) lists it amongst **irreversible** cuts,
because a record dated to a period is not produced after the period has passed.

---

## 10. How a date is treated

Every internal date in this roadmap is built with three explicit elements, and the three always appear together.

**1. The plan.** A sequence of milestones with binary criteria, in order of dependency, each
with a **trigger** and an **owner**. The sequence is the robust part of the plan: it changes only if
dependencies change, which are few and declared.

**2. The allocation of the remaining calendar.** Not an estimate: the apportionment of the
days remaining between the milestones of the sequence, under the capacity declared by `D54` and
quantified by `D62` at ten to twenty hours per week (§4.1). **That the hours are known does not
turn the allocation into an estimate**: the delivery history and the shared unit of measure are
still missing.

**3. The rule for absorbing deviations.** What happens when a milestone does not close at its date. The rule is
declared once and applies to all, and has changed from the previous version of this chapter because what is
fixed has changed:

> With `D53` and `D54`, **date and capacity are fixed**. A deviation **is not absorbed by moving
> the date and is not absorbed by increasing capacity**: it is absorbed **by reducing scope**,
> according to the sacrifice order declared in [03 §6](./03-primo-rilascio-utilizzabile.md), which is
> executed top-down and in full. Outside that order, in every circumstance, are the blocking release criteria of
> [03 §8](./03-primo-rilascio-utilizzabile.md) and the list of §7.3 of this chapter, where debt is
> not permitted in any form.

Placed as constraint **[`V-282`](../11_registri/01-vincoli-in-vigore.md#v-282)**. Two properties follow, and the second is the one that matters:

- **A date is never moved in silence.** If scope is no longer reducible without affecting a blocking criterion,
  the date **is declared missed** with cause recorded (§8.2 of chapter [00](./00-indice.md)). It is not a failure
  of the method: it is the method working.
- **The choice of what to sacrifice remains readable and reversible.** Every entry in the sacrifice order
  states whether the cut is recoverable and what it means for whoever installs. Whoever reads the release
  can therefore reconstruct **why the product has that form**, which is information that a list of delivered
  functions does not contain.

**What this discipline makes impossible**, and it is its purpose: deliver a reduced scope
while making it appear as the planned scope.

### 10.1 What is measured when a date moves

The three parts of §10 say how a date is set and what happens when it does not hold. They do not
say how we learn from deviations that have already occurred, and without that part a roadmap
repeats the same forecasting errors at every cycle.

This is why
[`registro/velocity-dei-traguardi.tsv`](https://github.com/fedcal/Telemedic/blob/main/registro/velocity-dei-traguardi.tsv)
exists: an **addition-only event journal**, one row for every first allocation, every
recalibration, every closure. It is not a table of states - the state of a milestone is the
projection of the events that concern it - for the same reason already written in
[`registro/README.md`](https://github.com/fedcal/Telemedic/blob/main/registro/README.md) for
requirement identifiers and, before that, in view `V-121` on alarms: a "state" column would need
to be **modified** on every change, and a modified row is no longer verifiable after the fact.

**The two quantities the register makes readable.** The first is velocity: how many criteria
close per working day, measured and not estimated. The second, more useful, is the **systematic
deviation**: if every forecast is wrong in the same direction, the next forecast must be
corrected by that amount instead of being believed.

**The column that keeps the register honest is `motivo`, and the reason must be stated.** A
milestone closed ahead of schedule can mean three different things that look the same in the
numbers: that the work went better than expected, that it had been overestimated, or that the
criteria were **already satisfied and nobody had counted them**. On 27 August 2026 all three
cases occurred on the same day - `T-01` closed because the work was finished, `T-03` and `T-07`
brought forward because the roadmap declared less than was actually true. Without the `motivo`
column the register would conflate them, and the velocity derived from it would be **false on
the high side**: what was a measurement defect would be attributed to execution capacity.

**What the register is not.** It is not a measure of productivity and must not be read as one. It
does not authorise promising more: capacity remains the one declared by `D54`, and the lead
gained is **margin against risk**, not scope to be filled - it is the same rule of §10, seen from
the side where things go well instead of the side where they go badly.

The register is guarded by
[`scripts/verifica-registro-di-velocity.sh`](https://github.com/fedcal/Telemedic/blob/main/scripts/verifica-registro-di-velocity.sh),
which verifies five properties: the form, the presence of the reason on every recalibration and
every closure, the prohibition of events following a closure, coverage of every dated milestone,
and agreement between the last event and the date declared by the milestone's record. What it
**does not** verify is addition-only status, which is a property of the history and not of the
file: it is seen by comparing preceding rows between two revisions, not by reading the current
state.

---

## 11. The declared capacity

`D54` closes [`Q-181`](../11_registri/02-questioni-aperte.md#q-181). Capacity **is no longer an assumption**: it is the datum on which every allocation
is built.

> **Capacity of the project: a single contributor, working part-time.**
> The three assumptions `H1`, `H2` and `H3` that this paragraph contained are **defunct**. The reference plan of chapter
> [02](./02-traguardi.md) is no longer built on `H2`: it is built on this datum.

### 11.1 What it entails, item by item

| Area | Consequence under `D54` |
|---|---|
| **Class `A` activities** (unrecoverable) | **Are done anyway and first.** Small capacity does not defer them: makes them more urgent, because the cost of omitting them is not paid in delay but in impossibility |
| **Class `B` activities** (duration determined by third parties) | **Are started immediately**, because they cost few hours and many months. It is the only block that `D54` does not penalise. They include entirely the activities of `D58` (§5.2) |
| **Class `C` activities** (unblocking) | Reduced to the subset needed for the actual perimeter of the first release. An empirical verification on a function that is cut **is itself a function that is cut** |
| **Class `D` activities** (compressible) | All the scope reduction comes from here. The order is declared in [03 §6](./03-primo-rilascio-utilizzabile.md) |
| **Specialist competences** - usability, security research, clinical writing, translation | **Not present internally.** Each is either acquired externally, or declared as a gap. There is no third option, and in particular there is not the one of supplying it with more hours |
| **Records in distinct roles** | **Not producible**, for §9-bis. [`Q-189`](../11_registri/02-questioni-aperte.md#q-189) |

### 11.2 The difference between this formulation and the previous one

It must be said because it is the reason why chapter [02](./02-traguardi.md) has been remade and not
corrected.

The previous version produced dates **under assumptions**, and left to the reader the recalculation. It
was the right choice while capacity was unknown: declaring an unknown is better than hiding it.
Now capacity is known and that form would become an excuse. **With all quantities known, a
plan that does not close on precise scope is not prudent: it is vague.**

Chapter [02](./02-traguardi.md) therefore closes on precise scope, and chapter
[03](./03-primo-rilascio-utilizzabile.md) declares what was removed to get there.

---

## 12. What "done" means

The definition applies to every milestone in the roadmap and to every entry that enters it in the future.

A milestone is **done** when:

1. **all** its completion criteria are satisfied - not the majority, not the most
   important;
2. each criterion is **verifiable by a third party** who did not participate in the work, with a
   procedure described in the milestone itself;
3. the artefacts that the milestone produces are **published** where the milestone declares they
   will be, and not on somebody's machine;
4. the **declared gaps** that the milestone leaves open are listed, each with the
   recipient and the closure trigger;
5. the constraints in force have not been violated, and if they have been **the violation is
   declared** on the noticeboard and not silenced.

A milestone that satisfies criteria 1–4 and not 5 is not done: it is a problem that will manifest in
another area.

### 12.1 Criterion 2 under `D54`, and how to read it

Criterion 2 requires that each criterion be **verifiable** by a third party. Under `D54` it must
be distinguished with precision from what it **does not** require, because confusion between the two
things produces either an impossible plan or an accommodating plan.

| Criterion 2 requires | Criterion 2 **does not** require |
|---|---|
| That the criterion be formulated so that **anyone** can ascertain it with the procedure described - by running a command, reading a published artefact, deliberately triggering a failure | That the ascertainment be **executed** by a person different from whoever did the work |

The first property is **producible** with a single contributor and is not negotiable: it is what
makes the roadmap controllable from outside, and a criterion that does not satisfy it must be reformulated.
The second **is not producible** (§9-bis) and does not enter the completion criteria: where a
source requires it - release review, internal audit, configuration verification by someone other than the code author -
the roadmap **does not pretend to satisfy it**. It declares it as a gap,
marks it as **irreversible** in [03 §5](./03-primo-rilascio-utilizzabile.md), and defers its allocation to
[`Q-189`](../11_registri/02-questioni-aperte.md#q-189).

It is the distinction that permits saying precisely what `RU-1` is: a release whose
criteria are **all verifiable by anyone**, and on which **no verification has been executed
by a second subject**. The two statements are compatible, both true, and both must
be written.

---

## 13. The editorial rules that this area imposes on itself

They are seven and are verifiable on the text.

1. **Every milestone has verifiable completion criteria.** A milestone without a criterion is a
   wish, and does not enter. It is constraint [`V-181`](../11_registri/01-vincoli-in-vigore.md#v-181).
2. **What does not enter is declared, and why.** Chapter [03](./03-primo-rilascio-utilizzabile.md)
   dedicates to exclusions at least the space it dedicates to inclusions, because for whoever must
   decide whether to adopt the product the two pieces of information have the same value.
3. **No invented estimates.** Where a time is not estimable with available information, the
   document declares this and explains what it depends on. An invented figure in a roadmap
   is cited as a datum within two weeks.
4. **The project's obligation is distinguished from that of whoever installs**, line by line, and not
   with a general warning at the bottom.
5. **Synthetic data only, no real data, no secret** (`R0`). No clinical threshold.
   The system stays fully functional without terminologies with binding licences ([`V-02`](../11_registri/01-vincoli-in-vigore.md#v-02),
   [`V-03`](../11_registri/01-vincoli-in-vigore.md#v-03)), and the roadmap plans nothing that contradicts it.
6. **The roadmap is internal project planning** (`D57`). No milestone is attributed to
   "third parties", to "those who certify" or to an undefined subject. Where a step formally presupposes the
   role of manufacturer, the document states that **that role must be established and formalised**
   (`D58`, [`Q-280`](../11_registri/02-questioni-aperte.md#q-280)), with its own time, instead of shifting the step to someone else.
7. **An internal planning date is not a promise of outcome** ([`V-171`](../11_registri/01-vincoli-in-vigore.md#v-171), [`V-280`](../11_registri/01-vincoli-in-vigore.md#v-280)). At no point in this area
   is it written that the product **will be marked by a date**; at every point where marking is mentioned it
   is declared: **today the product does not bear the CE marking**, is not covered by any declaration of
   conformity, and whoever instals, integrates or places the software in service assumes the obligations
   that follow.

Rules 6 and 7 must be read together, because separate they produce opposite errors. 6 without
7 transforms an intention into a dated commitment towards the market, which is precisely the regulatory effect
that is not wanted. 7 without 6 brings planning back to an undefined third party and makes activities that are
ours and have long traversal times disappear from the calendar.

---

**Continues in**: [02 - Milestones](./02-traguardi.md), where these criteria become a
dated sequence with binary criteria, a trigger and an owner for each milestone.
