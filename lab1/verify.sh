#!bin/bash

verify_int() {
	reg='[+-]?[0-9]+$'
	[[ $1 =~ $reg ]]
}

verify_read() {
	test -r "$1"
}

verify_write() {
	test -w "$1"
}

verify_file() {
	test -f "$1"
}

verify_directory() {
	test -d "$1"
}

verify_operator() {
	test $1 == $2
}
