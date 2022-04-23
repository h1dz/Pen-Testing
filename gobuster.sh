#!/bin/bash
#http://<url/ip> <extenstions>
echo "Usage: gob.sh http://<ip> .php,.html,.log,.txt,.sh,.asp,.aspx,.bak,.py"
rm -rf Gobuster_DUMP.txt GobusterExt_DUMP.txt GobusterVhost_DUMP.txt 2>/dev/null
clear
B='\033[0;96m' #${B}
G='\033[0;92m' #${G}
R='\033[0;91m' #${R}
Y='\033[0;33m' #${Y}
N='\033[0m'    #${N}
printf "${Y}\nGobuster...\n\n" | tee -a -i Gobuster_DUMP.txt
date 2>/dev/null | tee -a -i Gobuster_DUMP.txt
date 2>/dev/null | tee -a -i GobusterExt_DUMP.txt
printf ${Y}"\nIP = "$1 | tee -a -i Gobuster_DUMP.txt
printf "${Y}\nExtensions to try: .php,.html,.log,.txt,.sh,.asp,.aspx,bak,.py\n\n" | tee -a -i Gobuster_DUMP.txt
printf "${B}\n\n----------------------------------Directory Scans Initiated----------------------------------\n\n${G}" | tee -a -i Gobuster_DUMP.txt

if [ $# -eq 0 ]; then
    echo "Usage: ./gob.sh http://<url/ip> <extenstions> (Extensions to try: .php,.html.log,.txt,.sh,.asp,.aspx,.bak,.py)"
    exit 1
fi

for f in /usr/share/wordlists/dirb/common.txt /usr/share/wordlists/dirb/big.txt /usr/share/wordlists/dirbuster/directory-list-lowercase-2.3-medium.txt /usr/share/wordlists/seclists/Discovery/Web-Content/raft-large-directories-lowercase.txt /usr/share/wordlists/seclists/Discovery/Web-Content/raft-large-words-lowercase.txt
do
tput setaf 6; echo "--------------------------------------------------------------------------------------------------------------"
  echo "Scanning: " $f
  echo "Extensions: " $2
  if [ -z "$2" ]; then
    gobuster dir -q -f -k -e --url $1 --wordlist $f 2>/dev/null | tee -a -i Gobusterscan.txt
  else
    gobuster  dir -q -f -k -e --url $1 --wordlist $f -x $2 | tee -a -i GobusterExt_DUMP.txt
fi
done
date 2>/dev/null | tee -a -i Gobuster_DUMP.txt
date 2>/dev/null | tee -a -i GobusterExt_DUMP.txt
clear
cat Gobuster_DUMP.txt
cat GobusterExt_DUMP.txt
