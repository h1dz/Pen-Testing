# Scripts
   
The following scripts are not final versions yet, but still work fine.
  
## smb3num.sh
This bash script will enumerate SMB shares on port 135/445 and save results to a .txt file.   
-lists shares   
-share info   
-crackmap   
-checks writeable shares 

## lin3num.sh
Use this to enumerate information on a linux machine to help discover vulnerabilities that lead to root access.

## winenum.ps1
Contains a basic script to enumerate information from a windows machine (non malicous). The output is in a file called 0.txt that is base64 encoded.
Remove code line 132,133,136 if you dont want the file encoded. The output file will be called 1.txt.
   
## web3num.sh
Script to enumerate a url or IP.

## scrape.sh
Used to make a dictionary file for bruteforcing from sraping webpages using Cewl.

## searchsploitLAZY.sh
Simple script if you are lazy, instead of having to type searchsploit <service> <version>, it just shorthands searchsploit to the letter s.   
-Rename to s    
-Usage: ./s <service> <version>   
