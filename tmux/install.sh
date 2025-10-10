#!/bin/bash

set -e

tmux_config=~/.config/tmux

function install_tmux() {
	echo "Installing..."
	ln -sf $(pwd)/theme.conf $tmux_config/theme.conf
	ln -sf $(pwd)/tmux-sessionizer ~/.local/bin/
	ln -sf $(pwd)/tmux-work-session ~/.local/bin/
	ln -sf $(pwd)/.tmux.conf ~/.tmux.conf
}

# https://bash.cyberciti.biz/guide/Here_documents
cat <<PRINT_FILES_TO_DELELTE
Files to delete:
- $tmux_config
- ~/.tmux.conf
PRINT_FILES_TO_DELELTE

read -r -p "Do you want to remove existing tmux config? [y/N] " yn
case $yn in
	[Yy]*)
		echo "You have to install following packages"
		echo "             fzf"
		echo "             ripgrep"
		echo "             xclip"
		echo ""
		echo "Removing existing configuration"
		rm -rf $tmux_config
		rm -rf ~/.tmux.conf
		mkdir -p $tmux_config
		install_tmux;;
	*)
		echo "exit"
		exit;;
esac

