#!/bin/sh
#
# Dotfiles
# www.github.com/jovanlanik
#

(
for package in .dots/available/*
do
	name=$(basename "$package")
	ptype='copy'
	[ -d "stow/$name" ] && ptype='stow'
	enabled='no'
	installed='no'
	[ -f ".dots/enabled/$name" ] && enabled='yes'
	[ -f ".dots/installed/$name" ] && installed='yes'
	printf '%s#%s#%s#%s\n' "$name" "$ptype" "$enabled" "$installed"
done
) | column -tN PACKAGE,TYPE,ENABLED,INSTALLED -s '#'
