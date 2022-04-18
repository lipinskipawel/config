#!/bin/bash

cd ..
fish_conf_file=~/.config/fish/config.fish
fish_conf_d=~/.config/fish/conf.d

rm $fish_conf_file
rm -rf $fish_conf_d

ln -sr fish/config.fish $fish_conf_file
ln -sr fish/conf.d $fish_conf_d
