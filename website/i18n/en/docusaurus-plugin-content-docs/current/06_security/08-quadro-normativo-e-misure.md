---
title: Regulatory framework and controls
sidebar_position: 9
description: Which security rules apply and to whom, the subject-specific eighteen-month deadline, the exclusion by product and not by project, the conflict the authority itself acknowledges between endpoint protection and device certification, and the overlap matrix between the sources.
---

# Regulatory framework and controls

> **Reading prerequisite.** The general regulatory framework — what the medical device rules, the
> data protection regulation, the network security directive and the cyber resilience regulation
> are, and how they sit relative to one another — is in
> [10 §12 §10](../10_fondamenti/12-crittografia-e-sicurezza.md) and in
> [10 §15 — Regulatory from scratch](../10_fondamenti/15-regolatorio-da-zero.md). Here only
> security is dealt with, with the dates, the addressees and the points of conflict.
>
> **Warning.** This chapter is **technical compliance analysis, not legal advice.** The legal
> qualification of an entity and of a product depends on matters of fact that must be established
> case by case by a qualified professional.

## 1. The problem in one line

**The project is almost certainly not, in its own right, an entity subject to the national network
security rules.** Its users are — local health authorities, hospital trusts, accredited providers
above the size threshold, cloud healthcare management systems — and they **pass a substantial part
of their own obligations on to the supplier by contract**, through three cumulative mechanisms:

1. **Article 24(2)(d) and (3) of d.lgs. 4 settembre 2024, n. 138** (Legislative Decree no. 138 of 4
   September 2024), which makes supply chain security a mandatory measure **of the customer**;
2. **the supply chain measures of the national authority's baseline specifications**, which
   translate that obligation into verifiable documentary and contractual requirements;
3. **the obligation to declare relevant suppliers by name** introduced in 2026, which turns the
   composition of the chain into a datum transmitted to an authority
   ([07 §3](./07-catena-di-fornitura.md)).

## 2. Citation rule: what this chapter does not write

**Question Q-151.** The detailed annexes of the national authority's determination have not been
read line by line. A binding rule follows for this area and for every public document of the
project:

> **No individual requirement of the baseline security measures is quoted verbatim before the
> detailed annexes have been read.**

What this chapter does cite, and what is verified: the **codes** of the measures, their
**allocation** between the two entity types, their **correspondence** with the elements of Article
24(2) of the decree, the **proportionality clauses**, the **internal arithmetic** of the catalogue,
and the passages of the authority's reading guide that have been read.

What this chapter **does not** cite, and marks `[NV]`: the **text of the individual requirements**.
A supplier that misquotes a requirement produces, at the customer, a piece of documentary evidence
that does not close out — which is exactly the harm it was trying to avoid.

## 3. The deadline is subject-specific, not a single date

This is the most important correction in the chapter, because a wrong date hard-coded in a roadmap
produces a commitment the product cannot keep and a reassurance the customer cannot use.

**«31 October 2026» appears in no instrument.** It is the result of the combined effect of two
elements:

1. **Article 3(1) of determination no. 379907 of 19 December 2025 of the national authority**: the
   deadline for adopting the baseline security measures is set at **eighteen months from the
   entity's receipt of the notice of inclusion on the list**. The deadline for the duty to notify
   baseline significant incidents is **nine months** from the same date.
2. **The authority began sending inclusion notices in April 2025.** For entities that received it
   by 30 April 2025 — the large majority of the first wave — the eighteen months fall due by 31
   October 2026.

**The deadline is therefore subject-specific: every customer has their own date.** 31 October 2026
is the **outer limit of the first wave**, and it is the date beyond which the authority moves from
the accompanying phase to the inspection phase.

**For entities included for the first time in calendar year 2026 the picture is different**
(determination no. 127434 of 13 April 2026, Article 1): baseline security measures by **31 July
2027**; duty to notify baseline significant incidents **from 1 January 2027**.

One further element must be added, because it determines the moment at which the product meets the
market: according to the authority's clarifications, entities **are not required to renegotiate
contracts in force**, but they must insert the security requirements «into contracts that are
**new, renewed or extended** from the deadline for adopting the measures onwards».

