#!/bin/bash
# Write condition for checking input data in stdin
#
if read -t 5 -p "Please enter something:"  var ; then       # Use key "-t" for 5 seconds waiting
  #statements
  echo -e "\nYou put $var."                                 # If command "read" true  - output entering data in stdout
else                                                        # In other case
  #statements
  echo -e "\nTime is over. You haven't entered anything."   # Write warning about finish time
fi
