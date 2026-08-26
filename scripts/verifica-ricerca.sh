#!/usr/bin/env bash
# Controllo di pubblicazione - criterio 2 di T-07 (la ricerca funziona e restituisce risultati
# nella lingua attiva).
#
# Il sito non aveva alcuna funzione di ricerca prima di T-07: nessuna chiave "algolia" in
# docusaurus.config.mjs, nessun greffone di ricerca fra le dipendenze. È stata aggiunta
# @easyops-cn/docusaurus-search-local (MIT, licenza verificata sul file LICENSE del repository
# sorgente, registrata in pipeline/annotazioni-componenti.tsv) - un indice locale, costruito
# insieme al sito, SENZA alcun servizio esterno: nessuna candidatura, nessuna coda di
# indicizzazione, nessun invio dei contenuti a un terzo.
#
# Il criterio ha due metà, e la seconda è quella che si dimentica (vedi il piano
# .telemedic/piani/T-07-sito-di-documentazione.md §1.2):
#   1. la ricerca è RAGGIUNGIBILE da ogni pagina di entrambe le locali;
#   2. restituisce risultati NELLA LINGUA ATTIVA, senza contaminazione fra le due - una parola
#      presente solo nella traduzione inglese non deve comparire nell'indice italiano, e
#      viceversa.
#
# COME SI VERIFICA LA SECONDA METÀ. Il plugin costruisce un indice SEPARATO per locale
# (website/build/search-index.json per l'italiano, website/build/en/search-index.json per
# l'inglese): non è un'assunzione, è stato verificato empiricamente sul sito reale confrontando i
# due file. Due termini, uno per locale, sono stati scelti apposta e verificati preventivamente
# con grep come presenti in una sola delle due lingue (misurato il 26 agosto 2026 sul sito
# costruito: "responsabilità" 354 occorrenze in italiano e 0 in inglese; "Foundations" 53
# occorrenze in inglese e 0 in italiano). Sono configurabili via TERMINE_IT/TERMINE_EN per poter
# collaudare il controllo su indici sintetici piccoli, senza dover ricostruire il sito reale.
#
# UN ARTEFATTO SENZA INDICE NON È UNA RICERCA. Una casella di ricerca che non trova nulla è
# peggio dell'assenza della casella, perché afferma implicitamente che il termine non esiste nel
# corpus: per questo l'indice assente o vuoto FA FALLIRE il controllo, non genera un avviso.
#
# COLLAUDABILITÀ. Il controllo accetta quattro variabili d'ambiente, tutte con un valore di
# default che punta al sito reale:
#   ARTEFATTO_IT - directory dell'artefatto costruito, locale italiana (default: ../website/build,
#                  relativo alla posizione di questo script - vedi RADICE_WEBSITE più sotto)
#   ARTEFATTO_EN - directory dell'artefatto costruito, locale inglese (default: .../build/en)
#   TERMINE_IT   - termine atteso SOLO nell'indice italiano (default: "responsabilità")
#   TERMINE_EN   - termine atteso SOLO nell'indice inglese (default: "Foundations")
set -euo pipefail

cd "$(dirname "$0")/.."

RADICE_WEBSITE="website"
ARTEFATTO_IT="${ARTEFATTO_IT:-$RADICE_WEBSITE/build}"
ARTEFATTO_EN="${ARTEFATTO_EN:-$RADICE_WEBSITE/build/en}"
TERMINE_IT="${TERMINE_IT:-responsabilità}"
TERMINE_EN="${TERMINE_EN:-Foundations}"

# Il marcatore strutturale della barra di ricerca: classe CSS emessa dal componente SearchBar di
# @easyops-cn/docusaurus-search-local (SearchBar.module.css), non testo - sopravvive a una
# riformulazione dell'etichetta e a un cambio dell'hash del modulo CSS, perché il prefisso della
# classe resta "searchBarContainer_" anche quando il suffisso hash cambia da una costruzione
# all'altra.
MARCATORE_BARRA='searchBarContainer'

esito=0

segnala() {
  printf '\n\033[31m✗ %s\033[0m\n%s\n' "$1" "$2"
  esito=1
}

if ! command -v jq &> /dev/null; then
  printf '\033[31m✗ jq non disponibile: necessario per leggere l'"'"'indice di ricerca\033[0m\n'
  exit 2
fi

