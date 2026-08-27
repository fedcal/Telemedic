---
title: Post-market surveillance and vigilance
sidebar_position: 9
description: "Two processes with opposite logics: surveillance, which detects, and vigilance, which reports. The Annex III plan translated into product capabilities, the indicators and thresholds that reopen the risk file, the periodic safety update report and the problem of the open model, serious incidents and deadlines, field corrective actions, the two-speed model of changes, who holds the obligations when the software is open now that the project intends to assume the manufacturer role with the legal entity still to be constituted, and the connection with security incident response, which has different clocks."
---

# Post-market surveillance and vigilance

> **What this chapter does not contain.** It does not contain the notification deadlines of the
> cyber security and data protection regimes: they are in
> [06 §10 - Incident response](/06_security/10-risposta-agli-incidenti.md), with the four clocks
> and the fifth, the moment from which the period runs upon the acquisition of the evidence, and
> the capabilities the product must provide. **That chapter is not to be restated here.** § 9 of
> this chapter adds to it the one missing perspective, which is that of the device manufacturer.
>
> **Warning governing the whole chapter, to be read before any deadline.** **The product bears no
> CE marking**, **is covered by no declaration of conformity** and **cannot be used to deliver
> healthcare services to real patients**. **No marked identified distribution exists**, and
> therefore **no surveillance system is in operation**: no Annex III plan is instituted, no
> periodic report has been produced, no reporting channel to the authority is open. This is the
> state of fact from which the chapter starts, and no line of what follows softens it.
>
> **The holding of the obligations does not change; who will hold them changes.** Surveillance and
> vigilance fall on the **manufacturer of the CE-marked identified distribution** - it is
> constraint [`V-06`](../11_registri/01-vincoli-in-vigore.md#v-06), and `D58` does not touch it in this part. What `D58` changes is that the
> project **intends to assume** that role, and that **the legal entity that would exercise it is
> still to be constituted**: the obligations of §§ 2–7 do not fall on the project today because
> neither the entity nor the marked distribution exists, not because they concern somebody else.
> § 8 states who holds them and in what dual capacity the project relates to them.
>
> **The operational consequence is the sole reason this warning stands at the head.** From the
> moment those obligations become ours, the **product capabilities** that make them materially
> satisfiable - a stable taxonomy of the events counted, retention of diagnostics equal to the
> vigilance window, traceability of the versions installed, indicators that close onto rows of the
> risk register - cease to be a service rendered to a third party and become **infrastructure of
> our own path**. They must therefore be **built, not merely documented**, and they must be built
> before they are needed: none of them is recoverable after the fact, because they count events
> that in the meantime have already happened or not happened (§ 5.2, [`V-178`](../11_registri/01-vincoli-in-vigore.md#v-178); § 3).
>
> **And the gap this warning could open, closed here.** Whoever reads that the project intends to
> assume the manufacturer role and concludes from it that there is a surveillance covering it
> draws a **wrong** conclusion, and in this chapter the error is particularly insidious because
> surveillance is precisely the safeguard that is supposed to be active when it is not. **Nobody
> is surveilling today's deployments**: there is no channel to the authority, there is no periodic
> report, there is no field safety notification obligation that anybody is discharging. Whoever
> deploys, integrates or puts the software into service today assumes in full the resulting
> obligations - **and, if they build a device and place it on the market, they are the manufacturer
> of that device** (§ 8.1), with the obligations of §§ 2–7 upon them. The project's intention
> removes none of them.
>
> **On the deadlines this chapter contains.** They are **regulatory deadlines of the vigilance
> regime** - hours and days from becoming aware of an event - and contractual obligations towards
> the user: they are not the project's dates and they imply none. Constraint [`V-171`](../11_registri/01-vincoli-in-vigore.md#v-171) prohibits
> asserting or implying that the product will be marked by a deadline, and this is the only
> admitted occurrence of that word in that sense. The project's dates are solely in
> [09](./09-percorso-e-calendario.md) and are internal planning (`D57`).

## 1. Two processes with opposite logics

Surveillance and vigilance are confused continually, and the confusion produces two symmetrical
failures to comply: a plan that exists and produces no data, and a deadline that runs without
anybody noticing.

|  | **Post-market surveillance** | **Vigilance** |
|---|---|---|
| Basis | Articles 83–86 and Annex III of Regulation (EU) 2017/745 | Articles 87–92 |
| Trigger | **None**: it is a continuous and proactive process | An **event**: a serious incident or a field safety corrective action |
| Logic | To collect and systematically analyse experience from the field | To report to the authority within very short deadlines |
| Horizon | Continuous, with periodic reports | **Hours and days** |
| Output | Plan, periodic report, update of the risk register and of the clinical evaluation | Incident report, trend report, safety notice, corrective action |
| Typical error | The plan exists and **produces no data** | The deadline runs and nobody notices, because the moment of acquisition of the evidence is missing |

**The connection between the two.** Surveillance is the process that **detects**; vigilance is the
process that **reports**. A surveillance system that does not feed vigilance produces failures to
comply; a vigilance without surveillance upstream reacts only to what somebody else brings to it -
that is, it always arrives after the event, and always through a channel it does not control.

## 2. The surveillance plan, translated into product capabilities

**Article 83** requires a surveillance system to be instituted, documented and maintained
**proportionate to the risk class and to the type of device**, as part of the quality management
system. **Article 84** requires the system to be based on a **plan** conforming to **Annex III**.

The minimum content of the plan deserves an operational reading, because each item has a technical
consequence that must be designed beforehand and not afterwards.

| Item of the plan | Technical consequence for this product |
|---|---|
| Data collection process | Define the **sources**: complaints, user reports, support records, service availability and quality data, security reports, literature, public databases on similar devices |
| **Indicators and threshold values** for the reassessment of risk | They are numbers and they must be chosen (§ 3). **Every threshold exceeded reopens the risk register** |
| Methods of investigating complaints and field experience | Root cause analysis procedure, with a declared response deadline |
| Methods and protocols for events subject to a **trend report** | § 5 |
| Methods of communication with users and distributors | Safety notice channel and **list of recipients kept up to date** |
| Reference to the procedures for complying with the obligations of Articles 83–86 | Cross-reference to the quality management system procedures |
| Systematic verification of preventive and corrective actions | Register of actions **with verification of effectiveness**, not of execution alone |
| **Traceability tools** | Unique identifier, register of the versions installed, capacity to know **who has which version** |
| Clinical follow-up plan or rationale for its non-applicability | Chapter [07 §7](./07-valutazione-clinica.md) |

**The two rows in bold are not resolved with a procedure: they require a product capability and a
contractual obligation.** The thresholds require the data to exist and to be comparable across
deployments and over time; the traceability of versions requires knowing which deployments exist
and which version they are on - and in an open distribution model **that datum does not exist by
construction**. That is § 8.2.

## 3. The indicators and the thresholds: numbers, not intentions

A plan without numerical thresholds is not a surveillance plan: it is a statement of intent that
makes it impossible even to notice that something is getting worse, because "significant increase"
without a predefined threshold is a judgement that can be formulated only after the fact - and
after the fact means after the event has happened.

The plausible thresholds for this product derive directly from the rows of the risk register of
chapter [05 §6](./05-gestione-del-rischio.md), and that is how they must derive: **an indicator
that does not close onto a row of the register is surveilling something nobody has classified as a
risk**.

| Indicator | Risk row surveilled | What exceeding it triggers |
|---|---|---|
| Frequency of **interrupted sessions** and of services not completed for technical reasons | `RM-02` | Review of the operating environment requirements declared in the instructions for use |
| Frequency of **alerts not responded to** within the declared window | `RM-13`, `RM-12` | Review of the declared coverage hours and of the escalation chain |
| Frequency of **measurements not received** and duration of the silence | `RM-01` | Review of the waiting windows and of the taxonomy of silence |
| **Predictive value per rule** and volume of alerts per operator | `RM-11` | Review of the thresholds: fatigue is itself a risk |
| Frequency of **association errors** reported | `RM-03`, `RM-09` | Review of the identification path and of the change of subject |
| Frequency of **clinical documents left in a non-transmitted status** | `RM-08` | Review of the transmission statuses and of the confirmations that the recipient has taken them on |

**Two constraints the technical area has already laid down and that hold here without
attenuation.** No raw cumulative counter may be cited as an indicator: loss, bytes, freeze duration
and buffer delay grow monotonically and must be differenced between consecutive samples ([`V-113`](../11_registri/01-vincoli-in-vigore.md#v-113)).
And the composite session quality index is proprietary and must be declared as such ([`V-114`](../11_registri/01-vincoli-in-vigore.md#v-114)):
using it in a periodic report while presenting it as a recognised measure would be an unfounded
statement within the meaning of [`V-171`](../11_registri/01-vincoli-in-vigore.md#v-171).

**A threshold exceeded is not an operational alarm: it is the reopening of a file.** The declared
consequence must be written into the plan for each indicator, and it must be an activity with a
responsible party and a deadline - not "it shall be assessed".

## 4. The periodic safety update report

For Class IIa, **Article 86** requires a periodic safety update report, updated **at least every
two years**. It summarises the results and conclusions of the analysis of the surveillance data,
the rationale for and the description of the preventive and corrective actions taken, the
conclusions of the determination of the **benefit/risk ratio**, the main findings of the **clinical
follow-up** and the **sales volume** with an estimate of the population using the device and the
frequency of use where practicable.

`[NV]` - the allocation across the paragraphs of Article 86 by class, and in particular the manner
of transmission and the addressee for Class IIa, must be verified against the consolidated text
before the procedure is written.

### 4.1 Sales volume is a structural problem of the open model

A manufacturer that distributes for consideration knows its own customers. A manufacturer whose
distribution is obtainable from a public repository **does not know them**, and not out of
negligence: by construction.

From this follows a direct regulatory consequence for the **distribution policy**, and it must be
decided early because it conditions the release model. The identified distribution of `D17` is not
a traceability formality: it is **the sole condition under which the periodic report can be
compiled** and under which the version traceability of Annex III can be satisfied. If the certified
distribution were obtainable anonymously, two mandatory items of the report would remain empty and
the gap would not be remediable after the fact.

It is question [`Q-177`](../11_registri/02-questioni-aperte.md#q-177), addressed to the project owner, and it must be kept distinct from a
licensing choice: **the repository remains public and open** (`D51`); what is being decided is
whether the **marked distribution** - which is a different artefact, with a different name and a
different lifecycle - is available only through a channel that identifies the recipient.

## 5. Vigilance: serious incidents, deadlines, and the difficult causal link

**Article 87** requires any **serious incident** relating to devices made available on the Union
market to be reported to the competent authorities.

| Case | Deadline |
|---|---|
| Serious incident in general | **no later than 15 days** from becoming aware |
| **Death** or **unanticipated serious deterioration** in the state of health | **no later than 10 days** |
| **Serious public health threat** | **immediately**, and in any event **no later than 2 days** |

`[NV]` - the deadlines are verified; the correspondence with the paragraph numbers of Article 87
must be confirmed against the consolidated text. The definition of **serious incident** is in
Article 2, point 65: an incident that directly or indirectly led, may have led or may lead to the
death of a patient, of a user or of other persons, to the temporary or permanent serious
deterioration of their state of health, or to a serious public health threat. `[NV]` on the number
of the point.

**The operational point that determines everything is when the deadline starts running.** It runs
from **becoming aware** of the event and of its **possible** link with the device, not from
certainty of the link. It follows that one cannot wait for the outcome of the technical
investigation before reporting: **the initial report is made on the hypothesis**, and is
supplemented afterwards. A process built on "first we understand, then we report" produces
systematic failures to comply, and it produces them precisely in the gravest cases, which are the
ones in which the investigation takes longest.

### 5.1 Why for this product the causal link is particularly difficult

The clinical consequences of this system are **almost all indirect**: there is no physical action
on the person, there is information that arrives late, wrong, or that does not arrive. Establishing
that a missed service, an alert not responded to or a clinical report not transmitted contributed
to a deterioration requires two things together:

1. **reconstructing the technical sequence**, which lies in the deployment's logs;
2. **obtaining the clinical information about the outcome**, which lies with the care provider
   organisation and **not** with the manufacturer.

The vigilance procedure must therefore provide for a **channel towards the user** in order to
obtain the second element, and it is a provision that is **contractual before it is technical**: no
product capability substitutes for it, because the clinical datum about the outcome is not in the
product and must not be.

### 5.2 Trend reports and periodic summary reports

Two instruments that get confused and that serve opposite purposes.

- The **trend report** of **Article 88** concerns **non-serious incidents** and expected
  undesirable side-effects which, taken individually, are not reportable, but whose **statistically
  significant increase** in frequency or severity affects the benefit/risk ratio. It is the reason
  why the plan must contain numerical thresholds (§ 3).
- The **periodic summary report** is instead an **alternative mode of reporting** similar and
  recurrent serious incidents whose root cause has been identified and for which a corrective
  action has been implemented, or which are common and well documented: transmission in aggregate
  rather than individual form is agreed with the competent authority. The paragraph providing for it
  and the exact conditions `[NV]` must be verified by `Compliance`.

**The first is a product capability, the second is an agreement with the authority.** And it is the
first that imposes a requirement on the project today.

> **[`V-178`](../11_registri/01-vincoli-in-vigore.md#v-178).** Two capabilities without which the vigilance obligation **is not materially
> satisfiable**, and which must be built before they are needed because they are not recoverable
> after the fact.
>
> **(a) Stable taxonomy of the events counted.** Non-serious events must be **counted comparably
> across deployments and over time**. It follows that the taxonomy of outcomes and events is
> defined now and **is not rewritten at every version**: renaming or merging a category makes the
> historical series incomparable and makes the significant increase disappear instead of detecting
> it. It is the application, on the vigilance plane, of what [`V-126`](../11_registri/01-vincoli-in-vigore.md#v-126) already requires on the domain
> plane.
>
> **(b) Retention of diagnostic signals at least equal to the vigilance window.** If an incident
> can emerge weeks later and the diagnostic logs last days, the reconstruction is impossible and
> the obligation is not satisfiable. **The retention period for diagnostics is therefore determined
> by the vigilance obligations, not by operational need**, and it is **distinct** from the periods
> in [`V-152`](../11_registri/01-vincoli-in-vigore.md#v-152) - twenty-four months for the traceability logs, twelve for access and authentication
> data - which answer to a different source and a different purpose.

**Determination of the value, which is what question [`Q-116`](../11_registri/02-questioni-aperte.md#q-116) asked for.** The minimum period is
derived by composition, not by choice: the maximum realistic latency between the event and the
user's report, plus the contractual period within which the user is bound to report to the
manufacturer, plus the investigation time needed to supplement the initial report. The project
proposes **twelve months** as a configurable default value for the diagnostic signals attributable
to a service or to an alert - not for the general application logs - and declares that **the final
determination is the manufacturer's**, because it depends on the contractual period the
manufacturer imposes on its own users. `[NV]` on the value: it is a reasoned proposal, not a
regulatory obligation, and no source fixes a period for diagnostics.

## 6. Field safety corrective actions

A **field safety corrective action** is the action taken by the manufacturer to prevent or reduce
the risk of a serious incident in connection with a device made available on the market; the
communication by which it is brought to the attention of users is the **field safety notice**. The
action must be **notified to the competent authority**, as a rule **before** it is carried out,
save in cases of urgency.

**What it is, concretely, for software.** It is the point that disorients those coming from
development, because it looks as though every fix is one. It is not, and the distinction must be
written into the procedure with criteria, not left to judgement in the moment.

| Situation | Regime |
|---|---|
| Correction of a defect **without** impact on safety or on clinical performance | Ordinary maintenance: change management and problem resolution |
| Correction of a defect **with** potential impact on safety, distributed to all deployments | **Corrective action**, with notification to the authority and notification to users |
| Change to the recommended configuration or to the limits of use in order to reduce a risk that has emerged | **Corrective action even without a software release** |
| Withdrawal of a version from the distribution channel | **Corrective action** |
| Cyber security advisory with an instruction to update | Assess **both** regimes |

**The last row has the shortest clock and must be designed before it is needed.** An exploitable
vulnerability in a component that participates in a risk control measure is **simultaneously** a
cyber security event, with deadlines in hours, and potentially a corrective action, with deadlines
in days. The process must produce **a single assessment with two outputs**, not two parallel
assessments that diverge: two assessments of the same vulnerability reaching different conclusions
are, before an authority, evidence of organisational disorder.

**Partial response to question [`Q-113`](../11_registri/02-questioni-aperte.md#q-113).** The commitment to update third-party components must be
expressed **in days from the publication of the advisory, differentiated by severity**, and not in
months: a monthly commitment is meaningless for a component that receives fourteen releases in
seven months. The formal home of that commitment is **here**, in the surveillance plan, and in the
**declared support period**, which is question [`Q-155`](../11_registri/02-questioni-aperte.md#q-155) and remains with the project owner. What
this area can fix without trespassing is the structure: assessment started by the working day
following publication, a reasoned decision recorded even when it is a decision not to update, and a
remediation window differentiated by severity with the value declared by the manufacturer and not
by the project.

## 7. Changes: the two-speed model

The structural conflict between the rhythm of software and the regulatory rhythm concentrates here.
**Annex IX** provides that changes to the approved quality management system and changes to the
approved device that may affect conformity, safety, performance or the conditions of use require
the **prior approval** of the notified body.

A **documented decision-making process** is therefore needed, not a case-by-case judgement. For
every change intended for a certified version it is decided, with written criteria and with
minutes, whether the change:

1. **does not affect** safety, performance or the conditions of use → it is documented and
   released;
2. **does affect** them but remains within the scope of the certificate → it is documented, the
   technical file is updated and it is declared to the body in the manner agreed;
3. **is substantial** → **prior approval** before release.

**A warning about the method in circulation.** The decision diagrams of **MDCG 2020-3** on
significant changes are widely used for devices certified under the regulation as well, but their
**proper scope is the transitional regime for pre-existing devices**: applying them by analogy is a
widespread and reasonable practice, **it is not a regulatory basis**. They must be presented for
what they are - a method adopted by the manufacturer, with a rationale - and the concrete
conditions must be **agreed in writing with the body** at the contractual stage. The declared scope and
the current revision of the document `[NV]` to be agreed with the notified body.

**Consequence for the release policy, which conditions versioning and the structure of the branches
and must be designed now.**

| | **Repository** | **Identified distribution** |
|---|---|---|
| Rhythm | Its own, without regulatory constraints | A slower cadence, with assessment of the changes |
| Licence and statement | Apache-2.0, with the permanent statement that **it is not a device** | An artefact with a manufacturer, a version and a lifecycle of its own |
| Configuration status | Version control history | **Configuration status record for every version** |
| Security fixes | As they come | **Off-cadence**, without opening the substantial change procedure - which requires them to be, **by construction, free of functional impact** |

The last cell is an engineering requirement, not a policy: a security fix that changes functional
behaviour **cannot be distributed off-cadence**, and discovering that at the moment of urgency
means having to choose between a failure to comply and a risk.

## 8. Who holds the obligations when the software is open

It is the question the dual model makes inevitable, and the answer must be written in such a way
that it remains ambiguous for none of the parties involved.

**The holder of the surveillance and vigilance obligations is the manufacturer of the CE-marked
identified distribution.** Not the repository, not whoever holds the project, not the contributors,
not the author of a derived copy that places nothing on the market. It is constraint [`V-06`](../11_registri/01-vincoli-in-vigore.md#v-06), and
§§ 2–7 of this chapter describe obligations that **do not fall on the project today**, because
neither a marked distribution nor the party that could be its manufacturer exists.

**What `D58` changes in that sentence, and what it deliberately does not.** It does not change the
**criterion of attribution**: the obligations follow the role, and the role follows whoever places
an identified distribution on the market. What changes is that the project **intends** to be one of
those parties - with **the legal entity still to be constituted** - and that therefore **§§ 2–7
describe obligations we shall assume**, not third parties' obligations that the project sets out as
a courtesy. The difference is not one of tone: it is that every line of those sections requiring a
product capability becomes **a requirement of ours with a logical deadline earlier** than the
moment at which the obligation is triggered, because a capability that counts events cannot be
switched on retroactively.

**The criterion nonetheless remains bidirectional, and this is the part that must not be lost.**
Anyone else who builds a device from this code and places it on the market is, by that very fact,
the manufacturer of that device, with the same obligations and without our intention to certify
removing any of them (§ 8.1). The two things coexist: the project has on the one hand a path of its
own to build, and on the other a position as an **upstream supplier** towards those who integrate
(§ 8.4), and the two capacities carry obligations of a different nature that must not be conflated.

Five consequences follow, all of them to be documented in the material for integrators
([07 §09 - Obligations of the integrator](/07_integration/09-obblighi-di-chi-integra.md)).

### 8.1 Whoever builds a device from the code **is** the manufacturer of that device

The regulation attributes the manufacturer's obligations to whoever modifies the intended purpose
of a device or modifies it in a way that may affect conformity. In the case of **unmarked** source
code, the question is not even one of modification: whoever builds a device from it and places it
on the market **is the original manufacturer** of that device.

The Apache-2.0 licence grants the right to use and to modify; **it neither transfers nor excludes
any regulatory obligation**, which is not available for disposal by contract. It is the same
structure as point 8.4.

### 8.2 The manufacturer must know what happens in the deployments, and with this model it does not

It must be resolved with **three combined measures**, and none of the three is sufficient on its
own:

1. distribution of the certified version through a **channel that identifies the recipient**
   (§ 4.1, question [`Q-177`](../11_registri/02-questioni-aperte.md#q-177));
2. **contractual obligation on the user** to report incidents to the manufacturer within a period
   compatible with those of Article 87 - that is, **shorter** than them, because the manufacturer's
   period runs from its own becoming aware, and a user who reports on the fourteenth day leaves one
   day in which to assess, investigate and report;
3. **product capability** to produce the technical evidence needed to reconstruct a sequence weeks
   later ([`V-178`](../11_registri/01-vincoli-in-vigore.md#v-178)).

### 8.3 Civil liability cannot be excluded by contract towards the injured person

The licence's warranty disclaimer and limitation of liability clauses operate **between the parties
to the licence relationship**. The rules on liability for damage caused by defective products
prohibit contractual exclusion towards the **injured person** and presume defectiveness in the case
of non-conformity with mandatory Union safety requirements
([01 §6](./01-inquadramento-normativo.md)).

**The licence clause is not, and never has been, a protection towards the injured person.** What
keeps the project outside those rules today is a **fact**: no identified distribution placed on the
market under its name exists, and no party exists that is its manufacturer. It is a distinction to
be held firm even when it is inconvenient, because relying on the clause produces exactly the
behaviour that causes the fact to be lost: publishing artefacts that give the impression of a
placing on the market.

**And `D58` must be stated here with particular clarity, because it is the point at which keeping
quiet about it is least advisable.** That fact is **temporary by our own choice**: the project
**intends** to assume the manufacturer role, and **the legal entity that would exercise it is still
to be constituted**. When it is, the rules on liability for damage caused by defective products
will apply to that entity **in full**, without any clause of the licence being able to exclude it
towards the injured person (Directive (EU) 2024/2853, Article 15). Two practical consequences
follow, and neither can be deferred: the safety decisions taken **today**, on a product that is not
yet a device, are the decisions that entity will answer for tomorrow; and the future manufacturer's
insurance cover is an item to be sized at the time of constitution, not after the first incident.
In the meantime the state of fact is unchanged and bears repeating: **the product bears no CE
marking**, and whoever deploys it today assumes the resulting obligations.

### 8.4 Two capacities: upstream supplier today, and the manufacturer role the project intends to assume with an entity still to be constituted

The project **does not report serious incidents**, today, and not because it refrains from doing
so: it has no marked distribution in respect of which a serious incident could be qualified as
such, and it has no entity that could report it. It must, however, make it possible for those who
do report them to meet their own deadlines. It is the exact reverse of the positioning note on
third-party components: **the project is a third-party component for whoever integrates it**, and a
component without declared surveillance is a component its user **cannot justify** in its own
inventory within the meaning of IEC 62304.

**The column that follows has changed in nature, and it is the central point of this section.**
Until `D58` it listed obligations of the project **towards a third party** that would certify: it
was, in substance, a reasoned courtesy. Now it lists **obligations we assume**, and we assume them
twice - once as upstream supplier to those who integrate, once as **our own future manufacturer**.
The consequence is that none of these rows is satisfied by writing it: they are **capabilities that
must be built**, and their absence is discovered at the moment they are needed, when it is too late
to build them.

| Obligation the project assumes | Why it exists, and towards whom |
|---|---|
| A functioning reporting channel, with a declared addressee and response time | Without it **the integrator** cannot meet its own twenty-four-hour deadline. It is the same infrastructure that will serve **us** when the manufacturer entity is constituted: building it twice makes no sense, and building it afterwards makes none either |
| **Coordinated disclosure policy** with declared timescales | It is a requirement of **the integrator** before it is an obligation of our own ([06 §10 §2.5](/06_security/10-risposta-agli-incidenti.md)); it becomes an obligation of our own with the manufacturer role, and the policy is not improvised at the first report |
| **Signed software bill of materials** for every release | It is the input to the manufacturer's inventory of third-party components - **the integrator's today, ours later** - and it is the second of the retroactively unrecoverable activities of `D45` |
| Timely communication of vulnerabilities in third-party components | The manufacturer does not surveil the project's components: **it surveils the project**. Upstream surveillance remains an upstream activity even when the two capacities coincide in the same party, and it must be kept distinct in the records |
| Lifecycle artefacts published and identifiable by version | Without them the manufacturer has to reconstruct them, and what is retroactively unrecoverable **it cannot reconstruct at all** (`D45`). With `D58` the manufacturer that would find itself having to do so **is us**, which makes the omission a direct harm and not a hypothesis |
| **The product capabilities of § 5.2** - a stable taxonomy of the events counted and retention of diagnostics equal to the vigilance window ([`V-178`](../11_registri/01-vincoli-in-vigore.md#v-178)) | A row added because with `D58` it is no longer a supply but a **prerequisite of ours**: they are capabilities that **count events**, and therefore cannot be switched on retroactively. They do not appear among the four unrecoverable activities of `D45` and they have the same property - it is question [`Q-276`](../11_registri/02-questioni-aperte.md#q-276) |

### 8.5 The case that none of the preceding measures covers

Whoever takes the code, modifies it and puts it into service **without any relationship with the
project** is not reachable by any of the measures of § 8.2, and never will be: it is the accepted
consequence of the open licence and it is not a defect to be corrected.

What the project can do is **make the misunderstanding impossible**: the permanent statement that
the repository is not a medical device, the intended purpose and the limits of use visible at every
moment at which the repository is accessible (`D51`), and the distribution policy that keeps the
two artefacts separate by name, version and lifecycle. What it **cannot** do is prevent a third
party from placing a non-conforming derivative on the market - and the circumstance that that third
party thereby becomes a manufacturer, with all the obligations that follow, is the only answer
available.

**`D58` makes this case worse instead of better, and that must be said.** A publicly declared
intention to certify is **reassuring material**: whoever takes the code and puts it into service may
read it as cover in the making and conclude that the risk is transitory. It is not. **Whoever
deploys today deploys an uncertified version**, surveilled by nobody, and the project's intention
transfers no obligation to them, provides them with no surveillance and mitigates none of their
liability. It is the reason why the permanent statement and the distribution policy **are not
relaxed** now that the path is ours: they are tightened, because the available misunderstanding has
increased by one.

The symmetrical question remains open: **how the project comes to know** of an incident occurring
in a derived deployment whose existence it is unaware of. There is no inbound channel, and its
absence is not neutral: a defect the project does not know about stays in everybody's code. It is
question [`Q-178`](../11_registri/02-questioni-aperte.md#q-178).

## 9. The connection with security incident response

Chapter [06 §10](/06_security/10-risposta-agli-incidenti.md) surveys **five regimes** with
different deadlines and different addressees that may be triggered by one and the same technical
event, and establishes that all of them run from the **acquisition of the evidence**, which is a
moment to be recorded. **It is not to be restated here.** What must be added is the device
manufacturer's perspective, which that chapter could not take.

| Regime | Most stringent deadline | Who is obliged | Trigger |
|---|---|---|---|
| Medical device vigilance | **2 days** | The **manufacturer** of the marked distribution - a role the project **intends** to assume, with the entity **still to be constituted** | Becoming aware of the serious incident and of the **possible** causal link |
| Cyber resilience | **24 hours** | The manufacturer of the product with digital elements | Actively exploited vulnerability or serious incident |
| Network security | Short deadlines from becoming aware | The **entity** delivering the service | Significant incident |
| Personal data protection | 72 hours | The **controller** of the processing | Becoming aware of the breach |
| Contractual obligations towards the customer | **Under 24 hours** | The supplier | Detection |

**Three properties of this table must be understood together, and they are what this chapter adds
to the security one.**

**First: the obliged parties are different, and in a deployment at the customer's premises they do
not coincide.** The manufacturer, the data controller, the party obliged under the network security
rules and the provider of the healthcare service may be **four distinct legal persons**. A response
procedure that assumes a single party is inapplicable, and it discovers this during the first real
incident.

**Second: the shortest deadline governs the process, but the most difficult deadline is the longest
one.** The twenty-four hours of cyber resilience are demanding on the **organisational** plane:
they are addressed with on-call availability and forms ready to hand. The **two days** of vigilance
are demanding on the **assessment** plane, because they require a link to be established between a
technical event and a clinical consequence - that is, answering within a few hours the question
"may this event have harmed a person?". The only structure, in the whole of the project's
documentation, that makes it possible to answer is the table of clinical consequences of the threat
model ([06 §01 §5](/06_security/01-modello-di-minaccia.md)), which at that point ceases to be a
modelling exercise and becomes **a triage instrument**.

**Third: the moment from which the period runs is a documentable fact, and it must be documented.**
All the deadlines run from becoming aware, and becoming aware is an event with a date, a time and a
content: who knew what and when. In the absence of that record, the starting point is reconstructed
by whoever contests it, **and always unfavourably**. It is the reason why the log row attesting the
acquisition of the evidence is itself a compliance artefact, and not an observability detail.

## 10. What this chapter leaves open

| Reference | Question | To whom |
|---|---|---|
| [`Q-177`](../11_registri/02-questioni-aperte.md#q-177) | **Whether the marked identified distribution is to be available only through a channel that identifies the recipient** (§ 4.1). On this decision depend the compilability of two mandatory items of the periodic report and the satisfiability of version traceability. It does not touch the openness of the repository, which remains unchanged | → Project owner |
| [`Q-178`](../11_registri/02-questioni-aperte.md#q-178) | **How the project comes to know of an incident occurring in a derived deployment whose existence it is unaware of** (§ 8.5). There is no inbound channel today, and its absence is not neutral: a defect the project does not know about stays in the code of everyone who uses it | Security, → Project owner |
| [`Q-276`](../11_registri/02-questioni-aperte.md#q-276) | **The product capabilities of vigilance are as retroactively unrecoverable as the four activities of `D45`, and they do not appear in that list** (§ 5.2, [`V-178`](../11_registri/01-vincoli-in-vigore.md#v-178); § 8.4, last row). A stable taxonomy of the events counted and retention of diagnostics equal to the vigilance window **count events**: they cannot be switched on after the fact, and the missing historical series cannot be reconstructed. As long as the obligation was a third party's the gap was that party's problem; with `D58` it is **ours**, and it must be assessed whether the two capabilities should be added to the list of unrecoverable activities of chapter [09 §5](./09-percorso-e-calendario.md) | Technical, → **ORCH** |
| [`Q-155`](../11_registri/02-questioni-aperte.md#q-155) | **Declared support period**, on which the remediation windows of § 6 depend | → Project owner |
| [`Q-116`](../11_registri/02-questioni-aperte.md#q-116) | **Answered** at § 5.2: the retention of diagnostics is determined by the vigilance obligations, with a proposal of twelve configurable months and final determination by the manufacturer | Technical |
| [`Q-113`](../11_registri/02-questioni-aperte.md#q-113) | **Partially answered** at § 6: the structure of the commitment is fixed, the value deferred to the declared support period | Technical, roadmap |
| `[NV]` | Allocation across the paragraphs of Articles 86 and 87 by class; number of the point of Article 2 on serious incidents; scope and current revision of MDCG 2020-3 | Compliance |
