#!/bin/bash

clonesDir="clones"

if [ ! -d "$clonesDir" ]; then
	mkdir $clonesDir
fi

cd $clonesDir || exit

git clone https://github.com/VortexCoyote/hyprfocus

cd hyprfocus || exit

make all
