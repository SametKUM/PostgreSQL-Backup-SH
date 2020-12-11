#!/bin/bash
# Date/Time TAG
TODAY=`date +%d-%m-%Y_%H-%M.gz`
# Backup Filename
ARCHIVE=DB_NAME-$TODAY
# Backup create
# PostgreSQL can be installed on the server via the package manager, you can use the pg_dump command. 'su - postgres -c "pg_dump -U postgres AMZCAD | gzip > /mount/dbfiles/$ARCHIVE'
su - postgres -c "/usr/local/pgsql/bin/pg_dump -U postgres DB_NAME | gzip > /mount/dbfiles/$ARCHIVE"
#Delete files older than 20 days
find /mount/dbfiles/ -mtime +20 -delete