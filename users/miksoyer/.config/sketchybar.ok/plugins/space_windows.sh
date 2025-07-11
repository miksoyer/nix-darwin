#!/bin/sh


if [ "$SENDER" = "space_windows_change" ]; then
  space="$(echo "$INFO" | /run/current-system/sw/bin/jq -r '.space')"
  apps="$(echo "$INFO" | /run/current-system/sw/bin/jq -r '.apps | keys[]')"

  icon_strip=" "
  if [ "${apps}" != "" ]; then
    while read -r app
    do
      icon_strip+=" $(icon="$($HOME/.config/sketchybar/icons.sh "$app")"
    done <<< "${apps}"
  else
    icon_strip=" —"
  fi

  sketchybar --set space.$space label="$icon_strip"
fi