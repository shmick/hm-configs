# Put your custom commands here that should be executed once
# the system init finished. By default this file does nothing.

TYPE="Content-Type: application/json"
PB_KEY="Pushbullet_Access_Token"
PB_HOST="https://api.pushbullet.com/v2/pushes"
PB_MSG="{ \
\"type\": \"note\", \
\"title\": \"HM Rebooted\", \
\"body\": \"HM Rebooted\" \
}"

sleep 30 && curl -k -o /dev/null -s -H "$TYPE" -u "$PB_KEY": -d "$PB_MSG" $PB_HOST

exit 0
