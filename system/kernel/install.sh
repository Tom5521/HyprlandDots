#!/bin/bash

mkdir -p builds

git clone https://aur.archlinux.org/linux-clear.git
directory=linux-clear
# checkout to version 6.10
git -C $directory checkout 828cd003563a82b7a2755036aab04742161333a1

patch ./linux-clear/PKGBUILD ./changes.patch

# Install only dependencies.

echo -n "Password: "
read -r password

makepkg -D $directory -s --nobuild --noarchive --noextract --noconfirm

# Build
time makepkg -D $directory --noconfirm

kernel=./linux-clear/linux-clear-6.10.12-1-x86_64.pkg.tar.zst
headers=./linux-clear/linux-clear-headers-6.10.12-1-x86_64.pkg.tar.zst

cp -rf $kernel $headers ./builds/

echo "$password" | sudo -S pacman -U $kernel $headers --noconfirm
