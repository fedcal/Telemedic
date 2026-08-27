---
title: "Document control procedure"
sidebar_position: 14
description: "The project's operational document control procedure: named list of documents subject to control with their status, rule for identification and versioning, nominated reviewer for each category, form of approval, rule for withdrawal. It is itself a controlled document and appears in its own list. It is not an explanatory chapter: it states who does what, when, and what trace remains."
---

# Document control procedure

> **What this document is.** It is a **procedure**, not a chapter. A chapter explains why something
> must be done; a procedure states **who does it, when, by which act, and what trace remains**.
> Whoever executes it need not have written it: if a line requires knowing what its author had in
> mind, that line is defective and must be reported.
>
> **Relationship with the explanatory chapter.** The reasoning, the reference standard, the
> allocation between the functions of the manufacturer and those of whoever installs, and - most
> important of all - the gap whereby author and approver coincide are set out in
> [08/10 - Document control](/08_compliance/10-controllo-dei-documenti.md). This procedure **refers
> to it and does not copy it**: two texts saying the same thing in two places diverge at the first
> update, and in regulatory matters a divergence is a double declaration. The four tools on which the
> approval record rests are **git** (distributed versioning), **GitHub** (hosting platform),
> **automated build checks** (linter, syntax, link checker, identifiers) and **cryptographic signing
> of commits** (adopted 26 August 2026, mandatory signing on branch pending); their **validation** is
> described at § 8 of chapter 10.
>
> **This document declares no conformance.** It does not state that the project conforms to ISO
> 13485 or to anything else. It cannot: the gap declared at § 10 prevents it, and that gap remains.

---

## 1. Procedure control sheet

