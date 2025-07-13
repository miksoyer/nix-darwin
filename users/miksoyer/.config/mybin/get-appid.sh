#!/bin/sh
osascript <<EOF
tell application "System Events"
  set appList to every process whose background only is false
  set output to {}
  repeat with proc in appList
    try
      set end of output to name of proc & " → " & bundle identifier of proc
    end try
  end repeat
  set AppleScript's text item delimiters to linefeed
  return output as text
end tell
EOF