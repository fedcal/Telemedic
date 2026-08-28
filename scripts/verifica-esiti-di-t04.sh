#!/usr/bin/env bash
# Ogni verifica di T-04 ha un esito registrato, e accanto la conseguenza sulla progettazione.
#
# PERCHE' ESISTE. E' il criterio di completamento di T-04 nella sua lettera: per ciascuna delle
# cinque verifiche un esito fra «riuscita», «fallita» e «riuscita con condizioni», PIU' la
# conseguenza sulla progettazione scritta accanto. Un esito senza conseguenza scritta non chiude, e
# non e' una formalita': l'esito dice che cosa e' successo, la conseguenza dice che cosa cambia. Un
# progetto che registri solo il primo si ritrova fra sei mesi con cinque verifiche riuscite e
# nessuna traccia di che cosa gli abbiano insegnato.
#
# DUE VELOCITA', per la stessa ragione del presidio delle decisioni di T-05. Le regole di FORMA -
# valori ammessi, condizioni presenti quando l'esito le dichiara, conseguenza presente su ogni
# esito, tutti e cinque i criteri con una riga - sono soddisfacibili oggi da chi tiene il registro e
# BLOCCANO da subito. La regola di SOSTANZA - nessuna verifica resta senza esito - non e'
# soddisfacibile finche' la finestra di esecuzione non si apre: e' in sola segnalazione fino al
# 2026-10-03, che e' la scadenza di T-04, e da quel giorno blocca. Una riduzione temporanea senza
# una data dichiarata e' il modo in cui diventa permanente: criterio 4 di T-03.
#
# LA REGOLA CHE QUESTO CONTROLLO NON PUO' FAR RISPETTARE, ed e' la piu' importante del registro: che
# l'esito sia scritto MENTRE la verifica gira e non dopo. Il piano lo dice - «un esito registrato il
# giorno dopo e' un esito ricostruito» - e la ricostruzione ha una direzione sola: si ricorda cio'
# che ha funzionato e si dimentica la condizione che lo rendeva vero. Le condizioni sono la parte
# che si perde per prima, e sono la parte che serve. Nessuno script distingue un esito scritto
# durante da uno scritto il giorno dopo; la colonna della data dice QUANDO la verifica e' stata
# eseguita, non quando qualcuno l'ha scritta, e le due possono divergere senza che si veda.
#
# Uscita: 0 conforme, 1 violazione, 2 errore d'uso.
set -uo pipefail

cd "$(dirname "$0")/.."

REGISTRO_ESITI="${REGISTRO_ESITI:-verifiche/P8-registro-degli-esiti.tsv}"
ESITO_BLOCCANTE_DAL="${ESITO_BLOCCANTE_DAL:-2026-10-03}"
OGGI="${OGGI:-$(date -u +%Y-%m-%d)}"
CRITERI_ATTESI="${CRITERI_ATTESI:-5}"

VERDE=$'\033[32m'; ROSSO=$'\033[31m'; GIALLO=$'\033[33m'; FINE_COLORE=$'\033[0m'

errore_uso() {
  printf '%sErrore d'\''uso: %s%s\n' "$ROSSO" "$1" "$FINE_COLORE" >&2
  [ -n "${2:-}" ] && printf '%s\n' "$2" >&2
  exit 2
}

[ -r "$REGISTRO_ESITI" ] || errore_uso \
  "il registro «$REGISTRO_ESITI» non esiste o non e'\'' leggibile." \
  "Percorso configurabile con REGISTRO_ESITI."

rilievi=0
senza_esito=0
totale=0
criteri_visti=""

segnala() {
  printf '%s✗ riga %s (criterio %s): %s%s\n' "$ROSSO" "$1" "$2" "$3" "$FINE_COLORE" >&2
  rilievi=$((rilievi + 1))
}

