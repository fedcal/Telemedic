# Differenziazione del controllo di divergenza fra italiano e inglese

Questo documento dichiara il formato di `differenziazione-traduzioni.tsv`, letto dal controllo
`scripts/verifica-divergenza-traduzioni.sh` per implementare il criterio 3 di `T-03`
(`docs/01_technical/09-integrazione-continua-e-rilascio.md` §3): il controllo di divergenza «ha
un comportamento differenziato e dichiarato... blocca sulle aree prerequisito - avvertenze
pubbliche, guida dei fondamenti, conformità, sicurezza - e segnala sul resto del corpus... La
differenziazione è versionata in un file di configurazione, non cablata».

## Perché esiste questo file

Fino al 27 agosto 2026 la differenziazione viveva in quattro variabili bash dentro
`scripts/verifica-divergenza-traduzioni.sh`: `AREE_ESIGITE` (calcolata con un glob su `docs/`),
`AVVERTENZE_PUBBLICHE`, `DICHIARAZIONI_PUBBLICHE_RADICE` e le rispettive date di bloccanza.
Modificare la differenziazione significava modificare il controllo - esattamente ciò che il
criterio 3 vieta - e chi voleva sapere quali aree fossero esigite doveva leggere lo script riga
per riga, o fidarsi di un commento che poteva essere invecchiato.

C'era anche una trappola già pagata: `AREE_ESIGITE` era resa dinamica con un glob
(`docs/[0-9]*/`) letto con `basename`, e sotto `set -e` un glob che non trova nulla - il caso
delle sandbox del banco di prova, che non hanno aree numerate - faceva uscire l'intero script,
facendo cadere nove casi del banco per una ragione estranea alla divergenza. Leggere i dati da un
file statico, invece di calcolarli con un glob a ogni esecuzione, chiude quella classe di difetto
per costruzione: un file con zero righe di un dato tipo produce semplicemente zero voci, mai un
errore di shell.

## Che cosa NON è questo file

Non contiene alcuna copia di riserva nello script (voce `D-10` del runbook degli errori): se il
file manca o non è leggibile, `scripts/verifica-divergenza-traduzioni.sh` non decide da solo che
cosa sorvegliare e non prosegue con valori cablati - esce `2`, la convenzione di questo
repository per «il controllo non può nemmeno partire» (la stessa di
`scripts/verifica-terminologie.sh` con `LISTA` e di `scripts/verifica-registro-componenti.sh` con
il registro inesistente).

## Formato

Valori separati da tabulazione. Le righe che cominciano con `#` sono commenti. La prima riga non
commentata è l'intestazione e dichiara le cinque colonne.

