#!/bin/bash

dir=$(zenity --file-selection --directory)
if [[ $? != 0 ]]; then
  exit 0
fi

cd "$dir"
kitty
