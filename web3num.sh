#!/bin/bash
#Simple scan for enumerating a web server
#Rename to web3num.sh
#chmod +x web3num.sh
#Usage:          ./web3num.sh <ip>

B='\033[0;96m' #${B}
G='\033[0;92m' #${G}
R='\033[0;91m' #${R}
Y='\033[0;33m' #${Y}
N='\033[0m'    #${N}

printf "${N}\nScanning...\n\n${Y}" | tee -a -i scanresults
date | tee -a -i scanresults
printf ${Y}"\nIP = "$1 | tee -a -i scanresults
printf "${B}\n----------------------------------Start----------------------------------\n\n" | tee -a -i scanresults
printf "\n----------------------------------nmap quick----------------------------------\n\n${G}" | tee -a -i scanresults
nmap -sC -sV -Pn $1 | tee -a -i scanresults
printf ${Y}"1/14 Completed" | tee -a -i scanresults
printf "${B}\n----------------------------------banner----------------------------------\n\n${G}" | tee -a -i scanresults
curl -I  $1 -vv | tee -a -i scanresults
printf ${Y}"2/14 Completed" | tee -a -i scanresults
printf "${B}\n----------------------------------nmap vuln----------------------------------\n\n${R}" | tee -a -i scanresults
sudo nmap -F -sV -Pn --script vuln $1 | tee -a -i scanresults
printf ${Y}"3/14 Completed" | tee -a -i scanresults
printf "${B}\n----------------------------------gobuster----------------------------------\n\n${G}" | tee -a -i scanresults
gobuster dir -e -u http://$1/ -w /usr/share/wordlists/dirbuster/directory-list-2.3-small.txt -q | tee -a -i scanresults
gobuster vhost -w /usr/share/secLists/Discovery/DNS/subdomains-top1million-20000.txt -u $1 | tee -a -i scanresults
printf ${Y}"4/14 Completed" | tee -a -i scanresults
printf "${B}\n----------------------------------robots----------------------------------\n\n${R}" | tee -a -i scanresults
sudo curl http://$1/robots.txt | tee -a -i scanresults
printf ${Y}"5/14 Completed" | tee -a -i scanresults
printf "${B}\n----------------------------------wpscan----------------------------------\n\n${G}" | tee -a -i scanresults
wpscan --url http://$1 -e u --force | tee -a -i scanresults 
printf ${Y}"6/14 Completed" | tee -a -i scanresults
printf "${B}\n----------------------------------whatweb----------------------------------\n\n${G}" | tee -a -i scanresults
whatweb $1 | tee -a -i scanresults
printf ${Y}"7/14 Completed" | tee -a -i scanresults
printf "${B}\n----------------------------------file upload----------------------------------\n\n${R}" | tee -a -i scanresults
touch test.txt
echo "Can UPLOAD files to site!!!" >> test.txt
curl -X PUT -d @test.txt $1/test.txt -vv | tee -a -i scanresults
curl -X GET $1/test.txt | tee -a -i scanresults
printf ${Y}"8/14 Completed" | tee -a -i scanresults
printf "${B}\n----------------------------------sqlmap----------------------------------\n\n${R}" | tee -a -i scanresults
sqlmap -u http://$1 --forms --dump --batch | tee -a -i scanresults
printf ${Y}"9/14 Completed" | tee -a -i scanresults
printf "${B}\n----------------------------------Mysql root----------------------------------\n\n${R}" | tee -a -i scanresults
mysql -h $1 -u root  | tee -a -i scanresults
printf ${Y}"10/14 Completed" | tee -a -i scanresults
printf "${B}\n----------------------------------SMB enum----------------------------------\n\n${R}" | tee -a -i scanresults
if nc -w1 -z $1 445; then
smbclient -N -L //$1 | tee -a -i scanresults
nmap -p 139,445 --script=smb-enum-shares.nse,smb-enum-users.nse $1 | tee -a -i scanresults
smbmap -H $1
crackmapexec smb $1 --shares | tee -a -i scanresults
printf ${Y}"\n11/14 Completed" | tee -a -i scanresults
else
  printf ${G}"\nPort 445 is closed" | tee -a -i scanresults
fi
printf "${B}\n----------------------------------nikto----------------------------------\n\n${G}" | tee -a -i scanresults
nikto -h $1 | tee -a -i scanresults
nikto -h $1 -Display 8 | tee -a -i scanresults
nikto -h $1 -Tuning 0 | tee -a -i scanresults
printf ${Y}"12/14 Completed" | tee -a -i scanresults
printf "${B}\n----------------------------------nmap UDP----------------------------------\n\n${G}" | tee -a -i scanresults
sudo nmap -sU $1 | tee -a -i scanresults
printf ${Y}"13/14 Completed" | tee -a -i scanresults
printf "${B}\n----------------------------------nmap full----------------------------------\n\n${G}" | tee -a -i scanresults
nmap -sV -p- $1 | tee -a -i scanresults
printf ${Y}"14/14 Completed" | tee -a -i scanresults
printf "${B}\n----------------------------------Finished----------------------------------\n\n" | tee -a -i scanresults
echo "Go through Web App Pen Test checklist" | tee -a -i scanresults
echo "Enumerate Domain" | tee -a -i scanresults
clear
cat scanresults
