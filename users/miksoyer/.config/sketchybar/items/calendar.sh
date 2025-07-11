#!/bin/sh



calendar=(
  icon=􀉉
  icon.color=0xfff38ba8 
  icon.padding_left=10
  icon.padding_right=8
  icon.y_offset=1
  label="$(LC_TIME=en_US.UTF-8 date '+%a %d %b 􀐫 %H:%M')"
  label.color=0xff4c4f69
  label.font.size="Maple Mono NF CN:Semibold:14"
  label.padding_right=12

  background.color=0xfffaf4ed
  background.height=28
  background.corner_radius=15
  background.border_width=2
  background.border_color=0xffd7827e

  padding_left=4
  padding_right=4

  script="$PLUGIN_DIR/calendar.sh"
  update_freq=60
  click_script="sketchybar --set calendar popup.drawing=toggle"
  popup.drawing=on
  popup.background.border_width=2
  popup.background.corner_radius=6
  popup.background.border_color=0xffd0d0d0
  popup.background.color=0xfffafafa     # 更亮一点 popup 背景
  popup.height=50
)


sketchybar --add item calendar right \
           --set calendar "${calendar[@]}"