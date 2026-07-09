#!/bin/bash

cd ..

rm -rf ~/.local/share/nvim
rm -rf ~/.config/nvim
ln -s $(pwd)/nvim ~/.config/nvim

