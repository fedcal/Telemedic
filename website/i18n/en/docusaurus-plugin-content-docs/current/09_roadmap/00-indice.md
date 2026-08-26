---
title: "Roadmap - index and orientation"
sidebar_position: 1
description: "How to read the Telemedic roadmap, what in it is commitment and what is intention, the state of affairs as of 25 August 2026, the four decisions that have determined its form and the procedure by which this plan is updated."
---

# Roadmap - index and orientation

> **A roadmap that promises everything serves no one.**
> The value of this document lies not in the list of things that will be done: it lies in the precision
> with which it distinguishes what is **committed** from what is **intended**, and in the clarity with which
> it declares **what remains outside and why**. A plan that excludes nothing is not a plan: it is a
> wish with a table around it.

## 1. What this area is and what it is not

This area answers **when what happens**, and nothing else. It does not describe how the system is
constructed - that is [`docs/02_architecture/`](../02_architecture/00-indice.md) - nor how it is
realised - [`docs/01_technical/`](../01_technical/00-indice.md) - nor what it does -
[`docs/03_functional/`](../03_functional/00-indice.md). It contains no requirements, no
architectural decisions, no regulatory analysis.

It contains instead five things that no other area can contain without duplicating itself:

1. **The method by which we decide what enters and what leaves**, declared before decisions and
   not after ([01 - Principles and method](./01-principi-e-metodo.md)).
2. **Milestones dated with binary completion criteria**, each with trigger, owner,
   dependencies and risks ([02 - Milestones](./02-traguardi.md)).
3. **The exact scope of the first releasable deliverable**, and - central section of this area -
   **what was cut to respect the date**, with indication of which cuts are irreversible
   ([03 - First usable release](./03-primo-rilascio-utilizzabile.md)).
4. **The backlog of what comes after**, distinguishing the planned from the desirable
   ([04 - Beyond the first release](./04-oltre-il-primo-rilascio.md)).
5. **The programme risk register** - not clinical: those belong to the compliance area - with
   probability, impact on schedule, leading indicator, response and owner
   ([05 - Risks and dependencies](./05-rischi-e-dipendenze.md)).

## 2. The three classes of statement, and why the distinction is binding

Every entry in this roadmap belongs to one of three classes that follow. The class **is not a shade
of language**: it determines what the project can declare to an integrator, in a reply to a tender,
in release notes or on a public page.

| Class | Marker | Meaning | What it authorises to say |
|---|---|---|---|
| **Commitment** | `[COMMITMENT]` | The project undertakes the item, has control of it, and the item has a verifiable completion criterion | "The project delivers X, and X is done when criterion Y holds" |
| **Intention** | `[INTENTION]` | The project intends to do it, the priority order is motivated, but the date depends on a variable not yet determined | "It is planned, in this position in the queue, and the date depends on Z" |
| **Conditional** | `[CONDITIONAL]` | Statement conditioned on an event that the project does not control | "If Z occurs, then X; today Z has not occurred" |

To these three is added a fourth category, which is not a class of statement but a **scope exclusion**: what the project has decided not to do. Definitive exclusions do not live here: they live in
[`docs/03_functional/07-fuori-perimetro.md`](../03_functional/07-fuori-perimetro.md) with
identifier `OUT-nn` and reopenability category. This area refers to them and does not rewrite them,
because an exclusion written in two places diverges in two different places.

**Editorial rule that follows, and applies beyond this area** (constraint `V-184`): no material
of the project - documentation, website, tender reply, release notes, public communication - may
present an entry `[INTENTION]` or `[CONDITIONAL]` as if it were `[COMMITMENT]`. It is the most common
form of reputational damage in a technical project, and it is committed in good faith.

## 3. Who commits, and what `D57`, `D58` and `D63` have changed

### 3.1 The roadmap is internal planning

`D57` establishes that **the owner of planning is the project**. No milestone in this area
is attributed to "third parties", to "those who certify" or to an undefined subject. `D58` adds that **the role of
manufacturer will be assumed by the project** and that the legal entity **must be established**: it is an internal
prerequisite with its own time, and it is on the calendar as milestone `T-14`.

`D63` goes beyond attribution. It establishes that **the system must become fit for the provision
of services to real users**: it changes nothing of what the product is today, but it changes the
status of the objective, from intention to **product requirement**. With it changes the nature of
one of the limits recorded below, which ceases to be permanent and becomes time-limited.

The three decisions have changed **the attribution of planning** and, with `D63`, **the status of
the objective**. They have changed nothing of the factual state of the product, and the table that
follows exists because the two things must not be confused.

| What is true today | What `D57`, `D58` and `D63` change |
|---|---|
| **The product does not bear the CE marking** and is not covered by any declaration of conformity | Nothing |
| **No distributed artefact is usable for the provision of healthcare services to real patients** (`D16`) - and it is the only row in this column that **does not remain true for ever** | `D63` turns it into a **time-limited** constraint: it falls when the conformity assessment is complete and the marking is affixed, not before and not by unilateral decision of the project. **When** that happens is not declarable in any material (`V-171`, `V-280`) |
| **Whoever instals, integrates or places in service assumes the obligations that follow** | Nothing. The intention to certify in the future **transfers no obligation and covers no present installation** |
| **The responsibility to the injured party is not excludable by contract** | It applies with more force, not with less |
| The conformity pathway was attributed to an undefined external subject | It is **ours**, with dates of **internal planning** in [02 §5](./02-traguardi.md) |

> **The insurmountable limit, placed as constraint `V-280`.** An internal planning date **is not a
> promise of outcome**. **In no place in this area, and in no material of the project, is it written that
> the product will be marked by a date** (`V-171`). The intention to certify and the promise of a
> dated outcome are different things, and the second produces a regulatory effect that the first does not.

### 3.2 What remains of another subject

`V-280` reformulates `V-180` and preserves its core: dates remain undeclarable that **the regulation places
on a different subject**. There are two, and they are the only ones:

- **The deadline by which a user must have adopted the national security measures**, which is
  subject-specific and runs from receipt of the insertion notification received by each subject (`D39`). The
  product declares **the evidence and the date of availability of each**, never the deadline (`V-186`).
- **Accreditation as a service provider** to the national identity federation, which is of
  those who install (`D36`, `V-05`, `OUT-22`) and whose times **are not declared by any primary source**.

The line-by-line breakdown of security measures is in
[`docs/06_security/09-ripartizione-delle-responsabilita.md`](../06_security/09-ripartizione-delle-responsabilita.md);
this area applies the logic to **time**, and applies it line by line in
[03 §11](./03-primo-rilascio-utilizzabile.md).

## 4. The state of affairs as of 26 August 2026

A plan that does not start from a verifiable picture of the situation is an exercise in rhetoric.
This is the picture, and every line is verifiable by opening the repository.

