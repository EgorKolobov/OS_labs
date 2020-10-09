#!/bin/bash

exitt() {
	[[ $# -eq 0 ]] && exit 0
	[[ $# -eq 1 ]] &&  verify_int $1 && exit $1
	[[ $# -eq 1 ]] && datatype_exception "Argument $1 is not int!"
}

interactive_exit() {
while : 
do
	echo "Enter exit code"
	read exit_code
	verify_int $exit_code && break
done
echo "Programm ended up with exit code $exit_code."
exit $exit_cod
}
