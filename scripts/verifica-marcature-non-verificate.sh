#!/usr/bin/env bash
# Ogni marcatura «non verificato» dichiara a chi va chiesta la verifica.
#
# PERCHE' ESISTE. Nove dei tredici indici di area dichiarano la STESSA regola, ciascuno con parole
# proprie: una marcatura di non verificato porta l'indicazione di a chi va chiesta la verifica.
# «Non si inventa», dice l'area di sicurezza; «indica sempre a chi va chiesta la verifica e che
# cosa cambia se la risposta e' diversa», dice l'area di dominio. La regola non e' stata inventata
# qui: e' stata LETTA nel corpus, ed era gia' unanime. Mancava solo il presidio, ed e' la voce
# D-18 del runbook - una regola non presidiata da un controllo non e' una regola.
#
# E' anche il criterio 3 di T-02, che chiede due cose: zero marcature prive di destinatario, e un
# RAPPORTO PUBBLICATO delle occorrenze ammesse. Questo script produce entrambe: il rapporto a ogni
# esecuzione, e il conteggio delle prive di destinatario.
#
# IN SOLA MISURA FINO AL 2026-10-10, POI BLOCCANTE. Alla prima esecuzione, il 27 agosto 2026, le
# marcature prive di destinatario riconoscibile sono 366 su 503. Portarlo bloccante subito
# significherebbe un cancello rosso a ogni invio, e un cancello sempre rosso smette di essere
# letto - e' la questione Q-288, gia' registrata. La data non e' arbitraria: e' il termine del
# criterio 3 di T-02, quindi anche il termine entro cui quelle 366 vanno chiuse. La disciplina che
# impone la data e' il criterio 4 di T-03: un controllo in sola segnalazione senza una data
# dichiarata non e' ammesso, perche' e' il modo in cui una riduzione temporanea diventa permanente.
#
# CIO' CHE NON PUO' VERIFICARE, e va detto invece di lasciarlo intendere. Il destinatario si
# riconosce per FORMA - una sigla d'area, un rinvio a una questione aperta, una formula esplicita,
# il nome di un ente - non per senso, e l'unita' di analisi e' il CAPOVERSO. Da qui due errori di
# segno opposto, ed e' importante che siano dichiarati entrambi:
#
#   IN ECCESSO. Un capoverso che dica «la misura spetta a chi installera' il sistema» esprime un
#   destinatario che il controllo non riconosce, e viene contato fra le mancanze. Parte del numero
#   si chiude rendendo esplicito cio' che il testo gia' dice a parole.
#
#   IN DIFETTO. Il predicato scatta se un destinatario compare IN QUALUNQUE PUNTO del capoverso,
#   anche quando riguarda un'altra affermazione: un capoverso con una marcatura su un dato e la
#   menzione di un ente su un altro argomento e' contato come dotato di destinatario. Se un
#   capoverso porta due marcature e il testo indica il destinatario per una sola, entrambe sono
#   contate come coperte.
#
# LA PRIMA STESURA DI QUESTO COMMENTO DICHIARAVA che il numero e' «una soglia superiore delle
# mancanze». E' FALSO, e la revisione del 27 agosto 2026 lo ha dimostrato con due tenute: il
# controllo puo' anche SOTTOSTIMARE. Il numero e' una stima con errore nei due versi, e va usato
# per misurare l'ordine di grandezza del lavoro residuo, mai per dichiarare un criterio chiuso.
# Legare ciascun destinatario alla singola marcatura richiederebbe di capire il testo, non di
# leggerlo: non e' presidiabile da uno script, ed e' registrato come tale invece di essere
# promesso.
#
# Uscita: 0 in sola misura (sempre), 1 quando bloccante e con rilievi, 2 errore d'uso.
set -uo pipefail

cd "$(dirname "$0")/.."

# IL PERIMETRO ACCETTA PIU' RADICI, e non ne accettava. Il 28 agosto 2026 i nove artefatti
# preparatori di T-04 sono nati sotto verifiche/ e ne sono restati fuori: non per una decisione
# di perimetro, ma per l'assenza di una decisione, che e' peggio perche' non si vede. Ogni
# cartella nuova nasceva fuori dalla sorveglianza per il solo fatto di essere nuova.
RADICE_CORPUS="${RADICE_CORPUS:-docs verifiche}"
BLOCCANTE_DAL="${BLOCCANTE_DAL:-2026-10-10}"
RAPPORTO="${RAPPORTO:-}"

