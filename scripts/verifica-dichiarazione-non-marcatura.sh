#!/usr/bin/env bash
# Controllo di pubblicazione - criterio 7 di T-01.
#
# Il progetto non appone marcatura CE (vedi NOT-A-MEDICAL-DEVICE.md alla radice del repository) e
# non pubblica un artefatto che non renda quella dichiarazione raggiungibile da chi lo riceve: la
# dichiarazione non serve se sta soltanto nel repository sorgente e non nell'artefatto che le
# persone effettivamente vedono. Questo controllo impedisce la pubblicazione - cioè fa fallire con
# uscita diversa da zero - di un artefatto costruito privo della dichiarazione.
#
# L'ARTEFATTO ESAMINATO. Oggi (prima di T-03) l'unico artefatto pubblicabile è il sito costruito
# da website/ - le cartelle website/build (italiano) e website/build/en (inglese). Il controllo
# prende la directory dell'artefatto come primo argomento, per poter essere collaudato su una
# tenuta costruita apposta e priva della dichiarazione, senza toccare il sito reale.
#
# IL CRITERIO, E PERCHÉ REGGE A UNA RISCRITTURA DEI TESTI.
# Alla data di scrittura di questo controllo, NOT-A-MEDICAL-DEVICE.md e DISTRIBUTION-POLICY.md
# sono in corso di riscrittura per l'allineamento a D58: la loro FRASE letterale può cambiare da
# un momento all'altro. Un controllo fondato su una frase letterale si romperebbe con quella
# riscrittura, silenziosamente o rumorosamente, senza che sia cambiato nulla di sostanziale. Il
# controllo si fonda perciò su elementi STRUTTURALI, non sul testo:
#
#   1. l'ESISTENZA dei due documenti sorgente alla radice del repository - non il loro contenuto;
#   2. la presenza, nell'artefatto pubblicato, di un COLLEGAMENTO il cui indirizzo cita il nome
#      letterale dei due file (es. ".../blob/main/NOT-A-MEDICAL-DEVICE.md"). Rinominare quel file
#      è un atto strutturale deliberato - romperebbe anche il collegamento su GitHub - e non
#      qualcosa che una riscrittura editoriale del contenuto del file fa per caso;
#   3. la presenza, nella pagina d'ingresso dell'artefatto (index.html), dell'elemento marcato con
#      la classe CSS "tmWarn" - il blocco dedicato alla dichiarazione in home page
#      (website/src/pages/index.js). Anche il nome di questa classe è un identificatore
#      strutturale del codice sorgente del sito, non prosa: sopravvive a una riformulazione del
#      testo contenuto al suo interno.
#
# Un artefatto che passa questo controllo può quindi cambiare le PAROLE della dichiarazione da un
# giorno all'altro senza far fallire la costruzione - è la riscrittura in corso, ed è legittima -
# ma non può farla SPARIRE: se il collegamento o il blocco dedicato non ci sono più, il controllo
# fallisce, chiunque abbia toccato per ultimo il testo.
#
# COLLAUDABILITÀ. Il controllo accetta due variabili d'ambiente, oltre all'argomento obbligatorio:
#   ARTEFATTO      - in alternativa al primo argomento posizionale
#   RADICE_SORGENTI - radice in cui cercare i due documenti sorgente (per difetto la radice del
#                     repository). Serve a provare il caso "documenti sorgente assenti" senza
#                     rimuovere i file reali del repository.
#
# ESTENSIONE - criteri 4 e 5 di T-07 (N-d del piano T-07-sito-di-documentazione.md §2.3).
#
# Il controllo, alla sua prima stesura, verificava che ALMENO UNA pagina collegasse i due
# documenti e che il blocco dedicato comparisse nella SOLA home page. Il criterio 5 dice «ogni
# pagina», non «almeno una»: un controllo che si accontenta di un solo riscontro non si
# accorgerebbe di una pagina che ha perso il piè di pagina - per una sostituzione di componente,
# per una pagina resa fuori dal tema, per una costruzione parziale. Due accertamenti in più,
# entrambi strutturali per la stessa ragione già scritta sopra:
#
#   5. OGNI pagina HTML dell'artefatto contiene il marcatore "tmWarnFooter" - lo <span> che
#      racchiude l'avvertenza di non marcatura dentro il piè di pagina (footer.copyright di
#      website/docusaurus.config.mjs e website/i18n/en/docusaurus-theme-classic/footer.json). A
#      differenza di "tmWarn", che sta solo in home page, il piè di pagina è nel layout
#      condiviso da OGNI pagina del sito: è la proprietà che il criterio 5 esige.
#   6. Ogni collegamento assoluto verso "https://github.com/<org>/<repo>/blob/main/<percorso>"
#      presente nelle pagine pubblicate corrisponde a un file ESISTENTE nel repository sorgente
#      (verifica locale sul filesystem, non una richiesta di rete: un guasto della rete non deve
#      poter simulare un collegamento rotto). Chiude Q-26 insieme a Q-198 - il controllo
#      esistente verificava che il collegamento ci fosse, non che il bersaglio rispondesse.
#
# COLLAUDABILITÀ DELL'ESTENSIONE. Una terza variabile d'ambiente:
#   ORG_REPO - "<org>/<repo>" atteso negli href assoluti (per difetto "fedcal/Telemedic", come in
#              website/docusaurus.config.mjs). Serve a collaudare il caso su una tenuta che usa un
#              altro nome di organizzazione/repository senza dipendere da quello reale.
set -euo pipefail

