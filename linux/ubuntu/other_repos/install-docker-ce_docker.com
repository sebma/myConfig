#!/usr/bin/env bash

sudo apt purge -V containerd docker-compose
installPackagesFromRepo.sh "https://download.docker.com/linux/ubuntu $(lsb_release -sc) stable" docker-ce docker-compose-plugin docker-buildx-plugin
