#!/bin/bash

cd ~/.config/hypr/scripts/
source ./shared.sh

if [ ! -d "audiosource" ]; then
	git clone https://github.com/gdzx/audiosource.git
fi

program=audiosource
exec_cmd="$HOME/.config/hypr/scripts/audiosource/audiosource run"

Toggle "$program" "$exec_cmd"
