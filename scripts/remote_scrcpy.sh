#!/bin/bash

cd ~/.config/hypr/scripts/
source ./shared.sh

ip=$(zenity --entry --title="Enter phone IP" --entry-text="$(fish -c 'get_public_ip')")

Toggle scrcpy "scrcpy --tcpip='$ip' --no-video --no-window"
