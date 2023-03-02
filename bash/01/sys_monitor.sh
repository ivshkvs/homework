#!/bin/bash

# Current user name
CURRENT_USER=$(whoami)

# Counting number of user processes
NUM_PROCESSES=$(ps -u $CURRENT_USER | wc -l)

# Print number of user processes
echo "Number of processes to user ($CURRENT_USER): $NUM_PROCESSES"

# Counting current processor load (%)
CPU_LOAD=$(top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}')

# Print current processor load
echo "Current CPU load: $CPU_LOAD %"

# Available RAM (Kb)
TOTAL_MEM=$(cat /proc/meminfo | grep MemTotal | awk '{print $2}')

# Convert to MB
TOTAL_MEM=$(echo "scale=0; $TOTAL_MEM / 1024" | bc -l)

# Print result
echo "Total available RAM: $TOTAL_MEM MB" 

# Set array of ports 
PORTS=(80 22 443)

# Execute netstat on each port and print result
for PORT in "${PORTS[@]}"
do
    COUNT=$(netstat -an | grep ":$PORT " | grep -c ESTABLISHED)
    echo "Port $PORT: $COUNT established connections"
done

# List of all disks
devices=$(lsblk -d -n -o NAME)

# Set a variable to store total disk size
totalsize=0

# Sizes of all disks in bytes
for device in $devices
do
    size=$(blockdev --getsize64 /dev/$device)
    totalsize=$((totalsize + size))
done

# Convert bytes to gigabytes
totalsizegb=$(echo "scale=2; $totalsize/1024/1024/1024" | bc)

# Print full size
echo "Total disk space: $totalsizegb GB"
