---
title: Supply chain
sidebar_position: 8
description: The bill of materials as a regulatory obligation with its minimum content, exploitability statements, coordinated disclosure, artefact signing and provenance, the classification of third-party components and the case of the external terminology service.
---

# Supply chain

> **Reading prerequisite.** What software of unknown provenance is, why the bill of materials is an
> obligation and not a good practice, what coordinated disclosure means:
> [10 §12 - Cryptography and security, §11](/10_fondamenti/12-crittografia-e-sicurezza.md).
> Here we describe the artefacts the project produces, their properties and their obligations.

## 1. Why this chapter has the highest return

The build chain is the asset with the **highest multiplication factor**
([01 §2.5](./01-modello-di-minaccia.md)): its compromise propagates to every installation
simultaneously, and it is invisible to the recipient, because what they receive is signed with the
right key and comes from the right channel.

There is however a second reason, which concerns market access more than security in the strict
sense, and it must be said without circumlocution. **The deployer is, almost always, an entity that
has to demonstrate the security of its own supply chain to an authority.** Article 24(2)(d) of
d.lgs. 4 settembre 2024, n. 138 (Legislative Decree no. 138 of 4 September 2024) places that
obligation on them; paragraph 3 requires them to assess «the specific vulnerabilities of each
direct supplier» and «the overall quality of the products and the cybersecurity practices of the
suppliers, **including their secure development procedures**». A supplier that turns up with no
bill of materials, no disclosure policy, no export of evidence and no secure development
documentation is not «less competitive»: it is **unusable**, because it prevents the deployer from
closing out their own documentary evidence.

## 2. The bill of materials is a regulatory obligation

It is not a good practice. **Annex I, Part II, point 1, of Regulation (EU) 2024/2847** requires the
manufacturer to identify and document the components contained in the product, «drawing up a
**software bill of materials** in a commonly used and machine-readable format covering **at the
very least the top-level dependencies** of the product».

Three operational clarifications, which are the three things most often misunderstood:

1. **The legal minimum is the top-level dependencies**, not the complete transitive tree. A bill
   generated automatically by the project's build systems satisfies and **exceeds** the minimum,
   because it traverses both of them in full. The project adopts the more extensive minimum, not the
   legal one.
2. **The bill does not necessarily have to be published**: the regulation requires it as part of the
   technical documentation, to be made available to market surveillance authorities on reasoned
   request. **Publication is however the rational choice** for a project that wants to be
   integrable, because it is what allows the integrating party to complete their due diligence
   without asking.
3. **The bill is not the only thing Part II requires.** The other obligations are: addressing
   vulnerabilities without delay by means of security updates; carrying out periodic security tests
   and reviews; **publicly disclosing information about fixed vulnerabilities** once the update has
   been made available; implementing a **coordinated vulnerability disclosure policy**; facilitating
   the sharing of information about potential vulnerabilities; ensuring **secure mechanisms for the
   distribution of updates**; distributing fixes **without delay and free of charge**.

Converging on the same artefact: the measure on the inventory of software systems and applications
in the national authority's baseline specifications; the family of controls on the inventory of
authorised software in the national minimum measures for public administrations; requirement R33
of the appendix on eligible security requirements of the national procurement guidelines; and the
obligation to inventory software components of unknown provenance that derives from the software
life cycle rules for medical devices.

### 2.1 Minimum content of each entry

| Field | Why it is needed |
|---|---|
| Name and **unique package identifier** | Without an identifier, matching against vulnerability databases is approximate, and the approximation produces false positives that nobody deals with |
| **Exact version** | A version range is not a bill of materials |
| **Licence** | It is the information the integrating party uses for their own compatibility assessment |
| **Digest** of the artefact | It ties the entry to a specific file and makes it verifiable that the distributed artefact is the one described |
| **Supplier or author** | It is the datum the deployer must be able to trace back, for the reason in §3 |
| **Relationship** with the other components | It distinguishes a direct dependency from a transitive one, and a build dependency from a runtime one |

The bill is **generated by the pipeline**, not compiled by hand: a hand-compiled bill is out of
step at the first update. It is **produced for every release**, **signed**, and kept as part of the
release artefacts.

