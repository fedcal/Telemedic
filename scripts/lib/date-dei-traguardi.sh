#!/usr/bin/env bash
# Libreria - estrazione delle date dei traguardi dal capitolo docs/09_roadmap/02-traguardi.md.
#
# NON E' UN CONTROLLO e non va eseguita da sola: e' sorgente («source») per gli script che devono
# leggere le date dei traguardi. Esiste perche' due controlli distinti hanno bisogno della stessa
# lettura - scripts/verifica-coerenza-delle-date.sh, che confronta fra loro le tre rappresentazioni
# della stessa data, e scripts/verifica-registro-di-velocity.sh, che confronta la scheda con il
# registro degli eventi - e una seconda copia della stessa espressione regolare divergerebbe dalla
# prima al primo cambiamento di formato. Le due copie che divergono sono la voce D-28 del runbook
# degli errori, ed e' proprio l'errore che questi due controlli presidiano: sarebbe singolare
# commetterlo scrivendoli.
#
# La funzione «estrai» produce righe «T-NN<TAB>origine<TAB>valore», dove origine e' scheda, gantt o
# tabella, e il valore e' una data AAAA-MM-GG oppure il marcatore «non-calendariale».

estrai() {
  # Produce righe «T-NN<TAB>origine<TAB>valore», dove origine e'\'' scheda|gantt|tabella e il
  # valore e'\'' una data AAAA-MM-GG oppure il marcatore «non-calendariale».
  gawk '
    BEGIN {
      FS = "\n"
      split("gennaio febbraio marzo aprile maggio giugno luglio agosto settembre ottobre novembre dicembre", it, " ")
      for (i = 1; i <= 12; i++) mese[it[i]] = sprintf("%02d", i)
      split("January February March April May June July August September October November December", en, " ")
      for (i = 1; i <= 12; i++) mese[en[i]] = sprintf("%02d", i)
      split("set ott nov dic gen feb mar apr mag giu lug ago", x, " ")
      abbr["gen"]="01"; abbr["feb"]="02"; abbr["mar"]="03"; abbr["apr"]="04"
      abbr["mag"]="05"; abbr["giu"]="06"; abbr["lug"]="07"; abbr["ago"]="08"
      abbr["set"]="09"; abbr["ott"]="10"; abbr["nov"]="11"; abbr["dic"]="12"
      abbr["Jan"]="01"; abbr["Feb"]="02"; abbr["Mar"]="03"; abbr["Apr"]="04"
      abbr["May"]="05"; abbr["Jun"]="06"; abbr["Jul"]="07"; abbr["Aug"]="08"
      abbr["Sep"]="09"; abbr["Oct"]="10"; abbr["Nov"]="11"; abbr["Dec"]="12"
      atteso = ""
    }

    # 1. La scheda: un titolo «### `T-NN`» e, nella riga seguente, la data in grassetto.
    /^### `T-[0-9]+`/ {
      match($0, /T-[0-9]+/); atteso = substr($0, RSTART, RLENGTH); next
    }
    atteso != "" && /^\*Class/ {
      valore = "non-calendariale"
      # I nomi di mese si accettano per esteso E abbreviati, con o senza punto: la scheda e la
      # tabella di sintesi usano forme diverse dello stesso mese, e riconoscerne una sola
      # significherebbe saltare in silenzio ogni scheda scritta nell'\''altra. Trovato in revisione
      # il 27 agosto 2026: una scheda «1 ago. 2026» contro un diagramma che finiva il 1 settembre
      # produceva «coerenti», perche'\'' la scheda finiva fra i saltati.
      if (match($0, /[0-9]{1,2} [A-Za-z]+\.? 20[0-9]{2}/)) {
        campo = substr($0, RSTART, RLENGTH)
        split(campo, p, " ")
        sigla = p[2]; sub(/\.$/, "", sigla)
        if (sigla in mese) valore = sprintf("%s-%s-%02d", p[3], mese[sigla], p[1])
        else if (sigla in abbr) valore = sprintf("%s-%s-%02d", p[3], abbr[sigla], p[1])
        else valore = "illeggibile"
      }
      # NON si segnala una riga che contiene solo un anno: «2027» e «2027, in parallelo allo
      # sviluppo» sono date non di calendario legittime, e T-09 e T-12 le usano. Si segnala solo
      # una data che ha la FORMA di una data completa - giorno, mese, anno - e il cui mese non e'\''
      # riconosciuto: quella non e'\'' una data non di calendario, e'\'' una data che il controllo non
      # ha saputo leggere, ed e'\'' una cosa diversa. La prima stesura di questa regola segnalava
      # anche gli anni nudi e produceva quattro rilievi falsi sul repository reale: e'\'' la voce
      # D-25 del runbook - una regola dedotta e non misurata sul set reale e'\'' un'\''ipotesi.
      printf "%s\tscheda\t%s\n", atteso, valore
      atteso = ""; next
    }

    # 2. Il diagramma: «tNN, AAAA-MM-GG, AAAA-MM-GG» - conta la seconda, che e'\'' la fine.
    /:[[:space:]]*(crit, )?t[0-9]+, 20[0-9]{2}-[0-9]{2}-[0-9]{2}, 20[0-9]{2}-[0-9]{2}-[0-9]{2}/ {
      match($0, /t[0-9]+,/); sigla = substr($0, RSTART + 1, RLENGTH - 2)
      n = split($0, campi, ", ")
      fine = campi[n]; sub(/[^0-9-].*$/, "", fine)
      printf "T-%s\tgantt\t%s\n", sigla, fine
    }

    # 3. La tabella di sintesi: la quinta colonna di una riga che comincia con «| `T-NN` |».
    /^\| `T-[0-9]+` \|/ {
      match($0, /T-[0-9]+/); sigla = substr($0, RSTART, RLENGTH)
      split($0, col, "|")
      campo = col[6]
      gsub(/\*/, "", campo); gsub(/^[ \t]+|[ \t]+$/, "", campo)
      valore = "non-calendariale"
      if (match(campo, /[0-9]{1,2} [A-Za-z]+\.? 20[0-9]{2}/)) {
        estratto = substr(campo, RSTART, RLENGTH)
        split(estratto, p, " ")
        sigla_mese = p[2]; sub(/\.$/, "", sigla_mese)
        if (sigla_mese in abbr) valore = sprintf("%s-%s-%02d", p[3], abbr[sigla_mese], p[1])
        else if (sigla_mese in mese) valore = sprintf("%s-%s-%02d", p[3], mese[sigla_mese], p[1])
      }
      printf "%s\ttabella\t%s\n", sigla, valore
    }
  ' "$1"
}

