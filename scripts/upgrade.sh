#!/bin/bash

hyprctl dispatch workspace 1

source "$HOME/.config/hypr/scripts/shared.sh"

RunKitty Upgrade "$HOME/.config/hypr/scripts/upgrade noconfirm"
