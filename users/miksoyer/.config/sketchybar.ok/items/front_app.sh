#!/bin/sh

PLUGIN_DIR="$HOME/.config/sketchybar/plugins"


parameters=(
  icon.font="sketchybar-app-font:Regular:16.0"
  label.font="SF Pro:SemiBold:16.0"
  script="$PLUGIN_DIR/front_app.sh"
  padding_left=10
  padding_right=10
)

sketchybar --add item front_app left \
           --set front_app "${parameters[@]}" \
           --subscribe front_app front_app_switched