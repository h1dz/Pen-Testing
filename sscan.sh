#!/bin/bash
#Simple scan for enum web server orientated
#Rename to sscan.sh 
#chmod +x sscan.sh
#Usage:          ./sscan <ip>

export IP=$1
echo 'IP = '$1 >> scanresults
printf "\n----------------------------------Start------------------------------------------\n\n" >> scanresults
printf "\n---------------------------------------------------------------------------------\n\n"
printf "\n----------------------------------nmap-------------------------------------------\n\n" >> scanresults
printf "\nScanning...\n\n"
nmap -sC -sV $1 >> scanresults
sudo nmap -sU $1 >> scanresults
sudo nmap -sC -sV --script vuln $1 >> scanresults
cat scanresults
printf "\n---------------------------------------------------------------------------------\n\n"
printf "\n----------------------------------gobuster---------------------------------------\n\n" >> scanresults
gobuster dir -u http://$1 -w /usr/share/wordlists/dirbuster/directory-list-2.3-small.txt >> scanresults
gobuster vhost -w /usr/share/secLists/Discovery/DNS/subdomains-top1million-110000.txt -u $1 >> scanresults
cat scanresults
printf "\n---------------------------------------------------------------------------------\n\n"
printf "\n----------------------------------robots-----------------------------------------\n\n" >> scanresults
sudo curl robots.txt >> scanresults
printf "\n---------------------------------------------------------------------------------\n\n"
printf "\n----------------------------------wpscan-----------------------------------------\n\n" >> scanresults
wpscan --url http://$1 -e u >> scanresults 
printf "\n---------------------------------------------------------------------------------\n\n"
printf "\n---------------------------------------------------------------------------------\n\n"
printf "\n----------------------------------whatweb----------------------------------------\n\n" >> scanresults
whatweb $1 >> scanresults
printf "\n---------------------------------------------------------------------------------\n\n"
printf "\n----------------------------------banner-----------------------------------------\n\n" >> scanresults
curl -I  $1 >> scanresults
printf "\n---------------------------------------------------------------------------------\n\n"
printf "\n----------------------------------sqlmap-----------------------------------------\n\n" >> scanresults
sqlmap -u http://$1 --forms --dump --batch >> scanresults
printf "\n---------------------------------------------------------------------------------\n\n"
printf "\n----------------------------------nikto------------------------------------------\n\n" >> scanresults
nikto -h $1 >> scanresults
printf "\n---------------------------------------------------------------------------------\n\n"
printf "\n----------------------------------Finished---------------------------------------\n\n" >> scanresults
clear
cat scanresults
