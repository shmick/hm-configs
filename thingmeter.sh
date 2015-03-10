#!/bin/sh 

#field1 = set point 
#field2 = lid state 
#field3 = fan speed
#field4 = probe0 temp 
#field5 = probe1 temp
#field6 = probe2 temp 
#field7 = probe3 temp

stats=$(lmclient \
	| tr "{," "\n" \
	| grep -e set -e lid -e \"c\" \
	| awk -F: '{print $2}' \
	| sed 's/null/0/g')

# only let the lid be 0 or 100
lidstate=$(echo $stats | awk '{print $2}')
if [ "$lidstate" -gt "0" ]
then
stats=$(echo $stats | awk '$2 {$2=100; print}')
fi

n=1
json=$(echo "{"
	for i in $stats
	do echo "\"field$n\":$i,"
	n=$(( n+1 ))
	done
	echo "}") 

TYPE="Content-Type: application/json"
TOKEN="X-THINGSPEAKAPIKEY: XXXXXXXXXXXXXXXX"
URL="https://api.thingspeak.com/update.json"
PAYLOAD=$(echo $json | sed 's/, }/ }/g')

curl -k -m 40 -o /dev/null -s -H "$TYPE" -H "$TOKEN" -d "$PAYLOAD" "$URL"
