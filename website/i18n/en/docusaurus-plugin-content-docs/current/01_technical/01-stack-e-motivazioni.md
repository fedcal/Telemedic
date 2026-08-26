---
title: "Technology stack and motivations"
sidebar_position: 2
description: "Every technology in the stack - which problem it solves, which alternatives have been discarded and for what reason, which minimum version is required and why, how it is classified as a third-party component and what happens if one day it needs to be replaced."
---

# Technology stack and motivations

This chapter does not list technologies: it justifies them. For each component it declares the problem it solves, the alternatives evaluated and the reason for rejection, the minimum version required with the technical reason that fixes it, the classification as a third-party component and the substitution strategy. A list without motivations is useless in a project that must produce a technical dossier: the standard does not ask *what* is used, it asks *why* and with what oversight.

The foundations of the concepts cited - what is an event broker, what is a transactional outbox, what is a bounded context - are not repeated here: they are in [`docs/10_fondamenti/11-fondamenti-informatici.md`](../10_fondamenti/11-fondamenti-informatici.md). The architectural consequences of the choices are in `docs/02_architecture/`. Here we stay on the technical plane: versions, constraints, traps, replaceability.

---

## 1. What is binding and what is a choice

Three levels, to be kept distinct throughout the reading.

**Binding by decision of the owner.** The stack declared in `00_PROJECT_BRIEF.md` §2: Spring Boot 3.4 on Java 21, Angular 21 with autonomous components, WebRTC with DTLS-SRTP, coturn as relay server, FHIR R4 as the interoperability model, Keycloak as the identity federation product, TimescaleDB for time series, entity versioning for application audit, Docker Compose for packaging, Docusaurus for documentation. It is not discussed *whether* to use them: it is discussed *how*, with which version and with which fallback.

**Binding by architectural baseline.** `04_BASELINE_ARCHITETTURALE.md` adds decisions that this chapter adopts without renegotiating: transactional outbox on PostgreSQL as the sole source of outgoing events (§5), immutable register as a hash chain separate from the system that generates the events (§6), one schema per tenant with row-level security as defence in depth (§4), unique gateway to terminologies (§7), relay server in minimum version 4.17.2 (§9).

**Technical choice of this area.** Everything else: the minor version of each component, the schema migration tool, the project builder, the validation library, the mechanism by which the outbox feeds the broker, the log format. These choices are motivated here and are contestable on the noticeboard, not elsewhere.

---

## 2. The selection criteria, declared before the choices

A criterion declared after the choice is a justification, not a criterion. These have been fixed before and applied to all components in the same way.

| # | Criterion | Why it is a criterion and not a preference |
|---|---|---|
| C1 | **Replaceability under sovereignty constraint** | Constraint V1 imposes that no obligatory component of the main path depends on a non-replaceable service or established outside the Union. A component is chosen also based on how much it costs to remove. |
| C2 | **Licence compatibility with Apache-2.0** | D1 rejected a strong copyleft precisely to allow integration into third-party proprietary products. A component with incompatible licence transfers that problem downstream, to the integrator, which is exactly what D1 wanted to avoid. |
| C3 | **Surveillability as a third-party component** | IEC 62304 §8.1.2 requires, for every component not developed by the project, a plan to monitor vulnerabilities. A project without a public advisory channel, without a release cadence and without a history of corrections is not surveillable, and therefore not adoptable in a medical device, however good its performance. |
| C4 | **Homogeneity of skills** | Every additional language in the stack multiplies the build chain, the dependency surface, the static analysis tools, the bill of materials and the number of people needed to maintain the system. A second language is paid for years. |
| C5 | **Sustainability of installation at the customer** | D8 imposes the dual model: multi-tenant managed service and single-tenant installation. A component that requires a five-node cluster to exist makes the second model impractical for a small practice. |
| C6 | **Native observability** | A component that does not expose metrics and does not produce structured logs must be instrumented from outside, with code that then must be maintained. |
| C7 | **No real data, no required external service in development** | The cross-cutting constraint §11.2 of the architectural baseline applies also to the development chain: a component that to function locally requires a remote service is a component that imposes test data on a third-party system. |

