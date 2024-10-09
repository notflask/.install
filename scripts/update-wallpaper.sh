#!/bin/bash

if [ -z "$1" ]; then
 exit 1
fi

wallpaper_path="$1"
dwm_path="$HOME/.suckless/dwm"
wal_path="$HOME/.cache/wal"

if [ ! -f "$wallpaper_path" ]; then
 exit 1
fi

wal -i "$wallpaper_path"
head -n -6 "$wal_path/colors-wal-dwm.h" > "$dwm_path/wal.h"
cd "$dwm_path"
sudo make clean install
