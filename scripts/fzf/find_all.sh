#!/bin/bash

selected_file=$(
	fd -t d -u . ~/ -E Library -E node_modules -E .vscode -E .git -E .cache -E .config/cargo/registry -E .config/rustup -E Plublic -E Pictures -E Music -E Movies -E .DS_Store -E .npm | fzf
)
selected_dir=$(dirname "$selected_file")

if [ -a "$selected_file" ] && [ -d "$selected_dir" ]; then
	cd "$selected_dir" || exit
	nvim "$selected_file"
fi
