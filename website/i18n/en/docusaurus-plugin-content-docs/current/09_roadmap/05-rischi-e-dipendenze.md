---
title: Risks and dependencies
sidebar_position: 6
description: "The register of programme risks - thirty items with declared probability, impact on the calendar, anticipatory indicator, response and owner - the dominant risk of the approaching date with low declared capacity, the functions requiring distinct subjects, external dependencies family by family and the procedure by which the register is monitored."
---

# Risks and dependencies

> **This is the register of programme risks, and the word "programme" is the binding part.** Here a single magnitude is measured: **effect on the calendar and on deliverability**. The risks to care recipient safety do not belong to this register, have their own discipline, their own scale and their own file, and mixing them would produce the worst damage a planning document can produce: making it seem negotiable a clinical risk because it stands in a table next to a delay.

> **What has changed in this revision.** `D53` confirms the date of the first installable release; `D54` declares capacity; `D57` establishes that **planning is the project's** and not of third parties; `D58` attributes to the project the role of manufacturer, yet to be established. It follows that **risks whose owner was "whoever certifies" are now project risks**, with impact recalculated on us, and that three new items enter the register: `R-28`, `R-29` and `R-30`. One item - `R-01` - **closes**, because the condition producing it has been removed.

---

## 1. What enters here, and in what form

### 1.1 The boundary with clinical risk management

The risks concerning the safety of the care recipient are governed by the risk management file of the regulatory package, in [`docs/08_compliance/05-gestione-del-rischio.md`](../08_compliance/05-gestione-del-rischio.md), with its own analysis, its own estimate, its own control measures and the **verification of effectiveness** of each measure. This register **refers to it and does not rewrite it**.

The distinction is operational and is applied with a single question:

> **If this happens, who suffers the effect?** If the answer is "a care recipient", the item is not here. If the answer is "the calendar, the scope or deliverability", the item is here.

**A programme risk can have a clinical risk as an indirect consequence**, and in that case appears in both registers with two different formulations. The typical case is `R-23`, scope drift: on the calendar it produces a conformity re-assessment; on the clinical plane it produces a function that interprets without having been evaluated as such. **The two items do not substitute for each other.**

**No item in this register has the response "accept the clinical risk".** Where the response to a programme risk would touch a clinical risk control, the sole admitted response is one: **reduce scope, and if scope cannot be reduced further the date is declared missed** - never compress the control. It is the translation, on the plane of time, of the prohibition on debt against access register, key verification, quality notice, alarms, consent, tenant isolation and absence of clinical content in logs, listed in [01 §7.3](./01-principi-e-metodo.md) and recalled as the third rule of the sacrifice order in [03 §6.1](./03-primo-rilascio-utilizzabile.md).

### 1.2 The probability scale, defined before the items

No percentages exist in this register. A percentage on a project without delivery history is a number someone will cite as data within two weeks, and would be invented.

| Class | Operational definition |
|---|---|
| **Registered** | It is not a risk: it has **already happened**. Remains in register because its evolution must be monitored and because the response is still open |
| **High** | The conditions producing it **already exist today**, and no current measure removes them |
| **Medium** | The conditions producing it are plausible in the period considered, or exist but are partially safeguarded |
| **Low** | It requires the concurrence of multiple independent circumstances, or is safeguarded by a verified measure |
| **Not estimable** | It depends on a variable of which the project has neither observation nor source. **It is declared, not estimated** |

### 1.3 The impact scale, which measures the calendar and nothing else

| Class | Effect |
|---|---|
| **I1** | Days. Absorbable within the affected milestone |
| **I2** | Weeks. Shifts the affected milestone, not the subsequent ones if margin exists |
| **I3** | Months. Shifts the affected milestone **and the downstream chain** |
| **I4** | The affected milestone **is not reachable** in the declared form. Requires reformulation, not deferral |
| **I5** | **Irrecoverable.** The result is not obtainable later, at no cost |

**Class `I5` is the reason this register exists in this position of the roadmap.** An `I5` risk with even merely medium probability is worth more than ten `I2` risks with high probability, and no weighted sum must be able to produce the contrary.

**A clarification that `D54` renders necessary.** With the plan of chapter [02](./02-traguardi.md) lacking time margin, the scale must be read differently: **`I2` and `I3` no longer produce a slip, they produce a scope reduction**, because the date is fixed and the margin is in scope ([01 §10](./01-principi-e-metodo.md), constraint `V-282`). An `I2` risk that materialises consumes a line of the sacrifice order of [03 §6](./03-primo-rilascio-utilizzabile.md), and the order has seven lines.

### 1.4 The four admitted responses

**Avoid** - remove the condition producing it. **Reduce** - lower the probability or impact with a verifiable measure. **Transfer** - shift to someone in position to sustain it. **Accept** - declare and monitor, without measure.

On transfer holds a non-negotiable limit: **no risk transfers to whoever installs or to the care recipient through a clause.** The project's permissive licence applies between the parties, not towards the damaged party, and the European source on liability for defective products forbids the contractual exclusion of liability towards them - **and with `D58` this holds with greater force, not less**. The admitted transfer is that **to whoever already has the obligation by law** - whoever installs, the data controller - and consists in declaring it, not imposing it.

`D57` further restricts the available responses, and must be stated: **it is no longer admitted to transfer a risk to "whoever certifies"**, because whoever certifies is us. Where the earlier version of this register transferred with declaration, now one reduces or accepts.

### 1.5 The form of an item, and the constraint governing it

Each item carries: what it is, probability, impact on calendar, **anticipatory indicator**, response, owner. Posed as constraint `V-189`:

> **Every risk in the register has an observable anticipatory indicator and a named owner. A risk without an indicator is not monitored: it must be reformulated or closed.**

The **owner** is who has the authority to implement the response, not who suffers its effect.

---

## 2. The register

### 2.1 Capacity and organisation

> **`R-01` - The project's capacity is not declared** · **CLOSED**
> *Closed on 25 August 2026 by `D54`* · *Owner of closure* **contracting party**

**Why it closes, and does not simply disappear.** The rule of §5.2 is that a risk closes only if the condition producing it has been removed and the removal is verifiable. `D54` declares capacity - **a single contributor, on a part-time basis** - and closes `Q-181`: the condition is removed and the removal is verifiable by reading the decision. The three hypotheses `H1`, `H2` and `H3` on which the roadmap produced dates have lapsed ([01 §11](./01-principi-e-metodo.md)).

**What does not close with it.** The capacity **declared** is not the capacity **sufficient**. The risk following from it is new, has a different form and a different indicator, and is `R-28`. Cancelling `R-01` without opening `R-28` would have produced the illusion that a decision resolves an arithmetic.

> **`R-28` - Public approaching date with low declared capacity**
> *Probability* **High** · *Impact* **I4** · *Owner* **contracting party**, with the single contributor for executing the sacrifice order

**What it is, and it is the dominant risk of the entire plan until 30 November 2026.** `D53` fixes publicly a date ninety-seven days away; `D54` declares a capacity of a single contributor on a part-time basis, of which `[NV]` the number of weekly hours **is not declared**. The plan of chapter [02](./02-traguardi.md) allocates the entire remaining calendar to nine milestones and **has no time margin**: nine bars out of ten are critical.

**What the risk is not**, and must be stated not to confuse it with something else. It is not that the decision is wrong: the decision is taken and is not relitigated. It is not that the work is impossible: scope has been reduced for it to be possible. **It is that the margin, being entirely in scope, is consumed silently**: every deviation consumes a line of the sacrifice order without anyone having to announce it, and when the order ends there remains nothing to cut that is not a blocking criterion.

