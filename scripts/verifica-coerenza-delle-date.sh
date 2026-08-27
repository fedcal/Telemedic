#!/usr/bin/env bash
# Coerenza delle date dei traguardi fra le tre rappresentazioni che le portano.
#
# PERCHE' ESISTE. La data di un traguardo e' scritta tre volte nello stesso capitolo:
#   1. nella SCHEDA del traguardo, che e' la sola delle tre a portare con se' la motivazione;
#   2. nella barra del DIAGRAMMA di Gantt, come data di fine;
#   3. nella riga della TABELLA DI SINTESI del paragrafo 7.1.
# Il 27 agosto 2026 una ritaratura del calendario ha toccato le schede e non le altre due, in
# entrambe le lingue: per un giorno il capitolo ha detto «5 settembre» in un punto e
# «26 settembre» in altri due, e nessun controllo se ne e' accorto. Questo controllo esiste per
# quell'errore, ed e' la voce D-28 del runbook degli errori.
#
# LA REGOLA. Se la scheda di un traguardo porta una data di calendario, quella data deve
# comparire identica come fine della sua barra nel diagramma e come data nella tabella di
# sintesi; e la data italiana deve coincidere con quella inglese. Le date che non sono di
# calendario - «2027», «successiva al congelamento dell'interfaccia» - non sono confrontabili e
# vengono SALTATE, ma il controllo dichiara quali salta invece di tacerle: un salto silenzioso e'
# indistinguibile da una verifica riuscita.
#
# CIO' CHE NON VERIFICA. Non giudica se una data sia giusta: quella e' una decisione, non una
# proprieta' del testo. Verifica solo che le tre copie dicano la stessa cosa.
#
# Uscita: 0 conforme, 1 violazione, 2 errore d'uso.
set -uo pipefail

cd "$(dirname "$0")/.."

TRAGUARDI_IT="${TRAGUARDI_IT:-docs/09_roadmap/02-traguardi.md}"
TRAGUARDI_EN="${TRAGUARDI_EN:-website/i18n/en/docusaurus-plugin-content-docs/current/09_roadmap/02-traguardi.md}"

for f in "$TRAGUARDI_IT" "$TRAGUARDI_EN"; do
  if [ ! -r "$f" ]; then
    printf 'Errore d'\''uso: il capitolo dei traguardi «%s» non esiste o non e'\'' leggibile.\n' "$f" >&2
    printf 'Percorsi configurabili con TRAGUARDI_IT e TRAGUARDI_EN.\n' >&2
    exit 2
  fi
done

. "$(dirname "$0")/lib/date-dei-traguardi.sh"

VERDE=$'\033[32m'; ROSSO=$'\033[31m'; GIALLO=$'\033[33m'; FINE_COLORE=$'\033[0m'
rilievi=0
saltati=""

segnala() {
  printf '%s✗ %s%s\n' "$ROSSO" "$1" "$FINE_COLORE" >&2
  rilievi=$((rilievi + 1))
}

declare -A DATO=()
for lingua in it en; do
  case "$lingua" in
    it) file="$TRAGUARDI_IT" ;;
    en) file="$TRAGUARDI_EN" ;;
  esac
  while IFS= read -r _r || [ -n "$_r" ]; do
    [ -n "$_r" ] || continue
    traguardo=$(printf '%s' "$_r" | cut -f1)
    origine=$(printf '%s' "$_r" | cut -f2)
    valore=$(printf '%s' "$_r" | cut -f3)
    [ -n "$traguardo" ] || continue
    DATO["$lingua/$traguardo/$origine"]="$valore"
    if [ "$origine" = "scheda" ]; then
      DATO["$lingua/elenco"]="${DATO["$lingua/elenco"]:-} $traguardo"
    fi
  done < <(estrai "$file")
done

if [ -z "${DATO[it/elenco]:-}" ]; then
  printf 'Errore d'\''uso: nessuna scheda di traguardo riconosciuta in «%s».\n' "$TRAGUARDI_IT" >&2
  printf 'Il capitolo deve contenere titoli nella forma «### `T-NN` - ...» seguiti dalla riga di classe.\n' >&2
  exit 2
fi

esaminati=0
for lingua in it en; do
  for traguardo in ${DATO["$lingua/elenco"]:-}; do
    scheda="${DATO["$lingua/$traguardo/scheda"]:-}"
    if [ "$scheda" = "illeggibile" ]; then
      segnala "$lingua: $traguardo porta un anno nella riga di classe e la data non e' leggibile. Un formato non riconosciuto non e' una data non di calendario: e' un rilievo."
      continue
    fi
    if [ "$scheda" = "non-calendariale" ]; then
      saltati="${saltati} $lingua/$traguardo"
      continue
    fi
    esaminati=$((esaminati + 1))
    gantt="${DATO["$lingua/$traguardo/gantt"]:-}"
    tabella="${DATO["$lingua/$traguardo/tabella"]:-}"

    if [ -z "$gantt" ]; then
      segnala "$lingua: $traguardo ha una data di calendario nella scheda ($scheda) ma nessuna barra nel diagramma di Gantt."
    elif [ "$gantt" != "$scheda" ]; then
      segnala "$lingua: $traguardo - la scheda dice $scheda, la barra del diagramma finisce il $gantt."
    fi

    if [ -z "$tabella" ]; then
      segnala "$lingua: $traguardo ha una data di calendario nella scheda ($scheda) ma nessuna riga nella tabella di sintesi."
    elif [ "$tabella" = "non-calendariale" ]; then
      segnala "$lingua: $traguardo - la scheda dice $scheda, la tabella di sintesi non porta una data di calendario."
    elif [ "$tabella" != "$scheda" ]; then
      segnala "$lingua: $traguardo - la scheda dice $scheda, la tabella di sintesi dice $tabella."
    fi
  done
done

for traguardo in ${DATO[it/elenco]:-}; do
  it_scheda="${DATO["it/$traguardo/scheda"]:-}"
  en_scheda="${DATO["en/$traguardo/scheda"]:-}"
  if [ -z "$en_scheda" ]; then
    segnala "$traguardo esiste nel capitolo italiano e non in quello inglese."
  elif [ "$it_scheda" != "$en_scheda" ] && [ "$it_scheda" != "non-calendariale" ]; then
    segnala "$traguardo - l'italiano dice $it_scheda, l'inglese dice $en_scheda."
  fi
done

if [ -n "$saltati" ]; then
  printf '%sSaltati, perche'\'' la scheda non porta una data di calendario:%s%s\n' \
    "$GIALLO" "$saltati" "$FINE_COLORE"
fi

if [ "$rilievi" -gt 0 ]; then
  printf '%s✗ %d divergenza/e fra scheda, diagramma e tabella di sintesi.%s\n' \
    "$ROSSO" "$rilievi" "$FINE_COLORE" >&2
  exit 1
fi

printf '%s✓ %d data/e di traguardo, coerenti fra scheda, diagramma e tabella nelle due lingue.%s\n' \
  "$VERDE" "$esaminati" "$FINE_COLORE"
exit 0
