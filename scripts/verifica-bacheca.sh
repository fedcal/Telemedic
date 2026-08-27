#!/usr/bin/env bash
# Ogni voce aperta della bacheca inter-agenti ha un destinatario.
#
# PERCHE' ESISTE. Il criterio 4 di T-02 chiede due cose: che la bacheca non contenga voci APERTA
# prive di destinatario, e che ogni voce APERTA indirizzata a un'area chiusa porti una nota che
# dichiari perche' resta aperta. La prima meta' e' verificabile subito ed e' gia' soddisfatta - 85
# voci aperte, zero senza destinatario, misurato il 27 agosto 2026. Mancava solo il presidio, ed e'
# la voce D-18 del runbook: una regola non presidiata da un controllo non e' una regola.
#
# PERCHE' UN DESTINATARIO CONTA. Una questione senza destinatario non e' una questione aperta: e'
# un'osservazione. Nessuno la chiudera', perche' nessuno sa che tocchi a lui, e restera' nella
# bacheca fino a quando qualcuno la leggera' per caso. Il costo non e' la voce persa - e' che il
# registro delle questioni aperte, che dovrebbe dire che cosa manca, si riempie di righe che non
# chiedono nulla a nessuno e smette di essere letto.
#
# LA SECONDA META' ORA C'E', ed e' arrivata da una decisione, non da un'idea migliore. Il criterio
# chiede la nota su ogni voce APERTA indirizzata a un'AREA CHIUSA. «Area chiusa» non aveva una
# definizione operativa versionata, e finche' non l'ha avuta questo controllo DICHIARAVA di non
# verificare la seconda meta' invece di lasciar credere che il criterio fosse presidiato. La
# decisione e' stata presa il 27 agosto 2026 ed e' scritta nel protocollo della bacheca: si adotta
# la LETTURA LETTERALE - 09_roadmap/00-indice.md §4 dichiara complete o scritte tutte e dodici le
# aree, quindi ogni voce APERTA e' indirizzata a un'area chiusa e la nota le riguarda tutte.
# Restringere la definizione avrebbe ridotto il lavoro ridefinendo il criterio invece di
# soddisfarlo.
#
# LA FORMA DELLA NOTA. La colonna dello stato di una voce APERTA contiene la formula «Resta aperta
# perche'» seguita dalla ragione. Il controllo cerca «Resta aperta perch» SENZA la vocale accentata
# finale: la bacheca la scrive accentata, questo script e' scritto in ASCII per convenzione, e far
# dipendere un confronto dalla codifica di un singolo carattere e' il modo in cui un controllo
# passa sulla macchina di chi lo scrive e fallisce altrove.
#
# CIO' CHE IL CONTROLLO NON PUO' VERIFICARE, e va detto invece di lasciarlo intendere: che la
# ragione scritta sia VERA. Una nota che dica «attende una decisione» quando nessuno ha chiesto
# nulla a nessuno supera il controllo. Il presidio accerta che la ragione ci sia e non sia vuota;
# che sia onesta lo accerta chi legge la bacheca, ed e' per questo che il protocollo ne fissa i
# tre tipi ammessi invece di lasciare il campo libero.
#
# IN SOLA MISURA SULLA NOTA FINO AL 2026-10-10, POI BLOCCANTE. La data e' la scadenza del criterio
# 4 di T-02, quindi anche il termine entro cui le voci aperte vanno annotate. La prima meta' - il
# destinatario - blocca da subito, perche' e' gia' soddisfatta e un controllo verde che regredisce
# va fermato nel commit che lo fa regredire.
#
# Uscita: 0 conforme, 1 violazione, 2 errore d'uso.
set -uo pipefail

cd "$(dirname "$0")/.."

BACHECA="${BACHECA:-.telemedic/context/05_BACHECA_INTERAGENTI.md}"
NOTA_BLOCCANTE_DAL="${NOTA_BLOCCANTE_DAL:-2026-10-10}"

if [ ! -r "$BACHECA" ]; then
  printf 'Errore d'\''uso: la bacheca «%s» non esiste o non e'\'' leggibile.\n' "$BACHECA" >&2
  printf 'Percorso configurabile con BACHECA.\n' >&2
  exit 2
fi

