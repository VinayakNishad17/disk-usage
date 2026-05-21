#!/bin/bash

THRESHOLD=40
mailto="vn07244@gmail.com"
HOSTNAME=$(hostname)

# Clear temp file
> /tmp/temp

for path in $(/bin/df -h | grep -vE 'Filesystem|tmpfs' | awk '{print $5}' | sed 's/%//g')
do
    if [ $path -ge $THRESHOLD ]; then
        df -h | grep "$path%" >> /tmp/temp
    fi
done

VALUE=$(cat /tmp/temp | wc -l)

if [ $VALUE -ge 1 ]; then
    mail -s "$HOSTNAME disk usage is critical" $mailto < /tmp/temp
fi

# Remove temp file
#rm -f /tmp/temp
