#!/bin/bash
clear
rm -rf nmapTCP.txt
rm -rf nmapUDP.txt
/home/kali/ctf/ping.sh $1
sudo nmap -Pn -A --min-rate 100 $1 -T5 --open
ports=$(sudo nmap -Pn -p- --min-rate 100 $1 -T5 | grep ^[0-9] | cut -d '/' -f1 | tr '\n' ',' | sed s/,$//); sudo nmap -Pn -sC -sV --version-all --script vuln -p$ports --min-rate 100 $1 -T5 --open -oN nmapTCP.txt
sudo nmap -Pn -F -sU --min-rate 100 $1 -T5 --open
ports=$(sudo nmap -Pn -p- -sU --min-rate 100 $1 -T5 | grep ^[0-9] | cut -d '/' -f1 | tr '\n' ',' | sed s/,$//); sudo nmap -Pn -sU -sV --version-all --script vuln -p$ports --min-rate 100 $1 -T5 --open -oN nmapUDP.txt
echo "Nmap scans complete!"
