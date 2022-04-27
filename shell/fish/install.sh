#!/bin/bash

cd ..
fish_conf_file=~/.config/fish/config.fish
fish_conf_d=~/.config/fish/conf.d
fish_functions=~/.config/fish/functions

rm $fish_conf_file
rm -rf $fish_conf_d
rm -rf $fish_functions

ln -sr fish/config.fish $fish_conf_file
ln -sr fish/conf.d $fish_conf_d
ln -sr fish/functions $fish_functions
