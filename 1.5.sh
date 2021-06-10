#!/bin/bash
# This script outputs passed him all variables in stdout
# Used command  "shift"

count=1                          # Counter for the ordinal of arguments in stdout
while [ -n "$1" ]
do
echo "Parameter #$count = $1"
count=$(( $count + 1 ))
shift
done
echo "Output done!"
