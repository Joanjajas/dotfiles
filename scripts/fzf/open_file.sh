#!/usr/bin/env sh

selected_file=$(fd -t f . ~/ ~/Documents ~/Downloads | fzf)

if [ -n "$selected_file" ]; then
	nvim "$selected_file"
fi
