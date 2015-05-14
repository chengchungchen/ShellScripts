#!/bin/bash
# This script is to used by create DB backup server.
# 1. backup the old DB data path.
# 2. mount the new DB data paht.

yum install -y rsync nfs-utils nfs-utils-lib wget

host=$(hostname | sed 's/.ccchen.com//g')
echo $host

DB_PATH=/var/lib/mysql
echo $DB_PATH

DB_PATH_OLD=$DB_PATH\_old
echo $DB_PATH_OLD

if [ ! -d $DB_PATH ]; then
	mkdir -p $DB_PATH
else
	mv $DB_PATH $DB_PATH_OLD
	mkdir -p $DB_PATH
	/bin/chown mysql:mysql $DB_PATH
	/bin/chmod 755 $DB_PATH
fi

/bin/mount -t nfs 10.1.199.186:/dpool1/DBbackup/mysql/VM_DB/$host $DB_PATH

#/usr/bin/rsync -av $DB_PATH_OLD/* $DB_PATH/

echo "/bin/mount -t nfs 10.1.199.186:/dpool1/DBbackup/mysql/VM_DB/$host $DB_PATH" >> /etc/rc.local
