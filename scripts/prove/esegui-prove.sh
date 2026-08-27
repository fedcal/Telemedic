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

# scripts/verifica-divergenza-traduzioni.sh non accetta variabili d'ambiente per SORGENTE/TRADOTTO
# (vedi il commento al Controllo 3): i collaudi lo copiano in un repository sintetico temporaneo e
# vi girano dentro, con «cd» che risolve alla radice di quel sandbox. Da quando la differenziazione
# vive in pipeline/differenziazione-traduzioni.tsv (D-10, D-17), lo script la esige e non ne
# contiene più una copia: senza DIFFERENZIAZIONE_TRADUZIONI uscirebbe 2 in ogni sandbox, perché
# nessuna di esse porta con sé una copia della tabella. Esportata QUI, una volta sola, punta ogni
# invocazione sandboxata alla tabella VERA del repository - un percorso assoluto, che «cd» dentro
# il sandbox non altera - così i collaudi provano lo stesso comportamento che provavano quando le
# liste erano cablate nello script, senza portare una copia propria che potrebbe divergere da
# quella vera (sarebbe di nuovo D-10, spostato nel banco).
export DIFFERENZIAZIONE_TRADUZIONI="$RADICE_REPO/pipeline/differenziazione-traduzioni.tsv"

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
# Registro dei traguardi SINTETICO per la regola 6 (D-17: sovrascrivibile per il collaudo, mai
# come sorgente alternativa in esercizio). Senza TRAGUARDI il controllo leggerebbe
# docs/09_roadmap/02-traguardi.md reale, e le tenute qui sotto - che citano tutte «T-09/n» come
# placeholder fuori dalla numerazione reale, per non collidere mai con un traguardo vero -
# smetterebbero di risolvere non appena la regola 6 esistesse, per una ragione che non è la loro:
# proverebbero lo stato del registro reale, non il comportamento del controllo.
COLLOCAZIONE_TRAGUARDI="$COLLOCAZIONE_TENUTE/traguardi-sintetici.md"

esegui_caso "collocazione: tabella valida, tutte le regole rispettate" passa \
  env CORSIE="$COLLOCAZIONE_CORSIE" TRAGUARDI="$COLLOCAZIONE_TRAGUARDI" TABELLA="$COLLOCAZIONE_TENUTE/tabella-valida.tsv" BANCO="$COLLOCAZIONE_BANCO_FITTIZIO" \
  "$RADICE_REPO/scripts/verifica-collocazione-dei-controlli.sh"

esegui_caso "collocazione: segnalazione senza data (regola 2 del README: una riduzione senza scadenza è una rinuncia non dichiarata)" fallisce \
  env CORSIE="$COLLOCAZIONE_CORSIE" TRAGUARDI="$COLLOCAZIONE_TRAGUARDI" TABELLA="$COLLOCAZIONE_TENUTE/tabella-segnalazione-senza-data.tsv" BANCO="$COLLOCAZIONE_BANCO_FITTIZIO" \
  "$RADICE_REPO/scripts/verifica-collocazione-dei-controlli.sh"

esegui_caso "collocazione: prova negativa vuota (regola 3 del README: un controllo che nessuno ha visto fallire non è un controllo)" fallisce \
  env CORSIE="$COLLOCAZIONE_CORSIE" TRAGUARDI="$COLLOCAZIONE_TRAGUARDI" TABELLA="$COLLOCAZIONE_TENUTE/tabella-prova-vuota.tsv" BANCO="$COLLOCAZIONE_BANCO_FITTIZIO" \
  "$RADICE_REPO/scripts/verifica-collocazione-dei-controlli.sh"

esegui_caso "collocazione: prova negativa che cita un caso inesistente (regola 4 del README)" fallisce \
  env CORSIE="$COLLOCAZIONE_CORSIE" TRAGUARDI="$COLLOCAZIONE_TRAGUARDI" TABELLA="$COLLOCAZIONE_TENUTE/tabella-prova-inesistente.tsv" BANCO="$COLLOCAZIONE_BANCO_FITTIZIO" \
  "$RADICE_REPO/scripts/verifica-collocazione-dei-controlli.sh"

esegui_caso "collocazione: fascia non ammessa (regola 1 del README: una fascia fuori dalle quattro dichiarate è quasi sempre un refuso)" fallisce \
  env CORSIE="$COLLOCAZIONE_CORSIE" TRAGUARDI="$COLLOCAZIONE_TRAGUARDI" TABELLA="$COLLOCAZIONE_TENUTE/tabella-fascia-non-ammessa.tsv" BANCO="$COLLOCAZIONE_BANCO_FITTIZIO" \
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
  env CORSIE="$COLLOCAZIONE_CORSIE" TRAGUARDI="$COLLOCAZIONE_TRAGUARDI" TABELLA="$COLLOCAZIONE_TENUTE/tabella-regressione-lettura.tsv" BANCO="$COLLOCAZIONE_BANCO_FITTIZIO" \
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
  env CORSIE="$COLLOCAZIONE_CORSIE" TRAGUARDI="$COLLOCAZIONE_TRAGUARDI" TABELLA="$COLLOCAZIONE_TENUTE/tabella-corsia-non-esegue.tsv" BANCO="$COLLOCAZIONE_BANCO_FITTIZIO" \
  "$RADICE_REPO/scripts/verifica-collocazione-dei-controlli.sh"

esegui_caso "collocazione: la fascia dichiarata non ha alcun flusso (regola 5: una corsia che non esiste non esegue niente)" fallisce \
  env CORSIE="$COLLOCAZIONE_CORSIE" TRAGUARDI="$COLLOCAZIONE_TRAGUARDI" TABELLA="$COLLOCAZIONE_TENUTE/tabella-corsia-senza-flusso.tsv" BANCO="$COLLOCAZIONE_BANCO_FITTIZIO" \
  "$RADICE_REPO/scripts/verifica-collocazione-dei-controlli.sh"

esegui_caso "collocazione: il flusso esiste ma non ha il lavoro dichiarato (regola 5)" fallisce \
  env CORSIE="$COLLOCAZIONE_CORSIE" TRAGUARDI="$COLLOCAZIONE_TRAGUARDI" TABELLA="$COLLOCAZIONE_TENUTE/tabella-lavoro-inesistente.tsv" BANCO="$COLLOCAZIONE_BANCO_FITTIZIO" \
  "$RADICE_REPO/scripts/verifica-collocazione-dei-controlli.sh"

esegui_caso "collocazione: la fascia dichiarata non è quella in cui l'eseguibile vive (regola 5)" fallisce \
  env CORSIE="$COLLOCAZIONE_CORSIE" TRAGUARDI="$COLLOCAZIONE_TRAGUARDI" TABELLA="$COLLOCAZIONE_TENUTE/tabella-fascia-incoerente.tsv" BANCO="$COLLOCAZIONE_BANCO_FITTIZIO" \
  "$RADICE_REPO/scripts/verifica-collocazione-dei-controlli.sh"

esegui_caso "collocazione: bloccante ma «da collocare» (regola 5: chi blocca senza un luogo in cui girare non blocca nulla)" fallisce \
  env CORSIE="$COLLOCAZIONE_CORSIE" TRAGUARDI="$COLLOCAZIONE_TRAGUARDI" TABELLA="$COLLOCAZIONE_TENUTE/tabella-bloccante-da-collocare.tsv" BANCO="$COLLOCAZIONE_BANCO_FITTIZIO" \
  "$RADICE_REPO/scripts/verifica-collocazione-dei-controlli.sh"

esegui_caso "collocazione: «da collocare» oltre la data di esigibilità (regola 5)" fallisce \
  env OGGI=2026-08-26 CORSIE="$COLLOCAZIONE_CORSIE" TRAGUARDI="$COLLOCAZIONE_TRAGUARDI" TABELLA="$COLLOCAZIONE_TENUTE/tabella-da-collocare-scaduta.tsv" BANCO="$COLLOCAZIONE_BANCO_FITTIZIO" \
  "$RADICE_REPO/scripts/verifica-collocazione-dei-controlli.sh"

esegui_caso "collocazione: «da collocare» entro la data dichiarata è debito visibile, non un errore (regola 5)" passa \
  env OGGI=2026-08-26 CORSIE="$COLLOCAZIONE_CORSIE" TRAGUARDI="$COLLOCAZIONE_TRAGUARDI" TABELLA="$COLLOCAZIONE_TENUTE/tabella-da-collocare-in-corso.tsv" BANCO="$COLLOCAZIONE_BANCO_FITTIZIO" \
  "$RADICE_REPO/scripts/verifica-collocazione-dei-controlli.sh"

esegui_caso "collocazione: un controllo che vive in due luoghi con la prima metà nella corsia dichiarata (regola 5, forma «A + B» di G9)" passa \
  env CORSIE="$COLLOCAZIONE_CORSIE" TRAGUARDI="$COLLOCAZIONE_TRAGUARDI" TABELLA="$COLLOCAZIONE_TENUTE/tabella-due-luoghi.tsv" BANCO="$COLLOCAZIONE_BANCO_FITTIZIO" \
  "$RADICE_REPO/scripts/verifica-collocazione-dei-controlli.sh"

# REGOLA 6 - il criterio nella forma «T-NN/M» deve risolvere: «T-NN» deve esistere nel registro
# dei traguardi e avere almeno «M» criteri di completamento numerati. Difetto corretto il 27
# agosto 2026: T01-C8 citava «T-01/8», criterio che riguarda le avvertenze pubbliche e non la
# conformità redazionale che quella riga verifica davvero, e SIG-C1 citava «T-01/5», già di
# T01-C5 per un oggetto diverso (regola 7, sotto). Nessuno dei due era visibile a chi non aprisse
# docs/09_roadmap/02-traguardi.md e contasse. TRAGUARDI punta al registro SINTETICO sopra: «T-09»
# vi ha due criteri numerati, «T-10» esiste ma non ne ha alcuno.

esegui_caso "collocazione: il criterio non risolve, il traguardo non esiste nel registro (regola 6)" fallisce \
  env CORSIE="$COLLOCAZIONE_CORSIE" TRAGUARDI="$COLLOCAZIONE_TRAGUARDI" TABELLA="$COLLOCAZIONE_TENUTE/tabella-criterio-inesistente.tsv" BANCO="$COLLOCAZIONE_BANCO_FITTIZIO" \
  "$RADICE_REPO/scripts/verifica-collocazione-dei-controlli.sh"

esegui_caso "collocazione: il criterio non risolve, il traguardo esiste ma non ha quel numero di criteri (regola 6)" fallisce \
  env CORSIE="$COLLOCAZIONE_CORSIE" TRAGUARDI="$COLLOCAZIONE_TRAGUARDI" TABELLA="$COLLOCAZIONE_TENUTE/tabella-criterio-numero-eccede.tsv" BANCO="$COLLOCAZIONE_BANCO_FITTIZIO" \
  "$RADICE_REPO/scripts/verifica-collocazione-dei-controlli.sh"

esegui_caso "collocazione: il criterio non risolve, il traguardo esiste ma non ha alcun criterio numerato (regola 6)" fallisce \
  env CORSIE="$COLLOCAZIONE_CORSIE" TRAGUARDI="$COLLOCAZIONE_TRAGUARDI" TABELLA="$COLLOCAZIONE_TENUTE/tabella-criterio-traguardo-senza-criteri.tsv" BANCO="$COLLOCAZIONE_BANCO_FITTIZIO" \
  "$RADICE_REPO/scripts/verifica-collocazione-dei-controlli.sh"

