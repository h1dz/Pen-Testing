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
Contains a basic script to enumerate information from a windows machine (non malicous). The output is in a file called 0.txt that is base64 encoded.
Remove code line 132,133,136 if you dont want the file encoded. The output file will be called 1.txt.
   
## IP3num.sh
Script to enumerate a url or IP.

## scrape.sh
Used to make a dictionary file for bruteforcing from sraping webpages using Cewl.

## url2dict.sh
Used to make a dictionary file for bruteforcing using a URL.  
-Usage:       `./url2dict.sh <url>`  

## searchsploitLAZY.sh
Simple script if you are lazy, instead of having to type searchsploit <service> <version>, it just shorthands searchsploit to the letter s.   
-Rename to s    
-Usage: `./s <service> <version>`   
   OR  
Just add the following to your aliases:     `alias s='searchsploit'`
   
## ping.sh
Ping script to get a better idea what operating system the host is running and if it is up  
-Usage:     `./ping.sh <ip>`
      
## nmap.sh
Script for nmap that I regulary use, will first scan for top 100 ports, followed by a full TCP port scan. Next will scan top UDP ports, followed by a full UPD port scan.  
-Usage:     `./nmap.sh <ip>`
   
## gobuster.sh
Runs gobuster scans with different wordlists, will take a while to get through all of them. Just something you can run in the background.  
-Usage      `./gubster.sh <ip>`
