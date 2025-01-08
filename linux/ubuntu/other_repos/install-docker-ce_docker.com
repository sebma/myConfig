#!/usr/bin/env bash

installPackagesFromRepo.sh "https://download.docker.com/linux/ubuntu $(lsb_release -sc) stable" docker-ce
