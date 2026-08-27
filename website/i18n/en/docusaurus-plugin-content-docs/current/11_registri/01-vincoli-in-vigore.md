---
title: Constraints in force
sidebar_position: 2
description: "The register of project constraints: every sigla cited in the documentation, who issued it, which areas it binds and what it imposes."
---

# Constraints in force

> **This chapter is generated.** Its source is the project's inter-agent noticeboard,
> projected into `registro/vincoli.tsv` and from there into this page. Editing it by
> hand has no effect: the edit disappears on the next regeneration.

Each entry is titled with the **sigla alone**, so that a reference such as `#v-160` is
stable and identical in both languages. The **From** and **To** fields name the area that
issued the entry and the areas it binds; the area siglas are those used in the project's
internal working context.

**Entry text remains in the language in which it was issued**, Italian, including on this
English page. This is a declared limitation, not an oversight: translating a register entry
would mean keeping two versions aligned at every change to the noticeboard, and a translation
that drifts from a governance register tells readers of different languages different things
about what the project is bound to do.

### V-01

**From**: ORCH · **To**: all areas · **State**: IN FORCE

`Encounter` and `MediaSession` are distinct aggregates. No area may merge them.

### V-02

**From**: ORCH · **To**: all areas · **State**: IN FORCE

No hardcoded clinical thresholds: they are patient-specific configuration.

### V-03

**From**: ORCH · **To**: all areas · **State**: IN FORCE

The system is fully functional without SNOMED CT. No major workflow may require it.

### V-04

**From**: ORCH · **To**: all areas · **State**: IN FORCE

The immutable log is a hash chain with separate storage. Entity versioning does not replace it.

### V-05

**From**: ORCH · **To**: all areas · **State**: IN FORCE

The project is compliant and verifiable on SPID/CIE/TS-CNS, **not accredited**: the service provider is the installer.

### V-06

**From**: ORCH · **To**: all areas · **State**: IN FORCE

**AMENDED BY `D58`, ENACTED BY `D63`.** The manufacturer role **will be assumed by the project**; the legal entity **is still to be established**. With `D63`, on 26 August 2026, the principal decided that the system **must be suitable for delivering services to real patients**: CE marking upon completion of a conformity assessment is no longer merely a path the project intends to pursue, it is a **product requirement**. `D63` **changes not one line** of either the actual state or the prohibition against stating dates: it changes the status of the objective, not what is true today and not what is sayable. It remains unchanged and must be restated here because it is the subject matter of the decision itself: **today the product bears no CE marking, is covered by no conformity declaration and is not usable for delivering healthcare services to real patients**. Reception sequence in `.telemedic/piani/D63-recepimento-del-ruolo-di-fabbricante.md`. The regulatory material is produced **for our path**, no longer «for whoever certifies»: that formula is prohibited in every document. **Remaining invariant and unattenuable**: (a) today the product **bears no CE marking** and is covered by no conformity declaration - a matter of fact, not position; (b) whoever installs, integrates or puts into service **nonetheless assumes** the obligations arising from it, and the intention to certify **transfers nothing to them**; (c) the acts that the rule reserves to the manufacturer role remain reserved **even when the role becomes ours**, and the distinction must not be erased: it is what makes clear why they cannot be anticipated; (d) the prohibition of `V-171` is complete - **no date, no window, no «by»**.

### V-07-bis

**From**: ORCH · **To**: all areas · **State**: IN FORCE

**Sole form: «hash chain», never «chain of hashes».** «Hash» remains allowed only where **the function** is named («hash function», «cryptographic hash»); the **output** of the function is always a «hash». The glossary had found the two forms in use in nearly equal measure - 36 against 33 - which is how a terminology divergence persists: neither of the two appears minority enough to be corrected. The entire documentation has been normalized.

### V-07-ter

**From**: ORCH · **To**: `GUIDA`, all areas · **State**: IN FORCE

**Outcome of cross-review of glossary: twelve reports, nine real and three false.** Corrected: broken link to module 18; «chain of hashes» unified to «hash chain» (`V-07-bis`); «patient's digital compliance» → «of the patient»; «remote monitoring» → «remote medical monitoring» in definition rows; canonical characterization of «aggregate» fixed on module 16; three characterizations of security at row level merged; collision on «traceability» - access versus requirements - disambiguated in module 12; «use error» clarified in module 10, where it could read as user fault. **Were not defects**: (a) «final coherence» does not exist in the corpus, only «final consistency» is in use; (b) «transactional outbox» occurs in four terminology tables with equivalent formulations - it is the **convention of the guide**, in which each module closes with its own terms, not an orphan concept; (c) internal glossary references are all resolved, verified automatically. **Registered as non-problems so they are not reopened**.

### V-07

**From**: ORCH · **To**: all areas · **State**: IN FORCE

The content of documents for the electronic health record is modeled as a canonical dataset; serializations are interchangeable.

### V-08

**From**: ORCH · **To**: `PROD`, `FUNZ`, `INTEG` · **State**: IN FORCE

Insurance companies are **always** excluded from access to the electronic health record (art. 15 c. 4, DM 7 September 2023). The payer is not a user.

### V-09

**From**: ORCH · **To**: all areas · **State**: IN FORCE

Absence of data is clinical information: silence is never treated as normalcy.

### V-10

**From**: `GUIDA` · **To**: `SEC`, `TECH` · **State**: IN FORCE

Relay server: minimum version 4.17.2 and network isolation on egress as **primary** defense.

### V-11

**From**: `GUIDA` · **To**: `TECH`, `FUNZ` · **State**: IN FORCE

The logging container is negotiated at runtime, never assumed.

### V-12

**From**: `GUIDA` · **To**: all areas · **State**: IN FORCE

No technical threshold is imposed by Italian regulation: the project's values are product specification, never conformity.

### V-120

**From**: `FUNZ` · **To**: all areas · **State**: IN FORCE

**Identifier ranges frozen by `FUNZ`**: `RF-230`…`RF-352`, `RNF-090`…`RNF-110`, `BR-100`…`BR-185`, `ATT-20`…`ATT-26`, `UC-01`…`UC-24`, `OUT-01`…`OUT-24`, outcome codes `EX-TM-*`. No area may reassign them. `RF-353`+, `RNF-111`+, `BR-186`+ remain free and must be requested here before use.

### V-121

**From**: `FUNZ` · **To**: `ARCH`, `TECH` · **State**: IN FORCE

The alarm is an **immutable sequence of events**; current state is a projection. No status column updated in place, neither for the alarm nor for the measurement nor for the plan.

### V-122

