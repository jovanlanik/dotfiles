#!/bin/sh
dir="$HOME/.cache/bg"
mkdir -p "$dir"
cd "$dir" || exit 1

[ "$(xrandr --query | grep -w connected | wc -l)" = '1' ] && arg='-root' || arg=''
hsetroot $arg -fill "$HOME/.local/share/bg/gradient.png" -write gradient.out.png

size=$(hsetroot -root -full gradient.out.png | grep -oE '[0-9]+, [0-9]+' | sed 1q)
offset=$(xrandr --query | grep -w primary | grep -oE '([0-9]+)x([0-9]+)\+([0-9]+)\+([0-9]+)' | tr 'x+' '\t')
[ "$offset" ] || offset=$(xrandr --query | grep -wm1 connected | grep -oE '([0-9]+)x([0-9]+)\+([0-9]+)\+([0-9]+)' | tr 'x+' '\t')
[ "$offset" ] || offset="0	0	0	0"

width=$(echo "$offset" | cut -f 3)
height=$(echo "$offset" | cut -f 4)

python3 <<EOF
import sys
import math
from PIL import Image
imIn = Image.open("$HOME/.local/share/bg/overlay.png")
imOut = Image.new(imIn.mode, ($size))
imOut.paste(imIn, ($width, $height, $width+imIn.width, $height+imIn.height))
imOut.save("./overlay.out.png", format='PNG')
EOF

hsetroot -root -full "./gradient.out.png" -full "./overlay.out.png" >/dev/null
