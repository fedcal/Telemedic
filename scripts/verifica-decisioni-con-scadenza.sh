#!/usr/bin/env bash
# Ogni voce di T-05 ha un esito registrato, e le sette del traguardo lo hanno entro la scadenza.
#
# PERCHE' ESISTE. Il traguardo T-05 ha un criterio di fonte unico che vale per ciascuna delle sue
# sette voci: «ciascuna voce ha un esito registrato - decisa, con il registro di decisione
# architetturale corrispondente, oppure esplicitamente confermata come aperta con la sua
# conseguenza dichiarata». Il piano di esecuzione ne prescrive la forma binaria - un registro
# versionato, chiuso quando nessuna riga ha una colonna vuota - e fino al 28 agosto 2026 quel
# registro non esisteva. Un cancello prescritto in un piano e non eseguito da uno script non e' un
# cancello: e' la seconda massima di questo repository, ed e' la ragione di questo file.
#
# DUE VELOCITA', E LA RAGIONE DELLA DIFFERENZA. Le regole di FORMA - righe ben formate, valori
# ammessi, rinvio presente quando la voce e' decisa, voce esistente nella bacheca - sono
# soddisfacibili oggi da chi tiene il registro, e quindi BLOCCANO da subito: un controllo verde che
# regredisce va fermato nel commit che lo fa regredire. La regola di SOSTANZA - nessuna voce del
# traguardo resta senza esito - dipende da decisioni che appartengono al committente, e nessuno
# puo' soddisfarla scrivendo: e' in sola segnalazione fino al 2026-10-03, che e' la scadenza di
# T-05, e da quel giorno blocca. La disciplina che impone la data e' il criterio 4 di T-03: una
# riduzione temporanea senza una data dichiarata e' il modo in cui diventa permanente.
#
# «IN ATTESA» NON E' UN ESITO, ED E' SCRITTO PER ESTESO APPOSTA. Una cella vuota e' indistinguibile
# da una dimenticanza; la parola scritta dice che qualcuno ha guardato quella riga e non ha potuto
# chiuderla. Il controllo la conta pero' come assenza di esito, esattamente come conterebbe il
# vuoto: la leggibilita' e' per chi legge, non uno sconto sul criterio.
#
# CIO' CHE NON PUO' VERIFICARE, e va detto invece di lasciarlo intendere. Che la conseguenza
# dichiarata su una voce «confermata aperta» sia VERA, e che sia stata davvero accettata da chi
# poteva accettarla. Una conseguenza scritta a effetto - «nessun impatto» - supera questo controllo
# esattamente come una vera. Il presidio accerta che ci sia e non sia una formula vuota; che sia
# onesta lo accerta chi legge il registro, ed e' per questo che il file ne fissa la forma nelle
# proprie regole invece di lasciare il campo libero.
#
# Uscita: 0 conforme, 1 violazione, 2 errore d'uso.
set -uo pipefail

cd "$(dirname "$0")/.."

REGISTRO_DECISIONI="${REGISTRO_DECISIONI:-registro/decisioni-con-scadenza.tsv}"
BACHECA="${BACHECA:-.telemedic/context/05_BACHECA_INTERAGENTI.md}"
RADICE_RINVII="${RADICE_RINVII:-.}"
ESITO_BLOCCANTE_DAL="${ESITO_BLOCCANTE_DAL:-2026-10-03}"
OGGI="${OGGI:-$(date -u +%Y-%m-%d)}"
CRITERI_ATTESI="${CRITERI_ATTESI:-7}"

VERDE=$'\033[32m'; ROSSO=$'\033[31m'; GIALLO=$'\033[33m'; FINE_COLORE=$'\033[0m'

errore_uso() {
  printf '%sErrore d'\''uso: %s%s\n' "$ROSSO" "$1" "$FINE_COLORE" >&2
  [ -n "${2:-}" ] && printf '%s\n' "$2" >&2
  exit 2
}

[ -r "$REGISTRO_DECISIONI" ] || errore_uso \
  "il registro «$REGISTRO_DECISIONI» non esiste o non e' leggibile." \
  "Percorso configurabile con REGISTRO_DECISIONI."