### 2.2 The moment to do it is now

It is one of the **retroactively unrecoverable** activities identified by decision D45: inventorying
third-party components after the fact costs a multiple of inventorying them as they come in, and
traceability cannot be reconstructed. The bill must be generated **from the first run of the
pipeline**, before there is even much to inventory.

## 3. The bill has a reader who is not technical

This section exists because it is the point at which security meets an obligation that almost no
supplier anticipates.

Article 18 of determination no. 127437 of 13 April 2026 of the national cybersecurity authority
requires every entity subject to the rules to **notify the authority of the list of its relevant
suppliers, by name**, with five fields: registered company name; tax identification number;
**country of the registered office**; European procurement vocabulary codes relating to the
supplies used; the relevance criterion applied. `[NV]` on the text: the determination has not been
read against a primary source and its citation details come from concordant qualified secondary
sources and from the authority's institutional communications. It must be verified before its
precise content is cited - this is question Q-151 in the part relating to this determination.

Four direct consequences:

1. **Whoever provides the service to an entity subject to the rules will be declared by name to the
   authority.** In managed-service mode it very probably falls under both relevance criteria; in an
   on-customer-premises installation the first criterion may not apply, but **the second - the
   non-substitutability of the supply - remains**, because maintenance and support are not readily
   replaceable.
2. **The country of the registered office is a mandatory field.** Data sovereignty stops being a
   commercial argument and becomes **a datum the customer transmits to an authority**. A runtime
   dependency on a service established outside the Union increases the customer's declaratory
   exposure, and **the customer discovers this at the moment of filling in the declaration**: there
   is no way of deferring the discovery.
3. **Procurement vocabulary codes are needed**, published by the project in directly reusable form,
   to avoid every customer reconstructing them differently. The **precise selection of the codes
   must be agreed with a procurement adviser and verified against the vocabulary in force**:
   `[NV]`, it is not this area's job.
4. **The project's chain becomes visible.** If the system relies on a managed relay service, on a
   notification service, on a remote signing provider or on a content delivery network, those
   parties become potential **second-level** relevant suppliers for the customer. It is the
   regulatory argument - not merely the ethical one - in support of the sovereignty constraint: **it
   reduces the customer's declaratory surface**.

## 4. Exploitability statements

A bill of materials, on its own, produces a list of dependency vulnerabilities that in the context
of the product are, for the most part, **not exploitable**: because the vulnerable code is not
reachable, because the function is not used, because a configuration neutralises it.

If the project does not state this, the integrating party has to infer it. They have no basis for
doing so, and therefore either they remediate irrelevant vulnerabilities - pure cost - or they
ignore them all, including the one that matters. **The exploitability statement is the artefact that
solves this problem**, and the cyber resilience regulation presupposes it when it requires the
sharing of vulnerability information to be facilitated.

Rules of the project:

| Rule | Reason |
|---|---|
| The statement **accompanies every release** and covers **all** the open vulnerabilities in the bill | Partial coverage is unusable: the reader does not know whether silence means «not exposed» or «not assessed» |
| Every entry states the **status** and, for the statuses that require it, the **justification** | A status without a justification is an opinion |
| It is **signed** and machine-readable | It must be able to enter an integrating party's automated process |
| A status of non-exposure **justified by the configuration** states **which** configuration | If the deployer changes that configuration, the statement no longer holds, and they must be able to know that |
| The release is **blocked** where open vulnerabilities exist above the defined severity threshold and **not covered** by the statement | It is the obligation to place on the market «without known exploitable vulnerabilities» of Annex I, Part I, of the regulation |

## 5. Secure development and verification in continuous integration

A single process satisfies at once the rules on security activities in the health software life
cycle, the obligations of Part II of Annex I of the cyber resilience regulation, the «secure
development procedures» obligation the customer must verify at the supplier, and the controls on
continuous vulnerability assessment of the national minimum measures. **Designing them separately
is the error this section exists to avoid.**

