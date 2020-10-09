#!/bin/bash

reverse() {
! verify_file $1 && user_exception "No such file: ( $1 )"
! verify_file $2 && touch $2
! verify_write $2 && user_exception "Can't open file to write: ( $2 )"
! verify_read $1 && user_exception "Can't openfile to read: ( $1 )"
rev "$1" > temp
tac temp > $2
rm temp
}

interactive_reverse() {
while :
do
	echo "Enter start-file name."
	read file1
	verify_file $file1 && break
	if verify_read $file1 ; then
		interactive_user_exception "(Interactive) Can't open file $file1 to read!"
	else
		interactive_user_exception "(Interactive) File $file1 doesn't exist!"
	fi
done
while :
do
	echo "Enter destenation-file name."
	read file2
	if ! verify_write $file2 ; then
		interactive_user_exception "(Interactive) Can't open file $file2 to write!"
	else
		break
	fi
	if ! verify_file $file2 ; then
		touch $file2
	fi
done
reverse "$file1" "$file2"
echo "Reverse operation ended up successfully!"
}
