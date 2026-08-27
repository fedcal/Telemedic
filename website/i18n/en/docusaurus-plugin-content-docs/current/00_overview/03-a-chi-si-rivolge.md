---
title: Who it addresses
sidebar_position: 4
description: "The actual recipients of the project - healthcare facility, healthcare professional, patient and carer, integrator, regional entity - with what each obtains, what each must provide and what the project deliberately does not give them."
---

# Who it addresses

A project that declares it addresses «all actors in digital healthcare» addresses nobody. This chapter lists **five actual recipients** and, for each, three things: what each obtains, what each must provide, what the project **does not** give them.

The third column is the one that matters. An unmet expectation discovered downstream costs much more than a missing capability declared upstream, and the chapter exists to anticipate it.

> **This holds for all five, without exception.** **Today the product bears no CE marking**, and
> as long as a marking does not exist **the software is not usable for the delivery of healthcare services on real patients** (`D16`). The limit is not removable for configuration, for licence
> or for contractual agreement, and is verifiable: every distributed artefact bears the declaration
> of non-marking, and its absence prevents publication. The project has decided to assume in its own right the role of manufacturer (`D58`), but the legal entity is **still to be established**:
> the intention does not change the state of fact, and **no document declares a date by which the
> product will be marked**.

## 1. The healthcare facility that delivers remotely

Public healthcare company, private hospital, ambulatory clinic, group practice: the subject who
installs the system or receives it from an integrator and puts it into operation.

### 1.1 What it obtains

**A system that can be installed at its location, not only used.** Two setups are documented and supported - installation at customer location and multi-tenant managed service - with **the same code and same structure**: single-tenant installation is the degenerate case of the multi-tenant model, not a separate branch that diverges at the second version.

