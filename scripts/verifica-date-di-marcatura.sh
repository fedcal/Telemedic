#!/usr/bin/env bash
# Nessuna data di marcatura nei documenti pubblici e in quelli diretti a un terzo.
#
# E' il criterio 8 di T-01, il criterio 5 di T-14 e il criterio bloccante di rilascio n. 15 di
# docs/09_roadmap/03-primo-rilascio-utilizzabile.md §8. La regola sta scritta per esteso al §11,
# regola 4, di docs/08_compliance/01-inquadramento-normativo.md: «nessuna data, nessuna finestra
# temporale, nessun "entro"», e l'unica occorrenza ammessa e' dentro l'enunciato del divieto stesso.
#
# PERCHE' ESISTE. Fino al 27 agosto 2026 nessuno script del repository falliva se un documento
# affermava una data di marcatura. verifica-conformita-redazionale.sh verifica il frontmatter, i
# rinvii relativi e i segnaposto di segreti; verifica-dichiarazione-non-marcatura.sh verifica la
# PRESENZA della dichiarazione su un artefatto pubblicato, che e' la proprieta' complementare e non
# questa. La tabella di collocazione faceva credere il contrario, attribuendo il criterio 8 di T-01
# al controllo redazionale, che non lo verifica affatto: e' la voce D-24 del runbook degli errori.
#
# IL CRITERIO, E PERCHE' E' DELIBERATAMENTE STUPIDO. Il controllo cerca la CO-OCCORRENZA, dentro
# uno stesso capoverso, di due cose: una menzione della marcatura o di una dichiarazione di
# conformita', e un riferimento temporale. Non prova a capire se il riferimento temporale riguardi
# davvero la marcatura. Un controllo che deve capire il senso di una frase e' un controllo che
# fallira' in silenzio proprio nel caso che conta, e il costo di riformulare un capoverso innocente
# e' molto piu' basso del costo di una data di marcatura pubblicata. La conseguenza e' scritta nel
# piano di T-14: in questi documenti «entro», «a partire da» e «non oltre» non si usano in ALCUN
# senso, e la frase si riformula.
#
# I DOCUMENTI SORVEGLIATI stanno in pipeline/documenti-senza-data-di-marcatura.tsv, non qui: un
# controllo che porta dentro di se' una copia di cio' che sorveglia non sorveglia piu' (voce D-10).
#
# L'ECCEZIONE CHE LA REGOLA STESSA AMMETTE. Il §11 dice che l'unica occorrenza ammessa di quelle
# parole e' «dentro l'enunciato del divieto stesso»: il capoverso che VIETA di scrivere una data e'
# costretto a nominare sia la marcatura sia le forme temporali, o non enuncerebbe nulla. Nessun
# criterio testuale puo' distinguere l'enunciato del divieto dalla sua violazione, e non deve
# provarci. Quel capoverso si dichiara, con un marcatore che porta la ragione:
#
#     <!-- data-e-marcatura: enunciato del divieto, §11 regola 4 -->
#
# Il marcatore vale per il capoverso in cui compare e per nessun altro, e la ragione e'
# obbligatoria - un marcatore nudo e' un'esenzione senza motivo, cioe' esattamente cio' che questo
# controllo esiste per impedire. E' la stessa disciplina del marcatore di
# scripts/verifica-dati-sintetici.sh, e la divergenza da G11 - che le eccezioni le tiene in un file
# centrale - e' deliberata: qui l'eccezione e' intrinsecamente locale al capoverso, e un elenco
# centrale che dicesse «riga 86 di quel file» sarebbe falso alla prima riscrittura.
#
# IL CAPOVERSO E' L'UNITA'. Non la riga - una tabella Markdown mette in una riga sola cose che
# nella pagina stanno lontane - e non il documento intero, che darebbe un falso positivo su
# qualunque testo che nomini la marcatura in un punto e una data in un altro per ragioni diverse.
set -euo pipefail

