#!/usr/bin/env bash
# Segnala quando l'italiano e l'inglese hanno smesso di dire la stessa cosa.
#
# Una traduzione non si rompe con un errore: si stacca in silenzio. Qualcuno
# corregge un paragrafo nell'originale, la versione tradotta resta com'era, e
# per mesi nessuno se ne accorge - finché due lettori di lingua diversa non
# arrivano a due conclusioni diverse leggendo lo «stesso» documento. In una
# documentazione che dichiara obblighi regolatori questo non è un fastidio
# editoriale: è una dichiarazione divergente.
#
# Il controllo confronta la data dell'ultima modifica registrata in git per
# ciascun documento e per la sua traduzione. Non verifica il *contenuto* - non
# potrebbe - ma intercetta il caso che conta: l'originale è cambiato dopo la
# traduzione, quindi la traduzione è indietro di sicuro.
set -euo pipefail

cd "$(dirname "$0")/.."

SORGENTE="docs"
TRADOTTO="website/i18n/en/docusaurus-plugin-content-docs/current"

# La differenziazione del controllo - quali aree esigono la traduzione, quali avvertenze pubbliche
# e quali altre dichiarazioni alla radice sono sorvegliate, e con quale forza (bloccante o sola
# segnalazione, con la relativa data) - è il criterio 3 di T-03, testualmente: «La differenziazione
# è versionata in un file di configurazione, non cablata». Fino al 27 agosto 2026 viveva in quattro
# variabili bash proprio in questo punto dello script (AREE_ESIGITE calcolata con un glob,
# AVVERTENZE_PUBBLICHE, DICHIARAZIONI_PUBBLICHE_RADICE e le rispettive date di bloccanza): vive ora
# in pipeline/differenziazione-traduzioni.tsv, dichiarato in
# pipeline/README-DIFFERENZIAZIONE-TRADUZIONI.md, dove sta anche il ragionamento per esteso su
# perché ciascuna area, avvertenza e dichiarazione ha oggi lo stato che ha.
#
# Il percorso è sovrascrivibile con DIFFERENZIAZIONE_TRADUZIONI, con la stessa convenzione già in
# uso altrove (LISTA di verifica-terminologie.sh, TABELLA di verifica-collocazione-dei-controlli.sh):
# esiste per il collaudo, mai come sorgente alternativa in esercizio (voce D-17 del runbook).
#
# QUESTO SCRIPT NON CONTIENE UNA COPIA DI RISERVA (voce D-10 del runbook): se il file manca o non
# è leggibile, il controllo non decide da solo che cosa sorvegliare e non prosegue con valori di
# ripiego cablati - esce 2, la convenzione di questo repository per «il controllo non può nemmeno
# partire» (la stessa di scripts/verifica-terminologie.sh con LISTA).
#
# Era anche la correzione di una trappola già pagata: il vecchio AREE_ESIGITE si calcolava con un
# glob su docs/[0-9]*/, e sotto «set -e» un glob che non trova nulla - il caso delle sandbox del
# banco, che non hanno aree numerate - faceva uscire l'intero script, con nove casi del banco che
# cadevano per una ragione estranea alla divergenza. Leggere righe da un file statico non ha questo
# problema per costruzione: zero righe di un dato tipo producono zero voci, mai un errore di shell.
DIFFERENZIAZIONE_TRADUZIONI="${DIFFERENZIAZIONE_TRADUZIONI:-pipeline/differenziazione-traduzioni.tsv}"

if [ ! -f "$DIFFERENZIAZIONE_TRADUZIONI" ]; then
  printf '\033[31m✗ File di configurazione della differenziazione inesistente: %s\033[0m\n' \
    "$DIFFERENZIAZIONE_TRADUZIONI" >&2
  printf 'Il controllo non può eseguire senza quel file: ripristinalo, oppure indica un percorso\n' >&2
  printf 'diverso con DIFFERENZIAZIONE_TRADUZIONI. Vedi pipeline/README-DIFFERENZIAZIONE-TRADUZIONI.md.\n' >&2
  exit 2
fi
if [ ! -r "$DIFFERENZIAZIONE_TRADUZIONI" ]; then
  printf '\033[31m✗ File di configurazione della differenziazione illeggibile: %s\033[0m\n' \
    "$DIFFERENZIAZIONE_TRADUZIONI" >&2
  printf 'Verifica i permessi del file.\n' >&2
  exit 2
fi

