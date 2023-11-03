#!/usr/bin/env sh

selected_dir=$(fd -t d . ~/ ~/Documents ~/Downloads | fzf)
cd "$selected_dir" || exit