**Product consequence, and it is written down because it is the part that gets forgotten:
compliance must be parameterised on the individual user's deadline, not on a hard-coded date.** The
product must be able to declare which evidence it supplies; **it cannot declare a date**, because
the date is the customer's. This is question Q-09 on the noticeboard, addressed to the roadmap.

### 3.1 The other dates that matter

| Date | What | Source |
|---|---|---|
| **15 January 2026** | Applicability of the determination on the baseline specifications, which replaces the April 2025 one | Det. no. 379907/2025, Art. 9(3) |
| **11 June 2026** | Applicability of the chapter on the notification of conformity assessment bodies of the cyber resilience regulation | Reg. (EU) 2024/2847, Art. 71 |
| **11 September 2026** | **Applicability of Article 14**: obligations to report actively exploited vulnerabilities and severe incidents | Reg. (EU) 2024/2847, Art. 71 |
| **31 October 2026** | Outer limit of the first wave for the baseline measures | §3 |
| **1 January 2027** | Start of the notification duty for entities included in 2026 | Det. no. 127434/2026 |
| **31 July 2027** | Baseline measures for entities included in 2026 | Det. no. 127434/2026 |
| **11 December 2027** | The rest of the cyber resilience regulation: essential requirements, conformity assessment, marking | Reg. (EU) 2024/2847, Art. 71 |

## 4. The baseline measures: structure, not content

| | **Important** entities | **Essential** entities |
|---|---|---|
| Measures and requirements | **37 measures, 87 requirements** | **43 measures, 116 requirements** |
| Baseline significant incidents | 3 types | **4 types**, the fourth devoted to unauthorised access or access with abuse of privileges |
| Supervision | *ex post* | *ex ante* and *ex post* |
| Maximum penalty | up to €7m or 1.4% of worldwide annual turnover | up to €10m or 2% |

The internal arithmetic, verified against the authority's reading guide: **27** measures have
identical requirements for both types; **10** have additional requirements for essential entities
only; **6** are provided for essential entities only. 27 + 10 + 6 = 43; 43 − 6 = 37.

**Working assumption of the project.** A platform providing remote consultation (televisita) and
specialist-to-specialist consultation (teleconsulto) for an essential entity will be classified as
a **relevant system**. The documentation therefore presumes application of the **stricter profile**
— second factor, encryption of backups, restore tests, network monitoring, endpoint protection —
and not of the minimum profile.

### 4.1 The four proportionality clauses

The specifications do not impose everything on everybody. The authority has articulated
proportionality with four clauses that appear in individual requirements and that, **when they
appear together, apply in cascade**:

| Clause | Effect |
|---|---|
| «for at least the **relevant** network and information systems» | Limits the **scope** to systems whose compromise would have a significant impact. It affects 13 requirements for important entities and **22** for essential ones |
| «in accordance with the outcomes of the **risk assessment**» | Manner and scope defined by the outcomes of the assessment. 6 and **10** requirements |
| «save for **justified and documented regulatory or technical reasons**» | Derogation permitted, **with an obligation to adopt compensating controls** and to describe the residual risk in the risk treatment plan. 8 and **10** requirements |
| «supplies with potential impacts on security» | Limits the scope to supplies whose compromise may have effects on security. 3 requirements in both types, all on the supply chain |

The third clause is the one that underpins §6.

### 4.2 The lettered point that names this product

Among the ten elements that Article 24(2) of the decree requires to be covered, one expressly names
what the project does: point (l), «use of multi-factor authentication or continuous authentication
solutions, **secured voice, video and text communications**, and secured emergency communication
systems».

It is the only one that names secured communications. For a healthcare entity, an encrypted video
consultation platform with a text channel **is the means by which that measure is implemented**.
The measure on secured communications is reserved for essential entities only, and it is the one on
which the product's function hooks most directly onto a legal obligation.

### 4.3 Demonstrability is documentary

**There is no attestation template and no certification issued by the authority.** Demonstrability
is documentary and organisational, and the types of evidence are lists, inventories, plans,
policies, procedures and registers.

**Eleven documents require the approval of the management and governing bodies**: the information
security organisation; security policies; the risk assessment; the risk treatment plan; the
vulnerability management plan; the remediation plan; the business continuity plan; the disaster
recovery plan; the crisis management plan; the training plan; the incident management plan.