# Estrae il campo N di una riga separata da tabulazione con «cut», non con
# «IFS=$'\t' read -r a b c …»: la tabulazione è per bash un carattere di IFS *bianco*, e due
# tabulazioni consecutive - il caso normale quando «bloccante_dal» è vuoto - vengono fuse in una
# sola, facendo scalare di uno i campi successivi. Stesso accorgimento già in
# scripts/verifica-terminologie.sh e scripts/verifica-collocazione-dei-controlli.sh.
_campo_differenziazione() { printf '%s' "$1" | cut -f"$2"; }

AREE_ESIGITE=""
AVVERTENZE_PUBBLICHE=""
DICHIARAZIONI_PUBBLICHE_RADICE=""
declare -A STATO_RADICE=()
declare -A DATA_RADICE=()

_intestazione_differenziazione_vista=0
while IFS= read -r _riga_diff || [ -n "$_riga_diff" ]; do
  case "$_riga_diff" in ''|'#'*) continue;; esac

  _tipo=$(_campo_differenziazione "$_riga_diff" 1)
  if [ "$_intestazione_differenziazione_vista" -eq 0 ]; then
    if [ "$_tipo" != "tipo" ]; then
      printf '\033[31m✗ intestazione inattesa in %s\033[0m\n' "$DIFFERENZIAZIONE_TRADUZIONI" >&2
      exit 2
    fi
    _intestazione_differenziazione_vista=1
    continue
  fi

  _valore=$(_campo_differenziazione "$_riga_diff" 2)
  _stato=$(_campo_differenziazione "$_riga_diff" 3)
  _bloccante_dal=$(_campo_differenziazione "$_riga_diff" 4)

  if [ -z "$_tipo" ] || [ -z "$_valore" ] || [ -z "$_stato" ]; then
    printf '\033[31m✗ riga malformata in %s: %s\033[0m\n' "$DIFFERENZIAZIONE_TRADUZIONI" "$_riga_diff" >&2
    exit 2
  fi

  case "$_tipo" in
    area)
      case "$_stato" in
        esigita) AREE_ESIGITE="$AREE_ESIGITE $_valore" ;;
        pianificata) : ;;
        *)
          printf '\033[31m✗ stato sconosciuto per l'"'"'area «%s»: «%s»\033[0m\n' "$_valore" "$_stato" >&2
          exit 2
          ;;
      esac
      ;;
    avvertenza_pubblica)
      if [ "$_stato" = "segnalazione" ] && [ -z "$_bloccante_dal" ]; then
        printf '\033[31m✗ «%s» è in segnalazione senza bloccante_dal in %s\033[0m\n' \
          "$_valore" "$DIFFERENZIAZIONE_TRADUZIONI" >&2
        exit 2
      fi
      AVVERTENZE_PUBBLICHE="$AVVERTENZE_PUBBLICHE $_valore"
      STATO_RADICE["avvertenza:$_valore"]="$_stato"
      DATA_RADICE["avvertenza:$_valore"]="$_bloccante_dal"
      ;;
    dichiarazione_pubblica_radice)
      if [ "$_stato" = "segnalazione" ] && [ -z "$_bloccante_dal" ]; then
        printf '\033[31m✗ «%s» è in segnalazione senza bloccante_dal in %s\033[0m\n' \
          "$_valore" "$DIFFERENZIAZIONE_TRADUZIONI" >&2
        exit 2
      fi
      DICHIARAZIONI_PUBBLICHE_RADICE="$DICHIARAZIONI_PUBBLICHE_RADICE $_valore"
      STATO_RADICE["dichiarazione:$_valore"]="$_stato"
      DATA_RADICE["dichiarazione:$_valore"]="$_bloccante_dal"
      ;;
    *)
      printf '\033[31m✗ tipo sconosciuto in %s: «%s»\033[0m\n' "$DIFFERENZIAZIONE_TRADUZIONI" "$_tipo" >&2
      exit 2
      ;;
  esac
done < "$DIFFERENZIAZIONE_TRADUZIONI"

