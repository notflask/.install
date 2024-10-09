#!/bin/bash

mv scripts/*.sh ~/.bin

if ! [ -v yay &> /dev/null ]; then
  git clone https://aur.archlinux.org/yay
  cd yay
  makepkg -si
fi 

yay -S dmenu firefox telegram-desktop-bin vesktop-bin gcc clang neovim
