#!/bin/bash

git clone https://github.com/Tom5521/GnvimLauncher.git

git clone https://github.com/Tom5521/UpgradeScript.git

cd GnvimLauncher || exit

go build -o ../glaunch .
cd ..

cd UpgradeScript || exit
go build -o ../upgrade .

exit
