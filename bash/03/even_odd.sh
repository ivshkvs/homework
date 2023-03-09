#!/bin/bash

# Set numbers of files to create
n=10

# Create files and set names
for ((i=1; i<=$n; i++))
do
  touch "file_$i.txt"
done

# Add words inside files
for ((i=1; i<=$n; i++))
do
  if (($i % 2 == 0)); then
    echo "even" > "file_$i.txt"
  else
    echo "odd" > "file_$i.txt"
  fi
done