# REGOLA 7 - un criterio datato («T-NN/M») citato da due righe diverse è un errore SALVO che il
# criterio sia dichiarato collettivo in pipeline/criteri-collettivi.tsv.
#
# La prima formulazione di questa regola, il 27 agosto 2026, vietava il duplicato senza eccezioni,
# ed era una generalizzazione da due soli casi. Applicata al repository reale segnalava diciannove
# righe legittime: i criteri T-03/2 e T-03/4 ENUMERANO PIU' CONTROLLI NEL PROPRIO TESTO, e la forma
# «A + B» non li rappresenta perché ammette una fascia sola mentre quei controlli stanno in fasce
# diverse. La regola è stata riscritta invece di essere disattivata, e l'eccezione vive in un file
# versionato e non in una lista dentro lo script (voce D-10 del runbook).
#
# I quattro casi sotto provano le quattro combinazioni che contano: duplicato non dichiarato (deve
# fallire), duplicato dichiarato (deve passare), «N/D» ripetuto (deve passare, o la regola punirebbe
# precisamente la dichiarazione onesta che RD-C1, CR-C1 e SIG-C1 fanno nella tabella reale), e
# dichiarazione assente (deve uscire 2, che è errore d'uso e non violazione: senza quel file la
# regola non sa e non deve indovinare).

esegui_caso "collocazione: lo stesso criterio T-NN/M citato da due righe, e non è dichiarato collettivo (regola 7)" fallisce \
  env CORSIE="$COLLOCAZIONE_CORSIE" TRAGUARDI="$COLLOCAZIONE_TRAGUARDI" TABELLA="$COLLOCAZIONE_TENUTE/tabella-criterio-duplicato.tsv" BANCO="$COLLOCAZIONE_BANCO_FITTIZIO" CRITERI_COLLETTIVI="$COLLOCAZIONE_TENUTE/collettivi-vuoto.tsv" \
  "$RADICE_REPO/scripts/verifica-collocazione-dei-controlli.sh"

esegui_caso "collocazione: lo stesso criterio citato da due righe, ma dichiarato collettivo (regola 7, il caso di T-03/2)" passa \
  env CORSIE="$COLLOCAZIONE_CORSIE" TRAGUARDI="$COLLOCAZIONE_TRAGUARDI" TABELLA="$COLLOCAZIONE_TENUTE/tabella-criterio-duplicato.tsv" BANCO="$COLLOCAZIONE_BANCO_FITTIZIO" CRITERI_COLLETTIVI="$COLLOCAZIONE_TENUTE/collettivi-t09-1.tsv" \
  "$RADICE_REPO/scripts/verifica-collocazione-dei-controlli.sh"

esegui_caso "collocazione: due righe «N/D» non fanno scattare la regola 7 (N/D non è un criterio numerato)" passa \
  env CORSIE="$COLLOCAZIONE_CORSIE" TRAGUARDI="$COLLOCAZIONE_TRAGUARDI" TABELLA="$COLLOCAZIONE_TENUTE/tabella-criterio-nd-non-duplicato.tsv" BANCO="$COLLOCAZIONE_BANCO_FITTIZIO" CRITERI_COLLETTIVI="$COLLOCAZIONE_TENUTE/collettivi-vuoto.tsv" \
  "$RADICE_REPO/scripts/verifica-collocazione-dei-controlli.sh"

# Questo caso NON usa «fallisce»: quell'attesa accetta qualunque uscita diversa da zero e
# confonderebbe l'errore d'uso con la violazione. Verifica il codice esatto.
# La regola 5 accetta anche «.py» dal 27 agosto 2026, perche' il criterio 6 di T-03 e' presidiato
# per meta' da un generatore Python. La forma nuova non deve pero' essere una porta aperta: un
# eseguibile che nessuna corsia nomina resta un errore, qualunque sia il suo linguaggio.
esegui_caso "collocazione: un eseguibile «.py» che nessuna corsia nomina resta un errore (regola 5)" fallisce \
  env CORSIE="$COLLOCAZIONE_CORSIE" TRAGUARDI="$COLLOCAZIONE_TRAGUARDI" TABELLA="$COLLOCAZIONE_TENUTE/tabella-py-non-eseguito.tsv" BANCO="$COLLOCAZIONE_BANCO_FITTIZIO" CRITERI_COLLETTIVI="$COLLOCAZIONE_TENUTE/collettivi-vuoto.tsv" \
  "$RADICE_REPO/scripts/verifica-collocazione-dei-controlli.sh"

esegui_caso "collocazione: dichiarazione dei criteri collettivi assente - esce 2, errore d'uso e non violazione (regola 7)" passa \
  bash -c 'env CORSIE="$1" TRAGUARDI="$2" TABELLA="$3" BANCO="$4" CRITERI_COLLETTIVI=/percorso/che/non/esiste.tsv "$5" >/dev/null 2>&1; [ $? -eq 2 ]' _ \
  "$COLLOCAZIONE_CORSIE" "$COLLOCAZIONE_TRAGUARDI" "$COLLOCAZIONE_TENUTE/tabella-valida.tsv" "$COLLOCAZIONE_BANCO_FITTIZIO" "$RADICE_REPO/scripts/verifica-collocazione-dei-controlli.sh"

printf '\n== Controllo 6bis - G1, ricerca di segreti (gitleaks) ==\n\n'

# PERCHE' QUESTO BLOCCO ESISTE. G1 e' l'unico controllo obbligatorio eseguito da un'AZIONE DI
# TERZE PARTI, gitleaks/gitleaks-action. Per questo la sua riga in
# pipeline/collocazione-dei-controlli.tsv aveva la colonna «prova_negativa» VUOTA, e faceva
# fallire da sola il controllo di collocazione: la regola 3 esige che ogni controllo bloccante sia
# provato, e non ammette eccezioni. Era l'unico errore rimasto in quella tabella, ed era
# strutturale solo finche' nessuno provava a chiuderlo.
#
# Si chiude cosi': il collaudo non guasta l'azione - non si puo' - ma guasta il REPOSITORY, che e'
# cio' che il controllo deve vedere. Un repository sintetico con un segreto dentro deve far uscire
# gitleaks diverso da zero; lo stesso repository senza deve farlo uscire zero. E' la stessa
# tecnica dei Controlli 3-6, applicata a un binario invece che a uno script.
#
# LA CHIAVE SINTETICA SI COMPONE PER FRAMMENTI e non compare mai per intero in questo file.
# Scritta intera, gitleaks la troverebbe in questo stesso banco e il controllo vero fallirebbe sul
# repository a causa della propria tenuta di collaudo: e' il difetto D-15 del runbook, gia'
# pagato una volta con la tenuta delle terminologie. Il valore usato e' quello che la
# documentazione pubblica di AWS impiega da anni come esempio: non e' una credenziale, e non lo e'
# mai stata.
GITLEAKS="${GITLEAKS:-$(command -v gitleaks || true)}"

_repo_con_segreto() {
  local dir="$1" con_segreto="$2" prefisso corpo
  git -C "$dir" init -q -b main
  git -C "$dir" config user.name "Collaudo Sintetico"
  git -C "$dir" config user.email "collaudo@example.invalid"
  printf 'contenuto innocuo\n' > "$dir/nota.txt"
  if [ "$con_segreto" = "si" ]; then
    # Il marcatore di chiave privata si compone per frammenti: scritto intero, gitleaks lo
    # troverebbe in QUESTO file e il controllo vero fallirebbe sul repository a causa della
    # propria tenuta - difetto D-15. Il corpo dice da se' di essere finto, e non e' una chiave:
    # non deriva da alcuna coppia, non apre nulla, e non e' mai esistita.
    local apri chiudi
    apri="-----BEGIN RSA PRIVATE"" KEY-----"
    chiudi="-----END RSA PRIVATE"" KEY-----"
    {
      printf '%s\n' "$apri"
      printf 'QUESTAxNONxExUNAxCHIAVExMAxSOLOxUNAxTENUTAxDIxCOLLAUDOxSINTETICAxxxxxxxx\n'
      printf 'NONxDERIVAxDAxALCUNAxCOPPIAxNONxAPRExNULLAxNONxExMAIxESISTITAxxxxxxxxxx\n'
      printf '%s\n' "$chiudi"
    } > "$dir/chiave-fittizia.pem"
  fi
  git -C "$dir" add -A
  git -C "$dir" commit -q -m "chore: tenuta sintetica" --no-gpg-sign
}

_gitleaks_su_repo() {
  local con_segreto="$1" d uscita
  d=$(mktemp -d) || return 1
  _repo_con_segreto "$d" "$con_segreto" >/dev/null 2>&1
  "$GITLEAKS" detect --source "$d" --no-banner --redact >/dev/null 2>&1
  uscita=$?
  rm -rf "$d"
  return "$uscita"
}

g1_repo_con_segreto_fallisce() { set +e; trap 'set -e' RETURN; _gitleaks_su_repo si; }
g1_repo_pulito_passa()        { set +e; trap 'set -e' RETURN; _gitleaks_su_repo no; }

if [ -n "$GITLEAKS" ] && [ -x "$GITLEAKS" ]; then
  esegui_caso "segreti: un repository con una credenziale sintetica fa uscire gitleaks diverso da zero" fallisce \
    g1_repo_con_segreto_fallisce
  esegui_caso "segreti: lo stesso repository senza la credenziale fa uscire gitleaks zero" passa \
    g1_repo_pulito_passa
else
  printf '\033[33m· gitleaks non disponibile: i due casi di G1 sono SALTATI, non superati.\n'
  printf '  Indica il binario con GITLEAKS, oppure installalo. In pipeline il lavoro che esegue\n'
  printf '  questo banco lo installa, quindi i due casi girano davvero.\033[0m\n'
fi

printf '\n== Controllo 7bis - verifica-dco.sh (Developer Certificate of Origin su ogni commit) ==\n\n'

# Il controllo legge la CRONOLOGIA git, non file: le tenute sono quindi repository sintetici
# costruiti al volo sotto una directory temporanea, con identita' fittizia impostata localmente
# (mai globalmente) e nessun contenuto reale. Stessa tecnica dei Controlli 3-6.
_repo_dco() {
  local dir="$1" con_dco="$2"
  git -C "$dir" init -q -b main
  git -C "$dir" config user.name "Collaudo Sintetico"
  git -C "$dir" config user.email "collaudo@example.invalid"
  git -C "$dir" config commit.gpgsign false
  printf 'base\n' > "$dir/f.txt"
  git -C "$dir" add f.txt
  git -C "$dir" commit -q -m "chore: commit di base" --no-gpg-sign
  printf 'seguito\n' >> "$dir/f.txt"
  git -C "$dir" add f.txt
  if [ "$con_dco" = "si" ]; then
    git -C "$dir" commit -q -s -m "chore: commit con DCO" --no-gpg-sign
  else
    git -C "$dir" commit -q -m "chore: commit senza DCO" --no-gpg-sign
  fi
}

verifica_dco_con_marcatore_passa() {
  local d uscita; set +e; trap 'set -e' RETURN
  d=$(mktemp -d) || return 1
  _repo_dco "$d" si >/dev/null 2>&1
  env REPO="$d" INTERVALLO="HEAD~1..HEAD" bash "$RADICE_REPO/scripts/verifica-dco.sh" >/dev/null 2>&1
  uscita=$?; rm -rf "$d"; return "$uscita"
}

verifica_dco_senza_marcatore_fallisce() {
  local d uscita; set +e; trap 'set -e' RETURN
  d=$(mktemp -d) || return 1
  _repo_dco "$d" no >/dev/null 2>&1
  env REPO="$d" INTERVALLO="HEAD~1..HEAD" bash "$RADICE_REPO/scripts/verifica-dco.sh" >/dev/null 2>&1
  uscita=$?; rm -rf "$d"; return "$uscita"
}