mancanti=0
divergenti=0
allineati=0
avvertenze_assenti=0
avvertenze_bloccanti=0
radice_avvertenze_rilievi=0
radice_avvertenze_bloccanti=0
radice_dichiarazioni_rilievi=0
radice_dichiarazioni_bloccanti=0

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

  # Una traduzione può essere PIÙ RECENTE dell'originale e nondimeno dire meno:
  # basta che chi l'ha scritta si sia fermato a metà senza dichiararlo. È già
  # accaduto - 16-architettura-del-progetto.md è arrivato sul ramo principale con
  # nove sezioni su diciotto, nessun marcatore di continuazione, e la data dalla
  # parte giusta. Il confronto delle date non poteva vederlo e non l'ha visto.
  # Il conteggio dei titoli di secondo livello è grossolano di proposito: non
  # misura la qualità, intercetta l'unica cosa che conta qui, cioè che manchi
  # interamente un pezzo di documento.
  s_src=$(grep -c '^## ' "$src" || true)
  s_dst=$(grep -c '^## ' "$dst" || true)
  if [ "$s_src" -ne "$s_dst" ]; then
    printf '\033[31m✗ divergenza strutturale: %s - %s sezioni in italiano, %s in inglese\033[0m\n' \
      "$rel" "$s_src" "$s_dst"
    divergenti=$((divergenti+1))
    continue
  fi

  # git log ESCE CON SUCCESSO restituendo una riga vuota quando il file non è
  # ancora tracciato: «|| echo 0» non scatta, e il confronto sotto riceve una
  # stringa vuota invece di un numero. Il valore predefinito si impone dopo.
  t_src=$(git log -1 --format=%ct -- "$src" 2>/dev/null)
  t_dst=$(git log -1 --format=%ct -- "$dst" 2>/dev/null)
  [ -n "$t_src" ] || t_src=0
  [ -n "$t_dst" ] || t_dst=0

  if [ "$t_src" -gt "$t_dst" ] && [ "$t_dst" -ne 0 ]; then
    # Non tutte le modifiche all'originale toccano il contenuto. Un refuso corretto, un'elisione
    # sistemata, una frase resa più scorrevole: l'italiano cambia e la traduzione resta vera. La
    # dottrina finora era «si tocca comunque il file tradotto, così la relazione resta vera» - ma
    # un controllo che obbliga a modifiche vuote insegna a farne, e una modifica vuota è
    # indistinguibile da una vera per chiunque legga la cronologia dopo. È il modo in cui questo
    # controllo imparerebbe a mentire, per la porta opposta a quella che presidia.
    #
    # La traduzione può quindi dichiarare di essere stata VERIFICATA equivalente all'originale a
    # una data revisione, con un marcatore che nomina quella revisione. La dichiarazione vale
    # soltanto se la revisione nominata contiene già l'ultima modifica dell'originale: dichiarare
    # equivalenza rispetto a una revisione anteriore non dichiara nulla. Chi la scrive si assume
    # la responsabilità di aver letto entrambi i testi, ed è una responsabilità tracciabile.
    # «|| true» NON e' una tolleranza: e' la correzione di un difetto che rendeva CODICE MORTO
    # la riga successiva. Sotto «set -euo pipefail», quando il marcatore non c'e' la grep esce 1,
    # pipefail propaga l'uno all'intera catena, l'assegnazione fallisce e set -e uccide lo script -
    # PRIMA che «if [ -n "$verificata" ]» possa gestire il caso, che e' esattamente il caso per cui
    # quel test esiste. Il controllo usciva quindi 1 senza stampare una sola riga, e la divergenza
    # che aveva trovato restava invisibile: il peggior modo di fallire, perche' indistinguibile da
    # un guasto dello script. Il caso normale - una traduzione senza marcatore - e' la maggioranza
    # delle traduzioni, quindi il difetto si manifestava alla PRIMA divergenza reale e mai prima.
    verificata=$(grep -o 'TRAD-VERIFICATA: *[0-9a-f]\{7,40\}' "$dst" 2>/dev/null | tail -1 | sed 's/.*: *//' || true)
    coperta=0
    if [ -n "$verificata" ]; then
      rev_src=$(git log -1 --format=%H -- "$src" 2>/dev/null)
      # «merge-base --is-ancestor A B» esce 0 quando A è antenato di B o coincide con B: qui
      # significa «la revisione dell'originale è già dentro quella dichiarata dalla traduzione».
      if [ -n "$rev_src" ] && git merge-base --is-ancestor "$rev_src" "$verificata" 2>/dev/null; then
        coperta=1
      else
        printf '\033[31m✗ dichiarazione scaduta: %s - dichiara equivalenza a %s, ma l'"'"'originale è cambiato dopo\033[0m\n' "$rel" "$verificata"
      fi
    fi
    if [ "$coperta" -eq 1 ]; then
      allineati=$((allineati+1))
    else
      printf '\033[31m✗ divergenza: %s - l'"'"'originale è cambiato dopo la traduzione\033[0m\n' "$rel"
      divergenti=$((divergenti+1))
    fi
  else
    allineati=$((allineati+1))
  fi
