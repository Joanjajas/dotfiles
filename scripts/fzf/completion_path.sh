#!/usr/bin/env sh

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
	-E .DS_Store