**The supplier approves none of these documents: they are approved by the customer's board.** But
**two cannot be drawn up without the supplier**: the inventory of services provided by suppliers,
and the vulnerability management plan, which has to take account of the vulnerabilities in the
product's dependencies. This is where the project's natural deliverable comes from: a **pre-filled
compliance file** that the customer incorporates — bill of materials, list of outbound network
flows, list of remotely accessible systems, reference configurations, allocation of
responsibilities, disclosure procedure.

## 5. The exclusion is by product, not by project

**Decision D41, and this section justifies it.**

Article 2(2) of Regulation (EU) 2024/2847 provides that the regulation **does not apply** to
products with digital elements to which, among others, Regulation (EU) 2017/745 on medical devices
and Regulation (EU) 2017/746 on in vitro diagnostic devices apply.

**The exclusion attaches to the product, not to the entity that produces it.** Three distinct cases
follow:

| Artefact | Does the resilience regulation apply? | Why |
|---|---|---|
| The distribution CE-marked as a medical device, placed on the market as such | **No** | The device rules apply. The cybersecurity requirements come from **Annex I, §§ 17.2 and 17.4** of the device regulation |
| Components distributed separately and **not covered by the marking**: development kit, embeddable component, distribution images and packages | **Potentially yes**, if placed on the market in the course of a commercial activity | A development kit that is not the device is not covered by the exclusion |
| The integrator's commercial product that embeds the project | **Yes**, unless it is itself a device | The integrator is the **manufacturer** of what they place on the market |

**The asymmetry must be documented**, because the boundary runs **inside** the project's perimeter
and coincides only partly with the boundary already drawn between communication vehicle and
clinical decision support. An architecture decision record is needed with the artefact → applicable
regime table: this is question Q-10 on the noticeboard, and Q-24 opened by the compliance area.

Two further points, which are the questions every integrator asks.

**The licence does not transfer regulatory obligations.** No warranty disclaimer shifts
responsibility under a regulation onto the recipient. **Whoever integrates into a commercial
product is a manufacturer by law**, regardless of what the licence says. This must be written
clearly in every document addressed to integrators.

**The project's current position.** The project is not, today, a product placed on the market in
the course of a commercial activity, and its owner, being a natural person, cannot be qualified as
an open-source software steward, a figure the regulation reserves to a **legal person**. No
obligation arises for the project today. **Three thresholds would change the picture**, in order of
likelihood: the move to a legal person providing systematic and sustained support; **monetisation**,
which makes whoever monetises a manufacturer; incorporation by a commercial integrator, which makes
the integrator the manufacturer. The first and the second are **decisions of the project owner**:
question Q-155.

Regardless of obligation, the declared strategy is to **be a good component**: to adopt voluntarily
the minimum set that the integrator-manufacturer will ask for anyway in the course of their due
diligence, which is the set in chapter [07](./07-catena-di-fornitura.md).

## 6. The conflict the authority itself acknowledges

**This is the piece of information with the greatest practical value in the whole chapter, and it is
the one customers do not know they can use.**

In its own reading guide, the national authority illustrates the clause «save for justified and
documented regulatory or technical reasons» with an example that concerns **medical devices
directly**. On the requirement for endpoint protection systems for malicious code detection, the
authority writes:

> «That requirement might however not be applicable in the case of endpoints such as, for example,
> **medical devices for which installing protection systems could invalidate their
> certification**.»

It is the **explicit** point of connection between the two regimes. An entity that uses the product
as a CE-marked medical device may derogate from that requirement, but must **justify and document**
the regulatory reason and adopt **compensating controls** entered in the risk treatment plan.

**The compensating controls are on the supplier.** Not in the sense that the supplier applies them
in the customer's place, but in the sense that **the customer cannot document them without the
supplier**: only the supplier knows which components are covered by the marking and what alteration
would invalidate it. A precise deliverable follows, which the project produces as part of the user
package:

**A technical derogation statement**, which (a) identifies the components whose alteration would
invalidate the marking; (b) lists the **compensating controls available natively** — container
hardening, read-only filesystem, image integrity verification, external monitoring of process
behaviour, network segmentation; (c) defines the **supported configuration** for endpoint
protection on the hosting machine.

