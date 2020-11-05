#!/bin/sh
[ -z "$DOTFILES"] && DOTFILES="$PWD"

linkdot()
{
	if [ ! -e $2 ]
	then
		echo "Linking $1 to $2"
		ln -s $1 $2
	fi
}

mlink()
{
	echo "Manually bind $1"
}

# rc
for f in $(ls -A $DOTFILES/rc/)
do
	linkdot "$DOTFILES/rc/$f" "$HOME/$f"
done

# xdg
[ -z "$XDG_CONFIG_HOME" ] && XDG_CONFIG_HOME="$HOME/.config/"
[ ! -d "$XDG_CONFIG_HOME" ] && exit 1
for f in $(ls $DOTFILES/xdg/)
do
	linkdot "$DOTFILES/xdg/$f" "$XDG_CONFIG_HOME/$f"
done

# other
linkdot "$DOTFILES/other/pulse/default.pa" "$XDG_CONFIG_HOME/pulse/default.pa"
mlink "$DOTFILES/other/userChrome.css"
mlink "$DOTFILES/other/userContent.css"

