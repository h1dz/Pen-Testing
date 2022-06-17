#!/bin/bash
R='\033[5;32m' #${R} green flash
N='\033[0m'    #${N} null
rm -rf ports0.txt 2>/dev/null
rm -rf ports2.txt 2>/dev/null
rm -rf ports3.txt 2>/dev/null
rm -rf masscan1.txt 2>/dev/null
rm -rf masscan2.txt 2>/dev/null
rm -rf masscan3.txt 2>/dev/null
rm -rf masscan4.txt 2>/dev/null
clear
/home/kali/ctf/ping.sh $1
tput sgr0; echo ""
date
tput setaf 3; printf ${Y}"IP = "$1
tput bold; printf "\n\n${R}Running Scans...!${N}\n"
tput sgr0; echo ""
tput setaf 3; printf "============================================ TCP SCAN ============================================\n"
tput sgr0; 
sudo masscan -e tun0 -p1-65535 --open-only --interactive --rate=500 $1 | tee -a -i masscan1.txt
ports1=$(cat masscan1.txt | sed s/'Discovered open port //' | awk -F/ '{print $1}'); echo $ports1 | sed "s/ /\n/g" >> ports2.txt 2>/dev/null
tput setaf 8; printf "===== TCP PORTS FOUND =====\n"; tput sgr0;
tput bold; echo $ports1 | sed "s/ /\n/g"; tput sgr0; 2>/dev/null
tput setaf 8; printf "===== TCP SCAN FINISHED =====\n"; tput sgr0;
rm -rf masscan1.txt 2>/dev/null
tput setaf 3; printf "============================================ UDP SCAN ============================================\n"
tput sgr0;
sudo masscan -e tun0 --ports U:1-65535 --open-only --interactive --rate=500 $1 | tee -a -i masscan2.txt
ports2=$(cat masscan2.txt | sed s/'Discovered open port //' | awk -F/ '{print $1}'); echo $ports2 | sed "s/ /\n/g" >> ports2.txt 2>/dev/null
tput setaf 8; printf "===== UDP PORTS FOUND =====\n"; tput sgr0;
tput bold; echo $ports2 | sed "s/ /\n/g"; tput sgr0; 2>/dev/null
tput setaf 8; printf "===== UDP SCAN FINISHED =====\n"; tput sgr0;
date
rm -rf masscan2.txt 2>/dev/null
tput setaf 3; printf "============================================ FINAL/RE-CHECK SCAN ============================================\n"
date
tput sgr0; 
sudo masscan -e tun0 -p1-65535 --interactive $1 | tee -a -i masscan3.txt
ports3=$(cat masscan3.txt | sed s/'Discovered open port //' | awk -F/ '{print $1}'); echo $ports3 | sed "s/ /\n/g" >> ports3.txt 2>/dev/null
tput setaf 8; printf "===== TCP PORTS FOUND =====\n"; tput sgr0;
tput bold; echo $ports3 | sed "s/ /\n/g"; tput sgr0; 2>/dev/null
tput setaf 8; printf "===== TCP SCAN FINISHED =====\n"; tput sgr0;
rm -rf masscan3.txt 2>/dev/null
sudo masscan -e tun0 --ports U:1-65535 --interactive $1 | tee -a -i masscan4.txt
ports4=$(cat masscan4.txt | sed s/'Discovered open port //' | awk -F/ '{print $1}'); echo $ports4 | sed "s/ /\n/g" >> ports3.txt 2>/dev/null
tput setaf 8; printf "===== UDP PORTS FOUND =====\n"; tput sgr0;
tput bold; echo $ports4 | sed "s/ /\n/g"; tput sgr0; 2>/dev/null
tput setaf 8; printf "===== UDP SCAN FINISHED =====\n"; tput sgr0;
rm -rf masscan4.txt 2>/dev/null
clear
date | tee -a -i ports0.txt
tput setaf 3; printf "============================================ First Scan ============================================\n" | tee -a -i ports0.txt
tput sgr0; 
cat ports2.txt | tee -a -i ports0.txt 2>/dev/null 
tput sgr0; 
tput setaf 3; printf "============================================ Final Scan============================================\n" | tee -a -i ports0.txt
tput sgr0; 
cat ports3.txt | tee -a -i ports0.txt 2>/dev/null 
tput setaf 3; printf "============================================ ${R}FINISHED!${N}"; tput setaf 3; printf " ============================================\n" | tee -a -i ports0.txt
tput sgr0;
rm -rf ports2.txt 2>/dev/null
rm -rf ports3.txt 2>/dev/null
