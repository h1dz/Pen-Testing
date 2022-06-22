#!/bin/bash
G='\033[5;32m' #${G} green
R='\033[5;31m' #${R} red
P='\033[4;35m' #${P} purple
N='\033[0m'    #${N} null
var1=$(ping $1 -c 1 -W 3 | grep "64 bytes" | cut -d " " -f 6)
if [[ "$var1" -eq "ttl=63" ]]; then
tput bold; printf "Host is ${G}LIVE!${N}\n"
printf "Most likely running: ${P}Linux OS${N}\n"
elif [[ "$var1" -eq "ttl=64" ]]; then
tput bold; printf "Host is ${G}LIVE!${N}\n"
printf "Most likely running: ${P}Linux OS${N}\n"
elif [[ "$var1" -eq "ttl=127" ]]; then
tput bold; printf "Host is ${G}LIVE!${N}\n"
printf "Most likely running: ${P}Windows OS${N}\n"
elif [[ "$var1" -eq "ttl=128" ]]; then
tput bold; printf "Host is ${G}LIVE!${N}\n"
printf "Most likely running: ${P}Windows OS${N}\n"
elif [[ "$var1" -eq "ttl=31" ]]; then
tput bold; printf "Host is ${G}LIVE!${N}\n"
printf "Most likely running: ${P}Windows 95 OS${N}\n"
elif [[ "$var1" -eq "ttl=32" ]]; then
tput bold; printf "Host is ${G}LIVE!${N}\n"
printf "Most likely running: ${P}Windows 95 OS${N}\n"
elif [[ "$var1" -eq "ttl=255" ]]; then
tput bold; printf "Host is ${G}LIVE!${N}\n"
printf "Most likely running: ${P}MAC / OPENBSD / CISCO / SOLARIS OS${N}\n"
elif [[ "$var1" -eq "ttl=254" ]]; then
tput bold; printf "Host is ${G}LIVE!${N}\n"
printf "Most likely running: ${P}MAC / OPENBSD / CISCO / SOLARIS OS${N}\n"
elif [[ "$var1" == "" ]]; then
tput bold; printf "Host appears to be  ${R}DOWN!${N}\n"
fi
