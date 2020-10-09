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

interactive_user_exception() {
echo "$1" >> /dev/stderr
}

interactive_datatype_exception() {
echo "(Interactive) Wrong data type." >> /dev/stderr
}

interactive_number_exception() {
echo "(Interactive) Wrong amount of arguments." >> /dev/stderr
}
