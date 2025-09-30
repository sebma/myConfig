#!/usr/bin/env bash

dmesg | grep SmartArray -q || installPackagesFromRepo.sh "deb http://hwraid.le-vert.net/debian $(lsb_release -sc) main" hpacucli
dmesg | grep MegaRAID.SAS -q || installPackagesFromRepo.sh "deb http://hwraid.le-vert.net/debian $(lsb_release -sc) main" megacli
