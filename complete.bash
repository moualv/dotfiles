#!/bin/bash

cd "$(dirname "$0")"

./sync_scripts/installdeps.bash
./sync_scripts/syncnvim.bash
./sync_scripts/synctmux.bash
