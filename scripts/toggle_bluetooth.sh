#!/bin/bash

cmd_output=$(systemctl is-active bluetooth)
echo "$cmd_output"

if [[ $cmd_output == *"inactive"* ]]; then
	echo "Starting bluetooth"
	if ! zenity --password | sudo -S systemctl start bluetooth; then
		echo "Error starting bluetooth"
		exit 1
	fi
	blueman-manager &
else
	echo "Stopping bluetooth"
	if ! zenity --password | sudo -S systemctl stop bluetooth; then
		echo "Error stopping bluetooth"
	fi
fi
