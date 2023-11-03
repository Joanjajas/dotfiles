#!/usr/bin/env sh

selected_file=$(git status --porcelain | grep -E '^(M|M | M|\?\?)' | fzf)

if [ -n "$selected_file" ]; then
	nvim "$HOME/$selected_file"
fi
