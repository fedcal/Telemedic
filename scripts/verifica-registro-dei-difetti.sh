#!/usr/bin/env bash
# Controllo di costruzione - registro/difetti.tsv (pipeline/README-DIFETTI.md).
#
# Il registro dei difetti (registro/difetti.tsv) è un giornale in sola aggiunta - stessa
# disciplina di registro/identificativi-requisiti.tsv - con una riga per ciascuna delle voci di
# .telemedic/context/RUNBOOK-ERRORI-E-TRAPPOLE.md. Questo controllo fa fallire la costruzione
# quando:
#
#   1. una voce del runbook non compare nel registro, oppure vi compare con l'evento
#      "registrata" più di una volta;
#   2. una riga dichiarata "presidiata" nomina un controllo che non esiste come file eseguibile,
#      oppure un caso di banco il cui nome non compare in scripts/prove/esegui-prove.sh;
#   3. una riga non presidiata (stato diverso da "presidiata") è priva sia della data di
#      esigibilità sia di una motivazione che la marchi "non-presidiabile";
#   4. una riga "esigibile-da-data" la cui data è arrivata: da quel giorno la lacuna è un
#      errore, non una tolleranza;
#   5. il registro stesso è malformato - colonne mancanti, valori fuori dominio, campi
#      obbligatori vuoti: un giornale che non si legge in modo univoco non può fondare nessuna
#      proiezione di stato.
#
# QUESTO CONTROLLO LEGGE IL RUNBOOK, NON UNA COPIA (D-10 del runbook stesso). Le voci canoniche
# - l'elenco rispetto a cui la regola 1 verifica che nulla manchi - si estraggono dai titoli
# `### A-1.`, `### D-10.` eccetera del file indicato da RUNBOOK, con
#   grep -oE '^### [A-D]-[0-9]+(bis)?' "$RUNBOOK" | sed 's/### //'
# Una versione precedente di questo script teneva le voci scritte dentro di sé, motivandolo con
# «il runbook è prosa, non un elenco leggibile da macchina»: era falso, ed è rimasto verde quando
# è stata aggiunta la voce D-9, perché sorvegliava una copia e non la fonte. Non si ripete: se
# RUNBOOK manca o non è leggibile, il controllo non gira a vuoto e non passa in silenzio - esce
# 2, come per il registro e per il banco. Se l'estrazione trova zero voci, non è un runbook
# vuoto: è un errore di configurazione (un percorso sbagliato, un formato di titolo cambiato), e
# anche questo esce 2, non 0 a insieme vuoto.
#
# CONVENZIONE DI USCITA (stessa di scripts/verifica-registro-componenti.sh e di
# scripts/verifica-dati-sintetici.sh): 2 quando il controllo non può nemmeno partire (il
# runbook, il registro o il banco dichiarati non esistono, o l'estrazione delle voci è vuota),
# 1 quando è partito e ha trovato un rilievo, 0 quando non ne ha trovati.
#
# COLLAUDABILITÀ. Il controllo accetta sei variabili d'ambiente:
#   REGISTRO_DIFETTI     - percorso del registro (per difetto registro/difetti.tsv)
#   BANCO                - percorso del banco di prova, o di un banco fittizio per il collaudo
#                           di QUESTO controllo (per difetto scripts/prove/esegui-prove.sh)
#   RADICE_CONTROLLI     - radice da cui risolvere i percorsi della colonna "controllo" (per
#                           difetto la radice del repository)
#   OGGI                 - data odierna nella forma AAAA-MM-GG, per collaudare la regola 4 senza
#                           dipendere dal calendario reale (per difetto la data di sistema)
#   RUNBOOK              - percorso del runbook da cui si estraggono le voci canoniche (per
#                           difetto .telemedic/context/RUNBOOK-ERRORI-E-TRAPPOLE.md). È la FONTE,
#                           non un'alternativa: in esercizio non esiste altro modo di ottenere
#                           l'elenco delle voci
#   VOCI_CANONICHE_FILE  - percorso di un file con una voce per riga (righe vuote e commenti "#"
#                           ignorati), che sostituisce l'estrazione da RUNBOOK. Esiste SOLO PER
#                           IL COLLAUDO di questo script (D-10: «la variabile d'ambiente che
#                           sostituisce la fonte esiste per il collaudo, non come sorgente
#                           alternativa in esercizio»): senza di essa una tenuta dovrebbe
#                           replicare l'intero runbook reale solo per provare la regola 1 su due
#                           voci sintetiche. Non è mai impostata in esecuzione normale, e non è
#                           una riserva silenziosa: quando è assente, il controllo legge RUNBOOK e
#                           basta, senza ricadute
# Senza queste sei variabili il controllo non sarebbe collaudabile con tenute isolate.
set -euo pipefail

