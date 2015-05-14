#!/bin/bash
# If detect lost mount of S3, than remount it.
# "*/5 * * * * root /root/Script/ReMountS3.sh > /dev/null 2>&1"

#if [ -d /opt/game/images/ ]; then
if ! ls /opt/game/images/ccchenlogo.gif ; then
        /bin/umount /opt
        /usr/bin/s3fs ccchen-data /opt -o allow_other
fi

#/usr/bin/s3fs ccchen-data /opt -o allow_other
