#!/bin/bash

at now + 2 minutes -f bash l3t1.sh
tail -n0 -f $HOME/report