**The form in which it materialises.** Not a slip - the date is fixed - but one of two:

1. **A leaner release than declared**, if the sacrifice order is executed without being recorded: it is the worst outcome, because the choice of what to sacrifice **ceases to be legible**, which is exactly what `D53` requires to guarantee.
2. **A publicly missed date**, if the order is exhausted. It is the declared and expected outcome, and is preferable to the first.

**Anticipatory indicator, and it is measurable each week.** **The number of lines of the sacrifice order of [03 §6.2](./03-primo-rilascio-utilizzabile.md) still available.** They are seven. A review that records consumption of two in the same month anticipates exhaustion before the date.
Secondary indicator: **a milestone of chapter [02](./02-traguardi.md) that does not close by its own date without a line of the order being consumed** - means the deviation has been absorbed silently, which is the condition preceding outcome 1.

**Response.** *Reduce*, with four measures all already in force:

- **Scope is already reduced and the reduction is declared item by item** ([03 §5](./03-primo-rilascio-utilizzabile.md)), with the reversibility of each cut.
- **The sacrifice order is written in advance** ([03 §6](./03-primo-rilascio-utilizzabile.md)), because writing it afterwards would mean choosing it under pressure.
- **In the order enter only reversible cuts**, and the blocking release criteria and the list of forbidden debt do not enter it ever (`V-282`).
- **The review shifts from monthly to weekly in the last six weeks**, from 19 October 2026, with content reduced to the count of remaining lines and closed criteria. A monthly review on a plan lacking margin observes the phenomenon when it is finished.

*Accept* the residual, declaring it: with fixed date and capacity, a residual exists by construction and no planning measure eliminates it.

> **`R-02` - Concentration of knowledge on a single contributor**
> *Probability* **Registered** · *Impact* **I4** · *Owner* **contracting party**

**What it is.** `D54` declares a single contributor: project knowledge resides in one person, and their unavailability does not delay the project, **stops it**. It is no longer a hypothesis to monitor - it was `High` under `H1` and `H2` - it is a registered **fact**.

**Anticipatory indicator.** The time that passes between publication of the foundations guide and **the first change proposal accepted by a person other than the single contributor**. Until that time has a terminus, the reduction measure has not been verified: it has only been published.
Secondary indicator, and more immediate: the **absence of a minimal practicable profile declared** for the local environment (`Q-191`), without which the condition making possible the participation of an external contributor **is not verifiable**.

**Response.** *Reduce*, with three measures in force or planned: the foundations guide `D35`, which exists to render the project learnable by a stranger; the "documents as code" model, which renders the chronology of decisions legible without asking anyone; a development environment bootable on a machine disconnected from everything (`V-190`). *Accept* the residual.

**What this risk no longer covers.** The part regarding **recordings with distinct roles**, which in the earlier version was a component of it, has been **extracted into `R-29`**. The reason is not redactional: they are risks of a different nature. `R-02` is a **continuity** risk - if the person remains, it does not materialise - while `R-29` is **already materialised every day the project works**, and its absence does not attenuate it.

> **`R-29` - Recordings with distinct roles are not producible, and the gap repeats at each release**
> *Probability* **Registered** · *Impact* **I5** · *Owner* **contracting party**

**What it is.** Some recordings required by the quality management system **presuppose distinct subjects**: **internal audit**, **release review**, **configuration verification performed by someone who did not write the code**, **independent external review of critical security code** prescribed by `D18`. Under `D54` **are not producible internally**, and **not for lack of hours**: an auditor does not audit their own activity, a review does not verify who conducts it, an independent verification is not independent if the author performs it ([01 §9-bis](./01-principi-e-metodo.md)).

**Why the impact is `I5` and not `I3`.** Because a review recording **of an already-occurred release** is not a review: it is a reconstruction, and verification recognises it as such. The same holds for an audit referring to a concluded period. **The gap remains dated to `RU-1` forever**, and what is acquired later counts from subsequent releases onwards (`OL-22`).

**Why it is the risk that worsens by itself.** Because **the loss repeats**: every release produced under the same conditions adds a line to the list of dated gaps, instead of leaving it constant. It is the sole item in the register with this property, and is the reason `OL-22` is in first position in the queue of [04 §3](./04-oltre-il-primo-rilascio.md).

**Anticipatory indicator.** Passage of **30 September 2026** without a decision on `Q-189`. It is an irreversible decision point declared in [02 §6](./02-traguardi.md): beyond that date the default outcome is the declared gap. Continuous indicator, for subsequent releases: **the number of gaps dated in the release dossier**, which must stop growing.

**Response.** *Reduce* for the part that is acquired externally, according to the allocation that `Q-189` must decide. *Formally accept* for the rest - and "formally" is the binding word: an accepted gap is **a registered decision with reason, owner and date**, not a silence
(criterion 2 of `OL-22`). What the project does anyway, and does not substitute independent verification but is what remains producible:

- all criteria of `RU-1` remain **verifiable by anyone** with the procedure described ([01 §12.1](./01-principi-e-metodo.md));
- the release dossier **explicitly states, in both languages, that no verification has been performed by a second subject** (blocking criterion 17 of [03 §8](./03-primo-rilascio-utilizzabile.md));
- the verification procedure for whoever installs is published so **it is actually performed**: in `RU-1` it is the sole independent verification that will exist ([03 §10](./03-primo-rilascio-utilizzabile.md)).

**The constraint it follows from**, posed as `V-281`: **no milestone enters the plan if it requires two distinct subjects and the second does not exist.** It is declared as a **gap, with the date it was born**, not planned as an activity - because planning an activity not producible is the quickest way to make it vanish from view.

> **`R-12` - Recurring monitoring capacity consumes development capacity**
> *Probability* **Registered** · *Impact* **I2 recurring** · *Owner* **project**

**What it is.** The service level for updating third-party components is expressed in **days from announcement, differentiated by severity** (`V-185`), and consumes capacity **each month, forever**. The observation founding it is measured: the relay node has had fourteen releases in little more than seven months, five in August 2026 alone, with a critical vulnerability corrected midway.

**Why under `D54` it weighs more than before.** Because recurring capacity is subtracted from a gross capacity that is **one person on a part-time basis**: the subtracted fraction is identical in absolute value and much larger in proportion. It is the reason `TG-04` - the broker cut - is the sole cut that eases the project too and not just whoever installs: one fewer exposed component is monitoring recurrence minus.

**Quantification.** `[NV]` - not estimable without the project's own delivery history. What is declared is the **rule**: recurring capacity is subtracted **first** before calculating any date ([01 §9](./01-principi-e-metodo.md)).

**Anticipatory indicator.** The first security notice on an exposed component closed beyond the declared window.

**Response.** *Reduce*: automation of dependency updates, distinta generated at each build, component register with versioned annotations. *Accept* the residual, declaring it.

> **`R-21` - Recruitment of representative users does not compress**
> *Probability* **High** · *Impact* **I3** · *Owner* **contracting party**, for engagement

**What it is.** Usability validation requires representative users who include elderly care recipients and persons with disabilities - **target population and not a boundary case** - and their recruitment has its own calendar time, with consents to gather and protocol to approve before execution.

**How it has already materialised.** It is no longer a sole future risk: it is the cause of the irreversible cut `TG-22`, the **formative evaluation during development**, which is not recovered because it is contemporaneous by definition with the design decisions it evaluates.

