#!/usr/bin/env sh

rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim
rm -rf ~/.local/state/nvim

git clone git@github.com:Joanjajas/nvim.git ~/.config/nvim
printf "Setting up neovim...\n"
nvim --headless +MasonInstallAll +qa 2>/dev/null
printf "Done!\n"
