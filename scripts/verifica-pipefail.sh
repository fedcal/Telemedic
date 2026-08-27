#!/usr/bin/env bash
# Ogni script che contiene una catena di comandi dichiara «pipefail».
#
# PERCHE' ESISTE. In una catena di comandi il codice di uscita e' quello dell'ULTIMO comando, non
# quello del primo che fallisce. «npm run build | tail -25» esce zero anche quando la costruzione
# fallisce, perche' «tail» ha letto le sue venticinque righe con successo - come fa sempre,
# qualunque cosa dica il comando a monte. Il 27 agosto 2026 questo ha prodotto un falso verde
# durato un'ora su una costruzione del sito che era fallita e non aveva prodotto affatto la locale
# inglese. E' la voce D-30 del runbook, che nasceva senza presidio.
#
# LA REGOLA. Uno script che contiene almeno una catena di comandi dichiara «set -o pipefail»,
# nella forma estesa o nella forma breve «set -euo pipefail». Uno script che non contiene catene
# non e' tenuto a dichiararlo: imporglielo sarebbe una regola senza oggetto, e le regole senza
# oggetto insegnano che le regole si possono ignorare. Le LIBRERIE - file non eseguibili, inclusi
# con «source» - sono escluse per la stessa ragione al contrario: le loro catene girano con le
# impostazioni del chiamante, e una libreria che imponesse «set» altererebbe l'ambiente di chi la
# include.
#
# CIO' CHE NON PUO' VERIFICARE, e va detto perche' e' la meta' del difetto. Il falso verde del 27
# agosto non e' nato dentro uno script: e' nato da un comando digitato a mano. Nessun controllo
# puo' presidiare la forma usata da chi lavora in forma interattiva, dove la disciplina resta
# l'unica difesa: si scrive «comando > registro.log 2>&1; echo $?» e si guarda la coda dopo, sul
# file. Questo controllo presidia solo la parte versionata, che e' quella che sopravvive alla
# sessione di lavoro in cui e' stata scritta.
#
# Uscita: 0 conforme, 1 violazione, 2 errore d'uso.
set -uo pipefail

cd "$(dirname "$0")/.."

RADICE_SCRIPT="${RADICE_SCRIPT:-scripts}"

if [ ! -d "$RADICE_SCRIPT" ]; then
  printf 'Errore d'\''uso: la cartella degli script «%s» non esiste.\n' "$RADICE_SCRIPT" >&2
  printf 'Percorso configurabile con RADICE_SCRIPT.\n' >&2
  exit 2
fi

case "$RADICE_SCRIPT" in
  */prove/tenute*) filtro=() ;;
  *)               filtro=(-not -path '*/prove/tenute/*') ;;
esac

VERDE=$'\033[32m'; ROSSO=$'\033[31m'; FINE_COLORE=$'\033[0m'
rilievi=0
esaminati=0
con_catene=0

while IFS= read -r file; do
  esaminati=$((esaminati + 1))
  # Una catena e' una barra verticale che NON e' «||», che non sta in un commento, e che non sta
  # dentro un blocco di gawk o di prosa: la distinzione fine non serve, perche' un falso positivo
  # qui costa una riga «set -o pipefail» in piu' e un falso negativo costa un esito creduto.
  catene=$(gawk '
    { riga = $0
      sguarnita = riga
      sub(/^[[:space:]]+/, "", sguarnita)
      if (substr(sguarnita, 1, 1) == "#") next
      gsub(/\|\|/, "", riga)
      if (index(riga, "|") > 0) n++
    } END { print n + 0 }' "$file")
  [ "$catene" -eq 0 ] && continue
  con_catene=$((con_catene + 1))
  if ! gawk '/^[[:space:]]*set .*pipefail/ { trovato = 1 } END { exit !trovato }' "$file"; then
    printf '%s✗ %s: %s catena/e di comandi e nessun «set -o pipefail».%s\n' \
      "$ROSSO" "$file" "$catene" "$FINE_COLORE" >&2
    rilievi=$((rilievi + 1))
  fi
# LE LIBRERIE SONO ESCLUSE, e il criterio non e' il percorso ma il BIT DI ESECUZIONE. Un file
# «.sh» non eseguibile e' sorgente per un altro script («source»), non un comando: le sue catene
# girano con le impostazioni del CHIAMANTE, e imporgli un «set -o pipefail» proprio significherebbe
# alterare l'ambiente di chi lo include, che e' precisamente cio' che una libreria non deve fare.
# Il criterio e' il permesso e non la cartella perche' il permesso e' una proprieta' del file,
# mentre una convenzione di percorso e' una promessa che qualcuno prima o poi non mantiene.
done < <(find "$RADICE_SCRIPT" -type f -name '*.sh' -perm -u+x "${filtro[@]}" | sort)

if [ "$esaminati" -eq 0 ]; then
  printf 'Errore d'\''uso: nessuno script trovato sotto «%s».\n' "$RADICE_SCRIPT" >&2
  exit 2
fi

if [ "$rilievi" -gt 0 ]; then
  printf '\n%sIn una catena di comandi l'\''esito e'\'' quello dell'\''ultimo comando, non del primo che%s\n' "$ROSSO" "$FINE_COLORE" >&2
  printf '%sfallisce: «npm run build | tail» esce zero anche se la costruzione fallisce. Voce D-30.%s\n' "$ROSSO" "$FINE_COLORE" >&2
  printf '%s✗ %d script con catene e senza «pipefail».%s\n' "$ROSSO" "$rilievi" "$FINE_COLORE" >&2
  exit 1
fi

printf '%s✓ %d script esaminati, %d con catene di comandi, tutti dichiarano «pipefail».%s\n' \
  "$VERDE" "$esaminati" "$con_catene" "$FINE_COLORE"
exit 0