**Anticipatory indicator.** The absence of an approved validation protocol at the moment the interface approaches finalisation. The protocol is approved **far before** its execution.

**Response.** *Reduce*, by anticipating the protocol; *accept* the recruitment duration and the formative gap already accrued, which the usability engineering dossier declares with its date.

> **`R-22` - The specialist figures needed are a scarce resource**
> *Probability* **Medium** · *Impact* **I3** · *Owner* **contracting party**

**What it is.** The path requires expertise that does not improvise and that under `D54` **does not exist internally**: human factors engineering, clinical authoring with documentable qualification, independent security verification, quality officer distinct from developer. With `D58` the **person responsible for regulatory compliance** is added, whose qualification is documentable and whose availability must be permanent: research observes that such figures are scarce and that the micro and small business exemption **increases demand**, because it permits many structures to draw on the same external market.

**Anticipatory indicator.** The time that passes between the first request to a specialist professional and their response. If it exceeds two weeks, the market is saturated and planning must be redone on that data. It is measurable by criterion 2 of `T-14`, which records the date of first request.

**Response.** *Reduce*, by starting the search **before** it is needed: it is the reason `T-14` is on 19 September 2026 and not after the first release. **It is no longer admitted to transfer with declaration**: with `D58` the need is ours, not a third party's who will assume it.

> **`R-24` - Priorities shift on external request**
> *Probability* **High** · *Impact* **I2, cumulative** · *Owner* **contracting party**

**What it is.** A request arriving from outside - an integrator, a procurement, a demonstration - has a force of persuasion that a queue item does not, and the individual deviation costs little. The cost is **cumulative**: three two-week deviations consume a milestone's margin without any of the three appearing significant at the moment it is granted.

**Why under `D53` it changes nature.** Because there is no time margin to consume: a deviation **does not delay, it reduces**. It directly consumes a line of the sacrifice order, and therefore adds to `R-28` instead of remaining independent.

**Anticipatory indicator.** A review that records a bypass in the queue **without verified trigger** per [04 §2.3](./04-oltre-il-primo-rilascio.md), or consumption of a line of the sacrifice order whose recorded cause is an external request.

**Response.** *Reduce*, with the method: every deviation passes through the scope-expansion procedure and the review, and is recorded with its reason.

### 2.2 Volume of documentary corpus and linguistic regime

> **`R-03` - The volume of the documentary corpus exceeds translation capacity**
> *Probability* **High** · *Impact* **I3 on the 2027 plane**, no longer `I4` on the 30 November 2026 milestone · *Owner* **project**

**What it is, and how it has been reduced.** `D50` requires the English version **in its entirety**; the Italian corpus is on the order of hundreds of thousands of words. In the earlier version of this register the risk was `I4` on the 30 November milestone, because `D52` prevented declaring an area closed without it being navigable online in both languages. **`D56` amends `D52`**: translation proceeds **in parallel**, area by area, and is no longer a prerequisite to every line of code. The impact therefore shifts from the 2026 milestone to the 2027 plane (`T-09`).

**What remains, and it is not little.** There remain non-negotiable prerequisites **the public notices, the foundations guide and the conformity and security areas**, where the divergence control **blocks** (`T-06`). On that subset the risk is unchanged.

**Anticipatory indicator.** The divergence-control reporting, published at each build: **the distance between Italian and English corpus, measured and not estimated**. If it grows between two consecutive reviews, assisted translation is not keeping pace with production.

**Response.** *Reduce* with preliminary measure - **exact word count**, criterion 5 of `T-02` - and with the mode of `D56`. *Accept* for the rest: the untranslated part is **visible and measured**, which is the minimum condition to prevent it degenerating into `R-16`.

> **`R-16` - The two language versions diverge**
> *Probability* **High**, in the absence of automatic control · *Impact* **I5 on the regulatory plane** · *Owner* **project**

**What it is.** Normative content that says two different things in two languages is not a translation problem: it is **a documentary defect in a medical device**. The impact is `I5` because a divergence discovered in verification is not "corrected": it forces reissue and proof of when it existed.

**Why `D56` does not attenuate it, and must be stated.** Parallel translation reduces the risk of **delay** and **not** that of **divergence**: a corpus translated in instalments has more occasions to diverge, not fewer. What safeguards it is not the translation mode but **the differentiated behaviour of the control**: it blocks on prerequisite areas, reports on the rest with published report (`T-03` criterion 3). The areas in reporting only **have an accepted and measured divergence risk**, not absent.

**Anticipatory indicator.** The first change proposal accepted that touches a **prerequisite** area without updating the English: it is impossible by construction, and if it happens the control is misconfigured.
For reporting-only areas, the indicator is growth of the divergence report.

**Response.** *Avoid* by construction on prerequisite areas; *accept and measure* on the others, with the transition from reporting to blocking recorded area by area and **not reversible** (`T-09`).

### 2.3 Conformity, decisions and scope

> **`R-04` - The conformity area concentrates the pending questions of the other areas**
> *Probability* **Registered** · *Impact* **I3** · *Owner* **orchestration**, then `COMP`

**What it is.** The conformity area is now written - ten documents - and the research document on the certification path has been completed. The risk does not close with the writing: that area remains the one towards which the greatest number of pending questions of the others converge, and on it rests the document control procedure of `T-01`, the requirement identifier register and the entire regulatory package of `T-12`. **With `D58` the rewriting of chapters built on the figure of the third party is added to it**, which is new work and not deferrable, because those chapters today attribute to someone else a path that is ours.

**Anticipatory indicator.** The number of `OPEN` questions addressed to `COMP` that grows between two reviews without any closing.

**Response.** *Reduce*, with the sequence: the class `A` activities belonging naturally to that area - document control, requirement identifier register, realignment of public notices to `D58` - are **anticipated in `T-01`** and do not await, because their cost of omission grows each day.

> **`R-05` - The documentary models of telemedicine typologies are not available**
> *Probability* **Registered** · *Impact* **I0 on the project** · *Owner* **`COMP`**, for engagement

**What it is.** Documentary models of structured document, typology codes and indexing metadata are not publicly available (`Q-07`, `B-7`, `V-136`).

**Why the impact on the project is null, and it is a result and not luck.** Because the content is modelled as a **canonical dataset** and every serialisation is substitutable (`V-07`). The risk existed, has been **avoided by design**, and the item remains in the register to monitor the sole thing that can still go wrong: that someone hardcodes a template for convenience - **and under calendar pressure convenience increases**, which is the reason the item does not close now.

**Anticipatory indicator.** The appearance, in a change proposal, of a documentary template inside the domain instead of behind the extension point.

**Response.** *Avoid* by construction, with automatic verification.

> **`R-17` - Decisions of the contracting party are not taken by the declared dates**
> *Probability* **Medium** · *Impact* **from I2 to I5, according to the decision** · *Owner* **contracting party**

**What it is, and how it has been reduced.** In the earlier version there were seven decisions with a date beyond which the failure to decide is itself a decision. **Four have been taken**: capacity (`D54`), reformulation of the milestone (`D53`), translation mode (`D56`), freezing of intended use (`D55`). There remain, with the addition of two that `D57` and `D58` introduce:

