#!/bin/bash

#Условия бэкапирования

echo "Which file or folder do you need to backup?"
read name

echo "Where to save this backup?"
read path

echo "How many copies do you want to keep?"
read number

#Проверка существует ли запрашиваемая директория для создания бэкапа, если нет - её создание
#Команда "cd $path" используется для того, чтобы архиватор zip создавал бэкап в заданной директории
#Альтернативного решения не нашел
 
if [[ !(-e $path) ]]
then
mkdir $path
cd $path
else 
cd $path
fi 

#Создание переменных для подсчета файлов(без директорий) и дальнейшего удаления лишних бэкапов

file_count=$(find $path -maxdepth 1 -type f | wc -l)
file_depth=$(($number+1))
file_clear=$(ls -1t | tail -n +$file_depth | xargs rm -f)

#Сравнение текущего количества файлов в директории с желаемым количеством бэкапов
#Удаление лишних(наиболее старых)

if [[ $file_count -gt $number ]]
then
cd $path
$file_clear
else
:
fi

#Создание короткого имени бэкапа на основании текущего системного времени

name_date=$(date +"%T")
zip $name_date $name
echo "Backup complete!"
