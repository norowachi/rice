#!/bin/sh

CONFIG_FILE="$HOME/.config/hypr/custom/touchpad.conf"

enabled=$(grep -o "enabled\s*=\s*[01]" "$CONFIG_FILE")

if [ "$enabled" == 'enabled = 1' ];then
    sed -i "s/enabled\s*=\s*1/enabled = 0/" "$CONFIG_FILE"
    notify-send -t 1500 -i "$HOME/.icons/touchpad-off.svg" "Touchpad" "Disabled"
else
    sed -i "s/enabled\s*=\s*0/enabled = 1/" "$CONFIG_FILE"
    notify-send -t 1500 -i "$HOME/.icons/touchpad.svg" "Touchpad" "Enabled"
fi
