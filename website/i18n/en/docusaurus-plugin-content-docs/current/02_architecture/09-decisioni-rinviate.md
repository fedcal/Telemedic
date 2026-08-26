---
title: Deferred decisions
sidebar_position: 10
description: "What this area deliberately does not decide - with the criterion for deciding it, who decides, what is needed to decide, by when the decision must be taken and what happens if it is not."
---

# Deferred decisions

## 1. Why a chapter on non-decisions

An architecture claiming to have decided everything is hiding something. Decisions made without sufficient information have the same appearance as those made with knowledge, and the difference manifests when it is costly to correct.

This chapter lists what **is not decided**, and for each point declares: the question, the options with their trade-offs, the criterion for deciding, what is needed to be able to decide, who decides, by which moment the decision must be made and what happens if it is not.

An operating rule applies: **a decision listed here cannot be taken on its own initiative in a pull request**. Whoever encounters one of these questions during realisation opens a noticeboard entry; does not choose the most convenient option to proceed.

The symmetric rule follows, and it applies the moment a decision is taken: **the entry leaves this chapter**, and the summary in §5 records the act that closed it. Keeping it listed after it has been decided is not a harmless residue: as long as it appears here, whoever implements according to the decision taken is formally violating the rule of the preceding paragraph. The first entry to leave by this route is `B-4`, the single trust register toward integrators, closed by [ADR-0029](/adr/0029-registro-di-fiducia-unico-per-tenant.md) on 25 August 2026: a single source of truth per tenant, with the capabilities granted declared entry by entry.

Deferred decisions divide into three families:

| Family | Who decides | What is needed |
|---|---|---|
| **A - Deferred to verification** | This area, after verification | A measurement or empirical proof |
| **B - Deferred to another area** | The competent area | Specific expertise |
| **C - Deferred to the sponsor** | The sponsor | A product or risk choice |

## 2. Family A - Awaiting verification

### A-1 - Orchestration realisation mechanism

**What is already decided**: critical clinical processes are **orchestrated**, not choreographed, and process state is queryable. Decided because it constrains other areas.

**What is not decided**: the mechanism. Dedicated workflow engine, state machine persisted in table with an application component, or application component with time-based rescheduling.

| Option | Trade-off |
|---|---|
| Dedicated engine | Ready-made compensation, timeout and resumption functions; **one more third-party component** to inventory, update and install at customer premises |
| Persisted state machine | No component added; resume, timeout and compensation code is the project's responsibility |
| Application component with timeouts | Lightest; most fragile on resumption after restart |

**Decision criterion**: weight on customer-premises installation has precedence over development convenience; four orchestrated processes have been identified, and with this cardinality the cost of a dedicated engine is hard to justify.

**What is needed**: a prototype of the closure, reporting and transmission process realised with the persisted state machine, with measurement of code necessary for resumption and compensation.

**By when**: before realising the second orchestrated process. The first can be written with the state machine and migrated; the second would crystallise the choice.

**If not taken**: each process will be realised differently and the property "process state is queryable" will be true for some and false for others.

### A-2 - Outbox read mode in high-volume configurations

**What is already decided**: periodic query is the **default mode**, in both configurations, and change capture remains a declared option.

**What is not decided**: the volume threshold beyond which the option becomes recommended, and whether to adopt it in the managed service.

**Criterion**: adopted only if periodic query does not sustain the measured volume with the necessary interval to meet the declared delay, and only after the component has been inventoried among third-party components.

**What is needed**: measurement of relay delay at growing volumes, on synthetic data.

**By when**: not before real volume exists. A decision not to be anticipated.

**If not taken**: nothing grave. It is the only one in this list that can remain open a long time without cost, because the event contract does not change between the two modes.

### A-3 - Coexistence with the next revision of the interoperability standard

**What is not decided**: whether and when to run the next revision in parallel with the one adopted, and in what form - distinct base paths or content negotiation.

| Option | Trade-off |
|---|---|
| Distinct base paths | Simple routing and cache; two surfaces to document |
| Content negotiation | Single surface; trickier routing and cache, higher probability of integrator error |

**Criterion**: the choice follows actual integrator demand, not standard evolution. While adopted guidelines are on the current version, running the next one in parallel adds surface without adding interoperability.

**What is needed**: at least one integrator requesting it, and publication of national guidelines on the new version.

**By when**: not urgent. The constraint to meet immediately is that the domain model does not know the standard version, already an automatic verification.

### A-4 - Representation of session endpoint in FHIR

**What is already decided**: the session address **is not exposed** in the clinical plane; it is a capability of the application plane.

**What is not decided**: what to do when an integrator nonetheless requests a representation in the exchange format. Project-specific coding system, or the official cross-version extensions package.

**Criterion**: the extensions package is preferable in principle because standard, but **is not adoptable while in preliminary state**. A project-specific coding system is replaceable and declarable as such.

**What is needed**: verification of the package's publication status at realisation time.

**By when**: at the first integrator request.

## 3. Family B - Deferred to another area

### B-1 - Immutable trail parameters

