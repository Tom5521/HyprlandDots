#!/bin/bash

cd ~/.config/hypr/scripts/
source ./shared.sh

cd "$1" || exit $?

RunKitty "Neovim" "CC=clang nvim"
