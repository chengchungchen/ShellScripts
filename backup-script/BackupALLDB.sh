#!/bin/bash
# This script is to backup ALL MySQL(-like) file

DATE=$(date +%Y%m%d-%H%M%S)
BACKUP_PATH="/backup/DB"
BACKUP_FILE="$BACKUP_PATH/ccchen_DB$DATE.sql.bz2"

if [ ! -d $BACKUP_PATH ]; then
    mkdir -p $BACKUP_PATH
fi

#starttime=$(date +%H%M%S)
#echo $starttime
#/usr/bin/mysqldump --default-character-set=utf8 --set-gtid-purged=OFF --opt --quick --all-databases --triggers --routines --events | /bin/bzip2 > $BACKUP_FILE 
/usr/bin/mysqldump --default-character-set=utf8 --set-gtid-purged=OFF --opt --quick --all-databases --triggers --routines --events | /bin/bzip2 > $BACKUP_FILE 
#endtime=$(date +H%M%S)
#echo $endtime

function rm_oldfile() {
    file=$1
    n=$2
    n1=$(ls -1 $file* | wc -l)
    n2=$(ls -1 $file* | tail -$n | wc -l)
    n3=$(expr $n1 - $n2)

    ls -1 $file* | head -n $n3 | xargs -n 1 rm -f
}

rm_oldfile $BACKUP_PATH/ 5
