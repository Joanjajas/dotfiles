#!/bin/bash

selected_file=$(
	fd -u . ~/ \
		-E Library \
		-E node_modules \
		-E .vscode \
		-E .git \
		-E .cache \
		-E .config/cargo/registry \
		-E .config/rustup \
		-E Public \
		-E Pictures \
		-E Music \
		-E Movies \
		-E .DS_Store |
		fzf
)
selected_dir=$(dirname "$selected_file")

if [ -a "$selected_file" ] && [ -d "$selected_dir" ]; then
	cd "$selected_dir" || exit
	nvim "$selected_file"
fi
