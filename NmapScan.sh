#!/bin/bash
rm -rf nmap.txt 2>/dev/null
rm -rf ports1.txt 2>/dev/null
clear
R='\033[5;32m' #${R} 
G='\033[0;92m' #${G}
Y='\033[0;33m' #${Y}
N='\033[0m'    #${N}
tput sgr0; echo ""
date | tee -a -i nmap.txt
date >> ports1.txt
printf ${Y}"IP = "$1 | tee -a -i nmap.txt
tput bold; printf "\n\n${R}Running Scans...${N}\n"
tput sgr0; echo ""
printf "${G}\n============================================ QUICK TCP SCAN ============================================\n${N}" | tee -a -i nmap.txt
sudo nmap -Pn -F --min-rate 100 $1 -T5 -open
printf "${G}============================================ FULL TCP SCAN ============================================\n${N}" | tee -a -i nmap.txt
tput setaf 8; printf "===== TCP SCAN STARTED =====\n" | tee -a -i ports1.txt; tput sgr0;
ports=$(sudo nmap -Pn -p- --min-rate 100 $1 -T5 | grep ^[0-9] | cut -d '/' -f1 | tr '\n' ',' | sed s/,$//)
sudo nmap -Pn -sC -sV --version-all -p$ports --min-rate 100 $1 -T5 -open | tee -a -i ports1.txt
tput setaf 8; printf "===== TCP SCAN FINISHED =====\n" | tee -a -i ports1.txt; tput sgr0;
printf "${G}\n\n========================================================================================\n\n${N}" | tee -a -i nmap.txt
printf "${G}============================================ QUICK UDP SCAN ============================================\n${N}" | tee -a -i nmap.txt
sudo nmap -Pn -F -sU --min-rate 100 $1 -T5 -open 
printf "${G}============================================ FULL UDP SCAN ============================================\n${N}" | tee -a -i nmap.txt
tput setaf 8; printf "===== UDP SCAN STARTED =====\n" | tee -a -i ports1.txt; tput sgr0;
ports=$(sudo nmap -Pn -p- -sU --min-rate 100 $1 -T5 | grep ^[0-9] | cut -d '/' -f1 | tr '\n' ',' | sed s/,$//)
sudo nmap -Pn -sU -sC -sV --version-all -p$ports --min-rate 100 $1 -T5 -open | tee -a -i ports1.txt
tput setaf 8; printf "===== UDP SCAN FINISHED =====\n" | tee -a -i ports1.txt; tput sgr0;
date | tee -a -i ports1.txt
cat ports1.txt >> nmap.txt
clear
cat ports1.txt
printf "${G}\n\n========================================================================================\n\n${N}" | tee -a -i nmap.txt
printf "${G}============================================ RE-CHECK TCP/UDP SCAN ============================================\n${N}" | tee -a -i nmap.txt
tput setaf 8; printf "===== TCP SCAN STARTED =====\n" | tee -a -i nmap.txt; tput sgr0;
ports1=$(sudo nmap -Pn -p- $1 | grep ^[0-9] | cut -d '/' -f1 | tr '\n' ',' | sed s/,$//)
sudo nmap -Pn -sC -sV --version-all --script=vuln -p$ports1 $1 | tee -a -i nmap.txt
tput setaf 8; printf "===== TCP SCAN FINISHED =====\n" | tee -a -i nmap.txt; tput sgr0;
tput setaf 8; printf "===== UDP SCAN STARTED =====\n" | tee -a -i nmap.txt; tput sgr0;
ports2=$(sudo nmap -Pn -p- -sU $1 | grep ^[0-9] | cut -d '/' -f1 | tr '\n' ',' | sed s/,$//)
sudo nmap -Pn -sU -sC -sV --version-all --script=vuln -p$ports2 $1 | tee -a -i nmap.txt
tput setaf 8; printf "===== UDP SCAN FINISHED =====\n" | tee -a -i nmap.txt; tput sgr0;
date | tee -a -i nmap.txt
printf "${G}=========================================== SCANS FINISHED! ============================================\n${N}" | tee -a -i nmap.txt
clear
printf "${G}============================================ FIRST SCAN RESULTS ============================================\n${N}"
tput sgr0; 
cat ports1.txt 2>/dev/null
tput sgr0; 
printf "${G}============================================ FINAL SCAN RESULTS ============================================\n${N}"
tput sgr0;
cat nmap.txt 2>/dev/null
