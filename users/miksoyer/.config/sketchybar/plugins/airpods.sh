#!/bin/sh

DEVICES="$(system_profiler SPBluetoothDataType -json -detailLevel basic 2>/dev/null | jq -rc '.SPBluetoothDataType[0].device_connected[] | select ( .[] | .device_minorType == "Headphones")' 2> /dev/null | jq '.[]')"
if [ "$DEVICES" = "" ]; then
  sketchybar -m --set $NAME drawing=off
  sketchybar -m --set volume_icon drawing=on
else
  sketchybar -m --set $NAME  drawing=on
  sketchybar -m --set volume_icon drawing=off 

  icon="􀪷"
  
  left="$(echo $DEVICES | jq -r .device_batteryLevelLeft)"
  [ "$left" == "null" ] && left="" && icon="􀲍"
  
  right="$(echo $DEVICES | jq -r .device_batteryLevelRight)"
  [ "$right" == "null" ] && right="" && icon="􀲎"
  
  case="$(echo $DEVICES | jq -r .device_batteryLevelCase)"
  [ "$case" == "null" ] && case="" || case="􀹬$case"
  
  label="->$left $right $case" 
  
  sketchybar -m --set $NAME icon="$icon" label="$label" 
fi