cd "$(dirname "$0")/.."

ARTEFATTO="${ARTEFATTO:-${1:-}}"
RADICE_SORGENTI="${RADICE_SORGENTI:-.}"
ORG_REPO="${ORG_REPO:-fedcal/Telemedic}"

esito=0

segnala() {
  printf '\n\033[31m✗ %s\033[0m\n%s\n' "$1" "$2"
  esito=1
}

if [ -z "$ARTEFATTO" ]; then
  printf '\033[31m✗ Uso: %s <percorso-artefatto>\033[0m\n' "$0"
  printf "La directory dell'artefatto costruito da esaminare (es. website/build oppure website/build/en).\n"
  exit 2
fi

# --- 1. I documenti sorgente devono esistere. Senza sorgente non c'è nulla da pubblicare. ---

for doc in NOT-A-MEDICAL-DEVICE.md DISTRIBUTION-POLICY.md; do
  if [ ! -f "$RADICE_SORGENTI/$doc" ]; then
    segnala "Documento sorgente assente: $RADICE_SORGENTI/$doc" \
"La dichiarazione di non marcatura non può essere pubblicata se il documento che la contiene
non esiste nel repository. Ripristina il file prima di costruire l'artefatto."
  fi
done

# Un sorgente mancante rende inutile continuare: non c'è un contenuto da collegare.
if [ "$esito" -ne 0 ]; then
  exit "$esito"
fi

# --- 2. L'artefatto deve esistere ed essere costruito (deve contenere pagine HTML). ---

if [ ! -d "$ARTEFATTO" ]; then
  segnala "Directory dell'artefatto assente: $ARTEFATTO" \
"Costruisci il sito prima di eseguire questo controllo (in website/: npm run build), oppure
verifica il percorso passato come argomento."
  exit "$esito"
fi

mapfile -t pagine_html < <(find "$ARTEFATTO" -type f -name '*.html' | sort)
if [ "${#pagine_html[@]}" -eq 0 ]; then
  segnala "Nessuna pagina HTML in $ARTEFATTO" \
"Un artefatto senza pagine costruite non è pubblicabile: verifica che la costruzione del sito
sia andata a buon fine prima di eseguire questo controllo."
  exit "$esito"
fi

# --- 3. Collegamento raggiungibile ai due documenti, da qualunque pagina pubblicata. ---
#
# Il collegamento compare nel piè di pagina di OGNI pagina del sito (footer del tema Docusaurus,
# vedi website/docusaurus.config.mjs): se manca ovunque, il piè di pagina è stato tolto o quel
# collegamento è stato rimosso, non è un caso isolato di una singola pagina.

if ! grep -rlF 'NOT-A-MEDICAL-DEVICE.md' -- "${pagine_html[@]}" >/dev/null 2>&1; then
  segnala "Nessuna pagina pubblicata collega NOT-A-MEDICAL-DEVICE.md" \
"L'artefatto non rende raggiungibile la dichiarazione di non dispositivo medico. Verifica il
piè di pagina del sito (website/docusaurus.config.mjs, sezione footer.links)."
fi

if ! grep -rlF 'DISTRIBUTION-POLICY.md' -- "${pagine_html[@]}" >/dev/null 2>&1; then
  segnala "Nessuna pagina pubblicata collega DISTRIBUTION-POLICY.md" \
"L'artefatto non rende raggiungibile la politica di distribuzione. Verifica il piè di pagina
del sito (website/docusaurus.config.mjs, sezione footer.links)."
fi

