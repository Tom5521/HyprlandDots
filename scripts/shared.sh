#!/bin/bash

# $1 = class & title, $2 = command, $3 = optional arguments $4 = hold.
RunKitty() {
	local class=$1
	local command=$2
	local args=$3
	local hold=$4
	[[ $hold == 1 ]] && args="$args --hold"
	# I run the command with the shell to make kitty run with the user's custom environment variables.
	kitty $args -T "$class" --class "$class" -e $SHELL -c "$command"
}

# $1 = program, $2 = command, $3 = hide notification
Toggle() {
	local program="$1"
	local cmd="$2"
	local hide="$3"

	notify() {
		if [[ "$hide" != 1 ]]; then
			notify-send "$@"
		fi
	}

	if pkill -x "$program"; then
		notify "$program killed."
	else
		notify "Starting $program..."
		$SHELL -c "$cmd" || notify "Error starting $program [exit code $?]" &
	fi
}
