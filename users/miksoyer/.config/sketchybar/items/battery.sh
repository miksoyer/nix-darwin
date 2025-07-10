#!/bin/sh

sketchybar --bar color=0x00000000 \
                 height=50        \
                 margin=0         \
                 y_offset=-4       \
                 padding_left=8   \
                 padding_right=8  

# Defaults

sketchybar --default padding_left=8                                \
                     padding_right=8                               \
                                                                   \
                     background.border_color=$MAUVE               \
                     background.border_width=2                     \
                     background.height=34                          \
                     background.corner_radius=12                   \
                                                                   \
                     icon.color=$GREEN                            \
                     icon.highlight_color=$BACKGROUND              \
                     icon.padding_left=6                           \
                     icon.padding_right=2                          \
                     icon.font="SF Pro:SemiBold:14.0" \
                                                                   \
                     label.color=$SKY                           \
                     label.highlight_color=$BACKGROUND             \
                     label.padding_left=2                          \
                     label.padding_right=6                         \
                     label.font="SF Pro:Semibold:13.0"



sketchybar --add item  battery right                                 \
           --set       battery script="$PLUGIN_DIR/battery.sh"       \
                               update_freq=120                       \
                               padding_left=2                        \
                               padding_right=8                       \
                               background.border_width=0             \
                               background.height=24                  \
           --subscribe battery system_woke power_source_change