cd "$(dirname "$0")/.."

REGISTRO_DIFETTI="${REGISTRO_DIFETTI:-registro/difetti.tsv}"
BANCO="${BANCO:-scripts/prove/esegui-prove.sh}"
RADICE_CONTROLLI="${RADICE_CONTROLLI:-.}"
RADICE_CONTROLLI="${RADICE_CONTROLLI%/}"
[ -n "$RADICE_CONTROLLI" ] || RADICE_CONTROLLI="/"
OGGI="${OGGI:-$(date +%F)}"
RUNBOOK="${RUNBOOK:-.telemedic/context/RUNBOOK-ERRORI-E-TRAPPOLE.md}"
VOCI_CANONICHE_FILE="${VOCI_CANONICHE_FILE:-}"

# --- 0. Il controllo non può nemmeno partire senza le fonti che legge. ---

if [ ! -f "$REGISTRO_DIFETTI" ]; then
  printf '\033[31m✗ Registro dei difetti inesistente: %s\033[0m\n' "$REGISTRO_DIFETTI" >&2
  printf 'Esegui il controllo dalla radice del repository, oppure indica REGISTRO_DIFETTI.\n' >&2
  exit 2
fi

if [ ! -f "$BANCO" ]; then
  printf '\033[31m✗ Banco di prova inesistente: %s\033[0m\n' "$BANCO" >&2
  printf 'Senza il banco non è verificabile che un caso citato in caso_banco esista davvero.\n' >&2
  printf 'Indica BANCO se il banco si trova in una posizione diversa.\n' >&2
  exit 2
fi

# Le voci canoniche del runbook. VOCI_CANONICHE_FILE, quando impostata, sostituisce
# l'estrazione SOLO PER IL COLLAUDO (vedi il commento in testa allo script); altrimenti si legge
# sempre e solo RUNBOOK, mai una copia interna - è la correzione di D-10.
if [ -n "$VOCI_CANONICHE_FILE" ]; then
  if [ ! -f "$VOCI_CANONICHE_FILE" ]; then
    printf '\033[31m✗ VOCI_CANONICHE_FILE indicato ma inesistente: %s\033[0m\n' "$VOCI_CANONICHE_FILE" >&2
    exit 2
  fi
  mapfile -t VOCI_CANONICHE < <(grep -vE '^\s*(#|$)' "$VOCI_CANONICHE_FILE")
else
  if [ ! -f "$RUNBOOK" ] || [ ! -r "$RUNBOOK" ]; then
    printf '\033[31m✗ Runbook inesistente o illeggibile: %s\033[0m\n' "$RUNBOOK" >&2
    printf 'Il controllo non estrae le voci canoniche da una copia: legge il runbook, e se manca\n' >&2
    printf 'si rifiuta di girare invece di passare a insieme vuoto. Indica RUNBOOK se il file si\n' >&2
    printf 'trova altrove.\n' >&2
    exit 2
  fi
  mapfile -t VOCI_CANONICHE < <(grep -oE '^### [A-D]-[0-9]+(bis)?' "$RUNBOOK" | sed 's/### //')
