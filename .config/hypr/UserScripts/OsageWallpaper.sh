#!/bin/bash

wallpapers="$HOME/Pictures/osagepapers"
SCRIPTSDIR="$HOME/.config/hypr/send/scripts"

lasttrack=""
FPS=60
TYPE="any"
DURATION=2
BEZIER=".43,1.19,1,.4"
SWWW_PARAMS="--transition-fps $FPS --transition-type $TYPE --transition-duration $DURATION --transition-bezier $BEZIER"

while true; do

  title=$(playerctl metadata title)

  if [[ -z "$title" ]]; then
    sleep 1
    continue
  fi
  if [[ "$title" != "$lasttrack" ]]; then
    filename="${title}.jpg"
    path="$wallpapers/$filename"
    if [[ "${title:0:6}" == "[lofi]" ]]; then
      path="$wallpapers/lofi/${title:6:-4}.jpg"
    fi
    echo "$path"
    if [[ -f "$path" ]]; then
      monitors=$(hyprctl monitors | awk '/Monitor/ {print $2}')

      for monitor in $monitors; do
        swww img -o "$monitor" "$path" $SWWW_PARAMS
      done
      cp -r "$path" "$HOME/.config/hypr/wallpaper_effects/.wallpaper_current"
      sleep 2

    fi
    lasttrack="$title"
  fi
  sleep 2
done