Where a component violates a criterion, the violation is declared together with the mitigation. No perfect choices exist: only choices with the account in the open.

---

## 3. Summary overview

Minimum version means: below that version the system is not supported, and the reason is technical, not aesthetic. The **third-party regime** is the classification for the purposes of managing components not developed by the project, detailed at §14.

| Component | Minimum version | Reason for the threshold | Regime | Replaceable? |
|---|---|---|---|---|
| Java (platform) | **21** (LTS) | Virtual threads finalised; record patterns and pattern matching on `switch` finalised; ordered collections. Below 21 the first two are in preview and are not usable in live operation. | Runtime | No (it is the platform) |
| Spring Boot | **3.4.x** | Spring Framework 6.2 base; support for virtual threads on web containers; `RestClient` and `@HttpExchange` stabilised; first-class support for Micrometer with tracing. | Library | No in v1.0 |
| Angular | **21** | Autonomous components as default, signals stabilised, `@if`/`@for` in templates, incremental hydration. | Library | No in v1.0 |
| PostgreSQL | **16** | `SET LOCAL` with `pg_settings` for tenant context; improvements to declarative partitioning and logical replication; `SKIP LOCKED` mature for outbox relay. Version 17 is preferable but not necessary. | Service | Difficult (it is the pivot) |
| TimescaleDB | **2.x** | Time series on parameters and session metrics. **See §7: the licence imposes a verification and a designed fallback.** | Extension | **Yes, by design** |
| Keycloak | **26.x** | Realm broker model, SAML2 and OIDC providers, attribute mappers, session policy. | Service | Difficult |
| Apache Kafka | **3.7+ in KRaft mode** | Single node without external coordinator: it is what makes installation at the customer sustainable (C5). | Service | Yes, behind interface |
| coturn | **4.17.2** | Below this version known vulnerabilities remain open for pool exhaustion and quota bypass. See §9. | Service | Yes (it is a standard) |
| Docker / Compose | **Compose spec v2** | Packaging of the single-tenant profile. | Tool | Yes (Helm in parallel) |
| Docusaurus | **3.x** | Internationalisation with mirrored structure, required by D50. | Tool | Yes |

---

## 4. Java 21

### 4.1 The problem it solves

The system is, in substance, a waiter coordinator: it waits for the database, waits for the identity federation product, waits for the integrator's system, waits for the electronic health record, waits for the peer. The concurrency model is therefore the most consequential choice of the platform, more than the language.

### 4.2 Why 21 and not 17

Version 17 is still an extended support version and would be defensible. The operational difference is concentrated in three points.

**Virtual threads are finalised in 21.** In 17 they do not exist; in 19 and 20 they are in preview and require `--enable-preview`, which is unacceptable in a distributed artefact because the platform does not guarantee binary compatibility between versions for code compiled in preview. With 21 you can write readable, blocking domain code - which is precisely what is needed in a system where most complexity is clinical and not technical - without paying the cost of a platform thread pool sized to the worst case. The reactive model remains available but is not imposed: see [`02-backend.md`](./02-backend.md) §6 for the application rule, which is restrictive.

**Record patterns and pattern matching on `switch` are finalised in 21.** It is not syntactic sugar: the clinical domain is full of closed hierarchies - the state of a service, the outcome of a media session, the type of measurement, the consent regime - and a `sealed interface` with exhaustive `switch` transforms into a compile error the addition of an unhandled case. In a system where the omission of a case might mean an unforwarded alert, compiler-verified exhaustiveness is a risk control at zero cost.

**Ordered collections** eliminate an entire class of defensive code on "the first element" and "the last element" of temporal sequences.

### 4.3 And the next extended support version

There is a more recent extended support version than 21. The project **does not** adopt it in v1.0 for two reasons: the regulatory tooling chain - static analysis, bill of materials generator, instrumentation agents - stabilises on extended support versions with a delay, and changing platforms mid-traceability path means re-running verification on a different base. Migration is a roadmap item, not a v1.0 choice. `[NV]` - the exact date of end of public free updates support for 21 depends on the platform distributor chosen by whoever installs and must be verified against the distributor's source, not assumed.

