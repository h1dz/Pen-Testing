#!/bin/bash
#-f for a full scan
#-q for a quick scan
#Syntax: ./web3num.sh <ip> <-f or -q>
B='\033[0;96m' #${B}
G='\033[0;92m' #${G}
R='\033[0;91m' #${R}
Y='\033[0;33m' #${Y}
D='\033[5;35m' #${D}
N='\033[0m'    #${N}
printf "${D}|-------------------------------|\n" | tee -a -i priv 
printf "|                               |\n" | tee -a -i priv
printf "|                               |\n" | tee -a -i priv
printf "|        IP 3numeration         |\n" | tee -a -i priv
printf "|             -H1dz             |\n" | tee -a -i priv
printf "|                               |\n" | tee -a -i priv
printf "|                               |\n" | tee -a -i priv
printf "|-------------------------------|\n\n${N}" | tee -a -i priv
if [ "$2" == "-q" ]
then
printf "${Y}\nQuick Scan...\n\n" | tee -a -i scanresultsQ
date 2>/dev/null | tee -a -i scanresultsQ
printf ${Y}"\nIP = "$1 | tee -a -i scanresultsQ
printf "${B}\n----------------------------------Nmap----------------------------------\n\n${G}" | tee -a -i scanresultsQ
sudo nmap -Pn -sS -A --script vuln $1 -v 2>/dev/null | tee -a -i scanresultsQ
printf "${B}\n----------------------------------Gobuster----------------------------------\n\n${G}" | tee -a -i scanresultsQ
gobuster dir -e -u http://$1 -w /usr/share/wordlists/dirbuster/directory-list-2.3-small.txt -q 2>/dev/null | tee -a -i scanresultsQ
printf "${B}\n----------------------------------Robots----------------------------------\n\n${R}" | tee -a -i scanresultsQ
sudo curl http://$1/robots.txt 2>/dev/null | tee -a -i scanresultsQ
printf "${B}\n----------------------------------Sitemap----------------------------------\n\n${G}" | tee -a -i scanresultsQ
sudo curl http://$1/sitemap.xml 2>/dev/null | tee -a -i scanresultsQ
printf "${B}\n----------------------------------Banner----------------------------------\n\n${G}" | tee -a -i scanresultsQ
curl -I $1 -vv 2>/dev/null | tee -a -i scanresultsQ
printf "${B}\n----------------------------------Index----------------------------------\n\n${G}" | tee -a -i scanresultsQ
ffuf -u http://$1/indexFUZZ -w /usr/share/seclists/Discovery/Web-Content/web-extensions.txt 2>/dev/null | tee -a -i scanresultsQ
printf "${B}\n----------------------------------Finished----------------------------------\n\n${N}" | tee -a -i scanresultsQ
clear
cat scanresultsQ
else
printf "${Y}\nFull Scan...\n\n" | tee -a -i scanresultsF
date 2>/dev/null | tee -a -i scanresultsF
printf ${Y}"\nIP = "$1 | tee -a -i scanresultsF
printf "${B}\n----------------------------------Robots----------------------------------\n\n${R}" | tee -a -i scanresultsF
sudo curl http://$1/robots.txt 2>/dev/null | tee -a -i scanresultsF
printf "${B}\n----------------------------------Sitemap----------------------------------\n\n${G}" | tee -a -i scanresultsF
sudo curl http://$1/sitemap.xml 2>/dev/null | tee -a -i scanresultsF
printf "${B}\n----------------------------------Banner----------------------------------\n\n${G}" | tee -a -i scanresultsF
curl -I $1 -vv 2>/dev/null | tee -a -i scanresultsF
printf "${B}\n----------------------------------Index----------------------------------\n\n${G}" | tee -a -i scanresultsF
ffuf -u http://$1/indexFUZZ -w /usr/share/seclists/Discovery/Web-Content/web-extensions.txt 2>/dev/null | tee -a -i scanresultsF
printf "${B}\n----------------------------------File Upload----------------------------------\n\n${R}" | tee -a -i scanresultsF
touch uploadtest.txt
echo "Upload Successful!" >> uploadtest.txt
curl -X PUT -d @uploadtest.txt $1/uploadtest.txt -vv 2>/dev/null | tee -a -i scanresultsF
curl -X GET $1/uploadtest.txt  2>/dev/null | tee -a -i scanresultsF
rm uploadtest.txt 2>/dev/null
printf "${B}\n----------------------------------.ico----------------------------------\n\n${G}" | tee -a -i scanresultsF
curl http://$1/favicon.ico | md5sum 2>/dev/null | tee -a -i scanresultsF
printf "${B}\n----------------------------------Wpscan----------------------------------\n\n${R}" | tee -a -i scanresultsF
sudo wpscan --url http://$1 --no-update -e u --force --rua --disable-tls-checks --detection-mode aggressive -v 2>/dev/null | tee -a -i scanresultsF
printf "${B}\n----------------------------------Sqlmap----------------------------------\n\n${R}" | tee -a -i scanresultsF
sqlmap -u http://$1 --forms --dump 2>/dev/null | tee -a -i scanresultsF
printf "${B}\n----------------------------------whatweb----------------------------------\n\n${G}" | tee -a -i scanresultsF
whatweb $1 -v 2>/dev/null | tee -a -i scanresultsF
printf "${B}\n----------------------------------Nikto----------------------------------\n\n${G}" | tee -a -i scanresultsF
nikto -h $1 2>/dev/null | tee -a -i scanresultsF
printf "${B}\n----------------------------------Gobuster----------------------------------\n\n${G}" | tee -a -i scanresultsF
gobuster dir -e -u http://$1 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -x html,php,log,txt -q 2>/dev/null | tee -a -i scanresultsF
printf "${B}\n----------------------------------Nmap Full----------------------------------\n\n${G}" | tee -a -i scanresultsF
sudo nmap -A -p- $1 -v 2>/dev/null | tee -a -i scanresultsF
printf "${B}\n----------------------------------Nmap UDP----------------------------------\n\n${G}" | tee -a -i scanresultsF
sudo nmap -sV -sU $1 -v 2>/dev/null | tee -a -i scanresultsF
printf "${B}\n----------------------------------Finished----------------------------------\n\n${N}" | tee -a -i scanresultsF
clear
cat scanresultsF
fi
