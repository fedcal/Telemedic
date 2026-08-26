# Runbook sintetico di collaudo (nessun dato reale)

Usato solo dal banco di prova di scripts/verifica-registro-dei-difetti.sh (caso «registro-difetti:
runbook di collaudo con una voce che il registro di collaudo non ha», D-10). Contiene tre voci;
il registro di collaudo abbinato (registro-valido.tsv) ne registra solo due, cosi' la terza
prova che il controllo legge questo file e non un elenco interno.

### A-90. Voce sintetica uno, presente anche nel registro di collaudo

Testo di collaudo, nessun dato reale.

### A-91. Voce sintetica due, presente anche nel registro di collaudo

Testo di collaudo, nessun dato reale.

### A-92. Voce sintetica tre, assente dal registro di collaudo

Questa e' la voce che il registro di collaudo non ha: il controllo deve accorgersene leggendo
questo file, non un elenco scritto dentro lo script.
