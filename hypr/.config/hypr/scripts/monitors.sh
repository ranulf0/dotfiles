#!/usr/bin/env bash

MODE="$1"

HDMI=$(hyprctl monitors all | awk '/HDMI-A-/{print $2; exit}')
INTERNAL=$(hyprctl monitors all | awk '/eDP|LVDS/ {print $2; exit}')

if [ "$MODE" = "internal" ]; then
    [ -n "$INTERNAL" ] && hyprctl keyword monitor "$INTERNAL,preferred,0x0,1"
    [ -n "$HDMI" ] && hyprctl keyword monitor "$HDMI,disable"
    exit 0
fi

if [ "$MODE" = "hdmi" ]; then
    if [ -n "$HDMI" ]; then
        hyprctl keyword monitor "$HDMI,preferred,0x0,1"
        hyprctl keyword monitor "$INTERNAL,disable"
    fi
    exit 0
fi

[ -n "$HDMI" ] && hyprctl keyword monitor "$HDMI,preferred,0x0,1"
[ -n "$INTERNAL" ] && hyprctl keyword monitor "$INTERNAL,preferred,0x0,1"
