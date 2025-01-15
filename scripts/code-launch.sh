#!/bin/bash

dir=$(zenity --file-selection --directory)
if [ $? -ne 0 ]; then
	exit 0
fi

cd "$dir" || exit $?

code .
