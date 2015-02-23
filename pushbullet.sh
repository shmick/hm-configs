#!/bin/sh
TYPE="Content-Type: application/json"
PB_KEY="Pushbullet_Access_Token"
PB_HOST="https://api.pushbullet.com/v2/pushes"
PB_MSG="{ \
\"type\": \"note\", \
\"title\": \"HM Alert: $pn: $pcurr\", \
\"body\": \"$pn Alert: Alarm $al_type outside threshold $al_thresh, currently $pcurr\" \
}"
curl -k -o /dev/null -s -H "$TYPE" -u "$PB_KEY": -d "$PB_MSG" $PB_HOST
