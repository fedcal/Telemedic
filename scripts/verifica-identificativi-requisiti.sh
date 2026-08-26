#!/usr/bin/env bash
# Controllo di costruzione - criterio 5 di T-01.
#
# Il registro degli identificativi di requisito (`registro/identificativi-requisiti.tsv`) è un
# giornale di eventi in sola aggiunta: ogni riga introduce o ritira un identificativo, e lo stato
# di un identificativo è la proiezione del suo ultimo evento. Una prova che cita un identificativo
# assente dal registro, o citato ma ritirato, ha smesso di verificare qualcosa di reale - cita un
# requisito che non esiste più, o che non è mai esistito con quel nome. Questo controllo fa
# fallire la costruzione in entrambi i casi, e nel terzo caso - il registro stesso malformato -
# perché un registro che non si legge in modo univoco non può fondare nessuna proiezione di stato.
#
# DOVE CERCA LE PROVE.
# Alla data di scrittura di questo controllo non esiste ancora una riga di codice applicativo
# (vincolo V-182): non esiste quindi un albero di prove reale su cui collaudarlo, e la ricerca qui
# sotto è una convenzione dichiarata, non un fatto osservato. Il controllo cerca, a partire dalla
# radice indicata da PROVE_RADICE (per difetto la radice del repository):
#   - ogni file il cui nome termina in Test.java, Tests.java o IT.java (convenzione Maven/Gradle
#     per le prove unitarie e di integrazione del backend Spring Boot - cfr.
#     docs/01_technical/01-stack-e-motivazioni.md §4-5);
#   - ogni file con estensione .spec.ts (convenzione Angular per le prove del frontend);
#   - ogni file con estensione .feature (prove a contratto o comportamentali, se adottate);
#   - ogni file dentro una cartella chiamata esattamente "prove", ovunque compaia nell'albero -
#     così chi crea la PRIMA cartella con questo nome, in qualunque modulo, è già coperto senza
#     dover modificare questo controllo.
# Sono esclusi a priori: .git, node_modules, website/build (artefatto costruito, non sorgente), e
# scripts/prove (il banco di prova di QUESTO controllo: le sue tenute contengono identificativi
# deliberatamente errati e non vanno confuse con le prove reali del progetto).
#
# Un identificativo si riconosce con DUE grammatiche diverse, non una sola - confonderle è stato
# un difetto di questo script, corretto dopo essere stato dimostrato (registro/README.md,
# §"Difetti trovati durante la popolazione"):
#   - SETTE famiglie sono numeriche progressive: RF-, RNF-, BR-, ATT-, UC-, OUT-, DM- seguite da
#     sole cifre (il numero di cifre non è normato: il catalogo usa sia "RF-196" sia, in un
#     esempio illustrativo, "RF-0142");
#   - la famiglia EX-* NON ha forma numerica: è composta da EX seguito da uno o più segmenti
#     alfanumerici maiuscoli separati da trattino (es. "EX-EMERGENCY", "EX-TM-ESCFAIL"). È la
#     famiglia degli esiti, la più citata nelle prove, e quindi quella il cui riconoscimento
#     sbagliato ha il costo più alto.
# Il corpus contiene anche il prefisso GENERICO "EX-*" e "EX-TM-*" (con l'asterisco letterale, per
# indicare l'intera famiglia o sottofamiglia in prosa): NON sono identificativi e non vanno
# raccolti. Un'estrazione ingenua a singola espressione regolare con \b tronca "EX-TM-*" a
# "EX-TM" - che sembra un identificativo valido e non lo è. Per questo l'estrazione qui sotto
# procede in due fasi: prima isola il token grezzo (la sequenza massimale di lettere, cifre e
# trattini, sui confini reali del testo), poi lo accetta solo se corrisponde per intero - non in
# parte - a una delle due grammatiche. "EX-TM-*" tokenizza come "EX-TM-" (con il trattino finale,
# perché l'asterisco non è nella classe di caratteri) e quel token non soddisfa per intero nessuna
# delle due grammatiche: viene scartato, non troncato.
#
# Il controllo non impone un formato di citazione - annotazione strutturata, commento, docstring -
# perché quel formato non è ancora deciso per ogni linguaggio: gli basta che il token
# dell'identificativo compaia nel file di prova.
#
# COLLAUDABILITÀ. Il controllo accetta due variabili d'ambiente:
#   REGISTRO       - percorso del registro (per difetto registro/identificativi-requisiti.tsv)
#   PROVE_RADICE   - radice da cui cercare le prove (per difetto la radice del repository)
# Senza queste due variabili il controllo non sarebbe collaudabile con tenute isolate: si veda
# scripts/prove/esegui-prove.sh.
set -euo pipefail

cd "$(dirname "$0")/.."

