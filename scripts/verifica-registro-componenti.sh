#!/usr/bin/env bash
# Controllo di costruzione - G2 e G5, distinta dei materiali (docs/01_technical/09 §3).
#
# Confronta il registro delle annotazioni di componenti di terze parti (pipeline/annotazioni-componenti.tsv)
# con la distinta dei materiali (SBOM, Software Bill of Materials) generata dalla catena di
# costruzione, e fallisce quando:
#   1. Un componente è presente nella distinta e assente dalle annotazioni (G5)
#   2. Un componente ha licenza segnata come «incompatibile» o «indeterminabile» (G2)
#
# La regola è dichiarata nel controllo G5 di docs/10_fondamenti/17 §9.2: «È il meccanismo che
# impedisce a una dipendenza di entrare senza essere stata valutata». Questo controllo automatizza
# quella dichiarazione.
#
# Perché il controllo esista significa che ogni dipendenza in produzione passa attraverso tre
# filtri:
#   1. Viene installata (dipendenza di package.json)
#   2. Viene generata nella distinta (artefatto CycloneDX)
#   3. Viene confrontata con le annotazioni versionato (questo controllo)
#
# Una dipendenza in distinta e non annotata è una valutazione saltata. Una valutazione saltata
# sulla licenza trasferisce il rischio legale a chi installa il sistema, che è precisamente ciò
# che una scelta di licenza come Apache-2.0 voleva evitare.
#
# COLLAUDABILITÀ. Il controllo accetta due variabili d'ambiente:
#   SBOM_FILE - percorso al file di distinta CycloneDX JSON (per difetto il generato dalla pipeline)
#   RADICE_SORGENTI - radice per la lettura del registro (per difetto la radice del repository)
#
# Senza queste, il controllo non sarebbe collaudabile su tenute statiche senza toccare gli
# artefatti reali della pipeline. È la stessa convenzione usata da scripts/verifica-dati-sintetici.sh.
#
set -euo pipefail

cd "$(dirname "$0")/.."

SBOM_FILE="${SBOM_FILE:-sbom-website.json}"
RADICE_SORGENTI="${RADICE_SORGENTI:-.}"
RADICE_SORGENTI="${RADICE_SORGENTI%/}"
[ -n "$RADICE_SORGENTI" ] || RADICE_SORGENTI="/"

REGISTRO="${RADICE_SORGENTI%/}/pipeline/annotazioni-componenti.tsv"

esito=0

segnala() {
  printf '\n\033[31m✗ %s\033[0m\n%s\n' "$1" "$2"
  esito=1
}

if [ ! -f "$REGISTRO" ]; then
  printf '\033[31m✗ Registro dei componenti inesistente: %s\033[0m\n' "$REGISTRO"
  printf 'Esegui il controllo dalla radice del repository, oppure indica RADICE_SORGENTI.\n'
  exit 2
fi

if [ ! -f "$SBOM_FILE" ]; then
  printf '\033[31m✗ Distinta dei materiali inesistente: %s\033[0m\n' "$SBOM_FILE"
  printf 'La distinta deve essere generata dalla pipeline prima di questo controllo.\n'
  printf 'Indica SBOM_FILE se la distinta si trova in una posizione diversa.\n'
  exit 2
fi

# --- 1. Lettura del registro. ---
#
# Stessa tecnica di verifica-collocazione-dei-controlli.sh: usa «cut» per estrarre i campi in
# base alla posizione, non «read», che fonde le tabulazioni consecutive.
#
campo() { printf '%s' "$1" | cut -f"$2"; }

# Carica il registro in tre array paralleli: chiave (nome@versione), licenza, compatibilità.
declare -A reg_licenza reg_compatibilita reg_motivo
intestazione=0

