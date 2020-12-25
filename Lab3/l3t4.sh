#!/bin/bash

bash l3t4_math.sh&process_id0=$!
bash l3t4_math.sh&process_id1=$!
bash l3t4_math.sh&process_id2=$!
renice -n 10 -p $process_id0

kill ${process_id2}