**From**: `FUNZ` · **To**: `ARCH`, `TECH`, `SEC`, `PROD` · **State**: IN FORCE

**Service hours coverage is a versioned runtime property** and conditions the validity of the recipient in the escalation chain: a recipient outside service hours is not a valid recipient. It is not a commercial parameter nor a contractual clause.

### V-123

**From**: `FUNZ` · **To**: `TECH`, `PROD`, `GUIDA` · **State**: IN FORCE

**The threshold field starts empty and is mandatory**: no prefilling, not even with values from the workflow or the last plan. References are shown as assigned, read-only, with explicit copy action.

### V-124

**From**: `FUNZ` · **To**: `ARCH`, `INTEG`, `TECH` · **State**: IN FORCE

Measurement instant and receipt instant are **two distinct mandatory fields**; the measurement identity for idempotence is (source, subject, parameter, measurement instant, value). Rules operate on the measurement instant.

### V-125

**From**: `FUNZ` · **To**: `SEC`, `ARCH`, `INTEG` · **State**: IN FORCE

The separation **between service center and delivery center** is an authorization constraint, not an organizational convention: whoever manages technical alarms does not access clinical content and the composition of a role that violates the separation is rejected with a validation error (`BR-166`, `RNF-110`).

### V-126

**From**: `FUNZ` · **To**: `PROTO`, `TECH`, `INTEG` · **State**: IN FORCE

**Typed outcomes are domain values, not error codes.** `EX-*` and `EX-TM-*` describe **how a service, alarm or measurement wait ended**, and are information content that enters documentation, reporting and indicators. **They do not flow into the problem type catalog** (`V-110`) nor into the unified error code catalog (`V-130`), are not emitted as protocol errors and do not appear in a problem body. An anomalous outcome is a **successful** operation that records an adverse fact: confusing it with an error causes what must remain in clinical records to disappear from them.

### V-160

**From**: `INTEG` · **To**: all areas · **State**: IN FORCE

**Scope of the public contract toward third parties.** Only the following are under contract - and thus subject to the twelve-month dismissal process: workflows, methods, parameters and schemas described in the application interface document; published FHIR profiles and capability statement; event types and their related data schemas; documented authorization scopes; problem type identifiers and outcome codes; interfaces of substitutable modules; messaging protocol of the embeddable component and closed set of theme properties. **Everything else is internal and may change without notice.** No area may expand or restrict this scope without declaring it here.

### V-161

**From**: `INTEG` · **To**: `ARCH`, `FUNZ`, `TECH`, `SEC` · **State**: IN FORCE

**No clinical content in outbound messages to third-party systems.** Events carry identifiers and references; content is retrieved with an authenticated call under the recipient's authorization. Applies to webhooks, FHIR notifications (`id-only` as default, full content disabled on channels toward the Internet) and any future channel.

### V-162

**From**: `INTEG` · **To**: `SEC`, `TECH` · **State**: IN FORCE

**Signature of outbound messages: asymmetric, with key identifier resolvable from the project's public material.** Shared secret is not offered as a default mode: it provides no non-repudiation and its rotation requires coordination with each integrator. The two references remain distinct: HTTP message signature on one side, body hash on the other.

### V-163

**From**: `INTEG` · **To**: `FUNZ`, `TECH`, `PROD` · **State**: IN FORCE

**Unbreakable limits on customization of the embeddable component.** Recording status indicator, notices and consent texts, key verification outcome, clinical error messages and encryption status indicator **are not themeable nor can be hidden**. The theme properties allowed are a closed, versioned set, validated server-side with contrast verification: a configuration that degrades accessibility **is rejected at save**, not flagged as a warning. No injection of arbitrary stylesheets from outside.

### V-164

**From**: `INTEG` · **To**: all areas · **State**: IN FORCE

**Operational corollary of V-03.** A new capability is not complete until it is reachable by a third-party system via a documented, versioned interface. The area that introduces the capability also introduces the contract: it is not work to be deferred to the integration area.

### V-165

**From**: `INTEG` · **To**: `SEC`, `FUNZ`, `COMP` · **State**: IN FORCE

**The assurance level propagated is the one required, not the one asserted**, and must always be qualified to distinguish authentication **performed** by the project from that **reported** by an integrator. An operation that regulation ties to strong authentication requires authentication performed: an assurance level reported by third parties does not satisfy it.

### V-166

**From**: `INTEG` · **To**: all areas · **State**: IN FORCE

**Operative corollary of V-08.** No authorization scope, no event type, no substitutable module and no tenant configuration may constitute a workflow - direct or mediated by a professional - by which a payer obtains clinical content or access to the electronic health record. The payer's integration profile is **administrative by construction**: service identifier, administrative outcome, amount.

### V-110

**From**: `TECH` · **To**: all areas · **State**: IN FORCE

**Two sole representations of error on public interface**: `application/problem+json` (RFC 9457) on the application plane, `OperationOutcome` on the interoperability plane. No third form. The descriptive field **never contains clinical content or direct identifiers**: it ends up in the caller's logs. The problem type catalog is **generated** from a versioned file and an uncatalogued error cannot be emitted.

### V-111

**From**: `TECH` · **To**: `ARCH`, `FUNZ`, `ROAD`, `COMP` · **State**: IN FORCE

**Expand and contract on every schema migration.** No release is both destructive and functional; **two consecutive versions of the application must be able to coexist on the same database**. It is the necessary condition for zero-downtime upgrade and rollback to a prior version. A feature requiring a destructive migration in the same release must be redesigned, not authorized by waiver.

### V-112

**From**: `TECH` · **To**: `SEC`, `ARCH`, `FUNZ` · **State**: IN FORCE

**The tenant context is set within the transaction, before any query**, with `SET LOCAL` and not with `SET`; in its absence, row-level security policies **deny everything**. Tables have forced policy application even for the owner, and the application role is not the owner of objects. No data access outside a transaction with resolved tenant.

### V-113

**From**: `TECH` · **To**: all areas · **State**: IN FORCE

**No raw cumulative counter may be cited as a quality indicator.** Loss, bytes, freeze duration and jitter buffer delay grow monotonically and must be **differentiated between consecutive samples**; corrected averages are ratios of differences. Applies to documentation, dashboards, marketing materials and interfaces.

### V-114

**From**: `TECH` · **To**: `PROD`, `FUNZ`, `COMP` · **State**: IN FORCE

**The session quality index is proprietary and must be declared as such.** It is not an opinion score according to any international recommendation: classical models are for **planning** narrow-band networks, factors for modern audio codecs are not standardized and for video nothing applicable to real-time exists. The formula is published; it uses the **minimum** across dimensions, not the average.

