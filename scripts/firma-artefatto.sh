#!/usr/bin/env bash
# Firma di un artefatto con identità effimera della pipeline di GitHub Actions
# (L-17 di T-03, criterio 7 - firma e provenienza).
#
# Meccanismo: identità OIDC di GitHub Actions + Sigstore/cosign, nessuna chiave privata
# custodita nel repository. La firma è registrata nel registro di trasparenza di Rekor
# e verificabile da chiunque con i comandi dichiarati in VERIFICA-DELL-ARTEFATTO.md.
#
# Uso:
#   ./scripts/firma-artefatto.sh <artefatto> <output-sig> <output-att> [<output-cert>]
#
# Parametri:
#   <artefatto>    - percorso dell'artefatto da firmare
#   <output-sig>   - percorso del file di firma (es. artefatto.txt.sig)
#   <output-att>   - percorso dell'attestazione di provenienza (es. artefatto.txt.att)
#   <output-cert>  - percorso del certificato effimero (per difetto <output-sig> con estensione
#                    .crt al posto di .sig). SENZA DI ESSO LA FIRMA NON E' VERIFICABILE: si veda
#                    il commento al comando di firma.
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
output_cert="${4:-${output_sig%.sig}.crt}"

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

# SE L'ARTEFATTO È UNA CARTELLA, SI FIRMA L'ARCHIVIO - E L'ARCHIVIO SI CONSERVA.
#
# La prima stesura scriveva l'archivio in /tmp con un nome che conteneva l'istante in nanosecondi
# e lo RIMUOVEVA con una trappola sull'uscita. Ne discendevano due difetti che rendevano la firma
# inverificabile da chiunque, ed è il punto in cui una firma smette di essere una firma:
#
#   1. NESSUNO POTEVA OTTENERE CIÒ CHE ERA STATO FIRMATO. La firma è sull'archivio, l'archivio
#      spariva alla fine dello script, e la corsia pubblicava soltanto la distinta dei materiali.
#      Il criterio 8 di T-03 chiede che la procedura di verifica sia DIMOSTRATA su un artefatto
#      firmato: non è dimostrabile su un file che non esiste più.
#   2. L'IMPRONTA NELL'ATTESTAZIONE NON ERA QUELLA DELL'ARCHIVIO FIRMATO. Il flusso veniva
#      compresso DUE volte - una per calcolare l'impronta, una per scrivere il file - e due
#      compressioni gzip successive differiscono nell'intestazione. L'attestazione dichiarava
#      quindi l'impronta di un flusso che non è mai stato firmato e che nessuno può riprodurre.
#
# L'archivio è ora deterministico e si conserva accanto alla firma: ordine dei nomi fissato,
# tempi e proprietari azzerati, e `gzip -n` perché altrimenti il nome e l'istante del file finiscono
# nell'intestazione compressa e due archivi dello stesso contenuto hanno impronte diverse. Chi
# verifica scarica l'archivio, la firma e l'attestazione, e i tre si corrispondono.
artefatto_per_firma="$artefatto"
archivio_conservato=""
if [ -d "$artefatto" ]; then
  archivio_conservato="${artefatto}.tar.gz"
  echo "L'artefatto è una cartella: si firma l'archivio deterministico $archivio_conservato"
  tar --create \
      --sort=name \
      --mtime=@0 \
      --owner=0 --group=0 --numeric-owner \
      --directory "$(dirname "$artefatto")" \
      "$(basename "$artefatto")" \
    | gzip -n > "$archivio_conservato"
  artefatto_per_firma="$archivio_conservato"
fi
# L'impronta è SEMPRE quella del file che viene firmato, mai di un flusso calcolato a parte.
hash_artefatto=$(sha256sum "$artefatto_per_firma" | cut -d' ' -f1)
nome_firmato="$(basename "$artefatto_per_firma")"

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
# --output-certificate NON E' FACOLTATIVO, ED E' IL SESTO DIFETTO DI QUESTA CORSIA.
# La firma keyless non ha una chiave pubblica da distribuire: l'identita' che ha firmato vive nel
# CERTIFICATO EFFIMERO emesso al momento della firma, e chi verifica deve poterlo confrontare con
# l'identita' che si aspetta. Senza, `cosign verify-blob --signature ...` risponde «provide a key
# with --key or --sk, a certificate to verify against with --certificate, or a bundle»: la firma
# esiste, e' registrata nel registro di trasparenza, e non e' verificabile da nessuno.
# Il difetto e' stato scoperto il 27 agosto 2026 ESEGUENDO la procedura pubblicata in
# VERIFICA-DELL-ARTEFATTO.md su un artefatto realmente firmato - cioe' facendo esattamente cio' che
# il criterio 8 di T-03 prescrive. Nessuna lettura lo avrebbe mostrato: il comando di firma non
# fallisce, e i due file che produceva avevano l'aspetto di un lavoro completo.
cosign sign-blob \
  --yes \
  --output-signature "$output_sig" \
  --output-certificate "$output_cert" \
  "$artefatto_per_firma"

echo "Firma salvata in: $output_sig"
echo "Certificato effimero salvato in: $output_cert"

# Attestazione di provenienza in formato SLSA
# Contiene: sorgente, revisione, definizione della pipeline, esecutore, parametri di ingresso
cat > "$output_att" <<EOF
{
  "attestationType": "https://slsa.dev/provenance/v0.2",
  "subject": [
    {
      "name": "$nome_firmato",
      "digest": {
        "sha256": "$hash_artefatto"
      },
      "contenuto": "$nome_artefatto"
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
if [ -n "$archivio_conservato" ]; then
  echo "Archivio firmato conservato in: $archivio_conservato"
  echo "  impronta sha256: $hash_artefatto"
fi
echo "✓ Firma e provenienza completate. Nessun segreto né chiave privata custodita."
