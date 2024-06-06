#!/bin/bash

echo "You can't use this script, because is shit and it will destroy your files!"
echo "Someday i will make it better..."

copy() {
	if which advcp; then
		advcp -rf "$1" "$2"
	else
		cp -rf "$1" "$2"
	fi
}
copy rofi ~/.config/
copy waypaper ~/.config/
copy swaync ~/config/
copy waybar ~/config/
copy swaync ~/config/

echo Building plugins...

cd ./plugins/ || exit
bash build_plugins.sh
