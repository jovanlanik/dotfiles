#!/bin/sh
mkdir -p "$HOME/.cache/bg"
cd "$HOME/.cache/bg" || exit 1
hsetroot -fill "$HOME/.local/share/bg/gradient.png" -write "gradient.out.png"
size=$(hsetroot -root -full "./gradient.out.png" | cut -d '(' -f 2 | cut -d ')' -f 1 | tr -d ',)')
offset=$(xrandr --current | grep primary | tr ' ' '\n' | grep + | tr '+x' ' ' | cut -d ' ' -f 3,4)
[ -z "$offset" ] && offset=$(xrandr | grep "connected" | tr ' ' '\n' | grep + | tr '+x' ' ' | cut -d ' ' -f 3,4)
xorg-bg-resize.py "$HOME/.local/share/bg/overlay.png" $size $offset "./overlay.out.png"
hsetroot -root -full "./gradient.out.png" -full "./overlay.out.png"