verifica_locale() {
  local nome="$1" artefatto="$2"

  if [ ! -d "$artefatto" ]; then
    segnala "Directory dell'artefatto assente ($nome): $artefatto" \
"Costruisci il sito prima di eseguire questo controllo (in website/: npm run build), oppure
verifica il percorso indicato in ARTEFATTO_IT/ARTEFATTO_EN."
    return
  fi

  # Docusaurus ANNIDA la locale non predefinita dentro l'artefatto della predefinita:
  # website/build/en sta sotto website/build. Un «find» ricorsivo raccoglie quindi anche tutte le
  # pagine dell'altra lingua - misurato il 26 agosto 2026: 324 pagine per l'«italiano», di cui 162
  # erano la locale inglese, contate una seconda volta dal passaggio successivo. Il difetto non
  # produceva un falso verde, perché anche le pagine inglesi portano la barra di ricerca, ma il
  # conteggio stampato diceva il falso e una pagina inglese priva della barra sarebbe stata
  # imputata all'italiano.
  #
  # Si pota quindi ogni locale annidata, e la si riconosce da ciò che la rende una locale: un
  # PROPRIO indice di ricerca. Riconoscerla invece da ARTEFATTO_EN sarebbe stato più diretto e
  # peggiore, per due ragioni. La prima è che legherebbe la regola a una variabile d'ambiente,
  # quindi un artefatto con tre lingue ne poterebbe una sola. La seconda è che non sarebbe
  # collaudabile in isolamento: qualunque tenuta la esercitasse fallirebbe con la potatura e
  # senza, e il caso non proverebbe nulla.
  #
  # «-mindepth 2» è essenziale: l'indice dell'artefatto in esame sta a profondità 1, e senza quel
  # vincolo la sua directory madre - cioè l'artefatto stesso - finirebbe fra quelle da potare.
  local potatura=() locale_annidata
  while IFS= read -r locale_annidata; do
    [ -n "$locale_annidata" ] && potatura+=(-path "$locale_annidata" -prune -o)
  done < <(find "$artefatto" -mindepth 2 -type f -name 'search-index.json' -printf '%h\n' 2>/dev/null | sort -u)
  mapfile -t pagine_html < <(find "$artefatto" "${potatura[@]}" -type f -name '*.html' -print | sort)
  if [ "${#pagine_html[@]}" -eq 0 ]; then
    segnala "Nessuna pagina HTML nell'artefatto ($nome): $artefatto" \
"Un artefatto senza pagine costruite non è pubblicabile."
    return
  fi

  # --- 1. La ricerca è raggiungibile da ogni pagina. ---
  local senza_barra=0
  local pagina
  for pagina in "${pagine_html[@]}"; do
    if ! grep -qF "$MARCATORE_BARRA" "$pagina"; then
      senza_barra=$((senza_barra+1))
    fi
  done
  if [ "$senza_barra" -gt 0 ]; then
    segnala "Barra di ricerca assente su $senza_barra pagina/e ($nome)" \
"Il marcatore strutturale \"$MARCATORE_BARRA\" (SearchBar di @easyops-cn/docusaurus-search-local)
non compare su ogni pagina pubblicata di $artefatto. Verifica che il tema di ricerca sia
registrato in website/docusaurus.config.mjs (sezione themes) e che non sia stato rimosso da un
componente sostituito."
  fi

  # --- 2. L'indice esiste, è JSON valido, e non è vuoto. ---
  local indice="$artefatto/search-index.json"
  if [ ! -f "$indice" ]; then
    segnala "Indice di ricerca assente ($nome): $indice" \
"Un artefatto senza indice di ricerca non ha una ricerca funzionante, anche se la barra è
visibile: è la casella senza il contenuto, che è peggio dell'assenza della casella."
    return
  fi
  if ! jq empty "$indice" 2>/dev/null; then
    segnala "Indice di ricerca non è JSON valido ($nome): $indice" \
"Il file esiste ma non si può leggere come JSON. Ricostruisci il sito."
    return
  fi
  local n_documenti
  n_documenti=$(jq '[.[].documents[]?] | length' "$indice" 2>/dev/null || echo 0)
  if [ "$n_documenti" -eq 0 ]; then
    segnala "Indice di ricerca vuoto ($nome): $indice" \
"L'indice esiste ma non contiene alcun documento. Una ricerca che non trova mai nulla afferma
implicitamente che il corpus è vuoto: è peggio dell'assenza della ricerca."
    return
  fi

  printf '\033[32m✓ Ricerca raggiungibile e indice non vuoto (%s): %d pagine, %d documenti indicizzati.\033[0m\n' \
    "$nome" "${#pagine_html[@]}" "$n_documenti"
}

