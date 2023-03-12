#!/bin/bash

url="https://www.atlassian.com/continuous-delivery/continuous-integration"
search="continuous integration"
replace="ci!"

count_1=$(wget -qO- "$url" | sed -e 's/'"$search"'/'"$replace"'/g' | grep -o "$replace" | wc -l)

count_2=$(curl -s "$url" | sed -e 's/'"$search"'/'"$replace"'/g' | awk -v RS="$replace" 'END{print NR-1}')

count_3=$(curl -s "$url" | sed -e 's/'"$search"'/'"$replace"'/g' | sed -e 's/<[^>]*>//g' | grep -o "$replace" | wc -l)

echo "Phrase '$search' founded and replaced by GREP - $count_1 times, by AWK - $count_2 times, by SED - $count_3 times"
