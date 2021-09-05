#!/bin/bash
#script for enumerating smb
#chmod +x smb3num.sh
#Usage:         ./smb3num <ip>

export IP=$1
echo 'IP = '$1 >> resultsSMB
printf "\nRunning...\n\n"
printf "\n----------------------------------Start------------------------------------------\n\n" >> resultsSMB
printf "\n--------------------------------------------------------------------------------\n\n" >> resultsSMB
printf "\n----------------------------------list smb--------------------------------------\n\n" >> resultsSMB
smbclient -N -L //$1 >> resultsSMB
printf "\n---------------------------------------------------------------------------------\n\n" >> resultsSMB
printf "\n----------------------------------check writable-----------------------------\n\n" >> resultsSMB
nmap -p 139,445 --script=smb-enum-shares.nse,smb-enum-users.nse $1 >> resultsSMB
printf "\n---------------------------------------------------------------------------------\n\n" >> resultsSMB
printf "\n----------------------------------crackmap-----------------------------------\n\n" >> resultsSMB
crackmapexec smb $1 --shares >> resultsSMB
printf "\n---------------------------------------------------------------------------------\n\n" >> resultsSMB
printf "\n----------------------------------anon login----------------------------------\n\n" >> resultsSMB
smbget -R smb://$1/anonymous >> resultsSMB
printf "\n---------------------------------------------------------------------------------\n\n" >> resultsSMB
printf "\n----------------------------------Finished------------------------------------\n\n" >> resultsSMB
printf "\nShowing Results...\n\n"
clear
cat resultsSMB