[ -r "$BACHECA" ] || errore_uso \
  "la bacheca «$BACHECA» non esiste o non e' leggibile." \
  "Le voci del registro si verificano contro la loro fonte, non contro un elenco interno (D-10)."

# LE SIGLE AMMESSE SI LEGGONO NELLA BACHECA, NON SI SCRIVONO QUI. Un controllo che portasse dentro
# di se' l'elenco delle questioni sorveglierebbe una copia, e resterebbe verde il giorno in cui una
# voce del registro nominasse una questione inesistente o cancellata. E' la voce D-10 del runbook,
# gia' pagata una volta su un altro controllo.
SIGLE_BACHECA=$(gawk -F'|' '/^\|[[:space:]]*Q-[0-9]+[[:space:]]*\|/ {
  s = $2; gsub(/[ \t]/, "", s); print s
}' "$BACHECA" | sort -u)
[ -n "$SIGLE_BACHECA" ] || errore_uso \
  "nessuna questione riconosciuta in «$BACHECA»." \
  "Le righe attese hanno la forma «| Q-nn | emittente | destinatarie | testo | ... | stato |»."

rilievi=0
senza_esito=0
totale=0
criteri_visti=""

segnala() {
  printf '%s✗ riga %s (%s): %s%s\n' "$ROSSO" "$1" "$2" "$3" "$FINE_COLORE" >&2
  rilievi=$((rilievi + 1))
}

# I CAMPI SI ESTRAGGONO CON «cut -f», NON CON «IFS=TAB read». E' la voce C-1 del runbook, ed e'
# stata ripagata qui alla prima esecuzione del banco: la tabulazione appartiene agli spazi di IFS,
# quindi «read» ne COLLASSA le occorrenze consecutive e i campi vuoti spariscono, spostando a
# sinistra tutti quelli che seguono. Su questo registro il danno era esatto e silenzioso: una riga
# «confermata aperta» ha il rinvio vuoto, quindi «data» riceveva la data giusta per caso e
# «conseguenza» restava vuota - il controllo accusava di non aver dichiarato la conseguenza una
# riga che la dichiarava. «cut -f» conta i separatori invece di saltarli, e i campi vuoti restano
# vuoti al posto loro.
riga=0
while IFS= read -r linea; do
  riga=$((riga + 1))
  # L'intestazione si riconosce per il campo INTERO seguito dal separatore, non per prefisso:
  # «voce*» salterebbe anche una riga di dati che cominciasse per «voce».
  case "$linea" in \#*|"") continue;; "voce"$'\t'*) continue;; esac
  voce=$(printf '%s' "$linea" | cut -f1)
  criterio=$(printf '%s' "$linea" | cut -f2)
  scadenza=$(printf '%s' "$linea" | cut -f3)
  esito=$(printf '%s' "$linea" | cut -f4)
  rinvio=$(printf '%s' "$linea" | cut -f5)
  data=$(printf '%s' "$linea" | cut -f6)
  conseguenza=$(printf '%s' "$linea" | cut -f7)
  totale=$((totale + 1))

  printf '%s\n' "$SIGLE_BACHECA" | grep -qx "$voce" || segnala "$riga" "$voce" \
    "la voce non compare fra le questioni di $BACHECA. Una voce che nomina una questione inesistente non e' tracciabile."

  case "$criterio" in
    [1-7])
      case " $criteri_visti " in
        *" $criterio "*) segnala "$riga" "$voce" "il criterio $criterio e' gia' assegnato a un'altra voce. Ogni criterio di T-05 ha una voce sola.";;
        *) criteri_visti="$criteri_visti $criterio";;
      esac ;;
    proposta) ;;
    *) segnala "$riga" "$voce" "criterio «$criterio» fuori dominio: atteso un numero da 1 a 7, oppure «proposta»." ;;
  esac

  case "$scadenza" in
    [0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]|"in corso") ;;
    *) segnala "$riga" "$voce" "scadenza «$scadenza» non e' una data ISO ne' «in corso». Una scadenza illeggibile non scade." ;;
  esac

  case "$esito" in
    decisa)
      [ -n "$rinvio" ] || segnala "$riga" "$voce" \
        "esito «decisa» senza rinvio. Una decisione presa e non rintracciabile verra' ripresa da capo."
      if [ -n "$rinvio" ] && [ ! -e "$RADICE_RINVII/$rinvio" ]; then
        segnala "$riga" "$voce" "il rinvio «$rinvio» non esiste. Un registro di decisione citato e assente afferma piu' di quanto esista."
      fi
      [ -n "$data" ] || segnala "$riga" "$voce" "esito «decisa» senza la data in cui e' stato registrato." ;;
    "confermata aperta")
      # Dodici caratteri: la stessa soglia del presidio della bacheca, e per la stessa ragione -
      # una formula seguita dal nulla supera una lettura distratta, ed e' peggio dell'assenza.
      [ "${#conseguenza}" -ge 12 ] || segnala "$riga" "$voce" \
        "esito «confermata aperta» senza la conseguenza dichiarata. Senza di essa e' un silenzio con una casella intorno."
      [ -n "$data" ] || segnala "$riga" "$voce" "esito «confermata aperta» senza la data in cui e' stato registrato." ;;
    "in attesa")
      case "$criterio" in [1-7]) senza_esito=$((senza_esito + 1));; esac ;;
    *)
      segnala "$riga" "$voce" "esito «$esito» fuori dominio: attesi «decisa», «confermata aperta» oppure «in attesa»." ;;
  esac