**Consequent binding**: the platform version is fixed in the build chain (`maven.compiler.release=21`, base image with the same major version) and is not a detail of the environment. A compilation that accepts a different platform from the one declared makes the build non-reproducible, and reproducible build is a requirement of D17.

### 4.4 Discarded alternatives

| Alternative | Why discarded |
|---|---|
| **Kotlin on the same platform** | Superior ergonomics, but introduces a second compilation chain, a second set of static analysis rules and a second dictionary of skills required from contributors. In a project that declares it wants to be contributable by those starting from zero (D35), it is an unjustified cost of entry. |
| **An event-driven execution environment on another language** | Would violate C4 without solving anything that virtual threads don't already solve, and would move outside the platform ecosystem all the reference healthcare libraries, which are mostly written for it. |
| **A language compiled to native binary** | Better startup times and memory footprint, but none of the reference healthcare interoperability libraries are available, and would need to be rewritten. Rewriting a clinical profile validation engine is exactly the kind of activity a healthcare project must not do. |

### 4.5 Compilation to native image

Ahead-of-time compilation to native image is **supported as an optional profile, not as the default mode**. Reason: reflection, dynamic proxies and dynamic resource loading used by the persistence layer and the profile validation engine require configuration metadata that must be maintained, and every dependency added is a potential failure in native build phase and not in execution phase. On a medical device, an execution mode that behaves differently from the one on which verification was performed is a mode that must be verified all over again. The native profile exists, is built in continuous integration and is tested by the same suite, but **the reference distribution is the one on virtual machine**. `[NV]` - the gains in memory and startup time have not been measured on the project: any figure published before measurement would be invented.

---

## 5. Spring Boot 3.4

### 5.1 The problem it solves

Not "making APIs": anything makes APIs. The problem is having, in a single coherent and maintained set, identity federation with OpenID Connect and SAML 2.0, declarative transaction management, typed configuration binding, instrumentation with metrics and traces, boundary validation and testing with ephemeral containers. Putting them together by hand means writing and maintaining integration code that has no clinical value.

### 5.2 Why 3.4 as minimum

- **Spring Framework 6.2 base.** Without it there are missing refinements on the abstraction of waits and on propagation of observability context across asynchronous boundaries, which is what makes distributed tracing usable without writing propagators by hand.
- **Virtual thread activation on the web container with a property.** Without it the choice of §4.2 does not translate into server HTTP behaviour.
- **Declarative and synchronous HTTP client stabilised.** The code that calls the integrator's system, the health record or the identity federation product is blocking code that becomes readable and testable without reactivity.
- **Actuator with distinct readiness and liveness endpoints**, a direct requirement of packaging on a container orchestrator.

`[NV]` - the exact dates of end of free public support of minor versions must be verified on the upstream project's support page at the time of release, and must be recorded in the register of third-party components as review date. They are not cited here because they will change before publication.

### 5.3 Discarded alternatives

| Alternative | Reason for rejection |
|---|---|
| **A native-oriented ahead-of-time compilation container** | Better startup time and memory. But the security ecosystem - SAML2 provider for national federation, integration with the identity product chosen, attribute-based authorisation filters - is significantly more mature on the alternative chosen, and security of access to healthcare data is not the place to economise on maturity. |
| **An ahead-of-time compilation container based on annotation processing** | Same reasoning, plus a smaller user base, so fewer eyes on vulnerabilities. Criterion C3 explicitly penalises smaller spread: a heavily used component receives security reports first. |
| **Pure enterprise specification on an application server** | Coherent and standardised, but requires the application server as a separate artefact, which complicates packaging to single tenant (C5) and moves part of the configuration outside the repository, that is outside the configuration control required by D45. |
| **No container: only libraries assembled by hand** | Maximum control, minimum speed. In a project with a fixed delivery date and a traceability obligation, time spent building infrastructure is time subtracted from domain verification. |

### 5.4 What is used and what is deliberately excluded

Used: constructor dependency injection, declarative transactions, typed configuration binding, boundary validation with annotations, security with OpenID Connect resource server, actuator, Micrometer, testing with ephemeral containers.

