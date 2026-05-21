#!/bin/bash

MAILTO="vn07244@gmail.com"
HOSTNAME=$(hostname)

# Get overall disk usage of root partition
USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

echo "Current Disk Usage: $USAGE%"

if [ $USAGE -ge 90 ]; then
    STATUS="CRITICAL"

elif [ $USAGE -ge 80 ]; then
    STATUS="WARNING"

elif [ $USAGE -ge 50 ]; then
    STATUS="INFO"

else
    STATUS="NORMAL"
fi

MESSAGE="[$STATUS] Disk usage is currently at $USAGE% on $HOSTNAME"

echo $MESSAGE

# Send mail only if usage >= 50%
if [ $USAGE -ge 50 ]; then
    echo $MESSAGE | mail -s "$HOSTNAME Disk Alert" $MAILTO
fi
