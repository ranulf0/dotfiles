#!/usr/bin/env bash

source "$HOME/.config/github/scripts/common.sh"

DATA=$(github_fetch)
COUNT=$(jq 'length' <<< "$DATA")

if (( COUNT == 0 )); then
    printf '{"text":"","tooltip":""}\n'
    exit 0
fi

TOOLTIP=$(jq -r '
    .[] | "• \(.repository.full_name) [\(.reason)]"
' <<< "$DATA")

jq -cn \
    --arg text "GIT $COUNT" \
    --arg tooltip "$TOOLTIP" \
    '{text: $text, tooltip: $tooltip}'
