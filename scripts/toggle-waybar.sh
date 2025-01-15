#!/bin/bash

cd ~/.config/hypr/scripts/
source ./shared.sh

program=waybar
exec_cmd="waybar -c ~/.config/waybar/config.jsonc -s ~/.config/waybar/style.css"

Toggle "$program" "$exec_cmd" 1