REGISTRO="${REGISTRO:-registro/identificativi-requisiti.tsv}"
PROVE_RADICE="${PROVE_RADICE:-.}"

esito=0

segnala() {
  printf '\n\033[31m✗ %s\033[0m\n%s\n' "$1" "$2"
  esito=1
}

# Token grezzo: sequenza massimale di lettere, cifre e trattini. Include un eventuale trattino
# finale isolato (come in "EX-TM-" ricavato da "EX-TM-*") apposta: la fase di validazione che
# segue lo scarta perché non soddisfa per intero nessuna grammatica, ed è così che il trattino
# finale smette di essere ambiguo invece di sparire silenziosamente.
PATTERN_TOKEN_GREZZO='[A-Za-z0-9-]+'

# Validazione ancorata: il token intero deve corrispondere a una delle due grammatiche, non una
# sua parte. `identificativo_valido` restituisce vero (0) solo in quel caso.
identificativo_valido() {
  local tok="$1"
  [[ "$tok" =~ ^(RF|RNF|BR|ATT|UC|OUT|DM)-[0-9]+$ ]] && return 0
  [[ "$tok" =~ ^EX(-[A-Z0-9]+)+$ ]] && return 0
  return 1
}

# --- 1. Individuazione dei file di prova, secondo la convenzione dichiarata in testa. ---
#
# find in due passate: convenzioni per nome/estensione, poi la cartella "prove" ovunque compaia.
# L'esclusione di scripts/prove tiene fuori il banco di prova di QUESTO controllo (vedi sopra);
# senza PROVE_RADICE puntato altrove, una tenuta di scripts/prove non sarebbe mai raggiunta da
# questo passo, ed è esattamente il comportamento voluto in esecuzione normale.
file_di_prova=$(
  {
    find "$PROVE_RADICE" \
      \( -path '*/.git' -o -path '*/node_modules' -o -path "$PROVE_RADICE/website/build" -o -path "$PROVE_RADICE/scripts/prove" \) -prune -o \
      -type f \( -name '*Test.java' -o -name '*Tests.java' -o -name '*IT.java' -o -name '*.spec.ts' -o -name '*.feature' \) -print
    find "$PROVE_RADICE" \
      \( -path '*/.git' -o -path '*/node_modules' -o -path "$PROVE_RADICE/website/build" -o -path "$PROVE_RADICE/scripts/prove" \) -prune -o \
      -type d -name 'prove' -print0 2>/dev/null | xargs -0 -I{} find {} -type f 2>/dev/null
  } | sort -u
)

# --- 2. Analisi del registro: malformazioni e proiezione di stato. ---
#
# Il registro può non esistere ancora: fin quando nessuna prova cita un identificativo, questo
# non è un errore di QUESTO controllo (lo è del criterio 3/4 di T-01, verificato altrove).
malformazioni=""
stato_tmp=$(mktemp)
trap 'rm -f "$stato_tmp"' EXIT