while IFS= read -r linea || [ -n "$linea" ]; do
  case "$linea" in ''|'#'*) continue;; esac

  if [ "$intestazione" -eq 0 ]; then
    componente_col=$(campo "$linea" 1)
    if [ "$componente_col" != "componente" ]; then
      printf '\033[31m✗ Intestazione attesa nel registro a %s\033[0m\n' "$REGISTRO"
      exit 1
    fi
    intestazione=1
    continue
  fi

  componente=$(campo "$linea" 1)
  versione=$(campo "$linea" 2)
  licenza=$(campo "$linea" 3)
  compatibilita=$(campo "$linea" 4)
  motivo=$(campo "$linea" 5)

  if [ -z "$componente" ] || [ -z "$versione" ]; then
    printf '\033[31m✗ Riga malformata nel registro: %s\033[0m\n' "$linea"
    exit 1
  fi

  chiave="${componente}@${versione}"
  reg_licenza["$chiave"]="$licenza"
  reg_compatibilita["$chiave"]="$compatibilita"
  reg_motivo["$chiave"]="$motivo"
done < "$REGISTRO"

# --- 2. Lettura della distinta (CycloneDX JSON). ---
#
# Estrae ogni componente con jq: nome, versione, licenza. Raccoglie in elenco temporaneo.
#
# DUE DIFETTI CORRETTI IL 26 AGOSTO 2026, e vale la pena dire quali perche' entrambi rendevano
# questo controllo incapace del proprio mestiere mentre appariva funzionante.
#
# 1. IL NOME ERA MUTILO. Si leggeva «.name» soltanto, ma CycloneDX scrive lo spazio dei nomi npm
#    in un campo separato: «@docusaurus/core» diventa group «@docusaurus» piu' name «core». Il
#    controllo cercava quindi «core@3.10.2» in un registro che dichiara «@docusaurus/core», e
#    nessuno dei 412 componenti con spazio dei nomi poteva combaciare. Peggio del non combaciare:
#    due componenti diversi collassavano sulla stessa chiave, perche' «@docusaurus/react» e
#    «react» si riducono entrambi a «react».
#
# 2. LA LICENZA NON SI LEGGEVA MAI. Si cercava «.license.name», ma il generatore reale scrive
#    «.license.id» per le licenze in forma SPDX e «.expression» per quelle composte («MIT OR
#    CC0-1.0»). Sulla distinta vera, TUTTI E 1236 i componenti si leggevano «NOLICENSE»: il
#    controllo sulle licenze non ne ha mai confrontata una.
#
# PERCHE' IL BANCO NON SE N'E' ACCORTO, ed e' la parte che insegna qualcosa. Le tenute di collaudo
# erano scritte nella forma che questo controllo si aspettava - «license.name», nessun group -
# invece che nella forma che il generatore produce. Il banco collaudava il controllo contro una
# finzione fatta a sua immagine, e passava. Una tenuta si modella sulla REALTA' che il controllo
# incontrera', mai sul codice del controllo.
#
if ! command -v jq &> /dev/null; then
  printf '\033[31m✗ jq non disponibile: necessario per leggere la distinta\033[0m\n'
  exit 2
fi

