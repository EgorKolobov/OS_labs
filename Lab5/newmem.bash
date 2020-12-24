#!/bin/bash

array=()
sequence=(0 1 2 3 4 5 6 7 8 9)
array_size=0

while :
do
	array+=(${sequence[*]})
	array_size=${#array[*]}
	if [[ $array_size -gt $1 ]]; then
		break
	fi
done
