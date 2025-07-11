#!/bin/bash


front_chevron=(
  icon=􀑏
  icon.padding_left=10
  icon.padding_right=4
  icon.color=0xff181926
  icon.y_offset=1
  label=􀅂
  label.padding_right=8
)

front_app=(
  icon.padding_left=5
  icon.padding_right=5
  label.padding_right=10
  label.font="Maple Mono NF CN:Bold:15"
  script="$PLUGIN_DIR/front_item/front_app.sh"
)


front_item=(
  background.color=0xfff2f2f2
  background.border_color=0xffb4befe
  background.border_width=2
  background.drawing=on         
  background.height=30
)

sketchybar --add item front_chevron left \
           --set front_chevron "${front_chevron[@]}"\
           --add item front_app left \
           --set front_app "${front_app[@]}" \
           --subscribe front_app front_app_switched

sketchybar --add bracket front_item front_chevron front_app \
           --set front_item "${front_item[@]}"