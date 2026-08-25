---
title: Regulatory framing
sidebar_position: 2
description: The map of the rules that touch the project and why each one touches it. For every source, the obliged party, the date from which it applies and whether the obligation falls on the project or on the deployer. With the artefact → applicable regime table, the check on the allocation of roles and the three thresholds that would change the picture.
---

# Regulatory framing

> **Reading premise.** What a medical device, an intended purpose, a risk class, a manufacturer, a
> notified body and a harmonised standard are is explained from scratch in
> [10 §15 — The regulatory framework from scratch](../10_fondamenti/15-regolatorio-da-zero.md).
> **Here it is not repeated: it is attributed.** This chapter answers three questions for each
> source — *who the obliged party is*, *from when*, *whether the obligation is the project's or the
> deployer's* — and no others.
>
> **Warning.** This chapter is technical compliance analysis, **not legal or regulatory advice**.
> The legal qualification of a party and of a product depends on matters of fact to be ascertained
> case by case by a qualified professional. Where a source has not been verified against the
> primary text, it is marked **`[NV]`** and it is stated what is to be verified and with whom.

## 1. Why a map and not a list

A list of applicable rules is useless and dangerous at the same time. Useless, because it does not
say who must do what. Dangerous, because it produces in the reader the conviction of being covered
— or the opposite one, of being crushed by obligations that in reality do not concern them.

The only thing that matters, in a project built like this one, is **attribution**. The project
publishes source code; whoever takes it and puts it into service delivers healthcare services.
These are two different legal positions, and almost every rule in this chapter addresses the
second. Confusing the two is the most expensive error this documentation could make, in both
directions: attributing to the project an obligation it does not have means paralysing it;
attributing to the deployer an obligation the project should have satisfied means handing them a
product that cannot be certified.

### 1.1 The attribution rule, in three questions

Every section of this chapter applies the same procedure, in the same order:

1. **Who is the obliged party according to the definition in the rule?** Not "who is involved", not
   "who benefits": whoever the rule names.
2. **Does the project meet that definition today?** The answer is almost always no, and it is an
   answer **of fact**, not of principle.
3. **Which facts would make it meet the definition?** This is the part that has to be written,
   because it is the only one that makes answer 2 verifiable over time instead of a repeated
   formula.

### 1.2 Attribution legend

The same legend as the security area is adopted, so as not to introduce a second vocabulary:

| Code | Meaning |
|---|---|
| **P** | **Project.** The obligation — or the technical portion that makes it satisfiable — is the project's |
| **D** | **Whoever deploys, integrates or puts into service.** The project can supply evidence, templates and technical capabilities; it cannot substitute itself |
| **P+D** | **Shared.** Both parties have a portion, and **one party's portion does not cover the other's** |
| **—** | Not applicable to the object of the row |

**A row marked `P` does not relieve the deployer**: it requires them to verify that the deployed
configuration has not disabled what the product implements, and to keep the evidence of that. A row
marked `D` does not mean that the project takes no interest in it: it means that its contribution
is documentary. The measure-by-measure detail, for security alone, is in
[06 §09 — Allocation of responsibilities](../06_security/09-ripartizione-delle-responsabilita.md),
which **this area takes over and does not reopen**.

### 1.3 The fact on which almost everything depends

The project has, today, no direct obligations under most of the sources in this chapter, and the
reason is one and always the same: **it does not carry out a commercial activity and it places
nothing on the market**. It does not sell, it does not offer managed services, it does not invoice
support, it does not monetise.

This fact:

- **does not depend on the licence.** No licence confers immunity, and the argument "it is open
  source, therefore it is not placing on the market" is legally unfounded: Article 2(27) of
  Regulation (EU) 2017/745 defines making available on the market as any supply "in return for
  payment **or free of charge**" in the course of a commercial activity;
- **does not depend on the will of whoever writes the documentation.** It can be ascertained by a
  third party;
- **is revocable.** Three thresholds would change it, and they are listed in § 12.

From this follows the editorial rule that governs the whole area: **the project's position is
always written in the present tense and with its condition**, never as a permanent property. "The
project is not a manufacturer" is false unless accompanied by the reason why. The correct
formulation is: *the project is not a manufacturer because it markets no device under its own name,
and it will cease not to be one the moment it does so*.

## 2. Regulation (EU) 2017/745 — medical devices

**Why it touches the project.** Because the functional scope includes remote monitoring with
evaluation of thresholds configured by the professional, and that function — not the video, not the
persistence, not the transport — constitutes *interpretation* of the data within the meaning of
MDCG 2019-11 Rev.1, Annex I, point d.1). The full reasoning is in chapter
[02 — Qualification and classification](./02-qualificazione-e-classificazione.md).

| Item | Content |
|---|---|
| **Obliged party** | The **manufacturer** (Article 2(30): whoever manufactures or has a device manufactured **and markets it under their own name or trade mark**), with obligations of their own for the authorised representative (Article 11), the importer (Article 13) and the distributor (Article 14) |
| **From when** | Applicable since **26 May 2021**, replacing Directive 93/42/EEC |
| **Attribution** | **D** for the entire block of Article 10 obligations. **P** only for the material that makes those obligations satisfiable by whoever assumes them |

**The attribution point, in full.** Article 2(30) requires **two cumulative elements**: having the
device designed or manufactured, **and** marketing it under one's own name. The project satisfies
at most the first. There is no "co-manufacturer by contribution" figure in the MDR: whoever
proposes a change to the code markets nothing and affixes no trade mark.

