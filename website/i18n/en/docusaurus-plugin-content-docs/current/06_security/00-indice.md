---
title: Security — index and orientation
sidebar_position: 1
description: How the Telemedic security area is organised, what it contains and what it defers elsewhere, what its binding premises are, and how to read it depending on the role of whoever is consulting it.
---

# Security — index and orientation

> **This area is not a list of controls.** A list of controls is useful to someone who already
> has in mind the model that justifies them, and harmful to someone who does not, because it
> leads them to believe that applying the control is the same as obtaining the property. Here
> every control comes after the asset it protects, the adversary it protects it from, and the
> consequence — **clinical**, not merely technical — of its failure. Every control carries with
> it the source that requires it.

## 1. The premise: what this system is from a security standpoint

Telemedic is a software component that mediates a **healthcare act** between two people who are
not in the same place. Three facts follow from this that govern the whole area and that are not
negotiable.

**The first.** In this system there are no «non-sensitive» data sitting alongside sensitive ones.
The mere fact that a person has had a session with a specialist is **data concerning health**
within the meaning of Article 4(15) of Regulation (EU) 2016/679, before and independently of the
content of the session. A log that says «patient X had a session with professional Y on day Z»
reveals information about X's state of health even if it does not contain a single word of
clinical history. Session metadata are therefore a first-class protected asset, not a technical
by-product. The chapter [01 — Threat model](./01-modello-di-minaccia.md) starts from here.

**The second.** The primary adversary is not the external criminal: it is the **insider**.
Abuse of legitimately granted privileges — the user who holds the technical authorisation to
access a datum and uses it for a purpose extraneous to functional necessity — is a category
**expressly contemplated by the national cybersecurity authority** as an autonomous type of
significant incident for essential entities, and it is the category of the enforcement measures
issued by the data protection authority in the healthcare domain. A security architecture built
on the perimeter does not intercept this adversary, because this adversary is already inside the
perimeter and has the right credentials.

**The third.** The failure of a security control in this system produces **clinical
consequences**, not just a loss of confidentiality. A degraded session is a consultation that
was not completed. An altered audit log is the impossibility of establishing that an improper
access took place. A badly declared service window is a false reassurance, which is more
dangerous than a declared absence of service. The threat model of this area assesses
consequences on that scale, not on the scale of data loss alone.

## 2. What this area does not contain

This area **does not repeat the foundations**. Anyone unfamiliar with the underlying concepts
will find the full treatment in the foundations guide, and this area refers to it instead of
rewriting it:

| If you are not familiar with… | Read first |
|---|---|
| Confidentiality, integrity, availability, authenticity, non-repudiation, traceability: what they mean precisely and how they differ | [10 §12 — Cryptography and security, §1](../10_fondamenti/12-crittografia-e-sicurezza.md) |
| What a threat model is, what STRIDE, attack surface and trust boundary are | [10 §12 — Cryptography and security, §2](../10_fondamenti/12-crittografia-e-sicurezza.md) |
| Symmetric and asymmetric encryption, modes of operation, authenticated encryption, key management | [10 §12 — Cryptography and security, §§3-4](../10_fondamenti/12-crittografia-e-sicurezza.md) |
| Hash functions, HMAC, hash chains, digital signature, public key infrastructure, revocation, time-stamping | [10 §12 — Cryptography and security, §§5-6](../10_fondamenti/12-crittografia-e-sicurezza.md) |
| Authentication, authorisation, factors, session, roles and attributes, break-glass | [10 §12 — Cryptography and security, §8](../10_fondamenti/12-crittografia-e-sicurezza.md) |
| Why a video call is a hard problem: network traversal, signalling, relay, degradation | [10 §08 — WebRTC from scratch](../10_fondamenti/08-webrtc-da-zero.md) |
| Patient identifiers in Italy, professional identity, assigning authorities | [10 §04 — Identity and demographic registries](../10_fondamenti/04-identita-e-anagrafiche.md) |
| The regulatory framework in its entirety: medical devices, quality, life cycle | [10 §15 — Regulatory from scratch](../10_fondamenti/15-regolatorio-da-zero.md) |
| The protocols one by one: OAuth, PKCE, token exchange, HTTP message signatures, body digest | [10 §13 — The protocols](../10_fondamenti/13-protocolli.md) |

