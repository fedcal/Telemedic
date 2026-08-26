---
title: Compliance - index and orientation
sidebar_position: 1
description: "How Telemedic's compliance area is organised, what it contains and what it defers elsewhere. Reading paths for those intending to certify, for deployers and for contributors; boundaries with respect to security and to the foundations guide; constraints received and imposed; what this area deliberately does not say; and the note on what changed with decisions D57 and D58 and on what did not."
---

# Compliance - index and orientation

> **This area does not declare compliance: it attributes it.** There is no sentence in this
> documentation asserting that the project is compliant with anything, and the absence is
> deliberate. Software is not compliant: **a party is**, with respect to an obligation resting on
> it, at a determinate moment. Every chapter of this area therefore answers three questions and no
> others: *which source*, *on whom it falls*, *from when*.

## 1. The premise that governs everything

The project publishes **source code under a free licence**. Whoever takes it, integrates it,
distributes it or puts it into service **delivers healthcare services**. These are two different
legal positions, and almost every source in this area addresses the second.

Three facts follow, and no chapter may contradict them.

**First - the product bears no CE marking, and the project is not today a manufacturer** (`D28`,
`D49` and `V-06`, as amended by `D58`). The project **intends** to assume the manufacturer role,
and **the legal entity that would exercise it has not yet been constituted**. It produces and
publishes the regulatory material - technical file, software lifecycle, risk management, usability
engineering - **for that path**, and it stops exactly where an act begins that presupposes a legal
entity, a signature and a responsibility which do not exist today. The reason is not caution: it is
that part of that material **cannot be recovered after the fact** (`D45`), and its absence would
make it impossible for anyone to certify later, **ourselves included**.

