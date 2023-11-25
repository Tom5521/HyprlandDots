#!/bin/bash

checkIfIsOn() {
	if pidof waybar >/dev/null; then
		return 0
	else
		return 1
	fi
}

startWaybar() {
	waybar -c ~/.config/hypr/waybar/config.jsonc -s ~/.config/hypr/waybar/style.css &
}

killWaybar() {
	pid=$(pidof waybar)
	if [ -n "$pid" ]; then
		kill "$pid"
	else
		echo "Error killing waybar..."
	fi
}

if checkIfIsOn; then
	killWaybar
else
	startWaybar
fi
