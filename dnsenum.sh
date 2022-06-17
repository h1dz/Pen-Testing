#!/bin/bash
clear
dnsrecon -t brt -d $2 2>/dev/null
dnsrecon -d $2 -t axfr 2>/dev/null
dnsrecon -d $2 -a 2>/dev/null
dnsrecon -d $2 -t zonewalk 2>/dev/null
dnsrecon -d $2 2>/dev/null
nslookup $2 2>/dev/null
nslookup -type=CNAME $2 2>/dev/null
nslookup -type=MX $2 2>/dev/null
nslookup -type=TXT $2 2>/dev/null
nslookup -type=A $2 2>/dev/null
nslookup -type=SOA $2 2>/dev/null
dig $2 $1 2>/dev/null
dig -t any $2 2>/dev/null
dig axfr $2 @$1 2>/dev/null
whois $1 2>/dev/null
host $2 2>/dev/null
host -l $2 $1 2>/dev/null
traceroute $1 2>/dev/null
fierce --domain $2 2>/dev/null
#for ip in $(seq 1 254); do host 10.10.10.$ip; done | grep -v "not found"     #change 10.10.10. to first 3 octets of RHOST
for server in $(host -t ns $2 | cut -d " " -f4); do host -l $2 $server | grep "has address"; done 2>/dev/null
subfinder -d $2 2>/dev/null
amass enum -d $2 2>/dev/null
echo "Bruteforcing subdomains..." 
wfuzz -c -w /usr/share/wordlists/seclists/Discovery/DNS/subdomains-top1million-110000.txt -u http://$2 -v -H "Host:FUZZ.$2" 2>/dev/null
gobuster vhost -w /usr/share/wordlists/seclists/Discovery/DNS/subdomains-top1mil-5000.txt -u $1 -k 2>/dev/null
echo "Try reverse-dns: https://whois.domaintools.com"
echo "Bruteforcing domains, will take a while..."
dnsrecon -d $2 -D /usr/share/wordlists/seclists/Discovery/DNS/dns-Jhaddix.txt -t brt 2>/dev/null
