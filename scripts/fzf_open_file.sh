#!/bin/bash

# Use fzf to select a file
selected_file=$(fd -t f . ~/ ~/Documents ~/Downloads | fzf)

# Check if a file was selected
if [ -n "$selected_file" ]; then
  # Get the directory of the selected file
  selected_dir=$(dirname "$selected_file")

  # Change to the selected directory
  cd "$selected_dir" || exit

  # Open the selected file in NeoVim
  nvim "$selected_file"
fi

