---
title: Translation alignment
sidebar_position: 11
description: "The alignment procedure between Italian and English across the corpus: what makes a change proposal complete, what happens when the translation lags behind, how a prerequisite area is distinguished from a reporting-only area. Criterion 6 of T-06."
---

# Translation alignment

Criterion 6 of `T-06` requires that the alignment procedure be «declared and versioned: what makes
a change proposal complete, what happens when the translation lags behind, and how a prerequisite
area is distinguished from a reporting-only area». This chapter is that procedure.

---

## 1. Scope and placement

The translation work lived for months in a single internal file,
[`.telemedic/context/RUNBOOK-TRADUZIONE-EN.md`](https://github.com/fedcal/Telemedic/blob/main/.telemedic/context/RUNBOOK-TRADUZIONE-EN.md).
That file remains and keeps performing its role, but it is not a versioned procedure in the sense
[`08_compliance/10-controllo-dei-documenti.md`](../08_compliance/10-controllo-dei-documenti.md)
§1 gives to the word: the same section explicitly lists the internal documentation under
`/.telemedic/context/` among the documents **not subject to formal control**, so it lacks a unique
identification, a reviewer nominated by category, and a withdrawal rule. A milestone criterion that
asks for a procedure «declared and versioned» cannot be satisfied by a document that the project
has already excluded, by its own declaration, from its own document control.

This chapter splits the work into two distinct parts, and the split is deliberate, not an economy
of writing. This document contains **the procedure**: the rules in force, which whoever proposes a
change to the bilingual corpus must follow, under document control like every other chapter of this
area. The runbook remains the **register of errors already made** in translation - the traps
already encountered, the continuation protocol on long documents, the glossary of systematic
renderings - which is a different matter and stays internal: it changes with every session, does
not require the approval of a nominated reviewer, and duplicating it here would produce two copies
of the same content bound to diverge, exactly the problem the project has already argued while
closing `Q-26`. Where this procedure needs the operational detail - the exact form of the
continuation marker, the list of fixed terminological renderings, the traps already paid for on
anchors - it refers to the runbook instead of copying it.

**Category and reviewer.** For the table in
[`08_compliance/10-controllo-dei-documenti.md`](../08_compliance/10-controllo-dei-documenti.md)
§4, this document belongs to the «Architecture and lifecycle» category (`docs/01_technical/`,
together with `docs/02_architecture/` and `docs/04_protocols/`), whose nominated reviewer is the
domain architect, with the required competence of knowledge of the project's architecture and of
the split between bounded contexts. A change to this chapter therefore follows the same approval
cycle described in that document §7, not one of its own.

---

## 2. What makes a change proposal complete

The completeness of a change proposal depends on the state that
[`pipeline/differenziazione-traduzioni.tsv`](https://github.com/fedcal/Telemedic/blob/main/pipeline/differenziazione-traduzioni.tsv)
declares for the area or document being touched - the state itself, and how to read it, are the
subject of § 4. Here it is stated what that state entails for whoever opens the proposal.

**If the proposal touches an original document in an area at `esigita` (required) state, or one of
the eight public declarations at `bloccante` (blocking) state**, the proposal is complete only when
it also carries the English mirror updated consistently, within the same proposal. It is not
enough that the English exists: it must say the same thing as the Italian just modified. The
elements that the pipeline's G8 check verifies mechanically, described in
[`09-integrazione-continua-e-rilascio.md`](./09-integrazione-continua-e-rilascio.md) §3, are the
same number of second-level (`##`) sections in both languages and a last-modified date of the
original no later than that of the translation, save for the equivalence declaration described in
§ 3. The elements the check does not see and remain the responsibility of whoever translates -
line-by-line integrality, frontmatter with `title` and `description` translated and
`sidebar_position` untouched, glosses at the first occurrence for Italian legal references,
identifiers never translated - are the binding rules of the runbook §3, which this proposal must
respect as much as the mechanical rules. A proposal that touches the frontmatter of an English file
without respecting the quoting of values with a colon followed by a space does not pass the site
build, for the reason this repository already knows and that is recalled at the top of `CLAUDE.md`.

**If the proposal touches an original document in an area at `pianificata` (planned) state**, it is
not required to carry the translation in the same proposal. It remains incomplete in the proper
sense of the word - an original more recent than its translation is a debt, not an error - but that
debt is tolerated and measured, not blocking: § 3 describes how it is handled.

**If the proposal introduces a new document** in an `esigita` area, the absence of the English
mirror is not a tolerable delay but an absence the check counts as «missing and required» - the
same category with which the check flags a file never translated. A proposal that introduces a new
chapter in an `esigita` area is complete only if it introduces both languages together, or if it
explicitly declares, in its own text, the opening of a debt in the same form as § 3.

**Verification before declaring a proposal complete.** Whoever opens it runs
`bash scripts/verifica-divergenza-traduzioni.sh` locally and reads the outcome. An exit code
different from zero on the touched document is not worked around by lowering the state of the
corresponding row in `pipeline/differenziazione-traduzioni.tsv` to pass one's own change: that file
declares a decision taken collectively, as the comment at the end of the same script recalls, not a
switch for a single proposal.

---

## 3. What happens when the translation lags behind

The lag presents itself in two different forms, and the correct response depends on which of the
two is in play - confusing them produces either a missed translation the project believes done, or
retranslation work spent where it was not needed.

**The change to the original has changed the content.** In this case the translation must be
redone on the changed part. There is no shortcut:
`scripts/verifica-divergenza-traduzioni.sh` compares the date of the last commit that touched the
original with that of the last commit that touched the translation, and if the original is more
recent it flags the divergence. On an `esigita` area or a `bloccante` document this fails the
build; on a `pianificata` area it produces a reporting line that appears at every run, until
someone retranslates.

**The change to the original was purely editorial** - a fixed typo, a tidied elision, a sentence
made more fluent without touching the meaning - **and the existing translation remains correct**.
Forcing a change to the translated file anyway would teach the making of empty ones, which are
indistinguishable from a real translation to anyone reading the history afterwards: it is the way
in which the check would learn to lie from the opposite side of the one it guards. The correct
route is to declare the equivalence already verified, writing in the translated file the marker

```
<!--TRAD-VERIFICATA: <fingerprint-of-the-original-commit>-->
```

where the fingerprint is that of the commit of the original that was read to compare it with the
existing translation. It is not a bureaucratic shortcut: it is the declaration, traceable and
attributable to whoever writes it, of having read both texts and found them still equivalent. The
declaration **expires on its own** at the original's next change - the check verifies that the
declared fingerprint is an ancestor of, or coincides with, the most recent revision of the original,
and if the original has changed after the declaration it flags it as an «expired declaration», with
the same force as a divergence never declared.

**On continuing a long document interrupted halfway**, the operational rule - a
`<!--TRADn-CONT-->` marker at the end, a mandatory stop at a second-level heading, declaration of
the last translated section and the first untranslated one in the report - is described in full in
the [runbook](https://github.com/fedcal/Telemedic/blob/main/.telemedic/context/RUNBOOK-TRADUZIONE-EN.md)
§2 and is not repeated here: it is operational detail, not procedure.

**When a defect is found while translating.** Translating a chapter is the severest review it
receives, because it forces every line to be read. A defect found this way - a reference to the
wrong paragraph, an enumeration that announces one number and lists another - is not corrected
silently on the English alone: it is flagged and closed on both languages together, as already
argued for the whole corpus and recalled at the top of this repository in the project's memory. A
correction made on one language only is a newly introduced divergence, not a closed one.

---

## 4. How a prerequisite area is distinguished from a reporting-only area

The distinction is not in the head of whoever writes, and this is what makes it verifiable: it
lives in
[`pipeline/differenziazione-traduzioni.tsv`](https://github.com/fedcal/Telemedic/blob/main/pipeline/differenziazione-traduzioni.tsv),
a configuration file separate from the check that reads it,
[`scripts/verifica-divergenza-traduzioni.sh`](https://github.com/fedcal/Telemedic/blob/main/scripts/verifica-divergenza-traduzioni.sh).
The format is declared in
[`pipeline/README-DIFFERENZIAZIONE-TRADUZIONI.md`](https://github.com/fedcal/Telemedic/blob/main/pipeline/README-DIFFERENZIAZIONE-TRADUZIONI.md).
This separation is itself a requirement, not an implementation choice: criterion 3 of `T-03` asks
in so many words that the check's differentiation «be versioned in a configuration file, not
hardcoded», precisely because until 26 August 2026 it lived in four variables inside the script,
and modifying it meant modifying the check that was supposed to guard it.

**Two axes, not one.** For the thirteen numbered areas of `docs/` (`adr` included), the state of an
`area`-type row is `esigita` (required) - an original without a translation fails the build - or
`pianificata` (planned) - the absence only produces a reporting line. For the eight bilingual
documents at the root of the repository, themselves split into three public warnings named by
criterion 8 of `T-01` and five other mandatory declarations of `D51`, the state of an
`avvertenza_pubblica` or `dichiarazione_pubblica_radice` row is `bloccante` (blocking) - a finding
on that document's English block fails the build - or `segnalazione` (reporting) - the finding is
printed and does not block, never without a declared `bloccante_dal` date: a temporary reduction
without an expiry date is not temporary, it is an undeclared waiver, with the same rule already in
force for `pipeline/collocazione-dei-controlli.tsv`.

**A prerequisite area**, in the language of criterion 6 of `T-06`, is therefore an area or document
carrying the state in its strong form - `esigita` or `bloccante` - whatever the historical reason
that put it there: criterion 1 of `T-06` named four by name (the public warnings, the fundamentals
guide, the compliance area, the security area), but the strong form is not reserved for that
subset. **A reporting-only area** is one carrying the `pianificata` or `segnalazione` state: the
lag is measured and published at every build, per criterion 3 of `T-06`, but it does not prevent
the proposal from being merged.

**Today's state.** As of 27 August 2026, all thirteen areas carry `esigita` state and all eight
bilingual root documents carry `bloccante` state. This is not an extension declared aloud: the
configuration file records the measurement that determined it - twelve numbered areas out of
twelve with the same number of files as the Italian, thirty-two architectural decision records out
of thirty-two, the word count in both languages with no English file under the completeness
threshold - and the transition was already the declared completion criterion for `T-09` («the
milestone is closed when no area is more in reporting-only mode»). The scope this section describes
today is therefore wider than the literal scope of criterion 1 of `T-06`, and it is a verified
measurement, not a promised anticipation: whoever wants to verify it personally runs
`scripts/verifica-divergenza-traduzioni.sh` on the current repository and reads their own outcome,
or opens the configuration file directly and reads its dated comments.

**This state is not final by construction.** A new area added in the future under `docs/` is born
`pianificata`, not `esigita`, per the rule in
`pipeline/README-DIFFERENZIAZIONE-TRADUZIONI.md`: the strong state is assigned only after the
translation actually exists, not by intention declared in advance. Promotion from a weak state to a
strong one requires running the check on the real repository **before** changing the row, to verify
that the step does not introduce a finding that does not exist today: promoting a row that already
fails silently turns a tolerated debt into a build block for whoever works afterwards. Whoever
proposes a promotion motivates it in the row's `motivo` column with the source of the decision,
with the same traceability standard required elsewhere in this repository for every normative
statement.

---

## 5. Tools and related documentation

This procedure rests on distinct documents and tools, each with its own role, which do not
substitute for one another:

| Tool | Role | Where |
|---|---|---|
| This chapter | The procedure: the rules in force, under document control | The document you are reading |
| The translation runbook | The internal operational register: glossary, continuation protocol, traps already encountered | [`.telemedic/context/RUNBOOK-TRADUZIONE-EN.md`](https://github.com/fedcal/Telemedic/blob/main/.telemedic/context/RUNBOOK-TRADUZIONE-EN.md) |
| The differentiation file | The versioned decision on which area and which document is a prerequisite and which is reporting-only | [`pipeline/differenziazione-traduzioni.tsv`](https://github.com/fedcal/Telemedic/blob/main/pipeline/differenziazione-traduzioni.tsv) |
| The differentiation file's format | The meaning of each column and of the two state categories | [`pipeline/README-DIFFERENZIAZIONE-TRADUZIONI.md`](https://github.com/fedcal/Telemedic/blob/main/pipeline/README-DIFFERENZIAZIONE-TRADUZIONI.md) |
| The pipeline check | The mechanical execution: divergence by date, structural divergence, orphan pages, incomplete English block on the root documents | [`scripts/verifica-divergenza-traduzioni.sh`](https://github.com/fedcal/Telemedic/blob/main/scripts/verifica-divergenza-traduzioni.sh) |
| The G8 check in the pipeline | This check's place among the mandatory checks and its differentiated behaviour | [`09-integrazione-continua-e-rilascio.md`](./09-integrazione-continua-e-rilascio.md) §3 |
| Document control | Category, nominated reviewer and form of approval for this very chapter | [`08_compliance/10-controllo-dei-documenti.md`](../08_compliance/10-controllo-dei-documenti.md) §4 |

None of these documents duplicates another: the runbook does not declare states nor thresholds, the
differentiation file does not explain how to translate line by line, and this chapter repeats
neither the one nor the other. Whoever seeks «what must I do to translate well» goes to the
runbook; whoever seeks «does this area block the build or not» goes to the differentiation file;
whoever seeks «what is the rule and who approves it» stays here.

---

**Back to**: [`00-indice.md`](./00-indice.md).