**Second - the distinction between the repository and the distribution is substantive, not
rhetorical** (`D17`). The repository is source code and says so in
[`NOT-A-MEDICAL-DEVICE.md`](https://github.com/fedcal/Telemedic/blob/main/NOT-A-MEDICAL-DEVICE.md)
and in
[`DISTRIBUTION-POLICY.md`](https://github.com/fedcal/Telemedic/blob/main/DISTRIBUTION-POLICY.md).
The device is an **identified distribution**, with a manufacturer, a version number, a unique
identifier and a lifecycle of its own. The two artefacts do not share a name and do not share a
regime.

**Third - what has not been verified is declared as such.** Every regulatory statement in this area
cites the precise source; where verification against the primary text has not been carried out, the
entry is marked **`[NV]`** with an indication of what is to be verified and with whom. An invented
reference in regulatory matters is not a stylistic error: it is a defect that propagates into a
controlled document and stays there.

### 1.1 What changed with `D57` and `D58`, and what did not

This section exists for a precise reason: **anyone who read the previous version of this area must
not have to infer the change from a shift in wording.** Until `D58`, the area was built around the
figure of an **indefinite third party** who would undertake the certification path, and it referred
to that party with the expression "whoever certifies". That figure no longer exists.

> **Before every other line, and in this position because it is the only one that changes the
> reader's decisions.** The product **bears no CE marking**, **is covered by no declaration of
> conformity** and **cannot be used to deliver healthcare services to real patients**. Whoever
> reads "the project intends to certify" and concludes "then I may use it" draws a **wrong**
> conclusion: the intention covers nobody, transfers no obligation and does not make an
> uncertified version usable.

**What changed.**

| | Before | Now |
|---|---|---|
| Who undertakes the certification path | An indefinite third party, "whoever certifies" | **The project in the manufacturer role**, a role it **intends** to assume and whose legal entity **is still to be constituted** (`D58`) |
| Whose the roadmap and the dates are | Presented as a third party's path | **The project's internal planning** (`D57`), never an external party's path |
| On whom the retroactively unrecoverable activities of `D45` fall | "On whoever intends to certify" | **On us**, directly instead of hypothetically - which makes them **more** urgent, not less |
| What the published regulatory material is | A package for a third party | The material **of our own path**, which remains usable by others too |

**What did not change**, and is to be read with the same attention as the preceding table, because
it is the part that gets lost in rewordings.

1. **The technical allocation of responsibilities remains valid in full.** The acts the regulation
   reserves to the manufacturer role - affixing the marking, signing the declaration of conformity,
   compiling and maintaining the file, appointing the person responsible for regulatory compliance
   - **remain reserved to that role even when the role is ours**. The distinction has not been
   deleted because it is precisely what makes it legible **why those activities cannot be brought
   forward**: the intention is not the entity. The closed list is in
   [04 §12](./04-fascicolo-tecnico.md), and it has not grown shorter by a single line.
2. **The factual state of the product is identical to yesterday's.** No marking, no declaration of
   conformity, no notified body assessment, no certification of the quality management system. If
   reading this area were to suggest that the product is closer to clinical use than it was before
   `D58`, **the reading would be wrong and the rewording a defect to be corrected**.
3. **Whoever deploys, integrates or puts the software into service assumes the resulting
   obligations all the same.** The project's intention to certify **transfers none of them**, and
   allowing that to be inferred would be more harmful than silence.
4. **No marking date, anywhere** (`V-171`). It is not written, and it is not implied, that the
   product will be marked by a deadline: internal planning **does not become a promise because it
   is ours**. No date, no window, no "by" - the only admitted occurrence of that word is inside the
   statement of the prohibition itself.
5. **Liability towards the injured person cannot be excluded by contract** (Directive (EU)
   2024/2853, Article 15). It holds now as before, and with more force since the intention is ours.

**The register that follows, and that holds for every chapter of this area.** The expression
"whoever certifies" as a third party **is no longer used**. In its place, depending on what is
being spoken of: **the project in the manufacturer role** where the subject is whoever intends to
undertake the path; **the manufacturer** where the subject is an act the regulation reserves to
that formal role, whoever exercises it; **the manufacturer entity, to be constituted** where the
step presupposes the legal existence that is missing today; **the deployer** or **the integrator**
where the text refers to them. The formal rules by which the intention is to be named - the verb
"intends", the absence of the entity repeated in the same sentence, the negative statement of fact
in first position, no dates - are in
[01 §11](./01-inquadramento-normativo.md) and are part of `V-171`.

## 2. The chapters

| # | Chapter | Which question it answers |
|---|---|---|
| [01](./01-inquadramento-normativo.md) | **Regulatory framing** | Which sources touch the project, on whom each obligation falls, from when. With the artefact → applicable regime table and the formulations no artefact may use |
| [02](./02-qualificazione-e-classificazione.md) | **Qualification and classification** | Why the project is Class IIa medical device software, which two levers hold it in IIa and not IIb, which twelve reasonable requests would shift the qualification |
| [03](./03-sistema-di-gestione-della-qualita.md) | **Quality management system** | What ISO 13485 and IEC 62304 mean when contributors are not employees; the procedures genuinely required, the records of each release, traceability, third-party components |
| [04](./04-fascicolo-tecnico.md) | **Technical file** | What the file contains item by item, which document of this repository feeds each item, what is missing today and which acts remain reserved to the manufacturer role |
| [05](./05-gestione-del-rischio.md) | **Risk management** | How ISO 14971 applies to this system: acceptability criteria, register with real examples from the domain, hierarchy of measures, declared residual risk, connection with the threat model |
| [06](./06-usabilita-e-accessibilita.md) | **Usability and accessibility** | Usability engineering as a regulatory obligation, formative and summative evaluation, and the relationship with accessibility, which is a distinct obligation on the same interface |
| [07](./07-valutazione-clinica.md) | **Clinical evaluation** | What must be demonstrated, with what data, in what time, and why it is the second long-lead path after the notified body |
| [08](./08-sorveglianza-post-commercializzazione.md) | **Post-market surveillance** | The two distinct processes - surveillance and vigilance -, the reporting deadlines, changes and when they require the notified body's intervention |
| [09](./09-percorso-e-calendario.md) | **Path and schedule** | The attainments to be achieved, in what order, with what prerequisites, and the time scenarios with the irreversible decision points. **It is the single home of the dates**, which are **the project's internal planning** (`D57`) and never a marking date |
| [10](./10-controllo-dei-documenti.md) | **Document control** | The approved document control procedure: list of documents, rules for identification and versioning, reviewers by category, form of approval, withdrawal. How the approval record works in the «documents as code» model, and the explicit declared gap: author and approver coincide, and it is the first entry of `Q-189` |

**A placement rule that holds for the whole area: dates live only in chapter 09.** The other
chapters refer to it. Two schedules in two places diverge at the first update, and in regulatory
matters a wrong date in a public document is a promise that somebody will read as a commitment.

## 3. Reading paths

### 3.1 Those intending to certify

This is the reader for whom the area was written: whoever intends to assume the manufacturer role,
compile the file and place an identified distribution on the market. **Since `D58` that reader is
first of all the project itself**, which intends to assume that role and has not yet constituted
the entity that would exercise it; it remains valid also for an integrator assuming the role over
its own distribution, and the two readings are not mutually exclusive. For both, the area is an
**operating manual**, not an information notice - with the difference, not a small one, that for
the project it is a list of its own obligations and not a service rendered to a third party.

| Order | Chapter | Why in this position |
|:-:|---|---|
| 1 | [02](./02-qualificazione-e-classificazione.md) | The qualification and the class determine everything else. Reading anything else first means reading it without knowing which regime applies |
| 2 | [01](./01-inquadramento-normativo.md) | The map of sources and the attribution: which obligations become theirs the moment they place on the market |
| 3 | [04](./04-fascicolo-tecnico.md) | The inventory of what is already done, of what is missing and of the acts that **only the manufacturer** may perform |
| 4 | [09](./09-percorso-e-calendario.md) | The real timescales, before making commitments to anyone |
| 5 | [03](./03-sistema-di-gestione-della-qualita.md), [05](./05-gestione-del-rischio.md), [06](./06-usabilita-e-accessibilita.md), [07](./07-valutazione-clinica.md), [08](./08-sorveglianza-post-commercializzazione.md) | The five parallel workstreams, each with its own timescales |

**Two warnings that save them months, and that sit at the end of the chapters instead of at the
opening.** The first: the activities of the first thirty days - constituting the manufacturer
entity, freezing the intended purpose, identifying the person responsible for regulatory
compliance, first contacts with notified bodies, launching the clinical evaluation plan - **cannot
be delegated to development** and are not recoverable downstream. Since `D58` these activities
**fall on the project**: constituting the entity is an **internal prerequisite with a time of its
own**, not a wait on a third party, and every week in which it is not started is a week the project
takes away from its own path. The second: the intended purpose is the most expensive document to
get wrong, because a single formulation shifts the risk class and the software safety class
together (`D46`), and changing it after engaging a body entails a reassessment.

### 3.2 Those who deploy and put into service

This is the health authority, the private provider, the region or the operator that brings the
system into operation without necessarily placing it on the market as a product of its own. For
them the useful question is not "what class is the software", but **"what becomes an obligation of
mine".**

| Question | Where it is answered |
|---|---|
| Which sources concern me and from when | [01](./01-inquadramento-normativo.md) |
| What I cannot expect from the project | [01 §10](./01-inquadramento-normativo.md), [04 §12](./04-fascicolo-tecnico.md) |
| How responsibilities are allocated between me, the integrator and the project | [06_security/09](/06_security/09-ripartizione-delle-responsabilita.md) and [07_integration/09](/07_integration/09-obblighi-di-chi-integra.md) |
| Which residual risks the project declares and transfers to me | [05 §8.4](./05-gestione-del-rischio.md) |
| Which components have a licence regime that limits offering them as a managed service | [03 §9.5](./03-sistema-di-gestione-della-qualita.md), [`THIRD-PARTY-TERMINOLOGY.md`](https://github.com/fedcal/Telemedic/blob/main/THIRD-PARTY-TERMINOLOGY.md) |
| What I must report to the authority about relevant suppliers | [01 §4](./01-inquadramento-normativo.md), [06_security/08](/06_security/08-quadro-normativo-e-misure.md) |

**The point to be made first to this reader, and that this area does not soften:** until a CE
marking exists, the system **cannot be used to deliver healthcare services to real patients**
(`D16`). It is not a formality that can be overcome with an internal risk assessment: it is the
condition declared in every artefact of the project, and it is binding irrespective of the
product's technical quality.

### 3.3 Those contributing to the code

For a contributor this area is not material to be known in full. **Three pieces** of it are needed,
and all three have an immediate consequence for a change proposal.

| What to read | Why a proposal may be rejected for it |
|---|---|
| [02 §6](./02-qualificazione-e-classificazione.md) - the twelve requests that shift the qualification | A feature on the list **is not rejected on technical merit, but on scope policy**. The rejection is regulatory and the reason is to be written as such (constraint `V-170`) |
| [03 §§7, 9](./03-sistema-di-gestione-della-qualita.md) - traceability and third-party components | A change that does not cite the requirement breaks traceability, which cannot be reconstructed. A dependency added without a record and without an exact version is an unidentified configuration item (`V-173`) |
| [01 §11](./01-inquadramento-normativo.md) - the prohibited formulations | A line of documentation, an error message or a section heading asserting a compliance that does not exist is a regulatory defect (`V-171`), even if the code is impeccable |

Anyone who has never encountered this material **should not start here**: module
[10 §15 - The regulatory framework from scratch](/10_fondamenti/15-regolatorio-da-zero.md) is
written for those starting from zero, is a declared prerequisite of
[`CONTRIBUTING.md`](https://github.com/fedcal/Telemedic/blob/main/CONTRIBUTING.md), and this area
presupposes it on every page.

## 4. The boundaries

### 4.1 With respect to the foundations guide

This area **does not explain**: it applies. The distinction is sharp and holds for every chapter.

| If you are looking for… | Go to |
|---|---|
| What a medical device, an intended purpose, a risk class, a notified body, a harmonised standard are | [10 §15, §§1–2](/10_fondamenti/15-regolatorio-da-zero.md) |
| Who the manufacturer is and why this repository is not one | [10 §15, §3](/10_fondamenti/15-regolatorio-da-zero.md) |
| What ISO 13485, IEC 62304, ISO 14971, IEC 62366-1 are and how they relate to one another | [10 §15, §5](/10_fondamenti/15-regolatorio-da-zero.md) |
| What hazard, hazardous situation and residual risk are | [10 §10, §9.6](/10_fondamenti/10-percorsi-di-cura-e-sicurezza.md) and [10 §15, §5.5](/10_fondamenti/15-regolatorio-da-zero.md) |
| The Italian framework for telemedicine and the health record | [10 §02](/10_fondamenti/02-prestazioni-di-telemedicina.md), [10 §07](/10_fondamenti/07-fse-e-infrastrutture-nazionali.md) |

A reader who skips those modules will find this area compact to the point of unintelligibility, and
that will not be a defect of this area.

### 4.2 With respect to the security area

The two perimeters touch at three points and overlap at none.

| Object | Sits in `docs/06_security/` | Sits here |
|---|---|---|
| Threats, adversaries, technical measures, incidents | In full | - |
| **Risk file** | The threat model is an **input** | The risk file within the meaning of ISO 14971 and the rule by which the input enters it: [05 §9](./05-gestione-del-rischio.md) |
| Obligations concerning network security and product resilience | The measures and their implementation: [06_security/08](/06_security/08-quadro-normativo-e-misure.md) | The attribution of the obliged party and the artefact → regime table: [01 §§4–5](./01-inquadramento-normativo.md) |
| Allocation of responsibilities between parties | The operational table: [06_security/09](/06_security/09-ripartizione-delle-responsabilita.md) | The compliance check against that table, which confirms its rows and strengthens five of them: [01 §10](./01-inquadramento-normativo.md) |

**The rule that disambiguates doubtful cases:** if the question is "how is it protected", it is
security; if it is "who answers, to whom, on the basis of which source", it is compliance.

### 4.3 With respect to the other areas

This area **does not contain** the architecture
([`02_architecture/`](/02_architecture/00-indice.md)), the requirements catalogue
([`03_functional/`](/03_functional/00-indice.md)), the contract of the interfaces towards third
parties ([`07_integration/`](/07_integration/00-indice.md)) or the product planning
([`09_roadmap/`](/09_roadmap/00-indice.md)). Towards those areas it opens questions instead of
deciding in their place, and the questions are recorded at the end of each chapter.

## 5. Constraints received and constraints imposed

**Received from other areas**, and binding for every chapter of this area: `V-05` (the identity
service provider is the deployer, not the project) · `V-06`, **amended by `D58`** (the product
bears no CE marking and the project is not today a manufacturer; the manufacturer role is the one
the project **intends** to assume, with the legal entity still to be constituted, and the acts
reserved to that role remain reserved)
· `V-07` (canonical dataset, replaceable serialisations) · `V-12` (no technical threshold is
imposed by Italian legislation: the values are product specification, never compliance) · `V-120`
(frozen requirement identifiers) · `V-144` (the formulation of the intended purpose of remote
monitoring is "deferred collection of parameters for periodic review by the professional")
· `V-152` (log retention periods) · `V-154` and `V-165` (a level of assurance reported by an
integrator does not satisfy a strong authentication obligation) · `V-163` (warning and consent
texts are neither themeable nor concealable).

**Imposed by this area on all the others**, and not negotiable without a reasoned challenge on the
noticeboard:

| # | Constraint | Where it is established |
|---|---|---|
| `V-170` | **Change control as a compliance measure.** A proposal introducing one of the out-of-scope functions is not assessed on technical merit: it is rejected on scope policy, with a written regulatory rationale | [02 §10](./02-qualificazione-e-classificazione.md) |
| `V-171` | **Prohibited formulations in every public artefact.** No text of the project may assert or imply a compliance, a marking or a certification that does not exist | [01 §11](./01-inquadramento-normativo.md) |
| `V-172` | **Identifier space of regulatory documents.** No area may coin an identifier in the reserved prefixes without declaring it | [03 §5](./03-sistema-di-gestione-della-qualita.md) |
| `V-173` | **No floating version tags** on dependencies, base images and build chain tools: it is a direct breach of a clause, not an operational preference | [03 §9.3](./03-sistema-di-gestione-della-qualita.md) |
| `V-174` | **This documentation is not a controlled document.** No chapter is a quality management system procedure and no area may present it as such: the chapters are inputs | [03 §4.1](./03-sistema-di-gestione-della-qualita.md) |

## 6. What this area does not say

This section exists because in regulatory matters the absence of an answer is read as an implicit
answer. What follows is what has not been written, and why.

1. **It does not say that the project is compliant with anything.** It does not say it for the MDR,
   nor for the data protection framework, nor for the network security one. A product **enables** a
   compliance that belongs to a party.
2. **It is not legal or regulatory advice.** The legal qualification of a party and of a product
   depends on matters of fact to be ascertained case by case by a qualified professional.
3. **It does not contain the technical file.** It contains its map and the material that feeds it:
   the difference is dealt with in [04 §1](./04-fascicolo-tecnico.md) and is the same as that
   between an analysis and an approved document.
4. **It does not contain the quality management system procedures.** It lists the necessary set and
   explains the reason for it; writing them is an act of whoever exercises the system, inside a
   document control that **is not in operation** (`V-174`). That the manufacturer role is the one
   the project intends to assume does not change this point: it changes only whose task it is to
   institute it.
5. **It does not estimate costs and fees.** Notified bodies' standard fees are published as a legal
   obligation: where a primary source exists, estimating is a methodological error.
6. **It does not set the date of the CE marking.** The omission stands intact and its reason has
   changed with `D58`: it is no longer that the date "is not the project's", but that **an
   intention is not a dated promise** and that the outcome depends on notified bodies with
   unmeasured queues. A published date would be read as a forecast of the outcome, which is exactly
   the statement prohibited by `V-171`. The full rationale is in
   [01 §13](./01-inquadramento-normativo.md).
7. **It does not decide in the project owner's place.** The decisions that require an
   entrepreneurial choice - monetisation, constitution of a legal entity, declared support period,
   form of publication of the intended-purpose outline - remain open and are marked as such.
8. **It does not close the verifications it has not carried out.** Where the primary text has not
   been read, the entry is `[NV]`: the most significant concern the precise numbering of certain
   sections of the annexes, the designation codes applicable to the device and the harmonisation
   status of certain standards, which is to be verified **at the date of use** and not once and for
   all.

## 7. The questions this area keeps open

Each chapter closes with its own table; here only the numbering space is recorded, because a
question without a number cannot be traced. This area uses `Q-170`…`Q-174` and has opened: `Q-170`
form of publication of the intended-purpose outline · `Q-171` documentation package of the
regulation on the European health data space · `Q-172` versioning structure of the identified
distribution and its relationship with the unique identifier · `Q-173` whether the presentation of
parameters constitutes a measuring function · `Q-174` regulatory review step for public texts
before publication. The first three and the fifth require a decision that is not this area's; the
fourth requires a technical fact that this area does not know.

**The space `Q-270`…`Q-279` and `V-270`…`V-279` is reserved for the entries opened by the rewording
imposed by `D57` and `D58`**, and the entries already opened are recorded on the noticeboard.

## 8. How this area is maintained

Three rules, all with a practical consequence.

**Sources are cited, not recalled.** A regulatory reference appearing in a chapter comes from the
text or is marked `[NV]`. There is no third possibility, and the writer's memory is not a source.

**Dates expire.** The harmonisation status of a standard, the version of a guidance document, the
list of designated bodies and the adaptation deadlines all change. Every time-dependent entry is to
be re-verified at the date of use, and the chapters state this line by line instead of presenting a
snapshot as if it were permanent.

**The English is not a summary.** Under `D50` this area exists in full in Italian and in English,
and the translation keeps Italian regulatory references in their original form with the explanation
in the language of the text. The real risk is not the missing translation: it is **divergence
between the two versions**, which in regulatory matters produces two documents saying different
things about the same obligation.
