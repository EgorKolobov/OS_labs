#!/bin/bash

for i in $(seq $1); do
	sleep 1
	bash newmem.bash $2&
done
