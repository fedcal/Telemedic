#!/usr/bin/env bash
# Ogni rinvio con àncora deve trovare, nel documento bersaglio, un titolo che genera
# quell'àncora. Vale su entrambe le lingue e separatamente: un'àncora si ricava dal
# titolo, quindi tradurre un titolo cambia l'àncora, e un rinvio non aggiornato punta
# a un ancoraggio che nella pagina tradotta non esiste piu'.
#
# Perche' questo controllo esiste. La costruzione del sito segnala le ancore rotte, ma
# esce con successo lo stesso: le tre politiche onBroken* sono a «warn». Un avviso che
# non ferma nulla non e' un controllo. Inoltre la costruzione impiega minuti e questo
# controllo impiega meno di un secondo, quindi puo' stare nella fascia rapida.
#
# L'algoritmo dell'ancora e' quello di github-slugger, che Docusaurus usa: minuscolo, si
# rimuove ogni carattere che non sia lettera, numero, segno diacritico, underscore,
# trattino o spazio, e gli spazi diventano trattini.
#
# La conseguenza che ha gia' prodotto difetti due volte: un titolo che separa un codice
# dal suo testo con un carattere isolato fra due spazi produce PIU' trattini consecutivi,
# non uno. Con la convenzione in vigore, il trattino corto, un titolo come
# «CTX-01 - Identity and access» diventa «ctx-01---identity-and-access», con TRE trattini:
# il primo spazio, il trattino stesso, il secondo spazio. Prima della conversione del
# 26 agosto 2026 il separatore era un trattino lungo, che l'algoritmo rimuove e ne lascia
# quindi DUE. In entrambi i casi chi scrive l'ancora a mano ne mette uno solo e sbaglia, e
# la costruzione lo segnala uscendo con successo perche' onBrokenAnchors e' a «warn».
# Un avviso che non ferma nulla non e' un controllo: da qui questo script.
set -u
RADICE_SORGENTI="${RADICE_SORGENTI:-.}"
python3 - "$RADICE_SORGENTI" <<'PY'
import re, os, sys, unicodedata
radice = sys.argv[1]
alberi = [
    (os.path.join(radice, 'docs'), 'italiano'),
    (os.path.join(radice, 'website/i18n/en/docusaurus-plugin-content-docs/current'), 'inglese'),
]
def ancora(titolo):
    t = titolo.strip().lower()
    tenuti = []
    for ch in t:
        cat = unicodedata.category(ch)
        if cat[0] in ('L', 'N', 'M') or cat == 'Pc' or ch in '- ':
            tenuti.append(ch)
    return ''.join(tenuti).replace(' ', '-')

cache = {}
def ancore_del_documento(percorso):
    if percorso not in cache:
        trovate = set()
        if os.path.exists(percorso):
            with open(percorso, encoding='utf-8') as fh:
                for riga in fh:
                    if riga.startswith('#'):
                        trovate.add(ancora(riga.lstrip('#')))
        cache[percorso] = trovate
    return cache[percorso]

# Tre forme di rinvio, e per due volte il controllo ne ha vista una sola:
#   ../area/file.md#ancora   relativo che risale
#   ./file.md#ancora         relativo esplicito
#   file.md#ancora           relativo NUDO, senza il punto: e' quello che sfuggiva
#   /area/file.md#ancora     assoluto dalla radice della documentazione, forma
#                            introdotta il 26 agosto 2026 perche' Docusaurus non
#                            risolve i rinvii relativi nei documenti tradotti
rinvio = re.compile(r'\]\(([^)#\s]*\.md)#([^)]+)\)')
rotte = esaminati = 0
for albero, lingua in alberi:
    if not os.path.isdir(albero):
        print(f"\033[33m· albero assente, saltato: {albero}\033[0m")
        continue
    for cartella, _, file in os.walk(albero):
        for nome in sorted(file):
            if not nome.endswith('.md'):
                continue
            percorso = os.path.join(cartella, nome)
            with open(percorso, encoding='utf-8') as fh:
                for numero, riga in enumerate(fh, 1):
                    for relativo, anc in rinvio.findall(riga):
                        esaminati += 1
                        if relativo.startswith('/'):
                            # assoluto: la base e' la radice dell'albero, non la cartella del file
                            bersaglio = os.path.normpath(os.path.join(albero, relativo.lstrip('/')))
                        else:
                            bersaglio = os.path.normpath(os.path.join(cartella, relativo))
                        if not os.path.exists(bersaglio):
                            print(f"\033[31m✗ {lingua}: {os.path.relpath(percorso, albero)}:{numero} - "
                                  f"il documento bersaglio non esiste: {relativo}\033[0m")
                            rotte += 1
                            continue
                        disponibili = ancore_del_documento(bersaglio)
                        if anc not in disponibili:
                            # Si collassa OGNI sequenza di trattini, non un livello solo:
                            # con la convenzione del trattino corto un separatore fra due
                            # spazi ne produce tre, e un «.replace(--,-)» a passata unica
                            # riconosce il caso a due e manca proprio quello piu' comune.
                            def collassa(a):
                                return re.sub(r'-+', '-', a)
                            vicino = [a for a in disponibili if collassa(a) == collassa(anc)]
                            suggerimento = f" - forse «{vicino[0]}»" if vicino else ""
                            print(f"\033[31m✗ {lingua}: {os.path.relpath(percorso, albero)}:{numero} - "
                                  f"nessun titolo genera l'ancora «{anc}» in {os.path.basename(bersaglio)}{suggerimento}\033[0m")
                            rotte += 1

print(f"\nRinvii con ancora esaminati: {esaminati} · Rotti: {rotte}")
if rotte:
    print("""
Che cosa fare. Un'ancora non si corregge a mente: si ricava dal titolo del documento
BERSAGLIO, nella lingua di quel documento. Elenca i titoli con «grep -n '^#' <file>»,
trova quello giusto, e ricalcola. Se il titolo non esiste piu', il rinvio va rifatto o
tolto: non si inventa un'ancora, perche' un'ancora inventata la costruzione non la vede.""")
    sys.exit(1)
print("\033[32m✓ Ogni rinvio con ancora trova il titolo che la genera.\033[0m")
PY
