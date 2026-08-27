#!/usr/bin/env bash
# Il registro della velocita' dei traguardi dice la stessa cosa del capitolo dei traguardi.
#
# PERCHE' ESISTE. registro/velocity-dei-traguardi.tsv e' un giornale di eventi: prima allocazione,
# ritarature, chiusure. Serve a misurare due cose che la roadmap da sola non dice - la velocita'
# reale e lo scarto sistematico fra previsione e realta' - e serve a nulla se diverge dal capitolo
# che descrive. Un registro che dicesse una data e la roadmap un'altra sarebbe peggio di nessun
# registro: darebbe l'apparenza di una misura a un'affermazione non verificata.
#
# LE CINQUE REGOLE.
#   1. FORMA. Otto colonne su ogni riga di dati; «evento» fra previsto, ritarato e chiuso; le due
#      date in forma ISO valida.
#   2. MOTIVO. Un evento «ritarato» o «chiuso» senza motivo non e' registrato, e' annotato: la
#      colonna motivo distingue un anticipo per lavoro svolto da un anticipo per misura, che nei
#      numeri hanno lo stesso aspetto.
#   3. NIENTE DOPO LA CHIUSURA. Un traguardo chiuso non si ritara. Se davvero si riapre, si
#      riapre nel capitolo dei traguardi con la motivazione, e questa regola va cambiata insieme.
#   4. COPERTURA. Ogni traguardo la cui scheda porta una data di calendario ha almeno un evento
#      qui; e ogni traguardo nominato qui esiste nel capitolo.
#   Un evento «misurato» registra un avanzamento dei criteri SENZA spostare la data: senza di
#   esso il registro misurerebbe solo le date, e la velocita' - quanti criteri si chiudono per
#   giornata - non sarebbe leggibile, che e' la meta' del motivo per cui il registro esiste.
#   5. ACCORDO. La data dell'ultimo evento di un traguardo coincide con la data della sua scheda,
#      e un traguardo dichiarato CHIUSO nella scheda ha qui un evento «chiuso» con la stessa data.
#
# CIO' CHE NON VERIFICA. Non verifica la sola aggiunta, che e' una proprieta' della cronologia e
# non del file: si vede con «git diff» sulle righe precedenti, non leggendo lo stato attuale.
#
# Uscita: 0 conforme, 1 violazione, 2 errore d'uso.
set -uo pipefail

cd "$(dirname "$0")/.."
. "$(dirname "$0")/lib/date-dei-traguardi.sh"

VELOCITY="${VELOCITY:-registro/velocity-dei-traguardi.tsv}"
TRAGUARDI_IT="${TRAGUARDI_IT:-docs/09_roadmap/02-traguardi.md}"

for f in "$VELOCITY" "$TRAGUARDI_IT"; do
  if [ ! -r "$f" ]; then
    printf 'Errore d'\''uso: «%s» non esiste o non e'\'' leggibile.\n' "$f" >&2
    printf 'Percorsi configurabili con VELOCITY e TRAGUARDI_IT.\n' >&2
    exit 2
  fi
done

VERDE=$'\033[32m'; ROSSO=$'\033[31m'; FINE_COLORE=$'\033[0m'
rilievi=0
segnala() { printf '%s✗ %s%s\n' "$ROSSO" "$1" "$FINE_COLORE" >&2; rilievi=$((rilievi + 1)); }

data_valida() {
  case "$1" in
    [0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]) date -d "$1" +%Y-%m-%d >/dev/null 2>&1 ;;
    *) return 1 ;;
  esac
}

declare -A ULTIMA_DATA=() ULTIMO_EVENTO=() CHIUSO_IL=()
eventi=0
riga_n=0
# I campi si estraggono per POSIZIONE con «cut -f», che i campi vuoti li conta. NON con
# «IFS=$'\t' read -r a b c …»: per bash la tabulazione e' un carattere di IFS *bianco*, due
# tabulazioni consecutive vengono fuse, e ogni campo vuoto fa scalare di uno tutti quelli che
# seguono - il controllo leggerebbe la colonna sbagliata e dichiarerebbe il falso con sicurezza.
# E' la voce C-1 del runbook degli errori, e questo registro ha dieci righe con la colonna
# «scarto_giorni» vuota: sarebbe caduto su ognuna.
while IFS= read -r linea || [ -n "$linea" ]; do
  riga_n=$((riga_n + 1))
  case "$linea" in ''|'#'*) continue ;; esac
  data=$(printf '%s' "$linea" | cut -f1)
  [ "$data" = "data" ] && continue
  traguardo=$(printf '%s' "$linea" | cut -f2)
  evento=$(printf '%s' "$linea" | cut -f3)
  data_dichiarata=$(printf '%s' "$linea" | cut -f4)
  motivo=$(printf '%s' "$linea" | cut -f7)
  campi=$(printf '%s' "$linea" | gawk -F'\t' '{print NF}')
  eventi=$((eventi + 1))

  if [ "$campi" -ne 8 ]; then
    segnala "riga $riga_n ($traguardo): $campi colonne invece di otto. Il formato e' dichiarato in testa al registro."
    continue
  fi

  data_valida "$data" || segnala "riga $riga_n ($traguardo): «$data» non e' una data ISO valida nella colonna «data»."
  data_valida "$data_dichiarata" || segnala "riga $riga_n ($traguardo): «$data_dichiarata» non e' una data ISO valida nella colonna «data_dichiarata»."

  case "$evento" in
    previsto|ritarato|misurato|chiuso) ;;
    *) segnala "riga $riga_n ($traguardo): evento «$evento» non ammesso. I valori sono previsto, ritarato, misurato, chiuso." ;;
  esac

  case "$evento" in
    ritarato|misurato|chiuso)
      if [ -z "${motivo//[[:space:]]/}" ]; then
        segnala "riga $riga_n ($traguardo): un evento «$evento» senza motivo non e' registrato, e' annotato."
      fi
      ;;
  esac

  if [ -n "${CHIUSO_IL[$traguardo]:-}" ]; then
    segnala "riga $riga_n: $traguardo ha un evento «$evento» del $data dopo la chiusura del ${CHIUSO_IL[$traguardo]}. Un traguardo chiuso non si ritara."
  fi

  ULTIMA_DATA["$traguardo"]="$data_dichiarata"
  ULTIMO_EVENTO["$traguardo"]="$evento"
  [ "$evento" = "chiuso" ] && CHIUSO_IL["$traguardo"]="$data_dichiarata"
