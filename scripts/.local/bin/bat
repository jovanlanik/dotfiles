#!/bin/sh
echo
for f in /sys/class/power_supply/*
do
	name=$(basename "$f")
	printf '\033[31m%s\n' "$name"
	printf '\033[34mType \033[0m'
	cat "$f/type"
	case $name
	in
		BAT*)
		printf '\033[34mStatus	\033[0m'
		cat "$f/status"
		printf '\033[34mCapacity	\033[0m'
		cat "$f/capacity"
		;;
		AC*|ADP*)
		printf '\033[34mOnline \033[0m'
		cat "$f/online"
	esac
done
printf '\033[0m\n'
