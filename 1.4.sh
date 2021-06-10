#!/bin/bash

# This script return number of days passed since
# beginning of the year & time in seconds passed
# from start Unix-epoch
# Used "case-construction" for selecting tasks!
echo -e "\033[32mDo you wanna know: \nNumber of days passed since beginning of the year? - input: days \nNumber of seconds since beginning of Unix-epoch? - input: seconds"
read var
case $var in
    "days") echo "Number of days since beginning of the year: $(date +%j)" ;;
 "seconds") echo "Number of seconds since beginning of Unix-epoch: $(date +%s)" ;;
         *) echo "You input unknown command!"
esac
