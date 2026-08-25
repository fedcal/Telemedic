---
title: Allocation of responsibilities
sidebar_position: 10
description: Control by control, what belongs to the project, what belongs to the deployer and what is shared. The document that stops a customer believing they are covered when they are not.
---

# Allocation of responsibilities

> ## Warning, at the top and not in a footnote
>
> **None of the obligations towards the authority belongs to the supplier.**
>
> Not registration on the portal. Not the annual declaration. Not the designation of the point of
> contact, of its deputy and of the liaison for coordination with the national incident response
> body. Not the declaration of relevant suppliers. Not the approval of the eleven documents by the
> management and governing bodies. Not the documentarily demonstrable adoption of the baseline
> security measures. **Not incident notification.**
>
> The supplier **cannot discharge them, cannot attest to them, and no contractual clause moves
> them.** What the supplier can do — and what this chapter lists — is **produce the evidence** that
> the obliged entity incorporates into its own plans, and **provide the technical capabilities**
> without which those obligations are not materially performable.
>
> This chapter exists for one reason only: **to stop a customer believing they are covered where
> they are not.** It is the document to read before signing, not after an inspection.

## 1. The three categories, and what they really mean

| Code | Meaning | What it entails for the other party |
|---|---|---|
| **P** | **Project**: the control is implemented by the product or by its documentation. The deployer inherits it | The deployer must **verify** that the deployed configuration has not switched it off, and keep the evidence |
| **D** | **Deployer**: the control concerns the organisation, the processes, the people or the infrastructure of the obliged entity. The product cannot implement it | The project can supply **procedures, templates and technical capabilities**; it cannot substitute itself |
| **P+D** | **Shared**: both parties have a portion, and **one party's portion does not cover the other's** | It is the category where misunderstandings are born: it must be read row by row |

A responsibility marked **P** does not mean the customer has nothing to do: it means that what they
have to do is **verify and document**, not implement. A responsibility marked **D** does not mean
the project takes no interest: it means its contribution is documentary.

## 2. A note on the form of this table

**Question Q-151.** The detailed annexes of the national authority's determination have not been
read line by line. It follows that this table:

- states the **codes** of the 43 measures, which are verified, and their allocation between
  important and essential entities, which is verified;
- gives a **thematic description** of each measure, following the category of the national
  reference framework from which the codes derive;
- **does not state the text of the individual requirements**: `[NV]`. The «project contribution»
  column describes what the product supplies, not what the requirement prescribes.

Before the definitive compliance matrix is published, the table must be completed with the text of
the 116 requirements. Until then it is **a reliable thematic allocation and an incomplete
regulatory citation**, and it must be used as such.

Key for the «Scope» column: **I+E** measure provided for important and essential entities · **E**
measure provided for essential entities **only** · **I+E\*** common measure with **additional**
requirements for essential entities only.

## 3. Governance and organisation

| Measure | Theme | Scope | Resp. | Project contribution |
|---|---|---|:-:|---|
| `GV.OC-04` | Identification and listing of relevant systems | I+E | **D** | Description of the components, flows and interfaces, so the customer can correctly scope what the product introduces |
| `GV.RM-03` | Integration of cyber risk management into the processes | I+E | **D** | The product's risk register and threat model ([01](./01-modello-di-minaccia.md)), reusable as an input |
| `GV.RR-02` | Information security organisation, with roles and responsibilities | I+E | **D** | This table, as an input to the supplier/customer split |
| `GV.RR-04` | Personnel security and reliability | I+E\* | **D** | — |
| `GV.PO-01` | Information security policies | I+E | **D** | Reference configuration and technical constraints that the policies must reflect |
| `GV.PO-02` | Review and update of the policies | I+E\* | **D** | Security advisories and release notes as the event that triggers the review |

## 4. Supply chain

