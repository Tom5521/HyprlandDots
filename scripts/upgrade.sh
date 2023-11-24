#!/bin/bash

exec kitty -T Upgrade --class Upgrade --hold sh -c "$HOME/.config/hypr/scripts/upgrade noconfirm"