| Decision | Impact | Date |
|---|---|---|
| Legal form of the manufacturer subject and profile of the responsible person for regulatory compliance (`Q-280`) | `I3`, growing and not recoverable with more work | 19 September 2026 |
| Allocation of recordings with distinct roles (`Q-189`) | `I5` for the `RU-1` period | 30 September 2026 |
| Declared support period (`C-4`, `Q-186`) | `I2`, but is **prerequisite of `T-10`** | 15 October 2026 |
| Correction of public material (`Q-185`) | `I5` in the proper sense: a period of publication cannot be annulled | 31 October 2026 |
| Formulation of the difference between public material and what `RU-1` delivers (`Q-281`) | `I5`, same nature as the previous | 31 October 2026 |
| Licensing regime of scales and questionnaires (`B-3`) | `I2` | Before the first computation engine |

**Anticipatory indicator.** The calendar itself. It is the sole risk in the register that has an explicit deadline for each of its components.

**Response.** *Reduce*: the roadmap **poses** the decisions with the declared consequence alongside, and declares the default outcome in the absence of response - for `Q-189` it is the declared gap on `RU-1`. A plan that awaits in silence a decision that does not arrive has already chosen, without saying so.

> **`R-18` - A declared deferred decision is taken de officio in a change proposal**
> *Probability* **Medium** · *Impact* **I2, with tail `I5` on documentary coherence** · *Owner* **project**

**What it is.** Nineteen decisions are declared deferred in [`docs/02_architecture/09-decisioni-rinviate.md`](../02_architecture/09-decisioni-rinviate.md). Whoever realises encounters one of them and chooses the option most convenient to proceed: the choice is local, reasonable and invisible. The cost emerges when **the code does one thing and the documentation says another**.

**Why under `D54` it is more insidious.** Because the rule safeguarding it - whoever encounters a deferred decision **opens a noticeboard item and does not choose** - is safeguarded by the review, and the review with a single contributor is **self-review** (`R-29`). The sole effective safeguard that remains is **the list of deferred decisions as an explicit checklist** before every change proposal touching an area covered.

**Anticipatory indicator.** A change proposal that touches an area covered by a deferred decision **without** citing it.

**Response.** *Avoid* with the rule; *reduce* with `T-05`, which gathers the decisions with earlier deadline and **poses** them by 3 October 2026.

> **`R-19` - Public material is not aligned with approved claims**
> *Probability* **Registered** · *Impact* **I5** · *Owner* **contracting party**, with `PROD`

**What it is.** The reformulations approved with `D19` and `D29` are not shown to be received on the public page (`Q-185`). While they are not, each day of exposure is a day of unsustainable statement.
The impact is `I5` for the simplest of reasons: **a period of publication cannot be annulled**.

**What `D53` and `D58` add, and they are two different things.** `D53` adds that public material declares capacity that `RU-1` **will not deliver**: at the release's publication the distance between the two becomes verifiable by anyone, and it is the question `Q-281`. `D58` adds a new and graver risk: **the temptation to announce the intention to certify as if it were a dated outcome.** It is precisely what `V-171` forbids, and the proximity between the two statements renders them easy to confuse in good faith.

**Why it is graver than it seems.** The intended use of a device is determined **also by promotional material**. A commercial statement not aligned with the formal declaration does not modify the intended use: it is what is detected at the first comparison between the dossier and public channels.

**Indicatore anticipatorio.** There is none anticipatory, because the risk is already present. What is monitored is the **duration**: each review records for how many days the condition persists.

**Response.** *Avoid*, with a date. The structural safeguard is of process: **alignment between formal declaration and public communication must be verified at every modification of public material, and the verification must be recorded** - it is `Q-174` towards `COMP`. To it is added textual verification that no material contains a marking date, which is blocking criterion 15 of [03 §8](./03-primo-rilascio-utilizzabile.md) and criterion 5 of `T-14`.

> **`R-23` - Scope drift towards class elevation**
> *Probability* **Medium** · *Impact* **I4** · *Owner* **`COMP`**, with contracting party

**What it is.** Three features are **a single story from class elevation**: alert on threshold, image processing, assisted reporting. The drift does not occur by decision, it occurs by accumulation of reasonable requests: a notice that "suggests", a pre-fill that "helps", an image improvement that "renders it more legible".

**What `D55` changes, and it is for the better.** The freezing of intended use on **deferred collection** renders the drift **recognisable**: there exists a reference formulation against which to measure every proposal, and the prohibition is stated - no function can shift the system towards clinical real-time, and the assessment **precedes** writing the function.

**What `D58` changes, and it is for the worse.** The re-assessment following a drift **is our responsibility**: in the earlier version the cost of a reclassification would have fallen on an external manufacturer, and now falls on the project. The impact remains `I4`, but the subject that suffers it has changed.

**Anticipatory indicator.** A proposal formulated as technical capability and not as a use case with an actor - "it would be useful to calculate a score" - is the first symptom.

**Response.** *Avoid*: change control on the three boundary features, negative tests for each exclusion, and the rule that **regulatory impact assessment precedes effort estimate**.

> **`R-26` - The regulatory source changes during the programme**
> *Probability* **High** · *Impact* **from I1 to I3** · *Owner* **`COMP`**

**What it is.** The project rests on sources in motion: recently-instituted documentary typologies, determinations of the national authority for cybersecurity already modified once in 2026, implementation guides in preliminary status, notification obligations with recent entry.

**Anticipatory indicator.** Publication of a new version of a fixed specification is a trigger of **unscheduled review** declared in [00 §8](./00-indice.md).

**Response.** *Reduce*: **version-pinning policy** for every adopted specification, with the version declared alongside every conformity statement and prohibition of formulae that present as standard what is not (`V-133`); no hardcoded template (`V-136`). *Accept* the residual.

### 2.4 Technical risks on the critical path

> **`R-13` - The known defects of the federation product return at the first update**
> *Probability* **Medium** · *Impact* **I1, with security consequence** · *Owner* **project**

**What it is.** Three behaviours of the adopted federation product - the federated user can alter themselves the attributes, change the email without verification, give themselves a local credential - are closeable in configuration. A closed and unmonitored configuration reopens at an update, and no one notices.

**Anticipatory indicator.** The absence of a test that fails if the configuration regresses.

**Response.** *Avoid*: they are treated as **risk controls**, not as configuration notes, and criterion 3 of `T-04` requires both the closure and the regression-prevention test. **They are amongst the verifications that were not cut**, although national federation is out of scope of `RU-1`: the federation product is in the entry path anyway.

> **`R-14` - The workstream of the double instance per identity provider is underestimated**
> *Probability* **High** · *Impact* **I2** · *Owner* **project**

**What it is.** The required authentication context is configured **statically on the single instance**: a variable level per operation requires an instance for each provider-level pair. The multiplier acts on a set whose cardinality is read from a national register and **changes over time**, and each variation entails a new submission of the metadata document to the authority. It is **procedural cost, not code cost**, and for that reason is regularly underestimated.

**Why it remains in register even though the item is out of `RU-1`.** Because the error that safeguards it is one of **estimate**, and is committed at the moment one plans `OL-08`, not at the moment one realises it.

**Anticipatory indicator.** An estimate of the effort for national digital identity that does not distinguish between code cost and procedural cost.

**Response.** *Reduce*: declared scope of **two levels only**, with multiplier factor equal to two and not *n*; alias convention with stable prefix, verified in continuous integration on the generated metadata document.

> **`R-15` - A security mechanism is documented before being verified**
> *Probability* **Medium** · *Impact* **I5 reputational** · *Owner* **`INTEG`**, with `TECH`

