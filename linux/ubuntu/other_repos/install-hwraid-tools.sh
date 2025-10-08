#!/usr/bin/env bash

# cf. https://github.com/eLvErDe/hwraid and https://hwraid.le-vert.net/wiki/DebianPackages
dmesg | grep SmartArray -q || installPackagesFromRepo.sh "deb http://hwraid.le-vert.net/ubuntu $(lsb_release -sc) main" hpacucli
dmesg | grep MegaRAID.SAS -q || installPackagesFromRepo.sh "deb http://hwraid.le-vert.net/ubuntu $(lsb_release -sc) main" megacli
