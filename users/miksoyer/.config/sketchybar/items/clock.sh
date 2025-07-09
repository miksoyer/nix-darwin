#!/user/bin/env sh

PLUGIN_DIR="$HOME/.config/sketchybar/plugins"
ITEM_DIR="$HOME/.config/sketchybar/items"

sketchybar --add item clock right \
           --set clock update_freq=10 icon=  script="$PLUGIN_DIR/clock.sh"