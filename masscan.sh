#!/bin/bash
clear
rm -rf ports2.txt 2>/dev/null
rm -rf ports3.txt 2>/dev/null
rm -rf masscan1.txt 2>/dev/null
rm -rf masscan2.txt 2>/dev/null
rm -rf masscan3.txt 2>/dev/null
rm -rf masscan4.txt 2>/dev/null
tput setaf 3; printf "============================================ TCP SCAN ============================================\n"
date | tee -a -i ports2.txt
tput sgr0; 
sudo masscan -e tun0 -p1-65535 --open-only --interactive --rate=500 $1 | tee -a -i masscan1.txt
ports1=$(cat masscan1.txt | sed s/'Discovered open port //' | awk -F/ '{print $1}' | awk '!seen[$0]++' ORS=',' | sort); cat $ports1 > ports2.txt
rm -rf masscan1.txt 2>/dev/null
tput setaf 3; printf "============================================ UDP SCAN ============================================\n"
tput sgr0;
sudo masscan -e tun0 --ports U:1-65535 --open-only --interactive --rate=500 $1 | tee -a -i masscan2.txt
ports2=$(cat masscan2.txt | sed s/'Discovered open port //' | awk -F/ '{print $1}' | awk '!seen[$0]++' ORS=',' | sort); cat $ports2 >> ports2.txt
rm -rf masscan2.txt 2>/dev/null
date | tee -a -i ports2.txt
clear
cat ports2.txt 2>/dev/null
tput setaf 3; printf "============================================ FINAL/RE-CHECK SCAN ============================================\n"
date | tee -a -i ports3.txt
tput sgr0; 
sudo masscan -e tun0 -p1-65535 --interactive $1 | tee -a -i masscan3.txt
ports3=$(cat masscan3.txt | sed s/'Discovered open port //' | awk -F/ '{print $1}' | awk '!seen[$0]++' ORS=',' | sort); cat $ports3 > ports3.txt
rm -rf masscan3.txt 2>/dev/null
sudo masscan -e tun0 --ports U:1-65535 --interactive $1 | tee -a -i masscan4.txt
ports4=$(cat masscan4.txt | sed s/'Discovered open port //' | awk -F/ '{print $1}' | awk '!seen[$0]++' ORS=',' | sort); cat $ports4 >> ports3.txt
rm -rf masscan4.txt 2>/dev/null
date | tee -a -i ports3.txt
clear
tput setaf 3; printf "============================================ First Scan ============================================\n"
tput sgr0; 
cat ports2.txt 2>/dev/null
tput sgr0; 
tput setaf 3; printf "============================================ Final Scan ============================================\n"
tput sgr0; 
cat ports3.txt 2>/dev/null
tput setaf 3; printf "============================================ FINISHED SCANS! ============================================\n"
