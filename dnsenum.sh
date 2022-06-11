#!/bin/bash
dnsrecon -t brt -d $2
dnsrecon -d $2 -t axfr
dnsrecon -d $2 -a
dnsrecon -d $2 -t zonewalk
dnsrecon -d $2
nslookup $2
nslookup -type=CNAME $2
nslookup -type=MX $2
nslookup -type=TXT $2
nslookup -type=A $2
nslookup -type=SOA $2
dig $2 $1
dig -t any $2
dig axfr $2 @$1
whois $1
host $2
host -l $2 $1
traceroute $1
fierce --domain $2
for server in $(host -t ns $2 | cut -d " " -f4); do host -l $2 $server | grep "has address"; done
subfinder -d $2
amass enum -d $2
echo "Bruteforcing subdomains..."
wfuzz -c -w /usr/share/wordlists/seclists/Discovery/DNS/subdomains-top1million-110000.txt -u http://$2 -v -H "Host:FUZZ.$2"
gobuster vhost -w /usr/share/wordlists/seclists/Discovery/DNS/subdomains-top1mil-5000.txt -u $1 -k
echo "Try reverse-dns: https://whois.domaintools.com"
echo "Bruteforcing domains, will take a while..."
dnsrecon -d $2 -D /usr/share/wordlists/seclists/Discovery/DNS/dns-Jhaddix.txt -t brt
