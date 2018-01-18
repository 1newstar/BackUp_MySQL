#!/bin/sh
BAK_USER=bak
PASSWORD=123456
BIN_DIR=/usr/bin
BAK_DIR=/data/bak
PORT=3306
HOST=192.168.1.120
BAK_TIME=`date +%F%H%M`

#create back dir
mkdir $BAK_DIR/$BAK_TIME
#start backup
cd $BAK_DIR/$BAK_TIME
$BIN_DIR/mydumper -h $HOST -P $PORT -u $BAK_USER -p $PASSWORD -c   -t 4 -v 3 -e -G -E -R -o $BAK_DIR/$BAK_TIME
#clean backups which created 55 days before
find /data/bak -name 201* -user root -type d -ctime +55 -delete
