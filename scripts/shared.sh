#!/bin/bash

RunKitty() {
	# I run the command with the shell to make kitty run with the user's custom environment variables.
	$SHELL -c "kitty $3 -T '$1' --class '$1' --hold sh -c '$2'"
}

Toggle() {
	program=$1
	cmd=$2
	hide=$3
	notify() {
		if [ "$hide" == 1 ]; then
			return
		fi
		notify-send "$@"
	}

	fail() {
		notify "Failure, error code:" + "$@"
	}

	(
		(
			fish -c "kill '$program'" || fail $?
		) && (
			notify "$program killed."
		)
	) || (
		notify "Starting $program..."
		$SHELL -c "$cmd" || fail $?
	)
}
