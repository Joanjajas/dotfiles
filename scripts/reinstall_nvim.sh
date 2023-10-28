#!/usr/bin/env sh

rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim
rm -rf ~/.local/state/nvim

git clone git@github.com:Joanjajas/nvim.git ~/.config/nvim
nvim +MasonInstallAll +TSUpdate
