#!/bin/sh
# This should be located at:
# /mnt/mmcblk0p4/net-watchdog.sh

# crontab entry
# */3 * * * *  /mnt/mmcblk0p4/net-watchdog.sh

test_host=$(netstat -nr | grep "UG" | awk '{ print $2}' | xargs ping -q -w 1 -c 1 | grep "received" | awk '{ print $4 }')
if [ "$test_host" == "0" ] || [ -z "$test_host" ] ;
then
/etc/init.d/network reload
sleep 60
test_host=$(netstat -nr | grep "UG" | awk '{ print $2}' | xargs ping -q -w 1 -c 1 | grep "received" | awk '{ print $4 }')
	if [ "$test_host" == "0" ] || [ -z "$test_host" ] ;
	then
	/sbin/reboot
	fi
fi
