#!/usr/bin/env bash
# Tenuta di prova - viola la regola C-1: legge con «read» e il campo vuoto fa scalare le colonne.
while IFS=$'\t' read -r primo secondo terzo; do
  printf '%s %s %s\n' "$primo" "$secondo" "$terzo"
done < "$1"
