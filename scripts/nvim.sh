#!/bin/bash

cd "$1" || exit $?

RunKitty "Neovim" "CC=clang nvim"
