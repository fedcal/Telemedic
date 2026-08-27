#!/usr/bin/env bash
# Le corsie della catena di costruzione dichiarano le stesse versioni.
#
# PERCHE' ESISTE. Il 27 agosto 2026, preparando la prima esecuzione della fascia di rilascio - mai
# eseguita: zero esecuzioni, zero rilasci - sono emerse due divergenze che nessuno poteva vedere,
# perche' nessuno aveva mai fatto girare quella corsia. La fascia di rilascio dichiarava
# «actions/setup-node@v4» e «node-version: 24.x» mentre le altre due dichiaravano «@v5» e
# «node 22»: LA CORSIA CHE FIRMA COSTRUIVA L'ARTEFATTO CON UN INTERPRETE DIVERSO DA QUELLA CHE
# PUBBLICA. Una firma ha senso se attesta l'artefatto che le persone ricevono; costruito con un
# altro interprete non e' garantito che lo sia.
#
# La seconda divergenza discende dalla prima ed e' piu' concreta: Node 24 porta npm 11, e il
# comando che genera la distinta dei materiali fallisce con npm 11 quando package.json dichiara
# «overrides» - e questo progetto ne ha due, messi li' per ragioni di sicurezza. Il passo della
# distinta sarebbe fallito alla PRIMA esecuzione, e con esso i due controlli bloccanti che dalla
# distinta dipendono. E' la voce D-27 del runbook, che fino a oggi era registrata come debito:
# «un controllo che confronti le versioni dichiarate dalle corsie sarebbe scrivibile - e' una
# lettura di YAML e un confronto - e non esiste». Ora esiste.
#
# LA REGOLA. Ogni azione usata da piu' di una corsia vi compare con la STESSA versione, e la
# versione dell'interprete e' la stessa ovunque sia dichiarata. Le differenze non si giustificano
# caso per caso in un commento: si eliminano. Fissare la versione allo stesso valore in tutte le
# corsie non e' pedanteria di uniformita' - e' l'unico modo per cui un difetto trovato in una
# corsia valga anche come garanzia per le altre.
#
# LE RIGHE DI COMMENTO SONO ESCLUSE, e non e' un dettaglio: il 27 agosto la misura delle versioni
# fu ingannata dai commenti appena scritti, che NOMINAVANO la versione vecchia per spiegare la
# correzione. Un controllo che leggesse i commenti segnalerebbe la propria spiegazione.
#
# Uscita: 0 conforme, 1 violazione, 2 errore d'uso.
set -uo pipefail

cd "$(dirname "$0")/.."

CORSIE="${CORSIE:-.github/workflows}"

if [ ! -d "$CORSIE" ]; then
  printf 'Errore d'\''uso: la cartella delle corsie «%s» non esiste.\n' "$CORSIE" >&2
  printf 'Percorso configurabile con CORSIE.\n' >&2
  exit 2
fi

VERDE=$'\033[32m'; ROSSO=$'\033[31m'; FINE_COLORE=$'\033[0m'

# «chiave<TAB>valore<TAB>corsia», una riga per dichiarazione, commenti esclusi.
dichiarazioni=$(gawk '
  FNR == 1 { corsia = FILENAME; sub(/^.*\//, "", corsia) }
  {
    riga = $0
    sguarnita = riga
    sub(/^[[:space:]]+/, "", sguarnita)
    if (substr(sguarnita, 1, 1) == "#") next
    sub(/#.*$/, "", riga)
    if (match(riga, /uses:[[:space:]]*[A-Za-z0-9_.\/-]+@[A-Za-z0-9._-]+/)) {
      campo = substr(riga, RSTART, RLENGTH)
      sub(/^uses:[[:space:]]*/, "", campo)
      n = index(campo, "@")
      printf "%s\t%s\t%s\n", substr(campo, 1, n - 1), substr(campo, n + 1), corsia
    }
    if (match(riga, /node-version:[[:space:]]*['\''"]?[0-9][0-9.x]*/)) {
      campo = substr(riga, RSTART, RLENGTH)
      sub(/^node-version:[[:space:]]*['\''"]?/, "", campo)
      printf "interprete-node\t%s\t%s\n", campo, corsia
    }
  }
' $(find "$CORSIE" -type f \( -name '*.yml' -o -name '*.yaml' \) | sort) | sort -u)

if [ -z "$dichiarazioni" ]; then
  printf 'Errore d'\''uso: nessuna dichiarazione di versione trovata sotto «%s».\n' "$CORSIE" >&2
  printf 'Le forme attese sono «uses: proprietario/azione@versione» e «node-version: N».\n' >&2
  exit 2
fi

rilievi=0
esaminate=0
while IFS= read -r chiave; do
  [ -n "$chiave" ] || continue
  esaminate=$((esaminate + 1))
  versioni=$(printf '%s\n' "$dichiarazioni" | gawk -F'\t' -v c="$chiave" '$1 == c {print $2}' | sort -u)
  quante=$(printf '%s\n' "$versioni" | grep -c .)
  [ "$quante" -le 1 ] && continue
  printf '%s✗ «%s» e'\'' dichiarata con %s versioni diverse:%s\n' "$ROSSO" "$chiave" "$quante" "$FINE_COLORE" >&2
  while IFS= read -r v; do
    dove=$(printf '%s\n' "$dichiarazioni" | gawk -F'\t' -v c="$chiave" -v v="$v" '$1 == c && $2 == v {printf "%s ", $3}')
    printf '%s    %s in: %s%s\n' "$ROSSO" "$v" "$dove" "$FINE_COLORE" >&2
  done <<< "$versioni"
  rilievi=$((rilievi + 1))
done < <(printf '%s\n' "$dichiarazioni" | cut -f1 | sort -u)

if [ "$rilievi" -gt 0 ]; then
  printf '\n%sUna corsia che dichiara una versione diversa dalle altre costruisce un artefatto diverso.%s\n' "$ROSSO" "$FINE_COLORE" >&2
  printf '%sLa corsia che firma e quella che pubblica devono costruire lo stesso. Voce D-27 del runbook.%s\n' "$ROSSO" "$FINE_COLORE" >&2
  printf '%s✗ %d divergenza/e fra le corsie.%s\n' "$ROSSO" "$rilievi" "$FINE_COLORE" >&2
  exit 1
fi

printf '%s✓ %d dichiarazioni di versione, tutte concordi fra le corsie.%s\n' \
  "$VERDE" "$esaminate" "$FINE_COLORE"
exit 0
