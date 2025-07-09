#!/user/bin/env sh

PLUGIN_DIR="$HOME/.config/sketchybar/plugins"
ITEM_DIR="$HOME/.config/sketchybar/items"

sketchybar --add item battery right \
           --set battery update_freq=120 script="$PLUGIN_DIR/battery.sh" \
           --subscribe battery system_woke power_source_change