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
# Registro dei traguardi, per la regola 6: sovrascrivibile per il collaudo, con la stessa
# disciplina di TABELLA, BANCO e CORSIE (voce D-17 del runbook) - non si può puntare questo
# controllo su docs/09_roadmap/02-traguardi.md sintetico senza un modo di sostituirlo, e non si
# deve toccare quel file reale solo per collaudare una regola.
TRAGUARDI="${TRAGUARDI:-docs/09_roadmap/02-traguardi.md}"
# Criteri collettivi, per la regola 7: quelli che il proprio testo affida a piu' controlli. Sta in
# un file versionato e non in una lista qui dentro, per la voce D-10 del runbook - un controllo che
# porta dentro di se' una copia di cio' che sorveglia non sorveglia piu'. Se il file manca, il
# controllo non decide da solo quali criteri siano collettivi: esce 2, che e' errore d'uso e non
# violazione.
CRITERI_COLLETTIVI="${CRITERI_COLLETTIVI:-pipeline/criteri-collettivi.tsv}"
FASCE_AMMESSE="rapida completa estesa rilascio"
STATI_AMMESSI="bloccante segnalazione"

errori=0
righe=0

if [ ! -f "$TABELLA" ]; then
  printf '\033[31m✗ tabella assente: %s\033[0m\n' "$TABELLA"
  exit 1
fi
if [ ! -f "$TRAGUARDI" ]; then
  printf '\033[31m✗ registro dei traguardi assente: %s\033[0m\n' "$TRAGUARDI"
  exit 1
fi
if [ ! -r "$CRITERI_COLLETTIVI" ]; then
  printf '\033[31m✗ dichiarazione dei criteri collettivi assente o illeggibile: %s\033[0m\n' "$CRITERI_COLLETTIVI"
  printf '  Senza di essa la regola 7 non sa quali criteri il proprio testo affidi a piu\x27 controlli,\n'
  printf '  e non lo indovina: si ripristina il file, non si disattiva la regola.\n'
  exit 2
fi

declare -A COLLETTIVO=()
# Per posizione con «cut -f», mai con «read»: voce C-1 del runbook. Qui le colonne sono due e il
# collasso sarebbe innocuo, ma la regola non ammette eccezioni «innocue» - e' cosi' che tornano.
while IFS= read -r _riga_collettivo || [ -n "$_riga_collettivo" ]; do
  _criterio=$(printf '%s' "$_riga_collettivo" | cut -f1)
  _motivo=$(printf '%s' "$_riga_collettivo" | cut -f2)
  case "$_criterio" in ''|'#'*|criterio) continue ;; esac
  COLLETTIVO["$_criterio"]=1
done < "$CRITERI_COLLETTIVI"

# Regola 6, preparazione - quanti criteri di completamento numerati ha ciascun traguardo.
#
# Difetto corretto il 27 agosto 2026: due righe della tabella citavano un criterio che il proprio
# testo non verifica affatto (T01-C8 citava T-01/8, che riguarda le avvertenze pubbliche e non la
# conformità redazionale) o che un'altra riga citava già per un oggetto diverso (SIG-C1 citava
# T-01/5, già di T01-C5). Nessuno dei due errori era visibile a una lettura sola della tabella:
# serviva aprire docs/09_roadmap/02-traguardi.md e contare. Questa regola lo fa da sola.
#
# Ogni traguardo elenca i propri criteri come lista numerata «1. », «2. », … che RIPARTE da 1 a
# ogni traguardo (verificato leggendo l'intero file il 27 agosto 2026: nessun'altra lista
# numerata di primo livello compare nelle sezioni dei traguardi, e i titoli «### » che non sono un
# traguardo - «### 2.1 …», «### 4.1 …» eccetera - interrompono la sezione corrente prima che
# inizi il testo che li segue). Contare quelle righe, sezione per sezione, e' quindi sufficiente
# a sapere quanti criteri un dato «T-NN» ha davvero, senza portare dentro questo script una copia
# del loro numero (sarebbe di nuovo D-10: una copia diverge dal testo la prima volta che qualcuno
# aggiunge o toglie un criterio e dimentica di aggiornare lo script).
declare -A TRAGUARDO_CRITERI=()
while IFS= read -r _riga_trg || [ -n "$_riga_trg" ]; do
  _trg=$(printf '%s' "$_riga_trg" | cut -f1)
  _n=$(printf '%s' "$_riga_trg" | cut -f2)
  [ -n "$_trg" ] || continue
  TRAGUARDO_CRITERI["$_trg"]="$_n"
