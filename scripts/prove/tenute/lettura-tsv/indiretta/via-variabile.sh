#!/usr/bin/env bash
# Tenuta - la tabulazione arriva a IFS attraverso una variabile.
set -uo pipefail
TAB=$'\t'
while IFS="$TAB" read -r primo secondo terzo; do
  printf '%s %s %s\n' "$primo" "$secondo" "$terzo"
done < "$1"
