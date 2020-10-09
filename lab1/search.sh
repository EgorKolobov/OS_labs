#!/bin/bash

search() {
grep -R -l -s $2 $1 2>&1 | grep -v "Permission denied"
! verify_directory $1 && user_exception "No such directory!"
grep -r $2 $1 2>/dev/null
}

interactive_search() {
while :
do
	echo "Input directory."
	read directory
	verify_directory $directory && break
	interactive_user_exception "(Interactive) No such directory!"
done
echo "Input keyword."
read keyword
search "$directory" "$keyword"
}
