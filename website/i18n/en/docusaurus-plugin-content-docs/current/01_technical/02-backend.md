---
title: "Backend"
sidebar_position: 3
description: "Structure of modules, dependency rule, transactional boundaries, concurrency model on virtual threads, validation at system boundaries, error management, typed configuration and execution profiles."
---

# Backend

This chapter describes **how the service is made**: where the code sits, what can depend on what, where a transaction begins and where it ends, what happens when a thousand requests arrive together, what is validated and where, and what form an error takes. It does not describe what the system does: that is `docs/03_functional/`. It does not describe why context boundaries are where they are: that is `docs/02_architecture/` and the architectural baseline §1.

The foundations - what is a transaction, what is an aggregate, what is idempotence - are in [`docs/10_fondamenti/11-fondamenti-informatici.md`](../10_fondamenti/11-fondamenti-informatici.md) and are not repeated.

---

## 1. The rule that governs everything: separate by domain, not by layer

The most costly structure error is to organise code by technical nature - all controllers together, all services together, all repositories together. It produces a system in which every feature is scattered across five points and in which no dependency is forbidden, because everything sits at the same level as everything.

Telemedic organises by **bounded context**, according to the table of the architectural baseline §1. Each context is an autonomous compilation module with a real boundary, not a naming convention.

```
telemedic/
├─ platform/                 cross-cutting components, no domain logic
│  ├─ tenancy/               resolution, propagation and verification of tenant context
│  ├─ security/              authorisation boundary, token exchange, assurance level
│  ├─ outbox/                outbox table, relay, event envelopes
│  ├─ problem/               error catalogue and their representation
│  └─ observability/         correlation, redaction, measures
├─ contexts/
│  ├─ identity/              identity and access
│  ├─ registry/              demographics
│  ├─ scheduling/            agenda
│  ├─ encounter/             clinical service
│  ├─ media-session/         media session
│  ├─ clinical-document/     clinical documentation
│  ├─ monitoring/            telemonitoring
│  ├─ alerting/              notifications and alarms
│  ├─ consent/               consent
│  ├─ outbound/              outgoing interoperability
│  ├─ audit/                 traceability
│  ├─ tenant-admin/          tenant administration
│  └─ terminology/           code resolution and validation (CTX-10)
├─ interfaces/
│  ├─ rest-api/              project application interface
│  ├─ fhir-facade/           interoperability facade
│  ├─ signaling/             media session signalling
│  └─ webhooks/              delivery to third-party systems
└─ app/                      assembly, configuration, startup
```

**Dependency rules, verified automatically in continuous integration.** They are not recommendations: they are tests that cause the build to fail.

1. No context depends on another context. They communicate through synchronous interface exposed in their own `api` package, or through events.
2. No context accesses the database of another context. The schema is per context (see [`03-persistenza.md`](./03-persistenza.md) §2) and application credentials have no cross privileges: the rule is applied by the engine, not by discipline.
3. `platform` does not depend on `contexts` nor on `interfaces`. It is the layer below.
4. `interfaces` depends on `contexts` through the `api` packages, never through `domain` or `infrastructure`.
5. `contexts/*/domain` depends on nothing but the standard library and `platform`. No persistence annotation, no web annotation, no framework type in the domain.

The fifth rule is the one that is violated first and that costs the most. The motivation is not purity: clinical domain is the part that must be verified most thoroughly for the technical dossier, and a class that to be tested requires a container, a database and a web context is a class that is tested poorly, slowly and rarely.

---

## 2. Anatomy of a context

Each context has the same internal form. The repetition is deliberate: whoever opens a context they do not know already knows where to look.

```
contexts/media-session/
├─ api/                interfaces and types that others can use
│  ├─ MediaSessionFacade.java
│  ├─ command/         incoming commands, immutable
│  └─ view/            outgoing projections, immutable
├─ domain/             model, invariants, decisions
│  ├─ model/           aggregates, entities, value objects
│  ├─ event/           domain events
│  ├─ policy/          rules expressible without infrastructure
│  └─ port/            ports to the outside, declared by domain
├─ application/        use cases, orchestration, transactional boundary
└─ infrastructure/     implementations of ports: persistence, clients, adapters
```

**`api` is internal contract.** Another context sees only this. Changing `domain` breaks no one; changing `api` does, and it is a change that is discussed.

