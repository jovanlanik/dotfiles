!/bin/sh
if lspci -n | grep -q "1002:67df"
then
	xrandr --output DVI-D-0 --primary --mode 1920x1200 --rate 60 --pos 0x0
else
	xrandr --output LVDS1 --primary --mode 1920x1080 --rate 60 --pos 0x0
fi