Article 16(1)(a) adds the case that directly concerns this project's integration model: whoever
makes a device available **under their own name, commercial denomination or registered trade mark**
assumes the obligations incumbent on manufacturers. This is literally the white-label product case,
which is the principal integration mode the project envisages. The integrator that embeds the
component in its own product and presents it to its own customers **is a manufacturer by operation
of law**, and not by contractual choice.

**What the project produces, and why it produces it despite not being a manufacturer.** Decision
`D49` settles the question: the project produces and publishes the technical file, the lifecycle
documentation under IEC 62304, the risk management under ISO 14971 and the usability engineering
file under IEC 62366-1, **but it does not constitute a manufacturer entity, does not engage
notified bodies, does not conduct the clinical evaluation and does not affix the CE marking**. The
reason is not generosity: it is that part of that material **cannot be recovered after the fact**
(`D45`), and its absence would make it impossible for *anyone* to certify later. Chapter
[04 — Technical file](./04-fascicolo-tecnico.md) lists item by item what this means.

**The Article 5(5) exemption is to be mentioned only in order to exclude it.** Devices manufactured
and used exclusively within health institutions in the Union are exempt from most of the
regulation, on condition — among others — that they are not transferred to another legal entity and
that the institution **justifies that the target patient group's needs cannot be met by an
equivalent device available on the market**. A health authority deploying a product developed by
third parties **has not manufactured it**, and the condition on the absence of equivalents on the
market is untenable for telemedicine. It is an apparent way out, improperly invoked in tender
proceedings: the project's documentation does not endorse it.

**Article 7 applies already today, and it applies to the repository.** The prohibition of
misleading claims about intended purpose, safety and performance — "in particular by ascribing
functions and properties to the device which the device does not have" — does not presuppose the
marking. Together with Article 2(12), which makes promotional material a source from which the
intended purpose is legally derived, it produces constraint **V-171** of § 11: no public artefact of
the project may contain formulations asserting or implying a compliance that does not exist.

## 3. Regulation (EU) 2016/679 — data protection

**Why it touches the project.** Because the system processes data concerning health within the
meaning of Article 4(15), and because **the mere fact that a person has a session with a specialist
is already data concerning health**, prior to and independently of the content of the session. The
premise is stated in
[06 §00 — Security, index and orientation](../06_security/00-indice.md) and is not reopened here.

| Item | Content |
|---|---|
| **Obliged party** | The **data controller** and the **data processor**, as defined by Articles 4(7) and 4(8), and 24, 26, 28 |
| **From when** | Applicable since **25 May 2018** |
| **Attribution** | **D** for all obligations. **P** only for the technical capabilities without which the obligations cannot materially be performed |

**The project is neither controller nor processor: it processes no data.** It supplies code. The
role is determined on the basis of who decides purposes and means (Articles 4(7) and 4(8)) and **is
not chosen by contract**: the contract acknowledges it. The moment there is a deployment processing
data, the roles lie between the integrator, its customers and its suppliers. The casuistry is
already mapped in
[07 §09 — Obligations of the integrator, §3.1](../07_integration/09-obblighi-di-chi-integra.md) and
this chapter **confirms** it in § 10.

**Four points of connection that belong to this area and not to the data area.**

1. **Risk assessment under ISO 14971 and impact assessment under Article 35 are two different
   exercises and do not merge.** The first concerns **harm to the person**; the second concerns
   **risks to rights and freedoms**. A risk may be acceptable in the first and unacceptable in the
   second, and vice versa. They connect — the impact assessment draws on the risk catalogue — but a
   single document purporting to serve both is a document that the notified body challenges and the
   supervisory authority does not recognise.
2. **Protection by design (Article 25) addresses the controller, not the producer.** Recital 78
   invokes producers, but does not create a direct obligation on them. What follows for the project
   is nonetheless binding at product level, because these are settings that **no controller can
   reconstruct afterwards**: recording disabled by default, minimal retention by default, logs free
   of clinical content by default (constraint `V-150` of `SEC`).
3. **The impact assessment is due** for large-scale processing of data concerning health with new
   technologies: the conditions of Article 35(3)(b) are amply met. It is the customer's. Supplying
   the structural material for it — description of the processing, flow diagrams, risk catalogue,
   list of measures with the automated test that verifies them — is simultaneously a service and a
   competitive advantage.
4. **Article 32 requires a procedure for regularly testing and evaluating the effectiveness of the
   measures**, not the measures. It is the difference between a list and a process, and it is what
   makes the project's automated verification pipeline evidence of compliance and not an
   engineering detail.

**Retention periods that are not negotiable** and that are cited here because they come from a
sectoral rather than a general source: **twenty-four months** for traceability logs and **twelve
months** for access and authentication data, under DM 19 novembre 2025 (the Ministerial Decree of
19 November 2025), Annex 4 (constraint `V-152` of `SEC`).

## 4. Directive (EU) 2022/2555 and d.lgs. 4 settembre 2024, n. 138 — network security

**Why it touches the project.** Not because the project is subject to it — it almost certainly is
not — but because **its users are**, and they contractually pass on to the supplier a substantial
part of their own obligations. The mechanism, the measure codes and the allocation are dealt with
at length in
[06 §08 — Regulatory framework and measures](../06_security/08-quadro-normativo-e-misure.md) and
[06 §09](../06_security/09-ripartizione-delle-responsabilita.md): **this area does not re-decide
them and does not rewrite them.** Only the three attribution elements are fixed here.

