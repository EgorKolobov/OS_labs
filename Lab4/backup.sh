#!/bin/bash

if [ $# != 0 ]; then
	echo "Неверное кол-во аргументов. Здесь их не нужно вообще."
	exit 1
fi

newBackup="false"

prefix="Backup-"
backupDirectory="$HOME/"
sourceDirectory="$HOME/source/"
now=$(date "+%F")

backupReport=~/backup-report
lastBackupDirectory=$(ls "$backupDirectory" -1 | grep -E "Backup-[0-9]{4}-[0-9]{2}-[0-9]{2}" | sort -r -k2 | head -1)

lastBackupDate=$(date --date=$(echo $lastBackupDirectory | sed "s/^Backup-//") "+%s")
let dateDiff=("$(date --date=$now "+%s")"\-"lastBackupDate")/60/60/24

if [[ -d "$lastBackupDirectory" && "$dateDiff" -le 7 ]]; then
        currBackupDirectory="$backupDirectory$lastBackupDirectory/"
else
        echo "Новая директория: ($backupDirectory$prefix$now)"
        mkdir "$backupDirectory$prefix$now"
        currBackupDirectory="$backupDirectory$prefix$now/"
        newBackup="true"
fi

if [[newBackup == "false" ]]; then
        echo "Обновление бэкапа в $currBackupDirectory. Дата: $now" >> "$backupReport"
        for file in $(ls ~/source); do
                if [[ -d "$file" ]]; then
                        echo "Пропускаем: $file"
                        continue
                fi

                current="$HOME/$lastBackupDirectory/$(basename '$file')"
                if [[ -f "$current" ]]; then
                        sizeBefore=$(stat "$file" -c%s)
                        sizeafter=$(stat "$current" -c%s)
                        if [[ "$sizebefore" != "$sizeafter" ]]; then
                                mv "$current" "$current.$now"
                                cp "$file" "$current"
                                echo "Файл $file изменён на: $current.$now" >> "$backupReport"
                        fi
                else
                        cp "$file" "$current"
                        echo "Скопирован файл: $file" >> "$backupReport"
                fi
        done
else
    echo "Бэкап создан $now в директории $sourceDirectory Файлов скопированна :" >> "$backupReport"
    for file in $(ls ~/source); do
            cp "$sourceDirectory$file" "$currBackupDirectory$file"
            echo "$file" >> "$backupReport"
    done
fi
