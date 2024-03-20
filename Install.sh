#!/bin/bash

copy() {
	cp -rf "$1" "$2"
}

copy rofi ~/.config/
copy waypaper ~/.config/
copy swaync ~/config/
copy waybar ~/config/
copy swaync ~/config/

echo Building plugins...

cd ./plugins/ || exit
bash build_plugins.sh
