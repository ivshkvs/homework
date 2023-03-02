#!/bin/bash

# Folder to backup
DIR_TO_BACKUP=$1

# Folder to save backups
DIR_WITH_BACKUPS=$2

# Backup max limit
MAX_BACKUPS=$3

# Archiving folder
tar -czf "${DIR_WITH_BACKUPS}/$(date +%Y-%m-%d_%H-%M-%S).tar.gz" $DIR_TO_BACKUP

# Checking the number of archive copies, if it exceeds MAX_BACKUPS then delete the oldest one
NUM_BACKUPS=$(ls -1 ${DIR_WITH_BACKUPS} | wc -l)
if [ $NUM_BACKUPS -gt $MAX_BACKUPS ];
 then
  OLDEST_BACKUP=$(ls -rt ${DIR_WITH_BACKUPS} | head -1)
  rm "${DIR_WITH_BACKUPS}/${OLDEST_BACKUP}"
fi
