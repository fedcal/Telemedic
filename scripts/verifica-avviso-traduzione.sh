#!/usr/bin/env bash
# Controllo di pubblicazione - criterio 3 di T-07 (il cambio di lingua atterra sulla pagina
# corrispondente; dove la traduzione non esiste ancora, un avviso la dichiara e rinvia
# all'italiano - mai un errore, mai il silenzio sulla radice).
#
# CHE COSA VERIFICA. Calcola, dal filesystem sorgente (docs/ confrontato con
# website/i18n/en/docusaurus-plugin-content-docs/current/), quali documenti NON hanno una
# traduzione inglese - la stessa fonte di verità già usata da
# scripts/verifica-divergenza-traduzioni.sh, non un elenco tenuto a mano qui (vedi D-10 del
# runbook degli errori). Per ciascuno:
#   1. la pagina inglese corrispondente ESISTE nell'artefatto costruito;
#   2. contiene il marcatore strutturale dell'avviso (classe CSS "tmTranslationNotice",
#      website/src/components/AvvisoTraduzioneInCorso);
#   3. contiene un collegamento verso la pagina italiana corrispondente (stesso percorso, senza
#      il prefisso di locale "/en/").
# E, in più - è l'accertamento che intercetta un falso positivo, non solo un falso negativo -
# il NUMERO di pagine inglesi che portano l'avviso deve essere ESATTAMENTE uguale al numero di
# documenti non tradotti: se fosse maggiore, l'avviso comparirebbe anche su una pagina già
# tradotta, che è silenzioso quanto l'assenza dell'avviso dove serve.
#
# COME SI CALCOLA IL PERCORSO DELLA PAGINA COSTRUITA. Docusaurus toglie il prefisso numerico da
# ogni segmento di cartella e dal nome del file per calcolare sia lo "slug" sia l'"id" del
# documento (@docusaurus/plugin-content-docs, numberPrefix.js): "10_fondamenti/00-come-usare.md"
# diventa l'id "fondamenti/come-usare", pubblicato come "docs/fondamenti/come-usare.html". Questo
# controllo replica quella regola con un'espressione regolare equivalente
# (^[0-9]+[-_.]+ all'inizio di ciascun segmento), SEMPLIFICATA rispetto all'originale: non
# replica l'eccezione di Docusaurus per i prefissi che sembrano una data o una versione (es.
# "7.0-guida"). È una semplificazione dichiarata, non verificata come innocua in astratto ma
# verificata SUL REPOSITORY: nessun file sotto docs/ usa un prefisso nella forma
# "numero.numero-testo" (comando usato per accertarlo: la stessa numerazione a due cifre seguita
# da "-" o "_" ricorre in ogni file elencato da `find docs -name '*.md'`).
#
# COLLAUDABILITÀ. Il controllo accetta tre variabili d'ambiente:
#   DOCS_DIR     - radice dei documenti sorgente (default: ../docs, relativo alla radice del
#                  repository)
#   I18N_EN_DIR  - radice della traduzione inglese (default:
#                  website/i18n/en/docusaurus-plugin-content-docs/current)
#   ARTEFATTO_EN - directory dell'artefatto costruito, locale inglese (default: website/build/en)
set -euo pipefail

cd "$(dirname "$0")/.."

DOCS_DIR="${DOCS_DIR:-docs}"
I18N_EN_DIR="${I18N_EN_DIR:-website/i18n/en/docusaurus-plugin-content-docs/current}"
ARTEFATTO_EN="${ARTEFATTO_EN:-website/build/en}"

MARCATORE='tmTranslationNotice'

esito=0
rilievi=0

segnala() {
  printf '\n\033[31m✗ %s\033[0m\n%s\n' "$1" "$2"
  esito=1
  rilievi=$((rilievi+1))
}

if [ ! -d "$DOCS_DIR" ]; then
  printf '\033[31m✗ Radice dei documenti sorgente inesistente: %s\033[0m\n' "$DOCS_DIR"
  exit 2
fi
if [ ! -d "$I18N_EN_DIR" ]; then
  printf '\033[31m✗ Radice della traduzione inglese inesistente: %s\033[0m\n' "$I18N_EN_DIR"
  exit 2
fi
if [ ! -d "$ARTEFATTO_EN" ]; then
  printf '\033[31m✗ Directory dell'"'"'artefatto inglese assente: %s\033[0m\n' "$ARTEFATTO_EN"
  printf "Costruisci il sito prima di eseguire questo controllo (in website/: npm run build).\n"
  exit 2
fi

# --- 1. Prefisso numerico: stessa regola di @docusaurus/plugin-content-docs/numberPrefix.js,
#        vedi la nota in testa al file per la semplificazione dichiarata. ---
spoglia_segmento() {
  printf '%s' "$1" | sed -E 's/^[0-9]+[-_.]+//'
}

# "0-mioTesto/0-mioFile" => "mioTesto/mioFile"
spoglia_percorso() {
  local percorso="$1" segmento risultato=()
  local IFS=/
  local -a segmenti=($percorso)
  for segmento in "${segmenti[@]}"; do
    risultato+=("$(spoglia_segmento "$segmento")")
  done
  local IFS=/
  printf '%s' "${risultato[*]}"
}