| Item | Content |
|---|---|
| **Obliged party** | **Essential** and **important** entities in the sectors identified by the annexes of Legislative Decree no. 138 of 4 September 2024, among them **health** (Annex I) and the **manufacture of medical devices** (Annex II) |
| **From when** | The decree has been in force since **16 October 2024**. The deadline for the measures is **subjective**: eighteen months from receipt of the communication of inclusion in the list (determination no. 379907 of 19 December 2025 of the national cybersecurity authority, Article 3(1)), applicable from **15 January 2026** (Article 9(3)). For entities included in 2026: measures by **31 July 2027**, notifications from **1 January 2027** (determination no. 127434 of 13 April 2026) |
| **Attribution** | **D** for all obligations towards the authority. **P+D** for twenty of the forty-three measures. **P** for five |

**Three consequences that belong to this chapter.**

**First: the deadline is not a date and is not hardcoded.** "31 October 2026" appears in no act: it
is the outer limit of the first wave. The product's compliance is to be **parameterised on the
individual user's deadline**. No document in this area, and no roadmap, may state an adaptation
date, because the date belongs to the customer.

**Second: data sovereignty has become a mandatory field in a filing to an authority.** Article 18
of determination no. 127437/2026 obliges the entity to declare its "relevant suppliers" by name,
with company name, tax code (codice fiscale), **country of the registered office**, procurement
nomenclature codes and relevance criterion. The project's constraint `V1` — no mandatory component
of the main path established outside the Union — therefore ceases to be a positioning argument:
**introducing a runtime dependency outside the EU is a data item that ends up in somebody else's
official filing.**

**Third: there is a conflict between the two regimes, and the authority recognises it.** Installing
endpoint protection on a medical device "could invalidate its certification". The derogation exists
but requires documented compensating measures, **which the supplier must provide**, because only
the supplier knows which components are covered by the marking and which alteration would
invalidate it. It is a project deliverable, not a customer problem: the *technical derogation
statement* is described in [06 §08 §6](../06_security/08-quadro-normativo-e-misure.md).

**A citation rule this area inherits and observes.** The detailed annexes of the determination have
not been read line by line (question `Q-151`). **No specific requirement of the baseline measures
is quoted verbatim in any document of this area.** What is cited are the codes, the split between
the two categories of entity and the arithmetic of the catalogue, which are verified.

### 4.1 Legge 28 giugno 2024, n. 90 — the second national regime

It sits alongside the previous one and does not replace it. It concerns public administrations,
**including health authorities**.

| Item | Content |
|---|---|
| **Obliged party** | The administrations and entities designated by Law no. 90 of 28 June 2024, among them local health authorities |
| **From when** | In force |
| **Attribution** | **D** for the obligations; **P** for the technical evidence that makes them performable |

Three elements relevant to the product:

- **Article 1** — report within **twenty-four hours** of becoming aware and full notification within
  **seventy-two hours**;
- **Article 8** — appointment of the **cybersecurity contact person**, an organisational obligation
  of the customer;
- **Article 14** — public contracts for IT goods and services in contexts connected with the
  protection of strategic national interests: obligation to take account of the **essential
  cybersecurity elements**, identified by DPCM 30 aprile 2025 (the Prime Ministerial Decree of 30
  April 2025, Gazzetta Ufficiale of 5 May 2025) as amended by DPCM 2 ottobre 2025, with **reward
  criteria** including geographical ones.
  **`[NV]`** — the texts of the two DPCM have not been read against the primary source in any of
  the project's research, and it is not verified whether a telemedicine supply falls within the
  technological categories of the annex: the list does not name healthcare software but does
  include **cloud services**. This is to be verified with a procurement adviser before any use in a
  tender.

**The operational consequence that matters more than any other, and there is only one: the
supplier's answers will be assessed against closed requirements — yes or no, with evidence — not
against narratives.** The national procurement guidelines recommend that administrations frame
requirements in a manner that is "clear, objective and as closed as possible". The project's
compliance documentation is therefore structured as a **requirement → evidence → precise reference**
matrix, which is exactly the structure required by lifecycle traceability: **one artefact for two
purposes**, not two artefacts.

## 5. Regulation (EU) 2024/2847 — cyber resilience of products

**Why it touches the project.** Because the exclusion in Article 2(2) — which removes from the
regulation products already covered by the MDR and the IVDR — **operates by product, not by party
and not by project**. The boundary therefore runs *inside* the perimeter of the artefacts produced,
and coincides with none of the boundaries already drawn.

| Item | Content |
|---|---|
| **Obliged party** | The **manufacturer** of the product with digital elements; with lightened obligations for the **open-source software steward** (Article 3(14) and Article 24), which must be a **legal person** |
| **From when** | In force since **10 December 2024**. Chapter on conformity assessment bodies from **11 June 2026**; reporting obligations of Article 14 from **11 September 2026**; general application, essential requirements and marking from **11 December 2027** (Article 71) |
| **Attribution** | **D** for the manufacturer's obligations. **P** for the production of the artefacts that make them satisfiable, adopted **voluntarily and without invoking exemptions** (`D27`) |

**Why the project invokes no exemptions.** Not out of caution: because the minimum set the
integrator-manufacturer will ask for anyway as part of its own due diligence — a machine-readable
bill of materials, a coordinated disclosure policy, a contact channel, a declared support period,
free and timely updates — **is the same set that satisfies ISO/IEC 81001-5-1, healthcare customers'
security questionnaires and the supply chain measures of the network regime**. Building it once
satisfies four regimes; building it four times is the error that the matrix in
[06 §08 §8](../06_security/08-quadro-normativo-e-misure.md) exists to prevent.

### 5.1 Artefact → applicable regime table

**This table closes question `Q-10` on the noticeboard and is the contribution required by `D41`.**
Its formalisation as an architecture decision record remains question `Q-24`, addressed to the
orchestration: **the table exists, the formal act adopting it does not.**

