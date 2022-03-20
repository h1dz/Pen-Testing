#!/bin/bash
#Usage:       ./scrape2.sh <url>
curl $1 > dict.txt
html2dic dict.txt
