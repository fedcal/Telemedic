#!/usr/bin/env bash
# Nessuno script legge un file separato da tabulazioni con «read».
#
# PERCHE' ESISTE, e la ragione e' piu' forte del difetto che presidia. Per bash la tabulazione e'
# un carattere di IFS *bianco*: due tabulazioni consecutive vengono FUSE, e ogni campo vuoto fa
# scalare di uno tutti quelli che seguono. Un controllo scritto con «IFS=$'\t' read -r a b c»
# legge la colonna sbagliata e dichiara il falso con la sicurezza di una verifica automatica. E'
# la voce C-1 del runbook degli errori, trovata la prima volta il 26 agosto 2026 in
# scripts/verifica-registro-dei-difetti.sh.
#
# LA REGOLA ERA GIA' SCRITTA - «i campi si estraggono per posizione con cut -f, che i campi vuoti
# li conta; mai con read» - E IL 27 AGOSTO 2026 E' STATA RIVIOLATA dallo stesso repository che
# l'aveva scritta, in uno script nuovo, con il runbook aperto. Nello stesso momento e' emerso che
# la correzione del 26 agosto aveva lasciato in piedi una SECONDA occorrenza nello script gia'
# corretto: latente, perche' nessuna riga del registro aveva ancora la casella vuota che l'avrebbe
# fatta cadere. Tre commenti di avvertimento sparsi in tre script non avevano impedito ne' l'una
# ne' l'altra. E' la dimostrazione della voce D-18: una regola non presidiata da un controllo non
# e' una regola, e vale anche - soprattutto - per le regole che stanno nel runbook degli errori.
#
# LA REGOLA, SENZA ECCEZIONI. Nessuna forma «IFS=<tabulazione> read» negli script del repository,
# nemmeno su un file di due colonne dove il collasso sarebbe innocuo: e' cosi' che le eccezioni
# tornano. Il commento di avvertimento non e' un'eccezione: una riga che NOMINA la forma vietata
# per spiegarla non la usa, e il controllo distingue i due casi guardando se la riga e' un
# commento.
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

# LE TENUTE DEL BANCO SONO ESCLUSE, e la ragione non e' di comodo. Sotto scripts/prove/tenute/
# vive uno script che viola la regola DELIBERATAMENTE: e' la prova negativa senza la quale questo
# controllo non sarebbe un controllo, perche' nessuno lo avrebbe mai visto fallire. Un controllo
# che esaminasse il proprio banco troverebbe sempre la violazione che il banco esiste per
# contenere, e sarebbe rosso per costruzione. E' un limite dichiarato e non una copertura: uno
# script vero che finisse sotto le tenute sfuggirebbe al controllo.
#
# L'esclusione si applica SOLO quando la radice esaminata non e' essa stessa dentro le tenute: il
# banco punta direttamente a una cartella di tenuta per eseguire le proprie prove, e
# un'esclusione incondizionata lo farebbe uscire 2 su ogni caso. Condizionarla evita di dover
# concedere al banco un'eccezione che poi qualcuno userebbe altrove.
case "$RADICE_SCRIPT" in
  */prove/tenute*) filtro=() ;;
  *)               filtro=(-not -path '*/prove/tenute/*') ;;
esac

VERDE=$'\033[32m'; ROSSO=$'\033[31m'; FINE_COLORE=$'\033[0m'
TAB=$'\t'
rilievi=0
esaminati=0

while IFS= read -r file; do
  esaminati=$((esaminati + 1))
  # gawk perche' la forma vietata contiene una tabulazione dentro una stringa fra apici, e
  # distinguere il codice dal commento richiede di guardare il primo carattere non bianco.
  while IFS= read -r rilievo; do
    [ -n "$rilievo" ] || continue
    printf '%s✗ %s:%s%s\n' "$ROSSO" "$file" "$rilievo" "$FINE_COLORE" >&2
    rilievi=$((rilievi + 1))
  done < <(gawk -v tab="$TAB" '
    {
      riga = $0
      sguarnita = riga
      sub(/^[[:space:]]+/, "", sguarnita)
      if (substr(sguarnita, 1, 1) == "#") next
      # LA FORMA VIETATA E'\'' L'\''ASSEGNAZIONE DI IFS A UNA TABULAZIONE, con o senza «read» sulla
      # stessa riga. La prima stesura esigeva le due cose insieme, e la revisione del 27 agosto
      # 2026 ha mostrato due evasioni banali che riproducono il difetto per intero: «IFS=$'\''\\t'\''»
      # su una riga e «read -r a b c» su quella dopo - peggiore della forma vietata, perche'\'' IFS
      # resta impostato per il resto dello script - e l'\''assegnazione indiretta, «TAB=$'\''\\t'\''»
      # seguita da «IFS="$TAB" read». Guardare la sola assegnazione le coglie entrambe, e non ha
      # falsi positivi: in questo repository non esiste alcuna ragione legittima di portare IFS a
      # una tabulazione, perche'\'' i campi si estraggono con «cut -f».
      if (riga ~ /IFS=/) {
        if (index(riga, tab) > 0 || riga ~ /IFS=\$.\\t/ || riga ~ /IFS="?\\t"?/) {
          printf "%d: %s\n", NR, sguarnita
        }
      }
      # L'\''assegnazione indiretta: una variabile che contiene una tabulazione e che finisce in IFS.
      if (match(riga, /^[[:space:]]*[A-Za-z_][A-Za-z0-9_]*=\$'\''\\t'\''/)) {
        campo = substr(riga, RSTART, RLENGTH)
        sub(/^[[:space:]]*/, "", campo); sub(/=.*$/, "", campo)
        variabili[campo] = NR
      }
      if (match(riga, /IFS="?\$\{?[A-Za-z_][A-Za-z0-9_]*\}?"?/)) {
        campo = substr(riga, RSTART, RLENGTH)
        gsub(/IFS="?\$\{?|\}?"?$/, "", campo)
        if (campo in variabili) printf "%d: %s (IFS riceve $%s, che vale una tabulazione, assegnata alla riga %d)\n", NR, sguarnita, campo, variabili[campo]
      }
    }
  ' "$file")
done < <(find "$RADICE_SCRIPT" -type f -name '*.sh' "${filtro[@]}" | sort)

if [ "$esaminati" -eq 0 ]; then
  printf 'Errore d'\''uso: nessuno script trovato sotto «%s».\n' "$RADICE_SCRIPT" >&2
  exit 2
fi

if [ "$rilievi" -gt 0 ]; then
  printf '\n%sI campi di un file separato da tabulazioni si estraggono per POSIZIONE con «cut -f»,%s\n' "$ROSSO" "$FINE_COLORE" >&2
  printf '%sche i campi vuoti li conta. Vedi la voce C-1 del runbook degli errori.%s\n' "$ROSSO" "$FINE_COLORE" >&2
  printf '%s✗ %d lettura/e di file separato da tabulazioni con «read».%s\n' "$ROSSO" "$rilievi" "$FINE_COLORE" >&2
  exit 1
fi

printf '%s✓ %d script esaminati, nessuno legge un file separato da tabulazioni con «read».%s\n' \
  "$VERDE" "$esaminati" "$FINE_COLORE"
exit 0
