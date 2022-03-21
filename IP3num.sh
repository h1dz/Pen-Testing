#!/bin/bash
#Syntax: ./ipEnum.sh <ip>
clear
B='\033[0;96m' #${B}
G='\033[0;92m' #${G}
R='\033[0;91m' #${R}
Y='\033[0;33m' #${Y}
D='\033[5;35m' #${D}
N='\033[0m'    #${N}
rm -rf SIS.txt 2>/dev/null
rm -rf nmapTCP.txt 2>/dev/null
rm -rf nmapUDP.txt 2>/dev/null
printf "${D}|-------------------------------|\n" | tee -a -i SIS.txt
printf "|                               |\n" | tee -a -i SIS.txt
printf "|                               |\n" | tee -a -i SIS.txt
printf "|        IP 3numeration         |\n" | tee -a -i SIS.txt
printf "|             -H1dz             |\n" | tee -a -i SIS.txt
printf "|                               |\n" | tee -a -i SIS.txt
printf "|                               |\n" | tee -a -i SIS.txt
printf "|-------------------------------|\n${Y}" | tee -a -i SIS.txt
date 2>/dev/null | tee -a -i SIS.txt
printf ${Y}"\nIP = "$1 | tee -a -i SIS.txt
printf "${Y}\n\nScan Initiated...\n\n" | tee -a -i SIS.txt
printf "${G}\n----------------------------------Ping----------------------------------\n\n${B}" | tee -a -i SIS.txt
ping $1 -c 1 | tee -a -i SIS.txt
printf "${G}\n----------------------------------Open Ports----------------------------------\n\n${B}" | tee -a -i SIS.txt
sudo nmap -Pn -A --min-rate 100 <ip> -T5 --open 2>/dev/null | tee -a -i SIS.txt
printf "${G}\n----------------------------------Banner----------------------------------\n\n${B}" | tee -a -i SIS.txt
wget -q -S $1 2>/dev/null| tee -a -i SIS.txt
printf "${G}\n\n----------------------------------Gobuster Small----------------------------------\n\n${B}" | tee -a -i SIS.txt
gobuster dir -u $1 -w /usr/share/wordlists/seclists/Discovery/Web-Content/directory-list-2.3-small.txt -k -e -q -f -d-x txt,php,html -k 2>/dev/null | tee -a -i SIS.txt
printf "${G}\n----------------------------------Gobuster VHOST----------------------------------\n\n${P}" | tee -a -i SIS.txt
gobuster vhost -w /usr/share/seclists/Discovery/DNS/subdomains-top1million-110000.txt -u $1 2>/dev/null | tee -a -i SIS.txt
printf "${G}\n----------------------------------Robots----------------------------------\n\n${P}" | tee -a -i SIS.txt
sudo curl http://$1/robots.txt 2>/dev/null | tee -a -i SIS.txt
printf "${G}\n----------------------------------HTTP Options----------------------------------\n\n${B}" | tee -a -i SIS.txt
sudo nmap --script http-methods --script-args http-method.test-all $1 | grep "Methods:" | cut -d ":" -f 2 2>/dev/null | tee -a -i SIS.txt
printf "${G}\n----------------------------------Whatweb----------------------------------\n\n${B}" | tee -a -i SIS.txt
whatweb $1 -v 2>/dev/null | tee -a -i SIS.txt
printf "${G}\n----------------------------------Nikto----------------------------------\n\n${B}" | tee -a -i SIS.txt
nikto -h $1 2>/dev/null | tee -a -i SIS.txt
printf "${G}\n\n----------------------------------Nmap TCP----------------------------------\n\n${B}" | tee -a -i SIS.txt
ports=$(sudo nmap -Pn -p- --min-rate 100 $1 -T5 | grep ^[0-9] | cut -d '/' -f1 | tr '\n' ',' | sed s/,$//); sudo nmap -Pn -sC -sV --version-all --script vuln -p$ports --min-rate 100 $1 -T5 --open | tee -a -i nmapTCP.txt
printf "${G}\n----------------------------------Gobuster Medium----------------------------------\n\n${B}" | tee -a -i SIS.txt
gobuster dir -u http://$1 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -k -e -q -f -d -x php,html,txt | tee -a -i SIS.txt
printf "${G}\n\n----------------------------------Nmap UDP----------------------------------\n\n${B}" | tee -a -i SIS.txt
ports=$(sudo nmap -Pn -p- -sU --min-rate 100 $1 -T5 | grep ^[0-9] | cut -d '/' -f1 | tr '\n' ',' | sed s/,$//); sudo nmap -Pn -sU -sV -p$ports --min-rate 100 $1 -T5 --open | tee -a -i nmapUDP.txt
printf "${G}\n----------------------------------Finished----------------------------------\n\n${Y}" | tee -a -i SIS.txt
date 2>/dev/null | tee -a -i SIS.txt
clear
cat nmapTCP.txt
cat nmapUDP.txt
cat SIS.txt
