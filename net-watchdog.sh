#!/bin/sh
# This should be located at:
# /mnt/mmcblk0p4/net-watchdog.sh

# crontab entry
#*/10 * * * *  /mnt/mmcblk0p4/net-watchdog.sh

LOG=/mnt/mmcblk0p4/net-watchdog.log

checkgw () {
ping_gw=$(netstat -nr | grep "UG" | awk '{print $2}' | xargs ping -q -w 1 -c 1 | grep "1 packets received")
result=$?
}

checkgw
if  [ "$result" -ge 1 ]
then
echo "$(date "+%Y-%m-%d %H:%M:%S") : Restarting network" >> $LOG
/etc/init.d/network reload
sleep 120
checkgw
    if [ "$result" -ge 1 ]
    then
    echo "$(date "+%Y-%m-%d %H:%M:%S") : Rebooting" >> $LOG
    /sbin/reboot
    fi
fi
