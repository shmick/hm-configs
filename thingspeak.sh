#!/bin/sh
TS_KEY="api_key=MY_THINGSPEAK_TWITTER_API_KEY"
TS_MSG="status=$pn Alert: Alarm $al_type outside threshold $al_thresh, currently $pcurr"
TS_SRV="https://api.thingspeak.com/apps/thingtweet/1/statuses/update"
curl -q -k -d "$TS_KEY" -d "$TS_MSG" "$TS_SRV"
