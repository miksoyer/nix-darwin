#!/bin/sh

source "$HOME/.config/sketchybar/colors.sh"

PERCENTAGE="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
CHARGING="$(pmset -g batt | grep 'AC Power')"

sketchybar --set "${NAME}" icon.color=0xff989898

if [ "$PERCENTAGE" = "" ]; then
  exit 0
fi

if [[ ${CHARGING} != "" ]]; then
  case ${PERCENTAGE} in
    9[0-9]|100) ICON="􀛨" COLOR="$GREEN"
    ;;
    [6-8][0-9]) ICON="􀺸" COLOR="$YELLOW"
    ;;
    [3-5][0-9]) ICON="􀺶" COLOR="$ORANGE"
    ;;
    [1-2][0-9]) ICON="􀛩" COLOR="$RED"
    ;;
    *) ICON="􀛪" COLOR="$RED"
  esac

fi

case "${PERCENTAGE}" in
  9[0-9]|100) ICON="􀛨" COLOR="$GREEN"
  ;;
  [6-8][0-9]) ICON="􀺸" COLOR="$YELLOW"
  ;;
  [3-5][0-9]) ICON="􀺶" COLOR="$ORANGE"
  ;;
  [1-2][0-9]) ICON="􀛩" COLOR="$RED"
  ;;
  *) ICON="􀛪" COLOR="$RED"
esac

if [[ "$CHARGING" != "" ]]; then
  ICON="􀢋"
fi

# The item invoking this script (name $NAME) will get its icon and label
# updated with the current battery status
sketchybar --set "$NAME" icon="$ICON" icon.color="$COLOR" label="${PERCENTAGE}%" 