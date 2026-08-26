---
title: Document control
sidebar_position: 11
description: "The project's document control procedure: list of documents subject to control, rules for identification and versioning, reviewers by category, form of approval, rule for withdrawal. How correspondence between review, reviewer and approval constitutes the approval record in the 'documents as code' model, and which tools it relies on. The explicit and unattenuated gap: author and approver coincide, and this is a declared gap of T-01 Q-189."
---

# Document control

> **Reading premise.** What a quality management system is, what ISO 13485 § 4.2.4 is, what
> 'document control' means and what the allocation is between the functions of a manufacturer and
> those of whoever installs is explained from scratch in
> [10 § 15 - The regulatory framework from scratch](/10_fondamenti/15-regolatorio-da-zero.md).
>
> **What has changed with `D58`.** This chapter reports the quality management system that the
> project operates on itself, because without it the material it produces would not be usable in any
> certification path. With `D58`, it also describes the system that the manufacturing entity **to
> be constituted** will have to institute. The allocation between the two is stated in the relevant
> sections. The constitution of the entity is an internal prerequisite with its own timeline
> ([09 § 4.2](./09-percorso-e-calendario.md), `T-14`), not a waiting state: every week in which it
> is not started is a week the project subtracts from its own certification path.
>
> **Is this chapter a procedure?** No. It is the definition of the procedure itself, the
> documentation of how it is applied and the perimeter of what it applies to - held within the
> present repository. The operating procedures of the quality management system, when written by
> the manufacturing entity, will be controlled documents within this procedure and will reside in
> its own document management system, in accordance with ISO 13485 § 4.2.4. Until the entity
> exists, this documentation is an input for its creation, and is not itself subject to the
> controls it describes (`V-174`).

---

## 1. Perimeter

Document control under ISO 13485 § 4.2.4 governs the approval, release, distribution and
withdrawal of documents that have regulatory relevance. In this project, which publishes source
code and documentation as versioned artefacts in the repository, the perimeter is:

**Documents subject to formal control:**

