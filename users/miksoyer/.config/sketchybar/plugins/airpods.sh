#!/usr/bin/env bash

DEVICES="$(system_profiler SPBluetoothDataType -json -detailLevel basic 2>/dev/null | jq -rc '.SPBluetoothDataType[0].device_connected[] | select ( .[] | .device_minorType == "Headphones")' 2> /dev/null | jq '.[]')"
if [ "$DEVICES" = "" ]; then
  sketchybar -m --set $NAME drawing=off
  sketchybar -m --set volume_icon drawing=on
else
  sketchybar -m --set $NAME  drawing=on
  sketchybar -m --set volume_icon drawing=off 
  left="$(echo $DEVICES | jq -r .device_batteryLevelLeft)"
  right="$(echo $DEVICES | jq -r .device_batteryLevelRight)"
  case="$(echo $DEVICES | jq -r .device_batteryLevelCase)"
  
  if [[ "$left" == "null"  ]]; then
    left="0"
  fi
  
  if [[ "$right" == "null" ]]; then
    right='0'
  fi
  
  if [[ "$case" == "null" ]]; then
    case=""
  fi
  
  sketchybar -m --set $NAME label="L:$left R:$right"
fi