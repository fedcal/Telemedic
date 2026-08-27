#!/usr/bin/env bash
# Tenuta di prova - legge un file separato da tabulazioni per POSIZIONE, come la regola impone.
while IFS= read -r riga || [ -n "$riga" ]; do
  primo=$(printf '%s' "$riga" | cut -f1)
  terzo=$(printf '%s' "$riga" | cut -f3)
  printf '%s %s\n' "$primo" "$terzo"
done < "$1"