if [ -f "$REGISTRO" ]; then
  # Fase 1 - validazione strutturale riga per riga: colonne, campi obbligatori, dominio di
  # `evento`, duplicati esatti (stesso identificativo, stesso evento, stessa data). Le righe
  # strutturalmente valide sono emesse per la fase 2, con il numero di riga fisica portato dietro
  # per i messaggi d'errore e come spareggio a parità di data.
  fase1=$(awk -F'\t' '
    /^#/ { next }
    BEGIN { intestazione_letta = 0 }
    {
      # awk conta anche le righe vuote come NF==1 con campo vuoto: le saltiamo esplicitamente.
      riga_originale = $0
      gsub(/\r$/, "", riga_originale)
      if (riga_originale == "") next
    }
    !intestazione_letta { intestazione_letta = 1; next }
    {
      n = split(riga_originale, campi, "\t")
      if (n != 5) {
        print "MALFORMATO\triga " FNR ": attese 5 colonne separate da TAB (data, identificativo, evento, fonte, nota), trovate " n
        next
      }
      data = campi[1]; id = campi[2]; evento = campi[3]; fonte = campi[4]
      if (data == "" || id == "" || evento == "" || fonte == "") {
        print "MALFORMATO\triga " FNR ": campo obbligatorio vuoto (data/identificativo/evento/fonte)"
        next
      }
      if (evento != "introdotto" && evento != "ritirato") {
        print "MALFORMATO\triga " FNR ": evento non ammesso \"" evento "\" per " id " (ammessi: introdotto, ritirato)"
        next
      }
      chiave = id SUBSEP evento SUBSEP data
      if (chiave in visti) {
        print "MALFORMATO\triga " FNR ": " id " " evento " duplicato in data " data
        next
      }
      visti[chiave] = 1
      print "VALIDA\t" id "\t" data "\t" FNR "\t" evento
    }
  ' "$REGISTRO")

  malformazioni_strutturali=$(printf '%s\n' "$fase1" | grep '^MALFORMATO' || true)

  # Fase 2 - proiezione dello stato in ORDINE CRONOLOGICO, non in ordine fisico del file.
  # registro/README.md, §"Come si calcola lo stato": «si ordinano per data e, a parità di data,
  # per ordine di comparizione nel file». L'ordine fisico delle righe esiste per leggibilità (sono
  # raggruppate per famiglia), non per cronologia: usare l'ordine fisico da solo, come farebbe una
  # lettura riga-per-riga ingenua, proietterebbe uno stato sbagliato ogni volta che il registro non
  # è già ordinato per data. Il riordino qui sotto (per identificativo, poi data, poi riga fisica
  # come spareggio) è quindi la condizione di correttezza del controllo, non un dettaglio.
  righe_valide_ordinate=$(printf '%s\n' "$fase1" | grep '^VALIDA' | LC_ALL=C sort -t "$(printf '\t')" -k2,2 -k3,3 -k4,4n || true)

  fase2=$(printf '%s\n' "$righe_valide_ordinate" | awk -F'\t' '
    NF < 5 { next }
    {
      id = $2; data = $3; riga = $4; evento = $5
      if (id != id_corrente) {
        id_corrente = id
        precedente = ""
      }
      if (evento == "introdotto" && precedente == "ritirato") {
        print "MALFORMATO\triga " riga ": riuso vietato - " id " reintrodotto dopo essere stato ritirato (in ordine cronologico per data)"
      }
      precedente = evento
      ultimo[id] = evento
    }
    END {
      for (id in ultimo) print "STATO\t" id "\t" ultimo[id]
    }
  ')

  malformazioni_cronologiche=$(printf '%s\n' "$fase2" | grep '^MALFORMATO' || true)
  printf '%s\n' "$fase2" | grep '^STATO' > "$stato_tmp" || true

  malformazioni=$(printf '%s\n%s\n' "$malformazioni_strutturali" "$malformazioni_cronologiche" | grep -v '^$' || true)
fi

if [ -n "$malformazioni" ]; then
  segnala "Registro degli identificativi malformato: $REGISTRO" \
"$(printf '%s\n' "$malformazioni" | sed 's/^MALFORMATO\t/  - /')

Corregge chi ha prodotto la riga indicata. Un registro che non si legge in modo univoco non
proietta uno stato affidabile, e ogni citazione a valle diventa inverificabile."
fi

# --- 3. Citazioni nelle prove, contro la proiezione di stato. ---

if [ -z "$file_di_prova" ]; then
  printf '\033[33m· Nessuna prova trovata sotto %s: controllo corretto a insieme vuoto, nulla da verificare.\033[0m\n' "$PROVE_RADICE"
else
  assenti=""
  ritirati=""
  for f in $file_di_prova; do
    # Estrazione a due fasi (vedi il commento in testa allo script): prima il token grezzo, poi
    # solo i token che soddisfano per intero una delle due grammatiche sopravvivono al filtro.
    token_grezzi=$(grep -Eo "$PATTERN_TOKEN_GREZZO" "$f" 2>/dev/null | sort -u || true)
    citati=""
    if [ -n "$token_grezzi" ]; then
      while IFS= read -r tok; do
        identificativo_valido "$tok" && citati="$citati$tok"$'\n'
      done <<<"$token_grezzi"
    fi
    [ -z "$citati" ] && continue
    for id in $citati; do
      stato=$(awk -F'\t' -v id="$id" '$2==id{print $3}' "$stato_tmp" 2>/dev/null | tail -1)
      if [ -z "$stato" ]; then
        assenti="$assenti\n  - $id citato in $f, assente dal registro ($REGISTRO)"
      elif [ "$stato" = "ritirato" ]; then
        ritirati="$ritirati\n  - $id citato in $f, ma il suo ultimo evento nel registro è \"ritirato\""
      fi
    done
  done

  if [ -n "$assenti" ]; then
    segnala "Prove che citano identificativi assenti dal registro" \
"$(printf '%b' "$assenti")

Introduci l'identificativo nel registro con un evento \"introdotto\" prima di citarlo in una
prova, oppure correggi la prova se l'identificativo citato è sbagliato."
  fi

  if [ -n "$ritirati" ]; then
    segnala "Prove che citano identificativi ritirati" \
"$(printf '%b' "$ritirati")

Un identificativo ritirato non verifica più un requisito in vigore. Aggiorna la prova sul
requisito che lo ha sostituito, oppure rimuovi la prova se il requisito non esiste più."
  fi

  if [ "$esito" -eq 0 ]; then
    n=$(printf '%s\n' "$file_di_prova" | wc -l)
    printf '\033[32m✓ %s file di prova esaminati, nessuna citazione assente o ritirata.\033[0m\n' "$n"
  fi
fi

exit "$esito"