done < "$VELOCITY"

if [ "$eventi" -eq 0 ]; then
  printf 'Errore d'\''uso: nessun evento riconosciuto in «%s».\n' "$VELOCITY" >&2
  exit 2
fi

declare -A SCHEDA=()
while IFS= read -r _r || [ -n "$_r" ]; do
  [ -n "$_r" ] || continue
  traguardo=$(printf '%s' "$_r" | cut -f1)
  origine=$(printf '%s' "$_r" | cut -f2)
  valore=$(printf '%s' "$_r" | cut -f3)
  [ "$origine" = "scheda" ] || continue
  SCHEDA["$traguardo"]="$valore"
done < <(estrai "$TRAGUARDI_IT")

if [ "${#SCHEDA[@]}" -eq 0 ]; then
  printf 'Errore d'\''uso: nessuna scheda di traguardo riconosciuta in «%s».\n' "$TRAGUARDI_IT" >&2
  exit 2
fi

coperti=0
for traguardo in "${!SCHEDA[@]}"; do
  data_scheda="${SCHEDA[$traguardo]}"
  if [ "$data_scheda" = "illeggibile" ]; then
    segnala "$traguardo porta un anno nella scheda e la data non e' leggibile: il registro non puo' esservi confrontato."
    continue
  fi
  [ "$data_scheda" = "non-calendariale" ] && continue
  if [ -z "${ULTIMA_DATA[$traguardo]:-}" ]; then
    segnala "$traguardo ha una data di calendario nella scheda ($data_scheda) e nessun evento nel registro della velocita'."
    continue
  fi
  coperti=$((coperti + 1))
  if [ "${ULTIMA_DATA[$traguardo]}" != "$data_scheda" ]; then
    segnala "$traguardo - la scheda dice $data_scheda, l'ultimo evento del registro dice ${ULTIMA_DATA[$traguardo]}."
  fi
done

for traguardo in "${!ULTIMA_DATA[@]}"; do
  if [ -z "${SCHEDA[$traguardo]:-}" ]; then
    segnala "$traguardo compare nel registro della velocita' e non esiste nel capitolo dei traguardi."
  fi
done

# La scheda che dichiara una chiusura e il registro che la registra devono concordare in
# ENTRAMBI i versi: una chiusura non registrata e una registrazione senza chiusura sono lo
# stesso difetto visto dai due lati.
while IFS= read -r sigla; do
  if [ -z "${CHIUSO_IL[$sigla]:-}" ]; then
    segnala "$sigla e' dichiarato CHIUSO nel capitolo dei traguardi e non ha un evento «chiuso» nel registro."
  fi
done < <(gawk '/^### `T-[0-9]+`/ {match($0, /T-[0-9]+/); s = substr($0, RSTART, RLENGTH); atteso = s; next}
               atteso != "" && /^\*Class/ { if ($0 ~ /CHIUSO|CLOSED/) print atteso; atteso = ""}' "$TRAGUARDI_IT")

for traguardo in "${!CHIUSO_IL[@]}"; do
  if ! gawk -v s="$traguardo" '/^### `T-[0-9]+`/ {match($0, /T-[0-9]+/); a = (substr($0, RSTART, RLENGTH) == s); next}
                                a && /^\*Class/ {if ($0 ~ /CHIUSO|CLOSED/) trovato = 1; a = 0}
                                END {exit !trovato}' "$TRAGUARDI_IT"; then
    segnala "$traguardo ha un evento «chiuso» nel registro e la sua scheda non lo dichiara chiuso."
  fi
done

if [ "$rilievi" -gt 0 ]; then
  printf '%s✗ %d rilievo/i sul registro della velocita'\''.%s\n' "$ROSSO" "$rilievi" "$FINE_COLORE" >&2
  exit 1
fi

printf '%s✓ %d eventi su %d traguardi datati, in accordo con il capitolo dei traguardi.%s\n' \
  "$VERDE" "$eventi" "$coperti" "$FINE_COLORE"
exit 0
