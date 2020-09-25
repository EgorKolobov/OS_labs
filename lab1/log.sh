#!/bin/bash
log() {
Y='\033[93m'
B='\033[34m'
DEF='\033[0m'
grep  "WW" /var/log/anaconda/X.log | sed ''/WW/s//`printf "${Y}Warning${DEF}"`/'' > strm
grep "II" /var/log/anaconda/X.log | sed ''/II/s//`printf "${B}Information${DEF}"`/'' >> strm
cat strm
}
