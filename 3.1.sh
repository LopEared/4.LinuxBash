#!/bin/bash
# 3.1. Script display the most profitable exchange rate
# for USD-> BYR and EUR-> BYR conversion.
# "USD" or "EUR" as the input parameter

# Function definitions
USD_exc(){ #  Find USD exchange currency
  # Pump webpage
  wget -q https://myfin.by/currency/usd -O currency_$pagename
  # Search exchange currency
  cur=$(grep -e "USD" currency_$pagename |grep [0-9].[0-9] | uniq | head -1 |cut -d '"' -f 2 )
  # Erase file web-page
  rm currency_$pagename
  echo "The most profitable exchange rate to buy USD: $cur "
}
EUR_exc(){ #  Find EUR exchange currency
  # Pump webpage
  wget -q https://myfin.by/currency/usd -O currency_$pagename
  # Search exchange currency
  cur=$(grep -e "EUR" currency_$pagename |grep [0-9].[0-9] | uniq | head -1 |cut -d '"' -f 2 )
  # Erase file web-page
  rm currency_$pagename
  echo "The most profitable exchange rate to buy EUR: $cur "
}

# Start Script
pagename=$(date +%g%m%d_%H%M) # Make uniqe time #tag for saving webpage

echo -e "Please, select currency: \n\t\t\t1 - USD\n\t\t\t2 - EUR\n\t\t\t3 - Cancel"
while true; do
    read units
    case $units in
        1* ) USD_exc ; break ;;
        2* ) EUR_exc; break ;;
        3* ) break ;;
        * ) echo "Please, make your \"right\" choice";;
    esac
done
