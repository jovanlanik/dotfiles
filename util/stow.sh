#!/bin/sh
#
# Dotfiles
# www.github.com/jovanlanik
#

action='--stow'

usage() {
cat << EOF
Usage: $0 [OPTIONS] [PACKAGE]
Install package by stowing.
	-h	show usage and exit
	-u	uninstall instead
EOF
exit 0
}

error() {
	echo "$0: $1." >&2
	exit 1
}

while getopts ":hu" opt
do
	case $opt in
		h) usage;;
		u) action='--delete';;
		\?) error "Invalid option: -$OPTARG. See usage";;
	esac
done
shift "$((OPTIND-1))"

[ "$1" ] || error 'No package. See usage'

[ "$action" = '--stow' ] && [ -f ".dots/installed/$1" ] && action='--restow'
exec stow --no-folding --dir "stow" --target "$HOME" "$action" "$1"

