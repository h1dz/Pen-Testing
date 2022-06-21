#!/bin/bash
#scan for subnets
#./SubnetSweep.sh <xxx.xxx.xxx> 
clear
rm -rf /LiveHosts/ 2>/dev/null
mkdir /LiveHosts/ 2>/dev/null
cd /LiveHosts/
tput sgr0;
tput setaf 2; tput bold; printf "\n============================================ Conducting a Ping Sweep of Subnets! ============================================ \n\n"; tput sgr0;
tput setaf 1; tput bold; printf "\nLive Hosts Found:\n"; tput sgr0;
for i in {1..254} ;do (ping -c 1 $1.$i | grep "64 bytes" | cut -d " " -f 4 | tr -d ":"&); done | tee -a -i LiveHosts.txt
tput setaf 2; tput bold; printf "\n\n============================================ Running Nmap Against Live Hosts Found! ============================================\n"; tput sgr0;
for lines in $(cat LiveHosts.txt); do (sudo nmap -Pn -sC -sV -p- --min-rate 100 $lines -T5 -open | tee -a -i $lines.txt); done 
tput setaf 2; tput bold; printf "============================================ Ping Sweep of Subnets Complete! ============================================"; tput sgr0;
ls -la
