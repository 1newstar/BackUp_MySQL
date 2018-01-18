BAK_USER=root
PASSWORD=mysql123
BIN_DIR=/usr/bin/
BAK_DIR=/data/bak
BAK_TIME=`date +%F-%H%M%S`

$BIN_DIR/innobackupex --user=$BAK_USER --password=$PASSWORD  --stream=xbstream .|gzip cat ->$BAK_DIR/$BAK_TIME.xb.gz 