fi

if [ "${#VOCI_CANONICHE[@]}" -eq 0 ]; then
  printf '\033[31m✗ Estratte zero voci canoniche da %s\033[0m\n' "${VOCI_CANONICHE_FILE:-$RUNBOOK}" >&2
  printf 'Un runbook con decine di errori già documentati non produce mai un elenco vuoto: è\n' >&2
  printf 'errore di configurazione (percorso sbagliato, o il formato dei titoli è cambiato e il\n' >&2
  printf 'riconoscitore va aggiornato), non un runbook senza voci. Non si passa a insieme vuoto.\n' >&2
  exit 2
fi

# REGOLA 6 - NESSUNA SIGLA COMPARE DUE VOLTE FRA I TITOLI DEL RUNBOOK.
#
# PERCHE' ESISTE. Il 27 agosto 2026 un agente ha aggiunto cinque voci al runbook riusando sigle
# gia' in uso, da D-27 a D-31: ha letto la coda del file, ha visto dove finiva e ha continuato a
# numerare da li'. Questo controllo non se n'e' accorto, e non poteva: confronta l'INSIEME delle
# sigle estratte con quelle del registro, e un doppione appartiene all'insieme esattamente come
# l'originale. Ha dichiarato «57 voci, tutte presenti» mentre cinque voci nuove erano invisibili,
# ciascuna nascosta dietro un titolo che il registro copriva gia'.
#
# PERCHE' CONTA PIU' DI UN FASTIDIO REDAZIONALE. Il registro dei difetti e' un giornale in sola
# aggiunta indicizzato per sigla: due voci con la stessa sigla non sono due righe da distinguere,
# sono UNA riga che ne descrive un'altra. Chi legge lo stato di «D-30» ne trova due, e quella che
# leggera' dipende dall'ordine del file. Peggio, la voce nuova risulta gia' registrata e gia'
# presidiata dal presidio di quella vecchia, che non la riguarda: e' una copertura dichiarata e
# inesistente, che e' il difetto D-6 di questo stesso runbook.
#
# E' un rilievo, non un errore d'uso: il runbook si legge, la sigla e' semplicemente sbagliata.
mapfile -t SIGLE_DOPPIE < <(printf '%s\n' "${VOCI_CANONICHE[@]}" | sort | uniq -d)
if [ "${#SIGLE_DOPPIE[@]}" -gt 0 ]; then
  printf '\n\033[31m✗ Sigla ripetuta fra i titoli di %s: %s\033[0m\n' \
    "${VOCI_CANONICHE_FILE:-$RUNBOOK}" "${SIGLE_DOPPIE[*]}" >&2
  printf 'Due voci con la stessa sigla non sono due righe da distinguere: sono una riga che ne\n' >&2
  printf 'descrive un altra. La voce nuova risulta gia registrata e gia presidiata dal presidio\n' >&2
  printf 'della vecchia, che non la riguarda - una copertura dichiarata e inesistente.\n' >&2
  printf 'Rinumera la voce aggiunta per ultima e registrala in %s.\n' "$REGISTRO_DIFETTI" >&2
  exit 1
fi

esito=0
rilievi=0

segnala() {
  printf '\n\033[31m✗ %s\033[0m\n%s\n' "$1" "$2" >&2
  esito=1
  rilievi=$((rilievi+1))
}

# Stessa tecnica di scripts/verifica-collocazione-dei-controlli.sh e di
# scripts/verifica-registro-componenti.sh: NON «IFS=$'\t' read -r a b c …», perché la
# tabulazione è per bash un carattere di IFS *bianco* e due tabulazioni consecutive vengono
# fuse, facendo scalare di uno tutti i campi che seguono un campo vuoto - esattamente la forma
# di ogni riga con controllo o bloccante_dal vuoti, cioè la maggioranza delle righe di questo
# registro. I campi si estraggono per POSIZIONE con «cut», che i campi vuoti li conta.
campo() { printf '%s' "$1" | cut -f"$2"; }