| Measure | Theme | Scope | Resp. | Project contribution |
|---|---|---|:-:|---|
| `GV.SC-01` | Supply chain risk management programme and processes | I+E\* | **P+D** | **The project is the supplier being assessed.** It supplies the bill of materials, the exploitability statement, the disclosure policy, the secure development documentation, the declared support period ([07](./07-catena-di-fornitura.md)) |
| `GV.SC-02` | Roles and responsibilities towards suppliers and third parties | I+E | **D** | Documentary allocation (this chapter) |
| `GV.SC-04` | Identification and prioritisation of suppliers | I+E | **D** | Identifying data, country of the registered office and procurement vocabulary codes, in reusable form ([07 §3](./07-catena-di-fornitura.md)) |
| `GV.SC-05` | Security requirements in supplier contracts | I+E | **P+D** | A data processing agreement template that is **negotiable** in its liability clauses; technical notification and reporting clauses ([10](./10-risposta-agli-incidenti.md)) |
| `GV.SC-07` | Monitoring of supplier risk over time | I+E | **D** | Security advisories, an updated exploitability statement, the maintenance register |

## 5. Inventory and risk assessment

| Measure | Theme | Scope | Resp. | Project contribution |
|---|---|---|:-:|---|
| `ID.AM-01` | Inventory of physical devices | I+E | **D** | Minimum hardware and network requirements, as required by Annex I § 17.4 of the device rules |
| `ID.AM-02` | Inventory of software systems and applications | I+E | **P+D** | **Bill of materials generated by the pipeline and signed**: it is the part the customer cannot reconstruct ([07 §2](./07-catena-di-fornitura.md)) |
| `ID.AM-03` | Inventory of network flows | **E** | **P+D** | **List of outbound flows** with the five required attributes: source address, destination address, transport protocol, destination port, application protocol. It is part of the compliance file |
| `ID.AM-04` | Inventory of services provided by suppliers | I+E | **P+D** | Description of the services provided, in a form that can be incorporated into the customer's inventory |
| `ID.RA-01` | Identification and recording of vulnerabilities | I+E\* | **P+D** | Exploitability statement; advisories; monitoring of fixes with assessment **by the day following** the release |
| `ID.RA-05` | Risk assessment, approved by the governing bodies | I+E\* | **D** | Threat model and risk register as an input |
| `ID.RA-06` | Risk treatment plan | I+E | **D** | **Technical derogation statement** with the compensating controls, without which the endpoint derogation cannot be closed out ([08 §6](./08-quadro-normativo-e-misure.md)) |
| `ID.RA-08` | Vulnerability management plan, approved by the governing bodies | I+E\* | **P+D** | **It is one of the two documents that cannot be drawn up without the supplier**: the plan has to take account of the vulnerabilities in the product's dependencies |
| `ID.IM-01` | Assessment of the effectiveness of the controls and remediation plan | I+E\* | **D** | Outcomes of the automated checks, of the restore tests and of the third-party audit |
| `ID.IM-04` | Business continuity, recovery and crisis management plans | I+E | **P+D** | A complete backup and restore procedure — system, application, database, configurations, **key material** — with declared objectives and at least one documented run in a test environment |

## 6. Identity, access and training

| Measure | Theme | Scope | Resp. | Project contribution |
|---|---|---|:-:|---|
| `PR.AA-01` | Identity and credential management | I+E | **P+D** | Individual and inventoried accounts; no anonymous or shared account; lockout after failed attempts with each one recorded; mandatory change of the initial credential ([02 §11](./02-identita-e-accessi.md)) |
| `PR.AA-03` | Authentication, including multi-factor | I+E | **P+D** | **Second factor imposed** on administrative accounts and on remote access; federation across the three national channels; level configurable per tenant and per operation |
| `PR.AA-05` | Definition and enforcement of access permissions | I+E | **P+D** | **Authorisation founded on the care relationship**, not on the role alone; complete separation between privileged and unprivileged accounts; revocation when the engagement changes ([02 §9](./02-identita-e-accessi.md)) |
| `PR.AA-06` | Physical access control | I+E | **D** | — |
| `PR.AT-01` | Staff training, with an approved plan | I+E | **D** | Operating documentation, material on the correct use of emergency access and on interpreting the alarms |
| `PR.AT-02` | Specialist training for roles with security responsibilities | **E** | **D** | Technical configuration and response documentation |

## 7. Protection of data, systems and infrastructure

