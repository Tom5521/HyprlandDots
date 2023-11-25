#!/bin/bash

git clone https://github.com/Tom5521/UpgradeScript

echo Building upgrade script...
cd ./UpgradeScript/ || exit
go build -o ../upgrade . || echo Error building upgrade script...
cd ..
