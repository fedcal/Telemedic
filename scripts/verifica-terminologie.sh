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
set -euo pipefail

cd "$(dirname "$0")/.."
esito=0

segnala() {
  printf '\n\033[31m✗ %s\033[0m\n' "$1"
  printf '%s\n' "$2"
  esito=1
}

# 1. Identificatori di concetti SNOMED CT: numeri lunghi accostati a marcatori
#    tipici del formato di rilascio. Il solo numero non basta come indizio.
if grep -rInE '\b(conceptId|SCTID|sctid)\b[^A-Za-z0-9]{0,4}[0-9]{6,18}' \
     --include='*.md' --include='*.json' --include='*.java' --include='*.ts' \
     --include='*.sql' --include='*.csv' --include='*.txt' . 2>/dev/null; then
  segnala "Possibile contenuto SNOMED CT nel repository." \
"Il progetto non versiona contenuti di terminologie sotto licenza e deve restare
pienamente funzionale senza di esse. Se questo è un falso positivo, spiegalo
nella proposta di modifica invece di allargare il controllo."
fi

# 2. Righe del formato di rilascio tabellare delle terminologie, riconoscibili
#    dalle intestazioni canoniche.
if grep -rIlE '^id[[:space:]]+effectiveTime[[:space:]]+active' . 2>/dev/null; then
  segnala "File in formato di rilascio di una terminologia." \
"Le tabelle di rilascio non vanno versionate in alcuna forma, nemmeno parziale
e nemmeno a scopo di prova. I dati di prova si generano sintetici."
fi

# 3. Scaricamenti automatici di terminologie: sono vietati a chiunque, non solo
#    sconsigliati. Un comando che scarica è più pericoloso di un file, perché si
#    esegue anche quando nessuno lo sta guardando.
if grep -rInE '(curl|wget|fetch)[^\n]{0,200}(snomed|SnomedCT|umls|uts\.nlm\.nih\.gov)' \
     --include='*.sh' --include='*.yml' --include='*.yaml' --include='*.java' \
     --include='*.ts' --include='*.js' --include='Dockerfile*' --include='Makefile' . 2>/dev/null; then
  segnala "Scaricamento automatico di una terminologia sotto licenza." \
"Nessun componente del progetto può scaricare terminologie sotto licenza, in
nessuna circostanza e per nessuno."
fi

if [ "$esito" -eq 0 ]; then
  printf '\033[32m✓ Nessun contenuto di terminologia sotto licenza rilevato.\033[0m\n'
fi
exit "$esito"