**Isolation applied by the engine, not by code correctness.** One schema per tenant on a shared database, with row-level security as defence in depth and **default denial** in the absence of resolved tenant context: no data access happens outside a transaction with tenant set (constraint [`V-112`](../11_registri/01-vincoli-in-vigore.md#v-112)).

**An immutable register that withstands inquiry.** It is not entity versioning, which versions but does not make immutable: it is an append-only structure with a hash chain,
archived with separated privileges, periodic anchoring of cumulative hash, integrity verification on request and scheduled, export in open format (constraint [`V-04`](../11_registri/01-vincoli-in-vigore.md#v-04)). The register contains no clinical content: it contains who, what, when, on which subject, with what outcome and with what level of authentication guarantee (constraint [`V-150`](../11_registri/01-vincoli-in-vigore.md#v-150)).

**The division of responsibilities written line by line.** The document
[`docs/06_security/09-ripartizione-delle-responsabilita.md`](../06_security/09-ripartizione-delle-responsabilita.md)
exists specifically so that nobody believes they are covered where they are not, and it is the table to place alongside a specification.

**Artefacts that make compliance possible instead of promising it**: signed bill of materials for every artefact, release attestations with provenance and test results,
executable verification procedure for whoever installs, copy and restore procedure with at least one documented execution, register integrity verification procedure, model incident report, **record of data for declaration of relevant suppliers** to the national authority (name, tax identification number, Country of registered office, procurement codes, relevance criterion).

### 1.2 What it must provide

The complete list of installation assumptions is in
[`docs/09_roadmap/03-primo-rilascio-utilizzabile.md`](../09_roadmap/03-primo-rilascio-utilizzabile.md) §5.
They are not recommendations: **whoever cannot satisfy them cannot install**, and knowing it beforehand is worth more than discovering it afterwards. The six that are most often underestimated:

| Assumption | Why it is not optional |
|---|---|
| **Relay node egress network isolation**, applied by infrastructure | It is the **primary defence** and does not depend on code correctness. Lists of forbidden addresses are defence in depth (constraint [`V-10`](../11_registri/01-vincoli-in-vigore.md#v-10)) |
| **Denial of outbound route to application components**, with sole exception of the mediator | It is an architectural requirement, not a coding rule: the defence must not depend on a programmer not making a mistake (constraint [`V-157`](../11_registri/01-vincoli-in-vigore.md#v-157)) |
| **Separation of privileges between application archive and register archive** | In its absence the guarantee of non-alterability **reduces to trust in the operator**, which is precisely what the requirement excludes. The reduction must be declared |
| **Custody of the root key** of the encryption hierarchy | The key that protects copies cannot reside in the system that produces them |
| **Determination of the retention terms** of healthcare documentation | The product makes them configurable, **does not decide them**: determination is the data controller's |
| **Cadence of updates of exposed components**, particularly the relay | For an exposed component update is an obligation. The relay node has had fourteen releases in just over seven months, five in August 2026 alone |

On the compliance level, three remain entirely the responsibility of whoever installs and **no contractual clause shifts them**: the data protection impact assessment, which precedes processing; the notification of incidents to authorities, with their own timeline - the project notifies **the customer**
and provides evidence, does not notify the authority in their place; the approval of plans by the governing bodies.

### 1.3 What the project does not give them

- **It does not give them CE marking**, today nor by a declared date. If they put the system into operation to deliver healthcare services they assume the obligations that ensue, including that of manufacturer when its preconditions arise. That the project intends to certify in the future
   (`D58`) **transfers nothing to them** on an uncertified version.
- **It does not give them compliant preservation**, and is not the facility's primary clinical archive
   (`OUT-23`).
- **It does not give them a date for conformity to national security measures.** The term is
   **subjective**: it runs from the insertion communication they have received **themselves**, and is not determinable by the supplier. The project declares **which evidence** it delivers and **from which release** each is available (constraint [`V-186`](../11_registri/01-vincoli-in-vigore.md#v-186)).
- **It does not give them service level values.** The product **measures** them and stores history by tenant and by service; the threshold is chosen by whoever installs.
- **It does not give them legal or regulatory advice.** The legal qualification of a subject and
   of a product depends on factual elements that must be ascertained case by case by an authorised professional.

## 2. The healthcare professional

Specialist doctor, general practitioner, consulting doctor, nurse, rehabilitation professional, psychologist, case manager, responsible for a remote monitoring (telemonitoraggio) plan.

### 2.1 What it obtains

**A model that does not attribute acts to them that they have not performed.** It is the property that distinguishes
this system, and is composed of verifiable rules:

- **no contact closes automatically.** Closure with outcome is always an act of the
   professional; in its absence the contact remains suspended and is signalled. A system that closes by itself attributes a clinical outcome;
- **no act concludes by expiry of a term.** Time can produce a terminal **non-nominal** state
   - non-attendance, expiry - not conclude a healthcare act;
- **no interpretative clinical content is pre-filled** on document opening: pre-filling covers demographic, administrative and temporal data (`OUT-07`);
- **no threshold is deduced or suggested.** The field starts empty and mandatory, with no
   pre-filling even with values from the pathway or the last plan; references are shown
   as assigned, read-only, with an explicit copy action (constraint [`V-123`](../11_registri/01-vincoli-in-vigore.md#v-123));
- **a network outage does not close the clinical act.** Service and average session are distinct
   aggregates (constraint [`V-01`](../11_registri/01-vincoli-in-vigore.md#v-01)), and the only transition the session triggers on the contact is
   suspension after a reconnection failure beyond the configured window.

**Tools that reflect the reality of remote acts.** The waiting room has **two distinct controls
with separate and separately visible outcome** - technical and administrative - because a single
light forces the operator to guess which one is missing. Admission to session is **always explicit**. The list of participants, with name and qualifications, is visible for the entire duration **without possibility of concealment**. The side room between professionals is a declared period, with start, end and announcement: no silent modality exists.

**An emergency access that is a requirement, not a tolerated exception**: free motivation mandatory,
limited window and scope, notification, review with recorded outcome (constraint [`V-153`](../11_registri/01-vincoli-in-vigore.md#v-153)).

**An emergency procedure that gives them what they truly lack.** Not a severity assessment, but the
logistical information they lack because the patient is not in the same room: **the address where
the person is at that moment**, contact details, emergency contact. Hence the obligation to ask and
confirm the address of service at the start of **every** session, because the registered address is useless in an emergency.

### 2.2 What they must provide

**The professional act, in full.** The decisions the system does not take are theirs: whether the
service is deliverable remotely; identification of the patient, which is their act and not the outcome of an algorithm - the project does not perform biometric recognition or automatic face detection (`OUT-14`); attestation of suitability of connection quality, which the system measures and **they confirm**; the individual threshold and alert rule; the clinical outcome, including the priority code, which the system records and does not calculate (`OUT-03`); the decision to continue, degrade or interrupt when quality degrades.

**The signature.** The clinical document is persistence of content drafted by them, and once signed
is **immutable**: correction is a subsequent version that substitutes or rectifies, maintaining
the chain. No return to the previous state exists.

### 2.3 What the project does not give them

- No diagnostic, prognostic, therapeutic or pharmacological suggestion (`OUT-01` … `OUT-05`).
- No score, risk index or classification calculated autonomously. The calculation of scores of
   validated clinical scales is **excluded precautionarily** until the licence regime of each tool
   is verified: the system preserves the **response** to the questionnaire, with reference to an
   immutable version of the tool, and not the score.
- No image elaboration that modifies its informational content for clinical reading purposes (`OUT-06`).
- No emergency channel and no automatic activation of rescue (`OUT-13`).
- No automatic activation of recording in case of emergency, dispute or suspicion:
   recording remains subordinate to consent, and is not usable as a unilateral defensive tool (`OUT-16`).

## 3. The patient and caregiver

It is the recipient that almost no project treats as such, because they are never the sponsor.

### 3.1 What it obtains

**Paths designed for the small screen and the worst network.** Not «mobile compatible»:
**mobile first as a design method**, because the typical remote consultation (televisita) patient uses a
smartphone, often on mobile network, often without assistance (`D25`). The acceptance criterion is
operational and verifiable: every functional requirement must be able to be completed by an elderly patient on a smartphone in mobile network.

**Accessibility as a functional requirement, with one declared non-conformity.** WCAG 2.1 AA and EN 301 549 in full, verified automatically **and** by hand with real assistive technologies,
because automation intercepts only a minority of defects. The sole declared non-conformity concerns **real-time captions**, with the interpreter as alternative measure and the captions data channel nonetheless defined and versioned in the protocol, to embed a transcription engine in future without redesign (`D24`).

**Understandable degradation instead of error.** Low bandwidth, intermittent network, modest device:
**audio before video, always**, clear warnings, session resumption, and a **phone fallback** that is
a mandatory typed outcome - with recording of the channel change, because it can affect the nature of the act.

**Consents that are facts, not boxes.** Five distinct consent objects with independent lifecycles
- healthcare act, data processing where applicable, recording, presence of third parties, transmission to external systems - and the revocation of one does not touch the others. **There does not exist, in the model, a «platform consent»** (constraint [`V-146`](../11_registri/01-vincoli-in-vigore.md#v-146)).

**Key verification designed to be used by them.** The short code derived from session hash,
compared voice with the interlocutor, is mandatory by default and is together what makes demonstrable end-to-end encryption and a traceable risk control. The accessibility requirements are binding: readable by a screen reader, **never conveyed by colour alone**, understandable to an elderly or digitally underskilled person, with a defined procedure in case of mismatch (`D22`).

**Warnings that cannot be hidden.** The recording indicator while recording, consent notices,
result of key verification, clinical error messages and encryption status indicator **are not themeable or hideable by any integrator** (constraint [`V-163`](../11_registri/01-vincoli-in-vigore.md#v-163)). The asynchronous channel, phone fallback and manual measurement entry persistently and non-closably declare expected response times and **unsuitability for emergency**. Service hours are visible with **current state**, not with theoretical schedule, together with the alternative channel.

**The caregiver exists in the model with its own role.** Not confused with the legal representative: **the caregiver does not give consent for a capable patient**. It is a participant with role,
declared qualifications, entry instant and exit instant, because the presence of a third party is a fact with legal consequences.

### 3.2 What they must provide

The least possible, and it is a project objective. No mandatory step can presuppose IT skills; technical verification precedes the session instead of failing during; phone fallback exists. Essential remain a device with camera and microphone, a connection, and - when the facility requires it - a national digital identity, whose recognition is however the responsibility of whoever delivers the service, not theirs.

### 3.3 What the project does not give them

- **It does not give them an emergency channel.** For an emergency they call emergency numbers:
   it is written in the declared intended purpose statement and repeated persistently
   in the interface.
- **It does not give them continuous surveillance.** Collection of parameters is **deferred** and
   taking over depends on the organisation delivering the service and the service hours it declares.
- **It does not give them an offline modality for clinical content.** It is a deliberate choice,
   motivated by the risk of clinical content on a device that the data controller does not control.
- **It does not give them real-time captions**, as above.
- **It does not give them end-to-end encrypted session when recording is active.** It is the most important point of this section, and is treated at length in
   [04 - State and limits](./04-stato-e-limiti.md) §5: recording occurs on server side, and in that modality encryption is terminated on the server. The consent informative **declares this explicitly**.

## 4. The integrator

The supplier of a cloud healthcare management system, of a third-party EHR system, of a citizen portal, of an integration engine already in operation. It is the area on which the adoption of the project is played out.

### 4.1 What it obtains

**Four integration modalities, not alternatives but layers.** Autonomous service; application
interfaces; embeddable component; replaceable modules - reporting, agenda, billing, identifier resolution, archive destination. Chapter
[`docs/07_integration/01-modalita-di-integrazione.md`](../07_integration/01-modalita-di-integrazione.md)
describes them with the part that matters most: **when each is the wrong choice**.

**Three guarantees that descend from the profile on which the project is built.** It does not
impose its own interface; it does not impose its own authentication; **it does not become the reference data**. It works by reference on the identifiers of its attribution domain and returns to the system of origin what it produces.

**A declared contractual scope.** It is contract - and changes only with twelve months' notice,
with two scheduled obscurations at nine and eleven months - the documented application interface, the published profiles and capability document, the event types and their schemas, the authorisation scopes, the identifiers of problem types and outcome codes, the interfaces of replaceable modules, the protocol of the embeddable component and the closed set of theme properties. **Everything else is internal and can change without notice** (constraint [`V-160`](../11_registri/01-vincoli-in-vigore.md#v-160)).

**Rules that protect it even when they cost it.** Outgoing events transport
**references, never clinical content**: the content is re-read with an authenticated call under the recipient's authorisation (constraint [`V-161`](../11_registri/01-vincoli-in-vigore.md#v-161)). Signature of outgoing messages is **asymmetric**,
because a shared secret does not give non-repudiation and its rotation requires coordination with each integrator (constraint [`V-162`](../11_registri/01-vincoli-in-vigore.md#v-162)). Identity coming from an external sender is always represented as **delegation, never as impersonation**: no supported configuration emits a token without the actor claim (constraint [`V-132`](../11_registri/01-vincoli-in-vigore.md#v-132)).

**Two sole representations of error**, with catalogue **generated** from a versioned file and the
prohibition of emitting an uncatalogued error (constraints [`V-110`](../11_registri/01-vincoli-in-vigore.md#v-110), [`V-130`](../11_registri/01-vincoli-in-vigore.md#v-130)).

### 4.2 What it must provide

**Delivery of identity between back-ends. It is approximately seventy per cent of the cost, and cannot be bypassed by passing through the browser.** It requires asymmetric cryptography and custody of a private key. It is the point at which an integration succeeds or fails, and it is declared in advance precisely for this reason.

**An environment and a counterpart.** Integration with a third-party system requires a test environment, credentials and an available counterpart: none of the three is under the control of the project, and it is the reason why the project does not promise integration dates.

**Code verification.** It is not a formula of style: it is the condition on which the project makes its work available.

**The role of manufacturer, if they place on the market.** Whoever integrates the software in a commercial product and places it on the market **is manufacturer by law**, independently of what is written in the licence. Chapter
[`docs/07_integration/09-obblighi-di-chi-integra.md`](../07_integration/09-obblighi-di-chi-integra.md)
must be read **before** signing a contract, not after.

### 4.3 What the project does not give them

- **It does not give them unlimited personalisation of the embeddable component.** Theme properties
   are a closed and versioned set, validated server-side with contrast verification: a configuration
   that degrades accessibility **is rejected on save**, not signalled as warning. No injection of
   arbitrary stylesheets from outside (constraint [`V-163`](../11_registri/01-vincoli-in-vigore.md#v-163)).
- **It does not give them an assurance level that counts as strong authentication.** The level
   propagated is the one **required**, not the one asserted, and is always qualified to distinguish
   authentication **performed** by the project from that **referred** by them. An operation that regulation binds to strong authentication requires authentication performed (constraints [`V-154`](../11_registri/01-vincoli-in-vigore.md#v-154),
   [`V-165`](../11_registri/01-vincoli-in-vigore.md#v-165)).
- **It does not give them tokens inspectable from outside.** Tokens to the outside are opaque,
   translated to self-contained tokens by the gateway: the reason is **effective revocation**, because
   in a system treating healthcare data the question «from when could they no longer access?» must
   have an instant as answer, not an interval. It is documented friction with motivation, not
   arbitrary limitation.
- **It does not give them any pathway to the record for a payer.** If their customer is a fund,
   mutual or policy, the integration profile is **administrative by construction**:
   service identifier, administrative outcome, amount. No scope, event or module
   can constitute a pathway - direct or mediated by a professional - toward clinical content
   (constraint [`V-166`](../11_registri/01-vincoli-in-vigore.md#v-166), `OUT-18`).
- **It does not give them a development kit in the first release.** The versioned application interface
   is sufficient for the first integration; the kit is convenience, not capability.

## 5. The regional entity and public sponsor

Region, autonomous province, healthcare facility that tenders, contracting authority.

### 5.1 What it obtains

**An application designed for the third way.** Decree of 19 November 2025, art. 3, paragraph 4,
allows Regions and Autonomous Provinces to deliver telemedicine with applications different from
those acquired in national procedures, provided they comply with certified standards and feed the
record. The project is built to stand in that space: it does not replace the national infrastructure, it is designed to talk to it.

**Explicit adoption of the requirements of Decree of 21 September 2022**, which is the technically most prescriptive act in the framework: microservice architecture, event-oriented, in containers,
multi-tenant, **mobile first**, accessible, multilingual. And adoption of the prohibition on
duplication: where a regional module exists - reporting and signature first and foremost - the system
**integrates instead of duplicating**, and its own modules are disactivatable and replaceable for
configuration (`D14`).

**A mode of operation with non-preservation of clinical content**, consistent with Decree of 19 November 2025, art. 12, in which regional infrastructures do not preserve the data and documents
generated and conferment is the responsibility of healthcare facilities.

**Verifiable documentation instead of declarations.** For an offer evaluation, the three
documents to place alongside the specification are the division of responsibilities
([`docs/06_security/09`](../06_security/09-ripartizione-delle-responsabilita.md)), the supply chain with the artefacts that due diligence requires
([`docs/06_security/07`](../06_security/07-catena-di-fornitura.md)) and the scope of the first
release with its declared limits
([`docs/09_roadmap/03`](../09_roadmap/03-primo-rilascio-utilizzabile.md)).

**A catalogue of services that does not bind them to the supplier's release cadence.** The structure of a catalogue entry is in the product; the **content is tenant data**, loaded via documented interface. With dual native coding - regional catalogue code and national code - and **mandatory temporal validity**,
without which historical reporting is irreproducible.

### 5.2 What it must provide

Everything that regulation attributes to whoever delivers: the role of data controller; the
role of service provider to the national identity federation; the compliance with network security measures, with its own timeline; the determination of preservation terms; the definition of expected service levels towards its own patients, distinct from the levels the product measures.

And one thing often discovered too late: **regional catalogues are twenty-one independent update cycles**. The project does not distribute them and does not maintain them; it accepts them by reference from the customer.

### 5.3 What the project does not give them

- **It does not give them a supplier accredited with the national identity federation.** Not
   because it does not want to: because **it cannot**. The service provider is whoever delivers the
   service on the network (`D36`, constraint [`V-05`](../11_registri/01-vincoli-in-vigore.md#v-05), `OUT-22`). The project aims to be conformant and verifiable in continuous integration, and does not declare times that no primary source establishes.
- **It does not give them, today, conferment to national and regional documentary repositories.** The
   document models, the typology codes and the indexing metadata of the ten telemedicine typologies
   **are not publicly available** (question [`Q-07`](../11_registri/02-questioni-aperte.md#q-07)). The structural answer exists - canonical dataset and replaceable serialisation, with the adapter as an extension point to declared contract - but **the content is missing, not the project**, and no document model is hardcoded (constraint [`V-136`](../11_registri/01-vincoli-in-vigore.md#v-136)).
- **It does not give them a date for an outcome that does not depend solely on the project.** For
   accreditation with the identity federation, for the term of adjustment to national security measures and for the availability of document models the reason is that the milestone
   **is not the project's** (constraint [`V-180`](../11_registri/01-vincoli-in-vigore.md#v-180)). For **CE marking** the reason is different and must
   be stated with precision: planning is internal to the project (`D57`, `D58`), but **internal planning
   does not become a promise just because it is ours**, and the promise of a dated regulatory outcome produces an effect that the intention does not. Of each the project declares **the conditions** and **what it provides**; never the date.
- **It does not give them an «INTENTION» entry presented as «COMMITMENT».** No project material
   - documentation, website, response to tender, release note - can do this (constraint [`V-184`](../11_registri/01-vincoli-in-vigore.md#v-184)). A queue item for the release after the first is **planned** only if it has together binary completion criterion, declared trigger and named owner: in the absence of even one of the three it is **desirable**, and must be marked as such also in a specification response (constraint [`V-187`](../11_registri/01-vincoli-in-vigore.md#v-187)).

## 6. Two adjacent readers that this chapter does not address

**Whoever places a derived product on the market.** Integrates the code in their own product, places it on the market and **assumes by doing so the role of manufacturer**, independently of what is written in the licence. For them the compliance area is an **operational manual**, not an informative, and the reading path is in
[`docs/08_compliance/00-indice.md`](../08_compliance/00-indice.md) §3.1. The two warnings that save them months: the activities of the first thirty days are not delegable to development and cannot be recovered downstream; and the intended purpose is the most costly document to get wrong, because a single formulation shifts together the risk classification and the software safety class.

The project has decided to follow the same path in its own right (`D58`), establishing a manufacturing subject that today **does not yet exist**. The two things do not overlap and do not substitute for each other:
the project's path concerns **its own identified distribution**, not the derived product of a third party.

**Whoever contributes to code.** The guide to fundamentals in
[`docs/10_fondamenti/`](../10_fondamenti/00-come-usare-questa-guida.md) is a **declared prerequisite**
of [`CONTRIBUTING.md`](https://github.com/fedcal/Telemedic/blob/main/CONTRIBUTING.md), and is not a
bureaucratic formality: a system that treats healthcare data and falls within the discipline of medical
devices accumulates silent damage when modified by whoever does not know the context.

## Where to continue

- [04 - State and limits](./04-stato-e-limiti.md): what exists today, what does not exist, the
   consciously accepted tensions and what must be known before deciding.
- [`docs/07_integration/00-indice.md`](../07_integration/00-indice.md): the decision tree for
   choosing the integration modality and the three warnings that cannot be deferred.
- [`docs/06_security/09-ripartizione-delle-responsabilita.md`](../06_security/09-ripartizione-delle-responsabilita.md):
   measure by measure, what the project does, what whoever installs does, what is shared.
- [`docs/09_roadmap/03-primo-rilascio-utilizzabile.md`](../09_roadmap/03-primo-rilascio-utilizzabile.md):
   the installation assumptions and the declared limits of the first release.
