#!/usr/bin/env bash

GITHUB_TOKEN_FILE="$HOME/.config/github/git.token"
GITHUB_API="https://api.github.com/notifications?all=false"

github_fetch() {
    local token
    token=$(tr -d '\n' < "$GITHUB_TOKEN_FILE")

    curl -s \
        -H "Authorization: Bearer $token" \
        -H "Accept: application/vnd.github+json" \
        "$GITHUB_API"
}
