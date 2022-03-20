#!/bin/bash
rm -rf scangobuster 2>/dev/null
clear
B='\033[0;96m' #${B}
G='\033[0;92m' #${G}
R='\033[0;91m' #${R}
Y='\033[0;33m' #${Y}
N='\033[0m'    #${N}
printf "${Y}\nGobuster Scans Initiated...\n\n" | tee -a -i scangobuster
date 2>/dev/null | tee -a -i scangobuster
printf ${Y}"\nIP = "$1 | tee -a -i scangobuster
printf "${B}\n\n----------------------------------Gobuster Quick----------------------------------\n\n${G}" | tee -a -i scangobuster
gobuster dir -u $1 -w /usr/share/wordlists/dirb/common.txt -k -e -q -f 2>/dev/null | tee -a -i scangobuster
printf "${B}\n\n----------------------------------Gobuster Filetypes 1----------------------------------\n\n${G}" | tee -a -i scangobuster
gobuster dir -u $1 -w /usr/share/wordlists/dirbuster/directory-list-2.3-small.txt -k -e -q -f -x txt,php,html 2>/dev/null | tee -a -i scangobuster
printf "${B}\n----------------------------------Gobuster Filetypes 2----------------------------------\n\n${G}" | tee -a -i scangobuster
gobuster dir -u $1 -w /usr/share/wordlists/dirbuster/directory-list-2.3-small.txt -k -e -q -f -x .sh,log,bak,py 2>/dev/null | tee -a -i scangobuster
printf "${B}\n----------------------------------Gobuster Filetypes 3----------------------------------\n\n${G}" | tee -a -i scangobuster
gobuster dir -u $1 -w /usr/share/wordlists/dirbuster/directory-list-2.3-small.txt -k -e -q -f -x asp,aspx,db 2>/dev/null | tee -a -i scangobuster
printf "${B}\n----------------------------------Gobuster DIR Common----------------------------------\n\n${G}" | tee -a -i scangobuster
gobuster dir -u $1 -w /usr/share/wordlists/dirb/common.txt -k -e -q -f 2>/dev/null | tee -a -i scangobuster
printf "${B}\n----------------------------------Gobuster DIR Medium----------------------------------\n\n${G}" | tee -a -i scangobuster
gobuster dir -u $1 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -k -e -q -f 2>/dev/null | tee -a -i scangobuster
printf "${B}\n----------------------------------Gobuster DIR Raft----------------------------------\n\n${G}" | tee -a -i scangobuster
sgobuster dir -u $1 -w /usr/share/wordlists/seclists/Discovery/Web-Content/raft-large-directories.txt -k -e -q -f 2>/dev/null | tee -a -i scangobuster
printf "${B}\n----------------------------------Gobuster DIR Big----------------------------------\n\n${G}" | tee -a -i scangobuster
gobuster dir -u $1 -w /usr/share/wordlists/dirb/big.txt -k -e -q -f 2>/dev/null | tee -a -i scangobuster
printf "${B}\n----------------------------------Gobuster DIR Disallowed1----------------------------------\n\n${G}" | tee -a -i scangobuster
gobuster dir -u $1 -w /usr/share/wordlists/disallowed1-short.txt -k -e -q -f 2>/dev/null | tee -a -i scangobuster
printf "${R}\n----------------------------------Gobuster VHOST----------------------------------\n\n${Y}" | tee -a -i scangobuster
gobuster vhost -w /usr/share/seclists/Discovery/DNS/subdomains-top1million-110000.txt -u $1 2>/dev/null | tee -a -i scangobuster
printf "${B}\n----------------------------------Gobuster DNS----------------------------------\n\n${G}" | tee -a -i scangobuster
gobuster dns $1 -w /usr/share/seclists/Discovery/DNS/subdomains-top1million-110000.txt -i 2>/dev/null | tee -a -i scangobuster
printf "${B}\n----------------------------------Finished----------------------------------\n\n${Y}" | tee -a -i scangobuster
date 2>/dev/null | tee -a -i scangobuster
clear
cat scangobuster
