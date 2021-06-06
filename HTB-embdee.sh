#!/bin/bash

#Obtaining the raw hash and creating the cookie:
hash=$(curl -c cookie.txt -s http://46.101.33.243:31775/ 0>&1  | awk '{print $6}' | awk NF | tr '><' ' ' | awk '{print $2}')

#Encrypting the hash with md5:
hash2=$(echo -n $hash | md5sum | tr '-' ' ' | tr -d " ")

#Sending the hash encrypted back:
curl -s -X POST -F "hash=$hash2" -b cookie.txt http://46.101.33.243:31775/ | grep "HTB" | awk '{print $7}' | tr '>* <*' ' ' | awk '{print $2}'

echo -e
echo -e "Raw hash = $hash\n"
echo -e "Encrypted hash = $hash2\n"