**Not decided**: anchoring interval, form of temporal attestation, anchor preservation, frequency of integrity verifications, minimum form of request origin compatible with minimisation.

**Who decides**: security area, with compliance area for evidentiary implications.

**What this area has already fixed**: the combination of four layers, per-tenant chain, separate preservation, blocking nature of write, the closed list of what does not appear, independent verifiability of the extract.

**Why this area does not decide**: the breadth of residual vulnerability window is a risk parameter, and its determination belongs to whoever conducts risk analysis.

**If not taken**: the mechanism is realisable anyway with a provisional interval, but the guarantee declarable publicly is not determinable.

### B-2 - Engine and archive of immutable trail

**Not decided**: whether the trail archive can be the same engine as the application archive with distinct credentials and privilege, or must be a different engine.

**Who decides**: security area.

**Why it matters**: directly affects the weight of customer-premises installation. One more engine is one more component to install, update and secure in an organisation not a computing service provider.

**Criterion suggested by this area**: the separation of **privilege** is the requirement; separation of **engine** is a possible realisation of that requirement, not the requirement itself. If privilege separation is demonstrable on the same engine, the additional engine is not justified.

### B-3 - Extension of terminological policy to validated clinical scales and questionnaires

**Not decided**: whether and how the system can calculate scores of validated clinical scales and questionnaires, which have their own distinct licenses from those of terminologies.

**Who decides**: compliance area, with this area for structural consequences.

**Why it is blocking**: the question must close **before** the first calculation engine is written. Writing it then discovering the tool is not usable means removing a function already promised.

**Consequence already assumed as precautionary**: the domain model **does not represent clinical scale scores** and the telemonitoring context does not calculate them. Structured questionnaire responses are represented and preserved; scores are not.

**Suggested criterion**: the same taxonomy of regimes already adopted for terminologies - full coexistence, separate colocation with own license, acquisition at installation cost, total exclusion - applied tool by tool, verifying the primary license and not the declaration of the container encompassing it.

### B-5 - Public interface conventions

**Not decided**: ten conventions now stated as proposals - version placement, precondition-required outcome on clinical resources, outcome not revealing existence of inaccessible resource, preservation of idempotence keys, traffic limit header form, dismissal notice duration, leanness of content in outgoing messages, retry policy, event type versioning, introspection on high-impact operations.

**Who decides**: this area, as cumulative convention register; the protocols area documents them.

**Status**: **decided** and collected in a dedicated register, with four verified corrections to incorporate - the nature of standard for some cited headers, current form of traffic limit headers, correct identifier of the error detail specification, and the fact that the event envelope **does not provide a dedicated header for the content-type attribute**.

**Note**: two of the ten have architectural consequences not merely protocolar, and are treated in the body of the area: the leanness of event content and type versioning.

### B-6 - Surveillance thresholds and service levels

**Not decided**: thresholds of continuous surveillance and expected service levels, distinct from those provided by law for regional infrastructures.

**Who decides**: security area and roadmap.

**What this area has already fixed**: **what** must be surveilled - in particular the depth of the unprocessable message queue, the delay of the outbox relay and the outcome of trail integrity verifications - because their absence renders silent failures invisible.

### B-7 - Documentary material for health document typologies

**Not decided**: structured document models, document codes and indexing metadata for telemedicine document typologies, not publicly available.

**Who decides**: compliance area, who has the interlocution.

**Why this area can proceed anyway**: the information content is modelled as a **canonical dataset** and every serialisation is replaceable. Arrival of the material will be writing a mapper, not a domain model migration.

### B-7-bis - Confirmation of conformity of the entire set of plan-rule constructs

**Not decided**: whether the closed set of constructs adopted for monitoring plan rules (ADR-0026) remains within the frozen intended use.

**Who decides**: compliance area.

**What this area has already fixed**: the set is **closed**, each construct has declared semantics and its own tests, no constructs exist that deduce thresholds from population or history nor that interpolate series, and the generic clinical logic executor is **absent by construction, not disabled by configuration**.

**Why it matters**: the construct set will be under pressure to expand. Every expansion is a scope decision and must be treated as such, not as a feature request. A conformity criterion must be established **before** the first request.

### B-9 - Minimum contract of third-party measurement gateway

**Not decided**: `[NV]` whether market gateways expose the **periodic presence signal independent of measurement** and **device status telemetry**.

**Who decides**: integration area, with market verification; safety consequences to the functional area.

**Architectural consequence**: without those two elements the taxonomy of silence loses technical categories, and the system does not distinguish "device did not measure" from "device did not transmit". This area assumes precautionarily that absence of measurement is represented anyway as entity, with cause marked as **not determinable** rather than inferred.

### B-8 - Propagation of assurance level through intermediation

**Not decided**: `[NV]` - if the identity federation product, acting toward an external identity provider, **forwards the required level** through the intermediation realm. If it does not, level elevation per operation is not obtainable by configuration alone.

**Who decides**: empirical verification by the integration area and technical area.

**Why it is on the critical path**: public documentation cannot describe how assurance level propagates before the verification is done. The cost of verification is nearly nil; the cost of having documented non-existent behaviour is not.

