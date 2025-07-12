#!/usr/bin/env zsh

sketchybar --set "$NAME" icon="$($CONFIG_DIR/cache/get_icon.sh "$INFO")" icon.padding_right=5 \
           --set "$NAME".name label="$INFO"