#!/bin/bash
#script for enumerating smb
#usage:                       sudo ./smbenum <ip>
B='\033[0;96m' #${B}
G='\033[0;92m' #${G}
R='\033[0;91m' #${R}
Y='\033[0;33m' #${Y}
N='\033[0m'    #${N}
printf "${Y}\nScanning...\n\n" | tee -a -i smbResults
date | tee -a -i smbResults
printf ${Y}"\nIP = "$1 | tee -a -i smbResults
printf "${G}\n----------------------------------Start----------------------------------\n\n" | tee -a -i smbResults
printf "\n----------------------------------List SMB----------------------------------\n\n${R}" | tee -a -i smbResults
smbclient -N -L //$1 | tee -a -i smbResults
printf "${G}\n----------------------------------Check if writable----------------------------------\n\n${R}" | tee -a -i smbResults
nmap -p 139,445 --script=smb-enum-shares.nse,smb-enum-users.nse $1 | tee -a -i smbResults
smbmap -H $1 | tee -a -i smbResults
printf "${G}\n----------------------------------Crackmap /OS----------------------------------\n\n${R}" | tee -a -i smbResults
crackmapexec smb $1 --shares | tee -a -i smbResults
printf "${G}\n----------------------------------Finished----------------------------------\n\n" | tee -a -i smbResults
printf "${Y}\nAlso Try:...\n" | tee -a -i smbResults
# \\\\ some slashes below are not showing
printf ${Y}'\nConnect to root:       '${B}'smbclient \\\\$1\\wwwroot\n' | tee -a -i smbResults
printf "${Y}\nConnect to Share w/ Anonymous:       "${B}"smbget -R smb://<ip>/anonymous    OR    smbclient //<ip>/<share> -U anonymous\n" | tee -a -i smbResults
printf ${Y}'\nConnect to Share:       '${B}'smbclient \\\\<ip> \\<share>\n' | tee -a -i smbResults
printf "${Y}\nConnect to Share with a Password:       "${B}"smbclient //<ip>/<share> -U<user>%'<password>'\n" | tee -a -i smbResults
clear
cat smbResults
