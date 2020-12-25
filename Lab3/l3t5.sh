#!/bin/bash

mkfifo my_pipe

bash l3t5_genertor.sh&bash l3t5_genertor.sh

rm my_pipe
