#!/bin/sh
# Jovan Lanik's i3 swap script 1.0
# www.github.com/jovanlanik
# clean and simple

SWAP_GAP=4
SWAP_GAP_LARGE=32
SWAP_SPEED=3
SWAP_WAIT=1.6

i3-msg "mode \$drag"
~/.config/i3/gap_scale.py $SWAP_GAP $SWAP_GAP_LARGE $SWAP_SPEED 0
sleep $SWAP_WAIT
i3-msg "mode default"
~/.config/i3/gap_scale.py $SWAP_GAP $SWAP_GAP_LARGE $SWAP_SPEED 1
i3-msg unmark swap

