#!/bin/sh

# Use this with the IFTTT "HeaterMeter alarm phone call" recipe
# https://ifttt.com/recipes/362149-heatermeter-alarm-phone-call

# Mode 1 = Always make a phone call - This is the default mode
# Mode 2 = Only make a phone call during specific hours
MODE="1"

# These are only used for Mode 2. Change them to whatever you'd like.
# The defaults are between hour 23 ( 11pm ) and hour 7 ( 7 am )
CALL_AFTER="23"
CALL_BEFORE="7"

# Set IF_TRIGGER to the "Event Name" you created at IFTTT when
# adding the recipe. It defaults to heatermeter
#
# Set the IF_KEY value your IFTTT Maker key found at 
# https://ifttt.com/maker

SendToIFTTT () {
IF_TRIGGER="heatermeter"
IF_KEY="XxXxXxXxXxXx"
IF_HOST="https://maker.ifttt.com/trigger/"
IF_MSG="{ \
\"value1\":\"$pn\",\"value2\":\"$al_thresh\",\"value3\":\"$pcurr\" \
}"
TYPE="Content-Type: application/json"
curl -k -o /dev/null -s -H "$TYPE" -d "$IF_MSG" ${IF_HOST}${IF_TRIGGER}/with/key/${IF_KEY}
}

case "$MODE" in
1) SendToIFTTT ;;
2) HOUR="$(date +%H)"
if [ "$HOUR" -ge "$CALL_AFTER" ] || [ "$HOUR" -lt "$CALL_BEFORE" ]
then
SendToIFTTT
fi
;;
esac
