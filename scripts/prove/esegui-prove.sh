#!/usr/bin/env bash
# Banco di prova dei controlli di pipeline di T-01 (criteri 5 e 7) e di
# verifica-divergenza-traduzioni.sh (tre aspetti collaudati separatamente: data, parità
# strutturale, pagine orfane).
#
# Un controllo che nessuno ha mai visto fallire non è un controllo: è una speranza. Questo banco
# esegue ciascuno dei controlli contro tenute preparate apposta - una valida, che deve passare, e
# più tenute deliberatamente errate, che devono far fallire il controllo. Per ogni tenuta
# deliberatamente errata, QUESTA PROVA fallisce se il controllo la lascia passare: è il punto
# dell'intero banco, non un dettaglio.
#
# Le tenute dei primi due controlli stanno in scripts/prove/tenute/, ciascuna con un nome che dice
# che cosa prova. Nessuna tenuta contiene dati reali di paziente: sono tutte sintetiche, e
# riconoscibili come tali (gli identificativi di requisito usati per il collaudo stanno
# nell'intervallo 9000-9999, riservato a questo scopo per non collidere mai con il registro reale
# del progetto). I controlli 3-4-5 (tutti su verifica-divergenza-traduzioni.sh) non hanno una
# tenuta statica: quello script non accetta variabili d'ambiente per puntare a una tenuta e non
# può quindi essere collaudato senza toccare docs/ o website/ del repository reale. Ciascuno
# costruisce perciò, al momento dell'esecuzione, un repository git sintetico e temporaneo fuori
# dall'albero versionato, dentro cui copia il contenuto ATTUALE dello script da collaudare - vedi
# i commenti sopra a ciascuna funzione "_prepara_sandbox_*" più sotto.
set -euo pipefail

cd "$(dirname "$0")"
TENUTE="$PWD/tenute"
RADICE_REPO="$PWD/../.."

esito=0
totale=0
attese_rispettate=0

segnala() {
  printf '\n\033[31m✗ %s\033[0m\n%s\n' "$1" "$2"
  esito=1
}

# esegui_caso <descrizione> <esito-atteso: passa|fallisce> <comando...>
#
# <comando...> è eseguito con "$@" dopo aver instradato le variabili d'ambiente necessarie: chi
# chiama questa funzione le esporta prima della chiamata.
esegui_caso() {
  local descrizione="$1" atteso="$2"
  shift 2
  totale=$((totale+1))

  local uscita=0
  "$@" >/tmp/esegui-prove.out 2>&1 || uscita=$?

  local ok=0
  if [ "$atteso" = "passa" ] && [ "$uscita" -eq 0 ]; then
    ok=1
  elif [ "$atteso" = "fallisce" ] && [ "$uscita" -ne 0 ]; then
    ok=1
  fi

  if [ "$ok" -eq 1 ]; then
    attese_rispettate=$((attese_rispettate+1))
    printf '\033[32m✓\033[0m %s (atteso: %s, uscita: %d)\n' "$descrizione" "$atteso" "$uscita"
  else
    printf '\033[31m✗\033[0m %s (atteso: %s, uscita reale: %d)\n' "$descrizione" "$atteso" "$uscita"
    segnala "Il controllo non si è comportato come atteso: $descrizione" \
"$(cat /tmp/esegui-prove.out)"
  fi
}

printf '\n== Controllo 1 - verifica-identificativi-requisiti.sh (criterio 5 di T-01) ==\n\n'

REGISTRO_VALIDO="$TENUTE/registro/registro-valido.tsv"

esegui_caso "caso valido: prova cita un identificativo in vigore" passa \
  env REGISTRO="$REGISTRO_VALIDO" PROVE_RADICE="$TENUTE/prove-valide" \
  "$RADICE_REPO/scripts/verifica-identificativi-requisiti.sh"

esegui_caso "insieme vuoto: nessuna prova, deve passare senza rumore" passa \
  env REGISTRO="$REGISTRO_VALIDO" PROVE_RADICE="$TENUTE/prove-vuote" \
  "$RADICE_REPO/scripts/verifica-identificativi-requisiti.sh"

esegui_caso "registro malformato: colonne mancanti" fallisce \
  env REGISTRO="$TENUTE/registro/registro-malformato-colonne-mancanti.tsv" PROVE_RADICE="$TENUTE/prove-vuote" \
  "$RADICE_REPO/scripts/verifica-identificativi-requisiti.sh"

esegui_caso "registro malformato: evento non ammesso" fallisce \
  env REGISTRO="$TENUTE/registro/registro-malformato-evento-non-ammesso.tsv" PROVE_RADICE="$TENUTE/prove-vuote" \
  "$RADICE_REPO/scripts/verifica-identificativi-requisiti.sh"

esegui_caso "registro malformato: identificativo duplicato" fallisce \
  env REGISTRO="$TENUTE/registro/registro-malformato-duplicato.tsv" PROVE_RADICE="$TENUTE/prove-vuote" \
  "$RADICE_REPO/scripts/verifica-identificativi-requisiti.sh"

esegui_caso "registro malformato: riuso vietato dopo ritiro" fallisce \
  env REGISTRO="$TENUTE/registro/registro-malformato-riuso-vietato.tsv" PROVE_RADICE="$TENUTE/prove-vuote" \
  "$RADICE_REPO/scripts/verifica-identificativi-requisiti.sh"

# Come sopra, ma con l'ordine fisico delle righe deliberatamente diverso dall'ordine cronologico
# (esattamente come fa il registro reale, ordinato per famiglia - registro/README.md, "Come si
# calcola lo stato"): prova che il riuso si rileva per data, non per posizione nel file.
esegui_caso "registro malformato: riuso vietato, righe fuori ordine fisico" fallisce \
  env REGISTRO="$TENUTE/registro/registro-malformato-riuso-fuori-ordine-fisico.tsv" PROVE_RADICE="$TENUTE/prove-vuote" \
  "$RADICE_REPO/scripts/verifica-identificativi-requisiti.sh"

esegui_caso "prova cita un identificativo assente dal registro" fallisce \
  env REGISTRO="$REGISTRO_VALIDO" PROVE_RADICE="$TENUTE/prove-identificativo-assente" \
  "$RADICE_REPO/scripts/verifica-identificativi-requisiti.sh"

esegui_caso "prova cita un identificativo ritirato" fallisce \
  env REGISTRO="$REGISTRO_VALIDO" PROVE_RADICE="$TENUTE/prove-identificativo-ritirato" \
  "$RADICE_REPO/scripts/verifica-identificativi-requisiti.sh"

# La famiglia EX-* ha grammatica alfanumerica (segmenti maiuscoli separati da trattino), non
# numerica come le altre sette: un difetto già corretto una volta (vedi il commento in testa allo
# script) faceva sì che nessun identificativo EX-* venisse mai riconosciuto. Questi quattro casi
# provano la correzione e impediscono che regredisca.
REGISTRO_CON_EX="$TENUTE/registro/registro-valido-con-ex.tsv"

esegui_caso "esito EX-* in vigore, citato correttamente" passa \
  env REGISTRO="$REGISTRO_CON_EX" PROVE_RADICE="$TENUTE/prove-ex-valido" \
  "$RADICE_REPO/scripts/verifica-identificativi-requisiti.sh"

esegui_caso "esito EX-* assente dal registro" fallisce \
  env REGISTRO="$REGISTRO_CON_EX" PROVE_RADICE="$TENUTE/prove-ex-assente" \
  "$RADICE_REPO/scripts/verifica-identificativi-requisiti.sh"

esegui_caso "esito EX-* ritirato" fallisce \
  env REGISTRO="$REGISTRO_CON_EX" PROVE_RADICE="$TENUTE/prove-ex-ritirato" \
  "$RADICE_REPO/scripts/verifica-identificativi-requisiti.sh"

# Il prefisso generico "EX-TM-*" (con l'asterisco letterale) compare in prosa per indicare
# un'intera sottofamiglia (docs/03_functional/00-indice.md e 02-catalogo-dei-requisiti.md). Non è
# un identificativo: non deve mai essere scambiato per uno, quindi questo caso non cita nulla e
# deve passare come un insieme vuoto.
esegui_caso "prefisso generico EX-TM-* non scambiato per un identificativo" passa \
  env REGISTRO="$REGISTRO_CON_EX" PROVE_RADICE="$TENUTE/prove-ex-prefisso-generico" \
  "$RADICE_REPO/scripts/verifica-identificativi-requisiti.sh"

printf '\n== Controllo 2 - verifica-dichiarazione-non-marcatura.sh (criterio 7 di T-01) ==\n\n'

esegui_caso "caso valido: artefatto con collegamenti e blocco dedicato" passa \
  "$RADICE_REPO/scripts/verifica-dichiarazione-non-marcatura.sh" "$TENUTE/artefatto-valido"

esegui_caso "artefatto deliberatamente privo della dichiarazione" fallisce \
  "$RADICE_REPO/scripts/verifica-dichiarazione-non-marcatura.sh" "$TENUTE/artefatto-privo-dichiarazione"

esegui_caso "artefatto con i collegamenti ma senza il blocco dedicato in home" fallisce \
  "$RADICE_REPO/scripts/verifica-dichiarazione-non-marcatura.sh" "$TENUTE/artefatto-link-senza-banner"

esegui_caso "artefatto senza alcuna pagina HTML" fallisce \
  "$RADICE_REPO/scripts/verifica-dichiarazione-non-marcatura.sh" "$TENUTE/artefatto-senza-html"

esegui_caso "directory dell'artefatto inesistente" fallisce \
  "$RADICE_REPO/scripts/verifica-dichiarazione-non-marcatura.sh" "$TENUTE/questa-directory-non-esiste"

esegui_caso "nessun argomento fornito" fallisce \
  "$RADICE_REPO/scripts/verifica-dichiarazione-non-marcatura.sh"

esegui_caso "documenti sorgente assenti (RADICE_SORGENTI su tenuta vuota)" fallisce \
  env RADICE_SORGENTI="$TENUTE/radice-sorgenti-assente" \
  "$RADICE_REPO/scripts/verifica-dichiarazione-non-marcatura.sh" "$TENUTE/artefatto-valido"

if [ -d "$RADICE_REPO/website/build" ]; then
  printf '\n== Controllo 2 sul sito reale (se già costruito) ==\n\n'
  esegui_caso "sito reale costruito, italiano: website/build" passa \
    "$RADICE_REPO/scripts/verifica-dichiarazione-non-marcatura.sh" "$RADICE_REPO/website/build"
  if [ -d "$RADICE_REPO/website/build/en" ]; then
    esegui_caso "sito reale costruito, inglese: website/build/en" passa \
      "$RADICE_REPO/scripts/verifica-dichiarazione-non-marcatura.sh" "$RADICE_REPO/website/build/en"
  fi
else
  printf '\n\033[33m· website/build non esiste in questo momento: il caso sul sito reale è saltato, non fallito.\033[0m\n'
fi

printf '\n== Controllo 3 - verifica-divergenza-traduzioni.sh (correzione: file sorgente non tracciato) ==\n\n'

# verifica-divergenza-traduzioni.sh non accetta variabili d'ambiente per SORGENTE/TRADOTTO: cd
# sempre alla radice del proprio repository (dirname "$0"/..) e guarda docs/ e website/i18n/en/...
# lì. Non possiamo quindi puntarlo su una tenuta dentro scripts/prove senza toccare docs/ o
# website/ del repository reale - vietato dal compito. Costruiamo perciò, SOLO in questa funzione,
# un repository git sintetico e temporaneo fuori dall'albero versionato, dentro cui copiamo (senza
# modificarlo) il contenuto ATTUALE dello script da collaudare: se qualcuno reintroduce il difetto
# nello script reale, questa copia lo riporta immediatamente, perché è presa al momento
# dell'esecuzione e non incollata una volta per tutte in una tenuta statica.
#
# Il difetto corretto NON cambiava i conteggi finali (Allineati/Divergenti/Assenti) né il codice
# di uscita dello script: un file sorgente non tracciato, con la sua traduzione già presente e
# committata, finiva comunque nel ramo "else" (allineato) sia con il difetto sia con la
# correzione, perché il confronto fallito veniva comunque valutato come falso. L'unica differenza
# osservabile è che il difetto stampava sull'uscita d'errore «[: : atteso intero» (o, in locale
# C, «integer expected»/«integer expression expected») per ogni file sorgente non tracciato.
# Un'asserzione sui soli conteggi o sul solo codice di uscita non avrebbe MAI rilevato questo
# difetto, prima o dopo la correzione: per questo l'asserzione qui sotto controlla il testo
# dell'uscita, non l'esito binario passa/fallisce dello script collaudato. Forziamo LC_ALL=C
# nell'esecuzione sandbox per rendere il messaggio d'errore deterministico, indipendentemente
# dalla locale di chi esegue il banco.
verifica_traduzione_non_tracciata_senza_errore_intero() {
  local sandbox area salida
  # "errexit" resta attivo nello script chiamante: qui lo disattiviamo solo per la durata di
  # questa funzione (ripristinato dal trap RETURN qualunque sia il punto di uscita), perché il
  # grep finale restituisce apposta un'uscita diversa da zero quando l'errore NON compare - è
  # l'esito atteso nel caso corretto, non un guasto della funzione.
  set +e
  trap 'set -e' RETURN

  sandbox=$(mktemp -d) || return 1
  area="prove-collaudo"

  mkdir -p \
    "$sandbox/scripts" \
    "$sandbox/docs/$area" \
    "$sandbox/website/i18n/en/docusaurus-plugin-content-docs/current/$area" || {
    rm -rf "$sandbox"; return 1
  }

  cp "$RADICE_REPO/scripts/verifica-divergenza-traduzioni.sh" "$sandbox/scripts/" || {
    rm -rf "$sandbox"; return 1
  }

  # La traduzione esiste già e viene committata per prima: è lei a fornire un t_dst reale e
  # diverso da zero, condizione necessaria perché il ramo di confronto temporale (quello del
  # difetto) venga raggiunto.
  cat > "$sandbox/website/i18n/en/docusaurus-plugin-content-docs/current/$area/esito-non-tracciato.md" <<'EOF'
# Synthetic test document (no real patient data)

Synthetic English content used only by the automated test bench.
EOF

  (
    cd "$sandbox" || exit 1
    git init -q -b main
    git config user.email "prove@telemedic.test"
    git config user.name "Banco di prova"
    git add "website/i18n/en/docusaurus-plugin-content-docs/current/$area/esito-non-tracciato.md"
    git commit -q -m "traduzione sintetica di collaudo"
  )
  if [ $? -ne 0 ]; then
    rm -rf "$sandbox"
    return 1
  fi

  # Il file sorgente si crea DOPO il commit della traduzione e resta deliberatamente non
  # tracciato (mai "git add"-ato): è esattamente lo scenario del difetto corretto - "git log" su
  # un file non tracciato esce con successo restituendo una riga vuota.
  cat > "$sandbox/docs/$area/esito-non-tracciato.md" <<'EOF'
# Documento sintetico di collaudo (nessun dato reale di paziente)

Contenuto italiano sintetico usato solo dal banco di prova automatico.
EOF

  salida=$(cd "$sandbox" && LC_ALL=C bash scripts/verifica-divergenza-traduzioni.sh 2>&1)

  rm -rf "$sandbox"

  if printf '%s' "$salida" | grep -qiE 'integer expected|integer expression expected|atteso intero'; then
    printf '%s\n' "$salida"
    return 1
  fi
  return 0
}

esegui_caso "file sorgente non tracciato con traduzione già presente: nessun errore di confronto intero sull'uscita" passa \
  verifica_traduzione_non_tracciata_senza_errore_intero


printf '\n== Controllo 4 - verifica-divergenza-traduzioni.sh (parità strutturale: titoli «## ») ==\n\n'

# Il confronto delle date non vede una traduzione fermata a metà: può essere PIÙ RECENTE
# dell'originale e nondimeno dire meno, se chi l'ha scritta non l'ha dichiarato. È già accaduto -
# un documento è arrivato sul ramo principale con nove sezioni su diciotto, nessun marcatore di
# continuazione, e la data dalla parte giusta: il confronto delle date lo vedeva allineato. Il
# controllo aggiunto conta i titoli di secondo livello («## ») in ciascun documento e nella sua
# traduzione, e segnala una divergenza quando i numeri differiscono - indipendentemente dalle date.
#
# A DIFFERENZA del difetto collaudato al Controllo 3, qui il difetto (o la sua assenza) SPOSTA il
# codice di uscita e il contatore "Divergenti": l'ho verificato prima di darlo per scontato, non
# datolo per buono (vedi il rapporto). Le due tenute sotto committano la traduzione DOPO
# l'originale apposta: per data risulterebbe "allineata" anche quando le sezioni differiscono, il
# che isola il controllo strutturale da quello temporale - se si rimuove il blocco che lo
# implementa, questo stesso scenario passa silenziosamente con uscita 0.
_prepara_sandbox_parita_strutturale() {
  local sandbox="$1" area="$2" n_src="$3" n_dst="$4"
  local file_src file_dst i

  mkdir -p \
    "$sandbox/scripts" \
    "$sandbox/docs/$area" \
    "$sandbox/website/i18n/en/docusaurus-plugin-content-docs/current/$area" || return 1

  cp "$RADICE_REPO/scripts/verifica-divergenza-traduzioni.sh" "$sandbox/scripts/" || return 1

  file_src="$sandbox/docs/$area/parita.md"
  file_dst="$sandbox/website/i18n/en/docusaurus-plugin-content-docs/current/$area/parita.md"

  {
    echo "# Documento sintetico di collaudo (nessun dato reale di paziente)"
    echo
    for ((i = 1; i <= n_src; i++)); do
      echo "## Sezione $i"
      echo "Testo sintetico."
      echo
    done
  } > "$file_src"

  {
    echo "# Synthetic test document (no real patient data)"
    echo
    for ((i = 1; i <= n_dst; i++)); do
      echo "## Section $i"
      echo "Synthetic text."
      echo
    done
  } > "$file_dst"

  (
    cd "$sandbox" || exit 1
    git init -q -b main
    git config user.email "prove@telemedic.test"
    git config user.name "Banco di prova"
    git add "docs/$area/parita.md"
    git commit -q -m "originale sintetico"
    git add "website/i18n/en/docusaurus-plugin-content-docs/current/$area/parita.md"
    git commit -q -m "traduzione sintetica, committata dopo l'originale"
  )
}

verifica_parita_strutturale_con_date_allineate() {
  local sandbox uscita
  set +e
  trap 'set -e' RETURN
  sandbox=$(mktemp -d) || return 1
  _prepara_sandbox_parita_strutturale "$sandbox" "prove-collaudo" 4 2 || { rm -rf "$sandbox"; return 1; }
  (cd "$sandbox" && bash scripts/verifica-divergenza-traduzioni.sh)
  uscita=$?
  rm -rf "$sandbox"
  return "$uscita"
}

