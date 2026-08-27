#!/usr/bin/env bash
# Tenuta - imposta IFS su una riga e legge sulla successiva: peggio della forma vietata, perche'
# IFS resta impostato per il resto dello script.
set -uo pipefail
IFS=$'\t'
while read -r primo secondo terzo; do
  printf '%s %s %s\n' "$primo" "$secondo" "$terzo"
done < "$1"