verifica_dco_intervallo_vuoto_passa() {
  local d uscita; set +e; trap 'set -e' RETURN
  d=$(mktemp -d) || return 1
  _repo_dco "$d" si >/dev/null 2>&1
  env REPO="$d" INTERVALLO="HEAD..HEAD" bash "$RADICE_REPO/scripts/verifica-dco.sh" >/dev/null 2>&1
  uscita=$?; rm -rf "$d"; return "$uscita"
}

esegui_caso "dco: il commit porta il Signed-off-by" passa \
  verifica_dco_con_marcatore_passa

esegui_caso "dco: il commit non porta il Signed-off-by" fallisce \
  verifica_dco_senza_marcatore_fallisce

esegui_caso "dco: intervallo vuoto, controllo corretto a insieme vuoto" passa \
  verifica_dco_intervallo_vuoto_passa

# Uscita 2 e non 1: l'errore d'uso si distingue dalla violazione, ed e' la convenzione del
# progetto. esegui_caso conosce solo «passa» e «fallisce», quindi la distinzione la fa la
# funzione, come gia' per il Controllo 8.
verifica_dco_intervallo_non_risolvibile_esce_2() {
  local uscita; set +e; trap 'set -e' RETURN
  env INTERVALLO="ramo-che-non-esiste..HEAD" bash "$RADICE_REPO/scripts/verifica-dco.sh" >/dev/null 2>&1
  uscita=$?
  [ "$uscita" -eq 2 ] && return 1 || return 0
}

esegui_caso "dco: intervallo non risolvibile, uscita 2 e non 1" fallisce \
  verifica_dco_intervallo_non_risolvibile_esce_2

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

printf '\n== Controllo 9 - verifica-conformita-redazionale.sh (CR-C1: frontmatter e rinvii relativi) ==\n\n'

# Lo script collaudato promette tre cose nel suo commento di testa, ma implementa solo DUE
# controlli che corrispondono a CR-C1 come descritto in pipeline/collocazione-dei-controlli.tsv
# («formule di conformità vietate, rinvii relativi che escono da docs/, frontmatter»):
#   1. frontmatter YAML non quotato con due punti seguiti da spazio (la trappola in CLAUDE.md);
#   2. rinvii relativi che escono da docs/ (l'altra trappola in CLAUDE.md).
# Il TERZO controllo presente nello script (segnaposto di segreti) non è ciò che CR-C1 descrive:
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

# --- Esclusione derivata da git. Stessa tecnica, stessa motivazione della sezione omonima dei
# --- controlli 20 e 21: un albero git VERO costruito al volo, con un .gitignore proprio, non una
# --- tenuta statica sotto scripts/prove/tenute/dati/.
dati_git_ignorato_passa() {
  local sandbox uscita
  set +e
  trap 'set -e' RETURN
  sandbox=$(mktemp -d) || return 1
  git -C "$sandbox" init -q -b main >/dev/null 2>&1
  printf 'graphify-out/\n' > "$sandbox/.gitignore"
  mkdir -p "$sandbox/graphify-out/cache"
  # documento.md e' TRACCIATO e pulito: senza di esso l'insieme esaminato si svuoterebbe e il
  # caso passerebbe per la ragione sbagliata - l'insieme vuoto, non l'esclusione.
  printf 'Documento tracciato, senza alcun recapito.\n' > "$sandbox/documento.md"
  printf 'Contatto del paziente: mario.rossi@libero.it\n' \
    > "$sandbox/graphify-out/cache/stat-index.json"
  env RADICE_SORGENTI="$sandbox" "$SCRIPT_DATI_SINTETICI" >/dev/null 2>&1
  uscita=$?
  rm -rf "$sandbox"
  return "$uscita"
}

esegui_caso "dati sintetici: recapito reale dentro un file ignorato da git, deve passare" passa \
  dati_git_ignorato_passa

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
# La nota che stava qui dichiarava che «indeterminabile» e «incompatibile» erano strutturalmente
# la stessa riga di codice, e che una mutazione li faceva cadere insieme. Dal 26 agosto 2026 non
# e' piu' vero, ed e' un miglioramento: sono due rami distinti perche' sono due cose distinte.
# «incompatibile» e' un giudizio ACCERTATO e blocca sempre; «indeterminabile» e' l'ASSENZA di un
# giudizio e segnala fino al 30 novembre 2026, data di T-10, il primo rilascio installabile -
# perche' una licenza vincola quando si distribuisce, e prima di quel giorno il progetto non
# distribuisce nulla. E' cio' che pipeline/README-COMPONENTI.md gia' dichiarava e che il
# controllo non faceva: una divergenza fra il formato dichiarato e il controllo che lo fa
# rispettare, chiusa a favore del formato.
#
# OGGI e' fissato su entrambi i casi, per la ragione di sempre: un caso che passa oggi e fallisce
# fra tre mesi non e' un caso, e' una bomba a orologeria.
esegui_caso "registro componenti: licenza indeterminabile prima della data, segnala e non blocca" passa \
  env OGGI=2026-08-26 RADICE_SORGENTI="$REGISTRO_COMPONENTI_TENUTE/licenza-indeterminabile" \
      SBOM_FILE="$REGISTRO_COMPONENTI_TENUTE/licenza-indeterminabile/sbom.json" \
  "$SCRIPT_REGISTRO_COMPONENTI"

esegui_caso "registro componenti: licenza indeterminabile dopo la data, blocca" fallisce \
  env OGGI=2026-12-01 RADICE_SORGENTI="$REGISTRO_COMPONENTI_TENUTE/licenza-indeterminabile" \
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

# REGOLA 6, E IL FALSO NEGATIVO CHE L'HA RESA NECESSARIA. Il 27 agosto 2026 cinque voci nuove sono
# entrate nel runbook riusando sigle gia' in uso (da D-27 a D-31): chi le ha scritte ha letto la
# coda del file e ha continuato a numerare da li'. Il controllo ha dichiarato «57 voci, tutte
# presenti» - non poteva accorgersene, perche' confronta INSIEMI di sigle e un doppione appartiene
# all'insieme come l'originale. Il danno non e' redazionale: la voce nuova risulta gia' registrata e
# gia' presidiata dal presidio di quella vecchia, che non la riguarda, ed e' la copertura dichiarata
# e inesistente della voce D-6. Il caso asserisce sull'uscita E sul messaggio, come i due sopra: un
# rilievo con uscita 1 non va confuso con uno schianto.
verifica_registro_difetti_sigla_ripetuta_uscita_1_messaggio_specifico() {
  local uscita testo
  set +e
  trap 'set -e' RETURN
  testo=$(env REGISTRO_DIFETTI="$REGISTRO_DIFETTI_TENUTE/registro-valido.tsv" \
    RUNBOOK="$REGISTRO_DIFETTI_TENUTE/runbook-sintetico-sigla-ripetuta.md" VOCI_CANONICHE_FILE="" \
    BANCO="$BANCO_FITTIZIO_DIFETTI" RADICE_CONTROLLI="$REGISTRO_DIFETTI_TENUTE" \
    "$RADICE_REPO/scripts/verifica-registro-dei-difetti.sh" 2>&1)
  uscita=$?
  [ "$uscita" -eq 1 ] || return 1
  printf '%s' "$testo" | grep -qF 'Sigla ripetuta fra i titoli'
}

esegui_caso "registro-difetti: una sigla ripetuta fra i titoli del runbook, uscita 1 e messaggio specifico" passa \
  verifica_registro_difetti_sigla_ripetuta_uscita_1_messaggio_specifico

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

# --- Esclusione derivata da git. Stessa tecnica, stessa motivazione della sezione omonima del
# --- controllo dei trattini piu' sotto: un albero git VERO costruito al volo, con un .gitignore
# --- proprio, non una tenuta statica.
termini_git_ignorato_passa() {
  local sandbox uscita
  set +e
  trap 'set -e' RETURN
  sandbox=$(mktemp -d) || return 1
  git -C "$sandbox" init -q -b main >/dev/null 2>&1
  printf 'graphify-out/\n' > "$sandbox/.gitignore"
  mkdir -p "$sandbox/graphify-out"
  # documento.md e' TRACCIATO e pulito: senza di esso l'insieme esaminato si svuoterebbe e il
  # caso passerebbe per la ragione sbagliata - l'insieme vuoto, non l'esclusione.
  printf 'Documento tracciato, senza alcun nome commerciale.\n' > "$sandbox/documento.md"
  printf '# Report generato\n\nUn estremo di prova su https://gestionale-fittizio-eta.cloud/fhir/r4.\n' \
    > "$sandbox/graphify-out/GRAPH_REPORT.md"
  env RADICE_SORGENTI="$sandbox" "$TERMINI_CONTROLLO" >/dev/null 2>&1
  uscita=$?
  rm -rf "$sandbox"
  return "$uscita"
}

esegui_caso "termini vietati: dominio non ammesso dentro un file ignorato da git, deve passare" passa \
  termini_git_ignorato_passa

# --- Convenzione tipografica dei trattini: scripts/verifica-trattini.sh. ---
#
# Tre caratteri, due dei quali sorvegliati: il medio (U+2013) e' ammesso SOLO fra due cifre, il
# lungo (U+2014) e' vietato sempre. Fino al 26 agosto 2026 nessun controllo ne guardava nemmeno
# uno, e il medio era arrivato a 920 occorrenze in 138 file.
#
# Le tenute stanno sotto scripts/prove/tenute/trattini/ e ciascuna isola UN SOLO ramo del
# controllo: la tenuta del medio non contiene alcun lungo, e quella del lungo non contiene alcun
# medio. E' la condizione che rende utile la prova di mutazione della voce D-9 - si neutralizza
# la chiamata che produce il rilievo in un ramo e deve cadere quel caso soltanto.
#
# La tenuta del medio contiene DUE forme in un solo file - lettere a ridosso e spazi a ridosso -
# di proposito: sono le due vie con cui il carattere entra nel corpus, quasi sempre per
# copia-e-incolla da un PDF normativo, e tenerle in un caso solo mantiene l'isolamento del ramo.

TRATTINI_TENUTE="$TENUTE/trattini"
TRATTINI_CONTROLLO="$RADICE_REPO/scripts/verifica-trattini.sh"

esegui_caso "trattini: tenuta valida, ogni trattino al posto giusto, deve passare" passa \
  env RADICE_SORGENTI="$TRATTINI_TENUTE/valida" "$TRATTINI_CONTROLLO"

# Il complemento del caso negativo, e vale quanto lui: un controllo che segnalasse OGNI trattino
# medio sarebbe rumore, e verrebbe spento entro la settimana. Questa tenuta contiene solo
# intervalli numerici legittimi - clausole, articoli, paragrafi, pagine - e il controllo deve
# tacere su tutti.
esegui_caso "trattini: trattino medio fra cifre in un intervallo numerico, deve passare" passa \
  env RADICE_SORGENTI="$TRATTINI_TENUTE/medio-fra-cifre" "$TRATTINI_CONTROLLO"

esegui_caso "trattini: trattino medio fuori da un intervallo fra cifre" fallisce \
  env RADICE_SORGENTI="$TRATTINI_TENUTE/medio-fuori-intervallo" "$TRATTINI_CONTROLLO"

esegui_caso "trattini: trattino lungo, vietato in ogni ruolo" fallisce \
  env RADICE_SORGENTI="$TRATTINI_TENUTE/lungo" "$TRATTINI_CONTROLLO"

