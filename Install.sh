#!/bin/bash

cp rofi ~/.config/ -rf
cp waypaper ~/.config/ -rf
cp swaync ~/config/ -rf

echo Building plugins...

cd ./plugins/
bash build_plugins.sh
