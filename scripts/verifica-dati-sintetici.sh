#!/usr/bin/env bash
# Controllo di costruzione - G10, dati non sintetici (docs/01_technical/09 §3).
#
# È l'automazione della prima regola non negoziabile del progetto: nessun dato reale di paziente,
# mai - non nel codice, non nelle prove, non negli esempi, non nei registri. La regola è scritta
# in CONTRIBUTING.md e ripetuta in CLAUDE.md; finché nessuno la verifica a ogni costruzione resta
# una promessa, e le promesse in un corpus di trecento documenti decadono in silenzio.
#
# PERCHÉ NON CERCA «QUALCOSA CHE ASSOMIGLIA A UN IDENTIFICATIVO».
# Un controllo che segnala ogni forma somigliante a un codice fiscale segnalerebbe anche tutti
# gli esempi sintetici della documentazione, cioè quasi solo falsi positivi: verrebbe disattivato
# entro la terza esecuzione, e da quel momento il progetto avrebbe un controllo dichiarato e
# nessun controllo reale. La discriminante è un'altra, e il progetto l'ha già scelta nel piano di
# T-03 (§6.1): un identificativo sintetico ben costruito ha la CIFRA DI CONTROLLO
# DELIBERATAMENTE ERRATA, ed è così che si distingue da uno reale. Questo controllo segnala
# quindi le forme che SUPERANO la verifica della cifra di controllo, e lascia passare tutte le
# altre. La conseguenza va detta perché non è ovvia: un esempio con cifra di controllo corretta
# è un difetto anche quando chi l'ha scritto era convinto di inventarlo: una forma che supera la
# verifica È attribuibile a una persona reale, e non c'è modo, dall'esterno, di sapere se lo sia.
#
# DOVE LA CIFRA DI CONTROLLO NON ESISTE.
# Un numero di telefono e un indirizzo di posta non hanno cifra di controllo: per queste due
# forme la discriminante è la RISERVAZIONE. I domini riservati dalle RFC 2606 e 6761 (.invalid,
# .test, .example, .localhost, example.com/net/org) non sono assegnabili a nessuno e passano;
# un dominio reale in un esempio no. Per i numeri di telefono l'Italia non ha un intervallo
# riservato alla documentazione - è un fatto, non una dimenticanza di questo controllo - e la
# sola convenzione praticabile resta quella visiva: cifre ripetute o in sequenza banale.
#
# COSA IL CONTROLLO NON COPRE, E PERCHÉ (le esclusioni sono decisioni, non lacune).
#   - Codici ministeriali di struttura (HSP.11, STS.11) e codici ASL: non hanno cifra di
#     controllo. Segnalarli significherebbe segnalare ogni numero di sei cifre del corpus. La
#     struttura sanitaria resta coperta attraverso il suo codice fiscale numerico a undici cifre,
#     che una cifra di controllo ce l'ha.
#   - Identificativi FSE: l'indice identifica l'assistito per codice fiscale - già coperto - e i
#     documenti per UUID/OID, che non portano dato personale e non hanno cifra di controllo. Un
#     controllo sugli OID segnalerebbe le radici pubbliche delle autorità di assegnazione
#     (2.16.840.1.113883.2.9.*), citate correttamente per riferimento in tutta la documentazione:
#     è l'archetipo del falso positivo che fa spegnere un controllo.
#   - Tessera STP/ENI: sedici caratteri senza cifra di controllo. Stessa ragione.
#   - Numeri di rete fissa: lunghezza non fissa (da sei a undici cifre), nessuna cifra di
#     controllo, nessun intervallo riservato. Il criterio di forma riconoscibile non regge.
#   Ciascuna di queste esclusioni cade nel momento in cui la forma acquista una discriminante
#   verificabile, non prima.
#
# IL CONTROLLO NON RISTAMPA CIÒ CHE TROVA.
# Un controllo contro i dati reali che riversa il dato trovato nel registro della costruzione lo
# pubblica una seconda volta, in un archivio che sopravvive alla correzione del file. I rilievi
# riportano perciò percorso, riga e motivo, e del valore trovato solo un frammento oscurato,
# sufficiente a ritrovarlo aprendo quella riga e non a leggerlo altrove.
#
# NESSUN IDENTIFICATIVO VALIDO DENTRO QUESTO FILE.
# Gli esempi citati nei commenti, dove ce ne sono, hanno cifra di controllo deliberatamente
# errata e sono dichiarati tali sul posto: un controllo contro i dati reali che ne porta uno
# dentro di sé è un difetto peggiore di quello che previene.
#
# L'AMMISSIONE ESPLICITA, E PERCHÉ VALE SOLO PER DUE FORME.
# Una riga che porta il marcatore «dato-reale-consentito: <motivo>» - sulla riga stessa o su
# quella immediatamente precedente - è ammessa, e l'ammissione viene contata e dichiarata in
# coda, così che resti visibile. Il marcatore vale SOLO per posta elettronica e telefono, cioè
# per i recapiti che un progetto pubblica legittimamente (il contatto di sicurezza, il
# manutentore in publiccode.yml, l'intestazione della chiave di firma richiesta dalla
# tracciabilità nominativa di ISO 13485 §7.5.8). Non vale, e non deve valere, per codice fiscale,
# tessera sanitaria, partita IVA e IBAN: non esiste un motivo legittimo per cui l'identificativo
# di una persona reale stia in questo repository, e un marcatore che potesse ammetterlo
# renderebbe il controllo aggirabile proprio dove serve.
#
# COLLAUDABILITÀ. Il controllo accetta una variabile d'ambiente, con la convenzione già usata da
# scripts/verifica-dichiarazione-non-marcatura.sh:
#   RADICE_SORGENTI - radice da esaminare (per difetto la radice del repository)
# Senza di essa il controllo non sarebbe collaudabile su tenute statiche senza toccare i file
# reali del repository. In esecuzione normale sono esclusi .git, node_modules, l'artefatto
# costruito website/build e scripts/prove: quest'ultima esclusione è la stessa adottata da
# scripts/verifica-identificativi-requisiti.sh e ha la stessa ragione - le tenute del banco
# contengono forme preparate apposta per far fallire i controlli, e non vanno confuse con il
# corpus reale.
set -euo pipefail

