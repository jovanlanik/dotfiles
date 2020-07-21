#!/bin/sh
export GTK_CSD=0
export LD_PRELOAD='/usr/lib/libgtk3-nocsd.so.0'
export GTK_OVERLAY_SCROLLING=0
#~/dotfiles/monitors.sh
[ -r ~/.config/Xresources ] && xrdb -merge -I $HOME ~/.config/Xresources
i3
