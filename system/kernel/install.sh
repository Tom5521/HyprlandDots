#!/bin/bash

# Clean
rm -rf ./linux-clear

git clone https://aur.archlinux.org/linux-clear.git
cd ./linux-clear || exit $?
# checkout to version 6.10
git checkout 828cd003563a82b7a2755036aab04742161333a1

patch ./PKGBUILD ../changes.patch

time makepkg -si --noconfirm
