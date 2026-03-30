#!/usr/bin/env bash

source "$HOME/.config/github/scripts/common.sh"

DATA=$(github_fetch)

COUNT=$(jq length <<< "$DATA")

if [ "$COUNT" -eq 0 ]; then
    CHOICE=$(echo "No notifications" | rofi -dmenu -p "Github")

    [ -z "$CHOICE" ] && exit 0

    xdg-open "https://github.com/notifications"
    exit 0
fi

MENU=$(jq -r '
  .[] |
  "\(.repository.full_name) [\(.reason)] - \(.subject.title)\t\(.subject.url)"
' <<< "$DATA")

CHOICE=$(cut -f1 <<< "$MENU" | rofi -dmenu -p "Github")

[ -z "$CHOICE" ] && exit 0

API_URL=$(grep -F "$CHOICE" <<< "$MENU" | cut -f2)

WEB_URL=$(sed -E '
  s#https://api.github.com/repos/#https://github.com/#;
  s#/pulls/#/pull/#;
' <<< "$API_URL")

xdg-open "$WEB_URL"