cd "$(dirname "$0")/.."

ELENCO="${DOCUMENTI_SENZA_DATA:-pipeline/documenti-senza-data-di-marcatura.tsv}"

if [ ! -r "$ELENCO" ]; then
  printf '\033[31m✗ elenco dei documenti sorvegliati assente o illeggibile: %s\033[0m\n' "$ELENCO"
  printf '  Senza di esso il controllo non sa quali documenti guardare, e non lo indovina:\n'
  printf '  si ripristina il file, non si disattiva il controllo.\n'
  exit 2
fi

# Le due famiglie di espressioni. Restano qui e non nel file di elenco perche' NON sono la cosa
# sorvegliata: sono la regola, che il §11 fissa e che non cambia da un documento all'altro.
#
# TRAPPOLA GIA' PAGATA, 27 agosto 2026. La prima stesura scriveva i confini di parola come «\b»,
# che e' sintassi PCRE e NON e' sintassi ERE: gawk non la riconosce, ogni alternativa della famiglia
# temporale conteneva un «\b», e quindi NESSUNA corrispondeva mai. Il controllo passava sul
# repository reale e passava anche sulle tenute deliberatamente non conformi - cioe' era verde
# sempre, che e' la forma peggiore di guasto. Se ne e' accorto il collaudo sulle tenute, non la
# lettura del codice. I confini si scrivono qui con classi POSIX, che gawk riconosce.
#
# I confini di parola servono davvero e non sono decorazione: senza, «entro» corrisponde dentro
# «centro» e «marcato» dentro «demarcato».
CONF_S='(^|[^[:alnum:]])'
CONF_D='([^[:alnum:]]|$)'
MARCATURA_PAROLE='marcatura|marcato|marcata|marcati|marchiatura|marking|CE mark|dichiarazione di conformità|declaration of conformity|certificazione|certificato|certificata|certification|certified'
TEMPO_PAROLE='entro|non oltre|a partire da|no later than|by the end of|starting from|gennaio|febbraio|marzo|aprile|maggio|giugno|luglio|agosto|settembre|ottobre|novembre|dicembre|January|February|March|April|May|June|July|August|September|October|November|December|primo trimestre|secondo trimestre|terzo trimestre|quarto trimestre|first quarter|second quarter|third quarter|fourth quarter'
# L'anno ha un confine proprio, numerico: «2029» dentro «12029» non e' un anno.
#
# E NON E' UN ANNO NEMMENO IL NUMERO DI UN ATTO NORMATIVO. «Regolamento (UE) 2017/745» contiene
# «2017», che non e' un riferimento temporale ma meta' di un identificativo: la barra e il numero
# che segue lo dicono. Alla prima esecuzione sul repository reale undici rilievi su quindici erano
# esattamente questo, e ammetterli uno per uno avrebbe reso permanente un criterio sbagliato -
# voce D-25 del runbook, che questo controllo ha rischiato di ripetere il giorno stesso in cui
# quella voce e' stata scritta. Il criterio si corregge: un anno seguito da «/cifre» e' la
# numerazione di un atto e non una data.
TEMPO_ANNO='(^|[^0-9])20[0-9]{2}([^0-9/]|$)'

MARCATURA="${CONF_S}(${MARCATURA_PAROLE})${CONF_D}"
TEMPO="${CONF_S}(${TEMPO_PAROLE})${CONF_D}|${TEMPO_ANNO}"

errori=0
esaminati=0

segnala() {
  printf '\033[31m✗ %s, capoverso alla riga %s\033[0m\n' "$1" "$2"
  printf '  marcatura: «%s»   ·   tempo: «%s»\n' "$3" "$4"
  printf '  %s\n' "$5"
  errori=$((errori+1))
}

