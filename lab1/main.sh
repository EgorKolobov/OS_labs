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
"calc") calc "$2" "$3" "$4";;
"search") search "$2" "$3";;
"help") help;;
"reverse") reverse "$2" "$3";;
"strlen") strlen "$2";;
"exit") exitt "$2";;
"log") log;;
"interactive") interactive;;
*) user_exception "Unknown command. Use bash main.sh help"
esac

