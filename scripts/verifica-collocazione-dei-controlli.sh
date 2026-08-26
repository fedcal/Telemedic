#!/usr/bin/env bash
# Sorveglia la tabella che dice dove sta ciascun controllo della pipeline.
#
# Il criterio 4 di T-03 esige che ogni controllo in sola segnalazione dichiari la data in cui
# diventa bloccante. È una regola che, scritta soltanto in prosa, non ha mai retto: la riduzione
# temporanea entra con la sua buona ragione, la data non viene scritta, e dopo qualche mese nessuno
# ricorda più che quel controllo era temporaneamente indulgente. Il flusso «verifiche.yml» ne porta
# un esempio: un lavoro con «continue-on-error: true» e un commento che ne dichiara la condizione di
# uscita, condizione soddisfatta da tempo e mai eseguita.
#
# Questo controllo rende la regola verificabile. Legge pipeline/collocazione-dei-controlli.tsv e
# fallisce quando una riga viola una delle quattro regole dichiarate in pipeline/README.md.
set -euo pipefail

cd "$(dirname "$0")/.."

TABELLA="${TABELLA:-pipeline/collocazione-dei-controlli.tsv}"
BANCO="${BANCO:-scripts/prove/esegui-prove.sh}"
CORSIE="${CORSIE:-.github/workflows}"
FASCE_AMMESSE="rapida completa estesa rilascio"
STATI_AMMESSI="bloccante segnalazione"

errori=0
righe=0

if [ ! -f "$TABELLA" ]; then
  printf '\033[31m✗ tabella assente: %s\033[0m\n' "$TABELLA"
  exit 1
fi

segnala() {
  printf '\033[31m✗ riga %s (%s): %s\033[0m\n' "$1" "$2" "$3"
  errori=$((errori+1))
}

