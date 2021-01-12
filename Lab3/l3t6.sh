#!/bin/bash

bash l3t6_handler.sh&pid=$!
bash l3t6_generator.sh $pid