| # | Artefact | Medical devices | Cyber resilience | Rationale |
|---|---|:-:|:-:|---|
| A1 | **Source code repository**, maintained outside a commercial activity | — | — | It is not a product placed on the market; the owner, being a **natural person**, cannot be an open-source software steward, a figure reserved to a legal person (Article 3(14)) |
| A2 | **Identified distribution bearing the CE marking** under the MDR | **●** | — | Excluded by Article 2(2). The cybersecurity requirements come from Annex I, §§ 17.2 and 17.4, of the MDR |
| A3 | **Client development kit** distributed separately | — | **●** | It is not the device and is not covered by the marking; if placed on the market in the course of a commercial activity it is a standalone product with digital elements |
| A4 | **Embeddable component**, when distributed as an artefact in its own right | — | **●** | Same as A3. If instead it is **part of the marked distribution**, it follows A2: the placement depends on the perimeter of the marking, not on the name of the package |
| A5 | **Container images and distribution packages** not covered by the marking | — | **●** | Same as A3 |
| A6 | **Replaceable modules** supplied by the integrator | — | depends | They are not project artefacts: the regime is the integrator's, and is to be determined on its perimeter |
| A7 | **The integrator's commercial product** embedding the project | depends | depends | The integrator is the **manufacturer** of what it places on the market; if its product is a device, the exclusion applies, otherwise it does not |
| A8 | **Documentation, website, public material** | — | — | Not a product. But it is **regulatory material** within the meaning of Article 2(12) of the MDR: see § 11 |

**The three readings this table prevents.**

1. "We are a medical device, therefore the resilience regulation does not concern us" — false for
   A3, A4, A5.
2. "We are not a medical device, therefore we have no cybersecurity obligations" — false: it is
   exactly the condition that brings the product into the other regime from 11 December 2027.
3. "The licence transfers the obligations to whoever receives the code" — false at root. **No
   warranty disclaimer shifts the responsibility under a regulation onto the recipient.** Whoever
   integrates into a commercial product is a manufacturer by operation of law, whatever the licence
   says.

## 6. Directive (EU) 2024/2853 — liability for defective products

**Why it touches the project.** Because it is the only source in this chapter that operates
**towards the injured person**, that is, towards someone who has accepted no licence and signed no
contract. In the telemedicine domain the injured person is typically **the patient**.

| Item | Content |
|---|---|
| **Obliged party** | **Economic operators**: manufacturer of the product, manufacturer of a component, importer, authorised representative, distributor, with the gradation provided for by the directive |
| **From when** | Transposition deadline **9 December 2026**; it applies to products placed on the market or put into service **after** that date. This project is therefore born inside the new regime |
| **Attribution** | **D**, with an important reservation: the free and open-source software exemption applies only to software "developed or supplied **outside the course of a commercial activity**", and it is therefore the same condition as in § 1.3 |

**The four points that cannot be set aside**, and that this area takes over from decision `D28`
without softening:

1. **Software is a product**, irrespective of the mode of supply: standalone, embedded, in the
   cloud, as a service. The source file as such is instead considered information and not a
   product. **`[NV]`** — the literal wording of Article 4 and of the relevant recitals has not been
   verified against the primary source.
2. **Defectiveness is presumed** where it is demonstrated that the product does not comply with
   **mandatory product safety requirements laid down in Union law** intended to protect against the
   risk that materialised (Article 10). These include, as the case may be, the requirements of
   Annex I of the MDR, the essential requirements of the resilience regulation and Article 32 of
   the data regulation. **A regulatory non-compliance becomes a presumption of defectiveness in
   civil proceedings**: it is the link that connects this entire chapter to a financial
   consequence.
3. **Contractual exclusion does not operate towards the injured person** (Article 15). Clauses §§ 7
   and 8 of the Apache-2.0 licence are expressly subordinate to mandatory law and remain effective
   **between the parties to the licence**, for contractual liability and pure economic loss. They
   do not protect against: claims by the injured person, regulatory liability, liability for wilful
   misconduct or gross negligence.
   **`[NV]`** — the numbering of the equivalent Italian provision after transposition remains to be
   verified.
4. **A product safe at the date of release may become defective later**, where whoever retains
   control over it does not supply the necessary security updates. For a managed service, control
   is permanent. **Failure to fix a known vulnerability is, in this regime, defectiveness**: it is
   why the update service level and the declared support period are not commercial commitments, but
   elements of exposure.

**The only defence realistically available to a component supplier** is Article 11: the
manufacturer of a component is not liable if it proves that the defect is attributable to the
design of the product into which the component was integrated **or to the instructions of the
manufacturer of that product**. It operates only if the component's instructions were **correct and
complete**. It follows that the operating environment requirements, the integration documentation
and the regulatory status declaration are not formalities: **they are the evidence on which the
only available defence rests**, and they are to be treated as such in the technical file
([04 §3](./04-fascicolo-tecnico.md)).

The reverse must be said too, because it is true: the directive builds presumptions against those
**unable to produce evidence**. A project with a signed bill of materials, requirement-to-test
traceability, a public risk register, a signed change history and a documented vulnerability
handling process is, evidentially, in a **structurally better** position than a closed product that
has to reconstruct its evidence in court. **In this regime transparency is a defence**, not a risk.

## 7. Regulation (EU) 2025/327 — European health data space

**Why it touches the project, and it is the least intuitive point of the whole chapter.** Because
Chapter III introduces a compliance regime — technical documentation, declaration of conformity, CE
marking, **as a rule without a notified body** — for **electronic health record systems**, defined
by reference to the purpose of storing, intermediating, exporting, importing, converting, editing
or viewing personal electronic health data belonging to the priority categories. **A product may
fall under Chapter III while not being a medical device.**

