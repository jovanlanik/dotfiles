#!/bin/sh
mkdir -p "$HOME/.cache/bg"
cd "$HOME/.cache/bg" || exit 1
hsetroot -fill "$HOME/.local/share/bg/gradient.png" -write "gradient.out.png"
size=$(hsetroot -root -full "./gradient.out.png" | cut -d '(' -f 2 | cut -d ')' -f 1)
offset=$(xrandr --current | grep primary | tr ' ' '\n' | grep + | tr '+x' ',' | cut -d ',' -f 3,4)
[ -z "$offset" ] && offset=$(xrandr | grep "connected" | tr ' ' '\n' | grep + | tr '+x' ',' | cut -d ',' -f 3,4)
python3 <<EOF
import sys
import math
from PIL import Image
imIn = Image.open("$HOME/.local/share/bg/overlay.png")
imOut = Image.new(imIn.mode, ($size))
imOut.paste(imIn, ($offset, $(echo "$offset" | cut -d ',' -f1)+imIn.width, $(echo "$offset" | cut -d ',' -f2)+imIn.height))
imOut.save("./overlay.out.png", format='PNG')
EOF
hsetroot -root -full "./gradient.out.png" -full "./overlay.out.png"
