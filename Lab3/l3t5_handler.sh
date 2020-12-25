#!/bin/bash

value=1
operation="+"

tail -f my_pipe |
while :
do
	read line
	case $line in
		"+")
			operation="$line"
		;;
		"*")
			operation="$line"
		;;
		"QUIT")
	 		killall tail
			exit 0
		;;
		[0-9]*)
			case $operation in
				"+")
					value=$(echo "${value} + ${line}" | bc)
				;;
				"*")
					value=$(echo "${value} * ${line}" | bc)
				;;
			esac
		;;
		*)
			killall tail
			exit 1
		;;

	esac
done
