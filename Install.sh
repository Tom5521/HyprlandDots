#!/bin/bash

cp rofi ~/.config/ -rf
cp waypaper ~/.config/ -rf

echo Building plugins...
cd ./plugins/ || exit
bash build_plugins.sh
cd ..

cd ./scripts/ || exit
bash BuildScripts.sh