# --- Esclusione derivata da git: un percorso che git ignora non e' nel repository, e questo
# --- controllo non deve piu' esaminarlo. Le due tenute sotto sono ALBERI GIT VERI, costruiti al
# --- volo con "git init" e un .gitignore proprio - non le tenute statiche di sopra - perche' solo
# --- un albero di lavoro vero prova la regola e non il ripiego. Il trattino lungo non compare mai
# --- in forma letterale in questo file, per la stessa disciplina della voce D-15 del runbook: si
# --- compone dai suoi byte UTF-8 con printf, e si scrive per intero solo dentro la cartella
# --- temporanea, mai qui.
trattini_git_ignorato_passa() {
  local sandbox uscita lungo
  set +e
  trap 'set -e' RETURN
  sandbox=$(mktemp -d) || return 1
  git -C "$sandbox" init -q -b main >/dev/null 2>&1
  printf 'graphify-out/\n' > "$sandbox/.gitignore"
  mkdir -p "$sandbox/graphify-out"
  lungo=$(printf '\xe2\x80\x94')
  # documento.md e' TRACCIATO e pulito: senza di esso l'insieme esaminato si svuoterebbe e il
  # caso passerebbe per la ragione sbagliata - l'insieme vuoto, non l'esclusione - come ammonisce
  # la voce D-9 del runbook a proposito delle prove che non isolano cio' che dichiarano di provare.
  printf 'Documento tracciato, senza alcun trattino scorretto.\n' > "$sandbox/documento.md"
  printf 'Un intervallo scritto in modo scorretto: gennaio%smarzo\n' "$lungo" \
    > "$sandbox/graphify-out/nota.md"
  env RADICE_SORGENTI="$sandbox" "$TRATTINI_CONTROLLO" >/dev/null 2>&1
  uscita=$?
  rm -rf "$sandbox"
  return "$uscita"
}

esegui_caso "trattini: trattino lungo dentro un file ignorato da git, deve passare" passa \
  trattini_git_ignorato_passa

# Il complemento, e vale quanto lui: la STESSA forma scorretta, fuori dalla cartella ignorata,
# deve continuare a far fallire il controllo. Senza questo caso la prova non distinguerebbe
# «esclude i file ignorati da git» da «non guarda piu' niente».
trattini_git_non_ignorato_fallisce() {
  local sandbox uscita lungo
  set +e
  trap 'set -e' RETURN
  sandbox=$(mktemp -d) || return 1
  git -C "$sandbox" init -q -b main >/dev/null 2>&1
  printf 'graphify-out/\n' > "$sandbox/.gitignore"
  lungo=$(printf '\xe2\x80\x94')
  printf 'Un intervallo scritto in modo scorretto: gennaio%smarzo\n' "$lungo" \
    > "$sandbox/nota.md"
  env RADICE_SORGENTI="$sandbox" "$TRATTINI_CONTROLLO" >/dev/null 2>&1
  uscita=$?
  rm -rf "$sandbox"
  return "$uscita"
}

esegui_caso "trattini: stesso trattino lungo, file NON ignorato da git, deve fallire" fallisce \
  trattini_git_non_ignorato_fallisce

# Un'asserzione sul solo codice di uscita non basterebbe: il controllo usa 1 per il RILIEVO e 2 per
# l'ERRORE D'USO, e sono cose diverse. Una radice inesistente che uscisse 1 dichiarerebbe una
# violazione che nessuno ha commesso; che uscisse 0 sarebbe un verde privo di significato, ed e' il
# modo piu' silenzioso in cui un controllo smette di controllare. Stesso schema gia' in uso per
# verifica-termini-vietati.sh.
trattini_uscita_due_con_messaggio() {   # $1 = frammento atteso; il resto = assegnazioni d'ambiente
  local atteso="$1" uscita testo
  shift
  set +e
  trap 'set -e' RETURN
  testo=$(env "$@" "$TRATTINI_CONTROLLO" 2>&1)
  uscita=$?
  [ "$uscita" -eq 2 ] || return 1
  printf '%s' "$testo" | grep -qF "$atteso"
}

esegui_caso "trattini: radice inesistente, uscita 2 e messaggio specifico" passa \
  trattini_uscita_due_con_messaggio "Radice da esaminare inesistente" \
  RADICE_SORGENTI="$TRATTINI_TENUTE/questa-radice-non-esiste"

trattini_argomento_rifiutato() {
  local uscita testo
  set +e
  trap 'set -e' RETURN
  testo=$("$TRATTINI_CONTROLLO" --questo-argomento-non-esiste 2>&1)
  uscita=$?
  [ "$uscita" -eq 2 ] || return 1
  printf '%s' "$testo" | grep -qF 'non accetta argomenti'
}

esegui_caso "trattini: argomento sulla riga di comando, uscita 2 e messaggio specifico" passa \
  trattini_argomento_rifiutato

# Insieme vuoto: nessun file di testo sotto la radice indicata. E' un esito CORRETTO e non un
# guasto, ma va provato, perche' la via piu' silenziosa con cui un controllo smette di controllare
# e' che l'insieme dei file esaminati si svuoti senza che nessuno lo noti. La tenuta non puo'
# essere statica: git non versiona una directory vuota, e un file segnaposto la renderebbe non
# vuota. Si costruisce percio' al momento dell'esecuzione, fuori dall'albero versionato.
trattini_insieme_vuoto() {
  local sandbox uscita
  set +e
  trap 'set -e' RETURN
  sandbox=$(mktemp -d) || return 1
  env RADICE_SORGENTI="$sandbox" "$TRATTINI_CONTROLLO" >/dev/null 2>&1
  uscita=$?
  rm -rf "$sandbox"
  return "$uscita"
}

esegui_caso "trattini: nessun file di testo sotto la radice, insieme vuoto, deve passare" passa \
  trattini_insieme_vuoto

printf '\n== Controllo 22 - verifica-registri-di-vincoli-e-questioni.sh (le sigle citate risolvono) ==\n\n'

# Le tenute sono sette alberi minimi sotto scripts/prove/tenute/registri-sigle, ciascuno con
# una bacheca sintetica, la propria proiezione, un capitolo italiano e uno inglese, e una
# traduzione sintetica. Il controllo non contiene alcun elenco di sigle: le definite le legge
# dai registri, le citate dal corpus, le tradotte dal file di traduzione. Perche' la prova
# valga, le sigle delle tenute sono sintetiche - V-01, V-02, Q-01 in una bacheca che dichiara
# di non essere quella del progetto - e nessuna tenuta si trova sotto docs, che e' il corpus
# che il controllo esamina in esercizio.

SIGLE_TENUTE="$RADICE_REPO/scripts/prove/tenute/registri-sigle"
SIGLE_GENERATORE="$RADICE_REPO/scripts/genera-registri-di-vincoli-e-questioni.py"

sigle_caso() {  # $1 = nome della tenuta
  env REPO="$SIGLE_TENUTE/$1" CORPUS_IT="docs" CORPUS_EN="en" GENERATORE="$SIGLE_GENERATORE" \
    FONDANTI_IT="docs/11_registri/03-vincoli-fondanti.md" \
    FONDANTI_EN="en/11_registri/03-vincoli-fondanti.md" \
    "$RADICE_REPO/scripts/verifica-registri-di-vincoli-e-questioni.sh"
}

esegui_caso "sigle: bacheca, proiezione e corpus coerenti, deve passare" passa \
  sigle_caso valido

esegui_caso "sigle: la fonte e' cambiata e la proiezione e' rimasta ferma" fallisce \
  sigle_caso proiezione-vecchia

esegui_caso "sigle: il corpus cita una sigla che nessun registro definisce" fallisce \
  sigle_caso sigla-orfana

esegui_caso "sigle: una sola delle due lingue cita una sigla" fallisce \
  sigle_caso lingue-divergenti

esegui_caso "sigle: la bacheca ha una riga senza colonna di stato, la proiezione si rifiuta" fallisce \
  sigle_caso bacheca-malformata

esegui_caso "sigle: una sigla definita nei registri non ha traduzione inglese" fallisce \
  sigle_caso traduzione-mancante

esegui_caso "sigle: la traduzione nomina una sigla che nessun registro definisce" fallisce \
  sigle_caso traduzione-orfana

# I registri veri del progetto: il controllo deve passare sul repository, non solo sulle tenute.
# E' la distinzione fra banco e cancello - un banco verde non dice che i cancelli siano verdi.
# I QUATTRO CASI CHE SEGUONO CHIUDONO LA VOCE D-22 DEL RUNBOOK. I sei vincoli fondanti erano
# citati duecento volte e dichiarati in nessun file pubblicato; sono stati pubblicati il 27 agosto
# 2026, e la voce registrava per iscritto che il presidio NON li copriva, perche' le altre regole
# cercano la forma «V-<numero>» col trattino e i fondanti si scrivono senza.
#
# IL CASO «settimo» E' QUELLO CHE PROVA LA PROPRIETA' CHE CONTA: l'elenco dei vincoli ammessi si
# LEGGE dal capitolo che li dichiara e non e' scritto nel controllo (D-10). Aggiungerne uno al
# capitolo lo rende citabile senza toccare una riga di codice; se il numero sei fosse cablato,
# questo caso fallirebbe.
#
# IL CASO «falso positivo» E' UN DIFETTO REALE, NON UN'IPOTESI: la prima stesura leggeva «VXU_V04»
# - un tipo di messaggio HL7 v2 presente nel corpus - come citazione del vincolo V04, e produceva
# due rilievi su un repository conforme.
esegui_caso "vincoli fondanti: il corpus cita un vincolo che il capitolo non dichiara" fallisce \
  sigle_caso fondante-orfano

esegui_caso "vincoli fondanti: il capitolo che li dichiara non esiste" fallisce \
  sigle_caso fondanti-assenti

esegui_caso "vincoli fondanti: un settimo vincolo dichiarato e citato - l'elenco si legge, non si cabla" passa \
  sigle_caso fondante-settimo

esegui_caso "vincoli fondanti: un tipo di messaggio con sottolineatura non e' una citazione" passa \
  sigle_caso fondante-falso-positivo

esegui_caso "sigle: il repository reale supera il controllo" passa \
  "$RADICE_REPO/scripts/verifica-registri-di-vincoli-e-questioni.sh"

printf '\n== Controllo 23 - verifica-date-di-marcatura.sh (criterio 8 di T-01 e criterio 5 di T-14) ==\n\n'

# PERCHE' QUESTO BLOCCO ESISTE, E CHE COSA HA GIA' COLTO.
#
# Fino al 27 agosto 2026 nessuno script del repository falliva se un documento pubblico affermava
# una data di marcatura. La tabella di collocazione faceva credere il contrario (voce D-24 del
# runbook). Il controllo nasce qui, e il banco lo ha subito ripagato: alla PRIMA esecuzione sulle
# tenute il controllo passava anche su quelle deliberatamente non conformi, perche' i confini di
# parola erano scritti con «\b», sintassi PCRE che gawk non riconosce. Ogni alternativa della
# famiglia temporale ne conteneva uno, quindi nessuna corrispondeva mai: il controllo era verde
# sempre. Nessuna lettura del codice se n'era accorta.
#
# Le tenute stanno in scripts/prove/tenute/date-di-marcatura/. Ciascun caso ha il proprio elenco,
# perche' e' l'elenco a dire al controllo che cosa guardare: puntarlo su una tenuta senza toccare
# pipeline/documenti-senza-data-di-marcatura.tsv e' possibile solo cosi' (voce D-17).

DATE_TENUTE="$TENUTE/date-di-marcatura"

date_caso() {
  env DOCUMENTI_SENZA_DATA="$DATE_TENUTE/elenco-$1.tsv" \
    "$RADICE_REPO/scripts/verifica-date-di-marcatura.sh"
}

