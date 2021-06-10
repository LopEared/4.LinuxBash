#!/bin/bash

echo "Hello. This script should determine: User or Root start scripst"
read -p "Please enter the script-name:"  script
echo "You input $script!"

answer_cool= ps -ef | grep $script | cut -d ' ' -f 1 | uniq # >> otvet.txt

if [ "$answer_cool" == "root" ]
  then
    echo "Root start script"
  else
    echo "User start script"
fi