**Not** used: lazy loading of properties from remote sources at runtime without contract (would violate C7 and make configuration of a recorded session non-reproducible); automatic service discovery on external registries in v1.0 (the single-tenant installation has a fixed and small number of services: a registry would be an additional component to maintain and secure for no benefit); field injection (makes the class untestable without container and hides dependencies).

---

## 6. Angular 21

The architectural detail is in [`04-frontend.md`](./04-frontend.md); here we stay on the choice.

**Why a complete framework and not a view-only library.** The interface is not a window dressing: it contains a media negotiation engine with state machine, a consent collection module with legal value, a reporting module, administration panels and a component embeddable by third parties. A complete framework with routing, forms, internationalisation, dependency injection and built-in testing tools reduces the number of third-party components to be inventoried and monitored (C3): ten libraries assembled by hand are ten items in the component register, a complete framework is one.

**Why 21.** Autonomous components as default eliminate the module level, which was the main source of accidental coupling; signals give a synchronous and verifiable reactivity model that lends itself to being tested without fake clocks; incremental hydration is what makes sustainable the first load on mobile network, which is the reference use case imposed by D25.

**Discarded alternatives.** A view-only library with assembled ecosystem: lighter, but each choice (routing, forms, internationalisation, state) becomes a project decision and a component to monitor, and none of those choices have clinical value. A fine-grained compilation and reactivity framework: technically interesting, smaller user base and less mature accessibility tools - and accessibility here is a functional requirement (D25), not a finishing touch. Server-side rendering with static generation: the product is an authenticated application with long sessions, not a content site; server-side rendering serves only for the first load and is adopted in that form, not as architecture.

**The embeddable component is not Angular.** The artefact that the integrator embeds in their interface is a custom element conforming to the web components standard, not an Angular application mounted inside another application. The reason is contractual: imposing a framework on the integrator would violate the project implication n. 1 of the archetype integrator profile. The detail is in `docs/07_integration/`.

---

## 7. PostgreSQL and TimescaleDB

### 7.1 PostgreSQL as the pivot

Three properties make it non-negotiable in this project, and none concern performance.

1. **Row-level security exists and is applied by the engine.** Isolation between tenants cannot rest solely on the fact that developers remember to filter: the architectural baseline (§4) imposes defence in depth, and this is the only defence that survives an application error.
2. **The transactional outbox works because the transaction is real.** Writing the datum and the event in the same transaction is what eliminates the entire class of failures "event lost / phantom event". Without serious transactions there is no outbox, and it is the architectural baseline §5 that imposes it.
3. **`SELECT ... FOR UPDATE SKIP LOCKED`** makes possible outbox relay at multiple instances without external coordinator - which, in turn, makes single-tenant installation sustainable (C5).

The alternatives were excluded by construction: a document database does not offer multi-document transactions with the required isolation without trade-offs, and above all does not offer row-level security; a proprietary database would violate C1 and C2 together.

### 7.2 TimescaleDB: the choice, and the problem that no one should discover afterwards

The technical problem is real: telemonitoring parameters and media session metrics are time series at high insertion rate, almost never updated, almost always queried for interval and for subject, and with a lifecycle governed by retention policies. Generic relational tables handle this profile poorly: indices grow, deletions for retention produce fragmentation, window aggregations are rewritten by hand every time.

TimescaleDB solves the problem by staying **inside** PostgreSQL: same transactions, same credentials, same row-level security, same migration tool, same backup. It is exactly the kind of component that satisfies C4 and C5, because it does not add a service: it adds an extension.

**The problem is the licence, and it must be said now.** The project is distributed under Apache-2.0 (D1) and must be integrable into third-party proprietary products. It turns out that the advanced features of the extension - in particular compression and continuous aggregates - are not distributed under an approved open source licence but under a proprietary licence of the source-available type, with restrictions on offering the component as a managed service to third parties. **`[NV]` - this statement must be verified against the primary licence text, artefact by artefact, before any publication.** It is exactly the case provided by D34: a permissive statement on a container does not dispose of rights to the content within it, and verification must be done on the primary licence.

Operational consequences, which hold regardless of the outcome of verification:

