#!/bin/sh 
#===============================================================================
#
#          FILE: change_dns.sh
# 
#         USAGE: ./change_dns.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Cheng-Cheng Chen
#  ORGANIZATION: 
#       CREATED: 02/20/2017 11:48
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

function change_dns() {
    #${1}: old dns server
    #${2}: dns record file
    cp ${2} ${2}_bak
    ## Old bash (e.g. FreeBSD8.x) can not use -i parameter 
    #sed -i "s/${1}/168.95.1.1/g" ${2}
    sed "s/${1}/168.95.1.1/g" ${2} > tmp
    mv tmp ${2}
}

DNS_RECORD='/etc/resolv.conf /etc/network/interfaces /etc/sysconfig/network-scripts/ifcfg-em1 /etc/sysconfig/network-scripts/ifcfg-em2 /etc/sysconfig/network-scripts/ifcfg-eth0 /etc/sysconfig/network-scripts/ifcfg-eth1'
for file in ${DNS_RECORD}
do
    if [ -f "${file}" ]; then
        DNS_SER=$(egrep '192.168.0.1|192.168.1.1' ${file})
        if [ -n "${DNS_SER}" ]; then
            if [[ "${DNS_SER}" =~ '192.168.0.1' ]]; then
                change_dns 192.168.0.1 ${file}
            else
                change_dns 192.168.1.1 ${file}
            fi
        fi
    fi
done