done

# Il percorso inglese deve essere IDENTICO a quello italiano: è così che Docusaurus
# riconosce un file come traduzione. Un file inglese che non ha l'omologo italiano
# non è una traduzione - è una pagina orfana, che il sito pubblica sotto /en/ mentre
# la pagina vera continua a mostrare l'italiano. È già accaduto: tre file di
# 09_roadmap sono stati consegnati con il nome tradotto (03-usable-first-release.md
# invece di 03-primo-rilascio-utilizzabile.md), e nessun controllo poteva vederlo,
# perché il ciclo sopra parte dall'italiano e un file che nessuno cerca non manca a
# nessuno. Questo ciclo parte dall'inglese, che è l'unico verso in cui l'errore si vede.
orfani=0
for dst in $(find "$TRADOTTO" -name '*.md' | sort); do
  rel="${dst#$TRADOTTO/}"
  if [ ! -f "$SORGENTE/$rel" ]; then
    printf '\033[31m✗ pagina orfana: %s - nessun originale italiano con questo nome\033[0m\n' "$rel"
    orfani=$((orfani+1))
  fi
done

# Verifica strutturale generalizzata, per TUTTI gli otto file bilingui alla radice (le tre
# avvertenze pubbliche e le cinque altre dichiarazioni di D51). Rileva due proprietà, distinte
# apposta perché hanno cause diverse e chi legge il rilievo deve sapere quale delle due:
#
#   1. il blocco inglese è SPARITO - non c'è un secondo titolo di primo livello («# ») e non ci
#      sono almeno due ancore esplicite (<a id="...">), quindi qualunque cosa segua il rimando
#      non è un blocco tradotto;
#   2. il rimando in testa punta a un'ancora che nel documento NON esiste - il blocco inglese
#      c'è, ma chi ha scritto o corretto il titolo (o l'ancora esplicita) non ha aggiornato il
#      rimando, o viceversa: il collegamento è rotto anche se il testo sotto è integro.
#
# L'algoritmo dell'ancora, per il caso del titolo generato, è lo stesso di scripts/verifica-ancore.sh
# - github-slugger: minuscolo, si tengono lettere/numeri/segni diacritici/underscore/trattino/spazio,
# gli spazi diventano trattini - con la STESSA deduplicazione di GitHub per titoli ripetuti (il
# secondo "# Telemedic" genera "telemedic-1", non "telemedic" di nuovo). Riusare l'identico
# algoritmo, non scriverne uno bash simile-ma-diverso, è deliberato: due implementazioni della
# stessa regola divergono in silenzio esattamente come le traduzioni che questo script sorveglia.
_ancora_valida_radice() {
  # $1 = percorso del documento, $2 = ancora richiesta (senza «#»). Esce 0 se un titolo di primo
  # livello o un'ancora esplicita del documento genera esattamente quell'ancora, 1 altrimenti.
  python3 - "$1" "$2" <<'PY'
import sys, re, unicodedata

percorso, ancora = sys.argv[1], sys.argv[2]

def slug(titolo):
    t = titolo.strip().lower()
    tenuti = []
    for ch in t:
        cat = unicodedata.category(ch)
        if cat[0] in ('L', 'N', 'M') or cat == 'Pc' or ch in '- ':
            tenuti.append(ch)
    return ''.join(tenuti).replace(' ', '-')

conteggio = {}
ancore = set()
with open(percorso, encoding='utf-8') as fh:
    for riga in fh:
        if riga.startswith('# '):
            base = slug(riga[2:])
            n = conteggio.get(base, 0)
            a = base if n == 0 else f"{base}-{n}"
            conteggio[base] = n + 1
            ancore.add(a)
        m = re.search(r'<a\s+id="([^"]+)"', riga)
        if m:
            ancore.add(m.group(1))

sys.exit(0 if ancora in ancore else 1)
PY
}

