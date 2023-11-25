#!/bin/bash

dir=$(zenity --file-selection --directory)
if [ $? -ne 0 ]; then
	exit 0
fi

cd "$dir" || exit
kitty -T Neovim --class Neovim --hold sh -c nvim
