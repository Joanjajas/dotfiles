#!/usr/bin/env sh

start_dir=$(pwd)
selected_file=$(git status --porcelain | grep -E '^(M|M | M|\?\?)' | fzf | awk '{print $2}')
selected_dir=$(dirname "$selected_file")

if [ -n "$selected_file" ]; then
	cd "$HOME/$selected_dir" || exit
	nvim "$HOME/$selected_file"
	cd "$start_dir" || exit
fi