| Measure | Theme | Scope | Resp. | Project contribution |
|---|---|---|:-:|---|
| `PR.DS-01` | Protection of data at rest | I+E | **P+D** | Encryption at rest of content and recordings, **per-tenant keys separable from the datum**; three-level hierarchy with cryptographic erasure ([03 §§3, 4](./03-protezione-dei-dati.md)). **Custody of the root key belongs to the deployer** |
| `PR.DS-02` | Protection of data in transit | I+E | **P** | Total coverage of the four categories required by the Accordo Stato-Regioni; downgrade prevented; **negotiated version measured and recorded**, not declared ([03 §2](./03-protezione-dei-dati.md)) |
| `PR.DS-11` | Backups created, protected, maintained and verified | I+E\* | **P+D** | Documented procedure, declared recovery objectives, encryption capability. **Execution, the copy not permanently reachable from the system, and the periodic restore test belong to the deployer** |
| `PR.PS-01` | Secure reference configurations | **E** | **P+D** | Reference configuration for each component; **secure by default**; drift detection; restore to the reference configuration |
| `PR.PS-02` | Software maintenance and updating | I+E\* | **P+D** | Release of updates over an authenticated channel, **free of charge**; test environment and procedure; **applying them belongs to the deployer** |
| `PR.PS-03` | Hardware maintenance and updating | **E** | **D** | — |
| `PR.PS-04` | Generation and retention of logs | I+E | **P** | **Append-only audit trail with a hash chain and separate retention**, export in an open format with a digest, 24 and 12 months ([04](./04-tracciamento.md)) |
| `PR.PS-06` | Security in the software development life cycle | I+E | **P** | Documented life cycle, traceable threat model, automated checks on every proposed change ([07 §5](./07-catena-di-fornitura.md)) |
| `PR.IR-01` | Protection of networks and environments | I+E | **P+D** | Reference configuration for segmentation; **outbound network isolation of the relay** and **route denial for the application components** ([05 §4](./05-sicurezza-del-tempo-reale.md), [06 §8](./06-sicurezza-applicativa.md)). **The network rules belong to the deployer** |
| `PR.IR-03` | Resilience and secured communications | **E** | **P** | **It is the measure this product implements for the customer**: secured voice, video and text communications ([08 §4.2](./08-quadro-normativo-e-misure.md)) |

## 8. Detection

| Measure | Theme | Scope | Resp. | Project contribution |
|---|---|---|:-:|---|
| `DE.CM-01` | Continuous monitoring of networks and services, with detection parameters | I+E\* | **P+D** | Quantitative and qualitative indicators on accesses, **measurement and historisation of availability** per tenant and service, export of events to the correlation system ([04 §7](./04-tracciamento.md)). **Defining the expected service levels and doing the correlation belong to the deployer** |
| `DE.CM-09` | Monitoring of devices and software for malicious code detection | I+E | **P+D** | **It is the measure of the acknowledged conflict.** The project supplies the technical derogation statement, the list of native compensating controls and the supported protection configuration on the host ([08 §6](./08-quadro-normativo-e-misure.md)) |

## 9. Response and recovery

| Measure | Theme | Scope | Resp. | Project contribution |
|---|---|---|:-:|---|
| `RS.MA-01` | Incident management plan, approved by the governing bodies | I+E | **P+D** | The supplier's response procedure connected with the customer's, notification channel and deadlines, report template ([10](./10-risposta-agli-incidenti.md)) |
| `RS.CO-02` | Communication during the incident | I+E | **P+D** | **Notification to the customer within 24 hours** and immediately for high-severity incidents; **a report by the following day** with the timeline of events |
| `RC.RP-01` | Recovery following an incident | I+E | **P+D** | Recovery procedure and acceptance of responsibility for the remediation required by a vulnerability in the product |
| `RC.CO-03` | Communication of recovery | **E** | **D** | Technical evidence that recovery has taken place |

## 10. Summary: how the 43 measures are distributed

| Category | Number | What it means in practice |
|---|:-:|---|
| **P** — implemented by the product | **5** | `PR.DS-02`, `PR.PS-04`, `PR.PS-06`, `PR.IR-03`, and — for the artefact production part only — the bill of materials inside `ID.AM-02`. The customer verifies and documents |
| **P+D** — shared | **20** | The majority. These are the rows where misunderstanding is most costly, because **the supplier's portion does not cover the customer's** |
| **D** — the deployer's | **18** | Governance, personnel, training, physical security, risk assessment, continuity, event correlation, and **all the obligations towards the authority** |

