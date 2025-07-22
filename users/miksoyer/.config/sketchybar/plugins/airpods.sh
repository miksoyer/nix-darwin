#!/bin/sh

set -euo pipefail

# 获取连接的蓝牙耳机设备（类型为 Headphones）
DEVICE_INFO="$(system_profiler SPBluetoothDataType -json -detailLevel basic 2>/dev/null |
  jq -rc '.SPBluetoothDataType[0].device_connected[] | 
          select( .[] | .device_minorType == "Headphones") |
          .[]')"

# 没有耳机连接时，隐藏电量图标，显示默认音量图标
if [ -z "$DEVICE_INFO" ]; then
  sketchybar -m \
    --set "$NAME" drawing=off \
    --set volume_icon drawing=on
  exit 0
fi


battery_left="$(echo "$DEVICE_INFO" | jq -r '.device_batteryLevelLeft // empty')"
battery_right="$(echo "$DEVICE_INFO" | jq -r '.device_batteryLevelRight // empty')"
battery_case="$(echo "$DEVICE_INFO" | jq -r '.device_batteryLevelCase // empty')"

# 设置 icon，默认是 AirPods（左右都有电量）
icon="􀪷"
[ -z "$battery_left" ] && icon="􀲍"
[ -z "$battery_right" ] && icon="􀲎"

# 拼接 label，空电量会被跳过
label="->$battery_left $battery_right"
[ -n "$battery_case" ] && label="$label 􀹬$battery_case"

# 最终设置图标和文本
sketchybar -m --set volume_icon   drawing=off \
              --set "$NAME"       drawing=on icon="$icon" label="$label"