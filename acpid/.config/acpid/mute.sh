#!/bin/sh
alias notify="dunstify -t 1000 -a System -r 11297"
pulsemixer --toggle-mute
if test "$(pulsemixer --get-mute)" = "1"
then
	notify "Sound" "mute"
else
	notify "Sound" "unmute"
fi