esegui_caso "date di marcatura: documento conforme - nomina la marcatura e non porta riferimenti temporali" passa \
  date_caso conforme

esegui_caso "date di marcatura: una data nello stesso capoverso della marcatura" fallisce \
  date_caso con-data

esegui_caso "date di marcatura: un mese in inglese, senza anno, nello stesso capoverso" fallisce \
  date_caso con-mese

# L'unica eccezione che il §11 ammette: il capoverso che ENUNCIA il divieto deve nominare sia la
# marcatura sia la forma temporale, o non enuncerebbe nulla.
esegui_caso "date di marcatura: l'enunciato del divieto si dichiara con il marcatore e la sua ragione" passa \
  date_caso marcatore-con-ragione

esegui_caso "date di marcatura: marcatore senza ragione - un'esenzione senza motivo non è un'esenzione" fallisce \
  date_caso marcatore-nudo

# Il numero di un atto normativo non e' una data: «Regolamento (UE) 2017/745» contiene «2017», e
# alla prima esecuzione sul repository reale undici rilievi su quindici erano esattamente questo.
esegui_caso "date di marcatura: il numero di un atto normativo non è un riferimento temporale" passa \
  date_caso numero-di-atto

esegui_caso "date di marcatura: l'elenco nomina un documento che non esiste" fallisce \
  date_caso documento-assente

# Errore d'uso, non violazione: senza l'elenco il controllo non sa che cosa guardare e non lo
# indovina. L'attesa «fallisce» accetterebbe qualunque uscita diversa da zero: qui si verifica il 2.
esegui_caso "date di marcatura: elenco assente - esce 2, errore d'uso e non violazione" passa \
  bash -c 'env DOCUMENTI_SENZA_DATA=/percorso/che/non/esiste.tsv "$1" >/dev/null 2>&1; [ $? -eq 2 ]' _ \
  "$RADICE_REPO/scripts/verifica-date-di-marcatura.sh"

# Il repository reale: un banco verde non dice che i cancelli siano verdi.
esegui_caso "date di marcatura: il repository reale supera il controllo" passa \
  "$RADICE_REPO/scripts/verifica-date-di-marcatura.sh"

printf '\n== Controllo 24 - genera-registro-componenti.py (criterio 6 di T-03, prima metà) ==\n\n'

# PERCHE' QUESTO BLOCCO ESISTE. Il criterio 6 di T-03 chiede due cose e ne esisteva una: il
# confronto fra distinta e annotazioni (G5, Controllo 7). Mancava il registro come artefatto
# GENERATO, che e' l'unico dei tre oggetti a rispondere alla domanda di chi installa - che cosa sto
# installando, con quale licenza, e chi ce l'ha messo.
#
# CHE COSA IL BANCO HA GIA' COLTO. Alla prima esecuzione sulla distinta reale il generatore ha
# dichiarato «0 dipendenze dirette, 1236 transitive». E' falso - sono 9 e 1227 - e sarebbe passato
# inosservato, perche' un aggregato sbagliato ha lo stesso aspetto di un aggregato giusto. La causa:
# il grafo di CycloneDX si percorre su «bom-ref», che identifica il NODO DELL'ALBERO e porta il
# percorso, non su «purl», che identifica il PACCHETTO. Lo stesso pacchetto tirato da due percorsi
# ha un purl e due bom-ref. Il caso «distingue diretta da transitiva» esiste per questo.

RC_TENUTE="$TENUTE/registro-componenti"

rc_caso() {
  local distinta="$1" uscita
  uscita=$(mktemp -d)
  env ANNOTAZIONI_COMPONENTI="$RC_TENUTE/annotazioni.tsv" \
    python3 "$RADICE_REPO/scripts/genera-registro-componenti.py" "$RC_TENUTE/$distinta" "$uscita"
  local esito=$?
  rm -rf "$uscita"
  return $esito
}

esegui_caso "registro dei componenti: distinta valida, il registro si genera" passa \
  rc_caso distinta-valida.json

# Il caso che coglie il difetto della prima stesura: non basta che il registro si generi, deve
# distinguere cio' che il progetto ha scelto da cio' che qualcun altro gli ha tirato dentro.
esegui_caso "registro dei componenti: distingue la dipendenza diretta dalla transitiva" passa \
  bash -c '
    uscita=$(mktemp -d)
    env ANNOTAZIONI_COMPONENTI="$1/annotazioni.tsv" python3 "$2" "$1/distinta-valida.json" "$uscita" >/dev/null 2>&1 || { rm -rf "$uscita"; exit 1; }
    reg="$uscita/componenti-di-terze-parti.tsv"
    d=$(grep -c "^prova-diretta	1.0.0.*	diretta	" "$reg" || true)
    tr=$(grep -c "^prova-transitiva	2.0.0.*	transitiva	" "$reg" || true)
    rm -rf "$uscita"
    [ "$d" = "1" ] && [ "$tr" = "1" ]
  ' _ "$RC_TENUTE" "$RADICE_REPO/scripts/genera-registro-componenti.py"

esegui_caso "registro dei componenti: la distinta non esiste - esce 2, errore d'uso" passa \
  bash -c 'env ANNOTAZIONI_COMPONENTI="$1/annotazioni.tsv" python3 "$2" "$1/distinta-che-non-esiste.json" "$(mktemp -d)" >/dev/null 2>&1; [ $? -eq 2 ]' \
  _ "$RC_TENUTE" "$RADICE_REPO/scripts/genera-registro-componenti.py"

esegui_caso "registro dei componenti: distinta senza componenti - una distinta vuota non è un registro vuoto" fallisce \
  rc_caso distinta-senza-componenti.json

esegui_caso "registro dei componenti: metadata senza «bom-ref» - il grafo non è percorribile" fallisce \
  rc_caso distinta-senza-bom-ref.json

printf '\n== Controllo 25 - verifica-coerenza-delle-date.sh (le tre copie della stessa data) ==\n\n'

# PERCHE' QUESTO BLOCCO ESISTE. Il 27 agosto 2026 la ritaratura del calendario ha spostato T-03 e
# T-07 dal 26 settembre al 5 settembre. Ha toccato le SCHEDE dei traguardi e non le altre due
# rappresentazioni della stessa data - il diagramma di Gantt e la tabella di sintesi del paragrafo
# 7.1 - in ENTRAMBE le lingue. Per un giorno il capitolo ha detto due date diverse di sé stesso, e
# nessuno dei ventiquattro controlli allora esistenti se ne e' accorto, perche' nessuno guardava
# la coerenza interna di un documento con sé stesso. E' la voce D-28 del runbook degli errori.
#
# LE TENUTE NON SONO IL CAPITOLO VERO. Sono capitoli minimi con tre traguardi fittizi (T-91, T-92,
# T-93), per la ragione gia' imparata altrove: un caso di prova che legge il repository reale cade
# quando il repository cambia per motivi che non hanno nulla a che vedere con il controllo.

CD_TENUTE="$TENUTE/coerenza-date"

cd_caso() {
  local it="$1" en="${2:-traguardi-en-coerente.md}"
  env TRAGUARDI_IT="$CD_TENUTE/$it" TRAGUARDI_EN="$CD_TENUTE/$en" \
    bash "$RADICE_REPO/scripts/verifica-coerenza-delle-date.sh"
}

esegui_caso "coerenza delle date: le tre rappresentazioni concordano" passa \
  cd_caso traguardi-it-coerente.md

esegui_caso "coerenza delle date: il diagramma dissente dalla scheda" fallisce \
  cd_caso traguardi-it-gantt-divergente.md

esegui_caso "coerenza delle date: la tabella di sintesi dissente dalla scheda" fallisce \
  cd_caso traguardi-it-tabella-divergente.md

# Una data di calendario nella scheda senza barra nel diagramma non e' un'omissione innocua: il
# quadro d'insieme e' il solo punto in cui si legge la catena, e un traguardo assente dal quadro
# non ha una posizione nella catena.
esegui_caso "coerenza delle date: traguardo datato e assente dal diagramma" fallisce \
  cd_caso traguardi-it-gantt-mancante.md

esegui_caso "coerenza delle date: l'inglese dissente dall'italiano" fallisce \
  cd_caso traguardi-it-coerente.md traguardi-en-divergente.md

# Una scheda senza data di calendario - «2027», «successiva al congelamento» - non e' confrontabile
# e viene saltata. Il salto e' DICHIARATO a ogni esecuzione: un salto silenzioso e' indistinguibile
# da una verifica riuscita, ed e' il difetto che questo caso presidia.
esegui_caso "coerenza delle date: la data non di calendario e' saltata, e il salto e' dichiarato" passa \
  bash -c '
    uscita=$(env TRAGUARDI_IT="$1/traguardi-it-coerente.md" TRAGUARDI_EN="$1/traguardi-en-coerente.md" \
      bash "$2" 2>&1) || exit 1
    printf "%s" "$uscita" | grep -q "T-93"
  ' _ "$CD_TENUTE" "$RADICE_REPO/scripts/verifica-coerenza-delle-date.sh"

esegui_caso "coerenza delle date: capitolo dei traguardi assente - esce 2, errore d'uso" passa \
  bash -c 'env TRAGUARDI_IT="$1/non-esiste.md" TRAGUARDI_EN="$1/traguardi-en-coerente.md" bash "$2" >/dev/null 2>&1; [ $? -eq 2 ]' \
  _ "$CD_TENUTE" "$RADICE_REPO/scripts/verifica-coerenza-delle-date.sh"

esegui_caso "coerenza delle date: capitolo senza schede - esce 2, non 0" passa \
  bash -c 'env TRAGUARDI_IT="$1/traguardi-it-senza-schede.md" TRAGUARDI_EN="$1/traguardi-en-coerente.md" bash "$2" >/dev/null 2>&1; [ $? -eq 2 ]' \
  _ "$CD_TENUTE" "$RADICE_REPO/scripts/verifica-coerenza-delle-date.sh"

printf '\n== Controllo 26 - verifica-registro-di-velocity.sh (il registro accorda con la roadmap) ==\n\n'

# PERCHE' QUESTO BLOCCO ESISTE. registro/velocity-dei-traguardi.tsv misura due cose che la roadmap
# da sola non dice: la velocita' reale, e lo scarto sistematico fra previsione e realta'. Serve a
# nulla se diverge dal capitolo che descrive - un registro che dicesse una data e la roadmap
# un'altra darebbe l'apparenza di una misura a un'affermazione non verificata.
#
# IL CASO «motivo vuoto» HA OTTO COLONNE, DELIBERATAMENTE. La prima stesura di quella tenuta ne
# aveva nove, e il controllo la respingeva per il conteggio delle colonne senza mai arrivare alla
# regola sul motivo: un caso che passa per la ragione sbagliata non prova nulla.

VEL_TENUTE="$TENUTE/velocity"

vel_caso() {
  env VELOCITY="$VEL_TENUTE/$1" TRAGUARDI_IT="$VEL_TENUTE/traguardi.md" \
    bash "$RADICE_REPO/scripts/verifica-registro-di-velocity.sh"
}

esegui_caso "velocita': il registro accorda con il capitolo dei traguardi" passa \
  vel_caso velocity-coerente.tsv

esegui_caso "velocita': l'ultimo evento dissente dalla data della scheda" fallisce \
  vel_caso velocity-data-divergente.tsv

esegui_caso "velocita': un traguardo dichiarato chiuso e senza evento di chiusura" fallisce \
  vel_caso velocity-chiusura-non-registrata.tsv

# Un anticipo per lavoro svolto e un anticipo per misura hanno lo stesso aspetto nei numeri, e la
# differenza sta tutta nella colonna «motivo». Senza motivo il registro non registra: annota.
esegui_caso "velocita': un evento di ritaratura senza motivo" fallisce \
  vel_caso velocity-motivo-vuoto.tsv

