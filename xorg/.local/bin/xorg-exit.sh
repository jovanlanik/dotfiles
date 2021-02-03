#/bin/sh
kill -HUP $(cat "$HOME/.cache/xorg-exit${DISPLAY}")
