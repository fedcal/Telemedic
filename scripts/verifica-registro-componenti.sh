#!/usr/bin/env bash
# Controllo di costruzione - G2 e G5, distinta dei materiali (docs/01_technical/09 §3).
#
# Confronta il registro delle annotazioni di componenti di terze parti (pipeline/annotazioni-componenti.tsv)
# con la distinta dei materiali (SBOM, Software Bill of Materials) generata dalla catena di
# costruzione, e fallisce quando:
#   1. Un componente è presente nella distinta e assente dalle annotazioni (G5)
#   2. Un componente ha licenza segnata come «incompatibile» o «indeterminabile» (G2)
#
# La regola è dichiarata nel controllo G5 di docs/10_fondamenti/17 §9.2: «È il meccanismo che
# impedisce a una dipendenza di entrare senza essere stata valutata». Questo controllo automatizza
# quella dichiarazione.
#
# Perché il controllo esista significa che ogni dipendenza in produzione passa attraverso tre
# filtri:
#   1. Viene installata (dipendenza di package.json)
#   2. Viene generata nella distinta (artefatto CycloneDX)
#   3. Viene confrontata con le annotazioni versionato (questo controllo)
#
# Una dipendenza in distinta e non annotata è una valutazione saltata. Una valutazione saltata
# sulla licenza trasferisce il rischio legale a chi installa il sistema, che è precisamente ciò
# che una scelta di licenza come Apache-2.0 voleva evitare.
#
# COLLAUDABILITÀ. Il controllo accetta due variabili d'ambiente:
#   SBOM_FILE - percorso al file di distinta CycloneDX JSON (per difetto il generato dalla pipeline)
#   RADICE_SORGENTI - radice per la lettura del registro (per difetto la radice del repository)
#
# Senza queste, il controllo non sarebbe collaudabile su tenute statiche senza toccare gli
# artefatti reali della pipeline. È la stessa convenzione usata da scripts/verifica-dati-sintetici.sh.
#
set -euo pipefail

cd "$(dirname "$0")/.."

SBOM_FILE="${SBOM_FILE:-sbom-website.json}"
RADICE_SORGENTI="${RADICE_SORGENTI:-.}"
RADICE_SORGENTI="${RADICE_SORGENTI%/}"
[ -n "$RADICE_SORGENTI" ] || RADICE_SORGENTI="/"

REGISTRO="${RADICE_SORGENTI%/}/pipeline/annotazioni-componenti.tsv"

esito=0

segnala() {
  printf '\n\033[31m✗ %s\033[0m\n%s\n' "$1" "$2"
  esito=1
}

if [ ! -f "$REGISTRO" ]; then
  printf '\033[31m✗ Registro dei componenti inesistente: %s\033[0m\n' "$REGISTRO"
  printf 'Esegui il controllo dalla radice del repository, oppure indica RADICE_SORGENTI.\n'
  exit 2
fi

if [ ! -f "$SBOM_FILE" ]; then
  printf '\033[31m✗ Distinta dei materiali inesistente: %s\033[0m\n' "$SBOM_FILE"
  printf 'La distinta deve essere generata dalla pipeline prima di questo controllo.\n'
  printf 'Indica SBOM_FILE se la distinta si trova in una posizione diversa.\n'
  exit 2
fi

# --- 1. Lettura del registro. ---
#
# Stessa tecnica di verifica-collocazione-dei-controlli.sh: usa «cut» per estrarre i campi in
# base alla posizione, non «read», che fonde le tabulazioni consecutive.
#
campo() { printf '%s' "$1" | cut -f"$2"; }

# Carica il registro in tre array paralleli: chiave (nome@versione), licenza, compatibilità.
declare -A reg_licenza reg_compatibilita reg_motivo
intestazione=0

while IFS= read -r linea || [ -n "$linea" ]; do
  case "$linea" in ''|'#'*) continue;; esac

  if [ "$intestazione" -eq 0 ]; then
    componente_col=$(campo "$linea" 1)
    if [ "$componente_col" != "componente" ]; then
      printf '\033[31m✗ Intestazione attesa nel registro a %s\033[0m\n' "$REGISTRO"
      exit 1
    fi
    intestazione=1
    continue
  fi

  componente=$(campo "$linea" 1)
  versione=$(campo "$linea" 2)
  licenza=$(campo "$linea" 3)
  compatibilita=$(campo "$linea" 4)
  motivo=$(campo "$linea" 5)

  if [ -z "$componente" ] || [ -z "$versione" ]; then
    printf '\033[31m✗ Riga malformata nel registro: %s\033[0m\n' "$linea"
    exit 1
  fi

  chiave="${componente}@${versione}"
  reg_licenza["$chiave"]="$licenza"
  reg_compatibilita["$chiave"]="$compatibilita"
  reg_motivo["$chiave"]="$motivo"