VERDE=$'\033[32m'; ROSSO=$'\033[31m'; GIALLO=$'\033[33m'; FINE_COLORE=$'\033[0m'

esito=$(gawk -F'|' '
  # Le righe di questione hanno la forma «| Q-nn | emittente | destinatarie | testo | stato |».
  # Il separatore e'\'' la barra verticale e non la tabulazione, quindi il difetto C-1 del runbook -
  # il collasso dei campi vuoti - non si applica: gawk con FS esplicito conta i campi vuoti.
  # La spaziatura attorno alla sigla e'\'' OPZIONALE: «|Q-99|» e «| Q-99 |» sono resi identici dal
  # markdown, e riconoscere la sola forma spaziata rende la prima invisibile - non segnalata, non
  # contata, non dichiarata fra i salti. Trovato in revisione il 27 agosto 2026: una voce APERTA
  # priva di destinatario, scritta senza spazi, non produceva alcun rilievo.
  /^\|[[:space:]]*Q-[0-9]+[[:space:]]*\|/ {
    sigla = $2; dest = $4; stato = $6
    gsub(/^[ \t]+|[ \t]+$/, "", sigla)
    gsub(/^[ \t]+|[ \t]+$/, "", dest)
    gsub(/^[ \t]+|[ \t]+$/, "", stato)
    totale++
    if (NF != 7) { printf "FORMA\t%s\t%d\t%d\n", sigla, FNR, NF; prossima = 1 }
    if (stato == "") { printf "STATO\t%s\t%d\n", sigla, FNR; next }
    # LO STATO SI LEGGE, NON SI CERCA. La prima stesura chiedeva soltanto che la parola comparisse
    # nella colonna, e due righe su centoventitre'\'' ne pagavano il prezzo in versi opposti. Q-156 e'\''
    # RISOLTA e la sua colonna lo dice in apertura, ma piu'\'' avanti RACCONTA che «la casella dello
    # stato era rimasta `APERTA`»: la voce risultava aperta per una parola citata fra apici inversi
    # a proposito di una condizione passata. Q-270 e'\'' davvero riaperta e veniva contata giusta per
    # il motivo sbagliato - «RIAPERTA» CONTIENE «APERTA», e un accordo casuale fra due parole non e'\''
    # una regola. La forma ora e'\'' esplicita: parola intera, «APERTA» o «RIAPERTA», mai preceduta da
    # un apice inverso. Resta deliberatamente riconosciuto lo stato COMPOSTO «RISOLTA da X, APERTA
    # verso Y», che tre voci usano: una questione risolta da un'\''area e ancora aperta verso un'\''altra
    # e'\'' aperta, e chiuderla perche'\'' la prima parola dice RISOLTA nasconderebbe cio'\'' che resta.
    if (stato ~ /(^|[^A-Za-z`])(RI)?APERTA([^A-Za-z]|$)/) {
      aperte++
      if (dest == "") printf "DEST\t%s\t%d\n", sigla, FNR
      # La formula si cerca troncata prima della vocale accentata: si veda il commento in testa.
      posizione = index(stato, "Resta aperta perch")
      if (posizione == 0) {
        printf "NOTA\t%s\t%d\n", sigla, FNR
      } else {
        coda = substr(stato, posizione + 18)
        # Si scarta cio'\'' che separa la formula dalla ragione: vocale accentata, due punti,
        # asterischi dell'\''enfasi, spazi. Cio'\'' che resta e'\'' la ragione, e se e'\'' vuota la nota
        # e'\'' un titolo senza testo - che e'\'' peggio dell'\''assenza, perche'\'' supera una lettura
        # distratta.
        gsub(/^[^A-Za-z0-9]+/, "", coda)
        if (length(coda) < 12) printf "NOTAVUOTA\t%s\t%d\n", sigla, FNR
        else annotate++
      }
    }
  }
  END { printf "TOTALI\t%d\t%d\t%d\n", totale + 0, aperte + 0, annotate + 0 }
' "$BACHECA")

totale=$(printf '%s\n' "$esito" | gawk -F'\t' '$1=="TOTALI"{print $2}')
aperte=$(printf '%s\n' "$esito" | gawk -F'\t' '$1=="TOTALI"{print $3}')
annotate=$(printf '%s\n' "$esito" | gawk -F'\t' '$1=="TOTALI"{print $4}')

if [ "$totale" -eq 0 ]; then
  printf 'Errore d'\''uso: nessuna voce di questione riconosciuta in «%s».\n' "$BACHECA" >&2
  printf 'Le righe attese hanno la forma «| Q-nn | emittente | destinatarie | testo | stato |».\n' >&2
  exit 2
fi

rilievi=0
note_mancanti=0
oggi=$(date +%F)
if [ "$oggi" \< "$NOTA_BLOCCANTE_DAL" ]; then nota_blocca=0; else nota_blocca=1; fi

while IFS=$'\n' read -r riga; do
  [ -n "$riga" ] || continue
  tipo=$(printf '%s' "$riga" | cut -f1)
  sigla=$(printf '%s' "$riga" | cut -f2)
  numero=$(printf '%s' "$riga" | cut -f3)
  case "$tipo" in
    DEST)
      printf '%s✗ riga %s: la voce %s e'\''
 APERTA e non ha destinatario. Una questione senza destinatario non e'\'' aperta: e'\'' un'\''osservazione.%s\n' \
        "$ROSSO" "$numero" "$sigla" "$FINE_COLORE" >&2
      rilievi=$((rilievi + 1)) ;;
    STATO)
      printf '%s✗ riga %s: la voce %s non ha uno stato. Uno stato mancante non e'\'' «aperta» ne'\'' «risolta»: e'\'' illeggibile.%s\n' \
        "$ROSSO" "$numero" "$sigla" "$FINE_COLORE" >&2
      rilievi=$((rilievi + 1)) ;;
    FORMA)
      colonne=$(printf '%s' "$riga" | cut -f4)
      printf '%s✗ riga %s: la voce %s ha %s campi invece di sette. Una barra verticale nel testo rompe la tabella.%s\n' \
        "$ROSSO" "$numero" "$sigla" "$colonne" "$FINE_COLORE" >&2
      rilievi=$((rilievi + 1)) ;;
    NOTA)
      note_mancanti=$((note_mancanti + 1))
      if [ "$nota_blocca" -eq 1 ]; then
        printf '%s✗ riga %s: la voce %s e'\'' APERTA e non dichiara perche'\'' resta aperta.%s\n' \
          "$ROSSO" "$numero" "$sigla" "$FINE_COLORE" >&2
        rilievi=$((rilievi + 1))
      fi ;;
    NOTAVUOTA)
      note_mancanti=$((note_mancanti + 1))
      if [ "$nota_blocca" -eq 1 ]; then
        printf '%s✗ riga %s: la voce %s porta la formula «Resta aperta perche'\''» senza una ragione dietro. Un titolo senza testo supera una lettura distratta, ed e'\'' peggio dell'\''assenza.%s\n' \
          "$ROSSO" "$numero" "$sigla" "$FINE_COLORE" >&2
        rilievi=$((rilievi + 1))
      fi ;;
  esac
done < <(printf '%s\n' "$esito" | grep -v '^TOTALI')

if [ "$note_mancanti" -gt 0 ] && [ "$nota_blocca" -eq 0 ]; then
  printf '%s%d voce/i APERTA su %d non dichiarano perche'\'' restano aperte. In sola misura fino al %s,%s\n' \
    "$GIALLO" "$note_mancanti" "$aperte" "$NOTA_BLOCCANTE_DAL" "$FINE_COLORE"
  printf '%spoi bloccante: e'\'' la scadenza del criterio 4 di T-02. La forma della nota e'\'' nel protocollo%s\n' "$GIALLO" "$FINE_COLORE"
  printf '%sdella bacheca, sezione «La nota su una voce che resta aperta».%s\n' "$GIALLO" "$FINE_COLORE"
fi

if [ "$rilievi" -gt 0 ]; then
  printf '%s✗ %d rilievo/i sulla bacheca inter-agenti.%s\n' "$ROSSO" "$rilievi" "$FINE_COLORE" >&2
  exit 1
fi

printf '%s✓ %d voci di questione, %d aperte, tutte con destinatario e stato leggibili; %d con la nota che dichiara perche'\'' restano aperte.%s\n' \
  "$VERDE" "$totale" "$aperte" "$annotate" "$FINE_COLORE"
exit 0