## 4. Family C - Deferred to the sponsor

### C-1 - The billing context

**The question**: formation of the billable event is a **fourteenth bounded context**, or remains distributed between the service context and the boundary context?

**Why this area does not decide**: modifying the list of bounded contexts of the binding architectural base exceeds the mandate of an area. The base is binding and the protocol provides that deviation is declared and decided downstream.

**Argued position of this area**: **autonomous context**. The decisive reason is not elegance but verifiability: a constraint exists that the integrator's billing profile is administrative by construction and cannot in any way constitute a path to clinical content. With an autonomous context that constraint is a **boundary**, automatically verifiable; without it, it is a code convention, verifiable only with a dedicated test and subject to erosion.

**Provisional status**: responsibility remains where the base leaves it implicitly, **with the explicit caveat** that the constraint is a convention not a boundary, and with a dedicated test confirming its respect.

**If not taken**: the system works. The risk is that in a later version, a billing event acquires a clinical document reference without anything structurally preventing it.

### A-5 - Maximum session participants

**What is already decided** (ADR-0028): the session remains **mesh without central component**, because it is the only topology preserving encryption to endpoints; **the limit is declared and enforced by code** with an error comprehensible to the exceeding participant; the limit is configuration with a maximum imposed, not a code constant.

**What is not decided**: the **number**. Depends on the transmission bandwidth budget of the worst-connected participant, and that budget is measured on a device and reference network not yet declared.

**Criterion**: the maximum is the number beyond which the reference participant does not sustain its own transmission budget with margin. **Measured, not estimated.**

**What is needed**: declaration of the reference device and network - a product decision - then measurement.

**If not taken**: if measurement were to exclude the third participant, the alternate measure declared for a known accessibility non-conformity would need re-examination. It is a dependency to flag, not to discover.

### C-2 - Introducing a component terminating encryption to increase participants

**The question**: acceptance in future of introducing a component redistributing flows and that **terminates encryption**, to overcome the mesh topology limit?

**Why this area does not decide**: it is a security and product scope decision, of the same nature as the one on server-side recording. The system would have a **third operating mode** with different security properties, and the default mode would no longer be the strongest in all scenarios.

**Status**: **excluded for the current version** (ADR-0028). Reopenable only as explicit security decision, never as technical extension.

### C-3 - Container of recorded material

**The question**: which container for recorded material server-side.

**Why this area does not decide**: the original public content of the project declared a specific container, and correction of public content is a sponsor matter.

**Constraint already in force**: the container is **negotiated at runtime, never assumed**. No project document can declare a container as guaranteed before verification on actually-supported browsers.

### C-4 - Declared support period

**The question**: the duration of support period the project declares for distributed artefacts.

**Why this area does not decide**: it is a commitment of whoever distributes, with regulatory and economic consequences.

**Architectural consequence**: duration determines how long a major version of public interfaces remains active, hence how many versions must coexist. Not a neutral parameter: two major versions active together are permanent maintenance commitment.

## 5. Summary

| # | Question | Family | Decides | Urgency |
|---|---|---|---|---|
| A-1 | Orchestration mechanism | A | ARCH | Before second orchestrated process |
| A-2 | Outbox reading at high volume | A | ARCH | Not urgent |
| A-3 | Coexistence with next standard revision | A | ARCH | Not urgent |
| A-4 | Session endpoint representation | A | ARCH | At first request |
| A-5 | Maximum participants | A | ARCH, after measurement | Before media plan design |
| B-1 | Immutable trail parameters | B | SEC, COMP | Before public guarantee declaration |
| B-2 | Trail engine and archive | B | SEC | Before deployment definition |
| B-3 | Scale and questionnaire licenses | B | COMP | **Before first calculation engine** |
| B-4 | Single trust register | B | INTEG, SEC | **Decided**: [ADR-0029](/adr/0029-registro-di-fiducia-unico-per-tenant.md). No longer a deferred decision |
| B-5 | Interface conventions | B | ARCH, PROTO | Decided; corrections remain to incorporate |
| B-6 | Surveillance thresholds | B | SEC, ROAD | Before operation |
| B-7 | Documentary material | B | COMP | Does not block modelling |
| B-7-bis | Conformity of plan-rule constructs | B | COMP | Before first expansion request |
| B-9 | Minimum measurement gateway contract | B | INTEG, FUNZ | Before first gateway integration |
| B-8 | Assurance level propagation | B | INTEG, TECH | **Before public documentation of mechanism** |
| C-1 | Billing context | C | Sponsor | Before billing event realisation |
| C-2 | Component terminating encryption for more participants | C | Sponsor | Only if and when reopened |
| C-3 | Recorded material container | C | Sponsor | Before public communication |
| C-4 | Declared support period | C | Sponsor | Before first distribution |

Three rows are in bold because the cost of deciding late is qualitatively different from deciding early: B-3 because it would entail removal of already-written function, B-8 because it would entail correction of public documentation on a security mechanism, C-1 because correction would require shifting responsibility between contexts after code exists.
