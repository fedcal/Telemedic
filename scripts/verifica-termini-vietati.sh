#!/usr/bin/env bash
# Controllo di costruzione - G11, regola di riservatezza R0 (docs/01_technical/09 §3, §9.2 di
# docs/10_fondamenti/17).
#
# R0 dice che nessun nome di azienda, marchio, prodotto commerciale o dominio di un potenziale
# partner compare in alcun artefatto del progetto - documenti, codice, commenti, esempi di
# configurazione, messaggi di commit - e che si scrive sempre la categoria generica: «un
# gestionale sanitario cloud», «l'integratore», «un organismo notificato». Non e' una preferenza
# redazionale: esistono ragioni di riservatezza che non spettano a chi contribuisce.
#
# IL PARADOSSO, E LA VIA SCELTA.
# Il §3 definisce G11 come «una lista di termini vietati, versionata». Versionarla qui significa
# scrivere nel repository pubblico esattamente i nomi che R0 vieta di scrivervi - anzi peggio:
# una menzione sparsa e' un accidente, un elenco intitolato «aziende che non vanno nominate» e'
# un registro curato dei rapporti del progetto, pubblicato con intenzione. Il controllo
# commetterebbe, per esistere, la violazione che esiste per impedire.
# La via scelta e' a due strati, e i due strati hanno regimi opposti di pubblicita'.
#
#   STRATO 1 - CRITERI STRUTTURALI, IN CHIARO, SEMPRE ATTIVI. Non cerca nomi: cerca le POSIZIONI
#   in cui un nome commerciale si manifesta per forma, e in quelle posizioni applica un
#   VOCABOLARIO CHIUSO - un elenco di ammissione, non di divieto. Un nome di host, un indirizzo
#   di posta, un marcatore di marchio, una forma societaria, una coordinata a dominio inverso
#   sono forme riconoscibili senza sapere quali nomi cercare. L'elenco di cio' che e' AMMESSO in
#   quelle posizioni si pubblica senza danno: contiene organismi di normazione, istituzioni
#   pubbliche, domini riservati dalle RFC e l'infrastruttura del progetto, cioe' soltanto nomi
#   gia' presenti in chiaro nel corpus, e non dice nulla su alcun rapporto commerciale.
#   Sta in pipeline/termini-ammessi.tsv. E' il rovesciamento che scioglie il paradosso: si
#   pubblica il complemento, mai l'insieme protetto.
#
#   STRATO 2 - ELENCO SPECIFICO PER IMPRONTA, FUORI DAL REPOSITORY, SPENTO PER DIFETTO. Copre
#   cio' che lo strato 1 non puo' vedere per costruzione: il nome che ha la forma di una parola
#   qualunque. Il controllo non conosce i termini: calcola l'impronta dei candidati che trova nel
#   corpus e la confronta con un elenco di impronte che riceve dall'esterno, per
#   ${TERMINI_VIETATI_ELENCO}. Non essendo impostata, lo strato non gira - e il controllo LO
#   DICHIARA in uscita, ogni volta, anche quando esce verde.
#
# PERCHE' L'ELENCO SPECIFICO NON E' VERSIONATO QUI, NEMMENO PER IMPRONTA.
# Perche' la storia di git non dimentica. Un'impronta scritta oggi resta in ogni copia clonata e
# in ogni specchio per sempre, e le impronte non salate di nomi commerciali brevi si enumerano
# per tentativi in tempo trascurabile. Un sale forte renderebbe l'elenco opaco, ma legherebbe la
# protezione a un segreto che deve reggere PER SEMPRE e RETROATTIVAMENTE su ogni voce mai
# inserita, comprese quelle tolte perche' il rapporto e' finito: il giorno che il sale trapela,
# trapela l'intera storia. R0 protegge una proprieta' irreversibile - «un periodo di
# pubblicazione non si annulla» - e una protezione revocabile all'indietro e' della forma
# sbagliata. Si aggiunge che l'elenco versionato qui non servirebbe comunque a chi clona, perche'
# senza il sale non potrebbe usarlo: costerebbe l'irreversibilita' e comprerebbe l'apparenza di
# una lista versionata.
#
# IL CONTROLLO NON RISTAMPA CIO' CHE TROVA.
# Stessa decisione, e stessa ragione, di scripts/verifica-dati-sintetici.sh: un controllo che
# riversa nel registro della costruzione il valore trovato lo pubblica una seconda volta, in un
# archivio che sopravvive alla correzione del file. Qui vale con piu' forza, perche' il registro
# della catena e' pubblico e perche' il valore trovato e' precisamente il nome che R0 protegge.
# I rilievi riportano percorso, riga e motivo, e del valore solo un frammento oscurato. Non e'
# una perdita di utilita': chi ha scritto quella riga sa gia' che cosa ci ha scritto, e chi
# rivede la apre. A perderci e' solo chi legge il registro dall'esterno, che e' esattamente
# l'obiettivo.
# Per la stessa ragione NON esiste un'opzione «mostra in chiaro»: sarebbe una variabile
# d'ambiente che qualcuno, prima o poi, imposta nel flusso di lavoro pubblico.
#
# NESSUN MARCATORE DA RIGA, A DIFFERENZA DI G10.
# verifica-dati-sintetici.sh ammette «dato-reale-consentito:» sulla riga. Qui no: l'eccezione si
# scrive in pipeline/termini-ammessi.tsv, dove passa in revisione insieme alla modifica ed e'
# leggibile tutta in un posto. Un marcatore sparso nei file e' invisibile a chi rivede, e
# l'eccezione a una regola di riservatezza altrui non e' una decisione da prendere in una riga.
#
# CHE COSA QUESTO CONTROLLO NON INTERCETTA. Le esclusioni sono decisioni, e stanno scritte perche'
# un verde non venga letto per piu' di quello che vale. L'elenco ragionato e' nella sezione 5 di
# .telemedic/piani/G11-regola-di-riservatezza.md; qui la sostanza:
#   - Un nome commerciale che sia una parola qualunque, scritto in minuscolo dentro la prosa e
#     senza alcuna forma commerciale intorno. Lo strato 1 non lo vede per costruzione; lo strato 2
#     lo vede solo se il termine e' nell'elenco specifico e solo se il nome compare con iniziale
#     maiuscola o come segmento di un identificativo.
#   - Qualunque nome dentro un'immagine. Una schermata con il marchio di un fornitore e' una
#     violazione di R0 perfetta e invisibile a un controllo che legge testo. E' la lacuna piu'
#     grave e non ha rimedio automatico.
#   - Titoli di segnalazione e di proposta di modifica, discussioni, descrizioni di rilascio:
#     vivono sulla piattaforma, non nel repository. Il controllo li' non arriva.
#   - I nomi di persona. R0 nomina aziende, marchi, prodotti e domini; il nome del referente di un
#     partner e' altrettanto disvelante e non ha forma riconoscibile.
#   - Gli ambiti dei pacchetti (@fornitore/pacchetto) e i nomi delle dipendenze: sono governati da
#     G2 e G5, che li nominano per mestiere. Un partner consegnato come dipendenza e' un problema
#     di R0 che lo strato 1 non presidia.
#   - La cronologia dei messaggi di commit non e' esaminata per difetto: solo l'intervallo che si
#     indica in ${TERMINI_VIETATI_COMMIT}.
#   - .telemedic/ e' escluso dal perimetro esaminato dal 27 agosto 2026: R0 presidia cio' che il
#     progetto PUBBLICA, e .telemedic/ e' il contesto di lavoro interno, non il prodotto
#     pubblicato - anche se versionato nello stesso repository. Decisione del committente, con la
#     misura che l'ha motivata (124 rilievi al 26 agosto 2026, 118 dentro .telemedic/) nel
#     commento accanto all'esclusione stessa, piu' sotto.
#
# CIO' CHE GIT IGNORA NON E' SORVEGLIATO, ED E' UN'ESCLUSIONE DERIVATA E NON COPIATA.
# Un artefatto generato e mai versionato - come graphify-out/, presente nel .gitignore dal 27
# agosto 2026 ma assente dal repository - non e' cio' che questo controllo sorveglia, e un
# rilievo su un file che il repository non contiene sarebbe un allarme permanente a ogni nuovo
# artefatto. L'esclusione si ricava da una sola invocazione di
# «git ls-files --others --ignored --exclude-standard --directory» sulla radice esaminata:
# interrogare git file per file sarebbe inaccettabile su un corpus di questa dimensione. Quando
# git non e' disponibile, oppure la radice esaminata non e' (dentro) un albero di lavoro git - il
# caso delle tenute del banco, che vivono in cartelle temporanee fuori da qualunque repository -
# il controllo NON fallisce e NON esce con errore: prosegue con le sole esclusioni statiche
# dichiarate piu' sotto, perche' quel ripiego e' precisamente la condizione in cui il collaudo
# stesso deve poter girare.
#
# COLLAUDABILITA'. Tutto e' pilotabile da variabili d'ambiente, con la convenzione gia' in uso in
# scripts/verifica-dati-sintetici.sh e scripts/verifica-dichiarazione-non-marcatura.sh:
#   RADICE_SORGENTI           radice da esaminare (per difetto la radice del repository)
#   TERMINI_AMMESSI           elenco di ammissione (per difetto pipeline/termini-ammessi.tsv)
#   TERMINI_VIETATI_ELENCO    elenco di impronte; non impostata = strato 2 spento
#   TERMINI_VIETATI_COMMIT    intervallo git da esaminare; non impostata = commit non esaminati
# Nessuna esegue rete. Lo strato 2 richiede python3 oppure perl per calcolare le impronte in un
# solo processo: dove non ci sono, e solo se lo strato 2 e' stato richiesto, il controllo esce con
# errore di configurazione invece di girare a vuoto. Lo strato 1 non richiede altro che find, awk
# e una shell.
set -euo pipefail

