#!/bin/bash

interactive() {
while :
do
	echo "MENU:"
	echo "1 - calc"
	echo "2 - search"
	echo "3 - reverse"
	echo "4 - help"
	echo "5 - log"
	echo "6 - strlen"
	echo "7 - exit"
	read num
	case $num in
	1) interactive_calc;;
	2) interactive_search;;
	3) interactive_reverse;;
	4) help;;
	5) log;;
	6) interactive_strlen;;
	7) interactive_exit;;
	*) echo "Unknown command. Try again."
	esac
echo "Enter 'exit' to exit. Enter something else to continue."
read ans
if [[ "$ans" == "exit" ]]; then
	break;
fi
done
}
