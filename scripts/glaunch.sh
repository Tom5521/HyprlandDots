#!/bin/bash

cd ~/.config/hypr/scripts/
source ./shared.sh

dir=$(zenity --file-selection --directory)
if [ $? -ne 0 ]; then
	exit 0
fi

cd "$dir" || exit

RunKitty "Neovim" "CC=clang nvim"
