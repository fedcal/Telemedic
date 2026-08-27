#!/usr/bin/env bash
# Tenuta di prova - NOMINA la forma vietata dentro un commento per spiegarla, e non la usa.
# NON scrivere «IFS=$'\t' read -r a b c»: per bash la tabulazione e' un carattere di IFS bianco.
while IFS= read -r riga || [ -n "$riga" ]; do
  printf '%s\n' "$(printf '%s' "$riga" | cut -f2)"
done < "$1"
