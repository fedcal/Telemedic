#!/usr/bin/env bash
# Controllo di pubblicazione - criterio 1 di T-07, seconda metà (le voci di menu).
#
# Il controllo bloccante sui collegamenti (onBrokenLinks/onBrokenAnchors di
# website/docusaurus.config.mjs, criterio 2 di T-03) verifica i rinvii dentro la PROSA dei
# documenti. Non verifica le voci di navigazione dichiarate in CONFIGURAZIONE - gli elementi
# della barra di navigazione e del piè di pagina che usano la proprietà "to:" - perché quelle non
# sono contenuto Markdown attraversato dal plugin dei documenti: sono dati di configurazione del
# tema. Un "to:" scritto male non fa fallire la costruzione e produce un collegamento silenziosamente
# rotto in produzione. Questo controllo chiude quella lacuna, confrontando ogni "to:" dichiarato
# con le rotte REALMENTE pubblicate nella mappa del sito (sitemap.xml), generata dalla
# costruzione stessa - non un elenco calcolato a parte, che potrebbe divergere.
#
# CHE COSA NON SERVE VERIFICARE QUI. Le voci di tipo "docSidebar" (le due barre laterali
# principali) puntano al primo documento della rispettiva barra, generata automaticamente dalle
# cartelle di docs/: non possono riferirsi a una pagina inesistente per costruzione (vedi
# .telemedic/piani/T-07-sito-di-documentazione.md §1.1). Le voci "href:" sono collegamenti esterni
# (GitHub) e sono verificate separatamente da scripts/verifica-dichiarazione-non-marcatura.sh per
# quelle verso il repository (criterio 4 di T-07 / Q-26 / Q-198).
#
# COLLAUDABILITÀ. Il controllo accetta due variabili d'ambiente:
#   CONFIG   - percorso di docusaurus.config.mjs (default: website/docusaurus.config.mjs)
#   SITEMAP  - percorso della mappa del sito generata (default: website/build/sitemap.xml)
set -euo pipefail

cd "$(dirname "$0")/.."

CONFIG="${CONFIG:-website/docusaurus.config.mjs}"
SITEMAP="${SITEMAP:-website/build/sitemap.xml}"

esito=0

segnala() {
  printf '\n\033[31m✗ %s\033[0m\n%s\n' "$1" "$2"
  esito=1
}

if [ ! -f "$CONFIG" ]; then
  printf '\033[31m✗ Configurazione inesistente: %s\033[0m\n' "$CONFIG"
  exit 2
fi
if [ ! -f "$SITEMAP" ]; then
  printf '\033[31m✗ Mappa del sito inesistente: %s\033[0m\n' "$SITEMAP"
  printf "Costruisci il sito prima di eseguire questo controllo (in website/: npm run build).\n"
  exit 2
fi

mapfile -t voci_menu < <(grep -oE "to: '[^']+'" "$CONFIG" | sed -E "s/^to: '//; s/'\$//" | sort -u)

if [ "${#voci_menu[@]}" -eq 0 ]; then
  printf '\033[31m✗ Nessuna voce "to:" trovata in %s\033[0m\n' "$CONFIG"
  exit 2
fi

for voce in "${voci_menu[@]}"; do
  # Confronto per stringa fissa (non un'espressione regolare: un percorso di documentazione può
  # contenere caratteri che in un'espressione regolare hanno un significato speciale, e non c'è
  # ragione di doverli escapare). La mappa del sito porta dominio e baseUrl in testa a ogni
  # indirizzo, che questo controllo non ricalcola - confronta ciò che la costruzione ha davvero
  # pubblicato, non una previsione di come dovrebbe comporsi l'indirizzo. "${voce}</loc>" senza
  # ancora di fine riga: sufficiente, perché il generatore della mappa non aggiunge mai nulla
  # dopo "</loc>" sulla stessa riga.
  if ! grep -qF -- "${voce}</loc>" "$SITEMAP"; then
    segnala "Voce di menu senza pagina pubblicata: \"$voce\"" \
"Nessuna riga di $SITEMAP termina con \"$voce</loc>\". La voce è dichiarata in $CONFIG
(navbar.items o footer.links, proprietà \"to:\") ma la costruzione non ha pubblicato una pagina a
quell'indirizzo: verifica che il percorso sia corretto o che il documento non sia stato spostato."
  fi
done

if [ "$esito" -eq 0 ]; then
  printf '\033[32m✓ %d voce/i di menu, tutte con una pagina pubblicata corrispondente.\033[0m\n' "${#voci_menu[@]}"
fi

exit "$esito"
