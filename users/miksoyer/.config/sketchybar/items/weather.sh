#!/bin/sh


#0xff181926
sketchybar --add item weather.moon q \
    --set weather.moon \
    background.color=0x667dc4e4 \
    background.padding_right=-1 \
    icon.color=$YELLOW \
    icon.font="$FONT_ICON:Bold:22.0" \
    icon.padding_left=4 \
    icon.padding_right=3 \
    label.drawing=off \
    --subscribe weather.moon mouse.clicked

sketchybar --add item weather q \
    --set weather \
    icon=$LOCATION \
    icon.color=0xfff5bde6 \
    icon.font="$FONT_ICON:Bold:15.0" \
    update_freq=1800 \
    script="$PLUGIN_DIR/weather.sh" \
    --subscribe weather system_woke