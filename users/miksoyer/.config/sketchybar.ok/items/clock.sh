#!/bin/sh

PLUGIN_DIR="$HOME/.config/sketchybar/plugins"

sketchybar --add item clock right \
           --set clock update_freq=10 icon=􀐫 script="$PLUGIN_DIR/clock.sh"