**What it is.** It is not verified whether the federation product forwards the required level through the intermediate realm (`Q-160`, `B-8`). The cost of verification is nearly zero; **the cost of having documented a non-existent behaviour on a security mechanism is not**, because it entails a public correction.

**Why the risk has increased with scope reduction, and must be stated.** The corresponding verification has been **deferred with the function** (`T-04`, criterion 5): no longer on the calendar, the sole thing preventing description of the mechanism is **the rule**, not an imminent activity that would render it superfluous. A rule without an activity accompanying it is forgotten more easily.

**Anticipatory indicator.** The appearance, in a draft of public documentation, of a description of the mechanism lacking reference to a recorded verification outcome.

**Response.** *Avoid*, with a binary rule in force and **explicitly recorded in criterion 5 of `T-04` with the reference**: until the outcome is recorded, public documentation does not describe the mechanism.

> **`R-20` - The immutable register is costlier than a naïve planning assumes**
> *Probability* **High** · *Impact* **I3** · *Owner* **project**

**What it is.** It is declared by the security area as **the single highest-effort element of the entire catalogue**. Versioning of entities **does not render immutable**, and the requirement requires layers covering different threats - application chain, append-only archive, storage with separated privileges, periodic signed anchoring - plus blocking write, chain per tenant, verification procedure and export procedure.

**How it has already materialised.** It is the cause of cut `TG-23`: `RU-1` delivers the **complete coverage** and **two out of four layers**, without periodic signed anchoring. Coverage could not be cut ([03 §5.4](./03-primo-rilascio-utilizzabile.md)); the layer could, with the declared consequence of being **irreversible for the period**.

**Anticipatory indicator.** A planning that treats the register as a property of a persistence layer instead of as a component with its own lifecycle.

**Response.** *Reduce*: coverage is an explicit completion criterion of `T-08` and a blocking release criterion, so is not compressible even under pressure. *Accept and declare* the reduction of one layer, with `OL-21` in third position in the queue.

> **`R-27` - Reproducible build is not obtained**
> *Probability* **Medium** · *Impact* **I2** · *Owner* **project**

**What it is.** Two builds of the same revision on different executors must produce identical artefacts. It is the sole verification that establishes that the distribution corresponds to the published source, and is therefore the technical foundation of the separation between repository and distribution of `D17`. Obtaining it requires checking every source of non-determinism, and the first measure typically fails.

**How it has already materialised.** It is the cause of cut `TG-14`: verification is reduced to the **main service artefact**, and is a blocking criterion on that perimeter. The reduction is declared in the release dossier, because it determines what whoever installs can verify.

**Anticipatory indicator.** The first comparison of digests between two different executors that is not performed because "it's the same anyway". Reproducibility is not a property one assumes: one measures it, and conserves the outcome.

**Response.** *Reduce*: the verification on the main artefact is a blocking criterion and does not enter the sacrifice order. *Accept* the scope reduction, with `OL-20` in the queue.

### 2.5 Supply chain and licences

> **`R-08` - An embedded component has an incompatible licensing regime**
> *Probability* **Medium** · *Impact* **from I2 to I4** · *Owner* **`COMP`**, with `TECH`

**What it is.** A component enters the distinta with a licence not compatible with that of the project, or with a "source available" licence with restrictions on supply as a managed service to third parties. The case already detected concerns the advanced features of the time-series extension (`Q-112`), and is `[NV]` awaiting verification on the primary licence text.

**The principle that renders the risk recurring.** A licence declaration appended to a container **does not dispose of third-party rights on the content comprised**: verification must be done artefact by artefact, on the primary licence.

**Anticipatory indicator.** A component that appears in the bill of materials and not in versioned annotations.

**Response.** *Avoid* by construction with the licence check in the pipeline, which is **amongst the blocking controls from day one** and not amongst those in reporting only (`T-03` criterion 2), precisely because it safeguards a public prohibition.

> **`R-09` - Licenced terminology content enters the public repository**
> *Probability* **Low**, safeguarded · *Impact* **I5** · *Owner* **project**

**What it is.** Some clinical terminologies have licences incompatible with a public repository and with the project licence: access to the content itself perfects the constraint. The impact is `I5` because **content published once is not withdrawn**: it can be removed from the current branch, not from the history or others' copies.

**Anticipatory indicator.** A request to add an entry to the terminology permit list that does not pass through the review provided for conformity material. Modification of that list **is a conformity matter**, not a configuration one (`V-191`).

**Response.** *Avoid*, with three cumulative measures: the project never downloads licenced content; the terminology check is **blocking from day one**; the system remains fully operational with those disabled (`V-03`). **A note of honesty on the third measure**: in `RU-1` the verification is **degenerate**, because the reduced perimeter contains no encoded content (`TG-05`). The property is declared, not yet proven on the case that counts, and `OL-20` returns it to real verification.

> **`R-25` - An exposed component has a release cadence exceeding update capacity**
> *Probability* **High** · *Impact* **I1 recurring, with security consequence** · *Owner* **project**, for release; **whoever installs**, for application

**What it is.** The relay node is the most exposed component of the architecture and has the highest release cadence. The same family of defects - circumvention of forbidden-address lists via canonicalisation or incorrect form comparison - has produced **six distinct vulnerabilities in eight years** on a mature component, four of them in the past eight months alone.

**Anticipatory indicator.** The distance between the minimum version declared by the project and the latest version published by the component, measured at each review.

**Response.** *Reduce* and *transfer with declaration* in the already-written allocation. The defence that depends on neither of the two is though another, and is the reason the risk remains `I1`: **egress network isolation of the relay is primary defence** and does not depend on code correctness; forbidden-address lists are defence in depth (`V-10`, `V-157`). The corresponding verification is `T-04` criterion 4, **not cut**.

### 2.6 Conformity path - now project risks

> **What has changed in this section.** With `D57` and `D58` the three items that follow **are no longer third-party risks with zero impact on the project**. They are ours, and the impact is recalculated on us. The state of fact remains unchanged: **today the product bears no CE marking**, is covered by no conformity declaration, and **no date in this register is a promise of marking** (`V-171`, `V-280`).

> **`R-30` - The role of manufacturer is not yet established**
> *Probability* **Registered** · *Impact* **I3, growing** · *Owner* **contracting party**

**What it is.** `D58` attributes to the project the role of manufacturer, and **the legal entity does not exist**. Multiple steps of the internal planning of [02 §5](./02-traguardi.md) formally presuppose it: the signature of a contract with a notified body requires a subject; the appointment of the responsible person for regulatory compliance requires a subject to appoint them; the registration of the economic operator requires a subject to register.

**Why the impact grows and is not constant.** Because it is class `B`: the duration depends on external administrative procedures and not on work capacity. Every week of delay **transfers integrally to the end of the chain**, and no increase of capacity recovers it. It is exactly the property that makes `T-14` the second milestone of the calendar and not the last.

**What the risk is not.** It is not a risk on the product: `RU-1` is built and published without. It is a risk on planning beyond 2026.

**Indicatore anticipatorio.** Passage of **19 September 2026** without a decision on `Q-280` and without the date of beginning of the constitution procedure being recorded (criterion 1 of `T-14`).

**Response.** *Reduce*, by anticipating what can be anticipated: **the request for information to notified bodies does not require the established subject** and is sent before (criterion 3 of `T-14`), because the queue is the actual constraint. *Accept* the duration of the procedure, which does not depend on us, and **declare it not estimable** instead of inventing it.

