#!/bin/bash

# It will create a directory called DBAck in /var if it doesn't exist. create backup(dump all your database) from your running MySQL container.
# compress your backup file to reduce storage capacity. At last it will remove backup file and keep the compress file


DATE=$(date +%Y%m%d)
[ -d /var/DBack ] && mkdir /var/DBack || docker exec CONTAINER_NAME /usr/bin/mysqldump -u root --password='PASSWORD' DATABASE_NAME > /var/DBack/$DATE.sql
tar -czvf /var/DBack/$DATE.tar.gz /var/DBack/$DATE.sql
if [ -f "/var/DBack/$DATE.tar.gz" ]
then
        rm -f /var/DBack/$DATE.sql
fi



