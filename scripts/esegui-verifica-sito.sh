#!/usr/bin/env bash
# Procedura eseguibile - criterio 6 di T-07.
#
# Esegue la verifica dei criteri 1 (navigazione, incluse le voci di menu), 2 (ricerca) e 3
# (avviso di traduzione in corso) del traguardo T-07, e REGISTRA l'esito in
# registro/verifiche-sito-di-documentazione.tsv - un registro in sola aggiunta, versionato,
# consultabile senza credenziali, che non scade: la stessa disciplina già usata da
# registro/identificativi-requisiti.tsv (vedi registro/README.md), scelta al posto di un
# registro di esecuzione della catena di costruzione perché quest'ultimo non è una
# registrazione (l'artefatto della pipeline scade in novanta giorni, prima del rilascio).
#
# LA PROCEDURA, IN CHIARO (perché sia leggibile anche da chi non esegue questo script):
#   1. Costruire il sito (in website/: npm run build). Se la costruzione fallisce, il criterio 1
#      (collegamenti interni bloccanti) NON è soddisfatto: la procedura lo registra e si ferma,
#      perché senza un artefatto costruito gli altri controlli non hanno nulla da esaminare.
#   2. scripts/verifica-voci-di-menu.sh - seconda metà del criterio 1: le voci di navigazione.
#   3. scripts/verifica-ricerca.sh - criterio 2: la ricerca funziona nella lingua attiva.
#   4. scripts/verifica-avviso-traduzione.sh - criterio 3: l'avviso di traduzione in corso.
#   5. Una riga si aggiunge al registro con la data, il commit esaminato, l'esito di ciascun
#      criterio, e la dichiarazione - non una conformità, una lacuna - di chi ha eseguito la
#      verifica (vedi §1.6 del piano T-07-sito-di-documentazione.md e Q-189: sotto D54 non è
#      producibile che l'esecutore sia diverso da chi ha costruito il sito).
#
# RIPETIBILITÀ. Eseguita due volte sullo stesso commit, senza modifiche fra le due esecuzioni,
# questa procedura produce lo stesso esito per ciascun criterio: è la sola prova che la procedura
# sia davvero una procedura e non un verbale (§1.6 del piano).
#
# COSTRUIRE IL SITO O NO. Per difetto lo script costruisce il sito da zero (rm -rf build).
# SALTA_COSTRUZIONE=1 riusa un artefatto già presente in website/build (utile per non pagare due
# volte il costo di una costruzione completa quando la si è già eseguita nella stessa sessione),
# ma allora il criterio 1 non viene ri-accertato da questa esecuzione: la riga di registro lo
# dichiara.
set -euo pipefail

cd "$(dirname "$0")/.."
RADICE="$PWD"

REGISTRO="registro/verifiche-sito-di-documentazione.tsv"
DATA="$(date -u +%Y-%m-%d)"
COMMIT="$(git rev-parse HEAD 2>/dev/null || echo 'non-versionato')"
SPORCO=""
if ! git diff --quiet 2>/dev/null || ! git diff --cached --quiet 2>/dev/null; then
  SPORCO=" (con modifiche non commesse nell'albero di lavoro al momento dell'esecuzione)"
fi

esito_criterio1="non eseguito"
esito_criterio2="non eseguito"
esito_criterio3="non eseguito"
nota=""

printf '== Procedura di verifica del sito, criterio 6 di T-07 ==\n'
printf 'Data: %s. Commit: %s%s.\n\n' "$DATA" "$COMMIT" "$SPORCO"

if [ "${SALTA_COSTRUZIONE:-0}" != "1" ]; then
  printf -- '--- 1. Costruzione del sito (npm run build) ---\n'
  if (cd website && rm -rf build && npm run build) > /tmp/esegui-verifica-sito-build.log 2>&1; then
    printf 'Costruzione riuscita: i quattro parametri onBroken* bloccanti non hanno rilevato\n'
    printf 'collegamenti o ancore rotte. Criterio 1, metà «collegamenti»: soddisfatto.\n'
    esito_criterio1="collegamenti: soddisfatto;"
  else
    printf '\033[31mCostruzione FALLITA: vedi /tmp/esegui-verifica-sito-build.log\033[0m\n'
    esito_criterio1="collegamenti: FALLITO (costruzione interrotta);"
    nota="Costruzione fallita: gli accertamenti successivi che dipendono dall'artefatto sono saltati."
  fi
else
  printf -- '--- 1. Costruzione del sito SALTATA (SALTA_COSTRUZIONE=1): riuso website/build ---\n'
  esito_criterio1="collegamenti: non ri-accertato in questa esecuzione (costruzione riusata);"
fi

if [ -d "website/build" ] && [ -d "website/build/en" ]; then
  printf -- '\n--- 2. Voci di menu (seconda metà del criterio 1) ---\n'
  if bash scripts/verifica-voci-di-menu.sh; then
    esito_criterio1="${esito_criterio1} voci di menu: soddisfatto"
  else
    esito_criterio1="${esito_criterio1} voci di menu: FALLITO"
  fi

  printf -- '\n--- 3. Ricerca (criterio 2) ---\n'
  if bash scripts/verifica-ricerca.sh; then
    esito_criterio2="soddisfatto"
  else
    esito_criterio2="FALLITO"
  fi

  printf -- '\n--- 4. Avviso di traduzione in corso (criterio 3) ---\n'
  if bash scripts/verifica-avviso-traduzione.sh; then
    esito_criterio3="soddisfatto"
  else
    esito_criterio3="FALLITO"
  fi
else
  printf '\n\033[31mNessun artefatto costruito disponibile: i criteri 1 (voci di menu), 2 e 3 non sono\033[0m\n'
  printf '\033[31maccertabili in questa esecuzione.\033[0m\n'
  esito_criterio2="non accertabile (nessun artefatto)"
  esito_criterio3="non accertabile (nessun artefatto)"
fi

esecutore="agente automatico - chi ha eseguito questa verifica e' chi ha costruito il sito nella stessa sessione. Non e' una verifica indipendente: e' una lacuna dichiarata, non producibile sotto D54 (Q-189)."

if [ -z "$nota" ]; then
  nota="-"
fi

# Sola aggiunta: nessuna riga esistente viene toccata.
printf '%s\t%s\t%s\t%s\t%s\t%s\t%s\n' \
  "$DATA" "$COMMIT" "$esito_criterio1" "$esito_criterio2" "$esito_criterio3" "$esecutore" "$nota" \
  >> "$REGISTRO"

printf '\n== Riga aggiunta a %s ==\n' "$REGISTRO"
tail -1 "$REGISTRO"
