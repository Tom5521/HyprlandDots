#!/bin/bash

source ./shared.sh

cd "$1" || exit $?

RunKitty "Neovim" "CC=clang nvim"
