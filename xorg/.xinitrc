#!/bin/bash
export GTK_CSD=0
export LD_PRELOAD='/usr/lib/libgtk3-nocsd.so.0'
xorg-monitors.sh
xorg-bg.sh

services="$HOME/.local/service"
svdir="$HOME/.cache/xorg-service${DISPLAY}"
exitfile="$HOME/.cache/xorg-exit${DISPLAY}"
mkdir -p "$svdir"
for i in $(ls "$services")
do
	mkdir "$svdir/$i"
	(
		cd "$services" || exit
		stow -t "$svdir/$i" "$i"
	)
done
dbus-run-session runsvdir "$svdir" &
last_pid="$!"
pgrep -P "$last_pid" runsvdir > "$exitfile"
wait "$last_pid"
rm -f "$exitfile"
rm -rf "$svdir"
