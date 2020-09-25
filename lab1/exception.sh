#!/bin/bash

exception() {
echo "Unknown error has occured." >> /dev/stderr
exit 1
}

user_exception() {
echo "$1" >> /dev/stderr
exit 1
}

datatype_exception() {
echo "Wrong data type." >> /dev/stderr
exit 1
}

number_exception() {
echo "Wrong number of arguments." >> /dev/stderr
exit 1
}

