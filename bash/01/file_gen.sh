#!/bin/bash

# Main folder name
if [ $# -eq 1 ]; 
 then
  GEN_FOLDER=$1
 else
  echo "Usage: ./file_gen.sh <folder-name>"
  exit 1
fi

# Generation random number folders
NUM_DIRS=$((1 + RANDOM % 10))

# Create main folder
mkdir -p $GEN_FOLDER
cd $GEN_FOLDER

# Generate random files and folders
for i in $(seq 1 $NUM_DIRS); 
do
  DIR="dir$i"
  mkdir -p $DIR

  # Generate random number of files in folder
  NUM_FILES=$((1 + RANDOM % 10))
  for j in $(seq 1 $NUM_FILES); 
  do
    echo "file $j" > $DIR/file$j.txt
  done

  # Generate random number of subfolders
  NUM_SUBDIRS=$((1 + RANDOM % 10))
  for k in $(seq 1 $NUM_SUBDIRS); 
  do
    SUBDIR="$DIR/subdir$k"
    mkdir -p $SUBDIR

    # Generate random number of files in subfolder
    NUM_SUBFILES=$((1 + RANDOM % 10))
    for l in $(seq 1 $NUM_SUBFILES); 
    do
      echo "file $l" > $SUBDIR/file$l.txt
    done
  done
done
