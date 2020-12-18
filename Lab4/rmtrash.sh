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

trashPath=~/.trash
trashlog=~/.trash.log

echo "$PWD"
if [[ ! -d $trash ]]; then
	mkdir $trash
    echo "Создана директория trash"
fi

if [[ ! -f $trashlog ]]; then
    echo "Создан trash.log"
	touch $trashlog
fi

if [[ ! -d "$trashPath" ]]; then
    currentId="0"
        mkdir "$trashPath"
        echo "$currentId" > "$trashPath/.last_id"
else
        currentId=$(cat $trashPath/.last_id)
        let currentId=$currentId+1
        echo "$currentId" > "$trashPath/.last_id"
fi

ln "$PWD/$fileName" "$trashPath/$currentId"
echo "$PWD/$fileName</>$currentId" >> "$HOME/.trash.log"
rm "$PWD/$fileName"
