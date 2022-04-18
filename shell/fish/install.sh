#!/bin/bash

cd ..
fish_conf_file=~/.config/fish/config.fish
rm $fish_conf_file
ln -sr fish/config.fish $fish_conf_file
