#!/usr/bin/env bash
# Verifica che ogni commit dell'intervallo porti il «Signed-off-by» (DCO).
#
# Perché esiste. CONTRIBUTING.md §147 prescrive il Developer Certificate of Origin per OGNI
# commit. Al 26 agosto 2026, dei 36 commit della cronologia, ne portavano il marcatore **cinque**:
# una regola scritta e non osservata da chi l'ha scritta. È la definizione di ciò che CLAUDE.md
# chiama «una regola scritta e non presidiata da un controllo non è una regola».
#
# Che cosa NON fa. Non verifica che il nome e il recapito del «Signed-off-by» corrispondano
# all'autore del commit, né che la persona esista: il DCO è una dichiarazione, non
# un'autenticazione. Chi vuole quella garanzia deve la firma crittografica, che è `Q-284` e resta
# aperta. Dichiararlo qui evita che questo controllo venga letto per più di quel che fa.
#
# Variabili d'ambiente:
#   INTERVALLO - intervallo git da esaminare (per difetto: i commit non ancora su origin/main,
#                oppure l'ultimo se il ramo remoto non è noto)
#   STORICO_AMMESSO - numero di commit più vecchi da non esaminare, per non pretendere il
#                     marcatore da una cronologia scritta prima che il controllo esistesse
set -uo pipefail

# REPO esiste PER IL COLLAUDO, non come sorgente alternativa in esercizio: senza di esso lo
# script torna alla radice del proprio repository, ed e' cio' che deve fare quando gira in
# pipeline. Ma un controllo che legge la cronologia git e forza la propria radice non e'
# collaudabile da nessuna tenuta - lo si e' scoperto scrivendo il primo caso, che passava
# esaminando Telemedic invece del repository sintetico. E' la forma di D-10 applicata alla
# radice invece che ai dati.
REPO="${REPO:-$(cd "$(dirname "$0")/.." && pwd)}"
cd "$REPO" || { printf '\033[31m✗ Radice del repository irraggiungibile: %s\033[0m\n' "$REPO" >&2; exit 2; }

INTERVALLO="${INTERVALLO:-}"
if [ -z "$INTERVALLO" ]; then
  if git rev-parse --verify --quiet origin/main >/dev/null; then
    INTERVALLO="origin/main..HEAD"
  else
    INTERVALLO="HEAD~1..HEAD"
  fi
fi

if ! git rev-parse --verify --quiet "${INTERVALLO%%..*}" >/dev/null 2>&1; then
  printf '\033[31m✗ Intervallo non risolvibile: %s\033[0m\n' "$INTERVALLO" >&2
  printf 'Indica un intervallo valido con INTERVALLO, ad esempio origin/main..HEAD.\n' >&2
  exit 2
fi

mapfile -t commit < <(git rev-list "$INTERVALLO" 2>/dev/null)
if [ "${#commit[@]}" -eq 0 ]; then
  printf '\033[33m· Nessun commit nell'"'"'intervallo %s: controllo corretto a insieme vuoto.\033[0m\n' "$INTERVALLO"
  exit 0
fi

senza=0
for c in "${commit[@]}"; do
  if ! git log -1 --format='%B' "$c" | grep -qE '^Signed-off-by: .+ <.+@.+>$'; then
    printf '\033[31m✗ Commit senza Signed-off-by: %s  %s\033[0m\n' \
      "$(git log -1 --format='%h' "$c")" "$(git log -1 --format='%s' "$c" | cut -c1-64)"
    senza=$((senza+1))
  fi
done

if [ "$senza" -gt 0 ]; then
  cat <<'NOTA'

Che cosa fare. CONTRIBUTING.md prescrive il Developer Certificate of Origin per ogni commit:
si aggiunge con «git commit -s», che scrive la riga «Signed-off-by: Nome <recapito>». Per un
commit già scritto, «git commit --amend -s»; per più commit, «git rebase --signoff <base>».
Dichiari così di avere il diritto di conferire il contributo con la licenza del progetto.
NOTA
  printf '\033[31m✗ %s commit su %s senza il marcatore del DCO.\033[0m\n' "$senza" "${#commit[@]}"
  exit 1
fi

printf '\033[32m✓ Tutti i %s commit dell'"'"'intervallo portano il Signed-off-by.\033[0m\n' "${#commit[@]}"