- **Telemedic does not redistribute the extension.** It is a runtime dependency that whoever installs adds to their database. Telemedic's licence is not touched; the obligation to verify falls on whoever distributes the complete installation, and it is material that the project must provide to them, not hide (D28).
- **The project documents the constraint for whoever installs** in the third-party component record, with the "licensing regime" field filled in and not left blank.
- **The architecture provides a fallback by design, not by emergency.** See §7.3.

Open question on the noticeboard at `COMP` (see §15): legal verification of the licence text and its placement in the four terminology regimes of D31 - which were defined for terminologies but whose logic applies identically to any incorporated component.

### 7.3 The designed fallback: native declarative partitioning

The persistence layer for time series sits **behind a project interface** (`TimeSeriesRepository`), with two implementations:

- implementation at **hyper-tables** of the extension, default when the extension is present and whoever installs has accepted its licensing regime;
- implementation at **native declarative partitioning** of PostgreSQL, by time interval, with partition creation scheduled and retention realised by detaching and discarding the partition - an operation which, unlike row-by-row deletion, is constant in time and does not fragment.

The fallback **is not degraded on the functional plane**: it loses compression and continuous aggregations, which must be replaced with summary tables updated by the application. It loses performance and convenience, not capability. The persistence test suite runs **on both implementations** in continuous integration, otherwise the fallback is a statement and not a fact.

The detail of the schema and retention policies is in [`03-persistenza.md`](./03-persistenza.md).

### 7.4 Why not a dedicated time-series archive

| Alternative | Reason for rejection |
|---|---|
| **Metrics archive with sample dropout** | It is designed for operational metrics with short retention, sampling with loss and no transactional guarantee. A clinical parameter measured by the patient **is not a metric**: it is healthcare data, immutable, with capture context, subject to regulated retention and to right of access. Confusing the two is the most common modelling error in this domain. Operational metrics of the system, those yes, go there: see [`06-osservabilita.md`](./06-osservabilita.md). |
| **Standalone time-series archive** | Adds a service, a security model, separate backup, separate retention policy and separate credential chain from the clinical database - and makes impossible a transaction that comprises the datum and its access record. Violates C4 and C5. |
| **Column-store archive for analysis** | Excellent for analysis, unsuitable for single low-latency insertion and single-subject queries which is the real access pattern of telemonitoring. |

---

## 8. Keycloak

### 8.1 The problem it solves

Not "the login". The problem is: being a service provider to national identity federation in SAML 2.0 and OpenID Connect, maintaining separate realms for the clinical context and for the patient context with a sole broker realm to the federation (architectural baseline §8), accepting identities already authenticated by the integrator's system without a second login, and propagating an authentication assurance level to the authorisation decision. Writing all this is a project in itself.

### 8.2 Three known defects to treat as risks, not as configuration notes

D37 declares them and this area adopts them as configuration requirements verified in automatic test, not as recommendations:

1. the federated user can alter their own attributes;
2. the federated user can change their email address without verification;
3. the federated user can set a local credential, bypassing the federation.

Each one is, in a healthcare context, a path to privilege escalation or to impersonation. They must be closed in configuration **and** verified by a test that fails if the configuration regresses. A security configuration without a test that monitors it is a configuration that will become insecure at the first update. The detail of countermeasures is the responsibility of `docs/06_security/`; here is registered the technical constraint: **the configuration tests of the identity federation product are part of the mandatory suite**, and run against an ephemeral instance, not against a shared environment.

### 8.3 Token exchange is ours, not theirs

D18 is clear: the token exchange function of the product is in preview state and we do not depend on it. Token exchange is realised **in the Telemedic gateway**, with delegation always represented by the claim foreseen by RFC 8693 §4.1 and never by impersonation. On the technical plane this means the gateway is a security component written in-house, and entails obligations that the rest of the code does not have: independent external review, dedicated abuse tests, substantially total coverage on the validation path. See [`02-backend.md`](./02-backend.md) §3 and `docs/06_security/`.

### 8.4 Discarded alternatives

