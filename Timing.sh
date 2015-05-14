#!/bin/sh
# The time zone will reset to UTC when reboot vm of AWS.
# So we running this script in /etc/rc.local to fix this problem.

/bin/cp /usr/share/zoneinfo/Asia/Taipei /etc/localtime
/bin/date -u
/bin/date
#/usr/sbin/ntpdate -u time.stdtime.gov.tw
/usr/sbin/ntpdate -u 3.jp.pool.ntp.org
