#!/bin/ksh

set -e

if [ $# -eq 0 ]; then
    echo "Usage: ${0##*/} FROM MESSAGE"
    exit 1
fi

. "$HOME"/.HipChat/credentials

from="$1"
shift
msg="$1"

base_uri="https://api.hipchat.com"
url="${base_uri}/v2/room/${roomid}/notification"

curl \
  -sS \
  -H "Authorization: Bearer $token" \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -X POST \
  --data-urlencode "from=$from" \
  --data-urlencode "color=yellow" \
  --data-urlencode "message_format=text" \
  --data-urlencode "notify=true" \
  --data-urlencode "message=$msg" \
  "$url"

exit 0