### V-115

**From**: `TECH` · **To**: `FUNZ`, `PROD`, `INTEG` · **State**: IN FORCE

**Application of V-11 also to server-side recording.** The container depends on the **codecs actually negotiated** in the session: the recording component chooses it at runtime without re-encoding and **records actual container and codecs in metadata**. The public statement is «standard container chosen based on negotiated codecs and recorded in metadata, encrypted at rest». **No single format can be declared**, in no material.

### V-140

**From**: `DOM` · **To**: all areas · **State**: IN FORCE

**Each service is its own state machine**, selected by type. Permitted actors, patient presence requirement, asynchrony, mandatory artifacts, permitted outcomes, recording eligibility and windows are **attributes of the service catalog**, not scattered conditions in code (`DM-10`, `DM-11`). Adding a service is one catalog row plus a state machine.

### V-141

**From**: `DOM` · **To**: all areas · **State**: IN FORCE

**Encounter state and outcome are distinct attributes.** State says where the encounter is, outcome what happened. `EX-NOSHOW` and `EX-TECH-PATIENT` share the terminal state and have **opposite** administrative effects: no area may collapse them into a single field.

### V-142

**From**: `DOM` · **To**: `ARCH`, `TECH`, `INTEG`, `PROTO` · **State**: IN FORCE

**Identifier normalization occurs at the boundary, never in the domain** (`DM-31`). The domain knows one internal canonical identifier and a collection of external identifiers qualified by attribution domain. No external identifier is a primary key. Contribution to `Q-06`, which remains under `ARCH`.

### V-143

**From**: `DOM` · **To**: all areas · **State**: IN FORCE

**The teleconsultation with patient report has a document type proper to the electronic health record** (DM 19 November 2025, art. 7, lett. p, and Ann. 1 § 2.20). The hypothesis «outpatient specialist report» is **wrong** and must not be used in any document, example, profile or public material.

### V-144

**From**: `DOM` · **To**: all areas · **State**: IN FORCE

**The telemonitoring model is written on the formulation «deferred collection of parameters for the professional's periodic review»** (`D46`). No artifact - documentation, interface, public material, class name or event name - may use «real-time monitoring», «continuous surveillance» or equivalent formulations.

### V-145

**From**: `DOM` · **To**: `FUNZ`, `INTEG`, `COMP`, `PROD` · **State**: IN FORCE

**Setting of service delivery discriminates rules.** Teleconsultation with patient scheduled and delivered by primary care physician or pediatrician **requires no prescription** and produces **digital annotation in place of report** (DM 30 September 2022, Ann. B; `REQ-59` of `B1`). The obligation to report is not unconditional and must not be hardcoded as such.

### V-146

**From**: `DOM` · **To**: `SEC`, `FUNZ`, `INTEG` · **State**: IN FORCE

**Five distinct consent objects**, with independent life cycles: healthcare act, data processing where applicable, recording, presence of third parties, transmission to external systems. Revocation of one does not touch the others. No «platform consent» exists in the model.

### V-147

**From**: `DOM` · **To**: `ARCH`, `TECH`, `FUNZ` · **State**: IN FORCE

**No care pathway in the code.** Adding a pathway must require only: authoring the definition, validation on load, publication with version and scope, associated document and consent models, coverage configuration. **Never a software release nor a schema migration** (`DM-92`, `DM-93`).

### V-148

**From**: `DOM` · **To**: all areas · **State**: IN FORCE

**Wait for measurement is an entity.** The absence of a measurement is a row that declares the absence - with expected window, deadline instant and cause when known - not the absence of a row. It is the operative form of `V-09` and the condition for adherence to be a defined quantity (`DM-57`).

### V-149

**From**: `DOM` · **To**: `ARCH`, `SEC`, `TECH` · **State**: IN FORCE

**Redaction is applied by the authorization engine, not by consumers**: a single point filters and computes totals over the filtered set. Six inference channels must all be closed (numbering, counts, pagination, notifications, differences between queries, error messages). **Test synthetic data must include redacted documents**, otherwise no proof exercises the path (`DM-73`).

### V-150

**From**: `SEC` · **To**: all areas · **State**: IN FORCE

The immutable log and application logs **contain no clinical content**; diagnostic logs carry no direct patient identifiers.

### V-151

**From**: `SEC` · **To**: `TECH`, `ARCH`, `DOM` · **State**: IN FORCE

The external terminology server **does not receive patient identifiers**; no persistent cache on disk

### V-152

**From**: `SEC` · **To**: all areas · **State**: IN FORCE

Retention: **24 months** for traceability logs, **12 months** for access and authentication data (DM 19 November 2025, Annex 4)

### V-153

**From**: `SEC` · **To**: `FUNZ`, `TECH` · **State**: IN FORCE

**Emergency access is a functional requirement**: free-form motivation mandatory, limited window and scope, notification, review with recorded outcome

### V-154

**From**: `SEC` · **To**: `INTEG` · **State**: IN FORCE

An authentication level **referred by an integrator** is to be marked as such and **does not** satisfy strong authentication requirements under art. 64 CAD

### V-155

**From**: `SEC` · **To**: `TECH`, `ROAD` · **State**: IN FORCE

No relay infrastructure metric can be labeled with the session identifier

### V-156

**From**: `SEC` · **To**: `TECH`, `PROD`, `COMP` · **State**: IN FORCE

**The project neither declares negotiated protocol versions nor cipher suites: it measures them per session and records them.** The negotiation occurs between two endpoints the project does not control; any static assertion would be false for part of the installed base. The version actually negotiated is read from connection statistics, stored among the session metadata and exportable; a value below the minimum threshold configured for tenant triggers an event. It applies to the registration container (V-11) and to the transport of application interfaces

### V-157

**From**: `SEC` · **To**: `ARCH`, `TECH`, `INTEG` · **State**: IN FORCE

**Single egress broker.** No application component opens connections to destinations derived from input data: only the broker has a route outward, and to the others egress is **denied at network level**. It is an architectural requirement, not a coding rule, because the defense must not depend on code correctness. The broker applies **in order**: name resolution once only with connection to the already-resolved address; verification of the resolved address by normalized comparison and intervals aligned to prefix; prohibition of following re-unverified redirects; closed lists of schemes, ports, sizes, times and hops. **Five** egress points flow into it: terminology gateway, interoperability toward national and regional infrastructure, webhook to the integrator, resolution of absolute references in resources, retrieval of metadata and key material. **The relay does not and must not flow into it**: V-10 applies to it. **One abuse test suite only**, executed against the broker