> **`R-06` - The times of notified bodies**
> *Probability* **High** · *Impact* **I3 on project planning** · *Owner* **project**

**What it is.** 51% of bodies take **13–18 months** from contract signature to certificate and 31% take **19–24**; at end 2025 the gap was 25,978 applications versus 13,953 certificates; the staffing of bodies is in **contraction** - minus 8% internal staff and minus 21% outsourcers - for the first time in over a decade. The arithmetic of `D44` follows: even signing by December 2026 the certificate does not arrive before January 2028 in the most favourable hypothesis, and realistically between June 2028 and June 2029.

**Why the impact is no longer null on the project.** In the earlier version this item had `I0` impact on the project, because the project did not engage bodies. **With `D58` we engage them**, and the traversal time enters our planning. The attribution changes; **it does not change the fact that it is an external dependency**, and therefore not compressible.

**Two things that must be stated because they are discovered late.** The first: **a new, micro manufacturer at first certification is not a priority customer** for a body with declining capacity, and must be factored into negotiation - **the profile described is us**. The second: the **time before being accepted** is not measured by any public survey, and is for that the most dangerous variable of the entire path.

**Anticipatory indicator.** The number of bodies contacted that reply with real availability, not with a price list, within a recorded term from the date of sending criterion 3 of `T-14`. If it is zero after the first round, the reference scenario of §5 of [02](./02-traguardi.md) is already lapsed and the table must be updated at the next review.

**Response.** *Reduce*: send the requests **before** the subject exists, ask for the calculation and not the price, ask for commitments on the times of single phases. *Accept* the duration. **It is no longer admitted to transfer with declaration**: there is no one else to transfer to.

> **`R-07` - Response cycles to non-conformities occupy the same people**
> *Probability* **High** · *Impact* **I3** · *Owner* **project**

**What it is.** From two to four cycles, each with a body queue. **They occupy the same people** who write the software and the documentation - which under `D54` is **one person** - and their duration does not depend on them.

**Why under `D54` and `D58` it is graver than before, and it is arithmetic.** In the earlier version it was work of an external manufacturer with indirect effect on the project. Now it is **our work**, performed by the same capacity that produces software, and the overlap is total: a non-conformity cycle **stops development**, it does not slow it.

**Why it is not estimable.** Because the number and severity of findings depend on the quality of the dossier and the body. Two cycles or four is the same planning with costs differing by a factor of two. **It must be entered as a declared reserve, not omitted**: a plan lacking a reserve for non-conformity cycles assumes the best outcome as the expected one. It is the question `Q-188`.

**Anticipatory indicator.** The outcome of the completeness check of the application: a request for supplementation at that stage anticipates a number of cycles above the mean.

**Response.** *Reduce*, with the measures the source indicates as effective: ask for the calculation not the price, ask for a preliminary review at cost when offered, **compare the total not the tariff**. *Accept* with declared reserve, according to the decision of `Q-188`.

### 2.7 Risks depending on counterparties

> **`R-10` - Structural dependency on a single integrator**
> *Probability* **High** · *Impact* **I4 on scope, I2 on calendar** · *Owner* **contracting party**

The risk is described at length in §4, because its treatment requires more space than one register entry permits and because its countermeasure is architectural.

> **`R-11` - Test environments and counterparties not available**
> *Probability* **High** · *Impact* **I3 on the items depending on them, I0 on the rest** · *Owner* **contracting party**, for counterparty search

**What it is.** Four capabilities require something the project does not possess: pre-production environments and credentials for national digital identity; a real integration engine for hospital messaging; a counterparty server for application launch in clinical context; a real measurement gateway to verify whether it exposes the two signals required by the security model (`Q-122`, `B-9`).

**The consequence that is not integration but security.** Without the periodic signal independent from measurement and without the device status telemetry, the taxonomy of silence loses two technical categories out of seven: the system does not distinguish "the device did not measure" from "the device did not transmit", the remaining silence dilutes, empty contacts grow and with them the operator's alarm fatigue.

**Anticipatory indicator.** The time elapsed from the first request for access to a test environment without reply. It is the sole available indicator, and must be recorded from first request.

**Response.** *Reduce*: the capabilities depending on them are classified `[CONDITIONAL]` in [04 §3](./04-oltre-il-primo-rilascio.md) and **are not on the first-release path**, so their unavailability does not block the rest. *Accept* for the residual part, assuming cautiously that the cause of measurement absence is marked **not determinable** instead of being inferred.

---

## 3. External dependencies, family by family

An external dependency is not a risk: it is a **structural condition**. The risk is what happens when it is put on the critical path. This section lists the families, states who controls them, and - the part that counts - **what the project has done not to be blocked by them**.

| Family | Who controls it | What depends on it | How the project avoids being blocked |
|---|---|---|---|
| **Functions requiring a distinct subject** | The market for professional services, and a spending decision | Release review, internal audit, independent configuration verification, external review of critical security code | **It does not avoid it.** It is the sole family for which no degraded mode exists: it is acquired or the gap is declared. `R-29`, `Q-189`, `OL-22` |
| **Administrative procedures of subject establishment** | Administration | Every step of the conformity path presupposing the manufacturer | Activities not requiring the established subject are anticipated: requests for information are sent before (`T-14` criterion 3). `R-30` |
| **Notified bodies** | Third parties designated | The conformity calendar of [02 §5](./02-traguardi.md) | No **product** milestone depends on it: `RU-1` is built and published without. `R-06` |
| **National and regional documentary infrastructures** | Administration | `OL-07`; submission of documents | Canonical dataset and substitutable serialisation (`V-07`, `V-136`). The wait costs zero |
| **National digital identity federation** | Administration and providers | `OL-08`; the channel with no external dependencies is completable alone | Conformity **verifiable in continuous integration**, not accreditation (`V-05`). The service provider is whoever installs, **and `D58` does not change it** |
| **Licenced terminology** | Rights holders | Validation of part of the bindings | The system is **fully operational without** (`V-03`). In `RU-1` the property is declared and verified only in degenerate form (`TG-05`) |
| **Third-party components** | Community and vendors | Every distributed artefact | Distinta generated, register annotated, fallbacks tested, network isolation as primary defence |
| **Contributors** | None | Everything | Foundations guide, environment bootable on disconnected machine, documents as code |
| **Integration counterparties** | Integrators and entities | `OL-09`, and measurement of informational loss in translation | Contracts and tests published in both directions; no conformity declaration without real test |

### 3.1 The common rule, and the family that violates it

All families are treated with the same scheme:

> **Every external dependency lives behind an extension point with declared contract, has a tested degraded mode, and the degraded mode is the default configuration of the test suite.**

The last clause is what renders the rule effective instead of exhortatory. A degraded mode that does not run in the tests is a code branch never executed, which will fail the first time it is needed.

**The first family of the table does not admit a degraded mode, and must be stated without attenuation.** There is no degraded version of a review: **either a second subject performs it, or there is none**. It is the reason `TG-20` is an irreversible cut and not a reduction, and the reason `R-29` has impact `I5`. No technical solution circumvents it, and presenting one would be the costliest form of regulatory debt: a recording formally present and substantively empty.

### 3.2 The dependency that no one treats as such

**Contributors.** It is the sole family whose owner is "none", and it is the one that decides whether everything else happens - **and under `D54` is also the one that would resolve two risks at once**, `R-02` and `R-29`, because a second continuous contributor is together continuity and a second subject.