cd "$(dirname "$0")/.."

RADICE_SORGENTI="${RADICE_SORGENTI:-.}"
# La barra finale va tolta: le esclusioni sotto confrontano percorsi costruiti per concatenazione,
# e «radice//website/build» non corrisponde a nulla - l'esclusione fallirebbe in silenzio, cioè
# nel modo peggiore.
RADICE_SORGENTI="${RADICE_SORGENTI%/}"
[ -n "$RADICE_SORGENTI" ] || RADICE_SORGENTI="/"

esito=0

segnala() {
  printf '\n\033[31m✗ %s\033[0m\n%s\n' "$1" "$2"
  esito=1
}

if [ ! -d "$RADICE_SORGENTI" ]; then
  printf '\033[31m✗ Radice da esaminare inesistente: %s\033[0m\n' "$RADICE_SORGENTI"
  printf 'Indica una directory esistente con RADICE_SORGENTI, oppure esegui il controllo dalla radice del repository.\n'
  exit 2
fi

# --- 1. I file da esaminare. ---
#
# L'esclusione per estensione tiene fuori ciò che non è testo: un file binario non contiene
# identificativi in forma leggibile e la sua scansione produrrebbe solo rumore e tempo perso.
# Non è una lista di sicurezza - un identificativo dentro un'immagine sfuggirebbe - ed è
# dichiarata come limite, non venduta come copertura.
file_esaminati=$(
  find "$RADICE_SORGENTI" \
    \( -name '.git' -o -name 'node_modules' \
       -o -path "$RADICE_SORGENTI/website/build" \
       -o -path "$RADICE_SORGENTI/website/.docusaurus" \
       -o -path "$RADICE_SORGENTI/scripts/prove" \) -prune -o \
    -type f \
    ! -name '*.png' ! -name '*.jpg' ! -name '*.jpeg' ! -name '*.gif' ! -name '*.ico' \
    ! -name '*.pdf' ! -name '*.woff' ! -name '*.woff2' ! -name '*.ttf' ! -name '*.eot' \
    ! -name '*.zip' ! -name '*.gz' ! -name '*.tgz' ! -name '*.xz' ! -name '*.bz2' \
    ! -name '*.mp4' ! -name '*.webm' ! -name '*.mp3' ! -name '*.wav' \
    -print | sort
)

