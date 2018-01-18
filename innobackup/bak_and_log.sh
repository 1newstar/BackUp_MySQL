#/bin/sh
#write baklog|send backup result|clean 55days before backup

bakname=`date +%F%H%M%S`
#echo $bakname

sh /dbatools/innobak.sh>/data/bak/baklogs/$bakname.log 2>&1 

#send mail 
tail -n 10 /data/bak/baklogs/$bakname.log|mail -s "Bak Result" zrz@cheok.com 

#clear 50 days before backups
find /data/bak -name 201* -user root -type f -ctime +55 -delete
