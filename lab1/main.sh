#!/bin/bash

source check.sh
source interactive.sh
source log.sh
source calc.sh
source search.sh
source help.sh
source reverse.sh
source strlen.sh
source exitt.sh
source exception.sh
source verify.sh

case "$1" in
"calc")	[[ $# -ne 4 ]] && number_exception
	calc "$2" "$3" "$4";;
"search")
	[[ $# -ne 3 ]] && number_exception
	search "$2" "$3";;
"help")
	[[ $# -ne 1 ]] && number_exception
	help;;
"reverse")
	[[ $# -ne 3 ]] && number_exception
	reverse "$2" "$3";;
"strlen")
	[[ $# -ne 2 ]] && number_exception
	strlen "$2";;
"exit")
	[[ $# -eq 1 ]] && exit 0
	[[ $# > 2 ]] && number_exception
	exitt "$2";;
"log")
	check_args $# 1
	log;;
"interactive")
	[[ $# -ne 1 ]] && number_exception
	interactive;;
*) user_exception "Unknown command. Use bash main.sh help"
esac

