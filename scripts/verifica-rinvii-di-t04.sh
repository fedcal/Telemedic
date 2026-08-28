#!/usr/bin/env bash
# I tre divieti che sopravvivono ai rinvii del criterio 5 di T-04 sono rispettati dal corpus.
#
# PERCHE' ESISTE. Il criterio 5 di T-04 registra tre verifiche rinviate e, per ciascuna, il divieto
# che sopravvive al rinvio. I testi stanno in verifiche/P9-rinvii-e-regole-in-vigore.md; la loro
# esistenza e' meta' del criterio. L'altra meta' e' testuale: «una verifica sul corpus pubblicato
# non trova alcuna descrizione del meccanismo di inoltro del contesto di autenticazione, alcuna
# dichiarazione di formato unico di contenitore, alcun requisito funzionale che dipenda da garanzie
# del broker». E' un CONTROLLO DI ASSENZA, ed e' l'unico modo in cui un divieto si dimostra: non
# esiste una prova positiva del fatto che qualcosa non sia stato scritto.
#
# PERCHE' UN ELENCO DI AMMISSIONE E NON UN'ESPRESSIONE PIU' STRETTA. Il divieto riguarda il SENSO,
# e nessuna espressione regolare distingue un capoverso che DESCRIVE il meccanismo da uno che
# dichiara di non volerlo descrivere: le due frasi condividono le stesse parole, e la seconda e'
# esattamente il testo del divieto nella fonte del traguardo. Un controllo con la sola espressione
# sarebbe rosso sul divieto stesso, e un controllo sempre rosso smette di essere letto - questione
# Q-288, gia' registrata. L'espressione resta quindi LARGA, e ogni occorrenza esistente e' stata
# letta una volta e ammessa con la ragione scritta in pipeline/rinvii-t04-occorrenze-ammesse.tsv.
# Una occorrenza NUOVA fa fallire il controllo finche' qualcuno non l'ha guardata.
#
# CIO' CHE NON PUO' VERIFICARE, e va detto invece di lasciarlo intendere. Tre cose, in ordine di
# gravita' crescente.
#
#   PRIMA. Che chi aggiunge una riga di ammissione abbia guardato BENE. Il presidio accerta che
#   qualcuno abbia guardato: e' un cambio di natura del rischio, da omissione a decisione
#   sbagliata, ed e' il massimo ottenibile da uno script su un divieto di senso.
#
#   SECONDA. Il capoverso che LASCIA INTENDERE il meccanismo senza nominarlo. Un controllo testuale
#   riconosce una forma, non un senso: intercetta la frase che descrive, non quella che allude.
#
#   TERZA, ed e' quella che conta. IL TERZO DIVIETO E' IL MENO PRESIDIATO DEI TRE. «Nessun
#   requisito funzionale dipende da garanzie del broker non verificate» si viola per OMISSIONE:
#   basta che un requisito dia per scontata una consegna esattamente-una-volta, o un ordinamento, o
#   una persistenza del messaggio, e la dipendenza esiste senza che la parola «broker» compaia mai.
#   Questo controllo non la vede, e non puo' vederla. La parte scoperta resta a chi rivede, ed e'
#   dichiarata a ogni esecuzione invece di essere taciuta.
#
# BLOCCANTE DA SUBITO, e la ragione e' la stessa del presidio della bacheca: la proprieta' era gia'
# vera quando il controllo e' nato - quindici occorrenze, nessuna che descriva un meccanismo,
# misurate il 28 agosto 2026 - e un presidio che arriva dopo la disciplina non ha debito da
# scadenzare. Un controllo verde che regredisce va fermato nel commit che lo fa regredire.
#
# Uscita: 0 conforme, 1 violazione, 2 errore d'uso.
set -uo pipefail

cd "$(dirname "$0")/.."

RADICE_IT="${RADICE_IT:-docs}"
RADICE_EN="${RADICE_EN:-website/i18n/en/docusaurus-plugin-content-docs/current}"
AMMESSE="${AMMESSE:-pipeline/rinvii-t04-occorrenze-ammesse.tsv}"
TESTI_RINVII="${TESTI_RINVII:-verifiche/P9-rinvii-e-regole-in-vigore.md}"

VERDE=$'\033[32m'; ROSSO=$'\033[31m'; GIALLO=$'\033[33m'; FINE_COLORE=$'\033[0m'

errore_uso() {
  printf '%sErrore d'\''uso: %s%s\n' "$ROSSO" "$1" "$FINE_COLORE" >&2
  [ -n "${2:-}" ] && printf '%s\n' "$2" >&2
  exit 2
}

[ -d "$RADICE_IT" ] || errore_uso "la radice italiana «$RADICE_IT» non esiste." "Configurabile con RADICE_IT."
[ -r "$AMMESSE" ] || errore_uso \
  "l'\''elenco delle occorrenze ammesse «$AMMESSE» non esiste o non e'\'' leggibile." \
  "Senza di esso il controllo direbbe che ogni menzione e'\'' una violazione, compresa quella del divieto stesso."
[ -r "$TESTI_RINVII" ] || errore_uso \
  "i testi dei rinvii «$TESTI_RINVII» non esistono." \
  "La PRIMA meta'\'' del criterio 5 e'\'' che i testi siano versionati: senza di essi non c'\''e'\'' nulla da presidiare."

