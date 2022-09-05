#!/bin/bash

# This script installs all programs found under the 'programs-system' file.
# There is one EXCEPTION to the above rule which is the 'fd' program.
# Due to its nature it has to be installed per linux distro and its
# installed within this file.

linux_distro=$(cat /etc/os-release | head -n 1 | grep -o '"[^"]\+"' | sed 's/"//g')

if [ "$linux_distro" == "Pop!_OS" ]; then
  echo "Installing programs via os package manager"
  cat programs-system | xargs -I '{}' sudo apt install -y '{}'

  sudo apt install -y fd-find
  mkdir -p ~/.local/bin
  ln -s $(which fdfind) ~/.local/bin/fd
  echo "Done"
else
  echo "Not supported OS"
  echo "no-op"
fi

