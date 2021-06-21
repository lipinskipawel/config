#!/bin/bash

config=~/.config/tmux
mkdir $config

ln -sr theme.conf $config/theme.conf
ln -sr .tmux.conf $config/.tmux.conf
ln -sr tmux-redirect $config/tmux-redirect
ln -s  $config/.tmux.conf ~/.tmux.conf

echo "You have to installed xclip, fzf, ripgrep"
