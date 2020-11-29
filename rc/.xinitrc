#!/bin/sh
DOTFILES="$HOME/dotfiles"
export GTK_CSD=0
export LD_PRELOAD='/usr/lib/libgtk3-nocsd.so.0'
export XDG_CURRENT_DESKTOP="XFCE"
$DOTFILES/bin/monitors.sh
$DOTFILES/bin/bg.sh
dbus-run-session runsvdir ~/.local/service
