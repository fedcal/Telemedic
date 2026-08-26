#!/usr/bin/env bash
# Convenzione tipografica dei trattini - regola dichiarata in CLAUDE.md, sezione «Regole che non
# si negoziano».
#
# I CARATTERI IN GIOCO SONO TRE, E FINO A OGGI NESSUN CONTROLLO NE GUARDAVA NEMMENO UNO.
#
#   U+002D  trattino corto   ammesso sempre, in ogni ruolo
#   U+2013  trattino medio   ammesso SOLO fra due cifre, in un intervallo numerico
#   U+2014  trattino lungo   vietato sempre
#
# La regola scritta in CLAUDE.md diceva «sempre il trattino corto, mai quello lungo» e taceva sul
# medio, che nel frattempo era arrivato a 920 occorrenze in 138 file senza che nessuna regola lo
# nominasse. Una convenzione che nessuno controlla si erode: non perche' qualcuno la violi
# deliberatamente, ma perche' nessuno la ricorda mentre scrive, e il trattino medio arriva quasi
# sempre per copia-e-incolla da un PDF normativo, non per scelta.
#
# QUESTO FILE NON CONTIENE MAI, IN FORMA LETTERALE, I CARATTERI CHE VIETA.
# Scritto la prima volta con gli esempi in chiaro nei commenti, il controllo si segnalava da solo
# diciassette volte e non poteva passare sul proprio repository. Non e' un dettaglio di comodo: e'
# la forma che rende un controllo applicabile a se stesso. I due caratteri sorvegliati sono quindi
# definiti per PUNTO DI CODICE, con le sequenze di scarto \u2013 e \u2014, e ogni esempio - anche
# nei messaggi rivolti a chi legge il rilievo - e' composto a partire da quelle variabili. Chi
# modifica questo file deve
# mantenere la proprieta', altrimenti il controllo torna a rifiutare se stesso.
#
# CHE COSA VUOL DIRE «FRA DUE CIFRE», CON PRECISIONE.
# Il carattere immediatamente precedente E quello immediatamente seguente sono cifre decimali.
# Niente spazi, niente segni interposti. Descritti a parole, perche' scriverli qui sarebbe una
# violazione:
#
#   AMMESSO   «5.5» e «5.7» separati da un medio, perche' a ridosso stanno «5» e «5»
#   AMMESSO   «§§ 7» e «8» separati da un medio, perche' a ridosso stanno «7» e «8»
#   AMMESSO   «artt. 83» e «86» separati da un medio, stesso motivo
#   VIETATO   «gennaio» e «marzo» separati da un medio: lettere a ridosso
#   VIETATO   «Roma» e «Milano» separati da un medio: lettere a ridosso
#   VIETATO   «D1» e «D52» separati da un medio: a destra c'e' una lettera
#   VIETATO   «§4» e «§9» separati da un medio: a ridosso ci sono segni di paragrafo
#   VIETATO   «26 settembre» e «10 ottobre» separati da un medio: a ridosso ci sono spazi
#
# La definizione e' STRETTA di proposito, ed e' la decisione del committente: e' l'unica forma che
# si riconosce senza interpretare il senso della frase. Sono consapevolmente esclusi alcuni
# intervalli che la tipografia italiana ammetterebbe - gli intervalli di sigle come «D1-D52», gli
# intervalli di date come «26 settembre - 10 ottobre», gli intervalli di lettere come «A-Z». In
# tutti quei casi si scrive il trattino corto. Allargare la regola per accoglierli significherebbe
# dover distinguere «D1-D52» da «medico-paziente», che hanno la stessa forma per una macchina.
#
# PERCHE' IL CONTROLLO NON GUARDA DENTRO scripts/prove.
# Perche' le tenute del banco contengono materiale deliberatamente scorretto, costruito apposta per
# far fallire i controlli: la tenuta scripts/prove/tenute/ancore/trattino-lungo-residuo/ contiene
# un trattino LUNGO, ed e' li' di proposito perche' il collaudo di verifica-ancore.sh ne ha
# bisogno. E' la stessa esclusione, per la stessa ragione, gia' adottata da
# scripts/verifica-termini-vietati.sh e da scripts/verifica-dati-sintetici.sh. E' un LIMITE
# dichiarato, non una copertura: un trattino scorretto scritto dentro una tenuta non viene visto.
#
# VARIABILE D'AMBIENTE.
#   RADICE_SORGENTI   radice da esaminare, per difetto la directory corrente.
#
# Esiste PER IL COLLAUDO e mai come sorgente alternativa in esercizio: e' la disciplina della voce
# D-10 del runbook. E il controllo NON forza la propria radice con un «cd» verso la radice del
# repository - sarebbe la voce D-17, e renderebbe il controllo non collaudabile da nessuna tenuta,
# perche' esaminerebbe sempre Telemedic invece della tenuta che gli si indica.
#
# USCITE.  0 nessuna violazione · 1 almeno una violazione · 2 errore d'uso.
set -u