| Alternative | Reason for rejection |
|---|---|
| **Newer and lighter open-source identity products** | Better ergonomics, but support for SAML 2.0 as a service provider to a national federation with stringent compliance requirements, and the existence of public implementations of the Italian profile under permissive licence, are the deciding factor. Rewriting a SAML2 service provider conformant to a national profile is the kind of work that you underestimate by exactly an order of magnitude (see D38 on the batch of multiple instances per identity provider). |
| **Managed identity service** | Direct violation of V1. Not negotiable. |
| **Identity managed in the application** | Moves credential management into the perimeter of the medical device, which increases risk surface and verification perimeter without any benefit. |

---

## 9. coturn

### 9.1 Minimum version 4.17.2, and why it is not an opinion

The architectural baseline §9 fixes it, constraint V-10 reinforces it, and verification against primary source that produced it is documented in `.telemedic/research/B3-verifica-coturn-webrtc.md`. The relevant fact for this area is the **form of the changelog**: fourteen releases in just over seven months in 2026, of which five in August alone, and a family of six distinct vulnerabilities, over eight years, all reducible to the same schema - bypass of peer address lists through canonicalisation or wrong IPv6 address comparison, four of which in the last eight months.

This produces a technical conclusion that must be written explicitly and which is constraint V-10: **the list of forbidden addresses is defence in depth, not primary defence. The primary defence is the outbound network isolation of the relay node**, applied outside the process - infrastructure network rules, not configuration file directives. It is the only defence that has withstood all six vulnerabilities in the family.

Operational consequence on the update channel: with that release cadence, an obligation to update expressed in months is meaningless. The service level must be expressed in **days from publication of the advisory, differentiated by severity**, and must be measured. The technical proposal of this area is in [`09-integrazione-continua-e-rilascio.md`](./09-integrazione-continua-e-rilascio.md) §7; the formal decision belongs to post-market surveillance and therefore to `COMP`.

### 9.2 Why coturn and not something else

It is the reference implementation, it is the one on which browser behaviours are verified, it exposes native metrics, it has a public security advisory channel and a verifiable correction history - that is it satisfies C3 better than any alternative. Managed alternatives violate V1 without exception; alternatives in other languages violate C4 and have a smaller user base, so fewer security reports.

### 9.3 What the project **does not** implement

It must be said because it touches public communication. The fallback to relay when direct connection fails **is not Telemedic code**: it is the native behaviour of connectivity negotiation, which assigns relay candidates the lowest type preference and uses them only if nothing else works. Adaptive bitrate **is not Telemedic code**: it is the congestion controller inside the browser. What the project realises is to emit relay credentials that are valid, short-lived, for an opaque subject, and **to measure** what happened. Claiming implementation of mechanisms that belong to the protocol or to the browser is a defect of technical honesty that is paid for at verification time. The detail is in [`05-media-e-tempo-reale.md`](./05-media-e-tempo-reale.md).

---

## 10. Apache Kafka and the outbox

### 10.1 The division of roles

Architectural baseline §5 is binding: the transactional outbox on PostgreSQL is the **sole** source of outgoing events, the broker is fed by the outbox and never by a second application write. Therefore the broker is not the source of truth: it is the distribution means. This distinction changes the selection criterion, because what the distribution means needs is retention, re-reading and partitioning by key - not transactional guarantee, which sits upstream.

### 10.2 Why a log and not a queue

| Alternative | Reason for rejection |
|---|---|
| **Traditional message queue** | The consumed message disappears. A new consumer - a new integrator, a new projection, a reconstruction after a fault - cannot re-read history. In a system that must be able to demonstrate what it sent and to whom, and that must be able to add integrators without manual replay, re-reading is not a comfort: it is a requirement. |
| **Flows on in-memory key-value archive** | Adequate to the scale of a small installation, but retention depends on memory and persistence is delicate configuration. For the immutable register and for delivery to third parties it is an unjustified risk. |
| **Alternative distributed log with multi-tiered archive layer** | Technically valid, smaller user base and operational tooling, and a heavier distribution model for single-tenant installation (C5). |
| **No broker: only synchronous calls** | Couples the availability of Telemedic to that of the integrator. A consultation cannot fail because the destination system of the report is in maintenance. |

### 10.3 Mode with integrated coordinator and single node