| Colonna | Contenuto |
|---|---|
| `tipo` | `area` (una cartella numerata sotto `docs/`, o `adr`), `avvertenza_pubblica` (uno degli otto documenti bilingui alla radice, il sottoinsieme che porta anche il controllo di contenuto su marcatura CE e dichiarazione di conformità) oppure `dichiarazione_pubblica_radice` (gli altri cinque documenti bilingui di `D51`) |
| `valore` | per `area`: il nome della cartella sotto `docs/`. Per le altre due righe: il nome del file alla radice del repository |
| `stato` | per `area`: `esigita` (un originale senza traduzione fa fallire il controllo) o `pianificata` (l'assenza si annota, non blocca). Per le altre due righe: `bloccante` (un rilievo su questo documento fa fallire il controllo) o `segnalazione` (il rilievo si stampa, non blocca) |
| `bloccante_dal` | data ISO `AAAA-MM-GG`. Vuota quando lo stato è già nella forma forte (`esigita` o `bloccante`). **Obbligatoria quando lo stato è `segnalazione`** per le righe di avvertenza o dichiarazione, con la stessa regola già in uso in `pipeline/collocazione-dei-controlli.tsv` (una riduzione temporanea senza data di scadenza non è temporanea, è una rinuncia non dichiarata). Le righe di `area` non la usano: non esiste un meccanismo di promozione automatica legato a una data, solo la decisione `esigita`/`pianificata` scritta qui |
| `motivo` | perché quella riga ha quello stato, con la fonte |

## Le tre categorie di riga, e con quale forza ciascuna colpisce il controllo

- **`area`** - alimenta `AREE_ESIGITE`: un originale in un'area `esigita` senza traduzione fa
  fallire il controllo (contatore «Assenti ed esigiti»). Un'area `pianificata` produce solo una
  riga informativa gialla.
- **`avvertenza_pubblica`** - alimenta `AVVERTENZE_PUBBLICHE`: ciascun documento porta sia il
  controllo strutturale (il blocco inglese esiste, l'ancora del rimando «English version below»
  risolve) sia il controllo di contenuto (menzione di marcatura CE e di dichiarazione di
  conformità nel blocco inglese). Un rilievo su una riga `bloccante` fa fallire il controllo; su
  una riga `segnalazione` si stampa soltanto, con la data in cui diventerà bloccante.
- **`dichiarazione_pubblica_radice`** - alimenta `DICHIARAZIONI_PUBBLICHE_RADICE`: solo il
  controllo strutturale, mai quello di contenuto (nessuno dei cinque documenti di `D51` diverso
  dalle tre avvertenze pubbliche parla di marcatura CE per propria natura - verificato leggendoli
  il 26 agosto 2026, sola eccezione redazionale `GOVERNANCE.md`, che non generalizza il
  controllo). Stessa distinzione bloccante/segnalazione delle avvertenze pubbliche.

## Lo stato di oggi, e perché

**Le tredici aree sono tutte `esigita` dal 27 agosto 2026.** Fino al giorno prima erano
prerequisiti non negoziabili solo tre aree più i registri di decisione (decisione `D56`); la
misura sul corpus quel giorno mostra lo specchio inglese completo - dodici aree numerate su
dodici con lo stesso numero di file dell'italiano, 32 ADR su 32, 905.997 parole inglesi contro
890.136 italiane, nessun file inglese sotto il 60% delle parole del proprio gemello (soglia 200
parole) - e il criterio di completamento di `T-09` («il traguardo è chiuso quando nessuna area è
più in sola segnalazione») è soddisfatto.

**Le tre avvertenze pubbliche e le altre cinque dichiarazioni di `D51` sono tutte `bloccante` dal
27 agosto 2026**, anticipate dalla scadenza letterale del criterio 8 di `T-01` (12 settembre
2026) su decisione del committente. L'anticipo è stato verificato eseguendo
`scripts/verifica-divergenza-traduzioni.sh` sul repository reale sia prima sia dopo il cambio di
stato: zero rilievi in entrambi i casi, per tutti gli otto documenti. Vedi i commenti nel file dei
dati per la fonte di ciascuna data e per la tensione, dichiarata e non smussata, fra il testo
letterale del criterio 8 (che nomina per nome solo tre file) e `docs/09_roadmap/00-indice.md` §4
(che lega l'intero elenco di `D51` alla stessa data, unica fonte scritta per gli altri cinque).

## Come si aggiunge o si promuove una riga

1. **Nuova area**: aggiungi una riga `area` con `stato=pianificata` finché la traduzione non è
   completa, poi cambiala in `esigita` quando lo è - non prima, e non «per intenzione».
2. **Nuova avvertenza o dichiarazione**: aggiungi la riga con `stato=segnalazione` e una
   `bloccante_dal` reale, legata a un criterio o a una fonte scritta come impone la sezione
   precedente - mai una data plausibile senza fonte.
3. **Promozione a bloccante**: cambia `stato`, svuota `bloccante_dal`, e **prima** verifica
   eseguendo il controllo sul repository reale che il passaggio non introduca un rilievo nuovo:
   promuovere una riga che oggi fallisce trasforma silenziosamente un debito in un blocco della
   costruzione per tutti.

## Nessuna copia di riserva nello script

`scripts/verifica-divergenza-traduzioni.sh` usa questa tabella come **unica** fonte della
differenziazione. Il percorso è sovrascrivibile con la variabile d'ambiente
`DIFFERENZIAZIONE_TRADUZIONI`, con la stessa disciplina già in uso per `LISTA`
(`scripts/verifica-terminologie.sh`) e `TABELLA` (`scripts/verifica-collocazione-dei-controlli.sh`):
esiste per il collaudo, mai come sorgente alternativa in esercizio (voce `D-17` del runbook). Se
il file non è raggiungibile - assente o illeggibile - il controllo fallisce con uscita `2` e lo
dichiara ad alta voce su standard error, invece di girare a vuoto o di passare in silenzio.