while IFS= read -r _r || [ -n "${_r:-}" ]; do
  percorso=$(printf '%s' "${_r:-}" | cut -f1)
  motivo=$(printf '%s' "${_r:-}" | cut -f2)
  case "$percorso" in ''|'#'*|percorso) continue ;; esac

  if [ ! -f "$percorso" ]; then
    printf '\033[31m✗ documento dichiarato e assente: %s\033[0m\n' "$percorso"
    printf '  L%s elenco lo sorveglia ma il file non esiste. Un elenco che nomina un file inesistente\n' "'"
    printf '  sorveglia il nulla: si corregge la riga, o si ripristina il documento.\n'
    errori=$((errori+1))
    continue
  fi
  esaminati=$((esaminati+1))

  # Il capoverso: blocchi separati da riga vuota. awk accumula e valuta ciascun blocco, riportando
  # la riga di inizio perche' un rilievo senza coordinata e' un rilievo che nessuno va a cercare.
  rilievi=$(awk -v MARC="$MARCATURA" -v TEMP="$TEMPO" '
    function valuta(   m, t, r) {
      if (blocco == "") return
      m = ""; t = ""
      if (match(blocco, MARC)) m = substr(blocco, RSTART, RLENGTH)
      if (m == "") { blocco = ""; return }
      if (match(blocco, TEMP)) t = substr(blocco, RSTART, RLENGTH)
      if (t == "") { blocco = ""; return }
      # Il marcatore, se c'e', deve portare una ragione non vuota.
      if (match(blocco, /<!--[[:space:]]*data-e-marcatura:[[:space:]]*[^-][^>]*-->/)) {
        r = substr(blocco, RSTART, RLENGTH)
        sub(/^<!--[[:space:]]*data-e-marcatura:[[:space:]]*/, "", r)
        sub(/[[:space:]]*-->$/, "", r)
        if (r != "") { blocco = ""; return }
      }
      if (match(blocco, /<!--[[:space:]]*data-e-marcatura:[[:space:]]*-->/)) {
        printf "%s\t%s\t%s\t%s\n", inizio, "MARCATORE SENZA RAGIONE", "", ""
        blocco = ""
        return
      }
      gsub(/^[^[:alnum:]]+|[^[:alnum:]]+$/, "", m)
      gsub(/^[^[:alnum:]]+|[^[:alnum:]]+$/, "", t)
      printf "%s\t%s\t%s\n", inizio, m, t
      blocco = ""
    }
    /^[[:space:]]*$/ { valuta(); next }
    { if (blocco == "") inizio = NR; blocco = blocco " " $0 }
    END { valuta() }
  ' "$percorso")

  if [ -n "$rilievi" ]; then
    while IFS= read -r _r || [ -n "${_r:-}" ]; do
    riga=$(printf '%s' "${_r:-}" | cut -f1)
    m=$(printf '%s' "${_r:-}" | cut -f2)
    t=$(printf '%s' "${_r:-}" | cut -f3)
      if [ "$m" = "MARCATORE SENZA RAGIONE" ]; then
        printf '\033[31m✗ %s, capoverso alla riga %s: marcatore «data-e-marcatura» senza ragione\033[0m\n' "$percorso" "$riga"
        printf '  Un marcatore nudo e\x27 un\x27esenzione senza motivo. La ragione si scrive dentro il marcatore\n'
        printf '  e passa in revisione insieme al capoverso che esenta.\n'
        errori=$((errori+1))
      else
        segnala "$percorso" "$riga" "$m" "$t" "$motivo"
      fi
    done <<< "$rilievi"
  fi
done < "$ELENCO"

if [ "$errori" -gt 0 ]; then
  printf '\n\033[31m✗ Rilievi: %s\033[0m\n' "$errori"
  printf 'In questi documenti una menzione della marcatura e un riferimento temporale non stanno\n'
  printf 'nello stesso capoverso, in nessun senso. Non si raffina il controllo perche' "'"
  printf ' distingua i\nsensi: si riformula la frase, che costa una riga.\n'
  exit 1
fi

printf '\033[32m✓ %s documenti sorvegliati, nessuna data di marcatura.\033[0m\n' "$esaminati"