RE_DATA_ISO='^[0-9]{4}-[0-9]{2}-[0-9]{2}$'
STATI_AMMESSI="presidiata esigibile-da-data non-presidiabile"
EVENTI_AMMESSI="registrata aggiornata"
FAMIGLIE_AMMESSE="A B C D"

# --- 1. Lettura riga per riga: intestazione, validazione strutturale e semantica per riga. ---

righe_valide=""   # accumula "voce\tdata\tstato\tbloccante_dal\tnumero_riga_fisica" delle righe
                   # valide, per la proiezione di stato del passo «Regola 4» più sotto.
declare -A conteggio_registrata   # voce -> numero di righe con evento "registrata"
declare -A voce_presente          # voce -> 1 se compare almeno una volta nel registro
# Dichiarati QUI, prima di ogni uso: sotto «set -u» un accesso a una chiave di un array
# associativo non ancora dichiarato termina lo script con un crash bash che esce comunque
# diverso da zero e somiglierebbe a un rilievo corretto senza esserlo - è il difetto D-8 del
# runbook, applicato a questo stesso controllo.
declare -A ultimo_stato ultimo_bloccante ultimo_riga

intestazione_vista=0
numero=0

while IFS= read -r linea || [ -n "$linea" ]; do
  numero=$((numero+1))
  case "$linea" in ''|'#'*) continue;; esac

  n_campi=$(printf '%s' "$linea" | awk -F'\t' '{print NF}')

  data=$(campo "$linea" 1);        voce=$(campo "$linea" 2)
  famiglia=$(campo "$linea" 3);    fonte=$(campo "$linea" 4)
  evento=$(campo "$linea" 5);      stato=$(campo "$linea" 6)
  controllo=$(campo "$linea" 7);   caso_banco=$(campo "$linea" 8)
  bloccante_dal=$(campo "$linea" 9); diventa=$(campo "$linea" 10)
  motivazione=$(campo "$linea" 11)

  if [ "$intestazione_vista" -eq 0 ]; then
    if [ "$n_campi" -ne 11 ] || [ "$data" != "data" ] || [ "$voce" != "voce" ] || \
       [ "$motivazione" != "motivazione" ]; then
      printf '\033[31m✗ Intestazione inattesa alla riga %s: il registro non ha le undici colonne dichiarate in pipeline/README-DIFETTI.md\033[0m\n' "$numero" >&2
      exit 1
    fi
    intestazione_vista=1
    continue
  fi

  # --- Regola 5a - malformazione strutturale: numero di colonne. ---
  if [ "$n_campi" -ne 11 ]; then
    segnala "Registro malformato alla riga $numero" \
"Attese 11 colonne separate da TAB (data, voce, famiglia, fonte, evento, stato, controllo,
caso_banco, bloccante_dal, diventa_in_sviluppo, motivazione), trovate $n_campi.
Corregge chi ha scritto la riga: un giornale che non si legge in modo univoco non proietta
uno stato affidabile."
    continue
  fi

  # --- Regola 5b - campi obbligatori sempre non vuoti. ---
  if [ -z "$data" ] || [ -z "$voce" ] || [ -z "$famiglia" ] || [ -z "$fonte" ] || \
     [ -z "$evento" ] || [ -z "$stato" ] || [ -z "$diventa" ]; then
    segnala "Campo obbligatorio vuoto alla riga $numero ($voce)" \
"data, voce, famiglia, fonte, evento, stato e diventa_in_sviluppo non possono essere vuoti.
Compila il campo mancante prima di aggiungere la riga."
    continue
  fi

  # --- Regola 5c - forma della data e dominio di evento/stato/famiglia. ---
  malformata=0
  if ! printf '%s' "$data" | grep -qE "$RE_DATA_ISO"; then
    segnala "Data non ISO alla riga $numero ($voce)" \
