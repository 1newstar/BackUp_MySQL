#!/bin/sh
BAK_USER=root
PASSWORD=sa123456
LOGIN_PATH=3306
BIN_DIR=/usr/local/mysql/bin
BIN_DIR=/usr/bin
BAK_DIR=/data/bak
BAK_TIME=`date +%F%H%M`

#start backup
$BIN_DIR/mysqldump --login-path=$LOGIN_PATH -A --single-transaction --master-data=2 |gzip cat ->$BAK_DIR/$BAK_TIME.sql.gz