verifica_parita_strutturale_sezioni_allineate() {
  local sandbox uscita
  set +e
  trap 'set -e' RETURN
  sandbox=$(mktemp -d) || return 1
  _prepara_sandbox_parita_strutturale "$sandbox" "prove-collaudo" 3 3 || { rm -rf "$sandbox"; return 1; }
  (cd "$sandbox" && bash scripts/verifica-divergenza-traduzioni.sh)
  uscita=$?
  rm -rf "$sandbox"
  return "$uscita"
}

esegui_caso "sezioni allineate fra originale e traduzione: nessuna divergenza strutturale" passa \
  verifica_parita_strutturale_sezioni_allineate

esegui_caso "divergenza strutturale rilevata anche con date allineate (traduzione più recente ma monca)" fallisce \
  verifica_parita_strutturale_con_date_allineate

printf '\n== Controllo 5 - verifica-divergenza-traduzioni.sh (pagine orfane in inglese) ==\n\n'

# Un file inglese il cui percorso non ha un omologo italiano non è una traduzione: è una pagina
# orfana, che Docusaurus pubblica sotto /en/ mentre la pagina "vera" continua a mostrare
# l'italiano. È già accaduto: tre file di 09_roadmap sono stati consegnati con il nome tradotto
# (03-usable-first-release.md invece di 03-primo-rilascio-utilizzabile.md). Il ciclo principale
# non poteva vederlo: parte dall'italiano, e un file che nessuno cerca non manca a nessuno.
#
# Anche qui l'asserzione poggia sul codice di uscita e sul contatore "Orfani": verificato allo
# stesso modo del Controllo 4, non presupposto. Il caso «fallisce» ricrea esattamente lo scenario
# reale - un originale italiano ESISTE nella stessa area, ma con un nome diverso - per provare che
# il controllo confronta il PERCORSO, non la sola presenza di una qualche traduzione nell'area.
_prepara_sandbox_pagine_orfane() {
  local sandbox="$1" area="$2" nome_it="$3" nome_en="$4"

  mkdir -p \
    "$sandbox/scripts" \
    "$sandbox/docs/$area" \
    "$sandbox/website/i18n/en/docusaurus-plugin-content-docs/current/$area" || return 1

  cp "$RADICE_REPO/scripts/verifica-divergenza-traduzioni.sh" "$sandbox/scripts/" || return 1

  if [ -n "$nome_it" ]; then
    printf '# Documento sintetico di collaudo (nessun dato reale di paziente)\n' \
      > "$sandbox/docs/$area/$nome_it"
  fi
  printf '# Synthetic test document (no real patient data)\n' \
    > "$sandbox/website/i18n/en/docusaurus-plugin-content-docs/current/$area/$nome_en"

  # Un repository git SENZA ALCUN COMMIT fa uscire "git log" con stato 128 anche con lo stderr
  # silenziato - non con la riga vuota su cui contava il difetto del Controllo 3. Con "set -e"
  # attivo nello script collaudato, quello stato d'uscita abortirebbe l'intero script alla prima
  # riga toccata dal confronto delle date (raggiunta ogni volta che l'originale e la traduzione
  # condividono lo stesso percorso, come nel caso «passa» qui sotto). Un commit iniziale basta a
  # renderlo un repository reale.
  (
    cd "$sandbox" || exit 1
    git init -q -b main
    git config user.email "prove@telemedic.test"
    git config user.name "Banco di prova"
    git add -A
    git commit -q -m "contenuto sintetico di collaudo"
  )
}

verifica_pagina_orfana_per_nome_tradotto() {
  local sandbox uscita
  set +e
  trap 'set -e' RETURN
  sandbox=$(mktemp -d) || return 1
  _prepara_sandbox_pagine_orfane "$sandbox" "09_roadmap" \
    "03-primo-rilascio-utilizzabile.md" "03-usable-first-release.md" || { rm -rf "$sandbox"; return 1; }
  (cd "$sandbox" && bash scripts/verifica-divergenza-traduzioni.sh)
  uscita=$?
  rm -rf "$sandbox"
  return "$uscita"
}

verifica_pagina_non_orfana_quando_percorso_identico() {
  local sandbox uscita
  set +e
  trap 'set -e' RETURN
  sandbox=$(mktemp -d) || return 1
  _prepara_sandbox_pagine_orfane "$sandbox" "prove-collaudo" "pagina.md" "pagina.md" || { rm -rf "$sandbox"; return 1; }
  (cd "$sandbox" && bash scripts/verifica-divergenza-traduzioni.sh)
  uscita=$?
  rm -rf "$sandbox"
  return "$uscita"
}

esegui_caso "traduzione con percorso identico all'originale: nessuna pagina orfana" passa \
  verifica_pagina_non_orfana_quando_percorso_identico

esegui_caso "pagina orfana per nome tradotto: rilevata anche se esiste un originale italiano con altro nome" fallisce \
  verifica_pagina_orfana_per_nome_tradotto

printf '\n== Controllo 6 - verifica-divergenza-traduzioni.sh (marcatore <!--TRAD-VERIFICATA: <revisione>--> ) ==\n\n'

# Il marcatore permette alla traduzione di dichiararsi VERIFICATA equivalente a una revisione
# precisa dell'originale, invece di imporre un tocco vuoto al file tradotto solo per aggiornarne
# la data - dottrina che insegna a fare modifiche vuote, indistinguibili da una vera per chiunque
# legga la cronologia dopo (vedi il commento nello script collaudato, sopra alla lettura del
# marcatore). La dichiarazione vale SOLO se la revisione nominata contiene già l'ultima modifica
# dell'originale: lo script lo verifica con «git merge-base --is-ancestor». Se l'originale cambia
# ancora dopo, la dichiarazione scade da sola e la divergenza torna a essere segnalata.
#
# I quattro casi sotto costruiscono, ciascuno, un repository git sintetico e temporaneo - stessa
# tecnica dei Controlli 3-5 - dentro cui copiano il contenuto ATTUALE dello script da collaudare.
# Le DATE dei commit si impostano esplicitamente con GIT_AUTHOR_DATE/GIT_COMMITTER_DATE, perché è
# la data COMMITTER - non l'ordine reale in cui i comandi «git commit» vengono eseguiti in questa
# macchina - che «git log --format=%ct» confronta. Questo permette di costruire in modo
# deterministico lo scenario «l'originale è più recente della traduzione» richiesto dal controllo:
# il marcatore che cita la revisione dell'originale può essere scritto SOLO dopo che quella
# revisione esiste (per conoscerne l'impronta), quindi il commit che lo aggiunge alla traduzione è
# sempre, nell'ordine reale di esecuzione, successivo al commit che cita - ma la sua data
# COMMITTER si fissa comunque a un istante precedente, com'è nella realtà: chi legge e verifica
# una traduzione può farlo settimane dopo l'ultima modifica che sta certificando, non nello stesso
# istante.
#
# Costante in tutti e quattro gli scenari: originale e traduzione hanno lo stesso numero di titoli
# «## » in ogni versione, per non far scattare la divergenza STRUTTURALE (Controllo 4) prima di
# raggiungere il confronto sul marcatore.
_marcatore_area="prove-collaudo"
_marcatore_file="marcatore.md"

# Prepara il repository fino al commit che rende l'originale "più recente" della traduzione:
#   commit1 (gennaio) - originale e traduzione allineati, stessa struttura;
#   commit2 (giugno)  - originale modificato in modo redazionale, nessun marcatore ancora.
# Scrive l'impronta di commit2 (la revisione "corrente" dell'originale, cioè quella che una
# dichiarazione valida deve coprire) su standard output, perché i chiamanti la possano leggere.
_prepara_sandbox_marcatore_base() {
  local sandbox="$1" dir_src dir_dst

  dir_src="$sandbox/docs/$_marcatore_area"
  dir_dst="$sandbox/website/i18n/en/docusaurus-plugin-content-docs/current/$_marcatore_area"
  mkdir -p "$sandbox/scripts" "$dir_src" "$dir_dst" || return 1
  cp "$RADICE_REPO/scripts/verifica-divergenza-traduzioni.sh" "$sandbox/scripts/" || return 1

  {
    echo "# Documento sintetico di collaudo (nessun dato reale di paziente)"
    echo
    echo "## Sezione unica"
    echo "Testo italiano, versione uno."
  } > "$dir_src/$_marcatore_file"

  {
    echo "# Synthetic test document (no real patient data)"
    echo
    echo "## Only section"
    echo "English text, version one."
  } > "$dir_dst/$_marcatore_file"

  (
    cd "$sandbox" || exit 1
    git init -q -b main
    git config user.email "prove@telemedic.test"
    git config user.name "Banco di prova"
    git add -A
    GIT_AUTHOR_DATE="2026-01-01 00:00:00 +0000" GIT_COMMITTER_DATE="2026-01-01 00:00:00 +0000" \
      git commit -q -m "originale e traduzione allineati (sintetico)"
  ) || return 1

  {
    echo "# Documento sintetico di collaudo (nessun dato reale di paziente)"
    echo
    echo "## Sezione unica"
    echo "Testo italiano, versione due - refuso corretto, nessun cambio di contenuto sostanziale."
  } > "$dir_src/$_marcatore_file"

  (
    cd "$sandbox" || exit 1
    git add "docs/$_marcatore_area/$_marcatore_file"
    GIT_AUTHOR_DATE="2026-06-01 00:00:00 +0000" GIT_COMMITTER_DATE="2026-06-01 00:00:00 +0000" \
      git commit -q -m "originale: modifica redazionale (sintetico)"
    git rev-parse HEAD
  )
}

# Scenario 1 - nessun marcatore: è il comportamento storico, e deve restare quello che è sempre
# stato. Senza una dichiarazione esplicita, l'originale più recente della traduzione è sempre una
# divergenza.
verifica_marcatore_assente_resta_divergenza() {
  local sandbox uscita
  set +e
  trap 'set -e' RETURN
  sandbox=$(mktemp -d) || return 1
  _prepara_sandbox_marcatore_base "$sandbox" >/dev/null || { rm -rf "$sandbox"; return 1; }
  (cd "$sandbox" && bash scripts/verifica-divergenza-traduzioni.sh)
  uscita=$?
  rm -rf "$sandbox"
  return "$uscita"
}

# Scenario 2 - marcatore che cita esattamente la revisione corrente dell'originale (commit2): la
# dichiarazione copre l'ultima modifica, quindi non è una divergenza.
verifica_marcatore_valido_copre_revisione_corrente() {
  local sandbox rev_src uscita
  set +e
  trap 'set -e' RETURN
  sandbox=$(mktemp -d) || return 1
  rev_src=$(_prepara_sandbox_marcatore_base "$sandbox") || { rm -rf "$sandbox"; return 1; }
  {
    echo "# Synthetic test document (no real patient data)"
    echo
    echo "## Only section"
    echo "English text, version one."
    echo
    echo "<!--TRAD-VERIFICATA: $rev_src-->"
  } > "$sandbox/website/i18n/en/docusaurus-plugin-content-docs/current/$_marcatore_area/$_marcatore_file"
  (
    cd "$sandbox" || exit 1
    git add "website/i18n/en/docusaurus-plugin-content-docs/current/$_marcatore_area/$_marcatore_file"
    GIT_AUTHOR_DATE="2026-01-15 00:00:00 +0000" GIT_COMMITTER_DATE="2026-01-15 00:00:00 +0000" \
      git commit -q -m "traduzione: dichiarazione di equivalenza (sintetico)"
  )
  (cd "$sandbox" && bash scripts/verifica-divergenza-traduzioni.sh)
  uscita=$?
  rm -rf "$sandbox"
  return "$uscita"
}

# Prepara lo scenario 2 per intero (base + marcatore valido su commit2) e aggiunge un ULTERIORE
# commit che modifica ancora l'originale - sempre redazionale, sempre con lo stesso numero di
# sezioni - DOPO la revisione dichiarata. È il caso che conta secondo l'indicazione ricevuta: senza
# di esso il marcatore diventerebbe un modo per zittire il controllo per sempre, cioè peggio di ciò
# che sostituisce. Il risultato si esegue e si cattura una sola volta: le due funzioni sotto lo
# richiamano condividendo l'output catturato, invece di ricostruire due repository identici.
_esegui_scenario_marcatore_scaduto() {
  local sandbox rev_src

  sandbox=$(mktemp -d) || return 1
  rev_src=$(_prepara_sandbox_marcatore_base "$sandbox") || { rm -rf "$sandbox"; return 1; }
  {
    echo "# Synthetic test document (no real patient data)"
    echo
    echo "## Only section"
    echo "English text, version one."
    echo
    echo "<!--TRAD-VERIFICATA: $rev_src-->"
  } > "$sandbox/website/i18n/en/docusaurus-plugin-content-docs/current/$_marcatore_area/$_marcatore_file"
  (
    cd "$sandbox" || exit 1
    git add "website/i18n/en/docusaurus-plugin-content-docs/current/$_marcatore_area/$_marcatore_file"
    GIT_AUTHOR_DATE="2026-01-15 00:00:00 +0000" GIT_COMMITTER_DATE="2026-01-15 00:00:00 +0000" \
      git commit -q -m "traduzione: dichiarazione di equivalenza (sintetico)"
  )
  {
    echo "# Documento sintetico di collaudo (nessun dato reale di paziente)"
    echo
    echo "## Sezione unica"
    echo "Testo italiano, versione tre - altro refuso corretto DOPO la dichiarazione di equivalenza."
  } > "$sandbox/docs/$_marcatore_area/$_marcatore_file"
  (
    cd "$sandbox" || exit 1
    git add "docs/$_marcatore_area/$_marcatore_file"
    GIT_AUTHOR_DATE="2026-07-01 00:00:00 +0000" GIT_COMMITTER_DATE="2026-07-01 00:00:00 +0000" \
      git commit -q -m "originale: nuova modifica redazionale, dopo la dichiarazione (sintetico)"
  )
  (cd "$sandbox" && bash scripts/verifica-divergenza-traduzioni.sh) >"$sandbox/.uscita.txt" 2>&1
  printf '%s' "$?" > "$sandbox/.codice.txt"
  printf '%s' "$sandbox"
}

verifica_marcatore_scaduto_torna_divergenza() {
  local sandbox uscita
  set +e
  trap 'set -e' RETURN
  sandbox=$(_esegui_scenario_marcatore_scaduto) || return 1
  uscita=$(cat "$sandbox/.codice.txt")
  rm -rf "$sandbox"
  return "$uscita"
}

# Non basta che il controllo fallisca: deve fallire PERCHÉ la dichiarazione è scaduta, non per un
# motivo qualunque - altrimenti questo caso supererebbe anche una regressione che confondesse la
# scadenza con una divergenza strutturale o con una traduzione mancante. Stessa tecnica del
# Controllo 3: l'asserzione poggia sul testo dell'uscita, non sul solo codice.
verifica_marcatore_scaduto_lo_dice_nel_messaggio() {
  local sandbox testo
  set +e
  trap 'set -e' RETURN
  sandbox=$(_esegui_scenario_marcatore_scaduto) || return 1
  testo=$(cat "$sandbox/.uscita.txt")
  rm -rf "$sandbox"
  printf '%s' "$testo" | grep -qi 'dichiarazione scaduta'
}

# Scenario 4 - marcatore con un'impronta che nel repository non esiste (esadecimale sintetico,
# "abad…abad" ripetuto: riconoscibile a colpo d'occhio come segnaposto, non un'impronta reale).
# «git merge-base --is-ancestor» con una revisione ignota NON esce con successo: esce 128 e stampa
# su stderr «fatal: Not a valid commit name» (verificato eseguendo il comando isolato prima di
# scrivere questo caso, non presupposto). Lo script redirige quello stderr a /dev/null e tratta
# l'esito non-zero come "non coperta", quindi il fallimento è quello giusto - ma solo perché il
# codice del controllo interpreta correttamente QUALSIASI esito diverso da zero come dichiarazione
# non valida. Se un giorno il controllo cambiasse a "in caso di errore del comando, presumi
# coperta", questo caso lo direbbe.
verifica_marcatore_impronta_inesistente_fallisce_non_tace() {
  local sandbox uscita
  set +e
  trap 'set -e' RETURN
  sandbox=$(mktemp -d) || return 1
  _prepara_sandbox_marcatore_base "$sandbox" >/dev/null || { rm -rf "$sandbox"; return 1; }
  {
    echo "# Synthetic test document (no real patient data)"
    echo
    echo "## Only section"
    echo "English text, version one."
    echo
    echo "<!--TRAD-VERIFICATA: abadabadabadabadabadabadabadabadabadabad-->"
  } > "$sandbox/website/i18n/en/docusaurus-plugin-content-docs/current/$_marcatore_area/$_marcatore_file"
  (
    cd "$sandbox" || exit 1
    git add "website/i18n/en/docusaurus-plugin-content-docs/current/$_marcatore_area/$_marcatore_file"
    GIT_AUTHOR_DATE="2026-01-15 00:00:00 +0000" GIT_COMMITTER_DATE="2026-01-15 00:00:00 +0000" \
      git commit -q -m "traduzione: dichiarazione con impronta inesistente (sintetico)"
  )
  (cd "$sandbox" && bash scripts/verifica-divergenza-traduzioni.sh)
  uscita=$?
  rm -rf "$sandbox"
  return "$uscita"
}

esegui_caso "marcatore assente: originale cambiato dopo la traduzione resta una divergenza (comportamento storico conservato)" fallisce \
  verifica_marcatore_assente_resta_divergenza

esegui_caso "marcatore TRAD-VERIFICATA valido: cita la revisione corrente dell'originale, nessuna divergenza" passa \
  verifica_marcatore_valido_copre_revisione_corrente

esegui_caso "marcatore TRAD-VERIFICATA scaduto: l'originale è cambiato di nuovo dopo la revisione dichiarata, divergenza rilevata" fallisce \
  verifica_marcatore_scaduto_torna_divergenza

esegui_caso "marcatore TRAD-VERIFICATA scaduto: il messaggio dichiara esplicitamente la scadenza, non una divergenza generica" passa \
  verifica_marcatore_scaduto_lo_dice_nel_messaggio

esegui_caso "marcatore TRAD-VERIFICATA con impronta inesistente nel repository: fallisce, non passa in silenzio" fallisce \
  verifica_marcatore_impronta_inesistente_fallisce_non_tace

printf '\n== Controllo 7 - verifica-collocazione-dei-controlli.sh (T-03 criterio 4: la tabella che sorveglia gli altri controlli) ==\n\n'