| Item | Content |
|---|---|
| **Obliged party** | The **manufacturer of the electronic health record system**; specific obligations for importers and distributors |
| **From when** | In force since **26 March 2025**; general application from **26 March 2027**; **Chapter III from 26 March 2029**, and from **26 March 2031** for the systems referred to in Article 26(2). **`[NV]`** — the exact mapping of the dates to each provision is to be confirmed against the final article of the regulation: the secondary sources consulted diverge |
| **Attribution** | **D**. With the warning that the 2029–2031 horizon **does not authorise postponing the design**, because what Chapter III requires is structural |

**Why the project's assessment is that Chapter III concerns it with high probability.** The system
stores content attributable to the priority categories — reports, results, summary documents —,
exports and imports it to and from the integrator's system, and converts it into an exchange
format. These are exactly the functions Chapter III sets out to regulate. **`[NV]`** — the
conclusion is drawn from the definition as reported in a secondary source and is to be confirmed by
direct reading of the definitions in Article 2 and in Chapter III.

**The connection with the device regime is already written by the guidance.** MDCG 2019-11 Rev.1,
Annex I, point c.1), reproduces recital 42 of the regulation: where medical device software
**claims interoperability** with an electronic health record system, the essential interoperability
requirements apply to that device, and the common specifications for electronic health record
systems apply to it as well. Translated for this project: **the interoperability claim, which is a
central commercial argument, is also a regulatory fact with consequences of its own.**

Two programme consequences, both current:

1. **The data architecture must be designed today** for the priority categories and for the
   European exchange formats, which is precisely what the canonical dataset model with replaceable
   serialisations (`V-07`) makes possible without rewrites.
2. **The product's position with respect to this regulation must be declared**, as section 7 of the
   guidance itself requires: it is necessary to communicate exactly which modules make up the
   product and whether the product or any of its modules is subject to the device rules or **to
   other applicable legislation**. Not declaring it is in itself a documentary non-compliance.

One scope question remains open that is not this area's: **whether the project should also produce
the Chapter III documentation package**, partly doubling the effort. It is question `Q-171`,
addressed to the orchestration.

## 8. Accessibility

**Why it touches the project.** Because accessibility here **is not a matter of care, it is a rule
with a sanction**, and it is at the same time a **use-risk control measure** within the meaning of
IEC 62366-1: a consent control that a screen reader does not announce is not an awkward control, it
is a control that for that user **does not exist**.

| Source | Obliged party | From when | Attribution |
|---|---|---|---|
| **Directive (EU) 2019/882**, transposed by **d.lgs. 27 maggio 2022, n. 82** (Legislative Decree no. 82 of 27 May 2022) | Economic operators placing on the market the products and services listed | Products and services placed on the market from **28 June 2025** | **D**, with the warning in the following paragraph |
| **Directive (EU) 2016/2102**, transposed in Italy by **legge 9 gennaio 2004, n. 4** (Law no. 4 of 9 January 2004) and by the national agency's guidelines | Public bodies | In force | **D** where the customer is a public administration — that is, in the principal use case |
| **EN 301 549** | Reference technical standard, incorporating **WCAG 2.1 level AA** in clauses 9, 10 and 11 | — | **P** for the product, **D** for the service's accessibility statement |

**The personal scope of the first row is the delicate part, and it must be stated as it is:
telemedicine is not named** among the categories of products and services covered by the
Accessibility Act. The product would fall under it indirectly, if sold through a consumer-facing
electronic commerce channel, or possibly as a component of an electronic communications service.
**`[NV]`** — the qualification of a video consultation service as a "number-independent
interpersonal communications service" is contested and has not been ascertained; it deserves
specific analysis before being asserted or denied in a contractual document. The **direct and safe**
route is the third row: where the customer is public, the obligation exists without any need to go
through the first.

**Why the project's requirement goes beyond WCAG, and it is the point a WCAG analysis does not
catch.** EN 301 549 contains requirements that do not derive from WCAG and that concern precisely a
video communication platform: **clause 6** (two-way voice communication) mandates audio quality,
**real-time text communication** where voice is supported, caller identification and — for video
communication — **resolution, frame rate and lip synchronisation sufficient for sign language**.
For a healthcare service intended also for deaf people these are not details.

**`[NV]`** — the version of EN 301 549 cited in the *Official Journal of the European Union* in
support of the Accessibility Act is not verified. Until then the legally effective reference
remains the version actually cited, and the project's accessibility statement must indicate the
version against which the verification was carried out, not "EN 301 549" in the abstract.

The project declares one single non-conformity, on the criterion concerning real-time captions,
with the interpreter as an alternative measure (`D24`). **Declaring a non-conformity is legitimate;
having one without declaring it is not.**

## 9. The Italian telemedicine framework

**Why it touches the project.** Because it is the source of the **definitions** of the services, the
**functional requirements** of the infrastructure, the **service levels**, the **document types**
and — at two express points — the **obligation to be certified as a medical device**, which comes
from the tender specification irrespective of the outcome of the European qualification analysis.

The vocabulary of the services and the workings of the health record are in modules
[10 §02](../10_fondamenti/02-prestazioni-di-telemedicina.md) and
[10 §07](../10_fondamenti/07-fse-e-infrastrutture-nazionali.md); the domain model that follows from
them is in [05 — The healthcare domain](../05_domain/00-indice.md). **Only the acts are listed
here, with their force and their attribution.**