### V-130

**From**: `PROTO` · **To**: all areas · **State**: IN FORCE

**Single catalog of error codes**, generated and shared between clinical plane and application plane: the same concept carries the same code in the operation outcome and in the problem body. **An unlisted code cannot be emitted**: the build chain verifies it

### V-131

**From**: `PROTO` · **To**: `ARCH`, `TECH` · **State**: IN FORCE

**RFC 8838 §9**: the protocol conveying the candidates must deliver them *«exactly once and in the same order it was conveyed»*. A «publish and forget» broadcast among nodes **does not guarantee it**, and the resulting defect is intermittent and load-dependent. Distribution of session state is constrained by this rule

### V-132

**From**: `PROTO` · **To**: all areas · **State**: IN FORCE

When identity comes from an external issuer, **delegation is always used, never impersonation**: no configuration supported emits a token lacking the actor claim (RFC 8693 §4.1). Release criterion is blocking, together with isolation between tenant

### V-133

**From**: `PROTO` · **To**: all areas · **State**: IN FORCE

**Prohibited conformity formulas**: «conformant» to maps from messages to resources (all *Informative*); «standard» for the idempotency header (expired and archived **draft**) and for rate limiting headers (active **draft**, and the three-field form has **never** been standard); «conformant to the Italian guide» without the version (0.2.0, *trial-use draft*); «certified» on a draft in public comment; «encrypted end-to-end» without the condition of non-registration mode. Complete list and permitted formulas in [`docs/04_protocols/10-conformita-e-prove.md`](../04_protocols/10-conformita-e-prove.md) §2

### V-134

**From**: `PROTO` · **To**: `ARCH`, `TECH`, `INTEG` · **State**: IN FORCE

In the event envelope in binary mode the header with prefix for **content type** is **prohibited**: it is an explicit negative obligation of the specification. Content type goes **only** in the ordinary header. Coded as a negative test that fails if the header appears

### V-135

**From**: `PROTO` · **To**: `INTEG`, `FUNZ`, `SEC` · **State**: IN FORCE

The load of public events carries **references, never clinical content**: the receiver retrieves the content with an authenticated call. It applies also to the clinical channel, where the «identifier only» level is preset and «full resource» is **disabled** toward the public network

### V-136

**From**: `PROTO` · **To**: `ARCH`, `TECH`, `COMP` · **State**: IN FORCE

**No document template is hard-coded.** The templates of structured serialization, the type codes and the indexing metadata of the ten telemedic types are not publicly available (Q-07): the adapter exists as an extension point with declared contract, implementation is deferred. It is literal application of **V-07**

### V-137

**From**: `PROTO` · **To**: `ARCH`, `SEC` · **State**: IN FORCE

**Session key and room address are not metadata: they are credentials.** They are not persisted in queryable resources nor conveyed in message fields transiting third-party systems. They are obtained with an authenticated call, are single-use and very short-lived

### V-190

**From**: `GUIDA` · **To**: all areas · **State**: IN FORCE

**The development environment must be able to start on a machine disconnected from everything**: no account, no third-party supplier key, no mandatory remote service. It is the operational corollary of criterion C7 of [`docs/01_technical/01-stack-e-motivazioni.md`](../01_technical/01-stack-e-motivazioni.md) §2 and the cross-cutting prohibition on actual data: an environment that requires a third-party service to work is an environment that **enforces test data on someone else's system**, and no one notices. A documented startup procedure requiring registration with a supplier is a defect, not a configuration. Documented in [`docs/10_fondamenti/17-ambiente-di-sviluppo.md`](../10_fondamenti/17-ambiente-di-sviluppo.md) §1.1

### V-191

**From**: `GUIDA` · **To**: all areas · **State**: IN FORCE

**No documented procedure can contain the circumvention of a mandatory control.** Controls G1-G13 are **conditions of admissibility**, not quality judgments: circumventing one produces an artifact that could not have been produced and that carries a false declaration, with a green pipeline and a non-existent property. If a control legitimately blocks a legitimate development, **the control is corrected via the review procedure provided**, not disabled for one's own proposal. It applies in particular to the approval list of the terminology control, whose modification requires the review provided for compliance material. `17-ambiente-di-sviluppo.md` §9.4

### V-195

**From**: `GUIDA` · **To**: all areas · **State**: IN FORCE

**No area introduces a new primary source in the documentation without entering it in [`docs/10_fondamenti/20-fonti-primarie.md`](../10_fondamenti/20-fonti-primarie.md)** with name and complete details, subject in one sentence, place of retrieval, documents using it and **date on which it was verified**. It is not an editorial compliance: it is the only condition that makes it possible, when a regulation is repealed or replaced or a technical standard exits the list of harmonized ones, to **know in a single pass which documents depend on it**. An inventory of sources degrades in one way only - a source enters a chapter and does not enter the inventory - and from that moment it is incomplete without anyone noticing. The mechanism for recording the date is `Q-199`

### V-180

**From**: `ROAD` · **To**: all areas · **State**: IN FORCE

**AMENDED BY `D57` and `D58`. The rule remains, its reason changes.** **No project document declares a date for a milestone whose outcome does not depend on us.** Before the reason was that those milestones belonged to a third party; now they belong to us, and the reason is different and more compelling: **an intention is not a dated promise**, and a published date has a regulatory effect that the intention does not have - the intended purpose is also derived from the published material (art. 2, point 12, and art. 7 of Regulation (EU) 2017/745). Falling into the rule **without exceptions**: CE marking, accreditation with the national identity federation (`D36`, `V-05`, `OUT-22`), the deadline for adapting to national security measures (`D39`), the availability of documentary models for the types in the electronic health record (`Q-07`). For each, **conditions** and **what the project provides** are declared; never the date. **The internal calendar exists and remains internal**: planning a date and publishing it as a commitment are two distinct acts. [`docs/09_roadmap/00-indice.md`](../09_roadmap/00-indice.md) §3

### V-181

**From**: `ROAD` · **To**: all areas · **State**: IN FORCE

**Each milestone has a binary completion criterion, verifiable by a third party** who did not participate in the work. A percentage of progress is not a criterion. A milestone with ten criteria and nine satisfied is a milestone **not achieved**, and the report states which criterion is missing

### V-182

**From**: `ROAD` · **To**: `TECH`, `COMP` · **State**: IN FORCE

**No line of application code precedes the build chain** that generates the bill of materials and the register of requirement identifiers. Not «accompanies»: precedes. The only permitted exception is throw-away code for empirical verification, which is declared as such, lives in a separate area and **does not enter any distributed artifact**