For single-tenant installation, the broker runs in integrated coordinator mode on a single node. It is the compromise that makes the model of D8 feasible: no additional coordination service to install, secure and monitor in a small practice. The account is declared: **with a single node there is no broker redundancy**. Since the source of truth is the outbox in the database, loss of the broker means delay in delivery, not loss of events - relay resumes from where it was. It must be written in the installation manual, because it is the difference between a tolerable fault and an incident.

### 10.4 How the outbox feeds the broker

Two possible mechanisms, and the choice has relevant operational consequences.

**Change data capture from the transaction log.** Reads the database's write-ahead log and produces events without querying tables. It is the lowest-latency mechanism and least impact on the database, but requires a connector, so a connection process, so an additional service with its own configuration, its own state persistence and its own monitoring. On a single-tenant installation it is a disproportionate weight.

**Relay by periodic polling with skip locked.** An application component interrogates the outbox table with `FOR UPDATE SKIP LOCKED`, publishes in batch, marks as published in the same transaction. No additional service, works at multiple instances without coordination, latency equal to the polling interval.

**Project proposal**: the relay by periodic polling is the default implementation and the only one required for v1.0; change data capture is an alternative profile, behind the same publishing interface, for installations with volumes that justify it. The delivery latency that results is declared as a limit in [`07-prestazioni-e-capacita.md`](./07-prestazioni-e-capacita.md) §6, not hidden.

The publishing abstraction stays behind a project interface, as D15 imposes: domain code does not know the broker. This is not purism - it is what allows whoever installs to substitute the broker without touching the domain, which is a requirement of substantial sovereignty (C1).

---

## 11. Packaging and distribution

**Docker Compose** for the single-tenant profile: it is the lowest common denominator that a small practice or polyclinic can manage. **Helm chart** for the orchestrator profile, required by the managed service model. The two are not alternative: they are the two models of D8, and the architectural baseline imposes they are **the same code and the same structure**, with single tenant as the degenerate case of multi-tenant. No separate branch, no compilation variant: the difference is in configuration, and configuration is tested.

The detail of images, signatures and artefacts is in [`09-integrazione-continua-e-rilascio.md`](./09-integrazione-continua-e-rilascio.md).

---

## 12. The project builder

**Project proposal: declarative builder at project model, not at script.** The motivation is not one of taste but of verifiability: D17 requires reproducible build and D45 requires configuration control. A declarative build model, with deterministic version resolution and with the timestamp property that makes produced archives reproducible, is audited by reading it. A script-based builder is a program, and a program in the build chain is code that must be verified like everything else.

The alternative builder, based on scripts and incremental cache, is faster and is not excluded in absolute: but build speed is not a constraint of this project, while reproducibility is. The choice must be recorded as an architectural decision, because changing it mid-path costs more than it is worth.

On the interface side, the chain is the native one of the chosen framework, with the dependency lock file **committed and mandatory**: a build that resolves versions at the moment is not reproducible, and without reproducibility there is no trustworthy bill of materials.

---

## 13. Components that the project **does not** adopt, and why

To list what was rejected is more informative than to list what was adopted.

| Component | Why it is not there |
|---|---|
| **Selective media forwarding unit** | The consultation is two to three participants. A forwarding unit terminates encryption and has media in clear: it would destroy the property on which the entire project positioning rests, for no benefit at this scale. If one day it were needed, the evaluation is already set up in `.telemedic/research/R4-webrtc-media.md` §6.3, with exclusion of one candidate for incompatibility of licence with D1 and of another for documented abandonment - three years without changes make a component non-surveillable under IEC 62304 §8.1.2, which is a fact, not a judgment. |
| **In-memory key-value archive as signal diffuser** | The incremental candidate collection protocol requires exactly-once delivery and in order. A publish-subscribe mechanism without persistence guarantees neither under reconnection. If a diffuser is needed, the correct form is at persistent flow with consumer groups; the preferred architecture avoids the diffuser altogether. See §15, open question at `ARCH`. |
| **Service mesh** | Adds a control plane, a data plane and a certificate model to manage, for a system with a small fixed number of services. On single-tenant installation it is unsustainable (C5). |
| **Service discovery register** | Same reason. The number of services is known and fixed. |
| **Third-party clinical rule engine** | The thresholds are configuration per patient (V-02) and evaluation is deterministic and traceable. A generic rule engine would introduce non-inspectable logic in a path that must be explainable line by line in case of incident. |
| **Any managed service on the main path** | V1. Without exception and without discussion. |