| Act | What it imposes that matters here | Attribution |
|---|---|---|
| **Accordo Stato-Regioni 17 dicembre 2020, rep. atti n. 215/CSR** (the State-Regions Agreement of 17 December 2020, act no. 215/CSR), Annex A | Canonical definitions of the services; mandatory conditions for delivering a remote consultation (televisita); **obligation to produce a clinical report** stating the participating collaborators and the **quality of the connection with confirmation of its adequacy**; **encryption of all transfers** of voice, video, images and files; the patient's prior enrolment; obligation to complete in the traditional manner where the tool does not allow the content of the service to be kept unaltered; certification of the hardware and/or software as a medical device "appropriate to the type of service" | **D** for delivery; **P** for the capabilities: the connection-quality field, the encryption, the declared fallback |
| **DM 23 maggio 2022, n. 77** (Ministerial Decree no. 77 of 23 May 2022) | Places telemedicine inside the territorial organisational model. It lays down no software requirements: **it determines the context** in which the service is appropriate (planned care pathways) | **D** |
| **DM 21 settembre 2022** (Ministerial Decree of 21 September 2022, Gazzetta Ufficiale no. 256 of 2 November 2022, act 22A06184), Annex A | The **technically most prescriptive** act: four minimum services; microservice architecture; event-driven architecture; interoperability on the FHIR model; containers; distribution models **on national territory**; **mobile first paradigm**; multilingual support; conformity with the design guidelines for public digital services and with those on accessibility; mandatory organisational presence of a technical **Centro servizi** (service centre) and a clinical **Centro erogatore** (delivering centre); corrective maintenance service levels binding on suppliers; **obligation of certification as a medical device** for remote monitoring and for *viewers* and reporting in histopathology and radiology specialist-to-specialist consultations (teleconsulti) | **P+D**: the technical requirements are product requirements, the presence of the two centres and the service levels are organisational |
| **DM 30 settembre 2022** (Ministerial Decree of 30 September 2022, Gazzetta Ufficiale no. 298 of 22 December 2022, act 22A07125) | Governs the selection of solutions: regional operational plans, technical commission, **purchase exclusively through the tenders of the lead regions** within the perimeter of the national plan. Annex B: a remote consultation (televisita) delivered by a primary care physician or paediatrician **requires no prescription** and produces a **digital note in place of the clinical report** (constraint `V-145` of `DOM`) | **D**, with a determining effect on the route of access to the public market |
| **DM 7 settembre 2023** (Ministerial Decree of 7 September 2023, Gazzetta Ufficiale no. 249 of 24 October 2023) | Framework of the electronic health record (Fascicolo Sanitario Elettronico): contents, parties, consents, feeding, consultation. **Article 15(4): permanent exclusion of insurance companies, loss adjusters and employers from access** (`D48`, `V-08`) | **D** |
| **DM 31 dicembre 2024** (Ministerial Decree of 31 December 2024, Gazzetta Ufficiale no. 53 of 5 March 2025) | Establishment of the health data ecosystem | **D** |
| **DM 19 novembre 2025** (Gazzetta Ufficiale no. 301 of 30 December 2025, act 25A06938) | Rules on the processing of data in the national telemedicine platform. **Article 7: ten new health record document types** dedicated to telemedicine, with the information set published in the Gazzetta Ufficiale (`D30`, `V-143`); **Article 12: regional infrastructures do not retain** the data and documents generated; **Articles 14–15**: logging of operations and security measures; **Annex 4**: retention periods (24 and 12 months), authentication through the three national channels and a second factor, **obligation to inventory the software components including third-party and open source libraries** | **P+D**. The inventory obligation is the point at which a **bill of materials becomes Italian regulatory compliance**, not good practice |

**Three methodological warnings about this block, which count for more than the individual rows.**

**First — the chain of sources is irregular, and this must be stated.** Annex 4 of DM 19 novembre
2025 incorporates by reference the chapter of a **technical tender specification of a regional
procurement**, and extends the measures set out there to all regional infrastructures, including
those that did not take part in the procedure. A binding source referring to a tender document is
not consultable by ordinary means. **`[NV]`** — the chapter referred to has not been obtained: it
must be requested from the central purchasing body or retrieved from the records of the procedure.
Until it is read, **no assertion of compliance with those measures is tenable**.

**Second — data residency has two levels and they must not be flattened.** DM 21 settembre 2022
prescribes distribution models "on national territory"; DM 19 novembre 2025, for the
interoperability node, prescribes "EU territory". **The two formulations do not coincide.** The
documentation must represent both: **at least EU** for the interoperability node, **national** for
the regional infrastructures. This is the legal basis for the three distribution profiles of `D24`.

**Third — the certification requirement can arrive from the tender specification even before it
arrives from the qualification.** It is the reason chapter
[02 §6](./02-qualificazione-e-classificazione.md) exists: in the Italian public market the
obligation to be a medical device may be **contractual** and precede by years any conclusion drawn
from the European qualification tree.

## 10. Check on the allocation of roles

**This section answers question `Q-162` of `INTEG`**, which asked this area for a compliance review
of the allocation table between data controller and data processor, manufacturer, identity service
provider and party obliged under the network security regime, before the publication of
[07 §09](../07_integration/09-obblighi-di-chi-integra.md).

**Outcome: the table is confirmed.** The thirty-seven rows are consistent with this chapter's
attribution and contain no wrong attributions. **Five clarifications** are added that do not
contradict it and complete it.