# Il controllo collaudato qui sorveglia pipeline/collocazione-dei-controlli.tsv e accetta le
# variabili d'ambiente TABELLA e BANCO, quindi lo si punta su tenute statiche sotto
# scripts/prove/tenute/collocazione/ SENZA toccare la tabella reale - vietato dal perimetro di
# questo compito, ed è comunque la tabella che descrive gli altri controlli, non uno scenario da
# collaudo. BANCO punta a un banco FITTIZIO (banco-fittizio.txt): serve solo come bersaglio
# testuale della regola 4 («ogni caso citato deve esistere nel banco»), indipendente dal banco
# vero, così i casi sotto restano stabili anche se il banco vero cambia forma.
#
# Le descrizioni dei quattro casi che devono FALLIRE riprendono, verbatim, le stringhe con cui
# pipeline/collocazione-dei-controlli.tsv cita questo stesso controllo (riga T03-C4, colonna
# prova_negativa): «collocazione: segnalazione senza data», «collocazione: prova negativa vuota»,
# «collocazione: prova negativa che cita un caso inesistente», «collocazione: fascia non
# ammessa». La regola 4 del controllo collaudato pretende che ogni citazione in quella colonna
# compaia letteralmente qui: cambiare qui la formulazione senza cambiarla anche là farebbe
# fallire proprio il controllo che questi casi provano.
COLLOCAZIONE_TENUTE="$TENUTE/collocazione"
COLLOCAZIONE_BANCO_FITTIZIO="$COLLOCAZIONE_TENUTE/banco-fittizio.txt"
# Le corsie SINTETICHE per la regola 5. Senza CORSIE il controllo leggerebbe .github/workflows,
# e i casi qui sotto proverebbero lo stato delle corsie reali invece del comportamento del
# controllo: passerebbero o fallirebbero per ragioni che non sono le loro.
COLLOCAZIONE_CORSIE="$COLLOCAZIONE_TENUTE/corsie"

esegui_caso "collocazione: tabella valida, tutte le regole rispettate" passa \
  env CORSIE="$COLLOCAZIONE_CORSIE" TABELLA="$COLLOCAZIONE_TENUTE/tabella-valida.tsv" BANCO="$COLLOCAZIONE_BANCO_FITTIZIO" \
  "$RADICE_REPO/scripts/verifica-collocazione-dei-controlli.sh"

esegui_caso "collocazione: segnalazione senza data (regola 2 del README: una riduzione senza scadenza è una rinuncia non dichiarata)" fallisce \
  env CORSIE="$COLLOCAZIONE_CORSIE" TABELLA="$COLLOCAZIONE_TENUTE/tabella-segnalazione-senza-data.tsv" BANCO="$COLLOCAZIONE_BANCO_FITTIZIO" \
  "$RADICE_REPO/scripts/verifica-collocazione-dei-controlli.sh"

esegui_caso "collocazione: prova negativa vuota (regola 3 del README: un controllo che nessuno ha visto fallire non è un controllo)" fallisce \
  env CORSIE="$COLLOCAZIONE_CORSIE" TABELLA="$COLLOCAZIONE_TENUTE/tabella-prova-vuota.tsv" BANCO="$COLLOCAZIONE_BANCO_FITTIZIO" \
  "$RADICE_REPO/scripts/verifica-collocazione-dei-controlli.sh"

esegui_caso "collocazione: prova negativa che cita un caso inesistente (regola 4 del README)" fallisce \
  env CORSIE="$COLLOCAZIONE_CORSIE" TABELLA="$COLLOCAZIONE_TENUTE/tabella-prova-inesistente.tsv" BANCO="$COLLOCAZIONE_BANCO_FITTIZIO" \
  "$RADICE_REPO/scripts/verifica-collocazione-dei-controlli.sh"

esegui_caso "collocazione: fascia non ammessa (regola 1 del README: una fascia fuori dalle quattro dichiarate è quasi sempre un refuso)" fallisce \
  env CORSIE="$COLLOCAZIONE_CORSIE" TABELLA="$COLLOCAZIONE_TENUTE/tabella-fascia-non-ammessa.tsv" BANCO="$COLLOCAZIONE_BANCO_FITTIZIO" \
  "$RADICE_REPO/scripts/verifica-collocazione-dei-controlli.sh"

# Difetto già trovato e corretto (vedi il commento sopra a campo() nello script collaudato):
# «IFS=$'\t' read -r a b c …» tratta la tabulazione come lo spazio bianco predefinito di bash, che
# COLLASSA le occorrenze consecutive. Una tabulazione vuota fra due campi - la forma normale di
# ogni riga «bloccante», dove bloccante_dal è sempre vuota - sparisce, e tutti i campi successivi
# scalano di una posizione. Il controllo leggerebbe il campo sbagliato e direbbe il falso con
# sicurezza: esattamente il difetto che questo controllo esiste per impedire altrove.
#
# La riga sotto ha il campo 5 (bloccante_dal) vuoto, come ogni riga bloccante corretta: letta per
# POSIZIONE con «cut» (il codice attuale) è pienamente valida - la colonna 8 cita
# «caso sintetico di regressione lettura per posizione», presente nel banco fittizio - e il
# collaudo si aspetta PASSA. Se qualcuno reintroducesse «read» al posto di «cut», il campo 5 vuoto
# farebbe collassare la tabulazione: la colonna 8 letta sarebbe in realtà il testo della colonna 9
# (motivo_collocazione), che nel banco fittizio NON compare, facendo scattare a torto la regola 4.
# La prova di mutazione nel rapporto conferma che questa riga cambia esito fra le due letture.
esegui_caso "collocazione: riga bloccante con bloccante_dal vuota non fa collassare i campi successivi (regressione lettura per posizione vs. read)" passa \
  env CORSIE="$COLLOCAZIONE_CORSIE" TABELLA="$COLLOCAZIONE_TENUTE/tabella-regressione-lettura.tsv" BANCO="$COLLOCAZIONE_BANCO_FITTIZIO" \
  "$RADICE_REPO/scripts/verifica-collocazione-dei-controlli.sh"

# REGOLA 5 - la corsia dichiarata esegue davvero il controllo.
#
# Le prime quattro regole verificano che la riga sia BEN FORMATA; nessuna verificava che fosse
# VERA. La riga RD-C1 ha dichiarato per giorni «fascia completa, bloccante» mentre
# fascia-completa.yml non invocava il suo script, e il controllo restava verde. I casi sotto
# provano che ciascuna delle forme ammesse dalla colonna «eseguibile» viene davvero confrontata
# con la corsia, e che l'assenza si vede.
#
# OGGI è fissato sui due casi che dipendono dal calendario, per la stessa ragione dichiarata
# nella regola 3: un caso che passa oggi e fallisce fra un mese non è un caso, è una bomba a
# orologeria.

esegui_caso "collocazione: la corsia dichiarata non esegue lo script (regola 5: una collocazione dichiarata e non esistente)" fallisce \
  env CORSIE="$COLLOCAZIONE_CORSIE" TABELLA="$COLLOCAZIONE_TENUTE/tabella-corsia-non-esegue.tsv" BANCO="$COLLOCAZIONE_BANCO_FITTIZIO" \
  "$RADICE_REPO/scripts/verifica-collocazione-dei-controlli.sh"

esegui_caso "collocazione: la fascia dichiarata non ha alcun flusso (regola 5: una corsia che non esiste non esegue niente)" fallisce \
  env CORSIE="$COLLOCAZIONE_CORSIE" TABELLA="$COLLOCAZIONE_TENUTE/tabella-corsia-senza-flusso.tsv" BANCO="$COLLOCAZIONE_BANCO_FITTIZIO" \
  "$RADICE_REPO/scripts/verifica-collocazione-dei-controlli.sh"

esegui_caso "collocazione: il flusso esiste ma non ha il lavoro dichiarato (regola 5)" fallisce \
  env CORSIE="$COLLOCAZIONE_CORSIE" TABELLA="$COLLOCAZIONE_TENUTE/tabella-lavoro-inesistente.tsv" BANCO="$COLLOCAZIONE_BANCO_FITTIZIO" \
  "$RADICE_REPO/scripts/verifica-collocazione-dei-controlli.sh"

esegui_caso "collocazione: la fascia dichiarata non è quella in cui l'eseguibile vive (regola 5)" fallisce \
  env CORSIE="$COLLOCAZIONE_CORSIE" TABELLA="$COLLOCAZIONE_TENUTE/tabella-fascia-incoerente.tsv" BANCO="$COLLOCAZIONE_BANCO_FITTIZIO" \
  "$RADICE_REPO/scripts/verifica-collocazione-dei-controlli.sh"

esegui_caso "collocazione: bloccante ma «da collocare» (regola 5: chi blocca senza un luogo in cui girare non blocca nulla)" fallisce \
  env CORSIE="$COLLOCAZIONE_CORSIE" TABELLA="$COLLOCAZIONE_TENUTE/tabella-bloccante-da-collocare.tsv" BANCO="$COLLOCAZIONE_BANCO_FITTIZIO" \
  "$RADICE_REPO/scripts/verifica-collocazione-dei-controlli.sh"

esegui_caso "collocazione: «da collocare» oltre la data di esigibilità (regola 5)" fallisce \
  env OGGI=2026-08-26 CORSIE="$COLLOCAZIONE_CORSIE" TABELLA="$COLLOCAZIONE_TENUTE/tabella-da-collocare-scaduta.tsv" BANCO="$COLLOCAZIONE_BANCO_FITTIZIO" \
  "$RADICE_REPO/scripts/verifica-collocazione-dei-controlli.sh"

esegui_caso "collocazione: «da collocare» entro la data dichiarata è debito visibile, non un errore (regola 5)" passa \
  env OGGI=2026-08-26 CORSIE="$COLLOCAZIONE_CORSIE" TABELLA="$COLLOCAZIONE_TENUTE/tabella-da-collocare-in-corso.tsv" BANCO="$COLLOCAZIONE_BANCO_FITTIZIO" \
  "$RADICE_REPO/scripts/verifica-collocazione-dei-controlli.sh"

esegui_caso "collocazione: un controllo che vive in due luoghi con la prima metà nella corsia dichiarata (regola 5, forma «A + B» di G9)" passa \
  env CORSIE="$COLLOCAZIONE_CORSIE" TABELLA="$COLLOCAZIONE_TENUTE/tabella-due-luoghi.tsv" BANCO="$COLLOCAZIONE_BANCO_FITTIZIO" \
  "$RADICE_REPO/scripts/verifica-collocazione-dei-controlli.sh"

printf '\n== Controllo 8 - verifica-terminologie.sh (G3: contenuto di terminologie sotto licenza) ==\n\n'

# scripts/verifica-terminologie.sh non accetta variabili d'ambiente per puntare a una radice
# alternativa: fa "cd $(dirname "$0")/.." e poi grep -r "." dalla radice del proprio repository.
# Stessa tecnica dei Controlli 3-5: un repository sintetico e temporaneo, dentro cui si copia (senza
# modificarlo) il contenuto ATTUALE dello script, che grep esplora a partire dalla radice del
# sandbox - non serve "git init" qui, perché lo script non legge la cronologia.
#
# NESSUNA delle tenute sotto contiene contenuto reale di una terminologia sotto licenza: sono
# segnaposto strutturali che il controllo riconosce dalla FORMA (un numero lungo accanto alla
# parola "conceptId", l'intestazione tabellare del formato di rilascio, un comando che scarica da
# un dominio noto), non dati clinici o descrizioni concettuali reali. "000000000000" non è
# l'identificativo di alcun concetto: è dichiaratamente un segnaposto, tutto zeri.
_prepara_sandbox_terminologie() {
  local sandbox="$1"
  mkdir -p "$sandbox/scripts" "$sandbox/docs/prove-collaudo" "$sandbox/pipeline" || return 1
  cp "$RADICE_REPO/scripts/verifica-terminologie.sh" "$sandbox/scripts/" || return 1
  # Copia anche la lista di ammissione VERSIONATA e ATTUALE (Q-285): senza di questa i quattro
  # casi sotto eserciterebbero solo la riserva interna dello script, mai il percorso reale che
  # legge pipeline/lista-ammissione-terminologie.tsv - il difetto segnalato dal committente, non
  # una scelta di collaudo. Presa al momento dell'esecuzione, non incollata una volta per tutte,
  # per la stessa ragione delle sandbox dei Controlli 3-6 e 9.
  cp "$RADICE_REPO/pipeline/lista-ammissione-terminologie.tsv" "$sandbox/pipeline/" || return 1
}

# Variante che sostituisce la lista versionata con un contenuto scritto per il collaudo, invece di
# copiare quella reale: serve ai casi che collaudano la lettura stessa del file (intestazione,
# campi mancanti, modalita_grep sconosciuta, e la prova che il percorso legge davvero il file e
# non ricade sulla riserva).
_prepara_sandbox_terminologie_lista_custom() {
  local sandbox="$1" contenuto="$2"
  mkdir -p "$sandbox/scripts" "$sandbox/docs/prove-collaudo" "$sandbox/pipeline" || return 1
  cp "$RADICE_REPO/scripts/verifica-terminologie.sh" "$sandbox/scripts/" || return 1
  printf '%s' "$contenuto" > "$sandbox/pipeline/lista-ammissione-terminologie.tsv" || return 1
}

verifica_terminologie_sandbox_pulita_passa() {
  local sandbox uscita
  set +e
  trap 'set -e' RETURN
  sandbox=$(mktemp -d) || return 1
  _prepara_sandbox_terminologie "$sandbox" || { rm -rf "$sandbox"; return 1; }
  printf '# Documento sintetico di collaudo (nessun dato reale di paziente)\n\nNessun contenuto di terminologia qui.\n' \
    > "$sandbox/docs/prove-collaudo/pagina.md"
  (cd "$sandbox" && bash scripts/verifica-terminologie.sh)
  uscita=$?
  rm -rf "$sandbox"
  return "$uscita"
}

# Bersaglio 1 - identificatore di concetto SNOMED CT: la parola "conceptId" accanto a un numero
# lungo. "000000000000" è un segnaposto dichiarato (tutti zeri), non l'impronta di un concetto
# reale - il controllo è deliberatamente conservativo e reagisce alla FORMA, non alla validità.
verifica_terminologie_conceptid_fallisce() {
  local sandbox uscita
  set +e
  trap 'set -e' RETURN
  sandbox=$(mktemp -d) || return 1
  _prepara_sandbox_terminologie "$sandbox" || { rm -rf "$sandbox"; return 1; }
  printf '# Documento sintetico di collaudo (nessun dato reale di paziente)\n\nconceptId: 000000000000 (segnaposto sintetico, non un concetto reale)\n' \
    > "$sandbox/docs/prove-collaudo/pagina.md"
  (cd "$sandbox" && bash scripts/verifica-terminologie.sh)
  uscita=$?
  rm -rf "$sandbox"
  return "$uscita"
}

# Bersaglio 2 - intestazione del formato di rilascio tabellare (RF2): riga "id  effectiveTime
# active …". Nessuna riga di dati sotto: la sola intestazione, che è già ciò che il controllo
# cerca, con colonne di segnaposto sintetiche.
verifica_terminologie_intestazione_rilascio_fallisce() {
  local sandbox uscita
  set +e
  trap 'set -e' RETURN
  sandbox=$(mktemp -d) || return 1
  _prepara_sandbox_terminologie "$sandbox" || { rm -rf "$sandbox"; return 1; }
  printf 'id\teffectiveTime\tactive\tmoduleId\tsintetico\n' \
    > "$sandbox/docs/prove-collaudo/formato-rilascio.csv"
  (cd "$sandbox" && bash scripts/verifica-terminologie.sh)
  uscita=$?
  rm -rf "$sandbox"
  return "$uscita"
}

# Bersaglio 3 - scaricamento automatico. Il comando qui non viene MAI eseguito: serve solo a
# provare che il riconoscitore testuale lo intercetta prima che qualcuno possa eseguirlo davvero.
verifica_terminologie_scaricamento_fallisce() {
  local sandbox uscita
  set +e
  trap 'set -e' RETURN
  sandbox=$(mktemp -d) || return 1
  _prepara_sandbox_terminologie "$sandbox" || { rm -rf "$sandbox"; return 1; }
  # Il comando si COMPONE per frammenti e non compare mai per intero in questo file. Scritto per
  # intero, il riconoscitore G3-3 - «(curl|wget|fetch) entro 200 caratteri da un dominio di
  # terminologie» - lo troverebbe in questo stesso banco, e verifica-terminologie.sh fallirebbe
  # sul repository vero a causa della propria tenuta di collaudo. La tenuta scritta nella sandbox
  # contiene invece il comando INTERO, che e' l'unica cosa che il caso deve provare. E' la stessa
  # disciplina della regola R0 applicata a un riconoscitore testuale: si scrive il complemento,
  # mai la forma sorvegliata.
  local verbo host
  verbo='cur''l'
  host='uts.nlm.nih''.gov'
  printf '#!/usr/bin/env bash\n# Script sintetico di collaudo: MAI eseguito, serve solo a provare il riconoscimento testuale.\n%s -o pacchetto.zip https://%s/download/sintetico\n' \
    "$verbo" "$host" > "$sandbox/docs/prove-collaudo/scaricamento-fittizio.sh"
  (cd "$sandbox" && bash scripts/verifica-terminologie.sh)
  uscita=$?
  rm -rf "$sandbox"
  return "$uscita"
}

esegui_caso "terminologie: sandbox pulita, nessun contenuto sospetto" passa \
  verifica_terminologie_sandbox_pulita_passa

esegui_caso "terminologie: identificatore SNOMED CT sintetico (conceptId + numero lungo)" fallisce \
  verifica_terminologie_conceptid_fallisce

esegui_caso "terminologie: intestazione del formato di rilascio tabellare (id/effectiveTime/active)" fallisce \
  verifica_terminologie_intestazione_rilascio_fallisce

esegui_caso "terminologie: comando di scaricamento automatico verso un dominio di terminologie sotto licenza" fallisce \
  verifica_terminologie_scaricamento_fallisce

# --- Q-285: la lista di ammissione vive ora in pipeline/lista-ammissione-terminologie.tsv, non
# piu' solo dentro lo script. I quattro casi sotto collaudano la LETTURA di quel file: tre forme
# malformate (intestazione, campo obbligatorio mancante, modalita_grep sconosciuta) e - il piu'
# importante - la prova che il percorso legge DAVVERO il file versionato e non ricade in
# silenzio sulla riserva interna.

TERMINOLOGIE_INTESTAZIONE=$'id\tsistema\tprofondita_riconoscimento\tforma_ammessa\tpattern_ere\tmodalita_grep\testensioni\ttitolo_rilievo\tmotivo'