**`domain` has no side effects.** It receives data, decides, returns a decision and events. It does not write, does not call, does not log. This makes it testable with pure unit tests - and pure unit tests are the only ones that can be run thousands of times, that is the only ones on which credible coverage can be founded.

**`application` is the level that has effects.** Opens the transaction, loads the aggregate, invokes the domain, persists the result, writes the event to the outbox, closes. It is the place where `@Transactional` is found, and the only one.

**`infrastructure` is replaceable by definition.** It is the level that knows the database, the protocol, the format. No domain decision lives there.

---

## 3. The authorisation boundary

The boundary is unique and sits at the entrance: no request reaches a context without having crossed the security chain, and no context repeats token validation. Repeating it would give the illusion of defence in depth and, in practice, would produce divergent versions of the same logic.

The Telemedic gateway realises token exchange in-house, as D18 imposes. On the technical plane the four non-negotiable points are.

1. **The integrator's incoming token is validated entirely before anything else**: signature on key resolved from public material declared for that tenant, expected issuer, expected audience, time window with declared tolerance, key identifier present in the set allowed for that tenant. A token that does not pass even one of these checks does not produce an internal token and does not produce an access record: it is an attempt rejected and as such ends up in tracing.
2. **Delegation is always represented with the actor claim**, never by substituting the subject. The difference is substantial at post-incident investigation time: delegation says "X acted for account of Y", impersonation says "it was Y", and erases real responsibility.
3. **The authentication assurance level travels in the dedicated claim and is qualified with a marker own to the project** that distinguishes authentication **performed** by Telemedic from that **reported** by the integrator. Constraint V-18 of `INTEG` and constraint V-17 of `SEC` converge on this point and this area adopts them: an operation that the standard ties to strong authentication requires a level **performed**, and verification happens at the decision point, not at the gateway.
4. **The tenant context is resolved here and only here.** From this point on it is a datum of the execution context, propagated explicitly and verified at the entrance of each context. It is never a request parameter: a parameter is controllable by the caller.

The code of this boundary is critical security code and entails obligations of its own - independent external review, dedicated abuse tests, substantially total coverage on the validation path. The threat model is in `docs/06_security/`.

---

## 4. Transactions

### 4.1 The boundary is the use case

A transaction begins at the start of an `application` method and ends at its exit. Never higher - a boundary on the controller would keep the transaction open during response serialisation - and never lower - a boundary on the repository would produce as many transactions as there are writes, destroying the atomicity that is the reason they exist.

### 4.2 The five rules

**R1 - The domain event is written in the same transaction as the datum.** It is the transactional outbox imposed by the architectural baseline §5. There is no second application write to the broker, and there is no `@TransactionalEventListener` that publishes after commit: that is precisely the way to lose an event if the process dies between commit and publishing.

**R2 - No remote call inside a transaction.** Calling the integrator's system, the health record, the terminology gateway or the identity federation product while a transaction is open means holding a connection and locks for the duration of a latency that you do not control. The model is: read, close, call, reopen and apply the result with optimistic concurrency control. Where multiple steps with external effects need to be coordinated, a long-running process is used with explicit compensation, not a long transaction.

**R3 - Reads are declared read-only.** It is not micro-optimisation: it allows the persistence layer to skip the modification check and, above all, makes explicit in the code that that use case modifies nothing - information useful to whoever reads and whoever verifies.

**R4 - Default isolation is that of the database, and exceptions are motivated in the code.** Where an invariant requires stronger isolation, it is declared with a comment that says *which* invariant requires it. An isolation level raised "for safety" is a conflict point waiting to manifest under load.

**R5 - The tenant context is set inside the transaction, before any query.** Row-level security reads a session variable: if the variable is not set, the policies must deny everything. Setting it outside the transaction or after the first query is the class of error that produces data leaks between tenants, and it is exactly what defence in depth must make impossible.

### 4.3 How it looks in practice

