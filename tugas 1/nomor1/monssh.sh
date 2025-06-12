#!/bin/bash

# Nama file log hasil
LOG_FILE="hasil_ssh.log"

# Interval cek dalam detik
INTERVAL=10

echo "Mulai memonitor service ssh..." > $LOG_FILE

while true; do
    TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
    SERVICE_STATUS=$(systemctl is-active ssh)

    echo "$TIMESTAMP - Status SSH: $SERVICE_STATUS" >> $LOG_FILE

    if [ "$SERVICE_STATUS" != "active" ]; then
        echo "[$TIMESTAMP] ⚠️  SSH Service tidak aktif!" | tee -a $LOG_FILE
    fi

    sleep $INTERVAL
done
