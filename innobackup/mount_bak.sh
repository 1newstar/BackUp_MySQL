mkdir -p /data/bak
mount -t cifs -o username=admin,password=xxssdasd1 //192.168.100.205/MySQL_Bak/Car-MySQL5.6-IP10124 /data/bak
mkdir /data/bak/baklogs

#请将/etc/mtab最后一行 复制到/etc/fstab