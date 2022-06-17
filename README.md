# Scripts
   
The following scripts are not final versions as of yet, but still work fine.
For the linux bash scripts you will need to make sure you run `chmod +x <script.sh>` first to make them executable.
Check wordlist paths to make sure they are the same as yours otherwise will result in a error.  
  
## smb3num.sh
This bash script will enumerate SMB shares on port 445 and save results to a .txt file.   
-lists shares   
-share info     
-checks writeable shares 

## Vhosts.sh  
Use this script to scan for virtual hosts with gobuster. Change the wordlist paths if different to mine.  
-Usage:       `./vhosts.sh <IP/Domain>`    

## scrape.sh
Used to make a dictionary file for bruteforcing from sraping webpages using Cewl.   
-Usage:       `./scrape.sh <IP/URL> <depth>`

## url2dict.sh
Used to make a dictionary file for bruteforcing using a URL.    
-Usage:       `./url2dict.sh <url>`  
   
## ping.sh
Ping script to get a better idea what operating system the host is running and if it is up, this is not 100%, just a close recommendation on what OS it probably is. I use it within an automation script when scanning an IP, have it run first so you can confirm the host is live.   
-Usage:     `./ping.sh <ip>`   
      
## NmapScan.sh
Script for nmap/masscan that I regulary use to scan all ports as fast as possible. Will first output a quick scan result then proceed to do a full scan.  
-Usage:     `./PortScan.sh <ip>`
   
## gobuster.sh
Runs gobuster scans with different wordlists, will take a while to get through all of them. Just something you can run in the background. Change line 23 if your wordlists are in a different path than mine.   
-Usage      `./gobster.sh <ip>`  
            `./gobuster.sh <ip> <extensions>`
           
## setup.sh  
Setup kali after a fresh install with the tools and scripts I use.  
   
## Wordlist.py
Creates 2 wordlists, one with Month + year (i.e May1980) and another with Season + Year (i.e Winter2020).  
-Usage     `python wordlist.py`   
   
## masscan.sh
Runs masscan scanning both TCP and UDP.   
-Usage     `./masscan.sh <IP>`   
   
## dnsenum.sh   
Runs many different commands with a large output to sift through for enumerating dns.   
-Usage     `sudo ./dnsenum.sh <RHOST> <domain>`   
  
