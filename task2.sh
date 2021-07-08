
#!/bin/bash

#this script make dump of DB 

#DB name
db="moodle"

#db username
dbuser=$MYSQL_MOODLE_USER

#db user password
dbpass=$MYSQL_MOODLE_USER_PASS

#dir where save backup
destination="/home/misha/"

curdatetime=`date +%d%m%Y_%H%M`

#backup file name = dbname_currentdate
filename=$db"_"$curdatetime".sql"

#check if mysql is running
mysql=`service mysql status | grep running`

if [[ ${#mysql} == 0 ]];
then
	echo "MySQL not runnig"
	exit -1
fi

#creating backup
mysqldump -u$dbuser $dbpass $db > $destination$filename

echo "SUCCESS! Backup created!"
