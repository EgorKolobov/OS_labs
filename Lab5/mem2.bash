#!/bin/bash

array=()
sequence=(0 1 2 3 4 5 6 7 8 9)
counter=0
echo "" > report2.log

while :
do
	array+=(${sequence[*]})
	let counter++
	if [[ $counter == 100000 ]]; then
			counter=0
			echo ${#array[*]} >> report2.log
	fi
done