**No measure falls on the supplier alone in a way that discharges the customer.** Even the five
marked **P** require the customer to verify that the deployed configuration has not been altered
and to keep the evidence of that: the measure is the customer's, the technical implementation is
the product's.

## 11. The obligations that remain entirely the deployer's

They must be listed separately, because their absence from the table of measures makes them
invisible.

| Obligation | When | Who |
|---|---|---|
| Registration and annual declaration on the authority's portal | Annual window at the start of the year | **Deployer** |
| Annual update of the information | Annual window in spring | **Deployer** |
| **Declaration of relevant suppliers**, with the country of the registered office and procurement vocabulary codes | Annual window in spring | **Deployer**; the project is the **declared subject** and supplies the data |
| Designation of the point of contact, of the deputy and of the liaison for coordination with the national response body | According to the windows | **Deployer** |
| Appointment of the cybersecurity officer, for public administrations and health authorities | In force | **Deployer** |
| Approval of the **eleven documents** by the management and governing bodies | By the deadline for the measures | **Deployer** |
| Documentarily demonstrable adoption of the 37 or 43 measures | **Eighteen months from the inclusion notice** | **Deployer** |
| **Notification of significant incidents** | 24 h / 72 h / one month | **Deployer**; the project supplies the evidence and notifies **the customer** within 24 hours |
| Reporting under national law, for public administrations and health authorities | 24 h / 72 h | **Deployer** |
| **Data protection impact assessment** | Before the processing | **Deployer**, as controller. The project supplies the structural material ([03](./03-protezione-dei-dati.md)) |
| **Determination of the retention periods** for health documentation | In force | **Deployer**; the product makes them configurable, it does not decide them |
| **Definition of the expected service levels** for detection purposes | By the deadline for the measures | **Deployer**; the product measures them ([10 §5](./10-risposta-agli-incidenti.md)) |
| **Choice of the level of assurance** for its own services and its justification in the agreement | On joining | **Deployer**, who is the service provider (V-05) |
| Applying the updates released | According to their own policy | **Deployer** |
| Running the backups and the **periodic restore test** | Scheduled | **Deployer** |
| **Network rules** denying egress to the application components and isolating the relay | At installation | **Deployer**; the product documents them and checks them at start-up where possible |

## 12. What the project delivers, in a list

For the table to be usable, the artefacts it refers to must exist. These are they, and they are the
operational translation of the «project contribution» columns:

1. **Compliance file** per release: signed bill of materials, exploitability statement, list of
   outbound network flows with the five attributes, list of remotely accessible systems, reference
   configurations.
2. **This table**, completed with the text of the requirements after Q-151 is closed.
3. **Technical derogation statement** on endpoint protection, with the native compensating controls
   and the supported configuration.
4. **A negotiable data processing agreement template**, with a technical annex of the controls.
5. **Data for the declaration of relevant suppliers**: name, tax identification number, country of
   the registered office, procurement vocabulary codes, relevance criterion.
6. **Declared support period** for each major release, with an end date.
7. **Coordinated disclosure policy** and published security advisories.
8. **A complete backup and restore procedure**, key material included, with declared objectives.
9. **Incident report template** conforming to the requirement on the timeline of events, and an
   agreed notification channel.
10. **A register of the maintenance, acceptance tests and checks** carried out, exportable.
11. **Artefact → applicable regime table**, once Q-10 is closed.
12. **Secure development documentation**: life cycle, threat model, outcomes of the automated
    checks, outcome of the third-party audit.

## 13. What this area leaves open

| Reference | Question | To whom |
|---|---|---|
| Q-151 | Completion of the table with the text of the 116 requirements, after reading the detailed annexes (§2) | Compliance |
| Q-20 | Review of the allocation of roles between data controller, data processor, manufacturer, identity service provider and obliged entity, before publication | Compliance |
| Q-154 | If the managed service operator becomes an obliged entity in its own right, **the rows marked D in the table become its own**. It is the most significant change of perimeter the project could undergo | → Project owner |
