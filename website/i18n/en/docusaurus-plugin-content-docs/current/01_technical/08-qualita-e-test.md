---
title: Quality and Testing
sidebar_position: 9
description: "Test pyramid, contract tests, synthetic data, automatic and manual accessibility verification, load tests, differential minimum coverage, and traceability from requirement to test that makes the work certifiable."
---

# Quality and Testing

In an ordinary project the test suite serves to not break what works. Here it also serves to **demonstrate**: traceability from requirement to test is a condition of certifiability (D12, consequence 6) and cannot be reconstructed after the fact. D45 says it without circumlocution: requirement identifiers must be frozen immediately, because traceability cannot be reconstructed.

This chapter describes the technical structure. The verification and validation plan in regulatory sense is in `docs/08_compliance/`.

---

## 1. The pyramid, with declared proportions

| Level | What it tests | Where it runs | Expected execution time |
|---|---|---|---|
| **Domain unit tests** | Invariants, state machines, policies, calculations | In memory, without container | Seconds for entire suite |
| **Component tests** | One use case with its ports simulated | In memory | Seconds |
| **Integration tests** | Persistence, migrations, isolation between tenants, outbox, row-level security | Ephemeral containers | Minutes |
| **Contract tests** | Compatibility of public interfaces | Against versioned schemas | Seconds |
| **End-to-end tests** | Complete user paths | Real browser, complete environment | Minutes |
| **Media tests** | Session, quality, degradation, relay | Real browsers, simulated network | Minutes |
| **Accessibility tests** | Automatable rules | On rendered DOM | Seconds |
| **Security tests** | Static and dynamic analysis, dependencies, secrets, abuse | Pipeline | Minutes |
| **Load and endurance tests** | Capacity and degradation | Dedicated environment | Hours |

**The shape of the pyramid is not aesthetics: it is a cycle time constraint.** If tests running at every change take more than a few minutes, they stop running at every change, and the suite becomes an end-of-day ritual instead of a tool. Slow tests exist and are necessary, but belong in different pipeline tiers (see [`09-integrazione-continua-e-rilascio.md`](./09-integrazione-continua-e-rilascio.md) §3).

**Domain tests are the wide base because the domain is what matters.** The dependency rule n. 5 of [`02-backend.md`](./02-backend.md) §1 exists precisely for this: a domain without infrastructure dependencies is a domain that tests thousands of times per day.

---

## 2. Writing rules

Few and non-negotiable, because an unstable test is worse than an absent test: it consumes time and teaches you to ignore failures.

1. **Deterministic.** No dependency on system time, on execution order, on shared state, on an external resource, on an unseeded random number. A test that fails intermittently must be **fixed or removed the same day**, not annotated.
2. **Injected clock.** No direct call to current time in production code. It is what makes testable deadlines, waiting windows, consent and role temporal validity - that is, most of the domain.
3. **No fixed-time waiting.** Wait for a **condition**, with a limit. Fixed-time wait is guaranteed instability on a slower machine.
4. **Real isolation.** Every integration test starts from a known state and leaves no residue. The ephemeral container is per test class, and the schema is recreated.
5. **The name describes the behaviour**, not the method invoked. The test name is the documentation read when it fails.
6. **One test, one conceptual assertion.** A test that verifies five things fails on the first and hides the other four.

---

## 3. Contract tests

### 3.1 The scope

