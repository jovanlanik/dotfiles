#!/bin/sh
DOTFILES="$HOME/dotfiles"
export GTK_CSD=0
export LD_PRELOAD='/usr/lib/libgtk3-nocsd.so.0'
# export GTK_OVERLAY_SCROLLING=0
$DOTFILES/bin/monitors.sh
$DOTFILES/bin/bg.sh
dbus-run-session runsvdir ~/.local/service
