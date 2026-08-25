#!/usr/bin/env bash
# Controlli redazionali che il progetto si è imposto e che devono poter fallire.
#
# Ogni controllo qui dentro corrisponde a una regola scritta nella
# documentazione. Una regola senza un controllo si erode nel giro di pochi mesi:
# non perché qualcuno la violi deliberatamente, ma perché nessuno la ricorda
# mentre scrive.
set -euo pipefail

cd "$(dirname "$0")/.."
esito=0

segnala() {
  printf '\n\033[31m✗ %s\033[0m\n%s\n' "$1" "$2"
  esito=1
}

# 1. Frontmatter YAML: valori non quotati contenenti due punti seguiti da spazio.
#    Fanno fallire la costruzione del sito con un errore che indica
#    l'indentazione e non ha nulla a che vedere con l'indentazione.
trovati=""
for f in $(find docs -name '*.md'); do
  head -1 "$f" | grep -q '^---$' || continue
  fine=$(awk 'NR>1 && /^---$/{print NR; exit}' "$f")
  [ -n "$fine" ] || continue
  if sed -n "2,$((fine-1))p" "$f" | grep -qE '^[A-Za-z_][A-Za-z0-9_]*:[[:space:]]+[^"'"'"'][^:]*:[[:space:]]'; then
    trovati="$trovati $f"
  fi
done
if [ -n "$trovati" ]; then
  segnala "Frontmatter con valori da quotare:$trovati" \
"Un valore che contiene due punti seguiti da spazio va racchiuso fra virgolette
doppie, altrimenti la costruzione del sito fallisce."
fi

# 2. Rinvii relativi che escono da docs/. Funzionano su GitHub ma non sul sito
#    pubblicato, dove producono un 404 silenzioso.
if grep -rnoE '\]\((\.\./)+[A-Z][A-Za-z0-9_-]*\.md\)' docs/ 2>/dev/null; then
  segnala "Rinvii relativi che escono dalla cartella della documentazione." \
"Usa URL assoluti verso GitHub: https://github.com/fedcal/Telemedic/blob/main/<file>"
fi

# 3. Segnaposto di segreti: nel repository stanno solo variabili d'ambiente.
if grep -rInE '(password|passwd|secret|api[_-]?key|token)[[:space:]]*[:=][[:space:]]*["'"'"'][A-Za-z0-9/+=._-]{12,}["'"'"']' \
     --include='*.yml' --include='*.yaml' --include='*.java' --include='*.ts' \
     --include='*.js' --include='*.properties' --include='*.env*' . 2>/dev/null \
   | grep -vE '\$\{[A-Z_]+\}|ESEMPIO|esempio|EXAMPLE|placeholder|xxx|XXX'; then
  segnala "Possibile segreto in chiaro." \
"Nel repository stanno soltanto segnaposto nella forma \${VARIABILE_AMBIENTE}."
fi

if [ "$esito" -eq 0 ]; then
  printf '\033[32m✓ Controlli redazionali superati.\033[0m\n'
fi
exit "$esito"
