#!/bin/bash
clear
rm -rf masscan.txt 2>/dev/null
rm -rf ports.txt 2>/dev/null
date | tee -a -i ports.txt
tput sgr0; echo ""
sudo nmap -Pn -F --min-rate 100 $1 -T4 --open
sudo masscan  -e tun0 -p1-65535 --open-only --interactive --rate=500 $1 | tee -a -i masscan.txt
ports=$(cat masscan.txt | sed s/'Discovered open port //' | awk -F/ '{print $1}' | awk '!seen[$0]++' ORS=',' | sort); sudo nmap -Pn -sV -sC -p$ports --min-rate 100 $1 -T4 | tee -a -i ports.txt
sudo nmap -sU -F --min-rate 100 $1 -T4 --open
sudo nmap -Pn -sV -sU -p- --min-rate 100 $1 -T4 | tee -a -i ports.txt
date | tee -a -i ports.txt
clear
cat ports.txt 2>/dev/null