_verifica_struttura_bilingue_radice() {
  # $2 = codice colore ANSI (31 rosso per una riga bloccante, 33 giallo per una in sola
  # segnalazione): quale dei due dipende dallo stato che pipeline/differenziazione-traduzioni.tsv
  # dichiara per QUESTO documento, non da una scelta fissa dello script.
  local doc="$1" colore="${2:-33}"

  if ! grep -qi 'English version below' "$doc"; then
    printf '\033[%sm· documento radice senza rimando al blocco inglese: %s\033[0m\n' "$colore" "$doc"
    return 1
  fi

  local titoli ancore_esplicite
  titoli=$(grep -c '^# ' "$doc" || true)
  ancore_esplicite=$(grep -c '<a id="' "$doc" || true)
  if [ "$titoli" -lt 2 ] && [ "$ancore_esplicite" -lt 2 ]; then
    printf '\033[%sm· documento radice con il rimando ma senza blocco inglese: %s\033[0m\n' "$colore" "$doc"
    return 1
  fi

  local riga_rimando ancora_richiesta
  riga_rimando=$(grep -im1 'English version below' "$doc")
  ancora_richiesta=$(printf '%s' "$riga_rimando" | grep -oE '\(#[^)]+\)' | head -1 | tr -d '()#')
  if [ -z "$ancora_richiesta" ]; then
    printf '\033[%sm· documento radice con rimando privo di ancora: %s\033[0m\n' "$colore" "$doc"
    return 1
  fi
  if ! _ancora_valida_radice "$doc" "$ancora_richiesta"; then
    printf '\033[%sm· documento radice con rimando a un\047ancora inesistente: %s - punta a «#%s»\033[0m\n' \
      "$colore" "$doc" "$ancora_richiesta"
    return 1
  fi

  return 0
}

# Dal 27 agosto 2026 un rilievo su un documento «bloccante» concorre alla condizione di uscita
# finale, esattamente come mancanti/divergenti/orfani: è il criterio 3 di T-03 applicato, non solo
# dichiarato («blocca sulle aree prerequisito, avvertenze pubbliche comprese»). Su un documento
# ancora in «segnalazione» il rilievo resta informativo, con la propria data.
for doc in $AVVERTENZE_PUBBLICHE; do
  [ -f "$doc" ] || continue
  _stato_doc="${STATO_RADICE["avvertenza:$doc"]}"
  _colore_doc=33; [ "$_stato_doc" = "bloccante" ] && _colore_doc=31
  if ! _verifica_struttura_bilingue_radice "$doc" "$_colore_doc"; then
    radice_avvertenze_rilievi=$((radice_avvertenze_rilievi+1))
    if [ "$_stato_doc" = "bloccante" ]; then
      radice_avvertenze_bloccanti=$((radice_avvertenze_bloccanti+1))
    else
      printf '  (in sola segnalazione, bloccante dal %s - %s)\n' \
        "${DATA_RADICE["avvertenza:$doc"]}" "$DIFFERENZIAZIONE_TRADUZIONI"
    fi
  fi
done

for doc in $DICHIARAZIONI_PUBBLICHE_RADICE; do
  [ -f "$doc" ] || continue
  _stato_doc="${STATO_RADICE["dichiarazione:$doc"]}"
  _colore_doc=33; [ "$_stato_doc" = "bloccante" ] && _colore_doc=31
  if ! _verifica_struttura_bilingue_radice "$doc" "$_colore_doc"; then
    radice_dichiarazioni_rilievi=$((radice_dichiarazioni_rilievi+1))
    if [ "$_stato_doc" = "bloccante" ]; then
      radice_dichiarazioni_bloccanti=$((radice_dichiarazioni_bloccanti+1))
    else
      printf '  (in sola segnalazione, bloccante dal %s - %s)\n' \
        "${DATA_RADICE["dichiarazione:$doc"]}" "$DIFFERENZIAZIONE_TRADUZIONI"
    fi
  fi
done

