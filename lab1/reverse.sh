#!/bin/bash

reverse() {
if ! [[ -r $1 ]]; then
	user_exception "Can't open file to read."
elif ! [[ -f $1 ]]; then
	user_exception "Start-file doesn't exist."
elif ! [[ -f $2 ]]; then
	user_exception "Destination-file doesn't exist."
elif ! [[ -w $2 ]]; then
	user_exception "Can't open file to write."
elif ! [[ $# -ne 2 ]]; then
	number_exception
else
	tac $1>$2
fi
}

interactive_reverse() {
echo "Enter start-file name."
read file1
echo "Enter destenation-file name."
read file2
reverse "$file1" "$file2"
}