### V-183

**From**: `ROAD` · **To**: all areas · **State**: IN FORCE

Release of the documentation body is **by complete area and in two languages**, never by file. Application of `D50` and `D52`: no area is closed until it is navigable online in both languages. **AMENDED by `D56`**: the requirement of both languages as a closure condition remains for **prerequisite areas** - public warnings, guide to fundamentals, compliance, security - where the divergence control **blocks**; for the rest of the corpus the control **reports**, with report published at every build, and the untranslated part is **visible and measured** instead of implicit. Release remains **by complete area, never by file**

### V-184

**From**: `ROAD` · **To**: `PROD`, `COMP`, `INTEG` · **State**: IN FORCE

No project material - documentation, website, bid response, release note, public communication - can present a `[INTENTION]` or `[HYPOTHESIS]` entry as if it were `[COMMITMENT]`. It is the most common form of reputational damage in a technical project, and it is committed in good faith

### V-185

**From**: `ROAD` · **To**: `TECH`, `SEC`, `COMP` · **State**: IN FORCE

**The service level for updating third-party components is expressed in days from publication of the notice, differentiated by severity, and is measured.** A commitment expressed in months is not plannable and is not accepted: with the pace observed on the relay node - fourteen releases in just over seven months - it is already outdated when published. Consequence of planning: the capacity needed to honor it is **recurring capacity** and must be subtracted before calculating any date

### V-186

**From**: `ROAD` · **To**: all areas · **State**: IN FORCE

**Conformity with national security measures has no product date.** The product declares the **evidence** and the availability date of each; the deadline of the obliged entity is determined by the insertion notice **received by it** and is not determinable by the supplier (`D39`). Permitted formulation in [`docs/09_roadmap/00-indice.md`](../09_roadmap/00-indice.md) §9.1

### V-187

**From**: `ROAD` · **To**: all areas · **State**: IN FORCE

**Planned against desirable.** A backlog item after the first release is **planned** if it has together a binary completion criterion, declared trigger and named owner. In the absence of even one of the three it is **desirable**, and is marked as such in every project material, including bid responses

### V-188

**From**: `ROAD` · **To**: `TECH`, `INTEG`, `ARCH` · **State**: IN FORCE

**The integration test suite always exercises at least two tenant and two distinct integrators**, with deliberately divergent configurations: distinct identifier attribution domains, distinct egress profiles, distinct event delivery modes, distinct sets of replaced modules. A test that passes with a single integrator configured does not demonstrate the multi-integrator property. It is the verifiable form of defense against structural dependence on a single interlocutor

### V-189

**From**: `ROAD` · **To**: all areas · **State**: IN FORCE

**Each program risk has an observable leading indicator and a named owner.** A risk recognized only when it occurs is an incident; a risk for everyone is a risk for no one. An entry lacking one of the two is reformulated or closed

### V-192

**From**: `GUIDA` · **To**: `ARCH`, `TECH`, `FUNZ` · **State**: IN FORCE

**Marker of syntheticity persisted in the data.** Every record produced by the generator carries an explicit syntheticity attribute **stored with the data**, not only known to the generator. It is what transforms the question «does this environment contain actual data?» from an investigation to **a query**, and what makes the separation verifiable between environments of `09-integrazione-continua-e-rilascio.md` §9 and the rule «never production exports» of `08-qualita-e-test.md` §4.1. It derives from [`docs/10_fondamenti/03-il-dato-clinico.md`](../10_fondamenti/03-il-dato-clinico.md) §10.4 and must be received in the **data model**, not left to the test factory alone

### V-193

**From**: `GUIDA` · **To**: `ARCH`, `TECH`, `FUNZ` · **State**: IN FORCE

**Every configurable parameter declares which of the four planes it belongs to**: decided in code · installation configuration · tenant configuration · per-patient configuration. The classification is **verifiable data, not documentary convention**, and is the operational corollary of the principle «configuration does not remove an invariant» ([`docs/02_architecture/01-visione-architetturale.md`](../02_architecture/01-visione-architetturale.md) §5, P5) and of `V-02`. Consequence that module 16 §9.3 makes explicit and that must be kept firm: **clinical thresholds are not tenant configuration**, which can only set its limits; a clinical parameter that appears in the «tenant configuration» plane is a perimeter defect, not a convenience. Without the classification, the question «is this behavior decided or configured?» is resolved case by case by whoever implements, and the answer changes from module to module. [`docs/10_fondamenti/16-architettura-del-progetto.md`](../10_fondamenti/16-architettura-del-progetto.md) §9

### V-194

**From**: `GUIDA` · **To**: `ARCH`, `TECH`, `PROD` · **State**: IN FORCE

**The fundamentals module is not an architectural source: it introduces.** [`docs/10_fondamenti/16-architettura-del-progetto.md`](../10_fondamenti/16-architettura-del-progetto.md) builds the intuition and reconstructs the reasoning; the **source** remains `docs/02_architecture/` and the register `docs/adr/`. Three operational consequences, symmetric to `V-200` for the overview: (a) when the architectural area changes the module 16 is realigned, **never the reverse**; (b) a divergence is resolved **always** in favor of the area, and whoever detects it brings it here instead of correcting it on their own; (c) **no substantial architectural assertion can exist only in module 16** - if one appears, it is for the architectural area to absorb it, with the corresponding ADR. It applies in particular to the decisions reconstructed in §10, which are **rereadings** of ADRs and not their substitutes

### V-170

**From**: `COMP` · **To**: all areas · **State**: IN FORCE

**Change control is a compliance measure, not a project practice.** A proposal introducing one of the functions from the closed list outside scope - system-proposed threshold, highlighting on non-clinician-configured intervals, ordering by severity, interpolation of gaps, synthetic indices, image enhancement, image measurement, automatic coding, automatic synthesis, biometric detection, compatibility declaration with a named device, automatic translation of clinical content - **is not evaluated on technical merit: it is rejected for perimeter policy**, with written regulatory motivation. It also applies to the introduction of an artificial intelligence component, which is a change of regulatory regime and not a technical choice. List and control in [`docs/08_compliance/02-qualificazione-e-classificazione.md`](../08_compliance/02-qualificazione-e-classificazione.md) §§6, 10. **The same exclusions keep the risk class at IIa and the software safety class at B together: they fall together and the cost is added up**

### V-171

**From**: `COMP` · **To**: all areas, in particular `PROD`, `GUIDA` · **State**: IN FORCE

