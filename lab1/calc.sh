#!/bin/bash

calc() {
if [[ $# -ne 3 ]]; then
number_exception
fi
case $1 in
"sum") echo "$2 + $3 = $(($2 + $3))";;
"sub") echo "$2 - $3 = $(($2 - $3))";;
"div") if [[ "$3" -eq 0 ]]; then
	user_exception "Division by zero."
	else
	echo "$2 / $3 = $(($2 / $3))"
	fi;;
"mul") echo "$2 * $3 = $(($2 * $3))";;
*) user_exception "Unknown calc command.";;
esac
}

interactive_calc() {
echo "Enter calc arguments."
read arg1
while :
do
	read arg2
	int_check $arg2 && break
	echo "arg2 is not int!"
done

while :
do
	read arg3
	int_check $arg3 && break
	echo "arg3 is not int!"
done
calc "$arg1" "$arg2" "$arg3"
}