| Area | State ascertained as of 26 August 2026 |
|---|---|
| **Mandatory public declarations** (`D51`) | **Present**: declaration of non-medical device, distribution policy, licence, notice, contribution guide, governance, security policy, code of conduct. **To be realigned to `D58`** without attenuating any warning: it is criterion 8 of `T-01` |
| **Foundations guide** (`D35`, twenty-one modules) | **Complete**: twenty-one modules, `00`–`20`, glossary and primary sources included |
| **Technical area** | **Complete** |
| **Architectural area** | **Complete** |
| **Functional area** | **Complete** |
| **Protocols area** | **Complete** |
| **Domain area** | **Complete** |
| **Security area** | **Complete** |
| **Integration area** | **Complete** |
| **Overview** (`docs/00_overview/`) | **Written** |
| **Compliance** (`docs/08_compliance/`) | **Written**: ten files. Remains the area towards which the greatest number of pending questions converge, and `D58` adds the rewriting of chapters built around the figure of the third party |
| **Roadmap** (`docs/09_roadmap/`) | This area, **reworked** after `D53`…`D58` |
| **Register of architectural decisions** | **Thirty entries** plus index |
| **Documentation website** (`D7`, `D52`) | **Built and published** on GitHub Pages, in Italian and in English |
| **English version of content** (`D3`, `D50`) | **Four areas complete out of twelve**: foundations guide, protocols, security, compliance. **439,982 words out of 860,718**, 51% of the corpus in `docs/`. The divergence check is in operation and reports **"Missing and required: 0"** |
| **Automatic verification flows** | **Present**: terminology under licence, editorial conformity, secret scanning, bill of materials of the website |
| **Application code** | **Absent.** No source file for the service or interface |
| **Build chain for the code** | **Absent**, because the code does not exist. It is milestone `T-03`, and `V-182` requires that it precede the first line |

Three readings of this table, and they determine everything else in the roadmap.

**The first.** The project has, as of 25 August 2026, **a substantially complete documentary body, a
published website, four verification flows in operation - and no line of application software.** The
distance between what is documented and what is built is the magnitude from which the plan starts.

**The second.** The corpus is **875,748 words**: 860,718 in `docs/`, distributed across twelve areas and
one hundred and forty-four files, plus 15,030 in the nine documents at the root of the repository. The count was
**executed on 26 August 2026** and closes the `[NV]` that this area carried, together with criterion
5 of `T-02`. The area `10_fondamenti` (foundations guide) alone weighs 397,315 words, 46% of the total.

**The third, and it is the one that has remade this area.** With `D53` the date of **30 November 2026** remains the
**first releasable deliverable**, and with `D54` the capacity is **a single contributor working part-time**.
Date and capacity are fixed: **the only free variable is scope**. Section §5 says where this
consequence is written.

## 5. The four decisions that have determined this revision

| # | Decision | What has changed in this area |
|---|---|---|
| **`D53`** | The **30 November 2026 remains the first releasable deliverable**. Closes `Q-180` | Milestone `T-10` is dated and `[COMMITMENT]`; the scope of [03](./03-primo-rilascio-utilizzabile.md) is **reduced**, and §5 of that chapter declares what has been cut |
| **`D54`** | Capacity: **single contributor, working part-time**. Closes `Q-181` | Assumptions `H1`/`H2`/`H3` are defunct; risk `R-01` is **closed** and replaced by `R-28`; four cuts are **irreversible** because they require distinct subjects |
| **`D55`** | Intended use of telemonitoraggio (telemonitoring) frozen on **deferred collection**. Closes `Q-144` | telemonitoraggio is no longer work at risk of rewriting; remains outside `RU-1` for scope. A **permanent prohibition** follows: no function can move the system towards clinical real-time |
| **`D56`** | Translation **assisted, area by area**, with divergence check. **Amends `D52`.** Closes `Q-182` | Full translation is no longer a prerequisite of every line of code: `T-06` covers only the prerequisite areas, the rest is `T-09`. Risk `R-03` drops from `I4` to `I3` |

To these are added, in the same round, `D57` - planning is internal - and `D58` - the role
of manufacturer will be assumed by the project, with the subject still to be established. Their effect is in §3.

### 5.1 The fourth round, of 26 August 2026

Four decisions taken after full translation of the foundations guide and the compliance area. Three arise from
**contradictions between already published documents**, found because translation
is the most severe review a text receives.

| # | Decision | What changes in this area |
|---|---|---|
| **`D59`** | Between the didactic guide and the specification area **the specification prevails** | No effect on dates. Closes five divergences of contract towards integrators, including the webhook retry policy, which shifts from "up to 24 hours" to **twelve retries and approximately seventy-two hours** (`P-08`) |
| **`D60`** | Signature of outgoing events is **asymmetric by default** | Confirms `V-162` and row `S-6` of the sacrifice order. `04_protocols/07` was the only document out of line with three already published areas |
| **`D61`** | The bounded contexts are **thirteen**: the terminological gateway is a context | Aligns the three source trees to `16 §4.2-4.3` and to `ADR 0016`. No effect on dates |
| **`D62`** | **Capacity quantified: ten to twenty hours per week.** Amends `D54` | **Trigger for out-of-cycle review** on all internal dates and on scope, according to §8.2. Closes the `[NV]` that `01 §4.1` indicated as the reason why the project does not produce estimates |

**The decisions are taken and this area does not reopen them.** It exposes the consequences, which is something different and
more useful.

## 6. The six documents

| # | Document | What it resolves | Who must read it |
|---|---|---|---|
| 00 | This | Orientation, classes of statement, state of affairs, decisions, update procedure | Everyone, before everything else |
| 01 | [Principles and method](./01-principi-e-metodo.md) | How we decide what enters: priority criteria in lexicographic order, retroactively unrecoverable activities, **what a single person cannot do**, technical debt and **regulatory debt**, the capacity declared | Who proposes a function, who contests a priority, who must say no |
| 02 | [Milestones](./02-traguardi.md) | Dated milestones until 30 November 2026 with binary criteria, trigger and owner; internal planning beyond the date; irreversible decision points | Client, contributors, whoever evaluates progress |
| 03 | [First usable release](./03-primo-rilascio-utilizzabile.md) | What the first release contains, **what was cut to respect the date and which cuts are irreversible**, the order in which we would cut again, presuppositions, limits, blocking criteria | Who instals, who integrates, who evaluates the product |
| 04 | [Beyond the first release](./04-oltre-il-primo-rilascio.md) | What comes after, in order of motivated priority, distinguishing planned and desirable | Integrators, client, whoever plans multi-year adoption |
| 05 | [Risks and dependencies](./05-rischi-e-dipendenze.md) | Programme risk register with leading indicator and owner; external dependencies, including the one that has no degraded mode | Client, whoever conducts the review |

## 7. Reading paths

**If you are the client and must decide.** [01 §11](./01-principi-e-metodo.md) on the capacity
declared and §9-bis on what a single person cannot do, then
[03 §5.3](./03-primo-rilascio-utilizzabile.md) on the four irreversible cuts, then
[02 §6](./02-traguardi.md) on decision points, then [05 §2.1](./05-rischi-e-dipendenze.md) on `R-28`
and `R-29`. The questions that require an explicit decision from you are `Q-185`, `Q-186`, `Q-187`,
`Q-188`, `Q-189`, `Q-280` and `Q-281`, listed in §10. **The two most urgent are `Q-280`, on 19 September
2026, and `Q-189`, on 30 September 2026**: the first because it is class `B` and the delay cannot be recovered
by working harder; the second because its default outcome is a gap that remains dated forever.

**If you must contribute code.** [01](./01-principi-e-metodo.md) in its entirety - in particular §§ 5 and
8, which explain why some apparently bureaucratic activities precede the first line of software -
then [02 §3](./02-traguardi.md) and [03 §8](./03-primo-rilascio-utilizzabile.md), which contains the
blocking criteria for release. Then [03 §6](./03-primo-rilascio-utilizzabile.md): the sacrifice order is what
you execute when the schedule does not hold, and must be known before finding yourself having to execute it.

