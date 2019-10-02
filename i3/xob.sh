#!/bin/sh
tail -f /tmp/volume | xob -s volume > /dev/null &
tail -f /tmp/brightness | xob -s brightness > /dev/null &
