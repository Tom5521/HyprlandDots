#!/bin/bash

cmd_output=$(systemctl is-active bluetooth)
echo "$cmd_output"

if [[ $cmd_output == *"inactive"* ]]; then
	echo "Starting bluetooth"
	systemctl start bluetooth
	if [ $? -ne 0 ]; then
		exit 1
	fi
	blueman-manager &
else
	echo "Stopping bluetooth"
	systemctl stop bluetooth
	if [ $? -ne 0 ]; then
		echo "Error stopping bluetooth"
	fi
fi
