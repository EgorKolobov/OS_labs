#!/bin/bash

last_backup=~/Backup-$(ls ~ | grep -e "backup-" | sort -n -r | head -1 | sed "s/backup-//")

if [ ! -z $last_backup_date ]; then
    if [[ -z "$(find ~ -name "restore" 2>/dev/null)" ]]; then
        echo "Создаётся каталог: restore"
        mkdir ~/restore
    fi

    for f in $(ls $last_backup | grep -E -v "[0-9]{4}-[0-9]{2}-[0-9]{2}"); do
        cp $last_backup/$f ~restore/$f
    done
fi