```java
package dev.telemedic.contexts.mediasession.application;

// Illustrative. Signatures are realistic, content is reduced to the essential.
@Service
public class ChiudiSessioneMediaUseCase {

    private final MediaSessionRepository sessioni;
    private final OutboxWriter outbox;
    private final Clock clock;

    public ChiudiSessioneMediaUseCase(MediaSessionRepository sessioni,
                                      OutboxWriter outbox,
                                      Clock clock) {
        this.sessioni = sessioni;
        this.outbox = outbox;
        this.clock = clock;
    }

    /**
     * Closes a media session and records the outcome.
     * The tenant context is already resolved and verified: here it is assumed present
     * and is asserted, because an unverified assumption is a latent defect.
     */
    @Transactional
    public EsitoChiusura esegui(ChiudiSessioneCommand comando, TenantContext tenant) {
        Objects.requireNonNull(tenant, "contesto di tenant non risolto");

        MediaSession sessione = sessioni.caricaPerAggiornamento(comando.sessionId(), tenant)
                .orElseThrow(() -> new SessioneNonTrovata(comando.sessionId()));

        // The domain decides. It does not write, does not call, does not log.
        RisultatoChiusura risultato = sessione.chiudi(
                comando.motivo(),
                comando.riepilogoQualita(),
                Instant.now(clock));

        sessioni.salva(sessione);

        // Same transaction as the datum: it is rule R1.
        // The envelope carries no clinical content: it is constraint V-14 of INTEG.
        outbox.accoda(EventoDominio.di(
                "dev.telemedic.mediasession.chiusa.v1",
                sessione.id(),
                tenant.id(),
                risultato.riferimentiPubblicabili()));

        return EsitoChiusura.da(risultato);
    }
}
```

Three things that this fragment declares implicitly and that are worth making explicit: the clock is injected - without it, tests on time become fragile and behaviour is not reproducible; the load is *for update*, that is with the blocking semantics declared in the repository and not left to chance; the event carries **references**, not content.

---

## 5. Concurrency

### 5.1 The chosen model

**One virtual thread per request, blocking code, no reactive programming on the main path.** The motivation is of readability and of verifiability: the clinical domain is already difficult enough without adding an implicit state machine made of chained operators. A readable stack trace and a breakpoint that works are, in a system that must be inspectable after an incident, a requirement and not a luxury.

### 5.2 The real traps of virtual threads

They must be written, because they are the reason this choice sometimes fails.

**Blocking on native monitor pins the carrying thread.** A synchronised section containing a blocking operation prevents the virtual thread from detaching, and the advantage vanishes. Project rule: **no synchronised section containing waits**; where mutual exclusion is needed, a holdable lock from the concurrency library is used. The rule is verified by static analysis, not left to memory.

**The real limit is not the number of threads: it is the connection pool to the database.** With thousands of virtual threads converging on twenty connections, the bottleneck moves and the symptom becomes an invisible queue with long-tail latencies. Operational consequence: the pool must be sized and **observed** (acquisition wait time, not just active connections), and every use case has a time limit. The sizing is in [`07-prestazioni-e-capacita.md`](./07-prestazioni-e-capacita.md).

**Context variables must be propagated explicitly.** The tenant context, the security context and the correlation context do not cross an asynchronous boundary by themselves. The framework's context propagation mechanism is used, and tests verify they cross: a test that verifies the tenant is still the same after an asynchronous jump is worth more than ten pages of documentation.

**Do not cache a virtual thread.** They are cheap and are created; a virtual thread pool is a contradiction in terms that reintroduces exactly the limit you wanted to remove.

### 5.3 Where reactive programming is allowed

In one case only: long-running flows with many mostly-idle connections - media session signalling, event delivery to the interface. There the event model is appropriate because the problem is really that one. Everywhere else it is forbidden by the project profile, and introduction must be discussed as an architectural decision.

### 5.4 Backpressure

A system that accepts everything that arrives at it is not available: it is late, which is worse, because the caller does not know. Backpressure is explicit at four levels - limit of requests per tenant and per credential, admission semaphore for operation class, bounded queue with declared rejection when full, time limit on every outgoing call. The detail, values and the way they are declared to the caller are in [`07-prestazioni-e-capacita.md`](./07-prestazioni-e-capacita.md) §5.

The technical principle is one: **rejection is a correct response, indefinite wait is not**. A rejection with indication of when to retry lets the caller behave well; an indefinite wait produces retries that multiply the load precisely when the system is already in difficulty.

---

## 6. Validation at boundaries

### 6.1 The principle

No datum coming from outside the process is considered valid: not that of the user, not that of the integrator, not that of the regional system, not that arriving from the broker. Validation is **at the boundary**, once, in a complete way, and produces an error that says exactly what is wrong and where.

### 6.2 The four boundaries

