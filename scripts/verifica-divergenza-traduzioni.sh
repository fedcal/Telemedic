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

# Le avvertenze pubbliche alla radice del repository sono nel criterio 8 di T-01 e nel criterio 1
# di T-06, che le esigono "in entrambe le lingue". Non stanno sotto docs/ e quindi sfuggivano
# interamente a questo controllo: un criterio impegnato senza una prova che possa fallire.
#
# Sono verificate qui in SOLA SEGNALAZIONE, perché la versione inglese non esiste ancora e la
# riscrittura degli originali su D58 e' essa stessa il criterio 8 di T-01. La data in cui questo
# controllo diventa bloccante e' dichiarata, come impone il criterio 4 di T-03: un controllo senza
# quella data non e' ammesso, perche' e' il modo in cui una riduzione temporanea diventa permanente.
# Le avvertenze pubbliche alla radice sono BILINGUI IN UN FILE SOLO: il blocco
# italiano, poi un separatore, poi il blocco inglese, richiamato in testa da un
# rimando «English version below». Non esistono file .en.md separati, e non
# devono esistere: due file significherebbero due testi che divergono in
# silenzio proprio dove la divergenza è più costosa.
# Il controllo verifica quindi che il blocco inglese esista dentro il file.
AVVERTENZE_PUBBLICHE="NOT-A-MEDICAL-DEVICE.md DISTRIBUTION-POLICY.md README.md"
AVVERTENZE_BLOCCANTI_DAL="2026-09-12"   # scadenza di T-01, criterio 8 letterale (02-traguardi.md)

# Non sono solo tre. CONTRIBUTING.md, GOVERNANCE.md, SECURITY.md, CODE_OF_CONDUCT.md e
# THIRD-PARTY-TERMINOLOGY.md - le altre dichiarazioni pubbliche obbligatorie di D51 - seguono LA
# STESSA convenzione bilingue-in-un-file-solo: accertato leggendoli il 26 agosto 2026, non
# presunto dall'elenco. CODE_OF_CONDUCT.md usa una VARIANTE: non un secondo titolo di primo
# livello, ma due ancore esplicite `<a id="italiano"></a>` e `<a id="english"></a>`, con lo
# stesso rimando «English version below» in testa che punta a `#english`. Nessuno di questi
# cinque file era sorvegliato: chi riscriveva la metà italiana e dimenticava quella inglese non
# produceva un file mancante - produceva due testi che divergono nello stesso file, e nessun
# controllo se ne accorgeva.
#
# La data di bloccanza propria di T-01 (12 settembre 2026) nomina per nome, nel testo letterale
# del criterio 8, SOLO tre file: «la dichiarazione di non dispositivo medico, ... la politica di
# distribuzione e ... il richiamo in evidenza del documento di presentazione del repository». I
# cinque file qui sotto non vi compaiono. Ma docs/09_roadmap/00-indice.md §4, riga
# "Dichiarazioni pubbliche obbligatorie (D51)", colloca l'INTERO elenco - guida ai contributi,
# governance, politica di sicurezza e codice di condotta compresi - sotto "il criterio 8 di
# T-01": è l'unico rinvio scritto che leghi questi cinque file a una data qualunque, e in questo
# repository le date non si inventano. La tensione fra le due fonti non si smussa qui, si
# dichiara: si riusa la stessa data (12 settembre 2026) perché è l'unica lettura che abbia una
# fonte scritta a sostegno - non perché sia certa che si applichi per nome - e perché darsi una
# data più comoda senza un criterio che la scriva sarebbe esattamente l'invenzione che la
# convenzione del progetto vieta.
DICHIARAZIONI_PUBBLICHE_RADICE="CONTRIBUTING.md GOVERNANCE.md SECURITY.md CODE_OF_CONDUCT.md THIRD-PARTY-TERMINOLOGY.md"
DICHIARAZIONI_BLOCCANTI_DAL="2026-09-12"   # riuso motivato sopra: 00-indice.md §4, riga D51

mancanti=0
divergenti=0
allineati=0
avvertenze_assenti=0
radice_avvertenze_rilievi=0
radice_dichiarazioni_rilievi=0