verifica_terminologie_lista_campo_mancante_fallisce() {
  local sandbox uscita
  set +e
  trap 'set -e' RETURN
  sandbox=$(mktemp -d) || return 1
  # pattern_ere (colonna 5) vuoto: la riga ha tutte le altre colonne valorizzate, quindi il
  # collaudo prova specificamente il campo mancante dichiarato dal nome del caso, non un'altra
  # colonna vuota per caso.
  local lista="$TERMINOLOGIE_INTESTAZIONE
G3-TEST	Sistema di collaudo	identificatore	Forma ammessa di collaudo, nessun contenuto reale.		righe		Rilievo di collaudo	Motivo di collaudo."
  _prepara_sandbox_terminologie_lista_custom "$sandbox" "$lista" || { rm -rf "$sandbox"; return 1; }
  printf '# Documento sintetico di collaudo (nessun dato reale di paziente)\n' \
    > "$sandbox/docs/prove-collaudo/pagina.md"
  (cd "$sandbox" && bash scripts/verifica-terminologie.sh)
  uscita=$?
  rm -rf "$sandbox"
  return "$uscita"
}

verifica_terminologie_lista_modalita_sconosciuta_fallisce() {
  local sandbox uscita
  set +e
  trap 'set -e' RETURN
  sandbox=$(mktemp -d) || return 1
  # Il pattern richiede cifre dopo il trattino apposta: la lista stessa vive dentro la sandbox
  # sotto pipeline/ ed e' quindi parte dell'albero che grep scandisce - un pattern che comparisse
  # come testo letterale nella propria riga (senza le cifre richieste dal quantificatore)
  # combacerebbe con se stesso, mascherando qualunque mutazione di questo controllo.
  local lista="$TERMINOLOGIE_INTESTAZIONE
G3-TEST	Sistema di collaudo	identificatore	Forma ammessa di collaudo, nessun contenuto reale.	sintetico-collaudo-[0-9]{5}	modalita-inventata		Rilievo di collaudo	Motivo di collaudo."
  _prepara_sandbox_terminologie_lista_custom "$sandbox" "$lista" || { rm -rf "$sandbox"; return 1; }
  printf '# Documento sintetico di collaudo (nessun dato reale di paziente)\n' \
    > "$sandbox/docs/prove-collaudo/pagina.md"
  (cd "$sandbox" && bash scripts/verifica-terminologie.sh)
  uscita=$?
  rm -rf "$sandbox"
  return "$uscita"
}

verifica_terminologie_lista_intestazione_inattesa_fallisce() {
  local sandbox uscita
  set +e
  trap 'set -e' RETURN
  sandbox=$(mktemp -d) || return 1
  # Prima colonna della prima riga non-commento "identificativo" invece di "id": il controllo
  # legge il campo 1 della prima riga utile e pretende esattamente "id".
  local lista=$'identificativo\tsistema\tprofondita_riconoscimento\tforma_ammessa\tpattern_ere\tmodalita_grep\testensioni\ttitolo_rilievo\tmotivo'
  _prepara_sandbox_terminologie_lista_custom "$sandbox" "$lista" || { rm -rf "$sandbox"; return 1; }
  printf '# Documento sintetico di collaudo (nessun dato reale di paziente)\n' \
    > "$sandbox/docs/prove-collaudo/pagina.md"
  (cd "$sandbox" && bash scripts/verifica-terminologie.sh)
  uscita=$?
  rm -rf "$sandbox"
  return "$uscita"
}

# Il caso che conta piu' degli altri: dimostra che il controllo legge il file VERSIONATO, non la
# riserva interna. La lista di collaudo qui contiene SOLO il riconoscitore G3-1 (identificatore
# SNOMED CT), deliberatamente PRIVA di G3-2 (intestazione del formato di rilascio tabellare). Il
# documento della sandbox contiene l'intestazione RF2 che farebbe scattare G3-2. Se il controllo
# legge davvero il file versionato di questa sandbox, G3-2 non c'e' e il documento non viene
# segnalato: la prova PASSA. Se invece il controllo ricadesse (a torto) sulla riserva interna -
# che porta tutti e tre i riconoscitori storici, G3-2 compreso - l'intestazione RF2 verrebbe
# segnalata e la prova fallirebbe: e' esattamente cosi' che il caso "puo' fallire se qualcuno lo
# rompe", come richiesto.
verifica_terminologie_lista_letta_da_file_passa() {
  local sandbox uscita
  set +e
  trap 'set -e' RETURN
  sandbox=$(mktemp -d) || return 1
  local lista="$TERMINOLOGIE_INTESTAZIONE
G3-1	SNOMED CT	identificatore	Il nome del sistema resta ammesso; non e' ammesso alcun identificativo di concetto reale abbinato a un numero.	\\\\b(conceptId|SCTID|sctid)\\\\b[^A-Za-z0-9]{0,4}[0-9]{6,18}	righe	*.md,*.json,*.java,*.ts,*.sql,*.csv,*.txt	Possibile contenuto SNOMED CT nel repository.	Motivo di collaudo, identico nella forma a G3-1 reale."
  _prepara_sandbox_terminologie_lista_custom "$sandbox" "$lista" || { rm -rf "$sandbox"; return 1; }
  printf 'id\teffectiveTime\tactive\tmoduleId\tsintetico\n' \
    > "$sandbox/docs/prove-collaudo/formato-rilascio.csv"
  (cd "$sandbox" && bash scripts/verifica-terminologie.sh)
  uscita=$?
  rm -rf "$sandbox"
  return "$uscita"
}

esegui_caso "terminologie: lista di ammissione con campo pattern_ere o modalita_grep mancante" fallisce \
  verifica_terminologie_lista_campo_mancante_fallisce

esegui_caso "terminologie: lista di ammissione con modalita_grep sconosciuta" fallisce \
  verifica_terminologie_lista_modalita_sconosciuta_fallisce

esegui_caso "terminologie: lista di ammissione con intestazione inattesa" fallisce \
  verifica_terminologie_lista_intestazione_inattesa_fallisce

esegui_caso "terminologie: riconoscitore letto dal file versionato e non dalla riserva" passa \
  verifica_terminologie_lista_letta_da_file_passa

# --- Il difetto chiuso: lo script manteneva una copia di riserva dei tre riconoscitori e vi
# ricadeva in silenzio quando la lista di ammissione mancava. La regola viveva così in due posti
# e poteva divergere senza che nessuno se ne accorgesse. Il caso sotto prova che la riserva non
# c'è più: con pipeline/lista-ammissione-terminologie.tsv ASSENTE (non scritta vuota: la sandbox
# non la crea affatto), il controllo non deve girare a vuoto né passare - deve fallire con uscita
# 2, la convenzione di questo repository per «il controllo non può nemmeno partire» (la stessa di
# verifica-registro-componenti.sh con il registro inesistente e di verifica-dati-sintetici.sh con
# la radice inesistente).

# La sandbox copia SOLO lo script, senza alcuna cartella pipeline/: è il caso previsto - un
# ambiente di collaudo isolato che non porta con sé l'intero repository.
_prepara_sandbox_terminologie_lista_assente() {
  local sandbox="$1"
  mkdir -p "$sandbox/scripts" || return 1
  cp "$RADICE_REPO/scripts/verifica-terminologie.sh" "$sandbox/scripts/" || return 1
}

# Segue D-8 (RUNBOOK-ERRORI-E-TRAPPOLE.md): un'asserzione sul solo codice di uscita non
# distingue un fallimento corretto (exit 2, dichiarato) da un crash bash accidentale (che sotto
# «set -euo pipefail» esce anch'esso diverso da zero). Questa prova asserisce perciò ESPLICITAMENTE
# sia sul codice di uscita - deve essere ESATTAMENTE 2, non un valore qualunque diverso da zero -
# sia sul testo del messaggio su standard error. Restituisce 0 (assertito FALSO: il banco segnerà
# la prova come non superata) se una delle due condizioni non regge, e propaga l'uscita reale dello
# script (2, coerente con l'esito atteso «fallisce» e riconoscibile nel rapporto del banco) solo
# quando entrambe reggono insieme.
verifica_terminologie_lista_assente_fallisce_con_uscita_2() {
  local sandbox uscita testo
  set +e
  trap 'set -e' RETURN
  sandbox=$(mktemp -d) || return 1
  _prepara_sandbox_terminologie_lista_assente "$sandbox" || { rm -rf "$sandbox"; return 1; }
  testo=$(cd "$sandbox" && bash scripts/verifica-terminologie.sh 2>&1)
  uscita=$?
  rm -rf "$sandbox"

  if [ "$uscita" -ne 2 ]; then
    printf 'atteso codice di uscita 2, ottenuto %d. Uscita completa:\n%s\n' "$uscita" "$testo" >&2
    return 0
  fi
  if ! printf '%s' "$testo" | grep -qi 'lista di ammissione'; then
    printf 'atteso un messaggio riconoscibile su "lista di ammissione", assente. Uscita completa:\n%s\n' "$testo" >&2
    return 0
  fi
  return "$uscita"
}

esegui_caso "terminologie: lista di ammissione assente (nessuna riserva)" fallisce \
  verifica_terminologie_lista_assente_fallisce_con_uscita_2

printf '\n== Controllo 9 - verifica-conformita-redazionale.sh (T01-C8: frontmatter e rinvii relativi) ==\n\n'

# Lo script collaudato promette tre cose nel suo commento di testa, ma implementa solo DUE
# controlli che corrispondono a T01-C8 come descritto in pipeline/collocazione-dei-controlli.tsv
# («formule di conformità vietate, rinvii relativi che escono da docs/, frontmatter»):
#   1. frontmatter YAML non quotato con due punti seguiti da spazio (la trappola in CLAUDE.md);
#   2. rinvii relativi che escono da docs/ (l'altra trappola in CLAUDE.md).
# Il TERZO controllo presente nello script (segnaposto di segreti) non è ciò che T01-C8 descrive:
# è una ricerca di segreti in chiaro, competenza già dichiarata di G1. NESSUN controllo, in questo
# script, cerca le «formule di conformità vietate» elencate in
# docs/04_protocols/10-conformita-e-prove.md §2 (es. «Conforme alla guida italiana» senza versione,
# «Prodotto marcato», «Certificato» su una revisione in commento pubblico…): quella tabella non ha
# un controllo automatico che la sorvegli. Non scrivo un collaudo per un controllo che non esiste:
# è debito da segnalare, non da simulare - vedi il rapporto.
#
# Come per G3, niente variabili d'ambiente: sandbox temporanea con il contenuto ATTUALE dello
# script, esplorata da grep a partire dalla propria radice.
_prepara_sandbox_redazionale() {
  local sandbox="$1"
  mkdir -p "$sandbox/scripts" "$sandbox/docs/prove-collaudo" || return 1
  cp "$RADICE_REPO/scripts/verifica-conformita-redazionale.sh" "$sandbox/scripts/" || return 1
}

