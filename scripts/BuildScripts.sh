#!/bin/bash

echo Building GnvimLauncher...
cd ./GnvimLauncher/ || exit
go build -o ../glaunch . || echo Error building gnvim launcher
cd ..

echo Building upgrade script...
cd ./UpgradeScript/ || exit
go build -o ../upgrade . || echo Error building upgrade script...
cd ..

echo Building bluetooth toggle script...
cd ./BluetoothToggle/ || exit
go build -o ../bluezToggle . || echo Error building bluetooth toggle script...
cd ..

echo Building WaybarToggle...
cd ./WaybarToggle/ || exit
go build -o ../waybarToggle . || echo Error building waybar toggle
cd ..
