#!/bin/bash

git clone https://github.com/Tom5521/GnvimLauncher.git

git clone https://github.com/Tom5521/UpgradeScript.git

cd GnvimLauncher

go build -o ../glaunch .
cd ..

cd UpgradeScript
go build -o ../upgrade .

exit