Constraint [V-160](../11_registri/01-vincoli-in-vigore.md#v-160) of `INTEG` defines what is public contract. This area receives it entirely and derives the operational consequence: **what is contract has a contract test; what is not, does not have one and can change**. Extending contract tests beyond scope means accidentally freezing internal details.

Covered elements: API routes, methods, parameters and schemas; published clinical profiles and capability statement; event types and their schemas; authorisation scopes; problem type identifiers and outcome codes; interfaces of replaceable modules; messaging protocol of the embeddable component and closed set of theme properties.

### 3.2 The two directions

**As provider.** The suite verifies that the exposed interface matches the versioned interface document and that **changes are additive**. Comparison between main branch specification and that of the proposed modification produces a list of differences, and a non-additive difference - removal of a field, type narrowing, addition of an obligation, removal of a value from an enum - **breaks the build**, unless the modification explicitly declares a new major version.

The same applies to event schemas and clinical profiles: a schema that narrows is a schema that breaks a consumer.

**As consumer.** Toward external systems - identity federation product, terminology gateway, regional systems - tests verify that project **assumptions** are explicit and tested against a test double built on the published specification, not on empirical observation. When the specification changes, the test fails, and that is precisely what is needed.

### 3.3 Webhooks

Messages outbound to third parties have their own suite, because they are the point where defects manifest on someone else's side:

- **verifiable signature** with the public material declared by the project, according to constraint [V-162](../11_registri/01-vincoli-in-vigore.md#v-162) of `INTEG` - asymmetric signature with resolvable key identifier, not shared secret;
- **no clinical content in the envelope**, according to constraint [V-161](../11_registri/01-vincoli-in-vigore.md#v-161) of `INTEG`: a test inspects every event type and fails if a clinical field appears;
- **retries with exponential backoff and jitter**, with verification that the recipient does not receive bursts;
- **idempotency from the recipient side**: the same envelope delivered twice carries the same deduplication key;
- **behaviour toward hostile addresses**: a destination address supplied by the user is an outbound request to an arbitrary address, and tests verify that internal addresses are rejected.

---

## 4. Synthetic data

### 4.1 The prohibition

**No real data**, in code, tests, examples, logs, documentation, development environments or load tests. It is the transverse constraint of the architectural foundation §11.2 and admits no exceptions motivated by convenience.

The point where the prohibition is most often violated is not code: it is the test environment populated with a production export "anonymised". Anonymisation of longitudinal clinical data is, in practice, far less effective than believed, and reidentification from combinations of attributes is a consolidated result. The project's rule is simpler and safer: **it is generated, not anonymised**.

### 4.2 The factories

Test data is born from **versioned factories**, with sensible defaults and explicit substitution of what the test is verifying. The advantage is not brevity: it is that when the model changes, the factory changes and not three hundred tests.

Factory requirements:

- **synthetic identifiers recognisable as such**, built so they cannot coincide with identifiers actually assigned to people. An identifier generated "at random" with the real algorithm **can collide with that of an existing person**: it is an error committed in good faith and produces involuntary personal data;
- **plausible clinical values but not drawn from real cases**, with distributions declared when distribution matters;
- **no real person names**, not even as example, not even of common invention;
- **no reference to organisations, products or brands**: rule R0 applies to test data too.

### 4.3 The terminology constraint

Tests **cannot include content from licensed coding systems**. It is constraint [V-03](../11_registri/01-vincoli-in-vigore.md#v-03) and the policy of D31-D33: the repository does not receive concepts whose licence does not permit it, in any form, including test fixtures and caches.

Operational consequence: the suite runs with the terminology gateway in **degraded mode for non-enabled systems**, and this is the default configuration of tests. A beneficial collateral follows: **the main path is continuously tested** in the configuration without licensed terminology, which is exactly what constraint [V-03](../11_registri/01-vincoli-in-vigore.md#v-03) requires to guarantee. A degraded mode that runs at every suite execution is a mode that actually works.

---

## 5. Media tests

The organisation is described in [`05-media-e-tempo-reale.md`](./05-media-e-tempo-reale.md) §9; here is recorded the place in the suite and the constraints.

- **Two browser contexts in the same execution**, one for the professional and one for the patient, with convergence verification by reading statistics from both sides.
- **Deterministic synthetic sources** with verified flags, including the one that accepts camera and microphone permissions **without** accepting screen capture - necessary because the screen sharing consent flow is a real product use case and must be testable.
- **Network profiles as shared constants**, including the limit profile, which verifies degradation and warning, not good functioning.
- **Asymmetry declared between engines**: automatic objective-to-screen latency measurement is achievable on one only. On the others coverage is limited and it is declared, instead of leaving the belief that it is uniform.
- **Assertions on observable facts**, not on "it works": state reached within limit, candidate type coherent with scenario, **cipher suite present and not degenerate**, video bytes inbound growing, warning issued when and only when threshold crossed, corresponding row in trace.

The cipher suite assertion deserves a note: it is a risk control at practically zero cost that transforms a security assertion into a fact verified at every suite execution.

---

## 6. Accessibility

### 6.1 Three levels, and the first is not enough

**Automatic.** Rules applied to the rendered DOM of every screen and every significant state - not just the initial state: modal open, error shown, empty list, long list, loading in progress. Runs on every proposed modification and **blocks**.

**Structured manual.** Complete paths with keyboard only; complete paths with real screen reader on each declared combination of operating system and browser; verification at magnification; verification with system preferences active. Has a versioned checklist and a recorded outcome per release.

**With representative users.** It is the usability engineering required by IEC 62366-1, made mandatory by D12: **formative** evaluation during development and **summative** evaluation with representative users before release. Representative users **include elderly patients and people with disabilities**: D25 declares it and is worth repeating, because they are not an edge case, they are the reference population.

### 6.2 What automation does not intercept

It must be written, because it is the reason the three levels exist. Automation does not intercept: a technically correct but incomprehensible firing order; a present but useless alternative text; a dynamic announcement that arrives at the wrong moment or overlaps; correct labelling but with language the user does not understand; a sequence of steps formally accessible but cognitively unsustainable for the unfamiliar; an error that says what is wrong but not how to fix it.

These are precisely the defects that render a service unusable for those who need it most.

### 6.3 Criteria as tests

Criteria M1-M8 and A1-A10 of [`04-frontend.md`](./04-frontend.md) §§6–7 **are not a list of good intentions**: each has, in the right column, the way violation is tested. A criterion without a test that can fail is a criterion nobody respects.

Two tests merit separate mention because they verify a prohibition instead of a capability: the test that attempts to **conceal the recording indicator** by every means provided by configuration and must fail in all; and the test that attempts to **save a theme configuration that degrades contrast** and must be rejected at save, not accepted with a warning (constraint [V-163](../11_registri/01-vincoli-in-vigore.md#v-163) of `INTEG`).

---

## 7. Security tests

| Type | What it seeks | Frequency |
|---|---|---|
| Static code analysis | Known defects, queries built by concatenation, use of prohibited primitives, synchronised sections with waits | Every proposed modification |
| Dependency analysis | Known vulnerabilities in third-party components | Every modification and on schedule |
| Secret scanning | Credentials in sources and history | Every modification, with block |
| Dynamic analysis | Exposed surface of running application | On schedule |
| **Abuse tests on authorisation boundary** | Tampered, expired, wrong-issuer, wrong-recipient, wrong-key, forged-delegation tokens, reused between tenants | Every modification of component |
| **Isolation tests between tenants** | Deliberate attempts to read and write data of another tenant, for every context and every interface | Every modification |
| Federation configuration tests | The three known defects of §8.2 of [`01-stack-e-motivazioni.md`](./01-stack-e-motivazioni.md) stay closed | Every configuration modification |
| Live profile verification | No development shortcuts active | At startup and in pipeline |

**Isolation tests between tenants are the most important of the entire suite.** A cross-tenant leak in a healthcare system is not a defect: it is a notifiable violation. Tests do not limit themselves to verifying that legitimate access works: **they actively attempt illegitimate access**, for every context, every interface, and under adverse conditions - connection pool exhausted, context unresolved, request without tenant, tenant substituted mid-path. They also verify, by querying the system catalogue, that policies are active and that the object owner is not exempt (see [`03-persistenza.md`](./03-persistenza.md) §2.2–2.3).

Independent periodic verifications - threat model analysis, external penetration tests - are provided for in D10 and belong to `docs/06_security/`.

---

## 8. Coverage

### 8.1 The threshold and its meaning

D10 sets minimum coverage at eighty per cent, enforced in continuous integration. This area receives it and adds two clarifications that determine its real utility.

**Coverage is a necessary condition, not sufficient.** It measures which lines have been executed, not whether the behaviour has been verified. A suite that executes all code without asserting anything achieves excellent coverage and proves nothing.

**The threshold is differentiated, not uniform.** A single threshold rewards trivial code coverage and demands nothing of code that matters.

| Scope | Threshold |
|---|---|
| Authorisation boundary, token exchange, tenant context | Substantially total on the decision path |
| Clinical domain: invariants, state machines, threshold evaluation | High, with branch coverage |
| Application contexts | General threshold |
| Infrastructure and adapters | General threshold, covered by integration tests |
| Generated code, configuration, assembly | Excluded, with explicit and listed exclusion |

Exclusions are **listed explicitly and reviewed**: a generic exclusion rule is the fastest way to render the metric meaningless.

### 8.2 The measurement that says something real

On critical modules - authorisation boundary, clinical domain, threshold evaluation - **mutation coverage** is added: modifications are automatically introduced to the code and tests are verified to detect them. It is the only measurement that distinguishes a suite that verifies from one that executes.

It has a significant execution time cost and for this reason runs on a subset and on schedule, not at every modification. But it is what, on a request to demonstrate the effectiveness of verification, can be shown.

---

## 9. Traceability

### 9.1 Why it is the irreversible part

Traceability from requirement to architecture, to unit, to test is a condition of certifiability (D12, consequence 6) and **cannot be reconstructed after the fact**: D45 lists it among retroactively unrecoverable activities, along with the inventory of third-party components. Identifiers produced in the research phase **must never be renumbered**.

### 9.2 The mechanism

Every test that verifies a requirement carries its identifier as structured annotation. The traceability matrix is **generated** from test execution, not compiled by hand.

```java
// Illustrative.
@Test
@Requisito({"RF-0142", "RNF-0031"})
@ControlloDiRischio("RC-0007")
void avvisa_il_professionista_quando_la_qualita_scende_sotto_la_soglia_di_inidoneita() {
    // ...
}
```

The traceability report is a **release artefact**, produced by the pipeline and conserved with the version. It contains three views:

1. **Requirement → tests**, with the last execution outcome.
2. **Requirement without tests** - the list that actually matters. It is empty or a list of declared gaps, with motivation.
3. **Risk control → tests**, which is the view required by whoever verifies risk management, and which links technical verification to the risk file.

### 9.3 The rules that hold it together

- **A requirement identifier cited in a test but non-existent in the register makes the build fail.** Without this check, the matrix populates with references to renamed or deleted requirements.
- **A requirement without tests does not block**, but appears in the report and must be justified at release. Blocking would produce the opposite effect: fake tests written to satisfy the check.
- **The matrix is generated at every build**, not at end of project. A matrix produced once only is already obsolete when read.

---

## 10. What the suite does not test, and must be said

- **It does not test clinical adequacy.** That the system works does not say the intended use is clinically appropriate: that is clinical evaluation, with its own timelines and method (D47).
- **It does not test real accessibility.** It tests the automatable part, which is minority. The rest is §6.1, levels two and three.
- **It does not test behaviour on every device.** The landscape of real devices is by definition wider than the test matrix, and the matrix must be **declared**: what is tested and what is not.
- **It does not replace post-release surveillance.** Behaviour in the field produces information that no test produces, and is why post-market surveillance exists.

---

**Continues in**: [`09-integrazione-continua-e-rilascio.md`](./09-integrazione-continua-e-rilascio.md), where these tests become mandatory controls of a pipeline.
