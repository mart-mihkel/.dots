#!/bin/sh

wall="$HOME/git/dotfiles/walls/$1"
if [[ -f $wall ]]; then
	feh --bg-fill $wall
	exit 0
fi

ls ~/dotfiles/walls

