#!/bin/bash
#Usage:      ./scrape.sh <url> <depthOFscan>
G='\033[0;92m' #${G}
B='\033[0;96m' #${B}
Y='\033[0;33m' #${Y}
R='\033[0;91m' #${R}
printf ${G}"\nCompiling..."
printf ${G}"\nURL: ${R}"$1
printf ${G}"\nDepth: ${R}"$2"\n${Y}"
cewl -d $2 -e -w $1.txt $1 -o --with-numbers -u test