| Activity | Frequency | Effect on the release |
|---|---|---|
| Static code analysis | Every proposed change | Blocked when the threshold is exceeded |
| Dependency analysis and matching against vulnerability databases | Every proposed change and daily on the main branch | Blocked when the threshold is exceeded |
| Secret scanning | Every proposed change | Absolute block |
| Dynamic analysis on the running application | Periodically and before release | Blocked on high-severity findings |
| **Negative cross-tenant authorisation tests** on every entry point | Every proposed change | Blocked; **and blocked on missing coverage too** ([06 §5.3](./06-sicurezza-applicativa.md)) |
| **Abuse test suite against the egress broker** | Every proposed change | Blocked ([06 §8.4](./06-sicurezza-applicativa.md)) |
| **Abuse tests on the relay** | Every proposed change and at every version update | Blocked ([05 §4.5](./05-sicurezza-del-tempo-reale.md)) |
| Verification of encrypted transport conformance | Every proposed change | Blocked below the declared threshold |
| Identity federation conformance verification | Periodically | Flagged, then blocked before release |
| Threat model | At every new capability with a boundary or an egress point, and in any case annually | Does not block; it is a **completeness condition** of the capability |
| Periodic restore test, **key material included** | Scheduled | Does not block; its outcome is documentary evidence |