"«$data» non è nella forma AAAA-MM-GG. Correggi la data dell'evento."
    malformata=1
  fi
  if ! printf ' %s ' "$EVENTI_AMMESSI" | grep -qF " $evento "; then
    segnala "Evento non ammesso alla riga $numero ($voce)" \
"«$evento» non è fra i valori ammessi: $EVENTI_AMMESSI. Un evento diverso da questi due non
proietta uno stato riconoscibile."
    malformata=1
  fi
  if ! printf ' %s ' "$STATI_AMMESSI" | grep -qF " $stato "; then
    segnala "Stato non ammesso alla riga $numero ($voce)" \
"«$stato» non è fra i valori ammessi: $STATI_AMMESSI."
    malformata=1
  fi
  if ! printf ' %s ' "$FAMIGLIE_AMMESSE" | grep -qF " $famiglia "; then
    segnala "Famiglia non ammessa alla riga $numero ($voce)" \
"«$famiglia» non è fra A, B, C, D."
    malformata=1
  fi
  case "$voce" in
    "$famiglia"-*) : ;;
    *)
      segnala "Famiglia incoerente con la voce alla riga $numero ($voce)" \
"La colonna famiglia dichiara «$famiglia» ma la voce «$voce» non comincia per «$famiglia-»."
      malformata=1
      ;;
  esac

  # --- Regola 1 (parte «voce non riconosciuta») - accertata solo se il resto è leggibile. ---
  voce_nota=0
  for v in "${VOCI_CANONICHE[@]}"; do
    if [ "$v" = "$voce" ]; then voce_nota=1; break; fi
  done
  if [ "$voce_nota" -eq 0 ]; then
    segnala "Voce non riconosciuta alla riga $numero" \
"«$voce» non è fra le voci estratte da $RUNBOOK (titoli nella forma \"### A-1.\"). Se è una
voce nuova, aggiungi prima il titolo corrispondente nel runbook: questo controllo la vede da
solo, non serve toccare lo script. Se è un refuso nel registro, correggilo."
    malformata=1
  fi

  if [ "$malformata" -eq 1 ]; then continue; fi

  voce_presente["$voce"]=1
  if [ "$evento" = "registrata" ]; then
    conteggio_registrata["$voce"]=$(( ${conteggio_registrata["$voce"]:-0} + 1 ))
  fi

  # --- Regola 3 - non presidiata: data oppure motivazione «non-presidiabile», mai nessuna. ---
  if [ "$stato" = "esigibile-da-data" ]; then
    if [ -z "$bloccante_dal" ]; then
      segnala "Voce esigibile-da-data priva di bloccante_dal alla riga $numero ($voce)" \
"Stato «esigibile-da-data» richiede una data ISO in bloccante_dal, legata a un traguardo o a
un criterio esistente. Se nessuna data è legabile, marca la riga «non-presidiabile» e scrivi
il perché in motivazione: non si inventa una data plausibile."
    elif ! printf '%s' "$bloccante_dal" | grep -qE "$RE_DATA_ISO"; then
      segnala "bloccante_dal non è una data ISO alla riga $numero ($voce)" \
"«$bloccante_dal» non è nella forma AAAA-MM-GG."
    fi
  elif [ "$stato" = "non-presidiabile" ]; then
    if [ -n "$bloccante_dal" ]; then
      segnala "Voce non-presidiabile con bloccante_dal valorizzata alla riga $numero ($voce)" \
"Una voce «non-presidiabile» non ha una data di esigibilità: se ne ha una, è «esigibile-da-data»,
non «non-presidiabile». Svuota bloccante_dal o correggi lo stato."
    fi
    if [ -z "$motivazione" ]; then
      segnala "Voce non-presidiabile priva di motivazione alla riga $numero ($voce)" \