# --- 2. Elenco dei documenti sorgente (esclusi i file "_*.md", stessa esclusione della
#        configurazione dei documenti in website/docusaurus.config.mjs). ---
mapfile -t doc_relativi < <(cd "$DOCS_DIR" && find . -type f -name '*.md' ! -name '_*' -printf '%P\n' | sort)

if [ "${#doc_relativi[@]}" -eq 0 ]; then
  printf '\033[31m✗ Nessun documento trovato sotto %s\033[0m\n' "$DOCS_DIR"
  exit 2
fi

# --- 3. Documenti privi di traduzione: il file gemello non esiste sotto I18N_EN_DIR. ---
non_tradotti_id=()
for relativo in "${doc_relativi[@]}"; do
  if [ ! -f "$I18N_EN_DIR/$relativo" ]; then
    id="$(spoglia_percorso "${relativo%.md}")"
    non_tradotti_id+=("$id")
  fi
done

printf 'Documenti sorgente: %d. Privi di traduzione inglese: %d.\n' \
  "${#doc_relativi[@]}" "${#non_tradotti_id[@]}"

# --- 4. Per ciascun documento non tradotto, la pagina inglese pubblicata reca l'avviso e il
#        rinvio all'italiano. ---
for id in "${non_tradotti_id[@]}"; do
  pagina="$ARTEFATTO_EN/docs/$id.html"

  if [ ! -f "$pagina" ]; then
    segnala "Pagina inglese assente per il documento non tradotto: docs/$id" \
"Attesa in $pagina. Se il documento è stato escluso dalla costruzione, verifica
website/docusaurus.config.mjs (docs.exclude); se il percorso atteso è sbagliato, verifica la
regola di rimozione del prefisso numerico in testa a questo script."
    continue
  fi

  if ! grep -qF "$MARCATORE" "$pagina"; then
    segnala "Avviso di traduzione in corso assente: docs/$id" \
"La pagina $pagina non contiene il marcatore strutturale \"$MARCATORE\"
(website/src/components/AvvisoTraduzioneInCorso). Un lettore anglofono non ha modo di sapere che
sta leggendo il contenuto italiano non tradotto: è la lacuna che il criterio 3 di T-07 vieta."
  fi

  # Il collegamento italiano atteso: stesso percorso "docs/<id>", senza il prefisso di locale.
  # "pathname://" (vedi il commento nel componente) fa sì che l'HTML pubblicato porti l'href
  # letterale, senza il prefisso "/en/" che porterebbe di nuovo alla pagina non tradotta.
  href_atteso="docs/$id\""
  if ! grep -qF "$href_atteso" "$pagina"; then
    segnala "Nessun rinvio alla pagina italiana: docs/$id" \
"La pagina $pagina non contiene un collegamento verso \"$href_atteso\" (il percorso italiano
senza prefisso di locale). L'avviso deve rinviare alla pagina italiana corrispondente, non solo
dichiarare che la traduzione manca."
  fi
done

# --- 5. Nessuna pagina TRADOTTA porta l'avviso: il numero di pagine con il marcatore deve
#        coincidere esattamente con il numero di documenti non tradotti. ---
#
# Il conteggio è ristretto alle pagine HTML: "grep -rlF" sull'intera directory dell'artefatto
# troverebbe anche il foglio di stile e il pacchetto JavaScript compilato, che contengono la
# classe CSS come testo letterale - non sono pagine, e non vanno contate. Difetto trovato e
# corretto durante il collaudo di questo stesso controllo sul sito reale: senza la restrizione a
# "*.html" il conteggio risultava 3 invece di 1.
mapfile -t pagine_en_html < <(find "$ARTEFATTO_EN" -type f -name '*.html' | sort)
n_pagine_con_avviso=0
if [ "${#pagine_en_html[@]}" -gt 0 ]; then
  n_pagine_con_avviso=$(grep -lF "$MARCATORE" -- "${pagine_en_html[@]}" 2>/dev/null | wc -l) || true
fi

if [ "$n_pagine_con_avviso" -ne "${#non_tradotti_id[@]}" ]; then
  segnala "Il numero di pagine con l'avviso non coincide con il numero di documenti non tradotti" \
"Pagine con l'avviso: $n_pagine_con_avviso. Documenti non tradotti: ${#non_tradotti_id[@]}.
Se sono di più, l'avviso compare anche su una pagina già tradotta - un lettore la vedrebbe
etichettata come non tradotta quando non lo è. Se sono di meno, una delle verifiche sopra
avrebbe già dovuto segnalarlo: la discrepanza è un sintomo di doppio conteggio o di una pagina
con il marcatore fuori dall'albero \"docs/\"."
fi

if [ "$esito" -eq 0 ]; then
  printf '\033[32m✓ Avviso di traduzione in corso presente su ogni pagina non tradotta (%d), e su nessun'"'"'altra.\033[0m\n' \
    "${#non_tradotti_id[@]}"
else
  printf '\n\033[31m✗ Rilievi: %d\033[0m\n' "$rilievi"
fi

exit "$esito"
