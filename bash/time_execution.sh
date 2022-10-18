#!/bin/bash

start=$(date +%s)

$1 > /dev/null
sleep 2

end=$(date +%s)

result=$(( $end - $start ))
echo "Time execution is $result seconds"
