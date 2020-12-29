#!/bin/bash

if [[ "$#" -ne "1" ]]; then
        echo "Неверное ко-во аргументов"
        exit 1
fi

fileName="$PWD/$1"

for r in $(cat "$HOME/.trash.log")
do
    filei=$(echo "$r" | awk -F '</>' '{ print $1 }')
    fileId=$(echo "$r" | awk -F '</>' '{ print $2 }')
    if [[ "$fileName" == "$filei" ]]; then
            removeFile="$HOME/.trash/$fileId"
            if [[ -e "$removeFile" ]]; then
                    echo "Востановить файл: $filei? (1/0)"
                    read ans -r
                    if [[ "$ans" == "1" ]]; then
                        if [[ -z "$(find ~ -name "$(dirname "$filei")" 2>/dev/null)" ]]; then
                                    if [[ -e "$filei" ]]; then
                                            echo "Файл с таким именем уже существует"
                                            echo "Введите новое имя файла:"
                                            read newName -r
                                            ln "$removeFile" "$(dirname "$filei")/$newName"
                                    else
                                            ln "$removeFile" "$filei"
                                    fi
                            else
                                    echo "Нет такой директории: $(dirname "$filei")"
                                    ln "$removeFile" ~/"$1"
                            fi
                            rm "$removeFile"
                            grep -v "$fileId" "$HOME/.trash.log" > "/tmp/.untrash"
                            mv "/tmp/.untrash" "$HOME/.trash.log"
                    fi
            fi
    fi
done
