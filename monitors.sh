!/bin/sh
if	lsmod | grep -q 'nouveau' && \
	lsusb | grep -q '17ef:100a'
then
	xrandr --setprovideroutputsource nouveau Intel
	xrandr --output LVDS1 --mode 1920x1080 --rate 60 --pos 0x120 \
	--output DP-1-2 --primary --mode 1920x1200 --rate 60 --pos 1920x0

else
	xrandr 	--output LVDS1 --primary --mode 1920x1080 --rate 60 --pos 0x0
fi
