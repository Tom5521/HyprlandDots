#!/bin/bash

checkIfIsOn() {
	if pidof wlsunset >/dev/null; then
		return 0
	else
		return 1
	fi
}

start() {
	wlsunset -T 5000
}

killpid() {
	pid=$(pidof wlsunset)
	if [ -n "$pid" ]; then
		kill "$pid"
	else
		zenity --error --text "Error killing wlsunset..."
	fi
}

if checkIfIsOn; then
	killpid
else
	start
fi
