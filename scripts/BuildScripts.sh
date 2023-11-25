#!/bin/bash

if [ ! -d "UpgradeScript" ]; then
    git clone https://github.com/Tom5521/UpgradeScript
fi

echo Building upgrade script...
cd ./UpgradeScript/ || exit
git pull
go build -o ../upgrade . || echo Error building upgrade script...
cd ..
