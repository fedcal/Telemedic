#!/usr/bin/env bash
# Controllo di costruzione - registro/vincoli.tsv e registro/questioni.tsv.
#
# I vincoli «V-» e le questioni «Q-» sono la spina dorsale dei rinvii interni: la
# documentazione pubblicata li cita come vigenti, e un lettore che segue la citazione deve
# trovare la voce. La fonte di verita' resta la tabella della bacheca inter-agenti; i due
# registri ne sono la proiezione leggibile da macchina, prodotta da
# scripts/genera-registri-di-vincoli-e-questioni.py. Questo controllo fa fallire la
# costruzione quando:
#
#   1. la proiezione non e' aggiornata: rigenerandola dalla bacheca si otterrebbe un file
#      diverso da quello versionato. Un registro fermo mentre la fonte si muove e' peggio di
#      nessun registro, perche' sembra rispondere;
#   2. la documentazione cita una sigla che il registro non definisce. E' il difetto che ha
#      motivato questo controllo: settantasei citazioni portavano numerazioni superate,
#      abbandonate quando la numerazione per area e' stata globalizzata e mai riscritte nel
#      corpus, e nulla se ne era accorto;
#   3. le due lingue non citano lo stesso insieme di sigle. Una sigla corretta in italiano e
#      non in inglese e' una divergenza, e le divergenze in questo repository si chiudono su
#      entrambe le lingue nello stesso atto;
#   4. la traduzione inglese non e' completa: una sigla definita nei registri non ha una riga
#      in registro/traduzioni-en.tsv, oppure la traduzione ne nomina una che i registri non
#      contengono. Una voce senza traduzione non e' un difetto estetico: il generatore dei
#      capitoli mette al suo posto il marcatore «[NV] This entry has not been translated yet»,
#      e finche' la traduzione resta completa il criterio 2 di T-07 - risultati di ricerca
#      nella lingua attiva - passa solo perche' non c'e' nulla da scoprire. Senza questa
#      regola, la prima voce dimenticata verrebbe segnalata da verifica-ricerca.sh come
#      contaminazione dell'indice inglese: il sintomo, non la causa.
#
# QUESTO CONTROLLO NON CONTIENE ALCUN ELENCO DI SIGLE (D-10 del runbook). Le sigle definite si
# leggono dai registri, quelle citate dal corpus e quelle tradotte dal file di traduzione: se
# tenesse una copia di uno qualunque di essi resterebbe verde proprio nel caso che deve
# intercettare.
#
# CONVENZIONE DI USCITA, la stessa degli altri controlli del progetto: 2 quando il controllo
# non puo' nemmeno partire (registri, corpus, traduzione o generatore assenti), 1 quando e'
# partito e ha trovato un rilievo, 0 quando non ne ha trovati.
#
# COLLAUDABILITA'. Il controllo accetta cinque variabili d'ambiente, che esistono per la prova
# e mai come ripiego a tempo di esercizio (D-10):
#   REPO        - radice del repository (per difetto quella calcolata da questo file). Non si
#                 forza: un controllo che impone la propria radice non e' provabile da alcuna
#                 tenuta, perche' nessuna tenuta puo' mettersi al suo posto (D-17)
#   CORPUS_IT   - radice del corpus italiano (per difetto docs)
#   CORPUS_EN   - radice dello specchio inglese
#   GENERATORE  - percorso del generatore della proiezione
#   TRADUZIONI  - percorso del file di traduzione (per difetto registro/traduzioni-en.tsv)

set -euo pipefail

REPO="${REPO:-$(cd "$(dirname "$0")/.." && pwd)}"
cd "$REPO" || { printf '\033[31m✗ Radice irraggiungibile: %s\033[0m\n' "$REPO" >&2; exit 2; }

CORPUS_IT="${CORPUS_IT:-docs}"
CORPUS_EN="${CORPUS_EN:-website/i18n/en/docusaurus-plugin-content-docs/current}"
GENERATORE="${GENERATORE:-scripts/genera-registri-di-vincoli-e-questioni.py}"
TRADUZIONI="${TRADUZIONI:-registro/traduzioni-en.tsv}"
REGISTRI=(registro/vincoli.tsv registro/questioni.tsv)

esito=0
rilievi=0

segnala() {
  printf '\n\033[31m✗ %s\033[0m\n%s\n' "$1" "$2" >&2
  esito=1
  rilievi=$((rilievi+1))
}

for f in "${REGISTRI[@]}" "$GENERATORE" "$TRADUZIONI"; do
  [ -f "$f" ] || { printf '\033[31m✗ File assente: %s\033[0m\n' "$f" >&2; exit 2; }
done
for d in "$CORPUS_IT" "$CORPUS_EN"; do
  [ -d "$d" ] || { printf '\033[31m✗ Corpus assente: %s\033[0m\n' "$d" >&2; exit 2; }
