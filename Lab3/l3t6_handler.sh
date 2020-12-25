#!/bin/bash

value=1 #Default value
type="+" #Default value

user_signal1()
{
	type="+"
}

user_signal2()
{
	type="*"
}

terminator()
{
	exit 0
}

trap "user_signal1" USR1
trap "user_signal2" USR2
trap "terminator" SIGTERM

while :
do
	case "$type" in
		"+")
			value=$(echo "${value} + 2" | bc)
		;;
		"*")
			value=$(echo "${value} * 2" | bc)
		;;
	esac
		sleep 1
		echo "$value"
done