**If you must decide whether to adopt the product.** [03 §1](./03-primo-rilascio-utilizzabile.md) on the limit that
no configuration removes, then **[03 §5](./03-primo-rilascio-utilizzabile.md) in its entirety**, then
[03 §7](./03-primo-rilascio-utilizzabile.md) on presuppositions and [03 §9](./03-primo-rilascio-utilizzabile.md)
on declared limits, then [04 §§1–3](./04-oltre-il-primo-rilascio.md). **§5 is not an appendix: it is the
part that tells you what the product will never be able to demonstrate about its first period**, and it is
information that no feature list contains.

**If you must reply to a specification or evaluate an offer.** [00 §§2–3](./00-indice.md) of this
document, to avoid attributing to the supplier commitments it has not undertaken, then
[03 §11](./03-primo-rilascio-utilizzabile.md) and the allocation of responsibility in
[`docs/06_security/09-ripartizione-delle-responsabilita.md`](../06_security/09-ripartizione-delle-responsabilita.md).
**Pay attention to the marking row**: that the project intends to assume the role of manufacturer does not
authorise any statement about a dated outcome.

## 8. How this roadmap is updated

A roadmap that has no update procedure becomes, in a few weeks, a document that everyone cites and no one believes.

### 8.1 Ordinary cycle, and the extraordinary cycle that `D53` imposes

**Monthly review**, with outcome recorded even when the outcome is "no change". The review
produces, for each open milestone: state of completion criteria (satisfied / not satisfied,
never a percentage), variations in dependencies, variations in the risk register, and - if something does not hold -
**the cause**, not just the consequence.

**From 19 October 2026 the review is weekly**, with content reduced to two figures: **remaining rows
of the sacrifice order** from [03 §6.2](./03-primo-rilascio-utilizzabile.md) and **blocking criteria of
`RU-1` satisfied**. It is the countermeasure of risk `R-28`: on a plan with no time margin, a
monthly review observes the phenomenon when it is over.

### 8.2 Out-of-cycle reviews

They are mandatory, not optional, and each has a precise trigger.

| Trigger | What is reviewed |
|---|---|
| Closure or reopening of a client decision | The entire roadmap, because the decisions are its base |
| **Consumption of a row of the sacrifice order** | `R-28`, the affected milestone and the declared scope of `RU-1`. **The consumed row is recorded with date and cause**: an unrecorded reduction is an undecided cut |
| A risk in the register that materialises | The affected milestone, its successors, and the planned response |
| Variation of the capacity declared (`D54`) | All internal dates and scope, with the rule of [01 §10](./01-principi-e-metodo.md) |
| **Entry of a continuous contributor** | The capacity, and with it risks `R-02` and `R-29`: a second contributor is both continuity and a second subject |
| Change of intended use (`D46`, `D55`) | The scope of the first release and all linked exclusions |
| Publication of a new version of a fixed specification | The corresponding entry and its placement amongst the milestones |
| Crossing an irreversible decision point without decision | The reference scenario, which defaults automatically |

### 8.3 What is never done

- **A date is never moved without moving the criterion or the cause.** With `D53` and `D54` the date
  is not moved at all: scope is reduced, or **it is declared that the date has been missed** (`V-282`).
- **Scope is never reduced without recording it.** A silent reduction causes the choice to lose the only
  property that `D53` requires it to guarantee: being readable.
- **No milestone is added without a completion criterion.** It is constraint `V-181`.
- **No activity requiring two subjects is planned when the second does not exist.** It is constraint
  `V-281`: it is declared as a gap, with the date on which it is born.
- **It is never stated "completed to ninety per cent".** The criterion is binary by construction. A
  milestone with ten criteria and nine satisfied is an unachieved milestone, and the report says which
  criterion is missing.
- **History is never rewritten.** A missed date remains in the chronology with its cause: it is the only basis
  on which the next estimate can be better than the previous one.

### 8.4 Review register

**26 August 2026 - out-of-cycle review.** Triggers, from the table in §8.2: *closure of
client decisions* (`D59`…`D62`) and *variation of the declared capacity* (`D62`, which
amends `D54`). The first requires reviewing the entire roadmap, the second all internal dates and
scope.

**State of open milestones**, in binary form as §8.3 prescribes.

| Milestone | Criteria satisfied | Criteria not satisfied |
|---|---|---|
| `T-01` (12 Sep) | 6 - public declarations are present without interruption. **8** - public warnings are aligned to `D58` in both languages (see the correction below) | 1, 2, 3, 4, 5, 7 |
| `T-03` (26 Sep) | 3 - divergence check exists with differentiated and declared behaviour | 1, 2, 4, 5, 6, 7, 8 |
| `T-06` (21 Nov) | 2 and 3 - the check blocks on prerequisite areas and produces no findings; reports on the rest. 4 - Italian regulatory references remain in original form with explanation in English, verified by sample. **1** - foundations guide, compliance and security are complete, and public warnings exist in English in bilingual files (see the correction below) | 5, 6 **in part** - the alignment procedure is written but not yet versioned as a controlled document |
| `T-08` (14 Nov) | none: `V-182` forbids application code before `T-03` | all |
| `T-10` (30 Nov) | none | all |

**Correction of 26 August 2026, same day.** The two rows above stated as unsatisfied
criterion 8 of `T-01` and in part criterion 1 of `T-06`, with the reason that "public warnings do not exist in English". **The reason was false, and the error was methodological.** Public warnings -
declaration of non-medical device, distribution policy,
highlighting of the presentation document - are **bilingual in a single file**: Italian block, separator, English block, with a "**English version below**" reference at the top. The same
convention applies to `CONTRIBUTING.md`. The English blocks were already aligned to `D58` and say
"That entity **does not exist today**, no date is stated".

The error arose from the divergence check, which had been extended to public warnings
assuming separate `.en.md` files - a convention that the repository does not use. The check was looking for
non-existent files and concluded that English was missing. It has been corrected: it now verifies the English block
**within** the bilingual file, and searches it for the two warnings that cannot be missing -
no marking, no declaration of conformity - whatever the words around them. The
correction has been tested in reverse, deliberately degrading the English text, and the
check detects it.

**The lesson, which applies beyond this case**: a check calibrated on the wrong convention does not
stay silent, it *makes false statements* - and it does so with the authority of an automated check, which is
worse than having none. Before extending a check to a new class of documents, the convention that
those documents actually follow must be verified on the repository.

**26 August 2026 - closure of `S-8`, with the ordinary procedure.** The client has decided that the
verifiable vertical path of `RU-1` reduces to a single service: the **remote consultation (televisita) (scheduled video visit) with
two participants**. The cut is **reversible**: specialist-to-specialist consultation (teleconsulto) and remote monitoring
remain entirely designed in the domain model and in functional requirements, and their
implementation is deferred. The cut **affects criterion 6 of `T-08`** - the complete vertical path - and
**does not affect criterion 4** - the immutable register - which remains intact by construction (`01 §7.3`):
coverage is not reducible. The decision is recorded in the sacrifice order of [03 §6.2](./03-primo-rilascio-utilizzabile.md) as entry `S-8`.

