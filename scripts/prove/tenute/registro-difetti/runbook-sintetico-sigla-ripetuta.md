# Runbook sintetico di collaudo, con una sigla ripetuta (nessun dato reale)

Usato solo dal banco di prova di scripts/verifica-registro-dei-difetti.sh (caso «registro-difetti:
una sigla ripetuta fra i titoli del runbook»). Riproduce cio' che e' successo il 27 agosto 2026:
chi aggiunge una voce legge la coda del file, vede dove finisce e continua a numerare da li',
riusando una sigla gia' in uso piu' su. Le due voci A-90 sono deliberatamente DIVERSE nel testo:
il difetto non e' un titolo copiato, e' una sigla riassegnata.

### A-90. Voce sintetica uno, presente anche nel registro di collaudo

Testo di collaudo, nessun dato reale.

### A-91. Voce sintetica due, presente anche nel registro di collaudo

Testo di collaudo, nessun dato reale.

### A-90. Voce sintetica aggiunta dopo, che riusa per errore la sigla della prima

Questa voce e' nuova e non e' registrata da nessuna parte, ma la sua sigla lo e': senza la regola
6 il controllo la vedrebbe gia' presente e gia' presidiata dal presidio della prima, che non la
riguarda. E' la copertura dichiarata e inesistente della voce D-6.
