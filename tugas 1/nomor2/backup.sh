#!/bin/bash

SOURCE_DIR="$HOME/data"
BACKUP_DIR="$HOME/backup"
MAX_FILES=10
INTERVAL=15  # detik
DURATION=$((60*60))  # 1 jam = 3600 detik
COUNT=0

end=$((SECONDS+DURATION))

while [ $SECONDS -lt $end ]; do
    FILE_INDEX=$(( (COUNT % MAX_FILES) + 1 ))
    TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
    tar -czf "$BACKUP_DIR/backup$FILE_INDEX.tar.gz" -C "$SOURCE_DIR" .
    echo "Backup ke-$FILE_INDEX selesai pada $TIMESTAMP"
    COUNT=$((COUNT+1))
    sleep $INTERVAL
done
