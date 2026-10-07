#!/usr/bin/env bash

GITHUB_TOKEN_FILE="$HOME/.config/github/git.token"
GITHUB_API="https://api.github.com/notifications?all=false"

github_fetch() {
    local token data

    [[ -r "$GITHUB_TOKEN_FILE" ]] || {
        echo '[]'
        return
    }

    token=$(tr -d '\r\n' < "$GITHUB_TOKEN_FILE")

    [[ -n "$token" ]] || {
        echo '[]'
        return
    }

    data=$(curl -fsS \
        --connect-timeout 3 \
        --max-time 8 \
        -H "Authorization: Bearer $token" \
        -H "Accept: application/vnd.github+json" \
        "$GITHUB_API" 2>/dev/null) || {
            echo '[]'
            return
        }

    # GitHub should return an array here.
    if ! jq -e 'type == "array"' >/dev/null 2>&1 <<< "$data"; then
        echo '[]'
        return
    fi

    printf '%s\n' "$data"
}
