#!/bin/bash
cd /home/kali/
sudo rm -rf Documents/ Videos/ Pictures/ Music/ Templates/ Public/
sudo mkdir Tools
sudo mkdir home
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
sudo apt-get install subfinder -y
sudo apt-get install neo4j -y
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
wget https://raw.githubusercontent.com/h1dz/Windows-Tools/master/SharpHound.ps1
git clone https://github.com/Ridter/noPac
git clone https://github.com/harshil-shah004/zerologon-CVE-2020-1472.git
wget https://raw.githubusercontent.com/fox-it/BloodHound.py/master/bloodhound.py; mv bloodhound.py bloodhound-python.py
wget https://raw.githubusercontent.com/61106960/adPEAS/main/adPEAS.ps1
cd /home/kali/Tools/web
git clone https://github.com/stamparm/DSSS.git; mv DSSS SQLi
git clone https://github.com/Tuhinshubhra/CMSeeK
wget https://raw.githubusercontent.com/SecureAuthCorp/impacket/master/examples/mssqlclient.py
git clone https://github.com/s0md3v/XSStrike
git clone https://github.com/dievus/msdorkdump.git
wget https://raw.githubusercontent.com/h1dz/Pen-Testing/Scripts/Wordlist.py  #web?
cd /home/kali/home/
wget https://raw.githubusercontent.com/h1dz/Pen-Testing/Scripts/NmapScan.sh; chmod +x nmapScan.sh
wget https://raw.githubusercontent.com/h1dz/Pen-Testing/Scripts/masscan.sh; chmod +x masscan.sh
wget https://raw.githubusercontent.com/h1dz/Pen-Testing/Scripts/Vhosts.sh; chmod +x vhosts.sh
wget https://raw.githubusercontent.com/h1dz/Pen-Testing/Scripts/gobuster.sh; chmod +x gobuster.sh; mv gobuster.sh go.sh
wget https://raw.githubusercontent.com/h1dz/Pen-Testing/Scripts/ping.sh; chmod +x ping.sh
wget https://raw.githubusercontent.com/h1dz/Pen-Testing/Scripts/smb3num.sh; chmod +x smb3num.sh
wget https://raw.githubusercontent.com/h1dz/Pen-Testing/Scripts/scrape.sh; chmod +x scrape.sh
wget https://raw.githubusercontent.com/h1dz/Pen-Testing/Scripts/dnsenum.sh; chmod +x dnsenum.sh
wget https://raw.githubusercontent.com/h1dz/Pen-Testing/Scripts/SubnetSweep.sh; chmod +x SubnetSweep.sh
wget https://raw.githubusercontent.com/h1dz/Pen-Testing/Scripts/SubnetNmapSweep.sh; chmod +x SubnetNmapSweep.sh
cd /home/kali/
tput setaf 5; echo "Manual Install: https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy64"
tput setaf 5; echo "Manual Install: https://github.com/carlospolop/PEASS-ng/releases/download/20220203/winPEASx64.exe"
tput setaf 5; echo "Manual Install: https://github.com/jpillora/chisel/releases/download/v1.7.3/chisel_1.7.3_linux_amd64.gz"
tput setaf 5; echo "Manual Install: https://github.com/jpillora/chisel/releases/download/v1.7.3/chisel_1.7.3_windows_amd64.gz"
tput setaf 5; echo "gunzip -d *.gz"
tput setaf 5; echo "Manual Install: https://github.com/ropnop/kerbrute/releases/download/v1.0.3/kerbrute_linux_amd64"
tput setaf 5; echo "mv kerbrute_linux_amd64 kerbrute; chmod +x kerbrute"
tput setaf 5; echo "Manual Install: https://github.com/h1dz/Windows-Tools/raw/master/mimikatz.exe"
tput setaf 5; echo "Manual Install: https://github.com/h1dz/Windows-Tools/raw/master/sharphound.exe"
tput setaf 5; echo "Manual Install: https://github.com/ohpe/juicy-potato/releases/download/v0.1/JuicyPotato.exe"
tput setaf 5; echo "Manual Install: https://github.com/antonioCoco/RoguePotato/releases/download/1.0/RoguePotato.zip"
tput setaf 5; echo "Manual Install: https://github.com/int0x33/nc.exe/raw/master/nc64.exe"
tput setaf 5; echo "Download Wallpaper: https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/e72f0c31-73e4-4a4c-a550-1bbec53d1629/d9ljjpq-79dc7f0f-6cd0-459d-9f86-fb5d286da4f3.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2U3MmYwYzMxLTczZTQtNGE0Yy1hNTUwLTFiYmVjNTNkMTYyOVwvZDlsampwcS03OWRjN2YwZi02Y2QwLTQ1OWQtOWY4Ni1mYjVkMjg2ZGE0ZjMuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.2wtQoOz65L45Vd0g_NqXVLNxK-3ZruP8181vmINxA0o"
tput setaf 3; echo "Updates Complete!"