**Prohibited formulas in every public artifact**, on the same foundation as `V-133` extended to the regulatory plane: art. 7 and art. 2, point 12, of Regulation (EU) 2017/745 make promotional material regulatory material, and the prohibition of misleading statements **does not presuppose marking**. No text from the project - page, `README`, section heading, interface description, error message, announcement - can state or imply a non-existent conformity, marking or certification. Table of prohibited formulas and permitted formulas in [`docs/08_compliance/01-inquadramento-normativo.md`](../08_compliance/01-inquadramento-normativo.md) §11. Verification **is not documentary but of process**: it bonds with `Q-174`

### V-172

**From**: `COMP` · **To**: all areas · **State**: IN FORCE

**Reserved namespace of regulatory document identifiers**: `MDR-*`, `QMS-*`, `SW-*`, `RM-*`, `UE-*`/`UEF-*`, `CE-*`/`PMCF-*`, `PMS-*`/`PSUR-*`/`VIG-*`, `ON-*`. No area can coin an identifier in these prefixes without declaring it here. Rule of disambiguation already in effect: **security regulatory documents always carry an alphabetic sub-prefix** (`SEC-LC-*`, `SEC-TM-*`, …); the form `SEC-` followed by digits only is reserved for requirements and is never used for a document. [`docs/08_compliance/03-sistema-di-gestione-della-qualita.md`](../08_compliance/03-sistema-di-gestione-della-qualita.md) §5

### V-173

**From**: `COMP` · **To**: `TECH`, `ARCH`, `ROAD` · **State**: IN FORCE

**No mobile version label**, on any dependency, base image or build chain tool. It is not operational preference: clause 8.1.2 of IEC 62304 requires that each configuration element be identified by title, manufacturer and **version**, and a mobile label identifies a different version at each build, makes the artifact non-reproducible, prevents impact assessment of the update and **makes false the bill of materials of the previous release**. Update is **an act**, with date, motivation and assessment. Blocking in the build chain. [`docs/08_compliance/03-sistema-di-gestione-della-qualita.md`](../08_compliance/03-sistema-di-gestione-della-qualita.md) §9.3

### V-174

**From**: `COMP` · **To**: all areas · **State**: IN FORCE

**Published documentation is not controlled documentation.** No chapter of `docs/` is a quality management system procedure nor a technical dossier document, and no area can present it as such: chapters are **inputs**, they contain the analysis from which a controlled document is written. Operational consequence stated in [`docs/08_compliance/04-fascicolo-tecnico.md`](../08_compliance/04-fascicolo-tecnico.md) §7: in the matrix of general requirements the project can fill out everything **except** the column «precise identification of controlled documents», which presupposes a document control system of a manufacturer. It is the junction point of the entire model of `D49`. **Note `D58`**: the constraint **is not attenuated**. Changes only to whom the control of documents must be established - to us - and the reason why the documentation is not controlled is no longer the absence of the subject but **the absence of the system**: [`docs/08_compliance/02-qualificazione-e-classificazione.md`](../08_compliance/02-qualificazione-e-classificazione.md) §5.2

### V-175

**From**: `COMP` · **To**: `FUNZ`, `PROD`, `INTEG`, `TECH` · **State**: IN FORCE

**Bidirectional link between usability and accessibility.** The usability engineering dossier declares, for each **interface feature linked to safety**, which accessibility criteria make it perceptible and actionable; the accessibility conformity report declares, for each criterion verified on those features, **that it is also a risk control measure**. Verifiable operational consequence: **the list of features linked to safety and the list of declared non-conformities have empty intersection**. An accessibility criterion covering a safety-linked function **is not a declarable non-conformity: it is an uncontrolled use risk**. It serves to prevent an accessibility compliance from absorbing a safety defect. [`docs/08_compliance/06-usabilita-e-accessibilita.md`](../08_compliance/06-usabilita-e-accessibilita.md) §6.3

### V-176

**From**: `COMP` · **To**: `TECH`, `ARCH`, all areas with tests in continuous integration · **State**: IN FORCE

**Citable evidence.** Every test outcome intended to be cited as evidence - clinical or technical - is produced in **citable form** and stored as an **immutable artifact**: exact software version, declared environment, date and time, executor, outcome, integrity hash. **A report that can be regenerated but is not preserved is not evidence**: at the time of citation the environment has changed and whoever asks to see the cited outcome receives a different one. It is a requirement distinct and more stringent than the reproducibility required by IEC 62304, because the recipient is external. `07-valutazione-clinica.md` §3.1

### V-177

**From**: `COMP` · **To**: `ARCH`, `FUNZ`, `DOM`, `TECH` · **State**: IN FORCE

**The magnitudes of the clinical follow-up are designed before the plan that promises them.** What the post-market clinical follow-up plan undertakes to collect must **exist as data**, with stable, versioned and comparable definition between installations and in time, **before** the plan is written: designing the instrumentation afterward means discovering the data is not there, and the elapsed period cannot be recovered. The definition of each magnitude is versioned - changing it without changing its name makes the historical series incomparable and nullifies the follow-up **without anyone noticing**. None of these magnitudes contains clinical content (`V-150`), and it is a condition, not a coincidence. `07-valutazione-clinica.md` §7.1

### V-178

**From**: `COMP` · **To**: `TECH`, `SEC`, `ARCH`, `FUNZ` · **State**: IN FORCE

**Two capacities without which the surveillance obligation cannot be materially satisfied.** **(a) Stable taxonomy of counted events**: non-serious events are to be counted in a comparable way between installations and in time; renaming or consolidating a category makes the series incomparable and **makes the significant increase disappear instead of detecting it**. **(b) Preservation of diagnostic signals for at least the window within which a report can arrive**: the deadline is **determined by surveillance obligations, not by operational need**, and is distinct from the deadlines of `V-152`, which respond to another source. Proposed reasoning: **twelve months configurable** for signals attributable to a service or alarm, with final determination by the manufacturer because it depends on the contractual deadline imposed on users. `[NV]` on the value: no source sets a deadline for diagnostics. **Closes Q-116.** `08-sorveglianza-post-commercializzazione.md` §5.2

### V-179

**From**: `COMP` · **To**: all areas · **State**: IN FORCE

**AMENDED BY `D58` in the addressee, not in substance.** «Quality system of whoever certifies» is now read as **quality management system of the manufacturer**, a role the project **intends** to assume and whose subject **is yet to be established**; the manufacturer can also be an integrator on its own distribution. **Project artifacts enter it as identified inputs, never as controlled documents.** Whoever acquires them **re-emits them under its own document control**, with own identifier, revision and approval. For re-emission to be possible and traceable, every artifact destined for the regulatory package carries **version, date and verifiable integrity hash**, resolvable from the project's public material. An artifact acquired without these three properties **is not justifiable in an audit**, because the manufacturer cannot demonstrate what it acquired and when. It is the operational complement of `V-174`: that one says these chapters **are not** procedures, this one says what is needed for them to become the input to another's procedure. `09-percorso-e-calendario.md` §7.2

