#!/bin/sh
# Jovan Lanik's i3 swap script 1.0
# www.github.com/jovanlanik
# clean and simple

SWAP_WAIT=1.6

i3-msg "mode \$drag"
i3-msg "gaps inner all set 8"
sleep $SWAP_WAIT
i3-msg "mode default"
i3-msg "gaps inner all set 2"
i3-msg unmark swap

