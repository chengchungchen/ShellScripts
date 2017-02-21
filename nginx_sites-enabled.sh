#!/bin/sh

BASEDIR=$(pwd)
FILE_LIST=$(mktemp)

ls -1 /etc/nginx/sites-available/ > ${FILE_LIST}

cd /etc/nginx/sites-enabled/

while read line
do
	ln -s ../sites-available/${line} ./${line}
done < ${FILE_LIST}

[ -f "${FILE_LIST}" ] && rm -f ${FILE_LIST}
