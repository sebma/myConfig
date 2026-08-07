#!/usr/bin/env bash

ubuntuRelease=$(lsb_release -sr)
ubuntuCodeName=$(lsb_release -sc)
if ! dpkg -s packages-microsoft-prod &>/dev/null;then
        wget https://packages.microsoft.com/config/ubuntu/$ubuntuRelease/packages-microsoft-prod.deb
        sudo apt install -V ./packages-microsoft-prod.deb
        rm -v ./packages-microsoft-prod.deb
fi

sudo sed -i "/$ubuntuRelease/s/$ubuntuRelease/24.04/;/$ubuntuCodeName/s/$ubuntuCodeName/noble/" /etc/apt/sources.list.d/microsoft-prod.list
sudo apt update
sudo apt install -V powershell
