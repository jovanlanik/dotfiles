#!/bin/sh
timeout=1000
eval "$(wpa_cli status | grep '=')"
if [ "$wpa_state" = "INTERFACE_DISABLED" ]
then
	message="Disabled"
elif [ "$wpa_state" = "COMPLETED" ]
then
	message="Connected to $ssid"
elif [ "$wpa_state" = "DISCONNECTED" ]
then
	message="Disconnected"
elif [ "$wpa_state" = "SCANNING" ]
then
	message="Scanning...\n$(wpa_cli scan_results | awk '{if(NF == 5) printf("  %s\n", $NF)}')"
	timeout=5000
else
	message="$wpa_state"
	timeout=2000
fi
dunstify -t "$timeout" -a System -r 11298 "Wifi" "$message"