**Arithmetic after `S-8`.** With `D62` (ten to twenty hours per week) and a window of forty-nine
days between `T-03` (26 September) and `T-08` (14 November), the scope is not yet reducible without
affecting the blocking release criteria. The sacrifice order, executed in its entirety, acquires
sufficient volume - the reversible cuts (`S-1`…`S-8`) absorb a thickness of work - but the
margin remains **absent**. The date of 30 November 2026 is protected only by the declared scope, not
by time reserves. If in the week of 19 October 2026 any one of the nine milestones of
class `A`, `B` and `C` of chapter [02 §3](./02-traguardi.md) is not closed, the date will become
untenable without further reductions that are reversible.

**26 August 2026 - progress on `T-01`, recorded as executed work.** It is not a review
of the roadmap: it is the recording of what the criteria of `T-01` now have behind them. `V-182`
forbids application code before `T-03`, and criteria 5 and 7 are pipeline checks that
`T-01` places **deliberately before** that pipeline: they are the first two checks it will receive.

| Criterion | State | What exists |
|---|---|---|
| 1 | **In part** | `docs/08_compliance/10-controllo-dei-documenti.md`, with all five required entries. **Approval remains the gap of `Q-189`**: under `D54` author and approver coincide, and the criterion asks for an *approved* procedure |
| 2 | **Satisfied** | The procedure declares how the correspondence between review, reviewer and approval constitutes the approval record, lists the four tools in view of their validation, and declares the author/approver coincidence as a **gap and not as conformity** |
| 3 | **Satisfied** | `registro/identificativi-requisiti.tsv`: **614 identifiers** across eight families, journal in **addition only**, state as a projection of events, explicit reuse prohibition and verified by check |
| 4 | **Satisfied** | TSV with five columns with format declared in `registro/README.md`, which also documents the **grammar of each family** - it is not uniform, and it is what has already produced a defect |
| 5 | **Satisfied** | `scripts/verifica-identificativi-requisiti.sh`, tested with malformed register, missing identifier, retired identifier and **reuse after retirement**. Corrected to empty set, as it should be while `V-182` forbids code |
| 6 | **Satisfied** | Already as of 25 August |
| 7 | **Satisfied** | `scripts/verifica-dichiarazione-non-marcatura.sh`, tested on artefact deliberately lacking it. Founded on **structural elements** - file name in link, class of block in evidence - and not on a phrase, which a reformulation would change |
| 8 | **Satisfied** | See the correction above: it already was |

**The test bench, and why it matters more than the checks.** `scripts/prove/` executes **22 cases**, and every
case "must fail" makes the test fail if the check passes. The bench has been subjected to
**mutation testing**: by making a check deliberately always-green, the bench went from
17 compliant cases out of 17 to 11 out of 17. A bench that does not notice a disabled check is
theatre, and this one does.

**Two new checks enter `verifiche.yml`**, `identificativi-requisiti` and
`dichiarazione-non-marcatura`, **neither of them in report-only mode**: they can fail
the build, which is the point of `T-01`.

**What the work has opened, and not closed.** The document control procedure prescribes two
checks, and as of 26 August 2026 the state of the two differs. Protection of the **main branch**
is **implemented** from that day: a proposal that has not received at least one favourable review
cannot be merged, and five status checks are required. It does not, however, apply to repository
administrators (`enforce_admins` is `false`), so the owner retains the ability to merge their own
work after approving it themselves: that is the gap of `Q-189`, which the implementation does not
close. **Cryptographic signing of commits** remains unimplemented: as of 26 August 2026 none of
the 36 commits in the history carries a valid signature, and the `commit.gpgsign` setting is
enabled but has never produced one. They remain recorded as `Q-283` (closed) and `Q-284` (open).

On `Signed-off-by` (DCO), a statement this very chapter carried for days must be corrected. **It
was not active**: `CONTRIBUTING.md` §147 prescribes it for every commit, but of the 36 commits in
the history **only 5 carry it**, all dated 26 August 2026 and all subsequent to the measurement.
It was a rule written and not observed by whoever wrote it, and it is exactly the form of defect
the project records elsewhere as «a rule written and not enforced by a check is not a rule». No
check verifies it today.

As long as commit signing remains unimplemented, the approval record **does not have the complete
form that the procedure describes**, and must be read for what it is: the trace of what was done
and by whom, not cryptographic proof that it could not have been done otherwise.

**A defect found by the newly written check.** The expression that recognised identifiers was
`\b(RF|RNF|BR|ATT|UC|OUT|EX|DM)-[0-9]+\b`, and the family `EX-*` **has no numeric grammar**: its
identifiers are descriptive (`EX-TM-ESCFAIL`). The check was blind to thirty identifiers - and precisely those of
**outcome**, which is what a test cites most. Corrected with two grammars recognised
separately, and tested that the generic prefix `EX-TM-*` is not mistaken for an identifier.

**What has advanced.** Translation has closed the foundations guide entirely - twenty-one
modules - and the compliance area. Four areas out of twelve are complete, 51% of the corpus in
words. The exact count of the corpus has been executed: **875,748 words**, which closes criterion
5 of `T-02` and the `[NV]` of §4.

**What does not hold, and the cause.** With capacity now quantified by `D62`, the window for
application code is **forty-nine days** - `V-182` forbids every line before `T-03` - which is
approximately **seventy to one hundred and forty hours**. In that window `T-08` carries
**two criteria that the project itself rates as "months"**: criterion 4, the immutable register, which
`T-08` defers to `R-20` and qualifies as "the single most labour-intensive element of the catalogue"; and
criterion 6, the complete vertical path. **The arithmetic does not close.** The cause is not a wrong
estimate - there are no estimates - but the fact that scope has not been reduced in proportion to the capacity
that `D53` and `D54` had already fixed.

**What follows, and is not yet decided.** The sacrifice order of §6.2 of
[03](./03-primo-rilascio-utilizzabile.md) cuts surface - export of metrics, waiting room, day list, typification of
telephone fallback - and **does not touch either criterion 4 or criterion 6 of `T-08`**, which are protected by
construction: register coverage is not reducible ([01 §7.3](./01-principi-e-metodo.md)) and the
vertical path *is* the release. Executing the order in its entirety therefore buys little against the real constraint.

**The evaluation of a further reversible cut is open**, to be added to the order as
`S-8`, with the **ordinary procedure and before calendar pressure arrives** - because the
rule 2 of §6.1 of [03](./03-primo-rilascio-utilizzabile.md) forbids deciding a cut under pressure. The evaluation is open on
26 August 2026 and **is not closed by this review**.

**Risk register.** No change in level. `R-28` - close date with low declared capacity - remains the
dominant risk, and this review is its first measurement with quantified rather than `[NV]`
capacity.

**The `continue-on-error` has fallen, and with it the second of two corrections.** The two residual translation divergences were Italian typos, and English already said the right thing; once those were closed, the premise for tolerance disappeared and the `divergenza-traduzioni` job is **blocking**. Criterion 3 of `T-03`, which this register had declared satisfied and then corrected as not satisfied, is now truly satisfied: the check exists, blocks, and has been seen to fail.

**The doctrine of "touch" has been replaced by a falsifiable declaration.** When Italian changes for a typo and English is already correct, the written rule required anyway touching the translated file to realign dates - that is, producing a change empty of content just to silence a check. In its place the English file now carries `<!--TRAD-VERIFICATA: <revision>-->`: it holds **only** if the named revision already contains the last modification of the original, which is verified with `git merge-base --is-ancestor`, and **expires on its own** at the next modification. Whoever writes it declares to have read both texts, and is traceable. The check now reports `Aligned: 145 · Divergent: 0 · Missing and required: 0 · Orphans: 0`.

