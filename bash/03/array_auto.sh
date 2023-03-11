#!/bin/bash

# Set number of rows and columns
rows=4
columns=5

# Create random two-level array 
declare -A matrix
for ((i=0; i<$rows; i++))
do
  for ((j=0; j<$columns; j++))
  do
    matrix[$i,$j]=$((RANDOM % 10))
  done
done

# Output array as matrix
for ((i=0; i<$rows; i++))
do
  row=""
  for ((j=0; j<$columns; j++))
  do
    row+=" ${matrix[$i,$j]}"
  done
  echo "$row"
done
