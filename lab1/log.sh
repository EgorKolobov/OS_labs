#!/bin/bash
log() {
Y='\033[93m'
B='\033[34m'
DEF='\033[0m'
Warning=$(cat /var/log/anaconda/X.log | awk '/\[/ && /WW/') >> /dev/null
Information=$(cat /var/log/anaconda/X.log |awk '/\[/ && /II/') >> /dev/null
echo -e "${Warning//"(WW)"/"${Y}Warning:{DEF}"}"
echo -e "${Information//"(II)"/"${B}Information:${DEF}"}"
}
