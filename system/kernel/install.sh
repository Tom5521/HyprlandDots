#!/bin/bash

# Clean
rm -rf ./linux-clear

git clone https://aur.archlinux.org/linux-clear.git
patch ./linux-clear/PKGBUILD ./changes.patch

cd linux-clear || exit $?

makepkg -si --noconfirm
