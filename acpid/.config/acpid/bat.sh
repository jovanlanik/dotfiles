#!/bin/sh
alias notify="dunstify -t 1000 -a System -r 11298"
BAT="NULL"
for f in $(ls /sys/class/power_supply/)
do
	if grep -q "Battery" "/sys/class/power_supply/$f/type"
	then
		BAT=$(cat "/sys/class/power_supply/$f/capacity")
		STA=$(cat "/sys/class/power_supply/$f/status")
		
	fi
done
notify "Power Management" "Battery is at $BAT% and $STA"