### V-270

**From**: `COMP` · **To**: all areas · **State**: IN FORCE

**Mandatory register to name the manufacturer role and the intention to certify** (enacts `D57`, `D58` and amended `V-06`). **The expression «whoever certifies» as a third party is prohibited in any artifact.** In its place, depending on context: **«the project in the manufacturer role»** where talking about who intends to undertake the path; **«the manufacturer»** where talking about an act that the standard reserves to that formal role regardless of who exercises it - affixing the marking, signing the declaration, composing the dossier, naming the regulatory compliance officer: **acts that remain reserved even when the role is ours**, and the distinction must not be canceled because it is what makes it legible why they cannot be anticipated; **«the subject manufacturer, to be established»** where the passage presupposes the legal existence that today is lacking; **«whoever installs»** or **«whoever integrates»** where the text refers to them. **Four form rules, non-negotiable**: (a) intention is expressed with the verb **«intends»**, never with a future indicative; (b) **the absence of the legal subject is repeated in the same sentence** in which the intention appears, never in a note; (c) **the negative state of fact is in first position**, in bold, before any mention of the path - no CE marking, no statement of conformity; (d) **no date, no window, no «within»**, and the only permitted occurrence of that word is inside the statement of the prohibition. Instituted in [`docs/08_compliance/01-inquadramento-normativo.md`](../08_compliance/01-inquadramento-normativo.md) §11, declared in [`docs/08_compliance/00-indice.md`](../08_compliance/00-indice.md) §1.1

### V-271

**From**: `COMP` · **To**: all areas, in particular `PROD`, `GUIDA`, `ROAD` · **State**: IN FORCE

**The «are certifying, then I can use it» gap must be closed in writing wherever the intention to certify appears.** It is not enough to not state the marking: the declared intention is itself an element from which a reader draws an operational conclusion, and the conclusion is **wrong**. Every artifact naming the path must state, in the same place, that **the intention covers no one, transfers no obligation and does not make an uncertified version usable**: whoever installs, integrates or puts into service assumes in full the obligations that follow from it. Technical corollary from `DISTRIBUTION-POLICY.md`: **rebuilding sources does not reproduce the device** - what makes of an artifact *that* device is the controlled build chain and release under the manufacturer's quality management system - and without saying it the distinction between repository and distribution reads as a naming formality. [`docs/08_compliance/04-fascicolo-tecnico.md`](../08_compliance/04-fascicolo-tecnico.md) §12.1

### V-272

**From**: `COMP` · **To**: all areas · **State**: IN FORCE

**The intended-use trail is not a declaration, and the reason has changed: stating it explicitly is mandatory.** It is no longer «missing the subject who declares» - `D58` has refuted that formulation - but **missing the document control system that makes a declaration such**: without approval before emission, review and reapproval on changes, identification of the state of revision, availability of the applicable version at the points of use and protection from superseded versions (ISO 13485:2016, 4.2.4; records, 4.2.5), **what is signed is a signature on a text, not a declaration**, because it is not demonstrable to which revision it refers. The new condition is **verifiable and at our charge**, therefore makes the document more onerous, not less. No area can rewrite the motivation in the old form. [`docs/08_compliance/02-qualificazione-e-classificazione.md`](../08_compliance/02-qualificazione-e-classificazione.md) §5.2

### V-273

**From**: `COMP` · **To**: `FUNZ`, `PROD`, `INTEG`, `TECH`, all areas · **State**: IN FORCE

**The accessibility statement of the service is never the project's, and does not become so by effect of `D58`.** The obliged entity is **whoever provides the service on the network**, that is, whoever installs and puts into service; the project is obligated to the **accessibility properties of the product**, which is something distinct and which no deployer can add downstream. The constraint exists because `D58` makes the misunderstanding available: whoever reads that the project intends to assume the manufacturer role can conclude that that role absorbs the obligation of declaration, and **it is not so** - the manufacturer of a device is not, for that alone, the supplier of the service on the network, and the two positions have different sources, presuppositions and recipients. Operational consequences: no project artifact contains, attaches or anticipates an accessibility statement referring to a service; what the project provides is the **material that makes the statement fillable** - criteria verified with method and date, non-conformities with alternative measure, critical paths covered, version of the standard on which verification was conducted. **Corollary from `V-175`**: a criterion covering a safety-linked function **is not a declarable non-conformity**, so does not appear in that statement in any case. [`docs/08_compliance/06-usabilita-e-accessibilita.md`](../08_compliance/06-usabilita-e-accessibilita.md) §9

### V-274

**From**: `COMP` · **To**: all areas · **State**: IN FORCE

**The equivalence analysis of Annex XIV does not enter the project's public documentation, in any form or at any stage.** It necessarily names a comparator device and violates `R0` by construction; it belongs to the **technical file under the control of the manufacturer's documents**, not the repository. The constraint **is not attenuated** by the effect of `D58`: assumption of the manufacturer role shifts **who drafts** that document, **not where the document lives**. The old rationale must also be corrected, which was «it is a third party's document» and fell together with the third party: the true reason is **the scope of public documentation**, and stands on its own. Any reference to a possible comparator device, even only of product category, remains generic and non-identifying. [`docs/08_compliance/07-valutazione-clinica.md`](../08_compliance/07-valutazione-clinica.md) §6.1

### V-200

**From**: `PROD` · **To**: all areas · **State**: IN FORCE

**The overview is not a source: it routes.** No substantive statement can exist **only** in `docs/00_overview/`. The overview cites and defers; the source remains the competent area, and every statement in the overview is traceable to an area chapter, to a decision `D*`, to a dashboard constraint or to a document at the root of the repository. Three consequences: (a) when an area changes the overview realigns, **never the reverse**; (b) a divergence between overview and area is resolved **always** in favor of the area, and whoever detects it brings it here instead of correcting it autonomously; (c) the overview **does not duplicate** the text of documents at the root of the repository - it cites them by absolute address - because two copies of material that declares destination of use and limits of use are, pursuant to art. 7 of the MDR, two declarations that may diverge, and not a documentation maintenance problem. Incorporates the argument from `GUIDA` and `COMP` on `Q-26`

### V-201

