#!/bin/sh
# This script is to remove binary log.

PurgeLog=$(mysql -e "show binary logs;" | grep mysql-bin | awk '{print $1}' | sort -r | head -n 5 | tail -n 1)
echo $PurgeLog

/sbin/mysql -e "purge binary logs to '$PurgeLog';"
