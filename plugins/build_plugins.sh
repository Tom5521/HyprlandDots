#!/bin/bash

build() {
	org_path=$(pwd)

	clonesDir="clones"
	if [ ! -d "$clonesDir" ]; then
		mkdir $clonesDir
	fi

	cd $clonesDir || return
	name=$1
	git_link=$2
	build_cmd=$3
	bin_name=$4
	if [[ "$bin_name" == "" ]]; then
		bin_name="$name.so"
	fi
	if [ ! -d "$name" ]; then
		git clone "$git_link"
	fi

	cd "$name" || return

	echo Building "$name"...
	if [[ "$build_cmd" == "" ]]; then
		make all || return
	else
		$build_cmd || return
	fi

	cd "$org_path" || return
	cp "$clonesDir/$name/$bin_name" "$bin_name"
}

build hyprfocus https://github.com/VortexCoyote/hyprfocus
