#!/bin/bash

echo "Enter the command to find out the time of execution"
read command

#Время начала выполнения команды
start=$(date +%s)

#Команда введенная пользователем для которой выполняется расчет
#Для простоты весь лог выполнения команды перенаправляется в "никуда"
$command > /dev/null 2>&1

#Время окончания выполнения команды
end=$(date +%s)

#Разница между началом выполнения и концом
result=$(( $end - $start ))
echo "Time execution is $result seconds"
