#!/bin/bash

cd ..

rm -rf ~/.local/share/nvim
rm -rf ~/.config/nvim
ln -s $(pwd)/config/nvim2 ~/.config/nvim