"Una riga «non-presidiabile» deve dichiarare il perché in motivazione: perché non è
automatizzabile in linea di principio, o perché nessuna data è oggi legabile a un traguardo
o a un criterio esistente. Una motivazione vuota è un'assenza, non una dichiarazione."
    fi
  fi

  # Motivazione obbligatoria per ogni riga che non sia presidiata (documentato nell'intestazione
  # del registro): una riga «esigibile-da-data» senza motivazione non spiega perché quella e non
  # un'altra è la data scelta.
  if [ "$stato" != "presidiata" ] && [ -z "$motivazione" ]; then
    segnala "Motivazione vuota alla riga $numero ($voce)" \
"Una riga il cui stato non è «presidiata» deve sempre dichiarare una motivazione."
  fi

  # --- Regola 2 - presidiata: controllo esistente ed eseguibile, casi di banco esistenti. ---
  if [ "$stato" = "presidiata" ]; then
    if [ -z "$controllo" ]; then
      segnala "Voce presidiata priva di controllo alla riga $numero ($voce)" \
"Stato «presidiata» richiede il percorso dello script che la presidia in controllo."
    else
      percorso_controllo="$RADICE_CONTROLLI/$controllo"
      if [ ! -f "$percorso_controllo" ]; then
        segnala "Controllo inesistente alla riga $numero ($voce)" \
"«$controllo» non esiste come file sotto $RADICE_CONTROLLI. Un controllo che nessuno ha visto
fallire non è un controllo, e un controllo che non esiste non è nemmeno quello: correggi il
percorso, oppure declassa la riga a «esigibile-da-data» o «non-presidiabile» finché lo script
non esiste davvero."
      elif [ ! -x "$percorso_controllo" ]; then
        segnala "Controllo non eseguibile alla riga $numero ($voce)" \
"«$controllo» esiste ma non ha il permesso di esecuzione (chmod +x mancante): il banco lo
invoca direttamente, come ogni altro controllo di questo repository."
      fi
    fi

    if [ -z "$caso_banco" ]; then
      segnala "Voce presidiata priva di caso_banco alla riga $numero ($voce)" \
"Stato «presidiata» richiede almeno un caso di $BANCO in caso_banco: un controllo che nessuno
ha visto fallire non è un controllo."
    else
      IFS='|' read -ra casi <<< "$caso_banco"
      for c in "${casi[@]}"; do
        c="$(printf '%s' "$c" | sed 's/^ *//; s/ *$//')"
        [ -z "$c" ] && continue
        if ! grep -qF "$c" "$BANCO"; then
          segnala "Caso di banco inesistente alla riga $numero ($voce)" \
"caso_banco cita «$c», che non compare in $BANCO. Scrivi il caso nel banco e verifica che
fallisca quando il controllo viene guastato, oppure correggi la citazione se il nome è
cambiato altrove."
        fi
      done
    fi
  fi

  righe_valide="$righe_valide$voce	$data	$stato	$bloccante_dal	$numero
"
done < "$REGISTRO_DIFETTI"

# --- Regola 1 - ogni voce canonica compare, e "registrata" non si ripete. ---

for v in "${VOCI_CANONICHE[@]}"; do
  if [ -z "${voce_presente["$v"]:-}" ]; then
    segnala "Voce del runbook assente dal registro" \
"«$v» non compare in nessuna riga di $REGISTRO_DIFETTI. Aggiungi una riga con evento
«registrata» che dichiari il suo stato di presidio."
    continue
  fi
  n_reg="${conteggio_registrata["$v"]:-0}"
  if [ "$n_reg" -eq 0 ]; then
    segnala "Voce priva dell'evento «registrata» alla prima comparsa" \
"«$v» compare nel registro solo con eventi «aggiornata», senza un evento «registrata» che
apra la sua storia. Aggiungi la riga «registrata» mancante, con la data della sua prima
comparsa nel registro."
  elif [ "$n_reg" -gt 1 ]; then
    segnala "Voce con l'evento «registrata» ripetuto" \
