#!/bin/bash
cd /home/kali/
sudo rm -rf Documents/ Videos/ Pictures/ Music/ Templates/ Public/
mkdir Tools
mkdir ctf
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install gedit -y
sudo apt-get install rlwrap -y
sudo gem install haiti-hash -y
sudo apt install fcrackzip -y
sudo apt-get install gobuster -y
sudo apt-get install evil-winrm -y
sudo apt-get install wpscan -y
sudo apt-get install nikto -y
sudo searchsploit -u
sudo nmap --script-updatedb
cd /usr/share/wordlists/
sudo wget -c https://github.com/danielmiessler/SecLists/archive/master.zip; sudo unzip SecList.zip -y; sudo rm -rf SecList.zip; sudo mv SecLists-master seclists
sudo gzip -d rockyou.txt.gz
cd /home/kali/Tools/
wget https://github.com/samratashok/nishang/blob/master/Gather/Invoke-Mimikatz.ps1
git clone https://github.com/stamparm/DSSS.git; mv DSSS SQLi
git clone https://github.com/Tuhinshubhra/CMSeeK
wget https://raw.githubusercontent.com/SecureAuthCorp/impacket/master/examples/mssqlclient.py
git clone https://github.com/s0md3v/XSStrike
git clone https://github.com/dievus/msdorkdump.git
wget https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh
wget https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh
git clone https://github.com/harshil-shah004/zerologon-CVE-2020-1472.git
wget https://github.com/secnigma/CVE-2021-3560-Polkit-Privilege-Esclation/blob/main/poc.sh; mv poc.sh polkitesc.sh
wget https://raw.githubusercontent.com/Arinerron/CVE-2022-0847-DirtyPipe-Exploit/main/exploit.c; mv exploit.c dirtypipe.c
wget https://raw.githubusercontent.com/FireFart/dirtycow/master/dirty.c; mv dirty.c dirtycow.c
tput setaf 5; echo "Manual Install: https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy64"
tput setaf 5; echo "Manual Install: https://github.com/carlospolop/PEASS-ng/releases/download/20220203/winPEASx64.exe"
tput setaf 5; echo "Manual Install: https://github.com/jpillora/chisel/releases/download/v1.7.3/chisel_1.7.3_linux_amd64.gz"
tput setaf 5; echo "Manual Install: https://github.com/jpillora/chisel/releases/download/v1.7.3/chisel_1.7.3_windows_amd64.gz"
cd /home/kali/ctf/
wget https://raw.githubusercontent.com/h1dz/Pen-Testing/Scripts/PortScan.sh; chmod +x PortScan.sh
wget https://raw.githubusercontent.com/h1dz/Pen-Testing/Scripts/Vhosts.sh; chmod +x Vhosts.sh
wget https://raw.githubusercontent.com/h1dz/Pen-Testing/Scripts/gobuster.sh; chmod +x gobuster.sh
wget https://raw.githubusercontent.com/h1dz/Pen-Testing/Scripts/ping.sh; chmod +x ping.sh
cd /home/kali/
tput setaf 3; echo "Update Complete"
