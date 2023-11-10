#!/usr/bin/env sh

start_dir=$(pwd)
selected_file=$(
	fd -u . ~/ \
		-E Library \
		-E node_modules \
		-E .vscode \
		-E .git \
		-E .cache \
		-E .config/cargo \
		-E .config/rustup \
		-E Public \
		-E Pictures \
		-E Music \
		-E Movies \
		-E .DS_Store \
		-E target \
		-E .local \
		-E .npm |
		fzf
)
selected_dir=$(dirname "$selected_file")

if [ -n "$selected_file" ]; then
	cd "$selected_dir" || exit
	nvim "$selected_file"
	cd "$start_dir" || exit
fi