**The checks declare where they stand, with what force and with what proof.** `pipeline/collocazione-dei-controlli.tsv` is the new table: for each check, the band, whether it blocks or reports, from which date it will become blocking, the roadmap criterion it guards, the job that executes it, the test bench case that has seen it fail and the reason for the placement. `scripts/verifica-collocazione-dei-controlli.sh` watches it, and is itself a row of the table: **a check exempt from the rule it enforces is the purest form of a check that lies.** The watcher brought to light a debt that no one had counted, because no one had ever measured it: **four pipeline checks out of seven had no negative proof** - `G1`, `G3`, `G5` and the editorial. None had ever been seen to fail.

**The test bench went from twenty-seven cases to forty-five, and the debt from eight errors to two.** Every new case was tested by mutation, one fault isolated at a time: with the rule broken, only the corresponding case goes from ✓ to ✗; restored, it returns to passing, with identical SHA-256 fingerprint before and after. The `TRAD-VERIFICATA` mechanism has five cases on an ephemeral git repository with explicit commit dates; the table's watcher has six, among which a **targeted regression to the tab-reading defect** - and that regression revealed a fact that the analysis had not foreseen: the defect affected **every real blocking row**, not just pathological cases, because a blocking row has by construction an empty date field.

**The two residual errors are not carelessness, and are not closed by writing a case.** `G1` lives as a third-party GitHub action and not as a local script: imitating it in the bench would prove the imitation, not the check. `G5` generates the bill of materials and **asserts nothing**, so there is today no behaviour that can fail - a test here presupposes criterion 5 of `T-03`, not the reverse. The choice between making `gitleaks` executable locally, admitting in the format a declared non-testable state, or leaving the gate red, is posed as `Q-288`.

**And one row of the table stated false.** `T01-C8` numbered the prohibited conformity formulas of [04 §10.2](../04_protocols/10-conformita-e-prove.md) among what the editorial check guards. **The script does not search for them, and no other check in the repository does**: it implements three different ones - unquoted frontmatter, relative links outside `docs/`, secret placeholders. The row was corrected to tell the truth; the debt remains entire and is posed as `Q-289`. It is the third occurrence in one day of the same fact: a written rule not guarded by a check is not a rule - and when someone notes that a check guards it without verifying, it becomes worse than a rule without a check, because it stops being searched for.

**A finding that touches the first non-negotiable rule.** The new check on non-synthetic data - `scripts/verifica-dati-sintetici.sh`, `L-08` - finds on the main branch **thirty-seven tax codes with a valid check digit**: `RSSMRA80A01H501·` (sixteenth character masked) thirty-six times and `TSTPSN80A01D612·` once, verified in person against the tables of DM 23 December 1976. They are not data of known real persons, but **they are not even recognisable as fake**, and it is precisely what §6.1 of the `T-03` plan forbids: a synthetic form must be *non-valid by construction*. The correct convention already exists in the corpus - `VRDLGU75E41D612B` and `AAABBB00A00A000A` have the check character deliberately wrong - and has not been applied everywhere. The correction is one character per occurrence, in both languages in the same act.

