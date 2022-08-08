#!/bin/bash

sudo apt install -y htop
sudo apt install -y tmux
sudo apt install -y fish
sudo apt install -y neovim
sudo apt install -y alacritty
sudo apt install -y fish
sudo apt install -y fzf
sudo apt install -y ripgrep
sudo apt install -y fd-find

mkdir -p ~/.local/bin
ln -s $(which fdfind) ~/.local/bin/fd
