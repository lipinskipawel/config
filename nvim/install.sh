#!/bin/bash

cd ..
if [ "$#" -eq 0 ]; then
    rm -rf ~/.local/share/nvim
    rm -rf ~/.config/nvim
    ln -sr nvim ~/.config/nvim
fi

if [ "$#" -eq 1 ]; then
    rm -rf ~/.local/share/nvim
    rm -rf ~/.config/nvim
    ln -sr nvim2 ~/.config/nvim
fi

