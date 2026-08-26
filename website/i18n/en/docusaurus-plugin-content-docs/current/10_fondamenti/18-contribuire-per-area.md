---
title: Contributing, area by area
sidebar_position: 19
description: "Where you actually start, area by area: what you need to know first, what the first sensible contribution is, which mistakes are made by those coming from enterprise IT and which by those coming from healthcare, what is not touched without discussing it and how you check your own work."
---

# Contributing, area by area

[`CONTRIBUTING.md`](https://github.com/fedcal/Telemedic/blob/main/CONTRIBUTING.md) says **how**
you contribute: the five non-negotiable rules, the commit format, the sign-off of origin, the
coding style. This module answers a different and subsequent question: **I have read the guide,
I know I want to contribute, where do I actually start for the area that interests me.**

The difference is not editorial. In an ordinary project the answer is «pick an issue marked as
easy». Here that does not work, for three reasons worth stating straight away.

**The first.** The areas of this project have asymmetric prerequisites. Touching the
signalling of the media session requires knowing NAT traversal; touching document composition
requires knowing what a report is and why a draft is not a report. Whoever picks the wrong area
for what they know does not produce a mediocre contribution: they produce a contribution that
looks correct and that nobody can review in a reasonable time.

**The second.** A substantial part of the useful work **is not code**, and the project has far
less of it than it would need. A clinician who reads the module on the services and opens an
issue about an imprecise definition does work that no developer can do in their place. Section
[§14](#14-contributions-that-are-not-code) exists for this.

**The third.** Some changes are not assessed on technical merit. A function from the closed list
of the regulatory scope is rejected **on policy**, with written reasons, even if it is well
implemented and useful (constraint `V-170`). Knowing this before writing the code is the
difference between a ten-minute discussion and two wasted weeks.

> **Prerequisite.** This module assumes you have already read
> [00 - How to use this guide](00-come-usare-questa-guida.md) and that you have followed at least
> the reading path for your profile. It further assumes
> [17 - The development environment](17-ambiente-di-sviluppo.md) for everything concerning the
> local execution of the checks.

---

## 1. If you are interested in X, go to area Y

The table reads from the left. The «first module» column is the one to start from if you have
never worked on that subject: it is not a suggestion, it is the module without which the section
for the area will be compact to the point of unintelligibility.

| If you are interested in… | Area | Section of this module | First module to read |
|---|---|---|---|
| Video call, codecs, media quality, relay | Technical | [§4](#4-technical-area) | [08 - WebRTC from scratch](08-webrtc-da-zero.md) |
| Structure of the service modules, transactions, concurrency | Technical | [§4](#4-technical-area) | [11 - Computing fundamentals](11-fondamenti-informatici.md) |
| User interface, accessibility, rendering on a small screen | Technical | [§4](#4-technical-area) | [11](11-fondamenti-informatici.md) §on the interface, then [09](09-fondamenti-clinici.md) |
| Database, migrations, isolation between tenants | Technical | [§4](#4-technical-area) | [11 - Computing fundamentals](11-fondamenti-informatici.md) |
| Why the internal boundaries are the ones they are and not others | Architecture | [§5](#5-architecture-area) | [11 - Computing fundamentals](11-fondamenti-informatici.md) |
| Events, outbox, idempotency, ordering | Architecture | [§5](#5-architecture-area) | [11](11-fondamenti-informatici.md), then [13](13-protocolli.md) |
| Immutable audit trail, hash chain | Architecture and security | [§5](#5-architecture-area), [§9](#9-security-area) | [12 - Cryptography and security](12-crittografia-e-sicurezza.md) |
| What the system does, for whom, under which rules | Functional | [§6](#6-functional-area) | [02 - Telemedicine services](02-prestazioni-di-telemedicina.md) |
| Alerts, thresholds, patient silence, escalation | Functional | [§6](#6-functional-area) | [10 - Care pathways and patient safety](10-percorsi-di-cura-e-sicurezza.md) |
| Accessibility as a verifiable requirement | Functional | [§6](#6-functional-area) | [10](10-percorsi-di-cura-e-sicurezza.md) §on use error |
| FHIR, profiles, resources, searches | Protocols | [§7](#7-protocols-area) | [06 - FHIR from scratch](06-fhir-da-zero.md) |
| Hospital messaging, interoperability profiles | Protocols | [§7](#7-protocols-area) | [05 - Interoperability standards](05-standard-di-interoperabilita.md) |
| Event envelopes, signing of outbound messages | Protocols | [§7](#7-protocols-area) | [13 - The protocols](13-protocolli.md) |
| What a report, a measurement, a consent clinically are | Domain | [§8](#8-domain-area) | [03 - The clinical datum](03-il-dato-clinico.md) |
| State machines of the services, outcomes, catalogue | Domain | [§8](#8-domain-area) | [02 - Telemedicine services](02-prestazioni-di-telemedicina.md) |
| Clinical terminologies and their licences | Domain | [§8](#8-domain-area) | [05 §8 - Clinical terminologies](05-standard-di-interoperabilita.md) |
| Threat model, authorisation, encryption | Security | [§9](#9-security-area) | [12 - Cryptography and security](12-crittografia-e-sicurezza.md) |
| Audit trail of accesses and its demonstrability | Security | [§9](#9-security-area) | [12](12-crittografia-e-sicurezza.md) §on hash chains |
| National digital identity, levels of assurance | Security and integration | [§9](#9-security-area), [§10](#10-integration-area) | [04 - Identity and demographic registries](04-identita-e-anagrafiche.md) |
| Connecting an existing management system | Integration | [§10](#10-integration-area) | [14 - The functional flows](14-flussi-funzionali.md) |
| Embeddable component, theming, white label | Integration | [§10](#10-integration-area) | [13 - The protocols](13-protocolli.md) |
| Technical file, risk management, regulatory usability | Compliance | [§11](#11-area-conformita) | [15 - The regulatory framework from scratch](15-regolatorio-da-zero.md) |
| Checking that a cited source is exact and in force | Compliance and guide | [§11](#11-area-conformita), [§12](#12-foundations-guide) | [20 - Primary sources](20-fonti-primarie.md) |
| Explaining something to someone starting from zero | Guide | [§12](#12-foundations-guide) | [00 - How to use this guide](00-come-usare-questa-guida.md) |
| Full translation into English | Guide and site | [§12](#12-foundations-guide), [§13](#13-documentation-site) | [19 - Glossary](19-glossario.md) |
| Navigation, search, language switching, building the site | Site | [§13](#13-documentation-site) | [17 §9 - The checks](17-ambiente-di-sviluppo.md) |

Two entries do not appear in the table because they are not areas but **cut across all of them**:
the roadmap, which collects the when and not the what
([`docs/09_roadmap/`](/09_roadmap/00-indice.md)), and the overview, which is presentation
material. Neither of the two is modified in isolation: a roadmap entry moves because something has
changed elsewhere, and a presentation page is rewritten after the fact it presents has changed,
not before.

---

## 2. How a section of this list is read

Every section from [§4](#4-technical-area) to [§13](#13-documentation-site) has the same six-point
structure. The repetition is deliberate: whoever already knows one section knows where to look in
all the others.

| Point | What it contains | What it is for |
|---|---|---|
| **What is done here** | The real scope of the area and the kind of work needed **today**, which does not coincide with the list of chapters | Working out whether the area is the right one before reading a thousand of its lines |
| **What to know first** | The modules of the guide, **in order**, with the reason why that order and not another | Not discovering halfway through the work that a premise is missing |
| **The first sensible contribution** | A concrete, small, useful and non-symbolic piece of work | Entering the area with a complete review cycle, rather than with a large and unreviewable change |
| **Typical mistakes of those coming from another domain** | Distinguished by origin: **enterprise IT** and **healthcare**. They are different mistakes, and guarding against them together does not work | Recognising your own mistake before the reviewer recognises it |
| **What is not touched without discussing it first** | The elements bound by a decision, by a noticeboard constraint or by a regulatory source, with an indication of **where** the discussion takes place | Not spending days on a change that will be rejected for a reason that is not technical |
| **How you check your own work** | The checks, the tests and the reading to be done **before** opening the proposal | Not consuming a waiting cycle for a defect that was visible locally |

A clarification is due on the fourth point, because it is the part of the module that somebody will
read as rudeness. It is not. **The two origins go wrong in systematically different ways**, and
describing the typical mistake is the cheapest way of avoiding it. Those coming from enterprise
IT tend to simplify the domain: they merge concepts that the law keeps distinct, they treat a
clinical value as a number, they optimise a model until it is no longer capable of telling the
truth about what has happened. Those coming from healthcare tend to underestimate machine
constraints: they assume that the system «knows» what a professional knows, that a rule stated out
loud is implementable, that a rare edge case does not nonetheless require a defined behaviour.
Neither of the two tendencies is a personal failing: they are the forms of mutual ignorance that
this guide exists to reduce.

---

## 3. The six things that hold in every area

Before the specific sections, what does not change. They are in order of how often they are
violated.

**First - no real data, in any artefact.** This applies to code, tests, documentation examples,
issues, screenshots, commit messages and history. It applies to your own data too. The reason, the
generation technique and the synthetic marker persisted in the datum are in
[03 §10](03-il-dato-clinico.md) and in
[17 §5](17-ambiente-di-sviluppo.md). Check `G10` is the last net, not the first: if it trips,
something upstream has already gone wrong.

**Second - the confidentiality rule `R0`.** No name of a company, brand, commercial product or
domain of a potential partner appears in any artefact of the project. One always writes «a cloud
healthcare management system», «a third-party clinical record system», «the integrator». Check
`G11` turns it into an automated verification. It is not an editorial preference: there are
confidentiality reasons that it is not for a contributor to assess.

**Third - the formulations no public artefact may use.** No text of the project - page, section
title, interface description, error message, release note - may assert or imply a conformity, a
marking or a certification that does not exist. The table of prohibited and permitted formulations
is in
[`docs/08_compliance/01-inquadramento-normativo.md`](/08_compliance/01-inquadramento-normativo.md)
§11, and it is a constraint (`V-171`) with a regulatory basis: promotional material **is**
regulatory material. The parallel list for the protocols, which prohibits declaring conformity to
informative specifications or to expired drafts, is in
[`docs/04_protocols/10-conformita-e-prove.md`](/04_protocols/10-conformita-e-prove.md) §2
(`V-133`).

**Fourth - identifiers are not renumbered.** `RF-*`, `RNF-*`, `BR-*`, `ATT-*`, `UC-*`,
`OUT-*` and the outcome codes are frozen. An identifier reused for a different requirement makes
the entire traceability matrix unusable, and maintaining traceability is one of the
**retroactively unrecoverable** activities of decision `D45`. Free ranges are requested on the noticeboard before
use (`V-120`).

**Fifth - a proposal that touches the Italian content is not complete until it updates the
English.** Check `G8` blocks the divergence. It is not a translation risk: it is different
normative content in two languages, which in a medical device context is a documentation defect.

**Sixth - the mandatory checks are not circumvented.** They are admissibility conditions, not
quality judgements: circumventing one produces an artefact that could not have been produced and
that carries a false declaration with it. If a check legitimately blocks a legitimate development,
**the check is corrected through the prescribed procedure**, it is not disabled for your own
proposal (`V-191`, [17 §9.4](17-ambiente-di-sviluppo.md)).

---

## 4. Technical area

Scope: [`docs/01_technical/`](/01_technical/00-indice.md). Code: `telemedic/platform/`,
`telemedic/contexts/*/infrastructure`, `telemedic/interfaces/`, `web/`.

### 4.1 What is done here

This area establishes **how the system is built**: which technologies, with what structure,
with what measured or declared limits. It does not decide what the system does, nor why the
internal boundaries are the ones they are.

The work needed today is not evenly distributed across the nine chapters. Three fronts are open
and concrete.

The first is the **build chain**, which by constraint `V-182` **precedes** the first line of
application code: an automatically generated bill of materials, a register of requirement
identifiers, mandatory checks executable locally as well. It is unshowy and structurally
irreplaceable work, because taking stock of third-party components after the fact costs several
times as much.

The second is the **interface**, where the acceptance criteria already exist in verifiable form
(`M1`–`M8` for rendering on a small screen, `A1`–`A10` for accessibility) and the implementations
are missing. It is the front with the lowest barrier to entry and the highest impact, because any
screen that violates one of the `A1`–`A10` criteria is not completable in the sense of
[`01_technical/04-frontend.md`](/01_technical/04-frontend.md) §7.2, and therefore is not a
finished screen.

The third is **measurement**: the media plane exposes raw counters that must be differenced
between consecutive samples before they mean anything (`V-113`), and the reference device on
which to measure the interface thresholds has not yet been declared (`Q-115`). Anyone who has a
mid-range handset a few years old and knows how to measure seriously is doing work that nobody is
doing today.

### 4.2 What to know first

In this order, and the order matters.

1. [11 - Computing fundamentals](11-fondamenti-informatici.md) in full if you are not familiar
   with consistency, aggregates, idempotency, backpressure, percentiles and row-level security.
   The technical area **assumes** this module and does not repeat a single concept from it.
2. [`docs/01_technical/01-stack-e-motivazioni.md`](/01_technical/01-stack-e-motivazioni.md),
   which says for each technology which problem it solves, which alternatives were rejected and
   what the minimum version is, with its reason.
3. The chapter of the area that concerns your work: `02` for the service, `03` for
   persistence, `04` for the interface, `05` for the media, `06` for observability.
4. [`docs/01_technical/08-qualita-e-test.md`](/01_technical/08-qualita-e-test.md), always,
   because the coverage threshold is differentiated by scope and requirement → test traceability
   is a condition of certifiability, not a good practice.

If you touch the **media**, add [08 - WebRTC from scratch](08-webrtc-da-zero.md) in full
**before** chapter 05, and read §1 of that chapter first: it distinguishes what the project builds
from what belongs to the protocol and to the browser, and it is the distinction that saves the two
most expensive mistakes of the area.

If you touch the **interface**, add [09 - The body, the vital signs, clinical
reasoning](09-fondamenti-clinici.md). It is not a whim: anyone who designs the field into which an
oxygen saturation is entered without knowing what a saturation measures produces a field that
accepts impossible values and rejects legitimate ones.

### 4.3 The first sensible contribution

**Take a screen and bring it into conformity with criteria `A1`–`A10`, with the test that
demonstrates it.** It is a small, self-contained contribution, verifiable by a third party and
immediately useful. It also has the merit of taking you through the whole cycle: change, automated
test, manual test with assistive technology, updating the Italian and English documentation,
mandatory checks locally.

An alternative of the same size on the service side: **add the record for a missing third-party
component** to the bill of materials - its function in the system, the known alternative, the
advisory channel, the impact on risk - and get check `G5` to pass. It is the kind of work that
looks bureaucratic and that, if it is not done now, never gets done.

### 4.4 Typical mistakes of those coming from another domain

**Those coming from enterprise IT.**

- **Use a cumulative counter as a quality indicator.** Loss, bytes, freeze duration and buffer
  delay grow monotonically: the correct average is a ratio between differences of consecutive
  samples, not a value read once (`V-113`). The mistake produces dashboards that look as if they
  work and that lie by an increasing margin.
- **Add a «reasonable» default value.** In a clinical context there is no reasonable default value
  for a threshold: the field starts empty and mandatory (`V-123`). Pre-filling, even with the
  value from the previous plan, is prohibited.
- **Treat the schema migration as a single act.** No release is both destructive and functional:
  two consecutive versions must be able to coexist on the same database
  (`V-111`). A feature requiring a destructive migration in the same release is to be
  redesigned, not authorised by way of exception.
- **Set the tenant context outside the transaction.** Row-level security policies deny
  everything in the absence of a context: the setting must be made **inside** the transaction
  and in the local form, not the session one (`V-112`).

**Those coming from healthcare.**

- **Ask for behaviour «as in the clinic» without defining the edge case.** In the clinic
  the disambiguation is done by a person; in software it is done by a line of code, and if it is
  not written the system does something anyway. The right question to ask is always: *what must
  happen when the datum is not there?*
- **Underestimate the patient's network.** Design starts from the small screen and the worst
  connection, not from the developer's desktop. A requirement that cannot be completed on a
  modest handset on a mobile network **is not satisfied**, by explicit criterion.
- **Confuse a technical threshold with a conformity.** No technical threshold of this area is
  imposed by Italian law: the project's values are product specification (`V-12`).
  Presenting them as conformity is a regulatory defect.

### 4.5 What is not touched without discussing it first

| Element | Why it is bound | Where it is discussed |
|---|---|---|
| Replacing or adding a technology in the stack | Every choice has a minimum version with a reason and a classification as a third-party component | Issue, then a recorded architecture decision |
| The form of errors on the public interfaces | There are **only two** permitted representations, and an uncatalogued code cannot be emitted (`V-110`, `V-130`) | Noticeboard, technical and protocols areas |
| Container and codec of the recording | They are negotiated at runtime and recorded in the metadata: **no single format can be declared** (`V-11`, `V-115`) | Noticeboard |
| Session quality index | It is proprietary and must be declared as such; it is not a mean opinion score under any recommendation (`V-114`) | Noticeboard |
| Floating version tags on dependencies or base images | They breach a clause on configuration control, not a preference (`V-173`) | Compliance area |
| Boundaries between service modules | They are the structure of the system; check `G13` verifies them | Architecture area |

### 4.6 How you check your own work

Before opening the proposal: a full build; the test suite for the scope you have touched; the
secrets check; the terminology check; the automated accessibility verification if you have touched
the interface; the update of the English if you have touched an Italian document. The minimum
sequence and the ways out when a check fails are in
[17 §9](17-ambiente-di-sviluppo.md).

Two further checks that automation does not perform and that this area requires anyway. The first:
**a manual test with a real assistive technology**, because automated verification catches
a minority of accessibility defects. The second: if you have touched the media, **test on a
degraded network**, with simulated loss and delay, and not only on a local network - where
everything always works.

---

## 5. Architecture area

Scope: [`docs/02_architecture/`](/02_architecture/00-indice.md) and
[`docs/adr/`](../adr/README.md).

### 5.1 What is done here

This area establishes **the boundaries**: which contexts exist, which invariants hold, which
aggregates delimit a transaction, how the tenant context propagates, how what has happened is
demonstrated. It is the area that comes before the others, and a mistake made here propagates by
construction everywhere.

From this follows the feature that distinguishes it from all the others: **here you do not
contribute with a change, you contribute with an argument.** The form of an architectural
contribution is a decision record that reconstructs the context, the alternatives considered, the
decision and the consequences. An architectural assertion without a decision record is a
documentation defect, not a permitted shortcut.

The work open today is concentrated in the chapter on **deferred decisions**, which lists what is
deliberately not decided, together with the criteria for deciding it. It is the right place to
start from, and it is also the place where you discover that an apparently new question is already
recorded.

### 5.2 What to know first

1. [11 - Computing fundamentals](11-fondamenti-informatici.md), in full. This area
   assumes bounded context, aggregate, transactional outbox, idempotency, consistency,
   row-level security and percentiles as acquired vocabulary.
2. [`docs/02_architecture/01-visione-architetturale.md`](/02_architecture/01-visione-architetturale.md),
   which contains the trade-offs accepted **and those rejected**. The second list is the one that
   avoids re-proposing an option already rejected with reasons.
3. [`docs/02_architecture/02-contesti-delimitati.md`](/02_architecture/02-contesti-delimitati.md),
   at least the map and the summary table.
4. [`docs/02_architecture/09-decisioni-rinviate.md`](/02_architecture/09-decisioni-rinviate.md),
   **before** proposing anything at all, to check that you are not deciding on your own authority
   something that is deliberately open.

If your contribution touches the immutable audit trail, add
[12 - Cryptography and security](12-crittografia-e-sicurezza.md), the sections on hash functions
and hash chains. If it touches the data model, add [06 - FHIR from scratch](06-fhir-da-zero.md),
because the relationship between the canonical model and the standard representation is the point
on which the area stakes its own replaceability.

### 5.3 The first sensible contribution

**Take a decision already made and check that the record documenting it is complete.** A useful
decision record contains four things: the context, the alternatives **with the reason for which
they were rejected**, the decision and the consequences - including the unfavourable ones. One or
two are regularly missing. Adding the missing rejected alternative, or the operational consequence
that nobody had written down, is a small contribution of disproportionate value, because it is
exactly what nobody remembers six months later.

An alternative: **take an entry from the deferred decisions and write the criteria for deciding
it**, without deciding. Listing what would have to be measured, which constraint the decision must
satisfy and what consequence each option would have is useful work and does not require the
authority to choose.

### 5.4 Typical mistakes of those coming from another domain

**Those coming from enterprise IT.**

- **Merge the clinical service and the media session.** They are distinct aggregates with
  independent life cycles (`V-01`): merging them means that every disconnection creates a phantom
  encounter and that a network drop closes a clinical act. It is mistake number two in the
  casuistry of the domain area, and it is the one that looks most reasonable.
- **Introduce a status column updated in place.** The alert is a sequence of immutable events and
  the current state is a projection (`V-121`). A column updated in place erases the history
  precisely where the history is the object of proof.
- **Use an external identifier as a primary key.** The normalisation of identifiers
  happens at the boundary, never in the domain (`V-142`): the domain knows one internal canonical
  identifier and a collection of external identifiers qualified by assigning authority.
- **Confuse the versioning of entities with immutability.** Whoever has write access to the
  database can also alter the version tables: a hash chain and separate retention are required
  (`V-04`, decision `D42`).

**Those coming from healthcare.**

- **Ask the system to «know» something nobody has told it.** The system does not infer
  thresholds, does not interpret silences as normality and does not compute scores that have not
  been requested. The absence of a datum is clinical information and must be represented as an
  entity, not as the absence of a row (`V-09`, `V-148`).
- **Describe a care pathway as if it were a feature.** No care pathway lives in the
  code: adding one must require a definition loaded, validated and published with a version,
  **never** a software release (`V-147`). A contribution that hard-codes a pathway is
  rejected even if the pathway is correct.
- **Underestimate the territorial multiplication.** Twenty-one independent administrative cycles
  become twenty-one code branches if the model does not keep them out. It is the reason why the
  service catalogue has its structure in the product and its content per tenant.

### 5.5 What is not touched without discussing it first

Practically everything this area contains is bound by construction: that is its purpose. In
concrete terms, the following require prior discussion and a recorded decision record:
the separation between the service and the media session; the model of isolation between tenants;
what passes through the outbox and what does not; the structure of the immutable audit trail and
the external anchoring point of its hash; the canonical identifier of the demographic registries;
the scope of what is contract towards third parties (`V-160`).

Where it is discussed: the **inter-agent noticeboard** for coordination between areas, the
**architecture decision record** for the act itself. In the event of a divergence between a
document of this area and a document of another area on an architectural fact, this area prevails,
and whoever notices the divergence does not resolve it on their own authority: they take it to the
noticeboard.

### 5.6 How you check your own work

An architectural contribution is checked in a different way from a code contribution, and the
check is stricter, not laxer.

First: **every declared consequence must be verifiable by a third party**. «It improves
maintainability» is not a consequence; «two consecutive versions can coexist on the same
database, and test X demonstrates it» is. Second: **the rejected alternatives must be
rejected with a reason, not with a preference**. Third: **the decision must not contradict a
constraint in force**; if it does contradict one, this must be declared explicitly and contested
on the noticeboard, not passed over in silence. Fourth: the internal links must survive check
`G9`, because a decision record that refers to a non-existent chapter is a record nobody can
verify.

---

## 6. Functional area

Scope: [`docs/03_functional/`](/03_functional/00-indice.md).

### 6.1 What is done here

This area describes **what the system does**, for whom, under what conditions and with what
consequences when things go differently from how they should. The editorial criterion governing it
is a single one, and it must be stated before contributing to it: **a requirement you do not know
how to verify is not a requirement.** Every entry in the catalogue has an acceptance criterion in
the form *given / when / then*, and every non-functional requirement has a metric, a threshold, a
measurement condition and a verification method.

The work open today is of two kinds. The first is the **coverage of the error flows**: the main
flows are described, the alternative and error flows unevenly so, and in this domain it is in the
error flows that harm lurks - the patient who cannot connect is not the patient who did not
attend, and the two cases have opposite administrative effects
(`V-141`). The second is the **verification of the acceptance criteria against real users**, which
has not been done to date and which, without a declared reference device, is not even fully
executable (`Q-115`).

### 6.2 What to know first

1. [02 - Telemedicine services](02-prestazioni-di-telemedicina.md). Without this module
   half of the area's choices look arbitrary: the definitions are regulatory, not commercial,
   and the difference between remote consultation (televisita), specialist-to-specialist consultation (teleconsulto), and teleconsulenza (tele-advice) changes the actors
   permitted.
2. [10 - Care pathways and patient safety](10-percorsi-di-cura-e-sicurezza.md),
   **mandatory** if you touch thresholds, alerts, patient silence or service hours. It is the
   module that explains why a clinical scale is not a formula and why use error is a
   category distinct from a defect.
3. [14 - The functional flows](14-flussi-funzionali.md), to see how the pieces fit together
   end to end, fallbacks included.
4. [`docs/03_functional/07-fuori-perimetro.md`](/03_functional/07-fuori-perimetro.md), **before**
   proposing a feature. It contains what the system deliberately does not do, with the
   reopenability category of each exclusion.

If you touch accessibility, add
[`docs/03_functional/06-accessibilita-e-usabilita.md`](/03_functional/06-accessibilita-e-usabilita.md),
which translates the operational acceptance criterion into two mandatory tests for each critical
pathway.

### 6.3 The first sensible contribution

**Take a use case and write the error flow that is missing.** Not the main flow, which is
there: the case where the patient loses the connection halfway through, where the professional
closes the record by mistake, where the measurement arrives twice, where consent is withdrawn
while the session is in progress. Every error flow added is a behaviour that stops being implicit.

The form of the contribution is precise: preconditions, steps, typed outcome, administrative
effect, postcondition. And the rule that makes it acceptable: **an anomalous outcome is a
successful operation that records an unfavourable fact**, not a protocol error (`V-126`).
Confusing the two makes what must stay in the clinical records disappear from them.

### 6.4 Typical mistakes of those coming from another domain

**Those coming from enterprise IT.**

- **Collapse state and outcome into a single field.** The state says where the encounter is, the
  outcome what happened. Two outcomes can share the terminal state and have opposite
  administrative effects (`V-141`).
- **Write an unfalsifiable requirement.** «The system must be reliable» does not produce a
  test that can fail, so it is not a requirement. The wording must be redone with a metric, a
  threshold and a measurement condition.
- **Put a clinical value in a technical document.** No clinical threshold appears in these
  documents, not even as an example: a numeric value written into a specification ends up, sooner
  or later, in a constant (`V-02`). Where an example is needed, a letter is used.
- **Treat consent as a boolean.** There are five distinct consent objects with independent
  life cycles, and the withdrawal of one does not touch the others (`V-146`). No «consent to the
  platform» exists in the model.

**Those coming from healthcare.**

- **State the rule as they would state it to a colleague.** «If the patient is deteriorating you
  call» is not implementable. What is needed is: which quantity, measured when, compared with
  what, over which window, with which recipient, within what time, and what happens if the
  recipient does not answer.
- **Assume that service hours are a contractual detail.** They are versioned runtime data that
  condition the validity of the recipient in the escalation chain: a recipient outside the
  service hours is not a valid recipient (`V-122`). It is a risk control measure, not a
  price-list clause.
- **Ask for a function that shifts the product's qualification.** A threshold proposed by the
  system, ordering by severity, interpolation of gaps, a summary index, image enhancement,
  automatic coding, automatic summarisation: they are on a closed list and are rejected **on
  scope policy**, not on technical merit (`V-170`). The rejection is not a judgement on the
  merit of the idea.

### 6.5 What is not touched without discussing it first

| Element | Why it is bound | Where it is discussed |
|---|---|---|
| Adding a function from the out-of-scope list | It changes the risk class and the software safety class together (`V-170`) | Compliance area, with written regulatory reasons |
| Numbering a new requirement | The ranges are frozen and free ones are requested (`V-120`) | Noticeboard |
| Rewording the intended purpose of remote monitoring | «Deferred collection for periodic review» is a bound formulation: «real-time monitoring» shifts the class (`V-144`) | Compliance area |
| Presenting service hours as a commercial service level | It is a risk control measure of the weakest level of the hierarchy | Product, question `Q-121` |
| Exposing clinical content to a payer | Permanent regulatory exclusion, not configurable (`V-08`, `V-166`) | No discussion possible: it is a source in force |

### 6.6 How you check your own work

Three checks, in this order.

**The first is of form:** does every requirement you have written produce a test that can fail? If
you do not know how to write it, the requirement is not finished.

**The second is of traceability:** is the requirement linked to a use case and to a rule, and does
the rule cite the regulatory source where one exists? A change that does not cite the requirement
breaks the traceability, which cannot be reconstructed.

**The third is of scope:** have you checked in
[`07-fuori-perimetro.md`](/03_functional/07-fuori-perimetro.md) that what you are proposing is
not already excluded, and under which category? An exclusion of regulatory category is not
reopened while the source is in force; an exclusion of scope category is reopened through the
normal governance of the product. They are two different answers to the same proposal.

---

## 7. Protocols area

Scope: [`docs/04_protocols/`](/04_protocols/00-indice.md). Code:
`telemedic/interfaces/`.

### 7.1 What is done here

This area describes **how Telemedic uses the protocols**, not what they are. Three assertions hold
it up, and they are also the criterion by which a contribution is accepted or rejected.

**A version not declared is a version not adopted.** Every specification cited carries a version
number, a maturity status and a date. Writing «FHIR R4» instead of «FHIR 4.0.1» in a project
subject to configuration control is a defect, because the two revisions differ in their
invariants and validators behave accordingly.

**A standard cited is not a standard complied with.** The area systematically distinguishes what a
specification mandates, what it recommends and what is a project choice because the specification
is silent. Project choices are marked as such and are not presented as conformity.

**A specification in draft is a dependency with an expiry date.** A good part of what an Italian
telemedicine system needs is in trial-implementation or active-draft status. That does not
prevent adopting it; it requires pinning its version, declaring its status and scheduling the
recheck.

The open work is concentrated on two points: the **gap analysis** between the binding information
layout of the televisita report and the profile that ought to represent it, which has not been
carried out (`Q-132`); and the **validation tools executable locally**, without which the
requirement to validate the resources before opening a proposal cannot be carried out (`Q-193`).

### 7.2 What to know first

1. [05 - Interoperability standards](05-standard-di-interoperabilita.md), which explains why
   they exist, who writes them and how they are read. §9 of that module, on how a standard is
   read, is the part that saves the most time.
2. [06 - FHIR from scratch](06-fhir-da-zero.md) in full if you touch the clinical plane.
3. [13 - The protocols, one by one](13-protocolli.md), which contains the reasoned catalogue with
   the status and version of each specification. §9 is the summary table.
4. [`docs/04_protocols/01-principi-di-interoperabilita.md`](/04_protocols/01-principi-di-interoperabilita.md),
   which says which versions are pinned, what happens when they change and what is promised to
   those who integrate.

If you touch real time, [08 - WebRTC from scratch](08-webrtc-da-zero.md) is a prerequisite and not
a substitute: chapter 09 of the area assumes that module in full.

### 7.3 The first sensible contribution

**Take a specification cited in the area and check against the primary text that the citation is
exact**: number, section, status, and - above all - whether the specification has been superseded
by a more recent one. It is a contribution that does not require writing code, requires reading
attentively, and produces exactly the kind of correction that nobody finds by chance.

The second contribution of equal value: **add a negative test**. The negative tests of this area
are peculiar and irreplaceable - they verify that something does **not** happen. That a header
prohibited by the specification does not appear; that a token lacking the actor claim is never
issued; that an uncatalogued code cannot be produced. A missing negative test is a prohibition
that exists only in the prose.

### 7.4 Typical mistakes of those coming from another domain

**Those coming from enterprise IT.**

- **Call «standard» what is not.** The idempotency header is an expired and archived draft; those
  for rate limiting are an active draft, and the three-field form has never been a standard.
  Presenting them as standards is explicitly prohibited (`V-133`).
- **Put the clinical content in the event.** Events carry references; the content is re-read with
  an authenticated call under the recipient's authorisation (`V-135`, `V-161`). It is without
  exceptions, on the clinical channel too.
- **Use impersonation instead of delegation.** When the identity comes from an external issuer,
  delegation is always used, with the actor claim: no supported configuration issues a token
  lacking it (`V-132`). It is a blocking release criterion.
- **Assume ordered delivery from a mechanism that does not guarantee it.** The protocol that
  carries the connectivity candidates must deliver them exactly once and in the same order; a
  broadcast without persistence does not guarantee this, and the resulting defect is
  intermittent and load-dependent (`V-131`).

**Those coming from healthcare.**

- **Assume that «conformant to the standard» is a binary assertion.** It hardly ever is: one is
  conformant to a version, for a set of resources, with a declared profile, and the maps between
  formats are often informative documents that found no conformity at all.
- **Assume that the Italian document exists in technical form.** The document templates, the type
  codes and the indexing metadata of the telemedicine document types are not publicly
  available (`Q-07`): the adapter exists as an extension point with a declared contract, and the
  implementation is deferred. No template is hard-coded (`V-136`).
- **Ask the system to write into the document a value it has measured.** The measured value enters
  the document **confirmed by the professional**, never generated autonomously: it would be
  information produced by the system inside a clinical document.

### 7.5 What is not touched without discussing it first

The scope of what is **contract** towards third parties (`V-160`): paths, methods, parameters and
schemas documented; profiles published and the capability statement; event types and the schemas
of their data; authorisation scopes; problem type identifiers and outcome codes; interfaces
of the replaceable modules; messaging protocol of the embeddable component. All of this is
subject to a twelve-month deprecation process, and a non-additive change requires a declared major
version - check `G6` catches it.

Nor are the following touched without discussion: the pinned version of a guide or of a profile;
the single catalogue of error codes, which is generated and not hand-written (`V-130`); the form of
the signature on outbound messages, which is asymmetric by a reasoned choice (`V-162`).

Where it is discussed: the inter-agent noticeboard towards the competent area, and - for what is
contract - a recorded decision record, because the change has effects on parties external to the
project.

### 7.6 How you check your own work

**Validation of the resources against the pinned profiles**, with the packages resolved as a build
artefact and not downloaded on the fly: an upstream change cannot change the outcome of a
validation already performed. Always distinguish, in the report, conformity to the base model from
conformity to the profile: it is the distinction that counts in practice.

`[NV]` - the names, versions and invocation modes of the tools are not fixed (`Q-133`,
`Q-193`). Until they are, the minimum check is: a citation checked against the primary text,
a negative test where a prohibition exists, and an explicit declaration of what is a project
choice.

---

## 8. Domain area

Scope: [`docs/05_domain/`](/05_domain/00-indice.md). Code: `telemedic/contexts/*/domain`.

### 8.1 What is done here

This area answers a single question: **how the real healthcare domain is turned into an
executable model without betraying it.** The criterion governing every choice is that **the model
must be able to tell the truth about what has happened**. A model that cannot distinguish a
patient who did not attend from one who tried and did not manage to connect is not imprecise: it
is false, and it produces unjust charges.

It is the area in which a clinician's contribution is worth more than a developer's, and in which
the contribution of a developer who has read the clinical block of the guide is worth more than
that of a developer who skipped it.

The work open today is of three kinds. The first is the **terminological alignment** with the
national glossary, which has not been carried out entry by entry and which must be completed
**before** the domain glossary is frozen and before the translation, because a divergence
discovered afterwards propagates across two languages (`Q-146`). The second is the **coverage
check** between the canonical dataset of the documents and the binding record layout. The third,
less showy and more useful, is the **clinical review of the definitions**: reading the ubiquitous
language and saying where an operational definition betrays the real concept.

### 8.2 What to know first

1. [03 - The clinical datum](03-il-dato-clinico.md): what data concerning health is, why it is
   a special category, what processing it entails.
2. [02 - Telemedicine services](02-prestazioni-di-telemedicina.md), for the regulatory
   definitions and the conditions for delivery.
3. [09 - The body, the vital signs, clinical reasoning](09-fondamenti-clinici.md), which is the
   module that those coming from computing are most tempted to skip and the one that pays off most.
   Without knowing what an oxygen saturation measures and why an isolated value means nothing, you
   write code that treats a vital sign like any other number.
4. [04 - Identity and demographic registries](04-identita-e-anagrafiche.md), if you touch
   subjects, roles or delegations.
5. [`docs/05_domain/01-linguaggio-ubiquo.md`](/05_domain/01-linguaggio-ubiquo.md), which contains
   the terms that look like synonyms and are not, and the precedence rule between the sources of
   definition.

The internal reading order for the area, for whoever designs the model, is
`01 → 03 → 02 → 04 → 05 → 06`: first the vocabulary, then the subjects, then the acts, then what
the acts produce. It is the real order of dependency, not the order of numbering.

### 8.3 The first sensible contribution

For those **coming from the clinical side**: read the chapter on the ubiquitous language and open
an issue for every definition that, in your practice, does not work. There is no need to propose
the alternative: what is needed is to say where the model is wrong. It is the project's most
precious and scarcest contribution, and it does not require a line of code.

For those **coming from computing**: take the state machine of a service and check that every
permitted transition has a written invariant and that every non-permitted transition is refused
with an error that says why. The state machines are described; the refusals are the part that is
most often missing.

### 8.4 Typical mistakes of those coming from another domain

**Those coming from enterprise IT.**

- **Reduce the measurement to a value plus an instant.** Without context - who measured, with
  which instrument, under what conditions, with which unit, with what reliability - the
  measurement is not interpretable. And the instant of measurement and the instant of receipt are
  **two distinct mandatory fields**: the rules operate on the first (`V-124`).
- **Treat the role as an attribute of the person.** The same professional works in more than one
  organisation, and roles have temporal validity. A role-as-attribute loses the history and makes
  it impossible to demonstrate who was entitled to access and when.
- **Modify a signed document in place.** A signed document is not modified: a corrective reissue
  is made, with a reconstructible chain. A modification in place destroys the integrity precisely
  where it is needed.
- **Build obscuring into the consumers.** Obscuring is applied by the authorisation
  engine, at a single point that filters and computes the totals on the filtered set; the six
  inference channels - numbering, counts, pagination, notifications, differences between
  queries, error messages - must all be closed (`V-149`).
- **Create a single type of «service» covering request, delivery and charging.** It produces null
  fields, fragile conditional rules and impossible reporting.

**Those coming from healthcare.**

- **Treat the carer and the legal representative as the same figure.** They are not, and the
  consequence is that a consent is collected from someone not entitled to give it.
- **Consider a draft report to be a report already.** An unvalidated document thereby acquires an
  evidential value it does not have. The distinction between drafting, validation and signature is
  modelled because it is real.
- **Assume that a clinical scale can be computed.** The project **does not compute scores
  derived from clinical data** except with full traceability of the computation, and some scales
  are excluded as a precaution for licensing reasons too. If you have a scale you would like to
  see supported, the first question is not technical: it is who holds the rights to it.
- **Take coding for granted.** The system is **fully functional without the costly clinical
  terminology** (`V-03`), and this is not a fallback: it is a constraint. A contribution that makes
  a main pathway dependent on that terminology is rejected.

### 8.5 What is not touched without discussing it first

| Element | Why it is bound | Where it is discussed |
|---|---|---|
| Hard-coding a care pathway or a service catalogue | Twenty-one independent administrative cycles; the project distributes no catalogue (`V-147`) | Architecture area |
| Document type of the televisita report | It has a document type of its own in the health record; the alternative hypothesis is **wrong** and must not be used in any artefact (`V-143`) | No discussion: it is a source in force |
| Adding terminological content to the repository | Four distinct licensing regimes, verified against the primary text; check `G3` blocks | [`THIRD-PARTY-TERMINOLOGY.md`](https://github.com/fedcal/Telemedic/blob/main/THIRD-PARTY-TERMINOLOGY.md), then compliance area |
| Confusing interface strings with official labels | The translations of the terminologies are derivative works assigned to the respective rights holders | Architecture area, decision already recorded |
| Treating the absence of a measurement as the absence of a row | The measurement expectation is an entity (`V-148`) | Noticeboard |
| Separation between those who handle technical alerts and those who access clinical content | It is an authorisation constraint, not an organisational convention (`V-125`) | Security area |

### 8.6 How you check your own work

**First check, of truth:** does the model you are proposing know how to distinguish the two cases
that have opposite effects? Take the pair closest to your contribution - non-attendance against
technical failure, draft against signed, withdrawal of one consent against withdrawal of another,
absence of a measurement against a null measurement - and check that the model distinguishes them.

**Second, of licensing:** does the contribution introduce terminological content? Check `G3`
catches it, but it is better to know beforehand: a code and a system identifier are always
permitted, descriptions and content are not.

**Third, of synthetic data:** do the test data accompanying the contribution include the awkward
cases? In particular, for obscuring, **they must include obscured documents**: otherwise no test
exercises that pathway (`V-149`).

---

## 9. Security area

Scope: [`docs/06_security/`](/06_security/00-indice.md). Code: `telemedic/platform/security`,
`telemedic/contexts/audit`, `telemedic/contexts/outbound`.

### 9.1 What is done here

This area **is not a list of measures**. A list of measures is useful to whoever already has in
mind the model that justifies them and harmful to whoever does not, because it induces the belief
that applying the measure is equivalent to obtaining the property. Every measure comes after the
asset it protects, the adversary it protects it from and the consequence - **clinical**, not
merely computing - of its failure.

Three facts govern the area and must be read before contributing to it. **There is no
non-sensitive datum sitting next to sensitive data**: the very fact that a person has a session
with a specialist is data concerning health, before and independently of the content. **The
primary adversary is not the external criminal, it is whoever is already inside the perimeter with
the right credentials**: an architecture built on the perimeter does not catch them. **The failure
of a measure produces clinical consequences**: a degraded session is a visit not concluded, an
altered audit trail is the impossibility of establishing an improper access.

The work open today: the **immutable audit trail with a hash chain and separate retention**,
which is the largest effort in the whole catalogue and must be planned as such, not as
configuration (decision `D42`); the **single egress broker** with its suite of abuse tests
(`V-157`); and the **ranges of forbidden addresses** for the relay node confinement test, without
which the test cannot be written and the constraint remains a declaration (`Q-196`).

### 9.2 What to know first

1. [12 - Cryptography and security](12-crittografia-e-sicurezza.md). It is the prerequisite in
   full: confidentiality and integrity and non-repudiation, threat models, symmetric and
   asymmetric encryption, hash functions and hash chains, signature, public key infrastructure,
   revocation, timestamping, authentication and authorisation, emergency access.
2. [04 - Identity and demographic registries](04-identita-e-anagrafiche.md), if you touch identity,
   levels of assurance or federation.
3. [13 - The protocols](13-protocolli.md), the sections on delegated authorisation, token
   exchange and message signing.
4. [`docs/06_security/01-modello-di-minaccia.md`](/06_security/01-modello-di-minaccia.md),
   always, because it is the document from which every measure of the area follows.
5. [08 - WebRTC from scratch](08-webrtc-da-zero.md), if you touch the media plane.

### 9.3 The first sensible contribution

**Write an abuse test.** Not a test that verifies that the function works: a test that
verifies that the abuse does **not** succeed. Access to a resource of another tenant must fail; a
valid credential must not be able to create permissions towards an internal address; a token
lacking the actor claim must not be accepted; an error message must not reveal the existence
of an obscured document.

It is the right contribution to start with for three reasons: it is small, it is verifiable, and in
this area the missing negative test is the commonest form of defect - the prohibition is written
in the prose and does not exist in the code.

### 9.4 Typical mistakes of those coming from another domain

**Those coming from enterprise IT.**

- **Log too much.** The immutable audit trail and the application logs **do not contain clinical
  content**, and the diagnostic logs do not carry direct identifiers of the patient (`V-150`).
  A verbose log in this domain is not an aid to diagnosis: it is a second, unprotected copy
  of the data.
- **Declare a cryptographic property statically.** The project **does not declare** protocol
  versions or negotiated suites: it measures them per session and records them (`V-156`). The
  negotiation takes place between two endpoints the project does not control, and any static
  assertion would be false for part of the installed base.
- **Open a connection towards a destination derived from an incoming datum.** Only the single
  broker has a route to the outside; for the others, egress is denied at the network level
  (`V-157`). It is an architectural requirement precisely because the defence must not depend on
  the correctness of the code.
- **Label an infrastructure metric with the session identifier.** That alone is enough to turn an
  operational dashboard into a source of data concerning health (`V-155`).
- **Confuse the level of assurance required with the one asserted.** A level reported by an
  integrator must be marked as such and does **not** satisfy an obligation of strong
  authentication (`V-154`, `V-165`).

**Those coming from healthcare.**

- **Ask for an «emergency» access without an audit trail.** Emergency access is a functional
  requirement with a precise form: a mandatory free-text reason, a limited window and scope,
  notification, review with a recorded outcome (`V-153`). It is not a shortcut, it is a pathway.
- **Assume that end-to-end encryption is always on.** When recording is active the encryption is
  terminated at the server and the session is **not** end-to-end encrypted: the privacy notice
  must declare it and the interface must signal it persistently and non-concealably.
- **Consider the insider a theoretical case.** It is the fact pattern of the sanctioning measures
  in the healthcare sector and an autonomous type of significant incident. A contribution that
  assumes the good faith of the authenticated user is a contribution that misses the principal
  threat model.

### 9.5 What is not touched without discussing it first

No **cryptographic parameter** is chosen out of habit: the source is the European and national
recommendations in force, and whatever has not been read in the text is marked `[NV]`. No
**vulnerability identifier** is cited unless it has been read on the source that publishes it: the
defects are described by mechanism and by fix version, which is the form useful to whoever has to
decide the minimum version to distribute. No **specific requirement of the national measures** is
cited verbatim before the detailed annexes have been read line by line: the codes are cited,
which are public and verified (`Q-151`).

The following are not touched without discussion: the retention terms of the audit records, which
are of sectoral source (`V-152`); the structure of the immutable audit trail; the primary defence
of the relay node, which is outbound network isolation and not the list of forbidden addresses
(`V-10`); the separation between those who handle technical alerts and those who access clinical
content (`V-125`).

Where it is discussed: the noticeboard, and - for vulnerabilities - **never in a public issue**.
The confidential procedure is in
[`SECURITY.md`](https://github.com/fedcal/Telemedic/blob/main/SECURITY.md).

### 9.6 How you check your own work

Check `G1` on secrets verifies **the history**, not just the current state: a secret removed by a
later change remains in the history of a public repository and that is where it is found, within
minutes of publication. The operational consequence is that detection is not enough:
**rotation** is required.

Besides the mandatory checks, this area requires: running the **suite of abuse tests**
against the egress broker, if you have touched a path that communicates towards the outside;
checking that no descriptive error field contains clinical content or direct identifiers;
checking that every example uses explicit placeholders and no usable value.

---

## 10. Integration area

Scope: [`docs/07_integration/`](/07_integration/00-indice.md). Code:
`telemedic/interfaces/webhooks`, `web/embeddable`, the replaceable modules.

### 10.1 What is done here

It is **the area on which the project's adoption is decided**, and it is written for a precise
reader: a developer who has never seen Telemedic's code and has no intention of seeing it, and who
has to make their own system talk to this one within a defined time, with no surprises downstream.

From this follows the feature that distinguishes the useful contribution from the useless one:
**here quality is measured in time saved for a stranger.** An example that does not compile is
worse than no example. A first-run step that assumes undeclared knowledge costs every
integrator the same half day.

The open work: the **integration test suite that exercises at least two tenants and two distinct
integrators**, with deliberately divergent configurations - a test that passes with a single
integrator configured does not demonstrate the multi-integrator property (`V-188`); and the
**minimum contract of the third-party measurement gateway**, of which two elements required by the
security model have not been verified to be exposed by the gateways on the market (`Q-122`).

### 10.2 What to know first

1. [14 - The functional flows](14-flussi-funzionali.md), which describes the end-to-end pathways
   and therefore the point at which the integration plugs in.
2. [02 - Telemedicine services](02-prestazioni-di-telemedicina.md) and
   [04 - Identity and demographic registries](04-identita-e-anagrafiche.md): the first because the
   distinction between the types of service changes the data model, the second because the
   reconciliation of demographic registries is the point at which most integrations get
   complicated.
3. [13 - The protocols](13-protocolli.md), the sections on authorisation, token exchange, event
   envelopes and message signing.
4. [`docs/07_integration/09-obblighi-di-chi-integra.md`](/07_integration/09-obblighi-di-chi-integra.md),
   **before anything else in the area**, because it contains the allocation of responsibilities and
   the fact that whoever integrates and puts into service assumes obligations of their own.

If your contribution concerns the embeddable component, add
[`docs/07_integration/05-componente-incorporabile.md`](/07_integration/05-componente-incorporabile.md)
and in particular the impassable limits on customisation.

### 10.3 The first sensible contribution

**Run the integrator's first setup from scratch, timing yourself, and note every point at which
you got stuck.** Then open an issue for each one. The three most useful pieces of information, in
order: the example that does not work; the point at which you got stuck and for how long; **the
thing you had assumed and that turned out to be false**. The third is the most precious, because it
indicates where the documentation says something ambiguous rather than something wrong - which is
harder to find.

If you prefer a code contribution: **add a runnable example verified in continuous
integration** for a pathway that today is described only in prose. The examples of the area
are verified automatically precisely because an example that rots is a defect that is discovered
only when somebody loses a day over it.

### 10.4 Typical mistakes of those coming from another domain

**Those coming from enterprise IT.**

- **Try to pass the identity from the browser.** The handover of the identity takes place between
  back ends. It is 70 % of the cost of a typical integration and it is not circumvented:
  circumventing it produces a pathway that works in a demonstration and is not defensible.
- **Ask for the clinical content inside the notification.** It is not there, and it will not be:
  the notification says that something has happened and where to find it (`V-161`). It is not a
  limitation to be negotiated, it is a project rule without exceptions.
- **Treat the payer as a consulting party.** A fund, a mutual society or an insurance policy that
  pays for the service obtains the **administrative outcome**, not the clinical content, and no
  pathway - direct or mediated by a professional - may constitute an access to the health record
  (`V-08`, `V-166`). It is a misunderstanding made in good faith, because the payer is a
  legitimate party in the pathway.
- **Present as a standard a header name that is a project choice.** The area explicitly marks what
  is a project proposal, and the rule holds for the integrator's internal documentation too.
- **Degrade accessibility with the theme.** The recording indicator, the warnings and consent
  texts, the outcome of key verification, clinical error messages and the encryption status
  indicator **are neither themeable nor concealable**; a configuration that degrades the contrast
  is **rejected on saving**, not flagged as a warning (`V-163`).

**Those coming from healthcare.**

- **Assume that the integration is a configuration.** In the modes that involve federated identity
  and the return of clinical content there is development, custody of private keys and a
  commitment to maintenance over time. Presenting it as an «activation» produces expectations that
  somebody later has to deny.
- **Confuse what the project is with what the project will be.** Until a marking exists, the
  software **is not usable for delivering health services to real patients**. Every artefact
  declares it, and no integration document may soften it.
- **Assume that the project is accredited with the identity federation.** It is not and cannot be:
  the service provider towards the federation is **the deployer** (`V-05`).

### 10.5 What is not touched without discussing it first

The scope of the public contract (`V-160`) and its deprecation rules: widening or narrowing it
requires a declaration on the noticeboard, because it has effects on external parties. The
impassable limit on the customisation of the embeddable component (`V-163`). The closed and
versioned set of theme properties. The trust registry towards integrators, which is single and
shared between federation, origins permitted for embedding and destinations permitted for
notifications: three separate registries always diverge.

And the corollary that holds for all the areas: **a new capability is not complete until it is
reachable by a third-party system through a documented and versioned interface** (`V-164`). The
area that introduces the capability also introduces the contract: it is not work that can be
deferred here.

### 10.6 How you check your own work

**Examples are run**, not re-read. If you have added or changed an example, it must pass the
automated verification; if it is not automatically verifiable, this must be said in the example
itself.

**The integration test exercises two tenants and two integrators** with divergent configurations:
different assigning authorities for the identifiers, different outbound profiles, different
delivery modes, different sets of replaced modules (`V-188`).

**Check `G6`** verifies that a non-additive change to an element of the contractual scope is
declared. If it trips, the answer is not to circumvent it: it is to make the change additive
or to declare the new major version.

---

## 11. Compliance area {#11-area-conformita}

Scope: [`docs/08_compliance/`](/08_compliance/00-indice.md).

### 11.1 What is done here

This area **does not declare a conformity: it attributes one.** There is no sentence in this
documentation asserting that the project is conformant to something, and the absence is
deliberate. Software is not conformant: **a party is**, in respect of an obligation borne by it, at
a given moment. Every chapter answers three questions and no others: *which source, on whom it
falls, from when.*

The premise governing everything: the project publishes source code; whoever takes it, integrates
it, distributes it or puts it into service delivers health services. These are two different legal
positions, and almost all the sources of the area address the second. **The project is not a
manufacturer and does not affix the CE marking**; it produces the regulatory material as a package
for the manufacturer entity, yet to be established, and it stops where an act begins that presupposes a legal
person and a signature.

The open work is almost all **verification of sources**: the area has a non-negligible number of
entries marked as not verified, each with an indication of what is to be checked. Closing one,
with the exact citation read against the primary text, is a contribution of high value and low
barrier to entry.

### 11.2 What to know first

1. [15 - The regulatory framework from scratch](15-regolatorio-da-zero.md) in full. It explains
   what a medical device, an intended purpose, a risk class, a Notified Body and a harmonised
   standard are, and why this repository is not a manufacturer. Whoever skips this module finds
   the area compact to the point of unintelligibility, and that is not a defect of the area.
2. [10 - Care pathways and patient safety](10-percorsi-di-cura-e-sicurezza.md), for hazard,
   hazardous situation, use error and residual risk.
3. [20 - Primary sources](20-fonti-primarie.md), which says where each text is to be found and how
   to check that it is still in force.
4. [`docs/08_compliance/02-qualificazione-e-classificazione.md`](/08_compliance/02-qualificazione-e-classificazione.md)
   §6, if you contribute to the code: it contains the reasonable requests that would shift the
   qualification, and therefore the reason why a well-made proposal can be rejected.

For a contributor who does not intend to specialise in this area, **only three pieces** are
needed: the list of functions that shift the qualification; the rules on traceability and
third-party components; the table of prohibited formulations.

### 11.3 The first sensible contribution

**Close an unverified entry.** Take an `[NV]` marking, find the primary text, check the citation -
article number, paragraph, annex, section, date of publication - and propose the correction **with
an indication of the source consulted and the date of consultation**. If the check refutes what is
written, so much the better: it is exactly the case for which the marking exists.

Watch out for a rule of the area: **sources are cited, not remembered.** A regulatory reference
comes from the text or it is marked as not verified. There is no third possibility, and the
memory of the writer is not a source. A plausible but wrong citation in a regulatory document is
the most damaging defect this documentation can contain, because it propagates and nobody rechecks
it.

### 11.4 Typical mistakes of those coming from another domain

**Those coming from enterprise IT.**

- **Write «conformant to» a regulation.** Conformity belongs to a controller or to an obliged
  party, not to a piece of software. A product **enables**: it supplies technical capabilities and
  documentary evidence.
- **Confuse a quality management system that is implemented with one that is certified.** They are
  different things and the difference is the reason why one of the formulations is prohibited.
- **Assume that the licence shifts the obligations.** No warranty disclaimer clause shifts
  responsibility under a regulation onto the recipient, and a contractual exclusion does not
  operate towards the injured party. Whoever integrates into a commercial product is a
  manufacturer by law, regardless of what is written in the licence.
- **Add a dependency without a record and without an exact version.** It is an unidentified
  configuration item, and floating version tags are prohibited because they make the bill of
  materials of the previous release false (`V-173`).

**Those coming from healthcare.**

- **Assume that a published document is a controlled document.** It is not: no chapter of `docs/`
  is a quality management system procedure or a document of the technical file. The chapters are
  **inputs**, they contain the analysis from which a controlled document is written (`V-174`). It
  is the junction point of the whole model.
- **Look for advice in this area.** It is neither legal nor regulatory advice: the qualification of
  a party and of a product depends on elements of fact to be established case by case by a
  qualified professional.
- **Assume that a published date is a commitment.** The dates appear only in the dedicated
  chapter, and no document of the project declares a date for a milestone that is not the
  project's (`V-180`).

### 11.5 What is not touched without discussing it first

The **intended purpose** is the most expensive document to get wrong: a single wording shifts the
risk class and the software safety class together, and the difference is worth months and an order
of magnitude of cost. It is not changed in an ordinary proposal.

The following are not touched without discussion: the reserved space of the regulatory document
identifiers (`V-172`); the table of prohibited formulations; the scope of the functions excluded on
regulatory policy (`V-170`); and any assertion about the harmonisation status of a standard, which
must be checked **at the date of use** and not once and for all.

Where it is discussed: the noticeboard towards the compliance area, and for the decisions that
require an entrepreneurial choice - monetisation, incorporation of a legal person, declared support
period - the question is taken to the person, it is not decided on one's own authority.

### 11.6 How you check your own work

Three questions, all with a binary answer.

**Has the citation been read against the primary text?** If not, it must be marked as not verified,
with an indication of what is missing and whom it must be asked of.

**Is the source still in force at the date on which you are writing?** The verification method is in
[20 §11](20-fonti-primarie.md). A repealed rule cited as being in force is an error that propagates
through the whole documentation.

**Does the text you have written contain one of the prohibited formulations?** The table is the
checklist, and the verification is not documentary but procedural: a change to a public text does
not go through code review and does not make any automated check fail. It is the only safeguard
of the area that no automated verification catches (`Q-174`).

---

## 12. Foundations guide

Scope: [`docs/10_fondamenti/`](00-come-usare-questa-guida.md) - this guide.

### 12.1 What is done here

The guide is a **training guide that starts from zero**, addressed to anyone who wants to
contribute, and it covers the entire medical and healthcare context of the project, all the
protocols applied and the computing and clinical-organisational knowledge needed before writing a
line of code. It is a declared prerequisite of
[`CONTRIBUTING.md`](https://github.com/fedcal/Telemedic/blob/main/CONTRIBUTING.md).

The editorial rules are five and are in
[00 - How to use this guide](00-come-usare-questa-guida.md): every acronym expanded at its first
occurrence, every healthcare concept explained to a computing person and every computing concept
to a clinician, every regulatory assertion with its source, whatever is not verified declared as
such, no real data.

The open work: **completing the missing modules**; **checking that each module survives the
test of the reader who starts from zero**; and - the largest front of all - the **full English
translation**, which by explicit decision is not a summary and whose real risk is not the missing
translation but **the divergence between the two versions**.

### 12.2 What to know first

Less than one might think, and in a different order from the usual.

1. [00 - How to use this guide](00-come-usare-questa-guida.md), for the editorial rules and the
   reading paths by profile.
2. The module you intend to touch, **in full**, before changing a paragraph of it. The modules of
   this guide are built as paths: a local change that ignores the path breaks the order in which
   the concepts are introduced.
3. The modules that refer to it. A concept moved or renamed here has repercussions on the areas,
   which cite this guide instead of rewriting it.
4. [19 - Glossary](19-glossario.md), if you introduce a new term: the guide has an exhaustive
   bilingual glossary with cross-references, and a term introduced without a glossary entry is a
   term somebody will look for in vain.

### 12.3 The first sensible contribution

**Read a module with the eyes of someone who does not know, and mark every point at which you
stopped.** Then open an issue for each one, quoting the exact point. There is no need to be able to
rewrite the paragraph: what is needed is to say where the text presupposes something it has not
explained. Rule number two of the guide says so explicitly: if an explanation presupposes the other
world, **it is a defect**.

It is the contribution with the highest value-to-expertise ratio in the whole project, and it is
open to anyone: a clinician who does not understand a technical paragraph and a developer who does
not understand a clinical paragraph are both doing exactly the work that is needed.

### 12.4 Typical mistakes of those coming from another domain

**Those coming from enterprise IT.**

- **Summarise instead of explaining.** A module that starts from zero is long by construction. The
  compression that looks like elegance is, for the intended reader, a barrier.
- **Duplicate the content of an area.** The guide explains, the areas decide. If a module starts
  fixing versions, constraints or limits, it is trespassing on an area and must be brought back to
  a cross-reference. The symmetrical rule holds for the areas: if a chapter of an area starts
  explaining the theory, it is duplicating the guide.
- **Use an acronym without expanding it.** No exceptions, not even for the best known ones: someone
  arriving from another country does not know what an Italian local health authority is.

**Those coming from healthcare.**

- **Take for granted what is obvious on the ward.** That a report has to be signed, that a consent
  is collected before and not after, that a measurement out of context means nothing: these are
  professional obvious facts that the computing reader does not possess.
- **Correct the clinical content without updating the cross-references.** A clinical concept
  corrected here can have consequences for the domain model, which refers to it. Flagging this is
  part of the correction.
- **Write a definition without the source.** Summaries without a source age badly and are not
  verifiable: rule number three admits no exemption for clinical definitions.

### 12.5 What is not touched without discussing it first

The **structure of the modules and their numbering**: the modules are cited by number by all the
areas and by both languages, and a renumbering breaks a large number of cross-references. The
**placement of a concept**: moving an explanation from one module to another is a structural
change, not an editorial one. The **position of the guide as a prerequisite** of `CONTRIBUTING.md`.

And a rule that holds for every change: **a proposal that touches the Italian content is not
complete until it updates the English** (`G8`). It holds for a one-line correction too.

### 12.6 How you check your own work

**Test of the reader who starts from zero:** give the changed module to somebody who does not know
the subject and ask them where they stopped. It is the only check that counts, and it cannot be
automated.

**Check `G9` on internal references:** a broken link in a training guide is a reader lost. The
check is blocking before the site's first deploy.

**Check `G8` on linguistic divergence**, and **checks `G10` and `G11`** on synthetic data and
confidentiality, which in prose trip more often than in code, because it is in prose that one is
tempted to give a realistic example.

---

## 13. Documentation site

Scope: the generator's configuration, the theme, the navigation, the search,
the internationalisation and the publication.

### 13.1 What is done here

The approved sequence of work is clear-cut: **all** the documentation is completed, then the site
is built with internationalisation, published, and its **real functioning verified** - navigation,
search, language switching, internal links, reproducible build.
**No area is considered closed until it is navigable online in both languages** (`V-183`).

From this it follows that work on the site is not final cosmetics: it is the closing condition of
everything else. And from it follows an operational fact worth stating straight away: **internal
links towards modules not yet written are permitted during drafting but are blocking before the
first deploy.** Whoever works on the site therefore also works on a list of links to close that is
not theirs, and that must be handed back to the competent areas instead of being resolved by a
removal.

The open work: the generator's configuration does not yet exist; the internationalisation has to
be set up with a mirrored file structure; an automated check is needed that flags Italian documents
changed without their English counterpart; and the reachability checks are needed for the
cross-references **outside** the documentation folder, which today are written as absolute
addresses towards the repository precisely because duplication inside the documentation is ruled
out.

### 13.2 What to know first

1. [00 - How to use this guide](00-come-usare-questa-guida.md) and the indexes of the nine areas,
   in order to understand the structure the site has to make navigable. It is not a detail: the
   structure is not decided by whoever builds the site.
2. [17 §9 - The checks that must pass](17-ambiente-di-sviluppo.md), because `G8` and `G9` are the
   two checks the site makes enforceable.
3. The project's writing conventions: frontmatter with title, position and description;
   diagrams in a textual, version-controllable language; code blocks with a declared language;
   relative links towards the internal documents and **absolute** ones towards the files at the
   root of the repository.

### 13.3 The first sensible contribution

**Add or correct the frontmatter of a document that lacks it or has it incomplete**, and check
that the build does not fail. There is a documented trap worth knowing before meeting it:
**a frontmatter value containing a colon followed by a space must be enclosed in double quotation
marks**, otherwise the build fails with an error that points to a non-obvious line.

A contribution of the same size and higher value: **the report of broken internal links**,
produced automatically and sorted by destination area. Do not resolve them: list them and hand them
over. It is the information the areas need in order to close, and it is blocking.

### 13.4 Typical mistakes of those coming from another domain

**Those coming from enterprise IT.**

- **Resolve a broken link by removing it.** A cross-reference towards a module not yet written is
  a declared debt, not a typo: removing it erases the information that the cross-reference served.
- **Duplicate a file from the root inside the documentation to make a link work.**
  It is explicitly ruled out: two copies of a document that declares the intended purpose and the
  limits of use are two documents that will diverge, and in this context a documentary divergence
  is a regulatory defect, not a maintenance nuisance. The correct form is the absolute address
  towards the repository, with a reachability check.
- **Translate freely.** Translation is not adaptation: Italian regulatory references stay cited in
  their original form, with the explanation in the language. Translating the title of a decree
  makes it impossible to find.
- **Build the site from a floating version of a tool.** The build must be reproducible: no
  floating version tag, not even on the tools of the chain (`V-173`).

**Those coming from healthcare.**

- **Assume that the site is the documentation.** The site is a readable publication of the same
  content; it is not the user manual of a medical device, and it cannot be. The distinction is
  declared in the distribution policy.
- **Ask for a presentation page that «gets the value across».** Every public text is material from
  which the intended purpose is legally inferred: it goes through regulatory review, with the table
  of prohibited formulations as the checklist.

### 13.5 What is not touched without discussing it first

The **order of the sections in the navigation bar**, which reflects a decision on the structure of
the documentation and not an aesthetic preference. The **position of the foundations guide**, which
sits immediately after the overview by explicit decision. The **internationalisation strategy**,
which must keep the file structure mirrored. The **publication policy**, which has a primary
destination and a mirror.

### 13.6 How you check your own work

The criterion is behavioural, not declarative: **the build succeeds; the navigation works; the
search finds; the language switch does not lead to a non-existent page; no internal link is
broken; the build is reproducible from the same state of the repository.** Six binary conditions.
Five out of six means not ready.

---

## 14. Contributions that are not code

This section is not a courtesy appendix. In this project the contributions that follow **are worth
as much as code and are scarcer**, for a structural reason: they require skills that the open
source developer population on average does not have, and that the population which has them on
average does not know it can offer.

### 14.1 Clinical review

**What it is.** A healthcare professional reads a module, a domain chapter or a functional flow
and says where the model betrays reality: a definition that does not work in practice, a
distinction the text does not make and that on the ward is essential, a frequent case the flow
does not cover, an outcome that has an administrative effect different from the one written.

**Why it is worth so much.** No developer can do it. The regulatory sources define the
services but do not describe what actually happens in a clinic, and the distance between the two
is the place where healthcare systems fail silently.

**How it is done in practice.** The modules on which clinical review is most useful are
[02](02-prestazioni-di-telemedicina.md), [03](03-il-dato-clinico.md),
[09](09-fondamenti-clinici.md), [10](10-percorsi-di-cura-e-sicurezza.md) and
[14](14-flussi-funzionali.md), and the domain chapters on services, documents, vital signs and
consent. The form of the contribution is one issue per point, with the exact quotation and a
description of what happens in practice. **There is no need to propose the solution.**

**What is not needed.** There is no need to know the code, no need to install anything, no need to
know what a pull request is: the issue is enough.

### 14.2 Verification of regulatory sources

**What it is.** Taking a citation - a decree, an article, an annex, a technical standard,
a specification - finding the primary text, and checking that the reference is exact and that the
source is still in force.

**Why it is worth so much.** A wrong citation in a regulatory document propagates: it is copied
into another chapter, then into a response to a tender specification, then into a document that
somebody signs. And nobody rechecks it, because it looks precise. The entries marked as not
verified exist precisely to make visible what has not been checked, but the marking is not the
verification.

**How it is done in practice.** Look for the `[NV]` markings in the area that interests you, pick
one, find the text, and propose the correction with **the source consulted and the date of
consultation**. If the check confirms, that must be said: an entry verified that loses its marking
is a contribution, not a non-event. The method for checking that a source is in force is in
[20 §11](20-fonti-primarie.md).

**What is not needed.** There is no need to be a lawyer. What is needed is the ability to read a
regulatory text and to resist the temptation to complete by inference what the text does not say.

### 14.3 Translation

**What it is.** The full English version of every module and of every area. Not a summary: the
complete text, with a mirrored file structure.

**Why it is worth so much.** It is the largest obligation of the whole body of documentation, and
its real risk is not the missing translation: it is **the divergence between the two versions**.
Two documents that say different things about the same obligation, in a medical device context,
are a documentation defect.

**How it is done in practice.** One document is translated at a time, in full, keeping the Italian
regulatory references in their original form with the explanation in English. The bilingual
glossary is the reference for rendering the terms: if a term is missing, it is added there before
being used. Check `G8` verifies that an Italian change has its English counterpart, but it does
not verify that the translation is good: that is done by review.

**What is not needed.** There is no need to be a professional translator. What is needed is to know
the domain well enough not to translate a technical term with an apparent synonym.

### 14.4 Accessibility testing with real assistive technologies

**What it is.** Using the system - or, today, its prototypes and its documentation - with a screen
reader, with the keyboard alone, with high magnification, with high contrast, with a
reduced-motion preference, on a modest handset and on a limited network.

**Why it is worth so much.** Automated verification catches **a minority** of accessibility
defects. The rest is found only by using, and whoever uses an assistive technology daily
finds in ten minutes defects that an automated check will never find. The representative users of
this system include elderly people and people with disabilities: they are not an edge case, they
are the reference population.

**How it is done in practice.** A complete pathway is run - not a single screen - and one notes
where one gets lost, what is not announced, which traversal order is illogical, which
information is conveyed by colour alone, which message is not comprehensible. The form of the
contribution is one issue per pathway, with the name of the technology used and its version.

**A specific point on which the project needs real verification.** Session key verification is a
short code that the two parties compare out loud. It must be readable by a screen reader, not
conveyed by colour alone, and comprehensible to an elderly or digitally unskilled person. It is at
once a security measure and a risk control: if it is not usable, it is not a measure.

### 14.5 Reporting ambiguities in the documentation

**What it is.** Reporting the points at which the documentation **is not wrong but is ambiguous**:
where it can be understood in two ways, where a premise is not declared, where a term is used with
two meanings, where an example suggests a rule the text does not state.

**Why it is worth so much, and more than it seems.** An error is found: somebody checks it and
corrects it. An ambiguity is not: everyone resolves it in their own way, in silence, and the defect
emerges months later as a divergence between two implementations that believed themselves in
agreement. The formulation proposed by the integration area is the most useful of all: **«the
thing I had assumed and that turned out to be false»**.

**How it is done in practice.** An issue with: the exact point, the two possible readings, and
which of the two you had adopted. If you lost time over the ambiguity, saying **how much** helps to
set the priority.

### 14.6 Why these five things are scarce, and what follows from it

All five are scarce, but **for two different reasons**, and it is worth distinguishing them because
they are remedied in different ways. Points 14.1, 14.2 and 14.4 require skills that the mental model
of the open source contribution does not associate with a software project: whoever possesses them -
the healthcare professional, whoever can retrieve a normative text at the source, whoever uses an
assistive technology daily - often does not consider themselves a potential contributor. It is a
misunderstanding, and this module exists also to dissolve it. Points 14.3 and 14.5 are scarce for
the opposite reason: they do **not** require rare skills, and the text of the two paragraphs says so
itself; they are scarce because they are work of volume and patience whose result is invisible when
it is done well, and nobody offers it spontaneously because it does not look like a contribution.

From this follows a practical rule for whoever reviews: **a well-made issue of one of the five
kinds is to be treated with the same seriousness as a code proposal**, with a recorded outcome and
a reasoned answer even when the outcome is rejection. A contributor who reports an ambiguity and
receives no answer does not report a second time, and with them the only source of that kind of
information is lost.

---

## 15. Matrix: code area → knowledge required

The matrix is the compact form of everything that precedes, and it answers the question «I am about
to touch this piece of code: what must I have read?». The **mandatory** column contains what,
without it, the review cannot conclude positively; the **needed if** column contains the modules
that become mandatory under a condition.

| Code zone | Mandatory | Needed if… |
|---|---|---|
| `platform/tenancy` | [11](11-fondamenti-informatici.md) | you touch the migrations → technical area ch. 3 |
| `platform/security` | [12](12-crittografia-e-sicurezza.md), [13](13-protocolli.md) | you touch national identity → [04](04-identita-e-anagrafiche.md) |
| `platform/outbox` | [11](11-fondamenti-informatici.md) | you touch the envelopes → [13](13-protocolli.md) |
| `platform/problem` | [13](13-protocolli.md) | you expose errors on the clinical plane → [06](06-fhir-da-zero.md) |
| `platform/observability` | [12](12-crittografia-e-sicurezza.md), [03](03-il-dato-clinico.md) | - |
| `contexts/terminology` | [05 §8](05-standard-di-interoperabilita.md) | you touch the licensing → [`THIRD-PARTY-TERMINOLOGY.md`](https://github.com/fedcal/Telemedic/blob/main/THIRD-PARTY-TERMINOLOGY.md) |
| `contexts/identity` | [04](04-identita-e-anagrafiche.md), [12](12-crittografia-e-sicurezza.md) | you touch the federation → [13](13-protocolli.md) |
| `contexts/registry` | [04](04-identita-e-anagrafiche.md), [03](03-il-dato-clinico.md) | - |
| `contexts/scheduling` | [02](02-prestazioni-di-telemedicina.md), [14](14-flussi-funzionali.md) | - |
| `contexts/encounter` | [02](02-prestazioni-di-telemedicina.md), [03](03-il-dato-clinico.md), [09](09-fondamenti-clinici.md) | you touch the report → [06](06-fhir-da-zero.md), [07](07-fse-e-infrastrutture-nazionali.md) |
| `contexts/media-session` | [08](08-webrtc-da-zero.md) in full | you touch the encryption → [12](12-crittografia-e-sicurezza.md) |
| `contexts/clinical-document` | [03](03-il-dato-clinico.md), [06](06-fhir-da-zero.md), [07](07-fse-e-infrastrutture-nazionali.md) | you touch the signature → [12](12-crittografia-e-sicurezza.md) |
| `contexts/monitoring` | [09](09-fondamenti-clinici.md), [10](10-percorsi-di-cura-e-sicurezza.md) | **always**: it is the area with the highest clinical risk |
| `contexts/alerting` | [10](10-percorsi-di-cura-e-sicurezza.md) in full | you touch the escalation → [14](14-flussi-funzionali.md) |
| `contexts/consent` | [03](03-il-dato-clinico.md), [02](02-prestazioni-di-telemedicina.md) | you touch obscuring → [07](07-fse-e-infrastrutture-nazionali.md) |
| `contexts/outbound` | [13](13-protocolli.md), [12](12-crittografia-e-sicurezza.md) | - |
| `contexts/audit` | [12](12-crittografia-e-sicurezza.md), [03](03-il-dato-clinico.md) | - |
| `contexts/tenant-admin` | [11](11-fondamenti-informatici.md) | you touch the service hours → [10](10-percorsi-di-cura-e-sicurezza.md) |
| `interfaces/rest-api` | [13](13-protocolli.md) | - |
| `interfaces/fhir-facade` | [06](06-fhir-da-zero.md) in full, [05](05-standard-di-interoperabilita.md) | you touch the documents → [07](07-fse-e-infrastrutture-nazionali.md) |
| `interfaces/signaling` | [08](08-webrtc-da-zero.md) in full, [13](13-protocolli.md) | - |
| `interfaces/webhooks` | [13](13-protocolli.md) | - |
| `web/core`, `web/design-system` | [11](11-fondamenti-informatici.md) | **always** the accessibility criteria of the functional area |
| `web/features` (consultation) | [08](08-webrtc-da-zero.md), [02](02-prestazioni-di-telemedicina.md) | - |
| `web/features` (consent, reporting) | [03](03-il-dato-clinico.md), [09](09-fondamenti-clinici.md) | - |
| `web/features` (monitoring) | [09](09-fondamenti-clinici.md), [10](10-percorsi-di-cura-e-sicurezza.md) | - |
| `web/embeddable` | [13](13-protocolli.md), integration area ch. 5 | - |
| Build chain and checks | [17 §9](17-ambiente-di-sviluppo.md), [15](15-regolatorio-da-zero.md) §on configuration | - |

Four rows deserve to be read as warnings and not as table entries. `contexts/monitoring`
and `contexts/alerting` are the zones in which a defect produces direct clinical harm, and that is
the reason why the clinical modules are mandatory there without conditions. `contexts/media-session`
requires the real-time module **in full** and not in snatches, because most of the defects
on that plane arise from having understood half the protocol. `web/design-system` is the zone with
the highest multiplier effect: an inaccessible base component makes every screen that uses it
inaccessible, and the downstream correction costs many times the upstream one.

---

## 16. When your proposal is rejected

It will happen, and the way it happens is part of how the project works. It is worth
distinguishing **four kinds of rejection**, because they require different responses and confusing
them is the commonest cause of frustration.

**Technical rejection.** The contribution has a defect: it is corrected and re-proposed. It is the
ordinary case and requires no comment.

**Scope rejection.** The contribution introduces a function from the closed list and **is not
assessed on technical merit**: it is rejected on policy, with written regulatory reasons (`V-170`).
It is not a judgement on the quality of the work, and it is the reason why the list is published:
reading it beforehand costs ten minutes.

**Rejection for lack of competence.** The contribution decides something that is not for its
proposer to decide: an architectural choice without a decision record, a change to the contractual
scope without a declaration, an answer to a question addressed to another area. The correct
response is not to insist: it is to take the question to where it is decided.

**Rejection on regulatory form.** The contribution contains a prohibited formulation, an
unverified citation presented as verified, a renumbered identifier or a non-synthetic datum. It is
the kind of rejection that looks pedantic and is not: it is the defect that propagates.

In all four cases a single rule holds, which is also the way this project decides:
**discussion continues until no substantial objection remains unresolved**, with arguments referred
to verifiable sources. If the disagreement persists, the decision record is written with the
alternatives. Unwritten decisions do not exist: six months later nobody remembers why. The
complete process, the roles and the disagreement procedure are in
[`GOVERNANCE.md`](https://github.com/fedcal/Telemedic/blob/main/GOVERNANCE.md).

---

## 17. Unverified points of this module

Listed here because a declared gap is usable and an implicit one is not.

| Reference | What is missing | Whose responsibility it is |
|---|---|---|
| `[NV]` | The **aggregate command** that runs the mandatory checks locally is not fixed: until it is, the «how you check your own work» section of each area relies on a manual sequence (`Q-190`) | Technical area |
| `[NV]` | The **validation tools for the clinical profiles executable locally** are not fixed by name and version: the verification prescribed for the protocols area is therefore not executable in reproducible form (`Q-133`, `Q-193`) | Protocols and technical areas |
| `[NV]` | The **reference device** for the small-screen rendering criteria is not declared: two accessibility requirements are not verifiable until it is (`Q-115`) | Product |
| `[NV]` | The **ranges of forbidden addresses** for the relay node confinement test are not listed: without the list the test cannot be written (`Q-196`) | Security area |
| `[NV]` | The **minimum workable machine profile** for the local environment has not been measured: whoever has a modest machine does not know in advance whether they can take part (`Q-191`) | Technical and roadmap areas |
| `Q-195` | There is no **public and maintained list of first-entry contributions** per area, consistent with the «the first sensible contribution» sections of this module. Without it the indications remain descriptive and not actionable | → orchestration, with the areas |
| `Q-197` | It is not defined **who answers the issues that are not code** - clinical review, verification of sources, accessibility testing - nor within what time. It is the condition for §14 to produce repeated rather than one-off contributions | → orchestration, with the governance |
| `Q-198` | The **double naming of this module** in the existing cross-references is resolved in the text: `CONTRIBUTING.md` - in both the Italian and the English block - module 00 and module 17 have been aligned to the file's `title`, «Contribuire, area per area» / *Contributing, area by area*, which is the authoritative naming; the glossary was already aligned to it. What remains is the non-editorial part: the **automated reachability check** on the cross-references must be added to the blocking checks before the first deploy (it settles together with `Q-26`) | Guide and site |

---

## What you must remember

1. **The right question is not «is there anything easy»: it is «what do I already know».** The
   areas of this project have asymmetric prerequisites, and choosing one without the prerequisites
   produces a contribution that nobody can review.
2. **The first contribution is chosen small in order to go through the whole cycle**, not in order
   to do little. Change, tests, local checks, both languages, review: the first time it is the
   cycle that is learned, not the code.
3. **There are four kinds of rejection and only one is technical.** Scope rejection is not a
   judgement on the work; rejection for lack of competence is resolved by taking the question to
   where it is decided.
4. **The typical mistakes are two, and they depend on where you come from.** Those coming from
   enterprise IT simplify the domain; those coming from healthcare underestimate machine
   constraints. Recognising your own is quicker than discovering it in review.
5. **The mandatory checks are admissibility conditions, not quality judgements.** Circumventing one
   produces an artefact that could not have been produced. If a check legitimately blocks a
   legitimate development, the check is corrected.
6. **A proposal that touches the Italian content is not complete until it updates the English.**
   It holds for a single line too.
7. **The contributions that are not code are worth as much as code and are scarcer.** Clinical
   review, verification of sources, translation, real accessibility testing, reporting of
   ambiguities: five kinds of work that no developer can do in place of whoever has the right
   expertise.
8. **The most precious thing you can report is the thing you had assumed and that turned out to be
   false.** It indicates where the documentation is ambiguous, which is the defect that no
   automated check will find.