# Aree di cui si esige la traduzione. La decisione D56, emendando D52, rende
# prerequisiti non negoziabili soltanto queste: le avvertenze pubbliche, la
# guida dei fondamenti, la conformità, la sicurezza e i registri di decisione.
# Il resto è pianificato e non bloccante, quindi l'assenza si annota ma non fa fallire.
AREE_ESIGITE="adr 10_fondamenti 06_security 08_compliance"

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
    verificata=$(grep -o 'TRAD-VERIFICATA: *[0-9a-f]\{7,40\}' "$dst" 2>/dev/null | tail -1 | sed 's/.*: *//')
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
  local doc="$1"

  if ! grep -qi 'English version below' "$doc"; then
    printf '\033[33m· documento radice senza rimando al blocco inglese: %s\033[0m\n' "$doc"
    return 1
  fi

  local titoli ancore_esplicite
  titoli=$(grep -c '^# ' "$doc" || true)
  ancore_esplicite=$(grep -c '<a id="' "$doc" || true)
  if [ "$titoli" -lt 2 ] && [ "$ancore_esplicite" -lt 2 ]; then
    printf '\033[33m· documento radice con il rimando ma senza blocco inglese: %s\033[0m\n' "$doc"
    return 1
  fi

  local riga_rimando ancora_richiesta
  riga_rimando=$(grep -im1 'English version below' "$doc")
  ancora_richiesta=$(printf '%s' "$riga_rimando" | grep -oE '\(#[^)]+\)' | head -1 | tr -d '()#')
  if [ -z "$ancora_richiesta" ]; then
    printf '\033[33m· documento radice con rimando privo di ancora: %s\033[0m\n' "$doc"
    return 1
  fi
  if ! _ancora_valida_radice "$doc" "$ancora_richiesta"; then
    printf '\033[33m· documento radice con rimando a un\047ancora inesistente: %s - punta a «#%s»\033[0m\n' \
      "$doc" "$ancora_richiesta"
    return 1
  fi

  return 0
}

for doc in $AVVERTENZE_PUBBLICHE; do
  [ -f "$doc" ] || continue
  _verifica_struttura_bilingue_radice "$doc" || radice_avvertenze_rilievi=$((radice_avvertenze_rilievi+1))
done

for doc in $DICHIARAZIONI_PUBBLICHE_RADICE; do
  [ -f "$doc" ] || continue
  _verifica_struttura_bilingue_radice "$doc" || radice_dichiarazioni_rilievi=$((radice_dichiarazioni_rilievi+1))
done

for doc in $AVVERTENZE_PUBBLICHE; do
  [ -f "$doc" ] || continue
  if ! grep -qi 'English version below' "$doc"; then
    printf '\033[33m· avvertenza pubblica senza rimando al blocco inglese: %s\033[0m\n' "$doc"
    avvertenze_assenti=$((avvertenze_assenti+1))
    continue
  fi
  # Il blocco inglese comincia al secondo titolo di primo livello. Se ce n'è uno
  # solo, il file è monolingue e l'inglese manca del tutto.
  titoli=$(grep -c '^# ' "$doc")
  if [ "$titoli" -lt 2 ]; then
    printf '\033[33m· avvertenza pubblica senza blocco inglese: %s\033[0m\n' "$doc"
    avvertenze_assenti=$((avvertenze_assenti+1))
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
    printf '\033[33m· blocco inglese incompleto in %s:%s\033[0m\n' "$doc" "$avvertenze_incomplete"
    avvertenze_assenti=$((avvertenze_assenti+1))
  fi
done

printf '\nAllineati: %d · Divergenti: %d · Assenti ed esigiti: %d · Orfani: %d\n' \
  "$allineati" "$divergenti" "$mancanti" "$orfani"

if [ "$avvertenze_assenti" -gt 0 ]; then
  printf 'Avvertenze pubbliche non allineate: %d - in sola segnalazione, bloccanti dal %s (T-01)\n' \
    "$avvertenze_assenti" "$AVVERTENZE_BLOCCANTI_DAL"
fi

if [ "$radice_avvertenze_rilievi" -gt 0 ]; then
  printf 'Struttura bilingue non allineata (avvertenze pubbliche): %d - in sola segnalazione, bloccante dal %s (T-01, criterio 8)\n' \
    "$radice_avvertenze_rilievi" "$AVVERTENZE_BLOCCANTI_DAL"
fi

if [ "$radice_dichiarazioni_rilievi" -gt 0 ]; then
  printf 'Struttura bilingue non allineata (altre dichiarazioni D51): %d - in sola segnalazione, bloccante dal %s (00-indice.md §4, riuso motivato della data di T-01)\n' \
    "$radice_dichiarazioni_rilievi" "$DICHIARAZIONI_BLOCCANTI_DAL"
fi

if [ "$divergenti" -gt 0 ] || [ "$mancanti" -gt 0 ] || [ "$orfani" -gt 0 ]; then
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
NOTA
  exit 1
fi

printf '\033[32m✓ Nessuna divergenza fra italiano e inglese.\033[0m\n'
