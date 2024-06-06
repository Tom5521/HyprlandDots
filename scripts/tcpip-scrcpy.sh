#!/bin/bash

cd ~/.config/hypr/scripts/
source ./shared.sh

program=scrcpy
cmd="scrcpy --tcpip --no-video"

Toggle "$program" "$cmd"
