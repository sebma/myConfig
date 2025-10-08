#!/usr/bin/env bash

# cf. https://github.com/eLvErDe/hwraid and https://hwraid.le-vert.net/wiki/DebianPackages
raidDriversList=$(\lspci -d::0104 -k | awk '/Kernel driver in use/{print\$NF}' | grep -vw ahci | head -1)
case $raidDriversList in
	hpsa) installPackagesFromRepo.sh "deb http://hwraid.le-vert.net/ubuntu $(lsb_release -sc) main" hpacucli;;
	megaraid_sas) installPackagesFromRepo.sh "deb http://hwraid.le-vert.net/ubuntu $(lsb_release -sc) main" megacli megactl  megaclisas-status;;
	*) echo "=> $raidDriversList is not supported yes" >&2;exit 1;;
esac
