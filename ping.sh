#!/bin/bash
var1=$(ping $1 -c 1 -W 3 | grep "64 bytes" | cut -d " " -f 6)
if [[ "$var1" -eq "ttl=63" ]]; then
echo "Host is LIVE! Most likely running: Linux OS"
elif [[ "$var1" -eq "ttl=64" ]]; then
echo "Host is LIVE! Most likely running: Linux OS"
elif [[ "$var1" -eq "ttl=127" ]]; then
echo "Host is LIVE! Most likely running: Windows OS"
elif [[ "$var1" -eq "ttl=128" ]]; then
echo "Host is LIVE! Most likely running: Windows OS"
elif [[ "$var1" -eq "ttl=31" ]]; then
echo "Host is LIVE! Most likely running: Windows 95 OS"
elif [[ "$var1" -eq "ttl=32" ]]; then
echo "Host is LIVE! Most likely running: Windows 95 OS"
elif [[ "$var1" -eq "ttl=255" ]]; then
echo "Host is LIVE! Most likely running: MAC / OPENBSD / CISCO / SOLARIS OS"
elif [[ "$var1" -eq "ttl=254" ]]; then
echo "Host is LIVE! Most likely running: MAC / OPENBSD / CISCO / SOLARIS OS"
elif [[ "$var1" == "" ]]; then
echo "Host appears to be DOWN!"
fi
