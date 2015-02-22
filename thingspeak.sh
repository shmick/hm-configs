#!/bin/sh
curl -q -k -d "api_key=MY_THINGSPEAK_TWITTER_API_KEY" -d "status=$pn Alert: Alarm $al_type outside threshold $al_thresh, currently $pcurr" https://api.thingspeak.com/apps/thingtweet/1/statuses/update
