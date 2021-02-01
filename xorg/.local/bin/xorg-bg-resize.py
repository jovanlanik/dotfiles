#!/usr/bin/env python3
import sys
import math
from PIL import Image
imIn = Image.open(sys.argv[1])
imOut = Image.new(imIn.mode, (int(sys.argv[2]), int(sys.argv[3])))
imOut.paste(imIn, (int(sys.argv[4]), int(sys.argv[5]), int(sys.argv[4])+imIn.width, int(sys.argv[5])+imIn.height))
imOut.save(sys.argv[6], format='PNG')
