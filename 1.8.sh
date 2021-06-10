#!/bin/bash

echo "Kubik random result"
echo
read -p "Please enter number of dice rolls:"  NumbThrows

#Counter of numbers results of each spot:
ones=0
twos=0
threes=0
fours=0
fives=0
sixes=0
#Result of throw
res=0

while [[ "$NumbThrows" -ne 0 ]]; do
    #statements
    NumbThrows=$(($NumbThrows-1))
    res=$(($RANDOM%6))
    res=$(($res+1))
    #echo $res
    #echo "Number of throws: $NumbThrows"
    #echo -e "\t\tResult $(($RANDOM%7))"

    case $res in
      1) ones=$(($ones+1)) ;;
      2) twos=$(($twos+1)) ;;
      3) threes=$(($threes+1)) ;;
      4) fours=$(($fours+1)) ;;
      5) fives=$(($fives+1)) ;;
      6) sixes=$(($sixes+1)) ;;
    esac
done
echo
echo "Количество выпадений костяшек:"
echo "единиц   =   $ones"
echo "двоек    =   $twos"
echo "троек    =   $threes"
echo "четверок =   $fours"
echo "пятерок  =   $fives"
echo "шестерок =   $sixes"
