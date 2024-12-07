#!/usr/bin/env bash

installPackageFromRepo.sh "https://download.docker.com/linux/ubuntu $(lsb_release -sc) stable" docker-ce
