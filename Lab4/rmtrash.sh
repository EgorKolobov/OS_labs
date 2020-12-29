#!/bin/bash

fileName="$1"

if [[ "$#" -ne 1 ]]; then
        echo "Можно передавать только один параметр: имя файла"
        exit 1
fi

if [[ ! -f "$PWD/$fileName" ]]; then
        echo "Нет файла с таким именем в текущей директории."
        exit 1
fi

if [[ -z "$(find ~ -name "trash" 2>/dev/null)" ]]; then
    echo "Создаётся каталог: trash"
    mkdir ~/trash
fi

if [[ -z "$(find ~ -type f -name "trash.log" 2>/dev/null)" ]]; then
    echo "Создаётся файл: trash.log"
    echo "">~/trash.log
fi

currentId="0"
if [[ ! -z "$(ls -A ~/trash)" ]]; then
    currentId=$(ls $HOME/trash | sort -V | tail -n 1)
    let currentId=$currentId+1
fi

ln "$PWD/$fileName" "$HOME/trash/$currentId"

echo "Name: $PWD/$fileName ; Link: $currentId">>"$HOME/trash.log"

rm "$PWD/$fileName"
