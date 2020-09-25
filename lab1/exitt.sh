#!/bin/bash

exitt() {
if ! [[ -z "$1" ]]; then
	echo "Programm ended up with exit code $1"
	exit $1
else
	echo "Program ended up with exit code 0"
	exit 0
fi
}

interactive_exit() {
echo "Enter exit code"
while :
do
read exit_code
int_check $exit_code && break
echo "Exit code must be a number"
done
exitt "$exit_code"
}