The measures listed exist for a precise reason: a project requiring a powerful machine, access to a third-party service or unwritten prior knowledge **selects its own contributors** without declaring it. It is the reason the memory and disk consumption of the local environment, today not measured (`Q-191`), is not a technical curiosity but a **programme dependency**: without a declared minimal practicable profile, the condition enabling external contributor participation is not verifiable, and the objective of `D35` remains an intention.

---

## 4. The risk of dependency on a single integrator

### 4.1 How it presents itself

The risk **is not** that an important integrator exists: it is entirely normal that one exists before others. The risk is **structural** and consists in a progressive drift in which the product stops being a component integrable by many and becomes a component of one, without anyone having decided it and without it appearing in any document.

The drift has a recognisable form and is completed in five steps, each of which is locally reasonable:

1. A configuration obtains a **default value** that corresponds to what serves a sole interlocutor.
2. An integration test is written against a **sole** set of hypotheses, and passes.
3. An interface choice is made to **avoid a change** to the counterparty system, instead of for its correctness.
4. A domain term of the interlocutor enters the **model** or the documentation.
5. The queue of priorities is ordered by their requests, and items not concerning them descend without the criterion being applied.

At the fifth step the product is no longer multi-integrator: it still is in the code, no longer in the behaviour. And the lost property is not recovered by adding a second integrator: it is recovered **by remaking** what has been built on hypotheses that held for one only.

### 4.2 Why `D53` and `D54` aggravate it

It must be stated, because it is the variation of this revision. A reduced scope is **easier to bend to a sole interlocutor**: with a sole integration surface (`TG-02` has cut the second), a sole event consumer (`TG-04`), session initiation by referral instead of embedding (`TG-03`), the choices to make are few and each has a natural candidate - **the one serving the sole interlocutor testing the product**. And the review that should intercept it is self-review (`R-29`).

It follows a consequence on the indicator, found in §4.4 and which is the sole operational variation: monitoring cannot rest on peer review, because there is none.

### 4.3 The countermeasures, which are architectural and verifiable

The project does not face this risk with a declaration of intent. It faces it with properties of the system that verify automatically.

| Countermeasure | How it is verified |
|---|---|
| **Multi-tenancy by construction**, with single-tenant installation as the degenerate case of the same code | Tests of isolation that actively attempt unauthorised access, for every context and every interface |
| **No logic hardcoded on an interlocutor**: multiple integrators coexist on the same installation, each with own keys, own event delivery and own traffic limits | Configuration per tenant; absence of conditional branches on counterparty identity |
| **Sole trust register per tenant**, with explicit capabilities per entry | Operative lists **derived** from source, never drafted by hand |
| **Work by reference** on the identifiers of the system of origin, with versioned registry of system identifiers | No external identifier is a primary key; normalisation at boundary, never in the domain (`V-142`) |
| **Declared public contract**, with closed perimeter of what is contract and what is internal (`V-160`) | Contract tests in **both directions**; dismissal with declared notice |
| **No capability reachable only from the interface** (`V3`, `V-164`) | The project's interface consumes the same application interfaces offered to integrators |

To these the present chapter adds one verification measure, which is the sole one intercepting the drift **before** the fifth step, and is posed as constraint `V-188`:

> **The integration test suite always exercises at least two tenants and two distinct integrators**, with deliberately divergent configurations - different identifier attribution domains, different exit profiles, different event delivery modes. A test that passes with a single integrator configured does not demonstrate the property one wants to demonstrate.

**`V-188` did not enter any cut, and it is deliberate.** It would have been an obvious candidate for reduction - two configurations cost more than one - and was excluded because it is the **sole automatic countermeasure** to §4.2, now that peer review does not exist.

### 4.4 Anticipatory indicator, and what remains to be decided

**The indicator, reformulated under `D54`.** In the earlier version it was "a change proposal that introduces a default value, a domain term or a test attributable to a sole interlocutor, observable in review". **Under `D54` review is self-review**, and an indicator depending on an independent reviewer is not observable. The indicator therefore becomes automatic, and is **the number of distinct configurations exercised by the integration test suite**: if it drops to one, the fifth step has already begun. It is measurable at every build and requires no one to look.

**What remains to be decided, and it is the contracting party's.** To what degree of concentration the dependency is acceptable, and at what moment the project must procure itself a **second test counterparty** - which can be a second real integrator, an entity, or a reference implementation built for purpose. It is the question `Q-187`.

**A redactional rule following from rule `R0`.** No document, commit, report, change proposal or public material of the project names companies, commercial products, brands or domains of potential partners. This risk, in particular, is described **structurally** - "an integrator", "the counterparty", "the system of origin" - and never by name.

---

## 5. How the register is monitored

### 5.1 Cadence and form of review

The register is reviewed in the **periodic review** of [00 §8](./00-indice.md), with outcome recorded even when the outcome is "no variation". For each open risk the review produces four pieces of information and not one more:

1. **The state of the anticipatory indicator**: observed or not observed. Never "improving".
2. **Variations of probability or impact**, with reason. A variation without reason is an impression.
3. **The state of the response**: implemented, under implementation, not implemented. If not implemented, **why**.
4. **The duration**, for risks with probability *Registered*: for how many days the condition persists. It is the sole way to prevent a registered condition from becoming normal - and **seven items in this register are `Registered`**: `R-02`, `R-04`, `R-05`, `R-12`, `R-19`, `R-29` and `R-30`.

**The cadence changes in the last six weeks.** From 19 October 2026 the review is **weekly** and has content reduced to two numbers: **remaining lines of the sacrifice order** and **blocking criteria of `RU-1` satisfied**. It is the countermeasure to `R-28`, and monthly review on a plan lacking margin observes the phenomenon when it is finished.

### 5.2 When a risk closes, and when it does not

A risk closes **only** if the condition producing it has been removed, and the removal is verifiable. It does not close because it did not materialise, because the milestone that it affected has passed, or because no one cites it any more. A risk whose response is *accept* **is not closed**: it is accepted, remains in register, and its acceptance is a registered decision with an owner.

**`R-01` is the sole closed item in this register**, and §2.1 declares both the reason for the closure and what **has not** closed with it. It is the model every future closure must follow: closing a risk without declaring what remains is the quickest way to make it reappear without a name.

### 5.3 When a new risk enters

A risk enters when it is formulated with all the elements of `V-189`: what it is, probability per the scale of §1.2, impact on calendar per the scale of §1.3, **observable anticipatory indicator**, response among the four admitted, named owner. A report lacking an indicator or lacking an owner is not a new risk: it is a concern, and must be reformulated.

**The triggers of unscheduled review** are those of [00 §8](./00-indice.md), and three regard this register directly: materialisation of a risk; passage of an irreversible decision point without decision; and - new with `D53` - **consumption of a line of the sacrifice order**, which forces review of `R-28` and the affected milestone.

---

## 6. What is not in this register

