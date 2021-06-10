#!/bin/bash

# Waiting input from keyboard/determination of the number input characters/
# their propetries and type.
#
# Used command "case"
read -p "Please enter symbol:"  var      # Wait input variable from User and input in stdin
if [[ ${#var} -eq 1 ]]; then
  #statements
  echo -e "\n\033[32mYou entered one character!"
  case $var in
    [0-9] ) echo -e "\n\033[32mThis character is: Number " ;;
    [A-Z] ) echo -e "\n\033[32mThis character is: Uppercase character " ;;
    [a-z] ) echo -e "\n\033[32mThis character is: Lowercase character " ;;
    [а-я] ) echo -e "\n\033[32mThis character is: Russian character " ;;
    [А-Я] ) echo -e "\n\033[32mThis character is: Rusussian character " ;;
    [^0-9a-zА-Яа-яА-Я] ) echo -e "\n\033[32mThis is service character" ;;
  esac
else
  echo -e "\n\033[31mMistake! You entered more then one character!"
fi
