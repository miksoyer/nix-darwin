attr_wechat=(
  icon=":wechat:"
  icon.font="$FONT_ICON:Regular:16.0"
  icon.color=0xff1aad19
  label="-"
  update_freq=5
  script="$PLUGIN_DIR/message.sh"
  click_script="open -a Wechat"
)

attr_qq=(
  icon=":qq:"
  icon.font="$FONT_ICON:Regular:16.0"
  icon.color=0xfff38ba8
  label="-"
  update_freq=5
  script="$PLUGIN_DIR/message.sh"
  click_script="open -a QQ"
)

sketchybar  -m    --add       item      wechat        e                       \
                  --set                 wechat        "${attr_wechat[@]}"     \
                                                                              \
                  --add       item      qq            e                       \
                  --set                 qq            "${attr_qq[@]}"