verifica_redazionale_sandbox_pulita_passa() {
  local sandbox uscita
  set +e
  trap 'set -e' RETURN
  sandbox=$(mktemp -d) || return 1
  _prepara_sandbox_redazionale "$sandbox" || { rm -rf "$sandbox"; return 1; }
  cat > "$sandbox/docs/prove-collaudo/pagina.md" <<'EOF'
---
title: "Pagina sintetica di collaudo"
description: "Metriche: come si leggono"
---

# Pagina sintetica di collaudo (nessun dato reale di paziente)

Rinvio corretto: [vedi CONTRIBUTING](https://github.com/fedcal/Telemedic/blob/main/CONTRIBUTING.md).
EOF
  (cd "$sandbox" && bash scripts/verifica-conformita-redazionale.sh)
  uscita=$?
  rm -rf "$sandbox"
  return "$uscita"
}

# Frappola già incontrata su questo sito (vedi CLAUDE.md): un valore di frontmatter con due punti
# seguiti da spazio, non racchiuso fra virgolette, fa fallire la costruzione del sito con un errore
# che parla di indentazione e non ne ha nulla a che vedere.
verifica_redazionale_frontmatter_non_quotato_fallisce() {
  local sandbox uscita
  set +e
  trap 'set -e' RETURN
  sandbox=$(mktemp -d) || return 1
  _prepara_sandbox_redazionale "$sandbox" || { rm -rf "$sandbox"; return 1; }
  cat > "$sandbox/docs/prove-collaudo/pagina.md" <<'EOF'
---
title: "Pagina sintetica di collaudo"
description: Metriche: come si leggono
---

# Pagina sintetica di collaudo (nessun dato reale di paziente)
EOF
  (cd "$sandbox" && bash scripts/verifica-conformita-redazionale.sh)
  uscita=$?
  rm -rf "$sandbox"
  return "$uscita"
}

# Seconda trappola già incontrata (vedi CLAUDE.md): un rinvio relativo che esce da docs/ funziona
# su GitHub ma produce un 404 silenzioso sul sito pubblicato.
verifica_redazionale_rinvio_relativo_fuori_docs_fallisce() {
  local sandbox uscita
  set +e
  trap 'set -e' RETURN
  sandbox=$(mktemp -d) || return 1
  _prepara_sandbox_redazionale "$sandbox" || { rm -rf "$sandbox"; return 1; }
  cat > "$sandbox/docs/prove-collaudo/pagina.md" <<'EOF'
---
title: "Pagina sintetica di collaudo"
---

# Pagina sintetica di collaudo (nessun dato reale di paziente)

Rinvio scorretto: [vedi CONTRIBUTING](../../CONTRIBUTING.md).
EOF
  (cd "$sandbox" && bash scripts/verifica-conformita-redazionale.sh)
  uscita=$?
  rm -rf "$sandbox"
  return "$uscita"
}

esegui_caso "conformità redazionale: sandbox pulita, frontmatter quotato e rinvio assoluto" passa \
  verifica_redazionale_sandbox_pulita_passa

esegui_caso "conformità redazionale: frontmatter con valore non quotato contenente due punti e spazio" fallisce \
  verifica_redazionale_frontmatter_non_quotato_fallisce

esegui_caso "conformità redazionale: rinvio relativo che esce dalla cartella docs/" fallisce \
  verifica_redazionale_rinvio_relativo_fuori_docs_fallisce

printf '\n== Controllo 10 - verifica-dati-sintetici.sh (G10, criterio 2 di T-03) ==\n\n'

# Il controllo collaudato qui accetta la variabile d'ambiente RADICE_SORGENTI (stessa convenzione
# di scripts/verifica-dichiarazione-non-marcatura.sh), quindi lo si punta su tenute statiche sotto
# scripts/prove/tenute/dati/ senza toccare il corpus reale - vietato dal perimetro di questo
# compito. Ciascuna tenuta contiene UNA forma, generata calcolandone la cifra di controllo (mai
# scritta a mano): il DM 23 dicembre 1976 per il codice fiscale, Luhn (ISO/IEC 7812) per la
# tessera sanitaria, Luhn a undici cifre per la partita IVA, ISO 7064 mod 97-10 per l'IBAN. Nessuna
# delle quattro può corrispondere a un identificativo realmente assegnato: il codice fiscale usa il
# giorno di nascita impossibile «00», tessera/partita IVA/IBAN hanno corpo di soli zeri. La cifra
# di controllo è comunque corretta, ed è quella correttezza - non il valore del corpo - a far
# scattare il controllo, come lo script collaudato dichiara in testa a se stesso.
DATI_SINTETICI_TENUTE="$TENUTE/dati"
SCRIPT_DATI_SINTETICI="$RADICE_REPO/scripts/verifica-dati-sintetici.sh"

esegui_caso "codice fiscale con carattere di controllo corretto" fallisce \
  env RADICE_SORGENTI="$DATI_SINTETICI_TENUTE/cf-valido" "$SCRIPT_DATI_SINTETICI"
esegui_caso "tessera sanitaria con cifra Luhn corretta" fallisce \
  env RADICE_SORGENTI="$DATI_SINTETICI_TENUTE/ts-valido" "$SCRIPT_DATI_SINTETICI"
esegui_caso "partita IVA con cifra di controllo corretta in riga ancorata" fallisce \
  env RADICE_SORGENTI="$DATI_SINTETICI_TENUTE/piva-valida" "$SCRIPT_DATI_SINTETICI"
esegui_caso "IBAN con resto mod 97-10 corretto" fallisce \
  env RADICE_SORGENTI="$DATI_SINTETICI_TENUTE/iban-valido" "$SCRIPT_DATI_SINTETICI"
esegui_caso "numero mobile italiano in contesto di recapito" fallisce \
  env RADICE_SORGENTI="$DATI_SINTETICI_TENUTE/telefono-reale" "$SCRIPT_DATI_SINTETICI"
esegui_caso "casella su dominio di posta al consumo" fallisce \
  env RADICE_SORGENTI="$DATI_SINTETICI_TENUTE/posta-al-consumo" "$SCRIPT_DATI_SINTETICI"
esegui_caso "dominio reale in una fixture di esempio" fallisce \
  env RADICE_SORGENTI="$DATI_SINTETICI_TENUTE/posta-dominio-reale" "$SCRIPT_DATI_SINTETICI"

esegui_caso "dati palesemente sintetici: deve passare" passa \
  env RADICE_SORGENTI="$DATI_SINTETICI_TENUTE/sintetica" "$SCRIPT_DATI_SINTETICI"
esegui_caso "recapito ammesso con marcatore dichiarato: deve passare" passa \
  env RADICE_SORGENTI="$DATI_SINTETICI_TENUTE/ammissione-dichiarata" "$SCRIPT_DATI_SINTETICI"

printf '\n== Controllo 11 - verifica-ancore.sh (rinvii con ancora, entrambe le lingue) ==\n\n'

# Il controllo collaudato qui accetta RADICE_SORGENTI (stessa convenzione di G10) e si aspetta di
# trovare sotto la radice sia docs/ sia website/i18n/en/docusaurus-plugin-content-docs/current/:
# se uno dei due manca lo dichiara ("albero assente, saltato") e prosegue sull'altro, senza farlo
# fallire - verificato a mano puntando RADICE_SORGENTI su una tenuta con solo docs/. Le cinque
# tenute sotto hanno perciò solo l'albero italiano: è sufficiente, perché l'algoritmo dell'ancora
# è lo stesso nelle due lingue e le tenute duplicate non aggiungerebbero collaudo, solo rumore.
#
# Il committente ha imposto il trattino corto ovunque nel progetto (16.311 occorrenze convertite):
# un titolo come «### CTX-01 - Identity and access» ha ora un trattino corto fra due spazi, non
# piu' un trattino lungo. Con l'algoritmo di github-slugger l'ancora e' «ctx-01---identity-and-
# access», con TRE trattini: il trattino corto e' un carattere ammesso e resta, i due spazi che lo
# affiancano diventano due trattini in piu'. E' il caso "trattino corto fra spazi" sotto, ed e' il
# piu' importante dei cinque: chi scrive l'ancora a mano mette di regola un solo trattino, e
# sbaglia di due. Verificato empiricamente contro il pacchetto github-slugger installato in
# website/node_modules: stessa uscita, tre trattini.
#
# Il vecchio caso (titolo con trattino LUNGO, due trattini nell'ancora) resta come tenuta separata
# "trattino lungo residuo", perché un trattino lungo puo' rientrare da un incollaggio esterno
# (un editor che lo sostituisce automaticamente) anche dopo la conversione: e' il difetto che ha
# gia' rotto undici ancore inglesi senza che la costruzione (onBrokenAnchors: warn) se ne
# accorgesse, e tenerlo distinto non indebolisce il collaudo del caso nuovo, lo aggiunge.
#
# I due casi non sono equivalenti neppure nel modo in cui falliscono: il suggerimento "forse
# «...»" dello script collaudato normalizza un SOLO livello di raddoppio (.replace('--', '-'),
# una sola passata) e riconosce quindi il caso a due trattini (--) ma non quello a tre (---) - il
# caso "trattino corto fra spazi" fallisce senza alcun suggerimento. Non e' un difetto di questo
# collaudo: e' un limite dello script collaudato, osservato qui e riferito al committente.
DATI_ANCORE_TENUTE="$TENUTE/ancore"
SCRIPT_ANCORE="$RADICE_REPO/scripts/verifica-ancore.sh"

esegui_caso "ancore: trattino corto fra spazi, il titolo genera tre trattini" fallisce \
  env RADICE_SORGENTI="$DATI_ANCORE_TENUTE/trattino-corto-tre-trattini" "$SCRIPT_ANCORE"
esegui_caso "ancore: trattino lungo residuo, il titolo genera due trattini" fallisce \
  env RADICE_SORGENTI="$DATI_ANCORE_TENUTE/trattino-lungo-residuo" "$SCRIPT_ANCORE"
# Nota di collaudo che vale accanto a questo caso: la mutazione che subordina la
# segnalazione alla presenza di un "vicino" (vedi rapporto) fa cadere INSIEME questo caso
# e "trattino corto fra spazi", perche' nessuno dei due ha un vicino sotto lo script reale.
# Non e' un difetto delle tenute: e' un fatto sulla forma del codice (un solo "if" copre
# entrambi), e va scritto qui, non nascosto ritoccando le tenute finche' il numero torna.
esegui_caso "ancore: rinvio a un titolo che non esiste nel bersaglio" fallisce \
  env RADICE_SORGENTI="$DATI_ANCORE_TENUTE/titolo-inesistente" "$SCRIPT_ANCORE"
esegui_caso "ancore: documento bersaglio inesistente" fallisce \
  env RADICE_SORGENTI="$DATI_ANCORE_TENUTE/bersaglio-inesistente" "$SCRIPT_ANCORE"

# I due casi sotto collaudano le forme di rinvio scoperte fino a poco fa: la regex accettava
# solo "./file.md" e "../area/file.md", perdendo in silenzio la forma nuda ("file.md#ancora",
# il difetto che ha tenuto nascoste diciotto ancore rotte su centodue) e la forma assoluta
# dalla radice della documentazione ("/area/file.md#ancora", introdotta il 26 agosto 2026 per
# i documenti tradotti, dove Docusaurus non risolve i rinvii relativi). Per la forma assoluta
# la tenuta usa due cartelle diverse (area-a per il sorgente, area-b per il bersaglio) apposta:
# se la risoluzione usasse per errore la cartella del sorgente invece della radice dell'albero,
# il controllo segnalerebbe "documento bersaglio non esiste" invece di "nessun titolo genera
# l'ancora" - il messaggio osservato in collaudo e' il secondo, prova che la base e' giusta.
esegui_caso "ancore: rinvio relativo nudo senza il punto iniziale" fallisce \
  env RADICE_SORGENTI="$DATI_ANCORE_TENUTE/rinvio-nudo" "$SCRIPT_ANCORE"
esegui_caso "ancore: rinvio assoluto dalla radice della documentazione" fallisce \
  env RADICE_SORGENTI="$DATI_ANCORE_TENUTE/rinvio-assoluto" "$SCRIPT_ANCORE"

esegui_caso "ancore: corpus con ancore tutte corrette (deve passare)" passa \
  env RADICE_SORGENTI="$DATI_ANCORE_TENUTE/valida" "$SCRIPT_ANCORE"

printf '\n== Controllo 12 - verifica-registro-componenti.sh (G2 licenze, G5 distinta dei materiali) ==\n\n'

# Il controllo collaudato qui accetta due variabili d'ambiente: RADICE_SORGENTI (per il registro,
# in pipeline/annotazioni-componenti.tsv sotto la radice indicata - stessa convenzione di G10 e
# del controllo sulle ancore) e SBOM_FILE (per la distinta CycloneDX, percorso NON prefissato da
# RADICE_SORGENTI: va quindi passato assoluto, come qui, altrimenti verrebbe cercato relativo alla
# radice del repository dopo il "cd" interno dello script).
#
# NESSUNA distinta e' generata da npm/npx qui: sono tutte scritte a mano, minime ma valide per
# CycloneDX 1.5. Nessun componente citato e' reale ne' corrisponde a un pacchetto realmente
# installato: i nomi sono dichiaratamente sintetici ("pacchetto-sintetico-collaudo" e varianti),
# a differenza della proposta iniziale che suggeriva di riusare componenti reali del progetto
# (react@18.3.1 e simili) - riusarli avrebbe legato le tenute alle versioni correnti di
# package.json, rompendole a ogni aggiornamento di dipendenza senza che il difetto fosse nello
# script collaudato.
#
# Trovato durante la costruzione delle tenute, e non coperto dai quattro casi sotto perche' fuori
# perimetro (lo script non e' mio): la query jq dello script itera «.licenses[]?» per ogni
# componente. Un componente con PIU' di una licenza in distinta genera una riga per ciascuna,
# quindi il ciclo bash lo controlla piu' volte e, se e' un rilievo, lo segnala piu' volte con lo
# stesso identico messaggio - rumore diagnostico, non un falso negativo: l'esito finale (fallisce)
# resta corretto. Verificato con jq isolato, non con questo banco.
REGISTRO_COMPONENTI_TENUTE="$TENUTE/registro-componenti"
SCRIPT_REGISTRO_COMPONENTI="$RADICE_REPO/scripts/verifica-registro-componenti.sh"

# I DUE CASI SEGUENTI ESISTONO PERCHE' IL BANCO AVEVA COLLAUDATO IL CONTROLLO CONTRO UNA
# FINZIONE FATTA A SUA IMMAGINE. Le tenute erano scritte nella forma che il controllo si
# aspettava - «license.name», nessun «group» - invece che nella forma che il generatore
# CycloneDX produce davvero. Sulla distinta vera il controllo leggeva «core» al posto di
# «@docusaurus/core» per tutti i 412 componenti con spazio dei nomi, e leggeva «NOLICENSE» per
# TUTTI E 1236: non aveva mai confrontato una licenza in vita sua. Il banco passava lo stesso.
# Una tenuta si modella sulla REALTA' che il controllo incontrera', mai sul codice del controllo.

esegui_caso "registro componenti: lo spazio dei nomi npm non si perde (group + name)" passa \
  env RADICE_SORGENTI="$REGISTRO_COMPONENTI_TENUTE/spazio-dei-nomi" \
      SBOM_FILE="$REGISTRO_COMPONENTI_TENUTE/spazio-dei-nomi/sbom.json" \
  "$SCRIPT_REGISTRO_COMPONENTI"

# Fino al 26 agosto 2026 la licenza letta dalla distinta veniva estratta e BUTTATA VIA: il
# controllo si fidava della colonna «compatibilita» senza mai guardare la licenza su cui quel
# giudizio poggia. Il registro poteva dichiarare «MIT, compatibile» per un componente che
# spedisce GPL-3.0. Questa tenuta ha la distinta che dice MIT e il registro che dice Apache-2.0.
esegui_caso "registro componenti: il registro dichiara una licenza diversa da quella del componente" fallisce \
  env RADICE_SORGENTI="$REGISTRO_COMPONENTI_TENUTE/licenza-divergente" \
      SBOM_FILE="$REGISTRO_COMPONENTI_TENUTE/licenza-divergente/sbom.json" \
  "$SCRIPT_REGISTRO_COMPONENTI"

esegui_caso "registro componenti: licenza in forma di espressione composta, non di identificativo" passa \
  env RADICE_SORGENTI="$REGISTRO_COMPONENTI_TENUTE/licenza-in-espressione" \
      SBOM_FILE="$REGISTRO_COMPONENTI_TENUTE/licenza-in-espressione/sbom.json" \
  "$SCRIPT_REGISTRO_COMPONENTI"

esegui_caso "registro componenti: componente nella distinta non annotato" fallisce \
  env RADICE_SORGENTI="$REGISTRO_COMPONENTI_TENUTE/componente-non-annotato" \
      SBOM_FILE="$REGISTRO_COMPONENTI_TENUTE/componente-non-annotato/sbom.json" \
  "$SCRIPT_REGISTRO_COMPONENTI"
# Nota di collaudo che vale accanto ai due casi sotto: indeterminabile e incompatibile sono
# strutturalmente la stessa riga di codice nello script collaudato (un solo
# "if [ \"$compatibilita\" != \"compatibile\" ]"), quindi una mutazione che disattiva quel
# controllo li fa cadere INSIEME, mai uno alla volta. Non e' un difetto delle tenute: e' un
# fatto sulla forma del codice, e va scritto qui invece di essere nascosto.
esegui_caso "registro componenti: licenza indeterminabile nel registro" fallisce \
  env RADICE_SORGENTI="$REGISTRO_COMPONENTI_TENUTE/licenza-indeterminabile" \
      SBOM_FILE="$REGISTRO_COMPONENTI_TENUTE/licenza-indeterminabile/sbom.json" \
  "$SCRIPT_REGISTRO_COMPONENTI"
esegui_caso "registro componenti: licenza incompatibile nel registro" fallisce \
  env RADICE_SORGENTI="$REGISTRO_COMPONENTI_TENUTE/licenza-incompatibile" \
      SBOM_FILE="$REGISTRO_COMPONENTI_TENUTE/licenza-incompatibile/sbom.json" \
  "$SCRIPT_REGISTRO_COMPONENTI"

# Ramo nuovo (compatibilita' annotata ma vuota): una casella vuota non e' una dichiarazione,
# e senza questo caso il fallback ":-" appena aggiunto allo script - quello che impedisce il
# crash sotto "set -u" segnalato nel rapporto precedente - non sarebbe mai stato esercitato.
esegui_caso "registro componenti: annotazione con compatibilità vuota" fallisce \
  env RADICE_SORGENTI="$REGISTRO_COMPONENTI_TENUTE/annotazione-compatibilita-vuota" \
      SBOM_FILE="$REGISTRO_COMPONENTI_TENUTE/annotazione-compatibilita-vuota/sbom.json" \
  "$SCRIPT_REGISTRO_COMPONENTI"

esegui_caso "registro componenti: tutti i componenti annotati e compatibili" passa \
  env RADICE_SORGENTI="$REGISTRO_COMPONENTI_TENUTE/tutti-compatibili" \
      SBOM_FILE="$REGISTRO_COMPONENTI_TENUTE/tutti-compatibili/sbom.json" \
  "$SCRIPT_REGISTRO_COMPONENTI"

printf '\n== Controllo 12bis - verifica-divergenza-traduzioni.sh (area adr: decision records tradotti) ==\n\n'

# Estensione della verifica di divergenza per includere l'area adr fra le aree esigite. Un file
# italiano in docs/adr/ deve avere il suo gemello in website/i18n/en/docusaurus-plugin-content-docs/current/adr/.
# Questo caso usa la stessa tecnica di sandboxing dei Controlli 3-6.
_prepara_sandbox_adr_divergenza() {
  local sandbox="$1" nome_it="$2" nome_en="$3"

  mkdir -p \
    "$sandbox/scripts" \
    "$sandbox/docs/adr" \
    "$sandbox/website/i18n/en/docusaurus-plugin-content-docs/current/adr" || return 1

  cp "$RADICE_REPO/scripts/verifica-divergenza-traduzioni.sh" "$sandbox/scripts/" || return 1

  if [ -n "$nome_it" ]; then
    printf '# Documento sintetico di collaudo (nessun dato reale di paziente)\n' \
      > "$sandbox/docs/adr/$nome_it"
  fi
  if [ -n "$nome_en" ]; then
    printf '# Synthetic test document (no real patient data)\n' \
      > "$sandbox/website/i18n/en/docusaurus-plugin-content-docs/current/adr/$nome_en"
  fi

  (
    cd "$sandbox" || exit 1
    git init -q -b main
    git config user.email "prove@telemedic.test"
    git config user.name "Banco di prova"
    git add -A
    git commit -q -m "contenuto sintetico di collaudo adr"
  )
}

verifica_adr_italiano_senza_inglese_fallisce() {
  local sandbox uscita
  set +e
  trap 'set -e' RETURN
  sandbox=$(mktemp -d) || return 1
  _prepara_sandbox_adr_divergenza "$sandbox" \
    "0099-prova-collaudo.md" "" || { rm -rf "$sandbox"; return 1; }
  (cd "$sandbox" && bash scripts/verifica-divergenza-traduzioni.sh)
  uscita=$?
  rm -rf "$sandbox"
  return "$uscita"
}

verifica_adr_file_gemelli_allineati() {
  local sandbox uscita
  set +e
  trap 'set -e' RETURN
  sandbox=$(mktemp -d) || return 1
  _prepara_sandbox_adr_divergenza "$sandbox" \
    "0099-prova-collaudo.md" "0099-prova-collaudo.md" || { rm -rf "$sandbox"; return 1; }
  (cd "$sandbox" && bash scripts/verifica-divergenza-traduzioni.sh)
  uscita=$?
  rm -rf "$sandbox"
  return "$uscita"
}

esegui_caso "adr: file italiano senza gemello inglese (area esigita, deve fallire)" fallisce \
  verifica_adr_italiano_senza_inglese_fallisce

esegui_caso "adr: file italiano con gemello inglese allineato" passa \
  verifica_adr_file_gemelli_allineati

printf '\n== Controllo 13 - verifica-divergenza-traduzioni.sh (struttura bilingue degli otto documenti alla radice) ==\n\n'

# Fino a questo collaudo, la sezione dello script che guarda i documenti bilingui alla radice
# (AVVERTENZE_PUBBLICHE e DICHIARAZIONI_PUBBLICHE_RADICE) non aveva NESSUN caso nel banco: un
# controllo scritto e mai visto fallire. Questi casi coprono le proprietà nuove - l'ancora rotta,
# la sparizione del blocco inglese anche nella variante ad ancora esplicita (CODE_OF_CONDUCT.md),
# l'estensione ai cinque file di D51 non sorvegliati prima - e verificano che il controllo di
# contenuto specifico esistente (marcatura CE, dichiarazione di conformità) resti riservato alle
# tre avvertenze pubbliche, senza produrre falsi positivi sugli altri cinque, che non parlano
# affatto di marcatura CE (verificato leggendoli: solo GOVERNANCE.md la nomina, per la propria
# ragione redazionale, e non è un motivo per estendere quel controllo agli altri quattro).
#
# Come per i Controlli 3-6, questi casi non producono MAI un'uscita diversa da zero: la sezione
# collaudata è in sola segnalazione per costruzione (vedi il commento nello script collaudato).
# L'asserzione poggia quindi sul TESTO stampato, non sul codice di uscita - stessa tecnica del
# Controllo 3, per la stessa ragione (D-8 del runbook: un'asserzione sul solo codice di uscita non
# distingue un rilievo corretto da un'assenza di rilievo). Tutti i casi si registrano quindi come
# "passa": il valore atteso è che il WRAPPER rilevi (o escluda) correttamente il rilievo, non che
# lo script collaudato fallisca - non può, per questa sezione.
_prepara_sandbox_radice_bilingue() {
  local sandbox="$1" nome_file="$2" contenuto="$3"

  mkdir -p \
    "$sandbox/scripts" \
    "$sandbox/docs" \
    "$sandbox/website/i18n/en/docusaurus-plugin-content-docs/current" || return 1

  cp "$RADICE_REPO/scripts/verifica-divergenza-traduzioni.sh" "$sandbox/scripts/" || return 1
  printf '%s' "$contenuto" > "$sandbox/$nome_file"

  (
    cd "$sandbox" || exit 1
    git init -q -b main
    git config user.email "prove@telemedic.test"
    git config user.name "Banco di prova"
    git add -A
    git commit -q -m "documento sintetico di collaudo alla radice"
  )
}

# Esegue lo script collaudato dentro la tenuta e stampa la sua uscita testuale (stdout+stderr).
_esegui_radice_bilingue() {
  local sandbox
  sandbox=$(mktemp -d) || return 1
  _prepara_sandbox_radice_bilingue "$sandbox" "$1" "$2" >/dev/null || { rm -rf "$sandbox"; return 1; }
  (cd "$sandbox" && bash scripts/verifica-divergenza-traduzioni.sh 2>&1)
  rm -rf "$sandbox"
}

_contenuto_valido_duplice_h1() {
  cat <<'EOF'
*[English version below](#titolo-di-collaudo-in-inglese)*

# Titolo di collaudo in italiano

Testo italiano sintetico usato solo dal banco di prova automatico.

---

# Titolo di collaudo in inglese

Synthetic English text used only by the automated test bench.
EOF
}

_contenuto_ancora_rotta() {
  cat <<'EOF'
*[English version below](#ancora-sbagliata)*

# Titolo di collaudo in italiano

Testo italiano sintetico usato solo dal banco di prova automatico.

---

# Titolo di collaudo in inglese

Synthetic English text used only by the automated test bench.
EOF
}

_contenuto_blocco_assente_duplice_h1() {
  cat <<'EOF'
*[English version below](#titolo-di-collaudo-in-inglese)*

# Titolo di collaudo in italiano

Testo italiano sintetico. Il blocco inglese, con il suo titolo, e' sparito.
EOF
}

_contenuto_valido_ancora_esplicita() {
  cat <<'EOF'
*[English version below](#english)*

<a id="italiano"></a>

# Titolo di collaudo

Testo italiano sintetico usato solo dal banco di prova automatico.

<a id="english"></a>

Synthetic English text used only by the automated test bench.
EOF
}

_contenuto_blocco_assente_ancora_esplicita() {
  cat <<'EOF'
*[English version below](#english)*

<a id="italiano"></a>

# Titolo di collaudo

Testo italiano sintetico. Il blocco inglese, con la sua ancora esplicita, e' sparito.
EOF
}

_contenuto_valido_senza_marcatura_ce() {
  cat <<'EOF'
*[English version below](#titolo-di-collaudo-in-inglese)*

# Titolo di collaudo in italiano

Testo italiano sintetico, senza menzione di marcatura CE.

---

# Titolo di collaudo in inglese

Synthetic English text, deliberately silent about CE-marking topics.
EOF
}

verifica_radice_valida_nessun_rilievo() {
  local uscita
  uscita=$(_esegui_radice_bilingue "SECURITY.md" "$(_contenuto_valido_duplice_h1)")
  ! printf '%s' "$uscita" | grep -q 'documento radice'
}

verifica_radice_ancora_rotta_rilevata() {
  local uscita
  uscita=$(_esegui_radice_bilingue "GOVERNANCE.md" "$(_contenuto_ancora_rotta)")
  printf '%s' "$uscita" | grep -qi "ancora inesistente"
}

verifica_radice_blocco_assente_rilevato() {
  local uscita
  uscita=$(_esegui_radice_bilingue "CONTRIBUTING.md" "$(_contenuto_blocco_assente_duplice_h1)")
  printf '%s' "$uscita" | grep -qi "senza blocco inglese"
}

verifica_radice_valida_ancora_esplicita_nessun_rilievo() {
  local uscita
  uscita=$(_esegui_radice_bilingue "CODE_OF_CONDUCT.md" "$(_contenuto_valido_ancora_esplicita)")
  ! printf '%s' "$uscita" | grep -q 'documento radice'
}

verifica_radice_blocco_assente_variante_ancora_esplicita_rilevato() {
  local uscita
  uscita=$(_esegui_radice_bilingue "CODE_OF_CONDUCT.md" "$(_contenuto_blocco_assente_ancora_esplicita)")
  printf '%s' "$uscita" | grep -qi "senza blocco inglese"
}

verifica_radice_file_fuori_elenco_non_verificato() {
  local uscita
  uscita=$(_esegui_radice_bilingue "ALTRO-FILE.md" "$(_contenuto_ancora_rotta)")
  ! printf '%s' "$uscita" | grep -q 'documento radice'
}

verifica_radice_gruppo_d51_senza_controllo_marcatura_ce() {
  local uscita
  uscita=$(_esegui_radice_bilingue "GOVERNANCE.md" "$(_contenuto_valido_senza_marcatura_ce)")
  ! printf '%s' "$uscita" | grep -qi 'blocco inglese incompleto'
}

verifica_radice_avvertenza_pubblica_senza_marcatura_ce_rilevata() {
  local uscita
  uscita=$(_esegui_radice_bilingue "NOT-A-MEDICAL-DEVICE.md" "$(_contenuto_valido_senza_marcatura_ce)")
  printf '%s' "$uscita" | grep -qi 'blocco inglese incompleto'
}

esegui_caso "documento radice valido (SECURITY.md, gruppo D51): nessun rilievo strutturale" passa \
  verifica_radice_valida_nessun_rilievo

esegui_caso "documento radice con rimando a un'ancora inesistente (GOVERNANCE.md): rilevato nel messaggio" passa \
  verifica_radice_ancora_rotta_rilevata

esegui_caso "documento radice con rimando ma senza blocco inglese, titolo duplice sparito (CONTRIBUTING.md): rilevato" passa \
  verifica_radice_blocco_assente_rilevato

esegui_caso "documento radice variante ad ancora esplicita, valido (come CODE_OF_CONDUCT.md): nessun rilievo" passa \
  verifica_radice_valida_ancora_esplicita_nessun_rilievo

esegui_caso "documento radice variante ad ancora esplicita con blocco inglese sparito (CODE_OF_CONDUCT.md): rilevato" passa \
  verifica_radice_blocco_assente_variante_ancora_esplicita_rilevato

esegui_caso "file alla radice fuori dai due elenchi sorvegliati: nessun rilievo, anche con contenuto malformato" passa \
  verifica_radice_file_fuori_elenco_non_verificato

esegui_caso "documento del gruppo D51 (GOVERNANCE.md) senza menzione di marcatura CE: nessun rilievo di contenuto, riservato alle tre avvertenze pubbliche" passa \
  verifica_radice_gruppo_d51_senza_controllo_marcatura_ce

esegui_caso "avvertenza pubblica (NOT-A-MEDICAL-DEVICE.md) senza menzione di marcatura CE: il rilievo di contenuto esistente resta attivo" passa \
  verifica_radice_avvertenza_pubblica_senza_marcatura_ce_rilevata


printf '\n== Controllo 14 - verifica-registro-dei-difetti.sh (registro/difetti.tsv, tracciabilita del runbook) ==\n\n'

# Il controllo collaudato qui sorveglia registro/difetti.tsv - il giornale che lega le voci di
# .telemedic/context/RUNBOOK-ERRORI-E-TRAPPOLE.md al proprio stato di presidio - e accetta
# REGISTRO_DIFETTI, BANCO, RADICE_CONTROLLI, OGGI, RUNBOOK e VOCI_CANONICHE_FILE: quindi lo si
# punta su tenute statiche sotto scripts/prove/tenute/registro-difetti/ SENZA toccare il registro
# reale ne' il runbook reale - vietato dal perimetro di questo compito, e sono comunque le fonti
# che il progetto sorveglia, non scenari da collaudo.
#
# Dalla correzione di D-10, il controllo NON tiene piu' un elenco delle voci scritto dentro di
# se': lo estrae da RUNBOOK (per difetto il runbook reale). VOCI_CANONICHE_FILE resta SOLO PER
# QUESTO COLLAUDO - mai come sorgente alternativa in esercizio, si veda il commento in testa allo
# script collaudato - e sostituisce l'estrazione con due voci sintetiche (A-90, A-91: famiglia
# reale A, numerazione fuori dall'intervallo vero A-1..A-4/A-1bis, per non collidere mai con le
# voci del runbook) per la maggior parte dei casi sotto, cosi' ogni tenuta non deve replicare
# l'intero runbook reale solo per collaudare una singola regola. L'ultimo caso della sezione,
# quello di D-10, punta invece RUNBOOK a un runbook sintetico apposta, senza VOCI_CANONICHE_FILE,
# perche' e' la lettura della fonte - non della copia - che quel caso deve provare. RADICE_CONTROLLI
# punta alla stessa cartella delle tenute, che contiene un controllo fittizio eseguibile
# (controlli-fittizi/verifica-sintetica.sh) per la regola 2 sull'esistenza del controllo; BANCO
# punta a un banco FITTIZIO (banco-fittizio.txt) con un solo caso, cosi' un caso_banco che ne cita
# un altro non lo trova per costruzione, indipendente dal banco vero.
REGISTRO_DIFETTI_TENUTE="$TENUTE/registro-difetti"
VOCI_SINTETICHE="$REGISTRO_DIFETTI_TENUTE/voci-sintetiche.txt"
BANCO_FITTIZIO_DIFETTI="$REGISTRO_DIFETTI_TENUTE/banco-fittizio.txt"

esegui_caso "registro-difetti: tenuta valida, tutte le regole rispettate" passa \
  env REGISTRO_DIFETTI="$REGISTRO_DIFETTI_TENUTE/registro-valido.tsv" VOCI_CANONICHE_FILE="$VOCI_SINTETICHE" BANCO="$BANCO_FITTIZIO_DIFETTI" RADICE_CONTROLLI="$REGISTRO_DIFETTI_TENUTE" \
  "$RADICE_REPO/scripts/verifica-registro-dei-difetti.sh"

esegui_caso "registro-difetti: voce del runbook assente dal registro" fallisce \
  env REGISTRO_DIFETTI="$REGISTRO_DIFETTI_TENUTE/registro-voce-assente.tsv" VOCI_CANONICHE_FILE="$VOCI_SINTETICHE" BANCO="$BANCO_FITTIZIO_DIFETTI" RADICE_CONTROLLI="$REGISTRO_DIFETTI_TENUTE" \
  "$RADICE_REPO/scripts/verifica-registro-dei-difetti.sh"

esegui_caso "registro-difetti: evento registrata ripetuto" fallisce \
  env REGISTRO_DIFETTI="$REGISTRO_DIFETTI_TENUTE/registro-evento-duplicato.tsv" VOCI_CANONICHE_FILE="$VOCI_SINTETICHE" BANCO="$BANCO_FITTIZIO_DIFETTI" RADICE_CONTROLLI="$REGISTRO_DIFETTI_TENUTE" \
  "$RADICE_REPO/scripts/verifica-registro-dei-difetti.sh"

esegui_caso "registro-difetti: controllo inesistente" fallisce \
  env REGISTRO_DIFETTI="$REGISTRO_DIFETTI_TENUTE/registro-controllo-inesistente.tsv" VOCI_CANONICHE_FILE="$VOCI_SINTETICHE" BANCO="$BANCO_FITTIZIO_DIFETTI" RADICE_CONTROLLI="$REGISTRO_DIFETTI_TENUTE" \
  "$RADICE_REPO/scripts/verifica-registro-dei-difetti.sh"

esegui_caso "registro-difetti: caso di banco inesistente" fallisce \
  env REGISTRO_DIFETTI="$REGISTRO_DIFETTI_TENUTE/registro-caso-banco-inesistente.tsv" VOCI_CANONICHE_FILE="$VOCI_SINTETICHE" BANCO="$BANCO_FITTIZIO_DIFETTI" RADICE_CONTROLLI="$REGISTRO_DIFETTI_TENUTE" \
  "$RADICE_REPO/scripts/verifica-registro-dei-difetti.sh"

esegui_caso "registro-difetti: priva di bloccante_dal" fallisce \
  env REGISTRO_DIFETTI="$REGISTRO_DIFETTI_TENUTE/registro-priva-di-data.tsv" VOCI_CANONICHE_FILE="$VOCI_SINTETICHE" BANCO="$BANCO_FITTIZIO_DIFETTI" RADICE_CONTROLLI="$REGISTRO_DIFETTI_TENUTE" \
  "$RADICE_REPO/scripts/verifica-registro-dei-difetti.sh"

# D-9 del runbook: una mutazione che spegne SOLO la chiamata «segnala» della regola 5a (colonne
# mancanti), lasciando intatta la condizione «$n_campi -ne 11», rivela che questo caso - se
# asserisse solo sull'uscita - passerebbe comunque: la riga malformata salta comunque
# «voce_presente[...]=1» (il «continue» dopo «segnala»), e la voce risulta «assente dal
# registro» per la regola 1a, non «malformata» per la regola 5a. Due presidi diversi producono
# lo stesso esito binario, e un'asserzione sul solo esito non li distingue - lo stesso principio
# di D-8. Questo caso asserisce quindi anche sul TESTO: deve fallire, e il messaggio deve
# contenere «Registro malformato», non un'altra dicitura.
verifica_registro_difetti_colonne_mancanti_messaggio_specifico() {
  local uscita testo
  set +e
  trap 'set -e' RETURN
  testo=$(env REGISTRO_DIFETTI="$REGISTRO_DIFETTI_TENUTE/registro-malformato-colonne.tsv" \
    VOCI_CANONICHE_FILE="$VOCI_SINTETICHE" BANCO="$BANCO_FITTIZIO_DIFETTI" \
    RADICE_CONTROLLI="$REGISTRO_DIFETTI_TENUTE" \
    "$RADICE_REPO/scripts/verifica-registro-dei-difetti.sh" 2>&1)
  uscita=$?
  [ "$uscita" -ne 0 ] || return 1
  printf '%s' "$testo" | grep -qF 'Registro malformato'
}

esegui_caso "registro-difetti: colonne mancanti, il messaggio dichiara «Registro malformato» (non un'altra regola)" passa \
  verifica_registro_difetti_colonne_mancanti_messaggio_specifico

# bloccante_dal e' fissata al 2020-01-01, sempre nel passato: il caso non dipende da OGGI e non
# diventa una bomba a orologeria (vedi il commento sulla stessa cautela nel Controllo 7).
esegui_caso "registro-difetti: data arrivata" fallisce \
  env REGISTRO_DIFETTI="$REGISTRO_DIFETTI_TENUTE/registro-data-arrivata.tsv" VOCI_CANONICHE_FILE="$VOCI_SINTETICHE" BANCO="$BANCO_FITTIZIO_DIFETTI" RADICE_CONTROLLI="$REGISTRO_DIFETTI_TENUTE" \
  "$RADICE_REPO/scripts/verifica-registro-dei-difetti.sh"

# D-10 del runbook: il controllo non deve accorgersi di una voce nuova perche' qualcuno ha
# aggiornato un elenco interno, ma perche' legge la fonte. Questo caso punta RUNBOOK - non
# VOCI_CANONICHE_FILE, che qui resta deliberatamente SENZA VALORE - a un runbook sintetico con
# tre voci (A-90, A-91, A-92); il registro di collaudo abbinato (registro-valido.tsv) ne
# registra solo due. Se il controllo leggesse un elenco interno anziche' il runbook indicato,
# non vedrebbe mai A-92 e passerebbe a torto.
esegui_caso "registro-difetti: runbook di collaudo con una voce che il registro di collaudo non ha" fallisce \
  env REGISTRO_DIFETTI="$REGISTRO_DIFETTI_TENUTE/registro-valido.tsv" RUNBOOK="$REGISTRO_DIFETTI_TENUTE/runbook-sintetico-voce-extra.md" VOCI_CANONICHE_FILE="" BANCO="$BANCO_FITTIZIO_DIFETTI" RADICE_CONTROLLI="$REGISTRO_DIFETTI_TENUTE" \
  "$RADICE_REPO/scripts/verifica-registro-dei-difetti.sh"

# D-8 del runbook, applicato ai due presidi che il controllo ha su se' stesso (aggiunti insieme
# alla correzione di D-10): un'asserzione sul solo codice di uscita non distingue il rifiuto
# corretto (uscita 2, «il controllo non puo' nemmeno partire») da uno schianto accidentale che
# uscisse comunque diverso da zero. I due casi che seguono asseriscono quindi sia sull'uscita sia
# sul testo su standard error, con lo stesso schema della verifica delle colonne mancanti sopra.
# RUNBOOK punta a un percorso che non esiste sotto le tenute (nessun file creato apposta: e' il
# punto del caso), VOCI_CANONICHE_FILE resta vuota per non sostituire la lettura del runbook.
verifica_registro_difetti_runbook_mancante_uscita_2_messaggio_specifico() {
  local uscita testo
  set +e
  trap 'set -e' RETURN
  testo=$(env REGISTRO_DIFETTI="$REGISTRO_DIFETTI_TENUTE/registro-valido.tsv" \
    RUNBOOK="$REGISTRO_DIFETTI_TENUTE/runbook-inesistente.md" VOCI_CANONICHE_FILE="" \
    BANCO="$BANCO_FITTIZIO_DIFETTI" RADICE_CONTROLLI="$REGISTRO_DIFETTI_TENUTE" \
    "$RADICE_REPO/scripts/verifica-registro-dei-difetti.sh" 2>&1)
  uscita=$?
  [ "$uscita" -eq 2 ] || return 1
  printf '%s' "$testo" | grep -qF 'Runbook inesistente o illeggibile'
}

esegui_caso "registro-difetti: runbook mancante o illeggibile, uscita 2 e messaggio specifico" passa \
  verifica_registro_difetti_runbook_mancante_uscita_2_messaggio_specifico

# Runbook presente e leggibile (scripts/prove/tenute/registro-difetti/runbook-sintetico-senza-voci.md)
# ma senza alcun titolo nella forma «### A-1.»: l'estrazione trova zero voci, ed e' errore di
# configurazione - percorso sbagliato o formato dei titoli cambiato - non un runbook senza voci
# in modo legittimo: uscita 2, non insieme vuoto a costruzione riuscita.
verifica_registro_difetti_runbook_zero_voci_uscita_2_messaggio_specifico() {
  local uscita testo
  set +e
  trap 'set -e' RETURN
  testo=$(env REGISTRO_DIFETTI="$REGISTRO_DIFETTI_TENUTE/registro-valido.tsv" \
    RUNBOOK="$REGISTRO_DIFETTI_TENUTE/runbook-sintetico-senza-voci.md" VOCI_CANONICHE_FILE="" \
    BANCO="$BANCO_FITTIZIO_DIFETTI" RADICE_CONTROLLI="$REGISTRO_DIFETTI_TENUTE" \
    "$RADICE_REPO/scripts/verifica-registro-dei-difetti.sh" 2>&1)
  uscita=$?
  [ "$uscita" -eq 2 ] || return 1
  printf '%s' "$testo" | grep -qF 'Estratte zero voci canoniche'
}

esegui_caso "registro-difetti: runbook senza titoli riconoscibili, zero voci estratte, uscita 2 e messaggio specifico" passa \
  verifica_registro_difetti_runbook_zero_voci_uscita_2_messaggio_specifico

printf '\n== Controllo 15 - verifica-firma-e-provenienza.sh (L-17 di T-03, criterio 7) ==\n\n'

# L-17: firma degli artefatti con identità effimera della pipeline di GitHub Actions.
# Il controllo verifica che il workflow di rilascio:
# - Usa cosign-installer (identità OIDC di Sigstore)
# - Invoca scripts/firma-artefatto.sh
# - Usa GITHUB_TOKEN per OIDC
# - NON contiene chiave privata hardcoded
# - Genera attestazioni di provenienza

WORKFLOW_REALE="$RADICE_REPO/.github/workflows/fascia-di-rilascio.yml"

# Caso 1: il workflow reale deve passare il controllo di firma
esegui_caso "workflow di rilascio conforme: firma con identità effimera" passa \
  env WORKFLOW_FILE="$WORKFLOW_REALE" \
  "$RADICE_REPO/scripts/verifica-firma-e-provenienza.sh"

# Caso 2: un workflow senza firma deve fallire il controllo
# Tecnica di mutazione (D-9): neutralizza il passo di firma
verifica_workflow_senza_firma_fallisce() {
  local sandbox uscita
  set +e
  trap 'set -e' RETURN
  sandbox=$(mktemp -d) || return 1
  cp "$WORKFLOW_REALE" "$sandbox/workflow.yml"
  # Mutazione: rimuove la riga di cosign-installer (neutralizza il passo di firma)
  sed -i '/cosign-installer/d' "$sandbox/workflow.yml"
  env WORKFLOW_FILE="$sandbox/workflow.yml" \
    "$RADICE_REPO/scripts/verifica-firma-e-provenienza.sh" >/dev/null 2>&1
  uscita=$?
  rm -rf "$sandbox"
  [ "$uscita" -ne 0 ]
}

esegui_caso "workflow senza firma (mutazione: cosign-installer rimosso): il controllo fallisce" passa \
  verifica_workflow_senza_firma_fallisce

printf '\n== Controllo 16 - verifica-dichiarazione-non-marcatura.sh, estensione (criteri 4 e 5 di T-07) ==\n\n'

# Il controllo, alla sua prima stesura (Controllo 2 sopra), verificava che ALMENO UNA pagina
# collegasse i due documenti sorgente e che il blocco dedicato comparisse nella sola home page.
# Il criterio 5 di T-07 esige l'avvertenza su OGNI pagina, e il criterio 4 - insieme a Q-26 e
# Q-198 - esige che ogni href assoluto verso il repository corrisponda a un file ESISTENTE, non
# solo che il collegamento ci sia. I due casi che seguono provano le due estensioni separatamente
# da artefatto-valido (aggiornato per portare "tmWarnFooter" in entrambe le pagine, altrimenti il
# caso valido del Controllo 2 fallirebbe da solo con la nuova regola).

esegui_caso "caso valido aggiornato: ogni pagina porta tmWarnFooter, ogni href assoluto esiste" passa \
  "$RADICE_REPO/scripts/verifica-dichiarazione-non-marcatura.sh" "$TENUTE/artefatto-valido"

esegui_caso "criterio 5: una pagina su due priva del marcatore tmWarnFooter nel piè di pagina" fallisce \
  "$RADICE_REPO/scripts/verifica-dichiarazione-non-marcatura.sh" "$TENUTE/artefatto-pagina-senza-marcatore-footer"

esegui_caso "criterio 4 / Q-26 / Q-198: un href assoluto cita un percorso inesistente nel repository" fallisce \
  "$RADICE_REPO/scripts/verifica-dichiarazione-non-marcatura.sh" "$TENUTE/artefatto-href-inesistente"

if [ -d "$RADICE_REPO/website/build" ]; then
  printf '\n== Controllo 16 sul sito reale (se già costruito) ==\n\n'
  esegui_caso "sito reale costruito, italiano: ogni pagina con tmWarnFooter, href assoluti raggiungibili" passa \
    "$RADICE_REPO/scripts/verifica-dichiarazione-non-marcatura.sh" "$RADICE_REPO/website/build"
  if [ -d "$RADICE_REPO/website/build/en" ]; then
    esegui_caso "sito reale costruito, inglese: ogni pagina con tmWarnFooter, href assoluti raggiungibili" passa \
      "$RADICE_REPO/scripts/verifica-dichiarazione-non-marcatura.sh" "$RADICE_REPO/website/build/en"
  fi
else
  printf '\n\033[33m· website/build non esiste in questo momento: il caso sul sito reale è saltato, non fallito.\033[0m\n'
fi

printf '\n== Controllo 17 - verifica-ricerca.sh (criterio 2 di T-07: la ricerca funziona nella lingua attiva) ==\n\n'

RICERCA_TENUTE="$TENUTE/ricerca"

esegui_caso "ricerca: coppia valida, un termine per locale, nessuna contaminazione" passa \
  env ARTEFATTO_IT="$RICERCA_TENUTE/valida-it" ARTEFATTO_EN="$RICERCA_TENUTE/valida-en" \
      TERMINE_IT="paroletest_it" TERMINE_EN="paroletest_en" \
  "$RADICE_REPO/scripts/verifica-ricerca.sh"

esegui_caso "ricerca: indice assente sulla locale italiana" fallisce \
  env ARTEFATTO_IT="$RICERCA_TENUTE/indice-assente" ARTEFATTO_EN="$RICERCA_TENUTE/valida-en" \
      TERMINE_IT="paroletest_it" TERMINE_EN="paroletest_en" \
  "$RADICE_REPO/scripts/verifica-ricerca.sh"

esegui_caso "ricerca: indice con zero documenti sulla locale inglese" fallisce \
  env ARTEFATTO_IT="$RICERCA_TENUTE/valida-it" ARTEFATTO_EN="$RICERCA_TENUTE/indice-vuoto" \
      TERMINE_IT="paroletest_it" TERMINE_EN="paroletest_en" \
  "$RADICE_REPO/scripts/verifica-ricerca.sh"

# Variante che isola la regola «indice vuoto» dalla regola successiva «termine assente»: zero
# documenti indicizzati (jq conta 0), ma il file contiene comunque, in un campo estraneo, il
# testo letterale del termine di collaudo - così una mutazione che disattivasse SOLO
# l'accertamento sul conteggio non farebbe cadere questo caso per merito del rilievo successivo,
# che lo maschererebbe (esattamente come già accertato per la regola sul JSON non valido, sopra).
esegui_caso "ricerca: indice con zero documenti, ma testualmente contiene il termine (isola la regola da quella successiva)" fallisce \
  env ARTEFATTO_IT="$RICERCA_TENUTE/valida-it" ARTEFATTO_EN="$RICERCA_TENUTE/indice-vuoto-con-termine" \
      TERMINE_IT="paroletest_it" TERMINE_EN="paroletest_en" \
  "$RADICE_REPO/scripts/verifica-ricerca.sh"

# Docusaurus annida la locale non predefinita DENTRO l'artefatto della predefinita
# (website/build/en sta sotto website/build), e un «find» ricorsivo raccoglieva quindi anche le
# pagine dell'altra lingua: 324 pagine contate come «italiane» il 26 agosto 2026, di cui 162
# erano inglesi. La tenuta qui sotto ha una locale annidata la cui pagina e' DELIBERATAMENTE
# priva della barra di ricerca: se la scansione della locale esterna la raccogliesse, questo
# caso valido fallirebbe. ARTEFATTO_EN punta altrove di proposito, cosi' il caso prova la
# potatura e non la coincidenza fra le due variabili.
esegui_caso "ricerca: una locale annidata non e' contata dalla locale che la contiene" passa \
  env ARTEFATTO_IT="$RICERCA_TENUTE/locale-annidata" ARTEFATTO_EN="$RICERCA_TENUTE/valida-en" \
      TERMINE_IT="paroletest_it" TERMINE_EN="paroletest_en" \
  "$RADICE_REPO/scripts/verifica-ricerca.sh"

esegui_caso "ricerca: barra di ricerca assente da una pagina" fallisce \
  env ARTEFATTO_IT="$RICERCA_TENUTE/marcatore-assente" ARTEFATTO_EN="$RICERCA_TENUTE/valida-en" \
      TERMINE_IT="paroletest_it" TERMINE_EN="paroletest_en" \
  "$RADICE_REPO/scripts/verifica-ricerca.sh"

esegui_caso "ricerca: contaminazione, il termine italiano compare anche nell'indice inglese" fallisce \
  env ARTEFATTO_IT="$RICERCA_TENUTE/valida-it" ARTEFATTO_EN="$RICERCA_TENUTE/contaminata" \
      TERMINE_IT="paroletest_it" TERMINE_EN="paroletest_en" \
  "$RADICE_REPO/scripts/verifica-ricerca.sh"

esegui_caso "ricerca: contaminazione, il termine inglese compare anche nell'indice italiano" fallisce \
  env ARTEFATTO_IT="$RICERCA_TENUTE/contaminata" ARTEFATTO_EN="$RICERCA_TENUTE/valida-en" \
      TERMINE_IT="paroletest_it" TERMINE_EN="paroletest_en" \
  "$RADICE_REPO/scripts/verifica-ricerca.sh"

esegui_caso "ricerca: termine di collaudo scelto male, assente da entrambi gli indici" fallisce \
  env ARTEFATTO_IT="$RICERCA_TENUTE/valida-it" ARTEFATTO_EN="$RICERCA_TENUTE/valida-en" \
      TERMINE_IT="parola-inesistente-xyz" TERMINE_EN="paroletest_en" \
  "$RADICE_REPO/scripts/verifica-ricerca.sh"

# Come sopra, ma sul termine inglese: prova la regola simmetrica («TERMINE_EN scelto male»)
# separatamente, perché mutare quella regola da sola non faceva cadere ALCUN caso del banco -
# nessuno dei casi esistenti sceglieva apposta un TERMINE_EN assente. Trovato durante il collaudo
# per mutazione di questo stesso controllo.
esegui_caso "ricerca: termine di collaudo inglese scelto male, assente dall'indice inglese" fallisce \
  env ARTEFATTO_IT="$RICERCA_TENUTE/valida-it" ARTEFATTO_EN="$RICERCA_TENUTE/valida-en" \
      TERMINE_IT="paroletest_it" TERMINE_EN="altra-parola-inesistente-xyz" \
  "$RADICE_REPO/scripts/verifica-ricerca.sh"

esegui_caso "ricerca: directory dell'artefatto italiano inesistente" fallisce \
  env ARTEFATTO_IT="$RICERCA_TENUTE/questa-directory-non-esiste" ARTEFATTO_EN="$RICERCA_TENUTE/valida-en" \
  "$RADICE_REPO/scripts/verifica-ricerca.sh"

esegui_caso "ricerca: indice di ricerca non è JSON valido" fallisce \
  env ARTEFATTO_IT="$RICERCA_TENUTE/indice-corrotto" ARTEFATTO_EN="$RICERCA_TENUTE/valida-en" \
      TERMINE_IT="paroletest_it" TERMINE_EN="paroletest_en" \
  "$RADICE_REPO/scripts/verifica-ricerca.sh"

# Variante che isola la regola «JSON non valido» dalla regola successiva «termine assente»: il
# file corrotto qui contiene comunque il testo letterale del termine di collaudo, quindi una
# mutazione che disattivasse SOLO l'accertamento su jq non farebbe cadere il caso sopra (il
# rilievo sul termine assente lo sostituirebbe, mascherando la regressione - provato durante il
# collaudo per mutazione di questo stesso controllo). Con questa tenuta, il termine è presente e
# il solo modo per cui il caso fallisca è che l'accertamento su jq sia davvero attivo.
esegui_caso "ricerca: indice non JSON valido, ma testualmente contiene il termine (isola la regola da quella successiva)" fallisce \
  env ARTEFATTO_IT="$RICERCA_TENUTE/indice-corrotto-con-termine" ARTEFATTO_EN="$RICERCA_TENUTE/valida-en" \
      TERMINE_IT="paroletest_it" TERMINE_EN="paroletest_en" \
  "$RADICE_REPO/scripts/verifica-ricerca.sh"

if [ -d "$RADICE_REPO/website/build" ] && [ -d "$RADICE_REPO/website/build/en" ]; then
  printf '\n== Controllo 17 sul sito reale (se già costruito) ==\n\n'
  # I due termini sono stati verificati con grep sul sito costruito il 26 agosto 2026: 354
  # occorrenze di "responsabilità" nell'indice italiano e 0 in quello inglese; 53 occorrenze di
  # "Foundations" nell'indice inglese e 0 in quello italiano - vedi il commento in testa a
  # scripts/verifica-ricerca.sh.
  esegui_caso "sito reale costruito: ricerca in entrambe le lingue, nessuna contaminazione" passa \
    "$RADICE_REPO/scripts/verifica-ricerca.sh"
else
  printf '\n\033[33m· website/build o website/build/en non esistono in questo momento: il caso sul sito reale è saltato, non fallito.\033[0m\n'
fi

printf '\n== Controllo 18 - verifica-avviso-traduzione.sh (criterio 3 di T-07: avviso di traduzione in corso) ==\n\n'

AVVISO_TENUTE="$TENUTE/avviso-traduzione"

esegui_caso "avviso-traduzione: un documento tradotto e uno no, avviso presente solo dove serve" passa \
  env DOCS_DIR="$AVVISO_TENUTE/valida/docs" I18N_EN_DIR="$AVVISO_TENUTE/valida/i18n-en" \
      ARTEFATTO_EN="$AVVISO_TENUTE/valida/build-en" \
  "$RADICE_REPO/scripts/verifica-avviso-traduzione.sh"

esegui_caso "avviso-traduzione: la pagina inglese del documento non tradotto non è stata costruita" fallisce \
  env DOCS_DIR="$AVVISO_TENUTE/pagina-mancante/docs" I18N_EN_DIR="$AVVISO_TENUTE/pagina-mancante/i18n-en" \
      ARTEFATTO_EN="$AVVISO_TENUTE/pagina-mancante/build-en" \
  "$RADICE_REPO/scripts/verifica-avviso-traduzione.sh"

# Variante che isola la regola «pagina inglese assente» dalla regola «il conteggio non
# combacia»: la pagina TRADOTTA porta qui il marcatore a torto, cosicché il conteggio totale
# combaci comunque (1 pagina con marcatore, 1 documento non tradotto) anche se la pagina che
# dovrebbe davvero portarlo non esiste. Senza questa tenuta, una mutazione che disattivasse SOLO
# l'accertamento sull'esistenza della pagina non faceva cadere alcun caso, perché il rilievo sul
# conteggio lo sostituiva - scoperto durante il collaudo per mutazione di questo controllo.
esegui_caso "avviso-traduzione: pagina assente, ma il conteggio combacia comunque (isola la regola dal conteggio)" fallisce \
  env DOCS_DIR="$AVVISO_TENUTE/pagina-mancante-conteggio-compensato/docs" \
      I18N_EN_DIR="$AVVISO_TENUTE/pagina-mancante-conteggio-compensato/i18n-en" \
      ARTEFATTO_EN="$AVVISO_TENUTE/pagina-mancante-conteggio-compensato/build-en" \
  "$RADICE_REPO/scripts/verifica-avviso-traduzione.sh"

esegui_caso "avviso-traduzione: pagina non tradotta priva del marcatore dell'avviso" fallisce \
  env DOCS_DIR="$AVVISO_TENUTE/avviso-assente/docs" I18N_EN_DIR="$AVVISO_TENUTE/avviso-assente/i18n-en" \
      ARTEFATTO_EN="$AVVISO_TENUTE/avviso-assente/build-en" \
  "$RADICE_REPO/scripts/verifica-avviso-traduzione.sh"

# Variante che isola la regola «marcatore assente» dalla regola sul rinvio e da quella sul
# conteggio: la pagina ha il rinvio all'italiano ma non il marcatore, e la pagina TRADOTTA porta
# il marcatore a torto per compensare il conteggio totale. Senza questa tenuta, una mutazione che
# disattivasse SOLO questa regola non faceva cadere alcun caso - scoperto durante il collaudo per
# mutazione di questo controllo.
esegui_caso "avviso-traduzione: marcatore assente ma rinvio presente, conteggio compensato (isola la regola)" fallisce \
  env DOCS_DIR="$AVVISO_TENUTE/avviso-assente-isolata/docs" I18N_EN_DIR="$AVVISO_TENUTE/avviso-assente-isolata/i18n-en" \
      ARTEFATTO_EN="$AVVISO_TENUTE/avviso-assente-isolata/build-en" \
  "$RADICE_REPO/scripts/verifica-avviso-traduzione.sh"

esegui_caso "avviso-traduzione: avviso presente ma senza il rinvio alla pagina italiana" fallisce \
  env DOCS_DIR="$AVVISO_TENUTE/rinvio-assente/docs" I18N_EN_DIR="$AVVISO_TENUTE/rinvio-assente/i18n-en" \
      ARTEFATTO_EN="$AVVISO_TENUTE/rinvio-assente/build-en" \
  "$RADICE_REPO/scripts/verifica-avviso-traduzione.sh"

esegui_caso "avviso-traduzione: l'avviso compare anche su una pagina già tradotta (falso positivo)" fallisce \
  env DOCS_DIR="$AVVISO_TENUTE/avviso-su-pagina-tradotta/docs" I18N_EN_DIR="$AVVISO_TENUTE/avviso-su-pagina-tradotta/i18n-en" \
      ARTEFATTO_EN="$AVVISO_TENUTE/avviso-su-pagina-tradotta/build-en" \
  "$RADICE_REPO/scripts/verifica-avviso-traduzione.sh"

esegui_caso "avviso-traduzione: radice dei documenti sorgente inesistente" fallisce \
  env DOCS_DIR="$AVVISO_TENUTE/questa-non-esiste" I18N_EN_DIR="$AVVISO_TENUTE/valida/i18n-en" \
      ARTEFATTO_EN="$AVVISO_TENUTE/valida/build-en" \
  "$RADICE_REPO/scripts/verifica-avviso-traduzione.sh"

if [ -d "$RADICE_REPO/website/build/en" ]; then
  printf '\n== Controllo 18 sul sito reale (se già costruito) ==\n\n'
  # Misurato il 26 agosto 2026: 146 documenti sorgente, 1 privo di traduzione inglese
  # (docs/adr/0031-firma-artefatti-identita-effimera.md, aggiunto durante questa stessa sessione
  # di lavoro da un altro agente). Il caso prova che l'avviso compare esattamente lì e in
  # nessun'altra pagina.
  esegui_caso "sito reale costruito: avviso di traduzione presente solo sui documenti non tradotti" passa \
    env ARTEFATTO_EN="$RADICE_REPO/website/build/en" \
    "$RADICE_REPO/scripts/verifica-avviso-traduzione.sh"
else
  printf '\n\033[33m· website/build/en non esiste in questo momento: il caso sul sito reale è saltato, non fallito.\033[0m\n'
fi

printf '\n== Controllo 19 - verifica-voci-di-menu.sh (criterio 1 di T-07, seconda metà: le voci di menu) ==\n\n'

MENU_TENUTE="$TENUTE/voci-di-menu"

esegui_caso "voci-di-menu: ogni voce «to:» ha una pagina pubblicata corrispondente" passa \
  env CONFIG="$MENU_TENUTE/config-valido.mjs" SITEMAP="$MENU_TENUTE/sitemap-valida.xml" \
  "$RADICE_REPO/scripts/verifica-voci-di-menu.sh"

esegui_caso "voci-di-menu: una voce «to:» non ha alcuna pagina pubblicata" fallisce \
  env CONFIG="$MENU_TENUTE/config-valido.mjs" SITEMAP="$MENU_TENUTE/sitemap-voce-mancante.xml" \
  "$RADICE_REPO/scripts/verifica-voci-di-menu.sh"

esegui_caso "voci-di-menu: file di configurazione inesistente" fallisce \
  env CONFIG="$MENU_TENUTE/non-esiste.mjs" SITEMAP="$MENU_TENUTE/sitemap-valida.xml" \
  "$RADICE_REPO/scripts/verifica-voci-di-menu.sh"

esegui_caso "voci-di-menu: mappa del sito inesistente" fallisce \
  env CONFIG="$MENU_TENUTE/config-valido.mjs" SITEMAP="$MENU_TENUTE/non-esiste.xml" \
  "$RADICE_REPO/scripts/verifica-voci-di-menu.sh"

if [ -f "$RADICE_REPO/website/build/sitemap.xml" ]; then
  printf '\n== Controllo 19 sul sito reale (se già costruito) ==\n\n'
  esegui_caso "sito reale costruito: le cinque voci di menu hanno tutte una pagina pubblicata" passa \
    "$RADICE_REPO/scripts/verifica-voci-di-menu.sh"
else
  printf '\n\033[33m· website/build/sitemap.xml non esiste in questo momento: il caso sul sito reale è saltato, non fallito.\033[0m\n'
fi

printf '\n== Controllo 20 - verifica-termini-vietati.sh (G11, regola di riservatezza R0) ==\n\n'

# G11 traduce in controllo la regola R0: nessun nome di azienda, marchio, prodotto commerciale o
# dominio di un potenziale partner compare in un artefatto del progetto. Il controllo ha due strati
# con regimi opposti di pubblicita' - lo strato STRUTTURALE, in chiaro e sempre attivo, che cerca le
# POSIZIONI in cui un nome commerciale si manifesta per forma e vi applica un elenco di AMMISSIONE;
# e lo strato SPECIFICO per impronta, fuori dal repository e spento per difetto, che copre il nome
# avente la forma di una parola qualunque. Il ragionamento per esteso sta in
# .telemedic/piani/G11-regola-di-riservatezza.md.
#
# IL VINCOLO CHE GOVERNA QUESTE TENUTE, E NON E' NEGOZIABILE. R0 pubblica il complemento, mai
# l'insieme protetto: se una tenuta contenesse un termine realmente protetto, il banco
# pubblicherebbe esattamente cio' che il controllo esiste per proteggere, e lo pubblicherebbe nella
# storia di git, che non dimentica. Tutti i nomi che compaiono qui sotto e nelle tenute sono
# INVENTATI e dichiarati tali nel file che li contiene: nomi di host sotto una marca qualunque,
# ragioni sociali e nomi di prodotto composti con la parola «fittizio», segmenti di coordinata
# altrettanto inventati. I termini dello strato specifico sono i cinque segnaposto gia' scritti in
# chiaro, per scelta e con la loro motivazione, in pipeline/termini-vietati.esempio.tsv: quel file
# e' un esempio del formato e non e' la lista, e i suoi segnaposto non proteggono nessuno.
#
# PERCHE' L'ELENCO DI AMMISSIONE NON E' SOSTITUITO DA UNA TENUTA. I casi qui sotto lasciano
# TERMINI_AMMESSI al suo valore per difetto, cioe' al file VERO pipeline/termini-ammessi.tsv. E'
# deliberato: l'ammissione e' il complemento pubblicato, ed e' l'unica meta' del controllo che vive
# nel repository. Se qualcuno vi aggiungesse un suffisso tanto largo da inghiottire i nomi
# di host inventati delle tenute, i casi «deve fallire» smetterebbero di fallire e il banco lo
# direbbe. Con una tenuta di ammissioni tutta sua, quella stessa modifica passerebbe inosservata.
# L'unica eccezione e' il caso che prova il rifiuto quando l'elenco di ammissione manca.
#
# QUALI RAMI RESTANO SCOPERTI, DICHIARATI QUI E NON ALTROVE. Il ramo che rifiuta di girare quando
# non esistono ne' python3 ne' perl - il calcolatore di impronte - non ha un caso: renderlo
# raggiungibile richiederebbe di togliere entrambi gli interpreti dal PATH dell'esecutore, cioe' di
# collaudare l'ambiente invece del controllo. Il ramo che scarta i byte non ASCII dentro la
# normalizzazione non ha un caso proprio, perche' un nome accentato non viene raccolto affatto come
# candidato in prosa - la sequenza di parole con iniziale maiuscola si spezza sul primo byte non
# ASCII - quindi la lacuna sta a monte della normalizzazione e non si prova neutralizzandola. Il
# ramo che esclude le righe non di risoluzione dei file di blocco delle dipendenze non ha un caso.
#
# LA DOPPIA COPIA DELLA NORMALIZZAZIONE, E QUALI CASI LA PRESIDIANO. Il commento in testa allo
# script annuncia «la normalizzazione, in un solo posto», ma i posti sono due: una funzione di
# shell che serve il modo --impronta e il canarino, e una funzione awk omonima dentro il programma
# di scansione che serve i candidati. Le due devono coincidere byte per byte, e nulla nello script
# lo verifica; se divergessero, le impronte calcolate per l'elenco non corrisponderebbero mai a
# quelle dei candidati e lo strato specifico uscirebbe VERDE PER SEMPRE - senza che il canarino se
# ne accorga, perche' il canarino percorre la sola funzione di shell su entrambi i lati del
# confronto. E' la forma del difetto D-10 del runbook. I tre casi «termine dell'elenco specifico»
# sono il presidio di questa divergenza, e non solo del confronto: attraversano la funzione awk in
# andata e quella di shell in ritorno, quindi cadono appena le due smettono di coincidere. Provato
# per mutazione togliendo il passaggio a minuscole dalla sola copia awk: cadono il caso della prosa,
# quello del commento e - per una ragione diversa, la scala delle ammissioni per nome - quello
# dell'attribuzione di marchio ammessa. Non cade il caso del file di configurazione, perche' quel
# termine e' gia' scritto tutto in minuscolo: e' la ragione per cui i tre casi restano tre.

TERMINI_TENUTE="$TENUTE/termini"
TERMINI_CONTROLLO="$RADICE_REPO/scripts/verifica-termini-vietati.sh"
ELENCO_ESEMPIO="$RADICE_REPO/pipeline/termini-vietati.esempio.tsv"

# --- Strato strutturale: le quattro regole, ciascuna isolata da una tenuta che fa scattare
# --- quella sola. L'isolamento e' stato verificato leggendo l'uscita di ogni tenuta: se una
# --- tenuta facesse scattare due regole, la mutazione di una sola non la farebbe cadere e il
# --- caso proverebbe meno di quanto dichiara.

esegui_caso "termini vietati: tenuta pulita, deve passare" passa \
  env RADICE_SORGENTI="$TERMINI_TENUTE/valida" "$TERMINI_CONTROLLO"

esegui_caso "termini vietati: dominio non ammesso in un documento" fallisce \
  env RADICE_SORGENTI="$TERMINI_TENUTE/dominio-documento" "$TERMINI_CONTROLLO"

esegui_caso "termini vietati: dominio non ammesso in un file di configurazione di esempio" fallisce \
  env RADICE_SORGENTI="$TERMINI_TENUTE/dominio-configurazione" "$TERMINI_CONTROLLO"

# Il complemento del caso precedente, e vale quanto lui: un controllo che segnalasse ogni nome di
# host sarebbe rumore, e verrebbe spento entro la settimana. Questa tenuta cita quattro organismi
# di normazione e istituzioni pubbliche gia' presenti nell'elenco di ammissione.
esegui_caso "termini vietati: dominio ammesso dall'elenco, deve passare" passa \
  env RADICE_SORGENTI="$TERMINI_TENUTE/dominio-ammesso" "$TERMINI_CONTROLLO"

esegui_caso "termini vietati: forma societaria accostata a un nome" fallisce \
  env RADICE_SORGENTI="$TERMINI_TENUTE/forma-societaria" "$TERMINI_CONTROLLO"

esegui_caso "termini vietati: marcatore di marchio su nome non ammesso" fallisce \
  env RADICE_SORGENTI="$TERMINI_TENUTE/marchio" "$TERMINI_CONTROLLO"

# Le attribuzioni di marchio degli organismi di normazione sono IMPOSTE dalle loro politiche: il
# progetto deve scriverle. Se il controllo le segnalasse, la regola R0 entrerebbe in conflitto con
# un obbligo, e il conflitto lo risolverebbe chi spegne il controllo.
esegui_caso "termini vietati: attribuzione di marchio ammessa, deve passare" passa \
  env RADICE_SORGENTI="$TERMINI_TENUTE/marchio-ammesso" "$TERMINI_CONTROLLO"

esegui_caso "termini vietati: coordinata a dominio inverso con fornitore non ammesso" fallisce \
  env RADICE_SORGENTI="$TERMINI_TENUTE/coordinata" "$TERMINI_CONTROLLO"

# --- Strato specifico: le tre strade con cui un termine dell'elenco arriva al confronto, piu' i
# --- due casi che dicono che cosa il verde significa e che cosa non significa.

esegui_caso "termini vietati: termine dell'elenco specifico nella prosa" fallisce \
  env RADICE_SORGENTI="$TERMINI_TENUTE/elenco-prosa" TERMINI_VIETATI_ELENCO="$ELENCO_ESEMPIO" \
  "$TERMINI_CONTROLLO"

esegui_caso "termini vietati: termine dell'elenco specifico in un commento" fallisce \
  env RADICE_SORGENTI="$TERMINI_TENUTE/elenco-commento" TERMINI_VIETATI_ELENCO="$ELENCO_ESEMPIO" \
  "$TERMINI_CONTROLLO"

esegui_caso "termini vietati: termine dell'elenco specifico in un file di configurazione di esempio" fallisce \
  env RADICE_SORGENTI="$TERMINI_TENUTE/elenco-configurazione" TERMINI_VIETATI_ELENCO="$ELENCO_ESEMPIO" \
  "$TERMINI_CONTROLLO"

# IL CASO PIU' IMPORTANTE DEL GRUPPO, ED E' UN CASO CHE PASSA. La stessa identica tenuta che il
# caso «termine dell'elenco specifico nella prosa» fa fallire, qui passa - perche' senza
# TERMINI_VIETATI_ELENCO lo strato specifico non gira. Il caso non collauda una funzionalita':
# collauda il SIGNIFICATO del verde. Chi legge un esito verde di questo controllo senza sapere
# quale meta' ha girato legge una rassicurazione che il controllo non ha dato, ed e' la ragione per
# cui lo script dichiara lo stato dei due strati a ogni esecuzione, verde o rosso che sia.
esegui_caso "termini vietati: strato specifico spento, lo stesso termine passa" passa \
  env RADICE_SORGENTI="$TERMINI_TENUTE/elenco-prosa" "$TERMINI_CONTROLLO"

# Il complemento: lo strato specifico raccoglie ogni sequenza di parole con iniziale maiuscola, e
# la prosa italiana di questo progetto ne e' piena - ministeri, autorita', gazzette. Se segnalasse
# a caso non resterebbe acceso, e il caso precedente diventerebbe la condizione permanente.
esegui_caso "termini vietati: parola comune non in elenco, deve passare" passa \
  env RADICE_SORGENTI="$TERMINI_TENUTE/prosa-comune" TERMINI_VIETATI_ELENCO="$ELENCO_ESEMPIO" \
  "$TERMINI_CONTROLLO"

# --- Il canarino, e gli altri rifiuti di girare a vuoto. ---
#
# Un'asserzione sul solo codice di uscita non basta qui, e la ragione e' precisa: il controllo usa
# 1 per il RILIEVO e 2 per l'ERRORE DI CONFIGURAZIONE, e sono cose diverse. Uno strato specifico
# incoerente con il proprio sale non trova mai nulla: se uscisse 0 sarebbe un verde privo di
# significato, se uscisse 1 sarebbe un rilievo che non esiste. Deve uscire 2 e dire perche'. I casi
# che seguono asseriscono quindi su uscita e messaggio insieme, con lo stesso schema gia' in uso
# per verifica-registro-dei-difetti.sh.
termini_uscita_due_con_messaggio() {   # $1 = frammento atteso; il resto = assegnazioni d'ambiente
  local atteso="$1" uscita testo
  shift
  set +e
  trap 'set -e' RETURN
  testo=$(env "$@" "$TERMINI_CONTROLLO" 2>&1)
  uscita=$?
  [ "$uscita" -eq 2 ] || return 1
  printf '%s' "$testo" | grep -qF "$atteso"
}

esegui_caso "termini vietati: elenco senza sale, uscita 2 e messaggio specifico" passa \
  termini_uscita_due_con_messaggio "L'elenco non dichiara alcun sale." \
  RADICE_SORGENTI="$TERMINI_TENUTE/valida" \
  TERMINI_VIETATI_ELENCO="$TERMINI_TENUTE/elenchi/senza-sale.tsv"

# E' il caso del canarino, ed e' il piu' insidioso dei tre: l'elenco e' formalmente perfetto - un
# sale c'e', le impronte sono ben formate - e nondimeno non puo' trovare nulla, perche' il sale non
# e' quello con cui le impronte sono state calcolate. Senza canarino il controllo uscirebbe verde
# per sempre e nessuno avrebbe motivo di guardare.
esegui_caso "termini vietati: elenco con sale cambiato e canarino assente, uscita 2 e messaggio specifico" passa \
  termini_uscita_due_con_messaggio "Manca l'impronta del canarino" \
  RADICE_SORGENTI="$TERMINI_TENUTE/valida" \
  TERMINI_VIETATI_ELENCO="$TERMINI_TENUTE/elenchi/sale-cambiato.tsv"

esegui_caso "termini vietati: elenco privo di impronte, uscita 2 e messaggio specifico" passa \
  termini_uscita_due_con_messaggio "L'elenco non contiene alcuna impronta ben formata." \
  RADICE_SORGENTI="$TERMINI_TENUTE/valida" \
  TERMINI_VIETATI_ELENCO="$TERMINI_TENUTE/elenchi/senza-impronte.tsv"

esegui_caso "termini vietati: elenco di impronte indicato ma inesistente, uscita 2 e messaggio specifico" passa \
  termini_uscita_due_con_messaggio "Elenco di impronte non leggibile" \
  RADICE_SORGENTI="$TERMINI_TENUTE/valida" \
  TERMINI_VIETATI_ELENCO="$TERMINI_TENUTE/elenchi/questo-elenco-non-esiste.tsv"

# L'elenco di AMMISSIONE e' la fonte dello strato strutturale, e il controllo non ne porta dentro
# di se' alcuna copia di riserva: se manca, si rifiuta di girare con uscita 2 invece di ricadere su
# un elenco interno. E' la regola D-10 del runbook degli errori, e questo caso e' il suo presidio
# su G11: se qualcuno introducesse una riserva interna, il controllo qui uscirebbe 0 oppure 1, e il
# caso cadrebbe.
esegui_caso "termini vietati: elenco di ammissione mancante, uscita 2 e messaggio specifico" passa \
  termini_uscita_due_con_messaggio "Elenco di ammissione non leggibile" \
  RADICE_SORGENTI="$TERMINI_TENUTE/valida" \
  TERMINI_AMMESSI="$TERMINI_TENUTE/questo-elenco-di-ammissione-non-esiste.tsv"

esegui_caso "termini vietati: radice da esaminare inesistente, uscita 2 e messaggio specifico" passa \
  termini_uscita_due_con_messaggio "Radice da esaminare inesistente" \
  RADICE_SORGENTI="$TERMINI_TENUTE/questa-radice-non-esiste"

# Un argomento sconosciuto e' un errore d'USO, non un rilievo: chi ha sbagliato a invocare il
# controllo deve vedere 2 e l'elenco dei modi ammessi, non 1 e la convinzione di aver trovato
# qualcosa. Non passa dalla funzione precedente perche' qui la variabile e' l'argomento, non
# l'ambiente.
termini_argomento_non_riconosciuto() {
  local uscita testo
  set +e
  trap 'set -e' RETURN
  testo=$("$TERMINI_CONTROLLO" --questo-argomento-non-esiste 2>&1)
  uscita=$?
  [ "$uscita" -eq 2 ] || return 1
  printf '%s' "$testo" | grep -qF 'Argomento non riconosciuto'
}

esegui_caso "termini vietati: argomento non riconosciuto, uscita 2 e messaggio specifico" passa \
  termini_argomento_non_riconosciuto

# Il modo aiuto ricava il testo dal commento in testa allo script fino alla prima riga non
# commentata, e non da un intervallo di righe scritto a mano: il caso verifica che l'aiuto esca con
# successo e riporti la prima riga di quel commento. Se qualcuno spostasse l'intestazione, l'aiuto
# comincerebbe a mentire in silenzio.
termini_aiuto_riporta_intestazione() {
  local uscita testo
  set +e
  trap 'set -e' RETURN
  testo=$("$TERMINI_CONTROLLO" --aiuto 2>&1)
  uscita=$?
  [ "$uscita" -eq 0 ] || return 1
  printf '%s' "$testo" | grep -qF 'regola di riservatezza R0'
}

esegui_caso "termini vietati: il modo aiuto stampa l'intestazione dello script" passa \
  termini_aiuto_riporta_intestazione

# --- I messaggi di commit. R0 li nomina esplicitamente, e sono l'unico artefatto che nessuna
# --- correzione del file puo' ripulire: un messaggio gia' spinto resta. ---

termini_su_deposito_sintetico() {   # $1 = messaggio del commit da esaminare
  local sandbox uscita
  set +e
  trap 'set -e' RETURN
  sandbox=$(mktemp -d) || return 1
  # L'albero di lavoro del deposito sintetico e' una tenuta PULITA: cosi' l'unico rilievo possibile
  # e' quello del messaggio, e il caso non puo' passare per la strada sbagliata.
  cp "$TERMINI_TENUTE/valida/documento.md" "$sandbox/documento.md" || { rm -rf "$sandbox"; return 1; }
  (
    cd "$sandbox" || exit 1
    git init -q -b main
    git config user.email "prove@telemedic.test"
    git config user.name "Banco di prova"
    git commit -q --allow-empty -m "commit di base del deposito sintetico di collaudo"
    git add documento.md
    git commit -q -m "$1"
  ) >/dev/null 2>&1 || { rm -rf "$sandbox"; return 1; }
  env RADICE_SORGENTI="$sandbox" TERMINI_VIETATI_COMMIT="HEAD~1..HEAD" "$TERMINI_CONTROLLO" \
    >/dev/null 2>&1
  uscita=$?
  rm -rf "$sandbox"
  return "$uscita"
}

esegui_caso "termini vietati: dominio non ammesso in un messaggio di commit" fallisce \
  termini_su_deposito_sintetico \
  "chore: provata l'integrazione con https://gestionale-fittizio-zeta.cloud (nome inventato)"

esegui_caso "termini vietati: messaggio di commit pulito, deve passare" passa \
  termini_su_deposito_sintetico \
  "docs: riformulata la citazione in categoria generica, un gestionale sanitario cloud"

# Insieme vuoto: nessun file di testo sotto la radice indicata. E' un esito CORRETTO e non un
# guasto, ma va provato, perche' la via piu' silenziosa con cui un controllo smette di controllare
# e' che l'insieme dei file esaminati si svuoti senza che nessuno lo noti.
termini_insieme_vuoto() {
  local sandbox uscita
  set +e
  trap 'set -e' RETURN
  sandbox=$(mktemp -d) || return 1
  env RADICE_SORGENTI="$sandbox" "$TERMINI_CONTROLLO" >/dev/null 2>&1
  uscita=$?
  rm -rf "$sandbox"
  return "$uscita"
}

esegui_caso "termini vietati: nessun file di testo sotto la radice, insieme vuoto, deve passare" passa \
  termini_insieme_vuoto

printf "\n%d/%d casi con esito conforme all'atteso.\n" "$attese_rispettate" "$totale"

if [ "$esito" -eq 0 ]; then
  printf '\033[32m✓ Banco di prova superato: tutti i controlli si comportano come atteso.\033[0m\n'
else
  printf '\033[31m✗ Banco di prova NON superato: vedi sopra.\033[0m\n'
fi

exit "$esito"
