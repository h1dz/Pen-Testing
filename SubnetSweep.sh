#!/bin/bash
#scan for subnets
#sudo ./SubnetSweep.sh <xxx.xxx.xxx>
clear
rm -rf LiveHosts.txt /home/kali/ctf/LiveHosts/ 2>/dev/null
mkdir /home/kali/ctf/LiveHosts 2>/dev/null
cd /home/kali/ctf/LiveHosts
check_live(){
G='\033[5;32m' #${G} green
R='\033[5;31m' #${R} red
N='\033[0m'    #${N} null
Y='\033[0;33m' #${Y} yellow
var1=$(ping $lines -c 1 -W 3 | grep "100% packet loss" | cut -d " " -f 6,7,8 | tr -d ",")
if [[ "$var1" == "100% packet loss" ]]; then
tput bold; printf "\nHost ${Y}$lines${N} appears to be  ${R}DOWN!${N}\n"
else
tput bold; printf "\nHost ${Y}$lines${N} is  ${G}LIVE!${N}\n\n"
tput setaf 2; tput bold; printf "========================================================================================\n"; tput sgr0;
fi
}
tput sgr0;
check_live
tput setaf 2; tput bold; printf "\n============================================ Conducting a Ping Sweep of Subnets! ============================================ \n\n"; tput sgr0;
tput setaf 1; tput bold; printf "\nLive Hosts Found:\n"; tput sgr0;
for i in {1..254} ;do (ping -c 1 $1.$i | grep "64 bytes" | cut -d " " -f 4 | tr -d ":"&); done | tee -a -i LiveHosts.txt
tput setaf 2; tput bold; printf "============================================ Ping Sweep of Subnets Complete! ============================================"; tput sgr0;
