---
title: How to use this guide
sidebar_position: 1
description: A training guide that starts from nothing, for anyone who wants to contribute to Telemedic — the medical and healthcare context, the protocols, the computing and clinical knowledge.
---

# How to use this guide

Telemedic sits on the boundary between two worlds that speak different languages. Those
who come from computing know how to build a distributed system but do not know what
distinguishes a teleconsulto (specialist-to-specialist consultation) from a televisita
(remote consultation), nor why that distinction changes the data model. Those who come
from healthcare know what happens in a clinic but do not know why a video call across two
symmetric NATs requires a relay server.

This guide takes **nothing** about either of the two worlds for granted.

## What you will find here

### Block A · The healthcare and regulatory context

| Module | Content |
|---|---|
| [01 — The Italian healthcare system](01-sistema-sanitario-italiano.md) | How healthcare is organised in Italy, who does what, with what money and under what rules |
| [02 — Telemedicine services](02-prestazioni-di-telemedicina.md) | Televisita, teleconsulto, teleconsulenza, teleassistenza, telemonitoraggio: regulatory definitions, not commercial ones |
| [03 — The clinical datum](03-il-dato-clinico.md) | What health data is, why it is a special category, what processing it entails |
| [04 — Identity and demographic registries](04-identita-e-anagrafiche.md) | How a patient is identified and how a professional is identified |

### Block B · Standards, data and transport

| Module | Content |
|---|---|
| [05 — Interoperability standards](05-standard-di-interoperabilita.md) | Why they exist, who writes them, how they are read |
| [06 — FHIR from scratch](06-fhir-da-zero.md) | The standard the project's data model rests on |
| [07 — The health record and national infrastructures](07-fse-e-infrastrutture-nazionali.md) | Where documents end up and which intermediaries you deal with |
| [08 — WebRTC from scratch](08-webrtc-da-zero.md) | Why a video call is a hard problem |

### Block C · The clinical fundamentals

| Module | Content |
|---|---|
| [09 — The body, the vital signs, clinical reasoning](09-fondamenti-clinici.md) | Essential anatomy and physiology, vital signs and what they mean, how a clinician reasons, what is lost at a distance |
| [10 — Care pathways and patient safety](10-percorsi-di-cura-e-sicurezza.md) | Chronic conditions and care pathways, scales and scores, triage and red flags, clinical risk and use error |

### Block D · The computing fundamentals and the flows

| Module | Content |
|---|---|
| [11 — Computing fundamentals](11-fondamenti-informatici.md) | Distributed systems, data, concurrency, time, consistency: the theory that holds up the architecture |
| [12 — Cryptography and security](12-crittografia-e-sicurezza.md) | Encryption, signatures, PKI, hash chains, identity and authorisation: the theory before the measures |
| [13 — The protocols, one by one](13-protocolli.md) | A reasoned catalogue of every protocol the project speaks, with the reason for each |
| [14 — The functional flows](14-flussi-funzionali.md) | The end-to-end pathways, from booking to the health record, alerts and fallbacks included |

### Block E · The working framework

| Module | Content |
|---|---|
| [15 — The regulatory framework from scratch](15-regolatorio-da-zero.md) | Why the code of this project has constraints that do not exist elsewhere |
| [16 — The project architecture](16-architettura-del-progetto.md) | The mental map: where everything sits and why |
| [17 — The development environment](17-ambiente-di-sviluppo.md) | How to set the whole thing up, synthetic data included |
| [18 — What to know in order to contribute](18-contribuire-per-area.md) | Matrix of code area → knowledge required |
| [19 — Glossary](19-glossario.md) | Every acronym, every term, in Italian and in English |
| [20 — Primary sources](20-fonti-primarie.md) | Where to read the original texts, not the summaries |

**Block C** is the one that those arriving from computing are most tempted to skip, and it
is the one that pays off most: without knowing what an oxygen saturation measures and why
an isolated value means nothing, you write code that treats a vital sign like any other
number. **Block D** is the mirror image for those arriving from the clinical side.

## Reading paths

Nobody reads everything. Choose the path for your profile.

**Developer with no healthcare background** — 01, 02, 03, **09**, 04, then 11 to fix the
architectural vocabulary, then the module for the area you want to touch (06, 08, 12 or 13),
then 14 to see how it all fits together, and finally 18. Module 10 becomes mandatory if you
touch remote monitoring (telemonitoraggio) or alerts. The glossary (19) is consulted, not
read.

**Clinician or healthcare professional with no computing background** — 14 first, because
it describes pathways you recognise; then 05, 06 as far as the section on resources, 08 as
far as the section on quality, 16 and 19. Leave modules 09 and 10 for us to read: your job
is to tell us where we are wrong. Your most valuable contribution is on modules 02 and 03:
if you find an inaccuracy while reading them, opening an issue is worth more than ten lines
of code.

**Integrator who has to connect an existing system** — 02, 05, 06, 07, 13 and 14, then
`docs/07_integration/`. Modules 04 and 12 matter if the integration involves identity,
delegation between organisations or message signing.

**Anyone working on quality, compliance or regulatory affairs** — 02, 03, **10**, 15, then
`docs/08_compliance/`. Modules 12 and 14 explain, respectively, the technical measures to be
verified and the flows that risk management falls upon.

## The rules of this guide

1. **Every acronym is expanded at its first occurrence.** No exceptions, not even for the
   best known ones. Someone arriving from another country does not know what an ASL is.
2. **Every healthcare concept is explained to a computing person, and every computing
   concept to a clinician.** If an explanation presupposes the other world, that is a
   defect: report it.
3. **Every regulatory statement cites its source.** Article, subsection, decree, RFC,
   section of the standard. Summaries without a source age badly and are not verifiable.
4. **Whatever is not verified is declared as such.** «The decree establishes» and «it is
   common practice» are statements of a different nature and must be kept apart.
5. **No real data.** In this guide, in the code, in the tests, in the examples and in the
   screenshots, only synthetic data appears.

## Before contributing

This guide is a **declared prerequisite** of [`CONTRIBUTING.md`](https://github.com/fedcal/Telemedic/blob/main/CONTRIBUTING.md).
It is not a bureaucratic formality: a system that processes health data and that falls under
the medical device regime accumulates silent damage when it is modified by people who do not
know the context. Module [18](18-contribuire-per-area.md) says, area by area, what you need
to know before touching it.
