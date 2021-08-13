#!/bin/bash

config=~/.config/tmux

function install_tmux() {
    echo "Installing..."
    ln -sr theme.conf $config/theme.conf
    ln -sr .tmux.conf $config/.tmux.conf
    ln -sr tmux-redirect $config/tmux-redirect
    ln -s $config/.tmux.conf ~/.tmux.conf
}

echo ""
echo "Files to delete"
echo $config
echo "~/.tmux.conf"
echo ""

read -r -p "Do you want to remove existing tmux config? [y/N] " yn
case $yn in
    [Yy]*)
    echo "You have to install following packages"
    echo "             fzf"
    echo "             ripgrep"
    echo "             xclip"
    echo ""
    echo "Removing existing configuration"
    rm -rf $config
    rm -rf ~/.tmux.conf
    mkdir $config
    install_tmux;;
    *)
        echo "exit"
        exit;;
esac


