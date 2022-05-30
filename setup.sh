#!/bin/bash
cd /home/kali/
sudo rm -rf Documents/ Videos/ Pictures/ Music/ Templates/ Public/
sudo mkdir Tools
sudo mkdir ctf
sudo apt-get update -y 
sudo apt-get upgrade -y
sudo apt-get install gedit -y
sudo apt-get install rlwrap -y
sudo gem install haiti-hash -y
sudo apt-get install fcrackzip -y
sudo apt-get install gobuster -y
sudo apt-get install evil-winrm -y
sudo apt-get install wpscan -y
sudo apt-get install nikto -y
sudo apt-get install dirsearch -y
sudo apt-get install python3-pip -y
sudo apt-get install amap -y
sudo apt-get install docker.io -y
sudo apt-get install bloodhound -y
sudo searchsploit -u
sudo nmap --script-updatedb
sudo apt-get install golang -y
echo "export GOROOT=/usr/lib/go" >> /home/kali/.bashrc
echo "export GOPATH=$HOME/go" >> /home/kali/.bashrc
echo "export PATH=$GOPATH/bin:$GOROOT/bin:$PATH" >> /home/kali/.bashrc
echo "export GOROOT=/usr/lib/go" >> /home/kali/.zshrc
echo "export GOPATH=$HOME/go" >> /home/kali/.zshrc
echo "export PATH=$GOPATH/bin:$GOROOT/bin:$PATH" >> /home/kali/.zshrc
cd /usr/share/wordlists/
sudo wget -c https://github.com/danielmiessler/SecLists/archive/master.zip; sudo unzip SecList.zip -y; sudo rm -rf SecList.zip; sudo mv SecLists-master seclists
sudo gzip -d rockyou.txt.gz
cd /home/kali/Tools/
mkdir web
mkdir linux
mkdir windows
cd windows; mkdir AD
cd /home/kali/Tools/linux
wget https://raw.githubusercontent.com/Anon-Exploiter/SUID3NUM/master/suid3num.py --no-check-certificate && chmod 777 suid3num.py
wget https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh
wget https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh
wget https://github.com/secnigma/CVE-2021-3560-Polkit-Privilege-Esclation/blob/main/poc.sh; mv poc.sh polkit.sh
wget https://raw.githubusercontent.com/Arinerron/CVE-2022-0847-DirtyPipe-Exploit/main/exploit.c; mv exploit.c dirtypipe.c
wget https://raw.githubusercontent.com/FireFart/dirtycow/master/dirty.c; mv dirty.c dirtycow.c
wget https://raw.githubusercontent.com/diego-treitos/linux-smart-enumeration/master/lse.sh; mv lse.sh LinuxSmartEnum.sh
cd /home/kali/Tools/windows/AD
git clone https://github.com/Ridter/noPac
git clone https://github.com/harshil-shah004/zerologon-CVE-2020-1472.git
wget https://raw.githubusercontent.com/fox-it/BloodHound.py/master/bloodhound.py; mv bloodhound.py bloodhound-python.py
cd /home/kali/Tools/web
git clone https://github.com/stamparm/DSSS.git; mv DSSS SQLi
git clone https://github.com/Tuhinshubhra/CMSeeK
wget https://raw.githubusercontent.com/SecureAuthCorp/impacket/master/examples/mssqlclient.py
git clone https://github.com/s0md3v/XSStrike
git clone https://github.com/dievus/msdorkdump.git
wget https://raw.githubusercontent.com/h1dz/Pen-Testing/Scripts/Wordlist.py  #web?
cd /home/kali/ctf/
wget https://raw.githubusercontent.com/h1dz/Pen-Testing/Scripts/PortScan.sh; chmod +x PortScan.sh
wget https://raw.githubusercontent.com/h1dz/Pen-Testing/Scripts/Vhosts.sh; chmod +x Vhosts.sh
wget https://raw.githubusercontent.com/h1dz/Pen-Testing/Scripts/gobuster.sh; chmod +x gobuster.sh
wget https://raw.githubusercontent.com/h1dz/Pen-Testing/Scripts/ping.sh; chmod +x ping.sh
cd /home/kali/
tput setaf 5; echo "Manual Install: https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy64"
tput setaf 5; echo "Manual Install: https://github.com/carlospolop/PEASS-ng/releases/download/20220203/winPEASx64.exe"
tput setaf 5; echo "Manual Install: https://github.com/jpillora/chisel/releases/download/v1.7.3/chisel_1.7.3_linux_amd64.gz"
tput setaf 5; echo "Manual Install: https://github.com/jpillora/chisel/releases/download/v1.7.3/chisel_1.7.3_windows_amd64.gz"
tput setaf 5; echo "Manual Install: https://github.com/ropnop/kerbrute/releases/download/v1.0.3/kerbrute_linux_amd64"
echo "mv kerbrute_linux_amd64 kerbrute; chmod +x kerbrute"
tput setaf 5; echo "Manual Install: https://github.com/h1dz/Windows-Tools/raw/master/mimikatz.exe"
tput setaf 5; echo "Manual Install: https://github.com/h1dz/Windows-Tools/raw/master/sharphound.exe"
tput setaf 3; echo "Update Complete"
