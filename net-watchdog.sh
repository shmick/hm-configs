#!/bin/sh
# This should be located at:
# /mnt/mmcblk0p4/net-watchdog.sh

# crontab entry
#*/10 * * * *  /mnt/mmcblk0p4/net-watchdog.sh

test_host=$(netstat -nr | grep "UG" | awk '{print $2}' | xargs ping -q -w 1 -c 1 | grep "received" | awk '{print $4}')
if [ "$test_host" == "0" ] || [ -z "$test_host" ] ;
then
logger -p user.alert "Restarting network"
/etc/init.d/network reload
sleep 120
test_host=$(netstat -nr | grep "UG" | awk '{print $2}' | xargs ping -q -w 1 -c 1 | grep "received" | awk '{print $4}')
	if [ "$test_host" == "0" ] || [ -z "$test_host" ] ;
	then
	logger -p user.alert "Rebooting"
	/sbin/reboot
	fi
fi
