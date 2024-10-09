#!/bin/bash

installation_dir="$(dirname "$(realpath "$0")")"
suckless_cfg_dir="$HOME/.suckless"
suckless_apps=("st" "dwm" "scroll")

if ! [ -d $suckless_cfg_dir ] ; then
	# clone suckless's applications 
	git clone https://github.com/notflask/suckless "$suckless_cfg_dir"

	# install libs
	sudo pacman -S libxft libx11 libxinerama xorg xorg-xinit

	# build it all 
	for app in "${suckless_apps[@]}"; do
		cd "$suckless_cfg_dir/$app"
		sudo make clean install
	done

	# copy .xinitrc so startx will work w/ dwm
	cp "$installation_dir/.xinitrc" "$HOME/.xinitrc"
else
	echo "suckless's apps already installed"
fi
	