# LE ESPRESSIONI SONO LARGHE DI PROPOSITO: si veda il commento in testa. Sono qui e non in un file
# di configurazione perche' sono la DEFINIZIONE di che cosa il controllo guarda, non una politica
# che qualcuno possa voler cambiare senza cambiare il controllo; cio' che e' configurabile - le
# occorrenze ammesse - vive fuori. Ogni iniziale e' resa indifferente: e' la voce D-33 del runbook,
# una formula a inizio di periodo o di cella di tabella porta la maiuscola.
ESPRESSIONI="inoltro:[Ii]noltr[oa][^.]{0,60}contesto di autenticazione|contesto di autenticazione[^.]{0,60}[Ii]noltr|[Ff]orward[^.]{0,60}authentication context|authentication context[^.]{0,60}[Ff]orward
contenitore:[Ff]ormato unico di contenitore|[Uu]nico formato di contenitore|[Ss]ingle container format
broker:[Gg]aranzi[ae] del broker|[Bb]roker guarantees"

temporanea=$(mktemp -d) || errore_uso "impossibile creare la cartella temporanea."
trap 'rm -rf "$temporanea"' EXIT

# L'elenco ammesso si legge con cut -f e non con «IFS=TAB read»: la tabulazione appartiene agli
# spazi di IFS, quindi read ne collassa le occorrenze consecutive e i campi vuoti spariscono
# spostando a sinistra quelli che seguono. E' la voce C-1 del runbook, ripagata il 28 agosto 2026
# su un altro controllo scritto lo stesso giorno.
grep -v '^#' "$AMMESSE" | grep -v '^divieto	' | grep -v '^$' > "$temporanea/ammesse.tsv"
[ -s "$temporanea/ammesse.tsv" ] || errore_uso \
  "nessuna riga di ammissione riconosciuta in «$AMMESSE»." \
  "Un elenco vuoto renderebbe violazione ogni menzione, compresa quella del divieto stesso: e'\'' errore di configurazione."

while IFS= read -r r; do
  d=$(printf '%s' "$r" | cut -f1)
  p=$(printf '%s' "$r" | cut -f2)
  m=$(printf '%s' "$r" | cut -f3)
  [ -n "$m" ] || { printf '%sErrore d'\''uso: ammissione senza motivo per %s (%s).%s\n' "$ROSSO" "$p" "$d" "$FINE_COLORE" >&2
                   printf 'Chi rivede deve poter dissentire, e per dissentire deve sapere che cosa si e'\'' pensato.\n' >&2
                   exit 2; }
  printf '%s\t%s\n' "$d" "$p" >> "$temporanea/coppie-ammesse"
done < "$temporanea/ammesse.tsv"

radici="$RADICE_IT"
[ -d "$RADICE_EN" ] && radici="$radici $RADICE_EN"

rilievi=0
totale=0
ammesse_viste=0

while IFS= read -r voce; do
  divieto="${voce%%:*}"
  espressione="${voce#*:}"
  while IFS= read -r trovata; do
    [ -n "$trovata" ] || continue
    percorso="${trovata%%:*}"
    totale=$((totale + 1))
    if grep -qxF "$divieto	$percorso" "$temporanea/coppie-ammesse"; then
      ammesse_viste=$((ammesse_viste + 1))
      continue
    fi
    printf '%s✗ occorrenza non ammessa del divieto «%s»: %s%s\n' "$ROSSO" "$divieto" "$trovata" "$FINE_COLORE" >&2
    rilievi=$((rilievi + 1))
  done < <(grep -rEIn "$espressione" $radici --include='*.md' 2>/dev/null || true)
done < <(printf '%s\n' "$ESPRESSIONI")

printf '== Divieti che sopravvivono ai rinvii - criterio 5 di T-04 ==\n\n'
printf 'Occorrenze intercettate: %s\n' "$totale"
printf 'Ammesse con motivo:      %s\n' "$ammesse_viste"
printf 'Non ammesse:             %s\n\n' "$rilievi"

printf '%sPresidio PARZIALE, dichiarato. Il terzo divieto - nessun requisito funzionale dipende da%s\n' "$GIALLO" "$FINE_COLORE"
printf '%sgaranzie del broker non verificate - si viola per OMISSIONE: basta che un requisito dia per%s\n' "$GIALLO" "$FINE_COLORE"
printf '%sscontata una consegna esattamente-una-volta, un ordinamento o una persistenza del messaggio,%s\n' "$GIALLO" "$FINE_COLORE"
printf '%se la dipendenza esiste senza che la parola «broker» compaia mai. Questo controllo non la vede.%s\n\n' "$GIALLO" "$FINE_COLORE"

if [ "$rilievi" -gt 0 ]; then
  printf '%s✗ %d occorrenza/e non ammessa/e dei divieti del criterio 5 di T-04.%s\n' "$ROSSO" "$rilievi" "$FINE_COLORE" >&2
  printf 'Se l'\''occorrenza NON descrive il meccanismo, aggiungi una riga a %s con la ragione.\n' "$AMMESSE" >&2
  printf 'Se lo descrive, toglila: il divieto resta in vigore finche'\'' la verifica non e'\'' registrata.\n' >&2
  exit 1
fi

printf '%s✓ Nessuna occorrenza non ammessa. I testi dei rinvii sono in %s.%s\n' "$VERDE" "$TESTI_RINVII" "$FINE_COLORE"
exit 0
