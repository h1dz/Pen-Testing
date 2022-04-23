#!/bin/bash
clear
B='\033[0;96m' #${B}
G='\033[0;92m' #${G}
R='\033[0;91m' #${R}
Y='\033[0;33m' #${Y}
D='\033[5;35m' #${D}
N='\033[0m'    #${N}
rm -rf GobusterVhost_DUMP.txt 2>/dev/null
date | tee -a -i GobusterVhost_DUMP.txt
printf "${B}\n\n----------------------------------Finished Directory Scans----------------------------------\n\n${G}" | tee -a -i GobusterVhost_DUMP.txt
printf "${B}\n\n----------------------------------Starting VHOST Scan----------------------------------\n\n${G}" | tee -a -i GobusterVhost_DUMP.txt
    gobuster vhost --url $1 --wordlist /usr/share/wordlists/seclists/Discovery/DNS/fierce-hostlist.txt 2>/dev/null | tee -a -i GobusterVhost_DUMP.txt
    gobuster vhost --url $1 --wordlist /usr/share/wordlists/seclists/Discovery/DNS/subdomains-top1million-110000.txt 2>/dev/null | tee -a -i GobusterVhost_DUMP.txt
    gobuster vhost --url $1 --wordlist /usr/share/wordlists/seclists/Discovery/DNS/dns-Jhaddix.txt 2>/dev/null | tee -a -i GobusterVhost_DUMP.txt
printf "${B}\n\n----------------------------------Finished VHOST Scans----------------------------------\n\n${Y}" | tee -a -i GobusterVhost_DUMP.txt
date | tee -a -i GobusterVhost_DUMP.txt
clear
cat GobusterVhost_DUMP.txt
