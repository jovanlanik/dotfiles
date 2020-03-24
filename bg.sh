#!/bin/sh
mkdir -p ~/.cache/bg/
cd ~/.cache/bg/
hsetroot -fill ~/dotfiles/bg_gradient.png -write bg_gradient_output.png
size=$(hsetroot -root -full ./bg_gradient_output.png | cut -d '(' -f 2 | cut -d ')' -f 1 | tr -d ',)')
offset=$(xrandr | grep primary | tr ' ' '\n' | grep + | tr '+x' ' ' | cut -d ' ' -f 3,4)
~/dotfiles/bg_resize.py ~/dotfiles/bg_overlay.png $size $offset ./bg_overlay_output.png
hsetroot -root -full ./bg_gradient_output.png -full ./bg_overlay_output.png