esegui_caso "velocita': un evento dopo la chiusura - un traguardo chiuso non si ritara" fallisce \
  vel_caso velocity-dopo-la-chiusura.tsv

# L'evento «misurato» registra un avanzamento dei criteri SENZA spostare la data: senza di esso il
# registro misurerebbe solo le date, e la velocita' - quanti criteri si chiudono per giornata - non
# sarebbe leggibile, che e' la meta' del motivo per cui il registro esiste.
esegui_caso "velocita': un evento di misura senza spostamento di data" passa \
  vel_caso velocity-con-misura.tsv

esegui_caso "velocita': un traguardo che esiste nel registro e non nel capitolo" fallisce \
  vel_caso velocity-traguardo-fantasma.tsv

esegui_caso "velocita': un valore di evento non ammesso" fallisce \
  vel_caso velocity-evento-non-ammesso.tsv

esegui_caso "velocita': un traguardo datato e senza alcun evento nel registro" fallisce \
  vel_caso velocity-traguardo-scoperto.tsv

esegui_caso "velocita': registro senza eventi - esce 2, errore d'uso" passa \
  bash -c 'env VELOCITY="$1/velocity-senza-eventi.tsv" TRAGUARDI_IT="$1/traguardi.md" bash "$2" >/dev/null 2>&1; [ $? -eq 2 ]' \
  _ "$VEL_TENUTE" "$RADICE_REPO/scripts/verifica-registro-di-velocity.sh"

printf '\n== Controllo 27 - verifica-lettura-dei-tsv.sh (la voce C-1 diventa un cancello) ==\n\n'

# PERCHE' QUESTO BLOCCO ESISTE, ed e' la ragione piu' istruttiva del banco. La regola C-1 - «i
# campi di un file separato da tabulazioni si estraggono per posizione con cut -f, mai con read» -
# era scritta nel runbook dal 26 agosto 2026, con tre commenti di avvertimento sparsi in tre
# script. Il 27 agosto e' stata RIVIOLATA dallo stesso repository che l'aveva scritta, in due
# script nuovi, e nello stesso momento e' emerso che la correzione del 26 agosto aveva lasciato in
# piedi una seconda occorrenza nello script gia' corretto - latente, perche' nessuna riga del
# registro aveva ancora la casella vuota che l'avrebbe fatta cadere.
#
# La tenuta «commento» esiste per la sola distinzione che il controllo deve fare e che una ricerca
# testuale ingenua sbaglierebbe: una riga che NOMINA la forma vietata per spiegarla non la usa.

LT_TENUTE="$TENUTE/lettura-tsv"

lt_caso() {
  env RADICE_SCRIPT="$LT_TENUTE/$1" bash "$RADICE_REPO/scripts/verifica-lettura-dei-tsv.sh"
}

esegui_caso "lettura dei tsv: uno script che estrae per posizione con cut" passa \
  lt_caso conforme

esegui_caso "lettura dei tsv: uno script che legge con read" fallisce \
  lt_caso violazione

esegui_caso "lettura dei tsv: un commento che nomina la forma vietata non la usa" passa \
  lt_caso commento

esegui_caso "lettura dei tsv: nessuno script da esaminare - esce 2, non 0" passa \
  bash -c 'env RADICE_SCRIPT="$1/vuota" bash "$2" >/dev/null 2>&1; [ $? -eq 2 ]' \
  _ "$LT_TENUTE" "$RADICE_REPO/scripts/verifica-lettura-dei-tsv.sh"

esegui_caso "lettura dei tsv: cartella inesistente - esce 2, errore d'uso" passa \
  bash -c 'env RADICE_SCRIPT="$1/non-esiste" bash "$2" >/dev/null 2>&1; [ $? -eq 2 ]' \
  _ "$LT_TENUTE" "$RADICE_REPO/scripts/verifica-lettura-dei-tsv.sh"

printf '\n== Controllo 28 - verifica-rinvii-testuali.sh (criterio 7 di T-02) ==\n\n'

# PERCHE' QUESTO BLOCCO ESISTE. Il criterio 7 di T-02 chiede che i rinvii all'area di conformita'
# scritti come testo diventino collegamenti. La ragione vera non e' la comodita' del lettore: un
# rinvio testuale NON E' VERIFICABILE. Un collegamento rotto lo trova la costruzione del sito, che
# ha i quattro parametri onBroken* a 'throw'; un percorso dentro un frammento di codice non lo
# guarda nessuno, e resta corretto solo finche' nessuno rinomina il file.
#
# CHE COSA LA CONVERSIONE HA TROVATO IL 27 AGOSTO 2026. Trentasette rinvii della traduzione inglese
# citavano nomi di file TRADOTTI - «docs/00_overview/02-the-four-services.md» - mentre il
# repository non traduce i nomi dei file. Puntavano tutti al nulla, ed erano invisibili perche'
# erano testo. Convertirli in collegamenti li ha resi verificabili, e la verifica li ha bocciati
# nello stesso minuto.
#
# I DUE CASI CHE CONTANO SONO QUELLI CHE NON DEVONO SCATTARE. La regola distingue un rinvio da un
# argomento di comando guardando se il percorso occupa TUTTO il frammento di codice o solo una
# parte: «git log -1 --format=%H -- docs/…» non e' un rinvio. Senza quella distinzione il controllo
# chiederebbe di trasformare in collegamento un pezzo di riga di comando.

RT_TENUTE="$TENUTE/rinvii-testuali"

rt_caso() {
  env RADICI_CORPUS="$RT_TENUTE/$1" bash "$RADICE_REPO/scripts/verifica-rinvii-testuali.sh"
}

esegui_caso "rinvii testuali: un rinvio scritto come collegamento" passa \
  rt_caso conforme/docs

esegui_caso "rinvii testuali: un rinvio scritto come testo" fallisce \
  rt_caso violazione/docs

esegui_caso "rinvii testuali: un percorso argomento di un comando non è un rinvio" passa \
  rt_caso comando/docs

esegui_caso "rinvii testuali: dentro un blocco di codice recintato non è un rinvio" passa \
  rt_caso recinto/docs

esegui_caso "rinvii testuali: nessun documento da esaminare - esce 2, non 0" passa \
  bash -c 'env RADICI_CORPUS="$1/vuota" bash "$2" >/dev/null 2>&1; [ $? -eq 2 ]' \
  _ "$RT_TENUTE" "$RADICE_REPO/scripts/verifica-rinvii-testuali.sh"

esegui_caso "rinvii testuali: radice inesistente - esce 2, errore d'uso" passa \
  bash -c 'env RADICI_CORPUS="$1/non-esiste" bash "$2" >/dev/null 2>&1; [ $? -eq 2 ]' \
  _ "$RT_TENUTE" "$RADICE_REPO/scripts/verifica-rinvii-testuali.sh"

printf '\n== Controllo 29 - verifica-marcature-non-verificate.sh (criterio 3 di T-02) ==\n\n'

# PERCHE' QUESTO BLOCCO ESISTE. Nove dei tredici indici di area dichiarano la STESSA regola con
# parole proprie: una marcatura di non verificato porta l'indicazione di a chi va chiesta la
# verifica. «Non si inventa», scrive l'area di sicurezza. La regola non e' stata inventata dal
# controllo: e' stata LETTA nel corpus, dove era gia' unanime, e le mancava solo il presidio.
#
# IL CASO «capoverso» ESISTE PER UN DIFETTO REALE DELLA PRIMA STESURA. Il controllo contava per
# RIGA, e un destinatario scritto nella riga successiva a quella che porta la marcatura gli
# sfuggiva: le marcature con destinatario risultavano 52 invece di 137. Non e' un dettaglio di
# implementazione - e' la differenza fra accusare il corpus di 451 mancanze e di 366, e un
# controllo che accusa in eccesso perde credito esattamente come uno che tace.

MNV_TENUTE="$TENUTE/marcature-non-verificate"

mnv_caso() {
  env RADICE_CORPUS="$MNV_TENUTE/$1" BLOCCANTE_DAL="${2:-2020-01-01}" \
    bash "$RADICE_REPO/scripts/verifica-marcature-non-verificate.sh"
}

esegui_caso "marcature non verificate: ogni marcatura dichiara il destinatario" passa \
  mnv_caso con-destinatario

esegui_caso "marcature non verificate: una marcatura priva di destinatario" fallisce \
  mnv_caso senza-destinatario

esegui_caso "marcature non verificate: il destinatario nella riga successiva dello stesso capoverso" passa \
  mnv_caso capoverso

# In sola segnalazione il controllo misura e NON blocca: il criterio 4 di T-03 esige che quella
# condizione sia dichiarata con una data, mai indefinita, e il banco verifica che la data conti.
esegui_caso "marcature non verificate: in sola misura non blocca, e lo dichiara" passa \
  bash -c '
    uscita=$(env RADICE_CORPUS="$1/senza-destinatario" BLOCCANTE_DAL=2099-01-01 bash "$2" 2>&1) || exit 1
    printf "%s" "$uscita" | grep -q "2099-01-01"
  ' _ "$MNV_TENUTE" "$RADICE_REPO/scripts/verifica-marcature-non-verificate.sh"

# I DUE CASI CHE SEGUONO DISTINGUONO UNA MARCATURA NOMINATA DA UNA MARCATURA POSTA. «Chiude il
# [NV] che quest'area portava» parla DI una marcatura e non ne pone una: non potra' MAI ricevere un
# destinatario, quindi senza questa distinzione resterebbe un rilievo per sempre e il criterio 3 di
# T-02 non si chiuderebbe nemmeno con il corpus interamente bonificato. Sono quattordici occorrenze
# su cinquecento, misurate il 27 agosto 2026: e' la loro permanenza a contare, non il loro numero.
# Il secondo caso e' quello che si dimentica: sottrarre le nominate e fermarsi li' renderebbe
# invisibile ogni marcatura posta ACCANTO a una citazione, che e' un difetto peggiore di quello che
# la sottrazione corregge.
esegui_caso "marcature non verificate: una marcatura NOMINATA non chiede un destinatario" passa \
  mnv_caso nominata

esegui_caso "marcature non verificate: nominata e posta nello stesso capoverso - la posta si vede" fallisce \
  mnv_caso nominata-e-posta

# I DUE CASI CHE SEGUONO PROTEGGONO UNA DISTINZIONE, non una forma. Il 27 agosto 2026 le formule
# riconosciute sono state allargate LEGGENDOLE nel corpus e contandole: «spetta a» 30 volte,
# «richiesta a» 37, «da chiedere a» 29, «a cura di» 20. Quattro forme in uso quotidiano che il
# controllo non vedeva, e le marcature che le usavano risultavano prive di destinatario pur
# avendone uno leggibile da chiunque.
#
# LA FAMIGLIA PIU' NUMEROSA E' STATA SCARTATA, ed e' il caso che conta. «Va verificato» compare 36
# volte ed e' la formula piu' frequente del corpus, ma NON NOMINA NESSUNO: dice che cosa fare, non
# a chi tocca. Riconoscerla avrebbe alzato il conteggio delle marcature conformi di oltre settanta
# unita' senza che una sola dichiari chi deve chiudere la lacuna - un controllo che si compiace.
# Si riconoscono soltanto le forme che reggono un complemento di destinazione.
esegui_caso "marcature non verificate: «va verificato» dice che cosa, non a chi - va segnalata" fallisce \
  mnv_caso dice-cosa-non-chi

esegui_caso "marcature non verificate: le quattro forme piu' usate dal corpus reggono un destinatario" passa \
  mnv_caso forme-lette-nel-corpus

