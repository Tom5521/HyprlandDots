#!/bin/bash

source ./shared.sh

cd "$1" || exit $?
cd "$(pwd -P)" || exit $?

RunKitty "Neovim" "nvim" "" 1
