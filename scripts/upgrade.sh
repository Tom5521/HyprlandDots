#!/bin/bash

hyprctl hyprctl dispatch workspace 1
exec kitty -T Upgrade --class Upgrade --hold sh -c "$HOME/.config/hypr/scripts/upgrade noconfirm"