| Boundary | What enters | How it is validated | What is emitted in case of rejection |
|---|---|---|---|
| **Project application interface** | JSON documents | Schema derived from the interface document, applied at runtime and not only generated in documentation | Representation of the problem in `application/problem+json` with list of errors per field |
| **Interoperability facade** | Clinical resources | Structural validation, then profile validation against fixed national profiles by version, then terminology constraint validation through the gateway | Outcome of the operation according to the specification model, with severity and localisation |
| **Incoming events** | Standardised envelopes | Envelope schema, then datum schema, then deduplication key verification | Message moved to non-processable queue with structured reason; never silently discarded |
| **Media signalling** | Negotiation messages | Project protocol schema, versioned, plus verification of sender membership in the session | Channel closure with code and reason; the event ends up in tracing |

### 6.3 Three clarifications that make the difference

**Profile validation is not optional and is not free.** Validating a clinical resource against a national profile requires the profile package and, for strong constraints, code resolution. The package is **fixed per version** and preserved as a build artefact: validation that changes outcome because upstream a package changed is validation that is not reproducible, which is unacceptable in a traceable system.

**The terminology gateway must be able to be absent.** Constraint V-03 imposes that no main path requires a constrained-licence terminology. On the technical plane this means: the gateway has a declared degraded mode per coding system, in which the structure is validated and the code is accepted with outcome "not verified" recorded on the datum, not with a rejection. Constraint V-14 of `SEC` adds that to the external gateway no patient identifiers pass through and that no persistent cache on disk exists: both are implementation constraints of this component and must be tested.

**Input validation is not invariant validation.** That a date is a date is checked at the boundary. That that date is compatible with the state of the service is checked in the domain. Confusing the two leads to duplicating clinical rules in the web layer, where no one looks for them and where they will diverge.

---

## 7. Errors

### 7.1 Two representations, no third

On the application plane the error is a problem representation in `application/problem+json` according to RFC 9457; on the interoperability plane it is the outcome of the operation foreseen by the clinical specification. No third form exists. The constraint that this area imposes on the others is written on the noticeboard.

Project structure, with allowed extension members:

```json
{
  "type": "https://telemedic.example/problems/sessione-non-avviabile",
  "title": "La sessione non può essere avviata",
  "status": 409,
  "detail": "L'appuntamento richiesto non è in uno stato che consente l'avvio della sessione.",
  "instance": "/v1/sessioni/ses_01J9ZC5P",
  "traceId": "00-4bf92f3577b34da6a3ce929d0e0e4736-00f067aa0ba902b7-01",
  "errors": [
    { "pointer": "#/appuntamento/stato", "code": "stato-non-ammesso" }
  ],
  "documentation": "https://docs.telemedic.example/it/errori/sessione-non-avviabile"
}
```

### 7.2 The non-negotiable rules

1. **`detail` never contains clinical content nor patient direct identifiers.** It ends up in the caller's logs, which the project does not control. In the example above the message says *what* is wrong without saying *who* and *when*: the specific information is found with `traceId`, inside the perimeter. This adopts constraint V-13 of `SEC` and extends it to the errors channel, which is where leakage happens most often.
2. **`type` is a resolvable address** that leads to the documentation page of the error, with typical causes and resolution. It is what transforms an error into an instruction.
3. **The catalogue is generated.** The problem identifiers live in a versioned file from which the code constants, documentation and SDK types are generated. An uncatalogued error **must not be able to be emitted**: the default handler converts any unmapped exception into a generic problem with code 500, logs the original exception with its own correlation identifier and **does not** expose its message. An exposed exception message is a leak of structural information.
4. **Errors are distinguished by nature, not by HTTP code.** A validation error, a domain state conflict, an unavailability of a downstream system and an internal defect are four different things for whoever investigates, even when two of them produce the same code. The distinction lives in the problem type identifier and in the internal classification.
5. **No clinical error is silent.** If an alert was not delivered, the failure is a recorded fact subject to follow-up, not a log line. It descends directly from constraint V-09: the absence of data is information.

### 7.3 Hierarchy of exceptions

Four roots, and nothing else: violation of domain invariant, violation of application precondition, unavailability of a dependency, internal defect. Mapping to the problem catalogue happens in one place, at exit. An exception translated in two different places produces, sooner or later, two different responses for the same case.

---

## 8. Configuration

### 8.1 Typed, validated, fails at startup

Configuration is bound to typed immutable classes, validated with annotations, and **verified at startup**. A service that starts with incomplete configuration and fails at the first clinical request is worse than a service that does not start: the first is a fault during a consultation, the second is a fault during installation.

