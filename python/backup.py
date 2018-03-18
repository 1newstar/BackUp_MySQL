import subprocess
import os 
import time 
# cmd = "mysql --login-path=3109 -e 'select 1'"
HOST = '192.168.1.109'
PORT = '3109'
USER = 'backup'
PASSWORD = '123456'

backtype = input('请输入备份的方式：（mysqldump,mydumper）:')
if backtype == 'mysqldump':
	try:
		cmd = 'mysqldump --host={} --port={} --user={} --password={} -A --single-transaction --master-data=2 >/root/backup.sql.gz'.format(HOST,PORT,USER,PASSWORD)

		(status,backup) = subprocess.getstatusoutput(cmd)
		print('status:',status,'info:',backup)
		if status == 0:
			print('backup sucess')
		if status != 0:
			raise Exception
	except Exception:
		print('error! BACKUP FAILED')
elif backtype == 'mydumper':
	try:
		time_short = time.strftime('%Y%m%d%H%M%S',time.localtime())
		print(time_short)
		os.mkdir('/root/mydumper_py/{}'.format(time_short))
		print('create dir over')
		cmd = 'mydumper -h {} -P {} -u {} -p {} -c -t 4 -v 3 -e -G -R -o /root/mydumper_py/{}'.format(HOST,PORT,USER,PASSWORD,time_short)
		print(cmd)
		(status,output) = subprocess.getstatusoutput(cmd)
		if status == 0:
			print('backup sucess')
		if status != 0:
			raise Exception
	except Exception:
		print('error! BACK FAILED')
