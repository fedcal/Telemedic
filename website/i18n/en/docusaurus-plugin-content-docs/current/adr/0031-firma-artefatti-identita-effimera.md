---
title: "ADR-0031 - Signing of Artefacts With Ephemeral Identity of the Pipeline"
sidebar_position: 31
description: "Why artefacts are signed with a key derived from the identity of the GitHub Actions execution rather than a custodied key, which alternatives were available and what cost is accepted."
---

# ADR-0031 - Signing of Artefacts With Ephemeral Identity of the Pipeline

**Status**: accepted · **Date**: 26 August 2026 · **Area**: TECH
**Reference constraints**: D54, [Q-287](../11_registri/02-questioni-aperte.md#q-287) of the dashboard, criteria 7–8 of T-03

## Context

Regulations D17 on traceability and D18 on independent review require that every distributable artefact bears a digital signature and a verifiable provenance attestation: which source, which revision, which build chain, which executor, which input parameters. This is what enables an integrator to answer the question «where does this artefact come from» without trusting a claim.

Signing requires a private key. The location and custody of that key determine the form of verification and the recurring cost of protection, rotation and revocation.

## Alternatives Evaluated

### Alternative 1 - Signing with Persistent Key in Declared Custody

A private key is generated once, kept in a key management service external to the repository (corporate vault service, HSM, or AWS KMS) and imported into the build pipeline on request. Execution of the signature is tracked in the access log of the custody service.

*Advantages*:
- The form of verification remains the same over time even if the pipeline hosting service changes.
- The signature is verifiable offline, by comparing the public key kept in the repository.
- It does not depend on an external transparency service for verification.

*Trade-offs identified*:
- **Recurring burden of protection.** A private key in custody requires physical and cryptographic protection, periodic rotation, revocation in case of compromise, continuity of custody across contributors and infrastructure changes. It is a permanent and unlimited burden. Under D54 - a single contributor at partial commitment - **it is not sustainable**.
- **Rotation burden.** If the key is compromised, the signature of all previous artefacts loses validity, because the verifier cannot distinguish between artefacts legitimately signed and artefacts falsified with the same key. Rotation of a signing key carries legal and reputational cost.
- **Cascade failure.** If the custody service is unreachable, the pipeline cannot build. Under D54 this dependence on third-party infrastructure introduces a risk of uncontrolled shutdown.

### Alternative 2 - Signing with Ephemeral Identity of the Pipeline

A pair of keys is generated during the course of pipeline execution, the signature is produced, the private key is discarded and never saved, and the signature is attested in a public transparency register (Rekor, part of Sigstore). Subsequent verification, at the responsibility of who installs, reads the attestation from the public register and compares it to the artefact.

Technically: **OIDC + Sigstore/cosign**. GitHub Actions emits an OIDC token that identifies the execution (job ID, repository, branch, code revision, timestamp); `cosign` uses that token to obtain a pair of keys from the public Sigstore services (Fulcio); the signature is recorded in Rekor; after signing, the private key no longer exists.

*Advantages*:
- **No key custody.** A private key does not exist to protect, rotate or revoke. The recurring burden of custody is shifted to the Sigstore service (third parties).
- **Precise provenance trace.** The OIDC token uniquely identifies the execution: which repository, which branch, which revision, which instant, which job. It is impossible to forge a signature claiming it comes from a different version of the code.
- **No critical dependency from the pipeline.** If the external custody service is unreachable, nothing happens: the pipeline does not sign, but continues to build. Signing is an optional step, not a prerequisite.
- **Standardised form of signature.** Sigstore/cosign is the de facto standard for third-party pipelines, used by Google, Red Hat, GitHub, CNCF. The signature generated is verifiable with standard tools.

*Trade-offs accepted*:
- **Verifiability tied to an external register.** Who installs does not verify the signature offline. Verification requires Internet access and access to the Rekor transparency register (a public and free Sigstore service, part of the Linux Foundation). If Rekor is unreachable, verification is impossible. For a medical device the conservation horizon is long - years after the last specimen placed on the market - and this records a risk: **what happens if the Rekor service is unreachable at the moment of verification?** The verification procedure at the responsibility of who installs (criterion 8 of T-03) must state the answer, and it is a liability that is to be discharged when the manufacturer is established.
- **Verifiability tied to a third-party platform.** If the project migrates to a pipeline different from GitHub Actions, the form of the signature changes. Historical signatures remain valid (Rekor preserves them), but new artefacts will not be able to be signed with the same mechanism. It is a known and manageable dependency: a pipeline migration is a rare and planned event.

## Decision

Signing with **ephemeral identity of the pipeline, using OIDC + Sigstore/cosign**. No private key is kept in the project or in any service controlled by the project.

The decisive reason is **D54**: custody of a private key is a recurring burden, and the declared capacity of the project is a single contributor at partial commitment. A recurring burden that no one has time to carry out is not a security measure: it is an abandoned key, worse than no key.

## Consequences

### How signing works

1. At every execution of the pipeline (on every push to `main` or on explicit request), the signing steps invoke `cosign sign-blob` with the OIDC token of GitHub.
2. `cosign` contacts Fulcio (part of Sigstore), verifies the OIDC token, generates a pair of keys, discards it after signing, and records the attestation in Rekor.
3. The attestation is saved as a file alongside the signed artefact.

### How verification works

Who installs downloads the artefact and the attestation, and executes `cosign verify-blob` with the public key of Fulcio. `cosign` contacts Rekor and verifies that the attestation is in the register and that it corresponds to the artefact.

**Network requirement**: verification requires Internet access and access to Rekor. If the network is not available at the time of verification, verification is impossible. The verification procedure must state what to do in this case.

### When the transparency register is unreachable

This is the documented trade-off. [Section 7.3 of the Technical area document](/01_technical/09-integrazione-continua-e-rilascio.md#73-verification-by-whoever-installs) must state a fallback procedure - typically, offline comparison of the signature with the public key of Fulcio kept locally, which is possible but requires prior preparation.

When the manufacturer subject is established (D63), the constraint on conservation will be revisited: an established organisation has access to key custody services and to resources for their protection, changing the economic calculation of custody compared to a prototyping phase with limited resources.

### Provenance Attestations

In addition to the signature, every artefact bears a provenance attestation in SLSA format (Supply chain Levels for Software Artifacts):
- Source: repository URL
- Revision: commit hash, branch
- Pipeline definition: path and version of the workflow
- Executor: GitHub Actions + execution ID
- Input parameters: branch, tag, trigger

The attestation is generated automatically by `cosign attest` and kept as an artefact.

### Extensibility

When the project produces other artefacts (container images, packages, Helm charts), the same mechanism applies: the release workflow invokes `cosign sign-blob` for every artefact in the list that will then be declared in `pipeline/artefatti.tsv`, a file that does not exist today.

---
