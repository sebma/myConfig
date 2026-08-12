#!/usr/bin/env bash

ubuntuRelease=$(lsb_release -sr)
ubuntuCodeName=$(lsb_release -sc)
if ! dpkg -s packages-microsoft-prod &>/dev/null;then
	wget https://packages.microsoft.com/config/ubuntu/$ubuntuRelease/packages-microsoft-prod.deb
	sudo apt install -V ./packages-microsoft-prod.deb
	rm -v ./packages-microsoft-prod.deb
	sudo sed -i "/$ubuntuRelease/s/$ubuntuRelease/24.04/;/$ubuntuCodeName/s/$ubuntuCodeName/noble/" /etc/apt/sources.list.d/microsoft-prod.list
	curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /usr/share/keyrings/microsoft-prod.gpg --yes
fi

if ! dpkg -s microsoft-edge-stable &>/dev/null;then
	sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" -y
	sudo apt update
	sudo apt install -V microsoft-edge-stable
fi
