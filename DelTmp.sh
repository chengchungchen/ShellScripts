#!/bin/bash
# This script is to delete tmp file that producted by last mouth at /tmp
# /root/BackupScript/DelTmp.txt

DATE=$(date +%b)

function rm_oldfile() {
        file=$1
        n1=$(ls -1 -l -t -r $file* | wc -l)
        echo $n1
        n2=$(ls -l -1 -t -r $file* | grep $DATE | wc -l)
        echo $n2
        n3=$(expr $n1 - $n2)
        echo $n3

        ls -1 -t -r $file* | head -n $n3 | awk '{ print $1 }' > DelFileList.txt
	# Somthing file name is like "123 abc", have empty characters.
	# So use awk to print first word to file, than use loop to delete it.
        while read line
        do
                rm $line*
        done < DelFileList.txt
}

rm_oldfile  /tmp/
rm_oldfile  /tmp/world/uploads/
