#!/usr/bin/env bash
# Segnala quando l'italiano e l'inglese hanno smesso di dire la stessa cosa.
#
# Una traduzione non si rompe con un errore: si stacca in silenzio. Qualcuno
# corregge un paragrafo nell'originale, la versione tradotta resta com'era, e
# per mesi nessuno se ne accorge — finché due lettori di lingua diversa non
# arrivano a due conclusioni diverse leggendo lo «stesso» documento. In una
# documentazione che dichiara obblighi regolatori questo non è un fastidio
# editoriale: è una dichiarazione divergente.
#
# Il controllo confronta la data dell'ultima modifica registrata in git per
# ciascun documento e per la sua traduzione. Non verifica il *contenuto* — non
# potrebbe — ma intercetta il caso che conta: l'originale è cambiato dopo la
# traduzione, quindi la traduzione è indietro di sicuro.
set -euo pipefail

cd "$(dirname "$0")/.."

SORGENTE="docs"
TRADOTTO="website/i18n/en/docusaurus-plugin-content-docs/current"

mancanti=0
divergenti=0
allineati=0

# Aree di cui si esige la traduzione. La decisione D56, emendando D52, rende
# prerequisiti non negoziabili soltanto queste: le avvertenze pubbliche, la
# guida dei fondamenti, la conformità e la sicurezza. Il resto è pianificato e
# non bloccante, quindi l'assenza si annota ma non fa fallire.
AREE_ESIGITE="10_fondamenti 06_security 08_compliance"

for src in $(find "$SORGENTE" -name '*.md' | sort); do
  rel="${src#$SORGENTE/}"
  dst="$TRADOTTO/$rel"
  area="${rel%%/*}"

  esigita=0
  for a in $AREE_ESIGITE; do [ "$area" = "$a" ] && esigita=1; done

  if [ ! -f "$dst" ]; then
    if [ "$esigita" -eq 1 ]; then
      printf '\033[31m✗ traduzione assente (esigita): %s\033[0m\n' "$rel"
      mancanti=$((mancanti+1))
    else
      printf '\033[33m· traduzione assente (pianificata): %s\033[0m\n' "$rel"
    fi
    continue
  fi

  t_src=$(git log -1 --format=%ct -- "$src" 2>/dev/null || echo 0)
  t_dst=$(git log -1 --format=%ct -- "$dst" 2>/dev/null || echo 0)

  if [ "$t_src" -gt "$t_dst" ] && [ "$t_dst" -ne 0 ]; then
    printf '\033[31m✗ divergenza: %s — l'"'"'originale è cambiato dopo la traduzione\033[0m\n' "$rel"
    divergenti=$((divergenti+1))
  else
    allineati=$((allineati+1))
  fi
done

printf '\nAllineati: %d · Divergenti: %d · Assenti ed esigiti: %d\n' \
  "$allineati" "$divergenti" "$mancanti"

if [ "$divergenti" -gt 0 ] || [ "$mancanti" -gt 0 ]; then
  cat <<'NOTA'

Che cosa fare. Una divergenza si risolve ritraducendo il documento, non
annotandola: la nota si dimentica, il controllo no. Se l'originale è cambiato
in modo puramente redazionale e la traduzione resta corretta, si tocca comunque
il file tradotto nello stesso commit, così la relazione fra i due resta vera e
il controllo non impara a mentire.
NOTA
  exit 1
fi

printf '\033[32m✓ Nessuna divergenza fra italiano e inglese.\033[0m\n'