The upstream gap weighs more than the finding: rule 1 of [`CONTRIBUTING.md`](https://github.com/fedcal/Telemedic/blob/main/CONTRIBUTING.md) refers to "project synthetic data generators" that **do not exist**, and does not say what matters - check digit deliberately wrong, reserved domain, repeated digits. It is the fourth occurrence in one day of the same form: the rule existed, the guard did not.

**The finding on synthetic data is closed on the same day.** Thirty-seven tax codes corrected, the sixteenth character made deliberately wrong, **in both languages in the same act**; two example domains moved to `.invalid`; five contact details declared with the admission marker instead of removed, because they are the header of the signing key and clause 7.5.8 of ISO 13485 demands precisely that nominative traceability. The check examines 407 files and finds nothing more.

And the upstream gap is filled: rule 1 of [`CONTRIBUTING.md`](https://github.com/fedcal/Telemedic/blob/main/CONTRIBUTING.md) no longer refers to non-existent generators, but writes the convention - **non-valid by construction**, that is, recognisable as fake by a check and not by eye - and declares that the automatic generators do not yet exist. It is the difference between a rule that the check makes respect and a rule that the check only teaches to those who break it.

**The class of anchors is closed, and its closure produced eleven new defects.** Forty English anchors recalculated on the translated title, four already corrected because the title is identical in both languages. But eleven had been normalised to a single hyphen where **two** are needed: a title like `### CTX-01 - Identity and access` separates the code from the text with a single character between two spaces, and the algorithm converts every space to a hyphen. At the time the separator was a long dash, which the algorithm removes: two hyphens from spaces remained. After conversion to the short dash, decided later the same day, the hyphens became **three**, because the separator is no longer removed - and the check written hours earlier found all twenty-two anchors that had shifted, in both languages.

From here the check `scripts/verifica-ancore.sh`, which reproduces the algorithm and verifies every link with anchor on both languages: **84 examined, 0 broken**. Before correction it gave 11 broken in English and 0 in Italian, and it was that asymmetry that validated it. The translation runbook, which said nothing about anchors - and it is the reason why the class was born - now says so.

**The lesson applies beyond the case**: fixing a defect is itself an operation that can introduce defects, and a class defect is not closed by eye-checking but by writing the check that measures it - **before** declaring it closed, not after.

**Two decisions of the client, on the same day.** `D63`: the system **must be suitable for providing services to real patients**. It is not a scope expansion but the operative implementation of `D58`, and has only one legal meaning - CE marking at the end of a completed conformity evaluation, with the minimum result of Class IIa and notified body that §3 of [08 §02](../08_compliance/02-qualificazione-e-classificazione.md) has already determined. **It does not move `RU-1`**: 30 November 2026 remains an engineering milestone and remains not usable on patients, while the marking schedule is the one already written in [08 §09](../08_compliance/09-percorso-e-calendario.md), with certificates in June 2028 in the realistic scenario. The two things are on different schedules, and confusing them would produce the misleading statement that art. 7 of the MDR forbids. `V-171` and `V-280` **remain in force**: the decision authorises pursuing marking, not declaring the date on which it will be affixed. Opened `Q-290` on the form of the legal subject and `Q-291` on the allocation of responsibility.

And the closure of `Q-287`: **signature with ephemeral identity tied to chain execution**. The decisive reason is `D54` - custody of a key is a *recurring* burden, and a recurring burden that no one has time to exercise is not a security measure but an abandoned key. The accepted cost is declared and not softened: verifiability depends on a register of third-party transparency **over time**, which for a medical device is a long horizon.

**Criterion 6 is closed, and it brought to light a broken pipeline job.** The component register exists, with eight components noted and four negative proofs. But the command that generates the bill of materials **fails**: `npm ls` errors within `arborist` because the `overrides` field points to transitive dependencies, and with this combination of npm and node the graph resolution breaks. No one had noticed for the same reason that check had no negative proof: **it generates an artefact and asserts nothing**. A pipeline job that produces without verifying does not demonstrate to work, it merely demonstrates to have been executed.

**The rule of negative proof has been amended, not circumvented.** Five checks presuppose code that `V-182` forbids, so they have no behaviour that can fail and there is nothing to test. The rule now says that **proof is required from when the check blocks**: a blocking row without proof always fails, one in reporting can have it empty **only while its date has not arrived**. The date acquires a second effect and becomes a constraint that enforces itself. The table is fifteen rows and **one error alone**, which is a real debt and not a formality.

**The errors of this day were collected in a single file**, by client request: `.telemedic/context/RUNBOOK-ERRORI-E-TRAPPOLE.md`, twenty-three entries in four families - method, orchestration, tools, project - each with the root cause, the rule that prevents it and **the check that enforces it**, or the explicit declaration that that check does not exist. At the bottom is the table of entries without a guard, which is the debt of the runbook itself. `CLAUDE.md` places it among the mandatory readings before writing anything, with the obligation to update it **after** the work: an error solved once and not coded returns.

**Risk register.** No change in level. `R-28` - close date with declared low capacity - remains the dominant risk, and this review is its first measurement with quantified rather than `[NV]` capacity.


**26 August 2026 - translation of the eight remaining areas, and the defects that came out.** Trigger, from the table in §8.2: none of those tabulated. The entry covers an entire working day and substitutes, by decision on register cadence, the separate entries that each finding would have produced: **one entry per session, not one per finding**, because a register that takes up half the document it should index has stopped serving to orient.

**What has been produced.** Fourteen execution plans in `.telemedic/piani/`, one per milestone except `T-01`, which does not need one because it depends on a decision not work. And the English translation of the eight missing areas, by client request, who brought forward work that `T-09` placed in 2027: **145 Italian files, 145 English**, parity reached.

**Four defects found, all verified on the text.**

1. **A prerequisite document was translated in half.** `10_fondamenti/16-architettura-del-progetto.md` counted nine English sections out of eighteen, without the continuation marker that the runbook requires, and with the modification date on the right side. The truncation was in commit `b3498b7`: on the main branch. None of the three existing checks could see it - the dates were aligned, the marker was not there, and a truncated document is a valid document. Completed.
2. **The overview promised what the roadmap had cut.** `00_overview/04-stato-e-limiti.md` described the first release "up to the clinical document validated and returned", while §3 of [03](./03-primo-rilascio-utilizzabile.md) declares that the path stops **before reporting** with the cut `TG-01`. The overview carried the formulation prior to the cut. Corrected by reducing what the document claims, and adding the missing limit to the table.
3. **Three English files were not translations.** Delivered with the translated name - `03-usable-first-release.md` instead of `03-primo-rilascio-utilizzabile.md` - Docusaurus would not have recognized them: it would have published orphan pages continuing to show Italian. Renamed, and repaired sixteen invented links that accompanied them.
4. **The rule on the four services was written and disregarded.** `log-TRAD-1 §3.3` fixes *remote consultation*, *specialist-to-specialist consultation*, *remote assistance* and *remote monitoring*, with Italian in parentheses at first occurrence and a single exception for `04_protocols/`. It was respected in fewer than one quarter of cases. **Client decision**: align the corpus to the rule, not amend the rule to practice. Applied, with the listed protections - proper names of HL7 Italia implementation guides, URIs and JSON values, document types of the DM, terms mentioned rather than used, translations cited to declare them incorrect - and with a decision taken in progress: **the taxonomic enumerations of a regulatory act remain entire in Italian**, because converting only the entries with binding rendering would break the unity of the list.

**Two corrections to this register.** Criterion 3 of `T-03` and criterion 2 of `T-06` are **not** satisfied as declared: the `divergenza-traduzioni` job carries `continue-on-error: true` at line 74 of `.github/workflows/verifiche.yml`, so the script exits non-zero and the build does not fail. And the sacrifice order has **six useful rows, not seven**: `S-8` is consumed and `S-7` is without object, while `05 §1.3` and `§2.1` declare seven.

**Three checks, each with its own negative proof.** `scripts/verifica-divergenza-traduzioni.sh` had a defect - `git log` exits successfully returning an empty line on untracked files, and the fallback `|| echo 0` did not trigger - and now has, beyond the correction, the **structural comparison of section count** and the **detection of orphan pages**, which are the remedies for defects 1 and 3. The bench `scripts/prove/esegui-prove.sh` stands at **27/27**, and every new check has been tested by mutation: with the script broken the case fails, restored it returns to passing, with identical SHA-256 fingerprint before and after. A fact that emerged from the exercise and that no one had foreseen: the original defect **did not alter either the counts or the exit code**, so a proof written on those would never have revealed it.

**Test in four fields.** *Artefact*: `scripts/verifica-divergenza-traduzioni.sh` and `scripts/prove/esegui-prove.sh`. *Command*: `bash scripts/prove/esegui-prove.sh` and `bash scripts/verifica-divergenza-traduzioni.sh`. *Result*: bench 27/27; divergence check `Aligned: 143 · Divergent: 2 · Missing and required: 0 · Orphans: 0`, then `Aligned: 145 · Divergent: 0 · Missing and required: 0 · Orphans: 0` when divergences closed. *Date*: 26 August 2026.

**Baseline of broken links, taken for the first time and then corrected.** `npm run build` **exits with code 0** because `onBrokenLinks`, `onBrokenAnchors` and `onBrokenMarkdownLinks` are all three on `warn`. It is the measure of criterion 1 of `T-07`, which so far was an impression. The first detection counted three broken pages in Italian and twenty-one in English; **it was taken on a truncated list**, because the capture passed through `tail` and Docusaurus prints a summary before the complete list. The true measure, on complete register: **Italian is clean - zero broken links** after correction of the three defects, and English has **twenty-three pages and eighty-eight broken links**, plus a class no one had counted, the **anchors**. The lesson is the same as the badly calibrated check: *a measure taken on an extract is not a measure*, and a wrong number in a register is worse than a missing number, because the reader does not verify it.

**The three Italian defects, and the rule that was violated closing them.** They were a link to a folder instead of a document (`05_domain/07`) and two relative paths missing the prefix `./` (`10_fondamenti/01` and `10_fondamenti/08`). They were corrected in Italian, and **English was left behind** - the same three defects stood, in the same form, in the translated files. It is precisely what this project already saw happen with commit `7750d38`: a defect closed in one language alone is not closed, it has become a divergence. Also corrected in English the same day. The divergence check could not see it, because it compares structure and dates, not the form of links: it is a declared surveillance gap, not a solved case.

**The class of anchors, never recorded before.** Forty-two English links carry an anchor to another document, and nearly all are **in Italian form** - `#3-la-busta`, `#ctx-01--identità-e-accessi`, `#47-contesto-telemonitoraggio`. An anchor is derived from the section title: if the title is translated, the anchor changes, and the link points to an anchorage that does not exist in the English page. About thirty pages result, almost all ADRs that refer to `02_architecture`. The translation runbook prescribes nothing on anchors: it is the gap that produced the class, and must be filled before remedying it, otherwise the next round creates it again.

**The diagnosis of English links is not concluded, and is not declared as such.** The measured facts: no link in the `./` form breaks, all eighty-eight broken are in the `../` form; the source pages belong to four areas alone - `protocols`, `security`, `compliance`, `fondamenti` - which are **exactly the four areas of the last translation round**, commit `b3498b7`; the target documents all exist in English, the set of files is identical in both languages, the frontmatter is homogeneous, there are no BOM or Windows line endings, and the identical link line breaks in one file and resolves in the next. The URL that Docusaurus declares "resolved as" preserves the `.md` suffix, so the resolution from markdown to route **does not occur at all** for those files and the link falls back on URL resolution. The explanation given first - that Docusaurus applies prefix-number removal only to translations - **is false**: it was verified and fails, because in Italian the same links resolve and the built pages have the same names in both languages. The cause remains `[NV]`. Until it is isolated, bringing the three `onBroken*` criteria to `throw` **would stop the site build**, so the second act of `L-07` remains open and criterion 1 of `T-07` remains measured but not closed.

**Risk register.** No change in level. Two facts that this day measures for the first time, and which have the same form: **a rule written and not guarded by a check is not a rule**, and **a gate prescribed in a plan and not executed by a script is not a gate**. `log-TRAD-1 §3.3` existed before the first round; the three gates of §4 of `T-06` were written and no one had executed them on the full corpus before declaring the areas complete. It is also worth noting that **the sacrifice order produces cuts by construction, and every cut has the side effect of defect 2**: it should be evaluated whether to add to §6 of [03](./03-primo-rilascio-utilizzabile.md) the obligation to list, for each `TG-nn`, the documents to update when the cut is executed.


**26 August 2026 - planning of milestones, and a correction to this register.** Trigger,
from the table in §8.2: none of those tabulated. The entry records milestone planning
work requested by the client and two facts that came out of it and that affect the state declared above.

**What has been produced.** Fourteen execution plans in `.telemedic/piani/` - one
main and one for each milestone from `T-02` to `T-14` - for approximately ninety-four thousand words.
They are **internal planning** (`D57`): they are not public documents, they do not modify any criterion
and they do not move any date. Each reports, for every criterion, the state **measured on
the repository** rather than deduced from documents, the proof by which the criterion declares itself satisfied
in binary form, the sequence of work with dependencies, and what the milestone does not comprise.
`T-01` has no plan: it is closed except for criterion 1, which depends on a decision (`Q-189`) and not
on work.

**First correction - criterion 3 of `T-03` and criterion 2 of `T-06` are not satisfied as
this register states above.** The table of the state of milestones, on this same day,
gives them as satisfied. Verified on the repository: the `divergenza-traduzioni` job in
`.github/workflows/verifiche.yml` carries **`continue-on-error: true`** at line 74. The script exits
non-zero, but the workflow absorbs it: **the build does not fail**. The comment next to it declares its exit condition -
"becomes blocking in the same commit in which the last of those areas is completed" - and the three areas required by
`D56` are complete (`10_fondamenti` 21 files out of 21, `06_security` 11 out of 11, `08_compliance` 11 out of 11). **That commit
was never made.** The two criteria are therefore satisfied as to the existence of the
differentiated behaviour and **not** as to blocking, which is what both ask. It is a debt contracted on
26 August 2026, and its date is that one.

**Second correction - the sacrifice order has six useful rows, not seven.** §1.3 and
the leading indicator of `R-28` in [05](./05-rischi-e-dipendenze.md) declare seven rows
available, in two separate places. §6.2 of [03](./03-primo-rilascio-utilizzabile.md) lists
**eight** after the addition of `S-8`. Of these, `S-8` has been **consumed** on this same day
and `S-7` - the exact count of the corpus words - is **without object**, because the count
has been executed. The rows actually available are **six**, `S-1`…`S-6`. It follows that the
leading indicator of the programme's dominant risk counts rows that no longer exist. The correction of the two
documents is for the area that owns them; this entry records it.

**A defect in the divergence check, corrected.** `scripts/verifica-divergenza-traduzioni.sh`
compared commit dates with `t_src=$(git log -1 --format=%ct -- "$src" || echo 0)`. On a
file not yet tracked **`git log` exits successfully returning an empty line**: the fallback
`|| echo 0` does not trigger, and the comparison receives an empty string instead of a number. The script
emitted `[: : integer expected` for every untracked file. Corrected by imposing the default value
after substitution. The check now reports `Aligned 52 · Divergent 2 · Missing and required 0`
without errors. The two divergent ones are `04_protocols/09-tempo-reale.md` and
`06_security/02-identita-e-accessi.md`: **they do not match the three that the defect register
declares in §19.5**, and the difference must be ascertained in consolidation.

**Expansion of scope decided by the client - the translation of the eight remaining areas is executed
now.** `T-09` is `[INTENTION]` with reference "2027, in parallel to development". The client
has decided to bring it forward. The measured scope is **ninety-one files and approximately
three hundred and seventeen thousand words**: `00_overview` 5 files, `01_technical` 10, `02_architecture` 10,
`03_functional` 8, `05_domain` 10, `07_integration` 11, `09_roadmap` 6, `adr` 31. The reservation laid and not
accepted is that six areas out of eight describe a system that in code does not yet exist, and that
`T-08` will move part of it: that part will need retranslation. The decision is the client's and is
recorded as such.

**Risk register.** No change in level. It must be observed that bringing forward translation
**does not reduce `R-03`** - the corpus volume exceeds translation capacity - and
**increases the fixed cost of every subsequent modification to Italian**, because every area promoted to
blocking requires from that moment on closing every correction in both languages in the same
commit.

## 9. Noticeboard: what this area has closed

### 9.1 The questions closed by the third round of decisions

| # | Closed by | Outcome |
|---|---|---|
| `Q-180` | **`D53`** | 30 November 2026 remains the **first releasable deliverable**. It follows the obligation to reduce scope and declare the cuts: [03 §5](./03-primo-rilascio-utilizzabile.md) |
| `Q-181` | **`D54`** | Capacity: **single contributor, working part-time**. Remains open the allocation of `Q-189` |
| `Q-182` | **`D56`** | Translation **assisted area by area** with divergence check; full translation is no longer a prerequisite for code |
| `Q-144` | **`D55`** | Intended use of telemonitoraggio frozen on **deferred collection**; Class IIa and software safety class B confirmed |

**They are not reopened.** The consequences are absorbed in the five chapters that follow; the decisions
are not revisited in any of them.

### 9.2 Question `Q-09`, resolved

> *"The deadline for adopting security measures is subject-specific for each customer: the roadmap
> cannot hardcode a single date. How is it parameterised."* - `ORCH` → `ROAD`

**Answer.** A date is not parameterised: you **stop declaring dates** and declare the
**availability of evidence**.

**First - the product declares evidence, not conformity.** For each of the evidence listed in
[`docs/06_security/09-ripartizione-delle-responsabilita.md`](../06_security/09-ripartizione-delle-responsabilita.md) §12
the roadmap declares **from which release the evidence is available**. It is a fact of the product, not
of the customer, and is dateable.

**Second - the customer's deadline is a configuration datum, not of the plan.** The date by which a
user must have adopted the measures follows from the insertion notification **that they
received**. The product does not know it and must not know it. What it must do - and it is a requirement, not a
note - is **not prevent** the customer from meeting it.

**Third - the moment when the product meets the market is not the deadline, it is the contract.** Security
requirements enter **new, renewed or extended contracts**: it follows that
**evidence must be available at the time of negotiation, not at the time of the deadline**, and negotiation precedes
the deadline by months.

Permitted formulation, which substitutes every date: *"from release N, the project delivers every
artefact with the conformity dossier that includes evidence E1…En; the deadline by which the
obligated subject must have adopted the measures is determined by the insertion notification they received and
is not determinable by the supplier".*

Placed as constraint **`V-186`**.

### 9.3 Question `Q-113`, dispatched for the part of this area

> *"Update service level for third-party components, expressed in days from advisory publication and
> differentiated by severity."* - `TECH` → `COMP`, `ROAD`

This area **confirms the form** and **does not fix the numbers**, which belong to the post-market
surveillance plan. What the roadmap establishes, and places as constraint **`V-185`**, is that **a
commitment expressed in months is not plannable and is not accepted**: with the release cadence observed
on the relay node - fourteen releases in just over seven months, five in August 2026 alone -
a monthly commitment is already expired when published. The service level is expressed in **days
from advisory publication, differentiated by severity**, is measured and published measured. The roadmap adds a
planning consequence: **the capacity necessary to meet that service level is recurring capacity**, and must
be subtracted before calculating any date - **under `D54` from a capacity that is a single person working
part-time**. The quantification is in [05 §2.1](./05-rischi-e-dipendenze.md), risk `R-12`. **Remains open to `COMP`** for the
formal commitment.

### 9.4 Questions `Q-152` and `B-6`, with the part of this area declared

This area **does not propose values**: it does not have the competence. It does however declare three things that are its own.

**When it is needed.** The threshold must exist **before the first exercise with a real tenant**, not before
the first release: the type of incident that depends on it rests on a number that **the customer chooses**.
What must exist at first release is the **measurement capacity**, not the value.

**What the roadmap asks in return.** That measurement capacity be treated as a requirement of the first
release and not as an operation activity, because adding it after means not having historical series when they
are needed. **It has been deliberately excluded from cuts** and is in [03 §3.1](./03-primo-rilascio-utilizzabile.md).

**What remains for `SEC` and `ARCH`.** Reference values and their distinction from contractual agreements.
Open as `Q-184`.

### 9.5 The constraints placed by this area

| # | To | Constraint |
|---|---|---|
| `V-180` | all | **Reformulated by `V-280`.** In its original form it forbade declaring dates for milestones not of the project; with `D57` and `D58` planning is internal and the prohibition narrows to dates that the regulation places on a different subject |
| `V-181` | all | Every milestone has a binary completion criterion. A percentage of progress is not a criterion |
| `V-182` | `TECH`, `COMP` | No line of application code precedes the build chain that generates the bill of materials and the register of requirement identifiers |
| `V-183` | all | **Amended by `D56`.** Release of the documentary body is by complete area; the obligation of **both languages** remains for prerequisite areas - public warnings, foundations guide, compliance and security areas - and for the rest the regime of measured reporting applies |
| `V-184` | `PROD`, `COMP`, `INTEG` | No material may present an entry `[INTENTION]` or `[CONDITIONAL]` as `[COMMITMENT]` |
| `V-185` | `TECH`, `SEC`, `COMP` | The update service level is expressed in days from advisory publication, by severity, and is measured |
| `V-186` | all | Conformity to national security measures **has no product date**: the product declares evidence and the date of availability of each |
| `V-187` | all | **Planned vs desirable**: without binary criterion, trigger and owner the entry is desirable and must be marked as such |
| `V-188` | `TECH`, `INTEG`, `ARCH` | The suite of integration tests exercises **always at least two tenants and two distinct integrators**, with divergent configurations |
| `V-189` | all | Every risk has **observable leading indicator** and **nominated owner** |
| `V-280` | all | The roadmap is **internal project planning** (`D57`, `D58`). **An internal planning date is not a promise of outcome**: no material states that the product will be marked by a date (`V-171`) |
| `V-281` | all, particularly `COMP` | **No milestone enters the plan if it requires two distinct subjects and the second does not exist.** It is declared as a gap with the date on which it is born |
| `V-282` | all | **Scope is the only free variable.** Every deviation is absorbed by reducing scope according to the declared sacrifice order, which contains **only reversible cuts**; if the order is exhausted, the date is declared missed |

## 10. The questions open from this area

| # | To | Question | Decision point |
|---|---|---|---|
| `Q-183` | `COMP` | Evidence of the regulatory package deliverable, and what the dossier of our pathway will contain | - |
| `Q-184` | `SEC`, `ARCH` | Measurement capacity as a requirement of the first release; values before first exercise | Before exercise |
| `Q-185` | `PROD`, → **ORCH** | Public material not aligned to `D19` and `D29`; impact **unrecoverable** | 31 October 2026 |
| `Q-186` | `COMP`, `TECH` | **Declared support period**; prerequisite of first distribution and blocking criterion | 15 October 2026 |
| `Q-187` | → **ORCH** | Concentration allowed on a single integrator and timing of the second test counterparty | Before second integrator |
| `Q-188` | `COMP`, → **ORCH** | Reserve declared for non-estimable items; with `D58` non-conformity cycles are our work | - |
| `Q-189` | → **ORCH** | **Allocation of records to distinct roles**: what is accepted as a gap and what is acquired externally | **30 September 2026** |
| `Q-280` | → **ORCH** | **Establishment of the manufacturer subject** (`D58`) and person responsible for compliance with the regulation. Class `B`: few hours and many months | **19 September 2026** |
| `Q-281` | `PROD`, → **ORCH** | The difference between what public material declares and what `RU-1` delivers, and the formulation by which it is declared | 31 October 2026 |
| `Q-282` | `COMP` | Form of declaration of **dated gaps** in the dossier, for records not reconstructible after the fact | Before `T-10` |

## 11. Conventions of this area

- **`[NV]`** marks an unverified statement, with indication of who must close it. No `[NV]`
  survives the milestone it depends on.
- **Dates** are expressed in full and refer to the end of the day indicated. **They are not estimates**:
  they are **allocations of the remaining calendar** to a constrained sequence, under the capacity of `D54`
  ([01 §4.1](./01-principi-e-metodo.md)).
- **No invented estimate.** Where a time is not estimable with available information, the document
  declares it and explains what it depends on. A declarted gap is preferable to a number that someone
  will cite as their own within two weeks.
- **The abbreviations `T-nn`, `RU-n`, `OL-nn`, `DS-nn`, `TG-nn`, `R-nn` and `S-n`** are **planning designations**:
  they do not belong to the intervals frozen by `V-120`, do not enter the traceability matrix and
  cannot appear in a test.
- **Synthetic data only**, no real data, no secret.
- **Rule `R0`.** No company name, trademark, commercial product or potential partner domain
  appears in this area. Only generic formulations: "a cloud healthcare management system", "a third-party EHR system",
  "the integrator".

> **Permanent warning.** The repository is source code under a permissive licence, **not a
> medical device placed on the market**. **Today the product does not bear the CE marking**, is not covered by
> any declaration of conformity, and **no distributed artefact is usable for the provision of healthcare
> services to real patients** (`D16`). That the project intends to assume the role of manufacturer (`D58`), with the
> entity still to be established, is **internal planning**: it is not a marking date (`V-171`, `V-280`), does not cover any
> present installation and **removes no obligation from those who install, integrate or place the software in service**. No
> milestone in this roadmap, however achieved, changes this condition. The declarations that attest to it are published in
> [`NOT-A-MEDICAL-DEVICE.md`](https://github.com/fedcal/Telemedic/blob/main/NOT-A-MEDICAL-DEVICE.md) and in
> [`DISTRIBUTION-POLICY.md`](https://github.com/fedcal/Telemedic/blob/main/DISTRIBUTION-POLICY.md).
