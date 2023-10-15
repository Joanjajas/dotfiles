#!/bin/bash

selected_file=$(fd -t f . ~/ ~/Documents ~/Downloads | fzf)
selected_dir=$(dirname "$selected_file")

if [ -a "$selected_file" ] && [ -d "$selected_dir" ]; then
	cd "$selected_dir" || exit
	nvim "$selected_file"
fi
