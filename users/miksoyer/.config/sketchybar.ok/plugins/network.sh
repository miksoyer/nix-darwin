#!/bin/sh

source "$HOME/.config/sketchybar/colors.sh"

IP_ADDRESS=$(scutil --nwi | /run/current-system/sw/bin/rg address | sed 's/.*://' | tr -d ' ' | head -1)
IS_VPN=$(scutil --nwi | /run/current-system/sw/bin/rg -m1 'utun' | awk '{ print $1 }')

if [[ $IS_VPN != "" ]]; then
	COLOR=$TEAL
	ICON=􀤆
	LABEL="VPN"
elif [[ $IP_ADDRESS != "" ]]; then
	COLOR=$ROSEWATER
	ICON=􀙇
	LABEL=$IP_ADDRESS
else
	COLOR=$FLAMINGO
	ICON=􀙈
	LABEL="Not Connected"
fi

sketchybar --set $NAME background.color=$COLOR \
	icon=$ICON \
	label="$LABEL"