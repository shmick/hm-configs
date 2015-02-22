# Put your custom commands here that should be executed once
# the system init finished. By default this file does nothing.

PB_KEY=""
PB_HOST="https://api.pushbullet.com/v2/pushes"
PB_MSG="{\"type\": \"note\", \"title\": \"HM Rebooted\", \"body\": \"HM Rebooted\"}"
sleep 30 && curl -k -o /dev/null -s -H "Content-Type: application/json" -u "$PB_KEY": -d "$PB_MSG" $PB_HOST

exit 0
