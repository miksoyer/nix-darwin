#!/bin/sh

HOUR=$(date +%H) 

if [ "$HOUR" -ge 1 ] && [ "$HOUR" -lt 7 ]; then
  ICON_COLOR="0xfff6c177"
  LABEL_COLOR="0xffe0def4"
  BG_COLOR="0xff2a273f"
  BORDER_COLOR="0xff393552"
else
  ICON_COLOR="0xfff38ba8"
  LABEL_COLOR="0xff4c4f69"
  BG_COLOR="0xfffaf4ed"
  BORDER_COLOR="0xffd7827e"
fi


sketchybar --set $NAME \
  icon.color=$ICON_COLOR \
  label="$(LC_TIME=en_US.UTF-8 date '+%a • %d-%b 􀐫 %H:%M')" \
  label.color=$LABEL_COLOR \
  background.color=$BG_COLOR \
  background.border_color=$BORDER_COLOR