componenti_distinta=$(
  jq -r '.components[] | select(.type == "library" or .type == "application") |
          # Nome npm completo: group/name quando lo spazio dei nomi esiste, name quando manca.
          ((if .group then .group + "/" else "" end) + .name) as $nome |
          # La licenza nelle tre forme ammesse da CycloneDX, in ordine di specificita:
          # identificativo SPDX, espressione composta (MIT OR CC0-1.0), nome libero.
          ([.licenses[]? | (.license.id // .expression // .license.name)]
             | map(select(. != null)) | first // "NOLICENSE") as $lic |
          "\($nome) \(.version) \($lic)"' \
    "$SBOM_FILE" 2>/dev/null | sort -u
)

if [ -z "$componenti_distinta" ]; then
  printf '\033[33m· Nessun componente trovato nella distinta: %s\033[0m\n' "$SBOM_FILE"
  exit 0
fi

# --- 3. Confronto e verifica. ---
#
# Per ogni componente della distinta:
#   1. Controlla che sia annotato nel registro
#   2. Controlla che la licenza sia segnata come compatibile (non indeterminabile o incompatibile)
#
rilievi=0
indeterminati=0

while IFS=' ' read -r nome versione licenza_distinta; do
  chiave="${nome}@${versione}"

  # Il componente è annotato?
  if [ -z "${reg_licenza["$chiave"]:-}" ]; then
    segnala "Componente non annotato" \
"Componente: $nome
Versione: $versione
Riga: aggiungi una riga a pipeline/annotazioni-componenti.tsv con il componente dichiarato
nel registro.

Ragione (G5): È il meccanismo che impedisce a una dipendenza di entrare senza essere
stata valutata. Il controllo non accetta componenti anonimi."
    rilievi=$((rilievi+1))
    continue
  fi

  # La licenza è compatibile?
  # Il fallback ":-" non è pignoleria: sotto «set -u» un accesso a una chiave assente
  # termina lo script con un errore bash, che esce comunque diverso da zero e quindi
  # SOMIGLIA a un rilievo corretto. Un collaudo che asserisce sul solo codice di uscita
  # non distingue i due casi, e il controllo passerebbe fallendo per il motivo sbagliato.
  compatibilita="${reg_compatibilita["$chiave"]:-}"
  if [ -z "$compatibilita" ]; then
    segnala "Annotazione priva della compatibilità dichiarata" \
"Componente: $nome
Il componente è annotato ma la colonna della compatibilità è vuota. Una casella vuota
non è una dichiarazione: va scritta «compatibile», «indeterminabile» o «incompatibile»."
    rilievi=$((rilievi+1))
    continue
  fi
  # La licenza dichiarata nel registro deve essere QUELLA CHE IL COMPONENTE DICHIARA.
  #
  # Fino al 26 agosto 2026 questo confronto non esisteva: «licenza_distinta» veniva estratta dalla
  # distinta e poi buttata via, e il controllo si fidava della colonna «compatibilita» senza mai
  # guardare la licenza su cui quel giudizio poggia. Il registro poteva dichiarare «MIT,
  # compatibile» per un componente che spedisce GPL-3.0, e la costruzione passava. E' la falla
  # esatta che G2 esiste per chiudere - pipeline/README-COMPONENTI.md dichiara che la colonna
  # porta «la licenza dichiarata in package.json, non una valutazione, il valore letterale», e
  # niente lo faceva rispettare.
  #
  # NOLICENSE non e' un caso di divergenza ma di assenza: il componente non dichiara alcuna
  # licenza, e cio' che il registro deve dire in quel caso e' «indeterminabile», che la regola
  # successiva intercetta gia' da se'. Segnalarlo qui produrrebbe due rilievi per un difetto solo.
  if [ "$licenza_distinta" != "NOLICENSE" ] && [ "$licenza_distinta" != "${reg_licenza["$chiave"]}" ]; then
    segnala "Licenza dichiarata nel registro diversa da quella del componente" \
"Componente: $nome
Versione: $versione
Licenza nella distinta: $licenza_distinta
Licenza nel registro:   ${reg_licenza["$chiave"]}
Riga: $REGISTRO

Ragione (G2): la colonna «licenza_dichiarata» porta il valore LETTERALE che il componente
dichiara, non una valutazione. Se le due divergono, il giudizio di compatibilita' della riga
poggia su una licenza che il componente non ha - e il giudizio non vale piu'. Aggiorna la riga
con la licenza vera, poi rivedi la compatibilita': puo' essere cambiata insieme alla licenza."
    rilievi=$((rilievi+1))
    continue
  fi

  # «indeterminabile» SEGNALA, «incompatibile» BLOCCA. Sono due cose diverse e fino al 26 agosto
  # 2026 questo controllo le trattava allo stesso modo, contro cio' che pipeline/README-COMPONENTI.md
  # dichiara: «in questo caso il componente resta in segnalazione (non bloccante) finche' qualcuno
  # che ne ha l'autorita' non lo esamina». Era una divergenza fra il formato dichiarato e il
  # controllo che lo fa rispettare, ed e' il formato a vincere: e' la fonte.
  #
  # La distinzione ha una ragione, non e' una comodita'. «incompatibile» e' un giudizio ACCERTATO:
  # qualcuno ha guardato la licenza e ha concluso che i termini non si conciliano, quindi il
  # componente non puo' entrare e la costruzione deve fermarsi. «indeterminabile» e' l'assenza di
  # un giudizio: il componente non dichiara una licenza, o la dichiara in forma non standard, o
  # nessuno con l'autorita' per farlo l'ha ancora esaminata. Fermare la costruzione su un'assenza
  # di giudizio significa fermarla su qualcosa che chi la subisce non puo' risolvere - serve un
  # parere legale, non una modifica al codice - e un cancello che nessuno puo' aprire e' un
  # cancello che qualcuno finira' per aggirare.
  #
  # Ma un'indeterminatezza senza scadenza e' una rinuncia non dichiarata, esattamente come la sola
  # segnalazione senza data della regola 2 di pipeline/README.md. La data e' quindi obbligatoria,
  # ed e' la stessa per tutti perche' l'ancora e' un fatto e non una preferenza: T-10, il primo
  # rilascio installabile del 30 novembre 2026. Prima di quel giorno il progetto non distribuisce
  # nulla, e una licenza vincola quando si distribuisce; da quel giorno un'indeterminatezza
  # residua diventa un problema di chi installa, che e' precisamente cio' che G2 esiste per
  # impedire.
  INDETERMINABILE_ESIGIBILE_DAL="${INDETERMINABILE_ESIGIBILE_DAL:-2026-11-30}"
  oggi="${OGGI:-$(date +%F)}"

  if [ "$compatibilita" = "indeterminabile" ]; then
    if [ "$INDETERMINABILE_ESIGIBILE_DAL" \> "$oggi" ]; then
      printf '\033[33m· Compatibilita indeterminabile (segnalazione fino al %s): %s@%s, licenza «%s»\033[0m\n' \
        "$INDETERMINABILE_ESIGIBILE_DAL" "$nome" "$versione" "$licenza_distinta"
      indeterminati=$((indeterminati+1))
      continue
    fi
    segnala "Compatibilita ancora indeterminabile, e la data e' arrivata" \
"Componente: $nome
Versione: $versione
Licenza: $licenza_distinta
Riga: $REGISTRO

Dal $INDETERMINABILE_ESIGIBILE_DAL l'indeterminatezza non e' piu' tollerata: e' la data di T-10,
il primo rilascio installabile. Prima di quel giorno il progetto non distribuisce nulla e una
licenza vincola quando si distribuisce; da quel giorno un'indeterminatezza residua diventa un
problema di chi installa. Serve un esame da parte di chi ne ha l'autorita', che concluda
«compatibile» o «incompatibile»: questa casella non si chiude scrivendo una delle due senza
averlo fatto."
    rilievi=$((rilievi+1))
    continue
  fi

  if [ "$compatibilita" != "compatibile" ]; then
    segnala "Licenza non compatibile o indeterminabile" \
"Componente: $nome
Versione: $versione
Licenza dichiarata: ${reg_licenza["$chiave"]}
Compatibilità dichiarata: $compatibilita
Riga: $REGISTRO

Ragione (G2): Una licenza incompatibile trasferisce il problema all'integratore, che è ciò
che la scelta di licenza Apache-2.0 voleva evitare. Una licenza indeterminabile impedisce
al progetto di dichiarare la compatibilità.

Soluzione: sostituisci il componente con uno che dichiari licenza compatibile (MIT, ISC,
BSD-3-Clause, Apache-2.0), oppure apri una valutazione legale formale se il componente è
indispensabile. Non è una decisione da configurazione: è una valutazione legale."
    rilievi=$((rilievi+1))
    continue
  fi
done <<< "$componenti_distinta"

# --- 4. Verdetto finale. ---
n_componenti=$(printf '%s\n' "$componenti_distinta" | wc -l)

if [ "$esito" -eq 0 ]; then
if [ "$indeterminati" -gt 0 ]; then
  printf '\033[32m✓ %d componente/i nella distinta, tutti annotati; %d con compatibilita indeterminabile,\033[0m\n' "$n_componenti" "$indeterminati"
  printf '\033[33m  in sola segnalazione fino al %s, data di T-10 (primo rilascio installabile): da quel giorno bloccano.\033[0m\n' "${INDETERMINABILE_ESIGIBILE_DAL:-2026-11-30}"
else
  printf '\033[32m✓ %d componente/i nella distinta, tutti annotati e con licenza compatibile.\033[0m\n' "$n_componenti"
fi
else
  printf '\n\033[31m✗ Rilievi: %d\033[0m\n' "$rilievi"
fi

exit "$esito"
