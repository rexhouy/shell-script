#!/bin/bash
# Name:bakmysql.sh
# MySQL backup
#
backupdir=/home/rexhouy/workspace/mysqlbak
time=` date +%Y%m%d%H `
mysqldump -u root -p123 webstore_catering_development | gzip > $backupdir/webstore_catering_development/$time.sql.gz
mysqldump -u root -p123 webstore_development | gzip > $backupdir/webstore_development/$time.sql.gz
# Remove files before 5 days.
find $backupdir -name "*.sql.gz" -type f -mtime +5 -exec rm {} \; > /dev/null 2>&1
