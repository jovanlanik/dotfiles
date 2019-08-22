#!/bin/python
import sys
import math
import os
gap= []
try:
	b = int(sys.argv[1])
except:
	b = 0
try:
	r = int(sys.argv[2])
except:
	r = 16
try:
	s = int(sys.argv[3])
except:
	s = 1
try:
	d = int(sys.argv[4])
except:
	d = 0
for i in range(int(round(r/s))):
	n = int(round(-(r-b)/2 * (math.cos(math.pi*i/(r/s)) - 1) + b)) 
	if d == 0:
		m = n
	else:
		m = r-n+b
	gap.append("i3-msg gaps inner all set {}".format(m))
os.system("sleep 0.3")
for i in gap:
	os.system(i)
if d != 0:
	os.system("i3-msg gaps inner all set {}".format(b))

