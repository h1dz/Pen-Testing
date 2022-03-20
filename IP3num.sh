#!/bin/bash
#-f for a full scan
#-d for a domain scan
#Syntax: ./ipEnum.sh <ip> -f or -d
clear
B='\033[0;96m' #${B}
G='\033[0;92m' #${G}
R='\033[0;91m' #${R}
Y='\033[0;33m' #${Y}
P='\033[0;35m' #${P}
D='\033[5;35m' #${D}
N='\033[0m'    #${N}
rm -rf SIS.txt 2>/dev/null
rm -rf DSIS.txt 2>/dev/null
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
if [ "$1" == "" ] || [ "$2" == "" ]
then
printf "${R}\n\n\nEnter Domain or IP with flags -f or -d...\n\n${B}"
elif [ "$2" == "-f" ];
then
printf "${Y}\n\nScan Initiated...\n\n" | tee -a -i SIS.txt
printf "${G}\n----------------------------------Ping----------------------------------\n\n${B}" | tee -a -i SIS.txt
ping $1 -c 1 | tee -a -i SIS.txt
printf "${G}\n----------------------------------Open Ports----------------------------------\n\n${B}" | tee -a -i SIS.txt
sudo nmap -Pn -sS -A $1 -v 2>/dev/null | tee -a -i SIS.txt
if nc -w1 -z $1 80; then
printf "${G}\n----------------------------------Port 80 OPEN----------------------------------\n\n${B}" | tee -a -i SIS.txt
printf "${G}\n----------------------------------Banner----------------------------------\n\n${B}" | tee -a -i SIS.txt
wget -q -S $1 | tee -a -i SIS.txt
printf "${G}\n\n----------------------------------Gobuster DIR----------------------------------\n\n${B}" | tee -a -i SIS.txt
gobuster dir -e -u $1 -w /usr/share/wordlists/seclists/Discovery/Web-Content/directory-list-2.3-small.txt -x txt,php,html -k 2>/dev/null | tee -a -i SIS.txt
printf "${G}\n----------------------------------Gobuster VHOST----------------------------------\n\n${P}" | tee -a -i SIS.txt
gobuster vhost -w /usr/share/seclists/Discovery/DNS/subdomains-top1million-110000.txt -u $1 2>/dev/null | tee -a -i SIS.txt
printf "${G}\n----------------------------------Robots----------------------------------\n\n${P}" | tee -a -i SIS.txt
sudo curl http://$1/robots.txt 2>/dev/null | tee -a -i SIS.txt
printf "${G}\n----------------------------------Sitemap----------------------------------\n\n${B}" | tee -a -i SIS.txt
sudo curl http://$1/sitemap.xml 2>/dev/null | tee -a -i SIS.txt
printf "${G}\n----------------------------------.htaccess----------------------------------\n\n${P}" | tee -a -i SIS.txt
sudo curl http://$1/.htaccess 2>/dev/null | tee -a -i SIS.txt
printf "${G}\n----------------------------------.htpasswd----------------------------------\n\n${P}" | tee -a -i SIS.txt
sudo curl http://$1/.htpasswd 2>/dev/null | tee -a -i SIS.txt
printf "${G}\n----------------------------------cgi-bin----------------------------------\n\n${P}" | tee -a -i SIS.txt
echo "Check for ShellShock:" | tee -a -i SIS.txt
sudo curl http://$1/cgi-bin/ | tee -a -i SIS.txt
sudo curl http://$1/cgi-bin/ | grep "Forbidden" | tee -a -i SIS.txt
sudo curl http://$1/cgi-bin/ | grep "Unauthorized" | tee -a -i SIS.txt
sudo curl http://$1/cgi-bin | grep "Forbidden" | tee -a -i SIS.txt
printf "${G}\n----------------------------------HTTP Options----------------------------------\n\n${B}" | tee -a -i SIS.txt
sudo nmap --script http-methods --script-args http-method.test-all $1 | grep "Methods:" | cut -d ":" -f 2 2>/dev/null | tee -a -i SIS.txt
printf "${G}\n----------------------------------Checkout----------------------------------\n\n${B}" | tee -a -i SIS.txt
sudo curl http://$1/crossdomain.xml/ | tee -a -i SIS.txt
sudo curl http://$1/clientaccesspolicy.xml/ | tee -a -i SIS.txt
sudo curl http://$1/manager/html/ | tee -a -i SIS.txt
sudo curl http://$1/phpmyadmin/ | tee -a -i SIS.txt
sudo curl http://$1/wordpress/ | tee -a -i SIS.txt
printf "${G}\n----------------------------------File Upload----------------------------------\n\n${P}" | tee -a -i SIS.txt
sudo curl -X PUT -d @uploadtest.txt http://$1/uploadtest.txt -vv
sudo curl -X GET http://$1/uploadtest.txt
sudo curl -X POST -F "file=@/home/kali/ctf/uploadtest.txt" http://$1/uploadtest.txt
sudo curl -X GET http://$1/uploadtest.txt
printf "${G}\n----------------------------------.ico----------------------------------\n\n${B}" | tee -a -i SIS.txt
curl http://$1/favicon.ico | md5sum 2>/dev/null | tee -a -i SIS.txt
printf "${G}\n----------------------------------Whatweb----------------------------------\n\n${B}" | tee -a -i SIS.txt
whatweb $1 -v 2>/dev/null | tee -a -i SIS.txt
printf "${G}\n----------------------------------Sqlmap----------------------------------\n\n${B}" | tee -a -i SIS.txt
sqlmap -u http://$1/--dump-all --batch 2>/dev/null | tee -a -i SIS.txt
printf "${G}\n----------------------------------Wpscan----------------------------------\n\n${B}" | tee -a -i SIS.txt
sudo wpscan --url http://$1 --no-update -eu --force --rua --disable-tls-checks --detection-mode aggressive -v --api-token NWoc3OEiSwFLsTt6PIsK021GCWBMfaQ3sdl5kuWYM4c 2>/dev/null | tee -a -i SIS.txt
printf "${G}\n----------------------------------Compiling Dictionary File----------------------------------\n\n${G}" | tee -a -i SIS.txt
rm -rf xxxxx.txt xxxxx0.txt xxxxx1.txt xxxxx2.txt xxxxx3.txt xxxxx4.txt xxxxx5.txt 2>/dev/null
cewl -d 7 -m 5 -e -w xxxxx1.txt $1 -o --with-numbers -u test
echo "Cewl Complete"
curl $1 > xxxxx2.txt
html2dic xxxxx2.txt > xxxxx3.txt
gobuster dir -u http://$1/ -w /usr/share/wordlists/dirbuster/directory-list-2.3-small.txt -k -e -q -f -o xxxxx0.txt
echo "Gobuster Complete"
cat xxxxx0.txt | cut -d " " -f 1 > xxxxx.txt
cat xxxxx.txt | while read line 
do
   curl $line >> xxxxx5.txt
