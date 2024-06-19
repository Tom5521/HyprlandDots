#!/bin/bash

cd ~/.config/hypr/scripts/
source ./shared.sh

program=wlsunset
exec_cmd="wlsunset -T 5500"

Toggle "$program" "$exec_cmd"
