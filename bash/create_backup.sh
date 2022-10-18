#!/bin/bash

user=`whoami`
name=$1
path=$2
number=$3

#search / create requested directory
if [[ !(-e $path) ]]
then
 mkdir $path
else 
 cd $path
fi 

#deleting extra files
file_count=$(find $path -maxdepth 1 -type f | wc -l)
file_depth=$(($number))
file_clear=$(ls -1t | tail -n +$file_depth | xargs rm -f)

if [[ $file_count -gt $number ]]
then
 cd $path
 $file_clear
fi

#archive naming based on username and system time
name_date="${user}_$(date +"date_%d_%m_%Y"_time_%H_%M).tgz"
tar -zcf $name_date $name
echo "Backup complete"