# --- 4. Il blocco dedicato alla dichiarazione deve comparire in home page. ---

home="$ARTEFATTO/index.html"
if [ ! -f "$home" ]; then
  segnala "Pagina d'ingresso assente: $home" \
"L'artefatto passato non ha una index.html alla radice: passa la cartella della lingua
costruita (es. website/build o website/build/en), non una sua sottocartella."
elif ! grep -qF 'tmWarn' "$home"; then
  segnala "Il blocco della dichiarazione non compare nella pagina d'ingresso: $home" \
"La home page non contiene l'elemento marcato con la classe \"tmWarn\"
(website/src/pages/index.js): la dichiarazione di non marcatura non è visibile a chi apre il
sito. Verifica che il blocco non sia stato rimosso dalla pagina."
fi

# --- 5. Criterio 5 di T-07: OGNI pagina HTML porta il marcatore dell'avvertenza nel piè di
#        pagina, non solo la home. ---

senza_marcatore=()
for pagina in "${pagine_html[@]}"; do
  if ! grep -qF 'tmWarnFooter' "$pagina"; then
    senza_marcatore+=("$pagina")
  fi
done
if [ "${#senza_marcatore[@]}" -gt 0 ]; then
  segnala "${#senza_marcatore[@]} pagina/e senza il marcatore dell'avvertenza nel piè di pagina" \
"Il marcatore strutturale \"tmWarnFooter\" (footer.copyright di website/docusaurus.config.mjs e
website/i18n/en/docusaurus-theme-classic/footer.json) non compare su:
$(printf '  - %s\n' "${senza_marcatore[@]}")
Il criterio 5 di T-07 esige l'avvertenza su OGNI pagina pubblicata, non solo sulla home."
fi

# --- 6. Criterio 4 di T-07 / Q-26 / Q-198: ogni href assoluto verso il repository corrisponde a
#        un file esistente - verifica locale sul filesystem, non una richiesta di rete. ---

mapfile -t href_assoluti < <(
  # "-a": alcune pagine HTML del corpus reale sono state classificate come binarie dall'euristica
  # di grep (probabilmente per una sequenza di byte multibyte che l'euristica legge come tale).
  # Senza "-a" grep salta l'estrazione dei collegamenti da quelle pagine e stampa solo «il file
  # binario corrisponde», perdendo silenziosamente ogni href che comparisse SOLO lì. Trovato
  # collaudando questo controllo sul sito reale (26 pagine coinvolte su website/build).
  grep -aohE "https://github\.com/${ORG_REPO}/blob/main/[^\"'>[:space:])]+" -- "${pagine_html[@]}" \
    | sed -E 's/[.,;:]+$//' \
    | sort -u
)

if [ "${#href_assoluti[@]}" -eq 0 ]; then
  segnala "Nessun collegamento assoluto verso il repository trovato nell'artefatto" \
"Atteso almeno un rinvio nella forma https://github.com/${ORG_REPO}/blob/main/<percorso> (le
avvertenze pubbliche nel piè di pagina). Se l'organizzazione/repository non è
\"${ORG_REPO}\", indica ORG_REPO."
else
  percorsi_inesistenti=()
  for href in "${href_assoluti[@]}"; do
    percorso="${href#https://github.com/${ORG_REPO}/blob/main/}"
    if [ ! -f "$RADICE_SORGENTI/$percorso" ]; then
      percorsi_inesistenti+=("$percorso")
    fi
  done
  if [ "${#percorsi_inesistenti[@]}" -gt 0 ]; then
    segnala "${#percorsi_inesistenti[@]} collegamento/i assoluto/i verso un percorso inesistente nel repository" \
"$(printf '  - %s\n' "${percorsi_inesistenti[@]}")
Ciascuno di questi percorsi non esiste sotto $RADICE_SORGENTI. Chi segue il collegamento
pubblicato trova un 404: rinomina/sposta il file sorgente insieme al collegamento che lo cita,
oppure correggi il collegamento."
  fi
fi

if [ "$esito" -eq 0 ]; then
  printf '\033[32m✓ Dichiarazione di non marcatura raggiungibile su ogni pagina (%s pagine esaminate), e %s collegamento/i assoluto/i verso il repository tutti raggiungibili: %s.\033[0m\n' \
    "${#pagine_html[@]}" "${#href_assoluti[@]}" "$ARTEFATTO"
fi

exit "$esito"
