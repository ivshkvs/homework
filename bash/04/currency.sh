#!/bin/bash

# Getting HTML page with exchange rates
html=$(curl -s "https://myfin.by/bank/kursy_valjut_nbrb")

# Asking user select currency
echo "Select currency:"
echo "1) U.S.Dollar"
echo "2) Euro"
echo "3) Russian ruble"
echo "4) Ukrainian hryvnia"
echo "5) Polish zloty"
read choice

# Looking for exchange rates of chosen currency
case $choice in
    1) currency="Доллар США";;
    2) currency="Евро";;
    3) currency="Российский рубль";;
    4) currency="Гривна";;
    5) currency="Польский злотый";;
    *) echo "Wrong choise, exit"; exit 1;;
esac

rate=$(echo "$html" | grep -oP "(?<=$currency</a></td><td>)[^<]+")

# Display exchange rate of selected currency
echo "$currency = $rate"
