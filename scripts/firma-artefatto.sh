#!/usr/bin/env bash
# Firma di un artefatto con identità effimera della pipeline di GitHub Actions
# (L-17 di T-03, criterio 7 - firma e provenienza).
#
# Meccanismo: identità OIDC di GitHub Actions + Sigstore/cosign, nessuna chiave privata
# custodita nel repository. La firma è registrata nel registro di trasparenza di Rekor
# e verificabile da chiunque con i comandi dichiarati in VERIFICA-DELL-ARTEFATTO.md.
#
# Uso:
#   ./scripts/firma-artefatto.sh <artefatto> <output-sig> <output-att>
#
# Parametri:
#   <artefatto>    - percorso dell'artefatto da firmare
#   <output-sig>   - percorso del file di firma (es. artefatto.txt.sig)
#   <output-att>   - percorso dell'attestazione di provenienza (es. artefatto.txt.att)
#
# Variabili d'ambiente (fornite dalla pipeline GitHub Actions):
#   GITHUB_SERVER_URL - URL del server GitHub (es. https://github.com)
#   GITHUB_REPOSITORY - repository (es. fedcal/Telemedic)
#   GITHUB_REF_NAME   - branch name (es. main)
#   GITHUB_SHA        - commit hash
#   GITHUB_RUN_ID     - execution ID
#   GITHUB_RUN_NUMBER - run number
#   GITHUB_TRIGGERING_ACTOR - chi ha scatenato l'esecuzione

set -euo pipefail

artefatto="${1:?Artefatto non specificato}"
output_sig="${2:?Output firma non specificato}"
output_att="${3:?Output attestazione non specificato}"

[ -e "$artefatto" ] || { echo "Errore: artefatto inesistente: $artefatto" >&2; exit 1; }

# Verifica che cosign sia disponibile
if ! command -v cosign &>/dev/null; then
  echo "Errore: cosign non è installato. Vedi https://github.com/sigstore/cosign" >&2
  exit 1
fi

# Verifica che siamo in GitHub Actions (GITHUB_TOKEN è una variabile speciale)
if [ -z "${GITHUB_TOKEN:-}" ]; then
  echo "Avviso: GITHUB_TOKEN non disponibile. La firma richiede OIDC di GitHub Actions." >&2
fi

echo "Firma dell'artefatto: $artefatto"

# Calcola il nome e l'hash prima di eventuali trasformazioni
nome_artefatto="$(basename "$artefatto")"
hash_artefatto=""

# Se l'artefatto è una cartella, comprimila per la firma
# Calcola l'hash PRIMA della compressione per l'attestazione
artefatto_per_firma="$artefatto"
if [ -d "$artefatto" ]; then
  echo "L'artefatto è una cartella: compressione in tar.gz per la firma"
  # Calcola l'hash della cartella per l'attestazione
  hash_artefatto=$(tar --gzip --create --to-stdout --directory "$(dirname "$artefatto")" "$(basename "$artefatto")" | sha256sum | cut -d' ' -f1)

  artefatto_per_firma="/tmp/artefatto-$(date +%s%N).tar.gz"
  tar --gzip --create --file "$artefatto_per_firma" --directory "$(dirname "$artefatto")" "$(basename "$artefatto")"
  trap "rm -f '$artefatto_per_firma'" EXIT
else
  # Se è un file, calcola l'hash del file
  hash_artefatto=$(sha256sum "$artefatto" | cut -d' ' -f1)
fi

# Firma dell'artefatto con cosign e identità effimera
# --identity-token è il token OIDC fornito da GitHub Actions
# La firma è automaticamente registrata in Rekor (registro di trasparenza pubblico)
# Nota: cosign v3.x produce due file separati (firma + attestazione);
# cosign v4.x ha cambiato il formato di output predefinito a bundle JSON.
# Questo script usa cosign v3 che supporta --output-signature.
# --yes NON e' una comodita': senza, cosign apre una richiesta interattiva di consenso alla
# registrazione nel registro di trasparenza pubblico e, non trovando un terminale, la considera
# RIFIUTATA. In corsia l'errore che si legge e' «user declined the prompt», che descrive un gesto
# che nessuno ha compiuto: e' il quinto difetto della pila che questa corsia ha accumulato senza
# essere mai stata eseguita, e come i primi quattro era invisibile finche' il precedente non era
# corretto. Il consenso e' dato qui, consapevolmente: la firma e il certificato effimero finiscono
# in un registro pubblico e immutabile, ed e' esattamente lo scopo della firma keyless.
cosign sign-blob \
  --yes \
  --output-signature "$output_sig" \
  "$artefatto_per_firma"

echo "Firma salvata in: $output_sig"

# Attestazione di provenienza in formato SLSA
# Contiene: sorgente, revisione, definizione della pipeline, esecutore, parametri di ingresso
cat > "$output_att" <<EOF
{
  "attestationType": "https://slsa.dev/provenance/v0.2",
  "subject": [
    {
      "name": "$nome_artefatto",
      "digest": {
        "sha256": "$hash_artefatto"
      }
    }
  ],
  "predicate": {
    "builder": {
      "id": "${GITHUB_SERVER_URL:-https://github.com}/actions"
    },
    "buildType": "https://github.com/actions",
    "invocation": {
      "configSource": {
        "uri": "${GITHUB_SERVER_URL:-https://github.com}/${GITHUB_REPOSITORY}",
        "digest": {
          "sha1": "${GITHUB_SHA}"
        },
        "entryPoint": ".github/workflows/fascia-di-rilascio.yml"
      },
      "parameters": {
        "ref": "${GITHUB_REF_NAME}",
        "sha": "${GITHUB_SHA}",
        "run_id": "${GITHUB_RUN_ID}",
        "run_number": "${GITHUB_RUN_NUMBER}",
        "actor": "${GITHUB_TRIGGERING_ACTOR}"
      }
    },
    "materials": [],
    "byproducts": {
      "signingKey": "OIDC token from GitHub Actions (ephemeral identity, no private key stored)"
    }
  }
}
EOF

echo "Attestazione di provenienza salvata in: $output_att"
echo "✓ Firma e provenienza completate. Nessun segreto né chiave privata custodita."
