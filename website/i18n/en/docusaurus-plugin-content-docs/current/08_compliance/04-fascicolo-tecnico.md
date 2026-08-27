---
title: Technical file
sidebar_position: 5
description: "What the Annex II and Annex III technical file contains, item by item, and which document of this repository feeds each item. What is missing today, which acts remain reserved to the manufacturer role even when that role is the project's, and why the notified body is the factor that determines the schedule."
---

# Technical file

> **Reading premise.** What a technical file is, why it exists, and how it relates to the CE marking
> and to the notified body is explained from scratch in
> [10 §15 - The regulatory framework from scratch, §4](/10_fondamenti/15-regolatorio-da-zero.md).
> **Here it is not repeated: it is mapped.** This chapter answers one question only, repeated for
> every item of Annex II and Annex III: *which document satisfies it, does it already exist, and
> who can produce it*.
>
> **Scope warning, which governs every row.** The project **is not today a manufacturer** (`D28` and
> `D49`, as amended by `D58`) and **the product bears no CE marking**. What follows is not the
> technical file of a device: it is **the map of the file the manufacturer will have to compile**,
> indicating which pieces the project already supplies, which it undertakes to produce and which it
> **cannot supply today under any circumstances**, because they presuppose a legal entity, a
> signature and a responsibility that do not exist today.
>
> **`D58` changes who intends to compile that file, and nothing else.** The project **intends** to
> assume the manufacturer role, and **the legal entity that would exercise it has not yet been
> constituted**. Compiling the file, signing the declaration of conformity and affixing the marking
> remain **acts reserved to that formal role** - they remain so **even when the role is ours**. It
> is precisely this distinction that makes it legible why the items in § 12 cannot be brought
> forward: it is not reticence, it is that the act presupposes the entity. What `D58` changes is
> that those items **from today fall on us**, which makes them more urgent, not less.
>
> **The gap to be closed straight away.** Whoever reads that the project intends to certify and
> concludes that the software is usable on real patients draws a **wrong** conclusion. A file that
> does not exist covers nothing, and the intention to compile it **transfers no obligation** to
> anyone deploying an uncertified version today: those obligations remain in full with whoever
> deploys, integrates or puts into service.
>
> **Methodological warning.** This chapter is technical compliance analysis, not regulatory advice.
> The Annex II section numbers used here derive from the project's internal research and **must be
> re-verified against the consolidated text** before appearing in a controlled document: where the
> verification has not been carried out, the item is marked `[NV]`.

## 1. What the technical file is, and what it is not

The technical file is the documentary set by which the manufacturer demonstrates that the device
meets the general safety and performance requirements. Its structure is imposed by **Annex II** of
Regulation (EU) 2017/745, supplemented by **Annex III** for the post-market surveillance part.
**Article 10(4)** requires it to be drawn up and **kept up to date**: it is not a delivery
obligation, it is a continuing obligation lasting as long as the device does. The regulation also
requires it to be kept available to the authorities for a period of years after the last device is
placed on the market. The exact duration and the paragraph establishing it `[NV]` - to be verified
by `Compliance`.

Three misconceptions must be cleared away at once, because all three are common in a development
team encountering this material for the first time.

**First misconception: the technical file is not "the product documentation".** Excellent technical
documentation, such as this repository produces, **is not** a technical file and does not become one
by accumulation. The difference lies not in the quality of the content but in three formal
properties the content does not possess on its own:

1. **it is controlled** - every document has an identifier, a revision, an author, an approver, an
   approval date and a procedure governing its amendment;
2. **it is navigable** - there is a point of entry, the general safety and performance requirements
   matrix, from which every piece of evidence is reached with a reference to an **exact** revision;
3. **it is attributed** - it has a party assuming responsibility for it, and that party is the
   manufacturer.

