#!/bin/bash

RunKitty() {
	$SHELL -c "kitty $3 -T '$1' --class '$1' --hold sh -c '$2'"
	return 0
}

Toggle() {
	program=$1
	cmd=$2
	hide=$3
	(
		fish -c "kill '$program'" &&
			if [[ $hide -ne 1 ]]; then
				notify-send "$program killed."
			fi
	) || (
		if [[ $hide -ne 1 ]]; then
			notify-send "Starting $program..."
		fi
		$SHELL -c "$cmd"
	)
}