done < <(awk '
  /^### `T-[0-9]+`/ {
    match($0, /T-[0-9]+/)
    corrente = substr($0, RSTART, RLENGTH)
    next
  }
  /^### / { corrente = ""; next }
  corrente != "" && /^[0-9]+\. / { CONTA[corrente]++ }
  END { for (t in CONTA) printf "%s\t%d\n", t, CONTA[t] }
' "$TRAGUARDI")

# Regola 7, preparazione - nessun criterio datato citato da due righe diverse. Lo stato attraversa
# l'intero ciclo sulle righe, non è locale a una riga come le regole 1-6: per questo vive qui,
# dichiarato prima del ciclo, e si popola dentro di esso.
declare -A VISTO_CRITERIO=()

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

  # Regole 6 e 7 - il criterio citato risolve, e nessun criterio datato è citato da due righe.
  #
  # Si applicano solo alla forma «T-NN/M»: «N/D» e le forme come «CLAUDE.md/…» (CV-C1) dichiarano
  # apertamente di non presidiare un criterio numerato di un traguardo, e più righe possono
  # legittimamente essere «N/D» insieme - lo sono, oggi, CR-C1, RD-C1 e SIG-C1, ciascuna per un
  # motivo proprio dichiarato nella propria colonna «motivo». Applicare la regola 7 anche a «N/D»
  # trasformerebbe quella dichiarazione onesta in un difetto.
  if printf '%s' "$criterio" | grep -qE '^T-[0-9]+/[0-9]+$'; then
    traguardo_criterio="${criterio%%/*}"
    numero_criterio="${criterio##*/}"
    conta_traguardo="${TRAGUARDO_CRITERI[$traguardo_criterio]:-0}"
    if [ "$conta_traguardo" -eq 0 ]; then
      segnala "$numero" "$controllo" "il criterio «$criterio» non risolve: «$traguardo_criterio» non esiste in $TRAGUARDI, o non ha criteri di completamento numerati"
    elif [ "$numero_criterio" -gt "$conta_traguardo" ]; then
      segnala "$numero" "$controllo" "il criterio «$criterio» non risolve: «$traguardo_criterio» ha solo $conta_traguardo criteri di completamento"
    fi

    if [ -n "${VISTO_CRITERIO[$criterio]:-}" ] && [ -z "${COLLETTIVO[$criterio]:-}" ]; then
      segnala "$numero" "$controllo" "criterio «$criterio» già citato dalla riga «${VISTO_CRITERIO[$criterio]}», e non è dichiarato collettivo in $CRITERI_COLLETTIVI: due controlli su un criterio che ne nomina uno solo significano che almeno uno dei due sta parlando d'altro. Se il criterio davvero ne prevede più d'uno, si dichiara là con la ragione"
    else
      VISTO_CRITERIO["$criterio"]="$controllo"
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
          # Dal 27 agosto 2026 anche «.py»: il criterio 6 di T-03 e' presidiato per meta' da un
          # GENERATORE, non da un controllo, e quel generatore e' in Python come gli altri due del
          # progetto. La verifica e' identica - la corsia dichiarata deve nominare il file - e non
          # cambia con il linguaggio: cio' che la regola 5 accerta e' che la collocazione esista,
          # non in che cosa sia scritta.
          *.sh|*.py)
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
