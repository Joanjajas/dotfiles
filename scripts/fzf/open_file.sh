#!/usr/bin/env sh

start_dir=$(pwd)
selected_file=$(fd -t f . ~/ ~/Documents ~/Downloads | fzf)
selected_dir=$(dirname "$selected_file")

if [ -n "$selected_file" ]; then
	cd "$selected_dir" || exit
	nvim "$selected_file"
	cd "$start_dir" || exit
fi
