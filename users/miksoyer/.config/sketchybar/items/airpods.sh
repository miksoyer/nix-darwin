#!/bin/sh

airpods=(
  icon="􀪷 "
  padding_right=5
  padding_left=5
  label.drawing=on
  update_freq=300
  updates=on
)

sketchybar -m --add event bluetooth_change "com.apple.bluetooth.status" \
              --add item headphones right \
              --set headphones "${airpods[@]}" \
              script="$PLUGIN_DIR/airpods.sh" \
              --subscribe headphones bluetooth_change