#!/usr/bin/env bash
# Impedisce che contenuti di terminologie sotto licenza entrino nel repository.
#
# Il progetto si impegna a non versionare e a non scaricare contenuti di
# terminologie soggette a licenza (vedi THIRD-PARTY-TERMINOLOGY.md). Un impegno
# senza un controllo che possa fallire non è un impegno: è un'intenzione.
#
# Il controllo è deliberatamente conservativo. Preferisce un falso positivo da
# discutere a un contenuto sotto licenza che passa inosservato: il costo di un
# falso positivo è una conversazione, quello di un falso negativo è una
# violazione di licenza in un repository pubblico.
#
# QUALI sistemi sorveglia, CON QUALE riconoscitore e CON QUALE profondità non
# sta più scritto solo qui: vive in pipeline/lista-ammissione-terminologie.tsv,
# dichiarato in pipeline/README-TERMINOLOGIE.md. Questo script legge quella
# tabella ed esegue ogni riga come un riconoscitore; non decide più da solo
# che cosa cercare - lo fa la tabella, che è versionata e leggibile a parte.
#
# La tabella NON contiene contenuto di terminologie: dichiara la FORMA con cui
# un contenuto sospetto si riconosce (un'espressione regolare, un'estensione
# di file, un dominio), non un concetto, un codice o un frammento reale. Vedi
# la nota dedicata nel README accanto alla tabella.
#
# Se la tabella non è raggiungibile - assente o illeggibile - il controllo NON gira a vuoto e
# NON passa in silenzio: fallisce con uscita 2, la convenzione di questo repository per «il
# controllo non può nemmeno partire» (la stessa di scripts/verifica-registro-componenti.sh con
# il registro inesistente e di scripts/verifica-dati-sintetici.sh con la radice inesistente). Lo
# script non mantiene più al proprio interno una copia di riserva dei riconoscitori: una regola
# duplicata in due posti può divergere senza che nessuno se ne accorga, ed è esattamente il
# difetto che questa scelta chiude.
set -euo pipefail

cd "$(dirname "$0")/.."
esito=0

LISTA="${LISTA:-pipeline/lista-ammissione-terminologie.tsv}"

segnala() {
  printf '\n\033[31m✗ %s\033[0m\n' "$1"
  printf '%b\n' "$2"
  esito=1
}

# Estrae il campo N di una riga separata da tabulazione. NON usare
# «IFS=$'\t' read -r a b c …»: la tabulazione è per bash un carattere di IFS
# *bianco*, e due tabulazioni consecutive - il caso normale quando il campo
# «estensioni» è vuoto - vengono fuse in una sola, facendo scalare di uno
# tutti i campi successivi. Il controllo leggerebbe il campo sbagliato e
# direbbe il falso con sicurezza: esattamente ciò che questo script esiste
# per impedire altrove.
campo() { printf '%s' "$1" | cut -f"$2"; }

# Nessuna copia di riserva: la lista di ammissione è l'unica fonte dei riconoscitori. Se non è
# raggiungibile, il controllo non può nemmeno partire - non decide da solo che cosa cercare, e
# non c'è nulla di corretto da eseguire senza la tabella.
if [ ! -f "$LISTA" ]; then
  printf '\033[31m✗ Lista di ammissione dei riconoscitori inesistente: %s\033[0m\n' "$LISTA" >&2
  printf 'Il controllo non può eseguire senza la tabella dei riconoscitori: ripristinala,\n' >&2
  printf 'oppure indica LISTA se si trova in una posizione diversa. Vedi\n' >&2
  printf 'pipeline/README-TERMINOLOGIE.md.\n' >&2
  exit 2
fi
if [ ! -r "$LISTA" ]; then
  printf '\033[31m✗ Lista di ammissione dei riconoscitori illeggibile: %s\033[0m\n' "$LISTA" >&2
  printf 'Verifica i permessi del file. Il controllo non può eseguire senza poterla leggere.\n' >&2
  exit 2
fi

intestazione_vista=0
while IFS= read -r linea || [ -n "$linea" ]; do
  case "$linea" in ''|'#'*) continue;; esac

  id=$(campo "$linea" 1)
  if [ "$intestazione_vista" -eq 0 ]; then
    if [ "$id" != "id" ]; then
      printf '\033[31m✗ intestazione inattesa nella lista di ammissione: %s\033[0m\n' "$LISTA"
      exit 2
    fi
    intestazione_vista=1
    continue
  fi

  pattern=$(campo "$linea" 5)
  modo=$(campo "$linea" 6)
  estensioni=$(campo "$linea" 7)
  titolo=$(campo "$linea" 8)
  motivo=$(campo "$linea" 9)

  if [ -z "$id" ] || [ -z "$pattern" ] || [ -z "$modo" ] || [ -z "$titolo" ]; then
    printf '\033[31m✗ riga malformata nella lista di ammissione (%s): %s\033[0m\n' "$LISTA" "$linea"
    exit 2
  fi

  case "$modo" in
    righe) flag_grep=-rInE ;;
    nomefile) flag_grep=-rIlE ;;
    *)
      printf '\033[31m✗ modalita_grep sconosciuta alla riga %s della lista di ammissione: «%s»\033[0m\n' "$id" "$modo"
      exit 2
      ;;
  esac

  includes=()
  if [ -n "$estensioni" ]; then
    IFS=',' read -ra glob_list <<< "$estensioni"
    for glob in "${glob_list[@]}"; do
      includes+=(--include="$glob")
    done
  fi

  if grep "$flag_grep" "$pattern" "${includes[@]}" . 2>/dev/null; then
    segnala "$titolo" "$motivo"
  fi
done < "$LISTA"

if [ "$esito" -eq 0 ]; then
  printf '\033[32m✓ Nessun contenuto di terminologia sotto licenza rilevato.\033[0m\n'
fi
exit "$esito"
