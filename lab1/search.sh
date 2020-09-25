#!/bin/bash

search() {
if ! [[ -d $1 ]]; then
	user_exception "No such directory."
fi
grep -rn $2 $1 2>/dev/null
}

interactive_search() {
echo "Input directory."
read directory
echo "Input keyword."
read keyword
search "$directory" "$keyword"
}
