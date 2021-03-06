#!/bin/sh
export SVDIR="$XRUNIT_SESSION/service"
echo 'Launcher	launchar'
echo 'Terminal	terminal'
echo
for i in $(ls "$SVDIR")
do
	status=$(sv status "$i" | cut -d ':' -f 1)
	[ "$status" = 'down' ] && action='start' || action='stop'
	echo "IMG:$HOME/.local/share/xmenu/${status}.png\t$i ($status)	SVDIR=$SVDIR sv $action $i"
done
echo '\nLogout	xrunit-exit'
