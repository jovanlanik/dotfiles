#!/bin/bash
export GTK_CSD=0
export LD_PRELOAD='/usr/lib/libgtk3-nocsd.so.0'
xorg-monitors.sh
xorg-bg.sh
dbus-run-session runsvdir ~/.local/service