# Semantica a byte, identica su ogni implementazione di awk: la normalizzazione dei candidati
# entra nel calcolo di un'impronta, e due macchine che normalizzano diversamente produrrebbero
# impronte diverse - cioe' un controllo che trova su una macchina e non trova sull'altra, in
# silenzio.
export LC_ALL=C

cd "$(dirname "$0")/.."

RADICE_SORGENTI="${RADICE_SORGENTI:-.}"
RADICE_SORGENTI="${RADICE_SORGENTI%/}"
[ -n "$RADICE_SORGENTI" ] || RADICE_SORGENTI="/"
TERMINI_AMMESSI="${TERMINI_AMMESSI:-pipeline/termini-ammessi.tsv}"
TERMINI_VIETATI_ELENCO="${TERMINI_VIETATI_ELENCO:-}"
TERMINI_VIETATI_COMMIT="${TERMINI_VIETATI_COMMIT:-}"

CANARINO='CANARIO-G11'

# Forma estesa e non «[ $# -gt 1 ] && printf»: sotto «set -e» una lista AND che finisce falsa fa
# uscire la shell subito, e con stato uno - cioe' un errore di CONFIGURAZIONE si presenterebbe
# come un rilievo. Sono due cose diverse e chi legge la catena deve poterle distinguere.
errore_configurazione() {
  printf '\033[31m✗ %s\033[0m\n' "$1"
  if [ $# -gt 1 ]; then printf '%s\n' "$2"; fi
  exit 2
}

# --- La normalizzazione, in un solo posto. ---
#
# Vale sia per i candidati estratti dal corpus sia per il termine passato a --impronta: se le due
# strade divergessero, l'elenco non troverebbe mai nulla e il controllo uscirebbe verde per
# sempre. Si scartano i byte non ASCII, si passa a minuscole, ogni sequenza che non sia lettera o
# cifra diventa un solo spazio, si tolgono gli spazi ai bordi.
normalizza() {
  awk '{ gsub(/[^ -~]/, ""); s = tolower($0); gsub(/[^a-z0-9]+/, " ", s);
         gsub(/^ +| +$/, "", s); print s }'
}