This area presupposes those modules. Where a concept already appears there, what appears here is
only its **specific form in this system**, and the difference is stated.

This area moreover **does not contain**:

- the certification path and the regulatory file, which live in `docs/08_compliance/`;
- the contract of the interfaces towards third parties, which lives in `docs/07_integration/`;
- the system architecture choices, which live in `docs/02_architecture/`, and towards which this
  area opens questions rather than deciding them;
- the scheduling, which lives in `docs/09_roadmap/`.

## 3. The ten chapters

| # | Chapter | What it answers |
|---|---|---|
| [01](./01-modello-di-minaccia.md) | **Threat model** | What is protected, from whom, with what clinical consequence if the protection gives way |
| [02](./02-identita-e-accessi.md) | **Identity and access** | Who is who, with what assurance, who may do what, and what happens when the assurance is reported by a third party instead of verified |
| [03](./03-protezione-dei-dati.md) | **Data protection** | Encryption in transit and at rest, keys and their rotation, the points where the datum is in the clear anyway, minimisation, retention and erasure |
| [04](./04-tracciamento.md) | **Audit trail** | The immutable log: what it is, what it is not, what it contains, what it must not contain, how long it is kept, how it is exported and how it is shown not to have been altered |
| [05](./05-sicurezza-del-tempo-reale.md) | **Real-time security** | The media: end-to-end encryption, key verification, relay, the mode with recording and what it obliges you to |
| [06](./06-sicurezza-applicativa.md) | **Application security** | Validation at the boundaries, sessions, headers, file upload, injections, object-level authorisation, rate limiting, single egress broker |
| [07](./07-catena-di-fornitura.md) | **Supply chain** | Bill of materials, exploitability statements, coordinated disclosure, artefact signing, classification of third-party components |
| [08](./08-quadro-normativo-e-misure.md) | **Regulatory framework and controls** | Which rules apply, to whom, by when, and how they combine when they conflict |
| [09](./09-ripartizione-delle-responsabilita.md) | **Allocation of responsibilities** | Control by control: what the project does, what the deployer does, what is shared |
| [10](./10-risposta-agli-incidenti.md) | **Incident response** | The four distinct clocks, which must not be confused, and the capabilities the product must provide so that the deployer can meet them |

## 4. Reading paths

**If you are an information security manager at a care provider organisation** and you have to
decide whether this product helps you or complicates your obligations: read
[08](./08-quadro-normativo-e-misure.md), then [09](./09-ripartizione-delle-responsabilita.md),
then [10](./10-risposta-agli-incidenti.md). In that order. Chapter 09 exists specifically to
stop you believing you are covered where you are not.

**If you are a data protection officer**: [01](./01-modello-di-minaccia.md),
[03](./03-protezione-dei-dati.md), [04](./04-tracciamento.md),
[05 §5](./05-sicurezza-del-tempo-reale.md) on the mode with recording.

**If you are a developer contributing to the project**:
[01](./01-modello-di-minaccia.md), [06](./06-sicurezza-applicativa.md),
[02](./02-identita-e-accessi.md), [07](./07-catena-di-fornitura.md).

**If you are an integrator** embedding Telemedic in your own product:
[02](./02-identita-e-accessi.md) — in particular the distinction between authentication performed
and authentication reported —, [06](./06-sicurezza-applicativa.md),
[07](./07-catena-di-fornitura.md), [09](./09-ripartizione-delle-responsabilita.md), and the
integration area for the contract of the interfaces.

**If you are evaluating a bid in a procurement procedure**: [09](./09-ripartizione-delle-responsabilita.md)
is the table to put next to the tender specification; [07](./07-catena-di-fornitura.md) contains
the artefacts that supplier due diligence requires.

## 5. Conventions of this area

**`[NV]` marking — not verified.** This area rigorously distinguishes three states: what a
primary source **establishes** (with the article or section cited), what is **established
practice**, and what is a **proposal of the project**. Whatever has not been verified against a
primary source carries the `[NV]` marking and an indication of who should be asked. **Nothing is
invented**, and in particular:

