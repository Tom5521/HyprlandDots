#!/bin/bash

clonesDir="clones"

if [ ! -d "$clonesDir" ]; then
	mkdir $clonesDir
fi

cd $clonesDir || exit

if [ ! -d "hyprfocus" ]; then
	git clone https://github.com/VortexCoyote/hyprfocus
fi

cd hyprfocus || exit

git pull

make all

cp hyprfocus.so ../../