radici_mancanti=""
for r in $RADICE_CORPUS; do [ -d "$r" ] || radici_mancanti="$radici_mancanti $r"; done
if [ -n "$radici_mancanti" ]; then
  printf 'Errore d'\''uso: radice/i del corpus inesistente/i:%s\n' "$radici_mancanti" >&2
  printf 'Percorso configurabile con RADICE_CORPUS.\n' >&2
  exit 2
fi

VERDE=$'\033[32m'; ROSSO=$'\033[31m'; GIALLO=$'\033[33m'; FINE_COLORE=$'\033[0m'

misura=$(gawk '
  BEGIN {
    AREE = "ARCH|COMP|SEC|TECH|INTEG|GUIDA|ROAD|FUNZ|DOM|ORCH|PROTO|OVER|AVV"
    # LE FORME SI SONO LETTE NEL CORPUS, NON DEDOTTE. Misurate il 27 agosto 2026 contando le
    # occorrenze: «spetta a» 30, «richiesta a» 37, «da chiedere a» 29, «a cura di» 20, «va
    # confermato da» 19, «va richiesto a» 19. Le prime quattro NON erano riconosciute, e le
    # marcature che le usavano risultavano prive di destinatario pur avendone uno leggibile.
    #
    # UNA DISTINZIONE CHE VA TENUTA, e che ha fatto scartare la famiglia piu'\'' numerosa. «Va
    # verificato» compare 36 volte ed e'\'' la forma piu'\'' frequente del corpus, MA NON NOMINA
    # NESSUNO: dice che cosa fare, non a chi tocca. Aggiungerla avrebbe alzato il conteggio delle
    # marcature «con destinatario» di oltre settanta unita'\'' senza che una sola di esse dichiari
    # chi deve chiudere la lacuna. Si riconoscono soltanto le forme che reggono un complemento di
    # destinazione: «va verificato PRESSO», «va confermato DA», «va richiesto A».
    # L'\'\''INIZIALE E'\'\'' INDIFFERENTE, e non lo era. La prima stesura misuro'\'\'' le formule con grep
    # in minuscolo e scrisse l'\'\''espressione su quella forma: ogni formula scritta a INIZIO DI PERIODO
    # o a inizio di CELLA DI TABELLA restava invisibile. Ventisei occorrenze reali, misurate il 27
    # agosto 2026 - «Da chiedere a» 19, «Va richiesto a» 4, «Spetta a» 3 - e fra queste le tre
    # marcature che l'\'\''area di sicurezza e la guida ai fondamenti indirizzavano esplicitamente
    # all'\'\''agenzia SPID, ad AGENAS e all'\'\''area tecnica del fascicolo. Il difetto non e'\'\'' di
    # disattenzione: chi scrive il controllo costruisce l'\'\''espressione sulla stessa forma su cui ha
    # misurato, e la misura in minuscolo non poteva mostrargli le maiuscole.
    # Si rende indifferente SOLO l'\'\''iniziale, mai l'\'\''intera espressione: IGNORECASE farebbe
    # riconoscere `comp` come se fosse la sigla d'\'\''area `COMP`, e una sigla d'\'\''area e'\'\'' maiuscola
    # per convenzione dichiarata.
    # «DESTINATARIO» NUDO NON E'\'''\'' UN DESTINATARIO. Era l'\'''\''unica alternativa di DEST priva di
    # qualunque struttura sintattica - nessuna preposizione, nessun verbo, nessun apice inverso - e
    # in questo dominio «destinatario» e'\'''\'' parola d'\'''\''uso corrente per tutt'\'''\''altro: destinatario di un
    # flusso, di un documento clinico, di un messaggio, della disciplina. Una revisione indipendente
    # del 27 agosto 2026 ha riprodotto due capoversi REALI in cui una marcatura senza alcun
    # responsabile passava per conforme perche'\'''\'' la parola compariva nello stesso capoverso per un
    # motivo estraneo - fra questi uno che dice «vanno verificate sul testo consolidato», cioe'\'''\''
    # esattamente la famiglia che questo script dichiara di scartare. Ora si riconosce solo l'\'''\''uso
    # da ETICHETTA: la parola seguita dai due punti, oppure intestazione di colonna fra barre.
    DEST = "`(" AREE ")`|Q-[0-9]+|[Pp]resso chi|[Cc]hi deve chiuderla|[Cc]hi decide" \
           "|[Dd]estinatari[oa]?:|\\| *\\**[Dd]estinatari[oa]? *\\**[ ]*\\|" \
           "|[Vv]a(nno)? chiest[oaie] a|[Vv]a(nno)? richiest[oaie] a|[Vv]a(nno)? confermat[oaie] da" \
           "|[Vv]a(nno)? verificat[oaie] presso|[Dd]a chiedere a|[Rr]ichiesta a|[Ii]nterlocuzione con" \
           "|[Ss]petta(no)? a|[Aa] cura d[ei]|[Cc]ompet(e|ono) a|[Dd]eve chiuder|[Dd]eve (colmarl|risolverl)" \
           "|Ministero|AgID|organismo notificato|Garante|garante|Commissione"
    # UNA MARCATURA NOMINATA NON E'\'' UNA MARCATURA. «Chiude il [NV] che quest'\''area portava» parla
    # DI una marcatura, non ne pone una: chiedergli un destinatario e'\'' chiedere a chi vada
    # attribuita una frase che racconta. Sono otto occorrenze su cinquecento, misurate il 27
    # agosto 2026, e non e'\'' la loro quantita'\'' a renderle importanti: e'\'' che NON POTRANNO MAI
    # ricevere un destinatario, quindi resterebbero rilievi per sempre e il criterio 3 di T-02
    # non potrebbe chiudersi nemmeno con il corpus interamente bonificato.
    # La distinzione e'\'' di forma e non di senso, ed e'\'' quindi presidiabile: una marcatura POSTA
    # non e'\'' mai preceduta da un articolo o da una preposizione articolata. «il [NV]» racconta,
    # «[NV] - la soglia non e'\'' stata misurata» pone.
    MENZIONE = "(^|[^[:alnum:]])((il|lo|la|i|gli|le|un|uno|una|del|dello|della|dei|degli|delle" \
               "|nel|nello|nella|nei|negli|nelle|quel|quei|questo|questi|ogni|due|tre" \
               "|the|a|an|each|every|those|these)[ ]+" \
               "|(marcator[ei]|marcatur[ae])[ ]+`?" \
               "|(marcat[oaie]|marcand[oa]l[oaie]|marcare|segnat[oaie])[ ]+`?" \
               "|(l|un|dell|nell|quell|all|dall)'\''[ ]*)`?\\[NV\\]"
    # LA FORMA DEFINITORIA E'\'''\'' L'\'''\''ALTRA META'\'''\'' DELLA STESSA DISTINZIONE. «`[NV]` segnala
    # un'\'''\''informazione non verificata» non pone una marcatura: la DEFINISCE, ed e'\'''\'' il modo in cui
    # tredici indici di area e il glossario dichiarano la convenzione. Come la marcatura nominata,
    # non potra'\'''\'' MAI ricevere un destinatario. Si riconosce per forma, non per senso: il marcatore
    # seguito da un verbo di definizione, oppure solo nella prima cella di una riga di tabella, che
    # e'\'''\'' la forma della voce di glossario. Una marcatura POSTA non e'\'''\'' mai il soggetto di «segnala».
    DEFINIZIONE = "`?\\[NV\\]`?\\**[ ]+(segnala|marca|indica|significa|denota)" \
                  "|^[ ]*\\|[ ]*\\**`?\\[NV\\]`?\\**[ ]*\\|"
  }
  # L'\''UNITA'\'' DI ANALISI E'\'' IL CAPOVERSO, non la riga: in markdown un capoverso occupa piu'\'' righe,
  # e il destinatario di una marcatura sta spesso nella riga successiva a quella che la porta.
  # Misurato il 27 agosto 2026: contando per riga le marcature con destinatario risultavano 52,
  # contando per capoverso 137. La differenza non e'\'' un dettaglio di implementazione: e'\'' la
  # differenza fra accusare il corpus di 451 mancanze e di 366.
  # Una riga di tabella fa eccezione e vale da sola, perche'\'' una tabella e'\'' un capoverso unico
  # solo per il markdown, mai per chi la legge.
  FNR == 1 {
    if (accumulo != "") valuta(accumulo, file_corrente, riga_capoverso)
    accumulo = ""
    file_corrente = FILENAME
    area_corrente = FILENAME; sub(/^[^\/]*\//, "", area_corrente); sub(/\/.*$/, "", area_corrente)
  }
  {
    if ($0 ~ /^[[:space:]]*\|/) {            # riga di tabella: unita'\'' a se'\'' stante
      if (accumulo != "") { valuta(accumulo, file_corrente, riga_capoverso); accumulo = "" }
      valuta($0, FILENAME, FNR)
      next
    }
    # UNA RIGA CHE SEPARA PER CHI LEGGE SEPARA ANCHE QUI. Una riga fatta del solo «>» divide due
    # paragrafi dentro la stessa citazione, e una riga di recinto apre o chiude un blocco di codice:
    # entrambe sono confini evidenti a occhio e nessuna delle due e'\'''\'' «riga vuota» per l'\'''\''espressione
    # di sopra, perche'\'''\'' contengono un carattere. Senza questa regola il destinatario dichiarato nel
    # primo paragrafo di una citazione copre una marcatura scoperta nel secondo. Trovato in revisione
    # indipendente il 27 agosto 2026 con una riproduzione minima; zero vittime nel corpus di oggi,
    # ma otto file hanno la struttura che lo rende possibile.
    if ($0 ~ /^[[:space:]]*>[[:space:]]*$/ || $0 ~ /^[[:space:]]*(```|~~~)/) {
      if (accumulo != "") { valuta(accumulo, file_corrente, riga_capoverso); accumulo = "" }
      next
    }
    if ($0 ~ /^[[:space:]]*$/) {             # riga vuota: chiude il capoverso
      if (accumulo != "") { valuta(accumulo, file_corrente, riga_capoverso); accumulo = "" }
      next
    }
    if (accumulo == "") riga_capoverso = FNR
    accumulo = accumulo " " $0
  }
  END {
    if (accumulo != "") valuta(accumulo, file_corrente, riga_capoverso)
    for (a in con) printf "CON\t%s\t%d\n", a, con[a]
    for (a in senza) printf "AREA\t%s\t%d\n", a, senza[a]
    printf "TOTALI\t%d\t%d\n", totale_con + 0, totale_senza + 0
  }
  function valuta(testo, dove, numero,   n, area, copia, menzioni) {
    n = gsub(/\[NV\]/, "[NV]", testo)
    if (n == 0) return
    copia = testo
    menzioni = gsub(MENZIONE, "", copia) + gsub(DEFINIZIONE, "", copia)
    n = n - menzioni
    if (n <= 0) return
    area = dove; sub(/^[^\/]*\//, "", area); sub(/\/.*$/, "", area)
    if (testo ~ DEST) { con[area] += n; totale_con += n }
    else {
      senza[area] += n; totale_senza += n
      printf "SENZA\t%s\t%d\t%s\n", dove, numero, substr(testo, 1, 150)
    }
  }
' $(find $RADICE_CORPUS -type f -name '*.md' | sort))

con=$(printf '%s\n' "$misura" | gawk -F'\t' '$1=="TOTALI"{print $2}')
senza=$(printf '%s\n' "$misura" | gawk -F'\t' '$1=="TOTALI"{print $3}')

printf '== Rapporto sulle marcature «non verificato» - criterio 3 di T-02 ==\n\n'
printf 'Con destinatario riconoscibile: %s\n' "$con"
printf 'Prive di destinatario:          %s\n\n' "$senza"
printf 'Prive di destinatario, per area:\n'
printf '%s\n' "$misura" | gawk -F'\t' '$1=="AREA"{printf "  %-18s %s\n", $2, $3}' | sort -k2 -rn

if [ -n "$RAPPORTO" ]; then
  printf '%s\n' "$misura" | gawk -F'\t' '$1=="SENZA"{printf "%s:%s\t%s\n", $2, $3, $4}' > "$RAPPORTO"
  printf '\nElenco puntuale scritto in %s\n' "$RAPPORTO"
fi

oggi=$(date -u +%Y-%m-%d)
if [ "$oggi" \< "$BLOCCANTE_DAL" ]; then
  printf '\n%sIn sola misura fino al %s, poi bloccante. Criterio 3 di T-02.%s\n' \
    "$GIALLO" "$BLOCCANTE_DAL" "$FINE_COLORE"
  exit 0
fi

if [ "$senza" -gt 0 ]; then
  printf '\n%s✗ %s marcature «non verificato» prive di destinatario dichiarato.%s\n' "$ROSSO" "$senza" "$FINE_COLORE" >&2
  printf '%sNove indici di area dichiarano la stessa regola: una marcatura di non verificato porta%s\n' "$ROSSO" "$FINE_COLORE" >&2
  printf '%sl'\''indicazione di a chi va chiesta la verifica. «Non si inventa».%s\n' "$ROSSO" "$FINE_COLORE" >&2
  exit 1
fi

printf '\n%s✓ Ogni marcatura «non verificato» dichiara a chi va chiesta la verifica.%s\n' "$VERDE" "$FINE_COLORE"
exit 0
