#!/bin/sh
# Jovan Lanik's i3 swap script 1.0
# www.github.com/jovanlanik
# clean and simple

timeout=1.6

[ "$1" ] && mode="$1" || mode='drag'
i3-msg "mode $mode"
i3-msg "gaps inner all set 8"
sleep $timeout
i3-msg "mode default"
i3-msg "gaps inner all set 2"
i3-msg unmark swap

