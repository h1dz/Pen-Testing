#!/bin/bash
#Script for enumerating SMB port 445 with no credentials
#Run with sudo
#Usage:                   sudo ./smb3num <ip>
B='\033[0;96m' #${B}
G='\033[0;92m' #${G}
R='\033[0;91m' #${R}
Y='\033[0;33m' #${Y}
N='\033[0m'    #${N}
rm -r -f smbResults 2>/dev/null
rm -r -f sharesSMB.txt 2>/dev/null
clear
printf "${Y}\nScanning...\n\n" | tee -a -i smbResults
date | tee -a -i smbResults
printf ${Y}"\nIP = "$1 | tee -a -i smbResults
printf "${G}\n----------------------------------Start----------------------------------\n\n" | tee -a -i smbResults
printf "${G}\n----------------------------------Check if writable----------------------------------\n\n${B}" | tee -a -i smbResults
sudo nmap -p445 --script=smb-enum-shares.nse,smb-enum-users.nse $1 2>/dev/null | tee -a -i smbResults
sudo nmap -Pn -p445 --script=smb-enum-shares.nse,smb-enum-users.nse $1 2>/dev/null | tee -a -i smbResults
sudo nmap -Pn -p445 --script=smb-enum-shares.nse,smb-enum-users.nse $1 2>/dev/null > sharesSMB.txt
printf "${G}\n----------------------------------Run Scripts----------------------------------\n\n${B}" | tee -a -i smbResults
sudo nmap -Pn -p139,445 --script smb-vuln-ms17-010 $1 2>/dev/null | tee -a -i smbResults
sudo nmap -Pn -p139,445 --script=smb2-security-mode.nse $1 2>/dev/null | tee -a -i smbResults   
sudo nmap -Pn -p139,445 --script smb-vuln-cve-2017-7494 --script-args smb-vuln-cve-2017-7494.check-version $1 2>/dev/null | tee -a -i smbResults
sudo nmap -Pn -p139,445 --script smb-vuln-cve2009-3103 $1 2>/dev/null | tee -a -i smbResults
sudo nmap -Pn -p139,445 --script=smb-vuln* $1 2>/dev/null | tee -a -i smbResults
crackmapexec smb <IP> -u '' -p '' --users --rid-brute | grep '(SidTypeUser)' 2>/dev/null | tee -a -i smbResults
printf "${G}\n----------------------------------CrackMapExec /OS----------------------------------\n\n${B}" | tee -a -i smbResults
crackmapexec smb $1 --shares 2>/dev/null | tee -a -i smbResults
crackmapexec smb $1 --pass-pol 2>/dev/null | tee -a -i smbResults
printf "${G}\\n----------------------------------List SMB----------------------------------\n\n${B}" | tee -a -i smbResults
smbclient -N -L //$1 2>/dev/null | tee -a -i smbResults
smbmap -H $1 2>/dev/null | tee -a -i smbResults 
enum4linux -A $1 2>/dev/null | tee -a -i smbResults 
printf "${G}\\n----------------------------------Check Null & Default Logins----------------------------------\n\n${B}" | tee -a -i smbResults
smblient \\\\$1\\wwwroot 2>/dev/null | tee -a -i smbResults
smbget -R smb://$1/anonymous 2>/dev/null | tee -a -i smbResults
smbclient \\\\$1\\ -U Administrator 2>/dev/null | tee -a -i smbResults
smbget -R smb://$1/guest 2>/dev/null | tee -a -i smbResults
crackmapexec smb $1 -u '' -p '' 2>/dev/null | tee -a -i smbResults
printf "${G}\n----------------------------------Check RPC info----------------------------------\n\n${B}" | tee -a -i smbResults
rpcclient -U "" -N $1 2>/dev/null | tee -a -i smbResults    
printf "${G}\\n----------------------------------Try the following----------------------------------\n\n${B}" | tee -a -i smbResults
echo "Try connect to a share, try no creds first and then with user/pass" 2>/dev/null | tee -a -i smbResults
echo "Try upload reverse shell into a writeable share or try with a bash reverse shell" 2>/dev/null | tee -a -i smbResults
echo "Try upload SCF file" 2>/dev/null | tee -a -i smbResults
echo "Try mount the share and extract SAM&SYSTEM files" 2>/dev/null | tee -a -i smbResults
echo "Try NULL logins" 2>/dev/null | tee -a -i smbResults
echo "!!!ENUMERATE SHARES AGAIN WHEN FOUND CREDENTIALS!!!" 2>/dev/null | tee -a -i smbResults
printf "${G}\n----------------------------------Finished----------------------------------\n\n${Y}" | tee -a -i smbResults
date | tee -a -i smbResults
clear
cat smbResults 2>/dev/null
cat sharesSMB.txt 2>/dev/null