RADICE_SORGENTI="${RADICE_SORGENTI:-.}"
RADICE_SORGENTI="${RADICE_SORGENTI%/}"
[ -n "$RADICE_SORGENTI" ] || RADICE_SORGENTI="/"

errore_configurazione() {
  printf '\033[31m✗ %s\033[0m\n' "$1"
  if [ $# -gt 1 ]; then printf '%s\n' "$2"; fi
  exit 2
}

if [ "$#" -gt 0 ]; then
  errore_configurazione \
    "Questo controllo non accetta argomenti: ricevuto «$1»." \
"Si indica la radice da esaminare con la variabile d'ambiente RADICE_SORGENTI,
non con un argomento sulla riga di comando."
fi

[ -d "$RADICE_SORGENTI" ] || errore_configurazione \
  "Radice da esaminare inesistente: $RADICE_SORGENTI" \
"Indica una directory esistente con RADICE_SORGENTI, oppure esegui il controllo dalla radice
del repository senza impostare nulla."

command -v python3 >/dev/null 2>&1 || errore_configurazione \
  "python3 non e' disponibile." \
"Questo controllo esamina i file carattere per carattere e richiede python3."

python3 - "$RADICE_SORGENTI" <<'PY'
import os, sys

radice = sys.argv[1]

# Per punto di codice, mai in forma letterale: vedi il commento in testa allo script.
MEDIO = '\u2013'
LUNGO = '\u2014'
CORTO = '-'

# Le stesse esclusioni di scripts/verifica-termini-vietati.sh, e per le stesse ragioni: i binari
# non contengono prosa, e scripts/prove contiene tenute costruite apposta per far fallire i
# controlli.
CARTELLE_ESCLUSE = {'.git', 'node_modules'}
PERCORSI_ESCLUSI = {
    os.path.normpath(os.path.join(radice, 'website/build')),
    os.path.normpath(os.path.join(radice, 'website/.docusaurus')),
    os.path.normpath(os.path.join(radice, 'scripts/prove')),
}
ESTENSIONI_ESCLUSE = {
    '.png', '.jpg', '.jpeg', '.gif', '.ico', '.pdf', '.woff', '.woff2', '.ttf',
    '.eot', '.zip', '.gz', '.tgz', '.xz', '.bz2', '.mp4', '.webm', '.mp3', '.wav',
}

def file_da_esaminare():
    for cartella, sottocartelle, nomi in os.walk(radice):
        sottocartelle[:] = sorted(
            s for s in sottocartelle
            if s not in CARTELLE_ESCLUSE
            and os.path.normpath(os.path.join(cartella, s)) not in PERCORSI_ESCLUSI
        )
        for nome in sorted(nomi):
            if os.path.splitext(nome)[1].lower() in ESTENSIONI_ESCLUSE:
                continue
            yield os.path.join(cartella, nome)

def frammento(riga, colonna):
    """Il contorno del rilievo, per far vedere di che cosa si parla senza stampare la riga intera."""
    inizio = max(0, colonna - 24)
    fine = min(len(riga), colonna + 25)
    testo = riga[inizio:fine].strip()
    return ('…' if inizio > 0 else '') + testo + ('…' if fine < len(riga) else '')

violazioni = 0
file_esaminati = 0

def rilievo(percorso, numero, colonna, riga, motivo, rimedio):
    """L'azione che produce il rilievo. E' UNA SOLA, di proposito: la prova di mutazione della voce
    D-9 del runbook neutralizza questa chiamata per intero - messaggi compresi - e verifica che
    cada esattamente un caso del banco."""
    global violazioni
    violazioni += 1
    relativo = os.path.relpath(percorso, radice)
    print(f"\033[31m✗ {relativo}:{numero}:{colonna + 1} - {motivo}\033[0m")
    print(f"    {frammento(riga, colonna)}")
    print(f"    come si corregge: {rimedio}")

RIMEDIO_LUNGO = f"sostituiscilo con il trattino corto «{CORTO}»"
RIMEDIO_MEDIO = (
    f"sostituiscilo con il trattino corto «{CORTO}»; il trattino medio e' ammesso "
    f"solo nella forma «cifra{MEDIO}cifra», senza spazi attorno"
)

for percorso in file_da_esaminare():
    try:
        with open(percorso, encoding='utf-8') as fh:
            righe = fh.readlines()
    except (UnicodeDecodeError, OSError):
        # Un file che non e' testo UTF-8 non contiene prosa del progetto: non e' un rilievo.
        continue
    file_esaminati += 1
    for numero, riga in enumerate(righe, 1):
        riga = riga.rstrip('\n')
        for colonna, carattere in enumerate(riga):
            if carattere == LUNGO:
                rilievo(percorso, numero, colonna, riga,
                        "trattino lungo (U+2014): vietato sempre, in ogni ruolo",
                        RIMEDIO_LUNGO)
            elif carattere == MEDIO:
                prima = riga[colonna - 1] if colonna > 0 else ''
                dopo = riga[colonna + 1] if colonna + 1 < len(riga) else ''
                if prima.isdigit() and dopo.isdigit():
                    continue
                rilievo(percorso, numero, colonna, riga,
                        "trattino medio (U+2013) fuori da un intervallo fra cifre: "
                        f"a ridosso stanno «{prima or '·'}» e «{dopo or '·'}», non due cifre",
                        RIMEDIO_MEDIO)

if file_esaminati == 0:
    # Insieme vuoto: nessun file di testo sotto la radice indicata. E' un esito CORRETTO e non un
    # guasto, ma va detto, perche' la via piu' silenziosa con cui un controllo smette di
    # controllare e' che l'insieme dei file esaminati si svuoti senza che nessuno lo noti.
    print(f"\033[33m· Nessun file di testo sotto {radice}: controllo corretto a insieme vuoto.\033[0m")
    sys.exit(0)

print(f"\nFile esaminati: {file_esaminati} · Violazioni: {violazioni}")

if violazioni:
    print(f"""
La convenzione, per intero. Il trattino corto «{CORTO}» si usa sempre. Il trattino medio si usa
solo fra due cifre e senza spazi attorno, come in «5.5{MEDIO}5.7» o «artt. 83{MEDIO}86». Il trattino
lungo non si usa mai. Ogni altro caso {CORTO} intervalli di sigle come «D1{CORTO}D52», intervalli di
date come «26 settembre {CORTO} 10 ottobre», parole composte come «medico{CORTO}paziente» {CORTO}
vuole il trattino corto.

ATTENZIONE AI TITOLI. Il trattino medio e quello lungo vengono RIMOSSI dall'algoritmo
dell'ancora, mentre quello corto RESTA: correggere un titolo ne cambia l'ancora, e ogni rinvio
a quel titolo va ricalcolato in ENTRAMBE le lingue. Dopo la correzione esegui
scripts/verifica-ancore.sh.""")
    sys.exit(1)

print("\033[32m✓ Convenzione dei trattini rispettata: nessun trattino lungo, e nessun trattino medio fuori da un intervallo fra cifre.\033[0m")
PY
