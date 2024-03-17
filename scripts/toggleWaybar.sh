#!/bin/bash

cd ~/.config/hypr/scripts/
source ./shared.sh

program=waybar
exec_cmd="waybar -c ~/.config/hypr/waybar/config.jsonc -s ~/.config/hypr/waybar/style.css"

Toggle "$program" "$exec_cmd" 0