verifica_locale "italiano" "$ARTEFATTO_IT"
verifica_locale "inglese" "$ARTEFATTO_EN"

# --- 3. Nessuna contaminazione fra le lingue: un termine scelto per ciascuna locale compare
#        SOLO nell'indice di quella locale. ---
#
# Il confronto è testuale (grep sul file JSON), non strutturale: è deliberato. L'obiettivo non è
# verificare la FORMA dell'indice ma il suo CONTENUTO - che le parole di una lingua non finiscano
# nell'indice dell'altra - ed è esattamente il modo in cui è stato misurato empiricamente sul
# sito reale (vedi il commento in testa al file).
indice_it="$ARTEFATTO_IT/search-index.json"
indice_en="$ARTEFATTO_EN/search-index.json"

if [ -f "$indice_it" ] && [ -f "$indice_en" ]; then
  # "|| true" su ciascuna riga: sotto «pipefail» (attivo con set -euo pipefail in testa) un grep
  # che non trova alcuna corrispondenza esce 1, e quell'1 si propaga come esito della pipeline
  # anche se «wc -l» che segue esce 0 - la pipeline riporta il FALLIMENTO più a destra fra i
  # comandi che sono falliti, non semplicemente l'esito dell'ultimo comando. Senza questa guardia
  # lo script abortirebbe silenziosamente proprio nel caso desiderato - zero contaminazione, zero
  # corrispondenze - che è la stessa classe di trappola di C-2 del runbook degli errori (lì era
  # "git log" su un file non tracciato, qui è "grep" su un termine assente). Il valore assegnato
  # alla variabile non è toccato da "|| true": lo scrive comunque "wc -l", prima che l'esito della
  # pipeline sia valutato.
  n_it_in_it=$(grep -o -- "$TERMINE_IT" "$indice_it" 2>/dev/null | wc -l) || true
  n_it_in_en=$(grep -o -- "$TERMINE_IT" "$indice_en" 2>/dev/null | wc -l) || true
  n_en_in_en=$(grep -o -- "$TERMINE_EN" "$indice_en" 2>/dev/null | wc -l) || true
  n_en_in_it=$(grep -o -- "$TERMINE_EN" "$indice_it" 2>/dev/null | wc -l) || true

  if [ "$n_it_in_it" -eq 0 ]; then
    segnala "Termine italiano di prova assente dall'indice italiano" \
"\"$TERMINE_IT\" non compare in $indice_it: il termine scelto per il collaudo non è più presente
nel corpus, oppure l'indicizzazione della locale italiana non funziona. Scegli un altro termine
con TERMINE_IT, verificato con grep sul corpus prima di usarlo."
  fi
  if [ "$n_en_in_en" -eq 0 ]; then
    segnala "Termine inglese di prova assente dall'indice inglese" \
"\"$TERMINE_EN\" non compare in $indice_en: il termine scelto per il collaudo non è più presente
nel corpus, oppure l'indicizzazione della locale inglese non funziona. Scegli un altro termine
con TERMINE_EN, verificato con grep sul corpus prima di usarlo."
  fi
  if [ "$n_it_in_en" -gt 0 ]; then
    segnala "Contaminazione: il termine italiano compare nell'indice inglese" \
"\"$TERMINE_IT\" compare $n_it_in_en volta/e in $indice_en. La ricerca sulla locale inglese
restituirebbe risultati italiani: non è \"nella lingua attiva\", che è ciò che il criterio 2 di
T-07 esige."
  fi
  if [ "$n_en_in_it" -gt 0 ]; then
    segnala "Contaminazione: il termine inglese compare nell'indice italiano" \
"\"$TERMINE_EN\" compare $n_en_in_it volta/e in $indice_it. La ricerca sulla locale italiana
restituirebbe risultati inglesi: non è \"nella lingua attiva\", che è ciò che il criterio 2 di
T-07 esige."
  fi
fi

if [ "$esito" -eq 0 ]; then
  printf '\n\033[32m✓ Ricerca locale presente in entrambe le lingue, senza contaminazione fra gli indici.\033[0m\n'
fi

exit "$esito"
