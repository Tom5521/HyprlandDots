#!/bin/bash

source ./shared.sh

cd "$1" || exit $?
cd "$(pwd -P)" || exit $?

if [[ "$EXEC_NEOVIDE" == 1 ]]; then
  neovide
  exit 0
fi

RunKitty "Neovim" "nvim" "" 1