**Without this document the customer cannot close out the derogation**, and an unclosed derogation
is an unmet requirement at inspection. For the project it is a point of differentiation that costs
little and that almost no supplier provides.

## 7. The other sources and what each adds

| Source | Direct addressee | What it adds to this product |
|---|---|---|
| **Article 32 of Regulation (EU) 2016/679** | Data controller and data processor | Pseudonymisation and encryption; confidentiality, integrity, availability and resilience on an ongoing basis; restore capability; **a process for regularly testing and evaluating effectiveness** |
| **Article 25 of Regulation (EU) 2016/679** | Data controller | Protection by design and by default. Formally it is not addressed to the producer, but recital 78 brings them in: it must be **documented as a process**, not asserted |
| **Regulation (EU) 2017/745, Annex I §§ 17.2 and 17.4** | Manufacturer | Development in accordance with the **state of the art** with risk management covering information security; **minimum requirements for hardware, network and security controls** needed for the intended operation |
| Guidance on medical device cybersecurity | Manufacturer | A cybersecurity risk management process that is distinct from, and connected to, the safety one; security by design and by default; pre-market and post-market aspects |
| **Standard on security activities in the health software life cycle** | Manufacturer | A secure development life cycle integrated into the quality management system. **Its harmonisation status has not been established: `[NV]`.** Even if not harmonised it remains the reference of choice for demonstrating the state of the art |
| **Circular on minimum security measures for public administrations** | Public administrations | The public customer must demonstrate the controls **on the supplied component too**: software inventory, secure configurations, vulnerability management, separation of privileged accounts, log centralisation, encrypted and verified backups |
| **National guidelines on security in ICT procurement** | Purchasing administrations | **Made mandatory for regional telemedicine infrastructures** by DM 21 settembre 2022 (the Ministerial Decree of 21 September 2022) in the part concerning the actions on the choice of instrument, on tender requirements, on the committee's competences and on personal data protection. It is, in effect, **the security tender specification the product will find in front of it** |
| **Accordo Stato-Regioni del 17 dicembre 2020** (State-Regions Agreement of 17 December 2020) | Providers of telemedicine services | **All transfers of voice, video, images and files must be encrypted**; a register of maintenance and acceptance tests; functional testing after every significant update |
| **DM 19 novembre 2025, Annex 4** | Controllers in the telemedicine context | The **retention periods**: 24 and 12 months (V-152) |
| **Essential cybersecurity elements in public contracts** | Contracting authorities | Secure design free of known vulnerabilities; automatic updates; authentication and access control; encryption; transparent vulnerability management; assessment of the chain. **Geographic award criteria.** `[NV]` on the text of the implementing decrees |

A note on the procurement guidelines that has a direct effect on the form of the documentation: the
guidelines recommend that administrations draw on the appendix of eligible requirements instead of
writing new ones, and that they word them in a **«clear, objective and as closed as possible»** way,
leaving as little room as possible for the committee's subjective assessment. **The supplier's
answers will therefore be evaluated against closed requirements — yes or no, with evidence — not
against narratives.** The project's compliance documentation is structured as a requirement →
evidence → precise reference matrix, and it is the same structure required by life cycle
traceability: one artefact for both purposes.

One last note, on data protection in procurement: the same guidelines expressly warn against «the
inclusion of **disproportionate exclusions of liability**, especially in the case of standard
contracts with virtually no room for negotiation on the controller's side». The warning is
addressed to managed service models with a non-negotiable data processing agreement. **The data
processing agreement offered by the project is negotiable in its liability clauses**, or it will be
challenged during the tender.

## 8. Overlap matrix

Key: **●** direct obligation · **○** indirect obligation, which falls on the project by way of
contract · **—** not applicable.

