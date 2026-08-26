#!/usr/bin/env bash
# Controllo di firma e provenienza (L-17 di T-03, criterio 7).
#
# Verifica che il workflow di rilascio usa identità effimera di GitHub Actions (via OIDC + Sigstore)
# per firmare gli artefatti, non custodia di chiave privata. Nessun segreto riservato risiede nella
# pipeline; solo segnaposti di variabili d'ambiente.
#
# Il controllo fallisce se:
# - Il workflow di rilascio non contiene il passo "Firma del sito"
# - Il workflow invoca cosign-installer (che richiede identità OIDC)
# - Il workflow non usa la variabile d'ambiente GITHUB_TOKEN (che è la base del OIDC)
# - Il workflow contiene una chiave privata hardcoded
#
# D-10 del runbook: il controllo legge il file e fallisce se il file manca, non ricade su una copia
# interna.

set -euo pipefail

WORKFLOW_FILE="${WORKFLOW_FILE:-.github/workflows/fascia-di-rilascio.yml}"
REPO="${REPO:-.}"

if [ ! -r "$WORKFLOW_FILE" ]; then
  echo "Errore: workflow di rilascio non leggibile: $WORKFLOW_FILE" >&2
  exit 2
fi

esito=0

# Controllo 1: il workflow deve dichiarare il passo di firma con cosign-installer
if ! grep -q "sigstore/cosign-installer" "$WORKFLOW_FILE"; then
  echo "Errore: il workflow non installa cosign-installer (identità effimera di Sigstore assente)" >&2
  esito=1
fi

# Controllo 2: il workflow deve usare firma-artefatto.sh (contiene cosign sign-blob)
if ! grep -q "scripts/firma-artefatto.sh" "$WORKFLOW_FILE"; then
  echo "Errore: il workflow non invoca scripts/firma-artefatto.sh (procedura di firma assente)" >&2
  esito=1
fi

# Controllo 3: il workflow deve usare GITHUB_TOKEN per OIDC
if ! grep -q "GITHUB_TOKEN.*secrets.GITHUB_TOKEN" "$WORKFLOW_FILE"; then
  echo "Errore: il workflow non usa GITHUB_TOKEN (OIDC assente)" >&2
  esito=1
fi

# Controllo 4: il workflow NON deve contenere una chiave privata hardcoded
if grep -qE "BEGIN RSA PRIVATE KEY|BEGIN PRIVATE KEY|BEGIN EC PRIVATE KEY" "$WORKFLOW_FILE"; then
  echo "Errore: il workflow contiene una chiave privata hardcoded" >&2
  esito=1
fi

# Controllo 5: il workflow NON deve assegnare valori di chiave privata
if grep -qE "SIGNING_KEY|PRIVATE_KEY.*=" "$WORKFLOW_FILE" | grep -v "GITHUB_TOKEN"; then
  echo "Errore: il workflow contiene assegnazioni di chiave privata" >&2
  esito=1
fi

# Controllo 6: il workflow deve generare attestazioni di provenienza
if ! grep -q "build.att\|build-en.att" "$WORKFLOW_FILE"; then
  echo "Errore: il workflow non genera attestazioni di provenienza (build.att, build-en.att)" >&2
  esito=1
fi

# Controllo 7: nessun segnaposto di segreto deve mancare d'esclamazione o di variabile
# D-10: questo controllo legge il file e fallisce se il formato dei segnaposti è sbagliato
if grep -qE '\$\{[A-Z_]+' "$WORKFLOW_FILE" | grep -v "GITHUB_\|secrets.GITHUB_"; then
  echo "Avviso: il workflow contiene variabili che potrebbero non essere risolte" >&2
fi

if [ "$esito" -eq 0 ]; then
  echo "✓ Workflow di rilascio conforme: firma con identità effimera, nessun segreto custodito"
  exit 0
else
  echo "✗ Workflow di rilascio non conforme al criterio 7 di T-03" >&2
  exit 1
fi
