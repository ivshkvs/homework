#!/bin/bash

# Start time
start_time=`date +%s`

# Command execute
$@

# End time
end_time=`date +%s`

# Execution time output
echo Execution time was `expr $end_time - $start_time` seconds