None of the three properties belongs to the documentation published on these pages. This is
constraint [`V-174`](../11_registri/01-vincoli-in-vigore.md#v-174), established by [03 §4.1](./03-sistema-di-gestione-della-qualita.md): **no
chapter of this documentation is a document of the file, and no area may present it as such.** The
chapters are **inputs**: they contain the analysis from which the file's document is written, not
the document.

**Second misconception: the file is not an archive, it is a demonstration.** The notified body does
not read the file from beginning to end. It enters through the general requirements matrix (section
4 of Annex II), picks a few rows and follows them through to the evidence. If the path breaks - a
reference to a document without a revision, a revision that does not match, evidence demonstrating
something different from what the row asserts - the finding does not concern that row: it concerns
**the reliability of the entire file**, because the sample was random. A complete but unnavigable
file produces more findings than a leaner, coherent one.

**Third misconception: the software part of the file is not "the code".** The code does not go into
the file. What goes in are the development plan, the requirements specification, the architecture,
the acceptance criteria, the verification outcomes referred to a version, the traceability matrix,
the bill of materials, the management of third-party components and the residual anomalies with
their assessment. It is material produced **while** developing and which, as
[03 §7](./03-sistema-di-gestione-della-qualita.md) demonstrates, cannot be reconstructed
afterwards.

## 2. The structure, in four sets

| Set | Content | Basis | Who can compile it |
|---|---|---|---|
| **A** | Technical documentation of the device, sections 1–6 | Annex II | Manufacturer, with the project's material |
| **B** | Technical documentation on post-market surveillance | Annex III | Manufacturer, with the project's product capabilities |
| **C** | Documents that **do not belong** to the file but that the notified body requires with the application | Annex IX, Articles 15, 19; ISO 13485 | **Only** the manufacturer |
| **D** | Material the project produces that **is not** a document of the file, but from which the file's documents are drafted | - | Project |

Set D is the reason this chapter exists. If the project published only code, whoever wished to
certify - ourselves included, once the entity is constituted - would have to **reconstruct by
inference** the design, risk and verification reasoning: an interpretative operation a notified body
has no reason to accept. If instead the project publishes the analysis, **the manufacturer reviews
it, corrects it, approves it and signs it**: an operation orders of magnitude shorter and, above
all, an admissible one.

## 3. Legend of the mapping

The tables in §§ 4–10 use three stable columns.

**Regulatory document.** The identifier of the file's document, in the identifier space established
by [03 §5](./03-sistema-di-gestione-della-qualita.md) and made binding as [`V-172`](../11_registri/01-vincoli-in-vigore.md#v-172). An identifier
listed here **does not imply that the document exists**: it implies that, when it does, it will be
called that.

**Fed by.** The material already present in this repository that supplies the substantive content of
the document. It is the project's added value and it is verifiable: these are real paths of existing
files.

**Attribution.** Who can produce the element:

| Symbol | Meaning |
|:-:|---|
| **P** | The **project** produces it in full. **The manufacturer** reviews and approves it |
| **P/F** | The project produces the technical content; **the manufacturer** completes it with data only it possesses, approves it and signs it |
| **F** | **Only the manufacturer.** The project cannot produce it, not even in draft, without performing an act that is not its to perform |

**Status**, at the date of this chapter: `☑` available · `◐` partially covered · `☐` to be produced.

> **A clarification that avoids a recurrent reading error.** A `☑` status means that the **content**
> exists in verifiable form, not that the controlled document exists. No document of the file exists
> today as a controlled document, for the reason stated in § 1: **the project has no document
> control system in operation**, and it will not have one until the manufacturer entity is
> constituted and the quality management system is instituted. It is the same reason, argued in
> full, as in [02 §5.2](./02-qualificazione-e-classificazione.md): what is missing is no longer the
> party, it is the **system** - and the system is ours to bear.

## 4. Annex II, section 1 - Device description and specification

This is the section that defines **what is being talked about**. Every error made here propagates to
everything else: the intended purpose determines the class, the class determines the procedure, the
procedure determines the timescales and the costs.

| Item | Content required | Regulatory document | Fed by | Attr. | Status |
|---|---|---|---|:-:|:-:|
| 1.1 a | Product name and general description, with intended purpose and intended users | `MDR-IU-001` | [02 §5.1](./02-qualificazione-e-classificazione.md) (structure of the outline), [03_functional/01](/03_functional/01-attori-e-ruoli.md) | P/F | ◐ |
| 1.1 b | **Basic UDI-DI** assigned by the manufacturer | `UDI-001` | - | **F** | ☐ |
| 1.1 c | Patient population, clinical conditions, indications, contraindications, warnings | `MDR-IU-001` §§ 3, 5, 9 | [05_domain/02](/05_domain/02-le-prestazioni-modellate.md), [05_domain/08](/05_domain/08-percorsi-e-piani-di-cura.md), [03_functional/07](/03_functional/07-fuori-perimetro.md) | P/F | ◐ |
| 1.1 d | Principle of operation and mode of action | `MDR-IU-001` § 7 | [02_architecture/01](/02_architecture/01-visione-architetturale.md), [02_architecture/02](/02_architecture/02-contesti-delimitati.md) | P | ◐ |
| 1.1 e | **Rationale for the qualification** as a medical device | `MDR-CLS-001` § 2 | [02 §§1–3](./02-qualificazione-e-classificazione.md) | P | ☑ |
| 1.1 f | **Risk class and rationale for the rules applied** | `MDR-CLS-001` §§ 4–7 | [02 §4](./02-qualificazione-e-classificazione.md) | P | ☑ |
| 1.1 g | Explanation of the novel features | `MDR-CLS-001` § 8 | [adr/](../adr/0001-separazione-prestazione-sessione-media.md) and the set of architecture decision records | P | ◐ |
| 1.1 h | Accessories, other devices and non-device products used in combination | `MDR-COMB-001` | [05_domain/05](/05_domain/05-parametri-e-osservazioni.md), [07_integration/01](/07_integration/01-modalita-di-integrazione.md) | P/F | ☐ |
| 1.1 i | Complete list of **configurations and variants** | `MDR-CONF-001` | [02_architecture/08](/02_architecture/08-viste-di-deployment.md), [07_integration/08](/07_integration/08-moduli-sostituibili.md) | P/F | ◐ |
| 1.1 j | Key functional elements, with pictorial representations | `SW-SAD-001` | [02_architecture/01](/02_architecture/01-visione-architetturale.md)…[06](/02_architecture/06-eventi-e-integrazione-interna.md), [01_technical/02](/01_technical/02-backend.md), [01_technical/04](/01_technical/04-frontend.md), [01_technical/05](/01_technical/05-media-e-tempo-reale.md) | P | ◐ |
| 1.1 k | Raw materials in contact with the body | **Not applicable** | - | P/F | ☐ |
| 1.1 l | **Technical specifications**: characteristics, performance, variants | `MDR-SPEC-001`, `MDR-ENV-001` | [01_technical/07](/01_technical/07-prestazioni-e-capacita.md), [01_technical/04](/01_technical/04-frontend.md) | P | ◐ |
| 1.2 | Previous generations and similar devices of the manufacturer | `MDR-TD-001` § 1.2 | - | **F** | ☐ |

**Three rows deserve a note, because they are the ones in which the project's dual model (`D17`)
produces concrete consequences.**

**Row 1.1 b.** The basic unique device identifier is not a number one picks: it presupposes a
registered manufacturer, an issuing entity and a versioning structure for the **identified
distribution**. The project cannot assign it and must not pretend it can. But the project's choice
of **how the distribution is versioned** conditions what that code will identify, and it is a choice
to be taken deliberately and not out of habit: it is question [`Q-172`](../11_registri/02-questioni-aperte.md#q-172) of § 17.

**Row 1.1 k.** "Not applicable" is not an answer: it is a **rationale to be written**. A file that
skips the non-applicable items is an incomplete file, not a lean one. The correct form is the item
present, with the declaration of non-applicability and the reason - software without applied parts,
no contact with the body, no physical or chemical action - in a line of text.

**Row 1.2.** It is the only point in section 1 at which the relationship between the repository and
the distribution has to be stated in writing. The correct formulation is not "the device derives
from an open source project": it is that the device is **the identified distribution produced by
whoever certifies**, that the published source code **is not the device**, and that the link between
the two is guaranteed by reproducible build and artefact signing (§ 6). The public text supporting
this position is
[`NOT-A-MEDICAL-DEVICE.md`](https://github.com/fedcal/Telemedic/blob/main/NOT-A-MEDICAL-DEVICE.md)
and
[`DISTRIBUTION-POLICY.md`](https://github.com/fedcal/Telemedic/blob/main/DISTRIBUTION-POLICY.md).

## 5. Annex II, section 2 - Information supplied by the manufacturer

| Item | Content | Document | Fed by | Attr. | Status |
|---|---|---|---|:-:|:-:|
| 2 | **Labels** on the device and on the packaging, in the languages accepted in the Member States where it is marketed | `MDR-LBL-001` | - | **F** | ☐ |
| 2 | **Instructions for use**, in the languages accepted | `MDR-IFU-001` | [03_functional/06](/03_functional/06-accessibilita-e-usabilita.md), [07_integration/02](/07_integration/02-primo-avvio.md), [07_integration/09](/07_integration/09-obblighi-di-chi-integra.md) | P/F | ☐ |

**For software, the label is a screen.** The set of information that for a physical device sits on
the packaging - the manufacturer's name and address, the unique device identifier, the version, the
CE marking with the notified body's number, standardised symbols - for software lives in a "Device
information" screen reachable without authentication and without deep navigation. The reference
standards are **EN ISO 20417** for information supplied by the manufacturer and **EN ISO 15223-1**
for symbols. Their presence in the consolidated list of harmonised standards must be verified at
the date of use by `Compliance` against the Commission's list. **`[NV]`** on presence in the
harmonised standards list.

**What the project can and must do, despite not being a manufacturer.** Prepare the **space**: the
screen exists, it is reachable, it is accessible, and the fields it will have to contain are
configurable per distribution instead of written into the code. A product that has not provided for
that screen forces **the manufacturer** into an interface change at a late stage, when every
interface change reopens the usability evaluation. It is the clearest example of a cost the project
can eliminate **today**, at almost no cost, and that becomes expensive later - and, since `D58`, it
is a cost that would fall **on us**.

**Language is not an editorial choice.** The instructions for use intended for the Italian market
must be in Italian `[NV]` to be verified by `Compliance` - the obligation derives from the national
implementing legislative decree, and the precise article reference must be verified against the
published text before appearing in a controlled document. The project adopts in any case full Italian and English (`D50`),
which covers the minimum condition but does not exhaust the obligation: only the manufacturer knows
the Member States in which the distribution will be marketed, and with them the languages required.

**A constraint that arises here and holds for the whole interface.** The instructions for use of a
software device are not a separate manual nobody opens: they are **the sum of the texts the user
encounters**, including persistent warnings, consent texts, error messages and the declarations of
unsuitability for emergencies (`BR-168`, question [`Q-126`](../11_registri/02-questioni-aperte.md#q-126)). It follows that every change to those
texts is a change to the information supplied by the manufacturer, that is, a change to the file. It
is the same reason why constraint [`V-171`](../11_registri/01-vincoli-in-vigore.md#v-171) on prohibited formulations exists
([01 §11](./01-inquadramento-normativo.md)) and why [`V-163`](../11_registri/01-vincoli-in-vigore.md#v-163) of `INTEG` makes those texts **neither
themeable nor concealable** by the integrator.

## 6. Annex II, section 3 - Information on design and manufacture

| Item | Content | Document | Fed by | Attr. | Status |
|---|---|---|---|:-:|:-:|
| 3 a | Information making it possible to understand the **design stages** | `SW-DEV-PLAN-001`, `SW-SRS-001`, `SW-SAD-001` | [03_functional/02](/03_functional/02-catalogo-dei-requisiti.md), [02_architecture/](/02_architecture/00-indice.md), [adr/](../adr/0003-dominio-indipendente-dallo-standard.md) | P | ◐ |
| 3 b | **Manufacturing processes** and their validation, in-process controls, final product testing | `SW-BUILD-001`, `QMS-VAL-001` | [01_technical/09](/01_technical/09-integrazione-continua-e-rilascio.md), [06_security/07](/06_security/07-catena-di-fornitura.md) | P | ◐ |
| 3 | **Identification of the sites** of design and manufacture, suppliers and subcontractors | `MDR-SITE-001` | [06_security/07](/06_security/07-catena-di-fornitura.md) for the method | **F** | ☐ |

**For software, "manufacture" means build and release.** The statement is not metaphorical and has
precise consequences: the "premises" the notified body inspects are the development environment and
the build infrastructure; the "in-process controls" are the blocking checks of the continuous
integration chain; the "final product testing" is the set of checks run on the built artefact, not
on the source.

**The point the notified body will raise first, in this project, is the dual model.** The question
is foreseeable and must be prepared before it is asked: *how is it guaranteed that the certified
artefact corresponds exactly to a controlled source, given that the repository accepts
contributions from people over whom the manufacturer has no power of direction?*

The documentary answer is made up of five elements, all already existing as practice in this
repository and none of which, today, exists as a controlled procedure:

| Element | Where it lives today | What it demonstrates |
|---|---|---|
| **Reproducible build** and artefact signing | [01_technical/09](/01_technical/09-integrazione-continua-e-rilascio.md) | That the distributed binary descends from the declared source |
| **Exact list of the changes included** in the release | [03 §8](./03-sistema-di-gestione-della-qualita.md), records 1 and 2 | That the composition of the release is known and not reconstructed |
| **Mandatory review by named and qualified reviewers** | [`CONTRIBUTING.md`](https://github.com/fedcal/Telemedic/blob/main/CONTRIBUTING.md), [`GOVERNANCE.md`](https://github.com/fedcal/Telemedic/blob/main/GOVERNANCE.md) | That **acceptance** is the act of design, not the writing ([03 §1](./03-sistema-di-gestione-della-qualita.md)) |
| **Attestation of origin** on every contribution | [`CONTRIBUTING.md`](https://github.com/fedcal/Telemedic/blob/main/CONTRIBUTING.md) | Chain of provenance of rights and traceability of the author by name |
| **Bill of materials** generated by the build chain | [01_technical/09](/01_technical/09-integrazione-continua-e-rilascio.md), component register in [01_technical/01 §14](/01_technical/01-stack-e-motivazioni.md) | That every configuration item is identified by title, producer and version |

**What is missing is the document explaining why these five elements satisfy the clause.** It is
exactly the difference between good engineering practice and regulatory evidence, and it is the work
that [03](./03-sistema-di-gestione-della-qualita.md) describes and that this chapter does not
duplicate.

**The row on sites is entirely the manufacturer's**, and not out of formalism. It covers the
identification of the build chain runners, of the image registry, of the signing service and of
every critical supplier, with the registered office and the country: these are data that depend on
where the manufacturer hosts its own infrastructure, not on where the project hosts its own. The
project supplies the **method** and the requirements those suppliers must meet - data sovereignty
([`V1`](../11_registri/03-vincoli-fondanti.md#v1)), absence of runtime dependencies outside the Union, the ability to declare the relevant
supplier to the authority (`D40`) - and nothing more.

## 7. Annex II, section 4 - General safety and performance requirements

| Item | Content | Document | Fed by | Attr. | Status |
|---|---|---|---|:-:|:-:|
| 4 | **List of the general requirements of Annex I**, with reasoned applicability, method of demonstration, standards applied and **precise identification of the controlled documents** offering the proof | `MDR-GSPR-001` | The whole of the project's technical documentation | P/F | ☐ |

**It is the backbone of the file, and it is the document the notified body reads first.** It is to
be built as a table with references to versioned documents at an exact revision, never as prose: a
discursive matrix is unreadable for someone who has to sample, and produces the kind of finding
described in § 1.

**For software the most onerous rows are two families.** The first is that of **programmable
electronic systems**: repeatability, reliability and performance in line with the intended use;
development according to the state of the art with lifecycle, risk management, verification and
validation; minimum hardware and network requirements; IT security measures including protection
against unauthorised access. The second is that of the **reduction of risks related to use error**.
The precise numbering of the sections of Annex I `[NV]` to be verified by `Compliance` before
appearing in the matrix.

**The structural limit of the project's contribution, and it must be said without softening.** The
column "precise identification of the controlled documents" **cannot be completed by the project**,
because it presupposes controlled documents, which the project does not have ([`V-174`](../11_registri/01-vincoli-in-vigore.md#v-174)). The project
can therefore produce the matrix up to the penultimate column: requirement, applicability with
rationale, method of demonstration, standard applied, and **a reference to the analysis** in this
repository. The last column is completed by **the manufacturer**, replacing the reference to the
analysis with the reference to its own approved document.

This is not a secondary limitation: it is **the junction point of the whole `D49` model**, and `D58`
does not remove it. The project builds the complete, verifiable scaffolding of a file; the act that
turns it into a file is the insertion of each reference into a document control system, and that act
**is an act of the manufacturer** - reserved to the role even when the role is ours, because what
makes it possible is not the will but the system. Whoever reads this documentation hoping to find a
ready-to-use file in it will instead find **everything needed to write one in months instead of
years**, which is a different thing and must be said as it is.

## 8. Annex II, section 5 - Benefit-risk analysis and risk management

| Item | Content | Document | Fed by | Attr. | Status |
|---|---|---|---|:-:|:-:|
| 5.1 | **Benefit-risk analysis** | `RM-REP-001`, `CE-REP-001` | [05 §8](./05-gestione-del-rischio.md) | **F** | ☐ |
| 5.2 | Solutions adopted and **results of risk management** | `RM-PLAN-001`, `RM-FILE-001`, `RM-REP-001` | [05](./05-gestione-del-rischio.md) in full | P/F | ◐ |

The substantive content of this section is in chapter
[05 - Risk management](./05-gestione-del-rischio.md) and **is not duplicated here**. For the
purposes of mapping the file, three facts count, which that chapter establishes and which are
recorded here.

**First.** The risk file does not yet exist as a document: what exist are its **identified entries**,
the recorded inputs and the proposed method. Estimating severity and probability requires the plan's
acceptability criteria, and the acceptability criteria are a **choice of the manufacturer**, not a
technical datum.

**Second.** The benefit-risk analysis cannot be drafted by the technical team alone and cannot be
signed by it: it presupposes a clinical evaluation and a determination of acceptability which the
MDR attributes to the manufacturer. It is the only row of section 5 marked **F** without
qualification.

**Third, and it is the link most often lost.** Section 5 and section 4 must be consistent: every
risk control measure appearing in the risk file must appear as proof for a row of the general
requirements matrix, and vice versa. Two documents built separately diverge at the second update.
The guard is that the matrix should be **generated** from the same identifiers, not drafted by hand
- the same rule [03 §7.3](./03-sistema-di-gestione-della-qualita.md) applies to traceability.

## 9. Annex II, section 6 - Product verification and validation

It is the most voluminous section for software and the one to which the project contributes most.

| Item | Content | Document | Fed by | Attr. | Status |
|---|---|---|---|:-:|:-:|
| 6.1 | Results and critical analysis of **verifications and tests** and of the validation tests | `SW-VVP-001`, `SW-VVR-001`, `SW-TRACE-001` | [01_technical/08](/01_technical/08-qualita-e-test.md), [01_technical/09](/01_technical/09-integrazione-continua-e-rilascio.md) | P | ◐ |
| 6.1 b | **Software verification and validation** before final release, on all the declared configurations and operating systems | `SW-VVR-001`, `MDR-ENV-001` | [01_technical/08](/01_technical/08-qualita-e-test.md), [01_technical/04](/01_technical/04-frontend.md), [01_technical/05](/01_technical/05-media-e-tempo-reale.md) | P | ◐ |
| 6.1 | **Stability and lifetime** | `MDR-LIFE-001` | [03 §9.4](./03-sistema-di-gestione-della-qualita.md) | P/F | ☐ |
| 6.1 | Biocompatibility, sterility, substances, radiation | **Not applicable** | - | P/F | ☐ |
| 6.1 | **Clinical data**: clinical evaluation plan and report, post-market clinical follow-up | `CE-PLAN-001`, `CE-REP-001`, `PMCF-PLAN-001` | [07 - Clinical evaluation](./07-valutazione-clinica.md) | **F** | ☐ |
| 6.2 | Specific cases, including devices with a **measuring function** | `MDR-TD-001` § 6.2 | [02 §12](./02-qualificazione-e-classificazione.md), question [`Q-173`](../11_registri/02-questioni-aperte.md#q-173) | P/F | ☐ |
| - | **Cybersecurity**: threat model, requirements, tests, vulnerability handling, coordinated disclosure, bill of materials | `SEC-TM-001`, `SEC-RMF-001`, `SEC-PT-001`, `SEC-LC-001` | [06_security/01](/06_security/01-modello-di-minaccia.md), [06](/06_security/06-sicurezza-applicativa.md), [07](/06_security/07-catena-di-fornitura.md), [10](/06_security/10-risposta-agli-incidenti.md), [`SECURITY.md`](https://github.com/fedcal/Telemedic/blob/main/SECURITY.md) | P | ◐ |
| - | **Usability engineering file** | `UEF-001` and the linked documents | [06 - Usability and accessibility](./06-usabilita-e-accessibilita.md), [03_functional/06](/03_functional/06-accessibilita-e-usabilita.md) | P/F | ☐ |
| - | Complete **software lifecycle documentation** | `SW-*` | [03 §§6–8](./03-sistema-di-gestione-della-qualita.md) | P | ◐ |

**Four warnings about this section, all arising from facts of this project.**

**First - "before final release" is a temporal condition, not a formula.** The standard requires the
summary of the results of all the verifications carried out **before** the release. A report
produced afterwards, describing tests carried out beforehand, is admissible only if the tests were
traceable to the released version. It is the reason why record 4 of
[03 §8](./03-sistema-di-gestione-della-qualita.md) requires every verification outcome to carry the
**version of the object verified**: without that field, an automated check outcome cannot be
attributed to a release and is worth nothing in the file.

**Second - the matrix of supported environments does not exist and cannot be invented.** Item 6.1 b
requires verification on all the declared configurations. The declared configurations derive from
`MDR-ENV-001`, which in turn derives from the operating environment thresholds - minimum bandwidth,
latency, loss, delay variation - and from the **reference device** against which the mobile first
criteria are checked. None of these quantities has been measured to date: it is question [`Q-115`](../11_registri/02-questioni-aperte.md#q-115),
opened by the technical area towards product and functional. While it remains open, section 10 of
the intended purpose cannot be completed
([02 §5.1](./02-qualificazione-e-classificazione.md)) and **item 6.1 b has no defined test
perimeter**. It is not a documentary delay: it is the impossibility of knowing what has to be
tested.

**Third - the clinical data are marked F, and the marking is substantive.** The project can produce
the method, the literature search strategy and the structure of the plan; it cannot conduct the
clinical evaluation, which presupposes a qualified evaluator and a responsibility belonging to the
manufacturer (`D49`). Chapter [07](./07-valutazione-clinica.md) deals with the subject; here it is
recorded only that it is, together with the notified body, the second long-lead path of the
schedule.

**Fourth - item 6.2 is open and its closure does not depend on this area.** Whether the presentation
of measured parameters constitutes a "measuring function" within the meaning of the MDR depends on a
fact: whether the system converts units, rounds or transforms the values received, or presents them
as received. It is question [`Q-173`](../11_registri/02-questioni-aperte.md#q-173), addressed to the domain and functional areas. The answer
determines the applicability of a block of metrological requirements of Annex I, and therefore whole
rows of the section 4 matrix.

## 10. Annex III - Technical documentation on post-market surveillance

| Item | Content | Document | Fed by | Attr. | Status |
|---|---|---|---|:-:|:-:|
| 1.1 | **Post-market surveillance plan** under Article 84: data collection, indicators and threshold values for the re-evaluation of risks, complaint investigation, management of events subject to trend reporting, communication with users and distributors, verification of preventive and corrective actions, traceability tools, clinical follow-up plan or the rationale for its non-applicability | `PMS-PLAN-001` | [08 - Post-market surveillance](./08-sorveglianza-post-commercializzazione.md), [06_security/10](/06_security/10-risposta-agli-incidenti.md) | P/F | ☐ |
| 1.2 | **Periodic safety update report** and surveillance report | `PSUR-00n` | [08](./08-sorveglianza-post-commercializzazione.md) | **F** | ☐ |

**Annex III is the part of the file that is systematically forgotten**, for an understandable
reason: it describes what will happen after placing on the market, and before placing on the market
it seems premature. It is not, for two verifiable reasons.

The first is formal: the surveillance plan is **part of the application** to the notified body
(§ 12), not an obligation arising after the certificate. Turning up without a plan means submitting
an incomplete application, and an incomplete application puts you back in the queue.

The second is technical and concerns the product, not the documents. The plan states **indicators,
thresholds and collection windows**; if the system does not produce that data, the plan states
something nobody will be able to execute. The operational consequence is a question that must be
asked now and that is question [`Q-116`](../11_registri/02-questioni-aperte.md#q-116) of the technical area: **for how long are the observability
signals retained?** If an incident can emerge weeks later and the diagnostic logs last days,
reconstruction is impossible and the vigilance obligation cannot be satisfied. The period depends on
the vigilance obligations for devices and on the reporting obligations in the field of
cybersecurity: it belongs to this area, is dealt with in chapter
[08](./08-sorveglianza-post-commercializzazione.md), and is distinct from the periods already fixed
by [`V-152`](../11_registri/01-vincoli-in-vigore.md#v-152) for traceability and access data.

## 11. What is missing today

This section is the chapter's main reason for existing, and it is to be read as an inventory of
absences, not as a work plan. No row is consoling.

| # | What is missing | Why it is not there | Whom it depends on | Recoverable later? |
|---|---|---|---|:-:|
| 1 | **Draft intended purpose** `MDR-IU-001` as a document | The structure exists ([02 §5.1](./02-qualificazione-e-classificazione.md)); the text is missing, and section 10 cannot be completed until the thresholds are measured ([`Q-115`](../11_registri/02-questioni-aperte.md#q-115)) | Project, with a technical dependency | Yes, but changing it after engaging the body costs a reassessment (`D46`) |
| 2 | **Qualification and classification determination** `MDR-CLS-001` as a document | The content is entirely in [02](./02-qualificazione-e-classificazione.md); what is missing is the document form with a revision and verified references | Project | Yes |
| 3 | **General requirements matrix** `MDR-GSPR-001` | It has never been compiled. It is the longest document in the file and the one requiring a line-by-line reading of Annex I | Project up to the penultimate column, then manufacturer | Yes, but it is the most underestimated work package |
| 4 | **Risk file** `RM-FILE-001` | The entries and the method exist ([05](./05-gestione-del-rischio.md)); what is missing is the plan with the acceptability criteria, which is a choice of the manufacturer | Manufacturer for the plan, project for the content | Partly: the entries yes, the history of the decisions no |
| 5 | **Usability engineering file** `UEF-001` | The formative evaluation must be carried out **during** development; a formative evaluation reconstructed afterwards is not a formative evaluation | Project | **No** for the formative part |
| 6 | **Clinical evaluation plan and report** | An autonomous 6–9 month path that has not been started | Manufacturer | Yes, but it lengthens the schedule by the same amount |
| 7 | **Post-market surveillance plan** `PMS-PLAN-001` | Not drafted; and some indicators require product capabilities not yet declared ([`Q-116`](../11_registri/02-questioni-aperte.md#q-116)) | Project for the capabilities, manufacturer for the plan | Yes for the document, **no** for the data not collected |
| 8 | **Label and instructions for use** | Neither the device information screen nor the document exists | Project for the space, manufacturer for the content | Yes, but a late interface change reopens the usability evaluation |
| 9 | **Register of third-party components** complete with the annotations | The mechanism is defined ([01_technical/01 §14](/01_technical/01-stack-e-motivazioni.md), [01_technical/09](/01_technical/09-integrazione-continua-e-rilascio.md)); the complete inventory is populated with the first build chain | Project | **No at full cost**: inventorying the components after the fact costs 3–5 times as much (`D45`) |
| 10 | **Traceability matrix** as a release artefact | The identifiers are frozen ([`V-120`](../11_registri/01-vincoli-in-vigore.md#v-120)), the generation is not yet in operation | Project | **No**: it is the retroactively unrecoverable element par excellence |
| 11 | **Operating environment requirements** `MDR-ENV-001` | No threshold has been measured; no reference device is declared ([`Q-115`](../11_registri/02-questioni-aperte.md#q-115)) | Technical and product | Yes |
| 12 | **Determination of the measuring function** | Question [`Q-173`](../11_registri/02-questioni-aperte.md#q-173) open | Domain and functional | Yes, but it conditions whole rows of the matrix |
| 13 | **Document templates for the health record document types** | Templates, codes and metadata do not appear to be publicly available: question [`Q-07`](../11_registri/02-questioni-aperte.md#q-07) | External to the project | Yes, with a dependency on a third-party body |
| 14 | **Declared support period** and end-of-support date | Question [`Q-155`](../11_registri/02-questioni-aperte.md#q-155), a decision of the project owner | Project owner | Yes, but it is a mandatory element of the documentation for the customer |

**Rows 5, 9 and 10 are of a different nature from the others and are to be read together.** They are
the three items in which time cannot be recovered with money: a formative usability evaluation
cannot be performed after the fact on an interface that is already frozen; a component inventory
reconstructed on a mature project is an archaeological operation; a traceability matrix
reconstructed by reading the code is an **interpretative** operation, and a notified body has no
reason to believe it. They are precisely the activities `D45` places among those to be started at
once **irrespective of who will exercise the manufacturer role**, and the reason why the project
takes them on despite not being a manufacturer today.

**`D58` makes them more urgent, not less, and the point must be made without sweetening it.** As
long as the certification path was attributed to an external party, these three activities were an
investment in favour of a hypothetical third party: doing them well was diligence, and the cost of
omission would have fallen on somebody else. Since `D58` the party is us, so **the cost of omission
is entirely ours**: a formative evaluation not carried out, a component inventory not produced and a
traceability matrix not generated are, literally, months the project takes away from **its own**
path, not from somebody else's. None of the three is recoverable with money or with overtime.

## 12. What only the manufacturer can add

The list that follows is closed and is to be read as such: **none of these items is obtainable
today**, in any form, not even in draft, not even with a consultant's help. Each one presupposes a
legal entity, an act of will or a responsibility that **do not exist today**.

> **Why this section did not grow shorter with `D58`, and could not.** `D58` establishes that the
> project **intends** to assume the manufacturer role - with the entity that would exercise it
> **still to be constituted** - and amends `D28`, `D49` and [`V-06`](../11_registri/01-vincoli-in-vigore.md#v-06) **in their addressee**, not in
> their technical substance. The fifteen items remain fifteen, for a reason that is not formal: they
> are **acts the regulation reserves to the manufacturer role**, and they remain reserved to that
> role **even when the role is ours**. Affixing the marking, signing the declaration of conformity,
> appointing the person responsible for regulatory compliance, submitting the application to the
> body: none of these acts becomes capable of being brought forward because the intention has been
> declared. **The intention is not the entity**, and the entity - item 1 - is the constraint
> furthest upstream of all the others.
>
> **What `D58` really changes.** It changes the implicit "whose task is it" column: these fifteen
> items are no longer a third party's manual, they are **our list of obligations**. They therefore
> become a matter for the project's internal planning (`D57`), and item 1 - the constitution of the
> entity - is an **internal prerequisite with a time of its own**, not a wait.
>
> **What `D58` does not change.** The product today **bears no CE marking**, is covered by no
> declaration of conformity and **whoever deploys it, integrates it or puts it into service assumes
> the resulting obligations**: the project's intention to certify in future **transfers none of them
> to them**, and allowing that to be inferred would be more harmful than silence. No date appears in
> this section, nor can any appear in it ([`V-171`](../11_registri/01-vincoli-in-vigore.md#v-171)).

| # | Element | Why it is irreducible |
|---|---|---|
| 1 | **Existence of the manufacturer**: legal entity established in the Union with a tax identifier | No notified body opens a file without an identified manufacturer. Constitution takes weeks and is the constraint furthest upstream |
| 2 | **Economic operator registration number** and registrations in the European database | They derive from Articles 27, 29 and 31 of the MDR and presuppose the entity of row 1 |
| 3 | **Basic unique device identifier** and its structure | Assigned by the manufacturer through an issuing entity. Item 1.1 b of Annex II |
| 4 | **Document control** and formal approval of every document of the file | It is the property that turns an analysis into a document of the file (§ 1). It requires a manufacturer's quality management system |
| 5 | **Appointment of the person responsible for regulatory compliance**, with a qualification dossier | Article 15 MDR. It is a personal position, with documentable qualification requirements |
| 6 | **Determination of the risk acceptability criteria** and of the overall residual risk | [05 §8](./05-gestione-del-rischio.md): it cannot be delegated to a supplier, to a consultant or to a table |
| 7 | **Clinical evaluation** conducted and signed by a qualified evaluator, and benefit-risk analysis | Article 61 and Annex XIV. It presupposes access, competence and clinical responsibility |
| 8 | **Summative usability evaluation** with representative users | It requires recruitment, an approved protocol and a frozen product: it is an activity of the manufacturer, not of the project |
| 9 | **EU declaration of conformity** | Article 19 and Annex IV. It is the act by which a person assumes responsibility for the product |
| 10 | **Affixing of the CE marking** with the notified body's number | Articles 20 and 52(6) |
| 11 | **Application to the notified body**, including the declaration that the same application has not been submitted to another body | An express requirement of Annex IX. It is a declaration, not a technical document |
| 12 | **Quality management system manual and procedures**, with the evidence of the cycle: internal audit, management review, corrective actions | Article 10(9); Annex IX, section 2. It presupposes an organisation operating the system for at least one full cycle |
| 13 | **List of sites, suppliers and critical subcontractors**, and the related contracts | Annex IX, section 2.2; Article 10(9)(d) `[NV]` to be verified by `Compliance` |
| 14 | **Insurance cover** for liability for defective products | Article 10(16) `[NV]` to be verified by `Compliance`. It is a contract, and no technical document substitutes for it |
| 15 | **Submission to an on-site audit** of its own premises and infrastructure | The body inspects the development environment and the build chain **of the manufacturer**, not those of a public repository |

**Row 15 deserves to be developed, because it is the surprising one.** A notified body does not
inspect a repository: it inspects **an organisation**. It verifies on site who has write access, how
a release is authorised, who signs the artefacts, where the keys are, how it is demonstrated that
the written procedure corresponds to practice. An open project can make this verification easy - by
publishing the build chain, the blocking checks, the review rules and their actual application - but
it cannot substitute itself for it. **The difference between making it easy and substituting oneself
for it is the entire distance between what the project is today and the CE marking**, and `D58` does
not shorten that distance by a metre: it merely states who intends to travel it. From which follows
an operational consequence that now concerns us and not a third party: **the organisation the body
will inspect is the one we have to constitute**, and an organisation is not improvised on the eve of
an on-site audit.

### 12.1 Rebuilding the sources does not reproduce the file, nor the device

It must be said here because it is the point at which the chapter is most exposed to a technical
misunderstanding, and because without saying it the distinction between the repository and the
identified distribution reads as a formality of naming.

**Reproducible build is a valuable property and it is not the marking.** The project pursues
reproducible builds and bills of materials generated by the chain, because they are evidence of
compliance and because without them items 9 and 10 of § 11 would not be recoverable. But **what
makes an artefact *that* device is not the content of the sources**: it is the controlled build
chain, the release under the manufacturer's quality management system and the identification that
follows from it. A marking covers **the exact artefact assessed, in the exact version in which it
was assessed**: it does not extend to the sources from which it is built, nor to any build performed
by others, nor to a later version that was not assessed.

It follows, without softening, that **whoever recompiles the sources produces their own artefact, of
which they are the manufacturer**, with all the obligations § 12 lists - and they assume them in
full even on the day an identified distribution is marked. It is the technical reason why item 4 and
item 15 of § 12 cannot be substituted by any property of the code: no build reproducibility produces
document control, and no compiler determinism substitutes for an inspectable organisation.

## 13. The notified body: what it does, and what it does not do

In the procedure applicable to Class IIa - quality management system based assessment, **Annex IX,
Chapters I and III**, with the assessment of the technical documentation of **section 4** for at
least one representative device per category (Article 52(6)) - the body carries out four distinct
activities.

| # | Activity | Basis | What it means for software |
|---|---|---|---|
| 1 | **Assessment of the quality management system**, with an on-site audit | Annex IX, section 2 | The "premises" are the development environment and the build and release infrastructure |
| 2 | **Assessment of the technical documentation** | Annex IX, section 4 | With a single product it means: the file is examined in full |
| 3 | **Surveillance** at least annually, with audits also without notice | Annex IX, section 3 | Verification of implementation, of the surveillance data, of the corrective actions and of the updating of the file |
| 4 | **Prior approval of substantial changes** to the system and to the device | Annex IX, sections 2.4 and 4.10 `[NV]` to be verified by `Compliance` | It is the point at which the software release cycle and the regulatory regime come into conflict |

**The certificate has a maximum duration of five years** `[NV]` to be verified by `Compliance` on the precise section reference,
renewable on a new assessment.

**What the body does not do, and which needs to be known before looking for one.** It does not
draft, it does not correct and it does not advise: the impartiality requirements of **Annex VII**
prohibit the body carrying out the assessment from providing consultancy to the manufacturer being
assessed. Consultancy and assessment are different parties. Anyone offering both is either breaching
the impartiality regime or is not a notified body: in either case their offer is a warning sign, not
an advantage.

**How a designated body is identified.** The Commission's official database lists bodies by
legislation, Member State and **scope of designation**, and is today reachable through the single
internal market compliance portal. For each candidate, two distinct and independent sections must be
read: the **conformity assessment procedures** for which it is designated - Annex IX, Chapters I and
III, must appear - and the **designation codes** relating to device types, established by
**Implementing Regulation (EU) 2017/2185**. Standalone medical device software is an active device
and falls under a code of the `MDA` family corresponding to the clinical function, alongside a
horizontal code of the `MDS` family relating to devices incorporating software.

> **The exact codes `[NV]` - to be asked of the candidate bodies have not been confirmed against a primary source.** The number of the
> `MDA` code applicable to telemedicine and remote monitoring software and the literal wording of
> the horizontal code must be taken from the annex to the implementing regulation. In any event, and
> independently of that verification, the reliable route is **to ask each candidate body to state in
> writing under which codes it would handle the device**: it is accepted practice and it is more
> robust than any documentary reconstruction.

**Three separate checks, which always get confused.** Presence in the database indicates only the
scope of designation. It does not say whether the body **accepts new clients**, what its queue is,
nor whether it has real competence in software. These are three distinct questions, they must be
asked in writing and the answers must be kept. Nor should the search be restricted to national
bodies: designation has effect throughout the Union and the working language is negotiable. The
correct criterion is **codes plus software competence plus real availability**, not nationality.

**On costs the project produces no estimates, and the reason is that a primary source exists.**
**Annex VII, section 1.2.8**, obliges notified bodies to make publicly available the list of their
standard fees, and the Commission maintains the list of links to the published fees. Estimating in
the presence of a public source would be a methodological error. What can be said is the
**structure** of the cost - file opening fee, documentation assessment, initial two-stage audit,
review cycles on the responses to non-conformities, maintenance fee, annual surveillance,
unannounced audit, assessment of substantial changes - and a warning about comparing offers:
**comparing daily rates is misleading**, because the body that is cheapest per day may turn out to
be the most expensive overall if it generates more non-conformity cycles or if it has longer queues.

## 14. Why the notified body is the limiting factor of the schedule

It is the point at which this chapter says the most uncomfortable thing, and it says it because it
is arithmetic and not opinion.

**The data.** 51% of bodies take **13–18 months** from signature of the agreement to the
certificate and 31% take **19–24 months**. At the end of 2025 the gap between applications and
certificates was **25,978 applications against 13,953 certificates**. The bodies' staffing is
**contracting**: −8% internal staff and −21% subcontractors between 2024 and 2025, for the first
time in over a decade. The time between offer and contract is under two months in two thirds of
cases, but **the time preceding acceptance is measured by nobody**, and that is the dangerous one.

**The consequence.** No quantity of work on the software shortens this queue. A perfect file
delivered early does not produce a certificate early: it produces a place in the queue early, which
is a different thing and is still worth having, but it must be called by its name. From this follows
the planning rule that governs the whole area:

> **Development and certification are two paths with independent clocks.** The first is controlled
> by the project; the second is controlled by a third party with unmeasured queues. Treating them as
> a single plan produces a date that does not depend on whoever promises it.

**The aggravating factor, to be taken into account in the negotiation and not discovered
afterwards.** A new manufacturer, micro-sized, at its first certification, with a software product
and an open development model **is not a priority client** for a body with a full queue. It is a
market fact, not a judgement: the countermeasure is to contact five or six bodies simultaneously and
to present oneself with the classification determination, the draft intended purpose and the index
of the file already prepared. A manufacturer that knows what it is asking for is accepted more
easily, and that is precisely the material this chapter maps.

**The dates are not here.** The time scenarios, the backward calculation, the irreversible decision
points and the calendar of the phases are in chapter
[09 - Path and schedule](./09-percorso-e-calendario.md), which is the single place where this
documentation puts dates. Repeating them here would produce two calendars destined to diverge, which
is the documentary defect [03](./03-sistema-di-gestione-della-qualita.md) names. The only deadline
this chapter reiterates is the project's own: **at 30 November 2026 the goal is software complete,
tested and documented, with the technical file started** (`D5`, `D16`), and no artefact may imply
that at that date a marking exists.

## 15. How a file is kept up to date, and why that is the real cost

Article 10(4) requires the technical documentation to be **kept up to date**. For software with a
frequent release cycle this formula, read together with activity 4 of § 13, produces the structural
conflict between the rhythm of software and the regulatory rhythm.

**The question governing every release, after the certificate, is a single one:** does this change
affect safety, performance or approved conditions of use? If yes, it requires the notified body's
prior approval before being distributed; if no, it still requires the file to be updated and that
update to be traceable. **The answer cannot be improvised release by release**: it requires an
impact assessment procedure, with criteria written beforehand, applied by identified persons and
minuted. Chapter [08](./08-sorveglianza-post-commercializzazione.md) deals with the rules on
changes; here three consequences are recorded that fall on the file and on the project's way of
working.

**First.** An urgent security fix and a functional change have different regimes, and the release
chain must be able to distinguish them **before** building the artefact, not afterwards. A chain
that produces only one type of release forces everything to be treated as substantial.

**Second.** The bill of materials and the configuration status record of every release are documents
of the file, not by-products of the build chain. It follows that they must be retained with the same
discipline as the rest, for the whole duration of the retention obligation, and not until the expiry
of the artefact archiving of a continuous integration platform. **It is a recurrent error and it has
a banal form: the file refers to an artefact that was automatically deleted ninety days later.**

**Third, and it concerns the project directly.** Every change to the texts addressed to the user is
a change to the information supplied by the manufacturer (§ 5), and every change to public
communication may be an uncontrolled change to the intended purpose
([02 §10](./02-qualificazione-e-classificazione.md)). The guard is the regulatory review step for
public texts, question [`Q-174`](../11_registri/02-questioni-aperte.md#q-174). It is the only guard in the whole area that does not go through an
automated check and that no continuous integration control catches.

## 16. Self-check list before delivering a file

The items that follow are the findings that generate themselves, irrespective of the technical
quality of the product. They must be checked before delivery, and checking costs hours.

1. **Every reference carries an exact revision**, and the revision cited exists.
2. **The general requirements matrix contains no generic references** to a folder, to a website or
   to "the technical documentation": it refers to a document and to a section.
3. **The non-applicable items are present with their rationale**, not absent.
4. **Every verification outcome carries the version of the object verified** and the date.
5. **Residual anomalies are listed and assessed**, not omitted: a release without a list of residual
   anomalies is not a clean release, it is an undocumented release.
6. **The risk file and the general requirements matrix cite each other** and do not diverge.
7. **The intended purpose cited in the file, the one in the interface and the one in the public
   material are the same**, word for word wherever they are quoted.
8. **No document of the file uses a formulation prohibited** by constraint [`V-171`](../11_registri/01-vincoli-in-vigore.md#v-171).
9. **The release's bill of materials corresponds to what a new build would produce**: no floating
   tags, for the reason in clause 8.1.2 and not out of operational preference ([`V-173`](../11_registri/01-vincoli-in-vigore.md#v-173)).
10. **The surveillance plan states indicators the system actually produces.**

## 17. What this chapter leaves open

| Reference | Question | To whom |
|---|---|---|
| [`Q-172`](../11_registri/02-questioni-aperte.md#q-172) | **Versioning structure of the identified distribution and its relationship with the unique device identifier.** The project does not assign the identifier (item 1.1 b), but its choice of how a distribution is numbered and composed determines what that code will identify, which changes are new versions and which are new devices. It must be decided **before** the first release of the distribution, because a later renumbering is a discontinuity of identification | → Project owner, with architecture |
| [`Q-115`](../11_registri/02-questioni-aperte.md#q-115) | Operating environment thresholds and reference device: without them item 6.1 b has no test perimeter and `MDR-ENV-001` cannot be drafted (§ 9) | Technical, product |
| [`Q-173`](../11_registri/02-questioni-aperte.md#q-173) | Whether the presentation of parameters constitutes a **measuring function**: it determines the applicability of a block of Annex I requirements (§ 9) | Domain, functional |
| [`Q-116`](../11_registri/02-questioni-aperte.md#q-116) | Retention of observability signals and window for reconstructing an incident: it conditions the executability of the surveillance plan (§ 10) | Compliance, technical |
| [`Q-155`](../11_registri/02-questioni-aperte.md#q-155) | Declared support period and end-of-support date, an element of `MDR-LIFE-001` (§ 9) | → Project owner |
| [`Q-07`](../11_registri/02-questioni-aperte.md#q-07) | Document templates, type codes and metadata of the health record document types: not publicly available. It conditions item 6.1 for the documentary part | Compliance, with a third-party body |
| [`Q-24`](../11_registri/02-questioni-aperte.md#q-24) | Formal adoption as an architecture decision record of the artefact → regime table ([01 §5.1](./01-inquadramento-normativo.md)): it affects the perimeter of the file, because it establishes which artefacts are covered by the marking and which are not | → Project owner, with architecture |
| `[NV]` | Precise numbering of the sections of Annex I and Annex IX cited in §§ 7 and 13, and the duration of the retention obligation in § 1: to be re-verified against the consolidated text before appearing in a controlled document | `COMP` |
| `[NV]` | Designation codes applicable to the device (§ 13): to be verified in the Commission's NANDO database; harmonisation status of the standards on information supplied by the manufacturer and on symbols (§ 5): to be verified against the Commission's consolidated list | a request to the Commission, NANDO |
