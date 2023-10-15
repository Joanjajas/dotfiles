#!/bin/bash

# Use fzf to select a directory
selected_dir=$(fd -t d . ~/ ~/Documents ~/Downloads | fzf)

# Check if a file was selected
if [ -n "$selected_dir" ]; then
  # Change to the selected directory
  cd "$selected_dir" || exit

  # Open NeoVim
  nvim 
fi

