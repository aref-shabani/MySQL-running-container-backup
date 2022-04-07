#!/bin/bash

# Put this script in cront directory(e.g., /etc/cron.weekly)
# This script removes  backup file in /var/DBack whick are older than  2 days ago


TODAY=$(date '+%Y%m%d')
DEL_DATE=$(date -d "2 days ago" "+%Y%m%d")
for file in /var/DBack/*.tar.gz
do
        fileDate=$(date -r $file "+%Y%m%d")
        if [ $fileDate -lt $DEL_DATE ]
        then
                rm -f $file
        fi
done
