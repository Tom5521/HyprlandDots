#!/bin/bash

cd ~/.config/hypr/scripts/
source ./shared.sh

program=scrcpy
cmd="scrcpy -d --no-video --no-window"

Toggle "$program" "$cmd"
