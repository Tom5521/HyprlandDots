#!/bin/bash

source "$HOME/.config/hypr/scripts/shared.sh"

dir=$(zenity --file-selection --directory)
if [ $? -ne 0 ]; then
    exit 0
fi

cd "$dir" || exit

RunKitty "Neovim" "nvim"