| Control | Network security | Public contracts | Cyber resilience | Data protection | Medical devices | PA minimum measures | Procurement | Telemedicine | Primary addressee |
|---|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|---|
| Inventory and bill of materials | ● | — | ● | ○ | ● | ● | ● | — | **Project** produces, deployer maintains |
| Secure reference configurations | ● | ● | ● | ● | ● | ● | ● | ● | **Project** documents, deployer applies |
| Vulnerability management and disclosure | ● | ● | ● | ○ | ● | ● | ● | — | **Both** |
| Security updates | ● | ● | ● | ● | ● | ● | ● | ● | **Project** releases, deployer applies |
| Access control and privileges | ● | ● | ● | ● | ● | ● | ● | ● | **Both** |
| Multi-factor authentication | ● | ● | ● | ● | ● | ● | ● | ● | **Project** enables, deployer configures |
| Encryption in transit | ● | ● | ● | ● | ● | ● | ● | ● | **Project** |
| Encryption at rest | ● | ● | ● | ● | ● | ● | ● | ● | **Project** enables, deployer manages the keys |
| Encrypted backups with restore testing | ● | — | — | ● | ● | ● | — | ● | **Deployer**, with the project's procedure |
| Continuity and recovery | ● | — | — | ● | ● | ● | — | ● | **Deployer** |
| Non-alterable audit trail and traceability | ● | ● | ● | ● | ● | ● | ● | ● | **Project** |
| Detection and monitoring | ● | ● | ● | ● | ● | ● | ● | ● | **Deployer**, with the project's integration |
| Incident notification | ● | ● | ● | ● | ● | — | ● | ● | **Deployer** notifies, **project** supplies the evidence |
| Forensic export and chronology | ○ | ○ | ○ | ○ | ○ | — | ● | — | **Project** |
| Supply chain security | ● | ● | ● | ● | ● | — | ● | — | **Deployer** is obliged; **project** is the object of the verification |
| Declaration of relevant suppliers | ● | — | — | — | — | — | — | — | **Deployer**; the project is the declared subject |
| Secure development life cycle | ● | ● | ● | ● | ● | — | ● | — | **Project** |
| Staff training | ● | ● | — | ● | ● | — | ● | ● | **Deployer** |
| Governance and approval of the plans | ● | ● | — | ● | ● | — | ● | — | **Deployer** |
| Secured communications | ● | — | ● | ● | ● | — | ● | ● | **Project** |
| Data residency | ○ | ● | — | ● | — | — | ● | ● | **Both** |

### 8.1 The seven highest-return controls

Seven controls, if implemented once and documented well, satisfy **five or more sources each**. They
are the absolute priority:

1. **Signed bill of materials and exploitability statement** ([07 §§2, 4](./07-catena-di-fornitura.md)).
2. **Append-only audit trail with a hash chain, 24-month retention, signed export in an open
   format** ([04](./04-tracciamento.md)). **It is the single largest effort in the whole
   catalogue** and must be planned as such.
3. **Second factor and identity federation across the three national channels**
   ([02](./02-identita-e-accessi.md)).
4. **End-to-end encryption of the media and encrypted transport for the signalling**
   ([03 §2](./03-protezione-dei-dati.md), [05](./05-sicurezza-del-tempo-reale.md)).
5. **A secure development life cycle with a threat model, automated checks in continuous
   integration and coordinated disclosure** ([07 §§5, 6](./07-catena-di-fornitura.md)).
6. **Measurement of availability per tenant and per service, with thresholds and alarms**
   ([10 §5](./10-risposta-agli-incidenti.md)).
7. **A documented reference configuration, signed artefacts, secure-by-default configuration**
   ([07 §8](./07-catena-di-fornitura.md)).

## 9. What this area leaves open

| Reference | Question | To whom |
|---|---|---|
| Q-151 | Line-by-line reading of the detailed annexes and completion of the allocation of responsibilities with the text of the requirements. **No precise citation before then** | Compliance |
| Q-10, Q-24 | Artefact → applicable regime table as an architecture decision record (§5) | Compliance, architecture |
| Q-09 | Parameterisation of compliance on the individual user's deadline (§3) | Roadmap |
| Q-154 | If the managed service operator exceeds the medium-sized enterprise thresholds it **becomes an entity in its own right**, with all the obligations of chapter [09](./09-ripartizione-delle-responsabilita.md) | → Project owner |
| Q-155 | Monetisation and the manufacturer role; **declared support period**, minimum five years (§5) | → Project owner |
| `[NV]` | Harmonisation status of the standard on security activities in the life cycle (§7) | Compliance |
| `[NV]` | Text of the decrees on essential cybersecurity elements in public contracts, and verification of whether the supply falls within the technology categories listed (§7) | Compliance, with a procurement adviser |
