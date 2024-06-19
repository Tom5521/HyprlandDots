#!/bin/bash

dir=$(zenity --file-selection --directory)
if [ $? -ne 0 ]; then
	exit 0
fi

cd ~/.config/hypr/scripts/

./nvim.sh "$dir"
