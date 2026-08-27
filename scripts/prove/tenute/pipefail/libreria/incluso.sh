#!/usr/bin/env bash
# Libreria: non eseguibile, inclusa con «source». Le sue catene girano con le impostazioni del
# chiamante, e imporle un «set» proprio altererebbe l'ambiente di chi la include.
elenca() { printf 'a\nb\n' | sort; }
