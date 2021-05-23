#!/bin/bash

config=~/.config/tmux
mkdir $config

ln -sr .tmux.conf $config/.tmux.conf
ln -sr tmux-redirect $config/tmux-redirect
ln -s  $config/.tmux.conf ~/.tmux.conf
