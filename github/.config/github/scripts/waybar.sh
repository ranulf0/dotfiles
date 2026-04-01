#!/usr/bin/env bash

source "$HOME/.config/github/scripts/common.sh"

DATA=$(github_fetch)

COUNT=$(echo "$DATA" | jq 'length')

if [ "$COUNT" -eq 0 ]; then
    exit 0
fi

TOOLTIP=$(echo "$DATA" | jq -r '
  .[] | "• \(.repository.full_name) [" + .reason + "]"
' | sed ':a;N;$!ba;s/\n/\\n/g')

echo "{\"text\": \"GIT $COUNT\", \"tooltip\": \"$TOOLTIP\"}"