**Where each of these activities stands today.** A rule written here and not enforced by a control
is not a rule, and of these eleven only one was implemented: secret scanning, which is control
`G1`. Nine of the remaining ten now have a row in
[`pipeline/collocazione-dei-controlli.tsv`](https://github.com/fedcal/Telemedic/blob/main/pipeline/collocazione-dei-controlli.tsv),
with identifiers from `SEC-C1` to `SEC-C10`, in **signalling only and each with the declared date
on which it becomes blocking**, tied to an existing milestone and not picked. They are not
implemented: they are **declared**, which is the only thing that tells work in the queue apart from
a renunciation nobody admitted to.

The tenth is an exception, and the exception is to be read rather than skipped. The **identity
federation conformance check** (`SEC-C8`) has no date that can be tied to anything, because its
object - conformance verified against the national digital identity - is not within the perimeter
of the first release and no dated milestone carries it. It therefore sits in the table as a
**comment block at the end**, with the reason and the document that establishes it, rather than as
a row with a plausible date: an unanchored date would look like a commitment without being one. It
is declared debt, not coverage.

**The threat model is traceable to the requirements and to the tests**: every relevant threat has at
least one requirement and at least one test associated with it
([01 §7](./01-modello-di-minaccia.md)). It is the same structure required by the
requirement-design-code-test traceability of the life cycle rules: **a single artefact serves both
purposes**, and it is also the format a tender committee knows how to read, because the national
procurement guidelines expressly recommend writing security requirements in a form that is
«clear, objective and as closed as possible», leaving as little room as possible for subjective
assessment. **A requirement → evidence → precise reference matrix, not descriptive prose.**

## 6. Coordinated disclosure

The project maintains a coordinated vulnerability disclosure policy, published in the dedicated
security file at the repository root, with: a dedicated contact channel; declared response and
remediation times per severity band; a commitment not to take action against anyone who reports in
good faith while complying with the policy; a procedure for identifier assignment where applicable.

Two further obligations that follow from the cyber resilience regulation:

- **public disclosure of information about fixed vulnerabilities**, once the update has been made
  available, by way of a published security advisory;
- **distribution of fixes without delay and free of charge**, through an authenticated channel.

And one obligation that follows from the national procurement guidelines and that must be adopted
because it is onerous and gets discovered late: the **monitoring of the publication of updates,
fixes and urgent patches** relating to the components used, with **assessment started by the day
following the release** and as a precondition for installation (requirement R45). That is the
deadline, and it is daily: it is met with automation, not with a person.

**The support period is declared for each major release, with an end date.** The regulation imposes
a minimum of **five years** on the manufacturer; a project that declares less makes its integrator
non-compliant. The decision on the actual period **belongs to the project owner** and is open as
question Q-155.

## 7. Classification of third-party components

Every third-party component is inventoried with: identity and version; **reason for inclusion**;
licence and compatibility regime; risk assessment; update criteria and cadence; **position relative
to the main path**; **moment of dependency**.

The last two columns are the ones that change the assessment, and they need explaining:

| Dimension | Values | Why it matters |
|---|---|---|
| **Moment of dependency** | Build · Runtime | A build dependency is not reachable at runtime: its vulnerability exposes the build chain, not the installation. A runtime dependency is inside the installation's perimeter |
| **Position** | Main path · Ancillary path · Can be switched off | A component on the main path is a single point of failure, and it becomes the subject of the second-level relevant supplier declaration (§3) |

**An exclusion criterion anchored to a fact, not to a suspicion.** An unmaintained component is not
excluded because it «looks abandoned»: it is excluded on the basis of the **date of the last
change** and the number of open reports, which are verifiable data, in application of the rules on
software of unknown provenance in the medical device software life cycle. The verification is
documented and dated.

### 7.1 The case of the external terminology service - the answer to question Q-04

Question Q-04 on the noticeboard asked for the external terminology service to be classified and
its compatibility with the sovereignty constraint to be verified. **The answer is closed by this
area and is reproduced here in full.**

> It is a **runtime** third-party component, not a build dependency: it falls within the supply
> chain requirements and within supplier due diligence. Three consequences:
>
> **(a)** it cannot sit on the **main path**. This is constraint V-03: the system is fully
> functional without the code system that requires an external service, and no main path may
> require it. The cost is declared - part of the codes of a binding will not be validated - and it
> is not a fallback: it is a mandatory corollary.
>
> **(b)** if established outside the Union, it is a **transfer** the moment it receives data
> referable to a patient. Therefore **the queries must never carry patient identifiers**, and
> **sovereignty is satisfied by absence of the datum, not by location**. This is constraint V-151.
> A query asking whether a code exists in a code system is not a transfer of personal data,
> wherever the service answers from. It also follows that a **cache persisted to disk** is
> forbidden, which would hold for the licensing reason alone: a persistent cache is an
> uninventoried archive.
>
> **(c)** it becomes a **second-level relevant supplier**, which the customer must declare by name
> to the authority together with the country of its registered office (§3).
>
> **The choice of the resolution point and of the gateway's contract remains with architecture.**

This is the reasoning model to be applied to **every** runtime third-party component, not an
isolated case: moment of dependency, position relative to the main path, nature of the data it
receives, effect on the customer's declaration.

## 8. Artefact signing, provenance and secure configuration

| Requirement | Content |
|---|---|
| **Signing of all distributed artefacts** | Images, packages, bill of materials, exploitability statement, security advisories. Signature verification is **documented as a mandatory step** of the installation, not as an option |
| **Verifiable provenance** | An attestation tying the artefact to the source code revision and to the pipeline run that produced it. It is what the integrating party's due diligence verifies |
| **Reproducible build** | A declared objective: anyone who wants to must be able to rebuild the artefact from source and obtain the same result. It is the only defence against a pipeline compromise that survives the signature |
| **Authenticated distribution channel** | For the artefacts and for the updates |
| **Secure-by-default configuration** | No default account active, no default credentials, no unnecessary service exposed. It is a requirement of Part I of Annex I of the regulation and of the secure configuration controls of the national minimum measures |
| **Documented reference configuration** for each component | With automated verification of the conformance of the default configuration to it, and **drift detection** in operation |
| **Restore to the reference configuration** | An exposed capability, not a manual procedure |
| **Environment and procedure for testing updates** | Before installation in production, in particular for non-standard components. It connects with the obligation to test functioning after every significant update laid down for telemedicine services |

## 9. What this area leaves open

| Reference | Question | To whom |
|---|---|---|
| Q-04 | **Closed by this area** with §7.1. The choice of the resolution point and of the gateway's contract remains with architecture | Architecture, for the residual part only |
| Q-151 | Verification against a primary source of the determination introducing the relevant supplier declaration obligation, of the codes required and of the precise content of the requirements of the baseline measures | Compliance |
| Q-155 | **Declared support period**, minimum five years: the project owner's decision. In the same question, the effect of monetisation on the manufacturer role | → Project owner |
| `[NV]` | Precise selection of the procurement vocabulary codes (§3) | Compliance, with a procurement adviser |
| Q-17 | The summary table of protocols in the protocols area is in effect a **starting inventory** of third-party components: it should be used as a base instead of being rebuilt | Technical, compliance |
