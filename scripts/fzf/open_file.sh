#!/bin/bash

selected_file=$(fd -t f . ~/ ~/Documents ~/Downloads | fzf)

if [ -a "$selected_file" ]; then
	nvim "$selected_file"
fi
