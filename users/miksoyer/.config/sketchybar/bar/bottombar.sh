#!/bin/sh

ITEMS_DIR="$HOME/.config/sketchybar/items"
PLUGIN_DIR="$HOME/.config/sketchybar/plugins"

bar=(
  color=0xa0202227
  border_color=0xffcad3f5
  border_width=1
  position=bottom
  height=40
  margin=10
  padding_left=6
  padding_right=8
  notch_display_height=0  # 50
  notch_width=0           # 200
  notch_offset=0
  y_offset=0
  corner_radius=8
  blur_radius=30
  shadow=on
  sticky=on
  topmost=off
  display=all
  hidden=off
  font_smoothing=off
)

sketchybar --bar "${bar[@]}"

# left front_app
source "$ITEMS_DIR/front_item.sh"


source "$ITEMS_DIR/calendar.sh"