# --- Il calcolatore di impronte: legge righe, scrive un'impronta esadecimale per riga. ---
#
# Il sale viaggia in una variabile d'ambiente e non fra gli argomenti: gli argomenti sono
# leggibili nella tabella dei processi da chiunque, e finirebbero nella storia della shell di chi
# esegue il controllo a mano.
scegli_calcolatore() {
  if command -v python3 >/dev/null 2>&1; then printf 'python3\n'
  elif command -v perl >/dev/null 2>&1; then printf 'perl\n'
  else printf '\n'
  fi
}

impronte_da_flusso() {   # $1 = sale ; legge righe su stdin
  local sale="$1" calcolatore
  calcolatore=$(scegli_calcolatore)
  case "$calcolatore" in
    python3)
      SALE_G11="$sale" python3 -c '
import os, sys, hashlib
sale = os.environ["SALE_G11"].encode("utf-8")
for riga in sys.stdin.buffer:
    print(hashlib.sha256(sale + b"\n" + riga.rstrip(b"\n")).hexdigest())
' ;;
    perl)
      SALE_G11="$sale" perl -e '
use strict; use warnings; use Digest::SHA qw(sha256_hex);
my $sale = $ENV{"SALE_G11"};
while (my $r = <STDIN>) { chomp $r; print sha256_hex($sale . "\n" . $r), "\n"; }
' ;;
    *)
      errore_configurazione \
        "Lo strato specifico e' stato richiesto ma non c'e' modo di calcolare le impronte." \
"Serve python3 oppure perl. Nessuno dei due e' presente. Il controllo NON prosegue senza: girare
lo strato specifico a vuoto significherebbe uscire verde senza aver cercato nulla."
      ;;
  esac
}

# --- Modo --impronta: calcola l'impronta di un termine letto dallo standard input. ---
#
# Dallo standard input e non dagli argomenti, apposta: un termine vietato passato come argomento
# resta nella storia della shell e nella tabella dei processi. Non stampa mai il termine, solo
# l'impronta.
if [ "${1:-}" = "--impronta" ]; then
  [ -n "$TERMINI_VIETATI_ELENCO" ] || errore_configurazione \
    "Serve TERMINI_VIETATI_ELENCO: l'impronta dipende dal sale, e il sale sta nell'elenco." \
"Uso:  printf '%s' 'il termine' | TERMINI_VIETATI_ELENCO=<percorso> $0 --impronta"
  [ -r "$TERMINI_VIETATI_ELENCO" ] || errore_configurazione \
    "Elenco di impronte non leggibile: $TERMINI_VIETATI_ELENCO"
  sale=$(awk -F'\t' '$1=="sale" {print $2; exit}' "$TERMINI_VIETATI_ELENCO")
  [ -n "$sale" ] || errore_configurazione \
    "L'elenco non dichiara alcun sale nella forma «sale<TAB><valore>»."
  normalizza | impronte_da_flusso "$sale"
  exit 0
fi

if [ "${1:-}" = "--aiuto" ] || [ "${1:-}" = "-h" ]; then
  # Fino alla prima riga non commentata, non fino a un numero fisso: un intervallo scritto a mano
  # si stacca dal testo alla prima riga aggiunta, e l'aiuto comincia a mentire in silenzio.
  awk 'NR == 1 { next } !/^#/ { exit } { sub(/^# ?/, ""); print }' "$0" 
  exit 0
fi

