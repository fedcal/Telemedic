---
title: Verifying the documentation site
sidebar_position: 10
description: "How it is established, in an executable and repeatable way, that navigation, search and the translation-in-progress notice on the site actually work - criterion 6 of T-07."
---

# Verifying the documentation site

Milestone `T-07` of the roadmap (`docs/09_roadmap/02-traguardi.md`) establishes that the published
site actually works, not merely that it exists. Three of its criteria - navigation, search, the
translation-in-progress notice - cannot be verified by eye: criterion 6 of the same milestone
requires their verification to be **an executable and repeatable procedure**, with the outcome of
the last execution **recorded and dated**. This chapter is that procedure, written in prose so
that it is readable even by someone who does not run the script that automates it; the script is
`scripts/esegui-verifica-sito.sh`, and it describes the same procedure in its own header comment,
for the same reason `pipeline/README-COMPONENTI.md` does not merely point to the control it
describes.

## 1. What the procedure establishes

| Step | What it verifies | Tool |
|---|---|---|
| 1 | The site build does not fail: no broken links and no broken anchors (the four `onBroken*` parameters of `website/docusaurus.config.mjs` are set to `'throw'`) | `npm run build` in `website/` |
| 2 | Every navigation entry (`to:` in the navbar and in the footer) leads to a page that is actually published - the half of criterion 1 that the link checker **does not cover**, because a menu entry is theme configuration, not prose walked by the docs plugin | `scripts/verifica-voci-di-menu.sh` |
| 3 | Search is reachable from every page of both locales and returns results **in the active language**, without cross-contamination between the two | `scripts/verifica-ricerca.sh` |
| 4 | Every page of the English locale whose source document has no translation yet carries the "translation in progress" notice and the link to the Italian page - never an error, never silence on the root | `scripts/verifica-avviso-traduzione.sh` |

Criteria 4 and 5 of `T-07` - the link to the not-a-medical-device declaration and the notice on
every page - are verified by a separate script, `scripts/verifica-dichiarazione-non-marcatura.sh`,
already in operation as a blocking publication control (criterion 7 of `T-01`) and not repeated
here: criterion 6 of `T-07` asks for the procedure covering only criteria 1, 2 and 3.

## 2. How to run it

```bash
cd /path/to/the/repository
bash scripts/esegui-verifica-sito.sh
```

The script builds the site from scratch, runs the four checks in the table above, prints the
outcome of each, and **appends a row** to
[`registro/verifiche-sito-di-documentazione.tsv`](https://github.com/fedcal/Telemedic/blob/main/registro/verifiche-sito-di-documentazione.tsv)
with the date, the commit examined, the outcome for each criterion, who ran the verification, and
a note. The register is **append-only**: no existing row is ever modified, for the same reason
already written in `registro/README.md` for the requirement identifier register - a state that
gets overwritten can no longer be verified after the fact.

With `SALTA_COSTRUZIONE=1` the script reuses an artefact already present in `website/build`
instead of rebuilding it: useful to avoid paying the cost of a full build twice within the same
working session, but then criterion 1 (links) is not re-established by that execution, and the
register row states so.

## 3. Why the record is not the pipeline's artefact

A more obvious alternative would be to record the outcome in the continuous-build job that
already exists (`.github/workflows/docs.yml`). It was not chosen because **it is not a record**:
a pipeline's execution logs are not version-controlled, are not accessible without credentials on
the platform, and the only artefact a related job (`distinta-dei-materiali`) keeps today expires
after ninety days - before the 30 November 2026 release. The project already has a position on
this, in criterion 2 of `T-01`: the approval record is the correspondence between revision,
reviewer and approval **in the repository**. This register follows the same discipline.

## 4. The declared gap: whoever runs the verification is whoever built the site

Criterion 6 of `T-07` states explicitly: *"that it be run by a person who did not build the site
is not a criterion, because under `D54` it is not achievable: it is a declared gap."* Every row of
the register repeats this in the `esecutore` column instead of staying silent about it: a register
that did not would implicitly assert, to whoever checks it a year from now, an independence
between whoever built the site and whoever verified it that never existed.

## 5. Repeatability

Running the procedure again on the same commit, with no changes between the two executions, must
produce the same outcome for each criterion: it is the only proof that this is really a procedure
and not a report written once and trusted forever. The register keeps every execution precisely
to make that comparison possible for anyone, not only for whoever ran it.
