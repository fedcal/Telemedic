#!/usr/bin/env bash
# Un rinvio a un documento del corpus si scrive come collegamento, non come testo.
#
# PERCHE' ESISTE. Il criterio 7 di T-02 chiede che «i rinvii testuali all'area di conformita',
# scritti come testo quando quell'area non esisteva, siano trasformati in collegamenti». La regola
# vale oltre quell'area, e la ragione e' piu' forte della comodita' del lettore: **un rinvio
# testuale non e' verificabile**. Un collegamento rotto lo trova la costruzione del sito, che ha i
# quattro parametri onBroken* a 'throw'; un percorso scritto dentro un frammento di codice non lo
# guarda nessuno, e resta corretto solo finche' nessuno rinomina il file.
#
# CHE COSA QUESTA REGOLA HA GIA' TROVATO. Convertendo i rinvii del 27 agosto 2026 sono emersi
# TRENTASETTE rinvii nella traduzione inglese che citavano nomi di file TRADOTTI - per esempio
# «docs/00_overview/02-the-four-services.md» - mentre il repository non traduce i nomi dei file.
# Puntavano tutti al nulla. Nessun controllo poteva vederli perche' erano testo: la conversione in
# collegamento li ha resi verificabili, e la verifica li ha bocciati subito.
#
# LA REGOLA, E LA SUA ECCEZIONE DICHIARATA. Un frammento di codice in linea che contiene
# ESCLUSIVAMENTE un percorso a un file «.md» sotto docs/ e' un rinvio, e va scritto come
# collegamento. Se il frammento contiene altro - tipicamente un comando, come
# «git log -1 --format=%H -- docs/08_compliance/PROCEDURA-controllo-dei-documenti.md» - non e' un
# rinvio ma un argomento, e resta com'e'. La distinzione e' meccanica e non richiede giudizio: si
# guarda se il percorso occupa tutto il frammento o solo una parte.
#
# CIO' CHE NON VERIFICA. Non verifica che il collegamento porti dove dice: quello lo fa la
# costruzione del sito. Verifica che il rinvio sia nella forma in cui QUALCUNO possa verificarlo.
#
# Uscita: 0 conforme, 1 violazione, 2 errore d'uso.
set -uo pipefail

cd "$(dirname "$0")/.."

RADICI_CORPUS="${RADICI_CORPUS:-docs website/i18n/en/docusaurus-plugin-content-docs/current}"

esistente=0
for radice in $RADICI_CORPUS; do
  [ -d "$radice" ] && esistente=$((esistente + 1))
done
if [ "$esistente" -eq 0 ]; then
  printf 'Errore d'\''uso: nessuna delle radici del corpus esiste: %s\n' "$RADICI_CORPUS" >&2
  printf 'Percorsi configurabili con RADICI_CORPUS, separati da spazio.\n' >&2
  exit 2
fi

VERDE=$'\033[32m'; ROSSO=$'\033[31m'; FINE_COLORE=$'\033[0m'
rilievi=0
esaminati=0

for radice in $RADICI_CORPUS; do
  [ -d "$radice" ] || continue
  while IFS= read -r file; do
    esaminati=$((esaminati + 1))
    while IFS= read -r trovato; do
      [ -n "$trovato" ] || continue
      printf '%s✗ %s:%s%s\n' "$ROSSO" "$file" "$trovato" "$FINE_COLORE" >&2
      rilievi=$((rilievi + 1))
    done < <(gawk '
      # Il recinto si riconosce anche INDENTATO: dentro un elenco numerato un blocco di codice e'\''
      # rientrato, e riconoscere il solo recinto a colonna 1 produce due difetti insieme - il
      # blocco indentato non viene saltato, e il suo recinto di chiusura scritto a colonna 1
      # inverte lo stato per tutto il resto del file, rendendo invisibile ogni rinvio successivo.
      # Trovato in revisione il 27 agosto 2026.
      /^[[:space:]]*```/ { dentro = !dentro; next }
      dentro { next }
      {
        riga = $0
        resto = riga
        posizione = 0
        while (match(resto, /`docs\/[0-9a-z_]+\/[0-9A-Za-z._-]+\.md`/)) {
          inizio = posizione + RSTART
          frammento = substr(resto, RSTART, RLENGTH)
          # Un frammento preceduto da «[» e'\'' gia'\'' l'\''etichetta di un collegamento.
          if (inizio > 1 && substr(riga, inizio - 1, 1) == "[") {
            # nulla da segnalare
          } else {
            gsub(/`/, "", frammento)
            printf "%d: `%s` e'\'' un rinvio scritto come testo\n", NR, frammento
          }
          posizione = inizio + RLENGTH - 1
          resto = substr(resto, RSTART + RLENGTH)
        }
      }
    ' "$file")
  done < <(find "$radice" -type f -name '*.md' | sort)
done

if [ "$esaminati" -eq 0 ]; then
  printf 'Errore d'\''uso: nessun documento trovato sotto: %s\n' "$RADICI_CORPUS" >&2
  exit 2
fi

if [ "$rilievi" -gt 0 ]; then
  printf '\n%sUn rinvio a un documento del corpus si scrive come collegamento: [`docs/area/file.md`](percorso/relativo.md).%s\n' "$ROSSO" "$FINE_COLORE" >&2
  printf '%sUn percorso dentro un frammento di codice non lo verifica nessuno, e resta corretto solo%s\n' "$ROSSO" "$FINE_COLORE" >&2
  printf '%sfinche'\'' nessuno rinomina il file. Criterio 7 di T-02.%s\n' "$ROSSO" "$FINE_COLORE" >&2
  printf '%s✗ %d rinvio/i scritto/i come testo invece che come collegamento.%s\n' "$ROSSO" "$rilievi" "$FINE_COLORE" >&2
  exit 1
fi

printf '%s✓ %d documenti esaminati, ogni rinvio a un documento del corpus e'\'' un collegamento.%s\n' \
  "$VERDE" "$esaminati" "$FINE_COLORE"
exit 0