"«$v» compare $n_reg volte con evento «registrata». Una voce ha sempre esattamente un evento
«registrata»: le revisioni successive dello stato dichiarato sono eventi «aggiornata», non
una seconda «registrata»."
  fi
done

# --- Regola 4 - proiezione di stato: la data «esigibile-da-data» che è arrivata è un errore. ---
#
# Proiezione = ultimo evento per voce, in ordine di data e poi di comparizione fisica nel file
# (stessa proiezione di registro/README.md, «Come si calcola lo stato»): l'ordine fisico esiste
# per leggibilità (raggruppato per famiglia), non per cronologia.
if [ -n "$righe_valide" ]; then
  proiezione=$(printf '%s' "$righe_valide" | grep -v '^$' | LC_ALL=C sort -t "$(printf '\t')" -k1,1 -k2,2 -k5,5n)
  # Per POSIZIONE con «cut -f» e non con «IFS=$'\t' read -r a b c d e»: la casella
  # «bloccante_dal» e' vuota su ogni voce ancora bloccante, e due tabulazioni consecutive per bash
  # si fondono - «bloccante_dal» avrebbe letto il NUMERO DI RIGA e «riga» sarebbe rimasta vuota.
  # E' la voce C-1 del runbook, gia' trovata una volta in questo stesso script: la correzione di
  # allora aveva lasciato in piedi questa seconda occorrenza, che oggi non cade solo perche'
  # nessuna riga del registro ha quella casella vuota. Trovata il 27 agosto 2026 dal controllo
  # scripts/verifica-lettura-dei-tsv.sh, che esiste perche' una regola scritta e non presidiata
  # viene riviolata - dallo stesso repository che l'aveva scritta.
  while IFS= read -r _proiezione_riga || [ -n "$_proiezione_riga" ]; do
    [ -z "$_proiezione_riga" ] && continue
    voce=$(printf '%s' "$_proiezione_riga" | cut -f1)
    data=$(printf '%s' "$_proiezione_riga" | cut -f2)
    stato=$(printf '%s' "$_proiezione_riga" | cut -f3)
    bloccante_dal=$(printf '%s' "$_proiezione_riga" | cut -f4)
    riga=$(printf '%s' "$_proiezione_riga" | cut -f5)
    [ -z "$voce" ] && continue
    ultimo_stato["$voce"]="$stato"
    ultimo_bloccante["$voce"]="$bloccante_dal"
    ultimo_riga["$voce"]="$riga"
  done <<< "$proiezione"
fi

for v in "${VOCI_CANONICHE[@]}"; do
  st="${ultimo_stato["$v"]:-}"
  bd="${ultimo_bloccante["$v"]:-}"
  rg="${ultimo_riga["$v"]:-}"
  if [ "$st" = "esigibile-da-data" ] && [ -n "$bd" ] && printf '%s' "$bd" | grep -qE "$RE_DATA_ISO"; then
    if [ ! "$bd" \> "$OGGI" ]; then
      segnala "Data arrivata per una voce esigibile-da-data ($v, riga $rg)" \
"bloccante_dal era «$bd», oggi è «$OGGI»: la data è arrivata. Da oggi questa lacuna è un
errore di costruzione, non più una tolleranza. Scrivi il controllo che presidia «$v» e porta
la riga a «presidiata» con il controllo e almeno un caso di banco, oppure - se la voce non è
presidiabile - marcala «non-presidiabile» con la motivazione."
    fi
  fi
done

# --- Verdetto. ---

if [ "$esito" -eq 0 ]; then
  n_righe=$(( ${#VOCI_CANONICHE[@]} ))
  printf '\033[32m✓ %d voci del runbook, tutte presenti nel registro con uno stato conforme.\033[0m\n' "$n_righe"
else
  printf '\n\033[31m✗ Rilievi: %d\033[0m\n' "$rilievi"
fi

exit "$esito"
