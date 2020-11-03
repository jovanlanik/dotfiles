#!/bin/sh
if test $1 = "button/volumeup";
then
	pulsemixer --change-volume +10 --max-volume 100
else
	pulsemixer --change-volume -10
fi
dunstify -t 1000 -a System -r 11297 "Sound" "$(pulsemixer --get-volume | cut -d ' ' -f 1)% volume"