**From**: `PROD` · **To**: all areas · **State**: IN FORCE

**Closes the `PROD` part of `Q-147`. No public material uses a single taxonomy of services.** Where services appear - public page, overview, `README`, capitulary response, commercial material - **both** taxonomies and their non-coincidence must be visible: the five activities of Agreement 215/CSR 2020 and the four minimum services of the DM of 21 September 2022. In particular **teleconsultation with patient and teleconsultation between professionals are never presented as a single service**, although they stand in a single minimum service, because they have different authorized actors and **the professional constraint applies to the activity, not the service** (`BR-011`). Presenting «the four services» without saying that under one of them are two distinct activities induces exactly the authorization error that `BR-011` exists to prevent. Applied in [`docs/00_overview/02-le-quattro-prestazioni.md`](../00_overview/02-le-quattro-prestazioni.md) §§2-3 and §5.2

### V-202

**From**: `PROD` · **To**: all areas · **State**: IN FORCE

**Closes `Q-121` and the residual `PROD` of `Q-14`. Public formulation of the service's service hours coverage.** Service hours coverage **is never presented as a commercial service level nor as a menu option**: it is a risk control measure at the weakest level of the hierarchy - informational - and presenting it as a negotiable parameter authorizes its reduction without the assessment that `RF-314` imposes. **No material can declare broader coverage than actually presided over**, and the coherence between public material and configured coverage is a release verification, not editorial review. The reference formula of [`docs/03_functional/05-gestione-degli-allarmi.md`](../03_functional/05-gestione-degli-allarmi.md) §11 **must not be diluted in any material**: it declares that the service does not substitute the emergency system, that outside the indicated hours data are not evaluated by a professional, and it indicates the configured channel. Corollary that this area adds: it is permitted to state *what the service does within the coverage declared by the provider*; **it is not** permitted to present coverage as a product characteristic, because coverage belongs to the entity that delivers, not to the software. Applied in [`docs/00_overview/02-le-quattro-prestazioni.md`](../00_overview/02-le-quattro-prestazioni.md) §7.6 and `03-who-we-serve.md` §3.1

### V-203

**From**: `PROD` · **To**: `COMP`, `GUIDA`, `ROAD` · **State**: IN FORCE

**Accepted the `PROD` part of `Q-174`: no public text is published without passing regulatory review**, with the table of forbidden formulas of [`docs/08_compliance/01-inquadramento-normativo.md`](../08_compliance/01-inquadramento-normativo.md) §11 and the list of [`docs/04_protocols/10-conformita-e-prove.md`](../04_protocols/10-conformita-e-prove.md) §2 as a joint checklist. Applies to public page, overview, `README`, repository description, announcements, release notes and capitulary responses. This area adds the reason why the safeguard must be reinforced precisely on the overview: **it is the project text with the highest ratio between visibility and density of synthetic statements**, and is therefore the point where a synthesis involuntarily stronger than the original has the highest probability of being cited by a third party as destination of use (art. 2, point 12, MDR). Operational rule that follows and that this area has applied to itself: **a synthesis cannot be more assertive than the source it synthesizes**; in doubt cite the source instead of reformulating it

### V-280

**From**: `ROAD` · **To**: all areas · **State**: IN FORCE **Stratum of `D63`, 26 August 2026.** The client has decided that the system must be suitable for delivering services to actual patients. The decision **strengthens this constraint instead of loosening it**: the more decisive the objective, the more an internal planning date resembles a promise of outcome to the reader's eye, and the more the prohibition on writing that the product will be marked within a date is the only thing that keeps the two readings apart. `RU-1` of 30 November 2026 is an engineering milestone and **remains unsuitable for patients**: it stands on a different timeline than the conformity path, and juxtaposing the two would produce the misleading declaration that art. 7 of Regulation (EU) 2017/745 forbids.

**Reformulates `V-180` in light of `D57` and `D58`. The roadmap is internal project planning.** No document presents the milestones or schedule as «path of a third party», «certification schedule» or «third-party milestones**: **the owner of planning is the project**, including the conformity path, and where a step formally presupposes the manufacturer role it is stated that that role **must be established and formalized** (`Q-280`). Only the dates that the regulation places on a different subject remain non-declarable: the user's adjustment deadline (`V-186`) and accreditation of the service provider to the national federation (`V-05`, `OUT-22`). **Insurmountable limit that accompanies the constraint and does not separate from it: an internal planning date is not a promise of outcome.** In no material is it written that the product **will be marked within a date** (`V-171`), and it remains declared with the same prominence as before that **today the product bears no CE marking**, is not covered by any declaration of conformity, and whoever installs, integrates or puts into service nonetheless assumes the obligations that flow from it

### V-281

**From**: `ROAD` · **To**: all areas, in particular `COMP` · **State**: IN FORCE

**No milestone enters the plan if it requires two distinct subjects and the second does not exist.** Under `D54` internal audit, release review, configuration verification performed by whoever did not write the code and independent external review of security-critical code (`D18`) **are not producible internally**: it is not a matter of hours, it is a matter of different people. The registration that would flow from it **is declared as a gap, with the date it originates**, and is not planned as an activity - planning an unproducible activity is the most effective way to make it disappear from view. Process consequence to account for: a registration produced by whoever performed the activity **must not be presented as conformity**; it is formally present and substantively empty, and is worse than absence because falsely reassuring. Open allocation in `Q-189`, form of declaration in `Q-282`. [`docs/09_roadmap/01-principi-e-metodo.md`](../09_roadmap/01-principi-e-metodo.md) §9-bis; [`docs/09_roadmap/03-primo-rilascio-utilizzabile.md`](../09_roadmap/03-primo-rilascio-utilizzabile.md) §5.3

### V-282

**From**: `ROAD` · **To**: all areas · **State**: IN FORCE

**Scope is the only free variable.** With the date fixed by `D53` and capacity by `D54`, an overrun **is not absorbed by shifting the date and is not absorbed by increasing capacity**: it is absorbed by **reducing scope**, according to the sacrifice order declared **in advance** in [`docs/09_roadmap/03-primo-rilascio-utilizzabile.md`](../09_roadmap/03-primo-rilascio-utilizzabile.md) §6, which is executed from the top and **contains only reversible cuts**. Release blocking criteria or the forbidden debt list never enter it (`01-principles-and-method.md` §7.3). **Each reduction is recorded with date and reason**: an unrecorded reduction is an undecided cut, and causes the choice to lose the only property that `D53` requires it to retain, namely readability. If the order is exhausted, **the date is declared missed** with the recorded cause, and is not shifted silently

