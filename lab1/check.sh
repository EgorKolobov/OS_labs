#!/bin/bash

int_check() {
re='^[+-]?[0-9]+$'
[[ $1 =~ $re ]]
}

read_check() {
test -r "$1"
}

write_check() {
test -w "$1"
}
