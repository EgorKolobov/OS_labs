#!/bin/bash

bash 3_6_proc.sh&pid=$!
bash 3_6_gen.sh $pid
