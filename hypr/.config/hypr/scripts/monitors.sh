#!/usr/bin/env bash

MODE="$1"

EXTERNAL=$(hyprctl monitors all | awk '/HDMI-A-/{print $2; exit}')
INTERNAL=$(hyprctl monitors all | awk '/eDP|LVDS/ {print $2; exit}')

if [ "$MODE" = "internal" ]; then
    [ -n "$INTERNAL" ] && hyprctl keyword monitor "$INTERNAL,preferred,0x0,1"
    [ -n "$EXTERNAL" ] && hyprctl keyword monitor "$EXTERNAL,disable"
    exit 0
fi

if [ "$MODE" = "external" ]; then
    if [ -n "$EXTERNAL" ]; then
        hyprctl keyword monitor "$EXTERNAL,preferred,0x0,1"
        hyprctl keyword monitor "$INTERNAL,disable"
    else
        hyprctl keyword monitor "$INTERNAL,preferred,0x0,1"
    fi
    exit 0
fi

[ -n "$EXTERNAL" ] && hyprctl keyword monitor "$EXTERNAL,preferred,0x0,1"
[ -n "$INTERNAL" ] && hyprctl keyword monitor "$INTERNAL,preferred,0x0,1"