intestazione_vista=0
numero=0
# NON usare «IFS=$'\t' read -r a b c …»: la tabulazione è per bash un carattere di IFS
# *bianco*, quindi due tabulazioni consecutive vengono fuse in una sola e ogni campo vuoto
# fa scalare di uno tutti quelli che seguono. Il controllo leggerebbe il campo sbagliato e
# direbbe il falso con sicurezza - che è precisamente il difetto che questo script esiste per
# impedire altrove. I campi si estraggono quindi per posizione, con «cut», che i campi vuoti
# li conta.
campo() { printf '%s' "$1" | cut -f"$2"; }
while IFS= read -r linea || [ -n "$linea" ]; do
  numero=$((numero+1))
  case "$linea" in ''|'#'*) continue;; esac
  controllo=$(campo "$linea" 1); nome=$(campo "$linea" 2); fascia=$(campo "$linea" 3)
  stato=$(campo "$linea" 4);     bloccante_dal=$(campo "$linea" 5); criterio=$(campo "$linea" 6)
  eseguibile=$(campo "$linea" 7); prova=$(campo "$linea" 8);       motivo=$(campo "$linea" 9)
  if [ "$intestazione_vista" -eq 0 ]; then
    # La prima riga non commentata è l'intestazione: se le colonne non sono quelle attese, ogni
    # controllo successivo leggerebbe il campo sbagliato e direbbe il falso con sicurezza.
    if [ "$controllo" != "controllo" ] || [ "$prova" != "prova_negativa" ] || [ "$motivo" != "motivo_collocazione" ]; then
      printf '\033[31m✗ intestazione inattesa alla riga %s: la tabella non ha le nove colonne dichiarate in pipeline/README.md\033[0m\n' "$numero"
      exit 1
    fi
    intestazione_vista=1
    continue
  fi
  righe=$((righe+1))

  # Regola 1 - la fascia è una delle quattro.
  ammessa=0
  for f in $FASCE_AMMESSE; do [ "$fascia" = "$f" ] && ammessa=1; done
  [ "$ammessa" -eq 1 ] || segnala "$numero" "$controllo" "fascia non ammessa: «$fascia»"

  ammesso=0
  for s in $STATI_AMMESSI; do [ "$stato" = "$s" ] && ammesso=1; done
  [ "$ammesso" -eq 1 ] || segnala "$numero" "$controllo" "stato non ammesso: «$stato»"

  # Regola 2 - la sola segnalazione esige una data, e la data ha una forma.
  if [ "$stato" = "segnalazione" ]; then
    if [ -z "$bloccante_dal" ]; then
      segnala "$numero" "$controllo" "in sola segnalazione senza «bloccante_dal»: una riduzione senza data di scadenza è una rinuncia non dichiarata"
    elif ! printf '%s' "$bloccante_dal" | grep -qE '^[0-9]{4}-[0-9]{2}-[0-9]{2}$'; then
      segnala "$numero" "$controllo" "«bloccante_dal» non è una data ISO: «$bloccante_dal»"
    fi
  fi

  # Regola 5 - la corsia dichiarata esegue davvero il controllo.
  #
  # Le prime quattro regole verificano che la riga sia BEN FORMATA. Nessuna verifica che sia
  # VERA. La differenza non e' teorica: la riga RD-C1 ha dichiarato per giorni «fascia completa,
  # bloccante», mentre fascia-completa.yml non invocava affatto il suo script - e questo controllo
  # e' rimasto verde, perche' «completa» e' una delle quattro stringhe ammesse e la colonna della
  # prova citava casi che nel banco esistevano davvero. Una tabella di collocazione che non sa
  # dire se la collocazione esiste sorveglia la propria sintassi, non la pipeline. E' la stessa
  # forma del difetto D-10 del runbook, spostata di un livello: li' un controllo portava dentro di
  # se' una copia di cio' che sorvegliava, qui una tabella descrive una realta' che non guarda.
  #
  # La colonna «eseguibile» ammette tre forme, dichiarate in pipeline/README.md:
  #
  #   percorso/script.sh          la corsia della riga deve invocarlo
  #   flusso.yml#lavoro           quel flusso deve esistere e contenere quel lavoro
  #   A + B                       un controllo che vive in due luoghi perche' presidia due meta'
  #                               diverse (e' il caso di G9). La PRIMA meta' deve stare nella
  #                               corsia dichiarata dalla riga - altrimenti la colonna «fascia»
  #                               direbbe il falso - le successive devono soltanto esistere.
  #   da collocare                ammesso solo finche' la data di «bloccante_dal» non e' arrivata,
  #                               con la stessa logica della regola 3: un'attivita' prescritta e
  #                               non ancora collocata e' debito visibile, ma dal giorno in cui
  #                               blocca dev'essere collocata davvero, o non blocchera' nulla.
  #
  # Si esegue solo se la fascia e' fra le quattro: con una fascia fuori elenco il nome del file di
  # corsia sarebbe inventato, e questo controllo segnalerebbe due volte lo stesso refuso.
  if [ "$ammessa" -eq 1 ]; then
    case "$fascia" in
      rilascio) corsia="$CORSIE/fascia-di-rilascio.yml";;
      *)        corsia="$CORSIE/fascia-$fascia.yml";;
    esac
    if [ ! -f "$corsia" ]; then
      segnala "$numero" "$controllo" "la corsia «$fascia» non ha un flusso: $corsia non esiste"
    else
      prima_meta=1
      # Il separatore e' « + » con gli spazi: un piu' senza spazi puo' comparire dentro un nome
      # di file, uno con gli spazi no.
      vecchio_ifs="$IFS"; IFS='+'; read -ra meta <<< "$(printf '%s' "$eseguibile" | sed 's/ + /+/g')"; IFS="$vecchio_ifs"
      for m in "${meta[@]}"; do
        m="$(printf '%s' "$m" | sed 's/^ *//; s/ *$//')"
        [ -z "$m" ] && continue
        bersaglio="$corsia"
        [ "$prima_meta" -eq 1 ] || bersaglio=""
        case "$m" in
          'da collocare')
            if [ "$stato" = "bloccante" ]; then
              segnala "$numero" "$controllo" "bloccante ma «da collocare»: un controllo che blocca senza un luogo in cui girare non blocca nulla"
            elif [ -n "$bloccante_dal" ] && [ ! "$bloccante_dal" \> "${OGGI:-$(date +%F)}" ]; then
              segnala "$numero" "$controllo" "«da collocare» dal $bloccante_dal: la data e' arrivata, la collocazione e' esigibile"
            fi
            ;;
          *.sh)
            if [ -n "$bersaglio" ]; then
              grep -qF "$m" "$bersaglio" || segnala "$numero" "$controllo" "la corsia «$fascia» non esegue «$m»: $(basename "$bersaglio") non lo nomina"
            else
              grep -rqF "$m" "$CORSIE" || segnala "$numero" "$controllo" "nessuna corsia esegue «$m»"
            fi
            ;;
          *'#'*)
            flusso="${m%%#*}"; lavoro="${m##*#}"
            # Il flusso e' dichiarato per intero nella tabella, radice compresa. Si risolve
            # PRIMA dentro CORSIE e solo dopo per percorso letterale: in esercizio le due vie
            # danno lo stesso file, ma in collaudo l'ordine inverso farebbe leggere il flusso
            # REALE invece della tenuta sintetica, e il caso proverebbe qualcosa che non e' suo.
            if [ -f "$CORSIE/$(basename "$flusso")" ]; then flusso="$CORSIE/$(basename "$flusso")"; fi
            if [ ! -f "$flusso" ]; then
              segnala "$numero" "$controllo" "il flusso dichiarato non esiste: «$m»"
            elif ! grep -qE "^  ${lavoro}:" "$flusso"; then
              segnala "$numero" "$controllo" "il flusso $(basename "$flusso") non ha il lavoro «$lavoro»"
            elif [ -n "$bersaglio" ] && [ "$(basename "$flusso")" != "$(basename "$bersaglio")" ]; then
              segnala "$numero" "$controllo" "la riga dichiara la fascia «$fascia» ma il suo eseguibile vive in $(basename "$flusso")"
            fi
            ;;
          *)
            segnala "$numero" "$controllo" "«eseguibile» in una forma non dichiarata da pipeline/README.md: «$m»"
            ;;
        esac
        prima_meta=0
      done
    fi
  fi

  # Regola 3 - la prova negativa e' esigibile da quando il controllo blocca.
  #
  # Un controllo BLOCCANTE senza prova negativa e' una dichiarazione di intenti che gira
  # in pipeline: si segnala sempre. Un controllo in SEGNALAZIONE puo' non averla, ma solo
  # finche' la sua data non e' arrivata - perche' un controllo che presuppone codice
  # ancora inesistente non ha un comportamento che possa fallire, e non c'e' nulla da
  # provare. La data di «bloccante_dal» e' il giorno in cui la prova diventa esigibile, e
  # da quel giorno questo script la pretende da solo, senza che nessuno se ne ricordi:
  # e' il meccanismo che impedisce alla riduzione temporanea di diventare permanente.
  #
  # OGGI e' sovrascrivibile perche' altrimenti il collaudo dipenderebbe dal calendario:
  # un caso del banco che passa a settembre e fallisce a ottobre non e' un caso, e' una
  # bomba a orologeria.
  oggi="${OGGI:-$(date +%F)}"
  if [ -z "$prova" ]; then
    if [ "$stato" = "bloccante" ]; then
      segnala "$numero" "$controllo" "senza prova negativa: un controllo che nessuno ha visto fallire non è un controllo"
      continue
    fi
    if [ -n "$bloccante_dal" ] && [ ! "$bloccante_dal" \> "$oggi" ]; then
      segnala "$numero" "$controllo" "in segnalazione dal $bloccante_dal senza prova negativa: la data è arrivata, la prova è esigibile"
    fi
    continue
  fi

  # Regola 4 - ogni caso citato esiste davvero nel banco.
  IFS='|' read -ra casi <<< "$prova"
  for c in "${casi[@]}"; do
    # Gli spazi ai bordi sono di leggibilità, non parte del nome del caso.
    c="$(printf '%s' "$c" | sed 's/^ *//; s/ *$//')"
    [ -z "$c" ] && continue
    if ! grep -qF "$c" "$BANCO"; then
      segnala "$numero" "$controllo" "la prova negativa cita un caso che nel banco non esiste: «$c»"
    fi
  done
done < "$TABELLA"

printf '\nRighe verificate: %d · Errori: %d\n' "$righe" "$errori"

if [ "$errori" -gt 0 ]; then
  cat <<'NOTA'

Che cosa fare. Una riga senza prova negativa non si sistema svuotando la colonna né togliendo la
riga: si sistema scrivendo il caso che manca in scripts/prove/esegui-prove.sh, verificando che
fallisca quando il controllo viene guastato, e citandolo qui. Una data mancante non si sistema
portando il controllo a bloccante senza guardare che cosa succede: si sceglie la data, la si
dichiara, e la si rispetta.
NOTA
  exit 1
fi

printf '\033[32m✓ Ogni controllo dichiara fascia, forza, scadenza della sola segnalazione, prova che sa fallire\ne una corsia che lo esegue davvero.\033[0m\n'
