#!/bin/sh
#
# Dotfiles
# www.github.com/jovanlanik
#

action='install'

usage() {
cat << EOF
Usage: $0 [OPTIONS] [PACKAGE]
Install package by copying.
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
		u) action='uninstall';;
		\?) error "Invalid option: -$OPTARG. See usage";;
	esac
done
shift "$((OPTIND-1))"

[ "$1" ] || error 'No package. See usage'
[ -d "copy/$1" ] || error "Directory does not contain package $1"

[ "$action" = 'install' ] && exec cp -RT "copy/$1/" "$HOME"
[ -f ".dots/installed/$1" ] || exit 0
[ -f ".dots/uninstalled/$1" ] && exit 0

cd "copy/$1" || exit 1
for file in $(find . -type f)
do
	[ -f "$HOME/$file" ] && rm -f "$HOME/$file"
done