---

## 14. Classification as a third-party component

Every component not developed by the project is, under IEC 62304, software of unknown origin of which the project must know and monitor the properties. D45 establishes that the inventory must be built **from the first pipeline**, because inventorying it afterwards costs several times as much. This area defines the technical form; the regulatory part is in `docs/08_compliance/`.

### 14.1 Register schema

Each register entry carries, at minimum:

| Field | Content | Why it is mandatory |
|---|---|---|
| `identifier` | Component coordinates in its own distribution ecosystem | It is the correlation key with the bill of materials and with security advisories |
| `version` | Exact version, not range | A range makes build non-reproducible and exposure to a vulnerability non-determinable |
| `licence` | Normalised identifier **verified against primary text** | D34: statement on the container does not dispose of rights to content |
| `regime` | Mandatory runtime · optional runtime · build · test · documentation | Determines whether the vulnerability is exploitable in live operation or only in development |
| `function in the system` | What it is for, in one line | Without this the register is a list and not an analysis document |
| `known alternative` | Substitute component and estimated substitution cost | It is what makes the replaceability of C1 real |
| `advisory channel` | Primary source of security reports | A component without a channel is not surveillable |
| `service level for updates` | Days from publication of the advisory, by severity | See §9.1 |
| `risk impact` | Whether fault of the component has clinical consequences | Links the register to the risk management file |
| `review date` | Next scheduled verification | A register without deadlines fossilises |

### 14.2 How it is populated

Not by hand. The register is **generated** from the bill of materials produced in continuous integration, enriched with fields that the bill of materials does not contain (function in the system, known alternative, risk impact) via a versioned annotation file in the repository. Entries present in the bill of materials but absent from annotations **cause build to fail**: it is the sole way to prevent a dependency from entering without having been evaluated. The detail of the check is in [`09-integrazione-continua-e-rilascio.md`](./09-integrazione-continua-e-rilascio.md) §4.

### 14.3 The three classes that deserve particular attention

- **Components exposed to the Internet without prior authentication.** The relay server is the only one in this class and has the most stringent update service level.
- **Components on the path of the authorisation decision.** Identity federation product, token validation libraries, gateway. A defect here does not degrade a service: it opens an access.
- **Components that handle content from outside.** Clinical document analysers, attachment decoders, exchange format analysers. They are the classic surface for arbitrary code execution, and must be executed with reduced privileges and declared resource limits.

---

## 15. Questions that this area does not decide

Consistently with the noticeboard protocol, what is structural is not invented here.

1. **Topology of the signal at multiple instances.** Deterministic routing of the session to the owning node, or session affinity to the load balancer. Research recommends the first as destination architecture and the second as fallback realisation, excluding diffusion without persistence. It is a structural decision with effects on distribution, update without interruption and sizing: it is up to `ARCH`, with architectural decision recorded. Open on noticeboard.
2. **Declared limit of participants in the media session.** Research argues a three-participant limit in mesh topology, beyond which a new decision is needed. The limit must be declared: an explicit limit is preferable to silent degradation. It is up to `ARCH`. Open on noticeboard.
3. **Licensing regime of the time-series extension.** Verification against primary text and placement in the regimes of D31. It is up to `COMP`. Open on noticeboard.
4. **Update service level of third-party components.** The technical proposal exists; the formal commitment belongs to the post-market surveillance plan and therefore to `COMP` and `ROAD`. Open on noticeboard.

---

## 16. In summary

The stack was not chosen for performance: it was chosen for **replaceability, surveillability and sustainability of installation at the customer**. Where a choice has a cost - the licence of the time-series extension, the single node of the broker, the known defects of the identity federation product, the release cadence of the relay server - the cost is declared here and has a designed fallback, tested in continuous integration. A fallback that does not run in the test suite is not a fallback: it is a hope.

**Continues in**: [`02-backend.md`](./02-backend.md) for the structure of the service, [`03-persistenza.md`](./03-persistenza.md) for the schema and migrations.
