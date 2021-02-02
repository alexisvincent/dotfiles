#!/usr/bin/env bash

windows="$(yabai -m query --spaces --space | jq '.windows')"

if [[ $windows == *","* ]]
then
	yabai -m config active_window_border_color 0xff746da8
else
	yabai -m config active_window_border_color 0xff444444
fi
