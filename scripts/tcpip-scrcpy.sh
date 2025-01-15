#!/bin/bash

cd ~/.config/hypr/scripts/
source ./shared.sh

program=scrcpy
cmd="scrcpy --select-tcpip --tcpip --no-video --no-window"

Toggle "$program" "$cmd"
