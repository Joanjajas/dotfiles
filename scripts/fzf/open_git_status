#!/usr/bin/env sh

start_dir=$(pwd)
root_dir=$(git rev-parse --show-toplevel)
selected_file=$(git status --porcelain | grep -E '^(M|M | M|\?\?)' | fzf | awk '{print $2}')
selected_dir=$(dirname "$selected_file")

if [ -n "$selected_file" ]; then
	cd "$root_dir/$selected_dir" || exit
	nvim "$root_dir/$selected_file"
	cd "$start_dir" || exit
fi
