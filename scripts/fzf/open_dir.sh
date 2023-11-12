#!/usr/bin/env sh

selected_dir=$( (
	fd -t d . ~/ ~/Documents ~/Downloads
	echo ~/Documents
	echo ~/Downloads
) | fzf)

if [ -n "$selected_dir" ]; then
	cd "$selected_dir" || exit
	nvim
fi