| Matter | Where it lives | Why not here |
|---|---|---|
| Risks to care recipient safety | [`docs/08_compliance/05-gestione-del-rischio.md`](../08_compliance/05-gestione-del-rischio.md) | They have their own scale, discipline and verification of effectiveness. Mixing them would make a clinical risk seem negotiable |
| Dangerous use scenarios and usability engineering | Usability engineering dossier, in `docs/08_compliance/` | They are use risks, not programme risks |
| Threats to system information security | [`docs/06_security/`](../06_security/00-indice.md) | They have their own threat model and abuse tests |
| Allocation of measures between supplier and customer | [`docs/06_security/09-ripartizione-delle-responsabilita.md`](../06_security/09-ripartizione-delle-responsabilita.md) | It is a responsibility table, not a risk table |
| Scope exclusions | [`docs/03_functional/07-fuori-perimetro.md`](../03_functional/07-fuori-perimetro.md) | A decided exclusion is not a risk: it is a boundary |
| **Scope cuts and their reversibility** | [03 §5](./03-primo-rilascio-utilizzabile.md) | A decided and declared cut is not a risk: it is a **fact**, with its consequence written. The risk is that others are made without recording, and it is `R-28` |
| Debt technical and regulatory already contracted | [01 §§7–8](./01-principi-e-metodo.md) | They are not risks: they are **facts**, with a list that declares them |

---

## 7. Noticeboard

### 7.1 The constraints posed by this area

| # | A | Constraint |
|---|---|---|
| `V-187` | all | An item is not **planned** if it lacks together binary completion criterion, declared trigger and named owner. In the absence of even one of the three it is **desirable**, and must be marked as such in every material |
| `V-188` | `TECH`, `INTEG`, `ARCH` | The integration test suite always exercises **at least two tenants and two distinct integrators**, with deliberately divergent configurations |
| `V-189` | all | Every programme risk has an **observable anticipatory indicator** and a **named owner** |
| `V-280` | all | **Reformulation of `V-180` in light of `D57` and `D58`.** The roadmap is **project's internal planning** and the owner of milestones is the project, including those on the conformity path. The sole non-declarable dates are those the regulation places on a different subject - the individual user's adaptation term, the service provider's accreditation. **A date of internal planning is not a promise of outcome**: no material states that the product will be marked by a date (`V-171`) |
| `V-281` | all, in particular `COMP` | **No milestone enters the plan if it requires two distinct subjects and the second does not exist.** The resulting recording is declared as a **gap, with the date it was born**, and is not planned as an activity |
| `V-282` | all | **Scope is the sole free variable.** With date and capacity fixed by `D53` and `D54`, every deviation is absorbed **by reducing scope** per the sacrifice order declared in [03 §6](./03-primo-rilascio-utilizzabile.md), which contains **only reversible cuts**; never by shifting the date in silence, never by compressing a blocking release criterion. If the order is exhausted, **the date is declared missed with reason recorded** |

### 7.2 The open questions from this area

| # | A | Question |
|---|---|---|
| `Q-183` | `COMP` | Which evidences of the **regulatory package** are deliverable and which are not. Determines the scope of `T-12`, and with `D58` also determines what the **our** path dossier will contain |
| `Q-184` | `SEC`, `ARCH` | Temporal coordination on expected service levels: the **measurement capability** is a first-release requirement, the **values** are determined before first operation |
| `Q-185` | `PROD`, → **ORCH** | Public material not aligned to `D19` and `D29`; the impact is **irrecoverable**. Reconciles with `Q-174` and with `Q-281` |
| `Q-186` | `COMP`, `TECH` | **Declared support period.** Prerequisite of first distribution and blocking criterion of `RU-1` |
| `Q-187` | → **ORCH** | **Acceptable concentration on a sole integrator** and moment of the second test counterparty. Aggravated by `D53` and `D54` (§4.2) |
| `Q-188` | `COMP`, → **ORCH** | **Declared reserve for non-estimable items.** With `D58` the response cycles to non-conformities are our work and occupy the same capacity that produces software: the reserve is no longer a chapter of someone else's plan |
| `Q-189` | → **ORCH** | **Allocation of recordings with distinct roles.** Which subset is accepted as declared gap and which is covered by external acquisition. Decision point: **30 September 2026**; default outcome in absence of decision: declared gap on `RU-1`. `R-29`, `TG-20`, `OL-22` |
| `Q-280` | → **ORCH** | **Establishment of the manufacturer subject** (`D58`): legal form, beginning of the procedure, profile and finding of the responsible person for regulatory compliance. It is **class `B`** - few hours and many months - and every week of delay transfers integrally to the end of the chain. Decision point: **19 September 2026**. `R-30`, `T-14` |
| `Q-281` | `PROD`, → **ORCH** | **The difference between what public material states and what `RU-1` delivers.** At the release's publication the distance becomes verifiable by anyone: the approved formulation that declares it is needed, with the same prominence as the list of features. It applies in particular to capabilities cut by `TG-01`, `TG-02` and `TG-03`. Decision point: **31 October 2026**. `R-19` |
| `Q-282` | `COMP` | **Form of the declaration of gaps dated in the dossier.** Which recordings are **dated to a period** and therefore irrecoverable - release review, internal audit, formative usability evaluation, register anchoring - and in what form their absence must be declared in the technical dossier so it is recognisable as a declared gap and not an omission. **`Q-189` decides the allocation, this question decides the form**: they are complementary and neither substitutes the other. `TG-20`…`TG-23` |

### 7.3 Contribution to question `Q-191`, for the part of this area

> *"Memory and disk consumption of the local environment: not measured. A measurement on a declared reference machine is needed and the declaration of the minimal practicable profile."* - `GUIDE` → `TECH`, `ROAD`

**Response for the roadmap part.** This area **does not produce the measurement**, which is `TECH`'s, and does not choose the reference machine. It does declare though the placement: the measurement and the declaration of the **minimal practicable profile** are a criterion of the build chain (`T-03`) and not a later activity.
Until the minimal profile is declared, the **contributors** dependency of §3.2 **has no verifiable condition**, and `R-02` has no anticipatory indicator for the component "entry of an external contributor" - a risk without an indicator violates `V-189`.

**Under `D54` the question changes weight and must be stated.** An external contributor is no longer a sole accelerator: it is the **sole path by which two risks close together**, `R-02` for continuity and `R-29` for the second subject. The unmeasured entry barrier is not therefore a detail of development ergonomics: it is **the variable that holds open the risk with `I5` impact in this register**. **Remains open towards `TECH`** for the measurement.

---

**End of area.** The reading path for the contracting party closes here:
[01 §11](./01-principi-e-metodo.md) on declared capacity, [02 §§2 and 6](./02-traguardi.md) on the decision taken and irreversible decision points,
[03 §5](./03-primo-rilascio-utilizzabile.md) on what has been cut and what will not return, and this chapter. The questions explicitly requiring a contracting party decision are `Q-185`, `Q-186`, `Q-187`, `Q-188`, `Q-189`, `Q-280` and `Q-281`.

> **Permanent caveat.** No risk in this register, however mitigated, and no milestone in this roadmap, however reached, changes the state of fact: **today the product bears no CE marking**, is covered by no conformity declaration, and **no distributed artefact is usable for the delivery of healthcare services to actual patients** (`D16`). The repository is source code under a permissive licence, **not a medical device**. That the project intends to assume the role of manufacturer (`D58`), with the entity still to be established, is **internal planning**: it is not a marking date (`V-171`, `V-280`), does not cover any current installation and does not remove any obligation from whoever installs, integrates or places into service the software. The liability towards the injured party **is not excludable by contract**. The statements that attest to the state of fact are published in
[`NOT-A-MEDICAL-DEVICE.md`](https://github.com/fedcal/Telemedic/blob/main/NOT-A-MEDICAL-DEVICE.md) and in
[`DISTRIBUTION-POLICY.md`](https://github.com/fedcal/Telemedic/blob/main/DISTRIBUTION-POLICY.md).