if [ $# -gt 0 ]; then
  errore_configurazione "Argomento non riconosciuto: $1" "Modi ammessi: nessun argomento, --impronta, --aiuto."
fi

[ -d "$RADICE_SORGENTI" ] || errore_configurazione \
  "Radice da esaminare inesistente: $RADICE_SORGENTI" \
"Indica una directory esistente con RADICE_SORGENTI, oppure esegui il controllo dalla radice del
repository."
[ -r "$TERMINI_AMMESSI" ] || errore_configurazione \
  "Elenco di ammissione non leggibile: $TERMINI_AMMESSI" \
"Senza elenco di ammissione ogni dominio citato nel corpus sarebbe un rilievo, cioe' il controllo
sarebbe rumore. Indicane uno con TERMINI_AMMESSI."

# --- Lo strato specifico: presenza, coerenza, canarino. ---

STRATO2=0
SALE=''
IMPRONTE_ATTESE=''
if [ -n "$TERMINI_VIETATI_ELENCO" ]; then
  [ -r "$TERMINI_VIETATI_ELENCO" ] || errore_configurazione \
    "Elenco di impronte non leggibile: $TERMINI_VIETATI_ELENCO"
  SALE=$(awk -F'\t' '$1=="sale" {print $2; exit}' "$TERMINI_VIETATI_ELENCO")
  [ -n "$SALE" ] || errore_configurazione \
    "L'elenco non dichiara alcun sale." "Attesa una riga «sale<TAB><valore>» prima delle impronte."
  IMPRONTE_ATTESE=$(awk -F'\t' '$1=="impronta" && $2 ~ /^[0-9a-f]{64}$/ {print $2}' "$TERMINI_VIETATI_ELENCO" | sort -u)
  [ -n "$IMPRONTE_ATTESE" ] || errore_configurazione \
    "L'elenco non contiene alcuna impronta ben formata." \
"Un elenco vuoto farebbe girare lo strato specifico senza cercare nulla, e uscirebbe verde."
  # Il canarino. Una lista di impronte non e' ispezionabile - non la si puo' guardare e dire se e'
  # giusta - quindi deve portare la propria prova di coerenza: l'impronta di una stringa pubblica
  # e fissa, calcolata con il sale dichiarato. Se non c'e', l'elenco e il sale non si
  # corrispondono, e il controllo esce con errore invece che con un verde privo di significato.
  impronta_canarino=$(printf '%s\n' "$CANARINO" | normalizza | impronte_da_flusso "$SALE")
  printf '%s\n' "$IMPRONTE_ATTESE" | grep -qx "$impronta_canarino" || errore_configurazione \
    "L'elenco di impronte non e' coerente con il proprio sale." \
"Manca l'impronta del canarino «$CANARINO». Questo accade quando il sale e' stato cambiato senza
ricalcolare le impronte, quando il file e' troncato, o quando e' stato indicato l'elenco
sbagliato. Il controllo non prosegue: uno strato specifico incoerente non trova mai nulla e
uscirebbe verde per sempre."
  STRATO2=1
fi

# --- I messaggi di commit, se richiesti. ---

TEMPORANEA=''
# La forma estesa, e il ritorno esplicito dello stato, non sono pignoleria: in bash il codice di
# uscita di uno script e' quello dell'ULTIMO COMANDO DELLA TRAPPOLA DI USCITA quando questa non
# termina con un ritorno esplicito. Scritta come «[ -n "$TEMPORANEA" ] && rm -rf ...», la
# trappola faceva uscire con uno ogni esecuzione andata a buon fine - cioe' un controllo pulito
# che dichiarava di aver trovato qualcosa. E' costato mezz'ora di ricerca nel posto sbagliato.
pulisci() {
  uscita=$?
  if [ -n "$TEMPORANEA" ]; then rm -rf "$TEMPORANEA"; fi
  return "$uscita"
}
trap pulisci EXIT

N_COMMIT=0
if [ -n "$TERMINI_VIETATI_COMMIT" ]; then
  command -v git >/dev/null 2>&1 || errore_configurazione \
    "TERMINI_VIETATI_COMMIT e' impostata ma git non e' disponibile."
  TEMPORANEA=$(mktemp -d)
  mkdir -p "$TEMPORANEA/commit"
  # R0 nomina esplicitamente i messaggi di commit. Si esamina l'intervallo indicato e non tutta la
  # cronologia: riscrivere un messaggio gia' spinto non e' una correzione, e un controllo che
  # fallisse per sempre su un commit vecchio verrebbe spento entro la settimana. L'intervallo utile
  # e' quello della proposta di modifica in corso.
  git -C "$RADICE_SORGENTI" rev-list "$TERMINI_VIETATI_COMMIT" >"$TEMPORANEA/sha" 2>/dev/null || \
    errore_configurazione "Intervallo git non valido: $TERMINI_VIETATI_COMMIT"
  while read -r sha; do
    [ -n "$sha" ] || continue
    git -C "$RADICE_SORGENTI" log -1 --format=%B "$sha" >"$TEMPORANEA/commit/${sha}.messaggio"
    N_COMMIT=$((N_COMMIT+1))
  done <"$TEMPORANEA/sha"
fi

# --- Esclusione di cio' che git ignora, derivata e non copiata. ---
#
# Vedi il commento in testa a questo file per la motivazione. Una sola invocazione di git per
# l'intero controllo. «--directory» fa si' che una directory interamente ignorata compaia una
# volta sola, con la barra finale (p.es. «graphify-out/»); un file ignorato dentro una directory
# altrimenti tracciata compare per conto proprio, senza barra finale - i due casi si trattano
# diversamente nel filtro applicato piu' sotto all'elenco prodotto da find.
IGNORATI_GIT=""
if command -v git >/dev/null 2>&1 \
   && git -C "$RADICE_SORGENTI" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  IGNORATI_GIT=$(git -C "$RADICE_SORGENTI" ls-files --others --ignored --exclude-standard --directory 2>/dev/null || true)
fi

# --- I file da esaminare. ---
#
# Stesse esclusioni di scripts/verifica-dati-sintetici.sh, e per le stesse ragioni: i binari non
# contengono nomi in forma leggibile, e scripts/prove contiene tenute costruite apposta per far
# fallire i controlli. L'esclusione dei binari e' un LIMITE dichiarato, non una copertura: un nome
# dentro una schermata non lo vede nessuno.
# I file SVG sono l'unica differenza rispetto a G10, e sono INCLUSI: sono testo, e un marchio in un
# disegno vettoriale sta nel titolo o nei metadati, dove si legge. Un logo di terze parti che
# entrasse fra le immagini del sito e' esattamente la violazione di R0 che nessun altro controllo
# vedrebbe, e questa e' la sola forma di immagine in cui si puo' vedere qualcosa.
#
# .telemedic/ E' ESCLUSO, ED E' UNA DECISIONE E NON UNA LACUNA. R0 presidia cio' che il progetto
# PUBBLICA nel proprio percorso principale; .telemedic/ e' il contesto di lavoro interno -
# appunti di ricerca, piani, bacheca inter-agenti - non materiale che il progetto distribuisce
# come proprio prodotto, anche se versionato nello stesso repository pubblico. Decisione del
# committente del 27 agosto 2026: al 26 agosto 2026 il controllo produceva 124 rilievi, 118 dei
# quali dentro .telemedic/ - citazioni di fonti nei documenti di ricerca, non nomi che il
# progetto sceglie di scrivere nel proprio materiale pubblicato. Restano sorvegliati tutti i
# percorsi che il progetto pubblica davvero: docs/, website/, la radice del repository, pipeline/,
# scripts/, .github/. In questo repository le esclusioni sono decisioni dichiarate, non lacune, e
# stanno scritte qui con la loro ragione.
file_esaminati=$(
  find "$RADICE_SORGENTI" \
    \( -name '.git' -o -name 'node_modules' \
       -o -path "$RADICE_SORGENTI/website/build" \
       -o -path "$RADICE_SORGENTI/website/.docusaurus" \
       -o -path "$RADICE_SORGENTI/scripts/prove" \
       -o -path "$RADICE_SORGENTI/.telemedic" \) -prune -o \
    -type f \
    ! -name '*.png' ! -name '*.jpg' ! -name '*.jpeg' ! -name '*.gif' ! -name '*.ico' \
    ! -name '*.pdf' ! -name '*.woff' ! -name '*.woff2' ! -name '*.ttf' \
    ! -name '*.eot' ! -name '*.zip' ! -name '*.gz' ! -name '*.tgz' ! -name '*.xz' \
    ! -name '*.bz2' ! -name '*.mp4' ! -name '*.webm' ! -name '*.mp3' ! -name '*.wav' \
    -print | sort
)

# Il filtro sull'elenco di find, non un'aggiunta al comando: applicato PRIMA dell'aggiunta dei
# messaggi di commit qui sotto, che vivono in $TEMPORANEA, fuori da $RADICE_SORGENTI, e non sono
# mai ignorati da git.
if [ -n "$IGNORATI_GIT" ] && [ -n "$file_esaminati" ]; then
  file_esaminati=$(
    printf '%s\n' "$file_esaminati" | awk -v prefisso_radice="$RADICE_SORGENTI/" -v ignorati="$IGNORATI_GIT" '
      BEGIN {
        n = split(ignorati, righe, "\n")
        for (i = 1; i <= n; i++) if (righe[i] != "") IGNORATO[righe[i]] = 1
        lp = length(prefisso_radice)
      }
      {
        relativo = (substr($0, 1, lp) == prefisso_radice) ? substr($0, lp + 1) : $0
        if (relativo in IGNORATO) next
        prefisso = ""; resto = relativo; escludi = 0
        while ((p = index(resto, "/")) > 0) {
          prefisso = prefisso substr(resto, 1, p)
          if (prefisso in IGNORATO) { escludi = 1; break }
          resto = substr(resto, p + 1)
        }
        if (!escludi) print
      }'
  )
fi

if [ -n "$TEMPORANEA" ] && [ "$N_COMMIT" -gt 0 ]; then
  file_esaminati=$(printf '%s\n%s\n' "$file_esaminati" "$(find "$TEMPORANEA/commit" -type f | sort)")
fi

file_esaminati=$(printf '%s\n' "$file_esaminati" | sed '/^$/d')
if [ -z "$file_esaminati" ]; then
  printf '\033[33m· Nessun file di testo sotto %s: controllo corretto a insieme vuoto.\033[0m\n' "$RADICE_SORGENTI"
  exit 0
fi
n_file=$(printf '%s\n' "$file_esaminati" | wc -l)

# --- La scansione. ---
#
# Una sola invocazione di awk su tutti i file. Emette due specie di riga sullo standard output:
#   RILIEVO   <regola> <file> <riga> <valore mascherato>
#   CANDIDATO <normalizzato> <file> <riga> <occorrenze>     (solo se lo strato 2 e' acceso)
# I candidati sono deduplicati sulla forma normalizzata: un nome che compare in cento punti
# produce una voce con il conteggio, non cento voci. Chi corregge parte dalla prima occorrenza, e
# la correzione e' comunque globale.
# Il programma di scansione sta in una variabile e non fra apici sulla riga di comando: il testo
# contiene apostrofi - la prosa italiana ne e' piena - e un programma awk racchiuso fra apici si
# spezzerebbe sul primo. Il documento qui sotto e' quotato, quindi la shell non tocca nulla.
PROGRAMMA_AWK=$(cat <<'FINE_AWK'
function origine(f,   b) {
  if (RADICE_COMMIT != "" && index(f, RADICE_COMMIT) == 1) {
    b = f; sub(/.*\//, "", b); sub(/\.messaggio$/, "", b)
    return "messaggio di commit " substr(b, 1, 12)
  }
  return f
}
function rip(s, n,   i, r) { r = ""; for (i = 0; i < n; i++) r = r s; return r }

# Oscuramento: quanto basta a ritrovare il valore aprendo quella riga, non abbastanza a leggerlo
# da qui. Per un nome di host si conserva la marca di primo livello, che non nomina nessuno e dice
# al lettore di che cosa si tratta.
function oscura(s,   n) { n = length(s); if (n <= 3) return rip("*", n); return substr(s, 1, 3) rip("*", n - 3) }
function oscura_host(h,   p, n, i, testa) {
  n = split(h, p, ".")
  if (n < 2) return oscura(h)
  testa = ""
  for (i = 1; i < n; i++) testa = testa (i > 1 ? "." : "") p[i]
  return oscura(testa) "." p[n]
}
function normalizza(s) {
  gsub(/[^ -~]/, "", s); s = tolower(s); gsub(/[^a-z0-9]+/, " ", s); gsub(/^ +| +$/, "", s)
  return s
}
# Un nome ammesso resta ammesso anche quando la parola che lo precede e' entrata nella cattura:
# «Marchio DICOM» deve essere riconosciuto da «dicom». Si prova la forma intera, poi si toglie una
# parola da sinistra alla volta. Senza questa scala ogni ammissione andrebbe ripetuta per ciascuna
# parola che puo' precederla, e l'elenco di ammissione diventerebbe una raccolta di combinazioni.
function nome_ammesso(testo,   parti, n, i, j, coda) {
  n = split(normalizza(testo), parti, " ")
  for (i = 1; i <= n; i++) {
    coda = ""
    for (j = i; j <= n; j++) coda = coda (j > i ? " " : "") parti[j]
    if (coda in NOME) return 1
  }
  return 0
}
function rilievo(regola, valore) {
  printf "RILIEVO\t%s\t%s\t%d\t%s\n", regola, origine(FILENAME), FNR, valore
}
function host_ammesso(h,   parti, n, i, coda) {
  if (h in DOMINIO) return 1
  n = split(h, parti, ".")
  coda = ""
  for (i = n; i >= 1; i--) {
    coda = (coda == "") ? parti[i] : parti[i] "." coda
    if (coda in SUFFISSO) return 1
  }
  return 0
}
function annota_host(h,   pulito) {
  pulito = tolower(h)
  sub(/[.]+$/, "", pulito)
  if (pulito == "" || pulito !~ /[.]/) return
  if (pulito in VISTO_RIGA) return
  VISTO_RIGA[pulito] = 1
  if (host_ammesso(pulito)) return
  rilievo("dominio", oscura_host(pulito))
}
function candidato(testo,   n) {
  n = normalizza(testo)
  if (n == "" || length(n) < 3) return
  if (n in CONTA) { CONTA[n]++; return }
  CONTA[n] = 1
  PRIMO[n] = origine(FILENAME) "\t" FNR
}

BEGIN {
  FS = "\t"
  while ((getline riga < AMMESSI) > 0) {
    if (riga ~ /^#/ || riga == "") continue
    split(riga, c, "\t")
    if (c[1] == "tipo") continue
    if (c[1] == "dominio") {
      dom = tolower(c[2])
      if (index(dom, "*.") == 1) SUFFISSO[substr(dom, 3)] = 1
      else DOMINIO[dom] = 1
    } else if (c[1] == "nome") {
      NOME[normalizza(c[2])] = 1
    } else if (c[1] == "coordinata") {
      COORDINATA[tolower(c[2])] = 1
    }
  }
  close(AMMESSI)

  # Marche di primo livello ammesse per il riconoscimento di un nome di host SCRITTO NUDO, cioe'
  # senza schema e senza «www». Senza questo vincolo ogni «d.lgs», ogni «file.md» e ogni numero di
  # versione sarebbe letto come un dominio: e' gia' costato la prima versione di questo controllo.
  # L elenco e volutamente corto: la copertura che perde e dichiarata (un dominio nudo sotto una
  # marca non elencata non viene visto), quella che guadagna e non essere spento entro tre giorni.
  split("com net org edu gov io dev cloud health it eu de fr uk example invalid test localhost", marche, " ")
  for (i in marche) MARCA[marche[i]] = 1

  # Forme societarie. Sono la firma piu limpida di un nome di azienda: nessuna prosa italiana le
  # produce per caso. Sono escluse quelle ambigue - AG, SE, AB, Oy, Co - che collidono con parole
  # e sigle comuni: la loro assenza e dichiarata, e la ragione e che un controllo che segnala «se»
  # viene spento prima di aver trovato qualcosa.
  RE_SOC = "[A-Z][A-Za-z0-9&.-]*([ ][A-Z][A-Za-z0-9&.-]*){0,2}[ ]?(S\\.p\\.A\\.|S\\.P\\.A\\.|S\\.r\\.l\\.|S\\.R\\.L\\.|S\\.a\\.s\\.|S\\.n\\.c\\.|S\\.c\\.a\\.r\\.l\\.|GmbH|L\\.L\\.C\\.|LLC|B\\.V\\.|N\\.V\\.|Ltd\\.?|PLC|Inc\\.?|Corp\\.?|Pty)"

  # Marcatori di marchio. Il rilievo scatta sul NOME che li precede, non sul marcatore: un
  # marcatore isolato - come quelli che definiscono questa riga - non nomina nessuno e non e un
  # rilievo. E la ragione per cui questo file non fa fallire se stesso.
  RE_MAR = "[A-Z][A-Za-z0-9]*([ ][A-Z][A-Za-z0-9]*){0,2}(®|™|℠)"
}

{
  delete VISTO_RIGA
  prosa = (FILENAME ~ /\.(md|markdown|txt|adoc)$/ || FILENAME ~ /\.messaggio$/)

  # --- Regola 1: nomi di host. Tre contesti espliciti piu il nudo con marca nota. ---
  #
  # I file di blocco delle dipendenze sono generati da uno strumento, non scritti: i domini che
  # contengono sono dichiarati dagli autori dei componenti a monte - pagine di finanziamento,
  # siti personali - e non dicono nulla sui rapporti di questo progetto. Segnalarli produrrebbe
  # trecento rilievi che nessuno puo correggere, e il controllo verrebbe spento. Restano pero
  # esaminate le righe di RISOLUZIONE, dove compare il registro da cui il pacchetto viene preso:
  # un registro privato in un file di blocco e una divulgazione vera, ed e proprio la forma che
  # questa eccezione deve continuare a vedere.
  blocco_dipendenze = (FILENAME ~ /(package-lock\.json|npm-shrinkwrap\.json|yarn\.lock|pnpm-lock\.yaml|Cargo\.lock|poetry\.lock|composer\.lock)$/)
  if (blocco_dipendenze && $0 !~ /(resolved|registry|tarball|repository)/) esamina_host = 0
  else esamina_host = 1

  if (esamina_host && index($0, ".") > 0) {
    resto = $0
    while (match(resto, /[a-zA-Z][a-zA-Z0-9+.-]*:\/\/[A-Za-z0-9._~-]+/)) {
      tok = substr(resto, RSTART, RLENGTH); sub(/^[^:]*:\/\//, "", tok)
      annota_host(tok); resto = substr(resto, RSTART + RLENGTH)
    }
    resto = $0
    while (match(resto, /[A-Za-z0-9._%+-]+@[A-Za-z0-9-]+(\.[A-Za-z0-9-]+)+/)) {
      tok = substr(resto, RSTART, RLENGTH); sub(/^[^@]*@/, "", tok)
      resto = substr(resto, RSTART + RLENGTH)
      # La marca di primo livello di un indirizzo deve essere alfabetica: senza questo vincolo
      # ogni specifica di versione di un pacchetto - «qualcosa@3.9.2» - sarebbe letta come un
      # indirizzo. E la stessa trappola gia costata un falso positivo a G10, ed e annotata li.
      if (tok !~ /\.[A-Za-z][A-Za-z]+$/) continue
      annota_host(tok)
    }
    resto = $0
    while (match(resto, /(^|[^A-Za-z0-9._-])[Ww][Ww][Ww]\.[A-Za-z0-9._-]+/)) {
      tok = substr(resto, RSTART, RLENGTH); sub(/^.*[Ww][Ww][Ww]\./, "www.", tok)
      annota_host(tok); resto = substr(resto, RSTART + RLENGTH)
    }
    resto = $0; precedente = ""
    while (match(resto, /[A-Za-z0-9]([A-Za-z0-9-]*[A-Za-z0-9])?(\.[A-Za-z0-9]([A-Za-z0-9-]*[A-Za-z0-9])?)+/)) {
      tok = substr(resto, RSTART, RLENGTH)
      pre = (RSTART > 1) ? substr(resto, RSTART - 1, 1) : precedente
      post = substr(resto, RSTART + RLENGTH, 1)
      precedente = substr(resto, RSTART + RLENGTH - 1, 1)
      resto = substr(resto, RSTART + RLENGTH)
      if (pre ~ /[A-Za-z0-9._%+@:\/-]/ || post ~ /[A-Za-z0-9_-]/) continue
      n = split(tolower(tok), p, ".")
      if (!(p[n] in MARCA)) continue
      annota_host(tok)
    }
  }

  # --- Regola 2: forma societaria preceduta da un nome. ---
  if ($0 ~ /(S\.p\.A|S\.r\.l|S\.a\.s|S\.n\.c|GmbH|LLC|L\.L\.C|B\.V\.|N\.V\.|Ltd|PLC|Inc|Corp|Pty|S\.c\.a\.r\.l)/) {
    resto = $0
    while (match(resto, RE_SOC)) {
      tok = substr(resto, RSTART, RLENGTH)
      post = substr(resto, RSTART + RLENGTH, 1)
      resto = substr(resto, RSTART + RLENGTH)
      if (post ~ /[A-Za-z0-9]/) continue
      if (nome_ammesso(tok)) continue
      rilievo("forma societaria", oscura(tok))
    }
  }

  # --- Regola 3: marcatore di marchio preceduto da un nome. ---
  if ($0 ~ /(®|™|℠)/) {
    resto = $0
    while (match(resto, RE_MAR)) {
      tok = substr(resto, RSTART, RLENGTH)
      resto = substr(resto, RSTART + RLENGTH)
      nudo = tok; gsub(/(®|™|℠)/, "", nudo)
      if (nome_ammesso(nudo)) continue
      rilievo("marchio", oscura(nudo))
    }
  }

  # --- Regola 4: coordinata a dominio inverso (com.fornitore.modulo). ---
  # Non copre gli ambiti dei pacchetti: vedi la nota in testa allo script. Oggi non ha oggetto -
  # non esiste codice applicativo - ed e scritta adesso perche T-08 la trovi gia in esercizio.
  if ($0 ~ /(^|[^A-Za-z0-9])(com|org|net|io|it|eu|de)\.[a-z]/) {
    resto = $0
    while (match(resto, /(com|org|net|io|it|eu|de)\.[a-z][a-z0-9]*\.[a-z][A-Za-z0-9]*/)) {
      tok = substr(resto, RSTART, RLENGTH)
      pre = (RSTART > 1) ? substr(resto, RSTART - 1, 1) : ""
      resto = substr(resto, RSTART + RLENGTH)
      if (pre ~ /[A-Za-z0-9._\/-]/) continue
      split(tok, p, ".")
      if (tolower(p[2]) in COORDINATA) continue
      if (host_ammesso(tolower(p[2]) "." tolower(p[1]))) continue
      rilievo("coordinata", oscura(p[1] "." p[2]))
    }
  }

  # --- Strato 2: raccolta dei candidati. ---
  if (STRATO2 == 1) {
    if (prosa) {
      # Sequenze di parole con iniziale maiuscola, e i loro gruppi da una a tre parole: e la forma
      # in cui un nome proprio compare nella prosa. Un nome scritto in minuscolo dentro il discorso
      # non viene raccolto, ed e una lacuna dichiarata: raccogliere ogni parola significherebbe
      # segnalare ogni uso legittimo di un termine comune che si trovi nell elenco.
      resto = $0
      while (match(resto, /[A-Z][A-Za-z0-9]*([ ][A-Z][A-Za-z0-9]*)*/)) {
        seq = substr(resto, RSTART, RLENGTH)
        resto = substr(resto, RSTART + RLENGTH)
        m = split(seq, w, " ")
        for (i = 1; i <= m; i++) {
          candidato(w[i])
          if (i + 1 <= m) candidato(w[i] " " w[i+1])
          if (i + 2 <= m) candidato(w[i] " " w[i+1] " " w[i+2])
        }
      }
    } else {
      # Fuori dalla prosa un nome compare come segmento di identificativo: chiave di
      # configurazione, nome di modulo, valore di esempio. Si spezza su tutto cio che non e
      # alfanumerico e si tengono i segmenti di almeno quattro caratteri non tutti cifre.
      m = split($0, w, /[^A-Za-z0-9]+/)
      for (i = 1; i <= m; i++) {
        if (length(w[i]) < 4 || length(w[i]) > 40) continue
        if (w[i] ~ /^[0-9]+$/) continue
        candidato(w[i])
      }
    }
  }
}

END { for (k in CONTA) printf "CANDIDATO\t%s\t%s\t%d\n", k, PRIMO[k], CONTA[k] }
FINE_AWK
)

ESAMINATE=$(
  printf '%s\n' "$file_esaminati" | tr '\n' '\0' | xargs -0 awk \
    -v AMMESSI="$TERMINI_AMMESSI" -v STRATO2="$STRATO2" -v RADICE_COMMIT="${TEMPORANEA:-}" \
    "$PROGRAMMA_AWK"
)

rilievi=$(printf '%s\n' "$ESAMINATE" | grep '^RILIEVO' || true)

# --- Lo strato specifico: impronte dei candidati contro l'elenco. ---

n_candidati=0
if [ "$STRATO2" -eq 1 ]; then
  TEMPORANEA="${TEMPORANEA:-$(mktemp -d)}"
  printf '%s\n' "$ESAMINATE" | grep '^CANDIDATO' | cut -f2- >"$TEMPORANEA/candidati.tsv" || true
  if [ -s "$TEMPORANEA/candidati.tsv" ]; then
    n_candidati=$(wc -l <"$TEMPORANEA/candidati.tsv")
    cut -f1 "$TEMPORANEA/candidati.tsv" | impronte_da_flusso "$SALE" >"$TEMPORANEA/impronte"
    printf '%s\n' "$IMPRONTE_ATTESE" >"$TEMPORANEA/attese"
    # Il confronto avviene qui, in locale: nessun termine attraversa mai lo standard output.
    corrispondenze=$(paste "$TEMPORANEA/impronte" "$TEMPORANEA/candidati.tsv" | awk -F'\t' -v attese="$TEMPORANEA/attese" '
      BEGIN { while ((getline r < attese) > 0) A[r] = 1; close(attese) }
      $1 in A { printf "RILIEVO\telenco specifico\t%s\t%s\t%s\n", $3, $4, substr($2, 1, 2) "***" }
    ')
    [ -n "$corrispondenze" ] && rilievi=$(printf '%s\n%s\n' "$rilievi" "$corrispondenze" | sed '/^$/d')
  fi
fi

# --- Il verdetto. ---

esito=0
segnala() {
  printf '\n\033[31m✗ %s\033[0m\n%s\n' "$1" "$2"
  esito=1
}

if [ -n "$rilievi" ]; then
  for regola in "dominio" "forma societaria" "marchio" "coordinata" "elenco specifico"; do
    blocco=$(printf '%s\n' "$rilievi" | awk -F'\t' -v r="$regola" '$2==r {printf "  - %s:%s  (%s)\n", $3, $4, $5}')
    [ -z "$blocco" ] && continue
    case "$regola" in
      dominio) spiega="Un nome di host che non compare fra le ammissioni. Se e' un rapporto commerciale, riformula in
categoria generica: «un gestionale sanitario cloud», «l'integratore», «un organismo notificato».
Se e' una fonte o un'infrastruttura che il progetto puo' legittimamente citare, aggiungi la riga
in $TERMINI_AMMESSI, con il motivo: e' li' che le eccezioni passano in revisione." ;;
      "forma societaria") spiega="Un nome accostato a una forma societaria: e' la firma di una ragione sociale. R0 non ammette
il nome dell'azienda; ammette la categoria. Se il nome va citato per obbligo, la riga va in
$TERMINI_AMMESSI." ;;
      marchio) spiega="Un nome accostato a un marcatore di marchio. Se l'attribuzione e' imposta dalla politica di
marchio di un organismo di normazione, il nome va aggiunto come «nome» in $TERMINI_AMMESSI;
altrimenti va tolto." ;;
      coordinata) spiega="Un identificativo a dominio inverso il cui segmento di fornitore non e' ammesso. Un segmento entra
in $TERMINI_AMMESSI solo se il componente corrispondente e' gia' annotato in
pipeline/annotazioni-componenti.tsv, cioe' solo se e' gia' stato valutato." ;;
      *) spiega="Corrisponde a una voce dell'elenco specifico. Il controllo NON dice quale, e non lo dira': il
