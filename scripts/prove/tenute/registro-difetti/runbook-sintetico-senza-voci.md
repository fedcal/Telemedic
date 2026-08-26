# Runbook sintetico senza voci (nessun dato reale)

Usato solo dal banco di prova di scripts/verifica-registro-dei-difetti.sh, per il caso «runbook
presente e leggibile ma privo di titoli nella forma attesa dall'estrattore»: l'estrazione trova
zero voci, e il controllo deve uscire 2 - errore di configurazione, non insieme vuoto a
costruzione riuscita.

Questo file contiene prosa e titoli, ma nessuno nella forma «### A-1.» che
`grep -oE '^### [A-D]-[0-9]+(bis)?'` riconosce: solo titoli di livello due, e un titolo di
livello tre con una forma diversa da quella attesa.

## Un titolo di livello due, non riconosciuto per costruzione

Testo di collaudo, nessun dato reale.

### Un titolo di livello tre ma senza famiglia e numero nella forma attesa

Ancora testo di collaudo, nessun dato reale: questo titolo non comincia con «### A-», «### B-»,
«### C-» o «### D-» seguito da un numero, quindi l'estrattore non lo vede.
