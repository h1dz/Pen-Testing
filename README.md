# Scripts
   
The following scripts are not final versions as of yet, but still work fine.
For the linux bash scripts you will need to make sure you run `chmod +x <script.sh>` first to make them executable.
  
## smb3num.sh
This bash script will enumerate SMB shares on port 445 and save results to a .txt file.   
-lists shares   
-share info     
-checks writeable shares 

## lin3num.sh *****CHANGING******
Use this to enumerate information on a linux machine to help discover vulnerabilities and information that could lead to root access.

## win3num.ps1 *****CHANGING******
Contains a basic script to enumerate information from a windows machine (non malicous).  
   
## IP3num.sh
Script to enumerate a url or IP.

## scrape.sh
Used to make a dictionary file for bruteforcing from sraping webpages using Cewl.

## url2dict.sh
Used to make a dictionary file for bruteforcing using a URL.  
-Usage:       `./url2dict.sh <url>`  
   
## ping.sh
Ping script to get a better idea what operating system the host is running and if it is up.  
-Usage:     `./ping.sh <ip>`
      
## PortScan.sh
Script for nmap/masscan that I regulary use to scan all ports as fast as possible. Will first output a quick scan result then proceed to do a full scan.  
-Usage:     `./PortScan.sh <ip>`
   
## gobuster.sh
Runs gobuster scans with different wordlists, will take a while to get through all of them. Just something you can run in the background. Change line 23 if your wordlists are in a different path than mine.   
-Usage      `./gobster.sh <ip>`  
            `./gobuster.sh <ip> <extensions>`
