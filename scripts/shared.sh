#!/bin/bash

RunKitty() {
	kitty $3 -T "$1" --class "$1" --hold sh -c "$2"
	return 0
}

Toggle() {
	program=$1
	cmd=$2
	(
		fish -c "kill '$program'" &&
			notify-send "$program killed."
	) || (
		notify-send "Starting $program..."
		bash -c "$cmd"
	)
}
