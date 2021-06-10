#!/bin/bash
#
# This script converts metre into miles.

read -p "Please enter distance in metres:"  metres

onemile=1855.3 #  Geographical mile

#Use bc utilites for float calculation
miles=$(bc<<<"scale=3; $metres /$onemile")

# Add leading zero into calculation result and push in stdout
# I know that this part of script looks like peace of shit
if [[ $(("$metres"/1855))  -eq 0 ]]; then
  #echo "Less then one"
  echo "Distance of $metres metres equal 0$miles geographical mile."
else
  #echo "More then one"
  echo -e "Distance of $metres metres equal $miles geographical mile."
fi