done

temporanea=$(mktemp -d)
trap 'rm -rf "$temporanea"' EXIT

# --- Regola 1. La proiezione e' aggiornata. ---

if ! REGISTRO_RADICE="$REPO" REGISTRO_USCITA="$temporanea" python3 "$GENERATORE" >/dev/null 2>"$temporanea/errore"; then
  segnala "La bacheca non e' proiettabile: il generatore ha rifiutato di produrre i registri." \
"$(cat "$temporanea/errore")
  Correggere la bacheca e rieseguire: python3 $GENERATORE"
else
  for r in "${REGISTRI[@]}"; do
    if ! diff -q "$r" "$temporanea/$r" >/dev/null 2>&1; then
      segnala "La proiezione $r non e' aggiornata rispetto alla bacheca." \
"  Differenze:
$(diff "$r" "$temporanea/$r" | head -12 | sed 's/^/    /')
  Rigenerare con: python3 $GENERATORE"
    fi
  done
fi

# --- Le sigle definite e quelle citate. Nessuna delle due e' scritta qui dentro. ---

definite="$temporanea/definite"
cut -f1 "${REGISTRI[@]}" | grep -P '^[VQ]-' | sort -u > "$definite"
if [ ! -s "$definite" ]; then
  printf '\033[31m✗ Nessuna sigla definita nei registri: configurazione errata, non registri vuoti.\033[0m\n' >&2
  exit 2
fi

# Una sigla non e' preceduta da lettera, cifra, sottolineatura, trattino o punto: il punto esclude
# le numerazioni di blocco come «5.Q-5.X», che non sono citazioni, e la sottolineatura esclude gli
# identificativi tecnici che finiscono per sembrarne una. La sottolineatura e' stata aggiunta il 27
# agosto 2026 estendendo il controllo ai vincoli fondanti: la' produceva un falso positivo reale -
# «VXU_V04», un tipo di messaggio HL7 v2, letto come citazione del vincolo V04 - e qui oggi non ne
# produce nessuno, misurato. E' un buco latente chiuso a costo zero, non una correzione di comodo.
SIGLA='(?<![A-Za-z0-9_.-])[VQ]-\d{1,3}(-[a-z]+)?(?![0-9])'

cita() { grep -rhoP "$SIGLA" "$1" 2>/dev/null | sort -u; }

for lingua in "IT:$CORPUS_IT" "EN:$CORPUS_EN"; do
  nome="${lingua%%:*}"
  radice="${lingua#*:}"
  citate="$temporanea/citate-$nome"
  cita "$radice" > "$citate"
  orfane=$(comm -23 "$citate" "$definite" | tr '\n' ' ')
  if [ -n "${orfane// /}" ]; then
    segnala "Il corpus $nome cita sigle che nessun registro definisce." \
"  Sigle orfane: $orfane
  Ciascuna e' un rinvio che non puo' risolvere. Se e' una numerazione superata, si
  riscrive la citazione con la sigla ufficiale; se e' una voce mai registrata, si
  registra in .telemedic/context/05_BACHECA_INTERAGENTI.md e si rigenera."
  fi
done

# --- Regola 3. Le due lingue citano lo stesso insieme. ---

solo_it=$(comm -23 "$temporanea/citate-IT" "$temporanea/citate-EN" | tr '\n' ' ')
solo_en=$(comm -13 "$temporanea/citate-IT" "$temporanea/citate-EN" | tr '\n' ' ')
if [ -n "${solo_it// /}" ] || [ -n "${solo_en// /}" ]; then
  segnala "Le due lingue non citano lo stesso insieme di sigle." \
"  Solo in italiano: ${solo_it:-nessuna}
  Solo in inglese:  ${solo_en:-nessuna}
  Una correzione applicata a una lingua sola e' una divergenza, non una correzione parziale."
fi

# --- Regola 5. I vincoli fondanti citati risolvono nel capitolo che li dichiara. ---
#
# PERCHE' ESISTE, ed e' la voce D-22 del runbook chiusa. I sei vincoli fondanti erano citati
# duecento volte nella documentazione pubblicata e dichiarati in NESSUN file pubblicato: vivevano
# solo nel contesto di lavoro interno. Sono stati pubblicati il 27 agosto 2026, e la voce del
# runbook registrava per iscritto che il presidio NON li copriva: le regole 1-4 cercano la forma
# «V-<numero>» con il trattino, e i vincoli fondanti si scrivono senza. Una voce di runbook che
# dichiara la propria lacuna e' onesta finche' la lacuna resta; qui si chiude.
#
# LE SIGLE AMMESSE NON SONO SCRITTE QUI DENTRO (D-10 del runbook: un controllo non contiene una
# copia di cio' che sorveglia). Si leggono dai titoli del capitolo che le dichiara, quindi
# aggiungere un settimo vincolo al capitolo lo rende automaticamente citabile, e citarne uno che
# il capitolo non dichiara resta un rilievo. Il numero sei non compare in questo file.