for doc in $AVVERTENZE_PUBBLICHE; do
  [ -f "$doc" ] || continue
  _stato_doc="${STATO_RADICE["avvertenza:$doc"]}"
  _colore_doc=33; [ "$_stato_doc" = "bloccante" ] && _colore_doc=31
  _bloccante_doc=0; [ "$_stato_doc" = "bloccante" ] && _bloccante_doc=1
  if ! grep -qi 'English version below' "$doc"; then
    printf '\033[%sm· avvertenza pubblica senza rimando al blocco inglese: %s\033[0m\n' "$_colore_doc" "$doc"
    avvertenze_assenti=$((avvertenze_assenti+1))
    [ "$_bloccante_doc" -eq 1 ] && avvertenze_bloccanti=$((avvertenze_bloccanti+1))
    continue
  fi
  # Il blocco inglese comincia al secondo titolo di primo livello. Se ce n'è uno
  # solo, il file è monolingue e l'inglese manca del tutto.
  titoli=$(grep -c '^# ' "$doc")
  if [ "$titoli" -lt 2 ]; then
    printf '\033[%sm· avvertenza pubblica senza blocco inglese: %s\033[0m\n' "$_colore_doc" "$doc"
    avvertenze_assenti=$((avvertenze_assenti+1))
    [ "$_bloccante_doc" -eq 1 ] && avvertenze_bloccanti=$((avvertenze_bloccanti+1))
    continue
  fi
  # Le due avvertenze che non possono mancare in inglese, quali che siano le
  # parole intorno: nessuna marcatura, nessuna dichiarazione di conformità.
  inizio_en=$(grep -n '^# ' "$doc" | tail -1 | cut -d: -f1)
  blocco_en=$(tail -n +"$inizio_en" "$doc")
  # NON riusare il nome «mancanti»: è il contatore delle traduzioni esigite.
  avvertenze_incomplete=""
  printf '%s' "$blocco_en" | grep -qi 'CE marking' || avvertenze_incomplete="$avvertenze_incomplete marcatura-CE"
  printf '%s' "$blocco_en" | grep -qi 'declaration of conformity' || avvertenze_incomplete="$avvertenze_incomplete dichiarazione-di-conformita"
  if [ -n "$avvertenze_incomplete" ]; then
    printf '\033[%sm· blocco inglese incompleto in %s:%s\033[0m\n' "$_colore_doc" "$doc" "$avvertenze_incomplete"
    avvertenze_assenti=$((avvertenze_assenti+1))
    [ "$_bloccante_doc" -eq 1 ] && avvertenze_bloccanti=$((avvertenze_bloccanti+1))
  fi
done

printf '\nAllineati: %d · Divergenti: %d · Assenti ed esigiti: %d · Orfani: %d\n' \
  "$allineati" "$divergenti" "$mancanti" "$orfani"

if [ "$avvertenze_assenti" -gt 0 ]; then
  printf 'Avvertenze pubbliche non allineate (contenuto): %d, di cui %d bloccanti - vedi %s\n' \
    "$avvertenze_assenti" "$avvertenze_bloccanti" "$DIFFERENZIAZIONE_TRADUZIONI"
fi

if [ "$radice_avvertenze_rilievi" -gt 0 ]; then
  printf 'Struttura bilingue non allineata (avvertenze pubbliche): %d, di cui %d bloccanti - vedi %s\n' \
    "$radice_avvertenze_rilievi" "$radice_avvertenze_bloccanti" "$DIFFERENZIAZIONE_TRADUZIONI"
fi

if [ "$radice_dichiarazioni_rilievi" -gt 0 ]; then
  printf 'Struttura bilingue non allineata (altre dichiarazioni D51): %d, di cui %d bloccanti - vedi %s\n' \
    "$radice_dichiarazioni_rilievi" "$radice_dichiarazioni_bloccanti" "$DIFFERENZIAZIONE_TRADUZIONI"
fi

if [ "$divergenti" -gt 0 ] || [ "$mancanti" -gt 0 ] || [ "$orfani" -gt 0 ] \
   || [ "$avvertenze_bloccanti" -gt 0 ] || [ "$radice_avvertenze_bloccanti" -gt 0 ] \
   || [ "$radice_dichiarazioni_bloccanti" -gt 0 ]; then
  cat <<'NOTA'

Che cosa fare. Una divergenza si risolve ritraducendo il documento, non
annotandola: la nota si dimentica, il controllo no. Se la modifica all'originale è
puramente redazionale e la traduzione resta vera, si scrive nel file tradotto il marcatore

    <!--TRAD-VERIFICATA: <revisione>-->

dove <revisione> è l'impronta del commit dell'originale che si è letto per verificarlo. Non è una
scorciatoia: è una dichiarazione di aver confrontato i due testi, e scade da sola alla modifica
successiva dell'originale. Una divergenza STRUTTURALE
- sezioni in numero diverso - quasi sempre significa che la traduzione si è
fermata a metà: si completa, non si pareggia togliendo sezioni all'italiano. Se l'originale è cambiato
in modo puramente redazionale e la traduzione resta corretta, si tocca comunque
il file tradotto nello stesso commit, così la relazione fra i due resta vera e
il controllo non impara a mentire.

Un rilievo BLOCCANTE su un'avvertenza pubblica o su un'altra dichiarazione di D51 si risolve
riallineando il blocco inglese del documento, mai abbassando il suo stato in
pipeline/differenziazione-traduzioni.tsv per farlo tacere: quel file dichiara una decisione presa,
non un interruttore per far passare la costruzione.
NOTA
  exit 1
fi

printf '\033[32m✓ Nessuna divergenza fra italiano e inglese.\033[0m\n'
