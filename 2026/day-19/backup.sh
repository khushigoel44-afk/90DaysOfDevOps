#!/bin/bash

SOURCE_DIR="/home/khushi/my_website"
BACKUP_DIR="/home/khushi/backup"
RETENTION_DAYS=14
TIMESTAMP=$(date +'%Y-%m-%d_%H-%M-%S')
BACKUP_FILES="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

if [ ! -d "$SOURCE_DIR" ]; then
        echo "$SOURCE_DIR does not exist!"
        exit 1
fi

mkdir -p "$BACKUP_DIR"

echo "Starting the Backup for $SOURCE_DIR..."

tar -czf "$BACKUP_FILES" "$SOURCE_DIR"

if [ $? -eq 0 ]; then
        FILE_SIZE=$(du -sh "$BACKUP_FILES" | awk '{print $1}')
        echo "File size is: $FILE_SIZE"
        echo "Backup Done Successfully: $SOURCE_DIR"
else
        echo "Backup Failed due to some error!: $SOURCE_DIR"
        exit 1
fi


echo "Removing the Backup data older than $RETENTION_DAYS"

find "$BACKUP_DIR" -type f -name "backup_*.tar.gz" -mtime +"$RETENTION_DAYS" -exec rm {} \;


echo "Backup completed - created and deleted the ones older than $RETENTION_DAYS"