FONDANTI_IT="${FONDANTI_IT:-docs/11_registri/03-vincoli-fondanti.md}"
FONDANTI_EN="${FONDANTI_EN:-website/i18n/en/docusaurus-plugin-content-docs/current/11_registri/03-vincoli-fondanti.md}"

# Un vincolo fondante si cita senza trattino e con una cifra sola dietro la V. Il guardiano in coda
# esclude «V1.0» e simili, che sono numeri di versione e non citazioni.
FONDANTE='(?<![A-Za-z0-9_.-])V\d+(?![0-9])(?!\.\d)'

for lingua in "IT:$FONDANTI_IT:$CORPUS_IT" "EN:$FONDANTI_EN:$CORPUS_EN"; do
  nome="${lingua%%:*}"
  resto="${lingua#*:}"
  capitolo="${resto%%:*}"
  radice="${resto#*:}"

  if [ ! -r "$capitolo" ]; then
    segnala "Il capitolo dei vincoli fondanti ($nome) non esiste: $capitolo" \
"  Duecento citazioni nel corpus rinviano a una definizione che non c'e'. E' esattamente la
  condizione da cui nasce la voce D-22 del runbook."
    continue
  fi

  grep -oP '^#{2,4} \KV\d+$' "$capitolo" | sort -u > "$temporanea/fondanti-$nome"
  if [ ! -s "$temporanea/fondanti-$nome" ]; then
    segnala "Il capitolo dei vincoli fondanti ($nome) non dichiara alcun vincolo." \
"  Atteso un titolo per ciascuno, nella forma «### V<cifra>». Un capitolo che non
  dichiara nulla non e' una dichiarazione: e' una pagina."
    continue
  fi

  grep -rhoP "$FONDANTE" "$radice" --include='*.md' 2>/dev/null | sort -u > "$temporanea/fondanti-citati-$nome"
  orfani=$(comm -23 "$temporanea/fondanti-citati-$nome" "$temporanea/fondanti-$nome" | tr '\n' ' ')
  if [ -n "${orfani// /}" ]; then
    segnala "Il corpus $nome cita vincoli fondanti che il capitolo non dichiara." \
"  Sigle orfane: $orfani
  Una citazione che non sa dove vive la definizione non e' una citazione: e' un rimando
  che fallisce in silenzio. Si dichiara il vincolo in $capitolo, oppure si corregge la
  citazione."
  fi
done

# --- Regola 4. La traduzione inglese e' completa. ---

tradotte="$temporanea/tradotte"
cut -f1 "$TRADUZIONI" | grep -P '^[VQ]-' | sort -u > "$tradotte"

non_tradotte=$(comm -23 "$definite" "$tradotte" | tr '\n' ' ')
if [ -n "${non_tradotte// /}" ]; then
  segnala "Sigle definite nei registri prive di traduzione inglese." \
"  Sigle non tradotte: $non_tradotte
  Ciascuna compare sulla pagina inglese con il marcatore [NV] al posto del testo, e mette
  una parola italiana nell'indice di ricerca inglese. Aggiungere una riga per ciascuna in
  $TRADUZIONI e rigenerare i capitoli con scripts/genera-capitoli-dei-registri.py."
fi

tradotte_orfane=$(comm -13 "$definite" "$tradotte" | tr '\n' ' ')
if [ -n "${tradotte_orfane// /}" ]; then
  segnala "$TRADUZIONI nomina sigle che nessun registro definisce." \
"  Sigle estranee: $tradotte_orfane
  Ciascuna e' una riga di traduzione senza voce corrispondente in registro/vincoli.tsv o
  registro/questioni.tsv. Se la sigla e' stata rinumerata o rimossa dalla bacheca, si
  toglie la riga da $TRADUZIONI; se manca ancora nei registri, si rigenera prima la
  proiezione con scripts/genera-registri-di-vincoli-e-questioni.py."
fi

# --- Verdetto. ---

if [ "$esito" -eq 0 ]; then
  n_def=$(wc -l < "$definite")
  n_cit=$(wc -l < "$temporanea/citate-IT")
  printf '\033[32m✓ %d sigle definite, %d citate per lingua, tutte risolvono e le due lingue coincidono.\033[0m\n' \
    "$n_def" "$n_cit"
  printf '\033[32m✓ %s vincoli fondanti dichiarati nel capitolo che li pubblica, tutte le citazioni risolvono.\033[0m\n' \
    "$(wc -l < "$temporanea/fondanti-IT")"
else
  printf '\n\033[31m✗ Rilievi: %d\033[0m\n' "$rilievi"
fi

exit "$esito"
