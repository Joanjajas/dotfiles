#!/bin/bash

selected_dir=$(fd -t d . ~/ ~/Documents ~/Downloads | fzf)

if [ -d "$selected_dir" ]; then
	cd "$selected_dir" || exit
	nvim
fi
