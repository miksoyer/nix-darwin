#!/bin/sh

sketchybar --add item  ip_address right                              \
           --set       ip_address script="$PLUGIN_DIR/network.sh" \
                                  update_freq=30                     \
                                  padding_left=8                     \
                                  padding_right=2                    \
                                  background.border_width=0          \
                                  background.corner_radius=8         \
                                  background.height=24               \
                                  icon.highlight=on                  \
                                  label.highlight=on                 \
           --subscribe ip_address wifi_change                        \


sketchybar --add bracket status ip_address volume battery     \
           --set         status background.color=$BACKGROUND  \
                                background.border_color=$BLUE