| # | Clarification | Row concerned |
|---|---|---|
| 1 | **The economic operator role for product liability purposes must be added as a fifth role**, because it coincides with none of the other four and operates towards a party — the injured person — who appears in no row. The integrator is the **manufacturer of the product**; the project, were it ever to be one, would be the **manufacturer of a component**, with only the Article 11 exemption and on the conditions in § 6 | new row, after 7 |
| 2 | **The manufacturer role under the resilience regulation is distinct from the one under the device rules**, and may fall on someone who is not a device manufacturer: the artefact → regime table of § 5.1 is to be annexed to row 4.4 of that chapter | row 21 |
| 3 | **The manufacturer role under the health data space regulation is a possible sixth role**, with a 2029–2031 horizon, and **is covered by no existing row**. It is to be added as an item to be watched, not as a current obligation | new row |
| 4 | The row on **joint controllership** is to be strengthened: joint controllership **is not a convenient choice** between the two preceding options. It arises where two parties determine purposes and means *jointly*, and it entails the Article 26 arrangement with the designation of a point of contact and the essence made available to the data subject | row 8 |
| 5 | The row on the **authentication level of assurance** is to be read together with constraint `V-165` of `INTEG` and `V-154` of `SEC`: **a level reported by an integrator does not satisfy a strong authentication obligation**. It is a compliance clarification, not an architectural one, and it belongs in this table because it is the point at which an error produces a breach of the law and not a defect | row 26 |

**No row is removed and no attribution is reversed.** In particular, this area **confirms** the
attribution of shared rows 7, 16, 19, 20, 23, 29, 32 and 37 and strengthens its warning: a shared
responsibility with nobody watching it is nobody's responsibility, and it must be assigned by name
in the contract, not in the documentation.

## 11. The formulations no artefact of the project may use

**This section establishes constraint `V-171`.** It has the same basis as constraint `V-133` of
`PROTO` — which prohibits unfounded conformity claims about protocols — and extends its logic to
the regulatory plane. The basis is Article 7 and Article 2(12) of Regulation (EU) 2017/745:
promotional material **is** regulatory material, and a misleading statement about intended purpose,
safety or performance is prohibited **even where no marking exists**.

| Prohibited formulation | Why | Admitted formulation |
|---|---|---|
| "medical device", referring to the repository or the documentation | The repository is source code. Ascribing that status to it is false in both directions | "source code designed **so that it can be certified** as a medical device. **The product bears no CE marking**; the project **intends** to constitute the manufacturer entity, which today **is not constituted**, and to undertake the certification path" |
| "CE marked", "certified", "MDR compliant" | There is no marking, no declaration of conformity, no notified body assessment | "not yet CE marked, **not usable for the delivery of healthcare services to real patients**" (`D16`) |
| "ISO 13485 certified" | The certificate does not exist. A quality management system that is **implemented** is not a **certified** system | "quality management system set up in accordance with ISO 13485, **not certified**" |
| "class IIa" used as an attribute of the product | The class is the outcome of a formal determination referring to an intended purpose and to an exact revision. Outside that context it is a statement without an object | "the project's classification determination, referring to the intended purpose in revision *n*, concludes for class IIa" |
| "GDPR compliant", "NIS2 compliant" | Compliance belongs to a controller or to an obliged party, not to software. A product **enables**, it is not compliant | "supplies the technical capabilities and the documentary evidence required by…" |
| "clinical quality", "adequate for diagnosis" referring to the channel | It is a claim of clinical performance, and as such it must be demonstrated in the clinical evaluation | verifiable technical statements about resolution, frame rate and continuity, **without claiming diagnostic adequacy** (`D29`) |
| "accredited" referring to the national identity channels | The service provider is whoever delivers the online service, that is, the deployer (`V-05`) | "conformant and verifiable in continuous integration, **not accredited**" |
| "real-time monitoring", "continuous surveillance" | It shifts the classification and contradicts `V-144` | "**deferred** collection of parameters for **periodic review** by the professional" |

**The register with which the intention is named, and why it is as binding as the table.** Since
`D58` the project intends to assume the manufacturer role, and naming that intention is the
formulation most easily allowed to slip into a prohibited statement. Four formal rules therefore
apply in every artefact:

1. **the intention is expressed with the verb "intends"**, never with a simple future: "the project
   intends to certify", not "the project will certify";
2. **the absence of the legal entity is repeated in the same sentence** in which the intention
   appears, and cannot be deferred to a footnote;
3. **the negative statement of fact comes first**, in bold, before any mention of the path: no CE
   marking, no declaration of conformity;
4. **no date, no time window, no "by"**. The only admitted occurrence of that word is **inside the
   statement of the prohibition itself**.

**And the misunderstanding the four rules serve to prevent**, named because it is already
foreseeable: "they are certifying, so I can use it". It is a **wrong** conclusion. The intention to
certify **covers nobody**, transfers no obligation and does not make an uncertified version usable:
whoever deploys, integrates or puts the software into service today assumes in full the resulting
obligations.

**The verification of this constraint is not documentary but procedural.** Every public text — page,
`README`, section heading, interface description, error message, announcement — is material from
which the intended purpose is derived. From this follows question `Q-174`, addressed to the product
and guide areas: **a regulatory review step is needed before the publication of any outward-facing
text**, with this table as the checklist.

## 12. The three thresholds that would change the picture

They are listed here because the project's position is **factual and revocable**, and a revocable
position must be accompanied by the conditions of its revocation. They are in order of probability.