done < "$REGISTRO"

# --- 2. Lettura della distinta (CycloneDX JSON). ---
#
# Estrae ogni componente con jq: nome, versione, licenza. Raccoglie in elenco temporaneo.
#
if ! command -v jq &> /dev/null; then
  printf '\033[31m✗ jq non disponibile: necessario per leggere la distinta\033[0m\n'
  exit 2
fi

componenti_distinta=$(
  jq -r '.components[] | select(.type == "library" or .type == "application") |
          "\(.name) \(.version) \(.licenses[]?.license?.name // "NOLICENSE")"' \
    "$SBOM_FILE" 2>/dev/null | sort -u
)

if [ -z "$componenti_distinta" ]; then
  printf '\033[33m· Nessun componente trovato nella distinta: %s\033[0m\n' "$SBOM_FILE"
  exit 0
fi

# --- 3. Confronto e verifica. ---
#
# Per ogni componente della distinta:
#   1. Controlla che sia annotato nel registro
#   2. Controlla che la licenza sia segnata come compatibile (non indeterminabile o incompatibile)
#
rilievi=0

while IFS=' ' read -r nome versione licenza_distinta; do
  chiave="${nome}@${versione}"

  # Il componente è annotato?
  if [ -z "${reg_licenza["$chiave"]:-}" ]; then
    segnala "Componente non annotato" \
"Componente: $nome
Versione: $versione
Riga: aggiungi una riga a pipeline/annotazioni-componenti.tsv con il componente dichiarato
nel registro.

Ragione (G5): È il meccanismo che impedisce a una dipendenza di entrare senza essere
stata valutata. Il controllo non accetta componenti anonimi."
    rilievi=$((rilievi+1))
    continue
  fi

  # La licenza è compatibile?
  # Il fallback ":-" non è pignoleria: sotto «set -u» un accesso a una chiave assente
  # termina lo script con un errore bash, che esce comunque diverso da zero e quindi
  # SOMIGLIA a un rilievo corretto. Un collaudo che asserisce sul solo codice di uscita
  # non distingue i due casi, e il controllo passerebbe fallendo per il motivo sbagliato.
  compatibilita="${reg_compatibilita["$chiave"]:-}"
  if [ -z "$compatibilita" ]; then
    segnala "Annotazione priva della compatibilità dichiarata" \
"Componente: $nome
Il componente è annotato ma la colonna della compatibilità è vuota. Una casella vuota
non è una dichiarazione: va scritta «compatibile», «indeterminabile» o «incompatibile»."
    rilievi=$((rilievi+1))
    continue
  fi
  if [ "$compatibilita" != "compatibile" ]; then
    segnala "Licenza non compatibile o indeterminabile" \
"Componente: $nome
Versione: $versione
Licenza dichiarata: ${reg_licenza["$chiave"]}
Compatibilità dichiarata: $compatibilita
Riga: $REGISTRO

Ragione (G2): Una licenza incompatibile trasferisce il problema all'integratore, che è ciò
che la scelta di licenza Apache-2.0 voleva evitare. Una licenza indeterminabile impedisce
al progetto di dichiarare la compatibilità.

Soluzione: sostituisci il componente con uno che dichiari licenza compatibile (MIT, ISC,
BSD-3-Clause, Apache-2.0), oppure apri una valutazione legale formale se il componente è
indispensabile. Non è una decisione da configurazione: è una valutazione legale."
    rilievi=$((rilievi+1))
    continue
  fi
done <<< "$componenti_distinta"

# --- 4. Verdetto finale. ---
n_componenti=$(printf '%s\n' "$componenti_distinta" | wc -l)

if [ "$esito" -eq 0 ]; then
  printf '\033[32m✓ %d componente/i nella distinta, tutti annotati e con licenza compatibile.\033[0m\n' "$n_componenti"
else
  printf '\n\033[31m✗ Rilievi: %d\033[0m\n' "$rilievi"
fi

exit "$esito"
