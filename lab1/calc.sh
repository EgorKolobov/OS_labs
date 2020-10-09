#!/bin/bash

calc() {
! verify_int $2 && user_exception "Second argument is not an int!"
! verify_int $3 && user_exception "Third argument is not an int!"
case $1 in
	"sum") echo "$(( $2 + $3 ))";;
	"sub") echo "$(( $2 - $3 ))";;
	"div") if [[ "$3" -eq 0 ]]; then
		user_exception "Division by zero."
		else
		echo "$(( $2 / $3 ))"
		fi;;
	"mul") echo "$(( $2 * $3 ))";;
	*) user_exception "Unknown calc command.";;
esac
}

interactive_calc() {
while :
do
	echo "Choose operation (sub, sum, div, mul)"
	read operation
	verify_operator $operation "sum" || verify_operator $operation "sub" && break
	verify_operator $operation "div" || verify_operator $operation "mul" && break
	echo "Can't find such operation. Try again."
done

while :
do
	echo "Enter first argument"
	read arg1
	! [[ $arg1 -eq $arg1 ]] 2>/dev/null && interactive_number_exception && continue
	verify_int $arg1 && break
	interactive_datatype_exception "First argument is not int!"
done

while :
do
	echo "Enter second argument"
	read arg2
	! [[ $arg2 -eq $arg2 ]] 2>/dev/null && interactive_number_exception && continue
	if [[ $operator == div ]] && [[ $arg2 -eq 0 ]]; then
		interactive_user_exception "(Interactive) Division by zero"
		continue
	fi
	verify_int $arg2 && break
	interactive_datatype_exception "Second argument is not int!"
done

calc $operation $arg1 $arg2
}
