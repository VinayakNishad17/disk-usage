#!/bin/bash

LOG_DIR="/var/log"
DAYS=7

echo "Cleaning logs older than ${DAYS} days in ${LOG_DIR}"

find $LOG_DIR -name "*.log" -type f -mtime +$DAYS -exec rm -f {} \;

echo "Log cleanup completed."
