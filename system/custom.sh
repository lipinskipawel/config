#!/bin/bash

pacman --noconfirm -S tmux alacritty ffmpeg git firefox
pacman --noconfirm -S dmenu
pacman --noconfirm -S curl wget unzip
pacman --noconfirm -S mupdf

pacman --noconfirm -S man-db man-pages tldr

# audio
pacman --noconfirm -S pulseaudio
pacman --noconfirm -S pulseaudio-alsa
pacman --noconfirm -S alsa-utils
pacman --noconfirm -S pavucontrol

pacman --noconfirm -S fish

pacman --noconfirm -S fd
pacman --noconfirm -S ripgrep
pacman --noconfirm -S fzf

# paru
git clone https://github.com/Morganamilo/paru
cd paru
makepkg -si
cd ..
./paru.sh

pacman --noconfirm -S clang

# allows to use aft-mtp-mount /mnt and fusermount -u /mnt
pacman --noconfirm -S android-file-transfer
