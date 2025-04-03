#!/usr/bin/env bash

installPackagesFromRepo.sh "http://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_$(lsb_release -sr)/ /" podman
