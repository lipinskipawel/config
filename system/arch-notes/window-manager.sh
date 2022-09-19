#!/bin/bash

# install xorg
pacman --noconfirm -S xorg-server xorg-apps xorg-xinit
pacman --noconfirm -S lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings
systemctl enable lightdm.service

pacman --noconfirm -S awesome
touch ~/.xinitrc
echo "exec awesome" >> ~/.xinitrc

