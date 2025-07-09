#!/user/bin/env sh

PLUGIN_DIR="$HOME/.config/sketchybar/plugins"
ITEM_DIR="$HOME/.config/sketchybar/items"

sketchybar --add item volume right \
           --set volume script="$PLUGIN_DIR/volume.sh" \
           --subscribe volume volume_change \