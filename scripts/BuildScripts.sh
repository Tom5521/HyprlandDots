#!/bin/bash

cd GnvimLauncher || exit

go build -o ../glaunch .
cd ..

cd UpgradeScript || exit
go build -o ../upgrade .

exit
