#!/usr/bin/env sh

selected_file=$(git status --porcelain | awk '{print $2}' | fzf)

if [ -n "$selected_file" ]; then
	nvim "$HOME/$selected_file"
fi