# QUESTO CASO NASCE DA UN FALSO NEGATIVO RIPRODOTTO, non sospettato. Le formule erano state
# misurate nel corpus con grep in minuscolo, e l'espressione fu scritta su quella forma: ogni
# formula a INIZIO DI PERIODO o a inizio di CELLA DI TABELLA restava invisibile. Ventisei
# occorrenze reali il 27 agosto 2026, e fra queste tre marcature che indirizzavano esplicitamente
# a un ente nominato. Il banco precedente non poteva vederlo, perche' le sue tenute erano state
# scritte dallo stesso autore e sulla stessa forma dell'espressione: e' la ragione per cui un
# banco verde non dimostra che il controllo copra la regola, ma solo che faccia cio' che l'autore
# intendeva.
esegui_caso "marcature non verificate: la formula a inizio di periodo e di cella si riconosce" passa \
  mnv_caso iniziale-maiuscola

# I TRE CASI CHE SEGUONO VENGONO DA UNA REVISIONE INDIPENDENTE, condotta il 27 agosto 2026 con il
# mandato formulato al negativo - «trova un caso che dovrebbe segnalare e non segnala» - da chi non
# aveva scritto il controllo. Il banco era verde con oltre 270 casi. La revisione ha riprodotto due
# falsi negativi, ed e' la voce D-31 del runbook vista in azione: un banco verde prova che il
# controllo fa cio' che l'autore intendeva, mai che l'intenzione copra la regola.
#
# PRIMO. «Destinatario» era in DEST come parola nuda - l'unica alternativa priva di preposizione,
# verbo o apice inverso - e in questo dominio e' parola d'uso corrente per tutt'altro: destinatario
# di un flusso, di un documento, della disciplina. Due capoversi REALI del corpus passavano per
# conformi perche' la parola compariva per un motivo estraneo alla marcatura. La tenuta e' uno dei
# due, trascritto quasi alla lettera: dice «vanno verificate sul testo consolidato», cioe' proprio
# la famiglia che il controllo dichiara di scartare perche' nomina il CHE COSA e non il CHI.
esegui_caso "marcature non verificate: «destinatario» come parola comune non e' un destinatario" fallisce \
  mnv_caso destinatario-parola-nuda

# SECONDO. La forma DEFINITORIA e' l'altra meta' della distinzione fra marcatura nominata e
# marcatura posta: «`[NV]` segnala un'informazione non verificata» DEFINISCE il marcatore invece di
# porlo, ed e' il modo in cui tredici indici di area e il glossario dichiarano la convenzione. Come
# la nominata, non potra' mai ricevere un destinatario. La tenuta ne porta tre forme - il verbo di
# definizione, la riga di glossario, il titolo di sezione - e il controllo non deve contarne
# nessuna, ne' fra le conformi ne' fra le mancanti: contarle fra le conformi sarebbe peggio, perche'
# gonfierebbe il numero che dichiara il lavoro fatto.
esegui_caso "marcature non verificate: un capoverso che DEFINISCE il marcatore non ne pone uno" passa \
  mnv_caso definizione-non-marcatura

# TERZO. Una riga fatta del solo «>» separa due paragrafi dentro una citazione, e una riga di
# recinto apre o chiude un blocco di codice: per chi legge sono confini evidenti, per l'espressione
# «riga vuota» non lo erano, perche' contengono un carattere. Senza la regola, il destinatario
# dichiarato nel primo paragrafo copriva la marcatura scoperta del secondo. La tenuta porta
# entrambi i confini e due marcature scoperte, una per confine.
# Le due tenute sono SEPARATE e ciascuna porta UNA SOLA marcatura: la prima stesura ne aveva una
# sola con due marcature, e non discriminava - senza la regola restava comunque una marcatura
# scoperta, quindi il controllo usciva 1 lo stesso e la mutazione non faceva cadere il caso. E' la
# voce D-9 del runbook: una mutazione che non cambia l'esito non prova la regola. Cosi' come sono,
# ciascuna esce 1 con la regola e 0 senza.
esegui_caso "marcature non verificate: due paragrafi della stessa citazione sono due capoversi" fallisce \
  mnv_caso confine-citazione

esegui_caso "marcature non verificate: un recinto di codice separa i capoversi" fallisce \
  mnv_caso confine-recinto

esegui_caso "marcature non verificate: radice inesistente - esce 2, errore d'uso" passa \
  bash -c 'env RADICE_CORPUS="$1/non-esiste" bash "$2" >/dev/null 2>&1; [ $? -eq 2 ]' \
  _ "$MNV_TENUTE" "$RADICE_REPO/scripts/verifica-marcature-non-verificate.sh"

printf '\n== Controllo 29-bis - genera-capitoli-dei-registri.py, conversione dei rinvii ==\n\n'

# PERCHE' QUESTO CASO ESISTE, ED E' LA VOCE D-32 DEL RUNBOOK. Il 27 agosto 2026 centoventi rinvii
# testuali erano stati convertiti in collegamenti DENTRO i due capitoli generati di 11_registri.
# La rigenerazione della sera li ha annullati tutti in un colpo solo: la bonifica era stata
# applicata al PRODOTTO invece che al GENERATORE, e un file generato non ha memoria di cio' che
# qualcuno gli ha scritto sopra. La conversione ora vive in collega_rinvii() dentro il generatore,
# e questo caso cade se qualcuno la riporta fuori.
#
# IL CASO PROVA ANCHE IL CONFINE, che e' la meta' che si dimentica: un percorso che occupa solo
# PARTE di un tratto di codice - «git log --follow docs/...» - e' un argomento di comando e deve
# restare com'e'. Un generatore che collegasse anche quello produrrebbe un comando non eseguibile.

RG_TENUTE="$TENUTE/registri-generati"

esegui_caso "registri generati: un rinvio testuale esce come collegamento, un comando resta comando" passa \
  bash -c '
    radice=$(mktemp -d)
    cp -r "$1/registro" "$1/docs" "$radice/"
    env REGISTRI_RADICE="$radice" python3 "$2" >/dev/null 2>&1 || { rm -rf "$radice"; exit 1; }
    prodotto="$radice/docs/11_registri/01-vincoli-in-vigore.md"
    esito=0
    grep -q "\[\`docs/01_technical/01-stack-e-motivazioni.md\`\](../01_technical/01-stack-e-motivazioni.md)" "$prodotto" || esito=1
    grep -q "git log --follow docs/01_technical/01-stack-e-motivazioni.md" "$prodotto" || esito=1
    rm -rf "$radice"
    exit $esito
  ' _ "$RG_TENUTE" "$RADICE_REPO/scripts/genera-capitoli-dei-registri.py"

printf '\n== Controllo 30 - verifica-bacheca.sh (criterio 4 di T-02, entrambe le meta' "'" ') ==\n\n'

# PERCHE' QUESTO BLOCCO ESISTE. Una questione senza destinatario non e' una questione aperta: e'
# un'osservazione. Nessuno la chiudera', perche' nessuno sa che tocchi a lui. Il costo non e' la
# voce persa - e' che il registro delle questioni aperte, che dovrebbe dire che cosa manca, si
# riempie di righe che non chiedono nulla a nessuno e smette di essere letto.
#
# LA PRIMA META' ERA GIA' SODDISFATTA quando il controllo e' nato - 85 voci aperte, zero senza
# destinatario - e questo e' il caso normale di un presidio che arriva dopo la disciplina, non
# prima: blocca da subito perche' non ha debito da scadenzare.
#
# LA SECONDA META' E' L'OPPOSTO, e i quattro casi che la provano lo mostrano. Quando e' nata,
# ZERO voci su 85 portavano la nota che dichiara perche' restano aperte: e' un presidio che
# arriva prima della disciplina, quindi ha un debito, quindi ha una data - il 10 ottobre 2026,
# scadenza del criterio 4 di T-02. I quattro casi provano le quattro combinazioni che contano:
# nota presente da bloccante (passa), nota assente da bloccante (fallisce), nota assente in sola
# misura (passa, ed e' la condizione di oggi), formula presente e ragione assente da bloccante
# (fallisce). L'ultimo e' quello che si dimentica sempre: un titolo senza testo supera una
# lettura distratta ed e' peggio dell'assenza, perche' chi cerca le voci prive di nota non lo
# trova.
#
# IL CASO «forma rotta» ESISTE PER UN DIFETTO CHE NON SI VEDE LEGGENDO. Una barra verticale dentro
# il testo di una voce spezza la tabella markdown, e le colonne successive scalano: lo stato
# finirebbe nella colonna del testo e il controllo leggerebbe come stato una frase. E' lo stesso
# difetto della voce C-1 - un separatore che compare nel dato - visto su un altro separatore.

BAC_TENUTE="$TENUTE/bacheca"

bac_caso() {
  env BACHECA="$BAC_TENUTE/$1" bash "$RADICE_REPO/scripts/verifica-bacheca.sh"
}

esegui_caso "bacheca: ogni voce aperta ha destinatario e stato" passa \
  bac_caso conforme.md

esegui_caso "bacheca: una voce aperta senza destinatario" fallisce \
  bac_caso senza-destinatario.md

esegui_caso "bacheca: una voce senza stato - non è né aperta né risolta, è illeggibile" fallisce \
  bac_caso senza-stato.md

esegui_caso "bacheca: una barra verticale nel testo spezza la tabella" fallisce \
  bac_caso forma-rotta.md

esegui_caso "bacheca: nessuna voce riconosciuta - esce 2, non 0" passa \
  bash -c 'env BACHECA="$1/senza-questioni.md" bash "$2" >/dev/null 2>&1; [ $? -eq 2 ]' \
  _ "$BAC_TENUTE" "$RADICE_REPO/scripts/verifica-bacheca.sh"

esegui_caso "bacheca: file assente - esce 2, errore d'uso" passa \
  bash -c 'env BACHECA="$1/non-esiste.md" bash "$2" >/dev/null 2>&1; [ $? -eq 2 ]' \
  _ "$BAC_TENUTE" "$RADICE_REPO/scripts/verifica-bacheca.sh"

bac_caso_datato() {
  env BACHECA="$BAC_TENUTE/$1" NOTA_BLOCCANTE_DAL="$2" bash "$RADICE_REPO/scripts/verifica-bacheca.sh"
}

esegui_caso "bacheca: ogni voce aperta dichiara perché resta aperta - passa anche da bloccante" passa \
  bac_caso_datato nota-completa.md 2020-01-01

esegui_caso "bacheca: una voce aperta senza la nota, a controllo bloccante" fallisce \
  bac_caso_datato conforme.md 2020-01-01

esegui_caso "bacheca: la stessa voce senza nota, in sola misura - passa e lo dichiara" passa \
  bac_caso_datato conforme.md 2099-01-01

esegui_caso "bacheca: la formula della nota senza la ragione dietro - un titolo senza testo" fallisce \
  bac_caso_datato nota-vuota.md 2020-01-01


# I DUE CASI CHE SEGUONO DISTINGUONO LO STATO DICHIARATO DALLO STATO RACCONTATO. Il 27 agosto 2026
# la colonna dello stato era interrogata con una semplice ricerca della parola, e due voci su
# centoventitre' ne pagavano il prezzo in versi opposti. Q-156 e' RISOLTA e piu' avanti RACCONTA che
# «la casella dello stato era rimasta `APERTA`»: contata aperta per una parola citata fra apici
# inversi a proposito di una condizione passata, le si chiedeva di dichiarare perche' resta aperta
# una voce che non lo e'. Q-270 e' davvero riaperta ed era contata giusta per il motivo sbagliato,
# perche' «RIAPERTA» CONTIENE «APERTA»: un accordo casuale fra due parole non e' una regola, e
# sarebbe sparito il giorno in cui qualcuno avesse scritto «Riaperta».
esegui_caso "bacheca: la parola «aperta» citata fra apici inversi non e' uno stato" passa \
  bac_caso_datato stato-narrato.md 2020-01-01

