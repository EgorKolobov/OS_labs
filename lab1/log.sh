#!/bin/bash
log() {
Y="\033[0;33m"
DEF="\033[0m"
sed -n 's/(WW)/Warning/p' /var/log/anaconda/X.log
sed -n 's/(II)/Information/p' /var/log/anaconda/X.log
}