if [ -z "$file_esaminati" ]; then
  printf '\033[33m· Nessun file di testo sotto %s: controllo corretto a insieme vuoto, nulla da verificare.\033[0m\n' "$RADICE_SORGENTI"
  exit 0
fi

n_file=$(printf '%s\n' "$file_esaminati" | wc -l)

# --- 2. La scansione. ---
#
# Una sola invocazione di awk su tutti i file: la fascia rapida non tollera un processo per file,
# e lo stato che serve (recinto di codice aperto, riga precedente per il marcatore di ammissione)
# è per file e si azzera su FNR==1.
#
# Le espressioni regolari sono costruite con rip() invece che con le ripetizioni {n}: gli
# intervalli non sono supportati da tutte le implementazioni di awk in circolazione, e un
# controllo che si degrada in silenzio su un'altra macchina è peggio di un controllo assente.
rilievi=$(
  printf '%s\n' "$file_esaminati" | tr '\n' '\0' | xargs -0 awk '
function rip(s, n,   i, r) { r = ""; for (i = 0; i < n; i++) r = r s; return r }

# Carattere di controllo del codice fiscale: sedicesimo carattere, calcolato sui primi quindici
# con le due tabelle di posizione (dispari e pari) del DM 23 dicembre 1976. Le lettere di
# omocodia sono trattate come i caratteri che sono, che è ciò che prescrive lo stesso decreto.
function cf_controllo(cf,   i, c, s) {
  s = 0
  for (i = 1; i <= 15; i++) {
    c = substr(cf, i, 1)
    if (i % 2 == 1) s += DISPARI[c]
    else s += PARI[c]
  }
  return substr(ALFA, s % 26 + 1, 1)
}

# Luhn (ISO/IEC 7812): vale per il numero identificativo della tessera sanitaria (venti cifre) e
# per la partita IVA / codice fiscale numerico degli enti (undici cifre). Ultima cifra di
# controllo compresa nella stringa passata.
function luhn_ok(n,   i, d, s, alt) {
  s = 0; alt = 0
  for (i = length(n); i >= 1; i--) {
    d = substr(n, i, 1) + 0
    if (alt) { d *= 2; if (d > 9) d -= 9 }
    s += d; alt = !alt
  }
  return (s % 10) == 0
}

# ISO 7064 mod 97-10 per IBAN: i primi quattro caratteri vanno in coda, le lettere diventano
# numeri (A=10 … Z=35), il resto della divisione per 97 deve valere 1. Il resto è calcolato a
# blocchi perché il numero intero non sta in un doppio in virgola mobile.
function iban_ok(ib,   s, i, c, v, r) {
  s = substr(ib, 5) substr(ib, 1, 4)
  r = 0
  for (i = 1; i <= length(s); i++) {
    c = substr(s, i, 1)
    if (c >= "0" && c <= "9") { v = c + 0; r = (r * 10 + v) % 97 }
    else { v = index(ALFA, c) + 9; r = (r * 100 + v) % 97 }
  }
  return r == 1
}

# Estrae da <linea> tutte le occorrenze di <re> i cui confini non cadono dentro <classe>, cioè
# che non sono il troncamento di una sequenza più lunga. Riempie TROVATI e TROVATI_DOPO (i due
# caratteri che seguono, che servono a distinguere una casella di posta da una URL SSH).
function scandisci(linea, re, classe,   n, resto, precedente, tok, pre, post) {
  n = 0
  delete TROVATI
  delete TROVATI_DOPO
  resto = linea
  precedente = ""
  while (match(resto, re)) {
    tok = substr(resto, RSTART, RLENGTH)
    pre = (RSTART > 1) ? substr(resto, RSTART - 1, 1) : precedente
    post = substr(resto, RSTART + RLENGTH, 1)
    if ((pre == "" || pre !~ classe) && (post == "" || post !~ classe)) {
      n++
      TROVATI[n] = tok
      TROVATI_DOPO[n] = substr(resto, RSTART + RLENGTH, 2)
    }
    precedente = substr(resto, RSTART + RLENGTH - 1, 1)
    resto = substr(resto, RSTART + RLENGTH)
  }
  return n
}

# Oscuramento: quanto basta a ritrovare il valore aprendo quella riga, non abbastanza a leggerlo
# da qui. Vedi la nota in testa allo script.
function oscura(s,   n) {
  n = length(s)
  if (n <= 4) return rip("*", n)
  return substr(s, 1, 3) rip("*", n - 3)
}

function rilievo(forma, motivo, valore) {
  printf "RILIEVO\t%s\t%s\t%d\t%s\t%s\n", forma, FILENAME, FNR, motivo, valore
}

BEGIN {
  ALFA = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

  # Tabella dei caratteri di posizione pari: cifra per le cifre, posizione alfabetica per le
  # lettere.
  for (i = 0; i <= 9; i++) PARI[i ""] = i
  for (i = 1; i <= 26; i++) PARI[substr(ALFA, i, 1)] = i - 1

  # Tabella dei caratteri di posizione dispari.
  split("1 0 5 7 9 13 15 17 19 21", v, " ")
  for (i = 0; i <= 9; i++) DISPARI[i ""] = v[i + 1]
  split("1 0 5 7 9 13 15 17 19 21 2 4 18 20 11 3 6 8 12 14 16 10 22 25 24 23", v, " ")
  for (i = 1; i <= 26; i++) DISPARI[substr(ALFA, i, 1)] = v[i]

  C = "[0-9]"
  O = "[0-9LMNPQRSTUV]"          # cifra oppure lettera di omocodia
  S = "[ .-]?"                   # separatore facoltativo dentro un numero di telefono

  RE_CF   = rip("[A-Z]", 6) O O "[ABCDEHLMPRST]" O O "[A-Z]" O O O "[A-Z]"
  RE_TS   = "80380" rip(C, 15)   # numero identificativo TS/TEAM: prefisso di emittente e Luhn
  RE_PIVA = rip(C, 11)
  RE_IBAN = "IT" C C "[A-Z]" rip(C, 10) rip("[0-9A-Z]", 12)
  RE_TEL  = "((\\+|00)39" S ")?3" C C S C C C S C C C C
  # La marca di dominio di primo livello deve essere alfabetica: senza questo vincolo ogni
  # specifica di versione di un pacchetto («qualcosa@3.9.2») sarebbe letta come un indirizzo, e
  # website/package-lock.json ne contiene a migliaia. È già costato un falso positivo in prova.
  RE_EMAIL = "[A-Za-z0-9._%+-]+@[A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*\\.[A-Za-z][A-Za-z]+"

  ANCORA_PIVA = "artita [Ii][Vv][Aa]|[Pp]\\.? ?[Ii][Vv][Aa]|odice [Ff]iscale|[Vv][Aa][Tt] ?[Nn]umber"
  ANCORA_TEL  = "elefon|ellulare|ecapito|[Tt][Ee][Ll][:.]|hone|obile|callto:|[Ss][Mm][Ss]"
  MARCATORE   = "dato-reale-consentito:"

  # Domini riservati dalle RFC 2606 e 6761: non sono assegnabili, quindi un indirizzo che li usa
  # non può raggiungere nessuno. Sono la sola forma di indirizzo sintetico per costruzione.
  split("invalid test example localhost local", v, " ")
  for (i in v) MARCA_RISERVATA[v[i]] = 1
  split("example.com example.net example.org", v, " ")
  for (i in v) DOMINIO_RISERVATO[v[i]] = 1

  # Domini di posta al consumo: una casella su questi domini appartiene a una persona fisica, mai
  # a un ente. È la sola discriminante affidabile fra il recapito di una persona e il contatto
  # istituzionale citato come fonte (agid.gov.it, who.int e simili), che deve continuare a
  # passare - segnalarli spegnerebbe il controllo entro una settimana.
  # (elenco spezzato in più chiamate: una stringa awk non si spezza su più righe in modo portabile)
  split("gmail.com googlemail.com hotmail.com hotmail.it outlook.com outlook.it live.com live.it", v, " ")
  for (i in v) CASELLA_AL_CONSUMO[v[i]] = 1
  split("msn.com yahoo.com yahoo.it ymail.com icloud.com me.com aol.com gmx.com gmx.it", v, " ")
  for (i in v) CASELLA_AL_CONSUMO[v[i]] = 1
  split("proton.me protonmail.com tutanota.com libero.it virgilio.it alice.it tin.it tiscali.it", v, " ")
  for (i in v) CASELLA_AL_CONSUMO[v[i]] = 1
  split("inwind.it iol.it fastwebnet.it email.it teletu.it poste.it", v, " ")
  for (i in v) CASELLA_AL_CONSUMO[v[i]] = 1
}

FNR == 1 { recinto = 0; riga_precedente = "" }

{
  prosa = (FILENAME ~ /\.(md|markdown|txt|adoc)$/)

  # Il recinto di codice si apre e si chiude sulla stessa marca; dentro un file di prosa è ciò
  # che distingue un esempio da una citazione discorsiva. Fuori dalla prosa - sorgenti,
  # configurazione, tenute - tutto è esempio o dato, e la distinzione non si pone.
  if (prosa && $0 ~ /^[ \t]*(```|~~~)/) { recinto = !recinto; riga_precedente = $0; next }
  esempio = prosa ? recinto : 1

  ammesso = ($0 ~ MARCATORE || riga_precedente ~ MARCATORE)

  # --- Codice fiscale a sedici caratteri. Nessuna ammissione possibile. ---
  # Ogni forma è preceduta da un filtro grossolano e a buon mercato: senza, le sei espressioni
  # regolari girerebbero su ogni riga di ogni file - comprese le trentamila di
  # website/package-lock.json - e il controllo uscirebbe dalla fascia rapida. Il filtro è sempre
  # una condizione NECESSARIA della forma, mai una euristica: un codice fiscale comincia per sei
  # maiuscole, una tessera contiene 80380, un indirizzo contiene una chiocciola. Se il filtro
  # fosse più stretto della forma, il controllo perderebbe casi in silenzio, che è il modo in cui
  # un controllo diventa una dichiarazione.
  n = ($0 ~ /[A-Z][A-Z][A-Z][A-Z][A-Z][A-Z]/) ? scandisci($0, RE_CF, "[A-Za-z0-9]") : 0
  for (k = 1; k <= n; k++) {
    tok = TROVATI[k]
    if (substr(tok, 16, 1) == cf_controllo(tok))
      rilievo("codice fiscale", "carattere di controllo CORRETTO: la forma è attribuibile a una persona reale. Un esempio sintetico deve avere il carattere di controllo deliberatamente errato", oscura(tok))
  }

  # --- Numero identificativo della tessera sanitaria (TS/TEAM). Nessuna ammissione possibile. ---
  n = index($0, "80380") ? scandisci($0, RE_TS, "[0-9]") : 0
  for (k = 1; k <= n; k++) {
    tok = TROVATI[k]
    if (luhn_ok(tok))
      rilievo("tessera sanitaria", "prefisso di emittente 80380 e cifra di controllo Luhn CORRETTA: la forma è quella di una tessera realmente emessa", oscura(tok))
  }

  # --- Codice fiscale numerico di ente / partita IVA: undici cifre. ---
  # Richiede un ancoraggio testuale sulla stessa riga. Senza, una cifra di controllo corretta su
  # undici cifre capita a una sequenza numerica su dieci - date compattate, identificativi
  # tecnici, numeri di protocollo - e il controllo diventerebbe rumore.
  # Il filtro qui è la forma stessa - undici cifre di fila, che quasi nessuna riga contiene - e
  # solo dopo si paga la verifica di ancoraggio testuale, la più cara delle sei espressioni.
  if ($0 ~ RE_PIVA && $0 ~ ANCORA_PIVA) {
    n = scandisci($0, RE_PIVA, "[0-9]")
    for (k = 1; k <= n; k++) {
      tok = TROVATI[k]
      if (luhn_ok(tok))
        rilievo("partita IVA / CF di ente", "cifra di controllo CORRETTA in una riga che parla di partita IVA o codice fiscale: la forma è attribuibile a un soggetto reale (compresa una struttura sanitaria)", oscura(tok))
    }
  }

  # --- IBAN italiano. Nessuna ammissione possibile. ---
  n = index($0, "IT") ? scandisci($0, RE_IBAN, "[A-Za-z0-9]") : 0
  for (k = 1; k <= n; k++) {
    tok = TROVATI[k]
    if (iban_ok(tok))
      rilievo("IBAN", "resto ISO 7064 mod 97-10 CORRETTO: la forma è quella di un conto esistente. Un esempio sintetico deve avere le due cifre di controllo errate", oscura(tok))
  }

  # --- Numero di telefono mobile italiano. ---
  # Nessuna cifra di controllo e nessun intervallo riservato alla documentazione: serve un
  # ancoraggio di contesto - il prefisso internazionale nel numero stesso, oppure una parola che
  # dica che quello è un recapito. Senza ancoraggio ogni sequenza di dieci cifre che comincia per
  # 3 sarebbe un rilievo: nel corpus lo sarebbero un SSRC di WebRTC e i numeri di segnalazione
  # di un tracker, che non sono recapiti di nessuno.
  if (index($0, "3") && ($0 ~ ANCORA_TEL || index($0, "+39") || index($0, "0039"))) {
    n = scandisci($0, RE_TEL, "[0-9]")
    for (k = 1; k <= n; k++) {
      tok = TROVATI[k]
      # Il prefisso internazionale si toglie solo quando è davvero presente: un numero mobile può
      # cominciare per 393, e una sottrazione cieca di «39» lo accorcerebbe di due cifre facendolo
      # scartare come malformato: un falso negativo silenzioso su un intero operatore.
      nazionale = tok
      gsub(/[ .-]/, "", nazionale)
      sub(/^\+/, "", nazionale)
      if (length(nazionale) == 12 && substr(nazionale, 1, 2) == "39") nazionale = substr(nazionale, 3)
      else if (length(nazionale) == 14 && substr(nazionale, 1, 4) == "0039") nazionale = substr(nazionale, 5)
      if (length(nazionale) != 10) continue
      if (sintetico_per_forma(nazionale)) continue
      if (ammesso) { ammissioni++; continue }
      rilievo("telefono", "numero mobile italiano ben formato in contesto di recapito, senza alcuna marca di sinteticità (cifre ripetute o in sequenza). Usa una forma palesemente non assegnabile, oppure dichiara il recapito con il marcatore " MARCATORE, oscura(nazionale))
    }
  }

  # --- Indirizzo di posta elettronica. ---
  n = index($0, "@") ? scandisci($0, RE_EMAIL, "[A-Za-z0-9]") : 0
  for (k = 1; k <= n; k++) {
    tok = TROVATI[k]
    # utente@host:percorso è una URL SSH, non una casella: il carattere che segue lo dice.
    if (TROVATI_DOPO[k] ~ /^:[^ \t]/) continue
    posizione = index(tok, "@")
    locale = substr(tok, 1, posizione - 1)
    dominio = tolower(substr(tok, posizione + 1))
    if (dominio_riservato(dominio)) continue
    mascherato = oscura(locale) "@" dominio
    if (dominio in CASELLA_AL_CONSUMO) {
      if (ammesso) { ammissioni++; continue }
      rilievo("posta elettronica", "casella su dominio di posta al consumo: appartiene a una persona fisica, non a un ente. Se è un recapito che il progetto pubblica per obbligo, dichiaralo con il marcatore " MARCATORE, mascherato)
    } else if (esempio) {
      if (ammesso) { ammissioni++; continue }
      rilievo("posta elettronica", "dominio reale in un esempio o in un file di dati: un esempio deve usare un dominio riservato (.invalid, .test, .example, example.com), che non raggiunge nessuno", mascherato)
    }
  }

  riga_precedente = $0
}

function dominio_riservato(d,   parti, n) {
  if (d in DOMINIO_RISERVATO) return 1
  n = split(d, parti, ".")
  return (parti[n] in MARCA_RISERVATA)
}

# Marche di sinteticità per un numero che non ha cifra di controllo: le sette cifre di utente
# tutte uguali, oppure in progressione di uno. Non è una convenzione forte, ed è dichiarata per
# quello che è: in assenza di un intervallo riservato dal piano di numerazione, è la sola che
# resti.
function sintetico_per_forma(n,   utente, i, distinte, c, passo, monotono) {
  utente = substr(n, 4)
  delete distinte
  for (i = 1; i <= length(utente); i++) distinte[substr(utente, i, 1)] = 1
  c = 0
  for (i in distinte) c++
  if (c <= 2) return 1
  monotono = 1
  passo = substr(utente, 2, 1) - substr(utente, 1, 1)
  if (passo != 1 && passo != -1) monotono = 0
  for (i = 2; monotono && i < length(utente); i++)
    if (substr(utente, i + 1, 1) - substr(utente, i, 1) != passo) monotono = 0
  return monotono
}

END { if (ammissioni > 0) printf "AMMISSIONI\t%d\n", ammissioni }
'
)

# --- 3. Il verdetto. ---

# xargs puo spezzare l'elenco su piu invocazioni di awk: le ammissioni vanno sommate, non lette
# dalla prima riga che capita.
ammissioni=$(printf '%s\n' "$rilievi" | awk -F'\t' '$1=="AMMISSIONI"{t+=$2} END{print t+0}')
elenco=$(printf '%s\n' "$rilievi" | grep '^RILIEVO' || true)

if [ -n "$elenco" ]; then
  for forma in "codice fiscale" "tessera sanitaria" "partita IVA / CF di ente" "IBAN" "telefono" "posta elettronica"; do
    blocco=$(printf '%s\n' "$elenco" | awk -F'\t' -v f="$forma" '$2==f {printf "  - %s:%s\n    %s\n    valore: %s\n", $3, $4, $5, $6}')
    [ -z "$blocco" ] && continue
    segnala "Forme di identificativo reale - $forma" \
"$blocco
Correzione: sostituisci con una forma sintetica non valida per costruzione. Se hai davvero
pubblicato un dato reale, non limitarti a correggere il file: la cronologia resta, e va
trattato come un incidente secondo SECURITY.md."
  done
fi

if [ "$esito" -eq 0 ]; then
  printf '\033[32m✓ %s file esaminati, nessuna forma di identificativo reale.\033[0m\n' "$n_file"
  # Forma estesa e non «[ ... ] && printf»: un elenco && lascia come stato dell’ultimo comando del
  # blocco quello del test fallito, e basterebbe togliere l’exit finale perché un controllo andato
  # a buon fine cominciasse a uscire con uno.
  if [ "${ammissioni:-0}" -gt 0 ]; then
    printf '\033[33m· %s recapito/i ammesso/i esplicitamente con il marcatore dato-reale-consentito.\033[0m\n' "$ammissioni"
  fi
fi

exit "$esito"