| Item | Value |
|---|---|
| **Identifier** | The absolute path in the repository: [`docs/08_compliance/PROCEDURA-controllo-dei-documenti.md`](../08_compliance/PROCEDURA-controllo-dei-documenti.md). It is the identification rule of § 4, applied to this very document |
| **English twin** | [`website/i18n/en/docusaurus-plugin-content-docs/current/08_compliance/PROCEDURA-controllo-dei-documenti.md`](https://github.com/fedcal/Telemedic/blob/main/website/i18n/en/docusaurus-plugin-content-docs/current/08_compliance/PROCEDURA-controllo-dei-documenti.md). The two versions are **the same controlled document in two languages**, not two documents |
| **`QMS-*` identifier** | **None assigned.** The reason, which is a gap and not an oversight, is at § 10, item `c` |
| **Category** | Procedures of the quality management system the project operates on itself |
| **Version** | The hash of the commit that last modified the file, readable with `git log -1 --format=%H -- docs/08_compliance/PROCEDURA-controllo-dei-documenti.md`. **It is not transcribed into this field**: a hash written here would be false from the next commit onwards, and a version field that lies is worse than an absent one |
| **Nominated reviewer** | Federico Calò (`@fedcal`), by the `/docs/08_compliance/` line of [`.github/CODEOWNERS`](https://github.com/fedcal/Telemedic/blob/main/.github/CODEOWNERS) |
| **Who must approve it** | The **Sponsor**. This is not a choice made by this procedure: it is the owner of approval declared by `T-01` in [09/02 - The milestones](/09_roadmap/02-traguardi.md), which assigns production to the single contributor and approval of the procedure to the Sponsor |
| **Form of approval** | Favourable review ("Approved") on the change proposal introducing this file, per § 6 |
| **Date of approval** | **27 August 2026.** Approval of the declared gap without attenuation, recorded as the first item of [`Q-189`](../11_registri/02-questioni-aperte.md#q-189): author and approver coincide. The gap remains open |
| **Status** | **In force.** The document is approved by the Sponsor on 27 August 2026 with the declared gap, which remains open as the first item of [`Q-189`](../11_registri/02-questioni-aperte.md#q-189) |
| **Review** | Under the conditions of § 12 |

**How the "Status" field is read, and why it matters.** "Awaiting approval" does not mean "provisional
draft": it means the text is the one proposed to the Sponsor and that the missing act is approval,
not drafting. When approval occurs, **two** cells in this sheet change - the date and the status -
and one row at § 3, through the same change proposal that carries both. Whoever finds this field
still reading "awaiting" after approval has found a defect in the procedure, not a transcription
slip.

---

## 2. Purpose, perimeter and relationship with chapter 10

**Purpose.** To establish which documents in the repository are subject to control, how they are
identified and versioned, who reviews them, by which act they are approved and how they are
withdrawn. It is the procedure that criterion 1 of `T-01` requires, and the reason it exists as a
separate document is at § 8.

**What it governs.** The artefacts listed at § 3, in the **two languages** in which they exist. A
change that touches a controlled document and leaves its counterpart in the other language behind is
not a missing translation: it is a divergence between two texts declaring the same obligation, and it
has already happened twice in this repository.

**What it does not govern.** Application code, which does not yet exist; the quality management
system procedures of the manufacturing entity, which will be constituted and will write them in its
own document management system; issues and change proposals, whose immutability by construction
**is** their control; internal working documentation in `.telemedic/`.

**Relationship with [`V-174`](../11_registri/01-vincoli-in-vigore.md#v-174), which must be stated in full because it is the point where this
procedure and the rest of the corpus appear to contradict each other.** Constraint [`V-174`](../11_registri/01-vincoli-in-vigore.md#v-174),
instituted in [08/03 § 4.1](/08_compliance/03-sistema-di-gestione-della-qualita.md), states that
**no chapter** of this documentation is a quality management system procedure and that no area may
present one of its chapters as such: chapters are inputs, they hold the analysis from which a
procedure is written, not the procedure. **That constraint remains valid and is not amended by this
document**, because this document is not a chapter. It is an artefact of a different nature, placed
in the same folder for ease of reading and distinguished by its name: chapters carry an ordinal
number, this one carries the `PROCEDURA-` prefix. The practical consequence, which must be known
before modifying anything: the chapters of `docs/08_compliance/` remain explanatory and are
controlled documents **as public content**, not as procedures; this document is controlled **as a
procedure**, and § 8 states what follows from that.

---

## 3. List of documents subject to control

This table is **also the register of status** of controlled documents. Chapter 10, at § 2 point 4,
prescribes that the status (in force / withdrawn) be stated explicitly in a register and not inferred
from the absence of the file. That register, for documents, **did not exist**: `registro/` holds the
register of requirement identifiers and nothing else. The "Status" column below institutes it, and
§ 7 states how a withdrawal is written into it.

**Public documents at the repository root.** Each was verified present on disk before being listed.

| Document | Nominated reviewer | Status | When it is reviewed |
|---|---|---|---|
| [`README.md`](https://github.com/fedcal/Telemedic/blob/main/README.md) | `@fedcal` (line `*`) | In force | Every modification. It carries the prominent notice that criterion 8 of `T-01` requires realigned |
| [`NOT-A-MEDICAL-DEVICE.md`](https://github.com/fedcal/Telemedic/blob/main/NOT-A-MEDICAL-DEVICE.md) | `@fedcal` | In force | Every modification |
| [`DISTRIBUTION-POLICY.md`](https://github.com/fedcal/Telemedic/blob/main/DISTRIBUTION-POLICY.md) | `@fedcal` | In force | Every modification |
| [`CONTRIBUTING.md`](https://github.com/fedcal/Telemedic/blob/main/CONTRIBUTING.md) | `@fedcal` | In force | Every modification |
| [`GOVERNANCE.md`](https://github.com/fedcal/Telemedic/blob/main/GOVERNANCE.md) | `@fedcal` | In force | Every modification, with the fourteen-day comment period imposed by the document itself |
| [`SECURITY.md`](https://github.com/fedcal/Telemedic/blob/main/SECURITY.md) | `@fedcal` | In force | Every modification |
| [`SUPPORT.md`](https://github.com/fedcal/Telemedic/blob/main/SUPPORT.md) | `@fedcal` | In force | Every modification |
| [`CODE_OF_CONDUCT.md`](https://github.com/fedcal/Telemedic/blob/main/CODE_OF_CONDUCT.md) | `@fedcal` | In force | Every modification |
| [`THIRD-PARTY-TERMINOLOGY.md`](https://github.com/fedcal/Telemedic/blob/main/THIRD-PARTY-TERMINOLOGY.md) | `@fedcal` | In force | Every modification |
| [`publiccode.yml`](https://github.com/fedcal/Telemedic/blob/main/publiccode.yml) | `@fedcal` | In force | Every modification. Conformance entries remain `false` until the corresponding evidence is published and executed |
| [`LICENSE`](https://github.com/fedcal/Telemedic/blob/main/LICENSE) | `@fedcal` | In force | **Not modified.** It is the Apache-2.0 text verbatim; a change to its content is a defect, and a change of licence is a decision to be recorded as such, not a modification of this file |
| [`NOTICE`](https://github.com/fedcal/Telemedic/blob/main/NOTICE) | `@fedcal` | In force | Every modification. It is required by section 4(d) of Apache-2.0 and every redistribution must carry its contents |
| [`.github/CODEOWNERS`](https://github.com/fedcal/Telemedic/blob/main/.github/CODEOWNERS) | `@fedcal` | In force | Every modification, and mandatorily upon the arrival of a second maintainer. **It is the only place in the repository where reviewers are named**: were it not controlled, the nomination of reviewers would not be controlled |
| [`VERIFICA-DELL-ARTEFATTO.md`](https://github.com/fedcal/Telemedic/blob/main/VERIFICA-DELL-ARTEFATTO.md) | `@fedcal` | In force | Every change. It is the verification procedure for whoever installs, required by criterion 8 of `T-03`: if the way artefacts are signed changes, it changes here |
| [`.gitleaks.toml`](https://github.com/fedcal/Telemedic/blob/main/.gitleaks.toml) | `@fedcal` | In force | Every change, **and every entry added to the allowlist is a weakening of `G1`**: it must be justified in the file itself, entry by entry, because one more line here is a form of secret the check stops seeing |

The eight bilingual documents at the root - the three public warnings and the five other `D51`
statements - are **bilingual within a single file**, with the Italian block, a separator and the
English block. There are no separate `.en.md` files and there must not be: two files would mean two
texts diverging silently exactly where divergence costs most.

**This procedure.**

| Document | Nominated reviewer | Status | When it is reviewed |
|---|---|---|---|
| [`docs/08_compliance/PROCEDURA-controllo-dei-documenti.md`](../08_compliance/PROCEDURA-controllo-dei-documenti.md) and its English twin | `@fedcal` | **In force** | Under the conditions of § 12 |

**Published documentation.** Every area appears in full, **in both languages**. The English version
of a controlled document is the same controlled document, not an accessory artefact: it resides in
`website/i18n/en/docusaurus-plugin-content-docs/current/<area>/` with **path and name identical** to
the Italian original, and this is the condition for the site to recognise it as a translation instead
of publishing it as an orphan page.

| Area | Nominated reviewer | Status | When it is reviewed |
|---|---|---|---|
| `docs/00_overview/` | `@fedcal` (line `*`) | In force | Upon completion of a milestone that modifies what the project declares itself to be |
| `docs/01_technical/` | `@fedcal` | In force | Upon completion of a milestone that modifies technical decisions |
| `docs/02_architecture/` | `@fedcal` | In force | Upon completion of a milestone that modifies architectural decisions |
| `docs/03_functional/` | `@fedcal` | In force | Upon completion of a milestone that modifies the functional perimeter |
| `docs/04_protocols/` | `@fedcal` | In force | Upon completion of a milestone that modifies interfaces or conformance evidence |
| `docs/05_domain/` | `@fedcal` | In force | Upon completion of a module that modifies the ubiquitous language |
| `docs/06_security/` | `@fedcal` | In force | Upon completion of a milestone that modifies the threat model or the measures |
| `docs/07_integration/` | `@fedcal` | In force | Upon completion of a milestone that modifies the contract towards third parties |
| `docs/08_compliance/` | `@fedcal` | In force | Upon completion of a milestone that modifies the regulatory perimeter |
| `docs/09_roadmap/` | `@fedcal` | In force | At every change of milestone, criterion, date or risk |
| `docs/10_fondamenti/` | `@fedcal` | In force | Upon completion of a module that modifies the language or the frame of reference |
| `docs/adr/` | `@fedcal` | In force | Upon completion of a decision |

**Registers and the chain of checks.**

| Artefact | Nominated reviewer | Status | When it is reviewed |
|---|---|---|---|
| [`registro/identificativi-requisiti.tsv`](https://github.com/fedcal/Telemedic/blob/main/registro/identificativi-requisiti.tsv) and [`registro/README.md`](https://github.com/fedcal/Telemedic/blob/main/registro/README.md) | `@fedcal` | In force | At every recorded event. The file is **append only**: no existing row is modified, not even to correct a transcription error |
| `scripts/`, `pipeline/`, `.github/workflows/` | `@fedcal` | In force | At every modification of a check, of its placement or of its test case. They are configuration items before they are documents: the rule governing them is that a check nobody has seen fail is not a check |

**What stays outside, and why.**

- Issues and change proposals on GitHub: tracked, versioned and immutable by construction.
  Immutability **is** the control, and adding another would add nothing.
- Internal working documentation in `.telemedic/`: briefs, the inter-agent noticeboard, session
  logs, research. It is not published and declares no obligation towards anyone.
- [`CLAUDE.md`](https://github.com/fedcal/Telemedic/blob/main/CLAUDE.md): operating instructions for whoever works in the repository. **The tension must be
  stated rather than settled by fiat**: that file sets out the project's non-negotiable rules, which
  also appear in [`CONTRIBUTING.md`](https://github.com/fedcal/Telemedic/blob/main/CONTRIBUTING.md), which is controlled. A divergence between the two would be caught
  by nothing. It is recorded at § 10, item `h`.
- `.editorconfig`, `.gitignore` and the site configuration: they declare no obligation and contain no
  normative statement.

A `CHANGELOG.md` file **does not exist** in this repository, verified as of today. Chapter 10 lists
it among the uncontrolled documents: the list is correct in substance and cites a non-existent
artefact.

---

## 4. Rule for identification and versioning

This is the rule of chapter 10, §§ 2 and 3, made executable. It is not a new rule.

**Identification.** A controlled document is identified by its **absolute path in the repository**.
Four operational obligations follow:

1. **No two controlled documents share a path**, and a path is not reused after a withdrawal. A path
   freed by a withdrawal stays free.
2. **The English twin carries an identical path and name** under
   `website/i18n/en/docusaurus-plugin-content-docs/current/`. Translating the file name produces an
   orphan page: the site publishes it under `/en/` whilst the real page keeps showing Italian, and
   nobody notices from the Italian side because a file nobody looks for is missed by nobody. This has
   already happened with three files of `docs/09_roadmap/`.
3. **A citation of a controlled document carries the path**, and also the commit hash where it is
   needed to disambiguate a historical version. A reference with neither is incomplete.
4. **The form of the reference is not indifferent.** Between documentation documents the absolute
   form `](/area/file.md)` is used, which resolves identically in both languages; the relative form
   does not resolve in translated files. Towards files at the repository root the absolute GitHub URL
   is used: a relative path leaving `docs/` works on GitHub and produces a silent 404 on the
   published site.

**Versioning.** The version of a document is the **hash of the commit** in which it was last
modified. There is no version number written inside the document, and there must not be: it would be
a second place where the same information can diverge from the first.

From this choice follows what must be known before saying "which version was approved":

- The history is immutable without trace: every modification produces a new hash.
- The date and author of every modification are in the commit itself, not in a field somebody
  updates.
- The commit message declares the **type, scope and description** of the modification, and is the
  answer to the question "what went into this version". It cannot be altered after the merge.
- A distributed release carries its own version number and **cites the commit hash** it corresponds
  to: that is how one traces back from the distributed version to the exact version of every document
  it contains.

**Identifiers of regulatory documents.** The spaces `MDR-*`, `QMS-*`, `SW-*`, `RM-*`, `UE-*`, `CE-*`,
`PMS-*`, `ON-*` are declared and frozen in
[08/03 § 5](/08_compliance/03-sistema-di-gestione-della-qualita.md) and hold as constraint [`V-172`](../11_registri/01-vincoli-in-vigore.md#v-172):
no area coins an identifier there without declaring it. They are neither renumbered nor reused after
a withdrawal. The same holds for requirement identifiers, frozen by [`V-120`](../11_registri/01-vincoli-in-vigore.md#v-120) and recorded in
[`registro/identificativi-requisiti.tsv`](https://github.com/fedcal/Telemedic/blob/main/registro/identificativi-requisiti.tsv).

---

## 5. Reviewers nominated by category

**The nominated reviewer for every category is Federico Calò (`@fedcal`).** There is no second name
to write, and writing one would be an invention.

This sentence deserves to be justified rather than asserted, because the criterion requiring it
speaks of "nominated reviewers" in the plural and because chapter 10, at § 4, presents a table whose
column is headed "Nominated reviewer" and holds **functions** - "Sponsor", "Area author", "Domain
architect", and for architectural decisions a "Technical reviewer designated in the decision", that
is, a reviewer still to be designated. A function is not a nomination: it is the description of the
place a name ought to occupy. The only place in the repository where reviewers are named is
[`.github/CODEOWNERS`](https://github.com/fedcal/Telemedic/blob/main/.github/CODEOWNERS), and every
line of it assigns `@fedcal`, because the project has a single maintainer
([`GOVERNANCE.md`](https://github.com/fedcal/Telemedic/blob/main/GOVERNANCE.md), "Current state").

| Category | Nominated reviewer | `CODEOWNERS` line assigning it | Required competence |
|---|---|---|---|
| Public statements and warnings | Federico Calò (`@fedcal`) | `/NOT-A-MEDICAL-DEVICE.md`, `/DISTRIBUTION-POLICY.md`, `/THIRD-PARTY-TERMINOLOGY.md`, `/publiccode.yml`, `/CONTRIBUTING.md`, `/CODE_OF_CONDUCT.md`, `/GOVERNANCE.md`; [`README.md`](https://github.com/fedcal/Telemedic/blob/main/README.md), [`SUPPORT.md`](https://github.com/fedcal/Telemedic/blob/main/SUPPORT.md), `LICENSE` and `NOTICE` through the fallback line `*` | Authority over the public representation of the project and over regulatory warnings |
| Regulatory specifications | Federico Calò (`@fedcal`) | `/docs/08_compliance/` | Knowledge of the applicable standard and ability to map it onto the technical solution |
| Security | Federico Calò (`@fedcal`) | `/docs/06_security/`, `/SECURITY.md` | Threat model, identity, data protection, incident response |
| Requirements and milestones | Federico Calò (`@fedcal`) | `/docs/03_functional/`, `/docs/09_roadmap/` | Intended purpose, functional perimeter, planning and declared capacity |
| Architecture, domain and decisions | Federico Calò (`@fedcal`) | `/docs/02_architecture/`, `/docs/05_domain/`, `/docs/adr/` | Architecture, bounded contexts, ubiquitous language |
| Protocols and integration | Federico Calò (`@fedcal`) | `/docs/04_protocols/`, `/docs/07_integration/` | FHIR, clinical documents, IHE, contract towards third parties |
| Technical, release and chain of checks | Federico Calò (`@fedcal`) | `/docs/01_technical/`, `/pipeline/`, `/scripts/`, `/.github/workflows/` | Build chain, configuration management, evidence that checks fail |
| Foundations | Federico Calò (`@fedcal`) | `/docs/10_fondamenti/` | Healthcare context, standards, regulatory framework |
| Documentation site | Federico Calò (`@fedcal`) | `/website/` | Site build, divergence between languages |
| Overview | Federico Calò (`@fedcal`) | Fallback line `*`; **`CODEOWNERS` has no dedicated line for `/docs/00_overview/`** | Coherence between what the project declares itself to be and what the other areas describe |
| This procedure | Federico Calò (`@fedcal`) | `/docs/08_compliance/` | The rules of the present document |

**The consequence, stated and not attenuated.** That the nominated reviewer coincides, for every
category, with the only person who drafts **is precisely the gap** described in
[08/10 § 9](/08_compliance/10-controllo-dei-documenti.md), the first item of [`Q-189`](../11_registri/02-questioni-aperte.md#q-189). This procedure
does not resolve it and does not pretend to: it makes it **named rather than abstract**, because a
reviewer with a name is a reviewer of whom one can say what they could not do. It is not said that
the drafting is of poor quality; it is said that no third party establishes that it is not.

**The competence dossier does not exist.** The form in which ISO 13485 § 6.2 asks for a reviewer's
competence to be documented is a dossier for each of them, and there is no file in the repository
holding one. The competence declared in the rightmost column is therefore **asserted by this document
and not evidenced by a record**. The circumstance is already stated in
[08/10 § 4](/08_compliance/10-controllo-dei-documenti.md) and counts as a gap, not as conformance.

**What changes when a second maintainer arrives**, and it must be written now because that is the
moment a procedure written for a single reviewer becomes dangerous:
[`.github/CODEOWNERS`](https://github.com/fedcal/Telemedic/blob/main/.github/CODEOWNERS) is updated,
this table is updated, `require_code_owner_reviews` is reconsidered per § 6, and the [`GOVERNANCE.md`](https://github.com/fedcal/Telemedic/blob/main/GOVERNANCE.md)
rule requiring approval from a maintainer other than the author becomes applicable again **without
any new decision being needed**.

---

## 6. Form of approval

Approval of a controlled document is a **favourable review ("Approved") on a change proposal**. There
is no signed form and no separate approval register: the record is the git history and the sequence
of events on GitHub. The reasoning on why this form is stronger than a signature on a form -
immutability, granularity, traceability, distribution - is in
[08/10 § 7](/08_compliance/10-controllo-dei-documenti.md) and is not repeated here.

**What must be evidenced, for every approval.** Five elements, and whoever verifies looks for them in
five different places:

| Element | Where it is found |
|---|---|
| Identity of the reviewer | GitHub profile of whoever left the favourable review |
| Exact text approved | Content of the proposal at the moment of approval, reconstructible from the cited commit |
| Date and time | Timestamp of the review, assigned by the server |
| Merge commit | Hash calculated from the content, immutable and unique |
| Statement of modification | Commit message on the main branch, not alterable after the merge |

**What the machine enforces, and what only this procedure prescribes.** The distinction is not a
nuance: it is the difference between a control and a good intention, and it must be held firm every
time somebody asks "and who guarantees that?".

- **The machine enforces one favourable review** on every proposal before merging. Protection of the
  `main` branch has been in force since 26 August 2026, and without that review the merge is blocked
  for anyone who is not an administrator of the repository.
- **The machine does not enforce that the review come from the reviewer nominated for the category.**
  The `require_code_owner_reviews` setting is deliberately `false` - measured on 26 August 2026 - and
  [`.github/CODEOWNERS`](https://github.com/fedcal/Telemedic/blob/main/.github/CODEOWNERS) gives the
  reason: with a single maintainer, setting it to `true` would make every proposal impossible to
  merge without the administrator bypass, that is, it would make mandatory the very act it should
  prevent. An impossible gate is not a gate: it is a gate somebody will circumvent.
- **The machine does not apply to administrators.** The repository owner may approve themselves and
  merge their own work. This is declared, not concealed, and it is the technical form of the gap at
  § 10, item `a`.
- **This procedure prescribes** that the review come from the reviewer nominated for the document's
  category. Today the prescription is satisfied by construction, because there is only one nominated
  reviewer; tomorrow, with two maintainers, it will be a prescription **resting on discipline** until
  `require_code_owner_reviews` is reconsidered, and an approval given by the wrong person would be
  accepted by the system without any warning.

**The [`GOVERNANCE.md`](https://github.com/fedcal/Telemedic/blob/main/GOVERNANCE.md) rule, and why it is not applicable today.**
[`GOVERNANCE.md`](https://github.com/fedcal/Telemedic/blob/main/GOVERNANCE.md), "How changes land",
requires approval from **at least one maintainer other than the author**. Under the capacity declared
by `D54` that rule cannot be met by anyone: there is one maintainer, and a set of one contains no
element other than the author. The rule **is not suspended and is not amended**: it is inapplicable
by a condition of fact, and becomes binding again the very moment a second maintainer arrives,
without anyone having to decide anew. Until then the approval this procedure records is the author's
own approval of themselves, declared as such.

**Form of the commit message.** Type (`feat`, `fix`, `refactor`, `docs`, `test`, `chore`, `perf`,
`ci`), scope (which area, which document), concise description in Italian. Every commit carries the
`Signed-off-by` of the Developer Certificate of Origin. The message is a mandatory part of the
record: it is where whoever verifies finds the answer to "what went in".

---

## 7. Rule for withdrawal

A controlled document is withdrawn - brought to a state that excludes it from current acts - for
three reasons, and for no other:

1. **Abrogation.** The document exhausts its purpose, is replaced by a new version, or falls because
   the requirement justifying it has been discarded.
2. **Grave regulatory error.** The document contains a statement that, verified against the primary
   text, proves false. It is withdrawn, corrected, republished as a new version.
3. **Temporal exhaustion.** A draft or internal plan expires when the milestone it was tied to is
   closed.

**How a withdrawal is executed.**

1. A change proposal is opened that **declares the withdrawal in the commit message**, citing which
   of the three reasons applies.
2. The proposal receives the favourable review of the reviewer nominated for the category of the
   withdrawn document, per § 6.
3. The "Status" cell of the corresponding row in the table at § 3 is set to `Withdrawn`, adding the
   date and the reason. **If the document has no row in that table it is not a controlled document
   and this procedure does not govern it**: it is added first, then withdrawn.
4. The same withdrawal is applied to the **twin in the other language**, in the same change proposal.
   A withdrawal carried out in one language only is not a withdrawal: it is a divergence.
5. **The file is not deleted from version control.** Withdrawal is a change of status, not a
   disappearance: a deleted document cannot be withdrawn afterwards and its history becomes
   irrecoverable for whoever will look for it.

**Prohibition of reuse.** A withdrawn requirement identifier or document path is **never reused**. If
later work addresses the same subject, it receives a new identifier and a new path. The reason is the
only one that counts: whoever consults an old release and sees an identifier must not be misled by a
reassignment that happened afterwards.

---

## 8. This procedure is under its own control

**It is the clause for which this document exists.** Criterion 1 of `T-01` does not merely ask that a
document control procedure exist: it asks that the procedure be versioned in the repository **and be
itself under control**. A document that prescribes a control and exempts itself from it is not a
procedure: it is an opinion with an authoritative title, and its exemption is the first place from
which erosion begins.

That this document is under its own control means four things, all verifiable without believing this
sentence:

1. **It appears in its own list.** The row is at § 3, in the "This procedure" table, in the same
   format as every other row and with the current status.
2. **It has a nominated reviewer.** It is at § 5, last row: Federico Calò (`@fedcal`), by the
   `/docs/08_compliance/` line of `CODEOWNERS`. The same reviewer, and the same gap, as every other
   document in the category.
3. **Its own version is read by the rule of § 4**, that is, from the commit hash, and not from a
   number written inside the text.
4. **It is withdrawn by the rule of § 7.** If one day a better procedure replaces it, this one is not
   deleted: its row at § 3 is set to `Withdrawn`, with the date and the reason, in both languages.

What this clause does **not** produce must also be stated. It does not produce independence: whoever
approves this procedure is the same person who proposed it, and no self-referential clause can create
a second reviewer. The gap remains entire and is at § 10.

---

## 9. Execution: the sequence of steps

This is the procedure to execute in order to modify a controlled document. It holds for whoever did
not write it.

1. **Establish whether the document is controlled.** Look it up in the table at § 3. If it is not
   there, either the change is one this procedure does not govern, or the document ought to have been
   listed and was not: in the second case the row is added **in the same proposal**, and approved
   together with the change.
2. **Identify the nominated reviewer.** Read the category at § 5 and verify the corresponding line in
   `CODEOWNERS`. If the two sources diverge, **the divergence is reported before proceeding**: it is
   a defect in the nomination, not a detail to be worked around by picking the more convenient
   source.
3. **Work on a dedicated branch off `main`.** Nobody writes directly to the main branch, owner
   included.
4. **Modify both languages in the same act.** A controlled document that exists in English is
   modified in both versions within the same proposal. The structure of second-level headings must
   remain the same in both languages, and the anchors of cross-references are derived from the
   heading of the target document **in the language of that document**: an anchor derived from the
   Italian heading does not exist on the English page.
5. **Open the change proposal** filling in the template. The commit message carries type, scope,
   description and `Signed-off-by`.
6. **Wait for the automated checks.** They are blocking: if they fail, the proposal does not proceed.
   A check that fails wrongly is fixed, not bypassed.
7. **Obtain the favourable review** of the nominated reviewer, per § 6.
8. **Merge into the main branch.** Branch protection prevents merging without at least one favourable
   review. The document comes into force upon the merge, because the site and the distributed
   artefacts are generated from the current version of `main`.
9. **If the change is a withdrawal**, execute § 7 instead of this list from step 4 onwards.

**The accelerated cycle.** Within 48 hours of discovering a grave regulatory error, the nominated
reviewer may approve and merge the correction without waiting for the ordinary cycle, provided the
commit is marked `fix` and the reason is written in the message. It is not a way to bypass control:
it is the way not to leave a false statement on a regulatory matter online. It presupposes that the
reviewer is available, which under `D54` nothing guarantees.

---

## 10. Declared gaps

This procedure is executable and incomplete, and the two are not mutually exclusive. What is missing
is listed here instead of being left to be inferred from a silence.

| | Gap | Status |
|---|---|---|
| `a` | **Author and approver coincide.** Under `D54` whoever drafts is whoever approves, and the control that only independence guarantees does not exist. It is not resolvable with more hours: it takes a second person. The full text is in [08/10 § 9](/08_compliance/10-controllo-dei-documenti.md) | First item of [`Q-189`](../11_registri/02-questioni-aperte.md#q-189). **Declared gap, not conformance** |
| `b` | **The reviewers' competence dossier does not exist.** The competence declared at § 5 is asserted, not evidenced by a record | Stated in [08/10 § 4](/08_compliance/10-controllo-dei-documenti.md). Tied to the constitution of the manufacturing entity (`T-14`) |
| `c` | **No `QMS-*` identifier is assigned to this procedure.** The space is frozen by [`V-172`](../11_registri/01-vincoli-in-vigore.md#v-172), which requires every coined identifier to be declared on the noticeboard; coining one here without that declaration would breach the very constraint this procedure should enforce. Identification therefore remains the absolute path, per § 4 | Open. To be closed by the declaration, not by unilateral assignment |
| `d` | **The correspondence between actual reviewer and nominated reviewer is not enforced.** `require_code_owner_reviews` is `false` for the reason given at § 6 | Stated. To be reconsidered upon the arrival of the second maintainer, not before |
| `e` | **Mandatory cryptographic signing on the branch is not in force.** Local configuration has been adopted since 26 August 2026; the obligation on the branch awaits the upload of the public key. `Signed-off-by` remains mandatory and active | [`Q-284`](../11_registri/02-questioni-aperte.md#q-284), with a declared trigger and no date |
| `f` | **The tools on which the approval record rests have not been formally validated.** Until validation exists, the checks are assertions of functioning and not proofs. **`[NV]`** - validation is a prerequisite of criteria 5 and 7 of `T-01` and of `T-03`, to be done by `TECH` |  |
| `g` | **Documents produced before this procedure have not been reissued under control.** The volume to reissue grows every day | Declared gap, not planned. It is the reason `T-01` is the first milestone |
| `h` | **No automated check verifies that the list at § 3 matches the files that actually exist.** A document added at the root and not listed here would stay outside control with nothing to signal it; the same holds for a divergence between [`CLAUDE.md`](https://github.com/fedcal/Telemedic/blob/main/CLAUDE.md) and [`CONTRIBUTING.md`](https://github.com/fedcal/Telemedic/blob/main/CONTRIBUTING.md). A table asserting a fact about the repository must be compared with the repository, and today the comparison is manual | Declared debt. It is the easiest gap to close and the easiest to forget |
| `i` | **The procedure is approved on 27 August 2026.** The status is at § 1 and in the row at § 3. The gap referred to in item `a` is not closed by the approval | Approval recorded, declared gap not attenuated |

---

## 11. Divergences established and not resolved by this procedure

They were found by reading the existing documents whilst this procedure was being written. They are
recorded here so that whoever meets them knows they are known, and because the choice between
aligning the corpus and amending the rule does not belong to whoever drafts.

1. **The list in chapter 10, § 1, is incomplete.** Among public statements it cites three files out
   of thirteen: missing are [`README.md`](https://github.com/fedcal/Telemedic/blob/main/README.md), [`GOVERNANCE.md`](https://github.com/fedcal/Telemedic/blob/main/GOVERNANCE.md), [`SECURITY.md`](https://github.com/fedcal/Telemedic/blob/main/SECURITY.md), [`SUPPORT.md`](https://github.com/fedcal/Telemedic/blob/main/SUPPORT.md),
   [`THIRD-PARTY-TERMINOLOGY.md`](https://github.com/fedcal/Telemedic/blob/main/THIRD-PARTY-TERMINOLOGY.md), [`CODE_OF_CONDUCT.md`](https://github.com/fedcal/Telemedic/blob/main/CODE_OF_CONDUCT.md), [`publiccode.yml`](https://github.com/fedcal/Telemedic/blob/main/publiccode.yml), `LICENSE`, `NOTICE` and
   `.github/CODEOWNERS`. Section 3 of this procedure lists them all. The divergence is **remedied in
   the operational list and not in the chapter**, which stands as it is.
2. **Three documentation areas do not appear in the list in chapter 10**: `docs/00_overview/`,
   `docs/06_security/` and `docs/07_integration/`. The last two have their own line in `CODEOWNERS`
   and are areas whose full translation the project requires: they were not out of perimeter, they
   were omitted.
3. **The English versions do not appear in the list in chapter 10.** A controlled document that
   exists in two languages is controlled in two languages; the chapter lists only the Italian paths.
4. **`CODEOWNERS` has no line for `/docs/00_overview/`**, which therefore falls to the fallback line
   `*`. This is not a grave defect whilst there is a single owner; it becomes one when there are two.
5. **The "Nominated reviewer" column of chapter 10, § 4, holds functions and not names**, and one of
   its rows refers to a reviewer still to be designated. Section 5 of this procedure replaces those
   functions with the only name the repository knows.
6. **Chapter 10, § 2 point 4, postulates a register of document status that did not exist.**
   `registro/` holds only the register of requirement identifiers. The table at § 3 of this procedure
   is that register, and this is why it carries a "Status" column.
7. **[`GOVERNANCE.md`](https://github.com/fedcal/Telemedic/blob/main/GOVERNANCE.md) prescribes a rule that under `D54` nobody can observe.** Addressed at § 6.
8. **Chapter 10 lists `CHANGELOG.md` among the uncontrolled documents, and that file does not
   exist.**
9. **[`V-174`](../11_registri/01-vincoli-in-vigore.md#v-174) and criterion 1 of `T-01` touch each other.** The constraint states that this
   documentation is not a controlled document; the criterion requires a procedure that is one. The
   composition is at § 2: [`V-174`](../11_registri/01-vincoli-in-vigore.md#v-174) holds for the **chapters**, which remain explanatory; this
   procedure is not a chapter. The composition is declared, not hidden in a rewording.

---

## 12. Review of this procedure

This procedure is reviewed on four occasions, and on none of them is the review optional:

1. **When the set of controlled documents changes.** A new file at the root, a new documentation
   area, a new register: the row is added here, in the same change proposal that introduces the
   artefact.
2. **When the set of maintainers changes.** It is the most important review, because it is the moment
   a procedure written for a single reviewer ceases to be adequate: § 5, `CODEOWNERS`, the
   `require_code_owner_reviews` setting and gaps `a` and `d` of § 10 are all updated.
3. **When a gap at § 10 closes.** The row is removed and it is stated what closed it. A gap that
   disappears with nothing saying how it was closed is a worse defect than the gap.
4. **Every six months in any case**, together with the review of access and delegations for control
   of the main branch, which [08/10 § 10](/08_compliance/10-controllo-dei-documenti.md) prescribes at
   the same cadence. It is the point at which an informal expansion of capacity risks becoming
   permanent without anyone having decided it.

Every review is a change proposal on this file and follows § 9, including the step requiring both
languages to be touched in the same act.