| Category | Documents | Frequency of review | Context |
|---|---|---|---|
| **Public statements** | [`NOT-A-MEDICAL-DEVICE.md`](https://github.com/fedcal/Telemedic/blob/main/NOT-A-MEDICAL-DEVICE.md) · [`DISTRIBUTION-POLICY.md`](https://github.com/fedcal/Telemedic/blob/main/DISTRIBUTION-POLICY.md) · [`CONTRIBUTING.md`](https://github.com/fedcal/Telemedic/blob/main/CONTRIBUTING.md) | Every modification | Legal and contractual foundations |
| **Public regulatory specifications** | Every chapter of `docs/08_compliance/` | Upon completion of a milestone that modifies the regulatory perimeter | Regulatory obligations towards the manufacturer, the future manufacturer, and whoever installs |
| **Requirements and milestones** | `docs/03_functional/` · `docs/09_roadmap/` | Upon completion of a milestone that modifies the functional perimeter | Prerequisites of design |
| **Architecture and lifecycle** | `docs/02_architecture/` · `docs/01_technical/` · `docs/04_protocols/` | Upon completion of a milestone that modifies architectural decisions | Foundations of design and implementation |
| **Domain model and language** | `docs/05_domain/` · `docs/10_fondamenti/` | Upon completion of a module that modifies the ubiquitous language | Control of terminology and conceptualisation |
| **Register of identifiers** | Register of requirement identifiers (`RF-*`, `RNF-*`, `BR-*`, `ATT-*`, `UC-*`, `OUT-*`, `EX-*`, `DM-*`) | At every change of state (in force / withdrawn) | Criteria 3 and 4 of `T-01` |
| **Architectural decisions** | `docs/adr/` | Upon completion of a decision | Traceability of choices that govern the system |

**Documents not subject to formal control under this procedure:**

- Repository changelogs (`CHANGELOG.md`)
- Issues and change proposals in the source management system (GitHub Issues and Pull Requests):
  these artefacts are tracked, versioned and immutable by construction; their immutability and
  traceability constitute the control
- Internal documentation on the inter-agent noticeboard and in session logs (`/.telemedic/context/`)
- Translations in parallel progress during development, not yet controlled by the divergence system

---

## 2. Unique identification of documents

Each controlled document is identified uniquely by:

1. **Absolute file path** in the repository: there is no duplication of path, and the path is
   preserved indefinitely even after withdrawal. A withdrawn document does not have its identifier
   reused.
2. **Document version**, determined by the commit in which the document was last modified. The
   version is the SHA-1 hash of the commit.
3. **Date of approval**, recorded in the commit message and verifiable from the git log history.
4. **Status** (in force / withdrawn): the status is stated explicitly in a register, not implied by
   the absence of the document from the repository.

**Method of identification in cross-references:** A citation of a controlled document always cites
the path and, where necessary to disambiguate historical versions, the commit. A reference without
an absolute path or without a commit is incomplete. In regulatory references, where the document
is online, the absolute URL is cited.

---

## 3. Version and history

**Version in the repository:** The version of a document is the commit in which it was modified. The
distributed version control system of git ensures that:

- The complete history is immutable without trace (every modification requires a new commit hash).
- Every version is uniquely identifiable by the SHA-1 hash of the commit.
- The date and author of every modification are recorded in the commit itself.
- The commit message declares the modification (type, scope, description).

**Version of distributed releases:** A distributed release (software or compiled documentation) bears
its own version number according to the schema declared in [01_technical/09](/01_technical/09-integrazione-continua-e-rilascio.md).
It cites the commit hash to which it corresponds, making it traceable to the specific version of
every included document.

**Numbering of regulatory documents:** Documents that generate requirement identifiers -
specifications, files, development plans - use declared and frozen identifier spaces (`V-120`).
They are never renumbered and never reused after withdrawal
([08/03 § 5](./03-sistema-di-gestione-della-qualita.md)). A withdrawn identifier remains in the
history and is marked as such.

---

## 4. Reviewers and competence by category

ISO 13485 § 6.2 requires that personnel performing activities affecting product quality be
competent and that competence be documented. In an open project, this competence is not required of
the contributor but of the reviewer: whoever approves is whoever has the authority and
responsibility for the quality of what enters the repository.

**Categorisation of documents and nominated reviewers:**

| Category | Nominated reviewer | Required competence |
|---|---|---|
| **Public statements and warnings** | Sponsor | Authority over regulatory conformance and the public representation of the project |
| **Regulatory specifications** (`docs/08_compliance/`) | Area author, with secondary review by the Sponsor | In-depth knowledge of the applicable standard; ability to map requirements to the technical solution |
| **Requirements and milestones** (`docs/03_functional/`, `docs/09_roadmap/`) | Roadmap owner (for milestones); area owner (for requirements) | Knowledge of the intended purpose, the functional perimeter and the planning |
| **Architecture and lifecycle** (`docs/02_architecture/`, `docs/01_technical/`) | Domain architect | Knowledge of the project's architecture and the allocation among bounded contexts |
| **Domain and language** (`docs/05_domain/`, `docs/10_fondamenti/`) | Module author, with secondary review by domain | Knowledge of the healthcare context and regulatory terms |
| **Architectural decisions** (`docs/adr/`) | Technical reviewer designated in the decision | Knowledge of the problem solved |
| **Register of identifiers** | Register author | Knowledge of the complete catalogue and the state of every identifier |

**Competence dossier - a commitment made and not yet fulfilled:** The form ISO 13485 § 6.2 requires
for documenting competence is a dossier for each nominated reviewer, containing the description of
the specific competence for the category to which they are assigned, itself a controlled document in
the dedicated section of the manufacturing entity's document management system when constituted.
**Today that dossier does not exist.** There is no file in the repository that holds it: the word
appears only in the prose that prescribes it, this passage included. This must be stated as it
stands, because it concerns a record and not an intention: the competence of reviewers is, as of
today, asserted by this chapter and not evidenced by a record. The gap is of the same nature as the
one described in § 9 - a record the standard presupposes and that the capacity declared by `D54` has
not yet produced - and, like that one, it is stated rather than attenuated. Its closure is tied to
the constitution of the manufacturing entity ([09 § 4.2](./09-percorso-e-calendario.md), `T-14`),
which is the moment the dossier will have a document management system to reside in; until then the
absence is known, stated here, and belongs among the gaps the notified body will find already
written rather than having to discover them.

**Explicit point of fragility:** A project that widens the set of reviewers without updating
competence dossiers loses the property of control at the exact moment it does so, and loses it in a
way that cannot be reconstructed afterwards - because the missing evidence is the qualification of
whoever approved a modification on a past date. This is the reason why this control exists and why
its violation is unacceptable.

---

## 5. Form of approval

In the 'documents as code' model with git and GitHub, approval of a controlled document takes place
by means of a **favourable review of a change proposal** (Pull Request). The review is binding for
the merging of the change into the main branch.

**Elements of the approval record:**

| Element | Tracked in | Immutability | Verifiability |
|---|---|---|---|
| **Identity of the reviewer** | GitHub profile of the reviewer | Yes - recorded in the commit | Consultable from GitHub log |
| **Exact text of the approved document** | Content of the Pull Request at the time of approval | Yes - GitHub preserves the version for every commit | Reconstructible from the exact commit cited in the PR |
| **Date and time of approval** | Timestamp of the favourable review | Yes - assigned by the server | Consultable from the timeline of the PR |
| **Identifying commit** | SHA-1 hash of the merge commit | Yes - calculated from the content | Immutable and unique |
| **Statement of modification** | Commit message in main | Yes - signed if required | Verifiable with `git log` |

**How approval happens:** Every change proposal that touches a controlled document remains
suspended until it receives a favourable review ("Approved") from the nominated reviewer for that
category. The proposal must not be merged without this approval: **the procedure prescribes it, and
the technical control of branch protection on GitHub is enforced as of 26 August 2026**. The merge
itself - the act of incorporation into the main branch - is recorded in the git log with the
identity of whoever performed it. **Approval is conceived as triple**: favourable review on the
proposal, branch protection that blocks unauthorised merging, immutable record of who performed the
merge. Today the three elements are all in place, but not everything this procedure prescribes is
enforced by the machine, and the difference must be stated in full rather than smoothed over. **What
the machine enforces** is one favourable review on every proposal: without it the merge is blocked,
and this holds for anyone who is not an administrator of the repository. **What the procedure
prescribes and the machine does not enforce** is that this review come from the reviewer nominated
for the document's category: branch protection deliberately has `require_code_owner_reviews` set to
`false`, and [`.github/CODEOWNERS`](https://github.com/fedcal/Telemedic/blob/main/.github/CODEOWNERS)
gives the reason with the evidence. With a single maintainer, every line of that file assigns the
same person; were the setting `true`, every proposal would require approval from an owner other than
the author, and no proposal could ever be merged without the administrator bypass. The choice is
therefore deliberate, but its consequence must be stated without attenuation: **today the
correspondence between the reviewer who approves and the reviewer nominated for the category rests
on the discipline of whoever works, not on a technical control**, and an approval given by the wrong
person would be accepted by the system without any warning. The `require_code_owner_reviews` setting
is to be reconsidered when there are at least two maintainers - not before, because before that it
would make the repository unusable without the very bypass it is meant to avoid. To this is added
that the Sponsor, being an administrator, may approve and merge their own work. This form **does not
resolve the gap of `Q-189`** - under the declared capacity of `D54`, the author of documents is the same person who
approves them - but **makes it visible and confined**: the system records it, the trace is
immutable, and the circumstance is attestable in the technical file as a declared gap. The
approval record now has the form this procedure describes.

**Form of the statement of modification:** The commit message that accompanies the merge declares
the type of modification (feat, fix, refactor, docs, test, chore, perf, ci), the scope (which area,
which document), and a concise description of the modification. The message is a mandatory part of
the record, because the auditor who asks "what went into this version" finds the answer in the
commit message, and the message cannot be altered after the merge (the commit cannot be altered).

---

## 6. Rule for withdrawal of documents

A controlled document may be withdrawn - brought to a state that excludes it from current acts -
for the following reasons:

1. **Abrogation of a specification.** A specification exhausts its purpose, is replaced by a new
   version, or is eliminated because the requirement is discarded.
2. **Correction of a grave regulatory error.** A chapter on conformance contains a statement that,
   verified against the primary text, proves false. The chapter is withdrawn, errors corrected, and
   republished with a new version number.
3. **Exhaustion of temporal purpose.** A draft or internal plan expires when the milestone it was
   associated with is closed.

**Withdrawal procedure:**

1. A change proposal is created that declares the withdrawal in the commit message, citing the
   reason.
2. The proposal receives approval from the nominated reviewer for the category.
3. The document is marked as "withdrawn" in a registry status maintained in the repository. The file
   is never deleted from the version control system.
4. The hash of the withdrawal commit, the date and the reason remain traceable in the git log.

**Prohibition of reuse of identifiers:** An identifier of a withdrawn requirement or document is
never reused. If a requirement is withdrawn and subsequently a new proposal addresses the same
subject, it is assigned a new identifier. This preserves historical traceability: a reader who
consults an old release and sees an identifier is not misled by the possibility that the
identifier has been reassigned and means something else today.

---

## 7. Recording of approval in the 'documents as code' model

The correspondence between review, reviewer and approval constitutes the approval record in the
'documents as code' model. There is no separate record: the record is the git history and the
sequence of events on GitHub.

### 7.1 How it happens

A typical process is as follows:

1. **Creation of the change proposal.** A contributor creates a Pull Request that proposes a
   modification to a controlled document. The proposal includes the text of the modification, a
   description of the change, and a link to the requirements or issues that motivate the change.

2. **Preliminary automatic review.** Build checks run in the pipeline (YAML syntax, internal links,
   prohibited terminology, requirement identifiers) and report any findings. These verifications are
   blocking: if they fail, the proposal cannot proceed. Their execution is recorded in the proposal
   log.

3. **Manual review by the nominated reviewer.** The nominated reviewer for the category reads the
   proposal, checks that the modification conforms to the rules of the category (for a
   specification: is it traced to the requirement? Is the standard cited correctly?), and declares
   "Approved" or requests changes. The review is immutable and dated.

4. **Resolution of findings, if any.** If the reviewer has requested changes, the contributor
   modifies the proposal. Every modification generates a new commit in the proposal, which the
   pipeline verifies again.

5. **Merge into the main branch.** After approval, the reviewer or a delegated person merges the
   proposal into the main branch ("merge"). This action is recorded in git with the identity of the
   requester and on GitHub in the timeline of the proposal. The procedure prescribes that the merge
   **happens only after approval**, and as of 26 August 2026 the technical control of branch
   protection that enforces this rule is implemented: a proposal that has not received at least one
   favourable review cannot be merged, so the rule no longer rests on procedural respect alone. The
   trace of the commit in the git log and the timeline of the proposal remain alongside it, as
   before. What the protection does **not** cover must be stated precisely: it does not apply to
   repository administrators, and the owner therefore retains the ability to merge their own work
   after approving it themselves - a circumstance stated in § 5 and recorded as a gap in `Q-189`,
   not concealed by this implementation.

6. **Immediacy of publication.** The document comes into force immediately after the merge, because
   the documentation site and distributed artefacts are generated from the current version of main.

**What makes this record superior to a signature on a form:**

- **Immutability:** It is impossible to retroactively alter what was approved, by whom, and when. A
  modification after the commit is a new and separate commit, which appears in the history as such.
- **Granularity:** It is not the entire document that is approved, but the specific modification.
  The reviewer sees exactly what went in and what changed from the previous version.
- **Traceability:** The proposal is linked to requirements, issues and findings. The logical thread
  that binds the decision to the change is part of the record.
- **Distributed:** The complete history is copied in every clone of the repository, which means that
  no event is ever lost if a server fails.

### 7.2 Cycles of approval

**The ordinary cycle:** A modification to a controlled document follows the cycle described above.
The proposal remains open until approval and merge, which typically takes from a few hours to a few
days. The exceptions are documents on conformance that require secondary review by the Sponsor, whose
response time can be longer.

**The accelerated cycle (for corrections and urgent updates):** Within 48 hours of the discovery of
a grave regulatory error or regulatory inconsistency, the nominated reviewer may approve and merge a
correction without the ordinary cycle, provided the modification is marked as "fix" in the commit.
This cycle presupposes, however, that the reviewer is available: it is not a way to bypass control,
but a way not to hold up critical releases.

---

## 8. The tools and their validation

The approval record described in § 7 rests on four tools:

| Tool | Function in the control system | Validation required |
|---|---|---|
| **git** (distributed versioning) | Calculation and verifiability of the hash of every commit; immutability of history | Conformance with clauses 4.2.4 and 8 of IEC 62304 (configuration control). Validation: the history is not alterable without trace; every commit is uniquely identifiable |
| **GitHub** (hosting platform) | Trace of change proposals; branch protection; recording of review and merge events; immutability of logs | Conformance with clause 8.2 of IEC 62304 (software configuration management and verification). Validation: no favourable review can be recorded retroactively; no merge can occur without the trace of the proposal |
| **Automatic build checks** (linter, syntax, link checker, identifiers) | Verification that every proposal respects the technical and regulatory rules before merge | Conformance with clauses 5.5–5.7 of IEC 62304 (integration and system testing). Validation: a check that does not block when it says it would is a defect of the check (criterion 5 of `T-01`). Each blocking check is tested with a deliberately non-conforming case that must make it fail |
| **Cryptographic signing of commits** (adopted, mandatory signing on branch pending) | Cryptographic attestation of the identity of whoever performed the commit (GPG sign) | Conformance with clause 7.5.8 of ISO 13485 (traceability of the author). Note: the clause is today satisfied by the mandatory `Signed-off-by` (DCO, textual name traceability). Cryptographic signing is a **stronger and additional control**. **Adopted on 26 August 2026:** local configuration `user.signingkey`, `gpg.format`, `commit.gpgsign` set; key `ed25519`, registered to `Federico Calò <fedcal01@gmail.com>`, expiration 20 February 2029. **Step pending:** mandatory signing on the branch, with **specific trigger**: whilst the public key is not uploaded to GitHub, signed commits would appear "unverified" and push would be refused. It is the final step and has a specific trigger, not a date. Recorded as open question `Q-284` | <!-- dato-reale-consentito: intestazione della chiave di firma, tracciabilità nominativa richiesta dalla clausola 7.5.8 di ISO 13485 -->

**State of implementation today:** Automatic build checks (terminology, editorial conformance,
secrets, bill of materials, divergence between languages) are active and blocking in the pipeline.
Branch protection is enforced as of 26 August 2026 (configuration verified, form declared);
cryptographic signing is adopted at the local level (26 August 2026), whilst mandatory signing on
the branch is prescribed and not yet implemented (open question `Q-284`, pending until the public
key is uploaded to GitHub). **When these tools will be validated:** Milestones `T-01` criteria 5
and 7, and `T-03`, presuppose formal validation of all tools. Until this validation exists, the
checks are assertions of functioning, not proofs. Validation is included in the milestones of the
first release and falls within the planning of the first year ([09 § 4](./09-percorso-e-calendario.md)).

**Implications of a validation failure:** If any of these tools proved not to conform to its
purpose - for example, if branch protection once implemented could be bypassed, or if GitHub
altered dates retroactively - the approval record of this control system would fall completely, and
the project would have to adopt an alternative system. This is why validation is not optional and
why the milestones place it before the full exercise of the procedure.

---

## 9. The explicit gap: author and approver coincide

Under the declared capacity of `D54` - a single contributor working part-time - the author of a
document is the same person who approves it. This **makes impossible the control of an external
arbiter on the quality of the drafting**, and is a violation of the structure that ISO 13485
§ 6.2 and § 4.2.4 presuppose. The standard assumes that reviewer and author are different people;
when they are the same, the control that only independence guarantees - the control by someone who
did not write what was written - does not exist.

### 9.1 What is not satisfied

ISO 13485 presupposes that document control is exercised by persons who **did not write the
document**. This presupposition is not formulated as an explicit requirement ("the reviewer must be
different from the author"), but is implicit in every clause on control. The consequence of the
presupposition is: **if the author is the reviewer, no external control exists on the quality of
the drafting, and the property of verification is compromised.**

It is not said that the drafting is of poor quality. It is said that no third-party verification
exists to establish that it is of high quality. An author can control their own drafting, and will
do so; an author, however, does not see the errors they themselves have committed, because the
errors are invisible to whoever produced them. This is why peer review is a practice everywhere in
software, and its absence is a gap.

### 9.2 The consequence on priority

Under `D54`, the gap of author/approver coincidence **is not resolvable with more hours of work**.
It is resolvable only with a second person. Since capacity is fixed
([02 § 2.1](/09_roadmap/02-traguardi.md#21-the-three-decisions-that-determine-this-chapter)),
the only path is to acquire the function from outside.

### 9.3 The status of this gap in the certification path

The gap is **declared and accepted as such until a date** - the date on which the manufacturing
entity will have constituted its own organisation and will have resources for third-party review.
Until that date:

- **It is not a conformance.** No chapter of this repository describes document control as
  conformant to ISO 13485.
- **It is the first item of Q-189.** Q-189 asks to establish which subset of records with distinct
  roles the project accepts as a declared gap and which it proposes to cover by acquiring the
  function from outside. Author/approver coincidence is the first item of this allocation.
- **It is recorded in the technical file.** In the file that will accompany the marking, the gap is
  listed with the date it arose and the form of its declared resolution.

### 9.4 How it is managed in practice

Although there is only one person who drafts and approves, the project **nonetheless** maintains
approval records according to the rules described in §§ 7–8, because:

1. The records are not lost when capacity increases. If a second stable member were added tomorrow,
   the existing records would not need to be reconstructed.
2. The absence of external control at this moment does not invalidate the form of the record. The
   form - identity of the reviewer, date, commit hash, exact text - is correct; it is the fact that
   the reviewer is also the author that is problematic. The notified body will ask explicitly ("who
   approves?"), and the answer ("same author, recorded thus") is more useful than an attempt to
   pretend it is not so.

---

## 10. What this chapter leaves open

| Reference | Question | To whom |
|---|---|---|
| **`Q-189`** | **Allocation of records with distinct roles.** Which subset of records that the quality management system requires - internal audit, release review, configuration verification by someone who did not write the code, external review of critical code - does the project accept as a declared gap under `D54`, and which does it propose to cover by acquiring people from outside. Author/approver coincidence is the first item of this allocation. The predetermined outcome is the declared gap, to be marked in the technical file at the date of first distribution | → Sponsor |
| **`Q-283`** | **Main branch protection - RESOLVED on 26 August 2026.** Configured with `gh api -X PUT repos/fedcal/Telemedic/branches/main/protection --input -` and verified the same day. A change proposal to a controlled document cannot now be merged without at least one favourable review. **What the configuration enforces and what it does not**: it enforces one review, not that the review come from the reviewer nominated for the category - `require_code_owner_reviews` is deliberately set to `false`, for the reason given in [`.github/CODEOWNERS`](https://github.com/fedcal/Telemedic/blob/main/.github/CODEOWNERS), and the correspondence between the actual reviewer and the nominated reviewer remains a matter of discipline (§ 5). **Form declared by the Sponsor**: the repository owner (Sponsor), being an administrator, may approve and merge their own work; external contributors receive a favourable review before merge is possible. This form **does not resolve the gap of `Q-189`** - the author approves themselves under `D54` - but **makes it visible and confined**: the system records it and the circumstance is attestable in the technical file. Declared structural gap | Technique, compliance |
| **`Q-284`** | **Cryptographic signing of commits - adopted on 26 August 2026, mandatory signing on branch pending.** The procedure prescribes that commits on the main branch carry verifiable cryptographic signature (GPG). **Status adopted**: local configuration `user.signingkey` `13EEEA8DBE18B284`, `gpg.format openpgp`, `commit.gpgsign true`, `tag.gpgsign true`. Key `ed25519` registered to `Federico Calò <fedcal01@gmail.com>`, expiration 20 February 2029. **Step remaining open**: mandatory signing on the `main` branch with specific trigger - whilst the public key is not uploaded to GitHub, signed commits would appear "unverified" and push would be refused. It is the final step and has a specific trigger, not a date. Distinguish from `Signed-off-by` (DCO, today mandatory and active, which satisfies ISO 13485 § 7.5.8 on nominative traceability): cryptographic signing is an additional and stronger control | Technique, compliance | <!-- dato-reale-consentito: intestazione della chiave di firma, tracciabilità nominativa richiesta dalla clausola 7.5.8 di ISO 13485 -->
| `[NV]` | **Formal validation of the four tools.** Validation of the tools (git, GitHub, automatic checks, cryptographic signing) is a functional prerequisite of milestones `T-01` criteria 5 and 7, and `T-03`. The form of validation (how to prove that a tool does what it should) is defined in [03 § 3.2](./03-sistema-di-gestione-della-qualita.md); execution of the validation has not been started. Until validation exists, the control is assertion, not proof | Conformance, technique, pipeline |
| - | **Access and delegations for main branch control.** Who can merge a change proposal without further approval, when and for what reason, remains in the project's internal documentation and is not repeated here. The decision must remain open to review every six months, because it is the point at which an informal expansion of capacity risks becoming permanent | → Single contributor for quarterly review |