registro della costruzione e' pubblico, e ristampare il termine lo pubblicherebbe una seconda
volta in un archivio che sopravvive alla correzione. Apri il file alla riga indicata: il termine
e' li'. Va riformulato in categoria generica, non aggirato." ;;
    esac
    segnala "Regola R0 - $regola" "$blocco
$spiega"
  done
fi

printf '\n'
if [ "$esito" -eq 0 ]; then
  printf '\033[32m✓ %s file esaminati, nessun rilievo di riservatezza.\033[0m\n' "$n_file"
fi

# Lo stato degli strati si dichiara SEMPRE, verde o rosso che sia. Un controllo che non dice quale
# meta' di se stesso ha eseguito trasforma un verde parziale in una rassicurazione intera, ed e' il
# modo in cui un controllo comincia a mentire senza che nessuno lo abbia toccato.
printf '· strato strutturale: attivo (ammissioni da %s).\n' "$TERMINI_AMMESSI"
if [ "$STRATO2" -eq 1 ]; then
  printf '· strato specifico: attivo, %s forme candidate confrontate con l'\''elenco.\n' "$n_candidati"
else
  printf '\033[33m· strato specifico: NON ATTIVO (TERMINI_VIETATI_ELENCO non impostata). I nomi privi di forma\n'
  printf '  commerciale riconoscibile non sono stati cercati: questo esito non dice che non ce ne siano.\033[0m\n'
fi
if [ -n "$TERMINI_VIETATI_COMMIT" ]; then
  # Un intervallo impostato ma vuoto non e' la stessa cosa di un intervallo non chiesto: nel primo
  # caso qualcuno ha creduto di far esaminare qualcosa. Le due condizioni si dichiarano separate.
  printf '· messaggi di commit: %s esaminati (%s).\n' "$N_COMMIT" "$TERMINI_VIETATI_COMMIT"
  if [ "$N_COMMIT" -eq 0 ]; then
    printf '\033[33m  Attenzione: l intervallo indicato non contiene alcun commit.\033[0m\n'
  fi
else
  printf '· messaggi di commit: non esaminati (TERMINI_VIETATI_COMMIT non impostata).\n'
fi
printf '· non coperti in nessun caso: nomi dentro immagini, titoli di segnalazione e di proposta,\n'
printf '  discussioni sulla piattaforma, nomi di persona.\n'

exit "$esito"
