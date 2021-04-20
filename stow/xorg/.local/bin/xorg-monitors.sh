#!/bin/sh
if lspci -n | grep -q "10de:1c82"
then
	xrandr --output DVI-D-0 --primary --mode 1920x1200 --rate 60 --pos 0x0
else
	xrandr --output LVDS-1 --primary --mode 1920x1080 --rate 60 --pos 0x0
	if lsusb | grep -q "17e9:03e0"
	then
		xrandr --setprovideroutputsource 1 0
		xrandr --newmode "dlmode"  85.72  1368 1440 1584 1800  768 769 772 795  -HSync +Vsync
		xrandr --addmode DVI-I-1-1 "dlmode"
		xrandr --output DVI-I-1-1 --left-of LVDS-1 --mode "dlmode"
	fi
fi