```java
package dev.telemedic.platform.config;

// Illustrative.
@ConfigurationProperties(prefix = "telemedic.media.relay")
@Validated
public record RelayProperties(
        @NotEmpty List<@NotBlank String> urls,
        @NotBlank String staticAuthSecretRef,      // reference, not value
        @Min(60) @Max(3600) int credentialTtlSeconds,
        @NotNull Duration allocationBudget) {

    public RelayProperties {
        if (urls.stream().noneMatch(u -> u.startsWith("turns:"))) {
            throw new IllegalStateException(
                "Almeno un indirizzo di relay su trasporto protetto è obbligatorio");
        }
    }
}
```

The relevant point is `staticAuthSecretRef`: **a reference, not a value**. The code never receives the secret from application configuration; it resolves it from a secret manager at the moment of use. In sample files, in documentation and in tests appear only placeholders.

### 8.2 The three sources of configuration, and their precedence

| Source | Content | Who governs it |
|---|---|---|
| **Product defaults** | Safe values, in the repository | The project |
| **Installation configuration** | Addresses, sizing, active profiles, replaceable modules | Whoever installs |
| **Per-tenant configuration** | Personalisation of theme, enabled terminologies, service hours, quotas, contacts | The tenant administrator |

No secret travels in any of the three: secrets have a separate path. Precedence rules are declared and tested - a precedence not tested is a source of surprises in live operation.

**Per-tenant configuration is data, not files.** It lives in the database, is versioned, is subject to tracing (who changed the alert threshold and when is a question that will be asked) and has a history. Installation configuration is files, and is in the configuration control of whoever installs.

### 8.3 What configuration **cannot** do

It cannot change clinical behaviour. No property can disable access logging, alter the immutable register chain, suppress an inadequate quality alert, disable session key verification or modify a threshold evaluation. Properties that touch security or patient safety have a single permitted value in live operation, the live profile imposes it, and a test verifies it. It is the translation of the principle that a device must not be configurable into an unsafe state.

---

## 9. Profiles

Profiles are orthogonal and combine; they are not a flat list.

| Axis | Values | What changes |
|---|---|---|
| **Environment** | `dev` · `test` · `staging` · `prod` | Log verbosity, synthetic data generation, exposure of diagnostics endpoints, rigour of startup checks |
| **Installation model** | `single-tenant` · `multi-tenant` | Tenant resolution (fixed vs token-derived), presence of multi-tenant administration panels |
| **Time-series persistence** | `timeseries-extension` · `timeseries-native` | Implementation of the time-series repository (see `01-stack-e-motivazioni.md` §7.3) |
| **Replaceable modules** | per module: `internal` · `external` · `disabled` | Reporting, agenda, billing: D14 imposes they be disableable and replaceable by configuration |
| **Recording** | `off` · `server-side` | Presence of the recording component. See [`05-media-e-tempo-reale.md`](./05-media-e-tempo-reale.md) §8 |

**Binding rule: a profile does not change domain code.** Replacing the internal agenda with that of the integrator changes the implementation of a port, not the booking logic from the perspective of the service context. If changing profile requires a conditional branch in the domain, the port was badly designed.

**Binding rule: the live profile permits no development shortcuts.** Startup fails if permissive CORS origins are active, if a diagnostics endpoint is exposed without authentication, if domain log level is diagnostics, if a secret was resolved from a literal value instead of from a secret manager. They are startup checks, with messages that say what to fix.

---

## 10. What the backend does not do

A short list, but it is what keeps the boundaries.

- **Does not generate clinical content.** It persists what the professional has drafted. It is constraint V2 and goes all the way: no precompletion that produces clinical statements, no automatic synthesis presented as report content.
- **Does not infer thresholds.** Thresholds are configured by the professional per patient (V-02). The system applies them and traces the calculation; it does not propose them and does not adapt them.
- **Does not decipher media.** In the default mode it does not have the keys and cannot have them. In recording mode the recording component is a separate service, with its own perimeter, and the difference is declared in consent and signalled in interface in a persistent way.
- **Is not the owner of demographic data.** It works by reference to external identifiers of the origin system, as the archetype integrator profile imposes.
- **Has no functionality reachable only from the interface.** It is constraint V3, reinforced by constraint V-17 of `INTEG`: capability and its contract are born together.

---

**Continues in**: [`03-persistenza.md`](./03-persistenza.md) for the schema, migrations and row-level isolation by the engine.