esegui_caso "bacheca: una voce RIAPERTA e' aperta, e deve la nota come le altre" fallisce \
  bac_caso_datato stato-riaperta.md 2020-01-01
printf '\n== Controllo 31 - i falsi negativi trovati in revisione il 27 agosto 2026 ==\n\n'

# PERCHE' QUESTO BLOCCO ESISTE, ED E' SEPARATO DAGLI ALTRI. I sei controlli scritti il 27 agosto
# 2026 erano tutti verdi sul repository e tutti provati per mutazione: 248 casi, nessuno rosso. Una
# revisione indipendente, condotta lo stesso giorno con il mandato esplicito di cercare cio' che il
# banco NON aveva colto, ha trovato CINQUE FALSI NEGATIVI riproducibili - casi in cui una
# violazione reale e ben formata viene ignorata e lo script dichiara «conforme» con uscita zero.
#
# Il banco non li aveva colti perche' le tenute erano state scritte da chi aveva scritto i
# controlli, e riproducevano la forma che i controlli si aspettavano. E' il limite strutturale di
# una prova costruita dallo stesso autore, e la contromisura non e' scrivere piu' casi: e' far
# cercare i casi a qualcuno che non ha scritto il codice.
#
# I casi stanno qui e non nei blocchi dei rispettivi controlli deliberatamente: raggruppati, dicono
# che classe di errore rappresentano - la forma legittima ma diversa da quella prevista - e
# ricordano di cercarla per ogni controllo nuovo.

FN_TENUTE="$TENUTE"

# --- 1. La scheda di un traguardo scritta con il mese abbreviato ---
# La libreria riconosceva i mesi per esteso nella scheda e le abbreviazioni nella tabella. Una
# scheda «1 ago. 2026» contro un diagramma che finiva il 1 settembre - un mese intero di
# divergenza - finiva fra i SALTATI, e il controllo diceva «coerenti».
esegui_caso "falsi negativi: scheda con mese abbreviato, la divergenza si vede" fallisce \
  bash -c 'env TRAGUARDI_IT="$1/coerenza-date/traguardi-it-mese-abbreviato.md" TRAGUARDI_EN="$1/coerenza-date/traguardi-en-coerente.md" bash "$2"' \
  _ "$FN_TENUTE" "$RADICE_REPO/scripts/verifica-coerenza-delle-date.sh"

# Un mese inesistente in una data di forma completa non e' una data non di calendario: e' una data
# che il controllo non sa leggere, ed e' una cosa diversa. Confonderle significa saltare in
# silenzio proprio i casi anomali.
esegui_caso "falsi negativi: mese non riconosciuto - illeggibile non è non-calendariale" fallisce \
  bash -c 'env TRAGUARDI_IT="$1/coerenza-date/traguardi-it-mese-illeggibile.md" TRAGUARDI_EN="$1/coerenza-date/traguardi-en-coerente.md" bash "$2"' \
  _ "$FN_TENUTE" "$RADICE_REPO/scripts/verifica-coerenza-delle-date.sh"

# --- 2. IFS impostato lontano da «read» ---
# La prima stesura esigeva IFS e read sulla STESSA riga. Impostare IFS su una riga e leggere sulla
# successiva e' peggio della forma vietata, perche' IFS resta impostato per il resto dello script.
esegui_caso "falsi negativi: IFS su una riga e read su quella dopo" fallisce \
  bash -c 'env RADICE_SCRIPT="$1/lettura-tsv/riga-separata" bash "$2"' \
  _ "$FN_TENUTE" "$RADICE_REPO/scripts/verifica-lettura-dei-tsv.sh"

esegui_caso "falsi negativi: la tabulazione arriva a IFS attraverso una variabile" fallisce \
  bash -c 'env RADICE_SCRIPT="$1/lettura-tsv/indiretta" bash "$2"' \
  _ "$FN_TENUTE" "$RADICE_REPO/scripts/verifica-lettura-dei-tsv.sh"

# --- 3. Recinto di codice aperto indentato e chiuso a colonna 1 ---
# Due difetti in uno: il blocco indentato non veniva saltato, e il suo recinto di chiusura a
# colonna 1 invertiva lo stato per TUTTO IL RESTO DEL FILE, rendendo invisibile ogni rinvio
# successivo. Un elenco numerato con dentro un blocco di comandi e' markdown del tutto ordinario.
esegui_caso "falsi negativi: recinto indentato, i rinvii dopo restano visibili" fallisce \
  bash -c 'env RADICI_CORPUS="$1/rinvii-testuali/recinto-indentato" bash "$2"' \
  _ "$FN_TENUTE" "$RADICE_REPO/scripts/verifica-rinvii-testuali.sh"

# --- 5. Riga di bacheca senza spazi attorno alla sigla ---
# «|Q-99|» e «| Q-99 |» sono resi identici dal markdown. La prima forma era completamente
# invisibile: non contata, non segnalata, non dichiarata fra i salti.
esegui_caso "falsi negativi: riga di bacheca senza spazi attorno alla sigla" fallisce \
  bash -c 'env BACHECA="$1/bacheca/senza-spazi.md" bash "$2"' \
  _ "$FN_TENUTE" "$RADICE_REPO/scripts/verifica-bacheca.sh"

# --- 4. Il limite che NON si corregge, e che il banco documenta invece di nascondere ---
# Questo caso ATTENDE ESITO POSITIVO, e il suo valore sta tutto nel nome. Il controllo delle
# marcature riconosce un destinatario ovunque compaia nel capoverso, anche quando riguarda
# un'altra affermazione: qui il Ministero e' nominato a proposito della classe, non della
# marcatura, e la marcatura viene contata come coperta. Legare un destinatario alla singola
# marcatura richiederebbe di capire il testo e non di leggerlo. Il limite e' dichiarato nel
# commento dello script e nella riga NV-C1; questo caso lo rende OSSERVABILE, cosi' che chi un
# giorno lo correggera' veda il caso cambiare esito invece di doverlo scoprire.
esegui_caso "falsi negativi: LIMITE NOTO - destinatario di un'altra affermazione, contato come coperto" passa \
  bash -c 'env RADICE_CORPUS="$1/marcature-non-verificate/destinatario-di-un-altro" BLOCCANTE_DAL=2020-01-01 bash "$2"' \
  _ "$FN_TENUTE" "$RADICE_REPO/scripts/verifica-marcature-non-verificate.sh"

printf '\n== Controllo 32 - verifica-coerenza-delle-corsie.sh e verifica-pipefail.sh (D-27 e D-30) ==\n\n'

# PERCHE' QUESTO BLOCCO ESISTE. Due voci del runbook erano registrate come DEBITO - descritte,
# capite, e senza alcun controllo che le presidiasse. Entrambe erano presidiabili, ed entrambe
# nascevano da un falso verde reale.
#
# D-27: la fascia di rilascio dichiarava «actions/setup-node@v4» e «node 24.x» mentre le altre due
# dichiaravano «@v5» e «node 22». La corsia che FIRMA costruiva l'artefatto con un interprete
# diverso da quella che PUBBLICA, e nessuno poteva accorgersene perche' quella corsia non era mai
# stata eseguita. Il caso «commento» esiste perche' la misura di quel giorno fu ingannata dai
# commenti appena scritti, che nominavano la versione vecchia per spiegare la correzione.
#
# D-30: «npm run build | tail -25» esce zero anche quando la costruzione fallisce, perche' l'esito
# di una catena e' quello dell'ULTIMO comando. Un falso verde durato un'ora su una costruzione che
# non aveva prodotto affatto la locale inglese. Il caso «libreria» prova la sola eccezione: un file
# non eseguibile e' sorgente per un altro script, le sue catene girano con le impostazioni del
# chiamante, e imporgli un «set» proprio altererebbe l'ambiente di chi lo include.

CO_TENUTE="$TENUTE/coerenza-corsie"
PF_TENUTE="$TENUTE/pipefail"

esegui_caso "corsie: tutte dichiarano le stesse versioni" passa \
  bash -c 'env CORSIE="$1/conforme" bash "$2"' _ "$CO_TENUTE" "$RADICE_REPO/scripts/verifica-coerenza-delle-corsie.sh"

esegui_caso "corsie: una dichiara un'azione e un interprete diversi dalle altre" fallisce \
  bash -c 'env CORSIE="$1/divergente" bash "$2"' _ "$CO_TENUTE" "$RADICE_REPO/scripts/verifica-coerenza-delle-corsie.sh"

esegui_caso "corsie: un commento che nomina la versione vecchia non la dichiara" passa \
  bash -c 'env CORSIE="$1/commento" bash "$2"' _ "$CO_TENUTE" "$RADICE_REPO/scripts/verifica-coerenza-delle-corsie.sh"

esegui_caso "corsie: nessuna dichiarazione di versione - esce 2, non 0" passa \
  bash -c 'env CORSIE="$1/vuota" bash "$2" >/dev/null 2>&1; [ $? -eq 2 ]' \
  _ "$CO_TENUTE" "$RADICE_REPO/scripts/verifica-coerenza-delle-corsie.sh"

esegui_caso "corsie: cartella inesistente - esce 2, errore d'uso" passa \
  bash -c 'env CORSIE="$1/non-esiste" bash "$2" >/dev/null 2>&1; [ $? -eq 2 ]' \
  _ "$CO_TENUTE" "$RADICE_REPO/scripts/verifica-coerenza-delle-corsie.sh"

esegui_caso "pipefail: uno script con catene lo dichiara" passa \
  bash -c 'env RADICE_SCRIPT="$1/conforme" bash "$2"' _ "$PF_TENUTE" "$RADICE_REPO/scripts/verifica-pipefail.sh"

esegui_caso "pipefail: uno script con catene e senza dichiarazione" fallisce \
  bash -c 'env RADICE_SCRIPT="$1/senza" bash "$2"' _ "$PF_TENUTE" "$RADICE_REPO/scripts/verifica-pipefail.sh"

# Uno script senza catene non e' tenuto a dichiarare pipefail: imporglielo sarebbe una regola senza
# oggetto, e le regole senza oggetto insegnano che le regole si possono ignorare.
esegui_caso "pipefail: uno script senza catene non è tenuto a dichiararlo" passa \
  bash -c 'env RADICE_SCRIPT="$1/senza-catene" bash "$2"' _ "$PF_TENUTE" "$RADICE_REPO/scripts/verifica-pipefail.sh"

esegui_caso "pipefail: una libreria non eseguibile, con catene, non è segnalata" passa \
  bash -c 'env RADICE_SCRIPT="$1/libreria" bash "$2"' _ "$PF_TENUTE" "$RADICE_REPO/scripts/verifica-pipefail.sh"

esegui_caso "pipefail: cartella inesistente - esce 2, errore d'uso" passa \
  bash -c 'env RADICE_SCRIPT="$1/non-esiste" bash "$2" >/dev/null 2>&1; [ $? -eq 2 ]' \
  _ "$PF_TENUTE" "$RADICE_REPO/scripts/verifica-pipefail.sh"

printf "\n%d/%d casi con esito conforme all'atteso.\n" "$attese_rispettate" "$totale"

if [ "$esito" -eq 0 ]; then
  printf '\033[32m✓ Banco di prova superato: tutti i controlli si comportano come atteso.\033[0m\n'
else
  printf '\033[31m✗ Banco di prova NON superato: vedi sopra.\033[0m\n'
fi

exit "$esito"