done
html2dic xxxxx5.txt > xxxxx6.txt
cat xxxxx1.txt xxxxx3.txt xxxxx6.txt > xxxxx4.txt 
sort xxxxx4.txt            
uniq xxxxx4.txt > $1.dict 
echo "Dictionary file created! " $1".dict" | tee -a -i SIS.txt
rm -rf xxxxx.txt xxxxx0.txt xxxxx1.txt xxxxx2.txt xxxxx3.txt xxxxx4.txt xxxxx5.txt 2>/dev/null
printf "${G}\n----------------------------------Nikto----------------------------------\n\n${B}" | tee -a -i SIS.txt
nikto -h $1 2>/dev/null | tee -a -i SIS.txt
else
printf "${G}\nPort 80 is closed" | tee -a -i SIS.txt
fi
if nc -w1 -z $1 443; then
printf "${G}\n----------------------------------Port 443 OPEN----------------------------------\n\n${B}" | tee -a -i SIS.txt
printf "${G}\n----------------------------------Banner----------------------------------\n\n${B}" | tee -a -i SIS.txt
wget -q -S $1 | tee -a -i SIS.txt
echo "Check for Heartbleed:" | tee -a -i SIS.txt
nmap -p443 --script ssl-heartbleed,ssl-enum-ciphers $1 | tee -a -i SIS.txt
python2 heartbleed.py $1 -n 10 -p 443 | tee -a -i SIS.txt
else
printf "${G}\nPort 443 is closed" | tee -a -i SIS.txt
fi
if nc -w1 -z $1 3306; then
printf "${G}\n----------------------------------Port 3306 OPEN----------------------------------\n\n${B}" | tee -a -i SIS.txt
nmap -sV -p3306 --script mysql-audit,mysql-databases,mysql-dump-hashes,mysql-empty-password,mysql-enum,mysql-info,mysql-query,mysql-users,mysql-variables,mysql-vuln-cve2012-2122 $1 2>/dev/null | tee -a -i SIS.txt
else
printf "${G}\nPort 3306 is closed" | tee -a -i SIS.txt
fi
if nc -w1 -z $1 445; then
printf "${G}\n\n----------------------------------SMB----------------------------------\n\n${B}" | tee -a -i SIS.txt
printf "${G}\n----------------------------------Check if writable----------------------------------\n\n${B}" | tee -a -i SIS.txt
nmap -p445 --script=smb-enum-shares.nse,smb-enum-users.nse $1 2>/dev/null | tee -a -i SIS.txt
nmap -Pn -p445 --script=smb-enum-shares.nse,smb-enum-users.nse $1 2>/dev/null | tee -a -i SIS.txt
nmap -Pn -sS -T4 --open --script=smb-security-mode -p445 $1 | tee -a -i SIS.txt
echo "Check for EternalBlue:" | tee -a -i SIS.txt
nmap -p445 --script smb-vuln-ms17-010 $1 | tee -a -i SIS.txt
printf "${G}\\n----------------------------------List SMB----------------------------------\n\n${B}" | tee -a -i SIS.txt
crackmapexec smb $1 --shares 2>/dev/null | tee -a -i SIS.txt
smbclient -N -L //$1 2>/dev/null | tee -a -i SIS.txt
smbmap -H $1 2>/dev/null | tee -a -i SIS.txt
enum4linux -A $1 2>/dev/null | tee -a -i SIS.txt 
else
printf "${G}\nPort 445 is closed" | tee -a -i SIS.txt
fi
printf "${G}\n----------------------------------Print Nightmare----------------------------------\n\n${P}" | tee -a -i SIS.txt
python3 /usr/share/doc/python3-impacket/examples/rpcdump.py $1 | egrep 'MS-RPRN|MS-PAR' | tee -a -i SIS.txt
printf "${G}\n----------------------------------NFS Mount----------------------------------\n\n${P}" | tee -a -i SIS.txt
showmount -e $1 2>/dev/null | tee -a -i SIS.txt
printf "${G}\n\n----------------------------------Nmap TCP----------------------------------\n\n${B}" | tee -a -i SIS.txt
sudo nmap -Pn -sC -sV -p- $1 | tee -a -i SIS.txt
printf "${G}\n----------------------------------Gobuster Filetypes----------------------------------\n\n${B}" | tee -a -i SIS.txt
gobuster dir -e -u $1/cgi-bin/ -w /usr/share/wordlists/dirbuster/directory-list-2.3-small.txt -x sh -k 2>/dev/null | tee -a -i SIS.txt
gobuster dir -e -u $1 -w /usr/share/wordlists/dirbuster/directory-list-2.3-small.txt -x log,bak,asp,py,aspx -k 2>/dev/null | tee -a -i SIS.txt
gobuster dir -e -u $1 -w /usr/share/wordlists/seclists/Discovery/Web-Content/directory-list-2.3-big.txt -k 2>/dev/null | tee -a -i SIS.txt
printf "${G}\n\n----------------------------------Nmap UDP----------------------------------\n\n${B}" | tee -a -i SIS.txt
sudo nmap -host-timeout 30m -sC -sU -p- $1 | tee -a -i SIS.txt
printf "${G}\n----------------------------------Finished----------------------------------\n\n${Y}" | tee -a -i SIS.txt
date 2>/dev/null | tee -a -i SIS.txt
clear
cat SIS.txt
elif [ "$2" == "-d" ];
then
rm -rf DSIS.txt 2>/dev/null
printf "${G}\nDomain Scan Initiated...\n${B}" | tee -a -i DSIS.txt
sudo dnsrecon -t brt -d $1 2>/dev/null | tee -a -i DSIS.txt
sudo dnsrecon -d $1 -a 2>/dev/null | tee -a -i DSIS.txt
#BRUTEFORCE sudo dnsrecon -d $1 -D /usr/share/wordlists/seclists/ -t brt
sudo dnsrecon -d $1 2>/dev/null | tee -a -i DSIS.txt
sudo dnsrecon -d $1 -t zonewalk 2>/dev/null | tee -a -i DSIS.txt
sudo nslookup $1 2>/dev/null | tee -a -i DSIS.txt
sudo nslookup -type=CNAME $1 2>/dev/null | tee -a -i DSIS.txt
sudo nslookup -type=MX $1 2>/dev/null | tee -a -i DSIS.txt
sudo nslookup -type=TXT $1 2>/dev/null | tee -a -i DSIS.txt
sudo nslookup -type=A $1 2>/dev/null | tee -a -i DSIS.txt
sudo nslookup -type=SOA $1 2>/dev/null | tee -a -i DSIS.txt
sudo dig $1 2>/dev/null | tee -a -i DSIS.txt
sudo dig -t any $1 2>/dev/null | tee -a -i DSIS.txt
sudo whois $1 2>/dev/null | tee -a -i DSIS.txt
sudo host $1 2>/dev/null | tee -a -i DSIS.txt
sudo traceroute $1 2>/dev/null | tee -a -i DSIS.txt
fierce -dns $1 2>/dev/null | tee -a -i DSIS.txt
for server in $(host -t ns $1 | cut -d " " -f4); do host -l $1 $server | grep "has address"; done
printf "${G}\n----------------------------------Finished----------------------------------\n\n${N}" | tee -a -i DSIS.txt
date 2>/dev/null | tee -a -i DSIS.txt
clear
cat DSIS.txt
fi