# I campi si estraggono con «cut -f» e non con «IFS=TAB read»: la tabulazione appartiene agli spazi
# di IFS, quindi «read» ne collassa le occorrenze consecutive e i campi vuoti spariscono spostando
# a sinistra tutti quelli che seguono. E' la voce C-1 del runbook, e su un registro come questo -
# dove le colonne vuote sono la norma finche' le verifiche non girano - il danno sarebbe totale.
riga=0
while IFS= read -r linea; do
  riga=$((riga + 1))
  case "$linea" in \#*|"") continue;; "criterio"$'\t'*) continue;; esac
  criterio=$(printf '%s' "$linea" | cut -f1)
  verifica=$(printf '%s' "$linea" | cut -f2)
  esito=$(printf '%s' "$linea" | cut -f3)
  condizioni=$(printf '%s' "$linea" | cut -f4)
  conseguenza=$(printf '%s' "$linea" | cut -f5)
  data=$(printf '%s' "$linea" | cut -f6)
  totale=$((totale + 1))

  case "$criterio" in
    [1-9])
      case " $criteri_visti " in
        *" $criterio "*) segnala "$riga" "$criterio" "il criterio e' gia' assegnato a un'altra riga. Ogni verifica di T-04 ha una riga sola.";;
        *) criteri_visti="$criteri_visti $criterio";;
      esac ;;
    *) segnala "$riga" "$criterio" "criterio fuori dominio: atteso un numero da 1 a $CRITERI_ATTESI." ;;
  esac

  [ -n "$verifica" ] || segnala "$riga" "$criterio" \
    "la riga non dice quale verifica sia. Un registro che non nomina cio' che registra non si legge."

  case "$esito" in
    riuscita|fallita)
      [ -n "$condizioni" ] && segnala "$riga" "$criterio" \
        "esito «$esito» con delle condizioni scritte. Le condizioni appartengono a «riuscita con condizioni»: scritte altrove nascondono un esito che non e' quello dichiarato."
      # Dodici caratteri: la stessa soglia degli altri presidi del repository, e per la stessa
      # ragione - una casella riempita con una formula supera una lettura distratta, ed e' peggio
      # dell'assenza, che almeno si vede.
      [ "${#conseguenza}" -ge 12 ] || segnala "$riga" "$criterio" \
        "esito «$esito» senza la conseguenza sulla progettazione. Vale soprattutto per «fallita»: l'unica cosa che un fallimento produce e' l'informazione su come non farlo."
      [ -n "$data" ] || segnala "$riga" "$criterio" "esito «$esito» senza la data di esecuzione." ;;
    "riuscita con condizioni")
      [ "${#condizioni}" -ge 12 ] || segnala "$riga" "$criterio" \
        "esito «riuscita con condizioni» senza le condizioni. E' un «riuscita» scritto in modo da sembrare prudente, ed e' peggio di entrambi."
      [ "${#conseguenza}" -ge 12 ] || segnala "$riga" "$criterio" \
        "esito «riuscita con condizioni» senza la conseguenza sulla progettazione."
      [ -n "$data" ] || segnala "$riga" "$criterio" "esito «riuscita con condizioni» senza la data di esecuzione." ;;
    "non eseguita")
      senza_esito=$((senza_esito + 1))
      [ -z "$conseguenza$condizioni$data" ] && true || segnala "$riga" "$criterio" \
        "esito «non eseguita» con condizioni, conseguenza o data compilate. Una verifica non eseguita non ha prodotto nulla: se qualcosa c'e', l'esito e' scritto male." ;;
    *)
      segnala "$riga" "$criterio" "esito «$esito» fuori dominio: attesi «riuscita», «fallita», «riuscita con condizioni» oppure «non eseguita»." ;;
  esac
done < "$REGISTRO_ESITI"

[ "$totale" -gt 0 ] || errore_uso \
  "nessuna riga di dati riconosciuta in «$REGISTRO_ESITI»." \
  "Un registro vuoto non e'\'' conforme: e'\'' un errore di configurazione."

# L'ERRORE PER OMISSIONE: una verifica dimenticata non produce alcuna riga, quindi nessun rilievo
# riga per riga la troverebbe. Il solo modo di accorgersene e' contare i criteri coperti.
mancanti=""
for n in $(seq 1 "$CRITERI_ATTESI"); do
  case " $criteri_visti " in *" $n "*) ;; *) mancanti="$mancanti $n";; esac
done
if [ -n "$mancanti" ]; then
  printf '%s✗ Verifiche di T-04 senza alcuna riga nel registro:%s%s\n' "$ROSSO" "$mancanti" "$FINE_COLORE" >&2
  printf 'Una verifica dimenticata non produce righe e quindi non produce rilievi: si conta, non si legge.\n' >&2
  rilievi=$((rilievi + 1))
fi

printf '== Registro degli esiti delle verifiche empiriche - criterio di completamento di T-04 ==\n\n'
printf 'Verifiche registrate:      %s\n' "$totale"
printf 'Criteri coperti:           %s su %s\n' "$(printf '%s' "$criteri_visti" | wc -w)" "$CRITERI_ATTESI"
printf 'Verifiche senza esito:     %s\n\n' "$senza_esito"

if [ "$rilievi" -gt 0 ]; then
  printf '%s✗ %d rilievo/i di forma sul registro degli esiti.%s\n' "$ROSSO" "$rilievi" "$FINE_COLORE" >&2
  exit 1
fi

if [ "$senza_esito" -gt 0 ]; then
  if [ "$OGGI" \< "$ESITO_BLOCCANTE_DAL" ]; then
    printf '%s%d verifica/e di T-04 non hanno ancora un esito. In sola segnalazione fino al %s,%s\n' \
      "$GIALLO" "$senza_esito" "$ESITO_BLOCCANTE_DAL" "$FINE_COLORE"
    printf '%spoi bloccante: e'\'' la scadenza del traguardo. La finestra di esecuzione va dal 26 settembre%s\n' "$GIALLO" "$FINE_COLORE"
    printf '%sal 3 ottobre 2026, ed e'\'' interamente consumata da T-04: T-08 non comincia prima del suo esito.%s\n' "$GIALLO" "$FINE_COLORE"
    exit 0
  fi
  printf '%s✗ %d verifica/e di T-04 sono oltre la scadenza senza un esito registrato.%s\n' "$ROSSO" "$senza_esito" "$FINE_COLORE" >&2
  exit 1
fi

printf '%s✓ Tutte le %s verifiche hanno un esito e la conseguenza sulla progettazione.%s\n' \
  "$VERDE" "$CRITERI_ATTESI" "$FINE_COLORE"
exit 0