- **no cryptographic parameter is invented**. Where a key length, an algorithm or a validity
  period would be needed, this area refers to the European and national recommendations in force
  and marks `[NV]` whatever it has not read in the text itself. Chapter
  [03](./03-protezione-dei-dati.md) explains why this is a substantive choice and not editorial
  caution;
- **no vulnerability identifier is cited unless it has been read on the source that publishes
  it**. Chapter [05](./05-sicurezza-del-tempo-reale.md) describes the defects of the relay server
  by **mechanism and fix version** — which is the form that is useful to someone who has to decide
  the minimum version to deploy — and, for the individual identifiers, refers to the verification
  documented in `.telemedic/research/B3-verifica-coturn-webrtc.md`, carried out against a public
  vulnerability database and upstream project advisories. Identifiers change state and assessment
  over time: a document that hard-coded them would age worse than the description of the
  mechanism;
- **no individual requirement of the national authority's baseline security measures is quoted
  verbatim** before the detailed annexes have been read line by line. Chapter
  [08](./08-quadro-normativo-e-misure.md) cites the **codes** of the measures, which are public
  and verified, and marks `[NV]` the content of the individual requirements. This is question
  Q-151 on the inter-agent noticeboard.

**No secrets in the examples.** Every example of a configuration, token or key uses explicit
placeholders in the form `${NAME_OF_THE_VARIABLE}` or `<description>`. No example value is a
usable value. No personal data, not even invented in realistic form: the identifiers in the
examples are opaque.

**Diagrams in Mermaid**, code blocks with the language declared, cross-references with relative
links.

## 6. The constraints this area imposes on the others

The choices of this area that bind other areas are published on the inter-agent noticeboard and
reproduced here for convenience. An area that contradicts them must challenge them on the
noticeboard, not ignore them.

| # | Constraint | Where it is justified |
|---|---|---|
| **V-150** | The immutable audit trail and the application logs **contain no clinical content**; diagnostic logs carry no direct patient identifiers | [04 §3](./04-tracciamento.md) |
| **V-151** | The external terminology service **receives no patient identifiers**; no cache persisted to disk | [03 §6](./03-protezione-dei-dati.md), [07 §7](./07-catena-di-fornitura.md) |
| **V-152** | Retention: **24 months** for traceability logs, **12 months** for access and authentication data | [04 §5](./04-tracciamento.md) |
| **V-153** | **Emergency access is a functional requirement**: mandatory free-text justification, limited window and perimeter, notification, review with the outcome recorded | [02 §10](./02-identita-e-accessi.md) |
| **V-154** | An authentication level **reported by an integrator** must be marked as such and does **not** satisfy the strong authentication requirements under Article 64 of the CAD (Codice dell'Amministrazione Digitale, the Italian Digital Administration Code) | [02 §4](./02-identita-e-accessi.md) |
| **V-155** | No infrastructure metric of the relay may be labelled with the session identifier | [05 §7](./05-sicurezza-del-tempo-reale.md) |
| **V-156** | The project **does not declare** protocol versions or negotiated cipher suites: it **measures them per session and records them** | [03 §2](./03-protezione-dei-dati.md), [05 §2](./05-sicurezza-del-tempo-reale.md) |
| **V-157** | **Single egress broker**: no application component opens connections towards destinations derived from an inbound datum; egress is denied at network level to everything except the broker | [06 §8](./06-sicurezza-applicativa.md) |

And the constraints of others that this area adopts without arguing them: **V-04** (the immutable
audit trail is hash-chained and separately retained; entity versioning does not replace it),
**V-05** (the project is compliant and verifiable, **not accredited**), **V-06** (the project does
not affix the CE marking), **V-10** (relay server: minimum version 4.17.2 and outbound network
isolation as the primary defence), **V-11** (recording container negotiated at runtime), **V-12**
(no technical threshold is imposed by Italian legislation), **V-21** (no clinical content in
outbound messages), **V-22** (asymmetric signature of outbound messages), **V-25** (the level of
assurance propagated is the one required, not the one asserted).
