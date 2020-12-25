#!/bin/bash

while :
do
	read line

	if [[ "$line" == "QUIT" ]]; then
		exit 1
		echo "QUIT" > my_pipe
	fi

	if [[ "$line" != "+" && "$line" != "*" && ! "$line" =~ [0-9]+ ]]; then
		echo "QUIT" > my_pipe
		exit 1
	fi

    echo "$line" > my_pipe
done