| # | Threshold | What changes | Who decides |
|---|---|---|---|
| 1 | **Monetisation**: paid support, managed service, integration consultancy, recurring sponsorship | The condition "outside a commercial activity" falls away. From this follow: possible status as manufacturer under the resilience regulation; loss of the free and open-source software exemption in the product liability regime; approach to the notion of making available on the market | **Project owner** — question `Q-155` |
| 2 | **Constitution of a legal person** providing systematic and sustained support to development | The position of **open-source software steward** opens up (Article 3(14) and Article 24 of the resilience regulation), with lightened obligations and no administrative fines. In terms of certainty it is a **better** position than the current one, not a worse one | **Project owner** — question `Q-155` |
| 3 | **Distribution of a ready-to-use artefact** that a healthcare organisation could put into production without further work | It approaches the notion of **putting into service** (Article 2(29) of the MDR), which is the decisive threshold. There is a substantive difference between publishing sources requiring compilation, configuration and integration and publishing an immediately operational package. **`[NV]`** — no guidance dedicated to the open source distribution of healthcare software has been found: it is a real gap in the European framework | **Project owner**, with immediate effect on the distribution policy |

**Threshold 3 is the one that gets crossed through inattention.** The other two are decisions; this
one is the consequence of a choice of operational convenience — a pre-configured image, a "ready"
package, a one-command installation procedure. It is why the separation between repository and
distribution (`D17`) must be **formalised in a policy document** and not left to practice.

## 13. The calendar of the dates that matter

None of these dates is a project deadline. They are the dates that determine **when an obligation
becomes enforceable against somebody else**, and therefore when the product must be ready to supply
the evidence for it.

| Date | What | On whom it falls |
|---|---|---|
| **26 May 2021** | Applicability of the medical devices regulation | Manufacturer |
| **28 June 2025** | Accessibility Act for products and services placed on the market | Economic operator |
| **15 January 2026** | Applicability of the determination on baseline security specifications | Obliged party |
| **11 September 2026** | Reporting obligations for actively exploited vulnerabilities and severe incidents (resilience regulation, Article 14) | Manufacturer of products with digital elements |
| **31 October 2026** | **Outer limit** of the first wave for the baseline security measures — not a single deadline | Obliged party |
| **30 November 2026** | Delivery of version 1.0: software complete, tested, with the technical file started (`D5`, `D16`) | **Project** |
| **9 December 2026** | Transposition deadline of the product liability directive; it applies to products placed on the market after that date | Economic operator |
| **1 January 2027** | Notifications for entities included in 2026 | Obliged party |
| **26 March 2027** | General application of the European health data space regulation | Various |
| **31 July 2027** | Baseline security measures for entities included in 2026 | Obliged party |
| **11 December 2027** | General application of the resilience regulation: essential requirements, conformity assessment, marking | Manufacturer |
| **26 March 2029** | Chapter III of the European health data space regulation — electronic health record systems. **`[NV]`** on the exact mapping | Manufacturer of the system |

**One date is deliberately missing from this table: that of the CE marking. The omission stands,
and its reason has changed.**

As long as the certification path was attributed to an external party, the reason was simple: the
date was not the project's. Since `D58` that reason **is no longer true** — the project intends to
assume the manufacturer role, and the entity that would exercise it is still to be constituted —
but **the omission is not softened by a single day**, because the reason supporting it is stronger
than the previous one:

1. **An intention is not a dated promise.** Declaring that one intends to certify and declaring
   that one will be marked by a deadline are two different acts, and only the second produces a
   regulatory effect: a device's intended purpose is derived from published material as well
   (Article 2(12)) and misleading claims are prohibited even without a marking (Article 7). A
   published date **is read as a forecast of the outcome**, and no editorial caution manages to
   prevent that.
2. **The outcome does not depend on us alone.** The assessment of the technical documentation and
   the certification of the quality management system depend on the timescales of notified bodies
   with unmeasured queues: a date would be a commitment on an outcome the project does not
   determine.
3. **`V-171` admits no exception for internal planning.** Planning of ours **does not become a
   promise because it is ours**, and it does not become publishable as a date because it is
   sincere. No date, no window, no "by".

The backward calculation, the scenarios and the points of no return are
[the project's internal planning](./09-percorso-e-calendario.md) (`D57`), and are to be read with
the warning that opens that chapter.

## 14. What this chapter leaves open

| Reference | Question | To whom |
|---|---|---|
| `Q-24` | Formal adoption as an architecture decision record of the artefact → regime table of § 5.1. **The table now exists; the act adopting it does not** | → Project owner, with architecture |
| `Q-171` | Whether the project should also produce the Chapter III documentation package of the European health data space regulation | → Project owner |
| `Q-174` | Regulatory review step for public texts before publication, with the table of § 11 as the checklist | Product, guide |
| `Q-151` | Line-by-line reading of the detailed annexes of the security determination. **No specific citation before then** | Compliance |
| `[NV]` | Texts of the DPCM on essential cybersecurity elements in public contracts and verification of whether the supply falls within the technological categories (§ 4.1) | Compliance, with a procurement adviser |
| `[NV]` | Definitions and date mapping of the European health data space regulation (§ 7) | Compliance |
| `[NV]` | Literal wording of the definition of product and of the relevant recitals in the liability directive (§ 6) | Compliance |
| `[NV]` | Numbering of the Italian provision prohibiting the prior limitation of liability towards the injured person, after transposition (§ 6) | Compliance |
| `[NV]` | Version of EN 301 549 cited in support of the Accessibility Act (§ 8) | Compliance |
| `[NV]` | Qualification of video consultation as a number-independent interpersonal communications service (§ 8) | Compliance |
| `[NV]` | Chapter of the technical tender specification incorporated by reference in Annex 4 of DM 19 novembre 2025 (§ 9) | Compliance |
| `[NV]` | Precise article references of d.lgs. 5 agosto 2022, n. 137 (Legislative Decree no. 137 of 5 August 2022), on national obligations and on the Italian language requirement | Compliance |
| `[NV]` | Harmonisation status of the standard on security activities in the healthcare software lifecycle | Compliance |
