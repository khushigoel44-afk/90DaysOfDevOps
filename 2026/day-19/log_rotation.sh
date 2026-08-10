#!/bin/bash

# This script file will compress all the files and will delete them after 7 days (No Conditions applied here!)
LOG_FILE="/home/khushi/log_test/app.log"
ARCHIVE_DIR="/home/khushi/log_test/archive"
RETENTION_DAYS=7
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
ARCHIVE_FILE="$ARCHIVE_DIR/app_$TIMESTAMP.gzip.gz"

mkdir -p "$ARCHIVE_DIR"

if [ ! -s "$LOG_FILE" ]; then 
    echo "File is either missing or empty"
    exit 0
fi

if [ "$RETENTION_DAYS" -gt 7 ]; then 
    echo "compressing log data greater than 7 days"
    cat "$LOG_FILE" | gzip > "$ARCHIVE_FILE"
fi

if [ $? -eq 0 ]; then 
    > "$LOG_FILE"
    echo "Log created successfully in $ARCHIVE_FILE!"
else 
    echo "Some Error Detected!"
    exit 1
fi

if [ "$RETENTION_DAYS" -gt 30 ]; then 
    echo "Deleting log data greater than 30 days"
    find "$ARCHIVE_DIR" -type f -name "app_*.gzip.gz" -mtime +"$RETENTION_DAYS" -exec rm {} \;
fi

echo "Logs rotation done successfully!"


# THis script will work as per the conditions provided in the Task-1
LOG_FILE="/home/khushi/log_test"

count=$(find "$LOG_FILE" -type f -name "*.log" -mtime +7 | wc -l)
if [ "$count" -gt 0 ]; then 
    echo "Files to be compressed: $count"
    find "$LOG_FILE" -type f -name "*.log" -mtime +7 -exec gzip {} \;
else 
    echo "No file is available to perform compress operation!"
fi

count_del=$(find "$LOG_FILE" -type f -name "*.gz" -mtime +30 | wc -l)
if [ "$count_del" -gt 0 ]; then 
    echo "Files to be deleted: $count_del"
    find "$LOG_FILE" -type f -name "*.gz" -mtime +30 -exec rm {} \;
else 
    echo "No file is available to perform deletion operation!"
fi