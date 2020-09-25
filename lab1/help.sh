#!bin/bash

help() {
echo "AVALIABLE COMMANDS:
calc - enables calculator mod.
	calc sum num1 num2 - summarize num1 and num2
	calc sub num1 num2 - substract num2 from num1
	calc div num1 num2 - divide num1 on num2
	calc mul num1 num2 - multiply num1 and num2
search - enables search mod.
	search dir keyword - search  keyword  at directory
help - obvious
reverse - enables reverse write mod
	reverse start_file dest_file - write start_file backwards into dest_file
strlen - gets string's length
	strlen string1 - returns the length
interactive - enables interactive mod
log - enables log mod
interactive - enables interactive mod.
exxit - exits the programm with some code.
	exxit exit_code - exits programm with code exit_code
"
}