done < "$REGISTRO_DECISIONI"

[ "$totale" -gt 0 ] || errore_uso \
  "nessuna riga di dati riconosciuta in «$REGISTRO_DECISIONI»." \
  "Un registro vuoto non e' un registro conforme: e' un errore di configurazione."

# I SETTE CRITERI CI SONO TUTTI? Una voce dimenticata non produce alcuna riga, quindi nessun
# rilievo di forma la troverebbe: il solo modo di accorgersene e' contare i criteri coperti. E'
# l'errore per omissione, che nessun controllo riga per riga puo' vedere.
mancanti=""
for n in $(seq 1 "$CRITERI_ATTESI"); do
  case " $criteri_visti " in *" $n "*) ;; *) mancanti="$mancanti $n";; esac
done
if [ -n "$mancanti" ]; then
  printf '%s✗ Criteri di T-05 senza alcuna riga nel registro:%s%s\n' "$ROSSO" "$mancanti" "$FINE_COLORE" >&2
  printf 'Una voce dimenticata non produce righe e quindi non produce rilievi: si conta, non si legge.\n' >&2
  rilievi=$((rilievi + 1))
fi

printf '== Registro delle decisioni con scadenza - criterio di fonte di T-05 ==\n\n'
printf 'Voci registrate:                 %s\n' "$totale"
printf 'Criteri del traguardo coperti:   %s su %s\n' "$(printf '%s' "$criteri_visti" | wc -w)" "$CRITERI_ATTESI"
printf 'Criteri ancora senza esito:      %s\n\n' "$senza_esito"

if [ "$rilievi" -gt 0 ]; then
  printf '%s✗ %d rilievo/i di forma sul registro delle decisioni.%s\n' "$ROSSO" "$rilievi" "$FINE_COLORE" >&2
  exit 1
fi

if [ "$senza_esito" -gt 0 ]; then
  if [ "$OGGI" \< "$ESITO_BLOCCANTE_DAL" ]; then
    printf '%s%d criterio/i di T-05 non hanno ancora un esito registrato. In sola segnalazione fino al %s,%s\n' \
      "$GIALLO" "$senza_esito" "$ESITO_BLOCCANTE_DAL" "$FINE_COLORE"
    printf '%spoi bloccante: e'\'' la scadenza del traguardo. Nessuno puo'\'' soddisfare questa regola scrivendo -%s\n' "$GIALLO" "$FINE_COLORE"
    printf '%sle decisioni sono del committente, e «confermata aperta» e'\'' a sua volta una sua decisione.%s\n' "$GIALLO" "$FINE_COLORE"
    exit 0
  fi
  printf '%s✗ %d criterio/i di T-05 sono oltre la scadenza senza un esito registrato.%s\n' "$ROSSO" "$senza_esito" "$FINE_COLORE" >&2
  exit 1
fi

printf '%s✓ Tutte le %s voci sono ben formate, e i %s criteri di T-05 hanno un esito registrato.%s\n' \
  "$VERDE" "$totale" "$CRITERI_ATTESI" "$FINE_COLORE"
exit 0
